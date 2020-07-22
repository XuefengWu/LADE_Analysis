
  procedure P_BARBAR(O_SCCE_FLAG out number, --- 返回值 0为正确 -1为失败 ---
                            O_ERR_MSG out varchar2 --- 错误提示信息----
                            ) as
    S_TOTAL_ERR varchar2(4000) := 'error';
    S_TMP_ERR varchar2(4000) := 'error';

  begin
    S_TOTAL_ERR := S_TOTAL_ERR || trim(S_TMP_ERR);
  end; -- end procedure block
