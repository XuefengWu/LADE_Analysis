
  -------- 批次转实收保费 -------
  procedure P_TURN_REAL_FEE(O_SCCE_FLAG out number, --- 返回值 0为正确 -1为失败 ---
                            O_ERR_MSG out varchar2 --- 错误提示信息----
                            ) as
    M_POLICY_ID T_CONTRACT_MASTER.POLICY_ID%type;
    S_TOTAL_ERR varchar2(4000) := 'error';
    S_TMP_ERR varchar2(4000) := 'error';
    N_ERR_FLAG number(4) := 0;
    N_SCCE_FLAG number(4) := 0;
    M_NUM number := 0;
    M_ISBREAK boolean;

    cursor C_POLICY is
      /* use_nl(tcp,tcm) ordered index(tcp uni_contract_product__pronum) index(tcm IDX_CONTRACT_MASTER__SUSPEND) */
      select /*+ FULL(tcp) FULL(tcm) */ distinct TCM.POLICY_ID
        from T_CONTRACT_MASTER TCM,
             T_CONTRACT_PRODUCT TCP
       where TCM.POLICY_ID = TCP.POLICY_ID
         and (TCM.SUSPEND = 'N' or TCM.POLICY_TYPE = '2') --- 个单保单不为暂停
         and TCM.LIABILITY_STATE = 1 ---保单为有效
         and TCM.BALANCE_PREM > 0 ---保单有余额
         and TCP.PREM_STATUS = 1 ---险种缴费状态为正常
         and TCP.PAY_TO_DATE < sysdate --- 险种的下次交费期在当前系统日期之前
         and pkg_life_renew_draw.f_get_renew_suspend(tcp.item_id) = 'Y'
         and TCP.LIABILITY_STATE = 1 ---险种为有效
                                     ;

  begin
    G_OPT_ID := null;
    G_CHANGE_ID := null;
    G_CUR_TIME := sysdate;
    ---- 计算所有符合实收条件的保单 -----
    open C_POLICY;
    loop
      begin
        ----- 设置断点 ----
        savepoint POINT_1;
        fetch C_POLICY into M_POLICY_ID;
        exit when C_POLICY%notfound;

        ----- 逐单转实收 -----
        P_TURN_REAL_DETAIL_COMMON(M_POLICY_ID,
                                  'N',
                                  sysdate,
                                  N_SCCE_FLAG,
                                  M_ISBREAK,
                                  S_TMP_ERR);
        if N_SCCE_FLAG < 0 then
          rollback to POINT_1;
          if LENGTHB(S_TOTAL_ERR) + LENGTHB(RTRIM(S_TMP_ERR)) < 4000 then
            S_TOTAL_ERR := S_TOTAL_ERR || trim(S_TMP_ERR);
          end if;
          N_ERR_FLAG := -1;
        else
          if N_SCCE_FLAG=2 then
            rollback to POINT_1;
          else
            commit;
          end if;
        end if;
        M_NUM := M_NUM + 1;
      ----- 捕捉例外, 继续执行下一个申请 ----
      exception
        when others then
          rollback to POINT_1; --- 不正确回滚
          close C_POLICY;  ---??? 为什么这里要关闭游标，还能继续loop吗
          P_ERROR(111,
                  sqlerrm);
      end; -- end begin block
    end loop;
    close C_POLICY;

    if N_ERR_FLAG = -1 then
      O_SCCE_FLAG := -1;
      O_ERR_MSG := S_TOTAL_ERR;
    else
      ---- 若执行成功,则O_SCCE_FLAG为0 ----
      O_SCCE_FLAG := M_NUM;
    end if;
  end; -- end procedure block
