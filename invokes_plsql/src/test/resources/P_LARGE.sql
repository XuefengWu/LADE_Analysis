create or replace package PKG_LS_CLM_ACCUMU is

  -- Author  : DAMON.ZHANG
  -- Created : 2004-11-23 10:13:11
  -- Purpose :
    --责任到达年龄
  PROCEDURE P_RELATIVITY_DUTY_EVE_AGE(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                                          I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                                          O_RET_STATUS out number,                         -- 退出状态
                                          O_CALC_AMOUNT out varchar2                       -- 理算结果
                                 );
  procedure ACCUTOR_FORMULA_JD1(I_CASE_ID     in number, --caseId
                                I_ITEM_ID     in number, --ItemId
                                I_LIAB_ID     in number, --责任Id
                                I_PARAM1      in number, --参数1
                                I_PARAM2      in number, --参数2
                                O_PARAM_VALUE out number);

  procedure ACCUTOR_FORMULA_JD2(I_CASE_ID     in number, --caseId
                                I_ITEM_ID     in number, --ItemId
                                I_LIAB_ID     in number, --责任Id
                                I_PARAM1      in number, --参数1
                                I_PARAM2      in number, --参数2
                                O_PARAM_VALUE out number);

  procedure ACCUTOR_FORMULA_JD3(I_CASE_ID     in number, --caseId
                                I_ITEM_ID     in number, --ItemId
                                I_LIAB_ID     in number, --责任Id
                                I_PARAM1      in number, --参数1
                                I_PARAM2      in number, --参数2
                                O_PARAM_VALUE out number);

  procedure ACCUTOR_FORMULA_JD4(I_CASE_ID     in number, --caseId
                                I_ITEM_ID     in number, --ItemId
                                I_LIAB_ID     in number, --责任Id
                                I_PARAM1      in number, --参数1
                                I_PARAM2      in number, --参数2
                                O_PARAM_VALUE out number);

  procedure ACCUTOR_FORMULA_JD5(I_CASE_ID     in number, --caseId
                                I_ITEM_ID     in number, --ItemId
                                I_LIAB_ID     in number, --责任Id
                                I_PARAM1      in number, --参数1
                                I_PARAM2      in number, --参数2
                                O_PARAM_VALUE out number);

  procedure ACCUTOR_FORMULA_JD6(I_CASE_ID     in number, --caseId
                                I_ITEM_ID     in number, --ItemId
                                I_LIAB_ID     in number, --责任Id
                                I_PARAM1      in number, --参数1
                                I_PARAM2      in number, --参数2
                                O_PARAM_VALUE out number);

  procedure ACCUTOR_FORMULA_JD7(I_CASE_ID     in number, --caseId
                                I_ITEM_ID     in number, --ItemId
                                I_LIAB_ID     in number, --责任Id
                                I_PARAM1      in number, --参数1
                                I_PARAM2      in number, --参数2
                                O_PARAM_VALUE out number);

  procedure ACCUTOR_FORMULA_JD8(I_CASE_ID     in number, --caseId
                                I_ITEM_ID     in number, --ItemId
                                I_LIAB_ID     in number, --责任Id
                                I_PARAM1      in number, --参数1
                                I_PARAM2      in number, --参数2
                                O_PARAM_VALUE out number);

  procedure ACCUTOR_FORMULA_JD9(I_CASE_ID     in number, --caseId
                                I_ITEM_ID     in number, --ItemId
                                I_LIAB_ID     in number, --责任Id
                                I_PARAM1      in number, --参数1
                                I_PARAM2      in number, --参数2
                                O_PARAM_VALUE out number);

  procedure ACCUTOR_FORMULA_JD10(I_CASE_ID     in number, --caseId
                                 I_ITEM_ID     in number, --ItemId
                                 I_LIAB_ID     in number, --责任Id
                                 I_PARAM1      in number, --参数1
                                 I_PARAM2      in number, --参数2
                                 O_PARAM_VALUE out number);

  procedure ACCUTOR_FORMULA_JD11(I_CASE_ID     in number, --caseId
                                 I_ITEM_ID     in number, --ItemId
                                 I_LIAB_ID     in number, --责任Id
                                 I_PARAM1      in number, --参数1
                                 I_PARAM2      in number, --参数2
                                 O_PARAM_VALUE out number);

  procedure ACCUTOR_FORMULA_JD12(I_CASE_ID     in number, --caseId
                                 I_ITEM_ID     in number, --ItemId
                                 I_LIAB_ID     in number, --责任Id
                                 I_PARAM1      in number, --参数1
                                 I_PARAM2      in number, --参数2
                                 O_PARAM_VALUE out number);

  procedure ACCUTOR_FORMULA_JD13(I_CASE_ID     in number, --caseId
                                 I_ITEM_ID     in number, --ItemId
                                 I_LIAB_ID     in number, --责任Id
                                 I_PARAM1      in number, --参数1
                                 I_PARAM2      in number, --参数2
                                 O_PARAM_VALUE out number);

  procedure ACCUTOR_FORMULA_JD14(I_CASE_ID     in number, --caseId
                                 I_ITEM_ID     in number, --ItemId
                                 I_LIAB_ID     in number, --责任Id
                                 I_PARAM1      in number, --参数1
                                 I_PARAM2      in number, --参数2
                                 O_PARAM_VALUE out number);

  procedure P_RELATIVITY_CALC_AGE(
                                  -- 基本参数
                                  I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                  -- 案件ID
                                  I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                  -- 险种选项ID
                                  I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                  -- 责任ID
                                  O_RET_STATUS out number,
                                  -- 退出状态
                                  O_CALC_AMOUNT out varchar2
                                  -- 理算结果
                                  );

  procedure P_RELATIVITY_CALC_NET(
                                  -- 基本参数
                                  I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                  -- 案件ID
                                  I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                  -- 险种选项ID
                                  I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                  -- 责任ID
                                  O_RET_STATUS out number,
                                  -- 退出状态
                                  O_CALC_AMOUNT out varchar2
                                  -- 理算结果
                                  );

  procedure P_RELATIVITY_CALC_BENE_LEVEL(
                                         -- 基本参数
                                         I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                         -- 案件ID
                                         I_ITEM_ID in T_CONTRACT_PRODUCT.ITEM_ID%type,
                                         -- 险种选项ID
                                         I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                         -- 责任ID
                                         O_RET_STATUS out number,
                                         -- 退出状态
                                         O_CALC_AMOUNT out varchar2
                                         -- 理算结果
                                         );

  procedure P_RELATIVITY_CALC_GENDER(
                                     -- 基本参数
                                     I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                     -- 案件ID
                                     I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                     -- 险种选项ID
                                     I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                     -- 责任ID
                                     O_RET_STATUS out number,
                                     -- 退出状态
                                     O_CALC_AMOUNT out varchar2
                                     -- 理算结果
                                     );

  procedure P_RELATIVITY_CALC_PREM_YEAR(
                                        -- 基本参数
                                        I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                        -- 案件ID
                                        I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                        -- 险种选项ID
                                        I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                        -- 责任ID
                                        O_RET_STATUS out number,
                                        -- 退出状态
                                        O_CALC_AMOUNT out varchar2
                                        -- 理算结果
                                        );

  procedure P_RELATIVITY_CALC_COVERAGE(
                                       -- 基本参数
                                       I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                       -- 案件ID
                                       I_ITEM_ID in T_CONTRACT_PRODUCT.ITEM_ID%type,
                                       -- 险种选项ID
                                       I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                       -- 责任ID
                                       O_RET_STATUS out number,
                                       -- 退出状态
                                       O_CALC_AMOUNT out varchar2
                                       -- 理算结果
                                       );

  procedure P_RELATIVITY_CALC_SERVICE_MIN(
                                          -- 基本参数
                                          I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                          -- 案件ID
                                          I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                          -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                          -- 责任ID
                                          O_RET_STATUS out number,
                                          -- 退出状态
                                          O_CALC_AMOUNT out varchar2
                                          -- 理算结果
                                          );

  procedure P_RELATIVITY_CALC_SERVICE_MAX(
                                          -- 基本参数
                                          I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                          -- 案件ID
                                          I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                          -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                          -- 责任ID
                                          O_RET_STATUS out number,
                                          -- 退出状态
                                          O_CALC_AMOUNT out varchar2
                                          -- 理算结果
                                          );

  procedure P_RELATIVITY_CALC_SURGERY_TYPE(
                                           -- 基本参数
                                           I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                           -- 案件ID
                                           I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                           -- 险种选项ID
                                           I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                           -- 责任ID
                                           O_RET_STATUS out number,
                                           -- 退出状态
                                           O_CALC_AMOUNT out varchar2
                                           -- 理算结果
                                           );

  procedure P_RELATIVITY_CALC_CHARGE_TYPE(
                                          -- 基本参数
                                          I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                          -- 案件ID
                                          I_ITEM_ID in T_CONTRACT_PRODUCT.ITEM_ID%type,
                                          -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                          -- 责任ID
                                          O_RET_STATUS out number,
                                          -- 退出状态
                                          O_CALC_AMOUNT out varchar2
                                          -- 理算结果
                                          );

  procedure P_RELATIVITY_CALC_MONEY(
                                    -- 基本参数
                                    I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                    -- 案件ID
                                    I_ITEM_ID in T_CONTRACT_PRODUCT.ITEM_ID%type,
                                    -- 险种选项ID
                                    I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                    -- 责任ID
                                    O_RET_STATUS out number,
                                    -- 退出状态
                                    O_CALC_AMOUNT out varchar2
                                    -- 理算结果
                                    );

  procedure P_RELATIVITY_CALC_ISSUE_DATE(
                                         -- 基本参数
                                         I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                         -- 案件ID
                                         I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                         -- 险种选项ID
                                         I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                         -- 责任ID
                                         O_RET_STATUS out number,
                                         -- 退出状态
                                         O_CALC_AMOUNT out varchar2
                                         -- 理算结果
                                         );

  procedure P_RELATIVITY_CALC_HOS_SPECI(
                                        -- 基本参数
                                        I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                        -- 案件ID
                                        I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                        -- 险种选项ID
                                        I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                        -- 责任ID
                                        O_RET_STATUS out number,
                                        -- 退出状态
                                        O_CALC_AMOUNT out varchar2
                                        -- 理算结果
                                        );

  procedure P_RELATIVITY_CALC_HOS_TYPE(
                                       -- 基本参数
                                       I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                       -- 案件ID
                                       I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                       -- 险种选项ID
                                       I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                       -- 责任ID
                                       O_RET_STATUS out number,
                                       -- 退出状态
                                       O_CALC_AMOUNT out varchar2
                                       -- 理算结果
                                       );

  procedure P_RELATIVITY_CALC_HOS_OWNER(
                                        -- 基本参数
                                        I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                        -- 案件ID
                                        I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                        -- 险种选项ID
                                        I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                        -- 责任ID
                                        O_RET_STATUS out number,
                                        -- 退出状态
                                        O_CALC_AMOUNT out varchar2
                                        -- 理算结果
                                        );

  procedure P_RELATIVITY_CALC_HOS_TIME(
                                       -- 基本参数
                                       I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                       -- 案件ID
                                       I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                       -- 险种选项ID
                                       I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                       -- 责任ID
                                       O_RET_STATUS out number,
                                       -- 退出状态
                                       O_CALC_AMOUNT out varchar2
                                       -- 理算结果
                                       );

  procedure P_RELATIVITY_CALC_PID_AGE_MIN(
                                          -- 基本参数
                                          I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                          -- 案件ID
                                          I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                          -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                          -- 责任ID
                                          O_RET_STATUS out number,
                                          -- 退出状态
                                          O_CALC_AMOUNT out varchar2
                                          -- 理算结果
                                          );

  procedure P_RELATIVITY_CALC_PID_AGE_MAX(
                                          -- 基本参数
                                          I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                          -- 案件ID
                                          I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                          -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                          -- 责任ID
                                          O_RET_STATUS out number,
                                          -- 退出状态
                                          O_CALC_AMOUNT out varchar2
                                          -- 理算结果
                                          );

  procedure P_RELATIVITY_CALC_EVE_AGE_MIN(
                                          -- 基本参数
                                          I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                          -- 案件ID
                                          I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                          -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                          -- 责任ID
                                          O_RET_STATUS out number,
                                          -- 退出状态
                                          O_CALC_AMOUNT out varchar2
                                          -- 理算结果
                                          );

  procedure P_RELATIVITY_CALC_EVE_AGE_MAX(
                                          -- 基本参数
                                          I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                          -- 案件ID
                                          I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                          -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                          -- 责任ID
                                          O_RET_STATUS out number,
                                          -- 退出状态
                                          O_CALC_AMOUNT out varchar2
                                          -- 理算结果
                                          );

  procedure P_RELATIVITY_CALC_ANNI_AGE_MIN(
                                           -- 基本参数
                                           I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                           -- 案件ID
                                           I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                           -- 险种选项ID
                                           I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                           -- 责任ID
                                           O_RET_STATUS out number,
                                           -- 退出状态
                                           O_CALC_AMOUNT out varchar2
                                           -- 理算结果
                                           );

  procedure P_RELATIVITY_CALC_ANNI_AGE_MAX(
                                           -- 基本参数
                                           I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                           -- 案件ID
                                           I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                           -- 险种选项ID
                                           I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                           -- 责任ID
                                           O_RET_STATUS out number,
                                           -- 退出状态
                                           O_CALC_AMOUNT out varchar2
                                           -- 理算结果
                                           );

  procedure P_RELATIVITY_CALC_MONTH_MIN(
                                        -- 基本参数
                                        I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                        -- 案件ID
                                        I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                        -- 险种选项ID
                                        I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                        -- 责任ID
                                        O_RET_STATUS out number,
                                        -- 退出状态
                                        O_CALC_AMOUNT out varchar2
                                        -- 理算结果
                                        );

  procedure P_RELATIVITY_CALC_MONTH_MAX(
                                        -- 基本参数
                                        I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                        -- 案件ID
                                        I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                        -- 险种选项ID
                                        I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                        -- 责任ID
                                        O_RET_STATUS out number,
                                        -- 退出状态
                                        O_CALC_AMOUNT out varchar2
                                        -- 理算结果
                                        );

  /*
   查找互斥责任是否已赔付
   如没有，则返回当前责任
  */
  procedure P_RELATIVITY_CALC_LIAB_MUTEX(
                                         -- 基本参数
                                         I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                         -- 案件ID
                                         I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                         -- 险种选项ID
                                         I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                         -- 责任ID
                                         O_RET_STATUS out number,
                                         -- 退出状态
                                         O_CALC_AMOUNT out varchar2
                                         -- 理算结果
                                         );
  --是否已开始领取年金
  --0-还未开始领取年金；1-已经开始领取年金
  procedure P_RELATIVITY_ANNUITY_START_PAY(
                                           -- 基本参数
                                           I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                           -- 案件ID
                                           I_ITEM_ID in T_CONTRACT_PRODUCT.ITEM_ID%type,
                                           -- 险种选项ID
                                           I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                           -- 责任ID
                                           O_RET_STATUS out number,
                                           -- 退出状态
                                           O_CALC_AMOUNT out varchar2
                                           -- 理算结果
                                           );
  --是否已开始领取生存金
  --0-还未开始领取生存金；1-已经开始领取生存金
  procedure P_RELATIVITY_INST_START_PAY(
                                           -- 基本参数
                                           I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                           -- 案件ID
                                           I_ITEM_ID in T_CONTRACT_PRODUCT.ITEM_ID%type,
                                           -- 险种选项ID
                                           I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                           -- 责任ID
                                           O_RET_STATUS out number,
                                           -- 退出状态
                                           O_CALC_AMOUNT out varchar2
                                           -- 理算结果
                                           );
  --是否是特殊疾病
  --0-非特殊疾病；1-是特殊疾病
  procedure P_RELA_IS_SPECIAL_ILLNESS(
                                           -- 基本参数
                                           I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                           -- 案件ID
                                           I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                           -- 险种选项ID
                                           I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                           -- 责任ID
                                           O_RET_STATUS out number,
                                           -- 退出状态
                                           O_CALC_AMOUNT out varchar2
                                           -- 理算结果
                                           );
  procedure P_RELA_GET_DISABLE_DATE(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type,
                                    I_ITEM_ID     in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                    I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                    O_RET_STATUS  out number,
                                    O_CALC_AMOUNT out varchar2);

  -- add a new claim relativity for DIAGNOSE_DATE
  -- add by davin.tang  2006-03-13
  procedure P_RELA_GET_DIAGNOSE_DATE(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type,
                                     I_ITEM_ID     in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                     I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                     O_RET_STATUS  out number,
                                     O_CALC_AMOUNT out varchar2);

  -- add a new claim relativity for start_date
  --入院日期距离事故发生日期天数
  -- add by REQ-1759
 procedure P_RELA_GET_ADMISSION_DATE(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type,
                                     I_ITEM_ID     in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                     I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                     O_RET_STATUS  out number,
                                     O_CALC_AMOUNT out varchar2);
  --get the annuity pay status 1--started ,2--not started
  procedure P_GET_ANNUITY_PAY_STATUS(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type,
                                     I_ITEM_ID     in T_CONTRACT_PRODUCT.ITEM_ID%type,
                                     I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                     O_RET_STATUS  out number,
                                     O_CALC_AMOUNT out varchar2);

  procedure P_CLM_ACCUTOR_G1(I_CASE_ID        in number, --caseId
                             I_ITEM_ID        in number, --ItemId
                             I_LIAB_ID        in number, --责任Id
                             I_EXPLICIT_PARAM in number, -- 显式传入参数
                             I_PARAM1         in number, --参数1
                             I_PARAM2         in number, --参数2
                             O_PARAM_VALUE    out number,
                             I_SERVICE_COUNT  in number);

  --Min{PARAM1*SA，PARAM2}
  procedure P_CLM_ACCUTOR_G2(I_CASE_ID        in number, --caseId
                             I_ITEM_ID        in number, --ItemId
                             I_LIAB_ID        in number, --责任Id
                             I_EXPLICIT_PARAM in number, -- 显式传入参数
                             I_PARAM1         in number, --参数1
                             I_PARAM2         in number, --参数2
                             O_PARAM_VALUE    out number,
                             I_SERVICE_COUNT  in number);

  --IF [MEDICAL FEE]/[DAYS]<=150
  --MAX{10%*[MEDICAL FEE],300}
  --ELSE
  --MAX{20%*[MEDICAL FEE],500}
  procedure P_CLM_ACCUTOR_G3(I_CASE_ID        in number, --caseId
                             I_ITEM_ID        in number, --ItemId
                             I_LIAB_ID        in number, --责任Id
                             I_EXPLICIT_PARAM in number, -- 显式传入参数
                             I_PARAM1         in number, --参数1
                             I_PARAM2         in number, --参数2
                             O_PARAM_VALUE    out number,
                             I_SERVICE_COUNT  in number);

  procedure P_CLM_ACCUTOR_G4(I_CASE_ID        in number, --caseId
                             I_ITEM_ID        in number, --ItemId
                             I_LIAB_ID        in number, --责任Id
                             I_EXPLICIT_PARAM in number, -- 显式传入参数
                             I_PARAM1         in number, --参数1
                             I_PARAM2         in number, --参数2
                             O_PARAM_VALUE    out number,
                             I_SERVICE_COUNT  in number);

  --return the param2
  procedure P_CLM_ACCUTOR_G5(I_CASE_ID        in number, --caseId
                             I_ITEM_ID        in number, --ItemId
                             I_LIAB_ID        in number, --责任Id
                             I_EXPLICIT_PARAM in number, -- 显式传入参数
                             I_PARAM1         in number, --参数1
                             I_PARAM2         in number, --参数2
                             O_PARAM_VALUE    out number);

  --return the PARAM1*SA
  procedure P_CLM_ACCUTOR_G6(I_CASE_ID        in number, --caseId
                             I_ITEM_ID        in number, --ItemId
                             I_LIAB_ID        in number, --责任Id
                             I_EXPLICIT_PARAM in number, -- 显式传入参数
                             I_PARAM1         in number, --参数1
                             I_PARAM2         in number, --参数2
                             O_PARAM_VALUE    out number);
  --return the medicalsave balance
  procedure P_CLM_ACCUTOR_G7(I_CASE_ID        in number, --caseId
                             I_ITEM_ID        in number, --ItemId
                             I_LIAB_ID        in number, --责任Id
                             I_EXPLICIT_PARAM in number, -- 显式传入参数
                             I_PARAM1         in number, --参数1
                             I_PARAM2         in number, --参数2
                             O_PARAM_VALUE    out number,
                             I_SERVICE_COUNT  in number);
  ---------------限额累加器用
--   procedure P_CLM_ACCUTOR_G8(I_CASE_ID        in number, --caseId
--                              I_ITEM_ID        in number, --ItemId
--                              I_LIAB_ID        in number, --责任Id
--                              I_EXPLICIT_PARAM in number, -- 显式传入参数
--                              I_PARAM1         in number, --参数1
--                              I_PARAM2         in number, --参数2
--                              O_PARAM_VALUE    out number,
--                              I_SERVICE_COUNT  in number);
  ---------------自付累加器用
--   procedure P_CLM_ACCUTOR_G9(I_CASE_ID        in number, --caseId
--                              I_ITEM_ID        in number, --ItemId
--                              I_LIAB_ID        in number, --责任Id
--                              I_EXPLICIT_PARAM in number, -- 显式传入参数
--                              I_PARAM1         in number, --参数1
--                              I_PARAM2         in number, --参数2
--                              O_PARAM_VALUE    out number,
--                              I_SERVICE_COUNT  in number);
  --add by bingham.liu 20091121
  --免赔额公式，分单险种的年免赔金额
  procedure P_CLM_ACCUTOR_G10(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number);
  --add by bingham.liu 20091121
  --自付累加器公式，，取(1-分单险种的赔付比例)做自付比例
  procedure P_CLM_ACCUTOR_G11(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number);
  --add by bingham.liu 20091121
  --免赔额公式，分单险种的次免赔金额
  procedure P_CLM_ACCUTOR_G12(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number);
  --add by bingham.liu 20091121
  --限额公式，分单险种的次限额
  procedure P_CLM_ACCUTOR_G13(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number);

  --add by bingham.liu 20091203
  --限额公式，公共保额分单限额
  procedure P_CLM_ACCUTOR_G14(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number);
  --add by bingham.liu 20091203
  --限额公式，公共保额总单限额
  procedure P_CLM_ACCUTOR_G15(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number);
  procedure P_CLM_ACCUTOR_G22(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number);

  -- 限额公式（金鼎富贵两全保险（分红型）（D款） ）
  -- added by yaofei.wang,2010-10-19
  procedure P_CLM_ACCUTOR_G23(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number);
  procedure P_CLM_ACCUTOR_G24(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number);

  -- 公共交通工具意外伤害保险（新标准版）（主附）
  -- added@2013-10-18
  -- 伤残保额和身故保额共享限额
  procedure P_CLM_ACCUTOR_G25(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number);

  -- 限额公式（PICC-50910-惠民幸福一号两全保险（分红型））
  -- added by yubin.wang,2013-12-09
  procedure P_CLM_ACCUTOR_G26(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number);


  --责任级次免赔额累加器
  procedure P_CLM_ACCUTOR_G27(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number);

  --责任级自付累加器
  procedure P_CLM_ACCUTOR_G28(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number);

  --责任级可用公共保额限额累加器
  procedure P_CLM_ACCUTOR_G29(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number);

  --责任级年免赔额累加器
  procedure P_CLM_ACCUTOR_G30(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number);

  --责任级次限额累加器
  procedure P_CLM_ACCUTOR_G31(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number);

  procedure P_CLM_ACCUTOR_G32(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number);

  procedure P_CLM_ACCUTOR_G33(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number);

   procedure P_CLM_ACCUTOR_G34(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number);

   procedure P_CLM_ACCUTOR_G35(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number);

  procedure P_CLM_ACCUTOR_G36(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number);

  procedure P_CLM_ACCUTOR_G37(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number);

  procedure P_CLM_ACCUTOR_G38(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number);

  procedure P_CLM_ACCUTOR_G39(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number);

  --return service count
  procedure P_CLM_SERVICE_CNT_G1(I_CASE_ID       in number, --caseId
                                 O_SERVICE_COUNT out number);

  procedure P_CLM_CALC_S1(I_CASE_ID       in number, --caseId
                          O_SERVICE_COUNT out number);

  procedure P_CLM_CALC_S2(I_CASE_ID       in number, --caseId
                          O_SERVICE_COUNT out number);
  procedure P_CLM_CALC_S3( -- 基本参数
                          I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                          -- 案件ID
                          I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                          -- 险种选项ID
                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                          -- 责任ID
                          -- 显式传入参数
                          I_EXPLICIT_PARAM in number,
                          -- 天数/周数 etc. 与表定津贴的周期相一致
                          -- 返回值
                          O_RET_STATUS out number,
                          -- 退出状态
                          O_CALC_AMOUNT out T_LIABILITY_PAY.CALCU_AMOUNT%type,
                          -- 理算结果
                          O_EXCEPT_ACCU out T_LIABILITY_PAY.EXCEPT_ACCU%type
                          -- 免赔额
                          ) ;
  procedure P_RELATIVITY_CALC_GET_DATE(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type,
                                       I_ITEM_ID     in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                       I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                       O_RET_STATUS  out number,
                                       O_CALC_AMOUNT out varchar2);
  --return days between policy inception date and event date
  procedure P_RELA_CALC_DAYS_AF_INCEP(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type,
                                      I_ITEM_ID     in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                      I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                      O_RET_STATUS  out number,
                                      O_CALC_AMOUNT out varchar2);
  --可续保产品 return days between policy inception date and event date
  procedure P_RELA_CALC_DAYS_AF_INCEP2(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type,
                                      I_ITEM_ID     in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                      I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                      O_RET_STATUS  out number,
                                      O_CALC_AMOUNT out varchar2);
  /*计算保单月份
  如果做过复效，则从复效日期开始计算，没有做过复效，则从生效日期开始计算
  created in 20081201
  created by kelvin.li
  */
  procedure P_RELATIVITY_CALC_MONTH(
                                    -- 基本参数
                                    I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                    -- 案件ID
                                    I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                    -- 险种选项ID
                                    I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                    -- 责任ID
                                    O_RET_STATUS out number,
                                    -- 退出状态
                                    O_CALC_AMOUNT out varchar2
                                    -- 理算结果
                                    );

  PROCEDURE P_CALCULATOR_P1(I_CASE_ID          IN NUMBER, --caseId
                            I_ITEM_ID          IN NUMBER, --ItemId
                            I_LIAB_ID          IN NUMBER, --责任Id
                            I_ACCUTOR_PARAM_ID IN NUMBER, -- 参数ID
                            I_SERVICE_COUNT    IN NUMBER,
                            I_INPUT_AMOUNT     IN NUMBER,
                            O_PARAM_VALUE      OUT NUMBER);
  PROCEDURE P_CALCULATOR_P2(I_CASE_ID          IN NUMBER, --caseId
                            I_ITEM_ID          IN NUMBER, --ItemId
                            I_LIAB_ID          IN NUMBER, --责任Id
                            I_ACCUTOR_PARAM_ID IN NUMBER, -- 参数ID
                            I_SERVICE_COUNT    IN NUMBER,
                            I_INPUT_AMOUNT     IN NUMBER,
                            O_PARAM_VALUE      OUT NUMBER);

  PROCEDURE P_CALCULATOR_P3(I_CASE_ID          IN NUMBER, --caseId
                            I_ITEM_ID          IN NUMBER, --ItemId
                            I_LIAB_ID          IN NUMBER, --责任Id
                            I_ACCUTOR_PARAM_ID IN NUMBER, -- 参数ID
                            I_SERVICE_COUNT    IN NUMBER,
                            I_INPUT_AMOUNT     IN NUMBER,
                            O_PARAM_VALUE      OUT NUMBER);
--   PROCEDURE P_CALCULATOR_P4(I_CASE_ID          IN NUMBER, --caseId
--                             I_ITEM_ID          IN NUMBER, --ItemId
--                             I_LIAB_ID          IN NUMBER, --责任Id
--                             I_ACCUTOR_PARAM_ID IN NUMBER, -- 参数ID
--                             I_SERVICE_COUNT    IN NUMBER,
--                             I_INPUT_AMOUNT     IN NUMBER,
--                             O_PARAM_VALUE      OUT NUMBER);
  PROCEDURE P_CALCULATOR_P5(I_CASE_ID          IN NUMBER, --caseId
                            I_ITEM_ID          IN NUMBER, --ItemId
                            I_LIAB_ID          IN NUMBER, --责任Id
                            I_ACCUTOR_PARAM_ID IN NUMBER, -- 参数ID
                            I_SERVICE_COUNT    IN NUMBER,
                            I_INPUT_AMOUNT     IN NUMBER,
                            O_PARAM_VALUE      OUT NUMBER);
  PROCEDURE P_CALCULATOR_P6(I_CASE_ID          IN NUMBER, --caseId
                            I_ITEM_ID          IN NUMBER, --ItemId
                            I_LIAB_ID          IN NUMBER, --责任Id
                            I_ACCUTOR_PARAM_ID IN NUMBER, -- 参数ID
                            I_SERVICE_COUNT    IN NUMBER,
                            I_INPUT_AMOUNT     IN NUMBER,
                            O_PARAM_VALUE      OUT NUMBER);
--   PROCEDURE P_CALCULATOR_P7(I_CASE_ID          IN NUMBER, --caseId
--                             I_ITEM_ID          IN NUMBER, --ItemId
--                             I_LIAB_ID          IN NUMBER, --责任Id
--                             I_ACCUTOR_PARAM_ID IN NUMBER, -- 参数ID
--                             I_SERVICE_COUNT    IN NUMBER,
--                             I_INPUT_AMOUNT     IN NUMBER,
--                             O_PARAM_VALUE      OUT NUMBER);
--   PROCEDURE P_CALCULATOR_P8(I_CASE_ID          IN NUMBER, --caseId
--                             I_ITEM_ID          IN NUMBER, --ItemId
--                             I_LIAB_ID          IN NUMBER, --责任Id
--                             I_ACCUTOR_PARAM_ID IN NUMBER, -- 参数ID
--                             I_SERVICE_COUNT    IN NUMBER,
--                             I_INPUT_AMOUNT     IN NUMBER,
--                             O_PARAM_VALUE      OUT NUMBER);
--   PROCEDURE P_CALCULATOR_P9(I_CASE_ID          IN NUMBER, --caseId
--                             I_ITEM_ID          IN NUMBER, --ItemId
--                             I_LIAB_ID          IN NUMBER, --责任Id
--                             I_ACCUTOR_PARAM_ID IN NUMBER, -- 参数ID
--                             I_SERVICE_COUNT    IN NUMBER,
--                             I_INPUT_AMOUNT     IN NUMBER,
--                             O_PARAM_VALUE      OUT NUMBER);
  PROCEDURE P_CALCULATOR_P11(I_CASE_ID          IN NUMBER, --caseId
                             I_ITEM_ID          IN NUMBER, --ItemId
                             I_LIAB_ID          IN NUMBER, --责任Id
                             I_ACCUTOR_PARAM_ID IN NUMBER, -- 参数ID
                             I_SERVICE_COUNT    IN NUMBER,
                             I_INPUT_AMOUNT     IN NUMBER,
                             O_PARAM_VALUE      OUT NUMBER);
  PROCEDURE P_CALCULATOR_P12(I_CASE_ID          IN NUMBER, --caseId
                             I_ITEM_ID          IN NUMBER, --ItemId
                             I_LIAB_ID          IN NUMBER, --责任Id
                             I_ACCUTOR_PARAM_ID IN NUMBER, -- 参数ID
                             I_SERVICE_COUNT    IN NUMBER,
                             I_INPUT_AMOUNT     IN NUMBER,
                             O_PARAM_VALUE      OUT NUMBER);
  PROCEDURE P_CALCULATOR_P13(I_CASE_ID          IN NUMBER, --caseId
                             I_ITEM_ID          IN NUMBER, --ItemId
                             I_LIAB_ID          IN NUMBER, --责任Id
                             I_ACCUTOR_PARAM_ID IN NUMBER, -- 参数ID
                             I_SERVICE_COUNT    IN NUMBER,
                             I_INPUT_AMOUNT     IN NUMBER,
                             O_PARAM_VALUE      OUT NUMBER);
  -- get plan on the accident date
