SELECT tcc.case_id
FROM  t_policy_fee tpf, t_claim_case tcc
WHERE tpf.case_id = tcc.case_id
      AND ((tpf.fee_status = 1 and tpf.pay_mode in (1, 2, 33)) or
           (tpf.fee_status = 3 and exists
           (select 1
            from t_bank_back tbb
            where tbb.fee_id = tpf.fee_id
                  and tbb.send_id = tpf.send_Id
                  and tbb.status = 'N')) or
           (tpf.fee_status = 0 and exists
           (select 1
            from t_policy_problem tpp
            where tpp.fee_id = tpf.fee_id
                  and tpp.treat_status = 4)))
      and tpf.fee_type = 32 and tcc.CASE_SOURCE = 5 and tpf.fee_id = ?;