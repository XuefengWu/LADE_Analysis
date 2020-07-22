create or replace package PKG_LIFE_RENEW is

  ------ 自动垫缴，对保单进行续期调整-----
  ------ 自动垫缴，对保单进行续期调整-----
  ------ 自动垫缴，对保单进行续期调整-----
  procedure P_AUTOLOAN_MOVE_DUE_DATE(I_POLICY_ID in number,
                                     I_CHANGE_ID in number, --- 自垫log表纪录的change id
                                     I_PAY_TO_DATE in T_CONTRACT_PRODUCT_LOG.PAY_TO_DATE%type,
                                     O_SCCE_FLAG out number --- 返回值 0为正确 -1为失败 ---
                                     );
  ------ 在续期转实收保费时, 对保单进行相应的调整-----
  procedure P_ADJUST_PRODUCT_LOG_1(I_ITEM_ID in number, --- 保单险种ID ---
                                   I_CHANGE_ID in T_CONTRACT_PRODUCT_LOG.CHANGE_ID%type,
                                   I_PAY_TO_DATE in T_CONTRACT_PRODUCT_LOG.PAY_TO_DATE%type);
  -------- 批次转实收保费 -------
  procedure P_TURN_REAL_FEE(O_SCCE_FLAG out number, --- 返回值 0为正确 -1为失败 ---
                            O_ERR_MSG out varchar2 --- 错误提示信息----
                            );

  -------- 批次转实收保费(后台批处理接口) -------
  procedure P_TURN_REAL_FEE(I_OPT_ID in number, ---  批处理操作流水号 ---
                            O_SCCE_FLAG out number --- 返回值 0为正确 -1为失败 ---
                            );

  --- 逐单多期转实收保费(万能产品和非万能产品) -------
  procedure P_MASS_TURN_REAL_DETAIL(I_POLICY_ID in number, --- 保单号码 ----
                                    O_FLAG out number --- 成功标志,-1表示转实收操作不成功 ----
                                    );

  --- 逐单转实收保费(万能产品和非万能产品) -------
  procedure P_TURN_REAL_DETAIL(I_POLICY_ID in number, --- 保单号码 ----
                               I_CHANGE_ID in number, --- 保全号 ----
                               O_FLAG out number --- 成功标志 ----
                               );

  --- 逐单转实收保费(旧接口，将废除。万能产品和非万能产品) -------
  procedure P_TURN_REAL_DETAIL(I_POLICY_ID in number, --- 保单号码 ----
                               O_FLAG out number --- 成功标志 ----
                               );

  --- 逐单转实收保费(万能产品和非万能产品) -------
  procedure P_TURN_REAL_DETAIL(I_POLICY_ID in number, --- 保单号码 ---
                               I_DUE_DATE in date ---
                               );

  --- 万能缴费转实收 ---
  procedure P_INVEST_TURN_REAL(O_SCCE_FLAG out number, --- 返回值 0为正确 -1为失败 ---
                               O_ERR_MSG out varchar2 --- 错误提示信息----
                               );

  --- 万能缴费逐单转实收(指定日期) ---
  procedure P_INVEST_TURN_REAL(I_POLICY_ID in number, --- 保单号码 ----
                               I_DUE_DATE in date);

  --- 万能缴费逐单转实收 ---
  procedure P_INVEST_TURN_REAL_DETAIL(I_POLICY_ID in number, --- 保单号码 ---
                                      I_DUE_DATE in date, --- 指定的日期 ---
                                      O_SCCE_FLAG out number, --- 返回值 0为正确 -1为失败 ---
                                      O_ERR_MSG out varchar2 --- 错误提示信息---
                                      );

  --- 逐单转实收保费(针对理赔暂停) ----
  procedure P_TURN_REAL_CLAIM(I_POLICY_ID in number, --- 保单id ---
                              I_CHANGE_ID in number, --- 保全id ---
                              I_DUE_DATE in date, --- 事故发生日期 ---
                              i_suspend in char ---是否理赔暂停
                              );

  --- 逐单转实收保费(旧接口，将废除。针对理赔暂停) ----
  procedure P_TURN_REAL_CLAIM(I_POLICY_ID in number, --- 保单id ---
                              I_DUE_DATE in date --- 截至日期 ---
                              );

  -------- 逐单转实收保费 -------
  procedure P_TURN_REAL_FEE_DETAIL(I_POLICY_ID in number, --- 保单号码 ----
                                   I_OPT_ID in number, ---  批处理操作流水号 ---
                                   O_SCCE_FLAG out number, --- 返回值 0为正确 -1为失败 ---
                                   O_ERR_MSG out varchar2 --- 错误提示信息----
                                   );

  -------后台续期代理人孤儿单分配批处理程序------------
  procedure P_ORPHAN_POLICY_ASSIGN(I_OPT_ID in number, ---  批处理操作流水号 ---
                                   O_SCCE_FLAG out number --- 返回值 0为正确 -1为失败 ---
                                   );

  -------后台续期非代理人渠道（目前包括职场保险和银行保险）的保单分配批处理程序------------
  procedure P_NONE_AGENT_ASSIGN(I_OPT_ID in number, ---  批处理操作流水号 ---
                                O_SCCE_FLAG out number --- 返回值 0为正确 -1为失败 ---
                                );

  ---工具-----------------------------------------------
  --- 加费及保单费用的计算 ---
  procedure P_ADD_FEE(I_ITEM_ID in number, --- 险种选项ID ---
                      I_DUE_TIME in date, --- 对应的应缴日期 ---
                      I_IS_INTEGER in number, --rounding标记
                      O_POLICY_PREM in out number, --- 保单费用 ---
                      O_WEAK_PREM in out number,
                      O_JOB_PREM in out number,
                      O_DISABLE_PREM in out number,
                      O_WEAK_STAND in out number,
                      O_JOB_STAND in out number,
                      O_DISABLE_STAND in out number,
                      O_WEAK_REAL_PREM out number,
                      O_JOB_REAL_PREM out number,
                      O_DISABLE_REAL_PREM out number,
                      O_WEAK_REAL_STAND out number,
                      O_JOB_REAL_STAND out number,
                      O_DISABLE_REAL_STAND out number);

  --- log表加费及保单费用的计算 ---
  procedure P_ADD_FEE_LOG(I_ITEM_ID in number, --- 险种选项ID ---
                          I_CHANGE_ID in number,
                          I_DUE_TIME in date, --- 对应的应缴日期 ---
                          O_POLICY_PREM in out number, --- 保单费用 ---
                          O_WEAK_PREM in out number,
                          O_JOB_PREM in out number,
                          O_DISABLE_PREM in out number,
                          O_WEAK_STAND in out number,
                          O_JOB_STAND in out number,
                          O_DISABLE_STAND in out number,
                          O_WEAK_REAL_PREM out number,
                          O_JOB_REAL_PREM out number,
                          O_DISABLE_REAL_PREM out number,
                          O_WEAK_REAL_STAND out number,
                          O_JOB_REAL_STAND out number,
                          O_DISABLE_REAL_STAND out number);

  --- 险种保费计算 ---
  procedure P_CALC_PRODUCT(I_ITEM_ID in number, --- 险种选项ID ---
                           I_POLICY_ID in number,
                           I_DUE_TIME in date, --- 对应的应缴日期 ---
                           I_PRODUCT_ID in number,
                           I_POLICY_TYPE in char, --- 保单销售渠道分类 ---
                           I_OLD_PREM in T_CONTRACT_PRODUCT.DISCOUNT_PREM%type,
                           I_WHOLE_PERIOD in char,
                           O_NEW_PREM out T_CONTRACT_PRODUCT.DISCOUNT_PREM%type, --- 折扣后期交保费 ---
                           IS_INTEGER in number,
                           O_SCCE_FLAG out number --- 操作成功标志 ---
                           );

  --- 保费计算 ---
  function F_PREM_CALC(I_ITEM_ID in number, --- 险种选项ID ---
                       I_DUE_TIME in date, --- 对应的应缴日期 ---
                       O_PERIOD_PREM out number, --- 变化前折扣前期缴保费 ---
                       O_NORMAL_PREM out number, --- 变化前标准体保费 ---
                       O_POLICY_PREM out number, --- 变化前保单费用 ---
                       O_WEAK_PREM out number, --- 变化前次标体加费 ---
                       O_JOB_PREM out number, --- 变化前职业加费 ---
                       O_DISABLE_PREM out number, --- 变化前残疾加费 ----
                       O_WEAK_STAND out number,
                       O_JOB_STAND out number,
                       O_DISABLE_STAND out number,
                       O_GST out number,
                       O_YRT out number,
                       O_COMPANY out number,
                       O_EMPLOYEE out number,
                       O_AMOUNT out number --- 保额 ---
                       ) return number;
  --- 保费计算 ---
  function F_PREM_CALC_IN(I_ITEM_ID in number, --- 险种选项ID ---
                       I_DUE_TIME in date, --- 对应的应缴日期 ---
                       I_IS_INTEGER IN NUMBER,
                       O_PERIOD_PREM out number, --- 折扣前期缴保费 ---
                       O_NORMAL_PREM out number, --- 标准体保费 ---
                       O_POLICY_PREM out number, --- 保单费用 ---
                       O_WEAK_PREM out number, --- 次标体加费 ---
                       O_JOB_PREM out number, --- 职业加费 ---
                       O_DISABLE_PREM out number, --- 残疾加费 ----
                       O_WEAK_STAND out number,
                       O_JOB_STAND out number,
                       O_DISABLE_STAND out number,
                       O_GST out number,
                       O_YRT out number,
                       O_COMPANY out number,
                       O_EMPLOYEE out number,
                       O_AMOUNT out number --- 客户投保金额 ---
                       ) return number;
  --用于主险减去附加险差值对应主险相关性计算保费
  procedure P_CALC_PREM_MAIN_SUB_RIDER(I_ITEM_ID in number, --- 主险种选项ID ---
                       I_ITEM_ID_0 in number, --- 附加险种选项ID ---
                       I_DUE_TIME in date, --- 对应的应缴日期 ---
                       I_IS_INTEGER IN NUMBER,
                       O_PERIOD_PREM out number --- 折扣前期缴保费 ---
                       ) ;
  --用于主险减去附加险差值对应主险相关性计算保费
  procedure P_CALC_PREM_MAIN_SUB_RIDER_LOG(I_ITEM_ID in number, --- 主险种选项ID ---
                           I_ITEM_ID_0 in number, --- 附加险种选项ID ---
                           I_CHANGE_ID in number,
                           I_DUE_TIME in date, --- 对应的应缴日期 ---
                           O_PERIOD_PREM out number --- 折扣前期缴保费 ---
                           );
  --- log表保费计算 ---
  function F_PREM_CALC_LOG(I_ITEM_ID in number, --- 险种选项ID ---
                           I_CHANGE_ID in number,
                           I_DUE_TIME in date, --- 对应的应缴日期 ---
                           O_PERIOD_PREM out number, --- 折扣前期缴保费 ---
                           O_NORMAL_PREM out number, --- 标准体保费 ---
                           O_POLICY_PREM out number, --- 保单费用 ---
                           O_WEAK_PREM out number, --- 次标体加费 ---
                           O_JOB_PREM out number, --- 职业加费 ---
                           O_DISABLE_PREM out number, --- 残疾加费 ----
                           O_WEAK_STAND out number,
                           O_JOB_STAND out number,
                           O_DISABLE_STAND out number,
                           O_GST out number,
                           O_YRT out number,
                           O_COMPANY out number,
                           O_EMPLOYEE out number,
                           O_AMOUNT out number --- 客户投保金额 ---
                           ) return number;

  --- topup的处理
  procedure P_PROC_FOR_TOPUP(I_POLICY_ID in number, --- 保单号码 ----
                             I_FEE_ID in number, --- 预收费用的fee_id ---
                             I_PREM_AMOUNT in number, --- topup金额
                             I_FLAG in number, --- 0，首期topup；1，续期topup
                             O_SCCE_FLAG out number --- 返回值 0为正确 -1为失败 ---
                             );

  procedure P_COMPANY_EPLOYEE(I_PREM in number,
                              I_ASSIGN_WAY in char,
                              I_ASSIGN_AMOUNT in number,
                              I_ASSIGN_RATE in number,
                              O_COMPANY out number,
                              O_EMPLOYEE out number);

  -------- 计算每一个保单险种的当期折扣后的保费 -------
  function F_RECOUNT_ITEM_FEE(I_ITEM_ID in number, --- 险种选项ID   ----
                              I_PAY_TO_DATE in date, --- 下次交费时间 ----
                              I_POLICY_TYPE in char, --- 销售渠道     ----
                              O_PERIOD_PREM out number, --- 变化前折扣前期缴保费 ---
                              O_NORMAL_PREM out number, --- 变化前标准体保费 ---
                              O_WEAK_PREM out number, --- 变化前次标体加费 ---
                              O_JOB_PREM out number, --- 变化前职业加费 ---
                              O_DISABLE_PREM out number, --- 变化前残疾加费 ----
                              O_ERR_MSG out varchar2 --- 错误提示信息 ----
                              ) return number;

  /*
  ---- 对不需要重新计算保费的下期费用的处理 ---
  procedure p_noneed_next
  (
      I_ITEM_ID       IN  NUMBER      --- 险种选项ID ----
  );
  */
  -- calculate next due date
  function F_GET_NEXT_DUE_DATE(I_DRAW_MONTH date, -- end of month to be draw
                               I_VALIDATE_DATE date -- validate date of product
                               ) return date;

  -- 得到主险生效日
  function F_GET_MAIN_VALIDATE_DATE(I_ITEM_ID T_CONTRACT_PRODUCT.ITEM_ID%type)
    return date;

  --- 得到缴别对应月数 ---
  function F_GET_MONTHS(I_CHARGE_TYPE in number) return number;
  procedure P_UPDATE_POLICY_FEE(I_POLICY_ID T_CONTRACT_MASTER.POLICY_ID%type,
                                I_FEE_TYPE T_POLICY_FEE.FEE_TYPE%type,
                                I_DUE_TIME T_PRODUCT_FEE.DUE_TIME%type);

  -------- add by linda 20080604 续期转帐回盘成功后调逐单转实收接口 -------
  procedure P_BANK_BACK_TURN_REAL(I_POLICY_ID in number, --- 保单号码 ----
                                  O_FLAG out number --- 成功标志,-1表示转实收操作不成功 ---
                                  );

  --=========续期转实收异步处理接口 ===========
  --add by bingham.liu 20081023
  procedure P_AUTO_TURN_FOR_FINANCE_ASYNC(I_CALL_ID in number, --批处理调用ID(T_BACKGROUD_CALL.CALL_ID)
                                          O_RESULT out number, --调用结果
                                          O_LOG_INFO out varchar2 --执行时的一些日志信息
                                          );
  --- 判断是否万能期交产品,1是 ---
  function f_get_universal(I_POLICY_ID IN NUMBER --- 保单号码 ----
                           ) return NUMBER;
                             --- 保单险种下期费用汇总 ---
  procedure P_GATHER_NEXT_POLICY_ONLY(I_POLICY_ID in number, --- 保单号码 ---
                                      I_PAY_TO_DATE in date, --- 缴费日期 ---
                                      I_SUSPEND_TYPE in char, --- 处理理赔暂停(Y)，非万能、非暂停产品(N) ---
                                      I_FLAG in number --- 标志，看是否根据缴别判断---
                                      ) ;
  --- 团单转实收 ---
  procedure P_TURN_REAL_GROUP(I_POLICY_ID in number, --- 保单号码 ----
                              I_BALANCE in number, --- 单位余额 ---
                              I_PAY_TO_DATE in date, --- 应缴日期 ---
                              I_SUSPEND_TYPE in char, --- 处理理赔暂停(Y)，非万能、非暂停产品(N) ---
                              O_SCCE_FLAG out number --- 返回值 0为正确 1 无转实收保费 -1为失败 ---
                              );
  --- 得到保险公司付款银行信息 ---
  procedure P_CASH_INFO(I_POLICY_ID in number, --保单ID
                        O_CASH_BANK out varchar2,
                        O_CASH_ACCOUNT out varchar2);
  --- 插入整张保单的实收保费 ---
  procedure P_POLICY_FEE(I_POLICY_ID in number, --- 保单号码 ---
                         I_FEE_TYPE in number, --- 费用的业务类型 ---
                         I_FEE_ID in number, --- 费用ID ---
                         I_PERIOD in number, --- 缴次 ---
                         I_DISCOUNT in number, --- 本次保费 ---
                         I_COMPANY in number, --- 单位保费 ---
                         I_INSURED in number, --- 被保人 ---
                         I_PAY_MODE in number, ---
                         I_CASH_BANK in varchar2,
                         I_CASH_ACCOUNT in varchar2,
                         I_RECEIV_STATUS in number);
  ------ 在T_POLICY_FEE表和T_PRODUCT_FEE表中生成续期实收记录 -----
  procedure P_INSERT_REAL_FEE(I_ITEM_ID in number, --- 保单险种ID ---
                              I_FEE_ID in number, --- 保单保费ID ---
                              I_DISTRI_DATE in date, --- 分配时间 ---
                              I_PREM in number, --- 实缴费用,只用于万能缴费产品 ---
                              I_USE_PRESENT in number, --- 用到的赠送保费 ---
                              I_PAY_MODE in number ---
                              );
                              --是否豁免
  function F_WAIVER_PERIOD(I_WAIVER_START date,
                           I_WAIVER_END date,
                           I_PAY_TO_DATE date) return boolean;

  --- 个单转实收保费 ----
  procedure P_TURN_REAL_DETAIL_COMMON_SGL(I_POLICY_ID in number, --- 保单id ---
                                          I_SUSPEND_TYPE in char, --- 处理理赔暂停(Y)，非万能、非暂停产品(N) ---
                                          I_DUE_DATE in date, --- 截至日期 ---
                                          O_SCCE_FLAG out number, --- 返回值 0为正确 -1为失败(记log),-2 余额不足 -3 险种没有找到, -4 挂应收等，不用转实收 ---
                                          O_BREAK out boolean, --- 返回值 true终止循环
                                          O_ERR_MSG out varchar2 --- 错误提示信息----
                                          );

  --- 团单转实收保费 ----
  procedure P_TURN_REAL_DETAIL_COMMON_GRP(I_POLICY_ID in number, --- 保单id ---
                                          I_SUSPEND_TYPE in char, --- 处理理赔暂停(Y)，非万能、非暂停产品(N) ---
                                          I_DUE_DATE in date, --- 截至日期 ---
                                          O_SCCE_FLAG out number, --- 返回值 0为正确 -1为失败(记log),-2 余额不足 -3 险种没有找到, -4 挂应收等，不用转实收 ---
                                          O_BREAK out boolean, --- 返回值 true终止循环
                                          O_ERR_MSG out varchar2 --- 错误提示信息----
                                          );





  -------- 保存保单前的变化 -------
  procedure P_SAVE_POLICY_PREM_CHG(I_POLICY_ID in number, --- 保单号码 ----
                                   I_RENEWAL_DATE in varchar2, --- 抽档年月 ----
                                   I_PAY_TO_DATE in date, --- 下次交费日期 ----
                                   O_SCCE_FLAG out number --- 返回值 0为正确 -1为失败 ---
                                   );


  ------ 保单缴费状态变更-----
  procedure P_POLICY_PREM_CHANGE(I_POLICY_ID in number, --- 保单ID   ---
                                 I_PREM_CHANGED in number, --- 变更后险种缴费状态 ---
                                 O_SCCE_FLAG out number --- 返回值 0为正确 -1为失败 ---
                                 );

  ------ 险种缴费状态变更-----
  procedure P_PRODUCT_PREM_CHANGE(I_ITEM_ID in number, --- 险种选项ID   ---
                                  I_DUE_DATE in date, --- 本次交费时间 ---
                                  I_PAY_TO_DATE in date, --- 下次交费时间 ---
                                  I_PREM_CHANGED in number, --- 变更后险种缴费状态 ---
                                  O_SCCE_FLAG out number --- 返回值 0为正确 -1为失败 ---
                                  );

  ------ 险种责任状态变更-----
  procedure P_PRODUCT_LIABILITY_CHANGE(I_ITEM_ID in number, --- 险种选项ID   ---
                                       I_END_CAUSE in number, --- 险种终止原因 ---
                                       I_LIABILITY_CHANGED in number, --- 变更后责任状态 ---
                                       O_SCCE_FLAG out number --- 返回值 0为正确 -1为失败 ---
                                       );

  ----- 团险重算保费 ------
  procedure P_RE_COUNT_GROUP_PRODUCT(I_ITEM_ID in number, ---
                                     I_PAY_TO_DATE in date, --- 下次交费时间 ----
                                     O_NORMAL_PREM out number, --- 变化前标准体保费 ---
                                     O_DISCOUNT_RATE out number, --- 折扣率 ---
                                     O_SCCE_FLAG out number, --- 返回值 0为正确 -1为失败 ---
                                     O_ERR_MSG out varchar2 --- 错误提示信息----
                                     );

  ----- 个险重算保费 ------
  procedure P_RE_COUNT_SING_PRODUCT(I_ITEM_ID in number, ---
                                    I_PAY_TO_DATE in date, --- 下次交费时间 ----
                                    O_NORMAL_PREM out number, --- 变化前标准体保费 ---
                                    O_DISCOUNT_RATE out number, --- 折扣率 ---
                                    O_SCCE_FLAG out number, --- 返回值 0为正确 -1为失败 ---
                                    O_ERR_MSG out varchar2 --- 错误提示信息----

                                    );

  ------ 在续期转实收保费时, 对保单进行相应的调整-----
  procedure P_ADJUST_PRODUCT(I_POLICY_ID in number,
                             I_ITEM_ID in number, --- 保单险种ID ---
                             I_PAY_TO_DATE in date, --- 下次交费日期 ----
                             I_USE_PRESENT in number, --- 赠送保费 ---
                             O_SCCE_FLAG out number --- 返回值 0为正确 -1为失败 ---
                             );
  --- 豁免保费产品在续期转实收时的特殊处理 ---
  procedure P_EXEMPT_AMOUNT_CHANGE(I_ITEM_ID in number, --- 保单险种ID ---
                                   I_PRODUCT_ID in number, --- 产品ID ---
                                   I_MASTER_ID in number, --- 主选项ID ---
                                   I_INI_TYPE in char, --- 当期缴别 ---
                                   I_RENEW_TYPE in char, --- 下期缴别 ---
                                   I_POLICY_TYPE in char) ;
  ------ 在T_POLICY_FEE表和T_PRODUCT_FEE表中生成32实收记录 -----
  procedure P_INSERT_23_FEE(I_ITEM_ID in number, --- 保单险种ID ---
                            I_FEE_ID in number, --- 保单保费ID ---
                            I_DISTRI_DATE in date, --- 分配时间 ---
                            I_PREM in number, --- 实缴费用,只用于万能缴费产品 ---
                            I_USE_PRESENT in number, --- 用到的赠送保费 ---
                            I_PAY_MODE in number, ---
                            i_change_id in number
                            );
  -- 红利转保单余额
  procedure P_BONUS_2_BALANCE(I_POLICY_ID in number, --- 保单号码 ---
                              I_DUE_DATE in date,
                              I_CHANGE_ID in number) ;

    --续期转实收并发子任务处理入口
   procedure P_TURN_REAL_FEE_PARALLEL_SUB(I_POLICY_ID NUMBER,
                                          I_OPT_ID NUMBER);
   --欠费续保接口
   procedure P_UNPAID_RENEW(I_POLICY_ID IN NUMBER,
                            O_SCCE_FLAG out number, --- 返回值 0为正确 -1为失败(记log),-2 余额不足 -3 险种没有找到, -4 挂应收等，不用转实收
                            O_ERR_MSG out varchar2 --- 错误提示信息----
                            );
   function F_Is_Leap_Year(nYear IN VARCHAR2) return number;

   procedure p_check_empandcom_fee(i_policy_id in t_contract_master.policy_id%type,
                                i_due_date in date,
                                I_SUSPEND_TYPE in char,
                                o_flag out boolean
                                );
   function F_CHECKUP_NEWPREM(I_ITEM_ID in number, --- 险种选项ID ---
                             I_WHOLE_PERIOD in char ---
                             ) return number;

 procedure p_insert_assu_noacc_list(i_policy_id in t_contract_master.policy_id%type,
                                    i_due_date in date,
                                    i_item_id t_contract_product.item_id%type
                                    );
 function f_get_comandemp_fee(I_POLICY_ID in t_contract_product.policy_id%type) return boolean;

 procedure p_update_comandemp_prem(i_item_id t_contract_product.item_id%type);

 procedure p_end_contract_product(i_item_id   in number, --保单险种表险种ID
                                  i_end_date  in date, --责任终止时间
                                  i_main_end_cause in number, --主险责任终止原因
                                  i_rider_end_cause in number, --附加险责任终止原因
                                  i_change_id in number --保全ID号
                                  );

 procedure p_stop_contract_product(i_item_id in t_contract_product.item_id%type,
                                    i_pause_date in t_contract_product.pause_date%type,
                                    i_pause_cause in t_contract_product.pause_cause%type,
                                    i_main_end_cause in t_contract_product.end_cause%type,
                                    i_rider_end_cause in t_contract_product.end_cause%type,
                                    i_policy_id in t_contract_product.policy_id%type,
                                    i_change_id in t_policy_change.change_id%type,
                                    i_insured_1 in t_contract_product.insured_1%type);

 procedure p_sub_renewal_policy(i_opt_id in number,
                                i_policy_id in number,
                                i_organ_id in number
                                );

 procedure p_renewal_policy(i_opt_id in number, ---  批处理操作流水号 ---
                           o_scce_flag out number --- 返回值 0为正确 -1为失败 ---
                           );
