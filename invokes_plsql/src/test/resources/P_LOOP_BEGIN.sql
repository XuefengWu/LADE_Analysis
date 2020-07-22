  procedure P_LOOP_BEGIN(O_SCCE_FLAG out number, --- 返回值 0为正确 -1为失败 ---
                            O_ERR_MSG out varchar2 --- 错误提示信息----
                            ) as

  begin

    loop
      begin
        ----- 设置断点 ----
        if N_SCCE_FLAG < 0 then
          if LENGTHB(S_TOTAL_ERR) + LENGTHB(RTRIM(S_TMP_ERR)) < 4000 then
            S_TOTAL_ERR := S_TOTAL_ERR;
          end if;
          N_ERR_FLAG := -1;
        else
          if N_SCCE_FLAG=2 then
            M_NUM := M_NUM + 1;
          else
            M_NUM := M_NUM + 1;
          end if;
        end if;
        M_NUM := M_NUM + 1;

      end; -- end begin block
    end loop; -- end loop

    if N_ERR_FLAG = -1 then
      O_SCCE_FLAG := -1;
      O_ERR_MSG := S_TOTAL_ERR;
    else
      ---- 若执行成功,则O_SCCE_FLAG为0 ----
      O_SCCE_FLAG := M_NUM;
    end if;

  end; -- end procedure block
