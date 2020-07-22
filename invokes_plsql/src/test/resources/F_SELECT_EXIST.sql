procedure P_RECALC_POLICY_PREM(I_POLICY_ID   in number, ---保单号码---
                                 I_POLICY_TYPE in char ---保单类型(1个险：2团险)---
                                 ) as
    M_EXEMPT_TYPE T_PRODUCT_LIFE.EXEMPT_TYPE%type;
    M_INTERNAL_ID T_PRODUCT_LIFE.INTERNAL_ID%type;
    M_TEMP        number;
    m_fbp_relized  NUMBER;
    m_fbp_isGrouping NUMBER;
    m_is_fbp         NUMBER;
    m_need_recal     VARCHAR2(1):='Y';
    v_count          number;
    cursor C1 is
      select * from T_POLICY_PRODUCT where POLICY_ID = I_POLICY_ID order by PRODUCT_NUM;

    cursor C2 is
      select *
        from T_POLICY_PRODUCT
       where GROUP_POLICY_ID = I_POLICY_ID
         and (INSURANT_1 <> 0 or
             PRODUCT_ID in (select PRODUCT_ID from T_PRODUCT_LIFE where BENEFIT_TYPE = 24))
       order by INSURANT_1, PRODUCT_NUM;

  begin

    if I_POLICY_TYPE = '1' or I_POLICY_TYPE = '3' then
      ---个险---
      select count(*) into M_TEMP from T_POLICY where POLICY_ID = I_POLICY_ID;
      if M_TEMP <> 1 then
        P_ERROR(20157,
                'POLICY_ID error!POLICY_ID=' || I_POLICY_ID);
      end if;

      for CR1 in C1 loop
        select EXEMPT_TYPE, INTERNAL_ID
          into M_EXEMPT_TYPE, M_INTERNAL_ID
          from T_PRODUCT_LIFE
         where PRODUCT_ID = CR1.PRODUCT_ID;

        if M_EXEMPT_TYPE <> 0 then
          --计算并更新豁免险种险种保费
          P_CALC_EXEMPT_PRODUCT_PREM(CR1.ITEM_ID);
        else
          if PKG_PUB_CST.C_TAIPING = PKG_PUB_APP_CONTEXT.F_GET_CUSTOMER_COMPANY_NAME() then
            if M_INTERNAL_ID = '3502' then
              --计算定期寿险
              P_CALC_POLICY_PRODUCT_PREM(CR1);
              PKG_LIFE_NEWBIZ_ENTRY.P_STORE_BLESS_PRODUCT(CR1.ITEM_ID,
                                                          M_TEMP);
            elsif M_INTERNAL_ID <> '3501' then
              --不包含福满堂
              P_CALC_POLICY_PRODUCT_PREM(CR1);
            end if;
          else
            P_CALC_POLICY_PRODUCT_PREM(CR1);
          end if;
        end if;
      end loop;

      --重新计算特殊险种保额、保费
      P_RECALC_SPECIAL_PRODUCT(I_POLICY_ID);

      --合计保费
      P_TOTAL_INDV_POLICY_PREMIUMS(I_POLICY_ID);

    elsif I_POLICY_TYPE = '2' then
      ---团险---
      select count(*) into M_TEMP from T_GROUP_POLICY where POLICY_ID = I_POLICY_ID;
      if M_TEMP <> 1 then
        P_ERROR(20157,
                'POLICY_ID error!POLICY_ID=' || I_POLICY_ID);
      end if;

      for CR2 in C2 loop
        P_CALC_POLICY_PRODUCT_PREM(CR2);
      end loop;
      --虚拟被保人--
      --如果弹性福利平台保单，并且不分组，且已进行实名化 不进行虚拟被保险人重算保费
      SELECT COUNT(1)
        INTO m_is_fbp
        FROM T_FB_POLICY_INFO T1, T_GROUP_POLICY T2
       WHERE T1.SEND_CODE = T2.SEND_CODE
         AND T2.POLICY_ID = I_POLICY_ID;

      IF m_is_fbp > 0 THEN
         SELECT COUNT(1)
           INTO M_FBP_ISGROUPING
           FROM T_FB_POLICY_INFO T1, T_GROUP_POLICY T2
          WHERE T1.SEND_CODE = T2.SEND_CODE
            AND T2.POLICY_ID = I_POLICY_ID
            AND T1.ISGROUPING = 'N';


            IF m_fbp_isGrouping > 0 THEN
              SELECT COUNT(1)
                INTO M_FBP_RELIZED
                FROM T_POLICY_PRODUCT T
               WHERE T.GROUP_POLICY_ID = I_POLICY_ID
                 AND T.INSURANT_1 != 0;

                 IF m_fbp_relized > 0 THEN
                   m_need_recal := 'N';
                 END IF;
             END IF;
        END IF;


  --驾乘险组合投保，不计算保费
  select count(1)
   into v_count
   from t_group_policy_product_ext
   where policy_id = I_POLICY_ID
   and   pkg_id in (119215,120675);
      IF m_need_recal != 'N' and v_count = 0 THEN
         P_RECALC_DUMMY_INSURED_PREM(I_POLICY_ID);
      ELSE
        P_RESET_WHEN_BENE24_AND_DUM(I_POLICY_ID);
      END IF;

      --合计保费
      P_TOTAL_GROUP_POLICY_PREMIUMS(I_POLICY_ID);
    else
      P_ERROR(20157,
              'I_POLICY_TYPE error!POLICY_ID=' || I_POLICY_ID);
    end if;

  end P_RECALC_POLICY_PREM;