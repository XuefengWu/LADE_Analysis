
  -------- 批次转实收保费 -------
  procedure P_TRANSACTION(O_SCCE_FLAG out number, --- 返回值 0为正确 -1为失败 ---
                            O_ERR_MSG out varchar2 --- 错误提示信息----
                            ) as


  begin

    loop
      begin
        ----- 设置断点 ----
        savepoint POINT_1;


        if N_SCCE_FLAG < 0 then
          rollback to POINT_1;

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

    if N_ERR_FLAG = -1 then
      O_SCCE_FLAG := -1;
      O_ERR_MSG := S_TOTAL_ERR;
    else
      ---- 若执行成功,则O_SCCE_FLAG为0 ----
      O_SCCE_FLAG := M_NUM;
    end if;
  end; -- end procedure block