--   FUNCTION F_GET_PLAN_NUM(I_CASE_ID IN NUMBER, --caseId
--                           I_ITEM_ID IN NUMBER) --ItemId
--    RETURN VARCHAR2;
  /*取事故日期时的产品缴费状态*/
  PROCEDURE P_RELA_GET_PREM_STATUS(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type,
                                   I_ITEM_ID     in T_CONTRACT_PRODUCT.ITEM_ID%type,
                                   I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                   O_RET_STATUS  out number,
                                   O_CALC_AMOUNT out varchar2);
  /*取案件是否在等待期内*/
  PROCEDURE P_RELA_IS_ELIMINATION_PERIOD(I_CASE_ID               IN T_CLAIM_CASE.CASE_ID%type,
                                         I_ITEM_ID               IN T_POLICY_PRODUCT_EXT.ITEM_ID%type,
                                         I_LIAB_ID               IN T_PRODUCT_LIABILITY.LIAB_ID%type,
                                         O_RET_STATUS            OUT NUMBER,
                                         O_IS_ELIMINATION_PERIOD OUT VARCHAR2);
 /*取案件是否在等待期内*/
  PROCEDURE P_RELA_IS_ELIMINATION_PERIOD1(I_CASE_ID               IN T_CLAIM_CASE.CASE_ID%type,
                                         I_ITEM_ID               IN T_POLICY_PRODUCT_EXT.ITEM_ID%type,
                                         I_LIAB_ID               IN T_PRODUCT_LIABILITY.LIAB_ID%type,
                                         O_RET_STATUS            OUT NUMBER,
                                         O_IS_ELIMINATION_PERIOD OUT VARCHAR2);
  /*取案件是否在等待期内通用方法*/
  PROCEDURE P_ELIMINATION_PERIOD_COMMON(I_CASE_ID               IN T_CLAIM_CASE.CASE_ID%type,
                                         I_ITEM_ID               IN T_POLICY_PRODUCT_EXT.ITEM_ID%type,
                                         I_LIAB_ID               IN T_PRODUCT_LIABILITY.LIAB_ID%type,
                                         I_TIME                  IN DATE,--事故，全残，身故时间
                                         O_RET_STATUS            OUT NUMBER,
                                         O_IS_ELIMINATION_PERIOD OUT VARCHAR2);

  /*取案件是否在等待期(30)内通用方法*/
  PROCEDURE P_ELIMINATION_COMMON(I_CASE_ID               IN T_CLAIM_CASE.CASE_ID%type,
                                         I_ITEM_ID               IN T_POLICY_PRODUCT_EXT.ITEM_ID%type,
                                         I_LIAB_ID               IN T_PRODUCT_LIABILITY.LIAB_ID%type,
                                         I_TIME                  IN DATE,--事故，全残，身故时间
                                         O_RET_STATUS            OUT NUMBER,
                                         O_IS_ELIMINATION_PERIOD OUT VARCHAR2);

  /*取责任是否在等待期内通用方法*/
  PROCEDURE P_ELI_PERIOD_LIAB_COMMON(I_CASE_ID               IN T_CLAIM_CASE.CASE_ID%type,
                                             I_ITEM_ID               IN T_POLICY_PRODUCT_EXT.ITEM_ID%type,
                                             I_LIAB_ID               IN T_PRODUCT_LIABILITY.LIAB_ID%type,
                                             I_TIME                  IN DATE,--事故，全残，身故时间
                                             O_RET_STATUS            OUT NUMBER,
                                             O_IS_ELIMINATION_PERIOD OUT VARCHAR2);
  --等待期--身故
  PROCEDURE P_RELA_IS_ELI_PERIOD_DEATH(I_CASE_ID               IN T_CLAIM_CASE.CASE_ID%type,
                                         I_ITEM_ID               IN T_POLICY_PRODUCT_EXT.ITEM_ID%type,
                                         I_LIAB_ID               IN T_PRODUCT_LIABILITY.LIAB_ID%type,
                                         O_RET_STATUS            OUT NUMBER,
                                         O_IS_ELIMINATION_PERIOD OUT VARCHAR2);
 --是否连续投保
 procedure P_RELATIVITY_CALC_LIABILITY(
                                          -- 基本参数
                                          I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                          -- 案件ID
                                          I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                          -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                          -- 责任ID
                                          O_RET_STATUS out number,
                                          -- 退出状态
                                          O_LIABILITY_Relevant out varchar2 );

  --等待期--全残
  PROCEDURE P_RELA_IS_ELI_PERIOD_DISABLE(I_CASE_ID               IN T_CLAIM_CASE.CASE_ID%type,
                                         I_ITEM_ID               IN T_POLICY_PRODUCT_EXT.ITEM_ID%type,
                                         I_LIAB_ID               IN T_PRODUCT_LIABILITY.LIAB_ID%type,
                                         O_RET_STATUS            OUT NUMBER,
                                         O_IS_ELIMINATION_PERIOD OUT VARCHAR2);
  --等待期--首次确诊日
  PROCEDURE P_RELA_IS_ELI_PERIOD_DIAGNOSE(I_CASE_ID               IN T_CLAIM_CASE.CASE_ID%type,
                                          I_ITEM_ID               IN T_POLICY_PRODUCT_EXT.ITEM_ID%type,
                                          I_LIAB_ID               IN T_PRODUCT_LIABILITY.LIAB_ID%type,
                                          O_RET_STATUS            OUT NUMBER,
                                          O_IS_ELIMINATION_PERIOD OUT VARCHAR2);
  --等待期--首次确诊日(固定为30天，如为连续投保，则不受等待期限制)
  PROCEDURE P_RELA_IS_ELI_PERIOD_DIAGNOSE1(I_CASE_ID               IN T_CLAIM_CASE.CASE_ID%type,
                                          I_ITEM_ID               IN T_POLICY_PRODUCT_EXT.ITEM_ID%type,
                                          I_LIAB_ID               IN T_PRODUCT_LIABILITY.LIAB_ID%type,
                                          O_RET_STATUS            OUT NUMBER,
                                          O_IS_ELIMINATION_PERIOD OUT VARCHAR2);

    --等待期--全残(固定为30天，如为连续投保，则不受等待期限制)
  PROCEDURE P_RELA_IS_ELI_PERIOD_DISABLE1(I_CASE_ID               IN T_CLAIM_CASE.CASE_ID%type,
                                          I_ITEM_ID               IN T_POLICY_PRODUCT_EXT.ITEM_ID%type,
                                          I_LIAB_ID               IN T_PRODUCT_LIABILITY.LIAB_ID%type,
                                          O_RET_STATUS            OUT NUMBER,
                                          O_IS_ELIMINATION_PERIOD OUT VARCHAR2);

  --等待期--死亡(固定为30天，如为连续投保，则不受等待期限制)
  PROCEDURE P_RELA_IS_ELI_PERIOD_DEATH1(I_CASE_ID               IN T_CLAIM_CASE.CASE_ID%type,
                                          I_ITEM_ID               IN T_POLICY_PRODUCT_EXT.ITEM_ID%type,
                                          I_LIAB_ID               IN T_PRODUCT_LIABILITY.LIAB_ID%type,
                                          O_RET_STATUS            OUT NUMBER,
                                          O_IS_ELIMINATION_PERIOD OUT VARCHAR2);

   --等待期--事故发生(固定为30天，如为连续投保，则不受等待期限制)
  PROCEDURE P_RELA_IS_ELI_PERIOD_ACCIDENT(I_CASE_ID               IN T_CLAIM_CASE.CASE_ID%type,
                                          I_ITEM_ID               IN T_POLICY_PRODUCT_EXT.ITEM_ID%type,
                                          I_LIAB_ID               IN T_PRODUCT_LIABILITY.LIAB_ID%type,
                                          O_RET_STATUS            OUT NUMBER,
                                          O_IS_ELIMINATION_PERIOD OUT VARCHAR2);

   --等待期--首次确诊日--责任级等待期
  PROCEDURE P_RELA_IS_ELI_PERIOD_DIA_LIAB(I_CASE_ID               IN T_CLAIM_CASE.CASE_ID%type,
                                                    I_ITEM_ID               IN T_POLICY_PRODUCT_EXT.ITEM_ID%type,
                                                    I_LIAB_ID               IN T_PRODUCT_LIABILITY.LIAB_ID%type,
                                                    O_RET_STATUS            OUT NUMBER,
                                                    O_IS_ELIMINATION_PERIOD OUT VARCHAR2);

  /*给付开始年龄或年限*/
  PROCEDURE P_RELATIVITY_CALC_PAY_AGE(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type, --caseId
                                  I_ITEM_ID     in T_CONTRACT_PRODUCT.ITEM_ID%type, --ItemId
                                  I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type, --责任Id
                                  O_RET_STATUS  out number,
                                  O_CALC_AMOUNT out varchar2);
  /*距事故日仍然生存的天数计算方法*/
  PROCEDURE P_RELA_GET_ALIVE_DATE(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type, --caseId
                                  I_ITEM_ID     in R_CONTRACT_PRODUCT.ITEM_ID%type, --ItemId
                                  I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type, --责任Id
                                  O_RET_STATUS  out number,
                                  O_CALC_AMOUNT out varchar2);
  /*身故日期距离保单生效日的天数*/
  PROCEDURE P_DAYS_BETWEEN_DEATH_AND_VALI(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type, --caseId
                                          I_ITEM_ID     in R_CONTRACT_PRODUCT.ITEM_ID%type, --ItemId
                                          I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type, --责任Id
                                          O_RET_STATUS  out number,
                                          O_CALC_AMOUNT out varchar2);
      /*全残日期距离保单生效日的天数*/
  PROCEDURE P_DAYS_BETWEEN_DISA_AND_VALI(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type, --caseId
                                          I_ITEM_ID     in R_CONTRACT_PRODUCT.ITEM_ID%type, --ItemId
                                          I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type, --责任Id
                                          O_RET_STATUS  out number,
                                          O_CALC_AMOUNT out varchar2) ;

  /*得到身故距离保单生效日或最后复效日的天数
  （金鼎富贵两全保险（分红型）（D款） ）
   added by yaofei.wang,2010-10-19 */
  PROCEDURE P_DAYS_DEATH_AND_LAST_VALID(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                                        I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                                        I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                                        O_RET_STATUS out number,                         -- 退出状态
                                        O_CALC_AMOUNT out varchar2                       -- 理算结果
                                        );
   /*得到身故距离险种生效日或最后复效日的天数*/
  PROCEDURE P_DAYS_DEATH_TO_LAST_VALID(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                                        I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                                        I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                                        O_RET_STATUS out number,                         -- 退出状态
                                        O_CALC_AMOUNT out varchar2                       -- 理算结果
                                        );

  /* 得到全残距离保单生效日或最后复效日的天数
  （金鼎富贵两全保险（分红型）（D款） ）
   added by yaofei.wang,2010-10-19 */
  PROCEDURE P_DAYS_DISABLE_AND_LAST_VALID(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                                          I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                                          O_RET_STATUS out number,                         -- 退出状态
                                          O_CALC_AMOUNT out varchar2                       -- 理算结果
                                         );

    /* 得到全残距离险种生效日或最后复效日的天数*/
  PROCEDURE P_DAYS_DISABLE_TO_LAST_VALID(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                                          I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                                          O_RET_STATUS out number,                         -- 退出状态
                                          O_CALC_AMOUNT out varchar2                       -- 理算结果
                                         );

   PROCEDURE P_DAYS_DIAGNOSE_AND_LAST_VALID(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                                          I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                                          O_RET_STATUS out number,                         -- 退出状态
                                          O_CALC_AMOUNT out varchar2                       -- 理算结果
                                         );

    /* 得到首次确诊日期距离险种生效日或最后复效日的天数*/
  PROCEDURE P_DAYS_DIAGNOSE_TO_LAST_VALID(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                                          I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                                          O_RET_STATUS out number,                         -- 退出状态
                                          O_CALC_AMOUNT out varchar2                       -- 理算结果
                                         );

  --身故日/首次确诊日时被保人的最大最小年龄
  PROCEDURE P_AGE_AT_DEATH(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type, -- 案件ID
                           I_ITEM_ID     in R_CONTRACT_PRODUCT.ITEM_ID%type, -- 险种选项ID
                           I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type, -- 责任ID
                           O_RET_STATUS  out number, -- 退出状态
                           O_CALC_AMOUNT out varchar2 -- 理算结果
                           );

   --全残日期发生时的年龄下限
   PROCEDURE P_AGE_AT_DISABLE(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                                          I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                                          O_RET_STATUS out number,                         -- 退出状态
                                          O_CALC_AMOUNT out varchar2                       -- 理算结果
                                        );
   --理算时点是否在总单生效所在保单年度内
   PROCEDURE P_YEAR_IS_INCEPTION_YEAR(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                                          I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                                          O_RET_STATUS out number,                         -- 退出状态
                                          O_CALC_AMOUNT out varchar2                       -- 理算结果
                                        );
   --是否已给付
  procedure P_RELA_LIAB_IS_PAIDED(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                                          I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                                          O_RET_STATUS out number,                         -- 退出状态
                                          O_CALC_AMOUNT out varchar2                       -- 理算结果
                                        );

  --身故日是否在年金开始领取日之前（不含当日）
  procedure P_IS_START_PAY_BEFORE_DEATH(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                                          I_ITEM_ID in T_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                                          O_RET_STATUS out number,                         -- 退出状态
                                          O_CALC_AMOUNT out varchar2                       -- 理算结果
                                        );

  --给付结束年期类型
  procedure P_PAY_END_PERIOD_TYPE(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                                          I_ITEM_ID in T_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                                          O_RET_STATUS out number,                         -- 退出状态
                                          O_CALC_AMOUNT out varchar2                       -- 理算结果
                                        );
  /*生存距离首次确诊日期的天数*/
  PROCEDURE P_DAYS_BETWEEN_ALIVE_DIAGNOSE(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type, --caseId
                                  I_ITEM_ID     in R_CONTRACT_PRODUCT.ITEM_ID%type, --ItemId
                                  I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type, --责任Id
                                  O_RET_STATUS  out number,
                                  O_CALC_AMOUNT out varchar2);

   --事故日距离新增保额生效日的天数
   PROCEDURE P_DAYS_ACCIDENT_AND_ADD_AMOUNT(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                                          I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                                          O_RET_STATUS out number,                         -- 退出状态
                                          O_CALC_AMOUNT out varchar2                       -- 理算结果
                                        );

   --身故日距离新增保额生效日的天数
   PROCEDURE P_DAYS_DEATH_AND_ADD_AMOUNT(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                                          I_ITEM_ID in T_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                                          O_RET_STATUS out number,                         -- 退出状态
                                          O_CALC_AMOUNT out varchar2                       -- 理算结果
                                        );

   --伤残鉴定日距离新增保额生效日的天数
   PROCEDURE P_DAYS_DISABLE_AND_ADD_AMOUNT(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                                          I_ITEM_ID in T_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                                          O_RET_STATUS out number,                         -- 退出状态
                                          O_CALC_AMOUNT out varchar2                       -- 理算结果
                                        );

   --首次确诊日距离新增保额生效日的天数
   PROCEDURE P_DAYS_DIAGNOSE_AND_ADD_AMOUNT(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                                          I_ITEM_ID in T_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                                          O_RET_STATUS out number,                         -- 退出状态
                                          O_CALC_AMOUNT out varchar2                       -- 理算结果
                                        );
  --个人账户保险金领取约定的年龄
  procedure P_HAS_PASSED_AGREED_AGE(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type, -- 案件ID
                                    I_ITEM_ID     in R_CONTRACT_PRODUCT.ITEM_ID%type, -- 险种选项ID
                                    I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type, -- 责任ID
                                    O_RET_STATUS  out number, -- 退出状态
                                    O_CALC_AMOUNT out varchar2 -- 理算结果
                                    );
  --责任级等待期（年度）
  procedure P_LIAB_ANNUAL_WAITING_PERIOD(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type, -- 案件ID
                                         I_ITEM_ID     in R_CONTRACT_PRODUCT.ITEM_ID%type, -- 险种选项ID
                                         I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type, -- 责任ID
                                         O_RET_STATUS  out number, -- 退出状态
                                         O_CALC_AMOUNT out varchar2 -- 理算结果
                                         );
  --身故日期距离分娩日期的最大最小天数
  PROCEDURE P_DAYS_DEATH_AND_DELIVERY(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                                          I_ITEM_ID in T_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                                          O_RET_STATUS out number,                         -- 退出状态
                                          O_CALC_AMOUNT out varchar2                       -- 理算结果
                                        );

  --首次确诊日期距离分娩日期的最大最小天数
	PROCEDURE P_DAS_DIAGNOSE_AND_CHILDBIRTH(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                                          I_ITEM_ID in T_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                                          O_RET_STATUS out number,                         -- 退出状态
                                          O_CALC_AMOUNT out varchar2                       -- 理算结果
                                        );
  --伤残鉴定日期距离分娩日期的最大最小天数
  PROCEDURE P_DAYS_DISABLE_AND_DELIVERY(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                                          I_ITEM_ID in T_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                                          O_RET_STATUS out number,                         -- 退出状态
                                          O_CALC_AMOUNT out varchar2                       -- 理算结果
                                        );
  --约定日期距离身故日期的最大最小天数（其中约定日期取理赔受理页面录入的“手术日期”）
  PROCEDURE P_DAYS_APPOINTED_AND_DEATH(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                                        I_ITEM_ID in T_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                                        I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                                        O_RET_STATUS out number,                         -- 退出状态
                                        O_CALC_AMOUNT out varchar2                        -- 理算结果
                                       );
  PROCEDURE P_PROTECTION_PLAN(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                                        I_ITEM_ID in T_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                                        I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                                        O_RET_STATUS out number,                         -- 退出状态
                                        O_CALC_AMOUNT out varchar2                        -- 理算结果
                                       );
  --事故日是否在年金开始领取日之前（不含当日）
  PROCEDURE P_IS_START_PAY_BEFORE_ACCIDENT(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type, -- 案件ID
                                           I_ITEM_ID     in T_CONTRACT_PRODUCT.ITEM_ID%type, -- 险种选项ID
                                           I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type, -- 责任ID
                                           O_RET_STATUS  out number, -- 退出状态
                                           O_CALC_AMOUNT out varchar2 -- 理算结果
                                           );
 /*首次确诊日距离保单生效日或最后复效日/上次重大疾病确诊日的最大最小天数*/
  PROCEDURE P_DAYS_BTN_FIRST_DIG_AND_VALID(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type, --caseId
                                          I_ITEM_ID     in R_CONTRACT_PRODUCT.ITEM_ID%type, --ItemId
                                          I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type, --责任Id
                                          O_RET_STATUS  out number,
                                          O_CALC_AMOUNT out varchar2);
 --是否已赔付
 function F_IS_LIAB_PAID( -- 基本参数
                         I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                         -- 案件ID
                         I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                         -- 险种选项ID
                         I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type
                         -- 责任ID
                         ) RETURN BOOLEAN;
 --获取责任配置组Id，若不存在，返回0;
 function f_get_liab_group(I_PRODUCT_ID t_product_life.product_id%type,
                           I_LIAB_ID    in T_PRODUCT_LIABILITY.LIAB_ID%type)
   RETURN T_RELA_PROD_LIAB_GROUP_CFG.group_id%type;
 --指定责任组是否已赔付
 function F_IS_LIAB_GROUP_PAID(I_CASE_ID  in T_CLAIM_CASE.CASE_ID%type,
                               I_ITEM_ID  in R_CONTRACT_PRODUCT.ITEM_ID%type,
                               I_GROUP_ID in T_RELA_PROD_LIAB_GROUP_CFG.group_id%type)
   RETURN BOOLEAN;
  --首次确诊日距离上次重大疾病确诊日
  PROCEDURE P_DAYS_DIAGNOSE_AND_LAST_DIAG(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type, -- 案件ID
                                          I_ITEM_ID     in R_CONTRACT_PRODUCT.ITEM_ID%type, -- 险种选项ID
                                          I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type, -- 责任ID
                                          O_RET_STATUS  out number, -- 退出状态
                                          O_CALC_AMOUNT out varchar2 -- 理算结果
                                          );
