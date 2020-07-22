
  procedure P_IF_ELSEIF_IF(O_SCCE_FLAG out number --- 返回值 0为正确 -1为失败 ---
                            ) as

  begin
        -- test if then end if
        if(PKG_LIFE_PUBLIC.F_IS_TAX_DEF_POLICY(I_POLICY_ID)) then
            O_SCCE_FLAG := 0;
        end if;

        if O_ERR_MSG = '5' then
            O_SCCE_FLAG := 1;
        elsif m_tdp_flag then
            if M_NEW_PREM > 0 then
                O_SCCE_FLAG := 2;
            end if;
        elsif m_tdp_flag = false then
           O_SCCE_FLAG := 7;
        else
            O_SCCE_FLAG := 3;
            if m_tdp_flag then
                O_SCCE_FLAG := 4;
            else
                O_SCCE_FLAG := 5;
            end if;
        end if;
        O_SCCE_FLAG := 6;

  end; -- end procedure block
