
  -------- 批次转实收保费 -------
  procedure P_FOR_IN_LOOP(I_CASE_ID in  t_claim_product.case_id%type, --- 返回值 0为正确 -1为失败 ---
                            O_ERR_MSG out varchar2 --- 错误提示信息----
                            ) as

  begin
    for claim_info in (
     select tlp.item_id, tlp.liab_id
      from t_liability_pay tlp
      where tlp.case_id = I_CASE_ID
      and tlp.product_id in (66185,65285)
      and tlp.liab_id in (810, 811, 812, 813,1210,1211)
      and tlp.is_checked = 'Y') loop
    if claim_info.liab_id in (810, 811, 812, 813) then
        m_item_id := claim_info.item_id;
      end if;
    end loop;
  end; -- end procedure block