end PKG_LS_CLM_ACCUMU;
/
create or replace package body PKG_LS_CLM_ACCUMU is

  procedure ACCUTOR_FORMULA_JD1(I_CASE_ID     in number, --caseId
                                I_ITEM_ID     in number, --ItemId
                                I_LIAB_ID     in number, --责任Id
                                I_PARAM1      in number, --参数1
                                I_PARAM2      in number, --参数2
                                O_PARAM_VALUE out number) is
  begin
    O_PARAM_VALUE := 5000;
    null;
  end ACCUTOR_FORMULA_JD1;

  procedure ACCUTOR_FORMULA_JD2(I_CASE_ID     in number, --caseId
                                I_ITEM_ID     in number, --ItemId
                                I_LIAB_ID     in number, --责任Id
                                I_PARAM1      in number, --参数1
                                I_PARAM2      in number, --参数2
                                O_PARAM_VALUE out number) is
  begin
    O_PARAM_VALUE := 200;
    null;
  end ACCUTOR_FORMULA_JD2;

  procedure ACCUTOR_FORMULA_JD3(I_CASE_ID     in number, --caseId
                                I_ITEM_ID     in number, --ItemId
                                I_LIAB_ID     in number, --责任Id
                                I_PARAM1      in number, --参数1
                                I_PARAM2      in number, --参数2
                                O_PARAM_VALUE out number) is
  begin
    O_PARAM_VALUE := 0.3;
    null;
  end ACCUTOR_FORMULA_JD3;

  procedure ACCUTOR_FORMULA_JD4(I_CASE_ID     in number, --caseId
                                I_ITEM_ID     in number, --ItemId
                                I_LIAB_ID     in number, --责任Id
                                I_PARAM1      in number, --参数1
                                I_PARAM2      in number, --参数2
                                O_PARAM_VALUE out number) is
  begin
    O_PARAM_VALUE := 0.4;
    null;
  end ACCUTOR_FORMULA_JD4;

  procedure ACCUTOR_FORMULA_JD5(I_CASE_ID     in number, --caseId
                                I_ITEM_ID     in number, --ItemId
                                I_LIAB_ID     in number, --责任Id
                                I_PARAM1      in number, --参数1
                                I_PARAM2      in number, --参数2
                                O_PARAM_VALUE out number) is
  begin
    O_PARAM_VALUE := 500;
    null;
  end ACCUTOR_FORMULA_JD5;

  procedure ACCUTOR_FORMULA_JD6(I_CASE_ID     in number, --caseId
                                I_ITEM_ID     in number, --ItemId
                                I_LIAB_ID     in number, --责任Id
                                I_PARAM1      in number, --参数1
                                I_PARAM2      in number, --参数2
                                O_PARAM_VALUE out number) is
  begin
    O_PARAM_VALUE := 6;
    null;
  end ACCUTOR_FORMULA_JD6;

  procedure ACCUTOR_FORMULA_JD7(I_CASE_ID     in number, --caseId
                                I_ITEM_ID     in number, --ItemId
                                I_LIAB_ID     in number, --责任Id
                                I_PARAM1      in number, --参数1
                                I_PARAM2      in number, --参数2
                                O_PARAM_VALUE out number) is
  begin
    O_PARAM_VALUE := 700;
    null;
  end ACCUTOR_FORMULA_JD7;

  procedure ACCUTOR_FORMULA_JD8(I_CASE_ID     in number, --caseId
                                I_ITEM_ID     in number, --ItemId
                                I_LIAB_ID     in number, --责任Id
                                I_PARAM1      in number, --参数1
                                I_PARAM2      in number, --参数2
                                O_PARAM_VALUE out number) is
  begin
    O_PARAM_VALUE := 800;
    null;
  end ACCUTOR_FORMULA_JD8;

  procedure ACCUTOR_FORMULA_JD9(I_CASE_ID     in number, --caseId
                                I_ITEM_ID     in number, --ItemId
                                I_LIAB_ID     in number, --责任Id
                                I_PARAM1      in number, --参数1
                                I_PARAM2      in number, --参数2
                                O_PARAM_VALUE out number) is
  begin
    O_PARAM_VALUE := 900;
    null;
  end ACCUTOR_FORMULA_JD9;

  procedure ACCUTOR_FORMULA_JD10(I_CASE_ID     in number, --caseId
                                 I_ITEM_ID     in number, --ItemId
                                 I_LIAB_ID     in number, --责任Id
                                 I_PARAM1      in number, --参数1
                                 I_PARAM2      in number, --参数2
                                 O_PARAM_VALUE out number) is
  begin
    O_PARAM_VALUE := 1000;
    null;
  end ACCUTOR_FORMULA_JD10;

  procedure ACCUTOR_FORMULA_JD11(I_CASE_ID     in number, --caseId
                                 I_ITEM_ID     in number, --ItemId
                                 I_LIAB_ID     in number, --责任Id
                                 I_PARAM1      in number, --参数1
                                 I_PARAM2      in number, --参数2
                                 O_PARAM_VALUE out number) is
  begin
    O_PARAM_VALUE := 0.1;
    null;
  end ACCUTOR_FORMULA_JD11;

  procedure ACCUTOR_FORMULA_JD12(I_CASE_ID     in number, --caseId
                                 I_ITEM_ID     in number, --ItemId
                                 I_LIAB_ID     in number, --责任Id
                                 I_PARAM1      in number, --参数1
                                 I_PARAM2      in number, --参数2
                                 O_PARAM_VALUE out number) is
  begin
    O_PARAM_VALUE := 0.2;
    null;
  end ACCUTOR_FORMULA_JD12;

  procedure ACCUTOR_FORMULA_JD13(I_CASE_ID     in number, --caseId
                                 I_ITEM_ID     in number, --ItemId
                                 I_LIAB_ID     in number, --责任Id
                                 I_PARAM1      in number, --参数1
                                 I_PARAM2      in number, --参数2
                                 O_PARAM_VALUE out number) is
  begin
    O_PARAM_VALUE := 1300;
    null;
  end ACCUTOR_FORMULA_JD13;

  procedure ACCUTOR_FORMULA_JD14(I_CASE_ID     in number, --caseId
                                 I_ITEM_ID     in number, --ItemId
                                 I_LIAB_ID     in number, --责任Id
                                 I_PARAM1      in number, --参数1
                                 I_PARAM2      in number, --参数2
                                 O_PARAM_VALUE out number) is
  begin
    O_PARAM_VALUE := 1400;
    null;
  end ACCUTOR_FORMULA_JD14;

  procedure P_RELATIVITY_CALC_AGE(
                                  -- 基本参数
                                  I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                  -- 案件ID
                                  I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                  -- 险种选项ID
                                  I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                  -- 责任ID
                                  O_RET_STATUS out number,
                                  -- 退出状态
                                  O_CALC_AMOUNT out varchar2
                                  -- 理算结果
                                  ) is
  begin
    O_RET_STATUS := 0;
    select AGE_1
      into O_CALC_AMOUNT
      from R_CONTRACT_PRODUCT
     where ITEM_ID = I_ITEM_ID;
  end P_RELATIVITY_CALC_AGE;

  procedure P_RELATIVITY_CALC_NET(
                                  -- 基本参数
                                  I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                  -- 案件ID
                                  I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                  -- 险种选项ID
                                  I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                  -- 责任ID
                                  O_RET_STATUS out number,
                                  -- 退出状态
                                  O_CALC_AMOUNT out varchar2
                                  -- 理算结果
                                  ) is
  begin
    O_RET_STATUS := 0;
    select T_CLAIM_CASE.HOSPITAL_NETWORK
      into O_CALC_AMOUNT
      from T_CLAIM_CASE
     where CASE_ID = I_CASE_ID;
  end P_RELATIVITY_CALC_NET;

  procedure P_RELATIVITY_CALC_BENE_LEVEL(
                                         -- 基本参数
                                         I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                         -- 案件ID
                                         I_ITEM_ID in T_CONTRACT_PRODUCT.ITEM_ID%type,
                                         -- 险种选项ID
                                         I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                         -- 责任ID
                                         O_RET_STATUS out number,
                                         -- 退出状态
                                         O_CALC_AMOUNT out varchar2
                                         -- 理算结果
                                         ) is
  begin
    O_RET_STATUS := 0;
    select T_CONTRACT_PRODUCT.BENEFIT_LEVEL
      into O_CALC_AMOUNT
      from T_CONTRACT_PRODUCT
     where T_CONTRACT_PRODUCT.ITEM_ID = I_ITEM_ID;
  end P_RELATIVITY_CALC_BENE_LEVEL;

  procedure P_RELATIVITY_CALC_GENDER(
                                     -- 基本参数
                                     I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                     -- 案件ID
                                     I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                     -- 险种选项ID
                                     I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                     -- 责任ID
                                     O_RET_STATUS out number,
                                     -- 退出状态
                                     O_CALC_AMOUNT out varchar2
                                     -- 理算结果
                                     ) is
    V_INSURED_ID number;
  begin
    O_RET_STATUS := 0;
    select decode(NVL(TEC.GENDER,TC.GENDER), 'F', '1', 'M', '0')
      into O_CALC_AMOUNT
      from T_CLAIM_CASE TCC , R_ECIF_CUSTOMER TEC , R_CUSTOMER TC
     where TCC.ECIF_ID=TEC.ECIF_ID(+)
       AND TCC.INSURED_ID=TC.CUSTOMER_ID(+)
       AND TCC.CASE_ID = I_CASE_ID;

  end P_RELATIVITY_CALC_GENDER;

  procedure P_RELATIVITY_CALC_PREM_YEAR(
                                        -- 基本参数
                                        I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                        -- 案件ID
                                        I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                        -- 险种选项ID
                                        I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                        -- 责任ID
                                        O_RET_STATUS out number,
                                        -- 退出状态
                                        O_CALC_AMOUNT out varchar2
                                        -- 理算结果
                                        ) is
  begin
    O_RET_STATUS := 0;
    select PREMIUM_YEAR
      into O_CALC_AMOUNT
      from R_CONTRACT_PRODUCT
     where ITEM_ID = I_ITEM_ID;
  end P_RELATIVITY_CALC_PREM_YEAR;

  procedure P_RELATIVITY_CALC_COVERAGE(
                                       -- 基本参数
                                       I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                       -- 案件ID
                                       I_ITEM_ID in T_CONTRACT_PRODUCT.ITEM_ID%type,
                                       -- 险种选项ID
                                       I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                       -- 责任ID
                                       O_RET_STATUS out number,
                                       -- 退出状态
                                       O_CALC_AMOUNT out varchar2
                                       -- 理算结果
                                       ) is
  begin
    O_RET_STATUS := 0;
    select PKG_LIFE_BONUS_SUB.F_PERIOD(COVERAGE_PERIOD,
                                       COVERAGE_YEAR,
                                       AGE_1)
      into O_CALC_AMOUNT
      from T_CONTRACT_PRODUCT
     where ITEM_ID = I_ITEM_ID;
  end P_RELATIVITY_CALC_COVERAGE;

  procedure P_RELATIVITY_CALC_SERVICE_MIN(
                                          -- 基本参数
                                          I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                          -- 案件ID
                                          I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                          -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                          -- 责任ID
                                          O_RET_STATUS out number,
                                          -- 退出状态
                                          O_CALC_AMOUNT out varchar2
                                          -- 理算结果
                                          ) is
  begin
    O_RET_STATUS := 0;
    select DIAGNOSIS_COUNT
      into O_CALC_AMOUNT
      from T_CLAIM_CASE
     where CASE_ID = I_CASE_ID;
  end P_RELATIVITY_CALC_SERVICE_MIN;

  procedure P_RELATIVITY_CALC_SERVICE_MAX(
                                          -- 基本参数
                                          I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                          -- 案件ID
                                          I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                          -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                          -- 责任ID
                                          O_RET_STATUS out number,
                                          -- 退出状态
                                          O_CALC_AMOUNT out varchar2
                                          -- 理算结果
                                          ) is
  begin
    O_RET_STATUS := 0;
    select DIAGNOSIS_COUNT
      into O_CALC_AMOUNT
      from T_CLAIM_CASE
     where CASE_ID = I_CASE_ID;
  end P_RELATIVITY_CALC_SERVICE_MAX;

  procedure P_RELATIVITY_CALC_SURGERY_TYPE(
                                           -- 基本参数
                                           I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                           -- 案件ID
                                           I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                           -- 险种选项ID
                                           I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                           -- 责任ID
                                           O_RET_STATUS out number,
                                           -- 退出状态
                                           O_CALC_AMOUNT out varchar2
                                           -- 理算结果
                                           ) is
  begin
    O_RET_STATUS := 0;
    select SURGERY_TYPE
      into O_CALC_AMOUNT
      from T_CLAIM_CASE
     where CASE_ID = I_CASE_ID;
  end P_RELATIVITY_CALC_SURGERY_TYPE;

  procedure P_RELATIVITY_CALC_CHARGE_TYPE(
                                          -- 基本参数
                                          I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                          -- 案件ID
                                          I_ITEM_ID in T_CONTRACT_PRODUCT.ITEM_ID%type,
                                          -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                          -- 责任ID
                                          O_RET_STATUS out number,
                                          -- 退出状态
                                          O_CALC_AMOUNT out varchar2
                                          -- 理算结果
                                          ) is
  begin
    O_RET_STATUS := 0;
    select INITIAL_TYPE
      into O_CALC_AMOUNT
      from T_CONTRACT_PRODUCT
     where ITEM_ID = I_ITEM_ID;
  end P_RELATIVITY_CALC_CHARGE_TYPE;

  procedure P_RELATIVITY_CALC_MONEY(
                                    -- 基本参数
                                    I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                    -- 案件ID
                                    I_ITEM_ID in T_CONTRACT_PRODUCT.ITEM_ID%type,
                                    -- 险种选项ID
                                    I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                    -- 责任ID
                                    O_RET_STATUS out number,
                                    -- 退出状态
                                    O_CALC_AMOUNT out varchar2
                                    -- 理算结果
                                    ) is
  begin
    O_RET_STATUS := 0;
    select A.MONEY_ID
      into O_CALC_AMOUNT
      from T_CONTRACT_MASTER A, T_CONTRACT_PRODUCT B
     where A.POLICY_ID = B.POLICY_ID
       and B.ITEM_ID = I_ITEM_ID;
  end P_RELATIVITY_CALC_MONEY;

  procedure P_RELATIVITY_CALC_ISSUE_DATE(
                                         -- 基本参数
                                         I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                         -- 案件ID
                                         I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                         -- 险种选项ID
                                         I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                         -- 责任ID
                                         O_RET_STATUS out number,
                                         -- 退出状态
                                         O_CALC_AMOUNT out varchar2
                                         -- 理算结果
                                         ) is
  begin
    O_RET_STATUS := 0;
    select TO_CHAR(A.VALIDATE_DATE, 'yyyymmdd')
      into O_CALC_AMOUNT
      from R_CONTRACT_MASTER A, R_CONTRACT_PRODUCT B
     where A.POLICY_ID = B.POLICY_ID
       and B.ITEM_ID = I_ITEM_ID;
  end P_RELATIVITY_CALC_ISSUE_DATE;

  procedure P_RELATIVITY_CALC_HOS_SPECI(
                                        -- 基本参数
                                        I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                        -- 案件ID
                                        I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                        -- 险种选项ID
                                        I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                        -- 责任ID
                                        O_RET_STATUS out number,
                                        -- 退出状态
                                        O_CALC_AMOUNT out varchar2
                                        -- 理算结果
                                        ) is
  begin
    O_RET_STATUS := 0;
    select H.HOSPITAL_SPECI
      into O_CALC_AMOUNT
      from T_CLAIM_CASE RC, T_HOSPITAL H
     where RC.CASE_ID = I_CASE_ID
       and H.HOSPITAL_CODE = RC.HOSPITAL_CODE;
  end P_RELATIVITY_CALC_HOS_SPECI;

  procedure P_RELATIVITY_CALC_HOS_TYPE(
                                       -- 基本参数
                                       I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                       -- 案件ID
                                       I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                       -- 险种选项ID
                                       I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                       -- 责任ID
                                       O_RET_STATUS out number,
                                       -- 退出状态
                                       O_CALC_AMOUNT out varchar2
                                       -- 理算结果
                                       ) is
  begin
    O_RET_STATUS := 0;
    select H.HOSPITAL_TYPE
      into O_CALC_AMOUNT
      from T_CLAIM_CASE RC, T_HOSPITAL H
     where RC.CASE_ID = I_CASE_ID
       and H.HOSPITAL_CODE = RC.HOSPITAL_CODE;
  end P_RELATIVITY_CALC_HOS_TYPE;

  procedure P_RELATIVITY_CALC_HOS_OWNER(
                                        -- 基本参数
                                        I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                        -- 案件ID
                                        I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                        -- 险种选项ID
                                        I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                        -- 责任ID
                                        O_RET_STATUS out number,
                                        -- 退出状态
                                        O_CALC_AMOUNT out varchar2
                                        -- 理算结果
                                        ) is
  begin
    O_RET_STATUS := 0;
    select H.HOSPITAL_OWNER
      into O_CALC_AMOUNT
      from T_CLAIM_CASE RC, T_HOSPITAL H
     where RC.CASE_ID = I_CASE_ID
       and H.HOSPITAL_CODE = RC.HOSPITAL_CODE;
  end P_RELATIVITY_CALC_HOS_OWNER;

  procedure P_RELATIVITY_CALC_HOS_TIME(
                                       -- 基本参数
                                       I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                       -- 案件ID
                                       I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                       -- 险种选项ID
                                       I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                       -- 责任ID
                                       O_RET_STATUS out number,
                                       -- 退出状态
                                       O_CALC_AMOUNT out varchar2
                                       -- 理算结果
                                       ) is
  begin
    O_RET_STATUS := 0;
    select H.HOSPITAL_TIME
      into O_CALC_AMOUNT
      from T_CLAIM_CASE RC, T_HOSPITAL H
     where RC.CASE_ID = I_CASE_ID
       and H.HOSPITAL_CODE = RC.HOSPITAL_CODE;
  end P_RELATIVITY_CALC_HOS_TIME;

  procedure P_RELATIVITY_CALC_PID_AGE_MIN(
                                          -- 基本参数
                                          I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                          -- 案件ID
                                          I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                          -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                          -- 责任ID
                                          O_RET_STATUS out number,
                                          -- 退出状态
                                          O_CALC_AMOUNT out varchar2
                                          -- 理算结果
                                          ) is
  begin
    O_RET_STATUS := 0;
    select AGE_1
      into O_CALC_AMOUNT
      from R_CONTRACT_PRODUCT
     where ITEM_ID = I_ITEM_ID;
  end P_RELATIVITY_CALC_PID_AGE_MIN;

  procedure P_RELATIVITY_CALC_PID_AGE_MAX(
                                          -- 基本参数
                                          I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                          -- 案件ID
                                          I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                          -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                          -- 责任ID
                                          O_RET_STATUS out number,
                                          -- 退出状态
                                          O_CALC_AMOUNT out varchar2
                                          -- 理算结果
                                          ) is
  begin
    O_RET_STATUS := 0;
    select AGE_1
      into O_CALC_AMOUNT
      from T_CONTRACT_PRODUCT
     where ITEM_ID = I_ITEM_ID;
  end P_RELATIVITY_CALC_PID_AGE_MAX;

  procedure P_RELATIVITY_CALC_EVE_AGE_MIN(
                                          -- 基本参数
                                          I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                          -- 案件ID
                                          I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                          -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                          -- 责任ID
                                          O_RET_STATUS out number,
                                          -- 退出状态
                                          O_CALC_AMOUNT out varchar2
                                          -- 理算结果
                                          ) is
  begin
    O_RET_STATUS := 0;


    --计算事故日年龄不用365天为一年的算法，使用正常月日  modify by bingham.liu 20071109

    select ROUND(FLOOR(MONTHS_BETWEEN(ACCIDENT_TIME, NVL(TEC.BIRTHDAY,TC.BIRTHDAY)) / 12), 10)
      into O_CALC_AMOUNT
      from T_CLAIM_CASE TCC , R_ECIF_CUSTOMER TEC , R_CUSTOMER TC
     where TCC.ECIF_ID=TEC.ECIF_ID(+)
       AND TCC.INSURED_ID=TC.CUSTOMER_ID(+)
       AND TCC.CASE_ID = I_CASE_ID;

  end P_RELATIVITY_CALC_EVE_AGE_MIN;

  procedure P_RELATIVITY_CALC_EVE_AGE_MAX(
                                          -- 基本参数
                                          I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                          -- 案件ID
                                          I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                          -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                          -- 责任ID
                                          O_RET_STATUS out number,
                                          -- 退出状态
                                          O_CALC_AMOUNT out varchar2
                                          -- 理算结果
                                          ) is
  begin
    O_RET_STATUS := 0;


    --计算事故日年龄不用365天为一年的算法，使用正常月日  modify by bingham.liu 20071109

    select ROUND(FLOOR(MONTHS_BETWEEN(ACCIDENT_TIME, NVL(TEC.BIRTHDAY,TC.BIRTHDAY)) / 12), 10)
      into O_CALC_AMOUNT
      from T_CLAIM_CASE TCC , R_ECIF_CUSTOMER TEC , R_CUSTOMER TC
     where TCC.ECIF_ID=TEC.ECIF_ID(+)
       AND TCC.INSURED_ID=TC.CUSTOMER_ID(+)
       AND TCC.CASE_ID = I_CASE_ID;

  end P_RELATIVITY_CALC_EVE_AGE_MAX;
  procedure P_RELATIVITY_CALC_ANNI_AGE(
                                       -- 基本参数
                                       I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                       -- 案件ID
                                       I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                       -- 险种选项ID
                                       I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                       -- 责任ID
                                       O_RET_STATUS out number,
                                       -- 退出状态
                                       O_CALC_AMOUNT out varchar2
                                       -- 理算结果
                                       ) is
  begin
    O_RET_STATUS := 0;

    select pkg_pub_date_utils.f_convert_birthday_to_age(NVL(TEC.BIRTHDAY,ct.birthday),
                                                        pkg_ls_pub_utils.f_get_next_anni_date(cc.accident_time,
                                                                                              cm.validate_date))
      into O_CALC_AMOUNT
      from R_CONTRACT_MASTER  CM,
           T_CLAIM_CASE       CC,
           R_CONTRACT_PRODUCT CP,
           R_ECIF_CUSTOMER    TEC,
           R_CUSTOMER         CT
     where CC.CASE_ID = I_CASE_ID
       and CM.POLICY_ID = CP.POLICY_ID
       and CP.ITEM_ID = I_ITEM_ID
       AND CC.ECIF_ID = TEC.ECIF_ID(+)
       and CC.INSURED_ID = CT.CUSTOMER_ID(+);
  end P_RELATIVITY_CALC_ANNI_AGE;
  procedure P_RELATIVITY_CALC_ANNI_AGE_MIN(
                                           -- 基本参数
                                           I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                           -- 案件ID
                                           I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                           -- 险种选项ID
                                           I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                           -- 责任ID
                                           O_RET_STATUS out number,
                                           -- 退出状态
                                           O_CALC_AMOUNT out varchar2
                                           -- 理算结果
                                           ) is
  begin
    O_RET_STATUS := 0;
    /*    select ROUND((TO_DATE(TO_CHAR(CC.ACCIDENT_TIME, 'yyyy') ||
                         TO_CHAR(CM.VALIDATE_DATE, 'mmdd'),
                         'yyyymmdd') - CT.BIRTHDAY) / 365,
                10) +
          SIGN(CM.VALIDATE_DATE - TRUNC(CM.VALIDATE_DATE, 'YEAR') -
               (CC.ACCIDENT_TIME - TRUNC(CC.ACCIDENT_TIME, 'YEAR')))
     into O_CALC_AMOUNT
     from T_CONTRACT_MASTER  CM,
          T_CLAIM_CASE       CC,
          T_CONTRACT_PRODUCT CP,
          T_CUSTOMER         CT
    where CC.CASE_ID = I_CASE_ID
      and CM.POLICY_ID = CP.POLICY_ID
      and CP.ITEM_ID = I_ITEM_ID
      and CT.CUSTOMER_ID = CC.INSURED_ID;*/
    P_RELATIVITY_CALC_ANNI_AGE(I_CASE_ID,
                               I_ITEM_ID,
                               I_LIAB_ID,
                               O_RET_STATUS,
                               O_CALC_AMOUNT);
  end P_RELATIVITY_CALC_ANNI_AGE_MIN;

  procedure P_RELATIVITY_CALC_ANNI_AGE_MAX(
                                           -- 基本参数
                                           I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                           -- 案件ID
                                           I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                           -- 险种选项ID
                                           I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                           -- 责任ID
                                           O_RET_STATUS out number,
                                           -- 退出状态
                                           O_CALC_AMOUNT out varchar2
                                           -- 理算结果
                                           ) is
  begin
    O_RET_STATUS := 0;
    /*    select ROUND((TO_DATE(TO_CHAR(CC.ACCIDENT_TIME, 'yyyy') ||
                         TO_CHAR(CM.VALIDATE_DATE, 'mmdd'),
                         'yyyymmdd') - CT.BIRTHDAY) / 365,
                10) +
          SIGN(CM.VALIDATE_DATE - TRUNC(CM.VALIDATE_DATE, 'YEAR') -
               (CC.ACCIDENT_TIME - TRUNC(CC.ACCIDENT_TIME, 'YEAR')))
     into O_CALC_AMOUNT
     from T_CONTRACT_MASTER  CM,
          T_CLAIM_CASE       CC,
          T_CONTRACT_PRODUCT CP,
          T_CUSTOMER         CT
    where CC.CASE_ID = I_CASE_ID
      and CM.POLICY_ID = CP.POLICY_ID
      and CP.ITEM_ID = I_ITEM_ID
      and CT.CUSTOMER_ID = CC.INSURED_ID;*/
    P_RELATIVITY_CALC_ANNI_AGE(I_CASE_ID,
                               I_ITEM_ID,
                               I_LIAB_ID,
                               O_RET_STATUS,
                               O_CALC_AMOUNT);
  end P_RELATIVITY_CALC_ANNI_AGE_MAX;
  /*计算保单月份
  如果做过复效，则从复效日期开始计算，没有做过复效，则从生效日期开始计算
  created in 20081201
  created by kelvin.li
  */
  procedure P_RELATIVITY_CALC_MONTH(
                                    -- 基本参数
                                    I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                    -- 案件ID
                                    I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                    -- 险种选项ID
                                    I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                    -- 责任ID
                                    O_RET_STATUS out number,
                                    -- 退出状态
                                    O_CALC_AMOUNT out varchar2
                                    -- 理算结果
                                    ) is

    n_count               number := 0; --做过复效的次数
    v_max_Revalidate_date date;
    v_accident_date       date;
    v_policy_id r_contract_product.policy_id%type;
    v_accident_time t_claim_case.accident_time%type;

  begin
    select Policy_id
    into v_policy_id
    from r_contract_product cp
    where cp.item_id = I_ITEM_ID;
    select accident_time
    into v_accident_time
    from t_claim_case cc
    where cc.case_id = i_case_id;
    --- 取得做过复效的次数
    n_count := PKG_LIFE_PS_POLICY_CHANGE.F_GET_REVALIDATE_COUNT(v_policy_id, v_accident_time);
    O_RET_STATUS := 0;
    --如果做过复效，则从复效日期开始计算，没有做过复效，则从生效日期开始计算
    if n_count > 0 then
      v_max_Revalidate_date:=PKG_LIFE_PS_POLICY_CHANGE.F_GET_MAX_REVALIDATE_DATE(v_policy_id,v_accident_time);
    else
      SELECT CM.VALIDATE_DATE
      INTO v_max_Revalidate_date
      FROM R_CONTRACT_MASTER CM
      WHERE CM.POLICY_ID = V_POLICY_ID;
    end if;
    select ROUND(MONTHS_BETWEEN(cc.accident_time, v_max_Revalidate_date),2)
    into O_CALC_AMOUNT
    from T_CLAIM_CASE CC, t_claim_product cp1
    where CC.CASE_ID = I_CASE_ID
          and cc.case_id = cp1.case_id
          and cp1.ITEM_ID = I_ITEM_ID;
  end P_RELATIVITY_CALC_MONTH;
  procedure P_RELATIVITY_CALC_MONTH_MIN(
                                        -- 基本参数
                                        I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                        -- 案件ID
                                        I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                        -- 险种选项ID
                                        I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                        -- 责任ID
                                        O_RET_STATUS out number,
                                        -- 退出状态
                                        O_CALC_AMOUNT out varchar2
                                        -- 理算结果
                                        ) is
  begin
    -- O_RET_STATUS := 0;
    /*   select ROUND(MONTHS_BETWEEN(ACCIDENT_TIME, CM.VALIDATE_DATE), 2)
     into O_CALC_AMOUNT
     from T_CONTRACT_MASTER CM, T_CLAIM_CASE CC, T_CONTRACT_PRODUCT CP
    where CC.CASE_ID = I_CASE_ID
      and CM.POLICY_ID = CP.POLICY_ID
      and CP.ITEM_ID = I_ITEM_ID;*/
    P_RELATIVITY_CALC_MONTH(I_CASE_ID,
                            I_ITEM_ID,
                            I_LIAB_ID,
                            O_RET_STATUS,
                            O_CALC_AMOUNT);
  end P_RELATIVITY_CALC_MONTH_MIN;

  procedure P_RELATIVITY_CALC_MONTH_MAX(
                                        -- 基本参数
                                        I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                        -- 案件ID
                                        I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                        -- 险种选项ID
                                        I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                        -- 责任ID
                                        O_RET_STATUS out number,
                                        -- 退出状态
                                        O_CALC_AMOUNT out varchar2
                                        -- 理算结果
                                        ) is
  begin
    /*    O_RET_STATUS := 0;
    select ROUND(MONTHS_BETWEEN(ACCIDENT_TIME, CM.VALIDATE_DATE), 2)
      into O_CALC_AMOUNT
      from T_CONTRACT_MASTER CM, T_CLAIM_CASE CC, T_CONTRACT_PRODUCT CP
     where CC.CASE_ID = I_CASE_ID
       and CM.POLICY_ID = CP.POLICY_ID
       and CP.ITEM_ID = I_ITEM_ID;*/
    P_RELATIVITY_CALC_MONTH(I_CASE_ID,
                            I_ITEM_ID,
                            I_LIAB_ID,
                            O_RET_STATUS,
                            O_CALC_AMOUNT);
  end P_RELATIVITY_CALC_MONTH_MAX;

  /*
   查找互斥责任是否已赔付
   如没有，则返回当前责任
  */
  procedure P_RELATIVITY_CALC_LIAB_MUTEX(
                                         -- 基本参数
                                         I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                         -- 案件ID
                                         I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                         -- 险种选项ID
                                         I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                         -- 责任ID
                                         O_RET_STATUS out number,
                                         -- 退出状态
                                         O_CALC_AMOUNT out varchar2
                                         -- 理算结果
                                         ) is

    V_RELATIVITY varchar2(20);
    v_string     varchar2(1000);
    v_product_id number;
  begin
    O_RET_STATUS := 0;

    select product_id
      into v_product_id
      from r_contract_product cp
     where cp.item_id = I_ITEM_ID;

    select decode(r.relativity1,
                  '37',
                  'relv1_value',
                  (decode(r.relativity2,
                          '37',
                          'relv2_value',
                          (decode(r.relativity3,
                                  '37',
                                  'relv3_value',
                                  (decode(r.relativity4,
                                          '37',
                                          'relv4_value',
                                          (decode(r.relativity5,
                                                  '37',
                                                  'relv5_value',
                                                  (decode(r.relativity6,
                                                          '37',
                                                          'relv6_value',
                                                          (decode(r.relativity7,
                                                                  '37',
                                                                  'relv7_value',
                                                                  (decode(r.relativity8,
                                                                          '37',
                                                                          'relv8_value',
                                                                          '0'))))))))))))))) relativity
      INTO V_RELATIVITY
      from t_liab_pay_relative r
     where r.product_id = (select product_id
                             from r_contract_product cp
                            where cp.item_id = I_ITEM_ID)
       and r.liab_id = I_LIAB_ID;

    if V_RELATIVITY = '0' then
      O_CALC_AMOUNT := I_LIAB_ID;
    else

      /*  select to_char(nvl(min(lp.liab_id),I_LIAB_ID))
       into O_CALC_AMOUNT
       from t_liability_pay lp
          where lp.case_id = I_CASE_ID
          and  lp.item_id = I_ITEM_ID
          and lp.calcu_amount > 0
          and lp.liab_id in (
             select  V_RELATIVITY  --decode(V_RELATIVITY ,'1',a.relv1_value,a.relv3_value)
               from t_liab_pay_param a
              where a.product_id=(select product_id
                        from t_contract_product cp
                       where cp.item_id =I_ITEM_ID)
              and a.liab_id = I_LIAB_ID
              and   decode(V_RELATIVITY ,'1',a.relv1_value,a.relv3_value)  != I_LIAB_ID );
      */
      if ((v_product_id = 64829 or v_product_id = 65243) and I_LIAB_ID in (234,235)) or v_product_id = 64924 then
        O_CALC_AMOUNT := I_LIAB_ID;
      elsif v_product_id in (64804,64806) and V_RELATIVITY = 'relv1_value' then
        O_CALC_AMOUNT := I_LIAB_ID;
      else
      v_string := 'select to_char(nvl(min(lp.liab_id),:I_LIAB_ID))
     from t_liability_pay lp
        where lp.case_id = :I_CASE_ID
        and  lp.item_id = :I_ITEM_ID
        and lp.calcu_amount > 0
        and lp.liab_id in (
           select ' || V_RELATIVITY || '
             from t_liab_pay_param a
            where a.product_id=(select product_id
                      from r_contract_product cp
                     where cp.item_id =:I_ITEM_ID)
            and a.liab_id = :I_LIAB_ID
            and  ' || V_RELATIVITY || '  != :I_LIAB_ID )';
      execute immediate v_string
        into O_CALC_AMOUNT
        using I_LIAB_ID, I_CASE_ID, I_ITEM_ID, I_ITEM_ID, I_LIAB_ID, to_char(I_LIAB_ID);
      end if;

    end if;

  end P_RELATIVITY_CALC_LIAB_MUTEX;

  --是否已开始领取年金
  --0-还未开始领取年金；1-已经开始领取年金
  procedure P_RELATIVITY_ANNUITY_START_PAY(
                                           -- 基本参数
                                           I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                           -- 案件ID
                                           I_ITEM_ID in T_CONTRACT_PRODUCT.ITEM_ID%type,
                                           -- 险种选项ID
                                           I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                           -- 责任ID
                                           O_RET_STATUS out number,
                                           -- 退出状态
                                           O_CALC_AMOUNT out varchar2
                                           -- 理算结果
                                           ) is

    m_start_pay_date date;
    m_death_date     date;
    m_accident_date  date;
    m_disable_date   date;
    m_diagnose_date  date;

  begin
    O_RET_STATUS := 0;
    select tcp.start_pay_date,
           tcc.death_date,
           tcc.accident_time,
           disable_date,
           diagnose_date
      into m_start_pay_date,
           m_death_date,
           m_accident_date,
           m_disable_date,
           m_diagnose_date
      from T_CLAIM_CASE tcc, T_CONTRACT_PRODUCT tcp
     where tcc.CASE_ID = I_CASE_ID
       and tcp.ITEM_ID = I_ITEM_ID;
    O_CALC_AMOUNT := 0;
    --区分：身故日/全残日/首次确诊日
    --101-意外身故、103-疾病身故、202-意外全残、207-疾病全残
    --modify of roger.tang  增加对127特别身故的相关性获取
    if I_LIAB_ID in (101,103,127) then --意外身故、疾病身故，取身故日
      if m_death_date is null then
        p_error(-20000, 'For liablity 101 and 103, death_date in t_clai_case can not be null!');
      else
        if trunc(m_death_date) >= trunc(m_start_pay_date) then
          O_CALC_AMOUNT := 1;
        end if;
      end if;
    elsif I_LIAB_ID in (202,207) then --意外全残、疾病全残，取全残日
      if m_disable_date is null then
        p_error(-20000, 'For liablity 202 and 207, disable_date in t_clai_case can not be null!');
      else
        if trunc(m_disable_date) >= trunc(m_start_pay_date) then
          O_CALC_AMOUNT := 1;
        end if;
      end if;
    end if;
  end P_RELATIVITY_ANNUITY_START_PAY;
  ---CRDB00042425 2013.0105start
  --是否已开始领取生存金
  --0-还未开始领取生存金；1-已经开始领取生存金
  procedure P_RELATIVITY_INST_START_PAY(
                                           -- 基本参数
                                           I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                           -- 案件ID
                                           I_ITEM_ID in T_CONTRACT_PRODUCT.ITEM_ID%type,
                                           -- 险种选项ID
                                           I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                           -- 责任ID
                                           O_RET_STATUS out number,
                                           -- 退出状态
                                           O_CALC_AMOUNT out varchar2
                                           -- 理算结果
                                           ) is

    m_start_inst_date date;
    m_death_date     date;
    m_accident_date  date;
    m_disable_date   date;
    m_diagnose_date  date;

  begin
    O_RET_STATUS := 0;
    select tcp.start_inst_date,
           tcc.death_date,
           tcc.accident_time,
           disable_date,
           diagnose_date
      into m_start_inst_date,
           m_death_date,
           m_accident_date,
           m_disable_date,
           m_diagnose_date
      from T_CLAIM_CASE tcc, T_CONTRACT_PRODUCT tcp
     where tcc.CASE_ID = I_CASE_ID
       and tcp.ITEM_ID = I_ITEM_ID;
    O_CALC_AMOUNT := 0;
    --区分：身故日
    --101-意外身故、103-疾病身故
    if I_LIAB_ID in (101,103) then --意外身故、疾病身故，取身故日
      if m_death_date is null then
        p_error(-20000, 'For liablity 101 and 103, death_date in t_clai_case can not be null!');
      else
        if trunc(m_death_date) >= trunc(m_start_inst_date) then
          O_CALC_AMOUNT := 1;
        end if;
      end if;
    end if;
  end P_RELATIVITY_INST_START_PAY;
  --endCRDB00042425

  --是否是特殊疾病
  --0-非特殊疾病；1-是特殊疾病
  procedure P_RELA_IS_SPECIAL_ILLNESS(
                                           -- 基本参数
                                           I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                           -- 案件ID
                                           I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                           -- 险种选项ID
                                           I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                           -- 责任ID
                                           O_RET_STATUS out number,
                                           -- 退出状态
                                           O_CALC_AMOUNT out varchar2
                                           -- 理算结果
                                           ) is
   M_IS_SPECIAL_ILLNESS T_LIABILITY_PAY_EXT.IS_SPECIAL_ILLNESS%type; --是否是特殊疾病

  begin
    O_RET_STATUS := 0;
    --获取"是否是特殊疾病"
    select nvl(max(IS_SPECIAL_ILLNESS), 0)
      into M_IS_SPECIAL_ILLNESS
      from T_LIABILITY_PAY_EXT
     where case_id = I_CASE_ID
       and item_id = I_ITEM_ID
       and liab_id = I_LIAB_ID;
    O_CALC_AMOUNT := 0;
      if M_IS_SPECIAL_ILLNESS is null then
        p_error(-20000, ' IS_SPECIAL_ILLNESS in T_LIABILITY_PAY_EXT can not be null!');
      else
        O_CALC_AMOUNT := M_IS_SPECIAL_ILLNESS;
      end if;
  end P_RELA_IS_SPECIAL_ILLNESS;

  procedure P_RELA_GET_DISABLE_DATE(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type,
                                    I_ITEM_ID     in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                    I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                    O_RET_STATUS  out number,
                                    O_CALC_AMOUNT out varchar2) is
    M_POLICY_ID  T_CONTRACT_MASTER.POLICY_ID%TYPE;
    M_PRODUCT_ID T_PRODUCT_LIFE.PRODUCT_ID%TYPE;
  begin
    O_RET_STATUS := 0;
    select NVL(ROUND(DISABLE_DATE - ACCIDENT_TIME, 2), 9999999)
      into O_CALC_AMOUNT
      from T_CLAIM_CASE CC
     where CC.CASE_ID = I_CASE_ID;
    -- PICC_72725 投保人理赔豁免责任时，不校验伤残鉴定日期
    if O_CALC_AMOUNT = 9999999 then
      select policy_id, product_id
        into M_POLICY_ID, M_PRODUCT_ID
        from r_contract_product
       where item_id = I_ITEM_ID;
      if PKG_LIFE_PUBLIC.F_IS_HOLDER_CLAIM_POLICY(M_POLICY_ID) = 0 and
         PKG_LIFE_PUBLIC.F_IS_ZHIYING_SPECIAL_POLICY(M_POLICY_ID) = 0 and
         --REQ-851 运维282158关于65304-人保寿险附加百万畅行意外伤害住院定额给付医疗保险 伤残鉴定日期的校验问题
         --REQ-1505 运维292898 附加百万身价意外伤害住院定额给付医疗保险（B款）不校验
         M_PRODUCT_ID not in (65304,65503) then
        P_ERROR(41308, '请检查是否填写伤残鉴定日期时间');
      end if;
    end if;
  end P_RELA_GET_DISABLE_DATE;

  -- add a new claim relativity for DIAGNOSE_DATE
  -- add by davin.tang  2006-03-13
  procedure P_RELA_GET_DIAGNOSE_DATE(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type,
                                     I_ITEM_ID     in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                     I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                     O_RET_STATUS  out number,
                                     O_CALC_AMOUNT out varchar2) is
  begin
    O_RET_STATUS := 0;
    select abs(round(nvl(DIAGNOSE_DATE, ACCIDENT_TIME + 1) - ACCIDENT_TIME))
      into O_CALC_AMOUNT
      from T_CLAIM_CASE CC
     where CC.CASE_ID = I_CASE_ID;
    if O_CALC_AMOUNT = 9999999 then
      P_ERROR(41308, '请检查是否填写首次确诊时间');
    end if;
  end P_RELA_GET_DIAGNOSE_DATE;
  -- add a new claim relativity for start_date
  --入院日期距离事故发生日期天数
  -- add by REQ-1759
  procedure P_RELA_GET_ADMISSION_DATE(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type,
                                     I_ITEM_ID     in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                     I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                     O_RET_STATUS  out number,
                                     O_CALC_AMOUNT out varchar2) is
  begin
    O_RET_STATUS := 0;
    select abs(round(nvl(START_DATE, ACCIDENT_TIME + 1) - ACCIDENT_TIME))
      into O_CALC_AMOUNT
      from T_CLAIM_CASE CC
     where CC.CASE_ID = I_CASE_ID;
    if O_CALC_AMOUNT = 9999999 then
      P_ERROR(41308, '请检查是否填写入院日期');
    end if;
  end P_RELA_GET_ADMISSION_DATE;

  procedure P_GET_ANNUITY_PAY_STATUS(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type,
                                     I_ITEM_ID     in T_CONTRACT_PRODUCT.ITEM_ID%type,
                                     I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                     O_RET_STATUS  out number,
                                     O_CALC_AMOUNT out varchar2) is
  begin
    O_RET_STATUS := 0;
    select case
             when TCC.ACCIDENT_TIME >= TCP.START_PAY_DATE then
              1
             else
              2
           end
      into O_CALC_AMOUNT
      from T_CLAIM_CASE TCC, T_CONTRACT_PRODUCT TCP
     where TCC.CASE_ID = I_CASE_ID
       and TCP.ITEM_ID = I_ITEM_ID;
  end P_GET_ANNUITY_PAY_STATUS;

  procedure P_CLM_ACCUTOR_G1(I_CASE_ID        in number, --caseId
                             I_ITEM_ID        in number, --ItemId
                             I_LIAB_ID        in number, --责任Id
                             I_EXPLICIT_PARAM in number, -- 显式传入参数
                             I_PARAM1         in number, --参数1
                             I_PARAM2         in number, --参数2
                             O_PARAM_VALUE    out number,
                             I_SERVICE_COUNT  in number) is
  begin
    O_PARAM_VALUE := I_PARAM1;
  end P_CLM_ACCUTOR_G1;

  --return the param2
  procedure P_CLM_ACCUTOR_G2(I_CASE_ID        in number, --caseId
                             I_ITEM_ID        in number, --ItemId
                             I_LIAB_ID        in number, --责任Id
                             I_EXPLICIT_PARAM in number, -- 显式传入参数
                             I_PARAM1         in number, --参数1
                             I_PARAM2         in number, --参数2
                             O_PARAM_VALUE    out number,
                             I_SERVICE_COUNT  in number) is
  begin
    O_PARAM_VALUE := I_PARAM2;
  end P_CLM_ACCUTOR_G2;

  --IF [MEDICAL FEE]/[DAYS]<=150
  --MAX{10%*[MEDICAL FEE],300}
  --ELSE
  --MAX{20%*[MEDICAL FEE],500}
  procedure P_CLM_ACCUTOR_G3(I_CASE_ID        in number, --caseId
                             I_ITEM_ID        in number, --ItemId
                             I_LIAB_ID        in number, --责任Id
                             I_EXPLICIT_PARAM in number, -- 显式传入参数
                             I_PARAM1         in number, --参数1
                             I_PARAM2         in number, --参数2
                             O_PARAM_VALUE    out number,
                             I_SERVICE_COUNT  in number) is
    M_ACC_DATE       date; -- 事故发生日
    M_CALC_AMOUNT    number; -- 理算结果
    M_UNIT           number := 1; -- 购买产品的份数，也就是责任的份数
    M_BENEFIT_LEVEL  varchar2(20); -- 购买产品的档次
    M_CARD_POLICY    number;
    M_DISCOUNT       number := 1;
    M_COUNT          number;
    m_product_id     number;
    m_decision_id    number;
    m_validate_date      r_contract_product.validate_date%type;
    m_policy_year    NUMBER;
    m_card_code    varchar2(3);
    m_job_cate     number;
  begin
    -- 1、基本赔付额 = 津贴(=表定比例×SA) * 显式传入参数(天数/周数 etc.)
    -- 取得指定投保险种（保单结构）在指定时间的实际保额以及份数和档次
    select TCC.ACCIDENT_TIME -- 事故发生日期
      into M_ACC_DATE
      from T_CLAIM_CASE TCC
     where TCC.CASE_ID = I_CASE_ID;
    PKG_LIFE_UW_INTERFACE.P_GET_CONT_PROD_ACTUAL_AMOUNT(I_ITEM_ID,
                                                        M_ACC_DATE,
                                                        M_CALC_AMOUNT,
                                                        M_UNIT,
                                                        M_BENEFIT_LEVEL);
    select product_id
      into m_product_id
      from r_contract_product
     where item_id = i_item_id;
    if m_product_id in (64804,64806) and I_PARAM2 = 999 then
      m_validate_date := PKG_LIFE_DM_PRODUCT.f_get_renewal_vaildate_date(i_item_id);
      select floor(months_between(tcc.accident_time, m_validate_date) / 12) + 1
       into m_policy_year
       from t_claim_case tcc
      where case_id = i_case_id;
      m_decision_id := PKG_LIFE_DM_PRODUCT.f_get_decision_id(m_policy_year,
                                                           i_item_id);
      if m_decision_id = 1 then
        M_CALC_AMOUNT := 800000;
      else
        M_CALC_AMOUNT := 150000;
      end if;
    end if;
    -- 加上累计红利保额
    select nvl(M_CALC_AMOUNT, 0) + TCP.BONUS_SA
      into M_CALC_AMOUNT
      from R_CONTRACT_PRODUCT TCP
     where TCP.ITEM_ID = I_ITEM_ID;

    -- 安心呵护住院定额 保额计算
		if m_product_id = 65603 then
		select nvl(TCC.death_date,M_ACC_DATE) -- 身故日
      into M_ACC_DATE
      from T_CLAIM_CASE TCC
     where TCC.CASE_ID = I_CASE_ID;
		select nvl(TCC.disable_date,M_ACC_DATE) -- 伤残鉴定日
      into M_ACC_DATE
      from T_CLAIM_CASE TCC
     where TCC.CASE_ID = I_CASE_ID;
		end if;
		if m_product_id = 65605 then
     select nvl(TCC.diagnose_date,M_ACC_DATE) -- 首次确诊日
      into M_ACC_DATE
      from T_CLAIM_CASE TCC
     where TCC.CASE_ID = I_CASE_ID;
		end if;
    PKG_LIFE_PREM_CLAIM_INTERFACE.P_GET_ANXIN_PRO_AMOUNT(I_ITEM_ID,M_ACC_DATE,M_CALC_AMOUNT);
    M_CARD_POLICY:=PKG_LIFE_NEWBIZ_PKG.F_IS_CARD_POLICY(M_CARD_CODE);
    -- 卡折，根据职业不同，则保额做不同的打折处理
    if (M_CARD_POLICY > 0) then
      SELECT
      substr(cm.apply_code, -3),
      Pkg_Life_Ps_Public_Prod_Help.f_Get_Job_Class_By_Job_Cate(cp.item_id, cp.Job_Cate_1)
      INTO m_card_code, m_job_cate
      FROM t_contract_master cm, t_contract_product cp
      WHERE cm.policy_id = cp.policy_id
      AND cp.item_id = I_ITEM_ID;
      M_COUNT := PKG_LIFE_NEWBIZ_PKG.F_EXISTS_JOB_DISCOUNT(m_card_code, m_job_cate);
      if (M_COUNT > 0) then
        M_DISCOUNT := PKG_LIFE_NEWBIZ_PKG.F_JOB_DISCOUNT_VALUE(m_card_code, m_job_cate);
      end if;
      M_CALC_AMOUNT := M_CALC_AMOUNT * M_DISCOUNT;
    end if;
    O_PARAM_VALUE := I_PARAM1 * M_CALC_AMOUNT;
  end P_CLM_ACCUTOR_G3;

  -- need implement
  procedure P_CLM_ACCUTOR_G4(I_CASE_ID        in number, --caseId
                             I_ITEM_ID        in number, --ItemId
                             I_LIAB_ID        in number, --责任Id
                             I_EXPLICIT_PARAM in number, -- 显式传入参数
                             I_PARAM1         in number, --参数1
                             I_PARAM2         in number, --参数2
                             O_PARAM_VALUE    out number,
                             I_SERVICE_COUNT  in number) is
  begin
    O_PARAM_VALUE := I_PARAM1 * I_SERVICE_COUNT;
  end P_CLM_ACCUTOR_G4;

  --return the param1
  procedure P_CLM_ACCUTOR_G5(I_CASE_ID        in number, --caseId
                             I_ITEM_ID        in number, --ItemId
                             I_LIAB_ID        in number, --责任Id
                             I_EXPLICIT_PARAM in number, -- 显式传入参数
                             I_PARAM1         in number, --参数1
                             I_PARAM2         in number, --参数2
                             O_PARAM_VALUE    out number) is
  begin
    O_PARAM_VALUE := I_PARAM2;
  end P_CLM_ACCUTOR_G5;

  procedure P_CLM_ACCUTOR_G6(I_CASE_ID        in number, --caseId
                             I_ITEM_ID        in number, --ItemId
                             I_LIAB_ID        in number, --责任Id
                             I_EXPLICIT_PARAM in number, -- 显式传入参数
                             I_PARAM1         in number, --参数1
                             I_PARAM2         in number, --参数2
                             O_PARAM_VALUE    out number) is
  begin
    O_PARAM_VALUE := I_PARAM2;
  end P_CLM_ACCUTOR_G6;
  --return the medicalsave balance
  procedure P_CLM_ACCUTOR_G7(I_CASE_ID        in number, --caseId
                             I_ITEM_ID        in number, --ItemId
                             I_LIAB_ID        in number, --责任Id
                             I_EXPLICIT_PARAM in number, -- 显式传入参数
                             I_PARAM1         in number, --参数1
                             I_PARAM2         in number, --参数2
                             O_PARAM_VALUE    out number,
                             I_SERVICE_COUNT  in number) is

  begin
    O_PARAM_VALUE := 0;
    select pkg_life_account_main.F_GET_ACC_VALUE(I_ITEM_ID, accident_time)
      into O_PARAM_VALUE
      from t_claim_case
     where case_id = I_CASE_ID;
  end;
  ---------------限额累加器用