/*function f_check_renewal_policy(i_policy_id in number) return boolean;
 */

--处理至尊守护医疗保单的续保
procedure p_renewal_policy_4_65183(i_policy_id  in t_contract_master.policy_id%type,
                                   i_change_id  in t_policy_change.change_id%type);

procedure p_end_policy(i_policy_id in t_contract_master.policy_id%type,--保单号
                       i_change_id in t_policy_change.change_id%type --保全ID号
                      );
function f_is_change_liability(i_policy_id in number,i_change_id in number) return boolean;

 procedure p_create_fee23(i_policy_id      in t_contract_master.policy_id%type,
                          i_change_id     in t_policy_change.change_id%type,
                          i_period        in t_contract_product.policy_period%type,
                          i_discount_prem in t_contract_product.discount_prem%type,
                          i_company_prem  in t_contract_product.company_prem%type,
                          i_employee_prem in t_contract_product.employee_prem%type,
                          i_insured_id    in t_contract_product.insured_1%type,
                          i_cash_bank     in t_policy_fee.cash_bank%type,
                          i_cash_account  in t_policy_fee.cash_account%type,
                          i_pay_to_date   in t_contract_product.pay_to_date%type,
                          i_suspend_type  in char);

  --- 插入整张保单的实收保费 ---
  procedure P_POLICY_FEE(I_POLICY_ID in number, --- 保单号码 ---
                         I_FEE_TYPE in number, --- 费用的业务类型 ---
                         I_FEE_ID in number, --- 费用ID ---
                         I_PERIOD in number, --- 缴次 ---
                         I_DISCOUNT in number, --- 本次保费 ---
                         I_COMPANY in number, --- 单位保费 ---
                         I_EMPLOYEE in number, --- 个人保费 ---
                         I_INSURED in number, --- 被保人 ---
                         I_PAY_MODE in number, ---
                         I_CASH_BANK in varchar2,
                         I_CASH_ACCOUNT in varchar2,
                         I_RECEIV_STATUS in number);

 ------ T_PRODUCT_FEE表中生成23实收记录 -----
  procedure P_INSERT_23_FEE(I_ITEM_ID in number, --- 保单险种ID ---
                            I_FEE_ID in number, --- 保单保费ID ---
                            I_DISTRI_DATE in date, --- 分配时间 ---
                            I_PREM in number, --- 实缴费用,只用于万能缴费产品 ---
                            I_COMPANY in number,
                            I_EMPLOYEE in number,
                            I_USE_PRESENT in number, --- 用到的赠送保费 ---
                            I_PAY_MODE in number, ---
                            i_change_id in number
                            );

  --- 团险逐单转实收 ---
  procedure P_TURN_REAL_GROUP_FOR_SINGLE(I_POLICY_ID in number, --- 保单ID----
                                         I_BALANCE in number, --- 单位余额 ---
                                         I_PAY_TO_DATE in date, --- 应缴日期 ---
                                         I_SUSPEND_TYPE in char, --- 处理理赔暂停(Y)，非万能、非暂停产品(N) ---
                                         O_SCCE_FLAG out number --- 返回值 0为正确 1 无转实收保费 -1为失败 ---
                                         );
  function f_fee_enough_for_single(i_policy_id    in t_contract_master.policy_id%type,
                                   i_due_date     in date,
                                   i_insured_id   in t_contract_product.insured_1%type,
                                   i_suspend_type in char)
                                   return boolean;

  function f_get_product_suspend(i_item_id in number) return char;

  function f_is_special_product(i_policy_id t_contract_master.policy_id%type) return number;
     -- 得到主险生效日
  function F_GET_MAIN_VALIDATE_DATE_NEW(I_ITEM_ID T_CONTRACT_PRODUCT.ITEM_ID%type)
    return date;

  function f_fee_enough_for_insured(i_policy_id    in t_contract_master.policy_id%type,
                                    i_due_date     in date,
                                    i_insured_id   in t_contract_product.insured_1%type,
                                    i_suspend_type in char,
                                    i_perion_prem  in t_contract_master.balance_prem%type)
                                   return boolean;

  function f_get_policy_perion_prem(i_policy_id    in t_contract_master.policy_id%type,
                                    i_due_date     in date,
                                    i_suspend_type in char) return number;
  --判断是否附加安心呵护四款附加险
  function f_is_anxin_policy(i_policy_id t_contract_master.policy_id%type
                         )return boolean;
