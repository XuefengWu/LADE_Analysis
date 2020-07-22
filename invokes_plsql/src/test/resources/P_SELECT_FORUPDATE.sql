
  procedure P_SELECT_FORUPDATE(O_SCCE_FLAG out number, --- 返回值 0为正确 -1为失败 ---
                            O_ERR_MSG out varchar2 --- 错误提示信息----
                            ) as

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

        cursor C_ITEM2 is
        SELECT COUNT(*)
         FROM T_CONTRACT_PRODUCT CP
        WHERE CP.POLICY_ID = I_POLICY_ID
          AND CP.MASTER_ID IS NULL
          AND CP.PRODUCT_ID in (60576,64303,65325) AND ROWNUM =1;

       M_Prem_chgID t_policy_change.change_id%type;
  begin
    open C_ITEM;
  end; -- end procedure block