--   procedure P_CLM_ACCUTOR_G8(I_CASE_ID        in number, --caseId
--                              I_ITEM_ID        in number, --ItemId
--                              I_LIAB_ID        in number, --责任Id
--                              I_EXPLICIT_PARAM in number, -- 显式传入参数
--                              I_PARAM1         in number, --参数1
--                              I_PARAM2         in number, --参数2
--                              O_PARAM_VALUE    out number,
--                              I_SERVICE_COUNT  in number) is
--     m_policy_id    t_contract_product.policy_id%type;
--     m_except_value t_contract_product.except_value%type; --分单险种上的免赔额
--     m_product_id   t_contract_product.product_id%type;
--   begin
--     select policy_id
--       into m_policy_id
--       from t_contract_product cp
--      where cp.item_id = I_ITEM_ID;
--     if PKG_LIFE_NEWBIZ_CLM_ACCUMU.f_is_multi_paragraph_policy(m_policy_id,I_ITEM_ID) then
--       -- 取分单险种上的免赔额
--       select tcp.except_value, tcp.policy_id, tcp.product_id
--         into m_except_value, m_policy_id, m_product_id
--         from t_contract_product tcp
--        where tcp.item_id = I_ITEM_ID;
--       -- 分单险种上没有定义免赔额，从总单上取
--       if m_except_value is null then
--         m_except_value := PKG_LIFE_NEWBIZ_CLM_ACCUMU.F_GROUP_PRODUCT_EXCEPT_VALUE(m_policy_id, m_product_id);
--       end if;
--       O_PARAM_VALUE := m_except_value;
--     else
--       O_PARAM_VALUE := I_PARAM1;
--     end if;
--   end P_CLM_ACCUTOR_G8;
  ---------------自付累加器用