procedure p_update_renbaofu_prem( I_POLICY_ID 	   in number,
                                   I_PRODUCT_ID	   in number,
                                   I_CHARGE_TYPE 	 in number,
                                   I_ISSUE_FEE     in number,
                                   I_GST           in number,
                                   I_YRT           in number,
                                   I_AMOUNT        in  out number,
                                   I_NORMAL_PREM   in  out number,
                                   I_PURE_PREM     in  out number,
                                   I_TABLE_PREM    in  out number,
                                   I_PERIOD_PREM   in  out number,
                                   I_NORMAL_STAND  in  out number,
                                   I_POLICY_STAND  in  out number,
                                   I_TAX_STAND     in  out number,
                                   I_YRT_STAND     in  out number);

function f_is_special_waiver_product(I_ITEM_ID   t_contract_product.item_id%type
                                     )return boolean;
   --获取特殊豁免险保额
  function f_get_rbf_amount(i_amount number,
                            i_item_id   t_contract_product.item_id%type
                            )return number;
  function F_GROUP_COMM_NEED_RENEW(I_POLICY_ID   in number,
                                 I_PAY_TO_DATE in date,
                                 I_SUSPEND_TYPE in char --- 处理理赔暂停(Y)，非万能、非暂停产品(N) ---
                                 ) return boolean;
    --产生公共保费的实收
  procedure P_CREAT_COMMON_REAL_FEE(I_GROUP_POLICY_ID in number, --保单ID
                                    I_FEE_ID          in number, --- 费用ID ---
                                    I_CHANGE_ID       in number, --- 保全ID ---
                                    I_CASH_BANK       in T_POLICY_FEE.CASH_BANK%type, --付款银行
                                    I_CASH_ACCOUNT    in T_POLICY_FEE.CASH_ACCOUNT%type, --付款账户
                                    I_FEE_TYPE        in T_POLICY_FEE.FEE_TYPE%type);

  function f_is_drawable_product(i_item_id   t_contract_product.item_id%type
                                     )return boolean;
  --税延特殊处理续期费用记录
