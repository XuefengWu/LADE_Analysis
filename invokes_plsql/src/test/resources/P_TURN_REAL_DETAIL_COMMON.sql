
  --- 逐单转实收保费 ----
  procedure P_TURN_REAL_DETAIL_COMMON(I_POLICY_ID in number, --- 保单id ---
                                      I_SUSPEND_TYPE in char, --- 处理理赔暂停(Y)，非万能、非暂停产品(N) ---
                                      I_DUE_DATE in date, --- 截至日期 ---
                                      O_SCCE_FLAG out number, --- 返回值 0为正确 -1为失败(记log),-2 余额不足 -3 险种没有找到, -4 挂应收等，不用转实收 -5保单服务人员未分配 ---
                                      O_BREAK out boolean, --- 返回值 true终止循环
                                      O_ERR_MSG out varchar2 --- 错误提示信息----
                                      ) as
    V_POLICY_TYPE T_CONTRACT_MASTER.POLICY_TYPE%type;
    V_POLICY_INPUT_SOURCE T_POLICY.POLICY_INPUT_SOURCE%TYPE;
    m_count number;
  begin
    select POLICY_TYPE
      into V_POLICY_TYPE
      from T_CONTRACT_MASTER T
     where T.POLICY_ID = I_POLICY_ID;

    SELECT COUNT(1)
      INTO m_count
      FROM t_ias_paa_asign_list a
     WHERE a.policy_id = I_POLICY_ID
       AND a.status = 0 and rownum = 1;

    if m_count = 0 then
      if V_POLICY_TYPE = 2 then
        P_TURN_REAL_DETAIL_COMMON_GRP(I_POLICY_ID,
                                      I_SUSPEND_TYPE,
                                      I_DUE_DATE,
                                      O_SCCE_FLAG,
                                      O_BREAK,
                                      O_ERR_MSG);
      else
        select NVL(T.POLICY_INPUT_SOURCE,0)
             into V_POLICY_INPUT_SOURCE
             from T_POLICY T
             where T.POLICY_ID = I_POLICY_ID;
        --- 返回值 true终止循环2
        if V_POLICY_INPUT_SOURCE <>5 then
        --- 返回值 true终止循环3
        P_TURN_REAL_DETAIL_COMMON_SGL(I_POLICY_ID,
                                      I_SUSPEND_TYPE,
                                      I_DUE_DATE,
                                      O_SCCE_FLAG,
                                      O_BREAK,
                                      O_ERR_MSG);
        end if;
      end if;
    else
      O_SCCE_FLAG := -5;
      O_BREAK := false;
    end if;
  end P_TURN_REAL_DETAIL_COMMON;