
  --- 个单转实收保费 ----
  procedure P_TURN_REAL_DETAIL_COMMON_SGL(I_POLICY_ID in number, --- 保单id ---
                                          I_SUSPEND_TYPE in char, --- 处理理赔暂停(Y)，非万能、非暂停产品(N) ---
                                          I_DUE_DATE in date, --- 截至日期 ---
                                          O_SCCE_FLAG out number, --- 返回值 0为正确 -1为失败(记log),-2 余额不足 -3 险种没有找到, -4 挂应收等，不用转实收 ---
                                          O_BREAK out boolean, --- 返回值 true终止循环
                                          O_ERR_MSG out varchar2 --- 错误提示信息----
                                          ) as

    M_ITEM_ID T_CONTRACT_PRODUCT.ITEM_ID%type;
    M_PRODUCT_ID T_CONTRACT_PRODUCT.PRODUCT_ID%type;
    M_SUSPEND T_CONTRACT_MASTER.SUSPEND%type; --- 是否暂停
    M_SUSPEND_CAUSE T_CONTRACT_MASTER.SUSPEND_CAUSE%type; --- 暂停原因
    M_MIN_DATE T_CONTRACT_PRODUCT.PAY_TO_DATE%type;
    M_NEW_PREM T_CONTRACT_PRODUCT.DISCOUNT_PREM%type;
    M_POLICY_TYPE T_CONTRACT_MASTER.POLICY_TYPE%type;

    M_VALIDATE_DATE T_CONTRACT_MASTER.VALIDATE_DATE%type; --- 保单生效日期
    M_PAY_TO_DATE T_CONTRACT_PRODUCT.PAY_TO_DATE%type;
    M_INI_TYPE T_CONTRACT_PRODUCT.INITIAL_TYPE%type;
    M_RENEWAL_TYPE T_CONTRACT_PRODUCT.RENEWAL_TYPE%type;
    M_MASTER_ID T_CONTRACT_PRODUCT.MASTER_ID%type;

    M_DISCOUNT_PREM_OLD T_CONTRACT_PRODUCT.DISCOUNT_PREM%type := 0;
    M_DISCOUNT_PREM_S T_CONTRACT_PRODUCT.DISCOUNT_PREM%type := 0;

    M_USE_PRESENT_TOTAL T_CONTRACT_PRODUCT.PRESENT_BALANCE%type := 0; --- 本次用到赠送保费之和 ---
    M_USE_PRESENT T_CONTRACT_PRODUCT.PRESENT_BALANCE%type := 0; --- 单个险种用到的赠送保费 ---
    M_REMAIN_PRESENT T_CONTRACT_PRODUCT.PRESENT_BALANCE%type := 0; --- 险种剩余赠送保费 ---
    M_BALANCE_PREM T_CONTRACT_MASTER.BALANCE_PREM%type; --- 保单余额 ---
    M_PAY_MODE T_CONTRACT_PRODUCT.PAY_MODE%type;
    M_CPF T_PAY_MODE.CPF%type;
    M_PERIOD_CPF T_POLICY_PREM.PERIOD_PREM%type;
    M_POLICY_PERIOD T_CONTRACT_PRODUCT.POLICY_PERIOD%type;
    M_ORGAN_ID T_CONTRACT_MASTER.ORGAN_ID%type;
    M_FEE_ID T_POLICY_FEE.FEE_ID%type; --- 保费ID ---
    M_FEE_ID2 T_POLICY_FEE.FEE_ID%type; --- 保费ID ---
    M_WHOLE_PERIOD T_CONTRACT_MASTER.WHOLE_PERIOD%type;
    M_NUM number;
    M_DISCOUNT_PREM_P T_CONTRACT_PRODUCT.PRESENT_BALANCE%type := 0;
    M_INPUT_SOURCE_PREM T_POLICY_PREM.PERIOD_PREM%type := 0;
    M_USE_PRESENT_P T_CONTRACT_PRODUCT.PRESENT_BALANCE%type := 0;
    M_43_COUNT number;
    M_HAS_43 boolean := true;
    M_ENOUGH_BALANCE boolean := true;

    M_CASH_BANK T_POLICY_FEE.CASH_BANK%type;
    M_CASH_ACCOUNT T_POLICY_FEE.CASH_ACCOUNT%type;

    M_WAIVER_START T_CONTRACT_PRODUCT.WAIVER_START%type;
    M_WAIVER_END T_CONTRACT_PRODUCT.WAIVER_END%type;

    M_CHG_TYPE_CHG_ID T_POLICY_CHANGE.CHANGE_ID%type; --保全缴别预约变更
    M_ADD_PREM number;
    M_FEE_AMOUNT number;
    M_FEE_TYPE T_POLICY_FEE.FEE_TYPE%type;
    M_APP number;
    IS_INTEGER number := 1; ---整数
    M_PRODUCT_NUM T_CONTRACT_PRODUCT.PRODUCT_NUM%type;
    M_IS_PRODUCT_60576 BOOLEAN := FALSE;---是否是和谐人生期交万能
    M_COUNT NUMBER;
    M_POLICY_YEAR NUMBER;      -- 保单年度
    M_PB_STATUS T_UNIVERSAL_PREM_BONUS.STATUS%type := 'N';  --跑持续奖标识
    M_PREM_REATE NUMBER :=1;
    v_policy_input_source t_policy.policy_input_source%type;
    O_RESULT      NUMBER;
    O_INFO       VARCHAR2(4000);
    m_is_bespoke    number := 0;
    m_loop_count    number := 0;
    m_tax_flag      boolean;
    m_sum_prem      number :=0;
    m_tax_prem      number :=0;
    m_sum_discount_prem      number :=0;
    m_result        VARCHAR2(10);
    m_is_tax           char(1):='N';
	m_befor_change_id T_POLICY_CHANGE.CHANGE_ID%type;
	m_sum_period_prem number := 0;
    cursor C_ITEM is
      select /*+ index(tcp uni_contract_product__pronum) */ TCP.ITEM_ID,
             TCP.PAY_TO_DATE,
             TCP.RENEWAL_TYPE,
             TCP.PRESENT_BALANCE,
             TCP.NEXT_DISCOUNT_PREM,
             TCP.PRODUCT_ID,
             TCP.INITIAL_TYPE,
             TCP.MASTER_ID,
             TCP.WAIVER_START,
             TCP.WAIVER_END,
             TCP.PRODUCT_NUM
        from T_CONTRACT_PRODUCT TCP
       where TCP.POLICY_ID = I_POLICY_ID
         and TCP.LIABILITY_STATE = 1 ---险种为有效
         and ((TCP.PAY_TO_DATE < I_DUE_DATE ---险种的下次交费期在输入日期之前
         and ((m_is_bespoke=0 and TCP.PAY_TO_DATE < TCP.END_DATE) ---下次交费日必须在预约终止/退保日前
         or (m_is_bespoke=1 and TCP.PAY_TO_DATE <= TCP.END_DATE))
         and TCP.PREM_STATUS = 1 ---险种缴费状态为正常

         and TCP.DECISION_ID not in (3,
                                     4) ---险种核保决定不为拒保、延期
         and TCP.PAY_NEXT not in (8,
                                  9,
                                  10) ---险种pay_mode不为8投资帐户OFFER、9投资帐户BID
         and (I_SUSPEND_TYPE = 'Y' or TCP.SUSPEND = 'N')
         and exists (select 1
                       from T_POLICY_PREM TPP
                      where TPP.POLICY_ID = I_POLICY_ID
                        and TPP.FEE_TYPE = 24
                        and TPP.FEE_STATUS not in (1,
                                                   2)
                        and TPP.DUE_TIME = TCP.PAY_TO_DATE))
          or (exists (select 1
               from t_policy p
              where p.policy_id = tcp.policy_id
                and p.policy_input_source = '5')))
       order by TCP.WAIVER_ID,
       case when m_is_tax = 'Y' then tcp.product_num end desc,
       case when m_is_tax = 'N' then tcp.product_num end asc
       for update;
    M_Prem_chgID t_policy_change.change_id%type;
    M_is_chg boolean:=false;
    m_change_count int:=0;
    m_tdp_flag     boolean :=false;
    m_deductible_amount t_tdp_policy_info.deductible_amount%type:=0;
  begin
    if pkg_life_public.f_is_tax_prf_policy(i_policy_id) then
      m_is_tax := 'Y';
    else
      m_is_tax := 'N';
    end if;
    --税延保单标识
    m_tdp_flag := pkg_life_public.F_IS_TAX_DEF_POLICY(i_policy_id);
    --是否发生过万能期交保费变更
    M_is_chg:=PKG_LIFE_PS_ALTER_UNIPREM.F_IS_HAVE_NO_PRECESS(i_policy_id);
    if M_is_chg then
      M_Prem_chgID:=PKG_LIFE_PS_ALTER_UNIPREM.F_GET_CPREMCHG_ID(i_policy_id);
    end if;

    m_is_bespoke := pkg_life_public.f_check_is_bespoke(I_POLICY_ID);
    O_BREAK := false;
    IS_INTEGER := pkg_life_ps_public.F_GET_NEWBIZ_ROUNDING(I_POLICY_ID);
     m_tax_flag := PKG_LIFE_RENEW_DRAW.F_IS_TAX_POLICY(I_POLICY_ID);
     if m_tax_flag then
       m_sum_prem := pkg_life_renew_draw.f_get_sum_prem(i_policy_id,
                                                        m_is_bespoke,
                                                        I_DUE_DATE,
                                                        1
                                                        );
     end if;

    --判断是否为鼎一
    select nvl(p.policy_input_source,'0')
      into v_policy_input_source
      from t_policy p
     where p.policy_id = I_POLICY_ID;
    --- 若保单为暂停, 则退出 ---
    select NVL(SUSPEND,
               'N'),
           SUSPEND_CAUSE,
           NEXT_DISCOUNT_PREM,
           POLICY_TYPE,
           ORGAN_ID,
           WHOLE_PERIOD
      into M_SUSPEND,
           M_SUSPEND_CAUSE,
           M_DISCOUNT_PREM_OLD,
           M_POLICY_TYPE,
           M_ORGAN_ID,
           M_WHOLE_PERIOD
      from T_CONTRACT_MASTER
     where POLICY_ID = I_POLICY_ID
       for update;

    if I_SUSPEND_TYPE = 'Y' then
      if not (M_SUSPEND = 'Y' and M_SUSPEND_CAUSE = 1) then
        --只处理理赔暂停
        O_BREAK := true;
        O_SCCE_FLAG := -4;
        return;
      end if;
    end if;

    --- 判断是否期交万能产品---
    if F_GET_UNIVERSAL(I_POLICY_ID) = 0 then
      O_BREAK := true;
      O_SCCE_FLAG := -4;
      return;
    end if;
   --- 判断是否是和谐人生期交万能
   SELECT COUNT(*)
     INTO M_COUNT
     FROM T_CONTRACT_PRODUCT CP
    WHERE CP.POLICY_ID = I_POLICY_ID
      AND CP.MASTER_ID IS NULL
      AND CP.PRODUCT_ID in (60576,64303,65325) AND ROWNUM =1;
   if M_COUNT>0 then
     M_IS_PRODUCT_60576 := true;
   end if;
    ------ 取最小 pay_to_date -----
    select /*+ index(tcp uni_contract_product__pronum) */
     NVL(min(TCP.PAY_NEXT), 0),
     min(TCP.PAY_TO_DATE),
     max(TCP.POLICY_PERIOD) + 1
      into M_PAY_MODE, M_MIN_DATE, M_POLICY_PERIOD
      from T_CONTRACT_PRODUCT TCP
     where TCP.POLICY_ID = I_POLICY_ID
       and TCP.LIABILITY_STATE = 1 ---险种为有效
       and ((TCP.PAY_TO_DATE < I_DUE_DATE ---险种的下次交费期在当前系统日期之前
         and ((m_is_bespoke=0 and TCP.PAY_TO_DATE < TCP.END_DATE) ---下次交费日必须在预约终止/退保日前
         or (m_is_bespoke=1 and TCP.PAY_TO_DATE <= TCP.END_DATE))
           and TCP.PREM_STATUS = 1 ---险种缴费状态为正常

           and TCP.DECISION_ID not in (3, 4) ---险种核保决定不为拒保、延期
           and TCP.PAY_NEXT not in (8, 9, 10) ---险种pay_mode不为8投资帐户OFFER、9投资帐户BID
           and (I_SUSPEND_TYPE = 'Y' or TCP.SUSPEND = 'N'))
        or (TCP.Liability_State = 1 and exists     --针对欠费续保处理
            (select 1
               from t_policy p
              where p.policy_id = tcp.policy_id
                and p.policy_input_source = '5')));
    if v_policy_input_source = '5' then
      select nvl(p.period_prem,0)
               into M_INPUT_SOURCE_PREM
               from t_policy_prem p
              where p.policy_id = I_POLICY_ID
                and p.policy_period = M_POLICY_PERIOD
                and p.FEE_TYPE = 24
                and p.fee_status = 0;
    end if;
    --- 记log信息，保存保单旧的数据 ---
    if G_CHANGE_ID is null then
      PKG_LIFE_RENEW_PUB.P_GET_BATCH_CHANGE_ID(I_POLICY_ID,
                                               3, -- service_id续期实收批处理
                                               0,
                                               sysdate,
                                               null,
                                               G_OPT_ID,
                                               G_CHANGE_ID_IN);
    else
      G_CHANGE_ID_IN := G_CHANGE_ID;
    end if;
     pkg_life_ps_public_log.P_DUMP_ONE_TABLE_TO_LOG(G_CHANGE_ID_IN  ,       /*保全ID*/
       I_POLICY_ID   ,       /*保单ID*/
       ' POLICY_ID = '||I_POLICY_ID   ,     /*指定的查询条件*/
      '4',         /*新旧数据标志*/
      'T_CONTRACT_MASTER',  /*相关表信息*/
      'T_CONTRACT_LOG'
      );
    -- 红利转保单余额
    P_BONUS_2_BALANCE(I_POLICY_ID,
                      M_MIN_DATE,
                      G_CHANGE_ID_IN);
     pkg_life_ps_public_log.P_DUMP_ONE_TABLE_TO_LOG(G_CHANGE_ID_IN  ,       /*保全ID*/
       I_POLICY_ID   ,       /*保单ID*/
       ' POLICY_ID = '||I_POLICY_ID   ,     /*指定的查询条件*/
      '5',         /*新旧数据标志*/
      'T_CONTRACT_MASTER',  /*相关表信息*/
      'T_CONTRACT_LOG'
      );

    select BALANCE_PREM, VALIDATE_DATE
      into M_BALANCE_PREM, M_VALIDATE_DATE
      from T_CONTRACT_MASTER
     where POLICY_ID = I_POLICY_ID;

    --- 判断付款方式是否为CPF
    select T.CPF
      into M_CPF
      from T_PAY_MODE T
     where T.MODE_ID = M_PAY_MODE;
    if M_CPF = 'Y' then
      --- 对付费方式为CPF的，判断其是否都已到帐 ---
      select count(*)
        into M_NUM
        from T_POLICY_PREM T
       where T.POLICY_ID = I_POLICY_ID
         and T.DUE_TIME = M_MIN_DATE
         and T.FEE_TYPE = 24
         and T.FEE_STATUS not in (1,
                                  2,
                                  4,
                                  6) --- 已到帐 ---
                                    ;
      --- CPF方式的应缴数据必须全部（可能有多笔）已经到帐，否则不作转实收处理
      if M_NUM > 0 then
        O_BREAK := true;
        O_SCCE_FLAG := -2;
        return;
      end if;
    end if;

    --取小额月、日计算比例
    M_PREM_REATE := PKG_LIFE_RENEW_DRAW_FEE.f_get_prem_rate(I_POLICY_ID);
    if M_PREM_REATE < 1 then
      PKG_LIFE_PS_PUBLIC_LOG.P_DUMP_ONE_TABLE_TO_LOG(G_CHANGE_ID_IN,
                                                     I_POLICY_ID,
                                                     NULL,
                                                     1, -- old data
                                                     'T_CONTRACT_MASTER',
                                                     'T_CONTRACT_LOG');
    end if;

    open C_ITEM;
    fetch C_ITEM into M_ITEM_ID,
                      M_PAY_TO_DATE,
                      M_RENEWAL_TYPE,
                      M_REMAIN_PRESENT,
                      M_NEW_PREM,
                      M_PRODUCT_ID,
                      M_INI_TYPE,
                      M_MASTER_ID,
                      M_WAIVER_START,
                      M_WAIVER_END,
                      M_PRODUCT_NUM;
    ------ 没有符合条件的险种 则直接退出 ------
    if C_ITEM%notfound then
      O_BREAK := true;
      O_SCCE_FLAG := -3;
      close C_ITEM;
      return;
    end if;
    if M_is_chg=true and M_Prem_chgID is not null then
      select count(*)
        into  m_change_count
        from T_CONTRACT_PRODUCT_LOG TCP
       where TCP.POLICY_ID = I_POLICY_ID
         and tcp.change_id=M_Prem_chgID
         and tcp.old_new='2'
         and tcp.item_id=M_ITEM_ID;
      if m_change_count>0 then
      select TCP.NEXT_DISCOUNT_PREM
        into M_NEW_PREM
        from T_CONTRACT_PRODUCT_LOG TCP
       where TCP.POLICY_ID = I_POLICY_ID
         and tcp.change_id=M_Prem_chgID
         and tcp.old_new='2'
         and tcp.item_id=M_ITEM_ID;
      end if;
    end if;
    ------ 对所有本期险种保费进行重算 并得出下期应缴金额 M_DISCOUNT_PREM_S-----
    loop
      if M_PAY_TO_DATE = M_MIN_DATE then
        --- 记log信息，保存险种旧的数据 ---
        if M_PREM_REATE < 1 then
          PKG_LIFE_PS_PUBLIC_LOG.P_DUMP_ONE_TABLE_TO_LOG(G_CHANGE_ID_IN,
                                                   I_POLICY_ID,
                                                   ' ITEM_ID = ' || M_ITEM_ID,
                                                   1, -- old data
                                                   'T_CONTRACT_PRODUCT',
                                                   'T_CONTRACT_PRODUCT_LOG');
        end if;
        if not m_tdp_flag then
        --- 险种保费计算 ---
        P_CALC_PRODUCT(M_ITEM_ID,
                       I_POLICY_ID,
                       M_PAY_TO_DATE,
                       M_PRODUCT_ID,
                       M_POLICY_TYPE,
                       M_NEW_PREM,
                       M_WHOLE_PERIOD,
                       M_NEW_PREM,
                       IS_INTEGER,
                       O_SCCE_FLAG);
         end if;
       if m_tax_flag then
         pkg_life_renew_draw.p_calc_prem_for_tax(m_sum_prem,
                                                 i_policy_id,
                                                 m_item_id,
                                                 I_DUE_DATE,
                                                 m_is_bespoke,
                                                 m_whole_period,
                                                 M_NEW_PREM
                                                 );
        end if;
    if M_is_chg=true and M_Prem_chgID is not null then
      select count(*)
        into  m_change_count
        from T_CONTRACT_PRODUCT_LOG TCP
       where TCP.POLICY_ID = I_POLICY_ID
         and tcp.change_id=M_Prem_chgID
         and tcp.old_new='2'
         and tcp.item_id=M_ITEM_ID;
      if m_change_count>0 then
      select TCP.NEXT_DISCOUNT_PREM
        into M_NEW_PREM
        from T_CONTRACT_PRODUCT_LOG TCP
       where TCP.POLICY_ID = I_POLICY_ID
         and tcp.change_id=M_Prem_chgID
         and tcp.old_new='2'
         and tcp.item_id=M_ITEM_ID;
      end if;
    end if;
        --- 累加险种保费 ---
        if not F_WAIVER_PERIOD(M_WAIVER_START,
                               M_WAIVER_END,
                               M_PAY_TO_DATE) then
          M_NEW_PREM := M_NEW_PREM * M_PREM_REATE;
          if M_PRODUCT_ID not in (64803, 64804, 64805, 64806) then
             M_DISCOUNT_PREM_S := M_DISCOUNT_PREM_S + M_NEW_PREM;
          end if;
        end if;
      end if;

      fetch C_ITEM into M_ITEM_ID,
                      M_PAY_TO_DATE,
                      M_RENEWAL_TYPE,
                      M_REMAIN_PRESENT,
                      M_NEW_PREM,
                      M_PRODUCT_ID,
                      M_INI_TYPE,
                      M_MASTER_ID,
                      M_WAIVER_START,
                      M_WAIVER_END,
                      M_PRODUCT_NUM;
      exit when C_ITEM%notfound;
    end loop;
    close C_ITEM;

    if m_tax_flag then
         open C_ITEM;
          loop
          fetch C_ITEM into M_ITEM_ID,
                            M_PAY_TO_DATE,
                            M_RENEWAL_TYPE,
                            M_REMAIN_PRESENT,
                            M_NEW_PREM,
                            M_PRODUCT_ID,
                            M_INI_TYPE,
                            M_MASTER_ID,
                            M_WAIVER_START,
                            M_WAIVER_END,
                            M_PRODUCT_NUM;
            exit when C_ITEM%notfound;

            if not F_WAIVER_PERIOD(M_WAIVER_START,
                               M_WAIVER_END,
                               M_PAY_TO_DATE) then
                if M_PRODUCT_ID in (64803, 64804, 64805, 64806) then
                  select t.next_discount_prem
                    into m_tax_prem
                    from t_contract_product t
                   where item_id = m_item_id;
                   M_DISCOUNT_PREM_S := M_DISCOUNT_PREM_S + m_tax_prem;

                end if;
            end if;
          end loop;
          close C_ITEM;
     end if;
     --税延保单获取应缴保费
     if m_tdp_flag then
        m_deductible_amount :=pkg_life_renew_draw.f_get_tdp_policy_prem(i_policy_id,M_MIN_DATE);
        M_DISCOUNT_PREM_S :=m_deductible_amount;
     end if;

    ------ 若下期保费发生变化,则修改保单的下期保费 -----
    if ROUND(M_DISCOUNT_PREM_OLD * M_PREM_REATE, 2) <> M_DISCOUNT_PREM_S and M_DISCOUNT_PREM_S > 0 then
      --- 合计下期保费 ---
      P_GATHER_NEXT_POLICY_ONLY(I_POLICY_ID,
                                LAST_DAY(M_MIN_DATE) + 1,
                                'N',
                                0);
    else
      if M_DISCOUNT_PREM_S < 0 then
        ---- 本期无需转实收保费 ---
        O_SCCE_FLAG := -1;
        O_BREAK := true;
        O_ERR_MSG := '本期期缴为0，无需转实收保费！';
        return;
      end if;
    end if;
    -----保费计算结束--------

    -----生成43费用----------
    open C_ITEM;
    loop
    fetch C_ITEM into M_ITEM_ID,
                      M_PAY_TO_DATE,
                      M_RENEWAL_TYPE,
                      M_REMAIN_PRESENT,
                      M_NEW_PREM,
                      M_PRODUCT_ID,
                      M_INI_TYPE,
                      M_MASTER_ID,
                      M_WAIVER_START,
                      M_WAIVER_END,
                      M_PRODUCT_NUM;
      exit when C_ITEM%notfound;
   if M_is_chg=true and M_Prem_chgID is not null then
      select count(*)
        into  m_change_count
        from T_CONTRACT_PRODUCT_LOG TCP
       where TCP.POLICY_ID = I_POLICY_ID
         and tcp.change_id=M_Prem_chgID
         and tcp.old_new='2'
         and tcp.item_id=M_ITEM_ID;
      if m_change_count>0 then
      select TCP.NEXT_DISCOUNT_PREM
        into M_NEW_PREM
        from T_CONTRACT_PRODUCT_LOG TCP
       where TCP.POLICY_ID = I_POLICY_ID
         and tcp.change_id=M_Prem_chgID
         and tcp.old_new='2'
         and tcp.item_id=M_ITEM_ID;
      end if;
    end if;
      if M_PAY_TO_DATE = M_MIN_DATE then

