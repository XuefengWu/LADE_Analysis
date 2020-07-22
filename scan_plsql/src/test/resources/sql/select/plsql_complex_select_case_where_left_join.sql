select distinct bu.unit_num,
			                cus.real_name,
			                bu.apply_certi_type,
			                cp.diagnosis_count,
			                bu.liab_id,
			                bu.apply_certi_code,
			                bu.PAY_MODE,
			                bu.ACCO_NAME,
			                bu.pay_certi_type,
			                bu.pay_certi_code,
			       case when bu.pay_mode = 33 then
	    	       tna.bank_code
	    	       else bu.bank_code end bank_code,
	    	       case when bu.pay_mode = 33 then
	    	         tb.bank_name
	    	       else (select bank_name from t_bank where bank_code = bu.BANK_CODE) end bank_name,
			       case when bu.pay_mode = 33 then
	    	         tna.bank_account
	    	       else bu.bank_account end bank_account,
			                bu.telephone,
			                bu.email,
			                bu.ACCOUNT_CHECK_STATUS,
			                bu.CHECK_MEMO,
			                pkg_life_claim_batch.f_get_batch_unit_show_tag(bu.batch_id,
			                                                         bu.unit_num) isRedShow,
			                cc.insured_id,
			                to_char(cc.accident_time, 'yyyy-mm-dd') as accident_time,
			                cp.register_conclusion,
			                cp.noregister_cause,
			                cc.hospital_code,
			                cc.hospital,
			                ic.accident_name,
			                cc.accident_id,
			                cc.claim_sum,
			                cp.audit_sum,
			                cp.pay_sum,
			                cp.audit_conclusion,
			                cp.audit_according,
			                cp.keep_valid,
			                cc.case_id,
			                cp2.pay_rate,
			                cp.item_id,
			                cp.calcu_sum,
			                PKG_LIFE_CLAIM_INTERFACE.f_get_min_case_id(cc.case_id) min_case_id,
			                cc.register_time
			  from t_batch_unit       bu,
			       t_claim_case       cc,
			       t_claim_product    cp,
			       t_contract_product cp2,
			       t_accident         ic,
			       t_customer         cus,
             t_data_refers      tdr,
             t_netbank_account  tna,
             t_bank             tb
			 where bu.batch_id = ?
			   and bu.case_id = cc.case_id
			   and cp.case_id = cc.case_id
			   and cc.case_status <> 12
			   and cp2.item_id = cp.item_id
			   and cp.product_id = ?
			   and ic.accident_id(+) = cc.accident_id
			   and cc.insured_id = cus.customer_id
         and tdr.father_table_pk_col1(+) = to_char(bu.batch_id)
         and tdr.father_table_pk_col2(+) = to_char(bu.unit_num)
         and tdr.child_table_pk_col1 = tna.list_id(+)
         and  tdr.father_table_name(+) = 'T_BATCH_UNIT'
         and  tdr.child_table_name(+) = 'T_NETBANK_ACCOUNT'
         and tna.bank_code = tb.bank_code(+)
			   ORDER BY bu.unit_num