--   procedure P_CLM_ACCUTOR_G9(I_CASE_ID        in number, --caseId
--                              I_ITEM_ID        in number, --ItemId
--                              I_LIAB_ID        in number, --责任Id
--                              I_EXPLICIT_PARAM in number, -- 显式传入参数
--                              I_PARAM1         in number, --参数1
--                              I_PARAM2         in number, --参数2
--                              O_PARAM_VALUE    out number,
--                              I_SERVICE_COUNT  in number) is
--     m_policy_id    t_contract_product.policy_id%type;
--     m_except_value t_contract_product.except_value%type; --分单险种上的免赔额
--     m_product_id   t_contract_product.product_id%type;
--     m_pay_rate     t_product_pay_rate.pay_rate%type := 0;
--   begin
--     select policy_id
--       into m_policy_id
--       from t_contract_product cp
--      where cp.item_id = I_ITEM_ID;
--     if PKG_LIFE_NEWBIZ_CLM_ACCUMU.f_is_multi_paragraph_policy(m_policy_id,I_ITEM_ID) then
--       O_PARAM_VALUE := PKG_LIFE_NEWBIZ_CLM_ACCUMU.F_GET_PRODUCT_PAY_RATE(M_POLICY_ID,I_ITEM_ID,I_EXPLICIT_PARAM);
--     else
--       O_PARAM_VALUE := I_PARAM1;
--     end if;
--
--   end P_CLM_ACCUTOR_G9;

  --add by bingham.liu 20091121
  --免赔额公式，分单险种的年免赔金额
  procedure P_CLM_ACCUTOR_G10(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number) is
    m_policy_id    r_contract_product.policy_id%type;
    m_except_value r_contract_product.except_value%type; --分单险种上的免赔额
    --m_product_id   t_contract_product.product_id%type;
    --m_pay_rate     t_product_pay_rate.pay_rate%type := 0;
  begin

    select nvl(cp.except_value, 0)
      into m_except_value
      from r_contract_product cp
     where cp.item_id = I_ITEM_ID;

    if m_except_value is not null then
      O_PARAM_VALUE := m_except_value;
    else
      O_PARAM_VALUE := 0;
    end if;

  exception
    when others then
      O_PARAM_VALUE := 0;

  end P_CLM_ACCUTOR_G10;

  --add by bingham.liu 20091121
  --自付累加器公式，，取(1-分单险种的赔付比例)做自付比例

  procedure P_CLM_ACCUTOR_G11(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number) is
    --m_policy_id    t_contract_product.policy_id%type;
    m_pay_rate_value r_contract_product.pay_rate%type; --分单险种上的免赔额
    --m_product_id   t_contract_product.product_id%type;
    --m_pay_rate     t_product_pay_rate.pay_rate%type := 0;
  begin
    select nvl(1 - cp.pay_rate, 1)
      into m_pay_rate_value
      from r_contract_product cp
     where cp.item_id = I_ITEM_ID;

    O_PARAM_VALUE := m_pay_rate_value;

  exception
    when others then
      O_PARAM_VALUE := 1;

  end P_CLM_ACCUTOR_G11;

  --add by bingham.liu 20091121
  --免赔额公式，分单险种的次免赔金额
  procedure P_CLM_ACCUTOR_G12(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number) is
    m_policy_id        r_contract_product.policy_id%type;
    m_sec_except_value t_contract_product_ext.sec_excpet_value%type; --分单险种上的免赔额
    --m_product_id   t_contract_product.product_id%type;
    --m_pay_rate     t_product_pay_rate.pay_rate%type := 0;
  begin

    if PKG_LIFE_CLAIM_INTERFACE.f_is_has_product_ext(m_policy_id, I_ITEM_ID) then

      select nvl(cpt.sec_excpet_value, 0)
        into m_sec_except_value
        from t_contract_product_ext cpt
       where cpt.item_id = I_ITEM_ID;

      O_PARAM_VALUE := m_sec_except_value;
    else
      O_PARAM_VALUE := 0;
    end if;

  exception
    when others then
      O_PARAM_VALUE := 0;

  end P_CLM_ACCUTOR_G12;

  --add by bingham.liu 20091121
  --限额公式，分单险种的次限额
  procedure P_CLM_ACCUTOR_G13(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number) is
    m_policy_id        r_contract_product.policy_id%type;
    m_sec_amount_value t_contract_product_ext.sec_amount%type;
    --m_product_id   t_contract_product.product_id%type;
    --m_pay_rate     t_product_pay_rate.pay_rate%type := 0;
  begin

    if PKG_LIFE_CLAIM_INTERFACE.f_is_has_product_ext(m_policy_id, I_ITEM_ID) then

      select nvl(cpt.sec_amount, 9999999999)
        into m_sec_amount_value
        from t_contract_product_ext cpt
       where cpt.item_id = I_ITEM_ID;

      O_PARAM_VALUE := m_sec_amount_value;
    else
      O_PARAM_VALUE := 0;
    end if;

  exception
    when others then
      O_PARAM_VALUE := 0;

  end P_CLM_ACCUTOR_G13;

  --add by bingham.liu 20091203
  --限额公式，公共保额分单限额
  procedure P_CLM_ACCUTOR_G14(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number) is
    m_policy_id               r_contract_product.policy_id%type;
    m_limit_comm_amount_value t_contract_product_ext.limit_comm_amount%type;
    --m_product_id   t_contract_product.product_id%type;
    --m_pay_rate     t_product_pay_rate.pay_rate%type := 0;
  begin

    if PKG_LIFE_CLAIM_INTERFACE.f_is_has_product_ext(m_policy_id, I_ITEM_ID) then

      select nvl(cpt.limit_comm_amount, 9999999999)
        into m_limit_comm_amount_value
        from t_contract_product_ext cpt
       where cpt.item_id = I_ITEM_ID;

      O_PARAM_VALUE := m_limit_comm_amount_value;
    else
      O_PARAM_VALUE := 0;
    end if;

  exception
    when others then
      O_PARAM_VALUE := 0;

  end P_CLM_ACCUTOR_G14;

  --add by bingham.liu 20091203
  --限额公式，公共保额总单限额
  procedure P_CLM_ACCUTOR_G15(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number) is
    m_policy_id         t_contract_product.policy_id%type;
    m_comm_amount_value t_group_product.comm_amount%type;
    --m_product_id   t_contract_product.product_id%type;
    --m_pay_rate     t_product_pay_rate.pay_rate%type := 0;
  begin

    if PKG_LIFE_CLAIM_INTERFACE.f_is_has_product_ext(m_policy_id, I_ITEM_ID) then

      select nvl(gp.comm_amount,0)
        into m_comm_amount_value
        from t_contract_product cp, t_group_product gp
       where cp.policy_id = gp.policy_id
         and cp.product_id = gp.product_id
         and cp.item_id = I_ITEM_ID;

      O_PARAM_VALUE := m_comm_amount_value;
    else
      O_PARAM_VALUE := 0;
    end if;

  exception
    when others then
      O_PARAM_VALUE := 0;

  end P_CLM_ACCUTOR_G15;

  -- davin.tang 取责任上其他累加器的输出值 2008-08-11
  procedure P_CLM_ACCUTOR_G17(I_case_id       in number, --caseId
                              I_item_id       in number, --ItemId
                              I_liab_id       in number, --责任Id
                              I_param1        in number, --参数1
                              I_param2        in number, --参数2
                              O_param_value   out number,
                              I_service_count in number) is
  begin
    select output_amount
      into O_param_value
      from t_accution_list t
     where t.item_id = I_item_id
       and t.liab_id = I_liab_id
       and t.accutor_id = I_param1
       and t.case_id = I_case_id;
  end P_CLM_ACCUTOR_G17;

  -- davin.tang I_PARAM1 * 主险保额
  procedure P_CLM_ACCUTOR_G22(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number) is
    m_master_id number;
  begin
    select master_id
      into m_master_id
      from r_contract_product
     where item_id = I_ITEM_ID;
    P_CLM_ACCUTOR_G3(I_CASE_ID,
                     nvl(m_master_id, I_ITEM_ID),
                     I_LIAB_ID,
                     I_EXPLICIT_PARAM,
                     I_PARAM1,
                     I_PARAM2,
                     O_PARAM_VALUE,
                     I_SERVICE_COUNT);
  end;


  -- 限额公式（金鼎富贵两全保险（分红型）（D款） ）
  -- added by yaofei.wang,2010-10-19
  procedure P_CLM_ACCUTOR_G23(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number) is
     m_product_id   r_contract_product.product_id%type;
     m_ecif_id   t_claim_case.ecif_id%type;
     m_sum_amount   r_contract_product.amount%type;
     m_sum_pay_amount t_liability_pay.pay_amount%type;
  begin
     select ecif_id
       into m_ecif_id
       from t_claim_case
      where case_id = I_CASE_ID;

     select product_id
       into m_product_id
       from r_contract_product
      where item_id = I_ITEM_ID;

      --1.得到∑SA
      select nvl(sum(amount),0)
        into m_sum_amount
        from (select a.item_id, a.amount
                from r_contract_product a ,r_ecif_cust_map b
               where a.product_id = m_product_id
                 and a.liability_state in (1, 2)
                 and a.insured_1 = b.customer_id
                 and b.ecif_id = m_ecif_id
              union
              select a.item_id, a.amount
                from r_contract_product a ,r_ecif_cust_map b
               where a.product_id = m_product_id
                 and a.liability_state = 3
                 and a.insured_1 = b.customer_id
                 and b.ecif_id = m_ecif_id
                 and exists (select 1
                        from t_claim_case tcc, t_claim_product tcp
                       where tcc.case_id = tcp.case_id
                         and tcc.case_status = 10
                         and tcp.register_conclusion = '1'
                         and tcp.item_id = a.item_id));

      --2.累计赔付额计算
     select nvl(sum(a.pay_amount), 0)
       into m_sum_pay_amount
       from t_liability_pay a, t_claim_case b
      where a.case_id = b.case_id
        and b.case_status in (7, 8, 9, 10, 15, 16, 18, 20, 21, 22)
        and b.ecif_id = m_ecif_id
        and b.case_id <> I_CASE_ID
        and a.product_id = m_product_id;

      --3.PARAM1*∑SA+PARAM2-累计赔付额
      O_PARAM_VALUE := I_PARAM1*m_sum_amount+I_PARAM2-m_sum_pay_amount;

  end P_CLM_ACCUTOR_G23;
  -- I_PARAM1 * 6413144的保额(限定product_id 防止多主险的情况)
  procedure P_CLM_ACCUTOR_G24(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number) is
    m_master_id number;
  begin
     select tcp.item_id
     into m_master_id
     from r_contract_product cp, r_contract_product tcp
    where tcp.policy_id = cp.policy_id
      and tcp.insured_1 = cp.insured_1
      and tcp.product_id = 62223
      and tcp.master_id is null
      and cp.item_id = I_ITEM_ID;
    P_CLM_ACCUTOR_G3(I_CASE_ID,
                     nvl(m_master_id, I_ITEM_ID),
                     I_LIAB_ID,
                     I_EXPLICIT_PARAM,
                     I_PARAM1,
                     I_PARAM2,
                     O_PARAM_VALUE,
                     I_SERVICE_COUNT);
  end P_CLM_ACCUTOR_G24;

  -- 伤残保额和身故保额共享限额
  -- I_PARAM1 * internal_id为I_PARAM2的保额
  procedure P_CLM_ACCUTOR_G25(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number) is
    m_master_id number;
  begin
     select tcp.item_id
     into m_master_id
     from r_contract_product cp, r_contract_product tcp
    where tcp.policy_id = cp.policy_id
      and tcp.insured_1 = cp.insured_1
      and tcp.product_id in (select product_id
                               from t_product_life
                              where internal_id = to_char(trunc(I_PARAM2)))
      and cp.item_id = I_ITEM_ID;
    P_CLM_ACCUTOR_G3(I_CASE_ID,
                     nvl(m_master_id, I_ITEM_ID),
                     I_LIAB_ID,
                     I_EXPLICIT_PARAM,
                     I_PARAM1,
                     I_PARAM2,
                     O_PARAM_VALUE,
                     I_SERVICE_COUNT);
  end P_CLM_ACCUTOR_G25;

  -- 限额公式（PICC-50910-惠民幸福一号两全保险（分红型））
  -- 目前仅支持身故、全残责任
  -- added by yubin.wang,2013-12-09
  procedure P_CLM_ACCUTOR_G26(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number) is
    m_product_id     t_contract_product.product_id%type;
    m_insured_id     t_contract_product.insured_1%type;
    m_sum_amount     t_contract_product.amount%type;
    m_sum_pay_amount t_liability_pay.pay_amount%type;
    m_liab_category  t_liability.liab_category%type;
    m_calc_date      date; --对应身故日或全残日，取实际缴费年度用
    m_item_id        t_contract_product.item_id%type;
    m_validate_date  date;
    m_end_date       date;
    m_premium_year   t_contract_product.premium_year%type;
    M_CALC_AMOUNT    t_contract_product.amount%type;
    m_real_prem_year number;
    M_UNIT           number := 1; -- 购买产品的份数，也就是责任的份数
    M_BENEFIT_LEVEL  varchar2(20);

    cursor C_CONTRACT_PRODUCT is
    select distinct
             tp.item_id,
             tp.validate_date,
             tp.premium_year,
             tp.end_date,
             tp.insured_1
        from t_claim_case tc, t_contract_product tp, t_contract_product tp2, t_ecif_cust_map tec
       where tc.case_id = I_CASE_ID
         and tc.ecif_id = tec.ecif_id
         and tec.customer_id = tp.insured_1
         and tp.product_id = tp2.product_id
         and tp2.item_id = I_ITEM_ID;
   begin
    --初始化
    m_sum_amount := 0;
    select product_id
      into m_product_id
      from t_contract_product
     where item_id = I_ITEM_ID;

    select liab_category
      into m_liab_category
      from t_liability
     where liab_id = I_LIAB_ID;

    --判断本次理赔责任是身故还是全残，进而取对应的身故日或全残日
    if m_liab_category = 1 then
      --获取身故日
      select death_date
        into m_calc_date
        from T_CLAIM_CASE t
       where t.CASE_ID = I_CASE_ID;
      if m_calc_date is null then
        p_error(2000, '身故日期不能为空');
      end if;
    elsif m_liab_category = 2 then
      --获取全残日
      select disable_date
        into m_calc_date
        from T_CLAIM_CASE t
       where t.CASE_ID = I_CASE_ID;
      if m_calc_date is null then
        p_error(2000, '全残日期不能为空');
      end if;
    else
      p_error(2000, '此公式仅支持身故和全残责任');
    end if;

    --1.得到∑{SA*YEAR }
    --表示同一被保人下的所有的惠民幸福一号保单的累计的保额之和
    --YEAR为交费年度数
    --1.1统计被保人下实际保额
    open C_CONTRACT_PRODUCT;
    loop
      fetch C_CONTRACT_PRODUCT
        into m_item_id, m_validate_date, m_premium_year, m_end_date,m_insured_id;
      exit when C_CONTRACT_PRODUCT%notfound;
      if PKG_LIFE_DM_PRODUCT.F_PRODUCT_LIABILITY_IS_EFFECT(m_item_id,
                                                         m_calc_date,
                                                         m_insured_id) then
        --获取交费年度数
        select floor(months_between(m_calc_date, m_validate_date) / 12) + 1
          into m_real_prem_year
          from dual;

        --若被保险人在缴费期间外
        if m_premium_year < m_real_prem_year then
          m_real_prem_year := m_premium_year;
        end if;

        PKG_LIFE_UW_INTERFACE.P_GET_CONT_PROD_ACTUAL_AMOUNT(m_item_id,
                                                            m_calc_date,
                                                            M_CALC_AMOUNT, --事故日的保额
                                                            M_UNIT,
                                                            M_BENEFIT_LEVEL);
        if M_CALC_AMOUNT is null then
          M_CALC_AMOUNT := 0;
        end if;
        --惠民一号只能年缴
        m_sum_amount := m_sum_amount + M_CALC_AMOUNT * m_real_prem_year;
      end if;
    end loop;
    close C_CONTRACT_PRODUCT;

    --2.累计赔付额计算,包含本次案件赔付金额
    --意外身故、意外全残、公共交通意外身故、公共交通意外全残配置一个公共的限额累加器
      m_sum_pay_amount := 0 ;
      --modify by yubin.wang
      --def_period_type 定义成5，通过累加器调整页面调整赔付金额
      --若def_period_type定义成4，此时需要计算赔付金额
      /*select nvl(sum(a.pay_amount), 0)
        into m_sum_pay_amount
        from t_liability_pay a, t_claim_case b
       where a.case_id = b.case_id
         and a.liab_id in (101, 202, 122, 216)
         and b.case_status in (7, 8, 9, 10, 15, 16, 18, 20, 21, 22)
         and b.insured_id = m_insured_id
         and a.product_id = m_product_id;
  */
    --3.PARAM1*∑{SA*YEAR}+PARAM2-∑{PAID_AMOUNT}-累计赔付额
    O_PARAM_VALUE := I_PARAM1 * m_sum_amount + I_PARAM2 - m_sum_pay_amount;
  end P_CLM_ACCUTOR_G26;

  --责任级次免赔额累加器
  procedure P_CLM_ACCUTOR_G27(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number) is
    m_except_amount    t_contract_liab_pay_param.except_amount%type; --责任上的免赔额
    m_except_type      t_group_policy_product.except_type%type;

  begin

   if I_LIAB_ID in (676,677) then
    select nvl(except_amount, 0)
      into m_except_amount
      from t_contract_liab_pay_param
     where item_id = I_ITEM_ID
       and liab_id = I_LIAB_ID;
    O_PARAM_VALUE := m_except_amount ;
   else
    --对应总单险种的免赔类型
     m_except_type := PKG_LIFE_NEWBIZ_CLM_ACCUMU.F_GROUP_PRODUCT_EXCEPT_TYPE(I_ITEM_ID);
     if m_except_type = '2' then
     select nvl(except_amount, 0)
       into m_except_amount
       from t_contract_liab_pay_param
      where item_id = I_ITEM_ID
        and liab_id = I_LIAB_ID;
    O_PARAM_VALUE := m_except_amount ;
    else
    O_PARAM_VALUE := 0 ;
    end if;
   end if;

  exception
    when others then
      O_PARAM_VALUE := 0;

  end P_CLM_ACCUTOR_G27;

  --责任级自付累加器
  --取(1-责任级赔付比例)做该责任的自付比例
  procedure P_CLM_ACCUTOR_G28(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number) is
  m_pay_rate_value t_contract_liab_pay_param.pay_rate%type; --分单险种上的免赔额

  begin
    select nvl(1 - cp.pay_rate, 1)
      into m_pay_rate_value
      from t_contract_liab_pay_param cp
     where cp.item_id = I_ITEM_ID
       and cp.liab_id = I_LIAB_ID;

    O_PARAM_VALUE := m_pay_rate_value;

  exception
    when others then
      O_PARAM_VALUE := 1;

  end P_CLM_ACCUTOR_G28;

  ----责任级可用公共保额限额累加器
  procedure P_CLM_ACCUTOR_G29(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number) is
    m_limit_comm_amount_value t_contract_liab_pay_param.limit_comm_amount%type;--责任级分单公共保额限额
    m_product_id              r_contract_product.product_id%type;
    m_decision_id             t_uw_product.decision_id%type;
    m_year_type               t_product_limit_amount.year_type%type := 1;
    m_validate_date           r_contract_product.validate_date%type;
    m_policy_year             NUMBER;
  begin
    select product_id
      into m_product_id
      from r_contract_product
     where item_id = i_item_id;
    if PKG_LIFE_CLAIM_INTERFACE.f_is_has_liab_pay_param(I_ITEM_ID, I_LIAB_ID) then

      select nvl(cp.limit_comm_amount, 9999999999)
        into m_limit_comm_amount_value
        from t_contract_liab_pay_param cp
       where cp.item_id = I_ITEM_ID
        and  cp.liab_id = I_LIAB_ID;

      O_PARAM_VALUE := m_limit_comm_amount_value;
    elsif m_product_id in (64804,64806) then
      m_validate_date := PKG_LIFE_DM_PRODUCT.f_get_renewal_vaildate_date(i_item_id);
      select floor(months_between(tcc.accident_time, m_validate_date) / 12) + 1
       into m_policy_year
       from t_claim_case tcc
      where case_id = i_case_id;
      m_decision_id := PKG_LIFE_DM_PRODUCT.f_get_decision_id(m_policy_year,
                                                           i_item_id);
      if I_PARAM2 = 999 then
        m_year_type := 2;
      end if;
      select limit_amount
        into O_PARAM_VALUE
        from t_product_limit_amount
       where product_id = m_product_id
         and year_type = m_year_type
         and liab_id = i_liab_id
         and decision_id = m_decision_id;
    else
      O_PARAM_VALUE := 0;
    end if;

  exception
    when others then
      O_PARAM_VALUE := 0;

  end P_CLM_ACCUTOR_G29;

  --责任级年免赔额累加器
  procedure P_CLM_ACCUTOR_G30(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number) is
  m_except_amount t_contract_liab_pay_param.except_amount%type; --分单险种对应责任的免赔额
  m_except_type      t_group_policy_product.except_type%type;  --免赔类型
  begin

    if I_LIAB_ID in (672,673) then
        --对应总单险种的免赔类型
      m_except_type := PKG_LIFE_NEWBIZ_CLM_ACCUMU.F_GROUP_PRODUCT_EXCEPT_TYPE(I_ITEM_ID);
         --年免
         if m_except_type = '1' then
              select nvl(except_amount, 0)
               into m_except_amount
               from t_contract_liab_pay_param
              where item_id = I_ITEM_ID
                and liab_id = I_LIAB_ID;
            O_PARAM_VALUE := m_except_amount ;
         else
         O_PARAM_VALUE := 0;
         end if;
    else
    O_PARAM_VALUE := 0;
    end if;
  exception
    when others then
      O_PARAM_VALUE := 0;

  end P_CLM_ACCUTOR_G30;

  --责任级次限额累加器
  procedure P_CLM_ACCUTOR_G31(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number) is
    m_sec_amount_value t_contract_product_ext.sec_amount%type;
  begin

    if PKG_LIFE_CLAIM_INTERFACE.f_is_has_liab_pay_param(I_ITEM_ID, I_LIAB_ID) then

      select nvl(cp.sec_amount, 9999999999)
        into m_sec_amount_value
        from t_contract_liab_pay_param cp
       where cp.item_id = I_ITEM_ID
         and cp.liab_id = I_LIAB_ID;

      O_PARAM_VALUE := m_sec_amount_value;
    else
      O_PARAM_VALUE := 0;
    end if;

  exception
    when others then
      O_PARAM_VALUE := 0;

  end P_CLM_ACCUTOR_G31;

  -- 限额公式（PICC_55236_关于人保寿险财寿双盈两全保险（分红型））
  -- 目前仅支持身故、全残责任
  -- added by yang_xn,2014-05-26
  procedure P_CLM_ACCUTOR_G32(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number) is
     m_product_id   t_contract_product.product_id%type;
     m_insured_id   t_contract_product.insured_1%type;
     m_ecif_id      t_claim_case.ecif_id%type;
     m_sum_amount   t_contract_product.amount%type;
     m_sum_pay_amount t_liability_pay.pay_amount%type;
     m_liab_category  t_liability.liab_category%type;
     m_calc_date      date;
     M_CALC_AMOUNT  number(13, 2);
     M_TEMP_AMOUNT  T_LIABILITY_PAY.CALCU_AMOUNT%TYPE;
     M_VALUE             number(13, 2);
     m_item_id        t_contract_product.item_id%type;
     m_validate_date  date;
     m_end_date       date;
     m_premium_year   t_contract_product.premium_year%type;
     M_ACC_DATE       date;

     cursor C_CONTRACT_PRODUCT is
    select distinct
             tp.item_id,
             tp.validate_date,
             tp.premium_year,
             tp.end_date,
             tp.insured_1
        from t_claim_case tc, t_contract_product tp, t_contract_product tp2, t_ecif_cust_map tec
       where tc.case_id = I_CASE_ID
         and tc.ecif_id = tec.ecif_id
         and tec.customer_id  = tp.insured_1
         and tp.product_id = tp2.product_id
         and tp2.item_id = I_ITEM_ID;

  begin
     select ecif_id
       into m_ecif_id
       from t_claim_case
      where case_id = I_CASE_ID;

     select trunc(accident_time)
      into M_ACC_DATE
      from t_claim_case
     where case_id = I_CASE_ID;

     select product_id
       into m_product_id
       from t_contract_product
      where item_id = I_ITEM_ID;

    select liab_category
      into m_liab_category
      from t_liability
     where liab_id = I_LIAB_ID;

    --1.判断本次理赔责任是身故还是全残，进而取对应的身故日或全残日
    if m_liab_category = 1 OR m_liab_category =10  then
      --获取身故日
      select death_date
        into m_calc_date
        from T_CLAIM_CASE t
       where t.CASE_ID = I_CASE_ID;
      if m_calc_date is null then
        p_error(2000, '身故日期不能为空');
      end if;
    elsif m_liab_category = 2 OR m_liab_category =11  then
      --获取全残日
      select disable_date
        into m_calc_date
        from T_CLAIM_CASE t
       where t.CASE_ID = I_CASE_ID;
      if m_calc_date is null then
        p_error(2000, '全残日期不能为空');
      end if;
    else
      p_error(2000, '此公式仅支持身故和全残责任');
    end if;

   M_CALC_AMOUNT := 0;
   open C_CONTRACT_PRODUCT;
    loop
      fetch C_CONTRACT_PRODUCT
        into m_item_id, m_validate_date, m_premium_year, m_end_date,m_insured_id;
      exit when C_CONTRACT_PRODUCT%notfound;
      if PKG_LIFE_DM_PRODUCT.F_PRODUCT_LIABILITY_IS_EFFECT(m_item_id,
                                                         m_calc_date,
                                                         m_insured_id) then
        PKG_LS_CLM_CALC.p_compare_prem_and_surr_val(m_item_id,M_ACC_DATE,m_calc_date,M_TEMP_AMOUNT);
        M_CALC_AMOUNT := M_CALC_AMOUNT + M_TEMP_AMOUNT;
      end if;
    end loop;
    close C_CONTRACT_PRODUCT;

      --2.累计赔付额计算
     select  nvl(sum(a.pay_amount),0)
       into  m_sum_pay_amount
       from  t_liability_pay a ,
             t_claim_case b
      where  a.case_id = b.case_id
        and  b.ecif_id = m_ecif_id
        and  a.liab_id in (101,202,122,216,123,222)
        and  b.case_status in (7,8,9,10,15,16,18,20,21,22)
        and  b.case_id <> I_CASE_ID
        and  a.product_id = m_product_id;

      --3.PARAM1*∑{ max(所交保险费*1.05，现金价值)}+PARAM2-∑{PAID_AMOUNT}
      O_PARAM_VALUE := I_PARAM1*M_CALC_AMOUNT+I_PARAM2-m_sum_pay_amount;

  end P_CLM_ACCUTOR_G32;

   -- 限额公式（PICC_64987_关于人保寿险惠民幸福二号两全保险（分红型）产品）
   -- 目前仅支持身故、全残责任  added by 2015-07-06
  procedure P_CLM_ACCUTOR_G33(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number) is
     m_product_id   t_contract_product.product_id%type;
     m_insured_id   t_contract_product.insured_1%type;
     m_ecif_id      t_claim_case.ecif_id%type;
     m_sum_amount   t_contract_product.amount%type;
     m_sum_pay_amount t_liability_pay.pay_amount%type;
     m_liab_category  t_liability.liab_category%type;
     m_calc_date      date;
     M_CALC_AMOUNT  number(13, 2);
     M_TEMP_AMOUNT  T_LIABILITY_PAY.CALCU_AMOUNT%TYPE;
     M_VALUE             number(13, 2);
     m_item_id        t_contract_product.item_id%type;
     m_validate_date  date;
     m_end_date       date;
     m_premium_year   t_contract_product.premium_year%type;
     M_ACC_DATE       date;

     cursor C_CONTRACT_PRODUCT is
      select distinct
               tp.item_id,
               tp.validate_date,
               tp.premium_year,
               tp.end_date,
               tp.insured_1
          from t_claim_case tc, t_contract_product tp, t_contract_product tp2,t_ecif_cust_map tec
         where tc.case_id = I_CASE_ID
           and tc.ecif_id = tec.ecif_id
           and tec.customer_id = tp.insured_1
           and tp.product_id = tp2.product_id
           and tp2.item_id = I_ITEM_ID;

  begin
      select ecif_id
       into m_ecif_id
       from t_claim_case
      where case_id = I_CASE_ID;

     select trunc(accident_time)
      into M_ACC_DATE
      from t_claim_case
     where case_id = I_CASE_ID;

     select product_id
       into m_product_id
       from t_contract_product
      where item_id = I_ITEM_ID;

    select liab_category
      into m_liab_category
      from t_liability
     where liab_id = I_LIAB_ID;

    --1.判断本次理赔责任是身故还是全残，进而取对应的身故日或全残日
    if m_liab_category = 1 OR m_liab_category =10  then
      --获取身故日
      select death_date
        into m_calc_date
        from T_CLAIM_CASE t
       where t.CASE_ID = I_CASE_ID;
      if m_calc_date is null then
        p_error(2000, '身故日期不能为空');
      end if;
    elsif m_liab_category = 2 OR m_liab_category =11  then
      --获取全残日
      select disable_date
        into m_calc_date
        from T_CLAIM_CASE t
       where t.CASE_ID = I_CASE_ID;
      if m_calc_date is null then
        p_error(2000, '全残日期不能为空');
      end if;
    else
      p_error(2000, '此公式仅支持身故和全残责任');
    end if;

   M_CALC_AMOUNT := 0;
   open C_CONTRACT_PRODUCT;
    loop
      fetch C_CONTRACT_PRODUCT
        into m_item_id, m_validate_date, m_premium_year, m_end_date,m_insured_id;
      exit when C_CONTRACT_PRODUCT%notfound;
      if PKG_LIFE_DM_PRODUCT.F_PRODUCT_LIABILITY_IS_EFFECT(m_item_id,
                                                         m_calc_date,
                                                         m_insured_id) then
        PKG_LS_CLM_CALC.p_compare_prem_and_surr_val(m_item_id,M_ACC_DATE,m_calc_date,M_TEMP_AMOUNT);
        M_CALC_AMOUNT := M_CALC_AMOUNT + M_TEMP_AMOUNT;
      end if;
    end loop;
    close C_CONTRACT_PRODUCT;

      --2.累计赔付额计算
     select  nvl(sum(a.pay_amount),0)
       into  m_sum_pay_amount
       from  t_liability_pay a ,
             t_claim_case b
      where  a.case_id = b.case_id
        and  b.ecif_id = m_ecif_id
        and  a.liab_id in (101, 202, 122, 216)
        and  b.case_status in (7,8,9,10,15,16,18,20,21,22)
        and  b.case_id <> I_CASE_ID
        and  a.product_id = m_product_id;

      --3.PARAM1*∑{ max(所交保险费*1.05，现金价值)}+PARAM2-∑{PAID_AMOUNT}
      O_PARAM_VALUE := I_PARAM1*M_CALC_AMOUNT+I_PARAM2-m_sum_pay_amount;

  end P_CLM_ACCUTOR_G33;

    procedure P_CLM_ACCUTOR_G34(I_CASE_ID        in number, --caseId
                             I_ITEM_ID        in number, --ItemId
                             I_LIAB_ID        in number, --责任Id
                             I_EXPLICIT_PARAM in number, -- 显式传入参数
                             I_PARAM1         in number, --参数1
                             I_PARAM2         in number, --参数2
                             O_PARAM_VALUE    out number,
                             I_SERVICE_COUNT  in number) is
    V_MEDICAL_FEE    number;
    V_ADMISSION_DAYS number;
    M_ACC_DATE       date; -- 事故发生日
    M_CALC_AMOUNT    number; -- 理算结果
    M_UNIT           number := 1; -- 购买产品的份数，也就是责任的份数
    M_BENEFIT_LEVEL  varchar2(20); -- 购买产品的档次
    M_CARD_POLICY    number;
    M_DISCOUNT       number := 1;
    M_COUNT          number;
    mProduct_itemId  NUMBER;
    rProduct_itemId NUMBER;
    mProduct_amount NUMBER;
    rProduct_amount NUMBER;
    m_has_63687     BOOLEAN:= TRUE;
  begin
    -- 1、基本赔付额 = 津贴(=表定比例×SA) * 显式传入参数(天数/周数 etc.)
    -- 取得指定投保险种（保单结构）在指定时间的实际保额以及份数和档次
    select TCC.ACCIDENT_TIME -- 事故发生日期
      into M_ACC_DATE
      from T_CLAIM_CASE TCC
     where TCC.CASE_ID = I_CASE_ID;

     --取6413354 6413355 item_id
     --是否主险
     SELECT COUNT(1)
       INTO M_COUNT
       FROM R_CONTRACT_PRODUCT
      WHERE ITEM_ID = I_ITEM_ID
        AND MASTER_ID IS NULL;

     IF m_count >0 THEN
       --主险
       mProduct_itemId := I_ITEM_ID;
       --是否含有63687附加险
       SELECT COUNT(1)
         INTO M_COUNT
         FROM R_CONTRACT_PRODUCT
        WHERE MASTER_ID = I_ITEM_ID
          AND PRODUCT_ID = 63687;
       IF M_COUNT > 0 THEN
         SELECT item_id
         INTO rProduct_itemId
         FROM R_CONTRACT_PRODUCT
        WHERE MASTER_ID = I_ITEM_ID
          AND PRODUCT_ID = 63687;
       ELSE
          m_has_63687 := FALSE;
       END IF;
      ELSE
        --附险
        rProduct_itemId := I_ITEM_ID;
         SELECT MASTER_ID
           INTO mProduct_itemId
           FROM R_CONTRACT_PRODUCT
          WHERE ITEM_ID = I_ITEM_ID;
      END IF;

      IF m_has_63687 THEN
        --取主险 附险中最大的保额
        PKG_LIFE_UW_INTERFACE.P_GET_CONT_PROD_ACTUAL_AMOUNT(mProduct_itemId,
                                                          M_ACC_DATE,
                                                          mProduct_amount,
                                                          M_UNIT,
                                                          M_BENEFIT_LEVEL);
        PKG_LIFE_UW_INTERFACE.P_GET_CONT_PROD_ACTUAL_AMOUNT(rProduct_itemId,
                                                          M_ACC_DATE,
                                                          rProduct_amount,
                                                          M_UNIT,
                                                          M_BENEFIT_LEVEL);
        IF mProduct_amount >= rProduct_amount THEN
          M_CALC_AMOUNT := mProduct_amount;
        ELSE
          M_CALC_AMOUNT := rProduct_amount;
        END IF;
     ELSE
      PKG_LIFE_UW_INTERFACE.P_GET_CONT_PROD_ACTUAL_AMOUNT(mProduct_itemId,
                                                        M_ACC_DATE,
                                                        M_CALC_AMOUNT,
                                                        M_UNIT,
                                                        M_BENEFIT_LEVEL);
     END if;
    O_PARAM_VALUE := I_PARAM1 * M_CALC_AMOUNT;
  end P_CLM_ACCUTOR_G34;

  procedure P_CLM_ACCUTOR_G35(I_CASE_ID        in number, --caseId
                              I_ITEM_ID        in number, --ItemId
                              I_LIAB_ID        in number, --责任Id
                              I_EXPLICIT_PARAM in number, -- 显式传入参数
                              I_PARAM1         in number, --参数1
                              I_PARAM2         in number, --参数2
                              O_PARAM_VALUE    out number,
                              I_SERVICE_COUNT  in number) is
    M_HOSPITAL_DAYS T_CONTRACT_PRODUCT_EXT.HOSPITAL_PAY_DAYS%TYPE;
    M_ACC_DATE      date; -- 事故发生日
    M_CALC_AMOUNT   number; -- 理算结果
    M_UNIT          number := 1; -- 购买产品的份数，也就是责任的份数
    M_BENEFIT_LEVEL varchar2(20); -- 购买产品的档次
  begin

    select TCC.ACCIDENT_TIME -- 事故发生日期
      into M_ACC_DATE
      from T_CLAIM_CASE TCC
     where TCC.CASE_ID = I_CASE_ID;
    PKG_LIFE_UW_INTERFACE.P_GET_CONT_PROD_ACTUAL_AMOUNT(I_ITEM_ID,
                                                        M_ACC_DATE,
                                                        M_CALC_AMOUNT,
                                                        M_UNIT,
                                                        M_BENEFIT_LEVEL);

    SELECT HOSPITAL_PAY_DAYS
      INTO M_HOSPITAL_DAYS
      FROM T_CONTRACT_PRODUCT_EXT
     WHERE ITEM_ID = I_ITEM_ID;

    O_PARAM_VALUE := M_CALC_AMOUNT * M_HOSPITAL_DAYS * I_PARAM1;

  end P_CLM_ACCUTOR_G35;

  procedure P_CLM_ACCUTOR_G36(I_CASE_ID        in number, --caseId
                             I_ITEM_ID        in number, --ItemId
                             I_LIAB_ID        in number, --责任Id
                             I_EXPLICIT_PARAM in number, -- 显式传入参数
                             I_PARAM1         in number, --参数1
                             I_PARAM2         in number, --参数2
                             O_PARAM_VALUE    out number,
                             I_SERVICE_COUNT  in number) is
   M_ACCOMPANY_DAYS  T_CONTRACT_PRODUCT_EXT.HOSPITAL_PAY_ACCOMPANY_DAYS%TYPE;
    M_ACC_DATE      date; -- 事故发生日
    M_CALC_AMOUNT   number; -- 理算结果
    M_UNIT          number := 1; -- 购买产品的份数，也就是责任的份数
    M_BENEFIT_LEVEL varchar2(20); -- 购买产品的档次
  begin
    select TCC.ACCIDENT_TIME -- 事故发生日期
      into M_ACC_DATE
      from T_CLAIM_CASE TCC
     where TCC.CASE_ID = I_CASE_ID;
    PKG_LIFE_UW_INTERFACE.P_GET_CONT_PROD_ACTUAL_AMOUNT(I_ITEM_ID,
                                                        M_ACC_DATE,
                                                        M_CALC_AMOUNT,
                                                        M_UNIT,
                                                        M_BENEFIT_LEVEL);

    SELECT HOSPITAL_PAY_ACCOMPANY_DAYS
    INTO M_ACCOMPANY_DAYS
    FROM T_CONTRACT_PRODUCT_EXT
    WHERE ITEM_ID = I_ITEM_ID;

   O_PARAM_VALUE := M_CALC_AMOUNT*M_ACCOMPANY_DAYS*I_PARAM1;

 end P_CLM_ACCUTOR_G36;

 --健康委托管理合同，根据责任取对应分单住院、门诊、生育、其他责任的免赔额，
 --若住院、门诊、生育、其他责任未设定免配额，则取医疗费用保障金责任的分单免赔额
 procedure P_CLM_ACCUTOR_G37(I_CASE_ID        in number, --caseId
                             I_ITEM_ID        in number, --ItemId
                             I_LIAB_ID        in number, --责任Id
                             I_EXPLICIT_PARAM in number, -- 显式传入参数
                             I_PARAM1         in number, --参数1
                             I_PARAM2         in number, --参数2
                             O_PARAM_VALUE    out number,
                             I_SERVICE_COUNT  in number) is
      M_COUNT          NUMBER:=0;
      M_EXCEPT_VALUE   NUMBER:=0; --免赔额
  begin
     --判断责任是否录入免赔额
     SELECT COUNT(1)
       INTO M_COUNT
       FROM T_ENTRUSTED_LIAB_MAPPING LIABMAP,
            T_POLICY_PROD_LIAB       PRODLIAB,
            T_POLICY_PRD_LIAB_PARAM  LIABPARAM
      WHERE LIABMAP.ENTRUSTED_TYPE_ID = PRODLIAB.LIAB_ID
        AND PRODLIAB.CONFIG_ID = LIABPARAM.PARAM_ID
        AND LIABMAP.LIAB_ID = I_LIAB_ID
        AND PRODLIAB.ITEM_ID = I_ITEM_ID
        AND PRODLIAB.LIAB_TYPE = '2'    -- t_entrusted_liab_type
        AND LIABPARAM.PARAM_TYPE = '1'; -- t_liab_param_type.type_id
     IF M_COUNT>0 THEN
        SELECT TO_NUMBER(LIABPARAM.PARAM_VALUE)
          INTO M_EXCEPT_VALUE
          FROM T_ENTRUSTED_LIAB_MAPPING LIABMAP,
               T_POLICY_PROD_LIAB       PRODLIAB,
               T_POLICY_PRD_LIAB_PARAM  LIABPARAM
         WHERE LIABMAP.ENTRUSTED_TYPE_ID = PRODLIAB.LIAB_ID
           AND PRODLIAB.CONFIG_ID = LIABPARAM.PARAM_ID
           AND LIABMAP.LIAB_ID = I_LIAB_ID
           AND PRODLIAB.ITEM_ID = I_ITEM_ID
           AND PRODLIAB.LIAB_TYPE = '2'
           AND LIABPARAM.PARAM_TYPE = '1';
     ELSE
       --未录入则判断主责任是否录入免赔额
       SELECT COUNT(1)
         INTO M_COUNT
         FROM T_ENTRUSTED_LIAB_MAPPING LIABMAP,
              T_ENTRUSTED_LIAB_TYPE    LIABTYPE,
              T_POLICY_PROD_LIAB       PRODLIAB,
              T_POLICY_PRD_LIAB_PARAM  LIABPARAM
        WHERE LIABMAP.ENTRUSTED_TYPE_ID = LIABTYPE.TYPE_ID
          AND LIABTYPE.MASTER_TYPE_ID = PRODLIAB.LIAB_ID
          AND PRODLIAB.CONFIG_ID = LIABPARAM.PARAM_ID
          AND LIABMAP.LIAB_ID = I_LIAB_ID
          AND PRODLIAB.ITEM_ID = I_ITEM_ID
          AND PRODLIAB.LIAB_TYPE = '2'
          AND LIABPARAM.PARAM_TYPE = '1';

       IF M_COUNT>0 THEN
          SELECT TO_NUMBER(LIABPARAM.PARAM_VALUE)
            INTO M_EXCEPT_VALUE
            FROM T_ENTRUSTED_LIAB_MAPPING LIABMAP,
                 T_ENTRUSTED_LIAB_TYPE    LIABTYPE,
                 T_POLICY_PROD_LIAB       PRODLIAB,
                 T_POLICY_PRD_LIAB_PARAM  LIABPARAM
           WHERE LIABMAP.ENTRUSTED_TYPE_ID = LIABTYPE.TYPE_ID
             AND LIABTYPE.MASTER_TYPE_ID = PRODLIAB.LIAB_ID
             AND PRODLIAB.CONFIG_ID = LIABPARAM.PARAM_ID
             AND LIABMAP.LIAB_ID = I_LIAB_ID
             AND PRODLIAB.ITEM_ID = I_ITEM_ID
             AND PRODLIAB.LIAB_TYPE = '2'
             AND LIABPARAM.PARAM_TYPE = '1';
       END IF;
     END IF;

     O_PARAM_VALUE := M_EXCEPT_VALUE;

 end P_CLM_ACCUTOR_G37;

 --健康委托管理合同，根据责任取对应分单住院、门诊、生育、其他责任的“（1-给付比例）做该责任的自付比例”，
 --若住院、门诊、生育、其他责任未设定给付比例，则取“(1-医疗费用保障金责任的分单给付比例)做该责任的自付比例”
 procedure P_CLM_ACCUTOR_G38(I_CASE_ID        in number, --caseId
                             I_ITEM_ID        in number, --ItemId
                             I_LIAB_ID        in number, --责任Id
                             I_EXPLICIT_PARAM in number, -- 显式传入参数
                             I_PARAM1         in number, --参数1
                             I_PARAM2         in number, --参数2
                             O_PARAM_VALUE    out number,
                             I_SERVICE_COUNT  in number) is
      M_COUNT          NUMBER:=0;
      M_PAY_RATE       NUMBER:=0; --给付比例
  begin
     --判断责任是否录入给付比例
     SELECT COUNT(1)
       INTO M_COUNT
       FROM T_ENTRUSTED_LIAB_MAPPING LIABMAP,
            T_POLICY_PROD_LIAB       PRODLIAB,
            T_POLICY_PRD_LIAB_PARAM  LIABPARAM
      WHERE LIABMAP.ENTRUSTED_TYPE_ID = PRODLIAB.LIAB_ID
        AND PRODLIAB.CONFIG_ID = LIABPARAM.PARAM_ID
        AND LIABMAP.LIAB_ID = I_LIAB_ID
        AND PRODLIAB.ITEM_ID = I_ITEM_ID
        AND PRODLIAB.LIAB_TYPE = '2'    -- t_entrusted_liab_type
        AND LIABPARAM.PARAM_TYPE = '6'; -- t_liab_param_type.type_id
     IF M_COUNT>0 THEN
        SELECT TO_NUMBER(LIABPARAM.PARAM_VALUE)
          INTO M_PAY_RATE
          FROM T_ENTRUSTED_LIAB_MAPPING LIABMAP,
               T_POLICY_PROD_LIAB       PRODLIAB,
               T_POLICY_PRD_LIAB_PARAM  LIABPARAM
         WHERE LIABMAP.ENTRUSTED_TYPE_ID = PRODLIAB.LIAB_ID
           AND PRODLIAB.CONFIG_ID = LIABPARAM.PARAM_ID
           AND LIABMAP.LIAB_ID = I_LIAB_ID
           AND PRODLIAB.ITEM_ID = I_ITEM_ID
           AND PRODLIAB.LIAB_TYPE = '2'
           AND LIABPARAM.PARAM_TYPE = '6';
     ELSE
       --未录入则判断主责任是否录入给付比例
       SELECT COUNT(1)
         INTO M_COUNT
         FROM T_ENTRUSTED_LIAB_MAPPING LIABMAP,
              T_ENTRUSTED_LIAB_TYPE    LIABTYPE,
              T_POLICY_PROD_LIAB       PRODLIAB,
              T_POLICY_PRD_LIAB_PARAM  LIABPARAM
        WHERE LIABMAP.ENTRUSTED_TYPE_ID = LIABTYPE.TYPE_ID
          AND LIABTYPE.MASTER_TYPE_ID = PRODLIAB.LIAB_ID
          AND PRODLIAB.CONFIG_ID = LIABPARAM.PARAM_ID
          AND LIABMAP.LIAB_ID = I_LIAB_ID
          AND PRODLIAB.ITEM_ID = I_ITEM_ID
          AND PRODLIAB.LIAB_TYPE = '2'
          AND LIABPARAM.PARAM_TYPE = '6';

       IF M_COUNT>0 THEN
          SELECT TO_NUMBER(LIABPARAM.PARAM_VALUE)
            INTO M_PAY_RATE
            FROM T_ENTRUSTED_LIAB_MAPPING LIABMAP,
                 T_ENTRUSTED_LIAB_TYPE    LIABTYPE,
                 T_POLICY_PROD_LIAB       PRODLIAB,
                 T_POLICY_PRD_LIAB_PARAM  LIABPARAM
           WHERE LIABMAP.ENTRUSTED_TYPE_ID = LIABTYPE.TYPE_ID
             AND LIABTYPE.MASTER_TYPE_ID = PRODLIAB.LIAB_ID
             AND PRODLIAB.CONFIG_ID = LIABPARAM.PARAM_ID
             AND LIABMAP.LIAB_ID = I_LIAB_ID
             AND PRODLIAB.ITEM_ID = I_ITEM_ID
             AND PRODLIAB.LIAB_TYPE = '2'
             AND LIABPARAM.PARAM_TYPE = '6';
       END IF;
     END IF;

     O_PARAM_VALUE := 1-M_PAY_RATE;--自付比例=1-给付比例

 end P_CLM_ACCUTOR_G38;

 --健康委托管理合同
 --住院津贴保障金责任的分单住院日额津贴*免赔天数
 procedure P_CLM_ACCUTOR_G39(I_CASE_ID        in number, --caseId
                             I_ITEM_ID        in number, --ItemId
                             I_LIAB_ID        in number, --责任Id
                             I_EXPLICIT_PARAM in number, -- 显式传入参数
                             I_PARAM1         in number, --参数1
                             I_PARAM2         in number, --参数2
                             O_PARAM_VALUE    out number,
                             I_SERVICE_COUNT  in number) is
   M_HOS_AMOUNT  NUMBER := 0;
   M_EXCEPT_DAYS NUMBER := 0;
   M_COUNT       NUMBER;
 begin
   SELECT COUNT(1)
     INTO M_COUNT
     FROM T_ENTRUSTED_LIAB_MAPPING LIABMAP,
          T_POLICY_PROD_LIAB       PRODLIAB,
          T_POLICY_PRD_LIAB_PARAM  LIABPARAM
    WHERE LIABMAP.ENTRUSTED_TYPE_ID = PRODLIAB.LIAB_ID
      AND PRODLIAB.CONFIG_ID = LIABPARAM.PARAM_ID
      AND LIABMAP.LIAB_ID = I_LIAB_ID
      AND PRODLIAB.ITEM_ID = I_ITEM_ID
      AND PRODLIAB.LIAB_TYPE = '2'
      AND LIABPARAM.PARAM_TYPE = '7';
   IF M_COUNT > 0 THEN
     --住院日额津贴
     SELECT TO_NUMBER(LIABPARAM.PARAM_VALUE)
       INTO M_HOS_AMOUNT
       FROM T_ENTRUSTED_LIAB_MAPPING LIABMAP,
            T_POLICY_PROD_LIAB       PRODLIAB,
            T_POLICY_PRD_LIAB_PARAM  LIABPARAM
      WHERE LIABMAP.ENTRUSTED_TYPE_ID = PRODLIAB.LIAB_ID
        AND PRODLIAB.CONFIG_ID = LIABPARAM.PARAM_ID
        AND LIABMAP.LIAB_ID = I_LIAB_ID
        AND PRODLIAB.ITEM_ID = I_ITEM_ID
        AND PRODLIAB.LIAB_TYPE = '2'
        AND LIABPARAM.PARAM_TYPE = '7';
   END IF;
   SELECT COUNT(1)
     INTO M_COUNT
     FROM T_ENTRUSTED_LIAB_MAPPING LIABMAP,
          T_POLICY_PROD_LIAB       PRODLIAB,
          T_POLICY_PRD_LIAB_PARAM  LIABPARAM
    WHERE LIABMAP.ENTRUSTED_TYPE_ID = PRODLIAB.LIAB_ID
      AND PRODLIAB.CONFIG_ID = LIABPARAM.PARAM_ID
      AND LIABMAP.LIAB_ID = I_LIAB_ID
      AND PRODLIAB.ITEM_ID = I_ITEM_ID
      AND PRODLIAB.LIAB_TYPE = '2'
      AND LIABPARAM.PARAM_TYPE = '3';
   IF M_COUNT > 0 THEN
     --免赔天数
     SELECT TO_NUMBER(LIABPARAM.PARAM_VALUE)
       INTO M_EXCEPT_DAYS
       FROM T_ENTRUSTED_LIAB_MAPPING LIABMAP,
            T_POLICY_PROD_LIAB       PRODLIAB,
            T_POLICY_PRD_LIAB_PARAM  LIABPARAM
      WHERE LIABMAP.ENTRUSTED_TYPE_ID = PRODLIAB.LIAB_ID
        AND PRODLIAB.CONFIG_ID = LIABPARAM.PARAM_ID
        AND LIABMAP.LIAB_ID = I_LIAB_ID
        AND PRODLIAB.ITEM_ID = I_ITEM_ID
        AND PRODLIAB.LIAB_TYPE = '2'
        AND LIABPARAM.PARAM_TYPE = '3';
   END IF;
   O_PARAM_VALUE := M_HOS_AMOUNT * M_EXCEPT_DAYS;

 end P_CLM_ACCUTOR_G39;

  procedure P_CLM_SERVICE_CNT_G1(I_CASE_ID       in number, --caseId
                                 O_SERVICE_COUNT out number) is
  begin
    select DAYS_IN_HOSPITAL
      into O_SERVICE_COUNT
      from T_CLAIM_CASE
     where CASE_ID = I_CASE_ID;
  end P_CLM_SERVICE_CNT_G1;

  procedure P_CLM_CALC_S1(I_CASE_ID       in number, --caseId
                          O_SERVICE_COUNT out number) is
  begin
    select DIAGNOSIS_COUNT
      into O_SERVICE_COUNT
      from T_CLAIM_CASE
     where CASE_ID = I_CASE_ID;
  end P_CLM_CALC_S1;

  procedure P_CLM_CALC_S2(I_CASE_ID       in number, --caseId
                          O_SERVICE_COUNT out number) is
  begin
    select DAYS_IN_HOSPITAL
      into O_SERVICE_COUNT
      from T_CLAIM_CASE
     where CASE_ID = I_CASE_ID;
  end P_CLM_CALC_S2;