/*————————————————————————————————————————————————————————————————
  优化002  应收应付记帐状态类型不一致,修改判断规则，只要存在就可以了
————————————————————————————————————————————————————————————————*/
           /*————优化002++ ————*/
           select /*+index(TF IDX_PRODUCT_FEE__POLI_NUM_INS)*/count(1)
             into M_43_COUNT
            from T_POLICY_FEE PF,
                 T_PRODUCT_FEE TF
           where PF.FEE_ID = TF.FEE_ID
             and PF.FEE_TYPE = 43
             and TF.DUE_TIME = M_MIN_DATE
             and PF.RELATED_ID is null
             and TF.PRODUCT_ID = M_PRODUCT_ID
             and TF.POLICY_ID = I_POLICY_ID
             and pf.policy_id = I_POLICY_ID
             and PF.RECEIV_STATUS != '2'
             and rownum<2;


        if (M_43_COUNT = 0 and M_NEW_PREM > 0) or v_policy_input_source = '5' then
          --是否所有险种都生成43的费用
          M_HAS_43 := false;
        end if;

        M_NEW_PREM := M_NEW_PREM * M_PREM_REATE;
        M_REMAIN_PRESENT := M_REMAIN_PRESENT * M_PREM_REATE;
        --得到赠送保费总额
        if F_WAIVER_PERIOD(M_WAIVER_START,
                           M_WAIVER_END,
                           M_PAY_TO_DATE) then
          M_USE_PRESENT := 0;
        else
          if M_REMAIN_PRESENT > M_NEW_PREM then
            M_USE_PRESENT := M_NEW_PREM;
          else
            M_USE_PRESENT := M_REMAIN_PRESENT;
          end if;
        end if;

        M_USE_PRESENT_TOTAL := M_USE_PRESENT_TOTAL + M_USE_PRESENT;
      end if;
    end loop;
    close C_ITEM;

    --保单余额是否够
    if M_BALANCE_PREM >= (M_DISCOUNT_PREM_S - M_USE_PRESENT_TOTAL)  and
       M_DISCOUNT_PREM_S >= 0 then
      M_ENOUGH_BALANCE := true;
    else
      M_ENOUGH_BALANCE := false;
    end if;

    --- 取保单的ID ---
    ----没有43费用则生成43的费用-------
    P_CASH_INFO(I_POLICY_ID,
                M_CASH_BANK,
                M_CASH_ACCOUNT);

    if not M_HAS_43  then
       if (NOT M_IS_PRODUCT_60576) or (M_IS_PRODUCT_60576 and M_ENOUGH_BALANCE) then
      select S_POLICY_FEE__FEE_ID.nextval
        into M_FEE_ID
        from DUAL;
      --- 插入保单的实收保费, 费用的业务类型为43续期实收保费 ---
      --- 为了统计实际用到的赠送保费，将插入保单的实收保费放在插入险种的实收保费后 ---
      P_POLICY_FEE(I_POLICY_ID,
                   43,
                   M_FEE_ID,
                   M_POLICY_PERIOD,
                   0,
                   0,
                   null,
                   null,
                   M_CASH_BANK,
                   M_CASH_ACCOUNT,
                   1);

      open C_ITEM;
      fetch C_ITEM into M_ITEM_ID,
                        M_PAY_TO_DATE,
                        M_RENEWAL_TYPE,
                        M_REMAIN_PRESENT,
                        M_NEW_PREM,
                        M_PRODUCT_ID,
                        M_INI_TYPE,
                        M_MASTER_ID,
                        M_WAIVER_START,
                        M_WAIVER_END,
                        M_PRODUCT_NUM;
      loop
    if M_is_chg=true and M_Prem_chgID is not null then
      select count(*)
        into  m_change_count
        from T_CONTRACT_PRODUCT_LOG TCP
       where TCP.POLICY_ID = I_POLICY_ID
         and tcp.change_id=M_Prem_chgID
         and tcp.old_new='2'
         and tcp.item_id=M_ITEM_ID;
      if m_change_count>0 then
      select TCP.NEXT_DISCOUNT_PREM
        into M_NEW_PREM
        from T_CONTRACT_PRODUCT_LOG TCP
       where TCP.POLICY_ID = I_POLICY_ID
         and tcp.change_id=M_Prem_chgID
         and tcp.old_new='2'
         and tcp.item_id=M_ITEM_ID;
      end if;
    end if;

    --税延险种续期保费采取抽档时产生的保费
    if m_tdp_flag then
      select count(1)
        into M_COUNT
        from t_policy_prem pop, t_product_prem prp
       where pop.policy_id = I_POLICY_ID
         and pop.prem_id = prp.prem_id
         and prp.product_id = M_PRODUCT_ID
         and pop.prem_id = (
              select max(prem_id)
                from t_policy_prem t
               where t.policy_id = I_POLICY_ID
                 and t.fee_type = 24
                 and t.fee_status not in(1,2));
      if M_COUNT = 0 then
        M_NEW_PREM := 0 ;
      else
      select prp.period_prem
        into M_NEW_PREM
        from t_policy_prem pop, t_product_prem prp
       where pop.policy_id = I_POLICY_ID
         and pop.prem_id = prp.prem_id
         and prp.product_id = M_PRODUCT_ID
         and pop.prem_id = (
              select max(prem_id)
                from t_policy_prem t
               where t.policy_id = I_POLICY_ID
                 and t.fee_type = 24
                 and t.fee_status not in(1,2));
       end if;
    end if;
