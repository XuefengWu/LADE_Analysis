SELECT tcc.case_id
FROM  t_claim_case tcc
WHERE tcc.case_status = 7
AND tcc.case_source = 10
AND tcc.case_id > 100