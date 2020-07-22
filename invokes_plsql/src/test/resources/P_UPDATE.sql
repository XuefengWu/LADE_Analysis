
  procedure P_UPDATE(O_SCCE_FLAG out number --- 返回值 0为正确 -1为失败 ---
                            ) as

  begin

  m_tdp_flag := pkg_life_public.F_IS_TAX_DEF_POLICY(i_policy_id);

  PKG_LIFE_PS_CHARGETYPE_ALT.P_SAVE_CHARGE_TYPE_ALTER_TP(M_CHG_TYPE_CHG_ID,
                                                               I_POLICY_ID,
                                                               PKG_LIFE_PS_CHARGETYPE_ALT.F_GET_NEXT_CHARGE_MODE(I_POLICY_ID),
                                                               2,
                                                               M_ADD_PREM);


   update t_contract_log set next_discount_prem = 1;


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

  end; -- end procedure block