procedure P_TDP_DISPOSAL_RELA_FEE(M_FEE_ID IN T_POLICY_FEE.FEE_ID%TYPE,
                                  I_POLICY_ID IN T_POLICY.POLICY_ID%TYPE,
                                  I_CHANGE_ID IN T_POLICY_CHANGE.CHANGE_ID%TYPE);
--税延特殊处理续期账户费用记录
procedure P_TDP_DISPOSAL_ACCOUNT_FEE(I_POLICY_ID IN T_POLICY.POLICY_ID%TYPE,
                                     I_CHANGE_ID IN T_POLICY_CHANGE.CHANGE_ID%TYPE,
                                     I_DUE_DATE IN DATE);

procedure p_update_master_prem(i_policy_id in number,
                               i_due_time in date,
                               i_comm_prem in t_group_product.comm_prem%type);

-- XXX  手工补充的声明 XXX--
--- 逐单转实收保费 ----
  procedure P_TURN_REAL_DETAIL_COMMON(I_POLICY_ID in number, --- 保单id ---
                                      I_SUSPEND_TYPE in char, --- 处理理赔暂停(Y)，非万能、非暂停产品(N) ---
                                      I_DUE_DATE in date, --- 截至日期 ---
                                      O_SCCE_FLAG out number, --- 返回值 0为正确 -1为失败(记log),-2 余额不足 -3 险种没有找到, -4 挂应收等，不用转实收 -5保单服务人员未分配 ---
                                      O_BREAK out boolean, --- 返回值 true终止循环
                                      O_ERR_MSG out varchar2 --- 错误提示信息----
                                      );

    -------- 批次转实收保费(后台批处理接口)(并发处理、任务分配) -------
  procedure P_TURN_REAL_FEE_PARALLEL_DISTR(I_OPT_ID in number, ---  批处理操作流水号 ---
                            O_SCCE_FLAG out number --- 返回值 0为正确 -1为失败 ---
                            );
end PKG_LIFE_RENEW;