procedure P_CLM_CALC_S3( -- 基本参数
                          I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                          -- 案件ID
                          I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                          -- 险种选项ID
                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                          -- 责任ID
                          -- 显式传入参数
                          I_EXPLICIT_PARAM in number,
                          -- 天数/周数 etc. 与表定津贴的周期相一致
                          -- 返回值
                          O_RET_STATUS out number,
                          -- 退出状态
                          O_CALC_AMOUNT out T_LIABILITY_PAY.CALCU_AMOUNT%type,
                          -- 理算结果
                          O_EXCEPT_ACCU out T_LIABILITY_PAY.EXCEPT_ACCU%type
                          -- 免赔额
                          ) is
  begin
    O_RET_STATUS  := 0;
    O_EXCEPT_ACCU := 0;

    O_CALC_AMOUNT :=I_EXPLICIT_PARAM;
  end P_CLM_CALC_S3;
  procedure P_RELATIVITY_CALC_GET_DATE(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type,
                                       I_ITEM_ID     in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                       I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                       O_RET_STATUS  out number,
                                       O_CALC_AMOUNT out varchar2) is
  begin
    O_RET_STATUS := 0;
    select NVL(ROUND(DEATH_DATE - ACCIDENT_TIME, 2), 0)
      into O_CALC_AMOUNT
      from R_CONTRACT_MASTER CM, T_CLAIM_CASE CC, R_CONTRACT_PRODUCT CP
     where CC.CASE_ID = I_CASE_ID
       and CM.POLICY_ID = CP.POLICY_ID
       and CP.ITEM_ID = I_ITEM_ID;
  end P_RELATIVITY_CALC_GET_DATE;
  procedure P_RELA_CALC_DAYS_AF_INCEP(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type,
                                      I_ITEM_ID     in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                      I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                      O_RET_STATUS  out number,
                                      O_CALC_AMOUNT out varchar2) is
    n_count               number := 0; --做过复效的次数
    m_count               number := 0;
    v_max_Revalidate_date date;
    v_policy_id number;
    begin
      select Policy_id into v_policy_id
      from r_contract_product cp
      where cp.item_id = I_ITEM_ID;
    --- 取得做过复效的次数
      n_count := PKG_LIFE_PS_POLICY_CHANGE.F_GET_REVALIDATE_COUNT(v_policy_id, sysdate);
      O_RET_STATUS := 0;
    --如果做过复效，则从复效日期开始计算，没有做过复效，则从生效日期开始计算
    if n_count > 0 then
      v_max_Revalidate_date:=PKG_LIFE_PS_POLICY_CHANGE.F_GET_MAX_REVALIDATE_DATE(v_policy_id,sysdate);
      select NVL(ROUND(ACCIDENT_TIME - v_max_Revalidate_date), 0)
        into O_CALC_AMOUNT
        from R_CONTRACT_MASTER CM, T_CLAIM_CASE CC, R_CONTRACT_PRODUCT CP
       where CC.CASE_ID = I_CASE_ID
         and CM.POLICY_ID = CP.POLICY_ID
         and CP.ITEM_ID = I_ITEM_ID;
    else

      select NVL(ROUND(ACCIDENT_TIME - cp.validate_date), 0)
        into O_CALC_AMOUNT
        from R_CONTRACT_MASTER CM, T_CLAIM_CASE CC, R_CONTRACT_PRODUCT CP
       where CC.CASE_ID = I_CASE_ID
         and CM.POLICY_ID = CP.POLICY_ID
         and CP.ITEM_ID = I_ITEM_ID;

      select count(1)
        into m_count
        from R_CONTRACT_PRODUCT CP
       where CP.ITEM_ID = I_ITEM_ID
         and CP.PRODUCT_ID in (65143,65913)
         and CP.POLICY_YEAR > 1;

      if m_count = 1 then
        select NVL(ROUND(ACCIDENT_TIME - add_months(cp.validate_date,-12*(cp.policy_year-1))), 0)
        into O_CALC_AMOUNT
        from R_CONTRACT_MASTER CM, T_CLAIM_CASE CC, R_CONTRACT_PRODUCT CP, T_CLAIM_POLICY P
       where CC.CASE_ID = I_CASE_ID
         and CM.POLICY_ID = CP.POLICY_ID
         and CP.ITEM_ID = I_ITEM_ID
         and P.POLICY_ID = CM.POLICY_ID
         and p.CASE_ID = CC.CASE_ID;
      end if;
    end if;
  end P_RELA_CALC_DAYS_AF_INCEP;

  --可续保产品计算方法
  procedure P_RELA_CALC_DAYS_AF_INCEP2(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type,
                                      I_ITEM_ID     in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                      I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                      O_RET_STATUS  out number,
                                      O_CALC_AMOUNT out varchar2) is
    n_count               number := 0; --做过复效的次数
    m_count               number := 0;
    v_max_Revalidate_date date;
    m_liab_category       t_liability.liab_category%type;
    m_calc_date           date;
    v_policy_id number;
  begin
    select Policy_id into v_policy_id
    from r_contract_product cp
    where cp.item_id = I_ITEM_ID;
    --- 取得做过复效的次数
    n_count := PKG_LIFE_PS_POLICY_CHANGE.F_GET_REVALIDATE_COUNT(v_policy_id, sysdate);
    O_RET_STATUS := 0;
    select liab_category
      into m_liab_category
      from t_liability
     where liab_id = i_liab_id;
     select decode(m_liab_category,
                   1,
                   death_date,
                   10,
                   death_date,
                   4,
                   diagnose_date,
                   accident_time)
       into m_calc_date
       from t_claim_case t
      where case_id = i_case_id;

    --如果做过复效，则从复效日期开始计算，没有做过复效，则从生效日期开始计算
    if n_count > 0 then
      v_max_Revalidate_date:=PKG_LIFE_PS_POLICY_CHANGE.F_GET_MAX_REVALIDATE_DATE(v_policy_id,sysdate);
      select nvl(round(m_calc_date - v_max_revalidate_date), 0)
        into o_calc_amount
        from t_claim_case cc
       where cc.case_id = i_case_id;

    else

      select NVL(ROUND(m_calc_date -
                       add_months(cp.validate_date,
                                  -12 * (cp.policy_year - 1))),
                 0)
        into O_CALC_AMOUNT
        from R_CONTRACT_MASTER  CM,
             T_CLAIM_CASE       CC,
             R_CONTRACT_PRODUCT CP,
             T_CLAIM_POLICY     P
       where CC.CASE_ID = I_CASE_ID
         and CM.POLICY_ID = CP.POLICY_ID
         and CP.ITEM_ID = I_ITEM_ID
         and P.POLICY_ID = CM.POLICY_ID
         and p.CASE_ID = CC.CASE_ID;

    end if;
  end P_RELA_CALC_DAYS_AF_INCEP2;

  -- intitial caculator param
  PROCEDURE P_INIT_CALCULATOR_PARAM(I_CASE_ID          IN NUMBER, --caseId
                                    I_ITEM_ID          IN NUMBER, --ItemId
                                    I_LIAB_ID          IN NUMBER, --责任Id
                                    I_ACCUTOR_PARAM_ID IN NUMBER, -- 参数ID
                                    O_PARAM1           OUT NUMBER,
                                    O_PARAM2           OUT NUMBER) AS
  BEGIN
    SELECT PARAM_1, PARAM_2
      INTO O_PARAM1, O_PARAM2
      FROM (SELECT 3, A.PARAM_1, A.PARAM_2
              FROM T_CONTRACT_ACCUTOR_PARAM A, T_CONTRACT_PRODUCT B
             WHERE A.ACCUTOR_PARAM_ID = I_ACCUTOR_PARAM_ID
               AND A.GROUP_POLICY_ID = B.POLICY_ID
               AND A.ASSUMPSIT_LEVEL = '3'
               AND A.INSURED_ID = B.INSURED_1
               AND B.ITEM_ID = I_ITEM_ID
            UNION
            SELECT 2, A.PARAM_1, A.PARAM_2
              FROM T_CONTRACT_ACCUTOR_PARAM A,
                   T_CONTRACT_PRODUCT       B,
                   T_INSURED_FIRST          C
             WHERE A.ACCUTOR_PARAM_ID = I_ACCUTOR_PARAM_ID
               AND A.GROUP_POLICY_ID = B.POLICY_ID
               AND A.ASSUMPSIT_LEVEL = '2'
               AND A.INSURED_ID IS NULL
               AND A.APPLY_LEVEL = C.BENEFIT_LEVEL
               AND B.POLICY_ID = C.POLICY_ID
               AND B.INSURED_1 = C.INSURED_ID
               AND B.ITEM_ID = I_ITEM_ID
            UNION
            SELECT 1, A.PARAM_1, A.PARAM_2
              FROM T_CONTRACT_ACCUTOR_PARAM A, T_CONTRACT_PRODUCT B
             WHERE A.ACCUTOR_PARAM_ID = I_ACCUTOR_PARAM_ID
               AND A.GROUP_POLICY_ID = B.POLICY_ID
               AND A.ASSUMPSIT_LEVEL = '1'
               AND A.INSURED_ID IS NULL
               AND A.APPLY_LEVEL IS NULL
               AND B.ITEM_ID = I_ITEM_ID
            UNION
            SELECT 0, A.PARAM_1, A.PARAM_2
              FROM T_ACCUTOR_PARAM A
             WHERE A.LIST_ID = I_ACCUTOR_PARAM_ID)
     WHERE ROWNUM < 2;
  END;
  -- return T_ACCUTOR_PARAM.PARAM_1
  PROCEDURE P_CALCULATOR_P1(I_CASE_ID          IN NUMBER, --caseId
                            I_ITEM_ID          IN NUMBER, --ItemId
                            I_LIAB_ID          IN NUMBER, --责任Id
                            I_ACCUTOR_PARAM_ID IN NUMBER, -- 参数ID
                            I_SERVICE_COUNT    IN NUMBER,
                            I_INPUT_AMOUNT     IN NUMBER,
                            O_PARAM_VALUE      OUT NUMBER) IS
    M_PARAM1 NUMBER;
    M_PARAM2 NUMBER;
  BEGIN
    P_INIT_CALCULATOR_PARAM(I_CASE_ID,
                            I_ITEM_ID,
                            I_LIAB_ID,
                            I_ACCUTOR_PARAM_ID,
                            M_PARAM1,
                            M_PARAM2);
    O_PARAM_VALUE := M_PARAM1;
  END P_CALCULATOR_P1;

  -- return T_ACCUTOR_PARAM.PARAM_2
  PROCEDURE P_CALCULATOR_P2(I_CASE_ID          IN NUMBER, --caseId
                            I_ITEM_ID          IN NUMBER, --ItemId
                            I_LIAB_ID          IN NUMBER, --责任Id
                            I_ACCUTOR_PARAM_ID IN NUMBER, -- 参数ID
                            I_SERVICE_COUNT    IN NUMBER,
                            I_INPUT_AMOUNT     IN NUMBER,
                            O_PARAM_VALUE      OUT NUMBER) IS
    M_PARAM1 NUMBER;
    M_PARAM2 NUMBER;
  BEGIN
    P_INIT_CALCULATOR_PARAM(I_CASE_ID,
                            I_ITEM_ID,
                            I_LIAB_ID,
                            I_ACCUTOR_PARAM_ID,
                            M_PARAM1,
                            M_PARAM2);
    O_PARAM_VALUE := M_PARAM2;
  END P_CALCULATOR_P2;

  -- return T_ACCUTOR_PARAM.NVL(PARAM_1,1) * NVL(PARAM_2,1)
  PROCEDURE P_CALCULATOR_P3(I_CASE_ID          IN NUMBER, --caseId
                            I_ITEM_ID          IN NUMBER, --ItemId
                            I_LIAB_ID          IN NUMBER, --责任Id
                            I_ACCUTOR_PARAM_ID IN NUMBER, -- 参数ID
                            I_SERVICE_COUNT    IN NUMBER,
                            I_INPUT_AMOUNT     IN NUMBER,
                            O_PARAM_VALUE      OUT NUMBER) IS
    M_ACC_DATE      DATE;
    M_SA            NUMBER := 0;
    M_UNIT          NUMBER := 1;
    M_BENEFIT_LEVEL VARCHAR2(20);
    M_PARAM1        NUMBER;
    M_PARAM2        NUMBER;
  BEGIN
    P_INIT_CALCULATOR_PARAM(I_CASE_ID,
                            I_ITEM_ID,
                            I_LIAB_ID,
                            I_ACCUTOR_PARAM_ID,
                            M_PARAM1,
                            M_PARAM2);
    O_PARAM_VALUE := NVL(M_PARAM1, 1) * NVL(M_PARAM1, 1);
  END P_CALCULATOR_P3;

  -- get plan on the accident date
--   FUNCTION F_GET_PLAN_NUM(I_CASE_ID IN NUMBER, --caseId
--                           I_ITEM_ID IN NUMBER) --ItemId
--    RETURN VARCHAR2 AS
--     M_COUNT         NUMBER;
--     M_CHANGE_ID     NUMBER;
--     M_INSURED_ID    NUMBER;
--     M_POLICY_ID     NUMBER;
--     M_VALIDATE_DATE DATE;
--     M_PRODUCT_NUM   NUMBER;
--     M_ACCIDENT_TIME DATE;
--     M_PLAN_NUM      VARCHAR2(4);
--   BEGIN
--     select insured_1, policy_id, product_num
--       into M_INSURED_ID, M_POLICY_ID, M_PRODUCT_NUM
--       from t_contract_product
--      where item_id = I_ITEM_ID;
--     SELECT accident_time
--       INTO M_ACCIDENT_TIME
--       from t_claim_case
--      where case_id = I_CASE_ID;
--     select count(*), min(b.validate_time)
--       into M_COUNT, m_validate_date
--       from t_contract_product_log a, t_policy_change b
--      where a.item_id = i_item_id
--        and a.old_new = 1
--        and b.change_status = 3
--        and b.validate_time > M_ACCIDENT_TIME
--        and a.change_id = b.change_id;
--     if M_COUNT > 0 then
--       select a.insured_1, a.policy_id, a.change_id
--         into m_insured_id, m_policy_id, m_change_id
--         from t_contract_product_log a, t_policy_change b
--        where a.item_id = i_item_id
--          and a.old_new = 1
--          and b.change_status = 3
--          and to_char(b.validate_time, 'yyyymmdd') =
--              to_char(m_validate_date, 'yyyymmdd')
--          and a.change_id = b.change_id
--          and rownum < 2
--        order by b.finish_time;
--       select count(*)
--         into m_count
--         from t_insured_first_log
--        where insured_id = m_insured_id
--          and change_id = m_change_id;
--       if m_count > 0 then
--         select benefit_level
--           into m_plan_num
--           from t_insured_first_log
--          where insured_id = m_insured_id
--            and policy_id = m_policy_id
--            and change_id = m_change_id
--            and old_new = '2';
--
--       else
--         select benefit_level
--           into M_PLAN_NUM
--           from t_insured_first
--          where insured_id = m_insured_id
--            and policy_id = m_policy_id;
--       end if;
--
--     else
--       select benefit_level
--         into m_plan_num
--         from t_insured_first
--        where insured_id = m_insured_id
--          and policy_id = m_policy_id;
--     end if;
--     RETURN m_plan_num;
--   END;

  -- get value from the parameter of the policy plan
--   PROCEDURE P_CALCULATOR_P4(I_CASE_ID          IN NUMBER, --caseId
--                             I_ITEM_ID          IN NUMBER, --ItemId
--                             I_LIAB_ID          IN NUMBER, --责任Id
--                             I_ACCUTOR_PARAM_ID IN NUMBER, -- 参数ID
--                             I_SERVICE_COUNT    IN NUMBER,
--                             I_INPUT_AMOUNT     IN NUMBER,
--                             O_PARAM_VALUE      OUT NUMBER) is
--     M_PLAN_NUM VARCHAR2(4);
--     M_PARAM    NUMBER;
--   BEGIN
--     M_PLAN_NUM := F_GET_PLAN_NUM(I_CASE_ID, I_ITEM_ID);
--   exception
--     when others then
--       p_error(-1,
--               'Param code/value not exists: accutor parameter=' ||
--               I_ACCUTOR_PARAM_ID || ' and plan_num=' || M_PLAN_NUM);
--   END P_CALCULATOR_P4;

  -- return T_ACCUTOR_PARAM.NVL(PARAM_1,1) * NVL(PARAM_2,1) * SA
  PROCEDURE P_CALCULATOR_P5(I_CASE_ID          IN NUMBER, --caseId
                            I_ITEM_ID          IN NUMBER, --ItemId
                            I_LIAB_ID          IN NUMBER, --责任Id
                            I_ACCUTOR_PARAM_ID IN NUMBER, -- 参数ID
                            I_SERVICE_COUNT    IN NUMBER,
                            I_INPUT_AMOUNT     IN NUMBER,
                            O_PARAM_VALUE      OUT NUMBER) IS
    M_ACC_DATE      DATE;
    M_SA            NUMBER := 0;
    M_UNIT          NUMBER := 1;
    M_BENEFIT_LEVEL VARCHAR2(20);
    M_PARAM1        NUMBER;
    M_PARAM2        NUMBER;
  BEGIN
    P_INIT_CALCULATOR_PARAM(I_CASE_ID,
                            I_ITEM_ID,
                            I_LIAB_ID,
                            I_ACCUTOR_PARAM_ID,
                            M_PARAM1,
                            M_PARAM2);
    -- 取得指定投保险种（保单结构）在指定时间的实际保额以及份数和档次
    SELECT ACCIDENT_TIME
      INTO M_ACC_DATE
      FROM T_CLAIM_CASE
     WHERE CASE_ID = I_CASE_ID;
    pkg_life_uw_interface.p_get_cont_prod_actual_amount(I_ITEM_ID,
                                                        M_ACC_DATE,
                                                        M_SA,
                                                        M_UNIT,
                                                        M_BENEFIT_LEVEL);
    -- 加上累计红利保额
    select M_SA + NVL(tcp.bonus_sa, 0)
      INTO M_SA
      from r_contract_product tcp
     where tcp.item_id = I_ITEM_ID;
    O_PARAM_VALUE := NVL(M_PARAM1, 1) * NVL(M_PARAM1, 2) * M_SA;
  END P_CALCULATOR_P5;

  -- return NVL(T_ACCUTOR_PARAM.PARAM_1,1) * NVL(PARAM_2,1) * UNIT
  PROCEDURE P_CALCULATOR_P6(I_CASE_ID          IN NUMBER, --caseId
                            I_ITEM_ID          IN NUMBER, --ItemId
                            I_LIAB_ID          IN NUMBER, --责任Id
                            I_ACCUTOR_PARAM_ID IN NUMBER, -- 参数ID
                            I_SERVICE_COUNT    IN NUMBER,
                            I_INPUT_AMOUNT     IN NUMBER,
                            O_PARAM_VALUE      OUT NUMBER) is
    M_PARAM1 NUMBER;
    M_PARAM2 NUMBER;
  BEGIN
    P_INIT_CALCULATOR_PARAM(I_CASE_ID,
                            I_ITEM_ID,
                            I_LIAB_ID,
                            I_ACCUTOR_PARAM_ID,
                            M_PARAM1,
                            M_PARAM2);
    O_PARAM_VALUE := NVL(M_PARAM1, 1) * NVL(M_PARAM2, 1) *
                     PKG_LS_CLM_CALC.F_GETUNIT(I_CASE_ID, I_ITEM_ID);
  END P_CALCULATOR_P6;

  -- get the liability amount
--   PROCEDURE P_CALCULATOR_P7(I_CASE_ID          IN NUMBER, --caseId
--                             I_ITEM_ID          IN NUMBER, --ItemId
--                             I_LIAB_ID          IN NUMBER, --责任Id
--                             I_ACCUTOR_PARAM_ID IN NUMBER, -- 参数ID
--                             I_SERVICE_COUNT    IN NUMBER,
--                             I_INPUT_AMOUNT     IN NUMBER,
--                             O_PARAM_VALUE      OUT NUMBER) is
--     M_PLAN_NUM      VARCHAR2(4);
--     m_insured_id    number;
--     m_policy_id     number;
--     m_change_id     number;
--     m_product_num   char(3);
--     m_validate_date date;
--     m_count         number;
--   begin
--     M_PLAN_NUM := F_GET_PLAN_NUM(I_CASE_ID, I_ITEM_ID);
--   exception
--     when others then
--       p_error(-1,
--               'Param value not exists: liab_id=' || I_LIAB_ID ||
--               ' and plan_num=' || M_PLAN_NUM);
--   END P_CALCULATOR_P7;

  -- get account value of  sub-policy
  -- Can be referred to account_name and account attached
--   PROCEDURE P_CALCULATOR_P8(I_CASE_ID          IN NUMBER, --caseId
--                             I_ITEM_ID          IN NUMBER, --ItemId
--                             I_LIAB_ID          IN NUMBER, --责任Id
--                             I_ACCUTOR_PARAM_ID IN NUMBER, -- 参数ID
--                             I_SERVICE_COUNT    IN NUMBER,
--                             I_INPUT_AMOUNT     IN NUMBER,
--                             O_PARAM_VALUE      OUT NUMBER) is
--     M_ACCOUNT_NAME  VARCHAR2(100);
--     M_ATTACHED_TYPE NUMBER;
--   begin
--     SELECT A.PARAM_0, A.PARAM_1
--       INTO M_ACCOUNT_NAME, M_ATTACHED_TYPE
--       FROM T_ACCUTOR_PARAM A
--      WHERE A.LIST_ID = I_ACCUTOR_PARAM_ID;
--     IF M_ATTACHED_TYPE IS NOT NULL AND M_ATTACHED_TYPE NOT IN (2, 3) THEN
--       P_ERROR(-1, 'ACCUTOR PARAM DEFINE ERROR: ' || I_ACCUTOR_PARAM_ID);
--     END IF;
--     SELECT nvl(sum(t.interest_capital), 0)
--       into O_param_value
--       from t_cust_deposit t
--      where t.item_id = I_ITEM_ID
--        and (t.account_name = m_account_name OR m_account_name IS NULL)
--        AND (T.ACCOUNT_ATT_TYPE = M_ATTACHED_TYPE OR M_ATTACHED_TYPE IS NULL);
--   END P_CALCULATOR_P8;

  -- get account value of  group policy
  -- can be referred to account name
--   PROCEDURE P_CALCULATOR_P9(I_CASE_ID          IN NUMBER, --caseId
--                             I_ITEM_ID          IN NUMBER, --ItemId
--                             I_LIAB_ID          IN NUMBER, --责任Id
--                             I_ACCUTOR_PARAM_ID IN NUMBER, -- 参数ID
--                             I_SERVICE_COUNT    IN NUMBER,
--                             I_INPUT_AMOUNT     IN NUMBER,
--                             O_PARAM_VALUE      OUT NUMBER) is
--     m_account_name varchar2(100);
--   begin
--     SELECT A.PARAM_0
--       INTO m_account_name
--       FROM T_ACCUTOR_PARAM A
--      WHERE A.LIST_ID = I_ACCUTOR_PARAM_ID;
--     select nvl(sum(t1.interest_capital), 0)
--       into O_PARAM_VALUE
--       from t_cust_deposit T1, t_group_product T2
--      where t1.POLICY_ID = T2.POLICY_ID
--        AND T1.GROUP_ITEM_ID = t1.item_id
--        AND (t2.policy_id, t2.product_num) in
--            (select policy_id, product_num
--               from t_contract_product
--              where item_id = I_item_id)
--        AND (T1.ACCOUNT_NAME = m_account_name OR m_account_name IS NULL);
--   END P_CALCULATOR_P9;

  -- get input value of other accutor
  PROCEDURE P_CALCULATOR_P11(I_CASE_ID          IN NUMBER, --caseId
                             I_ITEM_ID          IN NUMBER, --ItemId
                             I_LIAB_ID          IN NUMBER, --责任Id
                             I_ACCUTOR_PARAM_ID IN NUMBER, -- 参数ID
                             I_SERVICE_COUNT    IN NUMBER,
                             I_INPUT_AMOUNT     IN NUMBER,
                             O_PARAM_VALUE      OUT NUMBER) is
    M_ACCUTOR_CODE VARCHAR2(100);
  BEGIN
    SELECT A.PARAM_0
      INTO M_ACCUTOR_CODE
      FROM T_ACCUTOR_PARAM A
     WHERE A.LIST_ID = I_ACCUTOR_PARAM_ID;
    select input_amount
      into O_param_value
      from t_accution_list t
     where t.item_id = I_item_id
       and t.liab_id = I_liab_id
       and t.accutor_id =
           (SELECT ACCUTOR_ID
              FROM T_ACCUTOR
             WHERE ACCUTOR_CODE = M_ACCUTOR_CODE);
  END P_CALCULATOR_P11;

  -- get output value of other accutor
  PROCEDURE P_CALCULATOR_P12(I_CASE_ID          IN NUMBER, --caseId
                             I_ITEM_ID          IN NUMBER, --ItemId
                             I_LIAB_ID          IN NUMBER, --责任Id
                             I_ACCUTOR_PARAM_ID IN NUMBER, -- 参数ID
                             I_SERVICE_COUNT    IN NUMBER,
                             I_INPUT_AMOUNT     IN NUMBER,
                             O_PARAM_VALUE      OUT NUMBER) is
    M_ACCUTOR_CODE VARCHAR2(100);
  BEGIN
    SELECT A.PARAM_0
      INTO M_ACCUTOR_CODE
      FROM T_ACCUTOR_PARAM A
     WHERE A.LIST_ID = I_ACCUTOR_PARAM_ID;
    select output_amount
      into O_param_value
      from t_accution_list t
     where t.item_id = I_item_id
       and t.liab_id = I_liab_id
       and t.accutor_id =
           (SELECT ACCUTOR_ID
              FROM T_ACCUTOR
             WHERE ACCUTOR_CODE = M_ACCUTOR_CODE);
  END P_CALCULATOR_P12;

  -- get override value of other accutor
  PROCEDURE P_CALCULATOR_P13(I_CASE_ID          IN NUMBER, --caseId
                             I_ITEM_ID          IN NUMBER, --ItemId
                             I_LIAB_ID          IN NUMBER, --责任Id
                             I_ACCUTOR_PARAM_ID IN NUMBER, -- 参数ID
                             I_SERVICE_COUNT    IN NUMBER,
                             I_INPUT_AMOUNT     IN NUMBER,
                             O_PARAM_VALUE      OUT NUMBER) is
    M_ACCUTOR_CODE VARCHAR2(100);
  BEGIN
    SELECT A.PARAM_0
      INTO M_ACCUTOR_CODE
      FROM T_ACCUTOR_PARAM A
     WHERE A.LIST_ID = I_ACCUTOR_PARAM_ID;
    select actual_over
      into O_param_value
      from t_accution_list t
     where t.item_id = I_item_id
       and t.liab_id = I_liab_id
       and t.accutor_id =
           (SELECT ACCUTOR_ID
              FROM T_ACCUTOR
             WHERE ACCUTOR_CODE = M_ACCUTOR_CODE);
  END P_CALCULATOR_P13;
  /*取事故日期时的产品缴费状态*/
  PROCEDURE P_RELA_GET_PREM_STATUS(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type,
                                   I_ITEM_ID     in T_CONTRACT_PRODUCT.ITEM_ID%type,
                                   I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                   O_RET_STATUS  out number,
                                   O_CALC_AMOUNT out varchar2) IS
    r_contract_product t_contract_product%rowtype;
    n_count            number;
    v_accident_time    date;
  BEGIN
    select *
      into r_contract_product
      from t_contract_product cp
     where cp.item_id = I_ITEM_ID;

  select accident_time into v_accident_time
     from t_claim_case t where t.case_id=i_case_id;

    --1.log表事故日之前缴费状态发生过变化的，去事故日之前的缴费状态。
    n_count:=PKG_LIFE_NEWBIZ_CLM_ACCUMU.F_GET_PRODUCT_PREM_CHANGE_CNT(
        r_contract_product.policy_id,
        r_contract_product.item_id,
        v_accident_time);
    if n_count > 0 then
      O_CALC_AMOUNT:=PKG_LIFE_NEWBIZ_CLM_ACCUMU.F_GET_PRODUCT_PREM_CHG_VALUE(
          r_contract_product.policy_id,
          r_contract_product.item_id,
          v_accident_time
      );
    else
      O_CALC_AMOUNT := r_contract_product.prem_status;
    end if;
    --2.没有log表的取原表的缴费状态。
  END P_RELA_GET_PREM_STATUS;

  /*取案件是否在等待期内*/
  --等待期--事故
  PROCEDURE P_RELA_IS_ELIMINATION_PERIOD(I_CASE_ID               IN T_CLAIM_CASE.CASE_ID%type,
                                         I_ITEM_ID               IN T_POLICY_PRODUCT_EXT.ITEM_ID%type,
                                         I_LIAB_ID               IN T_PRODUCT_LIABILITY.LIAB_ID%type,
                                         O_RET_STATUS            OUT NUMBER,
                                         O_IS_ELIMINATION_PERIOD OUT VARCHAR2) IS
    M_ACCIDENT_TIME      T_CLAIM_CASE.ACCIDENT_TIME%type;
  BEGIN
    SELECT CC.ACCIDENT_TIME
      INTO M_ACCIDENT_TIME --取得事故时间
      FROM T_CLAIM_CASE CC
     WHERE CC.CASE_ID = I_CASE_ID;
     P_ELIMINATION_PERIOD_COMMON(I_CASE_ID,I_ITEM_ID,I_LIAB_ID,M_ACCIDENT_TIME,O_RET_STATUS,O_IS_ELIMINATION_PERIOD);
  END P_RELA_IS_ELIMINATION_PERIOD;

  --等待期--首次确诊日(固定为15天，如为连续投保，则不受等待期限制)
  PROCEDURE P_RELA_IS_ELIMINATION_PERIOD1(I_CASE_ID               IN T_CLAIM_CASE.CASE_ID%type,
                                          I_ITEM_ID               IN T_POLICY_PRODUCT_EXT.ITEM_ID%type,
                                          I_LIAB_ID               IN T_PRODUCT_LIABILITY.LIAB_ID%type,
                                          O_RET_STATUS            OUT NUMBER,
                                          O_IS_ELIMINATION_PERIOD OUT VARCHAR2) IS
    M_DIAGNOSE_TIME       T_CLAIM_CASE.DIAGNOSE_DATE%type;
    M_ELIMINATION_PERIOD  T_POLICY_PRODUCT_EXT.ELIMINATION_PERIOD%type;
    M_IS_CONTINUE_APPLY   T_POLICY_PRODUCT_EXT.IS_CONTINUE_APPLY%type;
    M_VALIDATE_DATE       R_CONTRACT_MASTER.VALIDATE_DATE%type;
    M_DIFFERENCE          NUMBER;
    M_COUNT               NUMBER:=0;
    V_RELATIVITY          varchar2(20);
    v_string              varchar2(2000);
    M_ACCIDENT_TIME       T_CLAIM_CASE.ACCIDENT_TIME%type;
    M_PRODUCT_ID          T_CONTRACT_PRODUCT.PRODUCT_ID%TYPE;
  BEGIN
    SELECT CC.DIAGNOSE_DATE,
           CC.ACCIDENT_TIME
      INTO M_DIAGNOSE_TIME, --首次确诊日
           M_ACCIDENT_TIME--事故日
      FROM T_CLAIM_CASE CC
     WHERE CC.CASE_ID = I_CASE_ID;

    SELECT count(*)
      INTO m_count
      FROM T_CONTRACT_PRODUCT_EXT CPE
      WHERE CPE.ITEM_ID = I_ITEM_ID;