/*————————————————————————————————————————————————————————————————
  优化2009-09-01  应收应付记帐状态类型不一致,修改判断规则，只要存在就可以了,查处一行即可
————————————————————————————————————————————————————————————————*/
        SELECT /*+index(TF IDX_PRODUCT_FEE__POLI_NUM_INS)*/COUNT(1)
          INTO M_43_COUNT
          FROM T_POLICY_FEE PF, T_PRODUCT_FEE TF
         WHERE PF.FEE_ID = TF.FEE_ID
           AND PF.FEE_TYPE = 43
           AND TF.DUE_TIME = M_MIN_DATE
           AND PF.RELATED_ID IS NULL
           AND TF.PRODUCT_ID = M_PRODUCT_ID
           AND PF.POLICY_ID = I_POLICY_ID
           AND tF.POLICY_ID = I_POLICY_ID
           AND PF.RECEIV_STATUS != 2
           AND TF.PRODUCT_NUM = M_PRODUCT_NUM
           and rownum<2
           ;

        M_NEW_PREM := M_NEW_PREM * M_PREM_REATE;
        M_REMAIN_PRESENT := M_REMAIN_PRESENT * M_PREM_REATE;
        if M_PAY_TO_DATE = M_MIN_DATE and M_43_COUNT = 0 or v_policy_input_source = '5'  then
          --- 计算本次险种用到赠送保费，保单用到赠送保费及剩余赠送保费 ---
          if F_WAIVER_PERIOD(M_WAIVER_START,
                             M_WAIVER_END,
                             M_PAY_TO_DATE) then
            M_USE_PRESENT := 0;
          else
            M_DISCOUNT_PREM_P := M_DISCOUNT_PREM_P + M_NEW_PREM;
            if M_REMAIN_PRESENT > M_NEW_PREM then
              M_USE_PRESENT := M_NEW_PREM;
            else
              M_USE_PRESENT := M_REMAIN_PRESENT;
            end if;
          end if;

          M_USE_PRESENT_P := M_USE_PRESENT_P + M_USE_PRESENT;

          ------ 在T_POLICY_FEE表和T_PRODUCT_FEE表中生成续期实收记录(包括基金分配) -----
          if I_SUSPEND_TYPE = 'N' then
            if v_policy_input_source = '5' then
               P_INSERT_REAL_FEE(M_ITEM_ID,
                              M_FEE_ID,
                              null,
                              M_INPUT_SOURCE_PREM,
                              0,
                              null);
             else
               if M_NEW_PREM > 0 then
               P_INSERT_REAL_FEE(M_ITEM_ID,
                              M_FEE_ID,
                              null,
                              M_NEW_PREM,
                              M_USE_PRESENT,
                              null);
               end if;
             end if;
          else
            --理赔暂停时缴费类型为内部转账
            if M_NEW_PREM > 0 then
            P_INSERT_REAL_FEE(M_ITEM_ID,
                              M_FEE_ID,
                              null,
                              M_NEW_PREM,
                              M_USE_PRESENT,
                              5);
            end if;
          end if;

          ---豁免保费产品在续期转实收时的特殊处理---
          if M_POLICY_TYPE <> '2' and M_INI_TYPE <> M_RENEWAL_TYPE then
            P_EXEMPT_AMOUNT_CHANGE(M_ITEM_ID,
                                   M_PRODUCT_ID,
                                   M_MASTER_ID,
                                   M_INI_TYPE,
                                   M_RENEWAL_TYPE,
                                   M_POLICY_TYPE);
          end if;

        end if;
        fetch C_ITEM into M_ITEM_ID,
                          M_PAY_TO_DATE,
                          M_RENEWAL_TYPE,
                          M_REMAIN_PRESENT,
                          M_NEW_PREM,
                          M_PRODUCT_ID,
                          M_INI_TYPE,
                          M_MASTER_ID,
                          M_WAIVER_START,
                          M_WAIVER_END,
                          M_PRODUCT_NUM;
        exit when C_ITEM%notfound;
      end loop;
      close C_ITEM;

        if v_policy_input_source = '5' then
         update T_POLICY_FEE T
            set T.FEE_AMOUNT   = M_INPUT_SOURCE_PREM,
                T.EMPLOYEE_FEE = M_INPUT_SOURCE_PREM,
                T.PAY_BALANCE  = M_INPUT_SOURCE_PREM,
                T.PAY_MODE     = 15
          where T.FEE_ID = M_FEE_ID;
        else
         update T_POLICY_FEE T
            set T.FEE_AMOUNT   = M_DISCOUNT_PREM_P - M_USE_PRESENT_P,
                T.EMPLOYEE_FEE = M_DISCOUNT_PREM_P - M_USE_PRESENT_P,
                T.PAY_BALANCE  = M_DISCOUNT_PREM_P - M_USE_PRESENT_P,
                T.POLICY_YEAR  = (select max(POLICY_YEAR)
                                    from T_PRODUCT_FEE
                                   where FEE_ID = M_FEE_ID)
          where T.FEE_ID = M_FEE_ID;
        end if;

       end if;
       --税延对F43保费进行特殊处理
       if m_tdp_flag then
         P_TDP_DISPOSAL_RELA_FEE(M_FEE_ID,I_POLICY_ID,G_CHANGE_ID_IN);
       end if;
    end if;

    -------43生成完毕-------
    ------- 若保单余额>= 期缴保费-赠送保费 ,才进行续期预收转实收 ------
    if M_ENOUGH_BALANCE or v_policy_input_source = '5' then

      -----转实收后43的rece_status=0,pay_balance=0 并生成佣金
      P_UPDATE_POLICY_FEE(I_POLICY_ID,
                          43,
                          M_MIN_DATE);

      -----生成23的费用---------
      select S_POLICY_FEE__FEE_ID.nextval
        into M_FEE_ID2
        from DUAL;
      if v_policy_input_source = '5' then
          P_POLICY_FEE(I_POLICY_ID,
                   23,
                   M_FEE_ID2,
                   M_POLICY_PERIOD,
                   M_INPUT_SOURCE_PREM,

                   0,
                   null,
                   null,
                   M_CASH_BANK,
                   M_CASH_ACCOUNT,
                   0);

      else
          P_POLICY_FEE(I_POLICY_ID,
                   23,
                   M_FEE_ID2,
                   M_POLICY_PERIOD,
                   M_DISCOUNT_PREM_P - M_USE_PRESENT_P,

                   0,
                   null,
                   null,
                   M_CASH_BANK,
                   M_CASH_ACCOUNT,
                   0);

      end if;

      --和谐人生持续奖励
      if M_IS_PRODUCT_60576 then
         M_POLICY_YEAR := PKG_LIFE_PUBLIC.F_POLICY_YEAR(M_MIN_DATE, M_VALIDATE_DATE);

         --在宽限日期内,置跑持续奖标识为'Y'
         if M_MIN_DATE + 68 >= I_DUE_DATE then
            M_PB_STATUS := 'Y';
         end if;

         select count(1) into M_COUNT from t_universal_prem_bonus upb
           where upb.policy_id = I_POLICY_ID
             and upb.policy_year = M_POLICY_YEAR;

         --若未处理过在产生新的记录，否则修改原有的记录
         if M_COUNT = 0 then
            insert into t_universal_prem_bonus(
               LIST_ID,
               POLICY_ID,
               POLICY_YEAR,
               DUE_TIME,
               ACTUAL_DATE,
               FEE_ID,
               STATUS,
               REALLOCATED,
               INSERT_ID,
               INSERT_TIME,
               UPDATE_ID,
               UPDATE_TIME)
            values(
               S_UNIVERSAL_PREM_BONUS__LIST_I.Nextval,
               I_POLICY_ID,
               M_POLICY_YEAR,--保单年度
               M_MIN_DATE,
               sysdate,
               M_FEE_ID2, --23费用的fee_id
               M_PB_STATUS, ---和谐保单持续奖励计算标识
               'N',
               '0',
               sysdate,
               null,
               null);
         else
            update t_universal_prem_bonus upb
              set upb.fee_id = M_FEE_ID2
                , upb.status = M_PB_STATUS
                , upb.actual_date = sysdate
                , upb.update_id = 0
                , upb.update_time = sysdate
            where upb.policy_id = I_POLICY_ID
              and upb.policy_year = M_POLICY_YEAR;
         end if;
      end if;

      open C_ITEM;
      loop
      fetch C_ITEM into M_ITEM_ID,
                        M_PAY_TO_DATE,
                        M_RENEWAL_TYPE,
                        M_REMAIN_PRESENT,
                        M_NEW_PREM,
                        M_PRODUCT_ID,
                        M_INI_TYPE,
                        M_MASTER_ID,
                        M_WAIVER_START,
                        M_WAIVER_END,
                        M_PRODUCT_NUM;
        exit when C_ITEM%notfound;
   if M_is_chg=true and M_Prem_chgID is not null then
      select count(*)
        into  m_change_count
        from T_CONTRACT_PRODUCT_LOG TCP
       where TCP.POLICY_ID = I_POLICY_ID
         and tcp.change_id=M_Prem_chgID
         and tcp.old_new='2'
         and tcp.item_id=M_ITEM_ID;
      if m_change_count>0 then
      select TCP.NEXT_DISCOUNT_PREM
        into M_NEW_PREM
        from T_CONTRACT_PRODUCT_LOG TCP
       where TCP.POLICY_ID = I_POLICY_ID
         and tcp.change_id=M_Prem_chgID
         and tcp.old_new='2'
         and tcp.item_id=M_ITEM_ID;
      end if;
    end if;

    --税延险种续期保费采取抽档时产生的保费
    if m_tdp_flag then
      select count(1)
        into M_COUNT
        from t_policy_prem pop, t_product_prem prp
       where pop.policy_id = I_POLICY_ID
         and pop.prem_id = prp.prem_id
         and prp.product_id = M_PRODUCT_ID
         and pop.prem_id = (
              select max(prem_id)
                from t_policy_prem t
               where t.policy_id = I_POLICY_ID
                 and t.fee_type = 24
                 and t.fee_status not in(1,2));
      if M_COUNT = 0 then
        M_NEW_PREM := 0 ;
      else
      select prp.period_prem
        into M_NEW_PREM
        from t_policy_prem pop, t_product_prem prp
       where pop.policy_id = I_POLICY_ID
         and pop.prem_id = prp.prem_id
         and prp.product_id = M_PRODUCT_ID
         and pop.prem_id = (
              select max(prem_id)
                from t_policy_prem t
               where t.policy_id = I_POLICY_ID
                 and t.fee_type = 24
                 and t.fee_status not in(1,2));
       end if;
    end if;

        M_NEW_PREM := M_NEW_PREM * M_PREM_REATE;
        M_REMAIN_PRESENT := M_REMAIN_PRESENT * M_PREM_REATE;

        if M_PAY_TO_DATE = M_MIN_DATE then
          --- 计算本次险种用到赠送保费，保单用到赠送保费及剩余赠送保费 ---
          if F_WAIVER_PERIOD(M_WAIVER_START,
                             M_WAIVER_END,
                             M_PAY_TO_DATE) then
            M_USE_PRESENT := 0;
          else
            if M_REMAIN_PRESENT > M_NEW_PREM then
              M_USE_PRESENT := M_NEW_PREM;
            else
              M_USE_PRESENT := M_REMAIN_PRESENT;
            end if;
          end if;
          if v_policy_input_source = '5' then
                P_INSERT_23_FEE(M_ITEM_ID,
                          M_FEE_ID2,
                          null,
                          M_INPUT_SOURCE_PREM,
                          0,
                          null,
                          G_CHANGE_ID_IN);
             elsif m_tdp_flag then
               if M_NEW_PREM > 0 then
               P_INSERT_23_FEE(M_ITEM_ID,
                          M_FEE_ID2,
                          null,
                          M_NEW_PREM,
                          M_USE_PRESENT,
                          null,
                          G_CHANGE_ID_IN);
                end if;
             else
                P_INSERT_23_FEE(M_ITEM_ID,
                          M_FEE_ID2,
                          null,
                          null,
                          M_USE_PRESENT,
                          null,
                          G_CHANGE_ID_IN);
             end if;


          ------ 对每个险种生成续期的实收保费的相应处理 ------
          if M_ENOUGH_BALANCE and v_policy_input_source <> '5' then
            P_ADJUST_PRODUCT(I_POLICY_ID,
                             M_ITEM_ID,
                             M_MIN_DATE,
                             M_USE_PRESENT,
                             O_SCCE_FLAG);
          end if;
          --对险种信息处理后更新鼎一险种信息
          if  v_policy_input_source = '5' then
            update t_contract_product cp
               set cp.coverage_year = cp.coverage_year + (cp.coverage_year / cp.policy_period),
                   cp.end_date      = PKG_LIFE_PUBLIC.F_GET_COVERAGE_DATE(cp.COVERAGE_PERIOD,
                                                                          cp.coverage_year + (cp.coverage_year / cp.policy_period),
                                                                          cp.VALIDATE_DATE,
                                                                          cp.age_1),
                   cp.policy_period = cp.policy_period + 1,
                   cp.policy_year   = PKG_LIFE_PS_PAY_AUTH.F_GET_POLICY_YEAR(cp.validate_date,
                                                                             PKG_LIFE_PUBLIC.F_GET_COVERAGE_DATE(cp.COVERAGE_PERIOD,
                                                                                                                 cp.coverage_year + (cp.coverage_year / cp.policy_period),
                                                                                                                 cp.VALIDATE_DATE,
                                                                                                                 cp.age_1)
                                                                                                                 +1)
             where cp.item_id = M_ITEM_ID;
           end if;

          if M_PREM_REATE < 1 then
            PKG_LIFE_PS_PUBLIC_LOG.P_DUMP_ONE_TABLE_TO_LOG(G_CHANGE_ID_IN,
                                                           I_POLICY_ID,
                                                           ' ITEM_ID = ' || M_ITEM_ID,
                                                           2, -- old data
                                                           'T_CONTRACT_PRODUCT',
                                                           'T_CONTRACT_PRODUCT_LOG');
          end if;
          m_loop_count := m_loop_count + 1;
        end if;
      end loop;
      close C_ITEM;
      --add for 黑龙江省分公司出现重复批扣客户保费资金的问题,pay_to_date=主附险最小的pay_to_date时会对数据进行处理,否则进入死循环
      if m_loop_count = 0 then
        O_BREAK := true;
        O_SCCE_FLAG := -3;
        return;
      end if;
      --税延进行账户费用处理
      if m_tdp_flag then
        P_TDP_DISPOSAL_ACCOUNT_FEE(I_POLICY_ID,G_CHANGE_ID_IN,M_MIN_DATE);
      end if;
      -- 当全部保费生成后，维护fee_amount, policy_year
      if M_DISCOUNT_PREM_S - M_USE_PRESENT_TOTAL > 0 then
        select sum(PERIOD_PREM)
          into M_APP
          from T_PRODUCT_FEE
         where FEE_ID = M_FEE_ID2;

        update T_POLICY_FEE T
           set T.FEE_AMOUNT = M_DISCOUNT_PREM_S - M_USE_PRESENT_TOTAL,
               T.EMPLOYEE_FEE = M_DISCOUNT_PREM_S - M_USE_PRESENT_TOTAL,
               T.POLICY_YEAR = (select max(POLICY_YEAR)
                                  from T_PRODUCT_FEE
                                 where FEE_ID = M_FEE_ID2)
         where T.FEE_ID = M_FEE_ID2;
      end if;

      if M_CPF = 'Y' then
        M_DISCOUNT_PREM_S := M_PERIOD_CPF;
      end if;

      ------ 修改保单余额,用下期保费覆盖当期保费 -------
      if  v_policy_input_source = '5' then
          update T_POLICY_FEE T
           set t.fee_status = 0
         where T.FEE_ID = M_FEE_ID2
           and T.Fee_Type = 23;
          M_BALANCE_PREM := M_BALANCE_PREM - M_INPUT_SOURCE_PREM;
          --------- 修改保单交费次数加 1 ----
           update T_CONTRACT_MASTER
             set POLICY_PERIOD = (select max(POLICY_PERIOD)
                                    from T_CONTRACT_PRODUCT T
                                   where T.POLICY_ID = I_POLICY_ID),
                 POLICY_YEAR = (select max(POLICY_YEAR)
                                  from T_CONTRACT_PRODUCT T
                                 where T.POLICY_ID = I_POLICY_ID),
                 BALANCE_PREM = M_BALANCE_PREM,
                 END_DATE = (select max(END_DATE)
                               from T_CONTRACT_PRODUCT T
                              where T.POLICY_ID = I_POLICY_ID)
           where POLICY_ID = I_POLICY_ID;
       else
          M_BALANCE_PREM := M_BALANCE_PREM + M_USE_PRESENT_TOTAL -
                        M_DISCOUNT_PREM_S;
           --------- 修改保单交费次数加 1 ----
          update T_CONTRACT_MASTER
             set POLICY_PERIOD = (select max(POLICY_PERIOD)
                                    from T_CONTRACT_PRODUCT T
                                   where T.POLICY_ID = I_POLICY_ID),
                 POLICY_YEAR = (select max(POLICY_YEAR)
                                  from T_CONTRACT_PRODUCT T
                                 where T.POLICY_ID = I_POLICY_ID),
                 BALANCE_PREM = M_BALANCE_PREM,
                 PAY_MODE = PAY_NEXT,
                 DISCOUNT_PREM = NEXT_DISCOUNT_PREM,
                 PERIOD_PREM = NEXT_PERIOD_PREM,
                 NORMAL_PREM = NEXT_NORMAL_PREM,
                 WEAK_PREM = NEXT_WEAK_PREM,
                 JOB_PREM = NEXT_JOB_PREM,
                 DISABLE_PREM = NEXT_DISABLE_PREM,
                 TAX_PREM = NEXT_TAX_PREM,
                 POLICY_PREM = NEXT_POLICY_PREM,
                 COMPANY_PREM = NEXT_COMPANY_PREM,
                 EMPLOYEE_PREM = NEXT_EMPLOYEE_PREM,
                 END_DATE = DECODE(v_policy_input_source,'5',add_months(end_date,1),END_DATE)
           where POLICY_ID = I_POLICY_ID;
     pkg_life_ps_public_log.P_DUMP_ONE_TABLE_TO_LOG(G_CHANGE_ID_IN  ,       /*保全ID*/
       I_POLICY_ID   ,       /*保单ID*/
       ' POLICY_ID = '||I_POLICY_ID   ,     /*指定的查询条件*/
      '6',         /*新旧数据标志*/
      'T_CONTRACT_MASTER',  /*相关表信息*/
      'T_CONTRACT_LOG'
      );
               -------- 调整保单的交费状态 (保单所有险种均不为正常缴费, 则保单为缴清)-------
          select /*+ index(t_contract_product uni_contract_product__pronum) */ count(*)
            into M_NUM
            from T_CONTRACT_PRODUCT
           where POLICY_ID = I_POLICY_ID
             and PREM_STATUS = 1;

          if M_NUM = 0 then
            P_POLICY_PREM_CHANGE(I_POLICY_ID,
                                 2,
                                 O_SCCE_FLAG);
          end if;

     -- 共享池优化之银行转账处理 t_policy_prem  add by luke.zhang  2013-09

          ------ 将保单应缴数据置已转实收状态 -------
          /*update  T_POLICY_PREM
             set FEE_STATUS = 1 --暂收转实收
           where PREM_ID =
                 (select max(PREM_ID)
                    from T_POLICY_PREM
                   where POLICY_ID = I_POLICY_ID
                     and FEE_STATUS not in (1,
                                            2)
                     and FEE_TYPE = 24
                     and DUE_TIME <= M_MIN_DATE);*/

     for c_policy_prem_wf in(
           select prem_id,pay_mode
             from t_policy_prem
            where PREM_ID =
                 (select max(PREM_ID)
                    from T_POLICY_PREM
                   where POLICY_ID = I_POLICY_ID
                     and FEE_STATUS not in (1,
                                            2)
                     and FEE_TYPE = 24
                     and DUE_TIME <= M_MIN_DATE) )loop

        update t_policy_prem
           set fee_Status=1
         where prem_id=c_policy_prem_wf.prem_id;

        if PKG_LIFE_WF_CONTEXT.f_get_wf_process_switch('BANK_TRANS')=1
              and c_policy_prem_wf.pay_mode=3 then
              pkg_life_wf_ci.P_TASK_DISPATCH_BY_STS_ENTRE(null,
                                    c_policy_prem_wf.prem_id,
                                    'T_POLICY_PREM',
                                    'BANK_TRANS',
                                    'TASK_COMPLETED',
                                    O_RESULT => O_RESULT,
                                    O_INFO => O_INFO);
        end if;
     end loop;

          /*update \*+ index( t_policy_prem, IDX_POLICY_PREM__POLICY_ID ) *\ T_POLICY_PREM
             set FEE_STATUS = 2 --暂收转实收
           where POLICY_ID = I_POLICY_ID
             and FEE_TYPE = 24
             and FEE_STATUS not in (1,
                                    2)
             and DUE_TIME <= M_MIN_DATE;*/

      for c_policy_prem_wf in(
           select prem_id,pay_mode
             from t_policy_prem
            where POLICY_ID = I_POLICY_ID
              and FEE_TYPE = 24
              and FEE_STATUS not in (1,
                                     2)
              and DUE_TIME <= M_MIN_DATE )loop

            update t_policy_prem
               set fee_Status=2
             where prem_id=c_policy_prem_wf.prem_id;

           if PKG_LIFE_WF_CONTEXT.f_get_wf_process_switch('BANK_TRANS')=1
                 and c_policy_prem_wf.pay_mode=3 then
                 pkg_life_wf_ci.P_TASK_DISPATCH_BY_STS_ENTRE(null,
                                       c_policy_prem_wf.prem_id,
                                       'T_POLICY_PREM',
                                       'BANK_TRANS',
                                       'TASK_CANCELED',
                                       O_RESULT => O_RESULT,
                                       O_INFO => O_INFO);
           end if;
        end loop;
       -- 共享池优化之银行转账处理 t_policy_prem  end

       end if;
       --税延账户费用导回原表，更新可用额度
       if m_tdp_flag then
          pkg_life_ps_public_log.P_DUMP_ONE_TABLE_FROM_LOG(G_CHANGE_ID_IN,'T_CUST_DEPOSIT','T_CUST_DEPOSIT_LOG',2);
          pkg_life_ps_public_log.P_DUMP_ONE_TABLE_FROM_LOG(G_CHANGE_ID_IN,'T_CUST_DEPOSIT_LIST','T_CUST_DEPOSIT_LIST_LOG',2);
         update t_tdp_policy_info t
            set t.deductible_amount = t.deductible_amount -
                                      M_DISCOUNT_PREM_S
          where t.policy_id = I_POLICY_ID
            and t.tax_deductible_end_date > M_MIN_DATE;
       end if;

      if M_PREM_REATE < 1 then
        PKG_LIFE_PS_PUBLIC_LOG.P_DUMP_ONE_TABLE_TO_LOG(G_CHANGE_ID_IN,
                                                       I_POLICY_ID,
                                                       NULL,
                                                       2, -- old data
                                                       'T_CONTRACT_MASTER',
                                                       'T_CONTRACT_LOG');
      end if;

	  --税优[医疗状态变更][个单生日性别变更]预约生效处理
	  IF PKG_LIFE_RENEW_DRAW.f_is_tax_policy(I_POLICY_ID) THEN
	    PKG_LIFE_PS_CHARGETYPE_ALT.P_TAX_PRF_CHANGE_PREMIUM(I_POLICY_ID);
	  END IF;



      --保全预约变更处理
      if PKG_LIFE_PS_CHARGETYPE_ALT.F_IS_HAVE_NO_PRECESS(I_POLICY_ID) then
        --新change_id
        select S_POLICY_CHANGE__CHANGE_ID.nextval
          into M_CHG_TYPE_CHG_ID
          from DUAL;

        -- 插入保全记录
        insert into T_POLICY_CHANGE
          (CHANGE_ID,
           POLICY_ID,
           SERVICE_ID,
           APPLY_TIME,
           VALIDATE_TIME,
           FINISH_TIME,
           INSERT_TIME,
           CHANGE_STATUS,
           HANDLER_ID,
           CASE_ID,
           OPT_ID,
           CS_BIZ_STATUS_AF)
          select M_CHG_TYPE_CHG_ID,
                 I_POLICY_ID,
                 119,

                 sysdate,
                 sysdate,
                 sysdate,
                 sysdate,
                 0,
                 0,
                 null,
                 null,
                 '1'
            from DUAL;

		--获取预约变更保全change_id
		IF PKG_LIFE_PUBLIC.F_IS_TAX_DEF_POLICY(I_POLICY_ID) THEN
          select max(change_id)
            into m_befor_change_id
            from t_policy_change a
             where cs_biz_status_af = '1'
             and policy_id = i_policy_id
             and service_id = 119
             and change_status = '3';
		END IF;

        --变更
        IF PKG_LIFE_RENEW_DRAW.f_is_tax_policy(I_POLICY_ID) THEN

          PKG_LIFE_PS_CHARGETYPE_ALT.p_save_charge_type_tax_prf(M_CHG_TYPE_CHG_ID,
                                                               I_POLICY_ID,
                                                               PKG_LIFE_PS_CHARGETYPE_ALT.F_GET_NEXT_CHARGE_MODE(I_POLICY_ID),
                                                               2,
                                                               PKG_LIFE_PS_CHARGETYPE_ALT.F_GET_NEW_PERIOD_PREM(I_POLICY_ID),
                                                               M_ADD_PREM);
        ELSE
        PKG_LIFE_PS_CHARGETYPE_ALT.P_SAVE_CHARGE_TYPE_ALTER_TP(M_CHG_TYPE_CHG_ID,
                                                               I_POLICY_ID,
                                                               PKG_LIFE_PS_CHARGETYPE_ALT.F_GET_NEXT_CHARGE_MODE(I_POLICY_ID),
                                                               2,
                                                               M_ADD_PREM);
        END IF;

		IF PKG_LIFE_PUBLIC.F_IS_TAX_DEF_POLICY(I_POLICY_ID) THEN
		   for product in(select *
							from t_contract_product_log
						   where change_id = m_befor_change_id
							 and old_new = '2')loop
			   update t_contract_product_log
					set next_period_prem   = product.next_period_prem,
						next_discount_prem = product.next_discount_prem,
					   next_employee_prem = product.next_employee_prem,
					   next_normal_prem   = product.next_normal_prem ,
					   renewal_type  = product.renewal_type
				 where policy_id = I_POLICY_ID
				   and item_id = product.item_id
					and change_id = M_CHG_TYPE_CHG_ID
					and old_new = '2' ;
			  m_sum_period_prem := m_sum_period_prem + product.next_period_prem;
			end loop;

           update t_contract_log
              set (next_period_prem,
                   next_discount_prem,
                   next_employee_prem,
                   next_normal_prem) =
                  (select sum(next_period_prem),
                          sum(next_discount_prem),
                          sum(next_employee_prem),
                          sum(next_normal_prem)
                     from t_contract_product_log
                    where change_id = M_CHG_TYPE_CHG_ID
                      and old_new = '2'
                      and policy_id = i_policy_id)
            where policy_id = i_policy_id
              and change_id = M_CHG_TYPE_CHG_ID
              and old_new = '2';

             update T_CONTRACT_PRODUCT_EXT_LOG t
                set (t.prem_assign_rate) =
                    (SELECT round(tcp.next_discount_prem /
                                  tc.next_discount_prem,
                                  3)
                       FROM T_CONTRACT_LOG tc, T_CONTRACT_PRODUCT_LOG tcp
                      where tcp.change_id = tc.change_id
                        and tcp.policy_id = tc.policy_id
                        and tc.change_id = t.change_id
                        and tc.old_new = '2'
                        and tcp.old_new = '2'
                        and tcp.item_id = t.item_id)
              where t.change_id = M_CHG_TYPE_CHG_ID
                and t.old_new = 2;
		END IF;

        PKG_LIFE_PS_CONFIRM_PS_INCOME.P_CONFIRM_CS(M_CHG_TYPE_CHG_ID);

      end if;


      --190-保障计划变更预约变更
      IF PKG_LIFE_PS_ALTER_SCHEME.F_IS_HAVE_NO_PRECESS(I_POLICY_ID) THEN
         PKG_LIFE_PS_ALTER_SCHEME.P_PRECONT_SCHEME_PROCESS(I_POLICY_ID);
      END IF;
      --110-预约变更保额
      IF PKG_LIFE_PS_INCREASE_AMOUNT.F_IS_HAVE_PRECESS(I_POLICY_ID,M_ITEM_ID,110) THEN
         PKG_LIFE_PS_INCREASE_AMOUNT.P_PRECONT_AMOUNT_PROCESS(I_POLICY_ID);
      END IF;
      --万能期交保费变更 预约生效
      if PKG_LIFE_PS_ALTER_UNIPREM.F_IS_HAVE_NO_PRECESS(i_policy_id)=true then
        PKG_LIFE_PS_ALTER_UNIPREM.P_ALTER_UNIXERSAL_PREM(i_policy_id);
      end if;
      O_SCCE_FLAG := 0;

      update t_policy_change pc
         set pc.finish_time = sysdate
       where pc.change_id = G_CHANGE_ID_IN;

       --意外险平台插入待上报数据
       pkg_life_accident_common.P_INSERT_OPER_QUEUE_RENEW(I_POLICY_ID,1);
       --人生无忧产品续保，通过承包接口上报
       select count(1) into M_COUNT
         FROM t_contract_product t
        WHERE t.product_id in (60016,63423)
          AND t.policy_id = I_POLICY_ID;
       IF M_COUNT = 1 THEN
       select t.policy_year,t.policy_period,t.renewal_type
         into M_POLICY_YEAR,M_POLICY_PERIOD,M_RENEWAL_TYPE
         from t_contract_product t
        where t.product_id in (60016,63423)
          and t.policy_id = I_POLICY_ID;
       if (M_RENEWAL_TYPE = 2) and (M_POLICY_PERIOD /M_POLICY_YEAR = 2) then
          PKG_LIFE_HEALTH_COMMON.p_insert_busi_module_queue(G_CHANGE_ID_IN, 7);--busimodel:7-续期
        else
          PKG_LIFE_HEALTH_COMMON.p_insert_busi_module_queue(I_POLICY_ID, 1);
       end if;
      ELSE
        	PKG_LIFE_HEALTH_COMMON.p_insert_busi_module_queue(G_CHANGE_ID_IN, 7);--busimodel:7-续期
          if m_tax_flag then
             pkg_life_ciitc_main.p_enter_ciitc_queue(I_POLICY_ID,G_CHANGE_ID_IN,null,'PRM001',m_result);
             if pkg_life_renew_draw.F_CHECK_MAIN_PREM(I_POLICY_ID) then
                pkg_life_ciitc_main.p_enter_ciitc_queue(I_POLICY_ID,G_CHANGE_ID_IN,null,'ACT001',m_result);
             end if;
          end if;
          --税延插入续期上报队列
          if m_tdp_flag then
            pkg_life_tdp_main.p_enter_ciitc_queue(I_POLICY_ID,G_CHANGE_ID_IN,null,'END001',m_result);
          end if;
      END IF;

    else
      --如果转实收失败，更新pc.change_status = '6'，综合查询拒此过虑数据
      --add by bingham.liu 20090115
      update t_policy_change pc
         set pc.change_status = '11'
       where pc.change_id = G_CHANGE_ID_IN;
      --税延在宽限期摸如果还不足够缴费，将应缴日更改为下期应缴日，反冲续期费用
      if m_tdp_flag and trunc(sysdate-M_MIN_DATE) > 68 then
       update t_policy_prem t
          set t.fee_status = 2
        where t.policy_id = I_POLICY_ID
          and t.fee_type = 24
          and t.due_time = M_MIN_DATE
          and t.fee_status in (0, 3);
        pkg_life_renew_pub.P_CAS_BACK_OFFSET_RENEW_SGL(I_POLICY_ID,null,null,null);
        for c_item in(select item_id,pay_to_date
                         from t_contract_product tcp
                        where policy_id = I_POLICY_ID)LOOP
             pkg_life_renew.p_adjust_product(I_POLICY_ID,c_item.item_id,c_item.pay_to_date,0,O_SCCE_FLAG);
        end loop;
      end if;

      O_BREAK := true;
      O_SCCE_FLAG := 2;
      O_ERR_MSG := '保单余额不足！';
    end if;

  end P_TURN_REAL_DETAIL_COMMON_SGL;