SELECT PRODUCT_ID INTO M_PRODUCT_ID FROM T_CONTRACT_PRODUCT WHERE ITEM_ID = I_ITEM_ID;

    IF(m_count>0) THEN
      IF M_PRODUCT_ID = 61183 THEN---从GROUP_PRODUCT 中取值
         SELECT DECODE(GP.IS_CONTINUE_APPLY,'Y','Y','N')
          INTO M_IS_CONTINUE_APPLY --取得是否连续投保
          FROM R_CONTRACT_PRODUCT CP,T_GROUP_PRODUCT GP
         WHERE CP.ITEM_ID = I_ITEM_ID
          AND CP.POLICY_ID = GP.POLICY_ID
          AND GP.PRODUCT_ID = M_PRODUCT_ID;
      ELSE
        SELECT DECODE(CPE.IS_CONTINUE_APPLY,'Y','Y','N')
          INTO M_IS_CONTINUE_APPLY --取得是否连续投保
          FROM T_CONTRACT_PRODUCT_EXT CPE
         WHERE CPE.ITEM_ID = I_ITEM_ID;
      END IF;
    --如果连续投保为是则等待期取0天，为否则通过82相关性获取等待期
       IF M_IS_CONTINUE_APPLY = 'Y' THEN
          O_IS_ELIMINATION_PERIOD := '0';
       ELSE
          --通过82-相关性获取等待期
          select distinct param_1
            into M_ELIMINATION_PERIOD
            from t_liab_pay_param a
           where a.product_id=(select product_id
                                 from r_contract_product cp
                                where cp.item_id = I_ITEM_ID)
             and a.liab_id = I_LIAB_ID
             and a.param_1 !=0;


                 SELECT CM.VALIDATE_DATE
                   INTO M_VALIDATE_DATE --取得保单生效日期
                   FROM R_CONTRACT_MASTER CM
                   WHERE CM.POLICY_ID = (SELECT CP.POLICY_ID
                                           FROM R_CONTRACT_PRODUCT CP
                                          WHERE CP.ITEM_ID = I_ITEM_ID);


                 IF M_PRODUCT_ID IN (61183,61184,70583,70581)THEN
                     SELECT (M_ACCIDENT_TIME - M_VALIDATE_DATE + 1) INTO M_DIFFERENCE FROM DUAL;
                   ELSE
                     SELECT (M_DIAGNOSE_TIME - M_VALIDATE_DATE + 1) INTO M_DIFFERENCE FROM DUAL;
                 END IF;
                 IF M_ELIMINATION_PERIOD > 0 THEN
                    IF M_DIFFERENCE <= M_ELIMINATION_PERIOD THEN
                       O_IS_ELIMINATION_PERIOD := '1';
                    ELSE
                       O_IS_ELIMINATION_PERIOD := '0';
                    END IF;
                 ELSE
                    O_IS_ELIMINATION_PERIOD := '0';
                 END IF;
               --END IF;
         END IF;
    ELSE
      O_IS_ELIMINATION_PERIOD := '0';
    END IF;
  END P_RELA_IS_ELIMINATION_PERIOD1;

  --等待期--身故
  PROCEDURE P_RELA_IS_ELI_PERIOD_DEATH(I_CASE_ID               IN T_CLAIM_CASE.CASE_ID%type,
                                         I_ITEM_ID               IN T_POLICY_PRODUCT_EXT.ITEM_ID%type,
                                         I_LIAB_ID               IN T_PRODUCT_LIABILITY.LIAB_ID%type,
                                         O_RET_STATUS            OUT NUMBER,
                                         O_IS_ELIMINATION_PERIOD OUT VARCHAR2) IS
    M_DEATH_TIME      T_CLAIM_CASE.Death_Date%type;
  BEGIN
    SELECT CC.DEATH_DATE
      INTO M_DEATH_TIME --取得身故时间
      FROM T_CLAIM_CASE CC
     WHERE CC.CASE_ID = I_CASE_ID;
     P_ELIMINATION_PERIOD_COMMON(I_CASE_ID,I_ITEM_ID,I_LIAB_ID,M_DEATH_TIME,O_RET_STATUS,O_IS_ELIMINATION_PERIOD);
  END P_RELA_IS_ELI_PERIOD_DEATH;


    procedure P_RELATIVITY_CALC_LIABILITY(
                                          -- 基本参数
                                          I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                          -- 案件ID
                                          I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                          -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                          -- 责任ID
                                          O_RET_STATUS out number,
                                          -- 退出状态
                                          O_LIABILITY_Relevant out varchar2 )  IS
     M_IS_CONTINUE_APPLY    T_POLICY_PRODUCT_EXT.IS_CONTINUE_APPLY%TYPE;
     M_COUNT              NUMBER:=0;
  BEGIN
    select count(*)
      into M_COUNT
      FROM T_CONTRACT_PRODUCT_EXT CPE
     WHERE CPE.ITEM_ID = I_ITEM_ID;

    if(M_COUNT>0) then
      SELECT DECODE(CPE.IS_CONTINUE_APPLY,'Y','1','0')
        INTO O_LIABILITY_Relevant --取得是否连续投保
        FROM T_CONTRACT_PRODUCT_EXT CPE
       WHERE CPE.ITEM_ID = I_ITEM_ID;
      else
        O_LIABILITY_Relevant:='0';
    end if;
  END  P_RELATIVITY_CALC_LIABILITY;

  --等待期--全残
  PROCEDURE P_RELA_IS_ELI_PERIOD_DISABLE(I_CASE_ID               IN T_CLAIM_CASE.CASE_ID%type,
                                         I_ITEM_ID               IN T_POLICY_PRODUCT_EXT.ITEM_ID%type,
                                         I_LIAB_ID               IN T_PRODUCT_LIABILITY.LIAB_ID%type,
                                         O_RET_STATUS            OUT NUMBER,
                                         O_IS_ELIMINATION_PERIOD OUT VARCHAR2) IS
    M_DISABLE_TIME       T_CLAIM_CASE.DISABLE_DATE%type;
  BEGIN
    SELECT CC.DISABLE_DATE
      INTO M_DISABLE_TIME --取得全残时间
      FROM T_CLAIM_CASE CC
     WHERE CC.CASE_ID = I_CASE_ID;
     P_ELIMINATION_PERIOD_COMMON(I_CASE_ID,I_ITEM_ID,I_LIAB_ID,M_DISABLE_TIME,O_RET_STATUS,O_IS_ELIMINATION_PERIOD);
  END P_RELA_IS_ELI_PERIOD_DISABLE;

  --等待期--首次确诊日
  PROCEDURE P_RELA_IS_ELI_PERIOD_DIAGNOSE(I_CASE_ID               IN T_CLAIM_CASE.CASE_ID%type,
                                          I_ITEM_ID               IN T_POLICY_PRODUCT_EXT.ITEM_ID%type,
                                          I_LIAB_ID               IN T_PRODUCT_LIABILITY.LIAB_ID%type,
                                          O_RET_STATUS            OUT NUMBER,
                                          O_IS_ELIMINATION_PERIOD OUT VARCHAR2) IS
    M_DIAGNOSE_TIME       T_CLAIM_CASE.DIAGNOSE_DATE%type;
  BEGIN
    SELECT CC.DIAGNOSE_DATE
      INTO M_DIAGNOSE_TIME --首次确诊日
      FROM T_CLAIM_CASE CC
     WHERE CC.CASE_ID = I_CASE_ID;
     P_ELIMINATION_PERIOD_COMMON(I_CASE_ID,I_ITEM_ID,I_LIAB_ID,M_DIAGNOSE_TIME,O_RET_STATUS,O_IS_ELIMINATION_PERIOD);
  END P_RELA_IS_ELI_PERIOD_DIAGNOSE;

  --等待期--首次确诊日(固定为30天，如为连续投保，则不受等待期限制)
  PROCEDURE P_RELA_IS_ELI_PERIOD_DIAGNOSE1(I_CASE_ID               IN T_CLAIM_CASE.CASE_ID%type,
                                          I_ITEM_ID               IN T_POLICY_PRODUCT_EXT.ITEM_ID%type,
                                          I_LIAB_ID               IN T_PRODUCT_LIABILITY.LIAB_ID%type,
                                          O_RET_STATUS            OUT NUMBER,
                                          O_IS_ELIMINATION_PERIOD OUT VARCHAR2) IS
    M_DIAGNOSE_TIME       T_CLAIM_CASE.DIAGNOSE_DATE%type;
    M_ELIMINATION_PERIOD T_POLICY_PRODUCT_EXT.ELIMINATION_PERIOD%type;
    M_VALIDATE_DATE      R_CONTRACT_MASTER.VALIDATE_DATE%type;
    M_DIFFERENCE         NUMBER;
    M_COUNT              NUMBER:=0;
  BEGIN
    SELECT CC.DIAGNOSE_DATE
      INTO M_DIAGNOSE_TIME --首次确诊日
      FROM T_CLAIM_CASE CC
     WHERE CC.CASE_ID = I_CASE_ID;

    SELECT count(*)
      INTO m_count
      FROM T_CONTRACT_PRODUCT_EXT CPE
      WHERE CPE.ITEM_ID = I_ITEM_ID;

    IF(m_count>0) THEN
    --如果连续投保为是则等待期取0天，为否则等待期取30天
    SELECT DECODE(CPE.IS_CONTINUE_APPLY,'Y',0, 30)
      INTO M_ELIMINATION_PERIOD --取得等待期
      FROM T_CONTRACT_PRODUCT_EXT CPE
     WHERE CPE.ITEM_ID = I_ITEM_ID;
    ELSE
      M_ELIMINATION_PERIOD:=0;
    END IF;

    SELECT CM.VALIDATE_DATE
      INTO M_VALIDATE_DATE --取得保单生效日期
      FROM R_CONTRACT_MASTER CM
     WHERE CM.POLICY_ID = (SELECT CP.POLICY_ID
                             FROM R_CONTRACT_PRODUCT CP
                            WHERE CP.ITEM_ID = I_ITEM_ID);
    SELECT (M_DIAGNOSE_TIME - M_VALIDATE_DATE + 1) INTO M_DIFFERENCE FROM DUAL;
    IF M_ELIMINATION_PERIOD > 0 THEN
      IF M_DIFFERENCE <= M_ELIMINATION_PERIOD THEN
        O_IS_ELIMINATION_PERIOD := '1';
      ELSE
        O_IS_ELIMINATION_PERIOD := '0';
      END IF;
    ELSE
      O_IS_ELIMINATION_PERIOD := '0';
    END IF;
  END P_RELA_IS_ELI_PERIOD_DIAGNOSE1;

  --等待期--全残(固定为30天，如为连续投保，则不受等待期限制)
  PROCEDURE P_RELA_IS_ELI_PERIOD_DISABLE1(I_CASE_ID               IN T_CLAIM_CASE.CASE_ID%type,
                                          I_ITEM_ID               IN T_POLICY_PRODUCT_EXT.ITEM_ID%type,
                                          I_LIAB_ID               IN T_PRODUCT_LIABILITY.LIAB_ID%type,
                                          O_RET_STATUS            OUT NUMBER,
                                          O_IS_ELIMINATION_PERIOD OUT VARCHAR2) IS
    M_DISABLE_TIME       T_CLAIM_CASE.DISABLE_DATE%type;
    M_ELIMINATION_PERIOD T_POLICY_PRODUCT_EXT.ELIMINATION_PERIOD%type;
    R_VALIDATE_DATE      T_CONTRACT_MASTER.VALIDATE_DATE%type;
    M_DIFFERENCE         NUMBER;
    M_COUNT              NUMBER:=0;
  BEGIN
     SELECT CC.DISABLE_DATE
      INTO M_DISABLE_TIME --取得全残时间
      FROM T_CLAIM_CASE CC
     WHERE CC.CASE_ID = I_CASE_ID;

    P_ELIMINATION_COMMON(I_CASE_ID,I_ITEM_ID,I_LIAB_ID,M_DISABLE_TIME,O_RET_STATUS,O_IS_ELIMINATION_PERIOD);
  END P_RELA_IS_ELI_PERIOD_DISABLE1;

  --等待期--身故(固定为30天，如为连续投保，则不受等待期限制)
  PROCEDURE P_RELA_IS_ELI_PERIOD_DEATH1(I_CASE_ID               IN T_CLAIM_CASE.CASE_ID%type,
                                          I_ITEM_ID               IN T_POLICY_PRODUCT_EXT.ITEM_ID%type,
                                          I_LIAB_ID               IN T_PRODUCT_LIABILITY.LIAB_ID%type,
                                          O_RET_STATUS            OUT NUMBER,
                                          O_IS_ELIMINATION_PERIOD OUT VARCHAR2) IS
    M_DEATH_TIME       T_CLAIM_CASE.DEATH_DATE%type;
    M_ELIMINATION_PERIOD T_POLICY_PRODUCT_EXT.ELIMINATION_PERIOD%type;
    M_VALIDATE_DATE      R_CONTRACT_MASTER.VALIDATE_DATE%type;
    M_DIFFERENCE         NUMBER;
    M_COUNT              NUMBER:=0;
  BEGIN
    SELECT CC.DEATH_DATE
      INTO M_DEATH_TIME --取得身故时间
      FROM T_CLAIM_CASE CC
     WHERE CC.CASE_ID = I_CASE_ID;

   P_ELIMINATION_COMMON(I_CASE_ID,I_ITEM_ID,I_LIAB_ID,M_DEATH_TIME,O_RET_STATUS,O_IS_ELIMINATION_PERIOD);

  END P_RELA_IS_ELI_PERIOD_DEATH1;


  --等待期--事故发生日(固定为30天，如为连续投保，则不受等待期限制)
  PROCEDURE P_RELA_IS_ELI_PERIOD_ACCIDENT(I_CASE_ID               IN T_CLAIM_CASE.CASE_ID%type,
                                          I_ITEM_ID               IN T_POLICY_PRODUCT_EXT.ITEM_ID%type,
                                          I_LIAB_ID               IN T_PRODUCT_LIABILITY.LIAB_ID%type,
                                          O_RET_STATUS            OUT NUMBER,
                                          O_IS_ELIMINATION_PERIOD OUT VARCHAR2) IS
    M_ACC_DATE       T_CLAIM_CASE.ACCIDENT_TIME%type;
    M_ELIMINATION_PERIOD T_POLICY_PRODUCT_EXT.ELIMINATION_PERIOD%type;
    M_VALIDATE_DATE      R_CONTRACT_MASTER.VALIDATE_DATE%type;
    M_DIFFERENCE         NUMBER;
    M_COUNT              NUMBER:=0;
  BEGIN
    select TCC.ACCIDENT_TIME -- 事故发生日期
      into M_ACC_DATE
      from T_CLAIM_CASE TCC
     where TCC.CASE_ID = I_CASE_ID;

    P_ELIMINATION_COMMON(I_CASE_ID,I_ITEM_ID,I_LIAB_ID,M_ACC_DATE,O_RET_STATUS,O_IS_ELIMINATION_PERIOD);

  END P_RELA_IS_ELI_PERIOD_ACCIDENT;

  --等待期--首次确诊日--责任级
  PROCEDURE P_RELA_IS_ELI_PERIOD_DIA_LIAB(I_CASE_ID               IN T_CLAIM_CASE.CASE_ID%type,
                                               I_ITEM_ID               IN T_POLICY_PRODUCT_EXT.ITEM_ID%type,
                                               I_LIAB_ID               IN T_PRODUCT_LIABILITY.LIAB_ID%type,
                                               O_RET_STATUS            OUT NUMBER,
                                               O_IS_ELIMINATION_PERIOD OUT VARCHAR2) IS
    M_DIAGNOSE_TIME       T_CLAIM_CASE.DIAGNOSE_DATE%type;
    M_DATE                DATE;
    M_COUNT               NUMBER;
  BEGIN
    SELECT COUNT(*)
      INTO M_COUNT
      FROM T_CLAIM_CASE T
     WHERE T.CASE_ID = I_CASE_ID
       AND T.BATCH_ID IS NOT NULL;
    IF M_COUNT = 1 THEN
      SELECT CC.ACCIDENT_TIME
        INTO M_DATE --取得事故时间
        FROM T_CLAIM_CASE CC
       WHERE CC.CASE_ID = I_CASE_ID;
    ELSE
      SELECT CC.DIAGNOSE_DATE
        INTO M_DATE --首次确诊日
        FROM T_CLAIM_CASE CC
       WHERE CC.CASE_ID = I_CASE_ID;
    END IF;
     P_ELI_PERIOD_LIAB_COMMON(I_CASE_ID,I_ITEM_ID,I_LIAB_ID,M_DATE,O_RET_STATUS,O_IS_ELIMINATION_PERIOD);
  END P_RELA_IS_ELI_PERIOD_DIA_LIAB;

  PROCEDURE P_ELIMINATION_PERIOD_COMMON(I_CASE_ID               IN T_CLAIM_CASE.CASE_ID%type,
                                         I_ITEM_ID               IN T_POLICY_PRODUCT_EXT.ITEM_ID%type,
                                         I_LIAB_ID               IN T_PRODUCT_LIABILITY.LIAB_ID%type,
                                         I_TIME                  IN DATE,--事故，全残，身故时间
                                         O_RET_STATUS            OUT NUMBER,
                                         O_IS_ELIMINATION_PERIOD OUT VARCHAR2) IS
    M_ELIMINATION_PERIOD T_POLICY_PRODUCT_EXT.ELIMINATION_PERIOD%type;
    M_VALIDATE_DATE      R_CONTRACT_MASTER.VALIDATE_DATE%type;
    M_DIFFERENCE         NUMBER;
    M_COUNT              NUMBER:=0;
  BEGIN
    select count(*)
    into m_count
    FROM T_CONTRACT_PRODUCT_EXT CPE
    WHERE CPE.ITEM_ID = I_ITEM_ID;

    if(m_count>0) then
    SELECT DECODE(CPE.IS_CONTINUE_APPLY,'Y',0, CPE.ELIMINATION_PERIOD)
      INTO M_ELIMINATION_PERIOD --取得等待期
      FROM T_CONTRACT_PRODUCT_EXT CPE
     WHERE CPE.ITEM_ID = I_ITEM_ID;
    else
      M_ELIMINATION_PERIOD:=0;
    end if;

    SELECT CM.VALIDATE_DATE
      INTO M_VALIDATE_DATE --取得保单生效日期
      FROM R_CONTRACT_MASTER CM
     WHERE CM.POLICY_ID = (SELECT CP.POLICY_ID
                             FROM R_CONTRACT_PRODUCT CP
                            WHERE CP.ITEM_ID = I_ITEM_ID);
    SELECT (I_TIME - M_VALIDATE_DATE + 1) INTO M_DIFFERENCE FROM DUAL;
    IF M_ELIMINATION_PERIOD > 0 THEN
      IF M_DIFFERENCE <= M_ELIMINATION_PERIOD THEN
        O_IS_ELIMINATION_PERIOD := '1';
      ELSE
        O_IS_ELIMINATION_PERIOD := '0';
      END IF;
    ELSE
      O_IS_ELIMINATION_PERIOD := '0';
    END IF;

  END P_ELIMINATION_PERIOD_COMMON;

  PROCEDURE P_ELI_PERIOD_LIAB_COMMON(I_CASE_ID               IN T_CLAIM_CASE.CASE_ID%type,
                                             I_ITEM_ID               IN T_POLICY_PRODUCT_EXT.ITEM_ID%type,
                                             I_LIAB_ID               IN T_PRODUCT_LIABILITY.LIAB_ID%type,
                                             I_TIME                  IN DATE,--事故，全残，身故时间
                                             O_RET_STATUS            OUT NUMBER,
                                             O_IS_ELIMINATION_PERIOD OUT VARCHAR2) IS
    M_ELIMINATION_PERIOD T_CONTRACT_LIAB_PAY_PARAM.ELIMINATION_PERIOD%type;
    M_VALIDATE_DATE      R_CONTRACT_MASTER.VALIDATE_DATE%type;
    M_IS_CONTINUE        T_CONTRACT_PRODUCT_EXT.IS_CONTINUE_APPLY%TYPE;
    M_DIFFERENCE         NUMBER;
    M_COUNT1             NUMBER:=0;
    M_COUNT2             NUMBER:=0;
  BEGIN
    select count(*)
    into m_count1
    FROM T_CONTRACT_LIAB_PAY_PARAM CP
    WHERE CP.ITEM_ID = I_ITEM_ID
     AND  CP.LIAB_ID = I_LIAB_ID;

    select count(*)
    into m_count2
    FROM T_CONTRACT_PRODUCT_EXT CPE
    WHERE CPE.ITEM_ID = I_ITEM_ID;

    if(m_count1>0) AND (m_count2>0) then
    SELECT NVL(CPE.IS_CONTINUE_APPLY,'W')
     INTO  M_IS_CONTINUE
    FROM T_CONTRACT_PRODUCT_EXT CPE
     WHERE CPE.ITEM_ID = I_ITEM_ID;

    SELECT DECODE(M_IS_CONTINUE,'Y',0, CP.ELIMINATION_PERIOD)
      INTO M_ELIMINATION_PERIOD --取得等待期
      FROM T_CONTRACT_LIAB_PAY_PARAM CP
     WHERE CP.ITEM_ID = I_ITEM_ID
       AND CP.LIAB_ID = I_LIAB_ID;
    else
      M_ELIMINATION_PERIOD:=0;
    end if;

    SELECT CM.VALIDATE_DATE
      INTO M_VALIDATE_DATE --取得保单生效日期
      FROM R_CONTRACT_MASTER CM
     WHERE CM.POLICY_ID = (SELECT CP.POLICY_ID
                             FROM R_CONTRACT_PRODUCT CP
                            WHERE CP.ITEM_ID = I_ITEM_ID);
    SELECT (I_TIME - M_VALIDATE_DATE + 1) INTO M_DIFFERENCE FROM DUAL;
    IF M_ELIMINATION_PERIOD > 0 THEN
      IF M_DIFFERENCE <= M_ELIMINATION_PERIOD THEN
        O_IS_ELIMINATION_PERIOD := '1';
      ELSE
        O_IS_ELIMINATION_PERIOD := '0';
      END IF;
    ELSE
      O_IS_ELIMINATION_PERIOD := '0';
    END IF;

  END P_ELI_PERIOD_LIAB_COMMON;

  /*距事故日仍然生存的天数计算方法*/
  PROCEDURE P_RELA_GET_ALIVE_DATE(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type, --caseId
                                  I_ITEM_ID     in R_CONTRACT_PRODUCT.ITEM_ID%type, --ItemId
                                  I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type, --责任Id
                                  O_RET_STATUS  out number,
                                  O_CALC_AMOUNT out varchar2) IS
  BEGIN
    SELECT NVL(ROUND(APPLY_TIME - ACCIDENT_TIME, 2), 0)
      INTO O_CALC_AMOUNT
      FROM T_CLAIM_CASE
     WHERE CASE_ID = I_CASE_ID;
    IF O_CALC_AMOUNT = 9999999 THEN
      P_ERROR(41308, '请检查是否填写签收日期');
    END IF;
  END P_RELA_GET_ALIVE_DATE;

  /*给付开始年龄或年限*/
  PROCEDURE P_RELATIVITY_CALC_PAY_AGE(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type, --caseId
                                  I_ITEM_ID     in T_CONTRACT_PRODUCT.ITEM_ID%type, --ItemId
                                  I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type, --责任Id
                                  O_RET_STATUS  out number,
                                  O_CALC_AMOUNT out varchar2) IS
  BEGIN
    SELECT T.PAY_YEAR
      INTO O_CALC_AMOUNT
      FROM T_CONTRACT_PRODUCT T
     WHERE T.ITEM_ID = I_ITEM_ID;
    IF O_CALC_AMOUNT is null THEN
      P_ERROR(41308, '请检查给付开始年龄或年限');
    END IF;
  END P_RELATIVITY_CALC_PAY_AGE;
  /*身故日期距离保单生效日的天数*/
  PROCEDURE P_DAYS_BETWEEN_DEATH_AND_VALI(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type, --caseId
                                          I_ITEM_ID     in R_CONTRACT_PRODUCT.ITEM_ID%type, --ItemId
                                          I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type, --责任Id
                                          O_RET_STATUS  out number,
                                          O_CALC_AMOUNT out varchar2) IS
    v_death_date date;
    v_validate_date date;
  BEGIN
    select cc.death_date
      into v_death_date
      from t_claim_case cc
     where cc.case_id = I_CASE_ID;
    IF v_death_date is null THEN
      P_ERROR(41308, '请检查是否填写身故日期');
    END IF;
        select cp.validate_date
      into v_validate_date
      from r_contract_product cp
     where cp.item_id = I_ITEM_ID;

     O_CALC_AMOUNT := round(v_death_date - v_validate_date,2);
  END P_DAYS_BETWEEN_DEATH_AND_VALI;
      /*全残日期距离保单生效日的天数*/
  PROCEDURE P_DAYS_BETWEEN_DISA_AND_VALI(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type, --caseId
                                          I_ITEM_ID     in R_CONTRACT_PRODUCT.ITEM_ID%type, --ItemId
                                          I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type, --责任Id
                                          O_RET_STATUS  out number,
                                          O_CALC_AMOUNT out varchar2) IS
    v_disable_date date;
    v_validate_date date;
  BEGIN
    select cc.disable_date
      into v_disable_date
      from t_claim_case cc
     where cc.case_id = I_CASE_ID;
    IF v_disable_date is null THEN
      P_ERROR(41308, '请检查是否填写全残日期');
    END IF;
    select cp.validate_date
      into v_validate_date
      from r_contract_product cp
     where cp.item_id = I_ITEM_ID;

     O_CALC_AMOUNT := round(v_disable_date - v_validate_date,2);
  END P_DAYS_BETWEEN_DISA_AND_VALI;

  /*得到身故距离保单生效日或最后复效日的天数*/
  PROCEDURE P_DAYS_DEATH_AND_LAST_VALID(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                                        I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                                        I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                                        O_RET_STATUS out number,                         -- 退出状态
                                        O_CALC_AMOUNT out varchar2                       -- 理算结果
                                        ) IS
    v_death_date    date;
    v_last_validate_date  date;
    v_product_id  R_CONTRACT_PRODUCT.PRODUCT_ID%TYPE;
  BEGIN
    select cc.death_date
      into v_death_date
      from t_claim_case cc
     where cc.case_id = I_CASE_ID;
    if v_death_date is null then
      p_error(41308, '请检查是否填写身故日期');
    end if;
    v_last_validate_date:=PKG_LIFE_PS_POLICY_CHANGE.F_GET_LAST_VALIDATE_DATE(I_ITEM_ID,v_death_date);
    if v_last_validate_date  is null then
       select  a.validate_date
         into  v_last_validate_date
         from  r_contract_master a,
               r_contract_product b
        where  a.policy_id = b.policy_id
          and  b.item_id = I_ITEM_ID;
     end if;
     O_CALC_AMOUNT := round(v_death_date - v_last_validate_date,2);
  END P_DAYS_DEATH_AND_LAST_VALID;


  /*得到身故距离险种生效日或最后复效日的天数*/
  PROCEDURE P_DAYS_DEATH_TO_LAST_VALID(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                                        I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                                        I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                                        O_RET_STATUS out number,                         -- 退出状态
                                        O_CALC_AMOUNT out varchar2                       -- 理算结果
                                        ) IS
    v_death_date    date;
    v_last_validate_date  date;
    v_count  number;
    V_POLICY_ID NUMBER;
  BEGIN
    select cc.death_date
      into v_death_date
      from t_claim_case cc
     where cc.case_id = I_CASE_ID;
    SELECT POLICY_ID
    INTO V_POLICY_ID
    FROM R_CONTRACT_PRODUCT
    WHERE ITEM_ID=I_ITEM_ID;

    if v_death_date is null then
      O_CALC_AMOUNT :=9999999998;
      return;
    end if;
    v_last_validate_date:=PKG_LIFE_PS_POLICY_CHANGE.F_GET_MAX_REVALIDATE_DATE(V_POLICY_ID,V_DEATH_DATE);
    if v_last_validate_date  is null then
       select  a.validate_date
         into  v_last_validate_date
         from  r_contract_product a
        where  a.item_id = I_ITEM_ID;
     else
       select  count(1)
         into  v_count
         from  r_contract_product a
        where  a.item_id = I_ITEM_ID
          and  a.validate_date >= v_last_validate_date;
          if v_count > 0 then
            select  a.validate_date
            into  v_last_validate_date
            from  r_contract_product a
            where  a.item_id = I_ITEM_ID;
          end if ;
     end if;

     O_CALC_AMOUNT := round(v_death_date - v_last_validate_date,2);

  END P_DAYS_DEATH_TO_LAST_VALID;


  /* 得到全残距离保单生效日或最后复效日的天数*/
  PROCEDURE P_DAYS_DISABLE_AND_LAST_VALID(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                                          I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                                          O_RET_STATUS out number,                         -- 退出状态
                                          O_CALC_AMOUNT out varchar2                       -- 理算结果
                                         )IS
    v_disable_date    date;
    v_last_validate_date  date;
    v_policy_id number;
  BEGIN
    select cc.disable_date
      into v_disable_date
      from t_claim_case cc
     where cc.case_id = I_CASE_ID;
    select policy_id
      into v_policy_id
      from r_contract_product
    where item_id=i_item_id;

    if v_disable_date is null then
      p_error(41308, '请检查是否填写全残日期');
    end if;
    v_last_validate_date:=PKG_LIFE_PS_POLICY_CHANGE.F_GET_MAX_REVALIDATE_DATE(v_policy_id,v_disable_date);
    if v_last_validate_date  is null then
       select  a.validate_date
         into  v_last_validate_date
         from  r_contract_master a,
               r_contract_product b
        where  a.policy_id = b.policy_id
          and  b.item_id = I_ITEM_ID;
     end if;

     O_CALC_AMOUNT := round(v_disable_date - v_last_validate_date,2);

  END P_DAYS_DISABLE_AND_LAST_VALID;

  /* 得到全残距离险种生效日或最后复效日的天数*/
  PROCEDURE P_DAYS_DISABLE_TO_LAST_VALID(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                                          I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                                          O_RET_STATUS out number,                         -- 退出状态
                                          O_CALC_AMOUNT out varchar2                       -- 理算结果
                                         )IS
    v_disable_date    date;
    v_last_validate_date  date;
    v_count number;
    v_policy_id number;
  BEGIN
    select cc.disable_date
      into v_disable_date
      from t_claim_case cc
     where cc.case_id = I_CASE_ID;
    SELECT policy_id
    INTO v_policy_id
    FROM r_contract_product
    WHERE item_id = I_ITEM_ID;
    if v_disable_date is null then
      O_CALC_AMOUNT :=9999999998;
      return;
    end if;
    v_last_validate_date:=PKG_LIFE_PS_POLICY_CHANGE.F_GET_MAX_REVALIDATE_DATE(v_policy_id,v_disable_date);
    if v_last_validate_date  is null then
       select  a.validate_date
         into  v_last_validate_date
         from  r_contract_product a
        where  a.item_id = I_ITEM_ID;
     else
       select  count(1)
         into  v_count
         from  r_contract_product a
        where  a.item_id = I_ITEM_ID
          and  a.validate_date >= v_last_validate_date;
          if v_count > 0 then
            select  a.validate_date
            into  v_last_validate_date
            from  r_contract_product a
            where  a.item_id = I_ITEM_ID;
          end if ;
     end if;

     O_CALC_AMOUNT := round(v_disable_date - v_last_validate_date,2);

  END P_DAYS_DISABLE_TO_LAST_VALID;

  PROCEDURE P_DAYS_DIAGNOSE_AND_LAST_VALID(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                                          I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                                          O_RET_STATUS out number,                         -- 退出状态
                                          O_CALC_AMOUNT out varchar2                       -- 理算结果
                                         )IS
    v_diagnose_date    date;
    v_last_validate_date  date;
    m_count  number;
    m_prod_validate_date  date;
  BEGIN
    select cc.diagnose_date
      into v_diagnose_date
      from t_claim_case cc
     where cc.case_id = I_CASE_ID;

    if v_diagnose_date is null then
      p_error(41308, '请检查是否填写首次确诊日期');
    end if;
    v_last_validate_date:=PKG_LIFE_PS_POLICY_CHANGE.F_GET_LAST_VALIDATE_DATE(I_ITEM_ID,v_diagnose_date);
    m_count := PKG_LIFE_PS_POLICY_CHANGE.F_SPECIFIC_PRODUCT_EXISTS_PS(I_ITEM_ID, 70011, 108);
    if m_count > 0 then
      select cp.validate_date
        into m_prod_validate_date
        from r_contract_product cp
       where cp.item_id = I_ITEM_ID;
      if v_last_validate_date is null then
        v_last_validate_date := m_prod_validate_date;
      else
        if m_prod_validate_date > v_last_validate_date then
          v_last_validate_date := m_prod_validate_date;
        end if;
      end if;
    else
    if v_last_validate_date  is null then
       select  a.validate_date
         into  v_last_validate_date
         from  r_contract_master a,
               r_contract_product b
        where  a.policy_id = b.policy_id
          and  b.item_id = I_ITEM_ID;
    end if;
    end if;
     O_CALC_AMOUNT := round(v_diagnose_date - v_last_validate_date,2);
     if O_CALC_AMOUNT < 0 then
        O_CALC_AMOUNT := 0;
     end if;
  END P_DAYS_DIAGNOSE_AND_LAST_VALID;

  /* 得到首次确诊日期距离险种生效日或最后复效日的天数*/
  PROCEDURE P_DAYS_DIAGNOSE_TO_LAST_VALID(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                                          I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                                          O_RET_STATUS out number,                         -- 退出状态
                                          O_CALC_AMOUNT out varchar2                       -- 理算结果
                                         )IS
    v_diagnose_date    date;
    v_last_validate_date  date;
    v_product_id  R_CONTRACT_PRODUCT.PRODUCT_ID%TYPE;
    v_count  number;
    v_count_1 number;
    m_count  number;
    m_prod_validate_date  date;
    v_policy_id r_contract_product.policy_id%TYPE;
    begin
      select Policy_id
      into v_policy_id
      from r_contract_product cp
      where cp.item_id = I_ITEM_ID;
    select cc.diagnose_date
      into v_diagnose_date
      from t_claim_case cc
     where cc.case_id = I_CASE_ID;

    if v_diagnose_date is null then
      O_CALC_AMOUNT :=9999999998;
      return;
    end if;
      v_last_validate_date:=PKG_LIFE_PS_POLICY_CHANGE.F_GET_MAX_REVALIDATE_DATE(v_policy_id,v_diagnose_date);
      if v_last_validate_date  is null then
       select  a.validate_date
         into  v_last_validate_date
         from  r_contract_product a
        where  a.item_id = I_ITEM_ID;
     else
       select  count(1)
         into  v_count
         from  r_contract_product a
        where  a.item_id = I_ITEM_ID
          and  a.validate_date >= v_last_validate_date;
          if v_count > 0 then
            select  a.validate_date
            into  v_last_validate_date
            from  r_contract_product a
            where  a.item_id = I_ITEM_ID;
          end if ;
     end if;
     SELECT COUNT(1)
       INTO V_COUNT
       FROM T_CONTRACT_PRODUCT_LOG CPL, T_POLICY_CHANGE PC
      WHERE ITEM_ID = I_ITEM_ID
        AND OLD_NEW = '2'
        AND PRODUCT_ID = 70025
        AND PC.CHANGE_ID = CPL.CHANGE_ID
        AND PC.CHANGE_STATUS = '3'
        AND PC.FINISH_TIME >= V_LAST_VALIDATE_DATE;
     IF V_COUNT > 0 THEN
       SELECT PC.FINISH_TIME
         INTO V_LAST_VALIDATE_DATE
         FROM T_CONTRACT_PRODUCT_LOG CPL, T_POLICY_CHANGE PC
        WHERE ITEM_ID = I_ITEM_ID
          AND OLD_NEW = '2'
          AND PRODUCT_ID = 70025
          AND PC.CHANGE_ID = CPL.CHANGE_ID
          AND PC.CHANGE_STATUS = '3'
          AND PC.FINISH_TIME >= V_LAST_VALIDATE_DATE;
       V_LAST_VALIDATE_DATE := TRUNC(V_LAST_VALIDATE_DATE);
     END IF;

     O_CALC_AMOUNT := round(v_diagnose_date - v_last_validate_date,2);
     if O_CALC_AMOUNT < 0 then
        O_CALC_AMOUNT := 0;
     end if;

  END P_DAYS_DIAGNOSE_TO_LAST_VALID;


  /*首次确诊日距离保单生效日或最后复效日/上次重大疾病确诊日的最大最小天数*/
  PROCEDURE P_DAYS_BTN_FIRST_DIG_AND_VALID(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type, --caseId
                                           I_ITEM_ID     in R_CONTRACT_PRODUCT.ITEM_ID%type, --ItemId
                                           I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type, --责任Id
                                           O_RET_STATUS  out number,
                                           O_CALC_AMOUNT out varchar2) IS
    v_liab_paid_status varchar2(4);
  BEGIN
    --0—未赔付过、1—已赔付过
    P_RELA_LIAB_IS_PAIDED(I_CASE_ID,
                          I_ITEM_ID,
                          I_LIAB_ID,
                          O_RET_STATUS,
                          v_liab_paid_status);
    if v_liab_paid_status = '0' then
      --首次确诊日距离保单生效日或最后复效日
      P_DAYS_DIAGNOSE_AND_LAST_VALID(I_CASE_ID,
                                     I_ITEM_ID,
                                     I_LIAB_ID,
                                     O_RET_STATUS,
                                     O_CALC_AMOUNT);
    else
      --首次确诊日距离上次重大疾病确诊日
      P_DAYS_DIAGNOSE_AND_LAST_DIAG(I_CASE_ID,
                                    I_ITEM_ID,
                                    I_LIAB_ID,
                                    O_RET_STATUS,
                                    O_CALC_AMOUNT);
    end if;
  END P_DAYS_BTN_FIRST_DIG_AND_VALID;

  --首次确诊日距离上次重大疾病确诊日
  PROCEDURE P_DAYS_DIAGNOSE_AND_LAST_DIAG(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type, -- 案件ID
                                          I_ITEM_ID     in R_CONTRACT_PRODUCT.ITEM_ID%type, -- 险种选项ID
                                          I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type, -- 责任ID
                                          O_RET_STATUS  out number, -- 退出状态
                                          O_CALC_AMOUNT out varchar2 -- 理算结果
                                          ) IS
    v_diagnose_date date;
    --上次重大疾病确诊日
    v_last_diagnose_date t_claim_case.diagnose_date%type;
  BEGIN
    select cc.diagnose_date
      into v_diagnose_date
      from t_claim_case cc
     where cc.case_id = I_CASE_ID;
    if v_diagnose_date is null then
      p_error(41308, '请检查是否填写首次确诊日期');
    end if;
    select diagnose_date
      into v_last_diagnose_date
      from (select *
              from t_claim_case    tcc,
                   t_claim_product tcp,
                   t_liability_pay tlp
             where tcc.case_id = tcp.case_id
               and tcc.case_id = tlp.case_id
               and tcp.item_id = tlp.item_id
               and tcp.item_id = I_ITEM_ID
               and (tcp.product_id in (70058) and tlp.liab_id in (401, 416))
               and tcc.case_status = 10
               and tcp.audit_conclusion in ('2', '3', '4')
               and tcc.case_id <> I_CASE_ID
             order by tcc.case_id desc)
     where rownum = 1;
    O_CALC_AMOUNT := round(v_diagnose_date - v_last_diagnose_date, 2);
    if O_CALC_AMOUNT < 0 then
      O_CALC_AMOUNT := 0;
    end if;
  END P_DAYS_DIAGNOSE_AND_LAST_DIAG;


  --身故日/首次确诊日时被保人的最大最小年龄
  PROCEDURE P_AGE_AT_DEATH(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type, -- 案件ID
                           I_ITEM_ID     in R_CONTRACT_PRODUCT.ITEM_ID%type, -- 险种选项ID
                           I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type, -- 责任ID
                           O_RET_STATUS  out number, -- 退出状态
                           O_CALC_AMOUNT out varchar2 -- 理算结果
                           ) IS
    v_accident_date date;
    v_birthday      date;
    M_LIAB_CATEGORY T_LIABILITY.LIAB_CATEGORY%type;
  BEGIN
    O_CALC_AMOUNT := 0;
    SELECT LIAB_CATEGORY
      INTO M_LIAB_CATEGORY
      FROM T_LIABILITY
     WHERE LIAB_ID = I_LIAB_ID;
    --责任大类为“1-意外身故”、“10-疾病身故”，取值为“身故日时被保人的最小最大年龄”；
    --责任大类为“4-重大疾病”，取值为“首次确诊日时被保人的最大最小年龄”。
    SELECT DECODE(M_LIAB_CATEGORY,
                  1, --意外身故
                  DEATH_DATE,
                  10, --疾病身故
                  DEATH_DATE,
                  4, --重大疾病
                  DIAGNOSE_DATE,
                  ACCIDENT_TIME)
      INTO v_accident_date
      FROM T_CLAIM_CASE
     WHERE CASE_ID = I_CASE_ID;
    if v_accident_date is null then
      p_error(41308, '请检查是否填写身故日期/首次确诊日');
    end if;
    --身故日期/首次确诊日发生时的年龄
    select floor(months_between(v_accident_date,
                                NVL(TEC.BIRTHDAY, TC.BIRTHDAY)) / 12)
      into O_CALC_AMOUNT
      from T_CLAIM_CASE TCC, R_ECIF_CUSTOMER TEC, R_CUSTOMER TC
     where TCC.ECIF_ID = TEC.ECIF_ID(+)
       AND TCC.INSURED_ID = TC.CUSTOMER_ID(+)
       AND TCC.CASE_ID = I_CASE_ID;

    if O_CALC_AMOUNT < 0 then
      O_CALC_AMOUNT := 0;
    end if;

  END P_AGE_AT_DEATH;

  --全残日期发生时的年龄下限
  PROCEDURE P_AGE_AT_DISABLE(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                                          I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                                          O_RET_STATUS out number,                         -- 退出状态
                                          O_CALC_AMOUNT out varchar2                       -- 理算结果
                                 )IS
    v_disable_date    date;
    v_birthday     date;
  BEGIN
    O_CALC_AMOUNT := 0;

    select cc.disable_date
      into v_disable_date
      from t_claim_case cc
     where cc.case_id = I_CASE_ID;

    if v_disable_date is null then
      p_error(41308, '请检查是否填写首次确诊日期');
    end if;


    --身故日期发生时的年龄

    select floor(months_between(v_disable_date, NVL(TEC.BIRTHDAY,TC.BIRTHDAY)) / 12)
      into O_CALC_AMOUNT
      from T_CLAIM_CASE TCC , R_ECIF_CUSTOMER TEC , R_CUSTOMER TC
     where TCC.ECIF_ID=TEC.ECIF_ID(+)
       AND TCC.INSURED_ID=TC.CUSTOMER_ID(+)
       AND TCC.CASE_ID = I_CASE_ID;

    if O_CALC_AMOUNT < 0 then
        O_CALC_AMOUNT := 0;
    end if;

  END P_AGE_AT_DISABLE;
  --0—理算时点在总单生效所在保单年度内、1—理算时点不在总单生效所在保单年度内。
  procedure P_YEAR_IS_INCEPTION_YEAR( -- 基本参数
                                     I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                     -- 案件ID
                                     I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                     -- 险种选项ID
                                     I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                     -- 责任ID
                                     O_RET_STATUS out number,
                                     -- 退出状态
                                     O_CALC_AMOUNT out varchar2
                                     -- 理算结果
                                     ) is
    M_audit_time date;

  begin
    O_RET_STATUS := 0;
    select t.audit_time
      into M_audit_time
      from T_CLAIM_CASE t
     where CASE_ID = I_CASE_ID;

    select ceil(months_between(trunc(M_audit_time), trunc(validate_date)) / 12)
      into O_CALC_AMOUNT
      from r_contract_master t
     where t.policy_id = (select policy_id
                            from r_contract_product
                           where item_id = I_ITEM_ID);
    if mod(O_CALC_AMOUNT, 2) = 0 then
      O_CALC_AMOUNT := 1;
    else
      O_CALC_AMOUNT := 0;
    end if;
  end;

 PROCEDURE P_ELIMINATION_COMMON(I_CASE_ID               IN T_CLAIM_CASE.CASE_ID%type,
                                         I_ITEM_ID               IN T_POLICY_PRODUCT_EXT.ITEM_ID%type,
                                         I_LIAB_ID               IN T_PRODUCT_LIABILITY.LIAB_ID%type,
                                         I_TIME                  IN DATE,--事故，全残，身故时间
                                         O_RET_STATUS            OUT NUMBER,
                                         O_IS_ELIMINATION_PERIOD OUT VARCHAR2) IS
    M_ELIMINATION_PERIOD T_POLICY_PRODUCT_EXT.ELIMINATION_PERIOD%type;
    M_VALIDATE_DATE      R_CONTRACT_MASTER.VALIDATE_DATE%type;
    M_DIFFERENCE         NUMBER;
    M_COUNT              NUMBER:=0;
  BEGIN
    SELECT count(*)
      INTO m_count
      FROM T_CONTRACT_PRODUCT_EXT CPE
      WHERE CPE.ITEM_ID = I_ITEM_ID;

    IF(m_count>0) THEN
    --如果连续投保为是则等待期取0天，为否则等待期取30天
    SELECT DECODE(CPE.IS_CONTINUE_APPLY,'Y',0, 30)
      INTO M_ELIMINATION_PERIOD --取得等待期
      FROM T_CONTRACT_PRODUCT_EXT CPE
     WHERE CPE.ITEM_ID = I_ITEM_ID;
    ELSE
      M_ELIMINATION_PERIOD:=0;
    END IF;

    SELECT CM.VALIDATE_DATE
      INTO M_VALIDATE_DATE --取得保单生效日期
      FROM R_CONTRACT_MASTER CM
     WHERE CM.POLICY_ID = (SELECT CP.POLICY_ID
                             FROM R_CONTRACT_PRODUCT CP
                            WHERE CP.ITEM_ID = I_ITEM_ID);
    SELECT (I_TIME - M_VALIDATE_DATE + 1) INTO M_DIFFERENCE FROM DUAL;
    IF M_ELIMINATION_PERIOD > 0 THEN
      IF M_DIFFERENCE <= M_ELIMINATION_PERIOD THEN
        O_IS_ELIMINATION_PERIOD := '1';
      ELSE
        O_IS_ELIMINATION_PERIOD := '0';
      END IF;
    ELSE
      O_IS_ELIMINATION_PERIOD := '0';
    END IF;
  END P_ELIMINATION_COMMON;

 --0—未赔付过、1—已赔付过
 procedure P_RELA_LIAB_IS_PAIDED( -- 基本参数
                                 I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                                 -- 案件ID
                                 I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                                 -- 险种选项ID
                                 I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                                 -- 责任ID
                                 O_RET_STATUS out number,
                                 -- 退出状态
                                 O_CALC_AMOUNT out varchar2
                                 -- 理算结果
                                 ) is
   is_paid      boolean := false;
   v_product_id R_CONTRACT_PRODUCT.product_id%type;
   v_group_id   T_RELA_PROD_LIAB_GROUP_CFG.group_id%type;
 begin
   O_RET_STATUS := 0;
   select product_id
     into v_product_id
     from R_CONTRACT_PRODUCT
    where item_id = I_ITEM_ID;
   v_group_id := f_get_liab_group(v_product_id, I_LIAB_ID);
   if v_group_id != 0 then
     is_paid := F_IS_LIAB_GROUP_PAID(I_CASE_ID, I_ITEM_ID, v_group_id);
   else
     is_paid := F_IS_LIAB_PAID(I_CASE_ID, I_ITEM_ID, I_LIAB_ID);
   end if;
   if is_paid then
     O_CALC_AMOUNT := 1;
   else
     O_CALC_AMOUNT := 0;
   end if;
 end;

 --指定责任是否已赔付
 function F_IS_LIAB_PAID(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                         I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,
                         I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type)
   RETURN BOOLEAN is
   pay_times number := 0;
 begin
   --已赔付的次数
   select count(*)
     into pay_times
     from t_liability_pay t
    where t.item_id = I_ITEM_ID
      and t.liab_id = I_LIAB_ID
      and t.pay_amount > 0
      and exists (select 1
             from t_claim_case cc, t_claim_product claimp
            where cc.case_id = claimp.case_id
              and claimp.item_id = I_ITEM_ID
              and t.case_id = cc.case_id
              and cc.case_status = 10
              and claimp.audit_conclusion in ('2', '3', '4')
              and cc.case_id <> I_CASE_ID);
   RETURN pay_times > 0;
 end;

 --指定责任组是否已赔付
 function F_IS_LIAB_GROUP_PAID(I_CASE_ID  in T_CLAIM_CASE.CASE_ID%type,
                               I_ITEM_ID  in R_CONTRACT_PRODUCT.ITEM_ID%type,
                               I_GROUP_ID in T_RELA_PROD_LIAB_GROUP_CFG.group_id%type)
   RETURN BOOLEAN is
   v_liab_id T_RELA_LIAB_GROUP_CFG.liab_id%type;
   cursor C_GROUP_LIABS is
     select LIAB_ID from T_RELA_LIAB_GROUP_CFG where GROUP_ID = I_GROUP_ID;
 begin
   open C_GROUP_LIABS;
   loop
     fetch C_GROUP_LIABS
       into v_liab_id;
     exit when C_GROUP_LIABS%notfound;
     if F_IS_LIAB_PAID(I_CASE_ID, I_ITEM_ID, v_liab_id) then
       return true;
     end if;
   end loop;
   close C_GROUP_LIABS;
   RETURN false;
 end;

 --获取责任配置组Id，若不存在，返回0;
 function f_get_liab_group(I_PRODUCT_ID t_product_life.product_id%type,
                           I_LIAB_ID    in T_PRODUCT_LIABILITY.LIAB_ID%type)
   RETURN T_RELA_PROD_LIAB_GROUP_CFG.group_id%type as
   m_count    number := 0;
   m_group_id T_RELA_PROD_LIAB_GROUP_CFG.group_id%type;
 begin
   select count(1)
     into m_count
     from T_RELA_PROD_LIAB_GROUP_CFG group_info,
          T_RELA_LIAB_GROUP_CFG      liab_info
    where group_info.group_id = liab_info.group_id
      and group_info.product_id = I_PRODUCT_ID
      and liab_info.liab_id = I_LIAB_ID;
   if m_count > 0 then
     select distinct group_info.group_id
       into m_group_id
       from T_RELA_PROD_LIAB_GROUP_CFG group_info,
            T_RELA_LIAB_GROUP_CFG      liab_info
      where group_info.group_id = liab_info.group_id
        and group_info.product_id = I_PRODUCT_ID
        and liab_info.liab_id = I_LIAB_ID;
     return m_group_id;
   else
     return 0;
   end if;
 end;

  -- 1- 身故日在年金开始领取日之前（不含当日）,0- 身故日不在年金开始领取日之前
  procedure P_IS_START_PAY_BEFORE_DEATH( -- 基本参数
                         I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                         -- 案件ID
                         I_ITEM_ID in T_CONTRACT_PRODUCT.ITEM_ID%type,
                         -- 险种选项ID
                         I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                         -- 责任ID
                         O_RET_STATUS out number,
                         -- 退出状态
                         O_CALC_AMOUNT out varchar2
                         -- 理算结果
                         ) is
    M_DEATH_DATE      date;
    M_START_PAY_DATE  date;

  BEGIN
    O_RET_STATUS := 0;
    --身故日
    SELECT DEATH_DATE
      INTO M_DEATH_DATE
      FROM T_CLAIM_CASE TCC
     WHERE TCC.CASE_ID = I_CASE_ID;

    --年金开始领取日
    SELECT TCP.START_PAY_DATE
      INTO M_START_PAY_DATE
      FROM T_CONTRACT_PRODUCT TCP
     WHERE TCP.ITEM_ID = I_ITEM_ID;

    IF M_DEATH_DATE < M_START_PAY_DATE THEN
      O_CALC_AMOUNT := 1;
    ELSE
      O_CALC_AMOUNT := 0;
    END IF;
  END;

  --给付结束年期类型
  procedure P_PAY_END_PERIOD_TYPE( -- 基本参数
                         I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,
                         -- 案件ID
                         I_ITEM_ID in T_CONTRACT_PRODUCT.ITEM_ID%type,
                         -- 险种选项ID
                         I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,
                         -- 责任ID
                         O_RET_STATUS out number,
                         -- 退出状态
                         O_CALC_AMOUNT out varchar2
                         -- 理算结果
                         ) is

  BEGIN
    O_RET_STATUS := 0;
    --给付结束年期类型
    SELECT END_PERIOD
      INTO O_CALC_AMOUNT
      FROM T_CONTRACT_PRODUCT
     WHERE ITEM_ID = I_ITEM_ID;
  END;

  /*生存距离首次确诊日期的天数*/
  PROCEDURE P_DAYS_BETWEEN_ALIVE_DIAGNOSE(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type, --caseId
                                  I_ITEM_ID     in R_CONTRACT_PRODUCT.ITEM_ID%type, --ItemId
                                  I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type, --责任Id
                                  O_RET_STATUS  out number,
                                  O_CALC_AMOUNT out varchar2) IS
  BEGIN
    SELECT NVL(ROUND(APPLY_TIME - DIAGNOSE_DATE, 2), 0)
      INTO O_CALC_AMOUNT
      FROM T_CLAIM_CASE
     WHERE CASE_ID = I_CASE_ID;
    IF O_CALC_AMOUNT = 9999999 THEN
      P_ERROR(41308, '请检查是否填写签收日期');
    END IF;
  END P_DAYS_BETWEEN_ALIVE_DIAGNOSE;

  --事故日距离新增保额生效日的天数
  PROCEDURE P_DAYS_ACCIDENT_AND_ADD_AMOUNT(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                                          I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                                          O_RET_STATUS out number,                         -- 退出状态
                                          O_CALC_AMOUNT out varchar2                       -- 理算结果
                                 )IS
    M_ACCIDENT_TIME date;
    M_ADD_AMOUNT_TIME date;
    M_COUNT number;
  BEGIN
    O_RET_STATUS := 0;

    SELECT ACCIDENT_TIME
      INTO M_ACCIDENT_TIME
      FROM T_CLAIM_CASE
     WHERE CASE_ID = I_CASE_ID;
    M_COUNT := PKG_LIFE_PS_POLICY_CHANGE.F_GET_ADD_AMOUNT_CNT(I_ITEM_ID, M_ACCIDENT_TIME);
    IF M_COUNT > 0 THEN
      M_ADD_AMOUNT_TIME:=PKG_LIFE_PS_POLICY_CHANGE.F_GET_MAX_ADD_AMOUNT_DATE(I_ITEM_ID, M_ACCIDENT_TIME);
      O_CALC_AMOUNT := NVL(ROUND(M_ACCIDENT_TIME - M_ADD_AMOUNT_TIME, 2), 0);
    ELSE
      O_CALC_AMOUNT := 99999999;
    END IF;
  END;

  --身故日距离新增保额生效日的天数
  PROCEDURE P_DAYS_DEATH_AND_ADD_AMOUNT(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                                          I_ITEM_ID in T_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                                          O_RET_STATUS out number,                         -- 退出状态
                                          O_CALC_AMOUNT out varchar2                       -- 理算结果
                                 )IS
    M_DEATH_DATE date;
    M_ADD_AMOUNT_TIME date;
    M_COUNT number;
  BEGIN
    O_RET_STATUS := 0;

    SELECT DEATH_DATE
      INTO M_DEATH_DATE
      FROM T_CLAIM_CASE
     WHERE CASE_ID = I_CASE_ID;

    IF M_DEATH_DATE IS NULL THEN
      P_ERROR(41308, '请检查是否填写身故日期');
    END IF;
    M_COUNT := PKG_LIFE_PS_POLICY_CHANGE.F_GET_ADD_AMOUNT_CNT(I_ITEM_ID, M_DEATH_DATE);
    IF M_COUNT > 0 THEN
      M_ADD_AMOUNT_TIME:=PKG_LIFE_PS_POLICY_CHANGE.F_GET_MAX_ADD_AMOUNT_DATE(I_ITEM_ID, M_DEATH_DATE);
      O_CALC_AMOUNT := NVL(ROUND(M_DEATH_DATE - M_ADD_AMOUNT_TIME, 2), 0);
    ELSE
      O_CALC_AMOUNT := 99999999;
    END IF;
  END;

  --伤残鉴定日距离新增保额生效日的天数
  PROCEDURE P_DAYS_DISABLE_AND_ADD_AMOUNT(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                                          I_ITEM_ID in T_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                                          O_RET_STATUS out number,                         -- 退出状态
                                          O_CALC_AMOUNT out varchar2                       -- 理算结果
                                 )IS
    M_DISABLE_DATE date;
    M_ADD_AMOUNT_TIME date;
    M_COUNT number;
  BEGIN
    O_RET_STATUS := 0;

    SELECT DISABLE_DATE
      INTO M_DISABLE_DATE
      FROM T_CLAIM_CASE
     WHERE CASE_ID = I_CASE_ID;

    IF M_DISABLE_DATE IS NULL THEN
      P_ERROR(41308, '请检查是否填写伤残鉴定日期');
    END IF;
    M_COUNT := PKG_LIFE_PS_POLICY_CHANGE.F_GET_ADD_AMOUNT_CNT(I_ITEM_ID, M_DISABLE_DATE);
    IF M_COUNT > 0 THEN
      M_ADD_AMOUNT_TIME := PKG_LIFE_PS_POLICY_CHANGE.F_GET_MAX_ADD_AMOUNT_DATE(I_ITEM_ID, M_DISABLE_DATE);
      O_CALC_AMOUNT := NVL(ROUND(M_DISABLE_DATE - M_ADD_AMOUNT_TIME, 2), 0);
    ELSE
      O_CALC_AMOUNT := 99999999;
    END IF;
  END;

  --首次确诊日距离新增保额生效日的天数
  PROCEDURE P_DAYS_DIAGNOSE_AND_ADD_AMOUNT(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                                          I_ITEM_ID in T_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                                          O_RET_STATUS out number,                         -- 退出状态
                                          O_CALC_AMOUNT out varchar2                       -- 理算结果
                                 )IS
    M_DIAGNOSE_DATE date;
    M_ADD_AMOUNT_TIME date;
    M_COUNT number;
  BEGIN
    O_RET_STATUS := 0;

    SELECT DIAGNOSE_DATE
      INTO M_DIAGNOSE_DATE
      FROM T_CLAIM_CASE
     WHERE CASE_ID = I_CASE_ID;

    IF M_DIAGNOSE_DATE IS NULL THEN
      P_ERROR(41308, '请检查是否填写首次确诊日期');
    END IF;
    M_COUNT := PKG_LIFE_PS_POLICY_CHANGE.F_GET_ADD_AMOUNT_CNT(I_ITEM_ID, M_DIAGNOSE_DATE);
    IF M_COUNT > 0 THEN
      M_ADD_AMOUNT_TIME:=PKG_LIFE_PS_POLICY_CHANGE.F_GET_MAX_ADD_AMOUNT_DATE(I_ITEM_ID, M_DIAGNOSE_DATE);
      O_CALC_AMOUNT := NVL(ROUND(M_DIAGNOSE_DATE - M_ADD_AMOUNT_TIME, 2), 0);
    ELSE
      O_CALC_AMOUNT := 99999999;
    END IF;
  END;

  /**
    相关性“个人账户保险金领取约定的年龄”
    当事故日早于“个人账户保险金领取约定的年龄”返回0
    当事故日等于或晚于“个人账户保险金领取约定的年龄”返回1
    **/
  procedure P_HAS_PASSED_AGREED_AGE(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type, -- 案件ID
                                    I_ITEM_ID     in R_CONTRACT_PRODUCT.ITEM_ID%type, -- 险种选项ID
                                    I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type, -- 责任ID
                                    O_RET_STATUS  out number, -- 退出状态
                                    O_CALC_AMOUNT out varchar2 -- 理算结果
                                    ) IS
    m_current_age    number; --事故日年龄
    m_retirement_age number; --法定退休年龄
    v_accident_time date;
    v_ecif_id t_claim_case.ecif_id%type;
    v_gender r_customer.gender%type;
  begin
    SELECT t.accident_time,t.ecif_id
    INTO v_accident_time,v_ecif_id
    FROM t_claim_case t
    WHERE t.case_id = i_case_id;
      select months_between(tcc.accident_time, nvl(tec.birthday, tc.birthday)) / 12,nvl(tec.gender,tc.gender)
        into m_current_age,v_gender
        from t_claim_case     tcc,
             r_ecif_customer  tec,
             r_customer       tc
       where tec.ecif_id = v_ecif_id
         and tcc.insured_id = tc.customer_id(+)
         and tcc.case_id = i_case_id;
    m_retirement_age := pkg_life_public.f_get_retirement_age(v_gender,v_accident_time);
    if m_current_age < m_retirement_age then
      O_CALC_AMOUNT := 0;
    else
      O_CALC_AMOUNT := 1;
    end if;
  end P_HAS_PASSED_AGREED_AGE;

  /**
  责任级等待期（年度），取首次确诊日期所在的保单年度。
    对于一年期保证续保的保单，保证续保期间的保单年度按保单初始的生效日计算。
    对于非连续投保，按首次投保来重新计算保单年度。
  **/
  procedure P_LIAB_ANNUAL_WAITING_PERIOD(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type, -- 案件ID
                                         I_ITEM_ID     in R_CONTRACT_PRODUCT.ITEM_ID%type, -- 险种选项ID
                                         I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type, -- 责任ID
                                         O_RET_STATUS  out number, -- 退出状态
                                         O_CALC_AMOUNT out varchar2 -- 理算结果
                                         ) IS
  m_validate_date date;
  m_policy_year    number;
  m_diagnose_date  t_claim_case.diagnose_date%type;
  begin
    O_RET_STATUS := 0;
    select validate_date
      into m_validate_date
      from r_contract_product
     where item_id = i_item_id;

    select diagnose_date
      into m_diagnose_date
      from t_claim_case
     where case_id = i_case_id;
    if m_diagnose_date is null then
      p_error(41308, '请检查是否填写首次确诊日期');
    end if;
    m_validate_date := PKG_LIFE_DM_PRODUCT.f_get_renewal_vaildate_date(i_item_id,
                                                                      m_validate_date);
    m_policy_year := pkg_life_public.f_policy_year(m_diagnose_date,
                                                   m_validate_date);

    O_CALC_AMOUNT := m_policy_year;
  end P_LIAB_ANNUAL_WAITING_PERIOD;

  --身故日期距离分娩日期的最大最小天数
  PROCEDURE P_DAYS_DEATH_AND_DELIVERY(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                                          I_ITEM_ID in T_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                                          O_RET_STATUS out number,                         -- 退出状态
                                          O_CALC_AMOUNT out varchar2                       -- 理算结果
                                 )IS
    M_DEATH_DATE date;
    M_DELIVERY_DATE date;
  BEGIN
    O_RET_STATUS := 0;

    SELECT DEATH_DATE, DELIVERY_DATE
      INTO M_DEATH_DATE, M_DELIVERY_DATE
      FROM T_CLAIM_CASE
     WHERE CASE_ID = I_CASE_ID;

    O_CALC_AMOUNT := NVL(ROUND(M_DEATH_DATE - M_DELIVERY_DATE, 2), 0);
  END;
  --首次确诊日期距离分娩日期的最大最小天数
  PROCEDURE P_DAS_DIAGNOSE_AND_CHILDBIRTH(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                                          I_ITEM_ID in T_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                                          O_RET_STATUS out number,                         -- 退出状态
                                          O_CALC_AMOUNT out varchar2                       -- 理算结果
                                 )IS
    M_DIAGNOSE_DATE date;
    M_DELIVERY_DATE date;
  BEGIN
    O_RET_STATUS := 0;

    SELECT DIAGNOSE_DATE, DELIVERY_DATE
      INTO M_DIAGNOSE_DATE, M_DELIVERY_DATE
      FROM T_CLAIM_CASE
     WHERE CASE_ID = I_CASE_ID;

    O_CALC_AMOUNT := NVL(ROUND(M_DIAGNOSE_DATE - M_DELIVERY_DATE, 2), 0);
  END;
  --伤残鉴定日期距离分娩日期的最大最小天数
  PROCEDURE P_DAYS_DISABLE_AND_DELIVERY(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                                          I_ITEM_ID in T_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                                          O_RET_STATUS out number,                         -- 退出状态
                                          O_CALC_AMOUNT out varchar2                       -- 理算结果
                                 )IS
    M_DISABLE_DATE date;
    M_DELIVERY_DATE date;
  BEGIN
    O_RET_STATUS := 0;

    SELECT DISABLE_DATE, DELIVERY_DATE
      INTO M_DISABLE_DATE, M_DELIVERY_DATE
      FROM T_CLAIM_CASE
     WHERE CASE_ID = I_CASE_ID;

    O_CALC_AMOUNT := NVL(ROUND(M_DISABLE_DATE - M_DELIVERY_DATE, 2), 0);
  END;
  --责任到达年龄 被保险人投保年龄，加上事故日时的保单年度数，再减去1后所得的年龄
 PROCEDURE P_RELATIVITY_DUTY_EVE_AGE(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                                          I_ITEM_ID in R_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                                          I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                                          O_RET_STATUS out number,                         -- 退出状态
                                          O_CALC_AMOUNT out varchar2                       -- 理算结果
                                 )IS
    M_DUTY_DATE date; --责任日期
    M_VAlIDATE_DATE date;--保单生效日
    M_HOLD_AGE number;--被保人 投保时年龄
    m_policy_year number;
  BEGIN
    O_RET_STATUS := 0;
   --根据责任大类 取责任日期
    SELECT DECODE(tl.liab_category,
                  '1',cc.death_date,
                  '10',cc.death_date,
                  '4',cc.diagnose_date,
                   cc.accident_time)
      INTO M_DUTY_DATE
      FROM T_CLAIM_CASE cc,t_liability tl
     WHERE cc.CASE_ID = I_CASE_ID
     and tl.liab_id=I_LIAB_ID;

     select cp.age_1
     into M_HOLD_AGE
     from r_contract_product cp
     where cp.item_id=I_ITEM_ID;

    SELECT CM.VALIDATE_DATE
      INTO M_VALIDATE_DATE
      FROM R_CONTRACT_MASTER CM,R_CONTRACT_PRODUCT CP
     WHERE CM.POLICY_ID = CP.POLICY_ID
       and  CP.ITEM_ID = I_ITEM_ID;
     m_policy_year := pkg_life_public.f_policy_year(M_DUTY_DATE,
                                                 M_VALIDATE_DATE);
    --被保人投保年龄+责任日保单年度数-1
    O_CALC_AMOUNT :=M_HOLD_AGE+m_policy_year-1 ;
  END;
  --约定日期距离身故日期的最大最小天数（其中约定日期取理赔受理页面录入的“手术日期”）
  PROCEDURE P_DAYS_APPOINTED_AND_DEATH(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                                        I_ITEM_ID in T_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                                        I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                                        O_RET_STATUS out number,                         -- 退出状态
                                        O_CALC_AMOUNT out varchar2                        -- 理算结果
                                       )IS
    M_DEATH_DATE date;
    M_OPERATION_DATE date;
  BEGIN
    O_RET_STATUS := 0;

    SELECT DEATH_DATE, OPERATION_DATE
      INTO M_DEATH_DATE, M_OPERATION_DATE
      FROM T_CLAIM_CASE
     WHERE CASE_ID = I_CASE_ID;

    O_CALC_AMOUNT := NVL(ROUND(M_DEATH_DATE - M_OPERATION_DATE, 2), 0);
  END;
  PROCEDURE P_PROTECTION_PLAN(I_CASE_ID in T_CLAIM_CASE.CASE_ID%type,          -- 案件ID
                               I_ITEM_ID in T_CONTRACT_PRODUCT.ITEM_ID%type,    -- 险种选项ID
                               I_LIAB_ID in T_PRODUCT_LIABILITY.LIAB_ID%type,   -- 责任ID
                               O_RET_STATUS out number,                         -- 退出状态
                               O_CALC_AMOUNT out varchar2                       -- 理算结果
                              )IS
  BEGIN
    O_RET_STATUS := 0;
    O_CALC_AMOUNT := PKG_LIFE_NEWBIZ_CLM_ACCUMU.F_GET_PROTECTION_PLAN(I_ITEM_ID);
  END P_PROTECTION_PLAN;

  --事故日是否在年金开始领取日之前（不含当日）
  PROCEDURE P_IS_START_PAY_BEFORE_ACCIDENT(I_CASE_ID     in T_CLAIM_CASE.CASE_ID%type, -- 案件ID
                                           I_ITEM_ID     in T_CONTRACT_PRODUCT.ITEM_ID%type, -- 险种选项ID
                                           I_LIAB_ID     in T_PRODUCT_LIABILITY.LIAB_ID%type, -- 责任ID
                                           O_RET_STATUS  out number, -- 退出状态
                                           O_CALC_AMOUNT out varchar2 -- 理算结果
                                           ) IS
    M_ACCIDEND_DATE  DATE;
    M_START_PAY_DATE DATE;
  BEGIN
    O_RET_STATUS := 0;
    --年金开始领取日
    SELECT TCP.START_PAY_DATE
      INTO M_START_PAY_DATE
      FROM T_CONTRACT_PRODUCT TCP
     where TCP.ITEM_ID = I_ITEM_ID;

    --事故日
    SELECT TCC.ACCIDENT_TIME
      INTO M_ACCIDEND_DATE
      FROM T_CLAIM_CASE TCC
     WHERE TCC.CASE_ID = I_CASE_ID;

    IF M_ACCIDEND_DATE < M_START_PAY_DATE THEN
      O_CALC_AMOUNT := 1;
    ELSE
      O_CALC_AMOUNT := 0;
    END IF;

  END;
end PKG_LS_CLM_ACCUMU;
/
