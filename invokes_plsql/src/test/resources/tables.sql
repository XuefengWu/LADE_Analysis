-------------------------------------------------------
-- Export file for user PICCPROD@10.135.102.129/ORCL --
-- Created by Admin on 2018/10/22, 17:46:36 -----------
-------------------------------------------------------
create table ASSOCIATIONVALUEENTRY
(
  id               NUMBER(38) not null,
  associationkey   VARCHAR2(255),
  associationvalue VARCHAR2(255),
  sagaid           VARCHAR2(255),
  sagatype         VARCHAR2(255)
)
;
create table BOOK
(
  bookid    INTEGER not null,
  bookname  NVARCHAR2(50),
  bookprise INTEGER,
  author    NVARCHAR2(50)
)
;
create table CC
(
  id   NUMBER,
  name VARCHAR2(20),
  qq   VARCHAR2(20)
)
;
create table CIRC_CONTRACT
(
  policy_id NUMBER(10) not null
)
;
create table C_CIRC_FEE_43
(
  organ_id      VARCHAR2(40) not null,
  stat_fee_type NUMBER,
  fee_id        NUMBER(12) not null,
  policy_type   CHAR(1) not null
)
;
create table C_FEE_0106
(
  insured_id NUMBER(10),
  change_id  NUMBER(10),
  fee_amount NUMBER(12,2) not null,
  fee_type   NUMBER(3) not null,
  policy_id  NUMBER(10),
  related_id NUMBER(12)
)
;
create table DATABASECHANGELOG
(
  id            VARCHAR2(255) not null,
  author        VARCHAR2(255) not null,
  filename      VARCHAR2(255) not null,
  dateexecuted  TIMESTAMP(6) not null,
  orderexecuted INTEGER not null,
  exectype      VARCHAR2(10) not null,
  md5sum        VARCHAR2(35),
  description   VARCHAR2(255),
  comments      VARCHAR2(255),
  tag           VARCHAR2(255),
  liquibase     VARCHAR2(20),
  contexts      VARCHAR2(255),
  labels        VARCHAR2(255),
  deployment_id VARCHAR2(10)
)
;
create table DATABASECHANGELOGLOCK
(
  id          INTEGER not null,
  locked      NUMBER(1) not null,
  lockgranted TIMESTAMP(6),
  lockedby    VARCHAR2(255)
)
;
create table DDT
(
  testdate DATE,
  id       NUMBER not null
)
;
create table DOMAINEVENTENTRY
(
  globalindex         NUMBER(19) not null,
  aggregateidentifier VARCHAR2(255) not null,
  sequencenumber      NUMBER(19) not null,
  type                VARCHAR2(255),
  eventidentifier     VARCHAR2(255) not null,
  metadata            BLOB,
  payload             BLOB not null,
  payloadrevision     VARCHAR2(255),
  payloadtype         VARCHAR2(255) not null,
  timestamp           VARCHAR2(255) not null
)
;
create table EBAO_STATISTICS_ERROR
(
  sql_command VARCHAR2(200),
  errmsg      VARCHAR2(2000),
  record_date DATE
)
;
create table EBAO_SYN_DATA
(
  syn_id      NUMBER(10),
  syn_content VARCHAR2(4000)
)
;
create table EBAO_TABLE_INIT_SYNC_DETAIL
(
  table_name        VARCHAR2(100) not null,
  data_kind         NUMBER(2) not null,
  data_location     NUMBER(1) default 0 not null,
  initial_condition VARCHAR2(2000),
  sync_condition    VARCHAR2(2000),
  memo              VARCHAR2(2000),
  project_code      VARCHAR2(100)
)
;
create table T_YES_NO
(
  yes_no    CHAR(1) not null,
  type_name VARCHAR2(30) not null
)
;
create table EBAO_VERSION_INFO
(
  version_code    VARCHAR2(100) not null,
  build_date      DATE not null,
  release_status  CHAR(1) default 'Y' not null,
  latest_version  CHAR(1) not null,
  product_version VARCHAR2(20) not null,
  release_version VARCHAR2(20) not null,
  version_comment VARCHAR2(1000),
  patch_name      VARCHAR2(100),
  deploy_date     DATE default SYSDATE
)
;
create table ENDPERIOD
(
  policy_code    VARCHAR2(20),
  policy_id      NUMBER(10) not null,
  item_id        NUMBER(10) not null,
  end_period     CHAR(1),
  validate_date  DATE not null,
  end_date       DATE not null,
  start_pay_date DATE,
  amount         NUMBER(14,2),
  product_id     NUMBER(10) not null
)
;
create table ENDPERIOD2012
(
  policy_code    VARCHAR2(20),
  policy_id      NUMBER(10) not null,
  item_id        NUMBER(10) not null,
  end_period     CHAR(1),
  validate_date  DATE not null,
  end_date       DATE not null,
  start_pay_date DATE,
  amount         NUMBER(14,2),
  product_id     NUMBER(10) not null
)
;
create table GRP_CUSTOMER_TMP4
(
  agent_code      VARCHAR2(20),
  company_ecif_id NUMBER(20),
  company_name    VARCHAR2(240),
  accept_date     DATE not null,
  type            VARCHAR2(50),
  address         VARCHAR2(200),
  telephone       VARCHAR2(30),
  email           VARCHAR2(50),
  staff_amount    NUMBER,
  leader_name     VARCHAR2(50),
  flag            NUMBER,
  update_time     DATE
)
;
create table JHI_AUTHORITY
(
  name VARCHAR2(50) not null
)
;
create table JHI_PERSISTENT_AUDIT_EVENT
(
  event_id   NUMBER(38) not null,
  principal  VARCHAR2(50) not null,
  event_date TIMESTAMP(6),
  event_type VARCHAR2(255)
)
;
create table JHI_PERSISTENT_AUDIT_EVT_DATA
(
  event_id NUMBER(38) not null,
  name     VARCHAR2(150) not null,
  value    VARCHAR2(255)
)
;
create table JHI_USER
(
  id                 NUMBER(38) not null,
  login              VARCHAR2(50) not null,
  password_hash      VARCHAR2(60),
  first_name         VARCHAR2(50),
  last_name          VARCHAR2(50),
  email              VARCHAR2(100),
  image_url          VARCHAR2(256),
  activated          NUMBER(1) not null,
  lang_key           VARCHAR2(5),
  activation_key     VARCHAR2(20),
  reset_key          VARCHAR2(20),
  created_by         VARCHAR2(50) not null,
  created_date       TIMESTAMP(6) not null,
  reset_date         TIMESTAMP(6),
  last_modified_by   VARCHAR2(50),
  last_modified_date TIMESTAMP(6)
)
;
create table JHI_USER_AUTHORITY
(
  user_id        NUMBER(38) not null,
  authority_name VARCHAR2(50) not null
)
;
create table MIGRATE_AGENT
(
  agent_id              NUMBER(10) not null,
  real_name             VARCHAR2(40) not null,
  user_name             VARCHAR2(30),
  password              VARCHAR2(32),
  gender                CHAR(1),
  birthday              DATE,
  certi_type            NUMBER(2),
  certi_code            VARCHAR2(50),
  agent_code            VARCHAR2(20) not null,
  password_change       DATE,
  organ_id              VARCHAR2(40) not null,
  head_id               VARCHAR2(40) not null,
  branch_id             VARCHAR2(40) not null,
  user_status           CHAR(1),
  dept_id               VARCHAR2(20) not null,
  political_id          VARCHAR2(2),
  education_id          VARCHAR2(2),
  foreign_lang_id       VARCHAR2(3),
  foreign_level_id      VARCHAR2(2),
  compute_level         VARCHAR2(2),
  instructor_grade_id   VARCHAR2(2),
  begin_job_date        DATE,
  technical_post        VARCHAR2(50),
  native_place          VARCHAR2(5),
  register_address      VARCHAR2(100),
  family_address        VARCHAR2(100),
  address_area          VARCHAR2(50),
  telephone             VARCHAR2(30),
  old_job_unit          VARCHAR2(100),
  old_job_id            VARCHAR2(10),
  bp                    VARCHAR2(50),
  celler_tel            VARCHAR2(50),
  email                 VARCHAR2(50),
  address               VARCHAR2(100),
  marriage_id           CHAR(1),
  special_favor         VARCHAR2(50),
  cautioner1_name       VARCHAR2(40),
  cautioner1_certi_type NUMBER(2),
  cautioner1_certi_code VARCHAR2(50),
  cautioner1_unit       VARCHAR2(100),
  cautioner2_name       VARCHAR2(40),
  cautioner2_certi_type NUMBER(2),
  cautioner2_certi_code VARCHAR2(50),
  cautioner2_unit       VARCHAR2(100),
  train_man_id          NUMBER(10),
  recommend_man_id      NUMBER(10),
  grade_id              VARCHAR2(3),
  quality_grade_id      NUMBER(3),
  qualification_id      VARCHAR2(20),
  practice_id           VARCHAR2(20),
  invest_connect_id     VARCHAR2(20),
  other_certificate_id  VARCHAR2(20),
  enter_company_date    DATE,
  leave_company_date    DATE,
  agent_status          NUMBER(2) not null,
  update_time           DATE,
  updater_id            NUMBER(10),
  probation_date        DATE,
  turn_date             DATE,
  zip                   VARCHAR2(6),
  agent_cate            VARCHAR2(1) not null,
  sign_date             DATE,
  end_date              DATE,
  g_business_cate       NUMBER(2) not null,
  g_grade_id            NUMBER(2),
  g_position_id         NUMBER(2),
  is_charge             NUMBER(1) not null,
  comm_account          VARCHAR2(40),
  prem_account          VARCHAR2(40),
  business_cate         NUMBER(2),
  dept_train_id         NUMBER(10),
  area_train_id         NUMBER(10),
  group_train_date      DATE,
  dept_train_date       DATE,
  area_train_date       DATE,
  nation_code           VARCHAR2(2),
  indirect_train_id     NUMBER(10),
  ind_dept_train_id     NUMBER(10),
  comm_bank_code        VARCHAR2(20),
  prem_bank_code        VARCHAR2(20),
  b_grade_id            VARCHAR2(3),
  b_instructor_id       VARCHAR2(3),
  b_technical_post      VARCHAR2(3),
  finance_post_id       VARCHAR2(3),
  b_grade_num           NUMBER(3),
  reenter_flag          CHAR(1) not null,
  position_id           VARCHAR2(3),
  sell_grade            NUMBER(3),
  leave_cause           VARCHAR2(6),
  leave_target          NUMBER(3),
  c_grade_id            VARCHAR2(3),
  is_mdrt               CHAR(1),
  union_code            VARCHAR2(10),
  is_adp2               CHAR(1),
  adp2_date             DATE,
  isc_num               NUMBER(2) not null,
  insert_time           DATE not null,
  address_2             VARCHAR2(100),
  address_3             VARCHAR2(100),
  address_4             VARCHAR2(100),
  spouse_name           VARCHAR2(40),
  spouse_certi_code     VARCHAR2(50),
  citizen_type          VARCHAR2(6),
  docfpcap              CHAR(1),
  comm_ibg_code         VARCHAR2(30),
  source_code           VARCHAR2(30),
  letter_status         VARCHAR2(1),
  credit_code           VARCHAR2(20),
  credit_period         NUMBER(4),
  credit_limit          NUMBER(12,2),
  grt_type              VARCHAR2(2),
  grt_amount            NUMBER(12,2),
  grt_amount_rev        NUMBER(12,2),
  grt_expiry_date       DATE,
  gst_registered        CHAR(1) not null,
  comm_suspend          VARCHAR2(1),
  turn_money_flag       CHAR(1) not null,
  init_grade_id         VARCHAR2(3),
  same_domain           CHAR(1),
  g_agent_cate          VARCHAR2(1),
  effective_resource    CHAR(1),
  major                 VARCHAR2(100),
  school                VARCHAR2(100),
  g_role                VARCHAR2(2) not null,
  green_passport        VARCHAR2(1),
  b_grade_date          DATE,
  b_instructor_date     DATE,
  b_technical_post_date DATE,
  cautioner1_title      VARCHAR2(30),
  cautioner1_gender     CHAR(1),
  cautioner1_birthday   DATE,
  cautioner1_com_addr   VARCHAR2(100),
  cautioner1_com_zip    VARCHAR2(6),
  cautioner1_com_tel    VARCHAR2(30),
  cautioner1_home_addr  VARCHAR2(100),
  cautioner1_home_zip   VARCHAR2(6),
  cautioner1_home_tel   VARCHAR2(30),
  health_desc           VARCHAR2(100),
  dimis_is_settled      CHAR(1),
  dimis_apply_date      DATE,
  dimission_date        DATE,
  quality_grade         VARCHAR2(5),
  description           VARCHAR2(4000),
  agent_sub_cate        VARCHAR2(3),
  ind_area_train_id     NUMBER(10),
  new_agent_code        VARCHAR2(20)
)
;
create table MIGRATE_BANK
(
  bank_code               VARCHAR2(20) not null,
  internal_code           VARCHAR2(20),
  branch_bank             VARCHAR2(20),
  bank_name               VARCHAR2(100) not null,
  bank_class              CHAR(1) not null,
  agency_type             CHAR(1),
  address                 VARCHAR2(100),
  telephone               VARCHAR2(30),
  zip                     VARCHAR2(6),
  leader_id               NUMBER(10),
  organ_id                VARCHAR2(40),
  head_id                 VARCHAR2(40),
  branch_id               VARCHAR2(40),
  manager_id              NUMBER(10),
  dept_id                 VARCHAR2(20),
  status                  CHAR(1) not null,
  create_date             DATE,
  recall_date             DATE,
  comeback_date           DATE,
  insert_time             DATE not null,
  update_time             DATE not null,
  bank_type               VARCHAR2(2) not null,
  is_basic                CHAR(1) not null,
  transfer_type           VARCHAR2(1) not null,
  abbr_name               VARCHAR2(100) not null,
  address_2               VARCHAR2(100),
  address_3               VARCHAR2(100),
  address_4               VARCHAR2(100),
  manager_pay_mode        NUMBER(2),
  financing_pay_mode      NUMBER(2),
  counter_number          NUMBER(10),
  personal_depoit_balance NUMBER(10,2),
  channel_type            VARCHAR2(2),
  business_cate           VARCHAR2(2),
  updater_id              NUMBER(10),
  parent_bank             VARCHAR2(20),
  group_address           VARCHAR2(100),
  group_phone             VARCHAR2(30),
  group_leader_id         NUMBER(10),
  group_create_date       DATE,
  group_recall_date       DATE,
  group_comeback_date     DATE,
  group_status            CHAR(1),
  adjust_rate             NUMBER(5,4),
  new_bank_code           VARCHAR2(20),
  new_parent_bank         VARCHAR2(20)
)
;
create table MIGRATE_BANK_EMPLOYEE
(
  emp_id         NUMBER(10) not null,
  emp_code       VARCHAR2(20) not null,
  internal_code  VARCHAR2(20) not null,
  bank_code      VARCHAR2(20) not null,
  real_name      VARCHAR2(50) not null,
  gender         CHAR(1) not null,
  birthday       DATE,
  certi_type     NUMBER(2),
  certi_code     VARCHAR2(50),
  family_address VARCHAR2(100),
  family_zip     VARCHAR2(10),
  family_tel     VARCHAR2(40),
  branch_bank    VARCHAR2(20),
  status         NUMBER(2),
  agent_cate     VARCHAR2(1),
  grade_id       VARCHAR2(3),
  native_place   VARCHAR2(5),
  marriage_id    CHAR(1),
  nation_code    VARCHAR2(2),
  political_id   CHAR(2),
  education_id   VARCHAR2(2),
  office_address VARCHAR2(100),
  address_2      VARCHAR2(100),
  address_3      VARCHAR2(100),
  address_4      VARCHAR2(100),
  address_area   VARCHAR2(10),
  office_tel     VARCHAR2(30),
  fax            VARCHAR2(30),
  bp             VARCHAR2(30),
  celler_tel     VARCHAR2(30),
  email          VARCHAR2(50),
  special_favor  VARCHAR2(30),
  background     VARCHAR2(1000),
  description    VARCHAR2(4000),
  organ_id       VARCHAR2(40),
  technical_post VARCHAR2(50),
  new_emp_code   VARCHAR2(20)
)
;
create table MIGRATE_COMPANY_CUSTOMER
(
  parent_id          NUMBER(10),
  company_id         NUMBER(10) not null,
  company_name       VARCHAR2(150) not null,
  abbr_name          VARCHAR2(50),
  found_date         DATE,
  type_id            NUMBER(4),
  tax_code           VARCHAR2(20),
  zip                VARCHAR2(6),
  address            VARCHAR2(100),
  area_code          VARCHAR2(5),
  telephone          VARCHAR2(30),
  fax                VARCHAR2(30),
  email              VARCHAR2(50),
  notes              VARCHAR2(4000),
  parent_name        VARCHAR2(100),
  job_kind           NUMBER(2),
  organ_code         VARCHAR2(20),
  staff_amount       NUMBER(10),
  register_capital   NUMBER(10),
  capital_investment NUMBER(10),
  yield_rate         NUMBER(6,4),
  main_operation     VARCHAR2(100),
  distrinct_code     VARCHAR2(10),
  register_code      VARCHAR2(100),
  url                VARCHAR2(50),
  distribute_type    CHAR(1),
  company_level      VARCHAR2(50),
  leader_name        VARCHAR2(50),
  retired_staff      NUMBER(10),
  ss_register_num    VARCHAR2(30),
  claim_bank         VARCHAR2(20),
  claim_account      VARCHAR2(40),
  password           VARCHAR2(32),
  address_2          VARCHAR2(100),
  address_3          VARCHAR2(100),
  address_4          VARCHAR2(100),
  hospital_agree     CHAR(1) not null,
  insert_time        DATE not null,
  update_time        DATE not null,
  pwd_print          NUMBER(4) not null,
  register_date      DATE,
  cust_grade         VARCHAR2(2) not null,
  country_code       VARCHAR2(3),
  cpf_bank           VARCHAR2(20),
  cpf_account        VARCHAR2(40),
  comp_reg_code      VARCHAR2(40),
  comp_level         CHAR(1),
  social_date        DATE,
  new_company_id     NUMBER(10),
  new_parent_id      NUMBER(10)
)
;
create table MIGRATE_COMPANY_ORGAN
(
  parent_id          VARCHAR2(40),
  organ_id           VARCHAR2(40) not null,
  full_id            VARCHAR2(500) not null,
  leaf               CHAR(1) not null,
  class_id           NUMBER(1) not null,
  grade_id           NUMBER(10),
  financial_right    CHAR(1) not null,
  type_id            NUMBER(4),
  company_name       VARCHAR2(100) not null,
  abbr_name          VARCHAR2(50) not null,
  found_date         DATE,
  recall_date        DATE,
  status             CHAR(1) not null,
  delegate           VARCHAR2(40),
  tax_code           VARCHAR2(20),
  zip                CHAR(6),
  address            VARCHAR2(100),
  area_code          VARCHAR2(5),
  telephone          VARCHAR2(30),
  fax                VARCHAR2(30),
  email              VARCHAR2(50),
  chief_claim        NUMBER(10),
  chief_group_uw     NUMBER(10),
  chief_indivi_uw    NUMBER(10),
  chief_claim_grp    NUMBER(10),
  chief_claim_health NUMBER(10),
  insert_time        DATE not null,
  update_time        DATE not null,
  is_basic           CHAR(1) not null,
  leader_id          NUMBER(10),
  country_code       VARCHAR2(3),
  interest_tax_rate  NUMBER(4,4) not null,
  group_telephone1   VARCHAR2(30),
  group_telephone2   VARCHAR2(30),
  bank_telephone1    VARCHAR2(30),
  bank_telephone2    VARCHAR2(30),
  telephone2         VARCHAR2(30),
  new_organ_id       VARCHAR2(40),
  new_parent_id      VARCHAR2(40)
)
;
create table MIGRATE_CUSTOMER
(
  customer_id      NUMBER(10) not null,
  real_name        VARCHAR2(100) not null,
  gender           CHAR(1) not null,
  birthday         DATE not null,
  certi_type       NUMBER(2) not null,
  certi_code       VARCHAR2(50) not null,
  marriage_id      CHAR(1),
  education_id     VARCHAR2(2),
  address_1        VARCHAR2(150),
  zip_1            VARCHAR2(10),
  tel_1            VARCHAR2(40),
  job_com          VARCHAR2(100),
  tel_3            VARCHAR2(40),
  height           NUMBER(4,1),
  weight           NUMBER(5,2),
  rela_address     VARCHAR2(150),
  rela_zip         VARCHAR2(10),
  email            VARCHAR2(100),
  rela_other       VARCHAR2(30),
  income           NUMBER(10),
  job_1            VARCHAR2(100),
  job_2            VARCHAR2(40),
  job_class        NUMBER(2),
  job_code         VARCHAR2(20),
  job_cate_id      NUMBER(10),
  nationality      VARCHAR2(50),
  seat_address     VARCHAR2(100),
  job_kind         NUMBER(2),
  job_zip          VARCHAR2(50),
  job_address      VARCHAR2(100),
  other_address    VARCHAR2(100),
  other_zip        VARCHAR2(10),
  title            VARCHAR2(50),
  job_tel          VARCHAR2(30),
  em_life          NUMBER(4) not null,
  em_ill           NUMBER(4) not null,
  smoking          CHAR(1) not null,
  insert_time      DATE not null,
  status           CHAR(1) not null,
  death_time       DATE,
  job_class_2      NUMBER(2),
  job_code_2       VARCHAR2(20),
  job_cate_id_2    NUMBER(10),
  bp               VARCHAR2(30),
  celler           VARCHAR2(30),
  driving_licence  CHAR(1) not null,
  ss_code          VARCHAR2(30),
  retired          CHAR(1) not null,
  ss_reg_code      VARCHAR2(30),
  region_code      VARCHAR2(10),
  password         VARCHAR2(32),
  rela_address_2   VARCHAR2(100),
  rela_address_3   VARCHAR2(100),
  rela_address_4   VARCHAR2(100),
  address_2        VARCHAR2(100),
  address_3        VARCHAR2(100),
  address_4        VARCHAR2(100),
  job_address_2    VARCHAR2(100),
  job_address_3    VARCHAR2(100),
  job_address_4    VARCHAR2(100),
  lang_id          VARCHAR2(3),
  homeplace        VARCHAR2(100),
  nation_code      VARCHAR2(2),
  accident_status  VARCHAR2(2) not null,
  update_time      DATE not null,
  householder      CHAR(1) not null,
  honor_title      VARCHAR2(30),
  organ_id         VARCHAR2(40),
  pwd_print        NUMBER(4) not null,
  cust_grade       VARCHAR2(2) not null,
  ori_certi_code   VARCHAR2(50),
  focus_type       VARCHAR2(1) not null,
  employed         CHAR(1) not null,
  emp_id           NUMBER(10),
  country_code     VARCHAR2(3),
  blacklist_cause  NUMBER(2),
  social_security  CHAR(1),
  industry         VARCHAR2(40),
  blacklist_date   DATE,
  blacklist_source VARCHAR2(255),
  job_content      VARCHAR2(400),
  mobile           VARCHAR2(30),
  new_customer_id  NUMBER(10)
)
;
create table MIGRATE_DEPT
(
  organ_id        VARCHAR2(40) not null,
  parent_id       VARCHAR2(20),
  dept_id         VARCHAR2(20) not null,
  leaf            CHAR(1) not null,
  dept_name       VARCHAR2(100) not null,
  principal_id    NUMBER(10),
  status          CHAR(1) not null,
  cancel_date     DATE,
  zip             CHAR(6),
  address         VARCHAR2(100),
  area_code       VARCHAR2(5),
  telephone       VARCHAR2(30),
  fax             VARCHAR2(30),
  email           VARCHAR2(50),
  dept_cate       VARCHAR2(1),
  train_man_id    NUMBER(10),
  update_time     DATE,
  updater_id      NUMBER(10),
  create_date     DATE,
  train_date      DATE,
  insider_id      NUMBER(10),
  area_type       NUMBER(10),
  dept_grade      NUMBER(2),
  collector_id    NUMBER(10),
  insert_time     DATE not null,
  is_basic        CHAR(1) not null,
  abbr_name       VARCHAR2(50),
  cancel_cause    VARCHAR2(6),
  g_business_cate NUMBER(2),
  g_dept_grade    NUMBER(2),
  b_dept_grade    NUMBER(2),
  dept_type       CHAR(1),
  g_dept_cate     VARCHAR2(1),
  admin           CHAR(1) not null,
  cost_center     VARCHAR2(25),
  new_dept_id     VARCHAR2(20),
  new_parent_id   VARCHAR2(20)
)
;
create table MLOG$_T_COMPANY_ORGAN
(
  m_row$$         VARCHAR2(255),
  snaptime$$      DATE,
  dmltype$$       VARCHAR2(1),
  old_new$$       VARCHAR2(1),
  change_vector$$ RAW(255),
  xid$$           NUMBER
)
;
create table MLOG$_T_CONTRACT_PRODUCT
(
  item_id         NUMBER(10),
  snaptime$$      DATE,
  dmltype$$       VARCHAR2(1),
  old_new$$       VARCHAR2(1),
  change_vector$$ RAW(255)
)
;
create table MLOG$_T_CUSTOMER
(
  m_row$$         VARCHAR2(255),
  snaptime$$      DATE,
  dmltype$$       VARCHAR2(1),
  old_new$$       VARCHAR2(1),
  change_vector$$ RAW(255),
  xid$$           NUMBER
)
;
create table MLOG$_T_GIRO_CONFIG
(
  m_row$$         VARCHAR2(255),
  snaptime$$      DATE,
  dmltype$$       VARCHAR2(1),
  old_new$$       VARCHAR2(1),
  change_vector$$ RAW(255),
  xid$$           NUMBER
)
;
create table MLOG$_T_GROUP_POLICY
(
  m_row$$         VARCHAR2(255),
  snaptime$$      DATE,
  dmltype$$       VARCHAR2(1),
  old_new$$       VARCHAR2(1),
  change_vector$$ RAW(255),
  xid$$           NUMBER
)
;
create table MLOG$_T_INSURED_FIRST
(
  m_row$$         VARCHAR2(255),
  snaptime$$      DATE,
  dmltype$$       VARCHAR2(1),
  old_new$$       VARCHAR2(1),
  change_vector$$ RAW(255),
  xid$$           NUMBER
)
;
create table MLOG$_T_POLICY_FEE
(
  m_row$$         VARCHAR2(255),
  snaptime$$      DATE,
  dmltype$$       VARCHAR2(1),
  old_new$$       VARCHAR2(1),
  change_vector$$ RAW(255),
  xid$$           NUMBER
)
;
create table MLOG$_T_POLICY_PRODUCT
(
  item_id         NUMBER(10),
  snaptime$$      DATE,
  dmltype$$       VARCHAR2(1),
  old_new$$       VARCHAR2(1),
  change_vector$$ RAW(255)
)
;
create table MLOG$_T_TRANS_FMT_ORGAN_CO
(
  m_row$$         VARCHAR2(255),
  snaptime$$      DATE,
  dmltype$$       VARCHAR2(1),
  old_new$$       VARCHAR2(1),
  change_vector$$ RAW(255),
  xid$$           NUMBER
)
;
create table OGG_T_CONTRACT_PRODUCT
(
  item_id                  NUMBER(10) not null,
  master_id                NUMBER(10),
  policy_id                NUMBER(10) not null,
  product_num              VARCHAR2(10) not null,
  product_id               NUMBER(10) not null,
  ins_type                 CHAR(1) not null,
  amount                   NUMBER(14,2),
  unit                     NUMBER(12,2),
  period_prem              NUMBER(12,2) not null,
  discount_prem            NUMBER(12,2) not null,
  company_prem             NUMBER(12,2),
  employee_prem            NUMBER(12,2),
  normal_prem              NUMBER(12,2) not null,
  normal_stand             NUMBER(12,2) not null,
  weak_prem                NUMBER(12,2) not null,
  weak_stand               NUMBER(12,2) not null,
  weak_year                NUMBER(2),
  weak_arith               CHAR(1) not null,
  weak_rate                NUMBER(4,3) not null,
  weak_kilo                NUMBER(8,2) not null,
  job_prem                 NUMBER(12,2) not null,
  job_stand                NUMBER(12,2) not null,
  job_year                 NUMBER(2),
  job_arith                CHAR(1) not null,
  job_rate                 NUMBER(4,3) not null,
  job_kilo                 NUMBER(8,2) not null,
  disable_prem             NUMBER(12,2) not null,
  disable_stand            NUMBER(12,2) not null,
  disable_year             NUMBER(2),
  disable_arith            CHAR(1) not null,
  disable_rate             NUMBER(4,3) not null,
  disable_kilo             NUMBER(8,2) not null,
  dividend_choice          NUMBER(2),
  apply_date               DATE not null,
  end_date                 DATE not null,
  validate_date            DATE not null,
  paidup_date              DATE not null,
  pause_date               DATE,
  liability_state          NUMBER(2) not null,
  end_cause                NUMBER(2),
  prem_status              NUMBER(2) not null,
  premium_year             NUMBER(3) not null,
  pay_to_date              DATE not null,
  policy_year              NUMBER(2) not null,
  policy_period            NUMBER(4) not null,
  initial_type             CHAR(1) not null,
  renewal_type             CHAR(1) not null,
  insured_1                NUMBER(10) not null,
  age_1                    NUMBER(3) not null,
  relation_1               NUMBER(2),
  relation_s               NUMBER(2) not null,
  job_1_1                  VARCHAR2(200),
  job_1_2                  VARCHAR2(40),
  job_class_1              NUMBER(2),
  job_cate_1               NUMBER(10),
  em_life_1                NUMBER(4) not null,
  em_health_1              NUMBER(4) not null,
  insured_2                NUMBER(10),
  age_2                    NUMBER(3),
  relation_2               NUMBER(2),
  job_2_1                  VARCHAR2(40),
  job_2_2                  VARCHAR2(40),
  job_class_2              NUMBER(2),
  job_cate_2               NUMBER(10),
  em_life_2                NUMBER(4) not null,
  em_health_2              NUMBER(4) not null,
  pay_period               CHAR(1),
  pay_year                 NUMBER(3),
  end_period               CHAR(1),
  end_year                 NUMBER(3),
  pay_ensure               NUMBER(3),
  pay_type                 CHAR(1),
  charge_period            CHAR(1) not null,
  charge_year              NUMBER(3),
  coverage_period          CHAR(1) not null,
  coverage_year            NUMBER(5),
  short_end_time           DATE,
  except_value             NUMBER(10),
  benefit_level            VARCHAR2(20),
  housekeeper              CHAR(1),
  smoking                  CHAR(1),
  pay_rate                 NUMBER(4,3),
  insured_category         CHAR(1),
  insured_amount           NUMBER(10),
  start_pay                CHAR(1) not null,
  retired_rate             NUMBER(4,3),
  decision_id              NUMBER(2) not null,
  pause_cause              NUMBER(2),
  gender_1                 CHAR(1) not null,
  gender_2                 CHAR(1),
  loan_status              CHAR(1) not null,
  update_time              DATE not null,
  suspend                  CHAR(1) not null,
  suspend_cause            NUMBER(2),
  next_period_prem         NUMBER(12,2) not null,
  next_discount_prem       NUMBER(12,2) not null,
  next_company_prem        NUMBER(12,2) not null,
  next_employee_prem       NUMBER(12,2) not null,
  next_normal_prem         NUMBER(12,2) not null,
  next_weak_prem           NUMBER(12,2) not null,
  next_job_prem            NUMBER(12,2) not null,
  next_disable_prem        NUMBER(12,2) not null,
  age_month                NUMBER(2) not null,
  related_month            NUMBER(2) not null,
  increase_rate            NUMBER(5,4) not null,
  increase_freq            CHAR(1) not null,
  increase_year            NUMBER(2) not null,
  house_related            CHAR(1) not null,
  smoking_related          CHAR(1) not null,
  pay_mode                 NUMBER(2) not null,
  yrt_prem                 NUMBER(12,2) not null,
  expiry_cash_value        NUMBER(14,2) not null,
  tax_prem                 NUMBER(12,2) not null,
  retired                  CHAR(1) not null,
  simple_compound          CHAR(1) not null,
  loan_rate                NUMBER(5,4),
  count_way                CHAR(1) not null,
  discount_rate            NUMBER(8,6) not null,
  policy_prem              NUMBER(12,2) not null,
  policy_stand             NUMBER(12,2) not null,
  bank_code                VARCHAR2(20),
  bank_account             VARCHAR2(40),
  next_policy_prem         NUMBER(12,2) not null,
  next_tax_prem            NUMBER(12,2) not null,
  tax_prem_stand           NUMBER(12,2) not null,
  assign_way               VARCHAR2(1),
  assign_amount            NUMBER(12,2),
  assign_rate              NUMBER(4,3),
  fund_due_date            DATE not null,
  start_pay_date           DATE,
  renew_decision           VARCHAR2(1) not null,
  insert_time              DATE not null,
  pay_change_time          DATE not null,
  bonus_sa                 NUMBER(14,2) not null,
  policy_prem_waived       CHAR(1) not null,
  policy_prem_source       VARCHAR2(1) not null,
  next_weak_stand          NUMBER(12,2) not null,
  next_job_stand           NUMBER(12,2) not null,
  next_disable_stand       NUMBER(12,2) not null,
  live_range               VARCHAR2(1) not null,
  move_range               VARCHAR2(1) not null,
  yrt_stand                NUMBER(12,2) not null,
  next_yrt_prem            NUMBER(12,2) not null,
  pay_next                 NUMBER(2) not null,
  latest_bonus_sa          NUMBER(14,2) not null,
  present_balance          NUMBER(10,2) not null,
  start_inst_date          DATE,
  origin_sa                NUMBER(14,2) not null,
  origin_bonus_sa          NUMBER(14,2) not null,
  anni_balance             NUMBER(14,4) not null,
  fix_increment            CHAR(1),
  cpf_cost                 NUMBER(13,3) not null,
  cash_cost                NUMBER(13,3) not null,
  derivation               CHAR(1) not null,
  lat_ori_bonus_sa         NUMBER(14,2) not null,
  bonus_due_date           DATE,
  risk_code                VARCHAR2(2),
  exposure_rate            NUMBER(4,3) not null,
  reins_rate               NUMBER(16,6) not null,
  start_pause_cause        NUMBER(2),
  start_end_cause          NUMBER(2),
  start_liab_state         NUMBER(2) not null,
  start_prem_status        NUMBER(2) not null,
  discount_tax             NUMBER(16,6) not null,
  next_discount_tax        NUMBER(16,6) not null,
  suspend_chg_id           NUMBER(10),
  tranche_code             VARCHAR2(2),
  mortality_rate           NUMBER(8,3) not null,
  medical_flag             CHAR(1) not null,
  waiver_id                NUMBER(10),
  next_amount              NUMBER(14,2),
  waiver_start             DATE,
  waiver_end               DATE,
  weak_start               DATE,
  weak_end                 DATE,
  job_start                DATE,
  job_end                  DATE,
  disable_start            DATE,
  disable_end              DATE,
  auto_permnt_lapse        CHAR(1) not null,
  permnt_lapse_notice_date DATE,
  combo_type               VARCHAR2(10),
  combo_unit               NUMBER(12,2),
  donative_amount          NUMBER(14,2),
  pkg_id                   NUMBER(7),
  charge_fee_rate          NUMBER(7,6),
  product_assumpsit        VARCHAR2(4000),
  rate_table_prem          NUMBER(12,2),
  actual_discount_rate     NUMBER(14,4),
  sub_end_cause            NUMBER(2),
  insurance_category       CHAR(1),
  insured_ride_type        NUMBER(2),
  vehicle_type             NUMBER(2),
  vehicle_license_num      VARCHAR2(20),
  vehicle_fram_num         VARCHAR2(25),
  vehicle_engine_num       VARCHAR2(25),
  carrying_passenger_num   NUMBER(10),
  surrfee_plan             NUMBER(2),
  annuity_transfered       CHAR(1),
  draw_annuity_rate        NUMBER(9,8),
  loan_amount              NUMBER(14,2)
)
;
create table OGG_T_CUSTOMER
(
  customer_id        NUMBER(10) not null,
  real_name          VARCHAR2(100) not null,
  gender             CHAR(1) not null,
  birthday           DATE not null,
  certi_type         NUMBER(2) not null,
  certi_code         VARCHAR2(50) not null,
  marriage_id        CHAR(1),
  education_id       VARCHAR2(2),
  address_1          VARCHAR2(150),
  zip_1              VARCHAR2(10),
  tel_1              VARCHAR2(40),
  job_com            VARCHAR2(100),
  tel_3              VARCHAR2(40),
  height             NUMBER(4,1),
  weight             NUMBER(5,2),
  rela_address       VARCHAR2(200),
  rela_zip           VARCHAR2(10),
  email              VARCHAR2(100),
  rela_other         VARCHAR2(30),
  income             NUMBER(14,4),
  job_1              VARCHAR2(200),
  job_2              VARCHAR2(40),
  job_class          NUMBER(2),
  job_code           VARCHAR2(20),
  job_cate_id        NUMBER(10),
  nationality        VARCHAR2(50),
  seat_address       VARCHAR2(100),
  job_kind           NUMBER(2),
  job_zip            VARCHAR2(50),
  job_address        VARCHAR2(100),
  other_address      VARCHAR2(200),
  other_zip          VARCHAR2(10),
  title              VARCHAR2(50),
  job_tel            VARCHAR2(30),
  em_life            NUMBER(4) not null,
  em_ill             NUMBER(4) not null,
  smoking            CHAR(1) not null,
  insert_time        DATE not null,
  status             CHAR(1) not null,
  death_time         DATE,
  job_class_2        NUMBER(2),
  job_code_2         VARCHAR2(20),
  job_cate_id_2      NUMBER(10),
  bp                 VARCHAR2(30),
  celler             VARCHAR2(30),
  driving_licence    CHAR(1) not null,
  ss_code            VARCHAR2(30),
  retired            CHAR(1) not null,
  ss_reg_code        VARCHAR2(30),
  region_code        VARCHAR2(10),
  password           VARCHAR2(32),
  rela_address_2     VARCHAR2(100),
  rela_address_3     VARCHAR2(100),
  rela_address_4     VARCHAR2(100),
  address_2          VARCHAR2(100),
  address_3          VARCHAR2(100),
  address_4          VARCHAR2(100),
  job_address_2      VARCHAR2(100),
  job_address_3      VARCHAR2(100),
  job_address_4      VARCHAR2(100),
  lang_id            VARCHAR2(3),
  homeplace          VARCHAR2(100),
  nation_code        VARCHAR2(2),
  accident_status    VARCHAR2(2) not null,
  update_time        DATE not null,
  householder        CHAR(1) not null,
  honor_title        VARCHAR2(30),
  organ_id           VARCHAR2(40),
  pwd_print          NUMBER(4) not null,
  cust_grade         VARCHAR2(2) not null,
  ori_certi_code     VARCHAR2(50),
  focus_type         VARCHAR2(1) not null,
  employed           CHAR(1) not null,
  emp_id             NUMBER(10),
  country_code       VARCHAR2(3),
  blacklist_cause    NUMBER(2),
  social_security    CHAR(1),
  industry           VARCHAR2(40),
  blacklist_date     DATE,
  blacklist_source   VARCHAR2(255),
  job_content        VARCHAR2(400),
  mobile             VARCHAR2(30),
  school             VARCHAR2(300),
  class_name         VARCHAR2(100),
  noteservice        CHAR(1),
  acc_noteservice    CHAR(1),
  certi_start_date   DATE,
  certi_end_date     DATE,
  pay_address        VARCHAR2(200),
  pay_zip            VARCHAR2(10),
  area_id            VARCHAR2(10),
  residence          CHAR(1),
  family_income      NUMBER(14,4),
  address_type       CHAR(1),
  celler_areacode    VARCHAR2(10),
  income_tax_payment CHAR(1),
  tax_register_no    VARCHAR2(50),
  sup_med_insurance  CHAR(1)
)
;
create table PICC_SOUTHCENTER_REPORT
(
  gather_date     DATE,
  trans_quantity  NUMBER(10,2),
  data_size_total NUMBER(10,2),
  data_increment  NUMBER(10,2),
  rpo_min         NUMBER(10),
  rpo_max         NUMBER(10),
  rpo_avg         NUMBER(10)
)
;
create table PLAN_TABLE
(
  statement_id      VARCHAR2(30),
  plan_id           NUMBER,
  timestamp         DATE,
  remarks           VARCHAR2(4000),
  operation         VARCHAR2(30),
  options           VARCHAR2(255),
  object_node       VARCHAR2(128),
  object_owner      VARCHAR2(30),
  object_name       VARCHAR2(30),
  object_alias      VARCHAR2(65),
  object_instance   INTEGER,
  object_type       VARCHAR2(30),
  optimizer         VARCHAR2(255),
  search_columns    NUMBER,
  id                INTEGER,
  parent_id         INTEGER,
  depth             INTEGER,
  position          INTEGER,
  cost              INTEGER,
  cardinality       INTEGER,
  bytes             INTEGER,
  other_tag         VARCHAR2(255),
  partition_start   VARCHAR2(255),
  partition_stop    VARCHAR2(255),
  partition_id      INTEGER,
  other             LONG,
  distribution      VARCHAR2(30),
  cpu_cost          INTEGER,
  io_cost           INTEGER,
  temp_space        INTEGER,
  access_predicates VARCHAR2(4000),
  filter_predicates VARCHAR2(4000),
  projection        VARCHAR2(4000),
  time              INTEGER,
  qblock_name       VARCHAR2(30),
  other_xml         CLOB
)
;
create table PLSQL_PROFILER_RUNS
(
  runid           NUMBER,
  related_run     NUMBER,
  run_owner       VARCHAR2(32),
  run_date        DATE,
  run_comment     VARCHAR2(2047),
  run_total_time  NUMBER,
  run_system_info VARCHAR2(2047),
  run_comment1    VARCHAR2(2047),
  spare1          VARCHAR2(256)
)
;
create table PLSQL_PROFILER_UNITS
(
  runid          NUMBER,
  unit_number    NUMBER,
  unit_type      VARCHAR2(32),
  unit_owner     VARCHAR2(32),
  unit_name      VARCHAR2(32),
  unit_timestamp DATE,
  total_time     NUMBER default 0 not null,
  spare1         NUMBER,
  spare2         NUMBER
)
;
create table PLSQL_PROFILER_DATA
(
  runid       NUMBER,
  unit_number NUMBER,
  line#       NUMBER not null,
  total_occur NUMBER,
  total_time  NUMBER,
  min_time    NUMBER,
  max_time    NUMBER,
  spare1      NUMBER,
  spare2      NUMBER,
  spare3      NUMBER,
  spare4      NUMBER
)
;
create table POL_AGENT_CODE_TMP
(
  agent_code VARCHAR2(20)
)
;
create table POL_CUSTOMER_TMP7
(
  agent_code  VARCHAR2(25),
  accept_date DATE,
  ecif_id     NUMBER(20),
  real_name   VARCHAR2(120) not null,
  gender      CHAR(1) not null,
  birthday    DATE not null,
  age         NUMBER,
  celler      VARCHAR2(40),
  falg        NUMBER,
  update_time DATE,
  certi_code  VARCHAR2(50) not null,
  certi_type  NUMBER(2) not null
)
;
create table POL_CUSTOMER_TMP8
(
  agent_code       VARCHAR2(25),
  ecif_id          NUMBER(20) not null,
  real_name        VARCHAR2(120) not null,
  gender           CHAR(1) not null,
  birthday         DATE not null,
  age              NUMBER,
  certi_code       VARCHAR2(50) not null,
  marriage         VARCHAR2(10),
  height           NUMBER(4,1),
  weight           NUMBER(5,2),
  email            VARCHAR2(100),
  certi_start_date DATE,
  certi_end_date   DATE,
  country_name     VARCHAR2(60),
  seat_address     VARCHAR2(200),
  job_address      VARCHAR2(200),
  other_address    VARCHAR2(200),
  address          VARCHAR2(200),
  mobile           VARCHAR2(40),
  celler           VARCHAR2(40),
  job_com          VARCHAR2(100),
  job              VARCHAR2(200),
  hangye           VARCHAR2(100),
  falg             NUMBER,
  update_time      DATE,
  certi_type       NUMBER(2) not null
)
;

create table R_DATA_STATUS
(
  data_status NUMBER(3),
  status_name VARCHAR2(100) not null
)
;
create table T_EMP_GRADE
(
  grade_id   NUMBER(2) not null,
  grade_name VARCHAR2(30) not null
)
;
create table T_EMP_POSITION
(
  position_id   NUMBER(2) not null,
  position_name VARCHAR2(50) not null
)
;
create table T_GENDER
(
  gender_code CHAR(1) not null,
  gender_desc VARCHAR2(10) not null
)
;
create table T_LANGUAGE
(
  lang_id   VARCHAR2(3) not null,
  lang_name VARCHAR2(50) not null,
  used      CHAR(1) default 'N' not null
)
;
create table T_NATION
(
  nation_code VARCHAR2(2) not null,
  nation_name VARCHAR2(20) not null
)
;
create table T_POLITICAL
(
  political_id   CHAR(2) not null,
  political_name VARCHAR2(20) not null
)
;
create table T_TECHNICAL_POST
(
  post_id   VARCHAR2(3) not null,
  post_name VARCHAR2(50) not null
)
;
create table T_UNDERWRITE_LEVEL
(
  level_id   NUMBER(2) not null,
  level_name VARCHAR2(40)
)
;
create table T_USER_TYPE
(
  type_id   NUMBER(2) not null,
  type_name VARCHAR2(50) not null
)
;
create table T_DISABLE_CAUSE
(
  cause_type CHAR(1) not null,
  cause_name VARCHAR2(50) not null
)
;
create table T_USER
(
  user_id                    NUMBER(10) not null,
  organ_id                   VARCHAR2(40) not null,
  password                   VARCHAR2(100),
  real_name                  VARCHAR2(50) not null,
  create_date                DATE default SYSDATE,
  user_type                  NUMBER(2) not null,
  user_name                  VARCHAR2(30) not null,
  password_change            DATE default SYSDATE not null,
  need_change_pass           CHAR(1) default 'Y' not null,
  default_lang               VARCHAR2(3) default '011' not null,
  user_disable               CHAR(1) default 'N' not null,
  disable_cause              CHAR(1),
  invalid_login              NUMBER(10) default 0 not null,
  latest_ip                  VARCHAR2(15),
  latest_ip_old              VARCHAR2(15),
  latest_login_time          DATE,
  latest_login_old           DATE,
  latest_logout_time         DATE,
  latest_access_time         DATE,
  fingerprint_status         CHAR(1) default 'N',
  fingerprint_collect_status CHAR(1) default 'N',
  fp_invalid_login           NUMBER(10) default 0,
  bind_status                NUMBER(2),
  reset_app_time             DATE
)
;
create table T_UW_TYPE
(
  uw_type   VARCHAR2(1) not null,
  type_name VARCHAR2(30) not null
)
;
create table T_CERTI_TYPE
(
  type_id NUMBER(2) not null,
  type    VARCHAR2(50) not null
)
;
create table T_AREA_CODE
(
  area_code VARCHAR2(5) not null,
  area      VARCHAR2(50) not null,
  province  VARCHAR2(50) not null
)
;
create table T_AML_DISTRICT
(
  district_code VARCHAR2(10) not null,
  district_name VARCHAR2(150) not null
)
;
create table T_CLASS
(
  class_id NUMBER(1) not null,
  class    VARCHAR2(20) not null
)
;
create table T_COMPANY_ORGAN
(
  parent_id             VARCHAR2(40),
  organ_id              VARCHAR2(40) not null,
  full_id               VARCHAR2(500) not null,
  leaf                  CHAR(1) default 'Y' not null,
  class_id              NUMBER(1) not null,
  grade_id              NUMBER(10),
  financial_right       CHAR(1) default 'N' not null,
  type_id               NUMBER(4),
  company_name          VARCHAR2(100) not null,
  abbr_name             VARCHAR2(50) not null,
  found_date            DATE,
  recall_date           DATE,
  status                CHAR(1) default '1' not null,
  delegate              VARCHAR2(40),
  tax_code              VARCHAR2(20),
  zip                   CHAR(6),
  address               VARCHAR2(100),
  area_code             VARCHAR2(5),
  telephone             VARCHAR2(30),
  fax                   VARCHAR2(30),
  email                 VARCHAR2(50),
  chief_claim           NUMBER(10),
  chief_group_uw        NUMBER(10),
  chief_indivi_uw       NUMBER(10),
  chief_claim_grp       NUMBER(10),
  chief_claim_health    NUMBER(10),
  insert_time           DATE default SYSDATE not null,
  update_time           DATE default SYSDATE not null,
  is_basic              CHAR(1) default 'N' not null,
  leader_id             NUMBER(10),
  country_code          VARCHAR2(3),
  interest_tax_rate     NUMBER(4,4) default 0 not null,
  group_telephone1      VARCHAR2(30),
  group_telephone2      VARCHAR2(30),
  bank_telephone1       VARCHAR2(30),
  bank_telephone2       VARCHAR2(30),
  telephone2            VARCHAR2(30),
  commision_standard    NUMBER(1) default 0,
  assess_standard       NUMBER(1) default 0,
  circas_organ          VARCHAR2(15),
  is_interactive        CHAR(1),
  area                  VARCHAR2(2),
  area_name             VARCHAR2(8),
  prov_code             VARCHAR2(8),
  prov_name             VARCHAR2(100),
  city_code             VARCHAR2(8),
  city_name             VARCHAR2(100),
  district              VARCHAR2(8),
  check_mode            VARCHAR2(1),
  check_status          VARCHAR2(1),
  check_account         VARCHAR2(4000),
  check_date            DATE,
  is_business           CHAR(1) default 'N',
  organ_grade           VARCHAR2(30),
  insliscenceno         VARCHAR2(100),
  licence_start         DATE,
  licence_end           DATE,
  aml_district          VARCHAR2(10),
  area_category_code    VARCHAR2(2),
  class_four_organ_type VARCHAR2(2),
  circ_pichou_organ     VARCHAR2(20),
  circ_open_date        DATE,
  area_class_id         NUMBER(1),
  de_organ_type         VARCHAR2(40)
)
;
create table T_EDUCATION
(
  education_id VARCHAR2(2) not null,
  education    VARCHAR2(40) not null
)
;
create table T_AGENCY
(
  agency_code         VARCHAR2(20) not null,
  agency_name         VARCHAR2(100) not null,
  agency_type         CHAR(1) not null,
  address             VARCHAR2(200),
  telephone           VARCHAR2(30),
  zip                 VARCHAR2(6),
  organ_id            VARCHAR2(40),
  manager_id          NUMBER(10),
  dept_id             VARCHAR2(20),
  status              CHAR(1) not null,
  create_date         DATE not null,
  recall_date         DATE,
  fax                 VARCHAR2(30),
  insert_time         DATE default SYSDATE not null,
  update_time         DATE default SYSDATE not null,
  agency_level        VARCHAR2(2),
  agency_license_code VARCHAR2(100),
  license_start_date  DATE,
  license_end_date    DATE,
  agency_org_code     VARCHAR2(20),
  bank_code           VARCHAR2(20)
)
;
create table T_AGENT
(
  agent_id                 NUMBER(10) not null,
  real_name                VARCHAR2(60) not null,
  user_name                VARCHAR2(30),
  password                 VARCHAR2(32),
  gender                   CHAR(1),
  birthday                 DATE,
  certi_type               NUMBER(2),
  certi_code               VARCHAR2(50),
  agent_code               VARCHAR2(25) not null,
  password_change          DATE default SYSDATE,
  organ_id                 VARCHAR2(40) not null,
  head_id                  VARCHAR2(40) not null,
  branch_id                VARCHAR2(40) not null,
  user_status              CHAR(1) default '1',
  dept_id                  VARCHAR2(20) not null,
  political_id             VARCHAR2(2),
  education_id             VARCHAR2(2),
  foreign_lang_id          VARCHAR2(3),
  foreign_level_id         VARCHAR2(2),
  compute_level            VARCHAR2(2),
  instructor_grade_id      VARCHAR2(2),
  begin_job_date           DATE,
  technical_post           VARCHAR2(50),
  native_place             VARCHAR2(5),
  register_address         VARCHAR2(100),
  family_address           VARCHAR2(200),
  address_area             VARCHAR2(50),
  telephone                VARCHAR2(30),
  old_job_unit             VARCHAR2(100),
  old_job_id               VARCHAR2(10),
  bp                       VARCHAR2(50),
  celler_tel               VARCHAR2(50),
  email                    VARCHAR2(50),
  address                  VARCHAR2(200),
  marriage_id              CHAR(1),
  special_favor            VARCHAR2(50),
  cautioner1_name          VARCHAR2(40),
  cautioner1_certi_type    NUMBER(2),
  cautioner1_certi_code    VARCHAR2(50),
  cautioner1_unit          VARCHAR2(100),
  cautioner2_name          VARCHAR2(40),
  cautioner2_certi_type    NUMBER(2),
  cautioner2_certi_code    VARCHAR2(50),
  cautioner2_unit          VARCHAR2(100),
  train_man_id             NUMBER(10),
  recommend_man_id         NUMBER(10),
  grade_id                 VARCHAR2(3),
  quality_grade_id         NUMBER(3),
  qualification_id         VARCHAR2(20),
  practice_id              VARCHAR2(50),
  invest_connect_id        VARCHAR2(20),
  other_certificate_id     VARCHAR2(20),
  enter_company_date       DATE,
  leave_company_date       DATE,
  agent_status             NUMBER(2) default 1 not null,
  update_time              DATE,
  updater_id               NUMBER(10),
  probation_date           DATE,
  turn_date                DATE,
  zip                      VARCHAR2(6),
  agent_cate               VARCHAR2(1) not null,
  sign_date                DATE,
  end_date                 DATE,
  g_business_cate          NUMBER(2) default 1 not null,
  g_grade_id               NUMBER(2),
  g_position_id            NUMBER(2),
  is_charge                NUMBER(1) default 2 not null,
  comm_account             VARCHAR2(40),
  prem_account             VARCHAR2(40),
  business_cate            NUMBER(2),
  dept_train_id            NUMBER(10),
  area_train_id            NUMBER(10),
  group_train_date         DATE,
  dept_train_date          DATE,
  area_train_date          DATE,
  nation_code              VARCHAR2(2),
  indirect_train_id        NUMBER(10),
  ind_dept_train_id        NUMBER(10),
  comm_bank_code           VARCHAR2(20),
  prem_bank_code           VARCHAR2(20),
  b_grade_id               VARCHAR2(3),
  b_instructor_id          VARCHAR2(3),
  b_technical_post         VARCHAR2(3),
  finance_post_id          VARCHAR2(3),
  b_grade_num              NUMBER(3),
  reenter_flag             CHAR(1) default '0' not null,
  position_id              VARCHAR2(3),
  sell_grade               NUMBER(3),
  leave_cause              VARCHAR2(6),
  leave_target             NUMBER(3),
  c_grade_id               VARCHAR2(3),
  is_mdrt                  CHAR(1) default 'N',
  union_code               VARCHAR2(10),
  is_adp2                  CHAR(1) default 'N',
  adp2_date                DATE,
  isc_num                  NUMBER(2) default 0 not null,
  insert_time              DATE default SYSDATE not null,
  address_2                VARCHAR2(200),
  address_3                VARCHAR2(200),
  address_4                VARCHAR2(200),
  spouse_name              VARCHAR2(40),
  spouse_certi_code        VARCHAR2(50),
  citizen_type             VARCHAR2(6),
  docfpcap                 CHAR(1),
  comm_ibg_code            VARCHAR2(30),
  source_code              VARCHAR2(30),
  letter_status            VARCHAR2(1),
  credit_code              VARCHAR2(20),
  credit_period            NUMBER(4),
  credit_limit             NUMBER(12,2),
  grt_type                 VARCHAR2(2),
  grt_amount               NUMBER(12,2),
  grt_amount_rev           NUMBER(12,2),
  grt_expiry_date          DATE,
  gst_registered           CHAR(1) default 'N' not null,
  comm_suspend             VARCHAR2(1) default 'N',
  turn_money_flag          CHAR(1) default 'N' not null,
  init_grade_id            VARCHAR2(3),
  same_domain              CHAR(1),
  g_agent_cate             VARCHAR2(1),
  effective_resource       CHAR(1),
  major                    VARCHAR2(100),
  school                   VARCHAR2(100),
  g_role                   VARCHAR2(2) default '1' not null,
  green_passport           VARCHAR2(1),
  b_grade_date             DATE,
  b_instructor_date        DATE,
  b_technical_post_date    DATE,
  cautioner1_title         VARCHAR2(30),
  cautioner1_gender        CHAR(1),
  cautioner1_birthday      DATE,
  cautioner1_com_addr      VARCHAR2(100),
  cautioner1_com_zip       VARCHAR2(6),
  cautioner1_com_tel       VARCHAR2(30),
  cautioner1_home_addr     VARCHAR2(200),
  cautioner1_home_zip      VARCHAR2(6),
  cautioner1_home_tel      VARCHAR2(30),
  health_desc              VARCHAR2(100),
  dimis_is_settled         CHAR(1) default 'N',
  dimis_apply_date         DATE,
  dimission_date           DATE,
  quality_grade            VARCHAR2(5),
  description              VARCHAR2(4000),
  agent_sub_cate           VARCHAR2(3),
  ind_area_train_id        NUMBER(10),
  train_id_valid           CHAR(1) default 'Y',
  area_train_id_valid      CHAR(1) default 'Y',
  indi_area_train_id_valid CHAR(1) default 'Y',
  indi_train_id_valid      CHAR(1) default 'Y',
  dept_train_id_valid      CHAR(1) default 'Y',
  indi_dept_train_id_valid CHAR(1) default 'Y',
  out_agent_code           VARCHAR2(20),
  out_organ_id             VARCHAR2(8),
  village_id               VARCHAR2(40),
  labor_form               NUMBER(2),
  agency_code              VARCHAR2(40),
  qualification_start_date DATE,
  qualification_end_date   DATE,
  is_city_project          CHAR(1),
  city_project_no          NUMBER(10),
  sales_qualification_a    VARCHAR2(50),
  sales_qualification_b    VARCHAR2(50)
)
;
create table T_B_DEPT_GRADE
(
  b_dept_grade NUMBER(1) not null,
  name         VARCHAR2(30)
)
;
create table T_DEPT
(
  organ_id        VARCHAR2(40) not null,
  parent_id       VARCHAR2(20),
  dept_id         VARCHAR2(20) not null,
  leaf            CHAR(1) default 'Y' not null,
  dept_name       VARCHAR2(100) not null,
  principal_id    NUMBER(10),
  status          CHAR(1) default '1' not null,
  cancel_date     DATE,
  zip             CHAR(6),
  address         VARCHAR2(200),
  area_code       VARCHAR2(5),
  telephone       VARCHAR2(30),
  fax             VARCHAR2(30),
  email           VARCHAR2(50),
  dept_cate       VARCHAR2(1),
  train_man_id    NUMBER(10),
  update_time     DATE,
  updater_id      NUMBER(10),
  create_date     DATE,
  train_date      DATE,
  insider_id      NUMBER(10),
  area_type       NUMBER(10),
  dept_grade      NUMBER(2),
  collector_id    NUMBER(10),
  insert_time     DATE default SYSDATE not null,
  is_basic        CHAR(1) default 'N' not null,
  abbr_name       VARCHAR2(50),
  cancel_cause    VARCHAR2(6),
  g_business_cate NUMBER(2),
  g_dept_grade    NUMBER(2),
  b_dept_grade    NUMBER(2),
  dept_type       CHAR(1),
  g_dept_cate     VARCHAR2(1),
  admin           CHAR(1) default 'N' not null,
  cost_center     VARCHAR2(25),
  config_id       NUMBER(3),
  team_type       VARCHAR2(2)
)
;
create table T_DISTRICT
(
  distrinct_code     VARCHAR2(10) not null,
  district_name      VARCHAR2(100) not null,
  district_level     CHAR(1),
  parent_code        VARCHAR2(10),
  full_code          VARCHAR2(10),
  agent_seq_start    NUMBER(10),
  agent_seq_end      NUMBER(10),
  policy_seq         NUMBER(10),
  customer_seq       NUMBER(10),
  agent_seq_current  NUMBER(10),
  prov_district_name VARCHAR2(50),
  city_district_name VARCHAR2(100)
)
;
create table T_BATCH_CLAIM_LEVEL
(
  head_id    VARCHAR2(40),
  level_id   NUMBER(2),
  level_name VARCHAR2(40),
  max_amount NUMBER(10) default 9999999999
)
;
create table T_BCP_SPECIAL
(
  special_id   NUMBER(3) not null,
  special_desc VARCHAR2(100) not null
)
;
create table T_CLAIM_LEVEL
(
  head_id            VARCHAR2(40) not null,
  level_id           NUMBER(4) not null,
  level_name         VARCHAR2(40) not null,
  max_amount         NUMBER(10) default 9999999999 not null,
  policy_type        CHAR(1) default '0' not null,
  period_type        CHAR(1) default '0' not null,
  level_type         VARCHAR2(1) default '0' not null,
  head_company_level NUMBER(2) default 0 not null
)
;
create table T_COMPUTE_LEVEL
(
  level_id   VARCHAR2(2) not null,
  level_name VARCHAR2(20) not null
)
;
create table T_CS_APPROVAL_LEVEL
(
  level_code  VARCHAR2(6) not null,
  level_name  VARCHAR2(40) not null,
  level_order NUMBER(4) not null
)
;
create table T_CS_TYPE
(
  cs_type   VARCHAR2(1) not null,
  type_name VARCHAR2(30) not null
)
;
create table T_EMPLOYEE
(
  emp_id                NUMBER(10) not null,
  real_name             VARCHAR2(40) not null,
  user_name             VARCHAR2(30),
  gender                CHAR(1),
  birthday              DATE,
  certi_type            NUMBER(2),
  certi_code            VARCHAR2(50),
  emp_code              VARCHAR2(20) not null,
  dept_id               VARCHAR2(20) not null,
  organ_id              VARCHAR2(40) not null,
  head_id               VARCHAR2(40) not null,
  branch_id             VARCHAR2(40) not null,
  user_status           CHAR(1) default '1' not null,
  join_time             DATE,
  level_id              NUMBER(2),
  claim_level           NUMBER(2),
  political_id          CHAR(2),
  education_id          VARCHAR2(2),
  foreign_lang_id       VARCHAR2(3),
  foreign_level_id      VARCHAR2(2),
  compute_level         VARCHAR2(2),
  technical_post        VARCHAR2(3),
  native_place          VARCHAR2(10),
  register_address      VARCHAR2(10),
  nation_code           VARCHAR2(2),
  special_favor         VARCHAR2(100),
  special_skill         VARCHAR2(100),
  bp                    VARCHAR2(30),
  celler                VARCHAR2(30),
  family_address        VARCHAR2(100),
  family_zip            VARCHAR2(10),
  family_tel            VARCHAR2(40),
  email                 VARCHAR2(100),
  begin_job_date        DATE,
  old_job_unit          VARCHAR2(50),
  turn_date             DATE,
  leave_date            DATE,
  emp_position_id       NUMBER(2),
  emp_grade_id          NUMBER(2),
  cautioner1_name       VARCHAR2(40),
  cautioner1_certi_type NUMBER(2),
  cautioner1_certi_code VARCHAR2(50),
  cautioner1_unit       VARCHAR2(50),
  cautioner2_name       VARCHAR2(40),
  cautioner2_certi_type NUMBER(2),
  cautioner2_certi_code VARCHAR2(50),
  cautioner2_unit       VARCHAR2(50),
  recommend_man         VARCHAR2(30),
  recommend_content     VARCHAR2(1000),
  uw_type               VARCHAR2(1),
  underwrite_right      CHAR(1),
  case_type             CHAR(1) default '0' not null,
  insert_time           DATE default SYSDATE not null,
  update_time           DATE default SYSDATE not null,
  abbr_name             VARCHAR2(50),
  cs_appr_type          VARCHAR2(1) default '0' not null,
  cs_appr_level         VARCHAR2(6),
  special_id            NUMBER(3) default 0 not null,
  talk_back             VARCHAR2(50),
  batch_claim_level_id  NUMBER(2),
  is_admin              CHAR(1) default 'N' not null,
  group_level_id        NUMBER(2),
  cs_qyery_level        NUMBER(10),
  cs_audit_qyery_level  NUMBER(10),
  group_long_level_id   NUMBER(2)
)
;
create table T_COMPANY_TYPE
(
  type_id    NUMBER(4) not null,
  type       VARCHAR2(50) not null,
  type_lever VARCHAR2(2)
)
;
create table T_COUNTRY
(
  country_code VARCHAR2(3) not null,
  country_name VARCHAR2(60) not null,
  brief_name   VARCHAR2(10) not null
)
;
create table T_GRADE
(
  grade_id   NUMBER(10) not null,
  grade_name VARCHAR2(20) not null
)
;
create table T_DEPT_CANCEL_CAUSE
(
  cancel_cause VARCHAR2(6) not null,
  cause_name   VARCHAR2(300)
)
;
create table T_DEPT_CATE
(
  dept_cate      VARCHAR2(1),
  dept_cate_desc VARCHAR2(50)
)
;
create table T_DEPT_CHANNEL_CONFIG
(
  config_id      NUMBER(3),
  channel_id     NUMBER(1) not null,
  channel_level  NUMBER(1) not null,
  channel_desc   VARCHAR2(50) not null,
  parent_channel NUMBER(1),
  dept_cate      VARCHAR2(1)
)
;
create table T_G_BUSINESS_CATE
(
  g_business_cate NUMBER(2) not null,
  name            VARCHAR2(30)
)
;
create table T_G_DEPT_GRADE
(
  g_dept_grade NUMBER(1) not null,
  name         VARCHAR2(30)
)
;
create table T_BANK
(
  bank_code               VARCHAR2(20) not null,
  internal_code           VARCHAR2(20),
  branch_bank             VARCHAR2(20),
  bank_name               VARCHAR2(100) not null,
  bank_class              CHAR(1) not null,
  agency_type             CHAR(1),
  address                 VARCHAR2(100),
  telephone               VARCHAR2(30),
  zip                     VARCHAR2(6),
  leader_id               NUMBER(10),
  organ_id                VARCHAR2(40),
  head_id                 VARCHAR2(40),
  branch_id               VARCHAR2(40),
  manager_id              NUMBER(10),
  dept_id                 VARCHAR2(20),
  status                  CHAR(1) default 0 not null,
  create_date             DATE,
  recall_date             DATE,
  comeback_date           DATE,
  insert_time             DATE default SYSDATE not null,
  update_time             DATE default SYSDATE not null,
  bank_type               VARCHAR2(2) default '1' not null,
  is_basic                CHAR(1) default 'N' not null,
  transfer_type           VARCHAR2(1) default '0' not null,
  abbr_name               VARCHAR2(100) not null,
  address_2               VARCHAR2(100),
  address_3               VARCHAR2(100),
  address_4               VARCHAR2(100),
  manager_pay_mode        NUMBER(2) default 1,
  financing_pay_mode      NUMBER(2) default 1,
  counter_number          NUMBER(10),
  personal_depoit_balance NUMBER(10,2),
  channel_type            VARCHAR2(2),
  business_cate           VARCHAR2(2),
  updater_id              NUMBER(10),
  parent_bank             VARCHAR2(20),
  group_address           VARCHAR2(100),
  group_phone             VARCHAR2(30),
  group_leader_id         NUMBER(10),
  group_create_date       DATE,
  group_recall_date       DATE,
  group_comeback_date     DATE,
  group_status            CHAR(1) default 0,
  adjust_rate             NUMBER(5,4),
  sell_way                VARCHAR2(2),
  real_name               VARCHAR2(100),
  agent_code              VARCHAR2(25),
  licence_code            VARCHAR2(100),
  licence_daealine        DATE,
  deliverer_code          VARCHAR2(30),
  deliverer_name          VARCHAR2(30),
  area_category_code      VARCHAR2(2),
  channel_share           VARCHAR2(2),
  valid_start_date        DATE,
  valid_end_date          DATE
)
;
create table T_BANK_TEXT
(
  send_id          NUMBER(10) not null,
  branch_id        VARCHAR2(40) not null,
  organ_id         VARCHAR2(40) not null,
  send_text        CLOB,
  create_time      DATE default SYSDATE not null,
  downloads        NUMBER(4) default 0 not null,
  back_text        CLOB,
  upload_time      DATE,
  status           CHAR(1) not null,
  sender_id        NUMBER(10),
  backer_id        NUMBER(10),
  bank_code        VARCHAR2(20),
  collect_pay      CHAR(1) default '0' not null,
  disc_flag        NUMBER(1) default 1 not null,
  pay_mode         NUMBER(2),
  year_month       VARCHAR2(6),
  insert_time      DATE default SYSDATE not null,
  update_time      DATE default SYSDATE not null,
  disc_no          VARCHAR2(20),
  text_seq         NUMBER(6) default 0 not null,
  send_middle_busi VARCHAR2(1) default 'N' not null,
  download_id      NUMBER(10)
)


create table T_ACCOUNT_END_CAUSE
(
  cause_id   VARCHAR2(1) not null,
  cause_desc VARCHAR2(30) not null
)
;
create table T_ACCOUNT_STATUS
(
  status_id   VARCHAR2(1) not null,
  status_desc VARCHAR2(40) not null
)
;
create table T_ACCOUNT_TYPE
(
  account_type CHAR(1) not null,
  type_name    VARCHAR2(30) not null
)
;
create table T_BANK_ACCOUNT
(
  bank_code          VARCHAR2(20) not null,
  bank_account       VARCHAR2(40) not null,
  acco_name          VARCHAR2(120),
  certi_type         NUMBER(2),
  certi_code         VARCHAR2(50),
  account_status     VARCHAR2(1) not null,
  suspend_cause      VARCHAR2(1),
  apply_date         DATE not null,
  operater_id        NUMBER(10) not null,
  insert_time        DATE default SYSDATE not null,
  ibg_code           VARCHAR2(30),
  send_id            NUMBER(10),
  is_basic           CHAR(1) default 'N' not null,
  account_type       CHAR(1) default '7' not null,
  cause_desc         VARCHAR2(1000),
  unsuccess_id       VARCHAR2(4),
  record_id          NUMBER(10),
  record_time        DATE,
  organ_id           VARCHAR2(40),
  transfer_name      VARCHAR2(100),
  prov_district_name VARCHAR2(50),
  city_district_name VARCHAR2(50),
  public_private     CHAR(1) default '1',
  true_sign          CHAR(1)
)
;
create table T_AGENT_CATE
(
  agent_cate VARCHAR2(1) not null,
  cate_name  VARCHAR2(30),
  insider    CHAR(1) default 'N' not null,
  code_type  CHAR(1) not null
)
;
create table T_AGENT_GRADE
(
  grade_id   VARCHAR2(3) not null,
  grade_name VARCHAR2(300),
  agent_cate VARCHAR2(1) not null,
  is_valid   CHAR(1) default 'Y' not null
)
;
create table T_AGENT_GRT_TYPE
(
  guarantee_type VARCHAR2(2) not null,
  guarantee_name VARCHAR2(50)
)
;
create table T_AGENT_POSITION
(
  position_id VARCHAR2(3) not null,
  agent_cate  VARCHAR2(1) not null,
  grade_name  VARCHAR2(30)
)
;
create table T_AGENT_SUB_CATE
(
  agent_sub_cate VARCHAR2(3) not null,
  sub_cate_name  VARCHAR2(50) not null,
  agent_cate     VARCHAR2(1) not null
)
;
create table T_BUSINESS_CATE
(
  business_cate NUMBER(2) not null,
  name          VARCHAR2(30)
)
;
create table T_B_AGENT_GRADE
(
  grade_id   VARCHAR2(3) not null,
  grade_name VARCHAR2(30)
)
;
create table T_B_FINANCE_POST
(
  post_id   VARCHAR2(3) not null,
  post_name VARCHAR2(30)
)
;
create table T_B_INSTRUCTOR
(
  instructor_id   VARCHAR2(3) not null,
  instructor_name VARCHAR2(30)
)
;
create table T_B_TECHNICAL_POST
(
  post_id   VARCHAR2(3) not null,
  post_name VARCHAR2(30)
)
;
create table T_CITIZEN_TYPE
(
  citizen_type VARCHAR2(6) not null,
  citizen_name VARCHAR2(30)
)
;
create table T_C_AGENT_GRADE
(
  c_grade_id VARCHAR2(3) not null,
  name       VARCHAR2(30) not null
)
;
create table T_G_ROLE
(
  role_id   NUMBER(3) not null,
  role_name VARCHAR2(50)
)
;
create table T_G_AGENT_GRADE
(
  g_agent_grade   NUMBER(2) not null,
  name            VARCHAR2(30),
  g_business_cate NUMBER(2),
  role_id         NUMBER(3)
)
;
create table T_G_AGENT_POSITION
(
  g_position_id   NUMBER(2) not null,
  name            VARCHAR2(30),
  g_business_cate NUMBER(2),
  role_id         NUMBER(3)
)
;
create table T_INSTRUCTOR_GRADE
(
  instructor_grade_id   VARCHAR2(3) not null,
  instructor_grade_name VARCHAR2(30),
  description           VARCHAR2(200),
  agent_cate            VARCHAR2(1) not null
)
;
create table T_LABOR_FORM
(
  form_id   NUMBER(2) not null,
  form_name VARCHAR2(50) not null
)
;
create table T_LEAVE_CASE
(
  leave_case VARCHAR2(6) not null,
  case_name  VARCHAR2(300)
)
;
create table T_LEAVE_TARGET
(
  leave_target NUMBER(3) not null,
  target_name  VARCHAR2(30)
)
;
create table T_SELL_GRADE
(
  sell_grade NUMBER(3) not null,
  grade_name VARCHAR2(30)
)
;
create table T_AGENCY_STATUS
(
  agency_status CHAR(1) not null,
  status_name   VARCHAR2(30) not null
)
;
create table T_AGENCY_TYPE
(
  agency_type CHAR(1) not null,
  type_name   VARCHAR2(50) not null,
  quotiety    NUMBER(5,2)
)
;
create table T_AGENCY_LEVEL
(
  level_id   VARCHAR2(2),
  level_name VARCHAR2(64) not null
)
;
create table T_DISTRICT_LEVEL
(
  district_level CHAR(1),
  level_desc     VARCHAR2(50) not null
)
;
create table T_CHANNEL_TYPE
(
  individual_group CHAR(1) not null,
  type_name        VARCHAR2(20) not null,
  receivable       CHAR(1) default 'N' not null,
  receiv_days      NUMBER(6) default 0 not null,
  prem_round       NUMBER(6) default 1 not null
)
;
create table T_PERIOD_TYPE
(
  period_type CHAR(1) not null,
  type_name   VARCHAR2(20) not null
)
;
create table T_PAYMODE_TYPE
(
  paymode_type VARCHAR2(2) not null,
  type_name    VARCHAR2(60) not null
)
;
create table T_PAY_MODE
(
  mode_id      NUMBER(2) not null,
  mode_name    VARCHAR2(40) not null,
  focused      CHAR(1) default 'N' not null,
  cpf          CHAR(1) default 'N' not null,
  cpf_bank     CHAR(1) default 'N' not null,
  paymode_type VARCHAR2(2) not null
)
;
create table T_BANK_CLASS
(
  class_id   CHAR(1) not null,
  class_name VARCHAR2(20) not null
)
;
create table T_MARRIAGE
(
  marriage_id CHAR(1) not null,
  marriage    VARCHAR2(10) not null
)
;
create table T_BANK_EMPLOYEE
(
  emp_id           NUMBER(10) not null,
  emp_code         VARCHAR2(20) not null,
  internal_code    VARCHAR2(20) not null,
  bank_code        VARCHAR2(20) not null,
  real_name        VARCHAR2(50) not null,
  gender           CHAR(1) not null,
  birthday         DATE,
  certi_type       NUMBER(2),
  certi_code       VARCHAR2(50),
  family_address   VARCHAR2(100),
  family_zip       VARCHAR2(10),
  family_tel       VARCHAR2(40),
  branch_bank      VARCHAR2(20),
  status           NUMBER(2) default 1,
  agent_cate       VARCHAR2(1),
  grade_id         VARCHAR2(3),
  native_place     VARCHAR2(5),
  marriage_id      CHAR(1),
  nation_code      VARCHAR2(2),
  political_id     CHAR(2),
  education_id     VARCHAR2(2),
  office_address   VARCHAR2(100),
  address_2        VARCHAR2(100),
  address_3        VARCHAR2(100),
  address_4        VARCHAR2(100),
  address_area     VARCHAR2(10),
  office_tel       VARCHAR2(30),
  fax              VARCHAR2(30),
  bp               VARCHAR2(30),
  celler_tel       VARCHAR2(30),
  email            VARCHAR2(50),
  special_favor    VARCHAR2(30),
  background       VARCHAR2(1000),
  description      VARCHAR2(4000),
  organ_id         VARCHAR2(40),
  technical_post   VARCHAR2(50),
  qualify_code     VARCHAR2(40),
  qualify_end_date DATE,
  update_time      DATE default sysdate not null
)
;
create table T_BANK_TYPE
(
  bank_type VARCHAR2(2) not null,
  type_name VARCHAR2(30) not null
)
;
create table R_HQPKG_RECORD
(
  pkg_id      NUMBER(10),
  file_name   VARCHAR2(100),
  create_date DATE default SYSDATE,
  create_oper NUMBER(10)
)
;
create table R_HQREPORT_RECORD
(
  report_id   NUMBER(10) not null,
  file_name   VARCHAR2(100),
  file_type   NUMBER(2),
  create_date DATE default SYSDATE,
  create_oper NUMBER(10),
  cttn        NUMBER(10),
  pkg_id      NUMBER(10),
  sn          NUMBER(4)
)
;
create table R_HQ_CUSTOMER
(
  r_cust_id   NUMBER(10) not null,
  customer_id NUMBER(10),
  real_name   VARCHAR2(100),
  gender      CHAR(1),
  birthday    DATE,
  certi_type  NUMBER(2),
  certi_code  VARCHAR2(50),
  nationality VARCHAR2(50),
  organ_id    VARCHAR2(40),
  trans_date  DATE,
  insert_time DATE default SYSDATE,
  status      NUMBER(3),
  report_time DATE,
  report_id   NUMBER(10)
)
;
create table T_FEE_TABLE
(
  table_code VARCHAR2(1) not null,
  table_name VARCHAR2(30) not null
)
;
create table T_FEE_TYPE
(
  type_id             NUMBER(3) not null,
  type_name           VARCHAR2(40) not null,
  commission          CHAR(1) default '0' not null,
  actual_type         CHAR(1) default '0' not null,
  advance_type        CHAR(1) default '0' not null,
  account_type        CHAR(1) default '1' not null,
  data_table          VARCHAR2(1) default '1' not null,
  vat_flag            CHAR(1) default 0,
  need_service_charge CHAR(1)
)
;
create table T_PAY_WAY
(
  pay_way  VARCHAR2(2) not null,
  way_name VARCHAR2(40) not null
)
;
create table R_HQ_DATA
(
  hq_data_id  NUMBER(10),
  fee_id      NUMBER(10),
  policy_id   NUMBER(10),
  period_prem NUMBER(12,2),
  finish_time DATE,
  fee_type    NUMBER(3),
  pay_way     VARCHAR2(2),
  organ_id    VARCHAR2(40),
  r_cust_id   NUMBER(10),
  status      NUMBER(3),
  insert_time DATE default SYSDATE,
  crcd        VARCHAR2(4)
)
;
create table R_ORGAN_AREA
(
  qh_code      VARCHAR2(6) not null,
  organ_id     VARCHAR2(40) not null,
  company_name VARCHAR2(100) not null,
  area_name    VARCHAR2(50),
  class_id     NUMBER(1) not null
)
;
create table R_ORGAN_INFO
(
  organ_id   VARCHAR2(40) not null,
  organ_name VARCHAR2(100) not null,
  link_name  VARCHAR2(40) not null,
  office_tel VARCHAR2(30),
  ip_tel     VARCHAR2(30),
  link_tel   VARCHAR2(30),
  email      VARCHAR2(50)
)
;
create table R_REPORT_DATA
(
  report_date VARCHAR2(8),
  organ_id    VARCHAR2(40),
  status      NUMBER(2),
  create_date DATE default SYSDATE,
  create_id   NUMBER(10),
  data1       VARCHAR2(100),
  data2       VARCHAR2(100),
  data3       VARCHAR2(100),
  data4       VARCHAR2(100),
  data5       VARCHAR2(100),
  data6       VARCHAR2(100),
  data7       VARCHAR2(100),
  data8       VARCHAR2(100),
  data9       VARCHAR2(100),
  data10      VARCHAR2(100),
  data11      VARCHAR2(100),
  data12      VARCHAR2(100),
  data13      VARCHAR2(100),
  data14      VARCHAR2(100),
  data15      VARCHAR2(100),
  data16      VARCHAR2(100)
)
;
create table R_SUPKG_RECORD
(
  pkg_id      NUMBER(10),
  file_name   VARCHAR2(100),
  create_date DATE default SYSDATE,
  create_oper NUMBER(10)
)
;
create table R_SUREPORT_RECORD
(
  report_id   NUMBER(10),
  file_name   VARCHAR2(100),
  file_type   NUMBER(2),
  create_date DATE default SYSDATE,
  create_oper NUMBER(10),
  trcd        VARCHAR2(20),
  sctn        NUMBER(4),
  ictn        NUMBER(4),
  tnum        NUMBER(8),
  pkg_id      NUMBER(10),
  sn          NUMBER(4)
)
;
create table R_SUSPICIOUS_DEGREE
(
  sd_id   NUMBER(2) not null,
  sd_desc VARCHAR2(100) not null
)
;
create table R_SU_DATA
(
  su_data_id      NUMBER(10),
  trans_spot      VARCHAR2(20),
  stcr            VARCHAR2(100),
  sdgr            VARCHAR2(2),
  tkms            VARCHAR2(128),
  ssds            VARCHAR2(500),
  insert_organ_id VARCHAR2(40),
  insert_oper     NUMBER(10),
  insert_time     DATE default SYSDATE,
  status          NUMBER(3),
  report_time     DATE,
  report_id       NUMBER(10),
  sscat           VARCHAR2(2)
)
;
create table T_COUNT_WAY
(
  count_way      CHAR(1) not null,
  count_way_desc VARCHAR2(20) not null
)
;
create table T_COVERAGE_PERIOD
(
  coverage_period CHAR(1) not null,
  coverage_desc   VARCHAR2(50) not null
)
;
create table T_CUST_GRADE
(
  cust_grade VARCHAR2(2) not null,
  grade_name VARCHAR2(30) not null
)
;
create table T_CUST_STATUS
(
  cust_status CHAR(1) not null,
  status_name VARCHAR2(30) not null
)
;
create table T_JOB_CATEGORY
(
  organ_id    VARCHAR2(40) not null,
  job_cate_id NUMBER(10) not null,
  job_code    VARCHAR2(20),
  class_1     VARCHAR2(100),
  class_2     VARCHAR2(100),
  class_3     VARCHAR2(200)
)
;
create table T_JOB_KIND
(
  job_kind NUMBER(2) not null,
  job_desc VARCHAR2(100) not null
)
;
create table T_ACCIDENT_STATUS
(
  accident_status VARCHAR2(2) not null,
  status_desc     VARCHAR2(100) not null
)
;
create table T_ADMIN_AREA
(
  parent_id  VARCHAR2(10),
  area_id    VARCHAR2(10) not null,
  area_name  VARCHAR2(100) not null,
  class_id   NUMBER(1) default 1 not null,
  version_id NUMBER(10)
)
;
create table T_GROUP_CERTI_TYPE
(
  certi_type CHAR(1) not null,
  type_name  VARCHAR2(50)
)
;
create table T_DISTRIBUTE_TYPE
(
  distribute_type CHAR(1) not null,
  type_name       VARCHAR2(30) not null
)
;
create table T_SS_CERTI_TYPE
(
  certi_type CHAR(1) not null,
  type_name  VARCHAR2(50)
)
;
create table T_COMPANY_CUSTOMER
(
  parent_id           NUMBER(10),
  company_id          NUMBER(10) not null,
  company_name        VARCHAR2(240),
  abbr_name           VARCHAR2(120),
  found_date          DATE,
  type_id             NUMBER(4),
  tax_code            VARCHAR2(20),
  zip                 VARCHAR2(6),
  address             VARCHAR2(200),
  area_code           VARCHAR2(5),
  telephone           VARCHAR2(30),
  fax                 VARCHAR2(30),
  email               VARCHAR2(50),
  notes               VARCHAR2(4000),
  parent_name         VARCHAR2(100),
  job_kind            NUMBER(2),
  organ_code          VARCHAR2(20),
  staff_amount        NUMBER(10),
  register_capital    NUMBER(10),
  capital_investment  NUMBER(10),
  yield_rate          NUMBER(6,4),
  main_operation      VARCHAR2(100),
  distrinct_code      VARCHAR2(10),
  register_code       VARCHAR2(100),
  url                 VARCHAR2(50),
  distribute_type     CHAR(1),
  company_level       VARCHAR2(50),
  leader_name         VARCHAR2(50),
  retired_staff       NUMBER(10),
  ss_register_num     VARCHAR2(30),
  claim_bank          VARCHAR2(20),
  claim_account       VARCHAR2(40),
  password            VARCHAR2(32),
  address_2           VARCHAR2(100),
  address_3           VARCHAR2(100),
  address_4           VARCHAR2(100),
  hospital_agree      CHAR(1) default 'N' not null,
  insert_time         DATE default SYSDATE not null,
  update_time         DATE default SYSDATE not null,
  pwd_print           NUMBER(4) default 0 not null,
  register_date       DATE,
  cust_grade          VARCHAR2(2) default '1' not null,
  country_code        VARCHAR2(3),
  cpf_bank            VARCHAR2(20),
  cpf_account         VARCHAR2(40),
  comp_reg_code       VARCHAR2(40),
  comp_level          CHAR(1),
  social_date         DATE,
  on_duty_staff       NUMBER(10),
  id_no               VARCHAR2(80),
  id_type             CHAR(1),
  area_id             VARCHAR2(10),
  holder_type         NUMBER(2),
  certi_start_date    DATE,
  certi_end_date      DATE,
  ss_certi_type       CHAR(1),
  first_taxprf_date   DATE,
  exempt_company      CHAR(1),
  company_type        NUMBER(2),
  resident_type       NUMBER(2),
  nonbusiness_company CHAR(1)
)
;
create table T_BLACKLIST_CAUSE
(
  blacklist_cause NUMBER(2) not null,
  cause_name      VARCHAR2(100) not null
)
;
create table T_CUSTOMER
(
  customer_id         NUMBER(10) not null,
  real_name           VARCHAR2(120) not null,
  gender              CHAR(1) not null,
  birthday            DATE not null,
  certi_type          NUMBER(2) not null,
  certi_code          VARCHAR2(50) not null,
  marriage_id         CHAR(1),
  education_id        VARCHAR2(2),
  address_1           VARCHAR2(150),
  zip_1               VARCHAR2(10),
  tel_1               VARCHAR2(40),
  job_com             VARCHAR2(100),
  tel_3               VARCHAR2(40),
  height              NUMBER(4,1),
  weight              NUMBER(5,2),
  rela_address        VARCHAR2(200),
  rela_zip            VARCHAR2(10),
  email               VARCHAR2(100),
  rela_other          VARCHAR2(30),
  income              NUMBER(14,4),
  job_1               VARCHAR2(200),
  job_2               VARCHAR2(40),
  job_class           NUMBER(2),
  job_code            VARCHAR2(20),
  job_cate_id         NUMBER(10),
  nationality         VARCHAR2(50),
  seat_address        VARCHAR2(200),
  job_kind            NUMBER(2),
  job_zip             VARCHAR2(50),
  job_address         VARCHAR2(200),
  other_address       VARCHAR2(200),
  other_zip           VARCHAR2(10),
  title               VARCHAR2(50),
  job_tel             VARCHAR2(30),
  em_life             NUMBER(4) default 0 not null,
  em_ill              NUMBER(4) default 0 not null,
  smoking             CHAR(1) default 'N' not null,
  insert_time         DATE default sysdate not null,
  status              CHAR(1) default '2' not null,
  death_time          DATE,
  job_class_2         NUMBER(2),
  job_code_2          VARCHAR2(20),
  job_cate_id_2       NUMBER(10),
  bp                  VARCHAR2(30),
  celler              VARCHAR2(30),
  driving_licence     CHAR(1) default 'N' not null,
  ss_code             VARCHAR2(30),
  retired             CHAR(1) default 'N' not null,
  ss_reg_code         VARCHAR2(30),
  region_code         VARCHAR2(10),
  password            VARCHAR2(32),
  rela_address_2      VARCHAR2(100),
  rela_address_3      VARCHAR2(100),
  rela_address_4      VARCHAR2(100),
  address_2           VARCHAR2(100),
  address_3           VARCHAR2(100),
  address_4           VARCHAR2(100),
  job_address_2       VARCHAR2(100),
  job_address_3       VARCHAR2(100),
  job_address_4       VARCHAR2(100),
  lang_id             VARCHAR2(3),
  homeplace           VARCHAR2(100),
  nation_code         VARCHAR2(2),
  accident_status     VARCHAR2(2) default '0' not null,
  update_time         DATE default SYSDATE not null,
  householder         CHAR(1) default 'Y' not null,
  honor_title         VARCHAR2(30),
  organ_id            VARCHAR2(40),
  pwd_print           NUMBER(4) default 0 not null,
  cust_grade          VARCHAR2(2) default '1' not null,
  ori_certi_code      VARCHAR2(50),
  focus_type          VARCHAR2(1) default '1' not null,
  employed            CHAR(1) default 'N' not null,
  emp_id              NUMBER(10),
  country_code        VARCHAR2(3),
  blacklist_cause     NUMBER(2),
  social_security     CHAR(1) default 'N',
  industry            VARCHAR2(40),
  blacklist_date      DATE,
  blacklist_source    VARCHAR2(255),
  job_content         VARCHAR2(400),
  mobile              VARCHAR2(30),
  school              VARCHAR2(300),
  class_name          VARCHAR2(100),
  noteservice         CHAR(1) default 'N',
  acc_noteservice     CHAR(1) default 'N',
  certi_start_date    DATE,
  certi_end_date      DATE,
  pay_address         VARCHAR2(200),
  pay_zip             VARCHAR2(10),
  area_id             VARCHAR2(10),
  residence           CHAR(1),
  family_income       NUMBER(14,4),
  address_type        CHAR(1),
  celler_areacode     VARCHAR2(10),
  income_tax_payment  CHAR(1),
  tax_register_no     VARCHAR2(50),
  sup_med_insurance   CHAR(1),
  stage_id            NUMBER(2),
  resident_type       NUMBER(2),
  working_life        NUMBER(2),
  is_chinese_only     CHAR(1),
  authorization_sign  CHAR(1),
  is_paid_for_disease CHAR(1),
  is_filed_poor       CHAR(1)
)



create table T_DERIVATION_TYPE
(
  deriv_type CHAR(1) not null,
  type_name  VARCHAR2(30) not null
)
;
create table T_END_CAUSE
(
  cause_id        NUMBER(2) not null,
  cause_name      VARCHAR2(100) not null,
  cause_type      NUMBER(2) default 0 not null,
  is_claim_enable VARCHAR2(1) default 'N' not null
)
;
create table T_FEE_SOURCE
(
  source_type VARCHAR2(1) not null,
  type_name   VARCHAR2(60) not null
)
;
create table T_INCREASE_FREQ
(
  increase_freq CHAR(1) not null,
  freq_desc     VARCHAR2(30) not null
)
;
create table T_INSURED_CATEGORY
(
  insured_category CHAR(1) not null,
  type_name        VARCHAR2(30) not null
)
;
create table T_POLICY_RELATION
(
  relation_id NUMBER(2) not null,
  relation    VARCHAR2(20)
)
;
create table T_HI_PLAN
(
  plan_id   NUMBER(10) not null,
  plan_desc VARCHAR2(100)
)
;
create table T_AGREEMENT_TYPE
(
  agreement_type NUMBER(2) not null,
  type_name      VARCHAR2(100)
)
;
create table T_BACKGROUND_CALL_RESULT
(
  result_id   NUMBER(1) not null,
  result_name VARCHAR2(100) not null
)
;
create table T_BACKGROUND_CALL_STATUS
(
  status_id   NUMBER(1) not null,
  status_name VARCHAR2(100) not null
)
;
create table T_BACKGROUND_PROCESS
(
  process_id     NUMBER(10) not null,
  program_name   VARCHAR2(200) not null,
  procedure_desc VARCHAR2(300) not null,
  para_num       NUMBER(2),
  priority       NUMBER(1) default 5 not null,
  full_cycle     CHAR(1) default 'N' not null,
  worker_name    VARCHAR2(200)
)
;
create table T_BACKGROUND_CALL
(
  call_id       NUMBER(10) not null,
  process_id    NUMBER(10) not null,
  emp_id        NUMBER(10) not null,
  call_time     DATE default SYSDATE not null,
  plan_time     DATE default SYSDATE not null,
  start_time    DATE,
  end_time      DATE,
  call_status   NUMBER(1) not null,
  call_result   NUMBER(1),
  log_info      VARCHAR2(4000),
  para_value_1  VARCHAR2(200),
  para_value_2  VARCHAR2(200),
  para_value_3  VARCHAR2(200),
  para_value_4  VARCHAR2(2000),
  para_value_5  VARCHAR2(200),
  para_value_6  VARCHAR2(200),
  para_value_7  VARCHAR2(200),
  para_value_8  VARCHAR2(200),
  para_value_9  VARCHAR2(200),
  para_value_10 VARCHAR2(200),
  ora_job_id    VARCHAR2(40),
  host_name     VARCHAR2(200),
  pid           NUMBER(10),
  flag          NUMBER(2)
)

create table T_AIR_TEXT
(
  text_id      NUMBER(12),
  text         CLOB,
  start_time   DATE not null,
  end_time     DATE not null,
  parse_state  NUMBER(1) default 0 not null,
  parse_error  VARCHAR2(1000),
  policy_count NUMBER(5),
  insert_time  DATE default sysdate not null,
  update_time  DATE default sysdate not null,
  call_id      NUMBER(10),
  cfg_id       NUMBER(1)
)

create table T_AIR_POLICY
(
  insure_no              VARCHAR2(20),
  airline_no             VARCHAR2(3),
  passenger_name         VARCHAR2(40) not null,
  passenger_id           VARCHAR2(50) not null,
  flight_number          VARCHAR2(20) not null,
  flight_date            VARCHAR2(8) not null,
  origin_airport         VARCHAR2(3),
  dest_airport           VARCHAR2(3),
  flight_time            VARCHAR2(4) not null,
  company_code           VARCHAR2(4),
  company_name           VARCHAR2(80),
  benefit_type           CHAR(1) not null,
  benefitor_name         VARCHAR2(40),
  benefitor_id           VARCHAR2(20),
  office_code            VARCHAR2(7),
  office_name            VARCHAR2(60),
  operator               VARCHAR2(20),
  operate_time           VARCHAR2(14) not null,
  iata_no                VARCHAR2(8),
  text_id                NUMBER(12) not null,
  check_state            NUMBER(1) default 0 not null,
  check_error            VARCHAR2(1000),
  insert_time            DATE default sysdate not null,
  update_time            DATE default sysdate not null,
  ticket_no              VARCHAR2(15),
  insure_item_id         VARCHAR2(32),
  airline_order_no       VARCHAR2(16),
  protocol_code          VARCHAR2(20),
  insurance_product_id   VARCHAR2(32),
  insurance_product_name VARCHAR2(50),
  insurance_begin_date   VARCHAR2(14),
  insurance_end_date     VARCHAR2(14),
  applicant_name         VARCHAR2(100),
  applicant_id           VARCHAR2(30),
  insured_id             VARCHAR2(30),
  insured_mobile         VARCHAR2(30),
  insured_email          VARCHAR2(30),
  applicant_mobile       VARCHAR2(30),
  applicant_email        VARCHAR2(30),
  insured_name           VARCHAR2(100),
  cfg_id                 NUMBER(1)
)
;
create table T_ANSWERED_STATUS
(
  answered_status VARCHAR2(1) not null,
  status_name     VARCHAR2(30) not null
)
;
create table T_ANSWER_TYPE
(
  answer_type VARCHAR2(1) not null,
  type_name   VARCHAR2(30) not null
)
;
create table T_ASSIGNEE_TYPE
(
  assignee_type VARCHAR2(2) not null,
  type_name     VARCHAR2(30) not null
)
;
create table T_AUTO_DECISION
(
  decision_id NUMBER(2) not null,
  decision    VARCHAR2(30)
)
;
create table T_CAMPAIGN_INFO
(
  campaign_code  VARCHAR2(10) not null,
  campaign_name  VARCHAR2(40) not null,
  comm_discount  NUMBER(5,4) default 1 not null,
  comm_disc_type CHAR(1) default '1' not null,
  net_c_discount NUMBER(5,4) default 1 not null,
  prem_discount  NUMBER(5,4) default 1 not null,
  prem_months    NUMBER(4) default 0 not null,
  unit_rate      NUMBER(5,4) default 0 not null,
  input_date     DATE default SYSDATE not null,
  updater_id     NUMBER(10)
)
;
create table T_CLAIM_DEAL
(
  deal_id   NUMBER(4) not null,
  deal_name VARCHAR2(100) not null
)
;
create table T_LIABILITY_STATUS
(
  status_id   NUMBER(2) not null,
  status_name VARCHAR2(100) not null
)
;
create table T_PAUSE_CAUSE
(
  cause_id   NUMBER(2) not null,
  cause_name VARCHAR2(100) not null
)
;
create table T_PREM_STATUS
(
  status_id   NUMBER(2) not null,
  status_name VARCHAR2(100) not null
)
;
create table T_MONEY
(
  money_id   NUMBER(6) not null,
  money_name VARCHAR2(20) not null,
  money_sign VARCHAR2(6),
  money_code VARCHAR2(10) not null
)
;
create table T_SUSPEND_CAUSE
(
  cause_id   NUMBER(2) not null,
  cause_name VARCHAR2(100) not null
)
;
create table T_ISSUE_WAY
(
  issue_way  NUMBER(10) not null,
  issue_name VARCHAR2(100)
)
;
create table T_DELIVER_TYPE
(
  deliver_type CHAR(1) not null,
  type_name    VARCHAR2(50) not null
)
;
create table T_EMP_ATTACH_TYPE
(
  emp_attach_type CHAR(1) not null,
  type_name       VARCHAR2(30) not null
)
;
create table T_FORCE_CANCEL_MARK_DESC
(
  mark_code VARCHAR2(40) not null,
  mark      VARCHAR2(500) not null
)
;
create table T_GROUP_SINGLE
(
  group_single CHAR(1) not null,
  type_name    VARCHAR2(30) not null
)
;
create table T_IGP_TYPE
(
  igp_type  CHAR(1) not null,
  igp_abbr  VARCHAR2(10) not null,
  type_name VARCHAR2(100)
)
;
create table T_MATU_PROCESS
(
  matu_process VARCHAR2(1) not null,
  process_desc VARCHAR2(30) not null
)
;
create table T_MATU_STATUS
(
  matu_status VARCHAR2(1) not null,
  status_name VARCHAR2(100) not null
)
;
create table T_OVERDUE_OPTION
(
  option_type CHAR(1) not null,
  type_name   VARCHAR2(30) not null
)
;
create table T_OVER_MANAGE
(
  over_manage CHAR(1) not null,
  type_name   VARCHAR2(30) not null
)
;
create table T_CHANGE_SOURCE
(
  change_source VARCHAR2(2) not null,
  source_desc   VARCHAR2(100) not null
)
;
create table T_SERVICE
(
  service_id          NUMBER(10) not null,
  service_name        VARCHAR2(100) not null,
  change_source       VARCHAR2(2) not null,
  organ_personal_auth CHAR(1) default 'N' not null
)
;
create table T_SERVICE_TYPE
(
  service_type CHAR(1) not null,
  type_name    VARCHAR2(30) not null
)
;
create table T_CONTRACT_MASTER
(
  policy_id            NUMBER(10) not null,
  policy_code          VARCHAR2(20) not null,
  apply_code           VARCHAR2(20) not null,
  policy_type          CHAR(1) not null,
  group_single         CHAR(1) not null,
  real_insurant        CHAR(1) default 'Y' not null,
  head_id              VARCHAR2(40) not null,
  branch_id            VARCHAR2(40) not null,
  organ_id             VARCHAR2(40) not null,
  dept_id              VARCHAR2(20) not null,
  balance_prem         NUMBER(12,2) default 0 not null,
  period_prem          NUMBER(12,2) not null,
  discount_prem        NUMBER(12,2) not null,
  company_prem         NUMBER(12,2),
  employee_prem        NUMBER(12,2) not null,
  normal_prem          NUMBER(12,2) not null,
  normal_stand         NUMBER(12,2) not null,
  weak_prem            NUMBER(12,2) default 0 not null,
  weak_stand           NUMBER(12,2) default 0 not null,
  job_prem             NUMBER(12,2) default 0 not null,
  job_stand            NUMBER(12,2) default 0 not null,
  disable_prem         NUMBER(12,2) default 0 not null,
  disable_stand        NUMBER(12,2) default 0 not null,
  over_manage          CHAR(1) not null,
  pay_mode             NUMBER(2) not null,
  pay_next             NUMBER(2) not null,
  pay_way              VARCHAR2(2),
  deliver_type         CHAR(1),
  service_type         CHAR(1),
  overdue_manage       CHAR(1) default '1' not null,
  bank_code            VARCHAR2(20),
  bank_account         VARCHAR2(40),
  money_id             NUMBER(6) not null,
  applicant_id         NUMBER(10),
  company_id           NUMBER(10),
  address_fee          VARCHAR2(200),
  zip_link             VARCHAR2(10),
  link_tel             VARCHAR2(50),
  linkman              VARCHAR2(120),
  linkman_title        VARCHAR2(50),
  linkman_dept         VARCHAR2(40),
  link_celler          VARCHAR2(30),
  email                VARCHAR2(50),
  fax                  VARCHAR2(30),
  link_notes           VARCHAR2(1000),
  apply_date           DATE not null,
  validate_date        DATE not null,
  accept_date          DATE not null,
  end_date             DATE not null,
  pause_date           DATE,
  liability_state      NUMBER(2) default 1 not null,
  suspend              CHAR(1) default 'N' not null,
  suspend_cause        NUMBER(2),
  pause_cause          NUMBER(2),
  end_cause            NUMBER(2),
  prem_status          NUMBER(2) default 1 not null,
  claim_deal           NUMBER(4),
  service_deal         NUMBER(4),
  policy_year          NUMBER(2) not null,
  policy_period        NUMBER(4) not null,
  agent_id             NUMBER(10) not null,
  sign_id              NUMBER(10),
  agency_code          VARCHAR2(20),
  branch_bank          VARCHAR2(20),
  agency_hand          NUMBER(10),
  update_time          DATE default SYSDATE not null,
  updater_id           NUMBER(10),
  insert_time          DATE default SYSDATE not null,
  assumpsit            VARCHAR2(4000),
  agreement_type       NUMBER(2),
  agreement_motive     VARCHAR2(200),
  agreement            VARCHAR2(4000),
  pay_times            NUMBER(4),
  sys_lock_time        DATE,
  sys_locker_id        NUMBER(10),
  sys_lock_status      CHAR(1) default '0' not null,
  claim_emp            NUMBER(10),
  service_emp          NUMBER(10),
  reissue_num          NUMBER(2) default 0 not null,
  nb_agency_code       VARCHAR2(20),
  policy_print         NUMBER(2) default 0 not null,
  unit_print           NUMBER(2) default 0 not null,
  receipt_print        NUMBER(2) default 0 not null,
  appro_emp_id         NUMBER(10),
  balance_capital      NUMBER(14,4) default 0 not null,
  em_ill               NUMBER(4),
  em_life              NUMBER(4),
  relation_id          NUMBER(2),
  job_class_1          NUMBER(2),
  job_cate_id          NUMBER(10),
  job_2                VARCHAR2(40),
  job_1                VARCHAR2(200),
  applicant_age        NUMBER(3),
  loan_status          CHAR(1) default '0' not null,
  derivation           CHAR(1) default '1' not null,
  former_id            NUMBER(10),
  next_period_prem     NUMBER(12,2) default 0 not null,
  next_discount_prem   NUMBER(12,2) default 0 not null,
  next_company_prem    NUMBER(12,2) default 0 not null,
  next_employee_prem   NUMBER(12,2) default 0 not null,
  next_normal_prem     NUMBER(12,2) default 0 not null,
  next_weak_prem       NUMBER(12,2) default 0 not null,
  next_job_prem        NUMBER(12,2) default 0 not null,
  next_disable_prem    NUMBER(12,2) default 0 not null,
  print_time           DATE,
  sell_way             VARCHAR2(2) default '0' not null,
  tax_prem             NUMBER(12,2) default 0 not null,
  answer_type          VARCHAR2(1) default '0' not null,
  is_answered          VARCHAR2(1) default 'N' not null,
  auto_decision        NUMBER(2) default 0 not null,
  service_id           NUMBER(10) not null,
  service_date         DATE not null,
  policy_prem          NUMBER(12,2) default 0 not null,
  policy_stand         NUMBER(12,2) default 0 not null,
  next_policy_prem     NUMBER(12,2) default 0 not null,
  next_tax_prem        NUMBER(12,2) default 0 not null,
  address_fee_2        VARCHAR2(100),
  address_fee_3        VARCHAR2(100),
  address_fee_4        VARCHAR2(100),
  indivi_enquiry       CHAR(1) default 'N' not null,
  tax_prem_stand       NUMBER(12,2) default 0 not null,
  matu_pay_mode        NUMBER(2),
  matu_process         VARCHAR2(1),
  matu_status          VARCHAR2(1),
  suspend_chg_id       NUMBER(10),
  prem_change_time     DATE default SYSDATE not null,
  received_date        DATE,
  emp_attach_type      CHAR(1),
  initial_vali_date    DATE,
  next_weak_stand      NUMBER(12,2) default 0 not null,
  next_job_stand       NUMBER(12,2) default 0 not null,
  next_disable_stand   NUMBER(12,2) default 0 not null,
  auto_end             DATE,
  assignee_type        VARCHAR2(2) default 0 not null,
  agriculture_net      CHAR(1),
  prorate              CHAR(1) default 'Y' not null,
  campaign_code        VARCHAR2(10),
  ss_validate_date     DATE,
  acknow_code          VARCHAR2(20),
  is_commission        CHAR(1) default 'Y' not null,
  whole_period         CHAR(1) default 'Y' not null,
  discount_tax         NUMBER(12,2) default 0 not null,
  next_discount_tax    NUMBER(12,2) default 0 not null,
  auto_surrender       CHAR(1) default 'N' not null,
  sur_notice_date      DATE,
  send_out_date        DATE,
  send_out_id          NUMBER(10),
  commission_rate      NUMBER(4,3) default 0 not null,
  answer_assumpsit     VARCHAR2(1000),
  is_igp               CHAR(1),
  igp_type             CHAR(1),
  issue_way            NUMBER(10) default 1,
  scheme_id            NUMBER(10),
  agent_discount_rate  NUMBER(4,3) default 1 not null,
  invoice_amount       NUMBER(12,2),
  answer_tel           VARCHAR2(40),
  holiday_indi         CHAR(1) default 'N',
  holiday_start_date   DATE,
  holiday_end_date     DATE,
  holiday_pol_year     NUMBER(3),
  hi_validate_date     DATE,
  hi_plan_id           NUMBER(10),
  hi_end_date          DATE,
  sin_emp_ins_amount   NUMBER(10),
  dou_emp_ins_amount   NUMBER(10),
  annuity_print        NUMBER(2) default 0 not null,
  annuity_print_time   DATE,
  list_print           NUMBER(2) default 0 not null,
  list_print_time      DATE,
  pld                  DATE default to_date('9999-09-09','yyyy-mm-dd'),
  holder_emp_num       NUMBER(10),
  force_cancel_emp     NUMBER(10),
  force_cancel_time    DATE,
  force_cancel_remarks VARCHAR2(100),
  force_cancel_mark    VARCHAR2(40),
  air_code             VARCHAR2(20),
  grp_busi_type        CHAR(1),
  answered_time        DATE,
  is_relocate          CHAR(1),
  is_upload            CHAR(1),
  is_switch_policy     CHAR(1),
  unite_system_check   CHAR(1),
  is_optimal_policy    VARCHAR2(1),
  nb_agency_sales_id   NUMBER(10)
)


create table T_SERVICE_APPLY_TYPE
(
  apply_type CHAR(1) not null,
  type_name  VARCHAR2(20) not null
)
;
create table T_SERVICE_TYPE_EXT
(
  service_type_ext_id VARCHAR2(4) not null,
  service_type        CHAR(1) not null,
  type_name           VARCHAR2(50) not null
)
;
create table T_WITHDRAW_REASON
(
  reason_id   CHAR(1) not null,
  reason_desc VARCHAR2(100) not null
)
;
create table T_CLAIM_BATCH
(
  batch_id                 NUMBER(10) not null,
  batch_no                 VARCHAR2(20),
  batch_status             NUMBER(2) not null,
  organ_id                 VARCHAR2(40) not null,
  dept_id                  VARCHAR2(20) not null,
  super_organ              VARCHAR2(40),
  apply_name               VARCHAR2(150),
  apply_type               CHAR(1),
  apply_tel                VARCHAR2(40),
  apply_time               DATE,
  claim_sum                NUMBER(14,2),
  accept_time              DATE,
  accepter_id              NUMBER(10),
  all_ready                CHAR(1),
  register_conclusion      CHAR(1),
  noregister_cause         VARCHAR2(2),
  register_time            DATE,
  register_id              NUMBER(10),
  audit_time               DATE,
  auditor_id               NUMBER(10),
  notice_content           VARCHAR2(4000),
  subscribe                CHAR(1),
  subscribe_explain        VARCHAR2(1000),
  subscribe_time           DATE,
  subscriber_id            NUMBER(10),
  finish_time              DATE,
  notice_print             NUMBER(2) default 0,
  insert_time              DATE default SYSDATE not null,
  update_time              DATE,
  updater_id               NUMBER(10),
  policy_id                NUMBER(10) not null,
  parent_id                NUMBER(10),
  previous_status          NUMBER(2),
  top_veto                 CHAR(1) default 'N' not null,
  veto_desc                VARCHAR2(4000),
  surgery_code_1           VARCHAR2(10),
  surgery_code_2           VARCHAR2(10),
  surgery_code_3           VARCHAR2(10),
  surgery_diagnosis_type_1 VARCHAR2(4),
  surgery_diagnosis_type_2 VARCHAR2(4),
  medical_diagnosis_type_1 VARCHAR2(4),
  medical_diagnosis_type_3 VARCHAR2(4),
  accident_id_1            VARCHAR2(20),
  accident_id_2            VARCHAR2(20),
  accident_type            VARCHAR2(2),
  accident_id              VARCHAR2(20),
  surgery_diagnosis_type_3 VARCHAR2(4),
  medical_diagnosis_type_2 VARCHAR2(4),
  accident_id_3            VARCHAR2(20),
  case_source              NUMBER(5) default 0
)
;

create table T_CLAIM_CASE
(
  case_id                  NUMBER(10) not null,
  case_status              NUMBER(2) default 0 not null,
  organ_id                 VARCHAR2(40) not null,
  dept_id                  VARCHAR2(20) not null,
  relation_id              NUMBER(2),
  reporter_name            VARCHAR2(120),
  report_time              DATE,
  report_type              CHAR(1),
  link_name                VARCHAR2(100),
  link_tel                 VARCHAR2(40),
  link_addr                VARCHAR2(100),
  link_zip                 VARCHAR2(10),
  case_notes               VARCHAR2(1000),
  recorder_id              NUMBER(10),
  insured_id               NUMBER(10),
  accident_status          VARCHAR2(2),
  accident_place           VARCHAR2(600),
  accident_time            DATE not null,
  accident_id              VARCHAR2(20),
  hospital                 VARCHAR2(400),
  death_date               DATE,
  accident_desc            VARCHAR2(1000),
  apply_name               VARCHAR2(150),
  apply_type               CHAR(1),
  apply_certi_type         NUMBER(2),
  apply_certi_code         VARCHAR2(50),
  apply_time               DATE,
  all_ready                CHAR(1),
  accept_time              DATE,
  accepter_id              NUMBER(10),
  register_conclusion      CHAR(1),
  noregister_cause         VARCHAR2(2),
  register_time            DATE,
  register_id              NUMBER(10),
  audit_time               DATE,
  auditor_id               NUMBER(10),
  notice_content           VARCHAR2(4000),
  subscribe                CHAR(1),
  subscribe_explain        VARCHAR2(1500),
  subscribe_time           DATE,
  subscriber_id            NUMBER(10),
  finish_time              DATE,
  insert_time              DATE default SYSDATE not null,
  update_time              DATE,
  updater_id               NUMBER(10),
  apply_address            VARCHAR2(150),
  apply_zip                VARCHAR2(10),
  apply_tel                VARCHAR2(40),
  hospital_code            VARCHAR2(20),
  start_date               DATE,
  end_date                 DATE,
  cure_fee                 NUMBER(10,2),
  case_level               VARCHAR2(1),
  accident_type            VARCHAR2(1),
  diagnose_date            DATE,
  operation_date           DATE,
  case_no                  VARCHAR2(20),
  reported                 CHAR(1) not null,
  claim_type               VARCHAR2(1),
  claim_sum                NUMBER(14,2),
  super_organ              VARCHAR2(40),
  notice_print             NUMBER(2) default 0,
  batch_id                 NUMBER(10),
  agent_id                 NUMBER(10),
  disable_rate             NUMBER(4,3),
  disable_date             DATE,
  previous_status          NUMBER(2),
  top_veto                 CHAR(1) default 'N' not null,
  veto_desc                VARCHAR2(4000),
  case_type                CHAR(1) default '0' not null,
  surgery_type             NUMBER(2) default 0 not null,
  old_claimtype            VARCHAR2(2),
  risk_type                VARCHAR2(2) default '0' not null,
  link_addr_2              VARCHAR2(100),
  link_addr_3              VARCHAR2(100),
  link_addr_4              VARCHAR2(100),
  apply_address_2          VARCHAR2(100),
  apply_address_3          VARCHAR2(100),
  apply_address_4          VARCHAR2(100),
  diagnosis_count          NUMBER(3),
  days_in_hospital         NUMBER(5,1),
  hospital_network         CHAR(1) default 'N' not null,
  upload_id                NUMBER(10),
  upload_seq               NUMBER(10),
  cancel_cause             VARCHAR2(2),
  cancel_desc              VARCHAR2(4000),
  one_off_inform           CHAR(1),
  apply_mobile             VARCHAR2(30),
  audit_form_print         NUMBER(2) default 0,
  record_print             NUMBER(2) default 0,
  accident_area_id         VARCHAR2(10),
  surgery_code             VARCHAR2(10),
  surgery_diagnosis_type   VARCHAR2(4),
  medical_diagnosis_type   VARCHAR2(4),
  medical_receipt_count    NUMBER(10),
  medical_print            NUMBER(2),
  surgery_code_1           VARCHAR2(10),
  surgery_code_2           VARCHAR2(10),
  surgery_diagnosis_type_1 VARCHAR2(4),
  surgery_diagnosis_type_2 VARCHAR2(4),
  medical_diagnosis_type_1 VARCHAR2(4),
  medical_diagnosis_type_2 VARCHAR2(4),
  accident_id_1            VARCHAR2(20),
  accident_id_2            VARCHAR2(20),
  case_source              NUMBER(5) default 0,
  disease_diagnosis        VARCHAR2(1000),
  disease_diagnosis_type   VARCHAR2(20),
  delivery_date            DATE,
  ecif_id                  NUMBER(20),
  version                  NUMBER(19) default 0 not null,
  free_fill                CHAR(1)
)
;
create table T_GROUP_POLICY
(
  policy_id            NUMBER(10) not null,
  policy_code          VARCHAR2(20),
  send_code            VARCHAR2(20) not null,
  head_id              VARCHAR2(40),
  branch_id            VARCHAR2(40),
  organ_id             VARCHAR2(40),
  parent_id            NUMBER(10),
  hold_date            DATE,
  period_prem          NUMBER(12,2) default 0 not null,
  holder_id            NUMBER(10),
  pay_mode             NUMBER(2),
  bank_account         VARCHAR2(40),
  p_state_id           NUMBER(3) not null,
  validate_date        DATE,
  accept_date          DATE,
  send_date            DATE,
  normal_prem          NUMBER(12,2) default 0 not null,
  weak_prem            NUMBER(12,2) default 0 not null,
  job_prem             NUMBER(12,2) default 0 not null,
  policy_year          NUMBER(2) default 1 not null,
  policy_period        NUMBER(4) default 1 not null,
  end_time             DATE,
  insert_time          DATE default SYSDATE not null,
  first_id             NUMBER(10),
  recorder_id          NUMBER(10),
  inspect_time         DATE,
  inspector_id         NUMBER(10),
  auto_end             DATE,
  man_start            DATE,
  wait_reply           DATE,
  reply_end            DATE,
  process_end          DATE,
  checking_id          NUMBER(10),
  check_id             NUMBER(10),
  checkout_time        DATE,
  update_time          DATE,
  updater_id           NUMBER(10),
  assumpsit            VARCHAR2(4000),
  first_notion         VARCHAR2(1000),
  check_note           VARCHAR2(1000),
  inspect_prompt       VARCHAR2(1000),
  recorder_prompt      VARCHAR2(1000),
  text_attached        CHAR(1),
  pay_next             NUMBER(2),
  money_id             NUMBER(6) default 1 not null,
  linkman              VARCHAR2(120),
  linkman_title        VARCHAR2(50),
  linkman_dept         VARCHAR2(40),
  link_tel             VARCHAR2(30),
  email                VARCHAR2(50),
  fax                  VARCHAR2(30),
  link_notes           VARCHAR2(1000),
  coverage_period      CHAR(1),
  charge_period        CHAR(1),
  bene_type            CHAR(1),
  pay_type             CHAR(1),
  pay_time             CHAR(1),
  bonus_choice         NUMBER(2),
  plan_notes           VARCHAR2(1000),
  insured_amount       NUMBER(10),
  grade_standard       CHAR(1),
  insured_rate         NUMBER(4,3),
  product_notes        VARCHAR2(1000),
  agent_id             NUMBER(10),
  agreement_type       NUMBER(2),
  agreement_motive     VARCHAR2(200),
  agreement            VARCHAR2(4000),
  pay_times            NUMBER(4),
  product_standard     CHAR(1),
  insurant_list_upload NUMBER(4),
  real_insurant        CHAR(1) default 'Y' not null,
  discount_prem        NUMBER(12,2) default 0 not null,
  receipt_code         VARCHAR2(200),
  formal_receipt       VARCHAR2(200),
  pay_period           CHAR(1),
  pay_year             NUMBER(3),
  end_period           CHAR(1),
  end_year             NUMBER(3),
  pay_ensure           NUMBER(3),
  coverage_year        NUMBER(5),
  charge_year          NUMBER(3),
  except_value         NUMBER(10),
  benefit_level        VARCHAR2(20),
  conversion           CHAR(1) default 'N' not null,
  charge_type          CHAR(1),
  group_unit           CHAR(1),
  insured_category     CHAR(1),
  disable_prem         NUMBER(12,2) default 0 not null,
  balance_prem         NUMBER(12,2) default 0 not null,
  over_manage          CHAR(1) default '1' not null,
  overdue_manage       CHAR(1),
  pause_time           DATE,
  coverage_month       NUMBER(2),
  sys_lock_time        DATE,
  sys_locker_id        NUMBER(10),
  sys_lock_status      CHAR(1) default '0' not null,
  group_single         CHAR(1) default '1' not null,
  basic_gender         CHAR(1) default 'N' not null,
  pay_year_f           NUMBER(3),
  pay_year_m           NUMBER(3),
  coverage_year_f      NUMBER(3),
  coverage_year_m      NUMBER(3),
  coverage_day         NUMBER(3),
  charge_year_f        NUMBER(3),
  charge_year_m        NUMBER(3),
  one_long             CHAR(1),
  unit_recorded        CHAR(1),
  text_checked         CHAR(1),
  group_checked        CHAR(1),
  unit_made            CHAR(1),
  problem              CHAR(1),
  link_celler          VARCHAR2(30),
  survive_bene         CHAR(1),
  dept_id              VARCHAR2(20),
  text_type            CHAR(1),
  normal_stand         NUMBER(12,2) default 0 not null,
  weak_stand           NUMBER(12,2) default 0 not null,
  job_stand            NUMBER(12,2) default 0 not null,
  disable_stand        NUMBER(12,2) default 0 not null,
  record_end           DATE,
  single_agent         NUMBER(10),
  bank_code            VARCHAR2(20),
  company_prem         NUMBER(12,2) default 0 not null,
  employee_prem        NUMBER(12,2) default 0 not null,
  ss_validate_date     DATE,
  retired_rate         NUMBER(4,3),
  nb_agency_code       VARCHAR2(20),
  appro_emp_id         NUMBER(10),
  first_end            DATE default sysdate not null,
  unit_same            CHAR(1),
  sell_way             VARCHAR2(2) default '0' not null,
  tax_prem             NUMBER(12,2) default 0 not null,
  answer_type          VARCHAR2(1) default '0' not null,
  auto_decision        NUMBER(2) default 0 not null,
  policy_prem          NUMBER(12,2) default 0 not null,
  policy_stand         NUMBER(12,2) default 0 not null,
  address_fee          VARCHAR2(200),
  address_fee_2        VARCHAR2(100),
  address_fee_3        VARCHAR2(100),
  address_fee_4        VARCHAR2(100),
  tax_prem_stand       NUMBER(12,2) default 0 not null,
  matu_pay_mode        NUMBER(2),
  matu_process         VARCHAR2(1),
  emp_attach_type      CHAR(1),
  agriculture_net      CHAR(1),
  prorate              CHAR(1) default 'Y' not null,
  campaign_code        VARCHAR2(10),
  derivation           CHAR(1) default 1 not null,
  former_id            NUMBER(10),
  initial_vali_date    DATE,
  zip_link             VARCHAR2(10),
  return_time          DATE,
  return_id            NUMBER(10),
  discount_tax         NUMBER(12,2) default 0 not null,
  pending_cause        VARCHAR2(2),
  commission_rate      NUMBER(4,3) default 0 not null,
  is_igp               CHAR(1),
  igp_type             CHAR(1),
  scan_time            DATE default sysdate,
  is_grade             CHAR(1) default 'N' not null,
  uw_notes             VARCHAR2(4000),
  branch_bank          VARCHAR2(20),
  agency_code          VARCHAR2(20),
  agency_hand          NUMBER(10),
  agent_discount_rate  NUMBER(4,3) default 1 not null,
  hi_validate_date     DATE,
  hi_plan_id           NUMBER(10),
  hi_end_date          DATE,
  sin_emp_ins_amount   NUMBER(10),
  dou_emp_ins_amount   NUMBER(10),
  holder_emp_num       NUMBER(10),
  policy_note          VARCHAR2(1000),
  accept_prompt        VARCHAR2(1000),
  grp_busi_type        CHAR(1),
  second_develop       CHAR(1),
  employee_fee_deduct  CHAR(1) default 'N' not null,
  is_upload            CHAR(1),
  is_relation_business CHAR(1),
  notes_head           VARCHAR2(2000),
  grouping_choice      CHAR(1) default '0' not null,
  nb_agency_sales_id   NUMBER(10)
)
;
create table T_BATCH_OPT
(
  opt_id       NUMBER(8) not null,
  schedule_id  NUMBER(8) not null,
  due_opt_date DATE not null,
  opt_date     DATE default SYSDATE not null,
  operator_id  NUMBER(10) not null,
  status       CHAR(1) not null,
  end_date     DATE
)
;
create table T_CHANGE_STATUS
(
  change_status VARCHAR2(2) not null,
  status_desc   VARCHAR2(40) not null
)
;
create table T_CHANGE_CAUSE
(
  cause_id   VARCHAR2(10) not null,
  cause_desc VARCHAR2(100) not null
)
;
create table T_CS_BIZ_STATUS_AF
(
  status_id   CHAR(1),
  status_name VARCHAR2(30) not null
)
;
create table T_POLICY_CHANGE
(
  change_id              NUMBER(10) not null,
  policy_id              NUMBER(10),
  service_id             NUMBER(10) not null,
  change_record          VARCHAR2(4000),
  handler_id             NUMBER(10),
  insert_time            DATE default SYSDATE not null,
  propose_time           DATE,
  rollback_days          NUMBER(10),
  print_time             DATE,
  validate_time          DATE,
  change_status          VARCHAR2(2) default -1 not null,
  need_underwrite        CHAR(1) default 'N',
  notice_code            VARCHAR2(20),
  print_status           CHAR(1) default '0',
  group_policy_id        NUMBER(10),
  withdraw_id            NUMBER(10),
  apply_name             VARCHAR2(200),
  apply_type             CHAR(1),
  certi_type             NUMBER(2),
  certi_code             VARCHAR2(50),
  apply_time             DATE,
  change_cause           VARCHAR2(10),
  withdraw_time          DATE,
  delayed                CHAR(1) default 'N' not null,
  settle_id              NUMBER(10),
  settled                CHAR(1) default 'N' not null,
  settle_time            DATE,
  service_type           CHAR(1),
  apply_note             VARCHAR2(4000),
  record_time            DATE,
  accept_note            VARCHAR2(1000),
  ratifier_id            NUMBER(10),
  ratification_time      DATE,
  print_num              NUMBER(2) default 0 not null,
  cancel_id              NUMBER(10),
  cancel_time            DATE,
  ratif_notes            VARCHAR2(4000),
  apply_code             VARCHAR2(20),
  finish_time            DATE,
  opt_id                 NUMBER(8),
  case_id                NUMBER(10),
  ri_process             VARCHAR2(1) default '0' not null,
  rejecter_id            NUMBER(10),
  reject_time            DATE,
  reject_note            VARCHAR2(4000),
  update_time            DATE default SYSDATE not null,
  reversal_id            NUMBER(10),
  appr_level             VARCHAR2(6),
  super_organ            VARCHAR2(40),
  batch_id               NUMBER(10),
  organ_id               VARCHAR2(40),
  cancel_note            VARCHAR2(4000),
  ithdraw_note           VARCHAR2(4000),
  cs_biz_status_af       CHAR(1) default (0) not null,
  internal_change_record VARCHAR2(4000),
  withdraw_reason        CHAR(1),
  auto_ratification      CHAR(1),
  service_type_ext       VARCHAR2(4),
  resident_type          NUMBER(2)
)


create table T_PROMOTE_SCHEME_STATUS
(
  scheme_status VARCHAR2(2) not null,
  status_name   VARCHAR2(30) not null
)
;
create table T_PROMOTE_SCHEME
(
  scheme_id      NUMBER(10) not null,
  scheme_name    VARCHAR2(200) not null,
  policy_type    CHAR(1) not null,
  start_date     DATE default SYSDATE not null,
  end_date       DATE default SYSDATE not null,
  organ_id       VARCHAR2(40) not null,
  agency_code    VARCHAR2(20),
  scheme_desc    VARCHAR2(1000),
  cover_down     CHAR(1) default 'N' not null,
  scheme_status  VARCHAR2(2) not null,
  insert_time    DATE default SYSDATE not null,
  update_time    DATE default SYSDATE not null,
  recorder_id    NUMBER(10),
  record_date    DATE,
  approver_id    NUMBER(10),
  approve_date   DATE,
  terminator_id  NUMBER(10),
  terminate_date DATE,
  approve_note   VARCHAR2(1000),
  cover_organ_id VARCHAR2(40) not null
)
;
create table T_SELL_WAY
(
  sell_way        VARCHAR2(2) not null,
  way_name        VARCHAR2(30) not null,
  g_business_cate NUMBER(2)
)
;
create table T_CASE_STATUS
(
  status_id   NUMBER(2) not null,
  status_name VARCHAR2(40)
)
;
create table T_CLAIM_APPLY_TYPE
(
  apply_type CHAR(1) not null,
  type_name  VARCHAR2(40) not null
)
;
create table T_ACCIDENT_TYPE
(
  accident_type VARCHAR2(1) not null,
  type_name     VARCHAR2(20) not null
)
;
create table T_ACCIDENT
(
  accident_id   VARCHAR2(20) not null,
  accident_name VARCHAR2(250),
  accident_type VARCHAR2(1),
  medical_type  NUMBER(1) default 2 not null,
  status        NUMBER(1) default 0 not null
)
;
create table T_DIAGNOSIS_TYPE
(
  type_id     VARCHAR2(4) not null,
  category_id NUMBER(1) not null,
  type_des    VARCHAR2(50) not null
)
;
create table T_NOREGISTER_CAUSE
(
  cause_type VARCHAR2(2) not null,
  cause_desc VARCHAR2(100) not null
)
;
create table T_SURGERY_CODE
(
  surgery_code VARCHAR2(10) not null,
  surgery_name VARCHAR2(100) not null
)
;
create table T_CANCEL_CAUSE
(
  cause_type VARCHAR2(2) not null,
  cause_desc VARCHAR2(100) not null
)
;
create table T_CASE_LEVEL
(
  case_level VARCHAR2(1) not null,
  level_name VARCHAR2(20) not null,
  min_amount NUMBER(10),
  max_amount NUMBER(12)
)
;
create table T_CASE_TYPE
(
  case_type CHAR(1) not null,
  type_name VARCHAR2(20) not null
)
;
create table T_RISK_TYPE
(
  risk_id   VARCHAR2(2) not null,
  risk_name VARCHAR2(100) not null
)
;
create table T_CLAIM_TYPE
(
  claim_type VARCHAR2(1) not null,
  type_name  VARCHAR2(20) not null
)
;
create table T_HI_CLAIM_UPLOAD
(
  upload_id       NUMBER(10) not null,
  upload_date     DATE default sysdate not null,
  upload_count    NUMBER(2) default 1 not null,
  claim_case      VARCHAR2(200),
  claim_product   VARCHAR2(200),
  claim_liability VARCHAR2(200),
  asyn_task_id    NUMBER(10) not null
)
;
create table T_HOSPITAL_OWNER
(
  owner_type NUMBER(2) not null,
  owner_name VARCHAR2(50) not null
)
;
create table T_HOSPITAL_TIME
(
  time_type NUMBER(2) not null,
  time_name VARCHAR2(50) not null
)
;
create table T_HOSPITAL
(
  hospital_code    VARCHAR2(20) not null,
  hospital_name    VARCHAR2(400) not null,
  address          VARCHAR2(200),
  telephone        VARCHAR2(30),
  zip              VARCHAR2(6),
  claim_bank       VARCHAR2(20),
  claim_account    VARCHAR2(40),
  hospital_speci   VARCHAR2(1),
  hospital_type    VARCHAR2(2),
  district_name    VARCHAR2(200),
  contactor        VARCHAR2(40),
  address_2        VARCHAR2(100),
  address_3        VARCHAR2(100),
  address_4        VARCHAR2(100),
  pay_mode         NUMBER(2) default 1 not null,
  fax              VARCHAR2(30),
  hospital_owner   NUMBER(2) default 1 not null,
  hospital_time    NUMBER(2) default 1 not null,
  organ_id         VARCHAR2(40),
  hospital_network CHAR(1) default 'N' not null,
  update_date      DATE default sysdate,
  subjection       VARCHAR2(8),
  hospital_status  CHAR(1) default 'Y' not null
)
;
create table T_OLD_CLAIMTYPE
(
  claim_type VARCHAR2(2) not null,
  type_name  VARCHAR2(30) not null
)
;
create table T_REPORT_TYPE
(
  report_type CHAR(1) not null,
  type_name   VARCHAR2(40) not null
)
;
create table T_SURGERY_TYPE
(
  surgery_type NUMBER(2) not null,
  surgery_name VARCHAR2(50) not null
)
;
create table T_PAY_TYPE
(
  pay_type CHAR(1) not null,
  pay_name VARCHAR2(20) not null,
  pay_rate NUMBER(8,6) default 0 not null
)
;
create table T_CHARGE_PERIOD
(
  charge_period CHAR(1) not null,
  charge_desc   VARCHAR2(50) not null
)
;
create table T_BENEFIT_LEVEL
(
  benefit_level VARCHAR2(20) not null,
  level_desc    VARCHAR2(100) not null
)
;
create table T_BONUS_MODE
(
  mode_id   NUMBER(2) not null,
  mode_name VARCHAR2(40) not null
)
;
create table T_BENE_TYPE
(
  bene_type CHAR(1) not null,
  type_name VARCHAR2(30) not null
)
;
create table T_END_PERIOD
(
  end_period CHAR(1) not null,
  type_name  VARCHAR2(30) not null
)
;
create table T_GROUPING_CHOICE
(
  grouping_choice CHAR(1) not null,
  grouping_name   VARCHAR2(100)
)
;
create table T_GROUP_POLICY_STATE
(
  p_state_id NUMBER(3) not null,
  state      VARCHAR2(100) not null
)
;
create table T_PENDING_CODE
(
  pending_id VARCHAR2(2) not null,
  pend_cause VARCHAR2(30) not null
)
;
create table T_PAY_TIME
(
  pay_time  CHAR(1) not null,
  type_name VARCHAR2(30) not null
)
;
create table T_START_PERIOD
(
  start_period CHAR(1) not null,
  type_name    VARCHAR2(30) not null
)
;
create table T_OPT_TYPE
(
  opt_type CHAR(1) not null,
  opt_name VARCHAR2(50) not null
)
;
create table T_BATCH_SCHEDULE
(
  schedule_id  NUMBER(8) not null,
  module_name  VARCHAR2(50) not null,
  process_name VARCHAR2(60) not null,
  package_name VARCHAR2(80) not null,
  opt_type     CHAR(1) not null,
  opt_month    VARCHAR2(2),
  opt_day      VARCHAR2(2),
  opt_time     VARCHAR2(5),
  due_opt_date DATE not null,
  opt_date     DATE,
  opt_order    NUMBER(8,2) not null,
  priority     NUMBER(1)
)
;
create table T_INSURED_FIRST
(
  policy_id            NUMBER(10) not null,
  insured_id           NUMBER(10) not null,
  insured_num          NUMBER(10) not null,
  unit_id              NUMBER(10),
  benefit_level        VARCHAR2(20),
  benefit_start        DATE,
  reissue_num          NUMBER(2),
  unit_print           NUMBER(2),
  assumpsit            VARCHAR2(4000),
  unit_balance_prem    NUMBER(12,2) default 0 not null,
  pay_bank_code        VARCHAR2(20),
  pay_account          VARCHAR2(40),
  master_num           NUMBER(10),
  relation_m           NUMBER(2),
  insert_time          DATE default SYSDATE not null,
  update_time          DATE default SYSDATE not null,
  emp_no               VARCHAR2(40),
  company_id           NUMBER(10),
  dou_emp_insured_indi CHAR(1),
  hi_plan_id           NUMBER(10),
  notes                VARCHAR2(2000),
  dummy_num            VARCHAR2(4),
  apply_certificate    CHAR(1),
  address_type         CHAR(1),
  dimission_draw_way   CHAR(1)
)
;
create table T_INSURED_RIDE_TYPE
(
  ride_type NUMBER(2) not null,
  type_name VARCHAR2(100) not null
)
;
create table T_INS_TYPE
(
  ins_type  CHAR(1) not null,
  type_name VARCHAR2(50) not null
)
;
create table T_LIVE_RANGE
(
  live_range VARCHAR2(1) not null,
  range_desc VARCHAR2(30) not null
)
;
create table T_MOVE_RANGE
(
  move_range VARCHAR2(1) not null,
  range_desc VARCHAR2(30) not null
)
;
create table T_PAY_STATUS
(
  start_pay   CHAR(1) not null,
  status_name VARCHAR2(100) not null
)
;
create table T_RI_RISK_TYPE
(
  risk_type VARCHAR2(2) not null,
  type_name VARCHAR2(30) not null
)
;
create table T_SECTION_CAL_TYPE
(
  cal_type  VARCHAR2(1) not null,
  type_name VARCHAR2(30) not null
)
;
create table T_SIMPLE_COMPOUND
(
  simple_compound CHAR(1) not null,
  type_name       VARCHAR2(30) not null
)
;
create table T_SURR_PERMIT
(
  surr_permit CHAR(1) not null,
  surr_name   VARCHAR2(100)
)
;
create table T_TARGET_TYPE
(
  target_type CHAR(1) not null,
  type_name   VARCHAR2(20) not null
)
;
create table T_UNDERWRITE_CLASS
(
  underwrite_class VARCHAR2(1) not null,
  type_name        VARCHAR2(30) not null
)
;
create table T_UNDERWRITE_JOB
(
  underwrite_job VARCHAR2(1) not null,
  type_name      VARCHAR2(30) not null
)
;
create table T_UNIT_FLAG
(
  unit_flag CHAR(1) not null,
  type_name VARCHAR2(30) not null
)
;
create table T_VALUE_CAL_TYPE
(
  value_cal_type VARCHAR2(1) not null,
  type_name      VARCHAR2(30) not null
)
;
create table T_CHARGE_MODE
(
  charge_type CHAR(1) not null,
  charge_name VARCHAR2(20) not null,
  node_status CHAR(1) default '0'
)
;
create table T_BENEFIT_TYPE
(
  benefit_type VARCHAR2(2) not null,
  type_name    VARCHAR2(20) not null
)
;
create table T_AGE_BASE
(
  age_base  VARCHAR2(1) not null,
  type_name VARCHAR2(30) not null
)
;
create table T_AGE_TYPE
(
  age_prem  CHAR(1) not null,
  type_name VARCHAR2(60) not null
)
;
create table T_ALLY_TYPE
(
  ally_type CHAR(1) not null,
  type_name VARCHAR2(60) not null
)
;
create table T_BONUS_ALLOT
(
  bonus_allot VARCHAR2(1) not null,
  type_name   VARCHAR2(30) not null
)
;
create table T_BONUS_CALC_METHOD
(
  method_type VARCHAR2(1),
  method_name VARCHAR2(100) not null
)
;
create table T_BONUS_CAL_TYPE
(
  bonus_cal_type VARCHAR2(2) not null,
  type_desc      VARCHAR2(200) not null
)
;
create table T_BUSI_TYPE
(
  busi_type CHAR(1) not null,
  type_name VARCHAR2(20) not null
)
;
create table T_EXEMPT_OBJECT
(
  exempt_object CHAR(1) not null,
  type_name     VARCHAR2(50) not null
)
;
create table T_EXEMPT_TYPE
(
  exempt_type NUMBER(1) not null,
  type_name   VARCHAR2(50) not null
)
;
create table T_FEE_BASE
(
  base_type VARCHAR2(1) not null,
  type_name VARCHAR2(60) not null
)
;
create table T_FORMULA_TYPE
(
  formula_type VARCHAR2(2) not null,
  type_name    VARCHAR2(40) not null
)
;
create table T_FORMULA
(
  formula_name VARCHAR2(200) not null,
  formula_type VARCHAR2(2) not null,
  formula_body VARCHAR2(1000) not null,
  formula_desc VARCHAR2(4000),
  top_level    CHAR(1) default 'N' not null,
  use_fms      CHAR(1) default 'N',
  plsql_fms    VARCHAR2(21)
)
;
create table T_GL_DEBT_TYPE
(
  debt_type CHAR(1) not null,
  type_name VARCHAR2(250) not null
)
;
create table T_GL_PRODUCT_TYPE
(
  type_id   NUMBER(4) not null,
  type_code VARCHAR2(40) not null,
  type_name VARCHAR2(100) not null,
  cate_id   NUMBER(4)
)
;
create table T_HOSPITAL_TYPE
(
  hospital_type VARCHAR2(2) not null,
  type_desc     VARCHAR2(40) not null
)
;
create table T_GURNT_INT_METHOD
(
  method_type VARCHAR2(1),
  method_name VARCHAR2(100) not null
)
;
create table T_INT_SETTLE_METHOD
(
  method_type VARCHAR2(1),
  method_name VARCHAR2(100) not null
)
;
create table T_PAY_COUNT_TYPE
(
  pay_count_type CHAR(1) not null,
  type_name      VARCHAR2(30) not null
)
;
create table T_PERIOD_BASE
(
  base_type VARCHAR2(1) not null,
  type_name VARCHAR2(100) not null
)
;
create table T_PERIOD_CAL_TYPE
(
  cal_type  VARCHAR2(1) not null,
  type_name VARCHAR2(30) not null
)
;
create table T_PERIOD_UNIT
(
  type_code VARCHAR2(1) not null,
  type_name VARCHAR2(30) not null
)
;
create table T_PREMIUM_DEFINE
(
  define_type VARCHAR2(1) not null,
  type_desc   VARCHAR2(30) not null
)
;
create table T_PREM_TABLE
(
  prem_table CHAR(1) not null,
  type_name  VARCHAR2(50) not null
)
;
create table T_PRODUCT_LIFE
(
  organ_id                VARCHAR2(40) not null,
  product_id              NUMBER(7) not null,
  product_name            VARCHAR2(200) not null,
  product_abbr            VARCHAR2(200) not null,
  internal_id             VARCHAR2(10),
  area_limit              VARCHAR2(200) default '0' not null,
  area_forbid             VARCHAR2(200),
  hospital_type           VARCHAR2(2),
  unit_flag               CHAR(1) default '0' not null,
  ins_type                CHAR(1) default '0' not null,
  ally                    CHAR(1) default '0' not null,
  value                   CHAR(1) default 'N' not null,
  exception               VARCHAR2(4000),
  exempt_type             NUMBER(1) default 0 not null,
  fix_inc                 CHAR(1),
  draw_type               CHAR(1),
  start_date              DATE,
  end_date                DATE,
  publish                 CHAR(1) default 'N' not null,
  age_prem                CHAR(1) default '0' not null,
  have_option             CHAR(1) default 'N' not null,
  master_id               NUMBER(7),
  need                    CHAR(1) default 'N' not null,
  rate                    NUMBER(4,2) default 1 not null,
  opion_limit             NUMBER(10) default 9999999999 not null,
  option_min_year         NUMBER(10) default 0 not null,
  life_rate               NUMBER(4,2) default 0 not null,
  sudden_rate             NUMBER(4,2) default 0 not null,
  ill_rate                NUMBER(4,2) default 0 not null,
  em                      NUMBER(4) default 9999 not null,
  check_amount            NUMBER(10) default 9999999999 not null,
  max_amount              NUMBER(12) default 9999999999 not null,
  max_related             NUMBER(10) default 9999999999 not null,
  min_year_prem           NUMBER(10) default 0 not null,
  min_once_prem           NUMBER(10) default 0 not null,
  once_mr                 CHAR(1) default 'N' not null,
  renew                   CHAR(1) default 'N' not null,
  women_insured           CHAR(1) default 'Y' not null,
  pregnant_insured        CHAR(1) default 'Y' not null,
  disabler_insured        CHAR(1) default 'Y' not null,
  nojob_insured           CHAR(1) default 'Y' not null,
  student_insured         CHAR(1) default 'Y' not null,
  pay_expire_age          NUMBER(3) default 999 not null,
  pay_expire_renew        NUMBER(3) default 999 not null,
  max_issue_age           NUMBER(3) default 999 not null,
  max_issue_renew         NUMBER(3) default 999 not null,
  min_issue_age           NUMBER(3) default 0 not null,
  max_related_age         NUMBER(3) default 999 not null,
  max_related_renew       NUMBER(3) default 999 not null,
  min_related_age         NUMBER(3) default 0 not null,
  min_related_unit        CHAR(1) default '1' not null,
  job_diff                CHAR(1) default 'N' not null,
  gender_diff             CHAR(1) default 'N' not null,
  except_diff             CHAR(1) default 'N' not null,
  housekeeper_diff        CHAR(1) default 'N' not null,
  level_diff              CHAR(1) default 'N' not null,
  sub_product             CHAR(1) default 'N' not null,
  smoking_diff            CHAR(1) default 'N' not null,
  underwrite_class        VARCHAR2(1),
  attachable              CHAR(1) default 'N' not null,
  insure_month            CHAR(1) default 'N' not null,
  coverage_charge         CHAR(1) default 'N' not null,
  attach_exempt           CHAR(1) default 'N' not null,
  duty                    VARCHAR2(4000),
  exempt_object           CHAR(1),
  benefit_type            VARCHAR2(2) not null,
  busi_type               CHAR(1) not null,
  target_type             CHAR(1) not null,
  period_type             CHAR(1) not null,
  underwrite_job          VARCHAR2(1),
  surr_permit             CHAR(1) default '0' not null,
  add_permit              CHAR(1) default 'N' not null,
  add_calc                CHAR(1),
  apl_permit              CHAR(1) default 'N' not null,
  apl_calc                CHAR(1),
  loan_permit             CHAR(1) default 'N' not null,
  actuary_rate            NUMBER(4,4),
  basic_pay_period        CHAR(1) default 'N' not null,
  basic_pay_ensure        CHAR(1) default 'N' not null,
  basic_pay_type          CHAR(1) default 'N' not null,
  basic_increase_year     CHAR(1) default 'N' not null,
  amount_diff             CHAR(1) default 'N' not null,
  category_diff           CHAR(1) default 'N' not null,
  comm_pol_year           CHAR(1) default 'N' not null,
  comm_prem_year          CHAR(1) default 'N' not null,
  comm_period             CHAR(1) default 'N' not null,
  comm_age                CHAR(1) default '0' not null,
  et_pol_year             CHAR(1) default 'N' not null,
  et_gender               CHAR(1) default 'N' not null,
  et_smoking              CHAR(1) default 'N' not null,
  value_age               CHAR(1) default '0' not null,
  value_gender            CHAR(1) default 'N' not null,
  value_ben_status        CHAR(1) default 'N' not null,
  value_pol_year          CHAR(1) default 'N' not null,
  value_smoking           CHAR(1) default 'N' not null,
  em_gender               CHAR(1) default 'N' not null,
  em_age                  CHAR(1) default '0' not null,
  em_smoking              CHAR(1) default 'N' not null,
  draw_age                CHAR(1) default '0' not null,
  draw_gender             CHAR(1) default 'N' not null,
  draw_pol_year           CHAR(1) default 'N' not null,
  draw_smoking            CHAR(1) default 'N' not null,
  draw_charge_type        CHAR(1) default 'N' not null,
  pay_rate_diff           CHAR(1) default 'N' not null,
  basic_pay_period_end    CHAR(1) default 'N' not null,
  retired_diff            CHAR(1) default 'N' not null,
  table_prem              CHAR(1) default 'Y' not null,
  ss_claim_formula        VARCHAR2(100),
  sur_charge_type         CHAR(1) default 'N' not null,
  sur_paidup_status       CHAR(1) default 'N' not null,
  sur_pay_type            CHAR(1) default 'N' not null,
  reduce_paidup           CHAR(1) default 'N' not null,
  min_initial_prem        NUMBER(10) default 0 not null,
  min_amount              NUMBER(10) default 0 not null,
  min_add_prem            NUMBER(10) default 0 not null,
  min_sur_amount          NUMBER(10) default 0 not null,
  min_sur_prem            NUMBER(10) default 0 not null,
  min_add_amount          NUMBER(10) default 0 not null,
  min_units               NUMBER(10) default 0 not null,
  max_units               NUMBER(10) default 9999999999 not null,
  max_related_units       NUMBER(10) default 9999999999 not null,
  min_add_units           NUMBER(10) default 0 not null,
  min_sur_units           NUMBER(10) default 0 not null,
  min_remain_prem         NUMBER(10) default 0 not null,
  min_claim_amount        NUMBER(10) default 0 not null,
  capital_lag_days        NUMBER(4) default 0 not null,
  mortagage               CHAR(1) default 'N' not null,
  dividend_age            CHAR(1) default 'N' not null,
  dividend_holder         CHAR(1) default 'N' not null,
  dividend_related        CHAR(1) default 'N' not null,
  dividend_gender         CHAR(1) default 'N' not null,
  dividend_ben_status     CHAR(1) default 'N' not null,
  dividend_pol_year       CHAR(1) default 'N' not null,
  dividend_smoking        CHAR(1) default 'N' not null,
  min_cove_period         NUMBER(4) default 0 not null,
  cover_expire_age        NUMBER(3) default 999 not null,
  initial_id              VARCHAR2(20) not null,
  object_type             CHAR(1) not null,
  section_cal_type        VARCHAR2(1) default '1' not null,
  period_cal_type         VARCHAR2(1) default '1' not null,
  age_base                VARCHAR2(1) default '1' not null,
  issue_fee_base          VARCHAR2(1) default '0' not null,
  issue_fee_source        VARCHAR2(1) default '0' not null,
  charge_fee_base         VARCHAR2(1),
  charge_fee_source       VARCHAR2(1),
  mort_fee_base           VARCHAR2(1),
  mort_fee_source         VARCHAR2(1),
  tax_rate                NUMBER(5,4) default 0 not null,
  basic_charge_period     CHAR(1) default 'N' not null,
  basic_coverage_period   CHAR(1) default 'N' not null,
  premium_year_diff       CHAR(1) default 'N' not null,
  period_diff             CHAR(1) default 'N' not null,
  pay_period_diff         CHAR(1) default 'N' not null,
  pay_end_diff            CHAR(1) default 'N' not null,
  pay_ensure_diff         CHAR(1) default 'N' not null,
  pay_type_diff           CHAR(1) default 'N' not null,
  increase_diff           CHAR(1) default 'N' not null,
  age_month_diff          CHAR(1) default 'N' not null,
  age_month_r_diff        CHAR(1) default 'N' not null,
  gender_r_diff           CHAR(1) default 'N' not null,
  retired_rate_diff       CHAR(1) default 'N' not null,
  amount_section          CHAR(1) default 'N' not null,
  units_section           CHAR(1) default 'N' not null,
  draw_premium_year       CHAR(1) default 'N' not null,
  draw_period             CHAR(1) default 'N' not null,
  draw_pay_period         CHAR(1) default 'N' not null,
  draw_pay_end            CHAR(1) default 'N' not null,
  draw_pay_ensure         CHAR(1) default 'N' not null,
  draw_pay_type           CHAR(1) default 'N' not null,
  draw_increase           CHAR(1) default 'N' not null,
  draw_pay_rate           CHAR(1) default 'N' not null,
  draw_except             CHAR(1) default 'N' not null,
  draw_house              CHAR(1) default 'N' not null,
  draw_retired            CHAR(1) default 'N' not null,
  draw_job_cate           CHAR(1) default 'N' not null,
  draw_category           CHAR(1) default 'N' not null,
  draw_age_month          CHAR(1) default 'N' not null,
  draw_age_month_r        CHAR(1) default 'N' not null,
  draw_gender_r           CHAR(1) default 'N' not null,
  draw_level              CHAR(1) default 'N' not null,
  draw_amount             CHAR(1) default 'N' not null,
  draw_retired_rate       CHAR(1) default 'N' not null,
  premium_section         CHAR(1) default 'N' not null,
  comm_organ              CHAR(1) default 'N' not null,
  comm_branch_bank        CHAR(1) default 'N' not null,
  comm_derivation         CHAR(1) default 'N' not null,
  comm_fee_type           CHAR(1) default 'N' not null,
  issue_fee_times         CHAR(1) default 'N' not null,
  issue_pol_year          CHAR(1) default 'N' not null,
  charge_prem_type        CHAR(1) default 'N' not null,
  charge_pol_year         CHAR(1) default 'N' not null,
  et_premium_year         CHAR(1) default 'N' not null,
  et_period               CHAR(1) default 'N' not null,
  et_pay_period           CHAR(1) default 'N' not null,
  et_pay_end              CHAR(1) default 'N' not null,
  et_pay_ensure           CHAR(1) default 'N' not null,
  et_pay_type             CHAR(1) default 'N' not null,
  et_increase             CHAR(1) default 'N' not null,
  et_pay_rate             CHAR(1) default 'N' not null,
  et_except               CHAR(1) default 'N' not null,
  et_house                CHAR(1) default 'N' not null,
  et_retired              CHAR(1) default 'N' not null,
  et_job_cate             CHAR(1) default 'N' not null,
  et_category             CHAR(1) default 'N' not null,
  et_age                  CHAR(1) default '0' not null,
  et_age_month            CHAR(1) default 'N' not null,
  et_age_month_r          CHAR(1) default 'N' not null,
  et_gender_r             CHAR(1) default 'N' not null,
  et_level                CHAR(1) default 'N' not null,
  mort_premium_year       CHAR(1) default 'N' not null,
  mort_period             CHAR(1) default 'N' not null,
  mort_job_cate           CHAR(1) default 'N' not null,
  mort_gender             CHAR(1) default 'N' not null,
  mort_smoking            CHAR(1) default 'N' not null,
  mort_age                CHAR(1) default '0' not null,
  mort_age_month          CHAR(1) default 'N' not null,
  mort_level              CHAR(1) default 'N' not null,
  mort_pol_year           CHAR(1) default 'N' not null,
  mort_prem_type          CHAR(1) default 'N' not null,
  value_premium_year      CHAR(1) default 'N' not null,
  value_period            CHAR(1) default 'N' not null,
  value_pay_period        CHAR(1) default 'N' not null,
  value_pay_end           CHAR(1) default 'N' not null,
  value_pay_ensure        CHAR(1) default 'N' not null,
  value_pay_type          CHAR(1) default 'N' not null,
  value_increase          CHAR(1) default 'N' not null,
  value_pay_rate          CHAR(1) default 'N' not null,
  value_except            CHAR(1) default 'N' not null,
  value_house             CHAR(1) default 'N' not null,
  value_retired           CHAR(1) default 'N' not null,
  value_job_cate          CHAR(1) default 'N' not null,
  value_category          CHAR(1) default 'N' not null,
  value_age_month         CHAR(1) default 'N' not null,
  value_age_month_r       CHAR(1) default 'N' not null,
  value_gender_r          CHAR(1) default 'N' not null,
  value_level             CHAR(1) default 'N' not null,
  em_premium_year         CHAR(1) default 'N' not null,
  em_period               CHAR(1) default 'N' not null,
  em_pol_year             CHAR(1) default 'N' not null,
  em_min_em               CHAR(1) default 'N' not null,
  em_max_em               CHAR(1) default 'N' not null,
  em_unit_amount          NUMBER(10) default 0 not null,
  em_period_cal_type      VARCHAR2(1) default '1' not null,
  em_age_base             VARCHAR2(1) default '1' not null,
  value_unit_amount       NUMBER(10) default 0 not null,
  value_cal_type          VARCHAR2(1) default '0' not null,
  value_charge_type       CHAR(1) default 'N' not null,
  bonus_allot             VARCHAR2(1) default '0' not null,
  bonus_cal_type          VARCHAR2(2),
  premium_define          VARCHAR2(1) default '0' not null,
  mort_unit_amount        NUMBER(10) default 0 not null,
  charge_unit_amount      NUMBER(10) default 0 not null,
  charge_premium_year     CHAR(1) default 'N' not null,
  charge_period           CHAR(1) default 'N' not null,
  comm_type_id            CHAR(1) default 'N' not null,
  comm_calc_type          CHAR(1) default 'N' not null,
  max_cpf                 NUMBER(10) default 9999999999 not null,
  money_id                NUMBER(6),
  pay_amount              NUMBER(10) default 0 not null,
  pay_count_type          CHAR(1),
  life_table_gender       CHAR(1) default 'N' not null,
  life_table_smoking      CHAR(1) default 'N' not null,
  life_table_annuity      CHAR(1) default 'N' not null,
  regu_to_single          CHAR(1) default 'N' not null,
  sa_formula              VARCHAR2(100),
  sa_accum                CHAR(1) default 'Y' not null,
  stand_charge_type       CHAR(1) default 'N' not null,
  stand_period            CHAR(1) default 'N' not null,
  stand_premium_year      CHAR(1) default 'N' not null,
  stand_year              CHAR(1) default 'N' not null,
  stand_calc_type         CHAR(1) default 'N' not null,
  issue_prem_type         CHAR(1) default 'N' not null,
  permit_cpf              CHAR(1) default 'N' not null,
  universal_prem          CHAR(1) default 'N' not null,
  live_range_diff         CHAR(1) default 'N' not null,
  move_range_diff         CHAR(1) default 'N' not null,
  sur_begin_pay           CHAR(1) default 'N' not null,
  guarantee_renew         CHAR(1) default 'N' not null,
  benefit_level           CHAR(1) default 'N' not null,
  claim_cnt               CHAR(1) default 'N' not null,
  once_per_pay_limit      CHAR(1) default 'N' not null,
  year_per_pay_limit      CHAR(1) default 'N' not null,
  coverage_per_pay_limit  CHAR(1) default 'N' not null,
  life_pay_limit          CHAR(1) default 'N' not null,
  day_per_pay_limit       CHAR(1) default 'N' not null,
  month_per_pay_limit     CHAR(1) default 'N' not null,
  checked                 CHAR(1) default 'N' not null,
  insert_person           NUMBER(10) not null,
  insert_date             DATE default SYSDATE not null,
  updater_id              NUMBER(10) not null,
  update_time             DATE default SYSDATE not null,
  sys_lock_time           DATE,
  sys_locker_id           NUMBER(10),
  sys_lock_status         CHAR(1) default '0' not null,
  once_pay_rate           CHAR(1) default 'N' not null,
  coverage_except         CHAR(1) default 'N' not null,
  pseudo                  CHAR(1) default 'N' not null,
  permit_prs              CHAR(1) default 'N' not null,
  prs_unit_amount         NUMBER(10) default 0 not null,
  prs_formula             VARCHAR2(100),
  policyholder            VARCHAR2(4000),
  ri_risk_type            VARCHAR2(2) default '0' not null,
  res_factor              VARCHAR2(100),
  prem_table              CHAR(1) default '1' not null,
  related_type_prem2      CHAR(1) default 'N' not null,
  related_prem2           CHAR(1) default 'N' not null,
  fee_year_prem2          CHAR(1) default 'N' not null,
  age_prem2               CHAR(1) default 'N' not null,
  gender_prem2            CHAR(1) default 'N' not null,
  comm_amount             CHAR(1) default 'N' not null,
  bonus_age_1             CHAR(1) default 'N',
  bonus_gender_1          CHAR(1) default 'N',
  bonus_age_2             CHAR(1) default 'N',
  bonus_smoking           CHAR(1) default 'N',
  bonus_waived            CHAR(1) default 'N',
  bonus_policy_year       CHAR(1) default 'N',
  bonus_premium_year      CHAR(1) default 'N',
  bonus_period            CHAR(1) default 'N',
  bonus_pay_period        CHAR(1) default 'N',
  bonus_pay_type          CHAR(1) default 'N',
  uw_manual               CHAR(1) default 'Y' not null,
  exempted_age_prem2      CHAR(1) default 'N' not null,
  product_type            NUMBER(4) default 99 not null,
  base_unit               NUMBER(10) default 0 not null,
  norm_pay_count_type     CHAR(1),
  norm_pay_amount         NUMBER(10) default 0 not null,
  max_add_risk            NUMBER(12,2),
  risk_rate_1             NUMBER(7,6) default 1 not null,
  bsa_formula             VARCHAR2(100),
  deduct_period_base      VARCHAR2(1) default '1' not null,
  issu_fee_mode           CHAR(1) default '0' not null,
  charge_fee_mode         CHAR(1) default '0' not null,
  mort_fee_mode           CHAR(1) default '0' not null,
  issue_sa                CHAR(1) default 'N' not null,
  issue_account_att       CHAR(1) default 'N' not null,
  issue_issue_date        CHAR(1) default 'N' not null,
  charge_prem             CHAR(1) default 'N' not null,
  charge_accum_prem       CHAR(1) default 'N' not null,
  charge_account_att      CHAR(1) default 'N' not null,
  years_part_surr         NUMBER(2) default 0 not null,
  part_surr_times         NUMBER(10) default (9999999999) not null,
  free_part_surr          NUMBER(4) default 9999 not null,
  part_surr_percent       NUMBER(7,6) default 1 not null,
  free_part_surr_rate     NUMBER(7,6) default 0 not null,
  indiv_part_surr         CHAR(1) default 'N' not null,
  indiv_add               CHAR(1) default 'N' not null,
  years_add               NUMBER(2) default 0 not null,
  add_times               NUMBER(2) default (99) not null,
  decrease                CHAR(1) default 'N' not null,
  decrease_times          NUMBER(2) default 0 not null,
  indiv_surr              CHAR(1) default 'N' not null,
  prem_bonus              CHAR(1) default 'N' not null,
  prem_bonus_con_years    NUMBER(2) default 99 not null,
  prem_bonus_years        NUMBER(2) default 99 not null,
  prem_bonus_rate         NUMBER(7,6) default 0 not null,
  max_loan_rate           NUMBER(4,3) default (1) not null,
  gurnt_int_meth          VARCHAR2(1) default '0' not null,
  bonus_calc_mothod       VARCHAR2(2) default '0' not null,
  gurnt_settle_meth       VARCHAR2(1) default '0' not null,
  bonus_settle_method     VARCHAR2(2) default '0' not null,
  int_settle_method       VARCHAR2(2) default '0' not null,
  child_account_def       CHAR(1) default 'N' not null,
  surplus_rate            NUMBER(7,6) default 1 not null,
  insurer_bonus_rate      NUMBER(7,6) default 0 not null,
  loan_special_rate       CHAR(1) default 'N' not null,
  simple_compound         CHAR(1) default '2' not null,
  int_period_type         VARCHAR2(1) default '1' not null,
  charge_section_cal_type VARCHAR2(1) default '1' not null,
  grp_pay_by_com_rate     NUMBER(4,2) default (99) not null,
  pay_by_com_acc_rate     NUMBER(4,2) default (99) not null,
  all_part_surr_times     NUMBER(10) default (9999999999) not null,
  min_alloc_capital       NUMBER(14,4) default (0) not null,
  min_alloc_bonus         NUMBER(14,4) default (0) not null,
  bonus_min_sur_prem      NUMBER(10) default (0) not null,
  charge_prem_role        CHAR(1) default ('N') not null,
  pre_int_rate            NUMBER(5,4) default 0 not null,
  mortality_def           VARCHAR2(1000),
  yield_rate_low          NUMBER(5,4) default 0 not null,
  yield_rate_medium       NUMBER(5,4) default 0 not null,
  yield_rate_high         NUMBER(5,4) default 0 not null,
  value_pol_month         CHAR(1) default 'N',
  em_level                CHAR(1) default 'N' not null,
  issue_formula           VARCHAR2(200),
  issue_formula_rate      NUMBER(7,6),
  decrease_times_coverage NUMBER(2) default 0 not null,
  decrease_max_rate       NUMBER(4,3) default 1 not null,
  min_loan_amount         NUMBER(10) default 0 not null,
  capital_insure          CHAR(1) default 'N' not null,
  period_prem2            CHAR(1) default 'N' not null,
  premium_year_prem2      CHAR(1) default 'N' not null,
  em_pay_period           CHAR(1) default 'N' not null,
  frozen_permit           CHAR(1) default 'N' not null,
  once_pay_limit_diff     CHAR(1) default 'N' not null,
  service_times_diff      CHAR(1) default 'N' not null,
  risk_amount_param       NUMBER(10,2),
  charge_organ            CHAR(1) default 'N' not null,
  prem_calc_base_diff     CHAR(1) default 'N' not null,
  issue_first_month       CHAR(1) default 'N' not null,
  charge_age              CHAR(1) default 'N' not null,
  vehicle_type            CHAR(1) default 'N',
  insured_ride_type       CHAR(1) default 'N',
  annuityable             CHAR(1) default 'N',
  self_validate           CHAR(1) default 'N',
  profession              CHAR(1) default 'N' not null,
  pay_level               CHAR(1) default 'N' not null,
  value_accum_period      CHAR(1) default 'N',
  social_ins_diff         CHAR(1) default 'N' not null,
  period_day_diff         CHAR(1) default 'N',
  travel_type_diff        CHAR(1) default 'N',
  elimi_period_diff       CHAR(1) default 'N',
  social_security_diff    CHAR(1) default 'N',
  social_security_diff_1  CHAR(1) default 'N',
  debt_type               CHAR(1) default '0',
  athlete_official_diff   CHAR(1) default 'N',
  number_adjust_rate_diff CHAR(1) default 'N',
  renew_type              VARCHAR2(1),
  minor_death_pay_rate    NUMBER(5,2),
  circ_date               DATE,
  circ_code               VARCHAR2(200),
  minor_death             CHAR(1) default 'N' not null,
  mian_rider_prem         CHAR(1),
  unit_policy_merge       CHAR(1) default 'N',
  em_pay_year             CHAR(1) default 'N',
  gender                  CHAR(1) default 'N' not null
)
;


create table T_PROD_PKG
(
  pkg_id           NUMBER(7) not null,
  pkg_code         VARCHAR2(20) not null,
  pkg_name         VARCHAR2(100) not null,
  min_unit         NUMBER(8,4) default 0 not null,
  max_unit         NUMBER(8,4) default 9999.9999 not null,
  max_ph_age       NUMBER(3) default 999 not null,
  min_ph_age       NUMBER(3) default 0 not null,
  max_la_age       NUMBER(3) default 999 not null,
  min_la_age       NUMBER(3) default 0 not null,
  pkg_desc         VARCHAR2(500),
  spec_agreement   VARCHAR2(500),
  sys_lock_time    DATE,
  sys_locker_id    NUMBER(10),
  sys_lock_status  CHAR(1) default '0' not null,
  max_job_class    NUMBER(2),
  uw_manual        CHAR(1) not null,
  individual_group CHAR(1) default (1) not null,
  presented_indi   VARCHAR2(20),
  applicant_mode   NUMBER(2)
)
;
create table T_REINS_RISK_CODE
(
  risk_code       VARCHAR2(2) not null,
  code_name       VARCHAR2(30) not null,
  low_mort_rate   NUMBER(4,2) not null,
  upper_mort_rate NUMBER(4,2) not null
)
;
create table T_RENEW_DECISION
(
  renew_decision VARCHAR2(1) not null,
  decision_desc  VARCHAR2(30) not null
)
;
create table T_TRANCHE
(
  tranche_code VARCHAR2(2) not null,
  tranche_name VARCHAR2(30) not null
)
;
create table T_VEHICLE_TYPE
(
  vehicle_type NUMBER(2) not null,
  type_name    VARCHAR2(100) not null
)
;
create table T_ADD_ARITH
(
  add_arith  CHAR(1) not null,
  arith_desc VARCHAR2(60) not null
)
;
create table T_ASSIGN_WAY
(
  assign_way VARCHAR2(1) not null,
  way_name   VARCHAR2(30) not null
)
;
create table T_CONTRACT_PRODUCT
(
  item_id                  NUMBER(10) not null,
  master_id                NUMBER(10),
  policy_id                NUMBER(10) not null,
  product_num              VARCHAR2(10) not null,
  product_id               NUMBER(10) not null,
  ins_type                 CHAR(1) not null,
  amount                   NUMBER(14,2),
  unit                     NUMBER(12,2),
  period_prem              NUMBER(12,2) not null,
  discount_prem            NUMBER(12,2) not null,
  company_prem             NUMBER(12,2),
  employee_prem            NUMBER(12,2),
  normal_prem              NUMBER(12,2) not null,
  normal_stand             NUMBER(12,2) not null,
  weak_prem                NUMBER(12,2) default 0 not null,
  weak_stand               NUMBER(12,2) default 0 not null,
  weak_year                NUMBER(2),
  weak_arith               CHAR(1) default '0' not null,
  weak_rate                NUMBER(4,3) default 0 not null,
  weak_kilo                NUMBER(8,2) default 0 not null,
  job_prem                 NUMBER(12,2) default 0 not null,
  job_stand                NUMBER(12,2) default 0 not null,
  job_year                 NUMBER(2),
  job_arith                CHAR(1) default '0' not null,
  job_rate                 NUMBER(4,3) default 0 not null,
  job_kilo                 NUMBER(8,2) default 0 not null,
  disable_prem             NUMBER(12,2) default 0 not null,
  disable_stand            NUMBER(12,2) default 0 not null,
  disable_year             NUMBER(2),
  disable_arith            CHAR(1) default '0' not null,
  disable_rate             NUMBER(4,3) default 0 not null,
  disable_kilo             NUMBER(8,2) default 0 not null,
  dividend_choice          NUMBER(2),
  apply_date               DATE not null,
  end_date                 DATE not null,
  validate_date            DATE not null,
  paidup_date              DATE not null,
  pause_date               DATE,
  liability_state          NUMBER(2) default 1 not null,
  end_cause                NUMBER(2),
  prem_status              NUMBER(2) default 1 not null,
  premium_year             NUMBER(3) not null,
  pay_to_date              DATE not null,
  policy_year              NUMBER(2) not null,
  policy_period            NUMBER(4) not null,
  initial_type             CHAR(1) not null,
  renewal_type             CHAR(1) not null,
  insured_1                NUMBER(10) not null,
  age_1                    NUMBER(3) not null,
  relation_1               NUMBER(2),
  relation_s               NUMBER(2) default 5 not null,
  job_1_1                  VARCHAR2(200),
  job_1_2                  VARCHAR2(40),
  job_class_1              NUMBER(2),
  job_cate_1               NUMBER(10),
  em_life_1                NUMBER(4) default 0 not null,
  em_health_1              NUMBER(4) default 0 not null,
  insured_2                NUMBER(10),
  age_2                    NUMBER(3),
  relation_2               NUMBER(2),
  job_2_1                  VARCHAR2(40),
  job_2_2                  VARCHAR2(40),
  job_class_2              NUMBER(2),
  job_cate_2               NUMBER(10),
  em_life_2                NUMBER(4) default 0 not null,
  em_health_2              NUMBER(4) default 0 not null,
  pay_period               CHAR(1),
  pay_year                 NUMBER(3),
  end_period               CHAR(1),
  end_year                 NUMBER(3),
  pay_ensure               NUMBER(3),
  pay_type                 CHAR(1),
  charge_period            CHAR(1) not null,
  charge_year              NUMBER(3),
  coverage_period          CHAR(1) not null,
  coverage_year            NUMBER(5),
  short_end_time           DATE,
  except_value             NUMBER(10),
  benefit_level            VARCHAR2(20),
  housekeeper              CHAR(1),
  smoking                  CHAR(1),
  pay_rate                 NUMBER(4,3),
  insured_category         CHAR(1),
  insured_amount           NUMBER(10),
  start_pay                CHAR(1) default 'N' not null,
  retired_rate             NUMBER(4,3),
  decision_id              NUMBER(2) default 1 not null,
  pause_cause              NUMBER(2),
  gender_1                 CHAR(1) not null,
  gender_2                 CHAR(1),
  loan_status              CHAR(1) default '0' not null,
  update_time              DATE default SYSDATE not null,
  suspend                  CHAR(1) default 'N' not null,
  suspend_cause            NUMBER(2),
  next_period_prem         NUMBER(12,2) default 0 not null,
  next_discount_prem       NUMBER(12,2) default 0 not null,
  next_company_prem        NUMBER(12,2) default 0 not null,
  next_employee_prem       NUMBER(12,2) default 0 not null,
  next_normal_prem         NUMBER(12,2) default 0 not null,
  next_weak_prem           NUMBER(12,2) default 0 not null,
  next_job_prem            NUMBER(12,2) default 0 not null,
  next_disable_prem        NUMBER(12,2) default 0 not null,
  age_month                NUMBER(2) default 99 not null,
  related_month            NUMBER(2) default 99 not null,
  increase_rate            NUMBER(5,4) default 0 not null,
  increase_freq            CHAR(1) default '0' not null,
  increase_year            NUMBER(2) default 0 not null,
  house_related            CHAR(1) default 'W' not null,
  smoking_related          CHAR(1) default 'W' not null,
  pay_mode                 NUMBER(2) not null,
  yrt_prem                 NUMBER(12,2) default 0 not null,
  expiry_cash_value        NUMBER(14,2) default 0 not null,
  tax_prem                 NUMBER(12,2) default 0 not null,
  retired                  CHAR(1) default 'W' not null,
  simple_compound          CHAR(1) default '0' not null,
  loan_rate                NUMBER(5,4),
  count_way                CHAR(1) not null,
  discount_rate            NUMBER(8,6) default 1.00 not null,
  policy_prem              NUMBER(12,2) default 0 not null,
  policy_stand             NUMBER(12,2) default 0 not null,
  bank_code                VARCHAR2(20),
  bank_account             VARCHAR2(40),
  next_policy_prem         NUMBER(12,2) default 0 not null,
  next_tax_prem            NUMBER(12,2) default 0 not null,
  tax_prem_stand           NUMBER(12,2) default 0 not null,
  assign_way               VARCHAR2(1),
  assign_amount            NUMBER(12,2),
  assign_rate              NUMBER(4,3),
  fund_due_date            DATE not null,
  start_pay_date           DATE,
  renew_decision           VARCHAR2(1) default '1' not null,
  insert_time              DATE default SYSDATE not null,
  pay_change_time          DATE default SYSDATE not null,
  bonus_sa                 NUMBER(14,2) default 0 not null,
  policy_prem_waived       CHAR(1) default 'N' not null,
  policy_prem_source       VARCHAR2(1) not null,
  next_weak_stand          NUMBER(12,2) default 0 not null,
  next_job_stand           NUMBER(12,2) default 0 not null,
  next_disable_stand       NUMBER(12,2) default 0 not null,
  live_range               VARCHAR2(1) default '0' not null,
  move_range               VARCHAR2(1) default '0' not null,
  yrt_stand                NUMBER(12,2) default 0 not null,
  next_yrt_prem            NUMBER(12,2) default 0 not null,
  pay_next                 NUMBER(2) not null,
  latest_bonus_sa          NUMBER(14,2) default 0 not null,
  present_balance          NUMBER(10,2) default 0 not null,
  start_inst_date          DATE,
  origin_sa                NUMBER(14,2) default 0 not null,
  origin_bonus_sa          NUMBER(14,2) default 0 not null,
  anni_balance             NUMBER(14,4) default 0 not null,
  fix_increment            CHAR(1),
  cpf_cost                 NUMBER(13,3) default 0 not null,
  cash_cost                NUMBER(13,3) default 0 not null,
  derivation               CHAR(1) default '1' not null,
  lat_ori_bonus_sa         NUMBER(14,2) default 0 not null,
  bonus_due_date           DATE,
  risk_code                VARCHAR2(2),
  exposure_rate            NUMBER(4,3) default 1 not null,
  reins_rate               NUMBER(16,6) default 0 not null,
  start_pause_cause        NUMBER(2),
  start_end_cause          NUMBER(2),
  start_liab_state         NUMBER(2) default 1 not null,
  start_prem_status        NUMBER(2) default 1 not null,
  discount_tax             NUMBER(16,6) default 0 not null,
  next_discount_tax        NUMBER(16,6) default 0 not null,
  suspend_chg_id           NUMBER(10),
  tranche_code             VARCHAR2(2),
  mortality_rate           NUMBER(8,3) default 0 not null,
  medical_flag             CHAR(1) default 'N' not null,
  waiver_id                NUMBER(10),
  next_amount              NUMBER(14,2),
  waiver_start             DATE,
  waiver_end               DATE,
  weak_start               DATE,
  weak_end                 DATE,
  job_start                DATE,
  job_end                  DATE,
  disable_start            DATE,
  disable_end              DATE,
  auto_permnt_lapse        CHAR(1) default 'N' not null,
  permnt_lapse_notice_date DATE,
  combo_type               VARCHAR2(10),
  combo_unit               NUMBER(12,2),
  donative_amount          NUMBER(14,2),
  pkg_id                   NUMBER(7),
  charge_fee_rate          NUMBER(7,6),
  product_assumpsit        VARCHAR2(4000),
  rate_table_prem          NUMBER(12,2),
  actual_discount_rate     NUMBER(14,4),
  sub_end_cause            NUMBER(2),
  insurance_category       CHAR(1),
  insured_ride_type        NUMBER(2),
  vehicle_type             NUMBER(2),
  vehicle_license_num      VARCHAR2(20),
  vehicle_fram_num         VARCHAR2(25),
  vehicle_engine_num       VARCHAR2(25),
  carrying_passenger_num   NUMBER(10),
  surrfee_plan             NUMBER(2),
  annuity_transfered       CHAR(1) default 'N',
  draw_annuity_rate        NUMBER(9,8) default 0,
  loan_amount              NUMBER(14,2)
)
;

create table R_SU_CONTRACT
(
  su_contract_id      NUMBER(10),
  su_data_id          NUMBER(10),
  policy_no           VARCHAR2(20),
  policy_id           NUMBER(10),
  item_id             NUMBER(10),
  product_id          NUMBER(7),
  internal_id         VARCHAR2(10),
  istp                VARCHAR2(2),
  organ_id            VARCHAR2(40),
  customer_name       VARCHAR2(100),
  customer_certi_type NUMBER(2),
  customer_certi_code VARCHAR2(50),
  insurant_num        NUMBER(6),
  isog                VARCHAR2(128),
  isat                NUMBER(12,2),
  isfe                NUMBER(12,2),
  ispt                VARCHAR2(2),
  ctes                VARCHAR2(64),
  code_type           NUMBER(2),
  code                VARCHAR2(40)
)
;
create table R_SU_CUSTOMER
(
  r_cust_id    NUMBER(10),
  su_data_id   NUMBER(10),
  customer_id  NUMBER(10),
  real_name    VARCHAR2(100),
  certi_type   NUMBER(2),
  certi_code   VARCHAR2(50),
  tel          VARCHAR2(40),
  address      VARCHAR2(150),
  contact_info VARCHAR2(150),
  cust_type    VARCHAR2(10),
  vocation     VARCHAR2(10),
  crmn         VARCHAR2(40),
  crit         NUMBER(2),
  crid         VARCHAR2(50)
)
;
create table R_SU_TRANS
(
  su_trans_id NUMBER(10),
  fee_id      NUMBER(10),
  trans_type  VARCHAR2(2),
  trans_time  DATE,
  real_name   VARCHAR2(40),
  certi_type  NUMBER(2),
  certi_code  VARCHAR2(50),
  policy_code VARCHAR2(20),
  crtp        VARCHAR2(3),
  amount      NUMBER(12,2),
  crdr        VARCHAR2(2),
  cstp        VARCHAR2(2),
  caoi        VARCHAR2(64),
  tcan        VARCHAR2(64),
  su_data_id  NUMBER(10)
)
;
create table SAGAENTRY
(
  sagaid         VARCHAR2(255) not null,
  revision       VARCHAR2(255),
  sagatype       VARCHAR2(255),
  serializedsaga BLOB
)
;
create table SNAPSHOTEVENTENTRY
(
  aggregateidentifier VARCHAR2(255) not null,
  sequencenumber      NUMBER(19) not null,
  type                VARCHAR2(255) not null,
  eventidentifier     VARCHAR2(255) not null,
  metadata            BLOB,
  payload             BLOB not null,
  payloadrevision     VARCHAR2(255),
  payloadtype         VARCHAR2(255) not null,
  timestamp           VARCHAR2(255) not null
)
;
create table STATS_TABLE
(
  statid  VARCHAR2(30),
  type    CHAR(1),
  version NUMBER,
  flags   NUMBER,
  c1      VARCHAR2(30),
  c2      VARCHAR2(30),
  c3      VARCHAR2(30),
  c4      VARCHAR2(30),
  c5      VARCHAR2(30),
  n1      NUMBER,
  n2      NUMBER,
  n3      NUMBER,
  n4      NUMBER,
  n5      NUMBER,
  n6      NUMBER,
  n7      NUMBER,
  n8      NUMBER,
  n9      NUMBER,
  n10     NUMBER,
  n11     NUMBER,
  n12     NUMBER,
  d1      DATE,
  r1      RAW(32),
  r2      RAW(32),
  ch1     VARCHAR2(1000),
  cl1     CLOB
)
;
create table STGTAB_SQLPROF_4B8N4FNBN2PPB
(
  version             NUMBER,
  signature           NUMBER,
  sql_handle          VARCHAR2(30),
  obj_name            VARCHAR2(30),
  obj_type            VARCHAR2(30),
  plan_id             NUMBER,
  sql_text            CLOB,
  creator             VARCHAR2(30),
  origin              VARCHAR2(30),
  description         VARCHAR2(500),
  db_version          VARCHAR2(64),
  created             TIMESTAMP(6),
  last_modified       TIMESTAMP(6),
  last_executed       TIMESTAMP(6),
  last_verified       TIMESTAMP(6),
  status              NUMBER,
  optimizer_cost      NUMBER,
  module              VARCHAR2(64),
  action              VARCHAR2(64),
  executions          NUMBER,
  elapsed_time        NUMBER,
  cpu_time            NUMBER,
  buffer_gets         NUMBER,
  disk_reads          NUMBER,
  direct_writes       NUMBER,
  rows_processed      NUMBER,
  fetches             NUMBER,
  end_of_fetch_count  NUMBER,
  category            VARCHAR2(30),
  sqlflags            NUMBER,
  task_id             NUMBER,
  task_exec_name      VARCHAR2(30),
  task_obj_id         NUMBER,
  task_fnd_id         NUMBER,
  task_rec_id         NUMBER,
  inuse_features      NUMBER,
  parse_cpu_time      NUMBER,
  priority            NUMBER,
  optimizer_env       RAW(2000),
  bind_data           RAW(2000),
  parsing_schema_name VARCHAR2(30),
  comp_data           CLOB
)
;
create table SYS_EXPORT_SCHEMA_01
(
  process_order          NUMBER,
  duplicate              NUMBER,
  dump_fileid            NUMBER,
  dump_position          NUMBER,
  dump_length            NUMBER,
  dump_allocation        NUMBER,
  completed_rows         NUMBER,
  error_count            NUMBER,
  elapsed_time           NUMBER,
  object_type_path       VARCHAR2(200),
  object_path_seqno      NUMBER,
  object_type            VARCHAR2(30),
  in_progress            CHAR(1),
  object_name            VARCHAR2(500),
  object_long_name       VARCHAR2(4000),
  object_schema          VARCHAR2(30),
  original_object_schema VARCHAR2(30),
  partition_name         VARCHAR2(30),
  subpartition_name      VARCHAR2(30),
  flags                  NUMBER,
  property               NUMBER,
  completion_time        DATE,
  object_tablespace      VARCHAR2(30),
  size_estimate          NUMBER,
  object_row             NUMBER,
  processing_state       CHAR(1),
  processing_status      CHAR(1),
  base_process_order     NUMBER,
  base_object_type       VARCHAR2(30),
  base_object_name       VARCHAR2(30),
  base_object_schema     VARCHAR2(30),
  ancestor_process_order NUMBER,
  domain_process_order   NUMBER,
  parallelization        NUMBER,
  unload_method          NUMBER,
  granules               NUMBER,
  scn                    NUMBER,
  grantor                VARCHAR2(30),
  xml_clob               CLOB,
  name                   VARCHAR2(30),
  value_t                VARCHAR2(4000),
  value_n                NUMBER,
  is_default             NUMBER,
  file_type              NUMBER,
  user_directory         VARCHAR2(4000),
  user_file_name         VARCHAR2(4000),
  file_name              VARCHAR2(4000),
  extend_size            NUMBER,
  file_max_size          NUMBER,
  process_name           VARCHAR2(30),
  last_update            DATE,
  work_item              VARCHAR2(30),
  object_number          NUMBER,
  completed_bytes        NUMBER,
  total_bytes            NUMBER,
  metadata_io            NUMBER,
  data_io                NUMBER,
  cumulative_time        NUMBER,
  packet_number          NUMBER,
  old_value              VARCHAR2(4000),
  seed                   NUMBER,
  last_file              NUMBER,
  user_name              VARCHAR2(30),
  operation              VARCHAR2(30),
  job_mode               VARCHAR2(30),
  control_queue          VARCHAR2(30),
  status_queue           VARCHAR2(30),
  remote_link            VARCHAR2(4000),
  version                NUMBER,
  db_version             VARCHAR2(30),
  timezone               VARCHAR2(64),
  state                  VARCHAR2(30),
  phase                  NUMBER,
  guid                   RAW(16),
  start_time             DATE,
  block_size             NUMBER,
  metadata_buffer_size   NUMBER,
  data_buffer_size       NUMBER,
  degree                 NUMBER,
  platform               VARCHAR2(101),
  abort_step             NUMBER,
  instance               VARCHAR2(60)
)
;
create table SYS_EXPORT_SCHEMA_02
(
  process_order          NUMBER,
  duplicate              NUMBER,
  dump_fileid            NUMBER,
  dump_position          NUMBER,
  dump_length            NUMBER,
  dump_allocation        NUMBER,
  completed_rows         NUMBER,
  error_count            NUMBER,
  elapsed_time           NUMBER,
  object_type_path       VARCHAR2(200),
  object_path_seqno      NUMBER,
  object_type            VARCHAR2(30),
  in_progress            CHAR(1),
  object_name            VARCHAR2(500),
  object_long_name       VARCHAR2(4000),
  object_schema          VARCHAR2(30),
  original_object_schema VARCHAR2(30),
  partition_name         VARCHAR2(30),
  subpartition_name      VARCHAR2(30),
  flags                  NUMBER,
  property               NUMBER,
  completion_time        DATE,
  object_tablespace      VARCHAR2(30),
  size_estimate          NUMBER,
  object_row             NUMBER,
  processing_state       CHAR(1),
  processing_status      CHAR(1),
  base_process_order     NUMBER,
  base_object_type       VARCHAR2(30),
  base_object_name       VARCHAR2(30),
  base_object_schema     VARCHAR2(30),
  ancestor_process_order NUMBER,
  domain_process_order   NUMBER,
  parallelization        NUMBER,
  unload_method          NUMBER,
  granules               NUMBER,
  scn                    NUMBER,
  grantor                VARCHAR2(30),
  xml_clob               CLOB,
  name                   VARCHAR2(30),
  value_t                VARCHAR2(4000),
  value_n                NUMBER,
  is_default             NUMBER,
  file_type              NUMBER,
  user_directory         VARCHAR2(4000),
  user_file_name         VARCHAR2(4000),
  file_name              VARCHAR2(4000),
  extend_size            NUMBER,
  file_max_size          NUMBER,
  process_name           VARCHAR2(30),
  last_update            DATE,
  work_item              VARCHAR2(30),
  object_number          NUMBER,
  completed_bytes        NUMBER,
  total_bytes            NUMBER,
  metadata_io            NUMBER,
  data_io                NUMBER,
  cumulative_time        NUMBER,
  packet_number          NUMBER,
  old_value              VARCHAR2(4000),
  seed                   NUMBER,
  last_file              NUMBER,
  user_name              VARCHAR2(30),
  operation              VARCHAR2(30),
  job_mode               VARCHAR2(30),
  control_queue          VARCHAR2(30),
  status_queue           VARCHAR2(30),
  remote_link            VARCHAR2(4000),
  version                NUMBER,
  db_version             VARCHAR2(30),
  timezone               VARCHAR2(64),
  state                  VARCHAR2(30),
  phase                  NUMBER,
  guid                   RAW(16),
  start_time             DATE,
  block_size             NUMBER,
  metadata_buffer_size   NUMBER,
  data_buffer_size       NUMBER,
  degree                 NUMBER,
  platform               VARCHAR2(101),
  abort_step             NUMBER,
  instance               VARCHAR2(60)
)
;
create table SYS_EXPORT_TABLE_01
(
  process_order          NUMBER,
  duplicate              NUMBER,
  dump_fileid            NUMBER,
  dump_position          NUMBER,
  dump_length            NUMBER,
  dump_orig_length       NUMBER,
  dump_allocation        NUMBER,
  completed_rows         NUMBER,
  error_count            NUMBER,
  elapsed_time           NUMBER,
  object_type_path       VARCHAR2(200),
  object_path_seqno      NUMBER,
  object_type            VARCHAR2(30),
  in_progress            CHAR(1),
  object_name            VARCHAR2(500),
  object_long_name       VARCHAR2(4000),
  object_schema          VARCHAR2(30),
  original_object_schema VARCHAR2(30),
  original_object_name   VARCHAR2(4000),
  partition_name         VARCHAR2(30),
  subpartition_name      VARCHAR2(30),
  dataobj_num            NUMBER,
  flags                  NUMBER,
  property               NUMBER,
  trigflag               NUMBER,
  creation_level         NUMBER,
  completion_time        DATE,
  object_tablespace      VARCHAR2(30),
  size_estimate          NUMBER,
  object_row             NUMBER,
  processing_state       CHAR(1),
  processing_status      CHAR(1),
  base_process_order     NUMBER,
  base_object_type       VARCHAR2(30),
  base_object_name       VARCHAR2(30),
  base_object_schema     VARCHAR2(30),
  ancestor_process_order NUMBER,
  domain_process_order   NUMBER,
  parallelization        NUMBER,
  unload_method          NUMBER,
  load_method            NUMBER,
  granules               NUMBER,
  scn                    NUMBER,
  grantor                VARCHAR2(30),
  xml_clob               CLOB,
  parent_process_order   NUMBER,
  name                   VARCHAR2(30),
  value_t                VARCHAR2(4000),
  value_n                NUMBER,
  is_default             NUMBER,
  file_type              NUMBER,
  user_directory         VARCHAR2(4000),
  user_file_name         VARCHAR2(4000),
  file_name              VARCHAR2(4000),
  extend_size            NUMBER,
  file_max_size          NUMBER,
  process_name           VARCHAR2(30),
  last_update            DATE,
  work_item              VARCHAR2(30),
  object_number          NUMBER,
  completed_bytes        NUMBER,
  total_bytes            NUMBER,
  metadata_io            NUMBER,
  data_io                NUMBER,
  cumulative_time        NUMBER,
  packet_number          NUMBER,
  instance_id            NUMBER,
  old_value              VARCHAR2(4000),
  seed                   NUMBER,
  last_file              NUMBER,
  user_name              VARCHAR2(30),
  operation              VARCHAR2(30),
  job_mode               VARCHAR2(30),
  queue_tabnum           NUMBER,
  control_queue          VARCHAR2(30),
  status_queue           VARCHAR2(30),
  remote_link            VARCHAR2(4000),
  version                NUMBER,
  job_version            VARCHAR2(30),
  db_version             VARCHAR2(30),
  timezone               VARCHAR2(64),
  state                  VARCHAR2(30),
  phase                  NUMBER,
  guid                   RAW(16),
  start_time             DATE,
  block_size             NUMBER,
  metadata_buffer_size   NUMBER,
  data_buffer_size       NUMBER,
  degree                 NUMBER,
  platform               VARCHAR2(101),
  abort_step             NUMBER,
  instance               VARCHAR2(60),
  cluster_ok             NUMBER,
  service_name           VARCHAR2(100),
  object_int_oid         VARCHAR2(32)
)
;
create table SYS_EXPORT_TABLE_02
(
  process_order          NUMBER,
  duplicate              NUMBER,
  dump_fileid            NUMBER,
  dump_position          NUMBER,
  dump_length            NUMBER,
  dump_orig_length       NUMBER,
  dump_allocation        NUMBER,
  completed_rows         NUMBER,
  error_count            NUMBER,
  elapsed_time           NUMBER,
  object_type_path       VARCHAR2(200),
  object_path_seqno      NUMBER,
  object_type            VARCHAR2(30),
  in_progress            CHAR(1),
  object_name            VARCHAR2(500),
  object_long_name       VARCHAR2(4000),
  object_schema          VARCHAR2(30),
  original_object_schema VARCHAR2(30),
  original_object_name   VARCHAR2(4000),
  partition_name         VARCHAR2(30),
  subpartition_name      VARCHAR2(30),
  dataobj_num            NUMBER,
  flags                  NUMBER,
  property               NUMBER,
  trigflag               NUMBER,
  creation_level         NUMBER,
  completion_time        DATE,
  object_tablespace      VARCHAR2(30),
  size_estimate          NUMBER,
  object_row             NUMBER,
  processing_state       CHAR(1),
  processing_status      CHAR(1),
  base_process_order     NUMBER,
  base_object_type       VARCHAR2(30),
  base_object_name       VARCHAR2(30),
  base_object_schema     VARCHAR2(30),
  ancestor_process_order NUMBER,
  domain_process_order   NUMBER,
  parallelization        NUMBER,
  unload_method          NUMBER,
  load_method            NUMBER,
  granules               NUMBER,
  scn                    NUMBER,
  grantor                VARCHAR2(30),
  xml_clob               CLOB,
  parent_process_order   NUMBER,
  name                   VARCHAR2(30),
  value_t                VARCHAR2(4000),
  value_n                NUMBER,
  is_default             NUMBER,
  file_type              NUMBER,
  user_directory         VARCHAR2(4000),
  user_file_name         VARCHAR2(4000),
  file_name              VARCHAR2(4000),
  extend_size            NUMBER,
  file_max_size          NUMBER,
  process_name           VARCHAR2(30),
  last_update            DATE,
  work_item              VARCHAR2(30),
  object_number          NUMBER,
  completed_bytes        NUMBER,
  total_bytes            NUMBER,
  metadata_io            NUMBER,
  data_io                NUMBER,
  cumulative_time        NUMBER,
  packet_number          NUMBER,
  instance_id            NUMBER,
  old_value              VARCHAR2(4000),
  seed                   NUMBER,
  last_file              NUMBER,
  user_name              VARCHAR2(30),
  operation              VARCHAR2(30),
  job_mode               VARCHAR2(30),
  queue_tabnum           NUMBER,
  control_queue          VARCHAR2(30),
  status_queue           VARCHAR2(30),
  remote_link            VARCHAR2(4000),
  version                NUMBER,
  job_version            VARCHAR2(30),
  db_version             VARCHAR2(30),
  timezone               VARCHAR2(64),
  state                  VARCHAR2(30),
  phase                  NUMBER,
  guid                   RAW(16),
  start_time             DATE,
  block_size             NUMBER,
  metadata_buffer_size   NUMBER,
  data_buffer_size       NUMBER,
  degree                 NUMBER,
  platform               VARCHAR2(101),
  abort_step             NUMBER,
  instance               VARCHAR2(60),
  cluster_ok             NUMBER,
  service_name           VARCHAR2(100),
  object_int_oid         VARCHAR2(32)
)
;
create table SYS_EXPORT_TABLE_04
(
  process_order          NUMBER,
  duplicate              NUMBER,
  dump_fileid            NUMBER,
  dump_position          NUMBER,
  dump_length            NUMBER,
  dump_orig_length       NUMBER,
  dump_allocation        NUMBER,
  completed_rows         NUMBER,
  error_count            NUMBER,
  elapsed_time           NUMBER,
  object_type_path       VARCHAR2(200),
  object_path_seqno      NUMBER,
  object_type            VARCHAR2(30),
  in_progress            CHAR(1),
  object_name            VARCHAR2(500),
  object_long_name       VARCHAR2(4000),
  object_schema          VARCHAR2(30),
  original_object_schema VARCHAR2(30),
  original_object_name   VARCHAR2(4000),
  partition_name         VARCHAR2(30),
  subpartition_name      VARCHAR2(30),
  dataobj_num            NUMBER,
  flags                  NUMBER,
  property               NUMBER,
  trigflag               NUMBER,
  creation_level         NUMBER,
  completion_time        DATE,
  object_tablespace      VARCHAR2(30),
  size_estimate          NUMBER,
  object_row             NUMBER,
  processing_state       CHAR(1),
  processing_status      CHAR(1),
  base_process_order     NUMBER,
  base_object_type       VARCHAR2(30),
  base_object_name       VARCHAR2(30),
  base_object_schema     VARCHAR2(30),
  ancestor_process_order NUMBER,
  domain_process_order   NUMBER,
  parallelization        NUMBER,
  unload_method          NUMBER,
  load_method            NUMBER,
  granules               NUMBER,
  scn                    NUMBER,
  grantor                VARCHAR2(30),
  xml_clob               CLOB,
  parent_process_order   NUMBER,
  name                   VARCHAR2(30),
  value_t                VARCHAR2(4000),
  value_n                NUMBER,
  is_default             NUMBER,
  file_type              NUMBER,
  user_directory         VARCHAR2(4000),
  user_file_name         VARCHAR2(4000),
  file_name              VARCHAR2(4000),
  extend_size            NUMBER,
  file_max_size          NUMBER,
  process_name           VARCHAR2(30),
  last_update            DATE,
  work_item              VARCHAR2(30),
  object_number          NUMBER,
  completed_bytes        NUMBER,
  total_bytes            NUMBER,
  metadata_io            NUMBER,
  data_io                NUMBER,
  cumulative_time        NUMBER,
  packet_number          NUMBER,
  instance_id            NUMBER,
  old_value              VARCHAR2(4000),
  seed                   NUMBER,
  last_file              NUMBER,
  user_name              VARCHAR2(30),
  operation              VARCHAR2(30),
  job_mode               VARCHAR2(30),
  queue_tabnum           NUMBER,
  control_queue          VARCHAR2(30),
  status_queue           VARCHAR2(30),
  remote_link            VARCHAR2(4000),
  version                NUMBER,
  job_version            VARCHAR2(30),
  db_version             VARCHAR2(30),
  timezone               VARCHAR2(64),
  state                  VARCHAR2(30),
  phase                  NUMBER,
  guid                   RAW(16),
  start_time             DATE,
  block_size             NUMBER,
  metadata_buffer_size   NUMBER,
  data_buffer_size       NUMBER,
  degree                 NUMBER,
  platform               VARCHAR2(101),
  abort_step             NUMBER,
  instance               VARCHAR2(60),
  cluster_ok             NUMBER,
  service_name           VARCHAR2(100),
  object_int_oid         VARCHAR2(32)
)
;
create table SYS_IMPORT_FULL_01
(
  process_order          NUMBER,
  duplicate              NUMBER,
  dump_fileid            NUMBER,
  dump_position          NUMBER,
  dump_length            NUMBER,
  dump_orig_length       NUMBER,
  dump_allocation        NUMBER,
  completed_rows         NUMBER,
  error_count            NUMBER,
  elapsed_time           NUMBER,
  object_type_path       VARCHAR2(200),
  object_path_seqno      NUMBER,
  object_type            VARCHAR2(30),
  in_progress            CHAR(1),
  object_name            VARCHAR2(500),
  object_long_name       VARCHAR2(4000),
  object_schema          VARCHAR2(30),
  original_object_schema VARCHAR2(30),
  original_object_name   VARCHAR2(4000),
  partition_name         VARCHAR2(30),
  subpartition_name      VARCHAR2(30),
  dataobj_num            NUMBER,
  flags                  NUMBER,
  property               NUMBER,
  trigflag               NUMBER,
  creation_level         NUMBER,
  completion_time        DATE,
  object_tablespace      VARCHAR2(30),
  size_estimate          NUMBER,
  object_row             NUMBER,
  processing_state       CHAR(1),
  processing_status      CHAR(1),
  base_process_order     NUMBER,
  base_object_type       VARCHAR2(30),
  base_object_name       VARCHAR2(30),
  base_object_schema     VARCHAR2(30),
  ancestor_process_order NUMBER,
  domain_process_order   NUMBER,
  parallelization        NUMBER,
  unload_method          NUMBER,
  load_method            NUMBER,
  granules               NUMBER,
  scn                    NUMBER,
  grantor                VARCHAR2(30),
  xml_clob               CLOB,
  parent_process_order   NUMBER,
  name                   VARCHAR2(30),
  value_t                VARCHAR2(4000),
  value_n                NUMBER,
  is_default             NUMBER,
  file_type              NUMBER,
  user_directory         VARCHAR2(4000),
  user_file_name         VARCHAR2(4000),
  file_name              VARCHAR2(4000),
  extend_size            NUMBER,
  file_max_size          NUMBER,
  process_name           VARCHAR2(30),
  last_update            DATE,
  work_item              VARCHAR2(30),
  object_number          NUMBER,
  completed_bytes        NUMBER,
  total_bytes            NUMBER,
  metadata_io            NUMBER,
  data_io                NUMBER,
  cumulative_time        NUMBER,
  packet_number          NUMBER,
  instance_id            NUMBER,
  old_value              VARCHAR2(4000),
  seed                   NUMBER,
  last_file              NUMBER,
  user_name              VARCHAR2(30),
  operation              VARCHAR2(30),
  job_mode               VARCHAR2(30),
  queue_tabnum           NUMBER,
  control_queue          VARCHAR2(30),
  status_queue           VARCHAR2(30),
  remote_link            VARCHAR2(4000),
  version                NUMBER,
  job_version            VARCHAR2(30),
  db_version             VARCHAR2(30),
  timezone               VARCHAR2(64),
  state                  VARCHAR2(30),
  phase                  NUMBER,
  guid                   RAW(16),
  start_time             DATE,
  block_size             NUMBER,
  metadata_buffer_size   NUMBER,
  data_buffer_size       NUMBER,
  degree                 NUMBER,
  platform               VARCHAR2(101),
  abort_step             NUMBER,
  instance               VARCHAR2(60),
  cluster_ok             NUMBER,
  service_name           VARCHAR2(100),
  object_int_oid         VARCHAR2(32)
)
;
create table SYS_IMPORT_FULL_02
(
  process_order          NUMBER,
  duplicate              NUMBER,
  dump_fileid            NUMBER,
  dump_position          NUMBER,
  dump_length            NUMBER,
  dump_orig_length       NUMBER,
  dump_allocation        NUMBER,
  completed_rows         NUMBER,
  error_count            NUMBER,
  elapsed_time           NUMBER,
  object_type_path       VARCHAR2(200),
  object_path_seqno      NUMBER,
  object_type            VARCHAR2(30),
  in_progress            CHAR(1),
  object_name            VARCHAR2(500),
  object_long_name       VARCHAR2(4000),
  object_schema          VARCHAR2(30),
  original_object_schema VARCHAR2(30),
  original_object_name   VARCHAR2(4000),
  partition_name         VARCHAR2(30),
  subpartition_name      VARCHAR2(30),
  dataobj_num            NUMBER,
  flags                  NUMBER,
  property               NUMBER,
  trigflag               NUMBER,
  creation_level         NUMBER,
  completion_time        DATE,
  object_tablespace      VARCHAR2(30),
  size_estimate          NUMBER,
  object_row             NUMBER,
  processing_state       CHAR(1),
  processing_status      CHAR(1),
  base_process_order     NUMBER,
  base_object_type       VARCHAR2(30),
  base_object_name       VARCHAR2(30),
  base_object_schema     VARCHAR2(30),
  ancestor_process_order NUMBER,
  domain_process_order   NUMBER,
  parallelization        NUMBER,
  unload_method          NUMBER,
  load_method            NUMBER,
  granules               NUMBER,
  scn                    NUMBER,
  grantor                VARCHAR2(30),
  xml_clob               CLOB,
  parent_process_order   NUMBER,
  name                   VARCHAR2(30),
  value_t                VARCHAR2(4000),
  value_n                NUMBER,
  is_default             NUMBER,
  file_type              NUMBER,
  user_directory         VARCHAR2(4000),
  user_file_name         VARCHAR2(4000),
  file_name              VARCHAR2(4000),
  extend_size            NUMBER,
  file_max_size          NUMBER,
  process_name           VARCHAR2(30),
  last_update            DATE,
  work_item              VARCHAR2(30),
  object_number          NUMBER,
  completed_bytes        NUMBER,
  total_bytes            NUMBER,
  metadata_io            NUMBER,
  data_io                NUMBER,
  cumulative_time        NUMBER,
  packet_number          NUMBER,
  instance_id            NUMBER,
  old_value              VARCHAR2(4000),
  seed                   NUMBER,
  last_file              NUMBER,
  user_name              VARCHAR2(30),
  operation              VARCHAR2(30),
  job_mode               VARCHAR2(30),
  queue_tabnum           NUMBER,
  control_queue          VARCHAR2(30),
  status_queue           VARCHAR2(30),
  remote_link            VARCHAR2(4000),
  version                NUMBER,
  job_version            VARCHAR2(30),
  db_version             VARCHAR2(30),
  timezone               VARCHAR2(64),
  state                  VARCHAR2(30),
  phase                  NUMBER,
  guid                   RAW(16),
  start_time             DATE,
  block_size             NUMBER,
  metadata_buffer_size   NUMBER,
  data_buffer_size       NUMBER,
  degree                 NUMBER,
  platform               VARCHAR2(101),
  abort_step             NUMBER,
  instance               VARCHAR2(60),
  cluster_ok             NUMBER,
  service_name           VARCHAR2(100),
  object_int_oid         VARCHAR2(32)
)
;
create table SYS_IMPORT_SCHEMA_01
(
  process_order          NUMBER,
  duplicate              NUMBER,
  dump_fileid            NUMBER,
  dump_position          NUMBER,
  dump_length            NUMBER,
  dump_orig_length       NUMBER,
  dump_allocation        NUMBER,
  completed_rows         NUMBER,
  error_count            NUMBER,
  elapsed_time           NUMBER,
  object_type_path       VARCHAR2(200),
  object_path_seqno      NUMBER,
  object_type            VARCHAR2(30),
  in_progress            CHAR(1),
  object_name            VARCHAR2(500),
  object_long_name       VARCHAR2(4000),
  object_schema          VARCHAR2(30),
  original_object_schema VARCHAR2(30),
  original_object_name   VARCHAR2(4000),
  partition_name         VARCHAR2(30),
  subpartition_name      VARCHAR2(30),
  dataobj_num            NUMBER,
  flags                  NUMBER,
  property               NUMBER,
  trigflag               NUMBER,
  creation_level         NUMBER,
  completion_time        DATE,
  object_tablespace      VARCHAR2(30),
  size_estimate          NUMBER,
  object_row             NUMBER,
  processing_state       CHAR(1),
  processing_status      CHAR(1),
  base_process_order     NUMBER,
  base_object_type       VARCHAR2(30),
  base_object_name       VARCHAR2(30),
  base_object_schema     VARCHAR2(30),
  ancestor_process_order NUMBER,
  domain_process_order   NUMBER,
  parallelization        NUMBER,
  unload_method          NUMBER,
  load_method            NUMBER,
  granules               NUMBER,
  scn                    NUMBER,
  grantor                VARCHAR2(30),
  xml_clob               CLOB,
  parent_process_order   NUMBER,
  name                   VARCHAR2(30),
  value_t                VARCHAR2(4000),
  value_n                NUMBER,
  is_default             NUMBER,
  file_type              NUMBER,
  user_directory         VARCHAR2(4000),
  user_file_name         VARCHAR2(4000),
  file_name              VARCHAR2(4000),
  extend_size            NUMBER,
  file_max_size          NUMBER,
  process_name           VARCHAR2(30),
  last_update            DATE,
  work_item              VARCHAR2(30),
  object_number          NUMBER,
  completed_bytes        NUMBER,
  total_bytes            NUMBER,
  metadata_io            NUMBER,
  data_io                NUMBER,
  cumulative_time        NUMBER,
  packet_number          NUMBER,
  instance_id            NUMBER,
  old_value              VARCHAR2(4000),
  seed                   NUMBER,
  last_file              NUMBER,
  user_name              VARCHAR2(30),
  operation              VARCHAR2(30),
  job_mode               VARCHAR2(30),
  queue_tabnum           NUMBER,
  control_queue          VARCHAR2(30),
  status_queue           VARCHAR2(30),
  remote_link            VARCHAR2(4000),
  version                NUMBER,
  job_version            VARCHAR2(30),
  db_version             VARCHAR2(30),
  timezone               VARCHAR2(64),
  state                  VARCHAR2(30),
  phase                  NUMBER,
  guid                   RAW(16),
  start_time             DATE,
  block_size             NUMBER,
  metadata_buffer_size   NUMBER,
  data_buffer_size       NUMBER,
  degree                 NUMBER,
  platform               VARCHAR2(101),
  abort_step             NUMBER,
  instance               VARCHAR2(60),
  cluster_ok             NUMBER,
  service_name           VARCHAR2(100),
  object_int_oid         VARCHAR2(32)
)
;
create table SYS_IMPORT_SCHEMA_02
(
  process_order          NUMBER,
  duplicate              NUMBER,
  dump_fileid            NUMBER,
  dump_position          NUMBER,
  dump_length            NUMBER,
  dump_orig_length       NUMBER,
  dump_allocation        NUMBER,
  completed_rows         NUMBER,
  error_count            NUMBER,
  elapsed_time           NUMBER,
  object_type_path       VARCHAR2(200),
  object_path_seqno      NUMBER,
  object_type            VARCHAR2(30),
  in_progress            CHAR(1),
  object_name            VARCHAR2(500),
  object_long_name       VARCHAR2(4000),
  object_schema          VARCHAR2(30),
  original_object_schema VARCHAR2(30),
  original_object_name   VARCHAR2(4000),
  partition_name         VARCHAR2(30),
  subpartition_name      VARCHAR2(30),
  dataobj_num            NUMBER,
  flags                  NUMBER,
  property               NUMBER,
  trigflag               NUMBER,
  creation_level         NUMBER,
  completion_time        DATE,
  object_tablespace      VARCHAR2(30),
  size_estimate          NUMBER,
  object_row             NUMBER,
  processing_state       CHAR(1),
  processing_status      CHAR(1),
  base_process_order     NUMBER,
  base_object_type       VARCHAR2(30),
  base_object_name       VARCHAR2(30),
  base_object_schema     VARCHAR2(30),
  ancestor_process_order NUMBER,
  domain_process_order   NUMBER,
  parallelization        NUMBER,
  unload_method          NUMBER,
  load_method            NUMBER,
  granules               NUMBER,
  scn                    NUMBER,
  grantor                VARCHAR2(30),
  xml_clob               CLOB,
  parent_process_order   NUMBER,
  name                   VARCHAR2(30),
  value_t                VARCHAR2(4000),
  value_n                NUMBER,
  is_default             NUMBER,
  file_type              NUMBER,
  user_directory         VARCHAR2(4000),
  user_file_name         VARCHAR2(4000),
  file_name              VARCHAR2(4000),
  extend_size            NUMBER,
  file_max_size          NUMBER,
  process_name           VARCHAR2(30),
  last_update            DATE,
  work_item              VARCHAR2(30),
  object_number          NUMBER,
  completed_bytes        NUMBER,
  total_bytes            NUMBER,
  metadata_io            NUMBER,
  data_io                NUMBER,
  cumulative_time        NUMBER,
  packet_number          NUMBER,
  instance_id            NUMBER,
  old_value              VARCHAR2(4000),
  seed                   NUMBER,
  last_file              NUMBER,
  user_name              VARCHAR2(30),
  operation              VARCHAR2(30),
  job_mode               VARCHAR2(30),
  queue_tabnum           NUMBER,
  control_queue          VARCHAR2(30),
  status_queue           VARCHAR2(30),
  remote_link            VARCHAR2(4000),
  version                NUMBER,
  job_version            VARCHAR2(30),
  db_version             VARCHAR2(30),
  timezone               VARCHAR2(64),
  state                  VARCHAR2(30),
  phase                  NUMBER,
  guid                   RAW(16),
  start_time             DATE,
  block_size             NUMBER,
  metadata_buffer_size   NUMBER,
  data_buffer_size       NUMBER,
  degree                 NUMBER,
  platform               VARCHAR2(101),
  abort_step             NUMBER,
  instance               VARCHAR2(60),
  cluster_ok             NUMBER,
  service_name           VARCHAR2(100),
  object_int_oid         VARCHAR2(32)
)
;
create table T1
(
  tail VARCHAR2(4)
)
;
create table TAB_ABC_POLICYDETAILINFO
(
  pcode          VARCHAR2(10),
  policy_code    VARCHAR2(20) not null,
  hold_date      DATE,
  vali_date      DATE,
  stop_date      VARCHAR2(8),
  bank_state     VARCHAR2(2),
  policy_state   VARCHAR2(2),
  update_state   VARCHAR2(2),
  id             NUMBER(12),
  bank_stop_date VARCHAR2(8)
)
;
create table TAB_ABNORMAL_BILLCARD
(
  ab_bill_id        NUMBER(10),
  apply_code        VARCHAR2(30),
  policy_code       VARCHAR2(30),
  policy_print_code VARCHAR2(30),
  billcard_code     VARCHAR2(30),
  organ_id          VARCHAR2(40),
  expect_operation  NUMBER(2),
  abnormal_type     NUMBER(2),
  description       VARCHAR2(200),
  insert_time       DATE,
  status            NUMBER(2),
  update_time       DATE
)
;
create table TAB_ABNORMAL_TYPE
(
  abop_type NUMBER(2) not null,
  abop_desc VARCHAR2(100) not null
)
;
create table TAB_ABNORMAL_OPERATION
(
  abop_id       NUMBER(10) not null,
  user_id       VARCHAR2(30) not null,
  exec_time     DATE not null,
  apply_code    VARCHAR2(15),
  abop_type     NUMBER(2) not null,
  process_state NUMBER(1) not null,
  before_update VARCHAR2(500),
  after_update  VARCHAR2(500),
  uds_no        VARCHAR2(30)
)
;
create table TAB_ABZ
(
  organ_id      VARCHAR2(10) not null,
  internal_code VARCHAR2(10) not null,
  policy_code   VARCHAR2(20) not null,
  hold_date     VARCHAR2(10) not null,
  certi_type    VARCHAR2(10) not null,
  certi_code    VARCHAR2(100) not null,
  product_name  VARCHAR2(200),
  product_id    VARCHAR2(10),
  period        VARCHAR2(10),
  charge_period VARCHAR2(10),
  policy_state  VARCHAR2(100)
)
;
create table TAB_ABZ1
(
  organ_id      VARCHAR2(10) not null,
  internal_code VARCHAR2(10) not null,
  policy_code   VARCHAR2(20) not null,
  hold_date     VARCHAR2(10) not null,
  certi_type    VARCHAR2(10) not null,
  certi_code    VARCHAR2(20) not null,
  product_name  VARCHAR2(200),
  product_id    VARCHAR2(10),
  period        VARCHAR2(10),
  charge_period VARCHAR2(10),
  policy_state  VARCHAR2(100)
)
;
create table TAB_ANNUITY_INFO
(
  list_id                  NUMBER(10) not null,
  item_id                  NUMBER(10),
  draw_annuity_amount      NUMBER(12,2) default 0,
  insert_time              DATE default sysdate,
  update_time              DATE default sysdate,
  once_draw_bonus_rate     NUMBER(5,4),
  once_draw_bonus_amount   NUMBER(12,2),
  once_draw_annuity_amount NUMBER(12,2),
  draw_bonus_amount        NUMBER(12,2)
)
;
create table TAB_AUTH_ROLE
(
  role_id          VARCHAR2(20),
  role_name        VARCHAR2(20),
  role_description VARCHAR2(40)
)
;
create table TAB_AUTH_EBAOUSER_ROLE
(
  user_id     VARCHAR2(30) not null,
  role_id     VARCHAR2(20) not null,
  operator    VARCHAR2(30) not null,
  update_time DATE not null
)
;
create table TAB_AUTH_MENU
(
  menu_id    VARCHAR2(10) not null,
  menu_name  VARCHAR2(30) not null,
  parent_id  VARCHAR2(10),
  layer      NUMBER(1) not null,
  menu_width NUMBER(3),
  menu_order NUMBER(2) not null,
  first_page VARCHAR2(80)
)
;
create table TAB_AUTH_MENU_URL
(
  menu_id VARCHAR2(10) not null,
  url     VARCHAR2(100) not null
)
;
create table TAB_AUTH_ROLE_MENU
(
  role_id VARCHAR2(20) not null,
  menu_id VARCHAR2(10) not null
)
;
create table TAB_AUTH_USER
(
  user_id      VARCHAR2(30) not null,
  user_name    VARCHAR2(40),
  organ_id     VARCHAR2(40),
  user_pwd     VARCHAR2(128),
  delete_flag  CHAR(1) not null,
  user_pwd_sm3 NVARCHAR2(100)
)
;
create table TAB_AUTH_USER_ROLE
(
  user_id VARCHAR2(30) not null,
  role_id VARCHAR2(20) not null
)
;
create table TAB_AUTO_UW_POLICY
(
  auto_id      NUMBER(10) not null,
  policy_id    NUMBER(10) not null,
  insert_time  DATE not null,
  auto_message VARCHAR2(2000),
  auto_status  VARCHAR2(1) not null
)
;

create table TAB_AUTO_UW_PRODUCT
(
  auto_product_id NUMBER(10) not null,
  auto_id         NUMBER(10) not null,
  policy_id       NUMBER(10) not null,
  item_id         NUMBER(10) not null,
  insert_time     DATE not null,
  auto_message    VARCHAR2(2000),
  auto_status     VARCHAR2(1) not null
)
;

create table TAB_BANK_BACK_FILE_DATA
(
  policy_code          CHAR(20) not null,
  bank_code            CHAR(20) not null,
  request_date         DATE,
  data_type            CHAR(1),
  invalid_file_date    DATE,
  fee_amount           NUMBER(12,2),
  issue_way            CHAR(1),
  bank_process_id      CHAR(20),
  policy_accept_status CHAR(1),
  bank_policy_status   CHAR(1),
  error_code           CHAR(6),
  error_info           CHAR(100),
  update_time          DATE,
  state                CHAR(1)
)
;
create table TAB_BANK_FEE
(
  policy_id NUMBER(10) not null,
  bank_code VARCHAR2(20) not null,
  feeym     CHAR(6) not null
)
;
create table TAB_BANK_MANAGER_INFO
(
  apply_code      VARCHAR2(20) not null,
  organ_id        VARCHAR2(20),
  bank_name       VARCHAR2(200),
  bank_certid     VARCHAR2(40),
  manager_no      VARCHAR2(40),
  manager_name    VARCHAR2(100),
  sellteller      VARCHAR2(40),
  sellteller_name VARCHAR2(100),
  sellcertid      VARCHAR2(40),
  insert_time     DATE not null,
  products        VARCHAR2(20)
)
;
create table TAB_BANK_NONREALTIME
(
  send_code    VARCHAR2(20),
  bank_code    VARCHAR2(20) not null,
  branch_code  VARCHAR2(20),
  trans_date   DATE,
  extrans_id   VARCHAR2(30),
  tb_name      VARCHAR2(30),
  id_type      VARCHAR2(10),
  id_card      VARCHAR2(20),
  hand_flag    VARCHAR2(1),
  insert_time  DATE,
  update_time  DATE,
  remakes_info VARCHAR2(20)
)
;

create table TAB_BILLCARD_DETAIL
(
  request_id         NUMBER(10),
  apply_code         VARCHAR2(30),
  policy_print_code  VARCHAR2(30),
  policy_code        VARCHAR2(30),
  bill_status        NUMBER(2),
  invoice_code       VARCHAR2(30),
  invoice_print_code VARCHAR2(30),
  insert_time        DATE
)
;
create table TAB_BIS_CONFIG
(
  bank_code          VARCHAR2(40) not null,
  organ_id           VARCHAR2(40) not null,
  bank_organcode     VARCHAR2(4) not null,
  bank_branchcode    VARCHAR2(2),
  bank_distrinctcode VARCHAR2(2),
  file_path          VARCHAR2(250),
  sftp_server        VARCHAR2(250),
  sftp_port          VARCHAR2(5),
  sftp_path          VARCHAR2(250),
  sftp_user          VARCHAR2(100),
  sftp_passwd        VARCHAR2(100),
  bftp_server        VARCHAR2(250),
  bftp_port          VARCHAR2(5),
  bftp_path          VARCHAR2(250),
  bftp_user          VARCHAR2(100),
  bftp_passwd        VARCHAR2(100),
  remark_01          VARCHAR2(250),
  remark_02          VARCHAR2(250),
  remark_03          VARCHAR2(250),
  remark_04          VARCHAR2(250),
  remark_05          VARCHAR2(250)
)
;
create table TAB_BJRCB_NONREALTIME
(
  send_code   VARCHAR2(20) not null,
  branch_code VARCHAR2(20),
  sale_code   VARCHAR2(10),
  trans_date  DATE,
  saly_way    VARCHAR2(1),
  hb_flag     VARCHAR2(1),
  tb_name     VARCHAR2(30),
  id_type     VARCHAR2(2),
  id_card     VARCHAR2(20),
  hand_flag   VARCHAR2(1),
  insert_time DATE,
  update_time DATE
)
;
create table TAB_BJRCB_SENDBACK
(
  send_id      NUMBER(10) not null,
  create_time  DATE,
  organ_id     VARCHAR2(40),
  collect_pay  CHAR(1),
  sendfilename VARCHAR2(30),
  bkfilename   VARCHAR2(30),
  state_id     CHAR(1),
  info         VARCHAR2(1000)
)
;
create table TAB_BOBJ_FILEINFO
(
  filename    VARCHAR2(100),
  polcount    VARCHAR2(10),
  insert_time DATE,
  update_time DATE,
  beizhu      VARCHAR2(100)
)
;
create table TAB_BOCOMM_FILE_HANDLE
(
  bank_bat_no  VARCHAR2(20),
  insu_bat_no  VARCHAR2(20),
  bank_code    VARCHAR2(20),
  file_name    VARCHAR2(100) not null,
  file_type    VARCHAR2(5) not null,
  insert_time  DATE,
  update_time  DATE,
  is_confirm   NUMBER(3),
  is_discard   NUMBER(3),
  is_retrans   NUMBER(3),
  total_number VARCHAR2(20),
  total_amount VARCHAR2(20)
)
;
create table TAB_CA_POLICY
(
  policycode         VARCHAR2(20) not null,
  jmscorrelationid   VARCHAR2(50),
  pdftempcode        VARCHAR2(50),
  smstemptype        VARCHAR2(50),
  emailtemptype      VARCHAR2(50),
  usecertificate     VARCHAR2(10),
  historypolicy      VARCHAR2(10),
  pdffilepath        VARCHAR2(200),
  applytime          DATE,
  finishtime         DATE,
  resultcode         VARCHAR2(10),
  resultdesc         VARCHAR2(200),
  downloadresultcode VARCHAR2(10),
  downloadresultdesc VARCHAR2(200),
  email              VARCHAR2(200)
)
;
create table TAB_CCB_DATAFILE_FIX
(
  apply_code    VARCHAR2(20),
  policy_code   VARCHAR2(20),
  product_id    NUMBER(10),
  period_prem   NUMBER(12,2),
  reduce_prem   NUMBER(12,2),
  applier_name  VARCHAR2(200),
  insured_name  VARCHAR2(200),
  apply_date    DATE,
  end_date      DATE,
  withdraw_type CHAR(2),
  withdraw_flag CHAR(1),
  send_time     DATE,
  state         CHAR(1)
)
;
create table TAB_CCB_FILENUM_INFO
(
  bank_code    VARCHAR2(20),
  file_num     NUMBER(10),
  insert_time  DATE,
  service_code VARCHAR2(10)
)
;
create table TAB_CCB_NONREALTIME_INFO
(
  apply_code  VARCHAR2(15) not null,
  amount      NUMBER(12,2),
  prem        NUMBER(12,2),
  status      VARCHAR2(2),
  insert_time DATE,
  product_id  VARCHAR2(10),
  real_name   VARCHAR2(80),
  certitype   VARCHAR2(2),
  certicode   VARCHAR2(20),
  salename    VARCHAR2(80),
  salecode    VARCHAR2(20)
)
;
create table TAB_CCB_REGISTER_INFO
(
  policy_code VARCHAR2(20) not null,
  certi_type  VARCHAR2(2),
  amount      NUMBER(15,2),
  agentcode   VARCHAR2(15),
  status      VARCHAR2(1),
  insert_time DATE,
  update_time DATE,
  certi_code  VARCHAR2(30)
)
;
create table TAB_CCB_SENDBACK
(
  send_id     NUMBER(10),
  create_time DATE,
  organ_id    VARCHAR2(40),
  collect_pay CHAR(1),
  bkfilename  VARCHAR2(30),
  state_id    CHAR(1),
  info        VARCHAR2(1000)
)
;
comment on column TAB_CCB_SENDBACK.state_id
  is '状态标识(0-待处理,1-已被查询,2-已报盘至
建行,等待回盘,3-已回盘成功,4-建行反错)';
create table TAB_CCB_SENDBACK_PRE
(
  send_id     NUMBER(10),
  create_time DATE,
  organ_id    VARCHAR2(40),
  deal_flag   CHAR(1)
)
;
create table TAB_CCB_SEQUENCE_CONVERTION
(
  bank_code   VARCHAR2(20) not null,
  external_id VARCHAR2(40) not null,
  request_id  NUMBER(10),
  applycode   VARCHAR2(15),
  policycode  VARCHAR2(15),
  inserttime  DATE,
  serviceid   VARCHAR2(10)
)
;
create table TAB_CHANNEL_ADDRESS
(
  bank_code  VARCHAR2(20),
  ip         VARCHAR2(200),
  ip_pattern VARCHAR2(100)
)
;
create table TAB_CHANNEL_CHECK_CONFIG
(
  bank_code             VARCHAR2(20) not null,
  daily_check_bank_code VARCHAR2(20) not null,
  info                  VARCHAR2(1000)
)
;
create table TAB_FILE_TRANS_DIRECTION
(
  trans_direction NUMBER(3) not null,
  info            VARCHAR2(1000)
)
;

create table TAB_CHANNEL_DAILY_CHECK_CONFIG
(
  remote_file_name_id NUMBER(10),
  local_file_name_id  NUMBER(10),
  channel_id          VARCHAR2(20) not null,
  trans_direction     NUMBER(3) not null,
  info                VARCHAR2(1000),
  ftp_ip              VARCHAR2(100),
  ftp_port            VARCHAR2(20),
  remote_dir          VARCHAR2(200),
  local_dir           VARCHAR2(200)
)
;

create table TAB_CHANNEL_STATE
(
  state_id   NUMBER(10) not null,
  state_name VARCHAR2(100) not null
)
;

create table TAB_REUQEST_TYPE
(
  request_type NUMBER(3) not null,
  request_desc VARCHAR2(500)
)
;

create table TAB_SERVICE_IMPL_TYPE
(
  impl_type NUMBER(3) not null,
  impl_desc VARCHAR2(500)
)
;

create table TAB_MIDPLAT_SERVICE_CONFIG
(
  service_id       NUMBER(3) not null,
  service_code     VARCHAR2(20) not null,
  request_type     NUMBER(3),
  impl_type        NUMBER(3),
  service_provider VARCHAR2(1000),
  service_info     VARCHAR2(2000),
  has_log          NUMBER(1) default 0
)
;
create table TAB_CHANNEL_SERVICE_CONFIG
(
  bank_code  VARCHAR2(20) not null,
  service_id NUMBER(10) not null,
  state_id   NUMBER(10) not null,
  info       VARCHAR2(100)
)
;

create table TAB_CHECK_BANK_SPECIAL
(
  check_id   INTEGER,
  organ_id   VARCHAR2(40),
  bank_code  VARCHAR2(40),
  check_code VARCHAR2(40),
  is_check   CHAR(1)
)
;
create table TAB_CLAIM_FEE_MIG_LOG
(
  migration_id     NUMBER(10) not null,
  fee_id           NUMBER(12) not null,
  case_id          NUMBER(10) not null,
  insured_id       NUMBER(10),
  fee_amount       NUMBER(14,2) not null,
  money_id         NUMBER(6) not null,
  fee_status       NUMBER(2) not null,
  fee_type         NUMBER(3) not null,
  pay_mode         NUMBER(2) not null,
  policy_id        NUMBER(10) not null,
  product_num      CHAR(3) not null,
  product_id       NUMBER(10) not null,
  head_id          VARCHAR2(40) not null,
  branch_id        VARCHAR2(40) not null,
  organ_id         VARCHAR2(40) not null,
  dept_id          VARCHAR2(20) not null,
  cashier_id       NUMBER(10),
  cashier_organ    VARCHAR2(40),
  cashier_dept     VARCHAR2(20),
  check_enter_time DATE,
  finish_time      DATE,
  posted           CHAR(1) default 'N' not null,
  post_id          NUMBER(10),
  cred_id          NUMBER(10),
  insert_time      DATE default SYSDATE not null,
  bill_id          NUMBER(10),
  item_id          NUMBER(10) not null,
  policy_type      CHAR(1) not null,
  update_time      DATE default SYSDATE not null,
  liab_id          NUMBER(4),
  circ_audited     CHAR(1) default 'N' not null,
  reversal_id      NUMBER(10)
)
;
create table TAB_COMMISION_FEE_MIG_LOG
(
  migration_id   NUMBER(10) not null,
  fee_id         NUMBER(12) not null,
  head_id        VARCHAR2(40) not null,
  branch_id      VARCHAR2(40) not null,
  organ_id       VARCHAR2(40) not null,
  dept_id        VARCHAR2(20) not null,
  agent_id       NUMBER(10) not null,
  policy_type    CHAR(1) not null,
  policy_id      NUMBER(10),
  product_num    CHAR(3),
  product_id     NUMBER(7),
  charge_type    CHAR(1),
  policy_year    NUMBER(2),
  policy_period  NUMBER(4),
  fee_amount     NUMBER(12,2) not null,
  money_id       NUMBER(6) not null,
  fee_type       NUMBER(2) not null,
  fee_status     NUMBER(2) not null,
  pay_mode       NUMBER(2) not null,
  insert_time    DATE default SYSDATE not null,
  update_time    DATE default SYSDATE not null,
  finish_time    DATE,
  cancel_date    DATE,
  finish_id      NUMBER(10),
  cancel_id      NUMBER(10),
  posted         CHAR(1) default 'N' not null,
  post_id        NUMBER(10),
  cred_id        NUMBER(10),
  related_id     NUMBER(12),
  aggregation_id NUMBER(10)
)
;
create table TAB_COMM_BANKCODE
(
  bank_code VARCHAR2(15),
  comm_code VARCHAR2(11)
)
;
create table TAB_COMM_SENDBACK
(
  serialnum          NUMBER(10),
  requestdate        DATE not null,
  filetype           VARCHAR2(10) not null,
  filename           VARCHAR2(50),
  process_end_time   DATE,
  process_start_time DATE,
  process_state      NUMBER(3) not null,
  info               VARCHAR2(1000),
  sendid             VARCHAR2(20),
  detail_state       VARCHAR2(40),
  back_file_decoded  NUMBER(2) default 0
)
;
create table TAB_CONTRACT_MIG_LOG
(
  migration_id        NUMBER(10) not null,
  policy_id           NUMBER(10) not null,
  policy_code         VARCHAR2(20) not null,
  apply_code          VARCHAR2(20) not null,
  policy_type         CHAR(1) not null,
  group_single        CHAR(1) not null,
  real_insurant       CHAR(1) default 'Y' not null,
  head_id             VARCHAR2(40) not null,
  branch_id           VARCHAR2(40) not null,
  organ_id            VARCHAR2(40) not null,
  dept_id             VARCHAR2(20) not null,
  balance_prem        NUMBER(12,2) default 0 not null,
  period_prem         NUMBER(12,2) not null,
  discount_prem       NUMBER(12,2) not null,
  company_prem        NUMBER(12,2),
  employee_prem       NUMBER(12,2) not null,
  normal_prem         NUMBER(12,2) not null,
  normal_stand        NUMBER(12,2) not null,
  weak_prem           NUMBER(12,2) default 0 not null,
  weak_stand          NUMBER(12,2) default 0 not null,
  job_prem            NUMBER(12,2) default 0 not null,
  job_stand           NUMBER(12,2) default 0 not null,
  disable_prem        NUMBER(12,2) default 0 not null,
  disable_stand       NUMBER(12,2) default 0 not null,
  over_manage         CHAR(1) not null,
  pay_mode            NUMBER(2) not null,
  pay_next            NUMBER(2) not null,
  pay_way             VARCHAR2(2),
  deliver_type        CHAR(1),
  service_type        CHAR(1),
  overdue_manage      CHAR(1) default '1' not null,
  bank_code           VARCHAR2(20),
  bank_account        VARCHAR2(40),
  money_id            NUMBER(6) not null,
  applicant_id        NUMBER(10),
  company_id          NUMBER(10),
  address_fee         VARCHAR2(150),
  zip_link            VARCHAR2(10),
  link_tel            VARCHAR2(50),
  linkman             VARCHAR2(40),
  linkman_title       VARCHAR2(50),
  linkman_dept        VARCHAR2(40),
  link_celler         VARCHAR2(30),
  email               VARCHAR2(50),
  fax                 VARCHAR2(30),
  link_notes          VARCHAR2(1000),
  apply_date          DATE not null,
  validate_date       DATE not null,
  accept_date         DATE not null,
  end_date            DATE not null,
  pause_date          DATE,
  liability_state     NUMBER(2) default 1 not null,
  suspend             CHAR(1) default 'N' not null,
  suspend_cause       NUMBER(2),
  pause_cause         NUMBER(2),
  end_cause           NUMBER(2),
  prem_status         NUMBER(2) default 1 not null,
  claim_deal          NUMBER(4),
  service_deal        NUMBER(4),
  policy_year         NUMBER(2) not null,
  policy_period       NUMBER(4) not null,
  agent_id            NUMBER(10) not null,
  sign_id             NUMBER(10),
  agency_code         VARCHAR2(20),
  branch_bank         VARCHAR2(20),
  agency_hand         NUMBER(10),
  update_time         DATE default SYSDATE not null,
  updater_id          NUMBER(10),
  insert_time         DATE default SYSDATE not null,
  assumpsit           VARCHAR2(4000),
  agreement_type      NUMBER(2),
  agreement_motive    VARCHAR2(200),
  agreement           VARCHAR2(4000),
  pay_times           NUMBER(4),
  sys_lock_time       DATE,
  sys_locker_id       NUMBER(10),
  sys_lock_status     CHAR(1) default '0' not null,
  claim_emp           NUMBER(10),
  service_emp         NUMBER(10),
  reissue_num         NUMBER(2) default 0 not null,
  nb_agency_code      VARCHAR2(20),
  policy_print        NUMBER(2) default 0 not null,
  unit_print          NUMBER(2) default 0 not null,
  receipt_print       NUMBER(2) default 0 not null,
  appro_emp_id        NUMBER(10),
  balance_capital     NUMBER(14,4) default 0 not null,
  em_ill              NUMBER(4),
  em_life             NUMBER(4),
  relation_id         NUMBER(2),
  job_class_1         NUMBER(2),
  job_cate_id         NUMBER(10),
  job_2               VARCHAR2(40),
  job_1               VARCHAR2(100),
  applicant_age       NUMBER(3),
  loan_status         CHAR(1) default '0' not null,
  derivation          CHAR(1) default '1' not null,
  former_id           NUMBER(10),
  next_period_prem    NUMBER(12,2) default 0 not null,
  next_discount_prem  NUMBER(12,2) default 0 not null,
  next_company_prem   NUMBER(12,2) default 0 not null,
  next_employee_prem  NUMBER(12,2) default 0 not null,
  next_normal_prem    NUMBER(12,2) default 0 not null,
  next_weak_prem      NUMBER(12,2) default 0 not null,
  next_job_prem       NUMBER(12,2) default 0 not null,
  next_disable_prem   NUMBER(12,2) default 0 not null,
  print_time          DATE,
  sell_way            VARCHAR2(2) default '0' not null,
  tax_prem            NUMBER(12,2) default 0 not null,
  answer_type         VARCHAR2(1) default '0' not null,
  is_answered         VARCHAR2(1) default 'N' not null,
  auto_decision       NUMBER(2) default 0 not null,
  service_id          NUMBER(10) not null,
  service_date        DATE not null,
  policy_prem         NUMBER(12,2) default 0 not null,
  policy_stand        NUMBER(12,2) default 0 not null,
  next_policy_prem    NUMBER(12,2) default 0 not null,
  next_tax_prem       NUMBER(12,2) default 0 not null,
  address_fee_2       VARCHAR2(100),
  address_fee_3       VARCHAR2(100),
  address_fee_4       VARCHAR2(100),
  indivi_enquiry      CHAR(1) default 'N' not null,
  tax_prem_stand      NUMBER(12,2) default 0 not null,
  matu_pay_mode       NUMBER(2),
  matu_process        VARCHAR2(1),
  matu_status         VARCHAR2(1),
  suspend_chg_id      NUMBER(10),
  prem_change_time    DATE default SYSDATE not null,
  received_date       DATE,
  emp_attach_type     CHAR(1),
  initial_vali_date   DATE,
  next_weak_stand     NUMBER(12,2) default 0 not null,
  next_job_stand      NUMBER(12,2) default 0 not null,
  next_disable_stand  NUMBER(12,2) default 0 not null,
  auto_end            DATE,
  assignee_type       VARCHAR2(2) default 0 not null,
  swiss_life          CHAR(1) default 'N' not null,
  prorate             CHAR(1) default 'Y' not null,
  campaign_code       VARCHAR2(10),
  ss_validate_date    DATE,
  acknow_code         VARCHAR2(20),
  is_commission       CHAR(1) default 'Y' not null,
  whole_period        CHAR(1) default 'Y' not null,
  discount_tax        NUMBER(12,2) default 0 not null,
  next_discount_tax   NUMBER(12,2) default 0 not null,
  auto_surrender      CHAR(1) default 'N' not null,
  sur_notice_date     DATE,
  send_out_date       DATE,
  send_out_id         NUMBER(10),
  commission_rate     NUMBER(4,3) default 0 not null,
  answer_assumpsit    VARCHAR2(1000),
  is_igp              CHAR(1),
  igp_type            CHAR(1),
  issue_way           NUMBER(10) default 1,
  scheme_id           NUMBER(10),
  agent_discount_rate NUMBER(4,3) default 1 not null,
  invoice_amount      NUMBER(12,2),
  answer_tel          VARCHAR2(40),
  holiday_indi        CHAR(1) default 'N',
  holiday_start_date  DATE,
  holiday_end_date    DATE,
  holiday_pol_year    NUMBER(3),
  hi_validate_date    DATE,
  hi_plan_id          NUMBER(10),
  hi_end_date         DATE,
  sin_emp_ins_amount  NUMBER(10),
  dou_emp_ins_amount  NUMBER(10),
  annuity_print       NUMBER(2) default 0 not null,
  annuity_print_time  DATE,
  list_print          NUMBER(2) default 0 not null,
  list_print_time     DATE,
  pld                 DATE default to_date('9999-09-09','yyyy-mm-dd'),
  holder_emp_num      NUMBER(6)
)
;
create table TAB_CONTRACT_PROD_MIG_LOG
(
  migration_id             NUMBER(10) not null,
  item_id                  NUMBER(10) not null,
  master_id                NUMBER(10),
  policy_id                NUMBER(10) not null,
  product_num              CHAR(3) not null,
  product_id               NUMBER(10) not null,
  ins_type                 CHAR(1) not null,
  amount                   NUMBER(14,2),
  unit                     NUMBER(12,2),
  period_prem              NUMBER(12,2) not null,
  discount_prem            NUMBER(12,2) not null,
  company_prem             NUMBER(12,2),
  employee_prem            NUMBER(12,2),
  normal_prem              NUMBER(12,2) not null,
  normal_stand             NUMBER(12,2) not null,
  weak_prem                NUMBER(12,2) default 0 not null,
  weak_stand               NUMBER(12,2) default 0 not null,
  weak_year                NUMBER(2),
  weak_arith               CHAR(1) default '0' not null,
  weak_rate                NUMBER(4,3) default 0 not null,
  weak_kilo                NUMBER(8,2) default 0 not null,
  job_prem                 NUMBER(12,2) default 0 not null,
  job_stand                NUMBER(12,2) default 0 not null,
  job_year                 NUMBER(2),
  job_arith                CHAR(1) default '0' not null,
  job_rate                 NUMBER(4,3) default 0 not null,
  job_kilo                 NUMBER(8,2) default 0 not null,
  disable_prem             NUMBER(12,2) default 0 not null,
  disable_stand            NUMBER(12,2) default 0 not null,
  disable_year             NUMBER(2),
  disable_arith            CHAR(1) default '0' not null,
  disable_rate             NUMBER(4,3) default 0 not null,
  disable_kilo             NUMBER(8,2) default 0 not null,
  dividend_choice          NUMBER(2),
  apply_date               DATE not null,
  end_date                 DATE not null,
  validate_date            DATE not null,
  paidup_date              DATE not null,
  pause_date               DATE,
  liability_state          NUMBER(2) default 1 not null,
  end_cause                NUMBER(2),
  prem_status              NUMBER(2) default 1 not null,
  premium_year             NUMBER(3) not null,
  pay_to_date              DATE not null,
  policy_year              NUMBER(2) not null,
  policy_period            NUMBER(4) not null,
  initial_type             CHAR(1) not null,
  renewal_type             CHAR(1) not null,
  insured_1                NUMBER(10) not null,
  age_1                    NUMBER(3) not null,
  relation_1               NUMBER(2),
  relation_s               NUMBER(2) default 5 not null,
  job_1_1                  VARCHAR2(100),
  job_1_2                  VARCHAR2(40),
  job_class_1              NUMBER(2),
  job_cate_1               NUMBER(10),
  em_life_1                NUMBER(4) default 0 not null,
  em_health_1              NUMBER(4) default 0 not null,
  insured_2                NUMBER(10),
  age_2                    NUMBER(3),
  relation_2               NUMBER(2),
  job_2_1                  VARCHAR2(40),
  job_2_2                  VARCHAR2(40),
  job_class_2              NUMBER(2),
  job_cate_2               NUMBER(10),
  em_life_2                NUMBER(4) default 0 not null,
  em_health_2              NUMBER(4) default 0 not null,
  pay_period               CHAR(1),
  pay_year                 NUMBER(3),
  end_period               CHAR(1),
  end_year                 NUMBER(3),
  pay_ensure               NUMBER(3),
  pay_type                 CHAR(1),
  charge_period            CHAR(1) not null,
  charge_year              NUMBER(3),
  coverage_period          CHAR(1) not null,
  coverage_year            NUMBER(5),
  short_end_time           DATE,
  except_value             NUMBER(10),
  benefit_level            VARCHAR2(20),
  housekeeper              CHAR(1),
  smoking                  CHAR(1),
  pay_rate                 NUMBER(4,3),
  insured_category         CHAR(1),
  insured_amount           NUMBER(10),
  start_pay                CHAR(1) default 'N' not null,
  retired_rate             NUMBER(4,3),
  decision_id              NUMBER(2) default 1 not null,
  pause_cause              NUMBER(2),
  gender_1                 CHAR(1) not null,
  gender_2                 CHAR(1),
  loan_status              CHAR(1) default '0' not null,
  update_time              DATE default SYSDATE not null,
  suspend                  CHAR(1) default 'N' not null,
  suspend_cause            NUMBER(2),
  next_period_prem         NUMBER(12,2) default 0 not null,
  next_discount_prem       NUMBER(12,2) default 0 not null,
  next_company_prem        NUMBER(12,2) default 0 not null,
  next_employee_prem       NUMBER(12,2) default 0 not null,
  next_normal_prem         NUMBER(12,2) default 0 not null,
  next_weak_prem           NUMBER(12,2) default 0 not null,
  next_job_prem            NUMBER(12,2) default 0 not null,
  next_disable_prem        NUMBER(12,2) default 0 not null,
  age_month                NUMBER(2) default 99 not null,
  related_month            NUMBER(2) default 99 not null,
  increase_rate            NUMBER(5,4) default 0 not null,
  increase_freq            CHAR(1) default '0' not null,
  increase_year            NUMBER(2) default 0 not null,
  house_related            CHAR(1) default 'W' not null,
  smoking_related          CHAR(1) default 'W' not null,
  pay_mode                 NUMBER(2) not null,
  yrt_prem                 NUMBER(12,2) default 0 not null,
  expiry_cash_value        NUMBER(14,2) default 0 not null,
  tax_prem                 NUMBER(12,2) default 0 not null,
  retired                  CHAR(1) default 'W' not null,
  simple_compound          CHAR(1) default '0' not null,
  loan_rate                NUMBER(5,4),
  count_way                CHAR(1) not null,
  discount_rate            NUMBER(8,6) default 1.00 not null,
  policy_prem              NUMBER(12,2) default 0 not null,
  policy_stand             NUMBER(12,2) default 0 not null,
  bank_code                VARCHAR2(20),
  bank_account             VARCHAR2(40),
  next_policy_prem         NUMBER(12,2) default 0 not null,
  next_tax_prem            NUMBER(12,2) default 0 not null,
  tax_prem_stand           NUMBER(12,2) default 0 not null,
  assign_way               VARCHAR2(1),
  assign_amount            NUMBER(12,2),
  assign_rate              NUMBER(4,3),
  fund_due_date            DATE not null,
  start_pay_date           DATE,
  renew_decision           VARCHAR2(1) default '1' not null,
  insert_time              DATE default SYSDATE not null,
  pay_change_time          DATE default SYSDATE not null,
  bonus_sa                 NUMBER(14,2) default 0 not null,
  policy_prem_waived       CHAR(1) default 'N' not null,
  policy_prem_source       VARCHAR2(1) not null,
  next_weak_stand          NUMBER(12,2) default 0 not null,
  next_job_stand           NUMBER(12,2) default 0 not null,
  next_disable_stand       NUMBER(12,2) default 0 not null,
  live_range               VARCHAR2(1) default '0' not null,
  move_range               VARCHAR2(1) default '0' not null,
  yrt_stand                NUMBER(12,2) default 0 not null,
  next_yrt_prem            NUMBER(12,2) default 0 not null,
  pay_next                 NUMBER(2) not null,
  latest_bonus_sa          NUMBER(14,2) default 0 not null,
  present_balance          NUMBER(10,2) default 0 not null,
  start_inst_date          DATE,
  origin_sa                NUMBER(14,2) default 0 not null,
  origin_bonus_sa          NUMBER(14,2) default 0 not null,
  anni_balance             NUMBER(14,4) default 0 not null,
  fix_increment            CHAR(1),
  cpf_cost                 NUMBER(13,3) default 0 not null,
  cash_cost                NUMBER(13,3) default 0 not null,
  derivation               CHAR(1) default '1' not null,
  lat_ori_bonus_sa         NUMBER(14,2) default 0 not null,
  bonus_due_date           DATE,
  risk_code                VARCHAR2(2),
  exposure_rate            NUMBER(4,3) default 1 not null,
  reins_rate               NUMBER(16,6) default 0 not null,
  start_pause_cause        NUMBER(2),
  start_end_cause          NUMBER(2),
  start_liab_state         NUMBER(2) default 1 not null,
  start_prem_status        NUMBER(2) default 1 not null,
  discount_tax             NUMBER(16,6) default 0 not null,
  next_discount_tax        NUMBER(16,6) default 0 not null,
  suspend_chg_id           NUMBER(10),
  tranche_code             VARCHAR2(2),
  mortality_rate           NUMBER(8,3) default 0 not null,
  medical_flag             CHAR(1) default 'N' not null,
  waiver_id                NUMBER(10),
  next_amount              NUMBER(14,2),
  waiver_start             DATE,
  waiver_end               DATE,
  weak_start               DATE,
  weak_end                 DATE,
  job_start                DATE,
  job_end                  DATE,
  disable_start            DATE,
  disable_end              DATE,
  auto_permnt_lapse        CHAR(1) default 'N' not null,
  permnt_lapse_notice_date DATE,
  combo_type               VARCHAR2(10),
  combo_unit               NUMBER(12,2),
  donative_amount          NUMBER(14,2),
  pkg_id                   NUMBER(7),
  charge_fee_rate          NUMBER(7,6),
  product_assumpsit        VARCHAR2(4000),
  rate_table_prem          NUMBER(12,2),
  actual_discount_rate     NUMBER(14,4),
  sub_end_cause            NUMBER(2),
  insurance_category       CHAR(1),
  insured_ride_type        NUMBER(2),
  vehicle_type             NUMBER(2),
  vehicle_license_num      VARCHAR2(20),
  vehicle_fram_num         VARCHAR2(20),
  vehicle_engine_num       VARCHAR2(20),
  carrying_passenger_num   NUMBER(10),
  surrfee_plan             NUMBER(2),
  annuity_transfered       CHAR(1) default 'N',
  draw_annuity_rate        NUMBER(5,4) default 0,
  loan_amount              NUMBER(14,2)
)
;
create table TAB_DAILY_CHECK_STATE
(
  process_state NUMBER(3) not null,
  info          VARCHAR2(1000)
)
;

create table TAB_DAILY_CHECK_LOG
(
  check_id           NUMBER(10) not null,
  request_id         NUMBER(10) not null,
  process_state      NUMBER(3) not null,
  bank_code          VARCHAR2(20),
  accept_date        DATE,
  process_end_time   DATE,
  process_start_time DATE,
  check_start_time   DATE,
  check_end_time     DATE,
  file_name          VARCHAR2(1000),
  file_content       BLOB,
  info               VARCHAR2(1000)
)
;

create table TAB_DAILY_CHECK_BANK
(
  check_id        NUMBER(10),
  check_bank_code VARCHAR2(20),
  bank_code       VARCHAR2(20),
  insert_time     DATE
)
;
create table TAB_DAILY_CHECK_DETAIL
(
  detail_id          NUMBER(10) not null,
  check_id           NUMBER(10),
  bank_code          VARCHAR2(20),
  apply_code         VARCHAR2(15) not null,
  policy_code        VARCHAR2(15),
  period_prem        NUMBER(12,2),
  need_process_state NUMBER(3) not null,
  process_state      NUMBER(3) not null,
  process_message    VARCHAR2(2000)
)
;
create table TAB_DAILY_EMAIL_CONFIG
(
  email_id           NUMBER(3) not null,
  usage              VARCHAR2(100),
  smtp_server        VARCHAR2(30),
  sender_address     VARCHAR2(30),
  sender_user_name   VARCHAR2(100),
  sender_passwd      VARCHAR2(30),
  normal_receivers   VARCHAR2(300),
  abnormal_receivers VARCHAR2(300)
)
;
create table TAB_DAILY_EMAIL_ORGAN_ADDRESS
(
  email_id           NUMBER(3) not null,
  branch_id          VARCHAR2(40) not null,
  normal_receivers   VARCHAR2(300),
  abnormal_receivers VARCHAR2(300)
)
;
create table TAB_DAILY_NONREALTIME_ICBC
(
  organ_id      VARCHAR2(40) not null,
  banknumber    VARCHAR2(2) default 01 not null,
  bank_code     VARCHAR2(40),
  trans_date    DATE,
  region_code   VARCHAR2(10) not null,
  internal_code VARCHAR2(10) not null,
  clerk_code    VARCHAR2(10) not null,
  tranno        VARCHAR2(40) not null,
  apply_code    VARCHAR2(20) not null,
  trans_channel CHAR(1) not null,
  process_state CHAR(1) not null,
  real_name     VARCHAR2(30) not null,
  certi_type    NUMBER(2) not null,
  certi_code    VARCHAR2(50) not null,
  bank_account  VARCHAR2(40) not null,
  state         CHAR(1)
)
;
create table TAB_DAILY_NONREALTIME_POLICY
(
  apply_code    VARCHAR2(20),
  branch_code   VARCHAR2(40) not null,
  bank_code     VARCHAR2(40) not null,
  organ_id      VARCHAR2(40) not null,
  real_name     VARCHAR2(100) not null,
  gender        CHAR(1) not null,
  certi_type    NUMBER(2) not null,
  certi_code    VARCHAR2(50) not null,
  product_id    NUMBER(10) not null,
  bank_account  VARCHAR2(40) not null,
  insert_time   DATE,
  update_time   DATE,
  p_state_id    NUMBER(5),
  process_state NUMBER(1) not null,
  internal_code VARCHAR2(10)
)
;
create table TAB_DAILY_PS_POLICY
(
  policy_code       VARCHAR2(20) not null,
  policy_print_code VARCHAR2(50),
  bank_code         VARCHAR2(40) not null,
  real_name         VARCHAR2(100) not null,
  certi_type        NUMBER(2) not null,
  certi_code        VARCHAR2(50) not null,
  bank_account      VARCHAR2(40) not null,
  fee_amount        NUMBER(12,2),
  get_amount        NUMBER(12,2),
  data_type         CHAR(2) not null,
  insert_time       DATE not null,
  update_time       DATE not null,
  process_state     NUMBER(1) not null,
  ps_state          NUMBER(5)
)
;
create table TAB_DAILY_RENEWAL_CHECK_DETAIL
(
  detail_id          NUMBER(10) not null,
  check_id           NUMBER(10),
  bank_code          VARCHAR2(20),
  apply_code         VARCHAR2(15) not null,
  policy_code        VARCHAR2(15),
  period_prem        NUMBER(12,2),
  need_process_state NUMBER(3) not null,
  process_state      NUMBER(3) not null,
  process_message    VARCHAR2(2000)
)
;
create table TAB_DAILY_RENEWAL_CHECK_LOG
(
  check_id           NUMBER(10) not null,
  request_id         NUMBER(10) not null,
  process_state      NUMBER(3) not null,
  bank_code          VARCHAR2(20),
  accept_date        DATE,
  process_end_time   DATE,
  process_start_time DATE,
  check_start_time   DATE,
  check_end_time     DATE,
  file_name          VARCHAR2(1000),
  file_content       BLOB,
  info               VARCHAR2(1000)
)
;
create table TAB_DAILY_RENEWAL_RECORD
(
  policy_id          VARCHAR2(20) not null,
  bank_code          VARCHAR2(20),
  apply_code         VARCHAR2(15) not null,
  policy_code        VARCHAR2(15),
  period_prem        NUMBER(12,2),
  need_process_state NUMBER(3) not null,
  process_state      NUMBER(3) not null,
  insert_time        DATE,
  update_time        DATE,
  process_message    VARCHAR2(2000)
)
;
create table TAB_DATE_FORMAT_CONFIG
(
  date_format NUMBER(3) not null,
  date_desc   VARCHAR2(1000)
)
;

create table TAB_DB_CONN_TYPE
(
  conn_type NUMBER(3) not null,
  conn_desc VARCHAR2(500)
)
;

create table TAB_DB_CONNECTION
(
  db_conn_id     NUMBER(3) not null,
  conn_type      NUMBER(3),
  db_conn_string VARCHAR2(500),
  db_conn_user   VARCHAR2(100),
  db_conn_pass   VARCHAR2(100),
  datasource     VARCHAR2(500),
  database       VARCHAR2(500),
  db_version     VARCHAR2(500),
  info           VARCHAR2(1000)
)
;
create table TAB_DISTRICT_BANK
(
  bank_code   VARCHAR2(20) not null,
  region_code VARCHAR2(10)
)
;
create table TAB_DOUBLE_RECORD_INFO
(
  id          NUMBER(10) not null,
  bank_code   VARCHAR2(15),
  send_code   VARCHAR2(15),
  policy_code VARCHAR2(15),
  real_name   VARCHAR2(60),
  certi_type  VARCHAR2(2),
  certi_code  VARCHAR2(20),
  insert_time DATE,
  update_time DATE,
  file_name   VARCHAR2(50),
  file_date   DATE,
  file_state  VARCHAR2(2) default 0    ---default 0 未上传  1已合并   2已上传 ftp,
  organ_id    VARCHAR2(10)
)
;
create table TAB_ERROR_INFO
(
  error_id    NUMBER(10),
  organ_id    NUMBER(10),
  error_info  VARCHAR2(200),
  insert_time DATE default sysdate,
  apply_code  VARCHAR2(20),
  request_id  NUMBER(10)
)
;
create table TAB_FILE_NAME_PART_CONFIG
(
  file_part_type NUMBER(3) not null,
  info           VARCHAR2(1000)
)
;

create table TAB_FILE_NAME_CONFIG
(
  file_name_id   NUMBER(10) not null,
  file_part_type NUMBER(3),
  date_format    NUMBER(3),
  info           VARCHAR2(1000),
  position       NUMBER(3)
)
;
create table TAB_GL_MIG_INF
(
  trans_id       NUMBER(20) not null,
  list_id        NUMBER(14),
  fee_id         NUMBER(12) not null,
  data_table     NUMBER(2),
  fee_type       NUMBER(3),
  pay_mode       NUMBER(2),
  currency_id    NUMBER(6),
  product_id     NUMBER(7),
  organ_id       VARCHAR2(40),
  policy_type    CHAR(1),
  policy_id      NUMBER(10),
  fee_status     NUMBER(2),
  fee_amount     NUMBER(12,2),
  finish_time    DATE,
  posted         CHAR(1),
  created_by     NUMBER(10),
  posting_id     NUMBER(10),
  filter1        VARCHAR2(25),
  filter2        VARCHAR2(25),
  filter3        VARCHAR2(40),
  filter4        VARCHAR2(25),
  filter5        VARCHAR2(25),
  filter6        VARCHAR2(25),
  filter7        VARCHAR2(25),
  filter8        VARCHAR2(25),
  filter9        VARCHAR2(25),
  filter10       VARCHAR2(25),
  seg_1          VARCHAR2(25),
  seg_2          VARCHAR2(25),
  seg_3          VARCHAR2(25),
  seg_4          VARCHAR2(25),
  seg_5          VARCHAR2(25),
  seg_6          VARCHAR2(25),
  seg_7          VARCHAR2(25),
  seg_8          VARCHAR2(25),
  seg_9          VARCHAR2(25),
  seg_10         VARCHAR2(25),
  grp_1          VARCHAR2(25),
  grp_2          VARCHAR2(25),
  grp_3          VARCHAR2(25),
  grp_4          VARCHAR2(25),
  grp_5          VARCHAR2(25),
  separate_organ CHAR(1)
)
;
create table TAB_GZRCB_POLICY_RATE
(
  send_code VARCHAR2(20) not null,
  rate      VARCHAR2(10)
)
;
create table TAB_HEALTH_JOB
(
  request_id  NUMBER(10) not null,
  apply_code  VARCHAR2(20) not null,
  insurant_id NUMBER(10) not null,
  health_info VARCHAR2(2),
  job_info    VARCHAR2(2),
  insert_time DATE
)
;
create table TAB_ICBC_NETSELL_POLICY
(
  send_code     VARCHAR2(20),
  icbc_no       VARCHAR2(40) not null,
  hold_date     DATE,
  insert_time   DATE,
  region_code   VARCHAR2(40),
  internal_code VARCHAR2(40),
  empoyee_code  VARCHAR2(40),
  empoyee_name  VARCHAR2(80)
)
;
create table TAB_ICBC_PRODUCTINFO
(
  bank_code      VARCHAR2(15),
  bank_productid VARCHAR2(5) not null,
  product_id     NUMBER(7),
  insert_time    DATE
)
;
create table TAB_INTERNET_CUSTOMER_INFO
(
  organ_id        VARCHAR2(7),
  organ_name      VARCHAR2(50),
  real_name       VARCHAR2(80),
  certi_type      VARCHAR2(2),
  certi_code      VARCHAR2(20),
  insert_time     DATE,
  hold_date       DATE,
  policy_code     VARCHAR2(15),
  status          VARCHAR2(1),
  user_id         VARCHAR2(100),
  image_file_code VARCHAR2(20)
)
;
create table TAB_KEY_MANAGE
(
  encrypt_key_id NUMBER(10) not null,
  bank_code      VARCHAR2(20) not null,
  encrypt_key    VARCHAR2(200) not null,
  insert_time    DATE not null
)
;
create table TAB_LOAN_INFO
(
  apply_code      VARCHAR2(20) not null,
  bank_code       VARCHAR2(20),
  loan_no         VARCHAR2(40),
  loan_invoice_no VARCHAR2(21),
  loan_start_date DATE,
  loan_end_date   DATE,
  insert_time     DATE not null,
  loan_amt        NUMBER(12,2)
)
;
create table TAB_MESSAGE_CODE
(
  message_code NUMBER(10) not null,
  message_cate NUMBER(2),
  message      VARCHAR2(2000)
)
;

create table TAB_MIDPLAT_MODULE
(
  module_id   NUMBER(10) not null,
  module_name VARCHAR2(100)
)
;

create table TAB_MIDPLAT_PROCESS_STATE
(
  state_id   NUMBER(3) not null,
  state_desc VARCHAR2(500) not null
)
;

create table TAB_MIDPLAT_SUBPROCESS_STATE
(
  state_id   NUMBER(3) not null,
  state_desc VARCHAR2(500) not null
)
;

create table TAB_MIG_FEE_TYPE
(
  type_id NUMBER(3) not null,
  migfee  CHAR(1)
)
;
create table TAB_NANJING_SENDBACK
(
  send_id     NUMBER(10) not null,
  create_time DATE,
  collect_pay CHAR(1),
  filename    VARCHAR2(30),
  state_id    CHAR(1),
  info        VARCHAR2(1000)
)
;

create table TAB_ORGAN_RATE
(
  organ_id    VARCHAR2(10) not null,
  organ_rate  NUMBER(3,2),
  insert_time DATE,
  update_time DATE
)
;
create table TAB_PAY_FEE_MIG_LOG
(
  migration_id     NUMBER(10) not null,
  fee_id           NUMBER(12) not null,
  fee_amount       NUMBER(14,2) not null,
  money_id         NUMBER(6) not null,
  fee_status       NUMBER(2) not null,
  fee_type         NUMBER(3) not null,
  pay_mode         NUMBER(2) not null,
  insured_id       NUMBER(10),
  policy_id        NUMBER(10) not null,
  product_num      CHAR(3) not null,
  insured_1        NUMBER(10),
  product_id       NUMBER(10) not null,
  head_id          VARCHAR2(40) not null,
  branch_id        VARCHAR2(40) not null,
  dept_id          VARCHAR2(20) not null,
  organ_id         VARCHAR2(40),
  cashier_id       NUMBER(10),
  cashier_organ    VARCHAR2(40),
  cashier_dept     VARCHAR2(20),
  check_enter_time DATE,
  finish_time      DATE,
  posted           CHAR(1) default 'N' not null,
  post_id          NUMBER(10),
  cred_id          NUMBER(10),
  insert_time      DATE default SYSDATE not null,
  change_id        NUMBER(10),
  case_id          NUMBER(10),
  bill_id          NUMBER(10),
  ins_type         CHAR(1) not null,
  policy_type      CHAR(1) not null,
  benefit_type     VARCHAR2(2) not null,
  busi_type        CHAR(1) not null,
  period_type      CHAR(1) not null,
  target_type      CHAR(1) not null,
  item_id          NUMBER(10),
  liab_id          NUMBER(4) not null,
  pay_due_date     DATE not null,
  auth_draw        NUMBER(2) not null,
  pay_num          NUMBER(6) not null,
  plan_id          NUMBER(10),
  payable_id       NUMBER(10),
  assignee_id      NUMBER(10),
  due_id           NUMBER(10),
  payee_id         NUMBER(10),
  additional_prem  NUMBER(10,2) default 0 not null,
  repay_loan       NUMBER(10,2) default 0 not null,
  repay_prem       NUMBER(10,2) default 0 not null,
  policy_year      NUMBER(4) default 0 not null,
  product_fee_id   NUMBER(14),
  list_id          NUMBER(14),
  related_id       NUMBER(12),
  circ_audited     CHAR(1) default 'N' not null
)
;
create table TAB_PREMIUM_COLLECTION
(
  collection_id   NUMBER(10),
  organ_id        VARCHAR2(40),
  bank_code       VARCHAR2(20),
  start_date      DATE,
  end_date        DATE,
  total_amount    NUMBER(14,2),
  collection_date DATE,
  collector       VARCHAR2(30)
)
;
create table TAB_POLICY_COLLECTION_STATUS
(
  policy_id         NUMBER(10),
  collection_status NUMBER(1),
  collection_id     NUMBER(10)
)
;
create table TAB_POLICY_FEE_MIG_LOG
(
  migration_id        NUMBER(10) not null,
  fee_id              NUMBER(12) not null,
  head_id             VARCHAR2(40) not null,
  branch_id           VARCHAR2(40) not null,
  organ_id            VARCHAR2(40) not null,
  policy_id           NUMBER(10),
  send_code           VARCHAR2(20),
  receipt_code        VARCHAR2(200),
  fee_amount          NUMBER(12,2) default 0 not null,
  pay_mode            NUMBER(2) not null,
  bank_account        VARCHAR2(40),
  fee_type            NUMBER(3) not null,
  fee_status          NUMBER(2) default 0 not null,
  match_result        CHAR(1) default '0' not null,
  finish_time         DATE,
  cashier_id          NUMBER(10),
  insert_time         DATE default SYSDATE not null,
  formal_receipt      VARCHAR2(200),
  transfer_file       CHAR(1) default 'N' not null,
  cheque_code         VARCHAR2(40),
  cred_id             NUMBER(10),
  settle_flag         CHAR(1) default 0 not null,
  posted              CHAR(1) default 'N' not null,
  return_check_status CHAR(1),
  check_enter_time    DATE,
  change_id           NUMBER(10),
  policy_type         CHAR(1) not null,
  record_time         DATE,
  dept_id             VARCHAR2(20) not null,
  agent_id            NUMBER(10) not null,
  money_id            NUMBER(6) not null,
  pay_way             VARCHAR2(2) default 0 not null,
  post_id             NUMBER(10),
  bank_code           VARCHAR2(20),
  agency_code         VARCHAR2(20),
  agency_hand         NUMBER(10),
  cancel_date         DATE,
  cancel_id           NUMBER(10),
  settle_id           NUMBER(10),
  settle_time         DATE,
  finish_id           NUMBER(10),
  bill_id             NUMBER(10),
  case_id             NUMBER(10),
  prem_id             NUMBER(12),
  payable_id          NUMBER(12),
  print_num           NUMBER(4) default 0 not null,
  insured_id          NUMBER(10),
  receiv_status       CHAR(1) default '0' not null,
  company_fee         NUMBER(12,2) not null,
  employee_fee        NUMBER(12,2) not null,
  policy_year         NUMBER(2),
  policy_period       NUMBER(4),
  entry_code          VARCHAR2(30),
  pay_money_id        NUMBER(6) not null,
  pay_amount          NUMBER(12,2) not null,
  new_account         VARCHAR2(40),
  check_desc          VARCHAR2(500),
  send_id             NUMBER(10),
  received_time       DATE,
  new_bank            VARCHAR2(20),
  account_operator    NUMBER(10),
  account_checker     NUMBER(10),
  transfer_num        NUMBER(4) default 0 not null,
  payee_name          VARCHAR2(100),
  payee_address_1     VARCHAR2(150),
  payee_address_2     VARCHAR2(100),
  payee_address_3     VARCHAR2(100),
  payee_address_4     VARCHAR2(100),
  payee_zip           VARCHAR2(10),
  payee_certi_type    NUMBER(2),
  payee_certi_code    VARCHAR2(30),
  cheque_type         VARCHAR2(2),
  cheque_date         DATE,
  cash_bank           VARCHAR2(20),
  cash_account        VARCHAR2(40),
  profit_loss         NUMBER(10,2) default 0 not null,
  total_cpf_refund    NUMBER(10,2) default 0 not null,
  withdraw_type       VARCHAR2(2),
  advance_pay_id      NUMBER(12),
  premium_paid        NUMBER(10,2) default 0 not null,
  related_id          NUMBER(12),
  payment_id          NUMBER(10),
  pay_balance         NUMBER(16,6) default 0 not null,
  detail_id           NUMBER(10),
  update_time         DATE default SYSDATE not null,
  reversal_id         NUMBER(10),
  trans_chg_id        NUMBER(10),
  auth_id             NUMBER(10),
  circ_audited        CHAR(1) default 'N' not null,
  print_advance_num   NUMBER(4) default 0 not null
)
;
create table TAB_POLICY_MIGRATION
(
  policy_id          NUMBER(10) not null,
  change_id          NUMBER(10) not null,
  old_organ_id       VARCHAR2(40) not null,
  new_organ_id       VARCHAR2(40) not null,
  old_dept_id        VARCHAR2(20) not null,
  new_dept_id        VARCHAR2(20) not null,
  agent_id           NUMBER(10) not null,
  migration_id       VARCHAR2(40) not null,
  migration_date     DATE not null,
  is_cross_fi_ind    CHAR(1) not null,
  reserve_fee_posted CHAR(1) not null
)
;
create table TAB_POLICY_MIG_RESERVE_INF
(
  policy_code          VARCHAR2(40) not null,
  insured_num          NUMBER(10) not null,
  internal_id          VARCHAR2(10) not null,
  product_name         VARCHAR2(100) not null,
  insured_real_name    VARCHAR2(100) not null,
  insured_1_certi_code VARCHAR2(50) not null,
  company_name         VARCHAR2(100) not null,
  organ_id             VARCHAR2(40) not null,
  mig_company_name     VARCHAR2(100) not null,
  mig_organ_id         VARCHAR2(40) not null,
  migration_date       DATE not null,
  product_num          CHAR(3) not null
)
;
create table TAB_POLICY_MIG_RESERVE_INF_BAK
(
  policy_code          VARCHAR2(40) not null,
  insured_num          NUMBER(10) not null,
  internal_id          VARCHAR2(10) not null,
  product_name         VARCHAR2(100) not null,
  insured_real_name    VARCHAR2(100) not null,
  insured_1_certi_code VARCHAR2(50) not null,
  company_name         VARCHAR2(100) not null,
  organ_id             VARCHAR2(40) not null,
  mig_company_name     VARCHAR2(100) not null,
  mig_organ_id         VARCHAR2(40) not null,
  migration_date       DATE not null,
  product_num          CHAR(3) not null
)
;
create table TAB_POL_MIG_RESERVE_FEE
(
  policy_code          VARCHAR2(40) not null,
  insured_num          NUMBER(10) not null,
  internal_id          VARCHAR2(10) not null,
  product_name         VARCHAR2(100) not null,
  insured_real_name    VARCHAR2(100) not null,
  insured_1_certi_code VARCHAR2(50) not null,
  company_name         VARCHAR2(100) not null,
  organ_id             VARCHAR2(40) not null,
  mig_company_name     VARCHAR2(100) not null,
  mig_organ_id         VARCHAR2(40) not null,
  migration_date       DATE not null,
  product_num          CHAR(3) not null,
  fee_amount           NUMBER(12,2),
  migration_id         NUMBER(10),
  posted               CHAR(1),
  fee_id               NUMBER(12),
  change_id            NUMBER(10)
)
;
create table TAB_POST_DATAFILE_FIX
(
  policy_code     VARCHAR2(20) not null,
  bank_code       VARCHAR2(20) not null,
  request_date    DATE,
  data_type       CHAR(1),
  fee_amount      NUMBER(12,2),
  state           CHAR(1),
  hesitation_flag CHAR(1),
  success_flag    CHAR(1),
  fail_desc       VARCHAR2(100),
  insert_time     DATE default sysdate,
  update_time     DATE default sysdate,
  user_id         VARCHAR2(30),
  organ_id        VARCHAR2(10)
)
;
create table TAB_POST_DATAFILE_LOG
(
  serialnum          NUMBER(10) not null,
  requestdate        DATE not null,
  filetype           VARCHAR2(10) not null,
  filename           VARCHAR2(50),
  process_end_time   DATE,
  process_start_time DATE,
  process_state      NUMBER(3) not null,
  info               VARCHAR2(1000),
  bankprefix         VARCHAR2(20),
  sendid             VARCHAR2(20)
)
;
create table TAB_POST_NONREALTIME_INFO
(
  exttransid  VARCHAR2(30) not null,
  apply_code  VARCHAR2(15) not null,
  product_id  VARCHAR2(10),
  amount      NUMBER(12,2),
  status      VARCHAR2(2),
  real_name   VARCHAR2(80),
  certitype   VARCHAR2(2),
  certicode   VARCHAR2(20),
  salecode    VARCHAR2(20),
  insert_time DATE,
  update_time DATE
)
;
create table TAB_PRODUCT_CHANNEL_RULE
(
  product_id NUMBER(7) not null,
  bank_code  VARCHAR2(20),
  organ_id   VARCHAR2(10),
  max_amount NUMBER(10)
)
;
create table TAB_PRODUCT_CHARGE_RATE
(
  product_id      NUMBER(7),
  organ_id        VARCHAR2(40),
  charge_fee_rate NUMBER(8,6),
  update_time     DATE,
  operator        VARCHAR2(30),
  bank_code       VARCHAR2(20)
)
;
create table TAB_PRODUCT_CHARGE_RATE_NEW
(
  product_id      NUMBER(7) not null,
  organ_id        VARCHAR2(40) not null,
  max_amt         NUMBER(10) not null,
  charge_fee_rate NUMBER(9,6),
  update_time     DATE,
  operator        VARCHAR2(30),
  bank_code       VARCHAR2(20) not null
)
;
create table TAB_PRODUCT_CONTROLL_ORGAN
(
  controll_id NUMBER(10) not null,
  bank_code   VARCHAR2(20),
  organ_id    VARCHAR2(10) not null,
  product_id  NUMBER(7),
  sell_way    VARCHAR2(2),
  is_sale     VARCHAR2(1),
  update_time DATE default sysdate,
  insert_time DATE default sysdate,
  user_id     VARCHAR2(100)
)
;
create table TAB_PRODUCT_COVERT
(
  bank_code   VARCHAR2(20) not null,
  branch_id   VARCHAR2(40) not null,
  product_id  NUMBER(7) not null,
  external_id NUMBER(7) not null,
  issue_way   NUMBER(10) not null,
  insert_time DATE
)
;
create table TAB_PRODUCT_FEE_MIG_LOG
(
  migration_id       NUMBER(10) not null,
  list_id            NUMBER(14) not null,
  fee_id             NUMBER(12) not null,
  product_id         NUMBER(10) not null,
  product_num        CHAR(3) not null,
  period_prem        NUMBER(12,2) not null,
  charge_type        CHAR(1) default '0' not null,
  policy_year        NUMBER(2) not null,
  policy_period      NUMBER(4) not null,
  agent_id           NUMBER(10) not null,
  insert_time        DATE default SYSDATE not null,
  normal_prem        NUMBER(12,2) not null,
  weak_prem          NUMBER(12,2) default 0 not null,
  job_prem           NUMBER(12,2) default 0 not null,
  disable_prem       NUMBER(12,2) default 0 not null,
  basic_id           NUMBER(10),
  premium_year       NUMBER(3) not null,
  normal_stand       NUMBER(12,2) default 0 not null,
  weak_stand         NUMBER(12,2) default 0 not null,
  job_stand          NUMBER(12,2) default 0 not null,
  disable_stand      NUMBER(12,2) default 0 not null,
  insured_1          NUMBER(10),
  policy_id          NUMBER(10) not null,
  head_id            VARCHAR2(40) not null,
  branch_id          VARCHAR2(40) not null,
  organ_id           VARCHAR2(40) not null,
  dept_id            VARCHAR2(20) not null,
  agency_code        VARCHAR2(20),
  agency_hand        NUMBER(10),
  policy_type        CHAR(1) not null,
  benefit_type       VARCHAR2(2) not null,
  busi_type          CHAR(1) not null,
  period_type        CHAR(1) not null,
  fee_type           NUMBER(3) not null,
  pay_way            VARCHAR2(2) default 0 not null,
  pay_mode           NUMBER(2) not null,
  money_id           NUMBER(6) not null,
  check_enter_time   DATE,
  finish_time        DATE,
  cashier_id         NUMBER(10),
  change_id          NUMBER(10),
  case_id            NUMBER(10),
  due_time           DATE,
  period             NUMBER(4) not null,
  stand_prem         NUMBER(10,2) default 0 not null,
  yrt_prem           NUMBER(12,2) default 0 not null,
  tax_prem           NUMBER(12,2) default 0 not null,
  policy_prem        NUMBER(12,2) default 0 not null,
  discount_rate      NUMBER(8,6) default 1.00 not null,
  company_fee        NUMBER(12,2) not null,
  employee_fee       NUMBER(12,2) not null,
  policy_prem_source VARCHAR2(1) not null,
  sa_accum           CHAR(1) default '0' not null,
  yrt_stand          NUMBER(12,2) default 0 not null,
  tax_prem_stand     NUMBER(12,2) default 0 not null,
  policy_stand       NUMBER(12,2) default 0 not null,
  sell_way           VARCHAR2(2) not null,
  derivation         CHAR(1) not null,
  present_prem       NUMBER(10,2) default 0 not null,
  profit_loss        NUMBER(10,2) default 0 not null,
  discount_tax       NUMBER(16,6) default 0 not null,
  update_time        DATE default SYSDATE not null,
  reversal_id        NUMBER(10),
  related_id         NUMBER(12),
  trans_chg_id       NUMBER(10),
  commision          NUMBER(2),
  holder_stand_prem  NUMBER(10,2) default 0,
  old_stand_prem     NUMBER(10,2) default 0 not null,
  circ_audited       CHAR(1) default 'N' not null
)
;
create table TAB_PRODUCT_FEE_RATE
(
  bank_code   VARCHAR2(20) not null,
  product_id  NUMBER(7) not null,
  max_year    NUMBER(10) not null,
  fee_rate    NUMBER(9,6),
  update_time DATE,
  operator    VARCHAR2(30)
)
;
create table TAB_PRODUCT_JUDGE
(
  judge_type      VARCHAR2(40) not null,
  judge_product   VARCHAR2(200) not null,
  use_sys         VARCHAR2(2),
  judge_type_info VARCHAR2(40)
)
;
create table TAB_PRODUCT_RULE
(
  product_id     NUMBER(7) not null,
  rule_file_name VARCHAR2(200),
  max_amount     NUMBER(10)
)
;
create table TAB_PRODUCT_WAITPERIOD_RATE
(
  product_id   NUMBER(7),
  organ_id     VARCHAR2(40),
  wait_period  NUMBER(7),
  update_time  DATE,
  operator     VARCHAR2(30),
  bank_code    VARCHAR2(20),
  except_value VARCHAR2(30),
  pay_rtate    NUMBER(4,3)
)
;
create table TAB_PROD_PKG_PLAN
(
  plan_id     NUMBER(7) not null,
  plan_code   VARCHAR2(40) not null,
  plan_nane   VARCHAR2(40) not null,
  total_prem  NUMBER(12,2),
  card_id     NUMBER(10),
  is_legal    CHAR(1) default 'N',
  insert_time DATE default sysdate
)
;
create table TAB_PROD_PKG_PLAN_LIST
(
  list_id            NUMBER(10) not null,
  plan_id            NUMBER(7) not null,
  product_num        NUMBER(3) not null,
  product_id         NUMBER(7) not null,
  prem_count_way     CHAR(1),
  sa                 NUMBER(14,2),
  unit               NUMBER(8,4),
  benefit_leve       VARCHAR2(20),
  amout              NUMBER(12,2),
  premium            NUMBER(12,2),
  charge_period      CHAR(1),
  charge_year        NUMBER(3),
  coverage_period    CHAR(1),
  coverage_year      NUMBER(5),
  charge_type        CHAR(1),
  except_value       NUMBER(10),
  pay_rate           NUMBER(4,2),
  elimination_period NUMBER(5),
  travel_type        CHAR(1)
)
;

create table TAB_QUERY_LOG
(
  query_id      NUMBER(10),
  user_id       VARCHAR2(30),
  exec_time     DATE,
  sql_statement VARCHAR2(1000)
)
;
create table TAB_REPORT_TEMPLATE
(
  report_id       NUMBER(7),
  report_desc     VARCHAR2(100),
  report_template VARCHAR2(200)
)
;
create table TAB_RISKCODE_COVERT
(
  bank_code   VARCHAR2(20) not null,
  branch_id   VARCHAR2(40) not null,
  product_id  NUMBER(7) not null,
  external_id NUMBER(7) not null,
  issue_way   NUMBER(10) not null,
  insert_time DATE,
  sell_way    VARCHAR2(2) not null
)
;
create table TAB_SEQUENCE_CONVERTION
(
  bank_code   VARCHAR2(20),
  external_id NUMBER(30),
  request_id  NUMBER(10)
)
;
create table TAB_SERVICE_DBCONN_CONFIG
(
  service_id NUMBER(3) not null,
  db_conn_id NUMBER(3) not null,
  info       VARCHAR2(1000)
)
;
create table TAB_SERVICE_PROCESS_DETAIL
(
  request_detail_id NUMBER(10) not null,
  request_id        NUMBER(10),
  service_id        NUMBER(10),
  state_id          NUMBER(3),
  module_id         NUMBER(10),
  start_time        DATE,
  end_time          DATE,
  info              VARCHAR2(1000)
)
;
create table TAB_SERVICE_PROCESS_LOG
(
  request_id           NUMBER(10) not null,
  service_id           NUMBER(10),
  state_id             NUMBER(3),
  apply_code           VARCHAR2(20),
  policy_code          VARCHAR2(20),
  organ_id             VARCHAR2(40),
  policy_print_no      VARCHAR2(20),
  bank_operator        NUMBER(10),
  ps_code              VARCHAR2(15),
  bank_code            VARCHAR2(20),
  ps_print_code        VARCHAR2(15),
  client_ip            VARCHAR2(50),
  client_port          VARCHAR2(50),
  issue_way            NUMBER(10),
  request_time         DATE,
  trans_start_time     DATE,
  service_start_time   DATE,
  service_end_time     DATE,
  response_convert_txt BLOB,
  response_orign_txt   BLOB,
  request_covert_txt   BLOB,
  request_orign_txt    BLOB,
  info                 VARCHAR2(1000)
)

create table TAB_SERVICE_PROVIDER_PARA
(
  service_id    NUMBER(10) not null,
  para_name     VARCHAR2(100) not null,
  para_type     VARCHAR2(100) not null,
  para_position NUMBER(3) not null
)
;
comment on column TAB_SERVICE_PROVIDER_PARA.para_type
  is '参数类型
值为 date,int,number,string,';
create table TAB_SMS_MOBILE_WHITELIST
(
  mobile_number NUMBER(11) not null
)
;
create table TAB_SPDB_POLICY
(
  send_code     VARCHAR2(20) not null,
  hold_date     DATE not null,
  organ_id      VARCHAR2(40),
  company_name  VARCHAR2(100),
  bank_code     VARCHAR2(20),
  bank_name     VARCHAR2(100),
  hold_name     VARCHAR2(100),
  product_id    NUMBER(7),
  product_abbr  VARCHAR2(70),
  period_prem   NUMBER(12,2),
  charge_year   NUMBER(3),
  coverage_year NUMBER(3),
  p_state_id    NUMBER(3),
  p_state       VARCHAR2(100),
  agent_name    VARCHAR2(100),
  bank_emp_name VARCHAR2(100),
  agent_id      NUMBER(10)
)
;
create table TAB_SPDB_SENDBACK
(
  serialnum          NUMBER(10) not null,
  sendid             VARCHAR2(20) not null,
  requestdate        VARCHAR2(8) not null,
  filetype           VARCHAR2(10) not null,
  sendfile           VARCHAR2(50),
  backfile           VARCHAR2(50),
  process_start_time DATE,
  process_end_time   DATE,
  process_state      NUMBER(3) not null,
  info               VARCHAR2(1000)
)
;
create table TAB_SPD_CUSTOM_SIGN
(
  sign_num     VARCHAR2(16),
  apply_code   VARCHAR2(20) not null,
  bank_account VARCHAR2(20),
  bank_name    VARCHAR2(22),
  certi_type   NUMBER(1),
  certi_code   VARCHAR2(20),
  cur_flag     NUMBER(1),
  is_bank_cust NUMBER(1),
  insert_time  DATE default sysdate not null,
  update_time  DATE default sysdate not null,
  back_deal    NUMBER(1) default 0,
  error_info   VARCHAR2(160),
  error_code   VARCHAR2(20),
  request_date VARCHAR2(20)
)
;
create table TAB_TEST
(
  owner          VARCHAR2(30),
  object_name    VARCHAR2(128),
  subobject_name VARCHAR2(30),
  object_id      NUMBER,
  data_object_id NUMBER,
  object_type    VARCHAR2(19),
  created        DATE,
  last_ddl_time  DATE,
  timestamp      VARCHAR2(19),
  status         VARCHAR2(7),
  temporary      VARCHAR2(1),
  generated      VARCHAR2(1),
  secondary      VARCHAR2(1),
  namespace      NUMBER,
  edition_name   VARCHAR2(30)
)
;
create table TAB_TRANSFER_ORGAN_CONFIG
(
  parent_table     VARCHAR2(30) not null,
  child_table      VARCHAR2(30) not null,
  condition_column VARCHAR2(30) not null,
  target_column    VARCHAR2(30) not null,
  state            NUMBER(1)
)
;
create table TAB_TRANSFER_ORGAN_LOG
(
  transfer_id    NUMBER(10) not null,
  dept_id        VARCHAR2(20) not null,
  old_organ      VARCHAR2(30) not null,
  new_organ      VARCHAR2(30) not null,
  operator       VARCHAR2(20) not null,
  start_time     DATE,
  finish_time    DATE,
  result_code    NUMBER(1),
  result_message VARCHAR2(50)
)
;
create table TAB_TRANS_DIRECTION
(
  direct_id   NUMBER(10) not null,
  direct_name VARCHAR2(100)
)
;

create table TAB_TRANS_TYPE
(
  trans_type NUMBER(10) not null,
  trans_name VARCHAR2(100)
)
;

create table TAB_TRANS_IMPL
(
  trans_impl_id NUMBER(10) not null,
  trans_type    NUMBER(10),
  trans_name    VARCHAR2(100),
  info          VARCHAR2(1000)
)
;

create table TAB_TRANS_CONFIG
(
  direct_id     NUMBER(10) not null,
  bank_code     VARCHAR2(20) not null,
  issue_way     NUMBER(10),
  service_id    NUMBER(3) not null,
  trans_impl_id NUMBER(10) not null,
  info          VARCHAR2(100)
)
;
create table TAB_UW_FAIL_PROCESS_TYPE
(
  code      NUMBER(1) not null,
  code_desc VARCHAR2(100) not null
)
;

create table TAB_UW_RULE
(
  rule_code         NUMBER(10) not null,
  rule              VARCHAR2(2000),
  rule_desc         VARCHAR2(2000),
  rule_type         VARCHAR2(1),
  rule_function     VARCHAR2(2000),
  rule_fail_process NUMBER(1),
  is_check          VARCHAR2(1),
  need_config       VARCHAR2(1),
  organ_rela        VARCHAR2(1),
  para_count        NUMBER(2),
  product_rela      VARCHAR2(1)
)
;

create table TAB_UW_RULE_CONFIG
(
  rule_config_id NUMBER(10) not null,
  rule_id        NUMBER(10),
  organ_id       VARCHAR2(40),
  product_id     NUMBER(7),
  is_check       VARCHAR2(1) not null,
  fill_1         VARCHAR2(1000),
  fill_comment_1 VARCHAR2(1000),
  fill_2         VARCHAR2(1000),
  fill_comment_2 VARCHAR2(1000),
  fill_3         VARCHAR2(1000),
  fill_comment_3 VARCHAR2(1000),
  fill_4         VARCHAR2(1000),
  fill_comment_4 VARCHAR2(1000),
  fill_5         VARCHAR2(1000),
  fill_comment_5 VARCHAR2(1000),
  fill_6         VARCHAR2(1000),
  fill_comment_6 VARCHAR2(1000),
  fill_7         VARCHAR2(1000),
  fill_comment_7 VARCHAR2(1000),
  fill_8         VARCHAR2(1000),
  fill_comment_8 VARCHAR2(1000),
  fill_9         VARCHAR2(1000),
  fill_comment_9 VARCHAR2(1000)
)
;
create table TDD_EVENTCODE_CFG
(
  event_code        VARCHAR2(50) not null,
  proc_name         VARCHAR2(500) not null,
  insert_time       DATE not null,
  update_time       DATE,
  para_1            VARCHAR2(50),
  para_2            VARCHAR2(50),
  para_3            VARCHAR2(50),
  para_4            VARCHAR2(50),
  para_5            VARCHAR2(50),
  para_6            VARCHAR2(50),
  para_7            VARCHAR2(50),
  para_8            VARCHAR2(50),
  query_para_script VARCHAR2(4000)
)
;
create table T_BLOB
(
  blob_id     NUMBER(12) not null,
  content     BLOB,
  create_date DATE default SYSDATE not null
)

create table TDD_FILE
(
  file_id     NUMBER not null,
  content     BLOB,
  blob_id     NUMBER,
  create_time DATE not null,
  check_str   VARCHAR2(32),
  txt_content VARCHAR2(4000)
)
;
create table TDD_FUNCTION_CONFIG
(
  tdd_type   NUMBER not null,
  tdd_style  NUMBER not null,
  event_code VARCHAR2(50),
  need_run   VARCHAR2(1) default 'N' not null,
  start_date DATE not null,
  end_date   DATE not null
)
;
create table TDD_STANDARD
(
  policy_id    NUMBER not null,
  tdd_style    NUMBER not null,
  tdd_type     NUMBER not null,
  task_id      NUMBER,
  finish_time  DATE,
  status       VARCHAR2(1) default 'N',
  event_code   VARCHAR2(50),
  change_id    NUMBER,
  case_id      NUMBER,
  fee_id       NUMBER,
  prem_id      NUMBER,
  para_value_1 VARCHAR2(200),
  para_value_2 VARCHAR2(200),
  para_value_3 VARCHAR2(200),
  para_value_4 VARCHAR2(200),
  applicant_id NUMBER(10),
  insert_time  DATE
)
;
create table TDD_TASK_LIST
(
  task_id      NUMBER not null,
  policy_id    NUMBER not null,
  insert_time  DATE not null,
  result       NUMBER,
  event_code   VARCHAR2(50),
  change_id    NUMBER,
  case_id      NUMBER,
  fee_id       NUMBER,
  prem_id      NUMBER,
  para_value_1 VARCHAR2(200),
  para_value_2 VARCHAR2(200),
  para_value_3 VARCHAR2(200),
  para_value_4 VARCHAR2(200),
  applicant_id NUMBER(10),
  tdd_style    NUMBER,
  tdd_type     NUMBER
)
;
create table TEMP_FILE_CODE
(
  file_code VARCHAR2(20)
)
;
create table TEMP_ORGAN_DL1
(
  new_organ VARCHAR2(20),
  new_dept  VARCHAR2(30),
  old_organ VARCHAR2(20),
  old_dept  VARCHAR2(30) not null,
  finished  CHAR(1) default 'N'
)
;
create table TEMP_ORGAN_DL2
(
  new_organ VARCHAR2(20),
  new_dept  VARCHAR2(30),
  old_organ VARCHAR2(20),
  old_dept  VARCHAR2(30) not null,
  finished  CHAR(1) default 'N'
)
;
create table TEMP_ORGAN_ZJ1
(
  new_organ VARCHAR2(20),
  new_dept  VARCHAR2(30),
  old_organ VARCHAR2(20),
  old_dept  VARCHAR2(30) not null,
  finished  CHAR(1) default 'N'
)
;
create table TEMP_ORGAN_ZJ2
(
  new_organ VARCHAR2(20),
  new_dept  VARCHAR2(30),
  old_organ VARCHAR2(20),
  old_dept  VARCHAR2(30) not null,
  finished  CHAR(1) default 'N'
)
;
create table TEMP_T_AGENT
(
  agent_id                 NUMBER(10) not null,
  real_name                VARCHAR2(40) not null,
  user_name                VARCHAR2(30),
  password                 VARCHAR2(32),
  gender                   CHAR(1),
  birthday                 DATE,
  certi_type               NUMBER(2),
  certi_code               VARCHAR2(50),
  agent_code               VARCHAR2(20) not null,
  password_change          DATE,
  organ_id                 VARCHAR2(40) not null,
  head_id                  VARCHAR2(40) not null,
  branch_id                VARCHAR2(40) not null,
  user_status              CHAR(1),
  dept_id                  VARCHAR2(20) not null,
  political_id             VARCHAR2(2),
  education_id             VARCHAR2(2),
  foreign_lang_id          VARCHAR2(3),
  foreign_level_id         VARCHAR2(2),
  compute_level            VARCHAR2(2),
  instructor_grade_id      VARCHAR2(2),
  begin_job_date           DATE,
  technical_post           VARCHAR2(50),
  native_place             VARCHAR2(5),
  register_address         VARCHAR2(100),
  family_address           VARCHAR2(100),
  address_area             VARCHAR2(50),
  telephone                VARCHAR2(30),
  old_job_unit             VARCHAR2(100),
  old_job_id               VARCHAR2(10),
  bp                       VARCHAR2(50),
  celler_tel               VARCHAR2(50),
  email                    VARCHAR2(50),
  address                  VARCHAR2(100),
  marriage_id              CHAR(1),
  special_favor            VARCHAR2(50),
  cautioner1_name          VARCHAR2(40),
  cautioner1_certi_type    NUMBER(2),
  cautioner1_certi_code    VARCHAR2(50),
  cautioner1_unit          VARCHAR2(100),
  cautioner2_name          VARCHAR2(40),
  cautioner2_certi_type    NUMBER(2),
  cautioner2_certi_code    VARCHAR2(50),
  cautioner2_unit          VARCHAR2(100),
  train_man_id             NUMBER(10),
  recommend_man_id         NUMBER(10),
  grade_id                 VARCHAR2(3),
  quality_grade_id         NUMBER(3),
  qualification_id         VARCHAR2(20),
  practice_id              VARCHAR2(50),
  invest_connect_id        VARCHAR2(20),
  other_certificate_id     VARCHAR2(20),
  enter_company_date       DATE,
  leave_company_date       DATE,
  agent_status             NUMBER(2) not null,
  update_time              DATE,
  updater_id               NUMBER(10),
  probation_date           DATE,
  turn_date                DATE,
  zip                      VARCHAR2(6),
  agent_cate               VARCHAR2(1) not null,
  sign_date                DATE,
  end_date                 DATE,
  g_business_cate          NUMBER(2) not null,
  g_grade_id               NUMBER(2),
  g_position_id            NUMBER(2),
  is_charge                NUMBER(1) not null,
  comm_account             VARCHAR2(40),
  prem_account             VARCHAR2(40),
  business_cate            NUMBER(2),
  dept_train_id            NUMBER(10),
  area_train_id            NUMBER(10),
  group_train_date         DATE,
  dept_train_date          DATE,
  area_train_date          DATE,
  nation_code              VARCHAR2(2),
  indirect_train_id        NUMBER(10),
  ind_dept_train_id        NUMBER(10),
  comm_bank_code           VARCHAR2(20),
  prem_bank_code           VARCHAR2(20),
  b_grade_id               VARCHAR2(3),
  b_instructor_id          VARCHAR2(3),
  b_technical_post         VARCHAR2(3),
  finance_post_id          VARCHAR2(3),
  b_grade_num              NUMBER(3),
  reenter_flag             CHAR(1) not null,
  position_id              VARCHAR2(3),
  sell_grade               NUMBER(3),
  leave_cause              VARCHAR2(6),
  leave_target             NUMBER(3),
  c_grade_id               VARCHAR2(3),
  is_mdrt                  CHAR(1),
  union_code               VARCHAR2(10),
  is_adp2                  CHAR(1),
  adp2_date                DATE,
  isc_num                  NUMBER(2) not null,
  insert_time              DATE not null,
  address_2                VARCHAR2(100),
  address_3                VARCHAR2(100),
  address_4                VARCHAR2(100),
  spouse_name              VARCHAR2(40),
  spouse_certi_code        VARCHAR2(50),
  citizen_type             VARCHAR2(6),
  docfpcap                 CHAR(1),
  comm_ibg_code            VARCHAR2(30),
  source_code              VARCHAR2(30),
  letter_status            VARCHAR2(1),
  credit_code              VARCHAR2(20),
  credit_period            NUMBER(4),
  credit_limit             NUMBER(12,2),
  grt_type                 VARCHAR2(2),
  grt_amount               NUMBER(12,2),
  grt_amount_rev           NUMBER(12,2),
  grt_expiry_date          DATE,
  gst_registered           CHAR(1) not null,
  comm_suspend             VARCHAR2(1),
  turn_money_flag          CHAR(1) not null,
  init_grade_id            VARCHAR2(3),
  same_domain              CHAR(1),
  g_agent_cate             VARCHAR2(1),
  effective_resource       CHAR(1),
  major                    VARCHAR2(100),
  school                   VARCHAR2(100),
  g_role                   VARCHAR2(2) not null,
  green_passport           VARCHAR2(1),
  b_grade_date             DATE,
  b_instructor_date        DATE,
  b_technical_post_date    DATE,
  cautioner1_title         VARCHAR2(30),
  cautioner1_gender        CHAR(1),
  cautioner1_birthday      DATE,
  cautioner1_com_addr      VARCHAR2(100),
  cautioner1_com_zip       VARCHAR2(6),
  cautioner1_com_tel       VARCHAR2(30),
  cautioner1_home_addr     VARCHAR2(100),
  cautioner1_home_zip      VARCHAR2(6),
  cautioner1_home_tel      VARCHAR2(30),
  health_desc              VARCHAR2(100),
  dimis_is_settled         CHAR(1),
  dimis_apply_date         DATE,
  dimission_date           DATE,
  quality_grade            VARCHAR2(5),
  description              VARCHAR2(4000),
  agent_sub_cate           VARCHAR2(3),
  ind_area_train_id        NUMBER(10),
  train_id_valid           CHAR(1),
  area_train_id_valid      CHAR(1),
  indi_area_train_id_valid CHAR(1),
  indi_train_id_valid      CHAR(1),
  dept_train_id_valid      CHAR(1),
  indi_dept_train_id_valid CHAR(1)
)
;
create table TEMP_T_CONTRACT_MASTER
(
  policy_id            NUMBER(10) not null,
  policy_code          VARCHAR2(20) not null,
  apply_code           VARCHAR2(20) not null,
  policy_type          CHAR(1) not null,
  group_single         CHAR(1) not null,
  real_insurant        CHAR(1) not null,
  head_id              VARCHAR2(40) not null,
  branch_id            VARCHAR2(40) not null,
  organ_id             VARCHAR2(40) not null,
  dept_id              VARCHAR2(20) not null,
  balance_prem         NUMBER(12,2) not null,
  period_prem          NUMBER(12,2) not null,
  discount_prem        NUMBER(12,2) not null,
  company_prem         NUMBER(12,2),
  employee_prem        NUMBER(12,2) not null,
  normal_prem          NUMBER(12,2) not null,
  normal_stand         NUMBER(12,2) not null,
  weak_prem            NUMBER(12,2) not null,
  weak_stand           NUMBER(12,2) not null,
  job_prem             NUMBER(12,2) not null,
  job_stand            NUMBER(12,2) not null,
  disable_prem         NUMBER(12,2) not null,
  disable_stand        NUMBER(12,2) not null,
  over_manage          CHAR(1) not null,
  pay_mode             NUMBER(2) not null,
  pay_next             NUMBER(2) not null,
  pay_way              VARCHAR2(2),
  deliver_type         CHAR(1),
  service_type         CHAR(1),
  overdue_manage       CHAR(1) not null,
  bank_code            VARCHAR2(20),
  bank_account         VARCHAR2(40),
  money_id             NUMBER(6) not null,
  applicant_id         NUMBER(10),
  company_id           NUMBER(10),
  address_fee          VARCHAR2(150),
  zip_link             VARCHAR2(10),
  link_tel             VARCHAR2(50),
  linkman              VARCHAR2(40),
  linkman_title        VARCHAR2(50),
  linkman_dept         VARCHAR2(40),
  link_celler          VARCHAR2(30),
  email                VARCHAR2(50),
  fax                  VARCHAR2(30),
  link_notes           VARCHAR2(1000),
  apply_date           DATE not null,
  validate_date        DATE not null,
  accept_date          DATE not null,
  end_date             DATE not null,
  pause_date           DATE,
  liability_state      NUMBER(2) not null,
  suspend              CHAR(1) not null,
  suspend_cause        NUMBER(2),
  pause_cause          NUMBER(2),
  end_cause            NUMBER(2),
  prem_status          NUMBER(2) not null,
  claim_deal           NUMBER(4),
  service_deal         NUMBER(4),
  policy_year          NUMBER(2) not null,
  policy_period        NUMBER(4) not null,
  agent_id             NUMBER(10) not null,
  sign_id              NUMBER(10),
  agency_code          VARCHAR2(20),
  branch_bank          VARCHAR2(20),
  agency_hand          NUMBER(10),
  update_time          DATE not null,
  updater_id           NUMBER(10),
  insert_time          DATE not null,
  assumpsit            VARCHAR2(4000),
  agreement_type       NUMBER(2),
  agreement_motive     VARCHAR2(200),
  agreement            VARCHAR2(4000),
  pay_times            NUMBER(4),
  sys_lock_time        DATE,
  sys_locker_id        NUMBER(10),
  sys_lock_status      CHAR(1) not null,
  claim_emp            NUMBER(10),
  service_emp          NUMBER(10),
  reissue_num          NUMBER(2) not null,
  nb_agency_code       VARCHAR2(20),
  policy_print         NUMBER(2) not null,
  unit_print           NUMBER(2) not null,
  receipt_print        NUMBER(2) not null,
  appro_emp_id         NUMBER(10),
  balance_capital      NUMBER(14,4) not null,
  em_ill               NUMBER(4),
  em_life              NUMBER(4),
  relation_id          NUMBER(2),
  job_class_1          NUMBER(2),
  job_cate_id          NUMBER(10),
  job_2                VARCHAR2(40),
  job_1                VARCHAR2(100),
  applicant_age        NUMBER(3),
  loan_status          CHAR(1) not null,
  derivation           CHAR(1) not null,
  former_id            NUMBER(10),
  next_period_prem     NUMBER(12,2) not null,
  next_discount_prem   NUMBER(12,2) not null,
  next_company_prem    NUMBER(12,2) not null,
  next_employee_prem   NUMBER(12,2) not null,
  next_normal_prem     NUMBER(12,2) not null,
  next_weak_prem       NUMBER(12,2) not null,
  next_job_prem        NUMBER(12,2) not null,
  next_disable_prem    NUMBER(12,2) not null,
  print_time           DATE,
  sell_way             VARCHAR2(2) not null,
  tax_prem             NUMBER(12,2) not null,
  answer_type          VARCHAR2(1) not null,
  is_answered          VARCHAR2(1) not null,
  auto_decision        NUMBER(2) not null,
  service_id           NUMBER(10) not null,
  service_date         DATE not null,
  policy_prem          NUMBER(12,2) not null,
  policy_stand         NUMBER(12,2) not null,
  next_policy_prem     NUMBER(12,2) not null,
  next_tax_prem        NUMBER(12,2) not null,
  address_fee_2        VARCHAR2(100),
  address_fee_3        VARCHAR2(100),
  address_fee_4        VARCHAR2(100),
  indivi_enquiry       CHAR(1) not null,
  tax_prem_stand       NUMBER(12,2) not null,
  matu_pay_mode        NUMBER(2),
  matu_process         VARCHAR2(1),
  matu_status          VARCHAR2(1),
  suspend_chg_id       NUMBER(10),
  prem_change_time     DATE not null,
  received_date        DATE,
  emp_attach_type      CHAR(1),
  initial_vali_date    DATE,
  next_weak_stand      NUMBER(12,2) not null,
  next_job_stand       NUMBER(12,2) not null,
  next_disable_stand   NUMBER(12,2) not null,
  auto_end             DATE,
  assignee_type        VARCHAR2(2) not null,
  swiss_life           CHAR(1) not null,
  prorate              CHAR(1) not null,
  campaign_code        VARCHAR2(10),
  ss_validate_date     DATE,
  acknow_code          VARCHAR2(20),
  is_commission        CHAR(1) not null,
  whole_period         CHAR(1) not null,
  discount_tax         NUMBER(12,2) not null,
  next_discount_tax    NUMBER(12,2) not null,
  auto_surrender       CHAR(1) not null,
  sur_notice_date      DATE,
  send_out_date        DATE,
  send_out_id          NUMBER(10),
  commission_rate      NUMBER(4,3) not null,
  answer_assumpsit     VARCHAR2(1000),
  is_igp               CHAR(1),
  igp_type             CHAR(1),
  issue_way            NUMBER(10),
  scheme_id            NUMBER(10),
  agent_discount_rate  NUMBER(4,3) not null,
  invoice_amount       NUMBER(12,2),
  answer_tel           VARCHAR2(40),
  holiday_indi         CHAR(1),
  holiday_start_date   DATE,
  holiday_end_date     DATE,
  holiday_pol_year     NUMBER(3),
  hi_validate_date     DATE,
  hi_plan_id           NUMBER(10),
  hi_end_date          DATE,
  sin_emp_ins_amount   NUMBER(10),
  dou_emp_ins_amount   NUMBER(10),
  annuity_print        NUMBER(2) not null,
  annuity_print_time   DATE,
  list_print           NUMBER(2) not null,
  list_print_time      DATE,
  pld                  DATE,
  holder_emp_num       NUMBER(6),
  force_cancel_emp     NUMBER(10),
  force_cancel_time    DATE,
  force_cancel_remarks VARCHAR2(100),
  force_cancel_mark    VARCHAR2(40),
  air_code             VARCHAR2(12)
)
;
create table TEMP_T_DEPT
(
  organ_id        VARCHAR2(40) not null,
  parent_id       VARCHAR2(20),
  dept_id         VARCHAR2(20) not null,
  leaf            CHAR(1) not null,
  dept_name       VARCHAR2(100) not null,
  principal_id    NUMBER(10),
  status          CHAR(1) not null,
  cancel_date     DATE,
  zip             CHAR(6),
  address         VARCHAR2(100),
  area_code       VARCHAR2(5),
  telephone       VARCHAR2(30),
  fax             VARCHAR2(30),
  email           VARCHAR2(50),
  dept_cate       VARCHAR2(1),
  train_man_id    NUMBER(10),
  update_time     DATE,
  updater_id      NUMBER(10),
  create_date     DATE,
  train_date      DATE,
  insider_id      NUMBER(10),
  area_type       NUMBER(10),
  dept_grade      NUMBER(2),
  collector_id    NUMBER(10),
  insert_time     DATE not null,
  is_basic        CHAR(1) not null,
  abbr_name       VARCHAR2(50),
  cancel_cause    VARCHAR2(6),
  g_business_cate NUMBER(2),
  g_dept_grade    NUMBER(2),
  b_dept_grade    NUMBER(2),
  dept_type       CHAR(1),
  g_dept_cate     VARCHAR2(1),
  admin           CHAR(1) not null,
  cost_center     VARCHAR2(25),
  config_id       NUMBER(3)
)
;
create table TEMP_T_POLICY_FEE
(
  fee_id              NUMBER(12) not null,
  head_id             VARCHAR2(40) not null,
  branch_id           VARCHAR2(40) not null,
  organ_id            VARCHAR2(40) not null,
  policy_id           NUMBER(10),
  send_code           VARCHAR2(20),
  receipt_code        VARCHAR2(200),
  fee_amount          NUMBER(12,2) not null,
  pay_mode            NUMBER(2) not null,
  bank_account        VARCHAR2(40),
  fee_type            NUMBER(3) not null,
  fee_status          NUMBER(2) not null,
  match_result        CHAR(1) not null,
  finish_time         DATE,
  cashier_id          NUMBER(10),
  insert_time         DATE not null,
  formal_receipt      VARCHAR2(200),
  transfer_file       CHAR(1) not null,
  cheque_code         VARCHAR2(40),
  cred_id             NUMBER(10),
  settle_flag         CHAR(1) not null,
  posted              CHAR(1) not null,
  return_check_status CHAR(1),
  check_enter_time    DATE,
  change_id           NUMBER(10),
  policy_type         CHAR(1) not null,
  record_time         DATE,
  dept_id             VARCHAR2(20) not null,
  agent_id            NUMBER(10) not null,
  money_id            NUMBER(6) not null,
  pay_way             VARCHAR2(2) not null,
  post_id             NUMBER(10),
  bank_code           VARCHAR2(20),
  agency_code         VARCHAR2(20),
  agency_hand         NUMBER(10),
  cancel_date         DATE,
  cancel_id           NUMBER(10),
  settle_id           NUMBER(10),
  settle_time         DATE,
  finish_id           NUMBER(10),
  bill_id             NUMBER(10),
  case_id             NUMBER(10),
  prem_id             NUMBER(12),
  payable_id          NUMBER(12),
  print_num           NUMBER(4) not null,
  insured_id          NUMBER(10),
  receiv_status       CHAR(1) not null,
  company_fee         NUMBER(12,2) not null,
  employee_fee        NUMBER(12,2) not null,
  policy_year         NUMBER(2),
  policy_period       NUMBER(4),
  entry_code          VARCHAR2(30),
  pay_money_id        NUMBER(6) not null,
  pay_amount          NUMBER(12,2) not null,
  new_account         VARCHAR2(40),
  check_desc          VARCHAR2(500),
  send_id             NUMBER(10),
  received_time       DATE,
  new_bank            VARCHAR2(20),
  account_operator    NUMBER(10),
  account_checker     NUMBER(10),
  transfer_num        NUMBER(4) not null,
  payee_name          VARCHAR2(100),
  payee_address_1     VARCHAR2(150),
  payee_address_2     VARCHAR2(100),
  payee_address_3     VARCHAR2(100),
  payee_address_4     VARCHAR2(100),
  payee_zip           VARCHAR2(10),
  payee_certi_type    NUMBER(2),
  payee_certi_code    VARCHAR2(30),
  cheque_type         VARCHAR2(2),
  cheque_date         DATE,
  cash_bank           VARCHAR2(20),
  cash_account        VARCHAR2(40),
  profit_loss         NUMBER(10,2) not null,
  total_cpf_refund    NUMBER(10,2) not null,
  withdraw_type       VARCHAR2(2),
  advance_pay_id      NUMBER(12),
  premium_paid        NUMBER(10,2) not null,
  related_id          NUMBER(12),
  payment_id          NUMBER(10),
  pay_balance         NUMBER(16,6) not null,
  detail_id           NUMBER(10),
  update_time         DATE not null,
  reversal_id         NUMBER(10),
  trans_chg_id        NUMBER(10),
  auth_id             NUMBER(10),
  circ_audited        CHAR(1) not null,
  print_advance_num   NUMBER(4) not null
)
;
create table TEMP_YUNWEI
(
  policy_id NUMBER(10) not null
)
;
create table TESTCC
(
  owner        VARCHAR2(50),
  table_name   VARCHAR2(200),
  column_name  VARCHAR2(200),
  data_default CLOB
)
;
create table TEST_FLASH
(
  owner          VARCHAR2(30),
  object_name    VARCHAR2(128),
  subobject_name VARCHAR2(30),
  object_id      NUMBER,
  data_object_id NUMBER,
  object_type    VARCHAR2(19),
  created        DATE,
  last_ddl_time  DATE,
  timestamp      VARCHAR2(19),
  status         VARCHAR2(7),
  temporary      VARCHAR2(1),
  generated      VARCHAR2(1),
  secondary      VARCHAR2(1)
)
;
create table TEST_FLASH_DROP
(
  owner          VARCHAR2(30),
  object_name    VARCHAR2(128),
  subobject_name VARCHAR2(30),
  object_id      NUMBER,
  data_object_id NUMBER,
  object_type    VARCHAR2(19),
  created        DATE,
  last_ddl_time  DATE,
  timestamp      VARCHAR2(19),
  status         VARCHAR2(7),
  temporary      VARCHAR2(1),
  generated      VARCHAR2(1),
  secondary      VARCHAR2(1)
)
;
create table TEST_OGG
(
  id   INTEGER,
  name VARCHAR2(50)
)
;
create table TEST_SQL_TIME_STAT
(
  sql_id       VARCHAR2(13),
  exec_time    NUMBER,
  cpu_time     NUMBER,
  elapsed_time NUMBER,
  executions   NUMBER,
  sql_text     VARCHAR2(64),
  piece        NUMBER
)
;
create table TEST_ZHAO
(
  id INTEGER
)
;

create table TMP16
(
  segment_name   VARCHAR2(81),
  segment_type   VARCHAR2(18),
  partition_name VARCHAR2(30),
  bytes          NUMBER
)
;
create table TMP17
(
  segment_name   VARCHAR2(81),
  segment_type   VARCHAR2(18),
  partition_name VARCHAR2(30),
  bytes          NUMBER
)
;
create table TMP18
(
  segment_name   VARCHAR2(81),
  segment_type   VARCHAR2(18),
  partition_name VARCHAR2(30),
  bytes          NUMBER
)
;
create table TMP19
(
  segment_name   VARCHAR2(81),
  segment_type   VARCHAR2(18),
  partition_name VARCHAR2(30),
  bytes          NUMBER
)
;
create table TMP_BANK_0002
(
  bank_code               VARCHAR2(20) not null,
  internal_code           VARCHAR2(20),
  branch_bank             VARCHAR2(20),
  bank_name               VARCHAR2(100) not null,
  bank_class              CHAR(1) not null,
  agency_type             CHAR(1),
  address                 VARCHAR2(100),
  telephone               VARCHAR2(30),
  zip                     VARCHAR2(6),
  leader_id               NUMBER(10),
  organ_id                VARCHAR2(40),
  head_id                 VARCHAR2(40),
  branch_id               VARCHAR2(40),
  manager_id              NUMBER(10),
  dept_id                 VARCHAR2(20),
  status                  CHAR(1) not null,
  create_date             DATE,
  recall_date             DATE,
  comeback_date           DATE,
  insert_time             DATE not null,
  update_time             DATE not null,
  bank_type               VARCHAR2(2) not null,
  is_basic                CHAR(1) not null,
  transfer_type           VARCHAR2(1) not null,
  abbr_name               VARCHAR2(100) not null,
  address_2               VARCHAR2(100),
  address_3               VARCHAR2(100),
  address_4               VARCHAR2(100),
  manager_pay_mode        NUMBER(2),
  financing_pay_mode      NUMBER(2),
  counter_number          NUMBER(10),
  personal_depoit_balance NUMBER(10,2),
  channel_type            VARCHAR2(2),
  business_cate           VARCHAR2(2),
  updater_id              NUMBER(10),
  parent_bank             VARCHAR2(20),
  group_address           VARCHAR2(100),
  group_phone             VARCHAR2(30),
  group_leader_id         NUMBER(10),
  group_create_date       DATE,
  group_recall_date       DATE,
  group_comeback_date     DATE,
  group_status            CHAR(1),
  adjust_rate             NUMBER(5,4),
  sell_way                VARCHAR2(2),
  real_name               VARCHAR2(100),
  agent_code              VARCHAR2(25),
  licence_code            VARCHAR2(100),
  licence_daealine        DATE
)
;
create table TMP_BIZ_ACCOUNTING_INFO_DEL
(
  fee_id        NUMBER(12) not null,
  data_table    NUMBER(2),
  dr_seg1       VARCHAR2(25),
  dr_seg2       VARCHAR2(25),
  dr_seg3       VARCHAR2(25),
  dr_seg4       VARCHAR2(25),
  dr_seg5       VARCHAR2(25),
  dr_seg6       VARCHAR2(25),
  dr_seg7       VARCHAR2(25),
  dr_seg8       VARCHAR2(25),
  dr_seg9       VARCHAR2(25),
  dr_seg10      VARCHAR2(25),
  cr_seg1       VARCHAR2(25),
  cr_seg2       VARCHAR2(25),
  cr_seg3       VARCHAR2(25),
  cr_seg4       VARCHAR2(25),
  cr_seg5       VARCHAR2(25),
  cr_seg6       VARCHAR2(25),
  cr_seg7       VARCHAR2(25),
  cr_seg8       VARCHAR2(25),
  cr_seg9       VARCHAR2(25),
  cr_seg10      VARCHAR2(25),
  je_posting_id NUMBER(10),
  list_id       NUMBER(16) not null
)
;
create table TMP_CUSTOMER
(
  year_ls VARCHAR2(10) not null,
  sums    NUMBER(10) not null
)
;
create table TMP_CUSTOMER_STATUS
(
  customer_id NUMBER(10),
  status      CHAR(1),
  update_time DATE
)
;
create table TMP_FEE
(
  fee_id              NUMBER(12) not null,
  head_id             VARCHAR2(40) not null,
  branch_id           VARCHAR2(40) not null,
  organ_id            VARCHAR2(40) not null,
  policy_id           NUMBER(10),
  send_code           VARCHAR2(20),
  receipt_code        VARCHAR2(200),
  fee_amount          NUMBER(12,2) not null,
  pay_mode            NUMBER(2) not null,
  bank_account        VARCHAR2(40),
  fee_type            NUMBER(3) not null,
  fee_status          NUMBER(2) not null,
  match_result        CHAR(1) not null,
  finish_time         DATE,
  cashier_id          NUMBER(10),
  insert_time         DATE not null,
  formal_receipt      VARCHAR2(200),
  transfer_file       CHAR(1) not null,
  cheque_code         VARCHAR2(40),
  cred_id             NUMBER(10),
  settle_flag         CHAR(1) not null,
  posted              CHAR(1) not null,
  return_check_status CHAR(1),
  check_enter_time    DATE,
  change_id           NUMBER(10),
  policy_type         CHAR(1) not null,
  record_time         DATE,
  dept_id             VARCHAR2(20) not null,
  agent_id            NUMBER(10) not null,
  money_id            NUMBER(6) not null,
  pay_way             VARCHAR2(2) not null,
  post_id             NUMBER(10),
  bank_code           VARCHAR2(20),
  agency_code         VARCHAR2(20),
  agency_hand         NUMBER(10),
  cancel_date         DATE,
  cancel_id           NUMBER(10),
  settle_id           NUMBER(10),
  settle_time         DATE,
  finish_id           NUMBER(10),
  bill_id             NUMBER(10),
  case_id             NUMBER(10),
  prem_id             NUMBER(12),
  payable_id          NUMBER(12),
  print_num           NUMBER(4) not null,
  insured_id          NUMBER(10),
  receiv_status       CHAR(1) not null,
  company_fee         NUMBER(12,2) not null,
  employee_fee        NUMBER(12,2) not null,
  policy_year         NUMBER(2),
  policy_period       NUMBER(4),
  entry_code          VARCHAR2(30),
  pay_money_id        NUMBER(6) not null,
  pay_amount          NUMBER(12,2) not null,
  new_account         VARCHAR2(40),
  check_desc          VARCHAR2(500),
  send_id             NUMBER(10),
  received_time       DATE,
  new_bank            VARCHAR2(20),
  account_operator    NUMBER(10),
  account_checker     NUMBER(10),
  transfer_num        NUMBER(4) not null,
  payee_name          VARCHAR2(100),
  payee_address_1     VARCHAR2(150),
  payee_address_2     VARCHAR2(100),
  payee_address_3     VARCHAR2(100),
  payee_address_4     VARCHAR2(100),
  payee_zip           VARCHAR2(10),
  payee_certi_type    NUMBER(2),
  payee_certi_code    VARCHAR2(30),
  cheque_type         VARCHAR2(2),
  cheque_date         DATE,
  cash_bank           VARCHAR2(20),
  cash_account        VARCHAR2(40),
  profit_loss         NUMBER(10,2) not null,
  total_cpf_refund    NUMBER(10,2) not null,
  withdraw_type       VARCHAR2(2),
  advance_pay_id      NUMBER(12),
  premium_paid        NUMBER(10,2) not null,
  related_id          NUMBER(12),
  payment_id          NUMBER(10),
  pay_balance         NUMBER(16,6) not null,
  detail_id           NUMBER(10),
  update_time         DATE not null,
  reversal_id         NUMBER(10),
  trans_chg_id        NUMBER(10),
  auth_id             NUMBER(10),
  circ_audited        CHAR(1) not null,
  print_advance_num   NUMBER(4) not null,
  incorrect_reason    VARCHAR2(4000),
  maintain_id         NUMBER(10),
  pdf_print_num       NUMBER(2)
)
;

create table TMP_GROUP
(
  line_no  NUMBER(10),
  sql_text VARCHAR2(4000)
)
;
create table TMP_IMPORT_DIS2
(
  distrinct_code     VARCHAR2(10),
  prov_district_name VARCHAR2(50),
  city_district_name VARCHAR2(50)
)
;
create table TMP_INTEREST_CAPITAL_60390
(
  policy_id        NUMBER(10) not null,
  interest_capital NUMBER
)
;
create table TMP_INTEREST_CAPITAL_TYPE
(
  policy_id        NUMBER(10) not null,
  account_att_type NUMBER(2) not null,
  interest_capital NUMBER
)
;
create table TMP_OLD_NEW_RELATION
(
  old_fee_id   NUMBER(12) not null,
  new_fee_id_1 NUMBER(12),
  new_fee_id_2 NUMBER(12),
  flag         CHAR(1)
)
;
create table TMP_QC
(
  a NUMBER,
  b NUMBER
)
;
create table TMP_RENGUAN
(
  sales_id    CHAR(7) not null,
  employ_kind VARCHAR2(2)
)
;
create table TMP_SMS_QUEUE
(
  queue_id    NUMBER(10) not null,
  category_id NUMBER(10) not null,
  policy_id   NUMBER(10) not null,
  para_1      VARCHAR2(20),
  para_2      VARCHAR2(20)
)
;
create table TMP_TIANLING
(
  cardno      VARCHAR2(20),
  agency_code VARCHAR2(20)
)
;
create table TMP_TIANLING_2
(
  cardno      VARCHAR2(20),
  agency_code VARCHAR2(500)
)
;
create table TMP_TIANLING_UNDO
(
  cardno      VARCHAR2(20),
  agency_code VARCHAR2(20)
)
;
create table TOKENENTRY
(
  processorname VARCHAR2(255) not null,
  segment       INTEGER not null,
  token         BLOB,
  tokentype     VARCHAR2(255),
  timestamp     VARCHAR2(255),
  owner         VARCHAR2(255)
)
;
create table T_BILLCARD_TYPE
(
  card_type CHAR(1) not null,
  type_name VARCHAR2(40) not null
)
;
create table T_IMAGE_TYPE
(
  image_type_id NUMBER(2) not null,
  type_name     VARCHAR2(40) not null
)
;
create table T_BILLCARD
(
  card_id           NUMBER(10) not null,
  card_type         CHAR(1) not null,
  card_code         VARCHAR2(10) not null,
  card_name         VARCHAR2(200) not null,
  card_desc         VARCHAR2(4000),
  code_length       NUMBER(2),
  max_page          NUMBER(4),
  need_print        CHAR(1),
  print_seq         NUMBER(2),
  has_image         CHAR(1),
  has_check_code    CHAR(1),
  alert_day1        NUMBER(3),
  alert_day2        NUMBER(3),
  limit_draw        NUMBER(7),
  need_detail       CHAR(1),
  node_status       CHAR(1) default '1' not null,
  channel_type      CHAR(1) default '0' not null,
  group_use         CHAR(1) default 'Y' not null,
  inv_use           CHAR(1) default 'Y' not null,
  bank_use          CHAR(1) default 'Y' not null,
  electronic_bill   CHAR(1),
  image_type        NUMBER(2) default 0 not null,
  policy_code_card  VARCHAR2(10),
  newbiz_needed     CHAR(1),
  need_print_manage CHAR(1),
  card_fee          NUMBER(12,2),
  has_sub_card      CHAR(1) default 'N' not null,
  is_small_amount   CHAR(1),
  small_amount      NUMBER(12)
)
;
create table TPL_CARD_POLICY_TYPE
(
  card_id     NUMBER(10) not null,
  policy_type CHAR(1) not null
)
;
create table T_ABNORMAL_CANCEL_SUPPREASON
(
  reason_type NUMBER(2) not null,
  reason_desc VARCHAR2(50) not null
)
;
create table T_ABNORMAL_PAYMENT_REASON
(
  reason_id   NUMBER(2) not null,
  reason_desc VARCHAR2(40) not null
)
;
create table T_ABNORMAL_PAYMENT_SUPPREASON
(
  reason_type NUMBER(2) not null,
  reason_desc VARCHAR2(50) not null
)
;
create table T_ABNORMAL_POLICY
(
  policy_code   VARCHAR2(20) not null,
  permit_refund CHAR(1) default 'N' not null,
  notes         VARCHAR2(2000),
  policy_id     NUMBER(10)
)
;
create table T_ABNORMAL_POLICY_FILE_LIST
(
  list_id     NUMBER(10) not null,
  policy_id   NUMBER(10) not null,
  image_id    NUMBER(12) not null,
  file_format VARCHAR2(10) not null,
  file_name   VARCHAR2(255) not null,
  insert_time DATE not null
)
;
create table T_ACCEPT_CHANNEL_TBL
(
  accept_channel VARCHAR2(1) not null,
  full_name      VARCHAR2(40) not null,
  abbr_name      VARCHAR2(10) not null
)
;
create table T_POLICY_INPUT_SOURCE
(
  input_source_code VARCHAR2(5) not null,
  input_source_name VARCHAR2(50) not null
)
;
create table T_ACCEPT_MODE
(
  applicant_mode    NUMBER(2) not null,
  input_source_code VARCHAR2(5) not null,
  accept_mode       VARCHAR2(2) not null,
  settle_mode       VARCHAR2(2) default '1' not null,
  is_resend         CHAR(1) default 'N' not null,
  is_netsale        CHAR(1) default 'N' not null,
  is_mult_mode      CHAR(1) default 'N',
  mode_id           NUMBER(10),
  cancel_type       NUMBER(2),
  pay_mode          NUMBER(2)
)
;
create table T_ACCIDENT_CATEGORY
(
  category_id   NUMBER(2) not null,
  category_name VARCHAR2(40)
)
;
create table T_ACCIDENT_CODE_MAPPING
(
  list_id           NUMBER(10) not null,
  mapping_table     VARCHAR2(50),
  source_value      VARCHAR2(50),
  mapping_out_value VARCHAR2(50),
  out_value_name    VARCHAR2(200)
)
;
create table T_ACCIDENT_CONFIG
(
  user_name        VARCHAR2(30),
  password         VARCHAR2(600),
  url              VARCHAR2(200),
  max_report_times NUMBER(3),
  split_num        NUMBER(10),
  thread_num       NUMBER(5)
)
;
create table T_ACCIDENT_CUSTOMER
(
  case_id          NUMBER(10) not null,
  insured_id       NUMBER(10),
  insured_name     VARCHAR2(100) not null,
  gender           CHAR(1) not null,
  relation_id      NUMBER(2),
  certi_type       NUMBER(2),
  certi_code       VARCHAR2(50),
  certi_start_date DATE,
  certi_end_date   DATE,
  job_code         VARCHAR2(20),
  job_address      VARCHAR2(200),
  job_zip          VARCHAR2(10),
  rela_address     VARCHAR2(150),
  rela_zip         VARCHAR2(10),
  tel              VARCHAR2(30),
  mobile           VARCHAR2(30),
  country_code     VARCHAR2(50),
  list_id          NUMBER(10) not null,
  ecif_id          NUMBER(20),
  version          NUMBER(19) default 0 not null,
  insert_time      TIMESTAMP(6) default systimestamp not null,
  update_time      TIMESTAMP(6) default systimestamp not null
)
;
create table T_ACCIDENT_INFO
(
  accident_no    VARCHAR2(20) not null,
  risk_type      VARCHAR2(2) not null,
  accident_type  VARCHAR2(1) not null,
  accident_id    VARCHAR2(20),
  accident_date  DATE not null,
  accident_place VARCHAR2(400),
  accident_desc  VARCHAR2(4000)
)
;
create table T_ACCIDENT_LEVEL
(
  level_code NUMBER(2) not null,
  level_desc VARCHAR2(20) not null
)
;
create table T_ACCIDENT_REPORT_OPERATION
(
  operation_type   NUMBER(3),
  operation_name   VARCHAR2(200),
  report_type      NUMBER(1) default 1 not null,
  insert_queue_fun VARCHAR2(100)
)
;
create table T_ACCIDENT_OPERATION_QUEUE
(
  queue_id       NUMBER(10) not null,
  business_id    NUMBER(10),
  operation_type NUMBER(3),
  data_source    NUMBER(1) default 1,
  error_message  VARCHAR2(4000),
  status         NUMBER(2),
  insert_time    DATE default sysdate not null,
  update_time    DATE default sysdate not null
)
;
create table T_ACCIDENT_POLICY_FILTER
(
  policy_code VARCHAR2(20) not null
)
;
create table T_ACCIDENT_REQUEST_CONFIG
(
  request_type     NUMBER(2) not null,
  request_name     VARCHAR2(100),
  operation_type   NUMBER(3),
  request_mode     NUMBER(2),
  request_function VARCHAR2(100) not null,
  request_para_num NUMBER(2),
  data_class       VARCHAR2(100),
  get_function     VARCHAR2(100),
  get_para_num     NUMBER(2) default 0 not null,
  get_para_type1   VARCHAR2(100),
  get_para_type2   VARCHAR2(100),
  response_class   VARCHAR2(100) not null
)
;
create table T_ACCIDENT_QUEUE_GROUP
(
  group_id        NUMBER(10) not null,
  operation_type  NUMBER(3),
  status          NUMBER(2),
  send_message    CLOB,
  back_message    CLOB,
  call_id         NUMBER(10),
  request_type    NUMBER(2),
  task_no         VARCHAR2(50),
  insert_time     DATE default sysdate not null,
  update_time     DATE default sysdate not null,
  last_split_unit CHAR(1) default 'N'
)

create table T_ACCIDENT_QUEUE
(
  queue_id           NUMBER(10) not null,
  business_id        NUMBER(10),
  operation_type     NUMBER(3),
  status             NUMBER(2),
  error_message      CLOB,
  fail_times         NUMBER(3) default 0,
  data_source        NUMBER(1) default 1,
  request_call_id    NUMBER(10),
  group_id           NUMBER(10),
  policy_id          NUMBER(10),
  out_service_id     NUMBER(10),
  insert_time        DATE default sysdate not null,
  update_time        DATE default sysdate not null,
  original_id        NUMBER(10),
  start_insured_num  NUMBER(10),
  end_insured_num    NUMBER(10),
  operation_queue_id NUMBER(10),
  is_split           CHAR(1) default 'N',
  last_split_unit    CHAR(1) default 'N',
  total_bags         NUMBER(8),
  bag_no             NUMBER(8)
)

create table T_ACCIDENT_REPORT_FILTER
(
  list_id     NUMBER(10) not null,
  organ_id    VARCHAR2(40) not null,
  product_id  NUMBER(10) not null,
  report_type NUMBER(1) default 1 not null
)
;
create table T_ACCIDENT_REPORT_ORGAN
(
  organ_id      VARCHAR2(40) not null,
  online_date   DATE not null,
  report_status NUMBER(1) default 1 not null
)
;
create table T_ACCIDENT_SERVICE_MAPPING
(
  service_id  NUMBER(10) not null,
  mapping_fun VARCHAR2(50) not null,
  fun_desc    VARCHAR2(100)
)
;
create table T_ACCIDENT_SPECIFIC_CODE
(
  product_id    NUMBER(7),
  specific_code VARCHAR2(50)
)
;
create table T_ACCIDENT_TRANS
(
  trans_id      NUMBER(12) not null,
  task_no       VARCHAR2(50),
  status        NUMBER(2),
  send_message  CLOB,
  back_message  CLOB,
  request_type  NUMBER(10),
  insert_time   DATE default sysdate not null,
  update_time   DATE default sysdate not null,
  error_message CLOB
)
;
create table T_ACCIDENT_WARN_PRODUCT
(
  policy_type NUMBER(5) not null,
  product_id  NUMBER(10) not null
)
;
create table T_ACCOMMODATE_CAUSE
(
  cause_id   NUMBER(4) not null,
  cause_desc VARCHAR2(100) not null
)
;
create table T_FUND_STS_TBL
(
  fund_sts  VARCHAR2(1) not null,
  full_name VARCHAR2(40) not null,
  abbr_name VARCHAR2(50) not null
)
;
create table T_FUND_TYPE
(
  fund_type VARCHAR2(1) not null,
  type_name VARCHAR2(40) not null,
  abbr_name VARCHAR2(50) not null
)
;
create table T_FUND
(
  fund_code           VARCHAR2(20) not null,
  fund_name           VARCHAR2(40) not null,
  fund_type           VARCHAR2(1) not null,
  start_date          DATE not null,
  end_date            DATE,
  recent_pricing_date DATE,
  min_alloc_amount    NUMBER(14,4) default 0,
  min_alloc_rate      NUMBER(5,4) default 0,
  description         VARCHAR2(140),
  dividend_fund       VARCHAR2(1) default 'N' not null,
  guarantee_rate      NUMBER(5,4) default 0 not null,
  fund_sts            VARCHAR2(1) default '0' not null,
  fund_mgr            VARCHAR2(60),
  fcu                 NUMBER(10),
  fcd                 DATE,
  lcu                 NUMBER(10),
  lcd                 DATE,
  discount_rate       NUMBER(8,6) default 0 not null,
  manage_fee          NUMBER(8,6) default 0 not null
)
;
create table T_ACCOUNT
(
  account_code        VARCHAR2(20) not null,
  description         VARCHAR2(50) not null,
  account_class       NUMBER(1) not null,
  fund_code           VARCHAR2(20) not null,
  higher_account_code VARCHAR2(20) not null,
  status              CHAR(1) not null,
  balance             NUMBER(14,2) not null,
  create_date         DATE not null,
  institution         VARCHAR2(50),
  attribute           CHAR(1) not null,
  insert_person       NUMBER(10) not null,
  insert_date         DATE default SYSDATE not null,
  withdraw_date       DATE,
  updater_id          NUMBER(10),
  update_time         DATE
)
;
create table T_BOOK_TYPE
(
  type_id    VARCHAR2(10) not null,
  type_desc  VARCHAR2(40),
  short_name VARCHAR2(10) not null
)
;
create table T_ACCOUNT_TEMPLET
(
  templet_code   VARCHAR2(10) not null,
  templet_desc   VARCHAR2(100),
  account_coding VARCHAR2(20) not null,
  book_type      VARCHAR2(10),
  currency_id    NUMBER(6) default (1) not null
)
;
create table T_BOOK
(
  book_id          NUMBER(10) not null,
  book_name        VARCHAR2(40) not null,
  organ_id         VARCHAR2(40) not null,
  start_year       CHAR(4),
  cur_year         CHAR(4),
  start_period     CHAR(6),
  cur_period       CHAR(6),
  money_id         NUMBER(6) not null,
  initiated        CHAR(1) default 'N' not null,
  director         VARCHAR2(20) not null,
  num_mode         CHAR(1) default '1' not null,
  fixed_floating   CHAR(1) default '1' not null,
  budget           CHAR(1) default 'N' not null,
  account_code     VARCHAR2(20),
  individual_group CHAR(1),
  book_type        VARCHAR2(10) not null,
  fund_code        VARCHAR2(20),
  acc_templet_code VARCHAR2(10)
)
;
create table T_BOOK_YEAR
(
  book_id     NUMBER(10) not null,
  year_period CHAR(4) not null,
  close       CHAR(1) default 'N' not null,
  max_period  VARCHAR2(6) default '12' not null
)
;
create table T_BOOK_PERIOD
(
  book_id        NUMBER(10) not null,
  year_period    CHAR(4) not null,
  period_id      CHAR(6) not null,
  period_start   DATE not null,
  period_end     DATE not null,
  close_time     DATE,
  period_status  CHAR(1) default 'Y' not null,
  balance_period CHAR(1) default 'N' not null,
  initiated      CHAR(1) default 'N' not null
)
;
create table T_UNIT
(
  book_id   NUMBER(10) not null,
  unit_name VARCHAR2(20) not null,
  unit_id   VARCHAR2(10) not null
)
;
create table T_ACCOUNT_BALANCE
(
  book_id               NUMBER(10) not null,
  year_period           CHAR(4) not null,
  period_id             CHAR(6) not null,
  account_code          VARCHAR2(40) not null,
  unit_debit            VARCHAR2(10),
  unit_credit           VARCHAR2(10),
  begin_debit_amount    NUMBER(12,2) default 0 not null,
  begin_credit_amount   NUMBER(12,2) default 0 not null,
  sum_debit_amount      NUMBER(12,2) default 0 not null,
  sum_credit_amount     NUMBER(12,2) default 0 not null,
  end_debit_amount      NUMBER(12,2) default 0 not null,
  end_credit_amount     NUMBER(12,2) default 0 not null,
  begin_debit_standard  NUMBER(16,2) default 0 not null,
  begin_credit_standard NUMBER(16,2) default 0 not null,
  sum_debit_standard    NUMBER(16,2) default 0 not null,
  sum_credit_standard   NUMBER(16,2) default 0 not null,
  end_debit_standard    NUMBER(16,2) default 0 not null,
  end_credit_standard   NUMBER(16,2) default 0 not null,
  begin_debit_foreign   NUMBER(16,2) default 0 not null,
  begin_credit_foreign  NUMBER(16,2) default 0 not null,
  sum_debit_foreign     NUMBER(16,2) default 0 not null,
  sum_credit_foreign    NUMBER(16,2) default 0 not null,
  end_debit_foreign     NUMBER(16,2) default 0 not null,
  end_credit_foreign    NUMBER(16,2) default 0 not null,
  money_id              NUMBER(6),
  internal_id           VARCHAR2(10)
)
;
create table T_ACCOUNT_CATE
(
  cate_id  NUMBER(2) not null,
  category VARCHAR2(20)
)
;
create table T_ACCOUNT_CHECK_RULE
(
  benefit_type     VARCHAR2(2) not null,
  service_id       NUMBER(10) not null,
  using_check_rule CHAR(1) not null,
  check_rule       VARCHAR2(50) not null,
  rule_desc        VARCHAR2(200),
  update_time      DATE default SYSDATE not null,
  insert_time      DATE default SYSDATE not null,
  policy_type      CHAR(1) default 'W' not null
)
;
create table T_ACCOUNT_DEDUCT_INTF
(
  correlationid VARCHAR2(36) not null,
  caseno        VARCHAR2(20) not null,
  policycode    VARCHAR2(20),
  productid     NUMBER(10),
  deducttype    CHAR(1) not null,
  deductamount  NUMBER(12,2) not null,
  deductlimit   NUMBER(12,2)
)
;
create table T_ACCOUNT_HIS
(
  account_no     NUMBER(20),
  polno          VARCHAR2(16),
  certno         VARCHAR2(16),
  plan_code      VARCHAR2(10),
  acct_code      VARCHAR2(6),
  fund_code      VARCHAR2(6),
  acct_type      NUMBER(2),
  amount         NUMBER(14,4),
  guarantee_sum  NUMBER(14,4),
  last_tran_date DATE,
  tran_date      DATE
)
;
create table T_ACCOUNT_TYPE_ATTACHED
(
  attached_type NUMBER(2) not null,
  type_name     VARCHAR2(50) not null
)
;
create table T_COLLECT_STS_TBL
(
  collect_sts VARCHAR2(1) not null,
  full_name   VARCHAR2(40) not null,
  abbr_name   VARCHAR2(10) not null
)
;
create table T_PLAN_TYPE_TBL
(
  plan_type VARCHAR2(1) not null,
  full_name VARCHAR2(40) not null,
  abbr_name VARCHAR2(10) not null
)
;
create table T_PLAN
(
  product_id      NUMBER(7) not null,
  plan_code       VARCHAR2(10) not null,
  full_name       VARCHAR2(50) not null,
  abbr_name       VARCHAR2(50) not null,
  plan_type       VARCHAR2(1) not null,
  min_cover_rate  NUMBER(5,4) default 0 not null,
  min_quota       NUMBER(12,2) default 0 not null,
  prem_type_set   VARCHAR2(40) default '/1/' not null,
  pay_type_set    VARCHAR2(40) default '//',
  imp_permit      VARCHAR2(1) default 'N' not null,
  loan_permit     VARCHAR2(1) default 'N' not null,
  imp_loan_rate   NUMBER(5,4) default 0 not null,
  max_convert     NUMBER(4) default 0 not null,
  min_iss_psn     NUMBER(4) default 0 not null,
  min_iss_age     NUMBER(4) default 0 not null,
  min_m_re_age    NUMBER(4) default 0 not null,
  min_f_re_age    NUMBER(4) default 0 not null,
  min_re_period   NUMBER(4) default 0 not null,
  min_ann_fee     NUMBER(12,2) default 0 not null,
  max_ann_fee     NUMBER(12,2) default 0 not null,
  start_date      DATE not null,
  end_date        DATE,
  comm_pol_yr     VARCHAR2(1) default 'Y' not null,
  comm_area       VARCHAR2(1) default 'Y' not null,
  comm_agent_rank VARCHAR2(1) default 'Y' not null,
  comm_agent_type VARCHAR2(1) default 'Y' not null,
  fcu             VARCHAR2(10) not null,
  fcd             DATE not null,
  lcu             VARCHAR2(10) not null,
  lcd             DATE not null,
  plan_category   VARCHAR2(1)
)
;
create table T_TRANSACTION_CODE
(
  trans_code  VARCHAR2(2) not null,
  description VARCHAR2(30) not null,
  abbr_name   VARCHAR2(50)
)
;
create table T_ACCT_COLLECT
(
  collect_seq      VARCHAR2(10) not null,
  plan_code        VARCHAR2(10) not null,
  tran_type        VARCHAR2(1) not null,
  fund_code        VARCHAR2(4) not null,
  vs_fund_code     VARCHAR2(4),
  total_sum        NUMBER(12,2) default 0 not null,
  total_invest_sum NUMBER(12,2) default 0 not null,
  total_amt        NUMBER(14,4) default 0 not null,
  collect_sts      VARCHAR2(1) not null,
  collect_date     DATE not null,
  collect_empno    NUMBER(10) not null,
  organ_id         VARCHAR2(40) not null,
  deptno           VARCHAR2(20) not null,
  fcd              DATE not null,
  fcu              VARCHAR2(10) not null,
  lcd              DATE not null,
  lcu              VARCHAR2(10) not null,
  apply_s_date     DATE,
  apply_e_date     DATE,
  insert_time      DATE default SYSDATE not null,
  update_time      DATE default SYSDATE not null
)
;
create table T_POL_TYPE_TBL
(
  pol_type  VARCHAR2(1) not null,
  full_name VARCHAR2(40) not null,
  abbr_name VARCHAR2(10) not null
)
;
create table T_TAX_TYPE_TBL
(
  tax_type  VARCHAR2(1) not null,
  full_name VARCHAR2(40) not null,
  abbr_name VARCHAR2(10) not null
)
;
create table T_RULE_LAW
(
  law_code       VARCHAR2(4) not null,
  full_name      VARCHAR2(40) not null,
  abbr_name      VARCHAR2(12) not null,
  retir_age      NUMBER(3) default 0 not null,
  psn_tax_rate   NUMBER(5,4) default 0 not null,
  corp_tax_rate  NUMBER(5,4) default 0 not null,
  psn_tax_type   VARCHAR2(1) not null,
  corp_tax_type  VARCHAR2(1) not null,
  psn_max_sum    NUMBER(12,2) default 0 not null,
  min_cover_rate NUMBER(5,4) default 0 not null,
  start_date     DATE not null,
  end_date       DATE,
  fcu            VARCHAR2(10) not null,
  fcd            DATE not null,
  lcu            VARCHAR2(10) not null,
  lcd            DATE not null
)
;
create table T_PAY_DATE_TYPE
(
  pay_date_type NUMBER(1) not null,
  type_name     VARCHAR2(20) not null
)
;
create table T_POL_MAIN
(
  appno                  VARCHAR2(16),
  polno                  VARCHAR2(16) not null,
  plan_code              VARCHAR2(10) not null,
  law_code               VARCHAR2(4) not null,
  total_psns             NUMBER(8) default 0 not null,
  app_psns               NUMBER(8) default 1 not null,
  busi_src_type          VARCHAR2(1) not null,
  applicant              NUMBER(10) not null,
  conta_name             VARCHAR2(50),
  conta_sex              VARCHAR2(1),
  conta_tel              VARCHAR2(40),
  conta_addr             VARCHAR2(100),
  postcode               VARCHAR2(6),
  e_mail                 VARCHAR2(100),
  prem_type              CHAR(1) not null,
  corp_prem_rate         NUMBER(5,4) default 0 not null,
  ascript_rank           VARCHAR2(1) default 'N' not null,
  last_prem_date         DATE,
  buy_price_diff         NUMBER(5,4) default 0 not null,
  pol_sts                NUMBER(3) not null,
  print_flag             VARCHAR2(1) default 'N' not null,
  loss_flag              VARCHAR2(1) default 'N' not null,
  reissue_times          NUMBER(4) default 0 not null,
  pol_type               VARCHAR2(1) default '0' not null,
  prem_bal               NUMBER(12,2) default 0 not null,
  app_date               DATE not null,
  deal_date              DATE not null,
  deal_empno             NUMBER(10) not null,
  manu_check_date        DATE not null,
  manu_check_empno       NUMBER(10) not null,
  auto_check_date        DATE not null,
  auto_check_empno       NUMBER(10) not null,
  und_date               DATE,
  und_empno              NUMBER(10),
  undwrt_date            DATE not null,
  eff_date               DATE not null,
  agentno                NUMBER(10),
  agt_empno              NUMBER(10),
  organ_id               VARCHAR2(40) not null,
  deptno                 VARCHAR2(20) not null,
  fcd                    DATE not null,
  fcu                    VARCHAR2(10) not null,
  lcd                    DATE not null,
  lcu                    VARCHAR2(10) not null,
  agent_deputy           VARCHAR2(10),
  bankno                 VARCHAR2(20),
  bank_acctno            VARCHAR2(30),
  pay_mode               NUMBER(2),
  money_id               NUMBER(6),
  conta_dept             VARCHAR2(40),
  conta_title            VARCHAR2(40),
  conta_fax              VARCHAR2(40),
  conta_mobile           VARCHAR2(40),
  ifsame_retire_age      VARCHAR2(1),
  male_retire_age        NUMBER(3),
  female_retire_age      NUMBER(3),
  pay_date_type          NUMBER(1) default 1 not null,
  dividend_choice        NUMBER(1) default 2 not null,
  ifsame_dividend_choice VARCHAR2(1) default 'Y' not null,
  grade_standard         NUMBER(1) default 1 not null,
  vest_date_type         NUMBER(1) default 2 not null,
  ifsame_prem            VARCHAR2(1) default 'Y' not null,
  ifprem_by_salary       VARCHAR2(1) default 'Y' not null,
  grp_prem               NUMBER(14,2) default 0 not null,
  psn_prem               NUMBER(14,2) default 0 not null,
  annual_fee             NUMBER(14,2) default 0 not null,
  total_prem             NUMBER(14,2) default 0 not null,
  vest_date              DATE,
  insert_time            DATE default SYSDATE not null,
  update_time            DATE default SYSDATE not null,
  received_date          DATE,
  nb_agency_code         VARCHAR2(20)
)
;
create table T_INS_RANK_TBL
(
  ins_rank  VARCHAR2(2) not null,
  full_name VARCHAR2(40) not null,
  abbr_name VARCHAR2(10) not null
)
;
create table T_LORI_STS_TBL
(
  lori_sts  VARCHAR2(1) not null,
  full_name VARCHAR2(40) not null,
  abbr_name VARCHAR2(10) not null
)
;
create table T_POL_CERT
(
  appno              VARCHAR2(16),
  polno              VARCHAR2(16) not null,
  plan_code          VARCHAR2(10) not null,
  app_certno         VARCHAR2(16),
  certno             VARCHAR2(16) not null,
  client_psw         VARCHAR2(8),
  insno              NUMBER(10),
  age                NUMBER(3) default 0 not null,
  ascript_start_date DATE not null,
  ins_rank           VARCHAR2(2) not null,
  pay_type           CHAR(1) not null,
  pay_age            NUMBER(4) default 0 not null,
  bankno             VARCHAR2(20),
  bank_acctno        VARCHAR2(30),
  prem_type          CHAR(1) not null,
  te_sum             NUMBER(12,2) default 0 not null,
  tp_sum             NUMBER(12,2) default 0 not null,
  fe_sum             NUMBER(12,2) default 0 not null,
  fp_sum             NUMBER(12,2) default 0 not null,
  salary             NUMBER(12,2) default 0 not null,
  salary_e_prem_rate NUMBER(5,4),
  salary_p_prem_rate NUMBER(5,4),
  cert_sts           NUMBER(3) not null,
  lori_sts           VARCHAR2(1) default '0' not null,
  print_flag         VARCHAR2(1) default 'N' not null,
  loss_flag          VARCHAR2(1) default 'N' not null,
  reissue_times      NUMBER(4) default 0 not null,
  enroll_date        DATE not null,
  cert_type          VARCHAR2(1) default '0' not null,
  app_date           DATE not null,
  deal_date          DATE not null,
  deal_empno         NUMBER(10) not null,
  manu_check_date    DATE not null,
  manu_check_empno   NUMBER(10) not null,
  auto_check_date    DATE not null,
  auto_check_empno   NUMBER(10) not null,
  und_date           DATE,
  und_empno          NUMBER(10),
  undwrt_date        DATE not null,
  eff_date           DATE not null,
  organ_id           VARCHAR2(40) not null,
  deptno             VARCHAR2(20) not null,
  fcd                DATE not null,
  fcu                VARCHAR2(10) not null,
  lcd                DATE not null,
  lcu                VARCHAR2(10) not null,
  dividend_choice    NUMBER(1) default 2 not null,
  pay_date_type      NUMBER(1) default 1 not null,
  ins_seq            NUMBER(10),
  insert_time        DATE default SYSDATE not null,
  update_time        DATE default SYSDATE not null
)
;
create table T_TRAN_SRC_TBL
(
  tran_src  VARCHAR2(1) not null,
  full_name VARCHAR2(40) not null,
  abbr_name VARCHAR2(50) not null
)
;
create table T_TRAN_STS_TBL
(
  tran_sts  VARCHAR2(1) not null,
  full_name VARCHAR2(40) not null,
  abbr_name VARCHAR2(10) not null
)
;
create table T_ACCT_DETAIL0
(
  account_no     NUMBER(20),
  polno          VARCHAR2(16) not null,
  certno         VARCHAR2(16) not null,
  plan_code      VARCHAR2(10) not null,
  acct_code      VARCHAR2(6) not null,
  tran_type      VARCHAR2(1) not null,
  fund_code      VARCHAR2(4) not null,
  tran_seq       VARCHAR2(16) not null,
  tran_times     NUMBER(4) default 1 not null,
  bargn_sum      NUMBER(12,2) default 0 not null,
  net_invest_sum NUMBER(12,2) default 0 not null,
  fund_price     NUMBER(14,4) default 0 not null,
  price_date     DATE,
  entst_fund_amt NUMBER(14,4) default 0 not null,
  bargn_fund_amt NUMBER(14,4) default 0 not null,
  entst_date     DATE,
  bargn_date     DATE,
  tran_src       VARCHAR2(1) not null,
  ctrlno         VARCHAR2(16),
  tran_sts       VARCHAR2(1) not null,
  collect_date   DATE,
  organ_id       VARCHAR2(40) not null,
  deptno         VARCHAR2(20) not null,
  fcd            DATE not null,
  fcu            VARCHAR2(10) not null,
  lcd            DATE not null,
  lcu            VARCHAR2(10) not null
)
;
create table T_ACCT_DETAIL1
(
  polno             VARCHAR2(16) not null,
  certno            VARCHAR2(16) not null,
  plan_code         VARCHAR2(10) not null,
  acct_code         VARCHAR2(6) not null,
  vs_acct_code      VARCHAR2(6) not null,
  tran_type         VARCHAR2(1) not null,
  fund_code         VARCHAR2(4) not null,
  vs_fund_code      VARCHAR2(4),
  tran_seq          VARCHAR2(16) not null,
  account_no        NUMBER(20),
  tran_times        NUMBER(4) default 1 not null,
  bargn_sum         NUMBER(12,2) default 0 not null,
  fund_price        NUMBER(14,4) default 0 not null,
  vs_fund_price     NUMBER(14,4) default 0 not null,
  price_date        DATE,
  entst_fund_amt    NUMBER(14,4) default 0 not null,
  bargn_fund_amt    NUMBER(14,4) default 0 not null,
  vs_bargn_fund_amt NUMBER(14,4) default 0 not null,
  entst_date        DATE,
  bargn_date        DATE,
  tran_src          VARCHAR2(1) not null,
  ctrlno            VARCHAR2(16),
  tran_sts          VARCHAR2(1) not null,
  collect_date      DATE,
  organ_id          VARCHAR2(40) not null,
  deptno            VARCHAR2(20) not null,
  fcd               DATE not null,
  fcu               VARCHAR2(10) not null,
  lcd               DATE not null,
  lcu               VARCHAR2(10) not null
)
;
create table T_ACCT_STS_TBL
(
  acct_sts  VARCHAR2(1) not null,
  full_name VARCHAR2(40) not null,
  abbr_name VARCHAR2(10) not null
)
;
create table T_ACCT_TRANSACTION
(
  tran_seq       VARCHAR2(16) not null,
  account_no     NUMBER(20),
  polno          VARCHAR2(16) not null,
  certno         VARCHAR2(16) not null,
  plan_code      VARCHAR2(10) not null,
  acct_code      VARCHAR2(6) not null,
  tran_type      VARCHAR2(1) not null,
  fund_code      VARCHAR2(4) not null,
  bargn_sum      NUMBER(14,4) default 0 not null,
  net_invest_sum NUMBER(14,4) default 0 not null,
  bargn_date     DATE,
  tran_src       VARCHAR2(1) not null,
  ctrlno         VARCHAR2(16),
  organ_id       VARCHAR2(40) not null,
  deptno         VARCHAR2(20) not null,
  fcd            DATE not null,
  fcu            VARCHAR2(10) not null,
  lcd            DATE not null,
  lcu            VARCHAR2(10) not null
)
;
create table T_ACCT_TYPE_TBL
(
  acct_type NUMBER(2) not null,
  type_name VARCHAR2(20) not null
)
;
create table T_ACCUMU_TYPE
(
  accumu_type NUMBER(2) not null,
  type_name   VARCHAR2(100) not null
)
;
create table T_ACCUM_BILL_STATUS
(
  bill_status NUMBER(2) not null,
  status_desc VARCHAR2(40) not null
)
;
create table T_AGRICULTURE_TOWN
(
  list_id     NUMBER(10) not null,
  organ_id    VARCHAR2(40) not null,
  town_id     VARCHAR2(40) not null,
  town_name   VARCHAR2(100) not null,
  insert_time DATE default SYSDATE not null,
  insert_id   NUMBER(10) not null,
  update_time DATE default SYSDATE,
  update_id   NUMBER(10),
  status      CHAR(1) default '1'
)
;
create table T_AGRICULTURE_VILLAGE
(
  list_id         NUMBER(10) not null,
  organ_id        VARCHAR2(40) not null,
  town_id         VARCHAR2(40) not null,
  village_id      VARCHAR2(40) not null,
  village_name    VARCHAR2(100) not null,
  address         VARCHAR2(100),
  remark          VARCHAR2(4000),
  insert_time     DATE default SYSDATE not null,
  insert_id       NUMBER(10) not null,
  update_time     DATE default SYSDATE,
  update_id       NUMBER(10),
  status          CHAR(1) default '1',
  interac_agricul CHAR(1) default 'N'
)
;
create table T_ACCUM_BILL
(
  accum_bill_id              NUMBER(10) not null,
  accum_bill_no              VARCHAR2(20) not null,
  bill_status                NUMBER(2) default -1 not null,
  organ_id                   VARCHAR2(40),
  agent_id                   NUMBER(10),
  policy_type                CHAR(1),
  upload_date                DATE,
  insert_time                DATE default SYSDATE not null,
  update_time                DATE default SYSDATE not null,
  recorder_id                NUMBER(10),
  check_id                   NUMBER(10),
  pending_cause              VARCHAR2(2),
  sell_way                   VARCHAR2(2),
  nb_agency_code             VARCHAR2(20),
  second_develop             CHAR(1),
  inspect_prompt             VARCHAR2(1000)
  inspect_time               DATE,
  scan_time                  DATE,
  hold_date                  DATE,
  deliver_id                 NUMBER(10),
  deliver_date               DATE,
  call_status                NUMBER(1),
  call_result                NUMBER(1),
  rule_source                NUMBER(1),
  back_entry_desc            VARCHAR2(1000),
  back_entry_id              NUMBER(10),
  back_entry_time            DATE,
  assumptsit_text            VARCHAR2(4000),
  assumptsit_related         CHAR(1) default 'N',
  agri_net                   CHAR(1),
  village_list_id            NUMBER(10),
  accum_company              VARCHAR2(100),
  operater_id                NUMBER(10),
  company_id                 NUMBER(10),
  first_payment_way          CHAR(1),
  end_operater_id            NUMBER(10),
  end_date                   DATE,
  accum_end                  NUMBER(2),
  accum_end_cause            VARCHAR2(500),
  accum_bill_print           NUMBER(2),
  print_date                 DATE,
  handle_id                  VARCHAR2(20),
  is_free_insurance          CHAR(1),
  is_nonprofit_nature        CHAR(1),
  joint_business_development CHAR(1),
  recommend_id               VARCHAR2(100),
  recommend_name             VARCHAR2(100)
)
;
create table T_ACCUM_BILL_PRODUCT
(
  item_id             NUMBER(10) not null,
  accum_bill_id       NUMBER(10) not null,
  product_num         CHAR(3) not null,
  product_id          NUMBER(10) not null,
  amount              NUMBER(14,4),
  period_prem         NUMBER(12,2),
  pay_rate            NUMBER(4,3),
  elimination_period  NUMBER(5),
  except_value        NUMBER(10),
  coverage_period     CHAR(1) not null,
  coverage_year       NUMBER(3),
  charge_period       CHAR(1) not null,
  charge_year         NUMBER(3),
  charge_type         CHAR(1),
  bespoke_renew_limit NUMBER(2),
  bespoke_renew_month NUMBER(2),
  bespoke_renew_day   NUMBER(3),
  is_continue_apply   CHAR(1)
)
;
create table T_ACCUM_BILL_AMT_SECTOR
(
  sector_id       NUMBER(10) not null,
  item_id         NUMBER(10) not null,
  amt_lower_limit NUMBER(8) not null,
  amt_upper_limit NUMBER(8) not null,
  pay_rate        NUMBER(4,3) not null,
  social_security CHAR(1),
  except_value    NUMBER(8)
)
;
create table T_EDOC_DISPOSAL_STATUS
(
  disposal_status NUMBER(2) not null,
  status_desc     VARCHAR2(40) not null
)
;
create table T_EDOC_DISPOSAL_WAY
(
  disposal_way  NUMBER(2) not null,
  disposal_desc VARCHAR2(40) not null
)
;
create table T_EDOC_FILE_SOURCE
(
  file_source NUMBER(2) not null,
  source_desc VARCHAR2(40) not null
)
;
create table T_EDOC_TEMPL_CATE
(
  cate_id   NUMBER(2) not null,
  cate_name VARCHAR2(80) not null
)
;
create table T_EDOC_TEMPL
(
  templ_id     NUMBER(10) not null,
  templ_name   VARCHAR2(80) not null,
  file_type    VARCHAR2(10) not null,
  cate_id      NUMBER(2) not null,
  format_type  NUMBER(2) not null,
  head_lines   NUMBER(10) default 0,
  bottom_lines NUMBER(10) default 0,
  memo         VARCHAR2(200),
  creator_id   NUMBER(10),
  insert_time  DATE default sysdate,
  modifier_id  NUMBER(10),
  update_time  DATE default sysdate
)
;
create table T_UPLOAD_TEXT
(
  upload_id       NUMBER(10) not null,
  template_id     NUMBER(10) not null,
  text            CLOB,
  change_id       NUMBER(10),
  uploader_id     NUMBER(10),
  upload_time     DATE default SYSDATE not null,
  policy_id       NUMBER(10),
  disposal_way    NUMBER(2),
  disposal_status NUMBER(2),
  file_source     NUMBER(2),
  service_id      NUMBER(10),
  accum_bill_id   NUMBER(10),
  sell_way        VARCHAR2(2)
)

create table T_ACCUM_BILL_POLICY
(
  policy_id         NUMBER(10) not null,
  accum_bill_id     NUMBER(10),
  insert_time       DATE default SYSDATE not null,
  update_time       DATE default SYSDATE not null,
  upload_id         NUMBER(10),
  rule_check_result NUMBER(1),
  break_rule_desc   VARCHAR2(3000),
  policy_num        NUMBER(10),
  accum_related     CHAR(1) default 'N',
  class_name        VARCHAR2(100)
)
;
create table T_ACCUM_END_CAUSE
(
  cause_id   NUMBER(2) not null,
  cause_desc VARCHAR2(50)
)
;
create table T_ACCUM_PROD_DISABLE_RATE
(
  list_id       NUMBER(10) not null,
  item_id       NUMBER(10),
  disable_level VARCHAR2(2),
  disable_rate  NUMBER(10,2),
  insert_time   DATE default SYSDATE
)
;
create table T_DATA_TYPE
(
  data_type NUMBER(1) not null,
  type_name VARCHAR2(40) not null,
  type_desc VARCHAR2(200) not null
)
;
create table T_CLAIM_RELATIVITY
(
  list_id   NUMBER(10) not null,
  name      VARCHAR2(200),
  operator  VARCHAR2(2),
  calc_func VARCHAR2(100),
  data_type NUMBER(1)
)
;
create table T_CONDITION_TYPE
(
  condition_type NUMBER(2) not null,
  type_desc      VARCHAR2(50) not null
)
;
create table T_ACCUTOR
(
  accutor_id     NUMBER(10) not null,
  accutor_code   VARCHAR2(100) not null,
  accutor_desc   VARCHAR2(400) not null,
  accumu_type    NUMBER(2) not null,
  indivi_family  CHAR(1) default 'N' not null,
  inside_policy  CHAR(1) default 'Y' not null,
  condition_type NUMBER(2) default 0 not null,
  limit_unit     CHAR(1) default 'N' not null,
  insert_time    DATE default SYSDATE not null,
  update_time    DATE default SYSDATE not null,
  relativity1    NUMBER,
  relativity2    NUMBER,
  relativity3    NUMBER,
  relativity4    NUMBER,
  relativity5    NUMBER,
  relativity6    NUMBER,
  recorder_id    NUMBER(10) not null,
  updater_id     NUMBER(10) not null
)
;
create table T_ACCUTION
(
  accution_id    NUMBER(10) not null,
  accutor_id     NUMBER(10) not null,
  policy_id      NUMBER(10),
  insured_id     NUMBER(10),
  family_id      NUMBER(10),
  start_date     DATE not null,
  end_date       DATE not null,
  accumu_deduct  NUMBER(12,2) not null,
  accumu_selfpay NUMBER(12,2) not null,
  accumu_over    NUMBER(12,2) not null,
  accumu_pay     NUMBER(12,2) not null,
  accumu_service NUMBER(4) not null,
  recorder_id    NUMBER(10) not null,
  insert_time    DATE default SYSDATE not null,
  updater_id     NUMBER(10) not null,
  update_time    DATE default SYSDATE not null,
  continued_case NUMBER(10) default 0 not null
)
;
create table T_LIABILITY_CATEGORY
(
  category_id   NUMBER(2) not null,
  category_name VARCHAR2(40) not null,
  liab_type     NUMBER(4)
)
;
create table T_LIABILITY
(
  liab_id       NUMBER(4) not null,
  liab_category NUMBER(2) not null,
  liab_name     VARCHAR2(100) not null
)
;
create table T_ACCUTION_LIST
(
  list_id             NUMBER not null,
  case_id             NUMBER(10) not null,
  policy_id           NUMBER(10) not null,
  item_id             NUMBER(10) not null,
  liab_id             NUMBER(10),
  accution_id         NUMBER(10) not null,
  calcu_deduct        NUMBER(12,2) default (0) not null,
  actual_deduct       NUMBER(12,2) default (0) not null,
  calcu_selfpay       NUMBER(12,2) default (0) not null,
  actual_selfpay      NUMBER(12,2) default (0) not null,
  calcu_over          NUMBER(12,2) default (0) not null,
  actual_over         NUMBER(12,2) default (0) not null,
  service_count       NUMBER(4) default (0) not null,
  input_amount        NUMBER(12,2) default (0) not null,
  output_amount       NUMBER(12,2) default (0) not null,
  accut_param_id      NUMBER(10) not null,
  recorder_id         NUMBER(10) not null,
  insert_time         DATE default SYSDATE not null,
  updater_id          NUMBER(10) not null,
  update_time         DATE default SYSDATE not null,
  accutor_id          NUMBER(10),
  accutor_benefit_id  NUMBER(10),
  input_service_count NUMBER(4)
)
;
create table T_INPUT_SOURCE
(
  input_type NUMBER(2) not null,
  type_name  VARCHAR2(100) not null
)
;
create table T_ACCUTOR_BENEFIT
(
  list_id       NUMBER(10) not null,
  accutor_id    NUMBER(10) not null,
  product_id    NUMBER(7),
  liab_id       NUMBER(4),
  input_source  NUMBER(2) not null,
  execute_order NUMBER(4) not null,
  input_list_id NUMBER(10),
  input_func    VARCHAR2(100),
  input_desc    VARCHAR2(200),
  input_param1  VARCHAR2(50),
  output_type   CHAR(1) default '1' not null
)
;
create table T_ACCUTOR_CHAIN
(
  list_id        NUMBER(10) not null,
  input_accutor  NUMBER(10) not null,
  output_accutor NUMBER(10) not null,
  output_rate    NUMBER(12,2) default 1 not null
)
;
create table T_ACCUTOR_PARAM
(
  list_id         NUMBER(10) not null,
  accutor_id      NUMBER(10) not null,
  param_1         NUMBER(12,2),
  param_2         NUMBER(12,2),
  formula_1       VARCHAR2(100),
  formula_2       VARCHAR2(100),
  relv1_value     VARCHAR2(20),
  relv2_value     VARCHAR2(20),
  relv3_value     VARCHAR2(20),
  relv4_value     VARCHAR2(20),
  relv5_value     VARCHAR2(20),
  relv6_value     VARCHAR2(20),
  description     VARCHAR2(200),
  recorder_id     NUMBER(10) not null,
  insert_time     DATE default SYSDATE not null,
  updater_id      NUMBER(10) not null,
  update_time     DATE default SYSDATE not null,
  def_period_type NUMBER(4),
  param_0         VARCHAR2(100)
)
;
create table T_ACCU_COMPANY_CUSTOMER
(
  parent_id          NUMBER(10),
  company_id         NUMBER(10) not null,
  company_name       VARCHAR2(150),
  abbr_name          VARCHAR2(50),
  found_date         DATE,
  type_id            NUMBER(4),
  tax_code           VARCHAR2(20),
  zip                VARCHAR2(6),
  address            VARCHAR2(100),
  area_code          VARCHAR2(5),
  telephone          VARCHAR2(30),
  fax                VARCHAR2(30),
  email              VARCHAR2(50),
  notes              VARCHAR2(4000),
  parent_name        VARCHAR2(100),
  job_kind           NUMBER(2),
  organ_code         VARCHAR2(20),
  staff_amount       NUMBER(10),
  register_capital   NUMBER(10),
  capital_investment NUMBER(10),
  yield_rate         NUMBER(6,4),
  main_operation     VARCHAR2(100),
  distrinct_code     VARCHAR2(10),
  register_code      VARCHAR2(100),
  url                VARCHAR2(50),
  distribute_type    CHAR(1),
  company_level      VARCHAR2(50),
  leader_name        VARCHAR2(50),
  retired_staff      NUMBER(10),
  ss_register_num    VARCHAR2(30),
  claim_bank         VARCHAR2(20),
  claim_account      VARCHAR2(40),
  password           VARCHAR2(32),
  address_2          VARCHAR2(100),
  address_3          VARCHAR2(100),
  address_4          VARCHAR2(100),
  hospital_agree     CHAR(1),
  insert_time        DATE,
  update_time        DATE,
  pwd_print          NUMBER(4),
  register_date      DATE,
  cust_grade         VARCHAR2(2),
  country_code       VARCHAR2(3),
  cpf_bank           VARCHAR2(20),
  cpf_account        VARCHAR2(40),
  comp_reg_code      VARCHAR2(40),
  comp_level         CHAR(1),
  social_date        DATE,
  on_duty_staff      NUMBER(10),
  id_type            CHAR(1),
  id_no              VARCHAR2(80),
  area_id            VARCHAR2(10),
  rela_name          VARCHAR2(100),
  rela_tel           VARCHAR2(40),
  rela_dept          VARCHAR2(100),
  rela_email         VARCHAR2(100),
  tax_code_begin     DATE,
  tax_code_end       DATE,
  organ_code_begin   DATE,
  organ_code_end     DATE
)
;
create table T_ACC_BIZ_FIN
(
  fund_code    VARCHAR2(20) not null,
  biz_acc_code VARCHAR2(20) not null,
  fin_acc_code VARCHAR2(10),
  fin_acc_name VARCHAR2(50)
)
;
create table T_ACC_INT_TYPE
(
  rate_type VARCHAR2(2),
  type_name VARCHAR2(100) not null
)
;
create table T_ACC_INT_SCHEME
(
  product_id   NUMBER(10) not null,
  account_name VARCHAR2(50) default 'DEFAULT' not null,
  start_date   DATE default to_date('1900-01-01','yyyy-mm-dd') not null,
  int_type     VARCHAR2(2) not null,
  int_rate     NUMBER(10,9),
  recorder_id  NUMBER(10) not null,
  insert_time  DATE default SYSDATE not null,
  updater_id   NUMBER(10) not null,
  update_time  DATE default SYSDATE not null,
  checked      CHAR(1) default 'N' not null
)
;
create table T_ACC_INT_SCHEME_EXT
(
  product_id    NUMBER(10) not null,
  account_name  VARCHAR2(50) default 'DEFAULT' not null,
  start_date    DATE default to_date('1900-01-01','yyyy-mm-dd') not null,
  int_type      VARCHAR2(2) not null,
  int_rate      NUMBER(10,9) not null,
  recorder_id   NUMBER(10) not null,
  insert_time   DATE default SYSDATE,
  updater_id    NUMBER(10),
  update_time   DATE default SYSDATE,
  checked       CHAR(1) default 'N',
  new_rate_flag CHAR(1) not null
)
;
create table T_ACC_RATE_TYPE
(
  type_id   NUMBER(2) not null,
  type_name VARCHAR2(120)
)
;
create table T_POLICY_SOURCE_TYPE
(
  p_source_type CHAR(1) not null,
  type_name     VARCHAR2(200) not null
)
;
create table T_POLICY_STATE
(
  p_state_id NUMBER(3) not null,
  state      VARCHAR2(100)
)
;
create table T_DECLARE_STATUS
(
  declare_status CHAR(1) not null,
  status_name    VARCHAR2(60) not null
)
;
create table T_POLICY
(
  policy_id            NUMBER(10) not null,
  policy_code          VARCHAR2(20),
  send_code            VARCHAR2(20) not null,
  branch_id            VARCHAR2(40),
  head_id              VARCHAR2(40),
  hold_date            DATE,
  holder_id            NUMBER(10),
  holder_age           NUMBER(3),
  validate_date        DATE,
  send_date            DATE,
  p_state_id           NUMBER(3),
  agent_id             NUMBER(10),
  sign_id              NUMBER(10),
  check_id             NUMBER(10),
  pay_mode             NUMBER(2) default 1,
  bank_account         VARCHAR2(40),
  insert_time          DATE default SYSDATE not null,
  recorder_id          NUMBER(10),
  user_id              NUMBER(10),
  update_time          DATE,
  updater_id           NUMBER(10),
  accept_date          DATE,
  inspect_time         DATE,
  inspector_id         NUMBER(10),
  checkout_time        DATE,
  end_time             DATE,
  high_policy          CHAR(1) default 'N' not null,
  auto_end             DATE,
  man_start            DATE,
  wait_reply           DATE,
  reply_end            DATE,
  process_end          DATE,
  checking_id          NUMBER(10),
  address_2            VARCHAR2(200),
  zip_2                VARCHAR2(10),
  tel_2                VARCHAR2(40),
  job_1                VARCHAR2(200),
  job_2                VARCHAR2(40),
  job_code             VARCHAR2(20),
  job_cate_id          NUMBER(10),
  job_class_1          NUMBER(2),
  group_single         CHAR(1) default '2',
  pay_next             NUMBER(2),
  deliver_type         CHAR(1),
  policy_type          CHAR(1) default '1' not null,
  organ_id             VARCHAR2(40),
  period_prem          NUMBER(12,2) default 0 not null,
  normal_prem          NUMBER(12,2) default 0 not null,
  weak_prem            NUMBER(12,2) default 0 not null,
  job_prem             NUMBER(12,2) default 0 not null,
  disable_prem         NUMBER(12,2) default 0 not null,
  relation_id          NUMBER(2),
  first_notion         VARCHAR2(1000),
  group_policy_id      NUMBER(10),
  inspect_prompt       VARCHAR2(1000),
  balance_prem         NUMBER(12,2) default 0 not null,
  over_manage          CHAR(1) default '2' not null,
  recorder_prompt      VARCHAR2(1000),
  level_id             NUMBER(2) default 1 not null,
  em_life              NUMBER(4) default 0 not null,
  em_ill               NUMBER(4) default 0 not null,
  receipt_code         VARCHAR2(200),
  overdue_manage       CHAR(1),
  first_id             NUMBER(10),
  pay_way              VARCHAR2(2),
  policy_year          NUMBER(2) default 1 not null,
  policy_period        NUMBER(4) default 1 not null,
  assumpsit            VARCHAR2(4000),
  check_note           VARCHAR2(1000),
  next_time            DATE,
  service_type         CHAR(1) default '3',
  pause_time           DATE,
  company_prem         NUMBER(12,2) default 0,
  empployee_prem       NUMBER(12,2) default 0,
  insurant_num         NUMBER(10),
  sys_lock_time        DATE,
  sys_locker_id        NUMBER(10),
  sys_lock_status      CHAR(1) default '0' not null,
  discount_prem        NUMBER(12,2) default 0 not null,
  dept_id              VARCHAR2(20),
  money_id             NUMBER(6) default 1 not null,
  transfer_data        CHAR(1) default 'N' not null,
  record_end           DATE,
  normal_stand         NUMBER(12,2) default 0 not null,
  weak_stand           NUMBER(12,2) default 0 not null,
  job_stand            NUMBER(12,2) default 0 not null,
  disable_stand        NUMBER(12,2) default 0 not null,
  bank_code            VARCHAR2(20),
  agency_code          VARCHAR2(20),
  agency_hand          NUMBER(10),
  branch_bank          VARCHAR2(20),
  nb_agency_code       VARCHAR2(20),
  appro_emp_id         NUMBER(10),
  policy_print         NUMBER(2) default 0 not null,
  receipt_print        NUMBER(2) default 0 not null,
  print_time           DATE,
  sell_way             VARCHAR2(2) default '0',
  tax_prem             NUMBER(12,2) default 0 not null,
  answer_type          VARCHAR2(1) default '0' not null,
  is_answered          VARCHAR2(1) default 'N' not null,
  auto_decision        NUMBER(2) default 0 not null,
  policy_prem          NUMBER(12,2) default 0 not null,
  policy_stand         NUMBER(12,2) default 0 not null,
  address_2_2          VARCHAR2(100),
  address_2_3          VARCHAR2(100),
  address_2_4          VARCHAR2(100),
  tax_prem_stand       NUMBER(12,2) default 0 not null,
  matu_pay_mode        NUMBER(2),
  matu_process         VARCHAR2(1),
  insurant_id          NUMBER(10),
  benefit_level        VARCHAR2(4),
  cpf_account          VARCHAR2(40),
  campaign_code        VARCHAR2(10),
  policy_ref           VARCHAR2(20),
  master_num           NUMBER(10),
  relation_m           NUMBER(2),
  derivation           CHAR(1) default '1' not null,
  former_id            NUMBER(10),
  full_declare         CHAR(1) default 0 not null,
  return_time          DATE,
  return_id            NUMBER(10),
  discount_tax         NUMBER(12,2) default 0 not null,
  pending_cause        VARCHAR2(2),
  first_end            DATE,
  commission_rate      NUMBER(4,3) default 0 not null,
  answer_assumpsit     VARCHAR2(1000),
  emp_no               VARCHAR2(40),
  scan_time            DATE default sysdate,
  issue_way            NUMBER(10) default 1,
  uw_notes             VARCHAR2(4000),
  first_user_id        NUMBER(10),
  answer_tel           VARCHAR2(40),
  company_id           NUMBER(10),
  dou_emp_insured_indi CHAR(1),
  hi_plan_id           NUMBER(10),
  p_source_type        CHAR(1),
  init_prem            NUMBER(12,2),
  actual_discount_rate NUMBER(14,4),
  rate_table_prem      NUMBER(12,2),
  accept_prompt        VARCHAR2(1000),
  air_code             VARCHAR2(20),
  second_develop       CHAR(1),
  agriculture_net      CHAR(1),
  policy_input_source  VARCHAR2(5) default 0,
  is_relocate          CHAR(1),
  is_upload            CHAR(1),
  notes                VARCHAR2(2000),
  is_switch_policy     CHAR(1),
  unite_system_check   CHAR(1),
  is_relation_business CHAR(1),
  is_optimal_policy    VARCHAR2(1),
  nb_agency_sales_id   NUMBER(10),
  is_endowment         VARCHAR2(1)
)

create table T_ACC_RISK_QUERY_TASK
(
  task_id         NUMBER(12) not null,
  policy_id       NUMBER(12),
  group_policy_id NUMBER(12),
  query_type      NUMBER(2) not null,
  change_id       NUMBER(12),
  case_id         NUMBER(12),
  insert_time     DATE default sysdate not null,
  update_time     DATE default sysdate not null,
  status          NUMBER(1) default 0 not null,
  error_msg       VARCHAR2(2000)
)
;
create table T_ACC_RISK_CLAIM_INFO
(
  id          NUMBER(10) not null,
  real_name   VARCHAR2(100) not null,
  gender      CHAR(1) not null,
  birthday    DATE not null,
  certi_type  VARCHAR2(2) not null,
  certi_code  VARCHAR2(50) not null,
  insert_time DATE,
  update_time DATE,
  task_id     NUMBER(12)
)
;
create table T_ACC_RISK_CLAIMINF_SUB
(
  id           NUMBER(12) not null,
  sub_id       NUMBER(12) not null,
  claim_no     VARCHAR2(100) not null,
  company_code VARCHAR2(10) not null,
  claim_date   DATE,
  loss_date    DATE,
  loss_result  VARCHAR2(4)
)
;
create table T_ACC_RISK_CLAIM_QUERY
(
  id                 NUMBER(12) not null,
  task_id            NUMBER(12) not null,
  real_name          VARCHAR2(100) not null,
  gender             CHAR(1) not null,
  birthday           DATE not null,
  certi_type         NUMBER(2) not null,
  certi_code         VARCHAR2(50) not null,
  is_risk            NUMBER(3),
  loss_times         NUMBER(5),
  sum_claim_amount   NUMBER(12,2),
  refuse_claim_times NUMBER(5),
  status             NUMBER(3)
)
;
create table T_ACC_RISK_CLAIM_SUB
(
  id           NUMBER(12) not null,
  query_id     NUMBER(12) not null,
  company_code VARCHAR2(10),
  loss_date    DATE,
  loss_result  VARCHAR2(4),
  claim_amount NUMBER(12,2)
)
;
create table T_ACC_RISK_INSURANCE_INFO
(
  id               NUMBER(10) not null,
  insured_name     VARCHAR2(100) not null,
  gender           CHAR(1) not null,
  birthday         DATE not null,
  certi_type       VARCHAR2(2) not null,
  certi_code       VARCHAR2(50) not null,
  is_risk          NUMBER(1) not null,
  company_quantity NUMBER(3) default 0,
  policy_quantity  NUMBER(3) default 0,
  sum_amount       NUMBER(14,2) default 0,
  refuse_times     NUMBER(3) default 0,
  isrisk_person    NUMBER(1) default 0 not null,
  insert_time      DATE,
  update_time      DATE,
  task_id          NUMBER(12)
)
;
create table T_ACC_RISK_QUERY
(
  id               NUMBER(12) not null,
  task_id          NUMBER(12) not null,
  real_name        VARCHAR2(100) not null,
  gender           CHAR(1) not null,
  birthday         DATE not null,
  certi_type       NUMBER(2) not null,
  certi_code       VARCHAR2(50) not null,
  is_risk          NUMBER(1) not null,
  company_quantity NUMBER(3) default 0 not null,
  policy_quantity  NUMBER(3) default 0 not null,
  sum_amount       NUMBER(14,2) default 0 not null,
  refuse_times     NUMBER(3) default 0 not null,
  is_risk_person   NUMBER(1) default 0 not null,
  is_success       NUMBER(1) default 0 not null
)
;
create table T_ACC_RISK_QUERY_TEMP
(
  case_id   NUMBER(12),
  error_msg VARCHAR2(4000)
)
;
create table T_ACHIEVE_AWARD
(
  achieve_award_id   NUMBER(4) not null,
  area_type          NUMBER(10),
  achieve_award_type NUMBER(1),
  description        VARCHAR2(200),
  achieve_rate       NUMBER(4,3),
  rate               NUMBER(5,4)
)
;
create table T_ACTUARY_ANNU_PA
(
  item_id   NUMBER(10) not null,
  annu_pa   NUMBER(12,2) default 0 not null,
  stat_date DATE default SYSDATE not null
)
;
create table T_ACTUARY_AP
(
  item_id   NUMBER(10) not null,
  ap        NUMBER(12,2) default 0 not null,
  stat_date DATE default SYSDATE not null
)
;
create table T_ACTUARY_CPFISMV
(
  mv_mode     VARCHAR2(2) not null,
  plan_type   VARCHAR2(1) not null,
  ymd         VARCHAR2(8) not null,
  policy_num  NUMBER(10) default 0 not null,
  surr_value  NUMBER(16,2) default 0 not null,
  insert_time DATE default SYSDATE not null
)
;
create table T_ACTUARY_RP
(
  item_id   NUMBER(10) not null,
  rp        NUMBER(12,2) default 0 not null,
  stat_date DATE default SYSDATE not null
)
;
create table T_ACTUARY_TPREM
(
  item_id   NUMBER(10) not null,
  tprem     NUMBER(12,2) default 0 not null,
  stat_date DATE default SYSDATE not null
)
;
create table T_ACTUARY_VALUATN
(
  mov   VARCHAR2(3),
  yiss  VARCHAR2(12),
  cat   VARCHAR2(3),
  bs    VARCHAR2(6),
  pl    VARCHAR2(30),
  tm    NUMBER(4),
  pt    NUMBER(4),
  ea    NUMBER(4),
  pol   NUMBER(7),
  sa    NUMBER(14,2),
  ab    NUMBER(14,2),
  nb    NUMBER(14,2),
  ap    NUMBER(14,2),
  ep    NUMBER(14,2),
  rp    NUMBER(14,2),
  dp    NUMBER(14,2),
  ibsa  NUMBER(14,2),
  zm    NUMBER(14,2),
  up    NUMBER(14,2),
  sx    VARCHAR2(3),
  pn    VARCHAR2(45),
  ea2   NUMBER(4),
  de    VARCHAR2(24),
  db    VARCHAR2(24),
  dt    VARCHAR2(24),
  npd   VARCHAR2(24),
  pm    VARCHAR2(3),
  rd    VARCHAR2(60),
  cpfis VARCHAR2(6),
  tprem NUMBER(14,2),
  dc    VARCHAR2(24),
  sc    VARCHAR2(3),
  psd   VARCHAR2(24)
)
;
create table T_ACTUARY_VALU_HIS
(
  due_year_month CHAR(6) not null,
  exec_status    CHAR(1) not null,
  exec_mode      CHAR(1) not null,
  exec_date      DATE default SYSDATE not null
)
;
create table T_NODE_STATUS
(
  node_status CHAR(1) not null,
  status_name VARCHAR2(50) not null
)
;
create table T_BALANCE_MODE
(
  book_id   NUMBER(10) not null,
  mode_id   NUMBER(2) not null,
  mode_name VARCHAR2(20) not null
)
;
create table T_BOOK_ACCOUNT
(
  book_id         NUMBER(10) not null,
  parent_code     VARCHAR2(40) not null,
  account_code    VARCHAR2(40) not null,
  name            VARCHAR2(500) not null,
  full_name       VARCHAR2(500) not null,
  change          CHAR(1) default 'Y' not null,
  extend          CHAR(1) default 'Y' not null,
  account_grade   NUMBER(1) not null,
  leaf            CHAR(1) default 'Y' not null,
  balance         CHAR(1) not null,
  check_foreign   CHAR(1) default 'N' not null,
  money_id        NUMBER(6) not null,
  print_format    CHAR(1) default '1' not null,
  analysis_code   VARCHAR2(300),
  daily_account   CHAR(1) default 'N' not null,
  cash_account    CHAR(1) default 'N' not null,
  bank_account    CHAR(1) default 'N' not null,
  balance_mode    NUMBER(2),
  organ_check     CHAR(1) default 'N' not null,
  product_check   CHAR(1) default 'N' not null,
  dept_check      CHAR(1) default 'N' not null,
  invoice         CHAR(1) default 'N' not null,
  node_status     CHAR(1) not null,
  account_cate_id NUMBER(2) not null,
  channel_check   CHAR(1) default 'N' not null,
  benefit_check   CHAR(1) default 'N' not null,
  busi_check      CHAR(1) default 'N' not null,
  period_check    CHAR(1) default 'N' not null,
  unit_check      CHAR(1) default 'N' not null,
  unit_id         VARCHAR2(10)
)
;
create table T_COMMISION_TYPE
(
  commision_type_id NUMBER(5) not null,
  commision_name    VARCHAR2(30),
  status            NUMBER(1),
  agent_cate        VARCHAR2(1) not null,
  comm_area_type    CHAR(1) default 'N',
  comm_agent_cate   CHAR(1) default 'N',
  comm_grade_id     CHAR(1) default 'N',
  comm_position_id  CHAR(1) default 'N',
  comm_months       CHAR(1) default 'N',
  comm_amount       CHAR(1) default 'N',
  run_type          CHAR(1) default '0',
  proc_name         VARCHAR2(100),
  run_order         NUMBER(6) default 0,
  gl_post           CHAR(1) default 'N',
  sum_indi          CHAR(1) default 'N',
  show_indi         CHAR(1) default 'N',
  show_order        NUMBER(6) default 0
)
;
create table T_VOUCHERCATE_TEMPLET
(
  voucher_cate_id NUMBER(2) not null,
  cate_name       VARCHAR2(20) not null,
  limit_type      CHAR(1) default '0',
  limit_account   VARCHAR2(400),
  node_status     CHAR(1) default '0' not null,
  short_name      VARCHAR2(10) not null
)
;
create table T_AC_RULE_COMM
(
  config_id         NUMBER(10) not null,
  commision_type_id NUMBER(5) not null,
  book_id           NUMBER(10) not null,
  fee_type_check    CHAR(1) not null,
  fee_type          NUMBER(2),
  policy_type_check CHAR(1) not null,
  policy_type       CHAR(1),
  product_check     CHAR(1) not null,
  product_id        NUMBER(10),
  agent_cate_check  CHAR(1) not null,
  agent_cate        VARCHAR2(1),
  debit_account     VARCHAR2(40) not null,
  credit_account    VARCHAR2(40) not null,
  voucher_cate_id   NUMBER(2) not null,
  description       VARCHAR2(100) not null,
  money_id          NUMBER(6) not null,
  arap_type_check   CHAR(1) not null,
  arap_type         CHAR(1),
  organ_check       CHAR(1) not null
)
;
create table T_AC_RULE_RI
(
  config_id       NUMBER(10) not null,
  ri_fee_type     NUMBER(2) not null,
  book_id         NUMBER(10) not null,
  money_id        NUMBER(6) not null,
  channel_check   CHAR(1) default 'N' not null,
  channel_type    NUMBER(2),
  paymode_check   CHAR(1) default 'N' not null,
  pay_mode        NUMBER(2),
  organ_check     CHAR(1) default 'N' not null,
  product_check   CHAR(1) default 'N' not null,
  product_id      NUMBER(10),
  debit_account   VARCHAR2(40) not null,
  credit_account  VARCHAR2(40) not null,
  voucher_cate_id NUMBER(2) not null,
  description     VARCHAR2(100) not null
)
;
create table T_AC_RULE_TRAD
(
  config_id     NUMBER(12) not null,
  fee_type      NUMBER(3) not null,
  currency_code VARCHAR2(10) not null,
  paymode_indi  CHAR(1) not null,
  pay_mode      NUMBER(2),
  nsre_indi     CHAR(1) not null,
  nsre          VARCHAR2(10),
  period_indi   CHAR(1) not null,
  period_type   VARCHAR2(10),
  dr_seg1_indi  CHAR(1),
  dr_seg1       VARCHAR2(25),
  dr_seg4_indi  CHAR(1) not null,
  dr_seg4       VARCHAR2(25),
  dr_seg6_indi  CHAR(1),
  dr_seg6       VARCHAR2(25),
  dr_seg7_indi  CHAR(1),
  dr_seg7       VARCHAR2(25),
  cr_seg1_indi  CHAR(1),
  cr_seg1       VARCHAR2(25),
  cr_seg4_indi  CHAR(1) not null,
  cr_seg4       VARCHAR2(25),
  cr_seg6_indi  CHAR(1) not null,
  cr_seg6       VARCHAR2(25),
  cr_seg7_indi  CHAR(1) not null,
  cr_seg7       VARCHAR2(25)
)
;
create table T_ADD_EXPENSE_RATE
(
  product_id   NUMBER(7) not null,
  premium_year NUMBER(3) default 0 not null,
  period       NUMBER(4) default 0 not null,
  year         NUMBER(3) default 999 not null,
  expense_rate NUMBER(5,4) not null
)
;
create table T_ADD_FEE_TMP
(
  change_id NUMBER(10) not null,
  item_id   NUMBER(10) not null,
  add_fee   NUMBER(12,2) default 0
)
;
create table T_ADD_PREM_TYPE
(
  add_prem_type VARCHAR2(1) not null,
  type_name     VARCHAR2(30) not null
)
;
create table T_ADD_INVEST
(
  add_prem_id    NUMBER(10) not null,
  item_id        NUMBER(10) not null,
  add_prem_type  VARCHAR2(1) not null,
  add_prem       NUMBER(10,2) not null,
  pay_mode       NUMBER(2) not null,
  bank_code      VARCHAR2(20),
  bank_account   VARCHAR2(40),
  add_year       NUMBER(2) default 1 not null,
  add_period     NUMBER(4) default 1 not null,
  add_start_date DATE,
  add_term       NUMBER(2),
  add_freq       NUMBER(2),
  paidup_date    DATE,
  pay_to_date    DATE
)
;
create table T_ADD_INVEST_LOG
(
  change_id      NUMBER(10) not null,
  add_prem_id    NUMBER(10) not null,
  old_new        CHAR(1) not null,
  item_id        NUMBER(10) not null,
  add_prem_type  VARCHAR2(1) not null,
  add_prem       NUMBER(10,2) not null,
  pay_mode       NUMBER(2) not null,
  bank_code      VARCHAR2(20),
  bank_account   VARCHAR2(40),
  add_year       NUMBER(2) default 1 not null,
  add_period     NUMBER(4) default 1 not null,
  add_start_date DATE,
  add_term       NUMBER(2),
  add_freq       NUMBER(2),
  paidup_date    DATE,
  pay_to_date    DATE
)
;
create table T_PRODUCT_CAUSE
(
  cause_id NUMBER(2) not null,
  cause    VARCHAR2(40)
)
;
create table T_PRODUCT_DECISION
(
  decision_id NUMBER(2) not null,
  decision    VARCHAR2(40)
)
;
create table T_PRODUCT_OPINION
(
  opinion_id NUMBER(2) not null,
  opinion    VARCHAR2(40)
)
;
create table T_PRODUCT_STATUS
(
  ins_status  NUMBER(2) not null,
  status_note VARCHAR2(20)
)
;
create table T_LIFE_BASIC
(
  product_id        NUMBER(7) not null,
  basic_id          NUMBER(10) not null,
  pay_period        CHAR(1) default '0' not null,
  pay_year          NUMBER(3) default 0 not null,
  end_period        CHAR(1) default '0' not null,
  end_year          NUMBER(3) default 0 not null,
  pay_ensure        NUMBER(3) default 0 not null,
  pay_type          CHAR(1) default '0' not null,
  charge_period     CHAR(1) default 0 not null,
  charge_year       NUMBER(3) default 0 not null,
  max_insured_age   NUMBER(3) default 999 not null,
  max_insured_renew NUMBER(3) default 999 not null,
  min_insured_age   NUMBER(3) default 0 not null,
  coverage_period   CHAR(1) default 0 not null,
  coverage_year     NUMBER(5) default 0 not null,
  increase_year     NUMBER(2) default 0 not null,
  increase_rate     NUMBER(5,4) default 0 not null,
  basic_code        VARCHAR2(20) not null,
  increase_freq     CHAR(1) default '0' not null,
  min_insured_unit  CHAR(1) default '1' not null,
  simple_compound   CHAR(1) default '0' not null,
  gender            CHAR(1) default 'N'
)
;

create table T_AUTH_DRAW
(
  auth_draw  NUMBER(2) not null,
  auth_name  VARCHAR2(60) not null,
  is_actived CHAR(1) default 'Y' not null
)
;
create table T_POLICY_PRODUCT
(
  item_id                NUMBER(10) not null,
  policy_id              NUMBER(10) not null,
  product_id             NUMBER(10) not null,
  master_id              NUMBER(10),
  main_rider             CHAR(1),
  amount                 NUMBER(14,2) default 0,
  period_prem            NUMBER(12,2) default 0 not null,
  unit                   NUMBER(12,2) default 0 not null,
  ins_status             NUMBER(2) default 1 not null,
  validate_date          DATE,
  pause_date             DATE,
  resume_date            DATE,
  cancel_date            DATE,
  insure_stop            DATE,
  pay_stop               DATE,
  insurant_1             NUMBER(10) not null,
  age_1                  NUMBER(3) not null,
  relation_1             NUMBER(2),
  insurant_2             NUMBER(10),
  age_2                  NUMBER(3),
  relation_2             NUMBER(2),
  basic_id               NUMBER(10),
  check_id               NUMBER(10),
  checkout_time          DATE,
  normal_prem            NUMBER(12,2) default 0 not null,
  weak_prem              NUMBER(12,2) default 0 not null,
  job_prem               NUMBER(12,2) default 0 not null,
  disable_prem           NUMBER(12,2) default 0 not null,
  job_1_1                VARCHAR2(200),
  job_1_2                VARCHAR2(40),
  job_code_1             VARCHAR2(20),
  job_cate_1             NUMBER(10),
  job_2_1                VARCHAR2(40),
  job_2_2                VARCHAR2(40),
  job_code_2             VARCHAR2(20),
  job_cate_2             NUMBER(10),
  job_class_1            NUMBER(2) default 0 not null,
  job_class_2            NUMBER(2) default 0 not null,
  pay_period             CHAR(1),
  pay_year               NUMBER(3),
  end_period             CHAR(1),
  end_year               NUMBER(3),
  pay_ensure             NUMBER(3),
  pay_type               CHAR(1),
  charge_period          CHAR(1) not null,
  charge_year            NUMBER(3),
  coverage_period        CHAR(1) not null,
  coverage_year          NUMBER(5),
  except_value           NUMBER(10),
  benefit_level          VARCHAR2(20),
  charge_type            CHAR(1) not null,
  housekeeper            CHAR(1),
  charge_next            CHAR(1),
  sum_prem               NUMBER(10,2) default 0 not null,
  first_prem             NUMBER(10,2) default 0 not null,
  weak_rate              NUMBER(4,3) default 0 not null,
  weak_kilo              NUMBER(8,2) default 0 not null,
  job_rate               NUMBER(4,3) default 0 not null,
  job_kilo               NUMBER(8,2) default 0 not null,
  disable_rate           NUMBER(4,3) default 0 not null,
  disable_kilo           NUMBER(8,2) default 0 not null,
  smoking                CHAR(1) not null,
  bonus_choice           NUMBER(2),
  opinion_id             NUMBER(2),
  reduced_amount         NUMBER(14,2) default 0 not null,
  reduced_unit           NUMBER(12,2) default 0 not null,
  decision_id            NUMBER(2),
  product_num            CHAR(3) not null,
  next_time              DATE,
  reduced_level          VARCHAR2(20),
  em_life_1              NUMBER(4) default 0 not null,
  em_ill_1               NUMBER(4) default 0 not null,
  em_life_2              NUMBER(4) default 0 not null,
  em_ill_2               NUMBER(4) default 0 not null,
  policy_year            NUMBER(2) default 1 not null,
  policy_period          NUMBER(4) default 1 not null,
  group_policy_id        NUMBER(10),
  company_prem           NUMBER(12,2) default 0 not null,
  empployee_prem         NUMBER(12,2) default 0 not null,
  pay_rate               NUMBER(4,3),
  premium_year           NUMBER(3),
  cause_id               NUMBER(2),
  cause_desc             VARCHAR2(1100),
  job_class_1_2          NUMBER(2),
  job_code_1_2           VARCHAR2(20),
  job_cate_1_2           NUMBER(10),
  job_class_2_2          NUMBER(2),
  job_code_2_2           VARCHAR2(20),
  job_cate_2_2           NUMBER(10),
  insured_category       CHAR(1),
  insured_amount         NUMBER(10),
  relation_s             NUMBER(2) default 5 not null,
  discount_prem          NUMBER(12,2) default 0 not null,
  weak_year              NUMBER(2),
  weak_arith             CHAR(1) default '0' not null,
  job_year               NUMBER(2),
  job_arith              CHAR(1) default '0' not null,
  disable_year           NUMBER(2),
  disable_arith          CHAR(1) default '0' not null,
  normal_stand           NUMBER(12,2) default 0 not null,
  weak_stand             NUMBER(12,2) default 0 not null,
  job_stand              NUMBER(12,2) default 0 not null,
  disable_stand          NUMBER(12,2) default 0 not null,
  hold_date              DATE,
  retired_rate           NUMBER(4,3),
  age_month              NUMBER(2) default 99 not null,
  related_month          NUMBER(2) default 99 not null,
  increase_rate          NUMBER(5,4) default 0 not null,
  increase_freq          CHAR(1) default '0' not null,
  increase_year          NUMBER(2) default 0 not null,
  house_related          CHAR(1) default 'W' not null,
  smoking_related        CHAR(1) default 'W' not null,
  pay_mode               NUMBER(2),
  expiry_cash_value      NUMBER(14,2) default 0 not null,
  yrt_prem               NUMBER(12,2) default 0 not null,
  tax_prem               NUMBER(12,2) default 0 not null,
  retired                CHAR(1) default 'W' not null,
  simple_compound        CHAR(1) default '0' not null,
  loan_rate              NUMBER(5,4),
  count_way              CHAR(1) not null,
  discount_rate          NUMBER(8,6) default 1.00 not null,
  policy_prem            NUMBER(12,2) default 0 not null,
  policy_stand           NUMBER(12,2) default 0 not null,
  bank_code              VARCHAR2(20),
  bank_account           VARCHAR2(40),
  tax_prem_stand         NUMBER(12,2) default 0 not null,
  assign_way             VARCHAR2(1),
  assign_amount          NUMBER(12,2),
  assign_rate            NUMBER(4,3),
  waiver_num             VARCHAR2(3),
  fund_due_date          DATE,
  renew_decision         VARCHAR2(1) default 1 not null,
  policy_prem_source     VARCHAR2(1) not null,
  live_range             VARCHAR2(1) default '0' not null,
  move_range             VARCHAR2(1) default '0' not null,
  yrt_stand              NUMBER(12,2) default 0 not null,
  pay_next               NUMBER(2),
  start_pay_date         DATE,
  present_balance        NUMBER(10,2) default 0 not null,
  start_inst_date        DATE,
  bonus_due_date         DATE,
  risk_code              VARCHAR2(2),
  exposure_rate          NUMBER(4,3) default 1 not null,
  reins_rate             NUMBER(16,6) default 0 not null,
  discount_tax           NUMBER(16,6) default 0 not null,
  auth_draw              NUMBER(2),
  draw_bank              VARCHAR2(20),
  draw_account           VARCHAR2(40),
  mortality_rate         NUMBER(8,3) default 0 not null,
  medical_flag           CHAR(1) default 'N' not null,
  insert_time            DATE default SYSDATE not null,
  update_time            DATE default SYSDATE not null,
  waiver_id              NUMBER(10),
  weak_start             DATE,
  weak_end               DATE,
  job_start              DATE,
  job_end                DATE,
  disable_start          DATE,
  disable_end            DATE,
  combo_type             VARCHAR2(10),
  combo_unit             NUMBER(12,2),
  stand_prem             NUMBER(10,2) default 0,
  holder_stand_prem      NUMBER(10,2) default 0,
  pkg_id                 NUMBER(7),
  integrity_indi         CHAR(1) default 'Y' not null,
  charge_fee_rate        NUMBER(7,6),
  product_assumpsit      VARCHAR2(4000),
  rate_table_prem        NUMBER(12,2),
  actual_discount_rate   NUMBER(14,4),
  rente_choice           CHAR(1),
  insurance_category     CHAR(1),
  insured_ride_type      NUMBER(2),
  vehicle_type           NUMBER(2),
  vehicle_license_num    VARCHAR2(20),
  vehicle_fram_num       VARCHAR2(25),
  vehicle_engine_num     VARCHAR2(25),
  carrying_passenger_num NUMBER(10),
  surrfee_plan           NUMBER(2),
  loan_amount            NUMBER(14,2)
)
;

create table T_ADD_PREM
(
  add_prem_id    NUMBER(10) not null,
  item_id        NUMBER(10) not null,
  add_prem_type  VARCHAR2(1) not null,
  add_prem       NUMBER(10,2) not null,
  pay_mode       NUMBER(2) not null,
  bank_code      VARCHAR2(20),
  bank_account   VARCHAR2(40),
  add_year       NUMBER(2) default 1 not null,
  add_period     NUMBER(4) default 1 not null,
  add_start_date DATE,
  add_term       NUMBER(2),
  add_freq       NUMBER(2),
  paidup_date    DATE,
  pay_to_date    DATE
)
;
create table T_ADD_REDUCE_ITEM
(
  add_reduce_item_id NUMBER(3) not null,
  add_reduce_name    VARCHAR2(60),
  agent_cate         VARCHAR2(1),
  commision_type_id  NUMBER(5),
  is_tax             CHAR(1)
)
;
create table T_COMM_STATUS
(
  comm_status NUMBER(2) not null,
  status_name VARCHAR2(20) not null,
  status_desc VARCHAR2(100)
)
;
create table T_COMM_AGGREGATION
(
  aggregation_id NUMBER(10) not null,
  aggr_code      VARCHAR2(10) not null,
  aggr_type      CHAR(1),
  start_date     DATE not null,
  end_date       DATE not null,
  comm_status    NUMBER(2) default (3),
  insert_time    DATE default SYSDATE,
  recorder_id    NUMBER(10),
  update_time    DATE,
  updater_id     NUMBER(10),
  calculate_time DATE,
  organ_id       VARCHAR2(40),
  assess_status  NUMBER(2)
)
;
create table T_POLICY_AGENT_CHG
(
  change_id   NUMBER(12) not null,
  policy_id   NUMBER(10) not null,
  old_agent   NUMBER(10) not null,
  new_agent   NUMBER(10) not null,
  operator    NUMBER(10) not null,
  change_time DATE default SYSDATE not null,
  count_comm  CHAR(1) default 'N' not null,
  status      CHAR(1) not null
)
;
create table T_FEE_STATUS
(
  status_id   NUMBER(2) not null,
  status_name VARCHAR2(60) not null
)
;
create table T_DUEPREM_TYPE
(
  type_id   NUMBER(2) not null,
  type_name VARCHAR2(40)
)
;
create table T_POLICY_PREM
(
  prem_id                NUMBER(12) not null,
  policy_id              NUMBER(10) not null,
  first_prem             NUMBER(10,2) default 0,
  period_prem            NUMBER(12,2) not null,
  match_result           CHAR(1) default '0' not null,
  fee_type               NUMBER(2) not null,
  policy_year            NUMBER(2) not null,
  insert_time            DATE default SYSDATE not null,
  policy_period          NUMBER(4) not null,
  over_prem              NUMBER(10,2) default 0 not null,
  short_prem             NUMBER(10,2) default 0 not null,
  policy_type            CHAR(1) not null,
  due_time               DATE not null,
  money_id               NUMBER(6) not null,
  agent_id               NUMBER(10) not null,
  agency_code            VARCHAR2(20),
  agency_hand            NUMBER(10),
  advance_prem           NUMBER(12,2) default 0 not null,
  dividend_prem          NUMBER(10,2) default 0 not null,
  actual_prem            NUMBER(12,2) default 0 not null,
  fee_status             NUMBER(2) default 0 not null,
  print_count            NUMBER(2) default 0 not null,
  collector              NUMBER(10),
  insured_id             NUMBER(10),
  pay_mode               NUMBER(2) not null,
  bank_code              VARCHAR2(20),
  bank_account           VARCHAR2(40),
  present_prem           NUMBER(10,2) default 0 not null,
  check_digit1           VARCHAR2(2),
  check_digit2           VARCHAR2(2),
  pre_receipt            VARCHAR2(20),
  insurer_prem           NUMBER(10,2) default 0 not null,
  discount_tax           NUMBER(12,2) default 0 not null,
  receivable             CHAR(1) default 'N',
  customer_id            NUMBER(10),
  update_time            DATE default SYSDATE not null,
  issue_prem             CHAR(1) default 'N' not null,
  head_id                VARCHAR2(40) not null,
  branch_id              VARCHAR2(40) not null,
  organ_id               VARCHAR2(40) not null,
  dept_id                VARCHAR2(20) not null,
  redraw_flag            CHAR(1) default 'N',
  print_lapse_count      NUMBER(2) default 0 not null,
  print_auto_count       NUMBER(2) default 0 not null,
  print_call_count       NUMBER(2) default 0,
  transfer_active        CHAR(1),
  notice_print_count     NUMBER(2) default 0,
  pdf_print_count        NUMBER(2) default 0,
  pdf_notice_print_count NUMBER(2) default 0,
  pdf_print_lapse_count  NUMBER(2) default 0,
  pdf_print_auto_count   NUMBER(2) default 0,
  pdf_print_call_count   NUMBER(2) default 0
)
;
create table T_WITHDRAW_CAUSE
(
  cause_code VARCHAR2(10) not null,
  cause_name VARCHAR2(100) not null
)
;
create table T_WITHDRAW_TYPE
(
  type_code  VARCHAR2(2) not null,
  type_name  VARCHAR2(50) not null,
  type_abbr  VARCHAR2(20),
  cause_code VARCHAR2(10) not null
)
;
create table T_WITHDRAW_PERSON
(
  person_type CHAR(1) not null,
  type_name   VARCHAR2(20) not null
)
;
create table T_CLAIM_INSPECT_PROPERTY
(
  property    NUMBER(2) not null,
  description VARCHAR2(40) not null
)
;
create table T_CLAIM_INSPECT_STATUS
(
  status      NUMBER(2) not null,
  description VARCHAR2(40) not null
)
;
create table T_FILE_TYPE
(
  file_type VARCHAR2(10) not null,
  type_desc VARCHAR2(30) not null
)
;
create table T_TEMPLET
(
  temp_id         VARCHAR2(10) not null,
  temp_name       VARCHAR2(100) not null,
  file_type       VARCHAR2(10) not null,
  description     VARCHAR2(60),
  template_path   VARCHAR2(100),
  templet_fields  VARCHAR2(4000),
  data_grab_logic VARCHAR2(100)
)
;
create table T_PROB_BUSI_CATE
(
  cate_id        NUMBER(4) not null,
  cate_name      VARCHAR2(100) not null,
  cate_desc      VARCHAR2(4000),
  letter_process CHAR(1) default 'Y' not null
)
;
create table T_LETTER_CREATE_MODE
(
  mode_id   CHAR(1) not null,
  mode_desc VARCHAR2(30) not null
)
;
create table T_PROBLEM_CATEGORY
(
  category_id      NUMBER(6) not null,
  description      VARCHAR2(800),
  first_duty       CHAR(1) default 'N' not null,
  need_pritn       CHAR(1) default 'Y' not null,
  need_return      CHAR(1) default 'N' not null,
  auto_return      CHAR(1) default 'N' not null,
  need_print       CHAR(1) default 'N' not null,
  templet_id       VARCHAR2(10),
  abbr_name        VARCHAR2(50) not null,
  letter_name      VARCHAR2(200) not null,
  create_mode      CHAR(1) not null,
  need_resend      CHAR(1) default 'N' not null,
  resend_cycle     NUMBER(4),
  resend_end       NUMBER(4),
  letter_body      CLOB,
  send_status      VARCHAR2(3),
  return_status    VARCHAR2(3),
  need_send_print  CHAR(1) default 'Y' not null,
  notice_code_indi CHAR(1) default 'N' not null,
  return_method    VARCHAR2(500),
  business_cate    NUMBER(4) default 1 not null,
  newbiz_process   CHAR(1) default 'Y' not null,
  problem_logjam   CHAR(1) default 'N',
  company_relation VARCHAR2(2) default 'Y'
)
;
create table T_LETTER_PRINT_MAIN
(
  letter_print_id    NUMBER(12) not null,
  item_id            NUMBER(10),
  category_id        NUMBER(6),
  printed            NUMBER(1),
  create_date        DATE,
  print_emp_id       NUMBER(10),
  print_date         DATE,
  templet_id         VARCHAR2(10),
  letter_notes       VARCHAR2(1000),
  policy_id          NUMBER(10),
  policy_type        CHAR(1),
  policy_code        VARCHAR2(20),
  send_code          VARCHAR2(20),
  holder_name        VARCHAR2(200),
  holder_gender      VARCHAR2(10),
  holder_birth       VARCHAR2(20),
  holder_certi       VARCHAR2(30),
  holder_address     VARCHAR2(255),
  holder_zip         VARCHAR2(100),
  insured_name       VARCHAR2(100),
  insured_gender     VARCHAR2(10),
  insured_birth      VARCHAR2(20),
  insured_certi      VARCHAR2(30),
  insured_address    VARCHAR2(255),
  insured_zip        VARCHAR2(6),
  insured_link_tel   VARCHAR2(40),
  print_status       NUMBER(2) not null,
  holder_link_tel    VARCHAR2(40),
  validate_date      VARCHAR2(20),
  send_date          DATE,
  holder_age         NUMBER(10),
  holder_certi_type  VARCHAR2(20),
  insured_age        NUMBER(10),
  insured_certi_type VARCHAR2(20),
  sign_name          VARCHAR2(150),
  deliver_type       VARCHAR2(30),
  agent_id           NUMBER(10),
  product_name       VARCHAR2(100),
  bonus_cal_type     VARCHAR2(200),
  pay_year           NUMBER(3),
  pay_ensure         NUMBER(3),
  pay_mode           VARCHAR2(40),
  discount_prem      NUMBER(12,2),
  amount             VARCHAR2(100),
  bank_manger        VARCHAR2(40),
  operator_name      VARCHAR2(40),
  operator_post      VARCHAR2(50),
  operator_dept      VARCHAR2(50),
  coverage_year      NUMBER(5),
  charge_type        VARCHAR2(100),
  agent_name         VARCHAR2(40),
  hospital_name      VARCHAR2(100),
  hospital_address   VARCHAR2(100),
  hospital_address_2 VARCHAR2(100),
  hospital_address_3 VARCHAR2(100),
  hospital_address_4 VARCHAR2(100),
  hospital_telephone VARCHAR2(30),
  hospital_zip       VARCHAR2(6),
  fee_amount         NUMBER(14,2),
  short_prem         NUMBER(12,2),
  sign_id            NUMBER(10),
  sign_dept          VARCHAR2(100),
  sign_position      VARCHAR2(50),
  ibg_code           VARCHAR2(30),
  due_time           DATE,
  bank_account       VARCHAR2(100),
  period_prem        NUMBER(10,2),
  charge_type_name   VARCHAR2(20),
  prem_due_time      DATE,
  due_time_list      VARCHAR2(3000),
  actual_prem        NUMBER(10,2),
  unsuccess_name     VARCHAR2(100),
  batch_data         CLOB,
  send_id            NUMBER(10),
  transfer_date      DATE,
  sender_name        VARCHAR2(100),
  sender_address     VARCHAR2(100),
  sender_zip         VARCHAR2(6),
  acco_name          VARCHAR2(100),
  total_cpf_refund   NUMBER(16,2),
  withdraw_type_name VARCHAR2(30),
  total_prem_paid    NUMBER(16,2),
  profit_loss        NUMBER(16,2),
  old_charge_type    VARCHAR2(20),
  new_charge_type    VARCHAR2(20),
  pay_to_date        DATE,
  apply_time         DATE,
  date_validate_date DATE,
  end_date           DATE,
  agent_tel          VARCHAR2(30),
  pay_due_date       DATE,
  sum_assured_paid   NUMBER(16,2),
  total_bonus        NUMBER(16,2),
  special_bonus      NUMBER(16,2),
  pay_num            NUMBER(6),
  repay_loan         NUMBER(16,2),
  repay_prem         NUMBER(16,2),
  net_amount         NUMBER(16,2),
  notice_code        VARCHAR2(20),
  ackn_no            VARCHAR2(20),
  dept_name          VARCHAR2(100),
  principal_name     VARCHAR2(40),
  leave_company_date DATE,
  fee_amount_total   NUMBER(14,2),
  agent_code         VARCHAR2(25),
  sign_abbr          VARCHAR2(50),
  operator_abbr      VARCHAR2(50),
  check_cust_name    VARCHAR2(40),
  holder_job_tel     VARCHAR2(40),
  old_agent_name     VARCHAR2(200),
  old_agent_code     VARCHAR2(20),
  agent_email        VARCHAR2(50),
  agent_address      VARCHAR2(500),
  amount_char        VARCHAR2(30),
  interest_sum       NUMBER(16,6),
  loan_count         NUMBER(2),
  loan_rate          NUMBER(16,6),
  loan_sum           NUMBER(16,6),
  old_pay_to_date    DATE,
  dept_address       VARCHAR2(150),
  tmp_1              VARCHAR2(100),
  premium_paid       NUMBER(16,2),
  bank_code          VARCHAR2(200),
  bank_insert_time   DATE,
  bank_name          VARCHAR2(100),
  pay_period         CHAR(1),
  times_count        NUMBER(6),
  cash_value         NUMBER(16,2),
  char_check         CHAR(1),
  txt_content        VARCHAR2(4000),
  title              VARCHAR2(1000),
  attach_check       CHAR(1),
  email_title        VARCHAR2(500),
  premium            NUMBER(16,2),
  premium_2          NUMBER(16,2),
  premium_3          NUMBER(16,2),
  premium_4          NUMBER(16,2),
  bank_code_2        VARCHAR2(20),
  common_varchar_1   VARCHAR2(4000),
  common_varchar_2   VARCHAR2(500),
  common_varchar_3   VARCHAR2(500),
  common_varchar_4   VARCHAR2(500),
  common_date        DATE,
  mobile_phone       VARCHAR2(50),
  certi_no           VARCHAR2(100),
  period             VARCHAR2(100),
  type               VARCHAR2(200),
  assumpsit          VARCHAR2(4000),
  is_uw_1            CHAR(1),
  replay_date        DATE,
  uw_source          VARCHAR2(20),
  customer_add       VARCHAR2(300),
  customer_tel       VARCHAR2(40)
)
;
create table T_CLAIM_INSPECT
(
  inspect_id        NUMBER(10) not null,
  case_id           NUMBER(10),
  status            NUMBER(2) not null,
  fee_amount        NUMBER(14,2),
  origin_id         NUMBER(10) not null,
  letter_id         NUMBER(12),
  organ_id          VARCHAR2(40) not null,
  creator           NUMBER(10) not null,
  operator          NUMBER(10) not null,
  create_time       DATE default sysdate not null,
  finish_time       DATE,
  content           VARCHAR2(4000) not null,
  result            VARCHAR2(4000),
  attach            VARCHAR2(255),
  report            VARCHAR2(4000),
  organ_id1         VARCHAR2(40),
  property          NUMBER(2),
  operator1         NUMBER(10),
  summary           VARCHAR2(4000),
  pay_mode          NUMBER(2),
  bank_code         VARCHAR2(20),
  bank_account      VARCHAR2(40),
  evidence_got_date DATE,
  timing_start      DATE,
  timing_end        DATE,
  case_source       NUMBER(5)
)
;
create table T_INSPECT_MASCULINE
(
  code        NUMBER(2) not null,
  description VARCHAR2(40)
)
;
create table T_INSPECT
(
  inspect_id                 NUMBER(10) not null,
  case_id                    NUMBER(10),
  property                   NUMBER(2),
  type                       NUMBER(2),
  dest_organ_id              VARCHAR2(40),
  cause                      NUMBER(2),
  second_cause               VARCHAR2(4000),
  requirement                VARCHAR2(1500),
  original_organ_id          VARCHAR2(40),
  status                     NUMBER(2),
  source                     NUMBER(2),
  is_masculine               NUMBER(2),
  audit_conclusion           NUMBER(2),
  audit_description          VARCHAR2(2000),
  dest_director              NUMBER(10),
  original_director          NUMBER(10),
  pre_dest_organ_id          VARCHAR2(40),
  inspect_conclusion         CLOB,
  inspect_report_content     CLOB,
  evidence_obtain_date       DATE,
  claim_terminated_time      NUMBER,
  old_inspect_conclusion     CLOB,
  old_inspect_report_content CLOB
)
;
create table T_INSPECT_SUBTASK_STATUS
(
  code        NUMBER(2) not null,
  description VARCHAR2(40)
)
;
create table T_INSPECT_SUBTASK
(
  subtask_id           NUMBER(10) not null,
  inspect_id           NUMBER(10) not null,
  status               NUMBER(2),
  inspector_type       NUMBER(2),
  inspector            NUMBER(10),
  is_masculine         NUMBER(2),
  evidence_obtain_date DATE,
  charge               NUMBER(12,2),
  pay_mode             NUMBER(2),
  bank_code            VARCHAR2(20),
  bank_account         VARCHAR2(40),
  inspect_items        VARCHAR2(3000),
  inspect_conclusion   CLOB,
  review_conclusion    NUMBER,
  review_description   VARCHAR2(4000),
  reject_cause         VARCHAR2(3000),
  insert_time          DATE,
  business_process     NUMBER(2),
  finish_status        NUMBER default 0
)
;
create table T_BILL_TYPE
(
  bill_type   VARCHAR2(2) not null,
  type_name   VARCHAR2(60) not null,
  category_id NUMBER(2) default (1) not null
)
;
create table T_PAYMENT
(
  payment_id       NUMBER(10) not null,
  pay_amount       NUMBER(16,6) not null,
  money_id         NUMBER(6) not null,
  bill_type        VARCHAR2(2) not null,
  bill_no          VARCHAR2(40) not null,
  organ_id         VARCHAR2(40) not null,
  dept_id          VARCHAR2(20) not null,
  creator_id       NUMBER(10) not null,
  insert_time      DATE default SYSDATE not null,
  modifier_id      NUMBER(10) not null,
  update_time      DATE not null,
  cancel_id        NUMBER(10),
  cancel_time      DATE,
  treaty_id        NUMBER(10),
  memo             VARCHAR2(4000),
  cancel_cause     VARCHAR2(4000),
  balance          CHAR(1) not null,
  policy_type      CHAR(1) not null,
  policy_id        NUMBER(10),
  pay_balance      NUMBER(16,6) not null,
  offset_status    CHAR(1) default 0 not null,
  offset_id        NUMBER(10),
  offset_time      DATE,
  print_num        NUMBER(2) default 0 not null,
  print_date       DATE,
  bill_start_date  DATE,
  bill_end_date    DATE,
  customer_id      NUMBER(10),
  gst_prem         NUMBER(16,6) default 0 not null,
  commission       NUMBER(16,6) default 0 not null,
  gst_comm         NUMBER(16,6) default 0 not null,
  comm_offset      CHAR(1) default 'N' not null,
  customer_type    CHAR(1) default '0',
  company_id       NUMBER(10),
  payee_organ_id   VARCHAR2(40),
  comm_offset_type NUMBER(1) default 0,
  comm_offset_id   NUMBER(10),
  comm_offset_time DATE
)
;
create table T_WITHDRAW_BILL
(
  bill_id                NUMBER(10) not null,
  withdraw_type          VARCHAR2(2) not null,
  amount                 NUMBER(12,2) not null,
  person_type            CHAR(1),
  name                   VARCHAR2(240),
  certi_type             NUMBER(2),
  certi_code             VARCHAR2(50),
  policy_id              NUMBER(10),
  send_code              VARCHAR2(20),
  policy_code            VARCHAR2(20),
  handler_id             NUMBER(10) not null,
  insert_time            DATE default SYSDATE not null,
  status                 CHAR(1) default '0' not null,
  finish_time            DATE,
  cashier_id             NUMBER(10),
  amount_due             NUMBER(12,2) not null,
  print_status           CHAR(1) default '0' not null,
  cancel_id              NUMBER(10),
  cancel_time            DATE,
  policy_type            CHAR(1),
  bill_code              VARCHAR2(20),
  case_id                NUMBER(10),
  change_id              NUMBER(10),
  batch_id               NUMBER(10),
  money_id               NUMBER(6) not null,
  insured_1              NUMBER(10),
  print_times            NUMBER(2) default 0 not null,
  payment_id             NUMBER(10),
  inspect_id             NUMBER(10),
  payee_name             VARCHAR2(150),
  payee_certi_type       NUMBER(2),
  payee_certi_code       VARCHAR2(50),
  is_medical_card_refund VARCHAR2(1),
  subtask_id             NUMBER(10),
  case_no                VARCHAR2(20)
)
;

create table T_BANK_AUTH
(
  auth_id         NUMBER(10) not null,
  send_code       VARCHAR2(20),
  policy_id       NUMBER(10),
  account         VARCHAR2(40) not null,
  auth_code       VARCHAR2(20) not null,
  amount          NUMBER(12,2) not null,
  acco_name       VARCHAR2(50),
  certi_code      VARCHAR2(50),
  pay_item        VARCHAR2(4),
  gathering_item  VARCHAR2(4),
  insert_time     DATE default SYSDATE not null,
  bank_code       VARCHAR2(20) not null,
  fee_id          NUMBER(12),
  operater_id     NUMBER(10),
  agent_id        NUMBER(10),
  is_made         CHAR(1),
  sign_date       DATE,
  settle_flag     CHAR(1) default '0' not null,
  settle_id       NUMBER(10),
  settle_time     DATE,
  certi_type      NUMBER(2),
  auth_status     VARCHAR2(1) not null,
  end_cause       VARCHAR2(1),
  insured_id      NUMBER(10),
  auth_name       VARCHAR2(40),
  auth_certi_type NUMBER(2),
  auth_certi_code VARCHAR2(50),
  update_time     DATE default SYSDATE,
  update_id       NUMBER(10)
)
;
create table T_CHEQUE_TYPE
(
  cheque_type VARCHAR2(2) not null,
  type_name   VARCHAR2(30) not null
)
;
create table T_CLAIM_ADVANCE_PAY
(
  fee_id            NUMBER(12) not null,
  advance_id        NUMBER(12) not null,
  bene_name         VARCHAR2(100) not null,
  bene_type         CHAR(1) not null,
  certi_type        NUMBER(2) not null,
  certi_code        VARCHAR2(50) not null,
  address_1         VARCHAR2(100),
  address_2         VARCHAR2(100),
  address_3         VARCHAR2(100),
  address_4         VARCHAR2(100),
  zip               VARCHAR2(10),
  fee_amount        NUMBER(14,2) not null,
  money_id          NUMBER(6) not null,
  pay_mode          NUMBER(2) not null,
  bank_code         VARCHAR2(20),
  bank_account      VARCHAR2(40),
  fee_status        NUMBER(2) not null,
  insert_time       DATE default SYSDATE not null,
  case_id           NUMBER(10) not null,
  policy_id         NUMBER(10),
  bene_nature       NUMBER(2),
  payee_name        VARCHAR2(150),
  payee_certi_type  NUMBER(2),
  payee_certi_code  VARCHAR2(50),
  payee_bailee_type NUMBER(2)
)
;
create table T_PAYABLE_FEE
(
  fee_id           NUMBER(12) not null,
  fee_amount       NUMBER(14,2) not null,
  money_id         NUMBER(6) not null,
  policy_id        NUMBER(10),
  policy_type      CHAR(1),
  insured_1        NUMBER(10),
  insured_num      NUMBER(10),
  allot_status     CHAR(1) not null,
  change_id        NUMBER(10),
  case_id          NUMBER(10),
  payable_source   VARCHAR2(1) not null,
  handler_id       NUMBER(10) not null,
  insert_time      DATE default SYSDATE not null,
  payee_name       VARCHAR2(240),
  payee_address_1  VARCHAR2(200),
  payee_address_2  VARCHAR2(100),
  payee_address_3  VARCHAR2(100),
  payee_address_4  VARCHAR2(100),
  payee_zip        VARCHAR2(10),
  payee_certi_type NUMBER(2),
  payee_certi_code VARCHAR2(50),
  withdraw_type    VARCHAR2(2) not null,
  send_code        VARCHAR2(20),
  trans_chg_id     NUMBER(10),
  update_time      DATE default sysdate
)
;
create table T_POLICY_FEE
(
  fee_id              NUMBER(12) not null,
  head_id             VARCHAR2(40) not null,
  branch_id           VARCHAR2(40) not null,
  organ_id            VARCHAR2(40) not null,
  policy_id           NUMBER(10),
  send_code           VARCHAR2(20),
  receipt_code        VARCHAR2(4000),
  fee_amount          NUMBER(12,2) default 0 not null,
  pay_mode            NUMBER(2) not null,
  bank_account        VARCHAR2(40),
  fee_type            NUMBER(3) not null,
  fee_status          NUMBER(2) default 0 not null,
  match_result        CHAR(1) default '0' not null,
  finish_time         DATE,
  cashier_id          NUMBER(10),
  insert_time         DATE default SYSDATE not null,
  formal_receipt      VARCHAR2(200),
  transfer_file       CHAR(1) default 'N' not null,
  cheque_code         VARCHAR2(40),
  cred_id             NUMBER(10),
  settle_flag         CHAR(1) default 0 not null,
  posted              CHAR(1) default 'N' not null,
  return_check_status CHAR(1),
  check_enter_time    DATE,
  change_id           NUMBER(10),
  policy_type         CHAR(1) not null,
  record_time         DATE,
  dept_id             VARCHAR2(20) not null,
  agent_id            NUMBER(10) not null,
  money_id            NUMBER(6) not null,
  pay_way             VARCHAR2(2) default 0 not null,
  post_id             NUMBER(10),
  bank_code           VARCHAR2(20),
  agency_code         VARCHAR2(20),
  agency_hand         NUMBER(10),
  cancel_date         DATE,
  cancel_id           NUMBER(10),
  settle_id           NUMBER(10),
  settle_time         DATE,
  finish_id           NUMBER(10),
  bill_id             NUMBER(10),
  case_id             NUMBER(10),
  prem_id             NUMBER(12),
  payable_id          NUMBER(12),
  print_num           NUMBER(4) default 0 not null,
  insured_id          NUMBER(10),
  receiv_status       CHAR(1) default '0' not null,
  company_fee         NUMBER(12,2) not null,
  employee_fee        NUMBER(12,2) not null,
  policy_year         NUMBER(2),
  policy_period       NUMBER(4),
  entry_code          VARCHAR2(30),
  pay_money_id        NUMBER(6) not null,
  pay_amount          NUMBER(12,2) not null,
  new_account         VARCHAR2(40),
  check_desc          VARCHAR2(500),
  send_id             NUMBER(10),
  received_time       DATE,
  new_bank            VARCHAR2(20),
  account_operator    NUMBER(10),
  account_checker     NUMBER(10),
  transfer_num        NUMBER(4) default 0 not null,
  payee_name          VARCHAR2(240),
  payee_address_1     VARCHAR2(200),
  payee_address_2     VARCHAR2(100),
  payee_address_3     VARCHAR2(100),
  payee_address_4     VARCHAR2(100),
  payee_zip           VARCHAR2(10),
  payee_certi_type    NUMBER(2),
  payee_certi_code    VARCHAR2(50),
  cheque_type         VARCHAR2(2),
  cheque_date         DATE,
  cash_bank           VARCHAR2(20),
  cash_account        VARCHAR2(40),
  profit_loss         NUMBER(10,2) default 0 not null,
  total_cpf_refund    NUMBER(10,2) default 0 not null,
  withdraw_type       VARCHAR2(2),
  advance_pay_id      NUMBER(12),
  premium_paid        NUMBER(10,2) default 0 not null,
  related_id          NUMBER(12),
  payment_id          NUMBER(10),
  pay_balance         NUMBER(16,6) default 0 not null,
  detail_id           NUMBER(10),
  update_time         DATE default SYSDATE not null,
  reversal_id         NUMBER(10),
  trans_chg_id        NUMBER(10),
  auth_id             NUMBER(10),
  circ_audited        CHAR(1) default 'N' not null,
  print_advance_num   NUMBER(4) default 0 not null,
  incorrect_reason    VARCHAR2(4000),
  maintain_id         NUMBER(10),
  pdf_print_num       NUMBER(2) default 0,
  resident_type       NUMBER(2)
)


create table T_AUTH_END_CAUSE
(
  cause_id   VARCHAR2(1) not null,
  cause_desc VARCHAR2(30) not null
)
;
create table T_BENEFICIARY_TYPE
(
  beneficiary_type CHAR(1) not null,
  type_name        VARCHAR2(30) not null
)
;
create table T_CLAIM_CASE_ADVANCE
(
  advance_id     NUMBER(12) not null,
  case_id        NUMBER(10) not null,
  fee_amount     NUMBER(14,2) not null,
  money_id       NUMBER(6) not null,
  advance_status NUMBER(2) not null,
  pay_time       DATE not null,
  pay_emp_id     NUMBER(10) not null,
  auditor_id     NUMBER(10),
  subscriber_id  NUMBER(10),
  subscribe_time DATE
)
;
create table T_ALLOT_STATUS
(
  allot_status CHAR(1) not null,
  status_desc  VARCHAR2(30) not null
)
;
create table T_PAYABLE_SOURCE
(
  payable_source VARCHAR2(1) not null,
  type_name      VARCHAR2(30) not null
)
;
create table T_RETURN_ABNORMAL_SOURCE
(
  source_id   NUMBER(3) not null,
  level1_name VARCHAR2(100),
  level2_name VARCHAR2(100)
)
;
create table T_TREAT_STATUS
(
  treat_status NUMBER(2) not null,
  status_note  VARCHAR2(20)
)
;
create table T_LETTER_ORIGIN
(
  origin_type VARCHAR2(3) not null,
  type_name   VARCHAR2(100) not null
)
;
create table T_LETTER_OPERATION_TYPE
(
  operation_type NUMBER(2) not null,
  operation_name VARCHAR2(30) not null,
  table_name     VARCHAR2(50),
  pk_name        VARCHAR2(50)
)
;
create table T_POLICY_NOTICE
(
  policy_id       NUMBER(10),
  notice_code     VARCHAR2(20) not null,
  image_type_id   NUMBER(3),
  notice_status   CHAR(1) default '1' not null,
  group_policy_id NUMBER(10),
  change_id       NUMBER(10),
  case_id         NUMBER(10),
  insert_time     DATE default SYSDATE not null,
  update_time     DATE default SYSDATE not null
)
;
create table T_POLICY_PROBLEM
(
  item_id                NUMBER(10) not null,
  policy_id              NUMBER(10),
  insert_time            DATE default SYSDATE not null,
  handler_id             NUMBER(10),
  treat_status           NUMBER(2) default 1 not null,
  end_time               DATE,
  killer_id              NUMBER(10),
  origin_type            VARCHAR2(3) default '0' not null,
  option_id              NUMBER(10),
  first_id               NUMBER(10),
  notes                  VARCHAR2(3000),
  notice_code            VARCHAR2(20),
  sender_id              NUMBER(10),
  send_time              DATE,
  category_id            NUMBER(6) not null,
  auth_id                NUMBER(10),
  send_code              VARCHAR2(20),
  change_id              NUMBER(10),
  fee_id                 NUMBER(12),
  return_status          VARCHAR2(3),
  need_return            CHAR(1) not null,
  auto_return            CHAR(1) not null,
  need_print             CHAR(1) not null,
  case_id                NUMBER(10),
  group_policy_id        NUMBER(10),
  prem_id                NUMBER(12),
  send_id                NUMBER(10),
  pay_id                 NUMBER(10),
  return_notes           VARCHAR2(1000),
  operation_id           NUMBER(20),
  operation_type         NUMBER(2),
  need_resend            CHAR(1) default 'N' not null,
  resend_cycle           NUMBER(4),
  resend_end             NUMBER(4),
  update_time            DATE default SYSDATE not null,
  send_status            VARCHAR2(3),
  first_duty             CHAR(1) default 'N' not null,
  need_send_print        CHAR(1) default 'Y' not null,
  batch_id               NUMBER(10),
  reply_time             DATE,
  reply_emp_id           NUMBER(10),
  return_abnormal_source NUMBER(3),
  reply_days             NUMBER(3),
  sys_lock_status        CHAR(1) default '0' not null,
  sys_locker_id          NUMBER(10),
  sys_lock_time          DATE,
  received_date          DATE,
  received_memo          VARCHAR2(4000),
  agree_indi             CHAR(1) default 'Y',
  cp_item_id             NUMBER(10),
  is_masccline           VARCHAR2(3),
  first_sent_time        DATE,
  letter_process         CHAR(1),
  organ_id               VARCHAR2(40),
  bonus_due_month        NUMBER(2),
  is_stop_transfer       CHAR(1)
)
;
create table T_INSPECT_CAUSE
(
  code        NUMBER(2) not null,
  description VARCHAR2(40)
)
;
create table T_INSPECT_STATUS
(
  code        NUMBER(2) not null,
  description VARCHAR2(40)
)
;
create table T_BILL_CATE
(
  category_id   NUMBER(2) not null,
  category_name VARCHAR2(60) not null
)
;
create table T_PRODUCT_FEE
(
  list_id            NUMBER(14) not null,
  fee_id             NUMBER(12) not null,
  product_id         NUMBER(10) not null,
  product_num        CHAR(3) not null,
  period_prem        NUMBER(12,2) not null,
  charge_type        CHAR(1) default '0' not null,
  policy_year        NUMBER(2) not null,
  policy_period      NUMBER(4) not null,
  agent_id           NUMBER(10) not null,
  insert_time        DATE default SYSDATE not null,
  normal_prem        NUMBER(12,2) not null,
  weak_prem          NUMBER(12,2) default 0 not null,
  job_prem           NUMBER(12,2) default 0 not null,
  disable_prem       NUMBER(12,2) default 0 not null,
  basic_id           NUMBER(10),
  premium_year       NUMBER(3) not null,
  normal_stand       NUMBER(12,2) default 0 not null,
  weak_stand         NUMBER(12,2) default 0 not null,
  job_stand          NUMBER(12,2) default 0 not null,
  disable_stand      NUMBER(12,2) default 0 not null,
  insured_1          NUMBER(10),
  policy_id          NUMBER(10) not null,
  head_id            VARCHAR2(40) not null,
  branch_id          VARCHAR2(40) not null,
  organ_id           VARCHAR2(40) not null,
  dept_id            VARCHAR2(20) not null,
  agency_code        VARCHAR2(20),
  agency_hand        NUMBER(10),
  policy_type        CHAR(1) not null,
  benefit_type       VARCHAR2(2) not null,
  busi_type          CHAR(1) not null,
  period_type        CHAR(1) not null,
  fee_type           NUMBER(3) not null,
  pay_way            VARCHAR2(2) default 0 not null,
  pay_mode           NUMBER(2) not null,
  money_id           NUMBER(6) not null,
  check_enter_time   DATE,
  finish_time        DATE,
  cashier_id         NUMBER(10),
  change_id          NUMBER(10),
  case_id            NUMBER(10),
  due_time           DATE,
  period             NUMBER(4) not null,
  stand_prem         NUMBER(10,2) default 0 not null,
  yrt_prem           NUMBER(12,2) default 0 not null,
  tax_prem           NUMBER(12,2) default 0 not null,
  policy_prem        NUMBER(12,2) default 0 not null,
  discount_rate      NUMBER(8,6) default 1.00 not null,
  company_fee        NUMBER(12,2) not null,
  employee_fee       NUMBER(12,2) not null,
  policy_prem_source VARCHAR2(1) not null,
  sa_accum           CHAR(1) default '0' not null,
  yrt_stand          NUMBER(12,2) default 0 not null,
  tax_prem_stand     NUMBER(12,2) default 0 not null,
  policy_stand       NUMBER(12,2) default 0 not null,
  sell_way           VARCHAR2(2) not null,
  derivation         CHAR(1) not null,
  present_prem       NUMBER(10,2) default 0 not null,
  profit_loss        NUMBER(10,2) default 0 not null,
  discount_tax       NUMBER(16,6) default 0 not null,
  update_time        DATE default SYSDATE not null,
  reversal_id        NUMBER(10),
  related_id         NUMBER(12),
  trans_chg_id       NUMBER(10),
  commision          NUMBER(2),
  holder_stand_prem  NUMBER(10,2) default 0,
  old_stand_prem     NUMBER(10,2) default 0 not null,
  circ_audited       CHAR(1) default 'N' not null
)



create table T_ADD_REDUCE_MONEY
(
  add_reduce_id      NUMBER(10) not null,
  add_reduce_item_id NUMBER(3),
  agent_id           NUMBER(10),
  year_month         VARCHAR2(6),
  money              NUMBER(10,2),
  commision_id       NUMBER(12),
  agent_cate         VARCHAR2(1) not null,
  recorder_id        NUMBER(10),
  update_time        DATE,
  inspector_id       NUMBER(10),
  adjust_cause       VARCHAR2(1000),
  change_id          NUMBER(12),
  due_date           DATE,
  money_id           NUMBER(6),
  comm_status        NUMBER(2) default (0),
  aggregation_id     NUMBER(10),
  list_id            NUMBER(14),
  policy_id          NUMBER(10)
)
;

create table T_ADD_REDUCE_PREM_ITEM
(
  add_reduce_item_id NUMBER(3) not null,
  add_reduce_name    VARCHAR2(60)
)
;
create table T_ADD_REDUCE_PREM
(
  add_reduce_id      NUMBER(10) not null,
  agent_id           NUMBER(10) not null,
  year_month         VARCHAR2(6) not null,
  agent_cate         VARCHAR2(1) not null,
  stand_prem         NUMBER(10,2) not null,
  recorder_id        NUMBER(10),
  update_time        DATE,
  inspector_id       NUMBER(10),
  add_reduce_item_id NUMBER(3),
  adjust_cause       VARCHAR2(1000),
  money_id           NUMBER(6),
  aggregation_id     NUMBER(10),
  due_date           DATE,
  policy_id          NUMBER(10),
  list_id            NUMBER(14)
)
;

create table T_ADD_REDUCE_PREM_TYPE
(
  type_id   NUMBER(3) not null,
  type_name VARCHAR2(50)
)
;
create table T_ADD_REGULAR
(
  item_id       NUMBER(10) not null,
  start_date    DATE not null,
  period_prem   NUMBER(10,2) not null,
  charge_fee    NUMBER(10,2) not null,
  fund_due_date DATE not null,
  override_comm NUMBER(10,2) not null,
  insert_time   DATE default SYSDATE not null,
  updater_id    NUMBER(10),
  initial_type  CHAR(1) not null,
  is_pay        CHAR(1) default 'N' not null
)
;
create table T_ADD_REGULAR_LOG
(
  change_id     NUMBER(10) not null,
  old_new       CHAR(1) not null,
  item_id       NUMBER(10) not null,
  start_date    DATE not null,
  period_prem   NUMBER(10,2) not null,
  charge_fee    NUMBER(10,2) not null,
  fund_due_date DATE not null,
  override_comm NUMBER(10,2) not null,
  insert_time   DATE default SYSDATE not null,
  updater_id    NUMBER(10),
  initial_type  CHAR(1) not null,
  is_pay        CHAR(1) default 'N' not null
)
;
create table T_ADD_SERVICE
(
  service_type VARCHAR2(2) not null,
  type_name    VARCHAR2(30) not null
)
;
create table T_COMMISION_TOTAL
(
  commision_total_id NUMBER(12) not null,
  agent_id           NUMBER(10),
  year_month         VARCHAR2(6),
  money              NUMBER(10,2),
  status             NUMBER(1),
  money_before_tax   NUMBER(10,2),
  money_tax          NUMBER(10,2),
  tax                NUMBER(10,2),
  head_id            VARCHAR2(40) not null,
  branch_id          VARCHAR2(40) not null,
  organ_id           VARCHAR2(40) not null,
  award_money        NUMBER(10,2),
  award_stand        NUMBER(10,2) default 0,
  fyc                NUMBER(10,2),
  award_diff         NUMBER(10,2),
  sales_tax          NUMBER(10,2),
  sales_tax_add      NUMBER(10,2),
  agent_cate         VARCHAR2(1) not null,
  dept_id            VARCHAR2(20) not null,
  single_cpf         NUMBER(10,2),
  company_cpf        NUMBER(10,2),
  confirm_emp        NUMBER(10),
  confirm_time       DATE,
  insert_time        DATE default SYSDATE not null,
  update_time        DATE default SYSDATE not null,
  aggregation_id     NUMBER(10),
  money_id           NUMBER(6),
  comm_status        NUMBER(2) default (3)
)
;
create table T_COMMISION_INFO
(
  commision_id       NUMBER(12) not null,
  agent_id           NUMBER(10),
  organ_id           VARCHAR2(40),
  dept_id            VARCHAR2(20),
  year_month         VARCHAR2(6),
  commision_type_id  NUMBER(5),
  money              NUMBER(14,2),
  source_table       VARCHAR2(30),
  commision_total_id NUMBER(12),
  agent_cate         VARCHAR2(1) not null,
  calc_year_month    VARCHAR2(6),
  insert_time        DATE default SYSDATE,
  fee_id             NUMBER(12),
  update_time        DATE default SYSDATE not null,
  aggregation_id     NUMBER(10),
  money_id           NUMBER(6),
  branch_id          VARCHAR2(40) not null,
  comm_status        NUMBER(2),
  synch_flag         CHAR(1),
  list_id            NUMBER(14)
)
;

create table T_ADJUST_AWARD
(
  adjust_id         NUMBER(10) not null,
  agent_id          NUMBER(10),
  opt_year_month    VARCHAR2(6),
  year_month        VARCHAR2(6),
  dept_id           VARCHAR2(20),
  commision_type_id NUMBER(5),
  origin_money      NUMBER(10,2),
  new_money         NUMBER(10,2),
  money             NUMBER(10,2),
  commision_id      NUMBER(12)
)
;

create table T_ADJUST_FYC
(
  adjust_id      NUMBER(10) not null,
  agent_id       NUMBER(10),
  opt_year_month VARCHAR2(6),
  year_month     VARCHAR2(6),
  fyc_money      NUMBER(10,2),
  dept_id        VARCHAR2(20)
)
;
create table T_ADMIN_ACT
(
  act_id      NUMBER(10) not null,
  updater_id  NUMBER(10) not null,
  update_time DATE not null
)
;
create table T_ADMIN_ACT_TYPE
(
  type_id   NUMBER(2) not null,
  type_name VARCHAR2(100) not null
)
;
create table T_ADMIN_ACT_DETAIL
(
  act_detail_id NUMBER(10) not null,
  act_id        NUMBER(10) not null,
  act_type      NUMBER(2) not null,
  organ_id      VARCHAR2(40) not null,
  dept_id       VARCHAR2(20) not null,
  user_id       NUMBER(10) not null,
  group_id      NUMBER(10)
)
;
create table T_AGENCY_CANCEL
(
  list_id       NUMBER(10) not null,
  business_id   NUMBER(10),
  business_type CHAR(1),
  insert_time   DATE default sysdate,
  update_time   DATE default sysdate
)
;
create table T_AGENCY_CANCEL_WAIT
(
  list_id       NUMBER(10) not null,
  business_id   NUMBER(10),
  business_type CHAR(1),
  error_desc    VARCHAR2(4000),
  insert_time   DATE not null,
  update_time   DATE not null
)
;
create table T_AGENCY_CONTRACT_TYPE
(
  contract_type VARCHAR2(2),
  contract_name VARCHAR2(30) not null
)
;
create table T_BANK_CONTRACT_STATUS
(
  contract_status VARCHAR2(2) not null,
  contract_name   VARCHAR2(20)
)
;
create table T_AGENCY_CONTRACT
(
  agency_cont_id     NUMBER(10),
  contract_code      VARCHAR2(40) not null,
  agency_cont_name   VARCHAR2(100),
  contract_type      VARCHAR2(2),
  agency_code        VARCHAR2(20),
  qualification_code VARCHAR2(20),
  start_date         DATE,
  end_date           DATE,
  period             NUMBER(10),
  auto_period        NUMBER(10),
  sign_name          VARCHAR2(100),
  company_name       VARCHAR2(100),
  file_name          VARCHAR2(100),
  contract_file      BLOB,
  contract_status    VARCHAR2(2),
  insert_time        DATE,
  update_time        DATE,
  updater_id         NUMBER(10)
)
;
create table T_AGENCY_COMM_CHARGE
(
  comm_rate_id    NUMBER(10),
  organ_id        VARCHAR2(40),
  agency_code     VARCHAR2(20),
  contract_code   VARCHAR2(40),
  product_id      NUMBER(7),
  charge_period   CHAR(1),
  coverage_period CHAR(1),
  policy_year     NUMBER(2),
  premium_year    NUMBER(3),
  comm_rate       NUMBER(5,2),
  award_rate      NUMBER(3,2),
  over_rate       NUMBER(3,2),
  updater_id      NUMBER(10),
  update_time     DATE
)
;

create table T_AGENCY_COMM_RATE
(
  comm_rate_id NUMBER(10) not null,
  organ_id     VARCHAR2(40),
  agency_code  VARCHAR2(20),
  branch_code  VARCHAR2(20),
  product_id   NUMBER(7),
  charge_type  CHAR(1),
  policy_year  NUMBER(2),
  premium_year NUMBER(3),
  comm_rate    NUMBER(3,2),
  award_rate   NUMBER(3,2),
  over_rate    NUMBER(3,2),
  updater_id   NUMBER(10),
  update_time  DATE
)
;
create table T_AGENCY_DEL
(
  agency_code VARCHAR2(20),
  delete_time DATE default SYSDATE not null
)
;
create table T_AGENCY_EMPLOYEE
(
  emp_id          NUMBER(10) not null,
  real_name       VARCHAR2(40) not null,
  user_name       VARCHAR2(30),
  password        VARCHAR2(32),
  password_change DATE,
  gender          CHAR(1) not null,
  birthday        DATE,
  certi_type      NUMBER(2),
  certi_code      VARCHAR2(50),
  education_id    VARCHAR2(2),
  email           VARCHAR2(100),
  telephone       VARCHAR2(30),
  celler_tel      VARCHAR2(30),
  agency_code     VARCHAR2(20) not null,
  experenced      CHAR(1) default 'N' not null,
  certificated    CHAR(1) default 'N' not null,
  insurer_job     CHAR(1) default 'N' not null,
  insurer_name    VARCHAR2(300),
  operated        CHAR(1) default 'N' not null,
  other_operated  CHAR(1) default 'N' not null,
  insert_time     DATE default SYSDATE not null,
  update_time     DATE default SYSDATE not null
)
;
create table T_AGENCY_INFO
(
  list_id         NUMBER(10) not null,
  business_id     NUMBER(10) not null,
  business_type   CHAR(1) not null,
  agency_org_code VARCHAR2(20),
  query_code      VARCHAR2(100),
  register_code   VARCHAR2(100),
  state           CHAR(1),
  insert_time     DATE not null,
  update_time     DATE not null
)
;
create table T_AGENCY_POLICY_TEXT
(
  policy_name  VARCHAR2(50) not null,
  product_name VARCHAR2(50),
  policy_text  CLOB,
  product_text CLOB,
  bank_code    VARCHAR2(20) not null,
  create_time  DATE default SYSDATE,
  operater_id  NUMBER(10) not null,
  status       CHAR(1) not null
)
;
create table T_AGENCY_POLICY
(
  policy_name   VARCHAR2(50) not null,
  send_code     VARCHAR2(20) not null,
  h_name        VARCHAR2(30),
  h_gender      CHAR(1),
  h_birthday    DATE,
  h_certi_type  NUMBER(2),
  h_certi_code  VARCHAR2(50),
  h_tel         VARCHAR2(40),
  h_address     VARCHAR2(100),
  h_zip         VARCHAR2(10),
  relation      NUMBER(2),
  i_name        VARCHAR2(30),
  i_gender      CHAR(1),
  i_birth       DATE,
  i_certi_type  NUMBER(2),
  i_certi_code  VARCHAR2(50),
  i_tel         VARCHAR2(40),
  i_address     VARCHAR2(100),
  i_zip         VARCHAR2(10),
  b_name        VARCHAR2(30),
  relation2     NUMBER(2),
  deliver_type  CHAR(1),
  h_bank_code   VARCHAR2(4),
  bank_account  VARCHAR2(40),
  send_date     DATE,
  period_prem   NUMBER(10,2),
  bank_code     VARCHAR2(20) not null,
  agency_code   VARCHAR2(20),
  internal_bank VARCHAR2(20) not null,
  agency_hand   NUMBER(10) not null,
  internal_hand VARCHAR2(20) not null,
  is_err        CHAR(1) default '1',
  err_info      VARCHAR2(2000)
)
;
create table T_AGENCY_PRODUCT
(
  product_name  VARCHAR2(50),
  send_code     VARCHAR2(20),
  product_code  NUMBER(10),
  main_rider    CHAR(1),
  unit          NUMBER(3),
  period_prem   NUMBER(10,2),
  cover_year    NUMBER(3),
  charge_period CHAR(1),
  charge_year   NUMBER(3),
  is_err        CHAR(1) default '1',
  err_info      VARCHAR2(2000),
  basic_id      NUMBER(10),
  amount        NUMBER(14,2) default 0,
  charge_type   CHAR(1),
  cover_period  CHAR(1)
)
;

create table T_AGENT_ASSESS
(
  agent_id     NUMBER(10) not null,
  year_querter VARCHAR2(6) not null
)
;
create table T_AGENT_BACKUP
(
  list_id                  NUMBER(10) not null,
  year_month               VARCHAR2(6) not null,
  agent_id                 NUMBER(10) not null,
  agent_code               VARCHAR2(25) not null,
  organ_id                 VARCHAR2(40) not null,
  head_id                  VARCHAR2(40) not null,
  branch_id                VARCHAR2(40) not null,
  dept_id                  VARCHAR2(20) not null,
  train_man_id             NUMBER(10),
  recommend_man_id         NUMBER(10),
  grade_id                 VARCHAR2(3),
  enter_company_date       DATE,
  leave_company_date       DATE,
  agent_status             NUMBER(2) not null,
  probation_date           DATE,
  turn_date                DATE,
  agent_cate               VARCHAR2(1) not null,
  dept_train_id            NUMBER(10),
  area_train_id            NUMBER(10),
  indirect_train_id        NUMBER(10),
  ind_dept_train_id        NUMBER(10),
  group_train_date         DATE,
  dept_train_date          DATE,
  area_train_date          DATE,
  dimis_apply_date         DATE,
  green_passport           VARCHAR2(1),
  reenter_flag             CHAR(1) not null,
  sign_date                DATE,
  end_date                 DATE,
  init_grade_id            VARCHAR2(3),
  insert_time              DATE default SYSDATE,
  agent_sub_cate           VARCHAR2(3),
  ind_area_train_id        NUMBER(10),
  real_name                VARCHAR2(40),
  qualification_id         VARCHAR2(20),
  practice_id              VARCHAR2(50),
  invest_connect_id        VARCHAR2(20),
  train_id_valid           CHAR(1) default 'Y',
  indi_train_id_valid      CHAR(1) default 'Y',
  dept_train_id_valid      CHAR(1) default 'Y',
  indi_dept_train_id_valid CHAR(1) default 'Y',
  area_train_id_valid      CHAR(1) default 'Y',
  indi_area_train_id_valid CHAR(1) default 'Y'
)
;
create table T_AGENT_BALANCE
(
  agent_id    NUMBER(10) not null,
  policy_type CHAR(1) not null,
  pay_balance NUMBER(16,6) not null
)
;
create table T_AGENT_BIZ_FEE_TYPE
(
  service_id   CHAR(3),
  service_name VARCHAR2(200),
  fee_type     NUMBER(3),
  fee_name     VARCHAR2(200)
)
;
create table T_AGENT_CFG_FACTOR
(
  factor_id NUMBER(2),
  para_name VARCHAR2(100) not null
)
;
create table T_AGENT_CHANGE_TYPE
(
  change_type_id NUMBER(4) not null,
  change_name    VARCHAR2(100)
)
;
create table T_AGENT_CHANGE
(
  agent_chg_id          NUMBER(10) not null,
  agent_id              NUMBER(10) not null,
  real_name             VARCHAR2(200),
  user_name             VARCHAR2(30),
  password              VARCHAR2(30),
  gender                CHAR(1),
  birthday              DATE,
  certi_type            NUMBER(2),
  certi_code            VARCHAR2(50),
  agent_code            VARCHAR2(25),
  password_change       DATE default SYSDATE,
  organ_id              VARCHAR2(40) not null,
  head_id               VARCHAR2(40) not null,
  branch_id             VARCHAR2(40) not null,
  user_status           CHAR(1) default '1',
  dept_id               VARCHAR2(20),
  political_id          VARCHAR2(2),
  education_id          VARCHAR2(2),
  foreign_lang_id       VARCHAR2(3),
  foreign_level_id      VARCHAR2(2),
  compute_level         VARCHAR2(2),
  instructor_grade_id   VARCHAR2(2),
  begin_job_date        DATE,
  technical_post        VARCHAR2(50),
  native_place          VARCHAR2(5),
  register_address      VARCHAR2(100),
  family_address        VARCHAR2(200),
  address_area          VARCHAR2(50),
  telephone             VARCHAR2(30),
  old_job_unit          VARCHAR2(100),
  old_job_id            VARCHAR2(10),
  bp                    VARCHAR2(50),
  celler_tel            VARCHAR2(50),
  email                 VARCHAR2(50),
  address               VARCHAR2(200),
  marriage_id           CHAR(1),
  special_favor         VARCHAR2(50),
  cautioner1_name       VARCHAR2(50),
  cautioner1_certi_type NUMBER(2),
  cautioner1_certi_code VARCHAR2(50),
  cautioner1_unit       VARCHAR2(100),
  cautioner2_name       VARCHAR2(30),
  cautioner2_certi_type NUMBER(2),
  cautioner2_certi_code VARCHAR2(50),
  cautioner2_unit       VARCHAR2(100),
  train_man_id          NUMBER(10),
  recommend_man_id      NUMBER(10),
  grade_id              VARCHAR2(3),
  quality_grade_id      NUMBER(3),
  qualification_id      VARCHAR2(20),
  practice_id           VARCHAR2(50),
  invest_connect_id     VARCHAR2(20),
  other_certificate_id  VARCHAR2(20),
  enter_company_date    DATE,
  leave_company_date    DATE,
  agent_status          NUMBER(2),
  update_time           DATE,
  updater_id            NUMBER(10),
  change_type_id        NUMBER(4),
  change_date           DATE,
  change_desc           VARCHAR2(400),
  operater_time         DATE,
  operater_id           NUMBER(10),
  probation_date        DATE,
  turn_date             DATE,
  validate_date         DATE,
  zip                   VARCHAR2(6),
  business_cate         NUMBER(2),
  g_business_cate       NUMBER(2),
  g_grade_id            NUMBER(2),
  g_position_id         NUMBER(2),
  dept_train_id         NUMBER(10),
  area_train_id         NUMBER(10),
  group_train_date      DATE,
  dept_train_date       DATE,
  area_train_date       DATE,
  nation_code           VARCHAR2(2),
  indirect_train_id     NUMBER(10),
  ind_dept_train_id     NUMBER(10),
  start_date            DATE,
  is_adp2               CHAR(1) default 'N',
  adp2_date             DATE,
  agent_cate            VARCHAR2(1) not null,
  sign_date             DATE,
  end_date              DATE,
  is_charge             NUMBER(1) default 2 not null,
  comm_account          VARCHAR2(40),
  prem_account          VARCHAR2(40),
  comm_bank_code        VARCHAR2(20),
  prem_bank_code        VARCHAR2(20),
  b_grade_id            VARCHAR2(3),
  b_instructor_id       VARCHAR2(3),
  b_technical_post      VARCHAR2(3),
  finance_post_id       VARCHAR2(3),
  b_grade_num           NUMBER(3),
  reenter_flag          CHAR(1),
  position_id           VARCHAR2(3),
  sell_grade            NUMBER(3),
  leave_cause           VARCHAR2(6),
  leave_target          NUMBER(3),
  c_grade_id            VARCHAR2(3),
  is_mdrt               CHAR(1) default 'N',
  union_code            VARCHAR2(10),
  isc_num               NUMBER(2) default 0 not null,
  address_2             VARCHAR2(200),
  address_3             VARCHAR2(200),
  address_4             VARCHAR2(200),
  spouse_name           VARCHAR2(40),
  spouse_certi_code     VARCHAR2(50),
  citizen_type          VARCHAR2(6),
  docfpcap              CHAR(1),
  comm_ibg_code         VARCHAR2(30),
  source_code           VARCHAR2(30),
  leave_remark          VARCHAR2(400),
  credit_code           VARCHAR2(20),
  credit_period         NUMBER(4),
  credit_limit          NUMBER(12,2),
  grt_type              VARCHAR2(2),
  grt_amount            NUMBER(12,2),
  grt_amount_rev        NUMBER(12,2),
  grt_expiry_date       DATE,
  gst_registered        CHAR(1) default 'N' not null,
  comm_suspend          VARCHAR2(1) default 'N',
  insert_time           DATE default SYSDATE not null,
  same_domain           CHAR(1),
  g_agent_cate          VARCHAR2(1),
  effective_resource    CHAR(1),
  major                 VARCHAR2(100),
  school                VARCHAR2(100),
  g_role                VARCHAR2(2),
  green_passport        VARCHAR2(1),
  b_grade_date          DATE,
  b_instructor_date     DATE,
  b_technical_post_date DATE,
  cautioner1_title      VARCHAR2(30),
  cautioner1_gender     CHAR(1),
  cautioner1_birthday   DATE,
  cautioner1_com_addr   VARCHAR2(100),
  cautioner1_com_zip    VARCHAR2(6),
  cautioner1_com_tel    VARCHAR2(30),
  cautioner1_home_addr  VARCHAR2(200),
  cautioner1_home_zip   VARCHAR2(6),
  cautioner1_home_tel   VARCHAR2(30),
  health_desc           VARCHAR2(100),
  dimis_is_settled      CHAR(1) default 'N',
  dimis_apply_date      DATE,
  dimission_date        DATE,
  quality_grade         VARCHAR2(5),
  description           VARCHAR2(4000),
  new_grade_id          VARCHAR2(3),
  agent_sub_cate        VARCHAR2(3),
  ind_area_train_id     NUMBER(10)
)
;
create table T_AGENT_CONTRACT_TYPE
(
  agent_contract_type_id   NUMBER(4),
  agent_contract_type_name VARCHAR2(100)
)
;
create table T_AGENT_DEL
(
  agent_id    NUMBER(10),
  delete_time DATE default SYSDATE not null
)
;
create table T_AGENT_DRAW_LIMIT
(
  head_id    VARCHAR2(40) not null,
  grade_id   VARCHAR2(3) not null,
  card_id    NUMBER(10) not null,
  draw_limit NUMBER(3) not null,
  agent_cate VARCHAR2(1) not null
)
;
create table T_AGENT_DUMP
(
  agent_id              NUMBER(10) not null,
  real_name             VARCHAR2(40) not null,
  user_name             VARCHAR2(30),
  password              VARCHAR2(32),
  gender                CHAR(1),
  birthday              DATE,
  certi_type            NUMBER(2),
  certi_code            VARCHAR2(50),
  agent_code            VARCHAR2(20) not null,
  password_change       DATE,
  organ_id              VARCHAR2(40) not null,
  head_id               VARCHAR2(40) not null,
  branch_id             VARCHAR2(40) not null,
  user_status           CHAR(1),
  dept_id               VARCHAR2(20) not null,
  political_id          VARCHAR2(2),
  education_id          VARCHAR2(2),
  foreign_lang_id       VARCHAR2(3),
  foreign_level_id      VARCHAR2(2),
  compute_level         VARCHAR2(2),
  instructor_grade_id   VARCHAR2(2),
  begin_job_date        DATE,
  technical_post        VARCHAR2(50),
  native_place          VARCHAR2(5),
  register_address      VARCHAR2(100),
  family_address        VARCHAR2(100),
  address_area          VARCHAR2(50),
  telephone             VARCHAR2(30),
  old_job_unit          VARCHAR2(100),
  old_job_id            VARCHAR2(10),
  bp                    VARCHAR2(50),
  celler_tel            VARCHAR2(50),
  email                 VARCHAR2(50),
  address               VARCHAR2(100),
  marriage_id           CHAR(1),
  special_favor         VARCHAR2(50),
  cautioner1_name       VARCHAR2(40),
  cautioner1_certi_type NUMBER(2),
  cautioner1_certi_code VARCHAR2(50),
  cautioner1_unit       VARCHAR2(100),
  cautioner2_name       VARCHAR2(40),
  cautioner2_certi_type NUMBER(2),
  cautioner2_certi_code VARCHAR2(50),
  cautioner2_unit       VARCHAR2(100),
  train_man_id          NUMBER(10),
  recommend_man_id      NUMBER(10),
  grade_id              VARCHAR2(3),
  quality_grade_id      NUMBER(3),
  qualification_id      VARCHAR2(20),
  practice_id           VARCHAR2(20),
  invest_connect_id     VARCHAR2(20),
  other_certificate_id  VARCHAR2(20),
  enter_company_date    DATE,
  leave_company_date    DATE,
  agent_status          NUMBER(2) not null,
  update_time           DATE,
  updater_id            NUMBER(10),
  probation_date        DATE,
  turn_date             DATE,
  zip                   VARCHAR2(6),
  agent_cate            VARCHAR2(1) not null,
  sign_date             DATE,
  end_date              DATE,
  g_business_cate       NUMBER(2) not null,
  g_grade_id            NUMBER(2),
  g_position_id         NUMBER(2),
  is_charge             NUMBER(1) not null,
  comm_account          VARCHAR2(40),
  prem_account          VARCHAR2(40),
  business_cate         NUMBER(2),
  dept_train_id         NUMBER(10),
  area_train_id         NUMBER(10),
  group_train_date      DATE,
  dept_train_date       DATE,
  area_train_date       DATE,
  nation_code           VARCHAR2(2),
  indirect_train_id     NUMBER(10),
  ind_dept_train_id     NUMBER(10),
  comm_bank_code        VARCHAR2(20),
  prem_bank_code        VARCHAR2(20),
  b_grade_id            VARCHAR2(3),
  b_instructor_id       VARCHAR2(3),
  b_technical_post      VARCHAR2(3),
  finance_post_id       VARCHAR2(3),
  b_grade_num           NUMBER(3),
  reenter_flag          CHAR(1) not null,
  position_id           VARCHAR2(3),
  sell_grade            NUMBER(3),
  leave_cause           VARCHAR2(6),
  leave_target          NUMBER(3),
  c_grade_id            VARCHAR2(3),
  is_mdrt               CHAR(1),
  union_code            VARCHAR2(10),
  is_adp2               CHAR(1),
  adp2_date             DATE,
  isc_num               NUMBER(2) not null,
  insert_time           DATE not null,
  address_2             VARCHAR2(100),
  address_3             VARCHAR2(100),
  address_4             VARCHAR2(100),
  spouse_name           VARCHAR2(40),
  spouse_certi_code     VARCHAR2(50),
  citizen_type          VARCHAR2(6),
  docfpcap              CHAR(1),
  comm_ibg_code         VARCHAR2(30),
  source_code           VARCHAR2(30),
  letter_status         VARCHAR2(1),
  credit_code           VARCHAR2(20),
  credit_period         NUMBER(4),
  credit_limit          NUMBER(12,2),
  grt_type              VARCHAR2(2),
  grt_amount            NUMBER(12,2),
  grt_amount_rev        NUMBER(12,2),
  grt_expiry_date       DATE,
  gst_registered        CHAR(1) not null,
  comm_suspend          VARCHAR2(1),
  turn_money_flag       CHAR(1) not null,
  init_grade_id         VARCHAR2(3),
  same_domain           CHAR(1),
  g_agent_cate          VARCHAR2(1),
  effective_resource    CHAR(1),
  major                 VARCHAR2(100),
  school                VARCHAR2(100),
  g_role                VARCHAR2(2) not null,
  green_passport        VARCHAR2(1),
  b_grade_date          DATE,
  b_instructor_date     DATE,
  b_technical_post_date DATE,
  cautioner1_title      VARCHAR2(30),
  cautioner1_gender     CHAR(1),
  cautioner1_birthday   DATE,
  cautioner1_com_addr   VARCHAR2(100),
  cautioner1_com_zip    VARCHAR2(6),
  cautioner1_com_tel    VARCHAR2(30),
  cautioner1_home_addr  VARCHAR2(100),
  cautioner1_home_zip   VARCHAR2(6),
  cautioner1_home_tel   VARCHAR2(30),
  health_desc           VARCHAR2(100),
  dimis_is_settled      CHAR(1),
  dimis_apply_date      DATE,
  dimission_date        DATE,
  quality_grade         VARCHAR2(5),
  description           VARCHAR2(4000),
  agent_sub_cate        VARCHAR2(3),
  ind_area_train_id     NUMBER(10)
)
;
create table T_AGENT_FUTURE_COMM
(
  comm_id       NUMBER(12) not null,
  policy_id     NUMBER(10) not null,
  item_id       NUMBER(10) not null,
  due_time      DATE not null,
  due_prem      NUMBER(10,2) not null,
  comm_prem     NUMBER(10,2) not null,
  comm_rate     NUMBER(5,4),
  discount_rate NUMBER(5,4) not null,
  commision     NUMBER(10,2) not null,
  old_agent     NUMBER(10) not null,
  new_agent     NUMBER(10) not null,
  create_date   DATE default SYSDATE not null,
  status        CHAR(1) not null
)
;
create table T_AGENT_GRADE_INFO
(
  agent_id      NUMBER(10) not null,
  dept_id       VARCHAR2(20) not null,
  organ_id      VARCHAR2(40) not null,
  agent_cate    VARCHAR2(1) not null,
  base_indi     CHAR(1) default 'N' not null,
  sell_indi     CHAR(1) default 'N' not null,
  director_indi CHAR(1) default 'N' not null,
  manager_indi  CHAR(1) default 'N' not null,
  change_date   DATE not null,
  init_grade_id VARCHAR2(3) not null,
  insert_time   DATE default SYSDATE not null,
  update_time   DATE default SYSDATE not null
)
;
create table T_AGENT_INSURED_POLICY
(
  policy_id    NUMBER(10) not null,
  change_id    NUMBER(10),
  insured_type NUMBER(2),
  insert_time  DATE default SYSDATE,
  update_time  DATE
)
;
create table T_AGENT_INTERFACE_BACTH
(
  batch_id     NUMBER(14),
  batch_time   DATE,
  table_name   VARCHAR2(50),
  start_time   DATE,
  end_time     DATE,
  record_count NUMBER(14),
  update_time  DATE,
  status       VARCHAR2(1),
  insert_time  DATE,
  pid          NUMBER(10),
  host_name    VARCHAR2(200)
)
;
create table T_AGENT_LEVEL
(
  level_id   NUMBER(10) not null,
  level_name VARCHAR2(20)
)
;
create table T_AGENT_LOG
(
  agent_id              NUMBER(10) not null,
  real_name             VARCHAR2(40),
  user_name             VARCHAR2(30),
  password              VARCHAR2(32),
  gender                CHAR(1),
  birthday              DATE,
  certi_type            NUMBER(2),
  certi_code            VARCHAR2(50),
  agent_code            VARCHAR2(25),
  password_change       DATE default SYSDATE,
  organ_id              VARCHAR2(40) not null,
  head_id               VARCHAR2(40) not null,
  branch_id             VARCHAR2(40) not null,
  user_status           CHAR(1) default '1',
  dept_id               VARCHAR2(20),
  political_id          VARCHAR2(2),
  education_id          VARCHAR2(2),
  foreign_lang_id       VARCHAR2(3),
  foreign_level_id      VARCHAR2(2),
  compute_level         VARCHAR2(2),
  instructor_grade_id   VARCHAR2(2),
  begin_job_date        DATE,
  technical_post        VARCHAR2(50),
  native_place          VARCHAR2(5),
  register_address      VARCHAR2(100),
  family_address        VARCHAR2(100),
  address_area          VARCHAR2(50),
  telephone             VARCHAR2(30),
  old_job_unit          VARCHAR2(100),
  old_job_id            VARCHAR2(10),
  bp                    VARCHAR2(50),
  celler_tel            VARCHAR2(50),
  email                 VARCHAR2(50),
  address               VARCHAR2(100),
  marriage_id           CHAR(1),
  special_favor         VARCHAR2(50),
  cautioner1_name       VARCHAR2(40),
  cautioner1_certi_type NUMBER(2),
  cautioner1_certi_code VARCHAR2(50),
  cautioner1_unit       VARCHAR2(100),
  cautioner2_name       VARCHAR2(40),
  cautioner2_certi_type NUMBER(2),
  cautioner2_certi_code VARCHAR2(50),
  cautioner2_unit       VARCHAR2(100),
  train_man_id          NUMBER(10),
  recommend_man_id      NUMBER(10),
  grade_id              VARCHAR2(3),
  quality_grade_id      NUMBER(3),
  qualification_id      VARCHAR2(20),
  practice_id           VARCHAR2(50),
  invest_connect_id     VARCHAR2(20),
  other_certificate_id  VARCHAR2(20),
  enter_company_date    DATE,
  leave_company_date    DATE,
  agent_status          NUMBER(2),
  update_time           DATE,
  updater_id            NUMBER(10),
  probation_date        DATE,
  log_date              DATE default SYSDATE,
  turn_date             DATE,
  zip                   VARCHAR2(6)
)
;
create table T_AGENT_MAP
(
  list_id        NUMBER(10) not null,
  old_agent_code VARCHAR2(25),
  new_agent_code VARCHAR2(25)
)
;
create table T_AGENT_MEMBERSHIP
(
  agent_id         NUMBER(10) not null,
  year             CHAR(4) not null,
  membership_type  VARCHAR2(1) not null,
  membership_grade VARCHAR2(10) not null
)
;
create table T_AGENT_PARA_DEFINE
(
  para_id   NUMBER(10),
  para_name VARCHAR2(100) not null,
  used_indi NUMBER(1) default 0 not null
)
;
create table T_PERFORMANCE_CATE
(
  cate_id   NUMBER(3),
  cate_name VARCHAR2(100) not null
)
;
create table T_PERFORMANCE_TYPE
(
  type_id         NUMBER(5),
  type_name       VARCHAR2(100) not null,
  cate_id         NUMBER(3),
  used_indi       NUMBER(1) default 0 not null,
  unit_indi       NUMBER(1) not null,
  run_order       NUMBER(3) default 0 not null,
  proc_name       VARCHAR2(100),
  alert_proc_name VARCHAR2(100)
)
;
create table T_AGENT_PARA_FACTOR
(
  list_id             NUMBER(10),
  para_id             NUMBER(10) not null,
  factor_id           NUMBER(2) not null,
  performance_type_id NUMBER(5) not null
)
;
create table T_AGENT_PLAN_TYPE
(
  plan_type_id VARCHAR2(2) not null,
  plan_name    VARCHAR2(100) not null
)
;
create table T_AGENT_PLAN
(
  plan_id      NUMBER(10) not null,
  organ_id     VARCHAR2(40),
  agent_cate   VARCHAR2(1),
  grade_id     VARCHAR2(3),
  plan_type_id VARCHAR2(2),
  months_start NUMBER(2) default (1),
  months_end   NUMBER(2) default (12),
  amount       NUMBER(10,2),
  updater_id   NUMBER(10),
  update_time  DATE
)
;
create table T_AGENT_STANDARD
(
  agent_standard_id NUMBER(4) not null,
  area_type         NUMBER(10),
  months_start      NUMBER(4),
  months_end        NUMBER(4),
  policy_num        NUMBER(4),
  fyc               NUMBER(10,2),
  quality_num       NUMBER(4),
  description       VARCHAR2(200),
  grade_id          VARCHAR2(2),
  insert_time       DATE default SYSDATE not null,
  update_time       DATE default SYSDATE not null
)
;
create table T_AGENT_STATUS
(
  head_id           VARCHAR2(40) not null,
  agent_status      NUMBER(3) not null,
  agent_status_name VARCHAR2(30),
  description       VARCHAR2(200),
  agent_cate        VARCHAR2(1) not null
)
;
create table T_AGENT_TRUN_INFO
(
  agent_id      NUMBER(10) not null,
  year_month    CHAR(6) not null,
  policy_num    NUMBER(4),
  fyc           NUMBER(10,2),
  quality_num   NUMBER(4),
  period        NUMBER(4),
  grade_id      VARCHAR2(2),
  assess_result NUMBER(1),
  insert_time   DATE default SYSDATE not null,
  update_time   DATE default SYSDATE not null
)
;
create table T_AGE_LIMIT
(
  min_age    NUMBER(3) default 0 not null,
  product_id NUMBER(7) not null,
  max_age    NUMBER(3) default 999 not null,
  max_life   NUMBER(10) default 9999999999
)
;
create table T_AGE_SUMLIMIT
(
  min_age    NUMBER(3) default 0 not null,
  max_age    NUMBER(3) default 999 not null,
  max_life   NUMBER(10) default 9999999999,
  max_sudden NUMBER(10) default 9999999999,
  max_person NUMBER(10) default 9999999999,
  max_ill    NUMBER(10) default 9999999999
)
;
create table T_AGREEMENT_PAY
(
  policy_id   NUMBER(10) not null,
  pay_num     NUMBER(4) not null,
  pay_time    DATE not null,
  pay_prem    NUMBER(12,2) not null,
  insert_time DATE default SYSDATE not null,
  update_time DATE default SYSDATE not null
)
;
create table T_AGREEMENT_PREM
(
  policy_id   NUMBER(10) not null,
  pay_num     NUMBER(4) not null,
  pay_time    DATE not null,
  pay_prem    NUMBER(12,2) not null,
  insert_time DATE default SYSDATE not null,
  update_time DATE default SYSDATE not null
)
;
create table T_AGREE_CANCLE_REASON
(
  reason_id   NUMBER(2) not null,
  reason_desc VARCHAR2(40) not null
)
;
create table T_AGRI_BATCH_MSG
(
  upload_id       NUMBER(10),
  organ_id        VARCHAR2(40),
  village_id      VARCHAR2(40),
  interac_agricul VARCHAR2(40),
  err_msg         VARCHAR2(4000)
)
;
create table T_AGS_ITEM_CODE
(
  ags_item_code      VARCHAR2(10) not null,
  ags_item_desc      VARCHAR2(100) not null,
  is_accounting_item CHAR(1) not null
)
;
create table T_AGS_COMMISSION_FEE
(
  fee_id            NUMBER(12) not null,
  organ_id          VARCHAR2(40) not null,
  agent_id          NUMBER(10) not null,
  policy_type       CHAR(1) not null,
  policy_id         NUMBER(10),
  product_id        NUMBER(7),
  charge_type       CHAR(1),
  policy_year       NUMBER(2),
  policy_period     NUMBER(4),
  fee_amount        NUMBER(12,2) not null,
  money_id          NUMBER(6) not null,
  fee_status        NUMBER(2) default 1 not null,
  pay_mode          NUMBER(2) default 3 not null,
  insert_time       DATE default SYSDATE not null,
  update_time       DATE default SYSDATE not null,
  finish_time       DATE,
  cancel_date       DATE,
  finish_id         NUMBER(10),
  cancel_id         NUMBER(10),
  posted            CHAR(1) default 'N' not null,
  post_id           NUMBER(10),
  cred_id           NUMBER(10),
  related_id        NUMBER(12),
  payee_certi_code  VARCHAR2(50),
  normal_prem       NUMBER(10,2),
  is_correct        CHAR(1) default 'N',
  agency_code       VARCHAR2(20),
  cashier_id        NUMBER(10),
  cash_bank         VARCHAR2(20),
  cash_account      VARCHAR2(40),
  payee_name        VARCHAR2(150),
  payee_certi_type  NUMBER(2),
  agent_code        VARCHAR2(25),
  sequence_id       NUMBER(12),
  fee_year_month    VARCHAR2(10),
  cheque_code       VARCHAR2(50),
  draw_code         VARCHAR2(50),
  reversal_id       NUMBER(10),
  entry_code        VARCHAR2(30),
  send_id           NUMBER(10),
  ags_item_code     VARCHAR2(10) not null,
  ags_item_sub_code VARCHAR2(10),
  ags_item_type     NUMBER(2) not null,
  ags_fee_type      NUMBER(2)
)
;
create table T_AGS_ITEM_CODE_MAPPING
(
  mapping_id          NUMBER(4) not null,
  ags_item_code       VARCHAR2(10),
  ags_item_type       NUMBER(2),
  ags_fee_type        NUMBER(2),
  commission_fee_type NUMBER(3),
  plus_minus          CHAR(1) not null
)
;
create table T_AIRPOLICY_UPLOAD
(
  upload_id    NUMBER(10),
  serial_no    VARCHAR2(32) not null,
  policy_no    VARCHAR2(15) not null,
  agree_no     VARCHAR2(20) not null,
  failed_count NUMBER(3) default 0 not null,
  status       CHAR(2) not null,
  error        VARCHAR2(4000),
  insert_time  DATE default sysdate not null,
  update_time  DATE not null
)
;
create table T_AIR_UPLOAD
(
  upload_id   NUMBER(10),
  date_from   DATE not null,
  date_to     DATE not null,
  recorder_id NUMBER(10) not null,
  create_at   DATE default sysdate not null
)
;
create table T_AIR_COMPARE
(
  compare_id     NUMBER(10),
  insure_no      VARCHAR2(20) not null,
  ticket_no      VARCHAR2(15) not null,
  seq            VARCHAR2(4) not null,
  trans_code     VARCHAR2(4) not null,
  passenger_name VARCHAR2(40),
  passenger_id   VARCHAR2(50),
  operator       VARCHAR2(20),
  office_code    VARCHAR2(20),
  ip_address     VARCHAR2(20),
  iata_no        VARCHAR2(20),
  operate_time   VARCHAR2(14) not null,
  flight_number  VARCHAR2(20),
  flight_date    VARCHAR2(10),
  origin_airport VARCHAR2(10),
  dest_airport   VARCHAR2(10),
  company_code   VARCHAR2(10),
  company_name   VARCHAR2(80),
  benefit_type   VARCHAR2(10),
  order_no       VARCHAR2(20),
  insert_time    DATE default sysdate,
  upload_id      NUMBER(12) not null
)
;
create table T_AIR_JOB_CFG
(
  cfg_id     NUMBER(1),
  start_time DATE not null,
  step       NUMBER(6) not null,
  opt_date   DATE,
  job_name   VARCHAR2(100),
  last_error VARCHAR2(4000),
  group_code NUMBER(3),
  para1      VARCHAR2(200),
  para2      VARCHAR2(200),
  para3      VARCHAR2(500),
  para4      VARCHAR2(2000)
)
;
create table T_AIR_POLICY_TRANS
(
  trans_id     NUMBER(10),
  insure_no    VARCHAR2(20) not null,
  trans_code   VARCHAR2(4) not null,
  operate_time DATE not null,
  text_id      NUMBER(12) not null,
  status       NUMBER(1) default 0 not null,
  error        VARCHAR2(1000),
  insert_time  DATE default sysdate not null,
  update_time  DATE default sysdate not null,
  cfg_id       NUMBER(1)
)
;
create table T_ALERT_COMMISION_INFO
(
  commision_id      NUMBER(10) not null,
  agent_id          NUMBER(10),
  organ_id          VARCHAR2(40),
  branch_id         VARCHAR2(40),
  dept_id           VARCHAR2(20),
  year_month        VARCHAR2(6),
  commision_type_id NUMBER(5),
  money             NUMBER(14,2),
  agent_cate        VARCHAR2(1),
  aggregation_id    NUMBER(10),
  insert_time       DATE default sysdate not null,
  money_id          NUMBER(6),
  comm_status       NUMBER(2),
  synch_flag        CHAR(1)
)
;
create table T_ALERT_PERFORMANCE_INFO
(
  list_id             NUMBER(10) not null,
  performance_type_id NUMBER(5) not null,
  aggregation_id      NUMBER(10) not null,
  year_month          VARCHAR2(6) not null,
  organ_id            VARCHAR2(40),
  dept_id             VARCHAR2(20),
  agent_id            NUMBER(10),
  performance_value   NUMBER(16,4) not null,
  insert_time         DATE default sysdate not null,
  synch_flag          CHAR(1)
)
;
create table T_AML_BL_O
(
  organizationno VARCHAR2(20) not null,
  name           VARCHAR2(150),
  cer_type       NUMBER(2),
  cer_no         VARCHAR2(60),
  nationality    VARCHAR2(5),
  modify_date    DATE
)
;
create table T_AML_BL_P
(
  personalno  VARCHAR2(20) not null,
  name        VARCHAR2(150),
  cer_type    NUMBER(2),
  cer_no      VARCHAR2(60),
  nationality VARCHAR2(5),
  modify_date DATE
)
;
create table T_AML_BUSINESS_TYPE
(
  business_type      NUMBER(2) not null,
  business_type_desc VARCHAR2(128)
)
;
create table T_AML_RISK_COMMENT
(
  comment_id        NUMBER(10) not null,
  business_type     NUMBER(1) not null,
  emp_id            NUMBER(10) not null,
  underwrite_id     NUMBER(10),
  change_id         NUMBER(10),
  change_apply_code VARCHAR2(20),
  case_id           NUMBER(10),
  case_no           VARCHAR2(20),
  batch_id          NUMBER(10),
  batch_no          VARCHAR2(20),
  insert_time       DATE default SYSDATE not null,
  update_time       DATE default SYSDATE not null,
  policy_id         NUMBER(10)
)
;


create table T_AML_RISK_LEVEL
(
  level_id   NUMBER(3),
  level_desc VARCHAR2(50)
)
;
create table T_AML_SENDBACK_STATUS
(
  status_id   NUMBER(2) not null,
  status_desc VARCHAR2(150)
)
;
create table T_AML_COMMENT_DETAIL
(
  detail_id     NUMBER(10),
  comm_id       NUMBER(10) not null,
  customer_type NUMBER(1) not null,
  applicant_id  NUMBER(10) not null,
  current_level NUMBER(3),
  comment_level NUMBER(3) not null,
  policy_id     NUMBER(10),
  apply_code    VARCHAR2(20),
  policy_code   VARCHAR2(20),
  insert_time   DATE default SYSDATE not null,
  update_time   DATE default SYSDATE not null,
  person_type   CHAR(1),
  person_id     NUMBER(22),
  status        NUMBER(2)
)
;
create table T_AML_RISK_REASON
(
  reason_id   NUMBER(3),
  reason_desc VARCHAR2(1000),
  level_id    NUMBER(3) not null
)
;
create table T_AML_CAUSE_DETAIL
(
  detail_id         NUMBER(10),
  comment_detail_id NUMBER(10) not null,
  reason_id         NUMBER(3),
  reason_desc       VARCHAR2(2000),
  insert_time       DATE default SYSDATE not null,
  update_time       DATE default SYSDATE not null
)
;
create table T_AML_LEVEL_REASON
(
  reason_id   NUMBER(3),
  reason_desc VARCHAR2(2000),
  level_id    NUMBER(3) not null
)
;
create table T_AML_COMPANY_LEVEL
(
  company_id   NUMBER(10),
  level_id     NUMBER(3) not null,
  level_reason NUMBER(3),
  person_type  CHAR(1),
  person_id    NUMBER(10),
  insert_time  DATE default SYSDATE not null,
  update_time  DATE not null,
  risk_score   NUMBER(5,2),
  audit_reason VARCHAR2(500)
)
;
create table T_AML_CUSTOMER_LEVEL
(
  customer_id  NUMBER(10),
  level_id     NUMBER(3) not null,
  level_reason NUMBER(3),
  person_type  CHAR(1),
  person_id    NUMBER(10),
  insert_time  DATE default SYSDATE not null,
  update_time  DATE not null,
  risk_score   NUMBER(5,2),
  audit_reason VARCHAR2(500)
)
;
create table T_LEVEL_STANDARD
(
  level_standard CHAR(1) not null,
  standard_desc  VARCHAR2(20) not null
)
;
create table T_GROUP_PRODUCT
(
  item_id                 NUMBER(10) not null,
  policy_id               NUMBER(10) not null,
  product_num             VARCHAR2(10) not null,
  product_id              NUMBER(10),
  master_id               NUMBER(10),
  main_rider              CHAR(1) not null,
  count_way               CHAR(1) not null,
  level_standard          CHAR(1),
  discount_rate           NUMBER(8,6) not null,
  pay_rate                NUMBER(4,3) not null,
  insured_amount          NUMBER(10),
  amount                  NUMBER(14,2),
  unit                    NUMBER(12,2),
  period_prem             NUMBER(12,2) not null,
  discount_prem           NUMBER(12,2) not null,
  assign_way              VARCHAR2(1),
  assign_amount           NUMBER(12,2),
  assign_rate             NUMBER(4,3),
  pay_mode                NUMBER(2) not null,
  pay_next                NUMBER(2) not null,
  comm_amount             NUMBER(14,2),
  comm_balance            NUMBER(14,2),
  combo_type              VARCHAR2(10),
  combo_unit              NUMBER(12,2),
  admin_fee_rate          NUMBER(11,10) default 0,
  per_diagnosis_fee       NUMBER(12,2) default 0,
  surplus_rate            NUMBER(10,6) default 1 not null,
  risk_rate_1             NUMBER(7,6) default 0 not null,
  max_add_risk            NUMBER(12,2) default 0 not null,
  charge_unit_amount      NUMBER(10) default 0 not null,
  charge_fee_source       VARCHAR2(1),
  charge_premium_year     CHAR(1) default 'N' not null,
  charge_period_alt       CHAR(1) default 'N' not null,
  charge_prem_type        CHAR(1) default 'N' not null,
  charge_pol_year         CHAR(1) default 'N' not null,
  charge_fee_mode         CHAR(1) default '0' not null,
  charge_section_cal_type VARCHAR2(1) default (1) not null,
  charge_prem_role        CHAR(1) default ('N') not null,
  charge_prem             CHAR(1) default 'N' not null,
  charge_accum_prem       CHAR(1) default 'N' not null,
  note_pay_type           CHAR(1),
  note_pay_ensure         CHAR(1),
  renew_decision          VARCHAR2(1) default '0' not null,
  except_type             CHAR(1) default '0' not null,
  comm_prem               NUMBER(12,2),
  is_continue_apply       CHAR(1),
  is_limit_comm_amount    CHAR(1),
  social_rate             NUMBER(4,3),
  travel_type             CHAR(1),
  expense_rate            NUMBER(5,4),
  display_rate_flag       CHAR(1) default 'Y'
)
;
create table T_AMOUNT_CHANGE_RECORD
(
  list_id             NUMBER(10) not null,
  item_id             NUMBER(10),
  change_id           NUMBER(10),
  policy_id           NUMBER(10) not null,
  change_time         DATE not null,
  change_type         CHAR(1) not null,
  changed_amount      NUMBER(14,2) not null,
  after_gp            NUMBER(16,6) not null,
  insert_time         DATE default sysdate not null,
  before_amount       NUMBER(14,2),
  before_gp           NUMBER(16,6),
  check_enter_time    DATE,
  before_basic_amount NUMBER(14,2),
  after_basic_amount  NUMBER(14,2),
  group_item_id       NUMBER(10)
)
;
create table T_AMOUNT_CHANGE_RECORD_LOG
(
  list_id             NUMBER(10) not null,
  change_id           NUMBER(10) not null,
  old_new             CHAR(1) not null,
  item_id             NUMBER(10),
  policy_id           NUMBER(10) not null,
  change_time         DATE not null,
  change_type         CHAR(1) not null,
  changed_amount      NUMBER(14,2) not null,
  after_gp            NUMBER(16,6) not null,
  insert_time         DATE default sysdate not null,
  before_amount       NUMBER(14,2),
  before_gp           NUMBER(16,6),
  before_basic_amount NUMBER(14,2),
  after_basic_amount  NUMBER(14,2),
  group_item_id       NUMBER(10)
)
;
create table T_AMOUNT_PREM_CHANGE_RECORD
(
  list_id        NUMBER(10) not null,
  item_id        NUMBER(10),
  change_id      NUMBER(10),
  policy_id      NUMBER(10) not null,
  change_time    DATE not null,
  change_type    NUMBER(1) not null,
  changed_amount NUMBER(14,2) not null,
  changed_prem   NUMBER(14,2) not null,
  before_amount  NUMBER(14,2),
  before_prem    NUMBER(14,2),
  after_amount   NUMBER(14,2),
  after_prem     NUMBER(14,2),
  insert_time    DATE default sysdate not null,
  update_time    DATE
)
;
create table T_AMOUNT_TRANSFER
(
  list_id      NUMBER(10) not null,
  change_id    NUMBER(10) not null,
  policy_id    NUMBER(10) not null,
  trans_from   NUMBER(10) not null,
  trans_to     NUMBER(10) not null,
  trans_type   CHAR(1) not null,
  trans_amount NUMBER(14,2) not null,
  real_amount  NUMBER(14,2) not null,
  trans_time   DATE not null,
  insert_time  DATE default sysdate not null
)
;
create table T_ANALYSIS_DEFINE
(
  analysis_code VARCHAR2(40) not null,
  en_name       VARCHAR2(20),
  cn_name       VARCHAR2(20),
  node_status   CHAR(1) default '0',
  coding_method VARCHAR2(20),
  system        CHAR(1) default 'N'
)
;
create table T_ANALYSIS_VALUE
(
  book_id        NUMBER(10) not null,
  analysis_code  VARCHAR2(40) not null,
  analysis_value VARCHAR2(40) not null,
  parent_value   VARCHAR2(40) default '0' not null,
  value_name     VARCHAR2(40) not null,
  grade          NUMBER(1) not null,
  leaf           CHAR(1) default 'N' not null,
  node_status    CHAR(1) default '0'
)
;
create table T_ANNUITY_ALLOT_PARAMETER
(
  product_id         NUMBER(7) not null,
  bonus_allot_date   DATE,
  invest_income_rate NUMBER(7,6),
  invest_income_year CHAR(4),
  invest_income_date DATE,
  recorder_id        NUMBER(10) not null,
  insert_time        DATE,
  updater_id         NUMBER(10) not null,
  update_time        DATE
)
;
create table T_ANNUITY_ASSIGN_AMOUNT
(
  assign_year          VARCHAR2(10) not null,
  assign_amount        NUMBER(20,7) default 0 not null,
  inserter_id          NUMBER(10) not null,
  insert_time          DATE default sysdate not null,
  auditor_id           NUMBER(10),
  auditor_time         DATE,
  is_checked           CHAR(1) default 'N' not null,
  holder_assign_amount NUMBER(20,7) default 0 not null
)
;
create table T_ANNUITY_ASSIGN_AMOUNT_INDV
(
  assign_year          VARCHAR2(10) not null,
  assign_amount        NUMBER(20,7) not null,
  inserter_id          VARCHAR2(16),
  insert_time          DATE,
  auditor_id           VARCHAR2(16),
  auditor_time         DATE,
  is_checked           VARCHAR2(1),
  holder_assign_amount NUMBER(20,7) default 0 not null
)
;
create table T_ANNUITY_INFO
(
  list_id                  NUMBER(10) not null,
  item_id                  NUMBER(10),
  draw_annuity_amount      NUMBER(12,2) default 0,
  insert_time              DATE default sysdate,
  update_time              DATE default sysdate,
  once_draw_bonus_rate     NUMBER(5,4),
  once_draw_bonus_amount   NUMBER(12,2),
  once_draw_annuity_amount NUMBER(12,2),
  draw_bonus_amount        NUMBER(12,2)
)
;
create table T_ANNUITY_INFO_LOG
(
  list_id                  NUMBER(10) not null,
  change_id                NUMBER(10) not null,
  old_new                  CHAR(1) not null,
  item_id                  NUMBER(10),
  draw_annuity_amount      NUMBER(12,2) default 0,
  insert_time              DATE default sysdate,
  update_time              DATE default sysdate,
  once_draw_bonus_rate     NUMBER(5,4),
  once_draw_bonus_amount   NUMBER(12,2),
  once_draw_annuity_amount NUMBER(12,2),
  draw_bonus_amount        NUMBER(12,2)
)
;
create table T_ANNUITY_SURRENDER_PARA_A
(
  product_id        NUMBER(10) not null,
  start_accept_date DATE not null,
  end_accept_date   DATE not null,
  rate              NUMBER(10,6) not null
)
;
create table T_ANNUITY_SURRENDER_RATE
(
  product_id        NUMBER(10) not null,
  begin_withdraw    CHAR(1) not null,
  start_accept_date DATE not null,
  end_accept_date   DATE not null,
  rate              NUMBER(10,6) not null,
  start_age         NUMBER(3) not null
)
;
create table T_ANSWER_STATUS
(
  answer_status VARCHAR2(3) not null,
  status_name   VARCHAR2(30) not null
)
;
create table T_ANSWER_INFO
(
  answer_id        NUMBER(10) not null,
  customer_id      NUMBER(10),
  head_id          VARCHAR2(40) not null,
  branch_id        VARCHAR2(40) not null,
  organ_id         VARCHAR2(40) not null,
  answer_type      VARCHAR2(1) default '0' not null,
  create_date      DATE default sysdate not null,
  assign_date      DATE,
  process_id       NUMBER(10),
  answer_status    VARCHAR2(3) default '0' not null,
  is_success       CHAR(1),
  answer_desc      VARCHAR2(2000),
  answer_date      DATE,
  answer_emp       NUMBER(10),
  policy_type      CHAR(1) not null,
  customer_type    VARCHAR2(2) default '97' not null,
  new_address      VARCHAR2(100),
  new_phone        VARCHAR2(100),
  visit_date       DATE,
  policy_busi_type CHAR(1) not null
)
;
create table T_ANSWER_ASSIGN
(
  assign_id     NUMBER(10) not null,
  answer_id     NUMBER(10) not null,
  policy_type   CHAR(1) not null,
  answer_type   VARCHAR2(1) default '0' not null,
  assign_date   DATE,
  process_id    NUMBER(10),
  answer_status VARCHAR2(3) default '0' not null
)
;
create table T_ANSWER_ASSIGN_PLAN
(
  process_id   NUMBER(10) not null,
  process_date DATE not null,
  answer_type  VARCHAR2(1) not null,
  assign_rate  NUMBER(4,3) not null
)
;
create table T_MAIL_RETURN
(
  return_id   VARCHAR2(2) not null,
  return_name VARCHAR2(50) not null
)
;
create table T_ANSWER_PROCESS
(
  answer_process_id    NUMBER(10) not null,
  answer_id            NUMBER(10) not null,
  process_id           NUMBER(10) not null,
  process_date         DATE not null,
  assign_date          DATE,
  old_status           VARCHAR2(3) not null,
  new_status           VARCHAR2(3) not null,
  old_type             VARCHAR2(1) not null,
  new_type             VARCHAR2(1) not null,
  is_receive           CHAR(1),
  receive_desc         VARCHAR2(250),
  is_notice            CHAR(1),
  notice_desc          VARCHAR2(200),
  is_app_sign          CHAR(1),
  app_sign_desc        VARCHAR2(200),
  is_ins_sign          CHAR(1),
  ins_sign_desc        VARCHAR2(200),
  is_success           CHAR(1),
  is_right             CHAR(1),
  right_desc           VARCHAR2(200),
  is_know_product      CHAR(1),
  know_product_desc    VARCHAR2(200),
  is_satisfy_service   CHAR(1),
  satisfy_service_desc VARCHAR2(200),
  is_know_cancle       CHAR(1),
  know_cancle_desc     VARCHAR2(200),
  is_cutline_sos       CHAR(1),
  is_desc_sos          CHAR(1),
  is_buy_again         CHAR(1),
  buy_again_desc       VARCHAR2(200),
  mail_back_type       VARCHAR2(1),
  return_id            VARCHAR2(2),
  is_misguided         CHAR(1),
  misguided_desc       VARCHAR2(200),
  is_know_app          CHAR(1),
  know_app_desc        VARCHAR2(200),
  other_desc           VARCHAR2(600),
  customer_comment     VARCHAR2(800),
  special_request      VARCHAR2(800),
  answer_status_desc   VARCHAR2(800),
  ul_is_stmt_sign      CHAR(1),
  ul_stmt_sign_desc    VARCHAR2(200),
  ul_q1                CHAR(1),
  ul_q2                CHAR(1),
  ul_q3                CHAR(1),
  ul_q4                CHAR(1),
  ul_q5                CHAR(1),
  ul_notify            VARCHAR2(800)
)
;
create table T_ANTFIN_PAYMENT_SYNC
(
  list_id        NUMBER(10) not null,
  policy_id      NUMBER(10) not null,
  payment_type   NUMBER(2) not null,
  payment_amount NUMBER(16,6) not null,
  sync_status    NUMBER(2),
  insert_time    DATE default SYSDATE not null,
  update_time    DATE
)
;
create table T_APL_MAKEUP_POLICY
(
  policy_code VARCHAR2(20) not null,
  policy_id   NUMBER(10) not null
)
;
create table T_APPEND_REASON_TYPE
(
  reason_type NUMBER(5) not null,
  type_name   VARCHAR2(30) not null
)
;
create table T_APPEND_PRINT_LOG
(
  log_id      NUMBER(12) not null,
  append_date DATE not null,
  policy_id   NUMBER(10) not null,
  emp_id      NUMBER(10) not null,
  reason_type NUMBER(5) not null
)
;
create table T_APPLICANT_TYPE
(
  holder_type NUMBER(2) not null,
  type_name   VARCHAR2(20)
)
;
create table T_APPLICATION_INFO
(
  apply_id                     NUMBER(10) not null,
  case_id                      NUMBER(10) not null,
  insured_name                 VARCHAR2(100) not null,
  insured_gender               CHAR(1) not null,
  insured_certi_type           VARCHAR2(10) not null,
  insured_certi_code           VARCHAR2(50) not null,
  apply_acc_type               VARCHAR2(10),
  death_date                   DATE,
  acc_date                     DATE,
  acc_place                    VARCHAR2(200),
  acc_desc                     VARCHAR2(1000),
  acc_reason                   VARCHAR2(1000),
  policy_code1                 VARCHAR2(20),
  policy_code2                 VARCHAR2(20),
  policy_code3                 VARCHAR2(20),
  policy_code4                 VARCHAR2(20),
  insured_job                  VARCHAR2(20),
  insured_country              VARCHAR2(20),
  insured_certi_start          DATE,
  insured_certi_end            DATE,
  insured_address              VARCHAR2(100),
  insured_zip                  VARCHAR2(20),
  insured_tel                  VARCHAR2(20),
  insured_mobile               VARCHAR2(20),
  insured_email                VARCHAR2(50),
  insured_relation_with_holder VARCHAR2(10),
  other_relation_desc          VARCHAR2(20),
  apply_acc_detail_type        VARCHAR2(10),
  acc_status                   VARCHAR2(10),
  has_other_accept_company     VARCHAR2(10),
  accept_company               VARCHAR2(50),
  has_other_claim_company      VARCHAR2(10),
  claim_company                VARCHAR2(50),
  main_relation_with_insured   VARCHAR2(10),
  main_other_relation_desc     VARCHAR2(20),
  is_print                     CHAR(1),
  main_applicant_info          CLOB,
  other_applicants_info        CLOB,
  version                      NUMBER(19) default 0 not null,
  ecif_id                      NUMBER(20) default 0 not null,
  case_level                   VARCHAR2(1),
  insert_time                  TIMESTAMP(6) default systimestamp not null,
  update_time                  TIMESTAMP(6) default systimestamp not null,
  remark                       VARCHAR2(300)
)
;
create table T_APPLY_FOR_RETURN_INFO
(
  case_id     NUMBER(10) not null,
  return_id   NUMBER(10) not null,
  return_info CLOB
)
;
create table T_APPLY_STATUS
(
  status_type CHAR(1) not null,
  status_name VARCHAR2(40) not null
)
;
create table T_APPLY_TYPE
(
  apply_type CHAR(1) not null,
  type_desc  VARCHAR2(20) not null
)
;
create table T_APP_AGENT
(
  empno       NUMBER(10) not null,
  appno       VARCHAR2(16) not null,
  polno       VARCHAR2(16),
  agent_rate  NUMBER(5,4) not null,
  agent_type  VARCHAR2(1) not null,
  organ_id    VARCHAR2(40) not null,
  deptno      VARCHAR2(20) not null,
  fcd         DATE not null,
  fcu         VARCHAR2(10) not null,
  lcd         DATE not null,
  lcu         VARCHAR2(10) not null,
  insert_time DATE default SYSDATE not null,
  update_time DATE default SYSDATE not null
)
;
create table T_APP_ASCRIPT_RATE
(
  appno          VARCHAR2(16) not null,
  polno          VARCHAR2(16),
  rank           VARCHAR2(2) not null,
  str_ascript_yr NUMBER(4) default 0 not null,
  end_ascript_yr NUMBER(4) default 0 not null,
  ascript_rate   NUMBER(5,4) not null,
  start_date     DATE not null,
  end_date       DATE,
  organ_id       VARCHAR2(40) not null,
  deptno         VARCHAR2(20) not null,
  fcd            DATE not null,
  fcu            VARCHAR2(10) not null,
  lcd            DATE not null,
  lcu            VARCHAR2(10) not null
)
;
create table T_APP_ASSUMPSIT
(
  appno     VARCHAR2(16) not null,
  polno     VARCHAR2(16),
  assumpsit VARCHAR2(1000)
)
;
create table T_APP_BENEF
(
  appno       VARCHAR2(16) not null,
  polno       VARCHAR2(16),
  app_certno  VARCHAR2(16) not null,
  certno      VARCHAR2(16),
  name        VARCHAR2(20) not null,
  sex         VARCHAR2(1) not null,
  benef_seq   NUMBER(2) default 1 not null,
  benef_rate  NUMBER(5,4) default 0 not null,
  benef_idno  VARCHAR2(20),
  organ_id    VARCHAR2(40) not null,
  deptno      VARCHAR2(20) not null,
  fcd         DATE not null,
  fcu         VARCHAR2(10) not null,
  lcd         DATE not null,
  lcu         VARCHAR2(10) not null,
  id_type     NUMBER(2),
  birthday    DATE,
  relation_id NUMBER(2),
  insert_time DATE default SYSDATE not null,
  update_time DATE default SYSDATE not null
)
;
create table T_APP_CERT
(
  appno              VARCHAR2(16) not null,
  polno              VARCHAR2(16),
  plan_code          VARCHAR2(10) not null,
  app_certno         VARCHAR2(16) not null,
  certno             VARCHAR2(16),
  client_psw         VARCHAR2(8),
  insno              NUMBER(10),
  age                NUMBER(3) default 0 not null,
  ascript_start_date DATE,
  ins_rank           VARCHAR2(2) not null,
  pay_type           CHAR(1) not null,
  pay_age            NUMBER(4) default 0 not null,
  invest_auth        VARCHAR2(1) default 'N' not null,
  bankno             VARCHAR2(20),
  bank_acctno        VARCHAR2(30),
  prem_type          CHAR(1) not null,
  te_sum             NUMBER(12,2) default 0 not null,
  tp_sum             NUMBER(12,2) default 0 not null,
  fe_sum             NUMBER(12,2) default 0 not null,
  fp_sum             NUMBER(12,2) default 0 not null,
  salary             NUMBER(12,2) default 0 not null,
  salary_e_prem_rate NUMBER(5,4),
  salary_p_prem_rate NUMBER(5,4),
  app_cert_sts       NUMBER(3) not null,
  app_date           DATE,
  deal_date          DATE,
  deal_empno         NUMBER(10),
  manu_check_date    DATE,
  manu_check_empno   NUMBER(10),
  auto_check_date    DATE,
  auto_check_empno   NUMBER(10),
  und_date           DATE,
  und_empno          NUMBER(10),
  undwrt_date        DATE,
  organ_id           VARCHAR2(40) not null,
  deptno             VARCHAR2(20) not null,
  fcd                DATE not null,
  fcu                VARCHAR2(10) not null,
  lcd                DATE not null,
  lcu                VARCHAR2(10) not null,
  dividend_choice    NUMBER(1) default 2 not null,
  pay_date_type      NUMBER(1) default 1 not null,
  ins_seq            NUMBER(10),
  insert_time        DATE default SYSDATE not null,
  update_time        DATE default SYSDATE not null
)
;
create table T_APP_GRP_INVEST
(
  appno       VARCHAR2(16) not null,
  polno       VARCHAR2(16),
  auth_src    VARCHAR2(1) not null,
  fund_code   VARCHAR2(4) not null,
  invest_rate NUMBER(5,4) not null,
  start_date  DATE not null,
  end_date    DATE,
  organ_id    VARCHAR2(40) not null,
  deptno      VARCHAR2(20) not null,
  fcd         DATE not null,
  fcu         VARCHAR2(10) not null,
  lcd         DATE not null,
  lcu         VARCHAR2(10) not null
)
;
create table T_APP_INSURED_SEQUENCE
(
  insured_sequence NUMBER(2) not null,
  sequence_desc    VARCHAR2(30)
)
;
create table T_APP_INSURED_FIRST
(
  policy_id        NUMBER(10) not null,
  insured_id       NUMBER(10) not null,
  relation_1       NUMBER(2),
  insert_time      DATE default SYSDATE not null,
  relation_2       NUMBER(2),
  insured_sequence NUMBER(2),
  address_type     CHAR(1)
)
;
create table T_APP_INVEST_RATE
(
  appno       VARCHAR2(16) not null,
  polno       VARCHAR2(16),
  app_certno  VARCHAR2(16) not null,
  certno      VARCHAR2(16),
  auth_src    VARCHAR2(1) not null,
  fund_code   VARCHAR2(4) not null,
  invest_rate NUMBER(5,4) not null,
  start_date  DATE not null,
  end_date    DATE,
  organ_id    VARCHAR2(40) not null,
  deptno      VARCHAR2(20) not null,
  fcd         DATE not null,
  fcu         VARCHAR2(10) not null,
  lcd         DATE not null,
  lcu         VARCHAR2(10) not null
)
;
create table T_APP_MAIN
(
  appno                  VARCHAR2(16) not null,
  polno                  VARCHAR2(16),
  plan_code              VARCHAR2(10) not null,
  law_code               VARCHAR2(4) not null,
  total_psns             NUMBER(8) default 0 not null,
  app_psns               NUMBER(8) default 0 not null,
  busi_src_type          VARCHAR2(1) not null,
  applicant              NUMBER(10) not null,
  conta_name             VARCHAR2(50),
  conta_sex              VARCHAR2(1),
  conta_tel              VARCHAR2(40),
  conta_addr             VARCHAR2(100),
  postcode               VARCHAR2(6),
  e_mail                 VARCHAR2(100),
  prem_type              CHAR(1) not null,
  corp_prem_rate         NUMBER(5,4) default 0 not null,
  ascript_rank           VARCHAR2(1) default 'N' not null,
  last_prem_date         DATE,
  buy_price_diff         NUMBER(5,4) default 0 not null,
  app_sts                NUMBER(3) not null,
  app_date               DATE,
  deal_date              DATE,
  deal_empno             NUMBER(10),
  manu_check_date        DATE,
  manu_check_empno       NUMBER(10),
  auto_check_date        DATE,
  auto_check_empno       NUMBER(10),
  und_date               DATE,
  und_empno              NUMBER(10),
  undwrt_date            DATE,
  agentno                NUMBER(10) not null,
  agt_empno              NUMBER(10),
  organ_id               VARCHAR2(40) not null,
  deptno                 VARCHAR2(20) not null,
  fcd                    DATE not null,
  fcu                    VARCHAR2(10) not null,
  lcd                    DATE not null,
  lcu                    VARCHAR2(10) not null,
  agent_deputy           VARCHAR2(10),
  bankno                 VARCHAR2(20),
  bank_acctno            VARCHAR2(30),
  pay_mode               NUMBER(2),
  money_id               NUMBER(6),
  conta_dept             VARCHAR2(40),
  conta_title            VARCHAR2(40),
  conta_fax              VARCHAR2(40),
  conta_mobile           VARCHAR2(40),
  ifsame_retire_age      VARCHAR2(1),
  male_retire_age        NUMBER(3),
  female_retire_age      NUMBER(3),
  pay_date_type          NUMBER(1) default 1 not null,
  dividend_choice        NUMBER(1) default 2 not null,
  ifsame_dividend_choice VARCHAR2(1) default 'Y' not null,
  grade_standard         NUMBER(1) default 1 not null,
  vest_date_type         NUMBER(1) default 2 not null,
  ifsame_prem            VARCHAR2(1) default 'Y' not null,
  ifprem_by_salary       VARCHAR2(1) default 'Y' not null,
  grp_prem               NUMBER(14,2) default 0 not null,
  psn_prem               NUMBER(14,2) default 0 not null,
  annual_fee             NUMBER(14,2) default 0 not null,
  total_prem             NUMBER(14,2) default 0 not null,
  vest_date              DATE,
  insert_time            DATE default SYSDATE not null,
  update_time            DATE default SYSDATE not null,
  nb_agency_code         VARCHAR2(20)
)
;
create table T_APP_RANK
(
  appno              VARCHAR2(16) not null,
  rank               VARCHAR2(2) not null,
  member_num         NUMBER(10) default 0 not null,
  te_sum             NUMBER(12,2) default 0 not null,
  tp_sum             NUMBER(12,2) default 0 not null,
  fe_sum             NUMBER(12,2) default 0 not null,
  fp_sum             NUMBER(12,2) default 0 not null,
  salary_e_prem_rate NUMBER(5,4) default 0 not null,
  salary_p_prem_rate NUMBER(5,4) default 0 not null
)
;
create table T_ARAP_GL
(
  fee_id       NUMBER(12) not null,
  data_table   NUMBER(2),
  list_id      NUMBER(14),
  fee_type     NUMBER(3),
  pay_mode     NUMBER(2),
  currency_id  NUMBER(6),
  charge_type  CHAR(1),
  policy_year  NUMBER(4),
  period_type  CHAR(1),
  organ_id     VARCHAR2(40),
  product_code VARCHAR2(10),
  policy_type  CHAR(1),
  sell_way     VARCHAR2(2),
  policy_id    NUMBER(10),
  fee_status   NUMBER(2),
  fee_amount   NUMBER(12,2),
  finish_time  DATE,
  posted       CHAR(1),
  created_by   NUMBER(10),
  posting_id   NUMBER(10)
)
;
create table T_ARAP_OFFSET_SUM
(
  offset_id     NUMBER(10) not null,
  balance       CHAR(1) not null,
  pay_balance   NUMBER(16,6) not null,
  insert_time   DATE default SYSDATE not null,
  operator_id   NUMBER(10),
  offset_status CHAR(1) default 1 not null
)
;
create table T_ARAP_OFFSET
(
  offset_id       NUMBER(10) not null,
  arap_table      VARCHAR2(1) not null,
  fee_id          NUMBER(10) not null,
  offset_amount   NUMBER(12,2) not null,
  offset_transfer CHAR(1) default 'N' not null
)
;
create table T_ARAP_TABLE
(
  table_code VARCHAR2(1) not null,
  table_name VARCHAR2(60) not null
)
;
create table T_AREA_CATEGORY
(
  area_category_code NUMBER(10) not null,
  area_category_name VARCHAR2(100)
)
;
create table T_AREA_CATEGORY_ORGAN
(
  area_category_code NUMBER(10) not null,
  area_category_name VARCHAR2(100)
)
;
create table T_ARREARAGE
(
  arrearage_id NUMBER(12) not null,
  organ_id     VARCHAR2(40),
  dept_id      VARCHAR2(20),
  agent_id     NUMBER(10),
  year_month   VARCHAR2(6),
  money        NUMBER(10,2),
  comm_money   NUMBER(10,2),
  agent_cate   VARCHAR2(1) not null
)
;
create table T_ASSESS
(
  agent_id             NUMBER(10) not null,
  year_querter         VARCHAR2(6) not null,
  dept_id              VARCHAR2(20) not null,
  grade_id             VARCHAR2(3) not null,
  count_result         CHAR(1),
  adjust_result        CHAR(1),
  process_man          NUMBER(10),
  final_result         CHAR(1),
  is_confirm           CHAR(1),
  agent_cate           VARCHAR2(1) not null,
  insert_time          DATE default SYSDATE not null,
  update_time          DATE default SYSDATE not null,
  assess_id            NUMBER(10) not null,
  assessed_grade       VARCHAR2(3),
  aggregation_id       NUMBER(10),
  assess_item_id       NUMBER(6) not null,
  grade_id_before      VARCHAR2(3) not null,
  grade_id_after       VARCHAR2(3) not null,
  status               NUMBER(3) default 1 not null,
  result_desc          VARCHAR2(100),
  alert_aggregation_id NUMBER(10),
  synch_flag           CHAR(1),
  is_togethe           CHAR(1) default 'N',
  togethe_agent_id     NUMBER(10),
  auto_assess_status   CHAR(1) default '0'
)
;
create table T_ASSESS_ALERT_REPORT_TYPE
(
  report_type_id   NUMBER(3) not null,
  report_type_name VARCHAR2(100)
)
;
create table T_ASSESS_RESULT
(
  result_id   NUMBER(2) not null,
  result_desc VARCHAR2(30) not null
)
;
create table T_ASSESS_FREQUENCY
(
  ferq_type CHAR(1),
  ferq_name VARCHAR2(50)
)
;
create table T_ASSESS_ITEM
(
  assess_item_id          NUMBER(6) not null,
  assess_item_name        VARCHAR2(50),
  description             VARCHAR2(200),
  agent_cate              VARCHAR2(1) not null,
  assess_freq             CHAR(1),
  grade_id_before         VARCHAR2(3) not null,
  grade_id_after          VARCHAR2(3) not null,
  assess_order            NUMBER(2) default 0,
  assess_result           NUMBER(2) not null,
  organ_business_grade_id NUMBER(10)
)
;
create table T_ASSESS_CALC_CFG
(
  cfg_id                NUMBER(10),
  assess_item_id        NUMBER(5),
  logic_indi            NUMBER(1),
  performance_type_id_1 NUMBER(5),
  logic_indi_1          NUMBER(1),
  para_id_1             NUMBER(10),
  performance_type_id_2 NUMBER(5),
  logic_indi_2          NUMBER(1),
  para_id_2             NUMBER(10),
  performance_type_id_3 NUMBER(5),
  logic_indi_3          NUMBER(1),
  para_id_3             NUMBER(10),
  performance_type_id_4 NUMBER(5),
  logic_indi_4          NUMBER(1),
  para_id_4             NUMBER(10),
  performance_type_id_5 NUMBER(5),
  logic_indi_5          NUMBER(1),
  para_id_5             NUMBER(10)
)
;
create table T_ASSESS_ITEM_NEW
(
  assess_item_id          NUMBER(6) not null,
  assess_item_name        VARCHAR2(50),
  description             VARCHAR2(200),
  agent_cate              VARCHAR2(1) not null,
  assess_freq             CHAR(1),
  grade_id_before         VARCHAR2(3) not null,
  grade_id_after          VARCHAR2(3) not null,
  assess_order            NUMBER(2) default 0,
  assess_result           NUMBER(2) not null,
  organ_business_grade_id NUMBER(10)
)
;
create table T_ASSESS_CALC_CFG_NEW
(
  cfg_id                NUMBER(10) not null,
  assess_item_id        NUMBER(5),
  logic_indi            NUMBER(1),
  performance_type_id_1 NUMBER(5),
  logic_indi_1          NUMBER(1),
  para_id_1             NUMBER(10),
  performance_type_id_2 NUMBER(5),
  logic_indi_2          NUMBER(1),
  para_id_2             NUMBER(10),
  performance_type_id_3 NUMBER(5),
  logic_indi_3          NUMBER(1),
  para_id_3             NUMBER(10),
  performance_type_id_4 NUMBER(5),
  logic_indi_4          NUMBER(1),
  para_id_4             NUMBER(10),
  performance_type_id_5 NUMBER(5),
  logic_indi_5          NUMBER(1),
  para_id_5             NUMBER(10)
)
;
create table T_ASSESS_COMMISSION_RATE
(
  assess_rate_id NUMBER(10) not null,
  product_id     NUMBER(7) not null,
  agent_cate     VARCHAR2(1) not null,
  channel_type   CHAR(1) not null,
  discount_rate  NUMBER(5,4) default 1 not null
)
;
create table T_STANDARD_GRADE
(
  grade_id   NUMBER(3) not null,
  name       VARCHAR2(30),
  grade_cate CHAR(1) default '1' not null
)
;
create table T_ASSESS_CONF
(
  assess_id            NUMBER(10),
  assess_item_id       NUMBER(5),
  para_id              NUMBER(10),
  grade_id             VARCHAR2(3) default '0',
  area_grade           NUMBER(10) default 0,
  months_start         NUMBER(4) default 0,
  months_end           NUMBER(4) default 9999,
  amount_start         NUMBER(16,4) default 0,
  amount_end           NUMBER(16,4) default 999999999999.9999,
  renew_rate_start     NUMBER(3,2) default 0,
  renew_rate_end       NUMBER(3,2) default 9.99,
  performance_standard NUMBER(16,4),
  insert_time          DATE default SYSDATE,
  update_time          DATE,
  policy_num_start     NUMBER(6),
  policy_num_end       NUMBER(6)
)
;
create table T_ASSESS_CONF_NEW
(
  assess_id            NUMBER(10) not null,
  assess_item_id       NUMBER(5),
  para_id              NUMBER(10),
  grade_id             VARCHAR2(3) default '0',
  area_grade           NUMBER(10) default 0,
  months_start         NUMBER(4) default 0,
  months_end           NUMBER(4) default 9999,
  amount_start         NUMBER(16,4) default 0,
  amount_end           NUMBER(16,4) default 999999999999.9999,
  renew_rate_start     NUMBER(3,2) default 0,
  renew_rate_end       NUMBER(3,2) default 9.99,
  performance_standard NUMBER(16,4),
  insert_time          DATE default SYSDATE,
  update_time          DATE,
  policy_num_start     NUMBER(6),
  policy_num_end       NUMBER(6)
)
;
create table T_ASSESS_GRADE_ITEM
(
  assess_item_id NUMBER(6) not null,
  grade_id       VARCHAR2(3) not null,
  area_type      NUMBER(10) not null,
  assess_type    NUMBER(1) not null,
  assess_number  NUMBER(10,2) not null,
  agent_cate     VARCHAR2(1) not null,
  months_start   NUMBER(4) not null,
  months_end     NUMBER(4) not null,
  assess_freq    NUMBER(1)
)
;
create table T_ASSESS_INFO
(
  agent_id       NUMBER(10) not null,
  year_querter   VARCHAR2(6) not null,
  assess_item_id NUMBER(6) not null,
  realization    NUMBER(12,2) not null,
  is_promote     CHAR(1),
  is_maintain    CHAR(1),
  agent_cate     VARCHAR2(1) not null,
  insert_time    DATE default SYSDATE not null,
  update_time    DATE default SYSDATE not null
)
;
create table T_CUST_DEPOSIT_TYPE
(
  deposit_type NUMBER(2) not null,
  deposit_name VARCHAR2(50) not null
)
;
create table T_CUST_DEPOSIT
(
  account_code      VARCHAR2(20) not null,
  depost_state      VARCHAR2(1) not null,
  money_id          NUMBER(6) not null,
  deposit_date      DATE not null,
  settle_date       DATE,
  cancel_date       DATE,
  insert_person     NUMBER(10) not null,
  insert_date       DATE default SYSDATE not null,
  updater_id        NUMBER(10),
  update_time       DATE,
  capital_balance   NUMBER(16,6) not null,
  interest_capital  NUMBER(16,6) not null,
  interest_balance  NUMBER(16,6) not null,
  interest_sum      NUMBER(16,6) not null,
  balance_date      DATE not null,
  balance_year      CHAR(4) not null,
  policy_id         NUMBER(10) not null,
  item_id           NUMBER(10),
  deposit_type      NUMBER(2) default 1 not null,
  account_att_type  NUMBER(2) default 0 not null,
  account_name      VARCHAR2(50) default 'DEFAULT' not null,
  group_item_id     NUMBER(10),
  company_id        NUMBER(10),
  la_bal_id         NUMBER(10),
  gurnt_bal_date    DATE,
  bonus_bal_date    DATE,
  indiv_att_rate    NUMBER(5,4),
  deduct_date       DATE,
  deduct_year       NUMBER(4),
  comm_trans_amount NUMBER(16,6),
  dummy_num         VARCHAR2(4)
)
;
create table T_DEPOSIT_PERIOD_BALANCE
(
  balance_id       NUMBER(10) not null,
  account_code     VARCHAR2(20) not null,
  start_date       DATE not null,
  end_date         DATE not null,
  begin_sum        NUMBER(16,6) default 0 not null,
  end_sum          NUMBER(16,6) default 0 not null,
  net_prem_sum     NUMBER(16,6) default 0 not null,
  gurnt_int_sum    NUMBER(16,6) default 0 not null,
  bonus_sum        NUMBER(16,6) default 0 not null,
  settle_int_sum   NUMBER(16,6) default 0 not null,
  gurnt_gap_sum    NUMBER(16,6) default 0 not null,
  loading_sum      NUMBER(16,6) default 0 not null,
  tma_sum          NUMBER(16,6) default 0 not null,
  tarification_sum NUMBER(16,6) default 0 not null,
  partial_sur_sum  NUMBER(16,6) default 0 not null,
  surrender_sum    NUMBER(16,6) default 0 not null,
  claim_fee_sum    NUMBER(16,6) default 0 not null,
  recorder_id      NUMBER(10) not null,
  insert_time      DATE default SYSDATE not null,
  updater_id       NUMBER(10) not null,
  update_time      DATE default SYSDATE not null,
  net_prem_int     NUMBER(16,6),
  loading_int      NUMBER(16,6),
  traification_int NUMBER(16,6),
  partial_sur_int  NUMBER(16,6),
  pay_fee_int      NUMBER(16,6),
  tran_bal_int     NUMBER(16,6),
  cont_prize_sum   NUMBER(16,6),
  cont_prize_int   NUMBER(16,6),
  pay_fee_sum      NUMBER(16,6),
  tran_bal_sum     NUMBER(16,6),
  begin_net_sum    NUMBER(16,6) default 0 not null,
  end_net_sum      NUMBER(16,6) default 0 not null
)
;
create table T_DEPOSIT_STATE
(
  deposit_state VARCHAR2(1) not null,
  state_desc    VARCHAR2(10) not null
)
;
create table T_ASSIGNEE
(
  assignee_id     NUMBER(10) not null,
  policy_id       NUMBER(10) not null,
  assignee_rate   NUMBER(4,3) default 1 not null,
  is_realized     CHAR(1) default 'Y' not null,
  assignee_name   VARCHAR2(50),
  customer_id     NUMBER(10),
  bank_code       VARCHAR2(20),
  auth_draw       NUMBER(2) not null,
  deposit_account VARCHAR2(40),
  telephone       VARCHAR2(30),
  mobile_tel      VARCHAR2(30),
  address         VARCHAR2(100),
  address_2       VARCHAR2(100),
  address_3       VARCHAR2(100),
  address_4       VARCHAR2(100),
  zip             VARCHAR2(10),
  assignee_status CHAR(1) default '1' not null,
  bank_account    VARCHAR2(40)
)
;






create table T_ASSIGNEE_LOG
(
  change_id       NUMBER(10) not null,
  assignee_id     NUMBER(10) not null,
  old_new         CHAR(1) not null,
  policy_id       NUMBER(10) not null,
  assignee_type   VARCHAR2(2) default '0' not null,
  assignee_rate   NUMBER(4,3) default 1,
  is_realized     CHAR(1) default 'Y' not null,
  assignee_name   VARCHAR2(50),
  customer_id     NUMBER(10),
  bank_code       VARCHAR2(20),
  auth_draw       NUMBER(2) not null,
  deposit_account VARCHAR2(40),
  telephone       VARCHAR2(30),
  mobile_tel      VARCHAR2(30),
  address         VARCHAR2(100),
  address_2       VARCHAR2(100),
  address_3       VARCHAR2(100),
  address_4       VARCHAR2(100),
  zip             VARCHAR2(10),
  assignee_status CHAR(1) default '1' not null,
  bank_account    VARCHAR2(40)
)
;
create table T_ASSUMPSIT_CATE
(
  cate_id   NUMBER(2) not null,
  cate_name VARCHAR2(255) not null
)
;
create table T_ASSUMPSIT
(
  assumpsit_code VARCHAR2(4) not null,
  cate_id        NUMBER(2) not null,
  assumpsit_abbr VARCHAR2(40),
  full_text      VARCHAR2(4000)
)
;
create table T_ASSUMPSIT_LEVEL
(
  level_id   CHAR(1) not null,
  level_name VARCHAR2(30) not null
)
;
create table T_ATTENDANCE_DETAIL
(
  attendance_detail_id NUMBER(10) not null,
  agent_id             NUMBER(10),
  year_month           VARCHAR2(6),
  attendance_id        NUMBER(3),
  attendance_days      NUMBER(3),
  money                NUMBER(10,2),
  commision_id         NUMBER(12),
  agent_cate           VARCHAR2(1) not null,
  attendance_rate      NUMBER(5,4),
  attendance_status    CHAR(1),
  s_attendance_date    DATE,
  e_attendance_date    DATE,
  instead_agent_id     NUMBER(10),
  confirm_agent_id     NUMBER(10)
)
;
create table T_ATTEND_TYPE
(
  attend_id   NUMBER(3) not null,
  attend_name VARCHAR2(20)
)
;
create table T_ATTENDANCE_ITEM
(
  attendance_item_id NUMBER(3) not null,
  head_id            VARCHAR2(40) not null,
  area_type          NUMBER(10) not null,
  attendance_name    VARCHAR2(20),
  attendance_detain  NUMBER(7,2),
  attendance_item    NUMBER(3),
  agent_cate         VARCHAR2(1) not null
)
;
create table T_ATTEND_ASSESS_TYPE
(
  assess_type_id   NUMBER(2) not null,
  assess_type_name VARCHAR2(30) not null
)
;
create table T_ATTEND_ASSESS_STAND
(
  list_id           NUMBER(10) not null,
  organ_id          VARCHAR2(40) not null,
  assess_type_id    NUMBER(3) not null,
  commision_type_id NUMBER(5) not null,
  grade_id          VARCHAR2(3) not null,
  rate              NUMBER(5,4) not null
)
;
create table T_AUDIT_CONCLUSION
(
  audit_conclusion CHAR(1) not null,
  conclusion_desc  VARCHAR2(100) not null
)
;
create table T_AUDIT_SUB_CONCLUSION
(
  sub_conclusion   CHAR(2) not null,
  conclusion_desc  VARCHAR2(100) not null,
  audit_conclusion CHAR(1) not null,
  is_claim_enable  VARCHAR2(1) default 'N' not null
)
;
create table T_AUTH
(
  auth_id     NUMBER(10) not null,
  policy_id   NUMBER(10) not null,
  customer_id NUMBER(10) not null,
  authorized  CHAR(1) default 'N' not null,
  insert_time DATE default SYSDATE not null,
  update_time DATE default SYSDATE not null,
  auth_type   NUMBER(2)
)
;
create table T_AUTH_CUSTOMER
(
  auth_no     VARCHAR2(30) not null,
  customer_id NUMBER(10) not null
)
;
create table T_AUTH_CUSTOMER_LOG
(
  change_id   NUMBER(10) not null,
  auth_no     VARCHAR2(30) not null,
  old_new     CHAR(1) not null,
  customer_id NUMBER(10) not null
)
;
create table T_AUTH_TYPE
(
  auth_type NUMBER(2) not null,
  type_name VARCHAR2(100) not null
)
;
create table T_AUTH_LOG
(
  change_id   NUMBER(10) not null,
  auth_id     NUMBER(10) not null,
  old_new     CHAR(1) not null,
  policy_id   NUMBER(10) not null,
  auth_type   NUMBER(2) not null,
  customer_id NUMBER(10) not null,
  authorized  CHAR(1) default 'N' not null,
  update_time DATE default SYSDATE not null
)
;
create table T_AUTH_OPERATE_RECORD
(
  table_name  VARCHAR2(50) not null,
  column_name VARCHAR2(50) not null,
  operate_pk  NUMBER(12) not null,
  auth_from   NUMBER(10) not null,
  auth_to     NUMBER(10) not null,
  insert_time DATE default SYSDATE not null,
  update_time DATE default SYSDATE not null
)
;
create table T_AUTH_SRC_TBL
(
  auth_src  VARCHAR2(1) not null,
  full_name VARCHAR2(40) not null,
  abbr_name VARCHAR2(10) not null
)
;
create table T_AUTH_USER
(
  auth_id         NUMBER(10) not null,
  auth_from       NUMBER(10) not null,
  auth_to         NUMBER(10) not null,
  auth_start_date DATE default SYSDATE not null,
  auth_end_date   DATE not null,
  auth_status     NUMBER(2) default 1 not null,
  update_time     DATE default SYSDATE not null,
  insert_time     DATE default SYSDATE not null,
  cancel_id       NUMBER(10),
  cancel_time     DATE
)
;
create table T_GROUP
(
  group_id   NUMBER(10) not null,
  organ_id   VARCHAR2(40) not null,
  group_name VARCHAR2(100) not null,
  group_desc VARCHAR2(100),
  admin      CHAR(1) default 'N' not null,
  parent_id  NUMBER(10)
)
;
create table T_AUTH_USER_GP_LOG
(
  auth_id     NUMBER(10) not null,
  group_id    NUMBER(10) not null,
  auth_log_id NUMBER(10) not null
)
;
create table T_AUTH_USER_GROUP
(
  auth_id  NUMBER(10) not null,
  group_id NUMBER(10) not null
)
;
create table T_AUTO_APPROVE_CFG
(
  cfg_id      NUMBER(10) not null,
  organ_id    VARCHAR2(40),
  service_id  NUMBER(10),
  max_pay     NUMBER(10),
  insert_time DATE,
  update_time DATE,
  operator_id NUMBER(10)
)
;
create table T_AUTO_APPROVE_CFG_LOG
(
  cfg_id      NUMBER(10) not null,
  organ_id    VARCHAR2(40),
  service_id  NUMBER(10),
  max_pay     NUMBER(10),
  insert_time DATE,
  operator_id NUMBER(10)
)
;
create table T_AUTO_FILL_TYPE
(
  auto_fill_type NUMBER(1) not null,
  auto_fill_name VARCHAR2(20) not null,
  auto_fill_desc VARCHAR2(500)
)
;
create table T_AUTO_LAPSED_POLICY
(
  lapse_id      NUMBER(10) not null,
  policy_id     NUMBER(10) not null,
  lapse_date    DATE not null,
  opt_id        NUMBER(10) not null,
  create_time   DATE not null,
  lapsed_opt_id NUMBER,
  lapsed_time   DATE not null
)
;
create table T_AUTO_LAPSE_POLICY
(
  lapse_id    NUMBER(10) not null,
  policy_id   NUMBER(10) not null,
  lapse_date  DATE not null,
  opt_id      NUMBER(10),
  create_time DATE not null
)
;
create table T_AUTO_SEND_BUSI_TYPE
(
  type_id   VARCHAR2(3) not null,
  type_desc VARCHAR2(100)
)
;
create table T_AUTO_SEND_OBJECT
(
  list_id        NUMBER(10) not null,
  send_type      CHAR(1) not null,
  business_type  VARCHAR2(3) not null,
  receive_object VARCHAR2(100) not null
)
;
create table T_BACKGROUND_ASYN_CFG
(
  use_asyn_id      NUMBER(10) not null,
  busi_action_flag VARCHAR2(200) not null,
  service_id       NUMBER(10),
  use_asyn_num     NUMBER(10)
)
;
create table T_BACKGROUND_CALL_BAK
(
  call_id       NUMBER(10) not null,
  process_id    NUMBER(10) not null,
  emp_id        NUMBER(10) not null,
  call_time     DATE not null,
  plan_time     DATE not null,
  start_time    DATE,
  end_time      DATE,
  call_status   NUMBER(1) not null,
  call_result   NUMBER(1),
  log_info      VARCHAR2(4000),
  para_value_1  VARCHAR2(200),
  para_value_2  VARCHAR2(200),
  para_value_3  VARCHAR2(200),
  para_value_4  VARCHAR2(200),
  para_value_5  VARCHAR2(200),
  para_value_6  VARCHAR2(200),
  para_value_7  VARCHAR2(200),
  para_value_8  VARCHAR2(200),
  para_value_9  VARCHAR2(200),
  para_value_10 VARCHAR2(200),
  ora_job_id    VARCHAR2(40)
)
;
create table T_ERROR_CATE_0
(
  cate_id   NUMBER(1) not null,
  cate_name VARCHAR2(100) not null
)
;
create table T_ERROR_CATE_1
(
  cate_id     NUMBER(3) not null,
  cate_name   VARCHAR2(100) not null,
  parent_cate NUMBER(1) not null
)
;
create table T_ERROR_CATE_2
(
  cate_id     NUMBER(5) not null,
  cate_name   VARCHAR2(100) not null,
  parent_cate NUMBER(3) not null
)
;
create table T_ERROR_TYPE
(
  type_id     NUMBER(7) not null,
  module_name VARCHAR2(300) not null,
  error_name  VARCHAR2(400) not null,
  cause_deal  VARCHAR2(200),
  cate_0      NUMBER(1) not null,
  cate_1      NUMBER(3) not null,
  cate_2      NUMBER(5) not null
)
;
create table T_BACKGROUND_CALL_ERROR
(
  error_id    NUMBER(10) not null,
  call_id     NUMBER(10) not null,
  error_type  NUMBER(7) not null,
  add_info    VARCHAR2(4000),
  insert_time DATE default SYSDATE not null
)
;
create table T_BACKGROUND_CALL_ERROR_BAK
(
  error_id    NUMBER(10) not null,
  call_id     NUMBER(10) not null,
  error_type  NUMBER(7) not null,
  add_info    VARCHAR2(4000),
  insert_time DATE not null
)
;
create table T_BACKGROUND_FEE_RESULT
(
  call_id       NUMBER(10) not null,
  fee_amount    NUMBER(12,2),
  policy_code   VARCHAR2(20),
  fee_id        NUMBER(12),
  pay_mode      NUMBER(2) not null,
  fee_type      NUMBER(3) not null,
  fee_status    NUMBER(2),
  err_message   VARCHAR2(4000),
  batch_result  NUMBER(1),
  operator_time DATE
)
;
create table T_BACK_FAIL_CODE
(
  back_fail_code CHAR(1),
  back_fail_name VARCHAR2(100)
)
;
create table T_BACK_LOG_CONFIG
(
  type_id      NUMBER(10) not null,
  type_desc    VARCHAR2(1000),
  key_value_1  VARCHAR2(1000),
  key_value_2  VARCHAR2(1000),
  key_value_3  VARCHAR2(1000),
  key_value_4  VARCHAR2(1000),
  key_value_5  VARCHAR2(1000),
  key_value_6  VARCHAR2(1000),
  key_value_7  VARCHAR2(1000),
  key_value_8  VARCHAR2(1000),
  key_value_9  VARCHAR2(1000),
  key_value_10 VARCHAR2(1000),
  opt_status   VARCHAR2(1000),
  log_info     VARCHAR2(1000),
  switch_flag  CHAR(1),
  keep_days    NUMBER(10),
  clean_flag   CHAR(1)
)
;
create table T_BACK_LOG
(
  log_id       NUMBER(10) not null,
  type_id      NUMBER(10) not null,
  key_value_1  VARCHAR2(1000),
  key_value_2  VARCHAR2(1000),
  key_value_3  VARCHAR2(1000),
  key_value_4  VARCHAR2(1000),
  key_value_5  VARCHAR2(1000),
  key_value_6  VARCHAR2(1000),
  key_value_7  VARCHAR2(1000),
  key_value_8  VARCHAR2(1000),
  key_value_9  VARCHAR2(1000),
  key_value_10 VARCHAR2(1000),
  opt_status   CHAR(1),
  log_info     CLOB,
  insert_time  DATE default SYSDATE not null
)
;
create table T_BAILEE_TYPE
(
  type_id     NUMBER(2) not null,
  bailee_type VARCHAR2(20)
)
;
create table T_BALANCE_BILL
(
  bill_id      NUMBER(10) not null,
  book_id      NUMBER(10) not null,
  year_period  CHAR(4) not null,
  period_id    CHAR(6) not null,
  mode_id      NUMBER(2) not null,
  bal_num      VARCHAR2(20) not null,
  bank_account VARCHAR2(20) not null,
  bal_time     DATE not null
)
;
create table T_BALANCE_INFO
(
  balance_id          NUMBER(10) not null,
  policy_code         VARCHAR2(20),
  policy_source       VARCHAR2(5),
  policy_prem         NUMBER(12,2),
  organ_id            VARCHAR2(40),
  agent_code          VARCHAR2(25),
  cancel_source       NUMBER(2),
  balance_type        VARCHAR2(2),
  balance_result      NUMBER(2),
  balance_result_desc VARCHAR2(2000),
  balance_date        DATE,
  insert_time         DATE default SYSDATE,
  update_time         DATE
)
;
create table T_BALANCE_SHEET
(
  book_id        NUMBER(10) not null,
  report_id      NUMBER(10) not null,
  report_date    DATE not null,
  report_company VARCHAR2(100) not null,
  organ_id       VARCHAR2(40) not null,
  report_type    VARCHAR2(4) not null
)
;
create table T_BALANCE_ITEM
(
  report_id     NUMBER(10) not null,
  item_id       NUMBER(10) not null,
  row_id        NUMBER(4) not null,
  row_num       NUMBER(4),
  row_name      VARCHAR2(100),
  begin_formula VARCHAR2(100),
  begin_amount  NUMBER(12,2),
  end_formula   VARCHAR2(100),
  end_amount    NUMBER(12,2),
  item_type     CHAR(1)
)
;
create table T_RCPTBUSI_TYPE
(
  busi_type CHAR(1) not null,
  type_name VARCHAR2(50) not null
)
;
create table T_BANK2TP_PY_D
(
  bank_type    VARCHAR2(4) not null,
  busi_type    CHAR(1) not null,
  bankop_batno VARCHAR2(5) not null,
  identno      VARCHAR2(16) not null,
  polno        VARCHAR2(16),
  bankno       VARCHAR2(20) not null,
  bank_acctno  VARCHAR2(30) not null,
  prem_due     NUMBER(12,2) not null,
  curno        VARCHAR2(2) default '01' not null,
  due_date     DATE not null,
  bnkproc_date DATE not null,
  bnkrst_code  VARCHAR2(5) not null,
  check_result VARCHAR2(5),
  proc_result  VARCHAR2(1) default 'F' not null,
  proc_date    DATE default SYSDATE not null
)
;
create table T_BANK2TP_PY_D_H
(
  bank_type    VARCHAR2(4) not null,
  busi_type    CHAR(1) not null,
  bankop_batno VARCHAR2(5) not null,
  identno      VARCHAR2(16) not null,
  polno        VARCHAR2(16),
  clientno     NUMBER(10),
  bankno       VARCHAR2(20) not null,
  bank_acctno  VARCHAR2(30) not null,
  prem_due     NUMBER(12,2) not null,
  curno        VARCHAR2(2) default '01' not null,
  due_date     DATE not null,
  bnkproc_date DATE not null,
  bnkrst_code  VARCHAR2(5) not null,
  check_result VARCHAR2(5),
  proc_result  VARCHAR2(1) default 'F' not null,
  proc_date    DATE default SYSDATE not null
)
;
create table T_BANKINS_AREABANK
(
  zoneno      VARCHAR2(5) not null,
  branch_code VARCHAR2(20) not null,
  bank_code   VARCHAR2(20) not null
)
;
create table T_BANKINS_DAYCHECK_FILE
(
  check_id      NUMBER(10) not null,
  check_date    DATE not null,
  totle_piece   NUMBER(10) not null,
  totle_premium NUMBER(12,2) not null,
  match_result  CHAR(1)
)
;
create table T_BANKINS_DAYCHECK_DETAIL
(
  detail_id     NUMBER(10) not null,
  check_id      NUMBER(10) not null,
  send_code     VARCHAR2(30) not null,
  holder_name   VARCHAR2(30) not null,
  premium       NUMBER(12,2) not null,
  match_result  CHAR(1) not null,
  function_flag CHAR(1) not null
)
;
create table T_BANKINS_ERROR_TYPE
(
  error_type    VARCHAR2(4) not null,
  error_message VARCHAR2(100)
)
;
create table T_BANKINS_PRODUCT
(
  product_code VARCHAR2(3) not null,
  product_id   NUMBER(5) not null,
  branch_code  VARCHAR2(20) not null,
  health       CHAR(1) default 'Y'
)
;
create table T_BANK_ACCOUNT_ALL
(
  id          NUMBER(10) not null,
  old_sum     NUMBER(10),
  new_sum     NUMBER(10),
  diff_sum    NUMBER(10),
  insert_time DATE default sysdate,
  is_log      CHAR(1)
)
;
create table T_BANK_ACCOUNT_CHANGE
(
  bank_code         VARCHAR2(20) not null,
  bank_account      VARCHAR2(40) not null,
  acco_name         VARCHAR2(100) not null,
  certi_type        NUMBER(2) not null,
  certi_code        VARCHAR2(50) not null,
  account_status    CHAR(1) default '1' not null,
  bank_accnt_chg_id NUMBER(10) not null,
  operator_id       NUMBER(10) not null,
  operate_time      DATE not null
)
;
create table T_BANK_ACCOUNT_DEL
(
  bank_code    VARCHAR2(20),
  bank_account VARCHAR2(40),
  delete_time  DATE default SYSDATE not null
)
;
create table T_BANK_ACCOUNT_DIFF
(
  id           NUMBER(10) not null,
  bank_code    VARCHAR2(20),
  bank_account VARCHAR2(40),
  is_log       CHAR(1)
)
;
create table T_BANK_ACCOUNT_DIFF_DETAIL
(
  id           NUMBER(10) not null,
  bank_code    VARCHAR2(20),
  bank_account VARCHAR2(40),
  table_name   VARCHAR2(200),
  insert_time  DATE default sysdate
)
;
create table T_BANK_ACCOUNT_LOG
(
  bank_code      VARCHAR2(20) not null,
  bank_account   VARCHAR2(40) not null,
  acco_name      VARCHAR2(120),
  certi_type     NUMBER(2),
  certi_code     VARCHAR2(50),
  account_status VARCHAR2(1) not null,
  suspend_cause  VARCHAR2(1),
  apply_date     DATE not null,
  operater_id    NUMBER(10) not null,
  insert_time    DATE default SYSDATE not null,
  ibg_code       VARCHAR2(30),
  send_id        NUMBER(10),
  is_basic       CHAR(1) default 'N' not null,
  account_type   CHAR(1) default '9' not null,
  cause_desc     VARCHAR2(1000),
  unsuccess_id   VARCHAR2(4),
  record_id      NUMBER(10),
  record_time    DATE,
  organ_id       VARCHAR2(40),
  transfer_name  VARCHAR2(100),
  change_id      NUMBER(10) not null,
  old_new        CHAR(1) not null
)
;
create table T_BANK_AGENCY_DETAIL
(
  bank_code      VARCHAR2(20),
  internal_bank  VARCHAR2(20),
  entry_code     VARCHAR2(30) not null,
  receipt_code   VARCHAR2(20),
  customer_name  VARCHAR2(50),
  fee_amount     NUMBER(12,2) default 0 not null,
  agency_hand    NUMBER(10),
  internal_hand  VARCHAR2(20),
  agency_code    VARCHAR2(20),
  fee_id         NUMBER(12),
  bill_no        VARCHAR2(30) not null,
  customer_name2 VARCHAR2(40),
  pay_mode       NUMBER(2),
  transfer_date  DATE not null,
  status         CHAR(1) not null,
  unsuccess_id   VARCHAR2(4),
  agency_account VARCHAR2(20),
  cheque_code    VARCHAR2(30),
  detail_id      NUMBER(10) not null,
  insert_time    DATE default SYSDATE not null,
  update_time    DATE default SYSDATE not null
)
;
create table T_BANK_AGENCY_ORG
(
  bank_code        VARCHAR2(20) not null,
  agency_org_code  VARCHAR2(20),
  insert_time      DATE not null,
  update_time      DATE not null,
  fee_bank_code    VARCHAR2(255),
  fee_account_name VARCHAR2(255),
  fee_account_code VARCHAR2(255)
)
;
create table T_BANK_AGENCY_TEXT
(
  bank_code        VARCHAR2(20) not null,
  entry_code       VARCHAR2(30) not null,
  bank_text        CLOB,
  create_time      DATE default SYSDATE not null,
  receipt_flag     CHAR(1),
  operater_id      NUMBER(10) not null,
  status           CHAR(1) not null,
  insert_time      DATE default SYSDATE not null,
  update_time      DATE default SYSDATE not null,
  issue_entry_code VARCHAR2(30)
)
;
create table T_BANK_AGENT
(
  agent_id    NUMBER(10) not null,
  bank_code   VARCHAR2(20) not null,
  valid_date  DATE,
  update_time DATE,
  update_id   NUMBER(10)
)
;
create table T_BANK_AGENT_LOG
(
  bank_cont_chg_id NUMBER(10) not null,
  agent_id         NUMBER(10) not null,
  bank_code        VARCHAR2(20) not null,
  change_date      DATE,
  valid_date       DATE,
  update_time      DATE,
  update_id        NUMBER(10)
)
;
create table T_TRANSFER_UNSUCCESS
(
  bank_code      VARCHAR2(20) not null,
  unsuccess_id   VARCHAR2(20) not null,
  unsuccess_name VARCHAR2(100) not null,
  organ_id       VARCHAR2(40) not null,
  unsuccess_type NUMBER(2)
)
;
create table T_BANK_BACK
(
  send_id        NUMBER(10) not null,
  fee_id         NUMBER(12) not null,
  account        VARCHAR2(40) not null,
  fee_amount     NUMBER(12,2) not null,
  unsuccess_id   VARCHAR2(20),
  status         CHAR(1) not null,
  insert_time    DATE default SYSDATE not null,
  bank_code      VARCHAR2(20) not null,
  collect_pay    CHAR(1) not null,
  transfer_date  DATE not null,
  acco_name      VARCHAR2(100),
  certi_code     VARCHAR2(50),
  organ_id       VARCHAR2(40),
  prem_id        NUMBER(12),
  pay_mode       NUMBER(2) not null,
  reference      VARCHAR2(30),
  update_time    DATE default SYSDATE not null,
  policy_id      NUMBER(10),
  account_source NUMBER(2)
)
;
create table T_BANK_BACK_DEL
(
  send_id     NUMBER(10),
  fee_id      NUMBER(12),
  delete_time DATE default SYSDATE not null
)
;
create table T_BANK_BRIGE_DATA
(
  list_id            NUMBER(10) not null,
  bank_code          VARCHAR2(20) not null,
  bank_account       VARCHAR2(40) not null,
  acco_name          VARCHAR2(120),
  certi_type         NUMBER(2),
  certi_code         VARCHAR2(50),
  account_status     VARCHAR2(1) not null,
  suspend_cause      VARCHAR2(1),
  apply_date         DATE not null,
  operater_id        NUMBER(10) not null,
  insert_time        DATE default SYSDATE not null,
  ibg_code           VARCHAR2(30),
  send_id            NUMBER(10),
  is_basic           CHAR(1) default 'N' not null,
  account_type       CHAR(1) default '7' not null,
  cause_desc         VARCHAR2(1000),
  unsuccess_id       VARCHAR2(4),
  record_id          NUMBER(10),
  record_time        DATE,
  organ_id           VARCHAR2(40),
  transfer_name      VARCHAR2(100),
  prov_district_name VARCHAR2(50),
  city_district_name VARCHAR2(50),
  public_private     CHAR(1) default '1',
  model_type         NUMBER(2)
)
;
create table T_BANK_BUSINESS_CATE
(
  business_cate VARCHAR2(2) not null,
  type_name     VARCHAR2(30) not null
)
;
create table T_BANK_CHANNEL
(
  channel_type VARCHAR2(2) not null,
  type_name    VARCHAR2(30) not null
)
;
create table T_DEPT_CHANGE_TYPE
(
  change_type_id NUMBER(4) not null,
  change_name    VARCHAR2(100)
)
;
create table T_BANK_CHG
(
  bank_chg_id             NUMBER(10) not null,
  bank_code               VARCHAR2(20) not null,
  internal_code           VARCHAR2(20),
  branch_bank             VARCHAR2(20),
  bank_name               VARCHAR2(100) not null,
  bank_class              CHAR(1) not null,
  agency_type             CHAR(1),
  address                 VARCHAR2(100),
  telephone               VARCHAR2(30),
  zip                     VARCHAR2(6),
  leader_id               NUMBER(10),
  organ_id                VARCHAR2(40),
  head_id                 VARCHAR2(40),
  branch_id               VARCHAR2(40),
  manager_id              NUMBER(10),
  dept_id                 VARCHAR2(20),
  status                  CHAR(1) default 0 not null,
  create_date             DATE,
  recall_date             DATE,
  comeback_date           DATE,
  insert_time             DATE default SYSDATE not null,
  update_time             DATE default SYSDATE not null,
  bank_type               VARCHAR2(2) default '1' not null,
  is_basic                CHAR(1) default 'N' not null,
  transfer_type           VARCHAR2(1) default '0' not null,
  abbr_name               VARCHAR2(100) not null,
  address_2               VARCHAR2(100),
  address_3               VARCHAR2(100),
  address_4               VARCHAR2(100),
  manager_pay_mode        NUMBER(2),
  financing_pay_mode      NUMBER(2),
  counter_number          NUMBER(10),
  personal_depoit_balance NUMBER(10,2),
  channel_type            VARCHAR2(2),
  business_cate           VARCHAR2(2),
  updater_id              NUMBER(10),
  change_type_id          NUMBER(4),
  change_date             DATE,
  valid_start_date        DATE,
  valid_end_date          DATE,
  group_address           VARCHAR2(100),
  group_phone             VARCHAR2(30),
  group_leader_id         NUMBER(10),
  group_create_date       DATE,
  group_recall_date       DATE,
  group_comeback_date     DATE,
  group_status            CHAR(1) default 0,
  adjust_rate             NUMBER(5,4),
  licence_code            VARCHAR2(100),
  licence_daealine        DATE,
  deliverer_code          VARCHAR2(30),
  deliverer_name          VARCHAR2(30),
  area_category_code      VARCHAR2(2),
  agency_org_code         VARCHAR2(20),
  fee_bank_code           VARCHAR2(255),
  fee_account_name        VARCHAR2(255),
  fee_account_code        VARCHAR2(255)
)
;
create table T_BANK_CLERK_INFO
(
  clerk_code    VARCHAR2(20) not null,
  clerk_name    VARCHAR2(50) not null,
  telephone     VARCHAR2(30),
  internal_code VARCHAR2(20) not null,
  bank_code     VARCHAR2(20) not null,
  bank_name     VARCHAR2(100),
  branch_bank   VARCHAR2(20),
  organ_id      VARCHAR2(20),
  status        CHAR(1) default 1 not null,
  insert_time   DATE default sysdate not null,
  update_time   DATE
)
;
create table T_BANK_CODE_REFER
(
  organ_id      VARCHAR2(40) not null,
  bank_code     VARCHAR2(20) not null,
  internal_code VARCHAR2(20),
  insert_time   DATE default sysdate,
  update_time   DATE default sysdate
)
;
create table T_BANK_COMM
(
  list_id     NUMBER(14) not null,
  agency_code VARCHAR2(20) not null,
  product_id  NUMBER(7) not null,
  year_month  CHAR(6) not null,
  organ_id    VARCHAR2(40),
  manager_id  NUMBER(10),
  period_prem NUMBER(10,2) default 0,
  rate        NUMBER(5,4),
  money       NUMBER(10,2),
  branch_bank VARCHAR2(20) not null,
  charge_type CHAR(1) not null,
  period      NUMBER(3),
  fee_type    NUMBER(3) not null
)
;
create table T_BANK_COMM_RATE
(
  id                 NUMBER(12) not null,
  bank_code          VARCHAR2(20) not null,
  product_id         NUMBER(7) not null,
  coverage_period    CHAR(1) not null,
  charge_period      CHAR(1) not null,
  protect_time       NUMBER(3) not null,
  payment_age        NUMBER(3) not null,
  valid_time         DATE not null,
  rate               NUMBER(5,4),
  insert_time        DATE not null,
  operator_id        NUMBER(10) not null,
  contract_code      VARCHAR2(40),
  period_rate        NUMBER(5,4),
  agreement_end_date DATE,
  agreement_type     VARCHAR2(2),
  sell_way           VARCHAR2(2)
)
;
create table T_BANK_COMM_RATE_HISTORY
(
  id              NUMBER(12) not null,
  bank_code       VARCHAR2(20) not null,
  product_id      NUMBER(7) not null,
  coverage_period CHAR(1) not null,
  charge_period   CHAR(1) not null,
  protect_time    NUMBER(3) not null,
  payment_age     NUMBER(3) not null,
  valid_time      DATE not null,
  rate            NUMBER(5,4),
  insert_time     DATE not null,
  operator_id     NUMBER(10) not null,
  type            VARCHAR2(10) not null,
  opt_time        DATE,
  contract_code   VARCHAR2(40),
  period_rate     NUMBER(5,4)
)
;
create table T_BANK_CONFIGURE
(
  bank_code     VARCHAR2(20) not null,
  internal_code VARCHAR2(20),
  bank_name     VARCHAR2(100)
)
;
create table T_BANK_CONTRACT_TYPE
(
  contract_type VARCHAR2(2) not null,
  contract_name VARCHAR2(20)
)
;
create table T_BANK_CONTRACT
(
  bank_cont_id       NUMBER(10) not null,
  contract_code      VARCHAR2(40) not null,
  contract_type      VARCHAR2(2),
  bank_code          VARCHAR2(20),
  qualification_code VARCHAR2(20),
  organ_id           VARCHAR2(40),
  start_date         DATE,
  end_date           DATE,
  period             NUMBER(10),
  auto_period        NUMBER(10),
  sign_name          VARCHAR2(100),
  company_name       VARCHAR2(100),
  file_name          VARCHAR2(100),
  contract_file      BLOB,
  contract_status    VARCHAR2(2),
  insert_time        DATE,
  update_time        DATE,
  updater_id         NUMBER(10)
)
;
create table T_BANK_CONTRACT_BANK
(
  bank_cont_id NUMBER(10) not null,
  bank_code    VARCHAR2(20) not null,
  update_time  DATE,
  updater_id   NUMBER(10)
)
;
create table T_BANK_CONTRACT_BANK_LOG
(
  bank_cont_chg_id NUMBER(10) not null,
  change_date      DATE,
  bank_cont_id     NUMBER(10),
  bank_code        VARCHAR2(20),
  update_time      DATE,
  updater_id       NUMBER(10)
)
;
create table T_BANK_CONTRACT_LOG
(
  bank_cont_chg_id   NUMBER(10) not null,
  change_date        DATE,
  bank_cont_id       NUMBER(10),
  contract_code      VARCHAR2(40) not null,
  contract_type      VARCHAR2(2),
  bank_code          VARCHAR2(20),
  qualification_code VARCHAR2(20),
  organ_id           VARCHAR2(40),
  start_date         DATE,
  end_date           DATE,
  period             NUMBER(10),
  auto_period        NUMBER(10),
  sign_name          VARCHAR2(100),
  company_name       VARCHAR2(100),
  file_name          VARCHAR2(100),
  contract_file      BLOB,
  contract_status    VARCHAR2(2),
  insert_time        DATE,
  update_time        DATE,
  updater_id         NUMBER(10)
)
;
create table T_BANK_CONTRACT_PRODUCT
(
  bank_cont_id NUMBER(10) not null,
  product_id   NUMBER(10) not null,
  update_time  DATE,
  updater_id   NUMBER(10)
)
;
create table T_BANK_CONTRACT_PRODUCT_LOG
(
  bank_cont_chg_id NUMBER(10) not null,
  change_date      DATE,
  bank_cont_id     NUMBER(10),
  product_id       NUMBER(10),
  update_time      DATE,
  updater_id       NUMBER(10)
)
;
create table T_BANK_DEL
(
  bank_code   VARCHAR2(20),
  delete_time DATE default SYSDATE not null
)
;
create table T_BANK_EMP_CHG
(
  policy_id      NUMBER(10) not null,
  change_date    DATE default SYSDATE not null,
  emp_id         NUMBER(10) not null,
  emp_id_changed NUMBER(10) not null,
  opt_id         NUMBER(10) not null,
  insert_time    DATE default SYSDATE not null
)
;
create table T_BANK_EMP_RELATIVE
(
  relative_id   NUMBER(10) not null,
  agent_id      NUMBER(10),
  relation_id   NUMBER(2),
  real_name     VARCHAR2(40) not null,
  gender        CHAR(1),
  birthday      DATE,
  certi_type    NUMBER(2),
  certi_code    VARCHAR2(50),
  special_favor VARCHAR2(400),
  background    VARCHAR2(1000),
  description   VARCHAR2(4000)
)
;
create table T_BANK_ENTRY
(
  bank_code      VARCHAR2(20) not null,
  entry_code     VARCHAR2(30) not null,
  entry_date     DATE not null,
  collect_num    NUMBER(8),
  collect_amount NUMBER(12,2),
  pay_num        NUMBER(8),
  pay_amount     NUMBER(12,2),
  operater_id    NUMBER(10) not null,
  insert_time    DATE default SYSDATE not null,
  update_time    DATE default SYSDATE not null
)
;
create table T_BANK_GROUP_AGENT_MAPPING
(
  mapping_id NUMBER(10) not null,
  bank_code  VARCHAR2(20) not null,
  product_id NUMBER(7) not null,
  agent_id   NUMBER(10) not null,
  emp_id     NUMBER(10),
  do_time    DATE default SYSDATE
)
;
create table T_BANK_INSURANT_FILE
(
  detail_id   NUMBER(10) not null,
  zoneno      VARCHAR2(5) not null,
  brno        VARCHAR2(10) not null,
  tellerno    VARCHAR2(5) not null,
  transrno    VARCHAR2(10) not null,
  fuctionflag CHAR(1),
  send_code   VARCHAR2(20) not null,
  okflag      CHAR(1),
  rejectno    VARCHAR2(4),
  insert_time DATE default SYSDATE,
  upload_file CLOB,
  bank_code   VARCHAR2(20) not null
)
;
create table T_BANK_INTERFACE
(
  send_id       NUMBER(10) not null,
  organ_id      VARCHAR2(40) not null,
  totalsum      VARCHAR2(5) not null,
  totalamt      VARCHAR2(20) not null,
  create_time   DATE default SYSDATE not null,
  org_seqno     VARCHAR2(2) not null,
  collect_pay   CHAR(1) not null,
  bank_code     VARCHAR2(40) not null,
  send_filename VARCHAR2(100),
  back_filename VARCHAR2(100),
  sys_flag      CHAR(2) default '00' not null,
  bank_flag     CHAR(2) default '00' not null,
  request_time  DATE,
  send_time     DATE,
  response_time DATE,
  back_time     DATE,
  remark_01     VARCHAR2(250),
  remark_02     VARCHAR2(250),
  remark_03     VARCHAR2(250),
  remark_04     VARCHAR2(250),
  remark_05     VARCHAR2(250),
  send_user_id  NUMBER(10),
  insert_time   DATE,
  update_time   DATE
)
;
create table T_BANK_LIMIT
(
  limit_id     NUMBER(10) not null,
  bank_code    VARCHAR2(20),
  limit_amount NUMBER(16,2)
)
;
create table T_BANK_MIDDLE_BUSI_CONFIG
(
  conf_id       NUMBER(10) not null,
  organ_id      VARCHAR2(40) not null,
  bank_code     VARCHAR2(4) not null,
  collect_pay   VARCHAR2(1) not null,
  send_back     VARCHAR2(1) not null,
  account_type  CHAR(1) not null,
  operate_model VARCHAR2(1) not null,
  recorder_id   NUMBER(10) not null,
  insert_time   DATE default SYSDATE not null,
  updater_id    NUMBER(10),
  update_time   DATE default SYSDATE
)
;
create table T_BANK_ORGAN_DISTRICT
(
  list_id       NUMBER(10) not null,
  organ_id      VARCHAR2(3) not null,
  district_id   VARCHAR2(2) not null,
  district_name VARCHAR2(40)
)
;
create table T_BANK_TEXT_DEL
(
  send_id     NUMBER(10),
  delete_time DATE default SYSDATE not null
)
;
create table T_BASE_RATE
(
  grade_id  NUMBER(2) not null,
  base_rate NUMBER(5,4)
)
;
create table T_BASE_SALARY_TYPE
(
  salary_type_id VARCHAR2(2) not null,
  type_name      VARCHAR2(100) not null
)
;
create table T_BASE_SALARY
(
  base_money     NUMBER(10,2),
  fy_rate        NUMBER(5,4) default 0 not null,
  max_rate       NUMBER(5,4) default 0 not null,
  step_term      NUMBER(5) default 0 not null,
  step_rate      NUMBER(5,4) default 0 not null,
  base_salary_id NUMBER(10) not null,
  organ_id       VARCHAR2(40),
  area_type      NUMBER(10),
  agent_cate     VARCHAR2(1),
  grade_id       VARCHAR2(3),
  salary_type_id VARCHAR2(2),
  months_start   NUMBER(2) default (1),
  months_end     NUMBER(2) default (12)
)
;
create table T_BASIC_ACCOUNT
(
  templet_code    VARCHAR2(10) not null,
  parent_code     VARCHAR2(40) not null,
  account_code    VARCHAR2(40) not null,
  name            VARCHAR2(500) not null,
  full_name       VARCHAR2(500) not null,
  change          CHAR(1) not null,
  extend          CHAR(1) default 'Y' not null,
  basic           CHAR(1) default 'Y' not null,
  account_cate_id NUMBER(2) not null,
  account_grade   NUMBER(1) not null,
  leaf            CHAR(1) default 'N' not null,
  balance         CHAR(1) not null,
  check_foreign   CHAR(1) default 'N' not null,
  money_id        NUMBER(6) not null,
  print_format    CHAR(1) default '1' not null,
  cash_account    CHAR(1) default 'N' not null,
  bank_account    CHAR(1) default 'N' not null,
  invoice         CHAR(1) default 'N' not null,
  node_status     CHAR(1) not null,
  organ_check     CHAR(1) default 'N' not null,
  product_check   CHAR(1) default 'N' not null,
  dept_check      CHAR(1) default 'N' not null,
  channel_check   CHAR(1) default 'N' not null,
  benefit_check   CHAR(1) default 'N' not null,
  busi_check      CHAR(1) default 'N' not null,
  period_check    CHAR(1) default 'N' not null,
  daily_account   CHAR(1) default 'N' not null,
  analysis_code   VARCHAR2(300)
)
;
create table T_BATCH_BILL_UPLOAD
(
  batch_bill_id  NUMBER(10) not null,
  print_status   NUMBER(2) default 0 not null,
  organ_id       VARCHAR2(40),
  uploaded_count NUMBER(10) default 0 not null,
  sum_prem       NUMBER(14,2) default 0 not null,
  uploader_id    NUMBER(10),
  upload_date    DATE,
  insert_time    DATE default SYSDATE not null,
  update_time    DATE default SYSDATE not null,
  print_time     DATE,
  printer_id     NUMBER(10),
  upload_text    CLOB,
  blob_id        NUMBER(12)
)
;
create table T_BATCH_BUSI_OPT
(
  schedule_id NUMBER(8) not null,
  busi_date   DATE not null,
  policy_type VARCHAR2(2),
  status      NUMBER(2) not null,
  insert_time DATE not null,
  update_time DATE not null
)
;
create table T_BATCH_CHANGE_POLICY_ERROR
(
  batch_change_id  NUMBER(10) not null,
  batch_service_id NUMBER(10) not null,
  policy_code      VARCHAR2(20),
  error_msg        VARCHAR2(400) not null
)
;
create table T_BATCH_CHANGE_RELATION
(
  batch_change_id NUMBER(10) not null,
  change_id       NUMBER(10) not null,
  policy_code     VARCHAR2(20) not null
)
;
create table T_BATCH_CHANGE_ROLLBACK
(
  change_id       NUMBER(10) not null,
  batch_change_id NUMBER(10) not null,
  policy_code     VARCHAR2(20) not null,
  notice_code     VARCHAR2(20),
  change_status   VARCHAR2(2) not null,
  update_time     DATE default sysdate not null,
  handler_id      NUMBER(10),
  rollback_count  NUMBER(10)
)
;
create table T_BATCH_CLAIM_LEVEL_YBT
(
  organ_id         VARCHAR2(40) not null,
  parent_id        VARCHAR2(40),
  level_id         NUMBER(2) not null,
  max_amount       NUMBER(10),
  award_max_amount NUMBER(10),
  insert_time      DATE default SYSDATE not null,
  update_time      DATE default SYSDATE not null
)
;
create table T_BATCH_CS_BACK_RELATION
(
  batch_change_id NUMBER(10) not null,
  change_id       NUMBER(10) not null,
  list_id         NUMBER(10) not null
)
;
create table T_BATCH_ERROR
(
  error_id    NUMBER(10) not null,
  opt_id      NUMBER(8) not null,
  schedule_id NUMBER(8) not null,
  opt_date    DATE default SYSDATE not null,
  error_desc  VARCHAR2(4000) not null,
  status      CHAR(1) default '0' not null
)
;
create table T_BATCH_FEE_UPLOAD
(
  batch_id          NUMBER(10) not null,
  organ_id          VARCHAR2(40) not null,
  uploader_id       NUMBER(10),
  upload_date       DATE,
  insert_time       DATE default SYSDATE not null,
  update_time       DATE default SYSDATE not null,
  upload_text       CLOB,
  agency_code       VARCHAR2(50),
  sell_flag         NUMBER(1),
  card_id           NUMBER(10),
  receipt_code      VARCHAR2(200),
  receipt_name      NUMBER(10),
  receipt_amount    NUMBER(14,2),
  pay_mode          NUMBER(2),
  fee_type          NUMBER(3),
  fee_amount        NUMBER(14,2),
  cheque_code       VARCHAR2(40),
  cash_bank_account VARCHAR2(80),
  cash_bank         VARCHAR2(40),
  cash_account      VARCHAR2(40),
  settle_id         NUMBER(10),
  net_bank_code     VARCHAR2(40),
  net_bank_account  VARCHAR2(40),
  upload_count      NUMBER(10) default 0
)
;
create table T_BATCH_LETTER_STATUS
(
  status_id   NUMBER(2) not null,
  status_name VARCHAR2(255) not null
)
;
create table T_BATCH_LETTER_TYPE
(
  type_id   NUMBER(2) not null,
  type_name VARCHAR2(255) not null
)
;
create table T_BATCH_LETTER
(
  batch_id        NUMBER(10) not null,
  file_type       NUMBER(2) not null,
  category_id     NUMBER(6) not null,
  blob_id         NUMBER(12),
  job_status      NUMBER(2) not null,
  download_times  NUMBER(5) default (0) not null,
  create_emp      NUMBER(10),
  create_time     DATE default SYSDATE not null,
  download_emp    NUMBER(10),
  download_time   DATE,
  organ_id        VARCHAR2(40),
  bonus_due_month NUMBER(2),
  policy_type     CHAR(1)
)
;
create table T_BATCH_LETTER_BLOB
(
  batch_id    NUMBER(10) not null,
  file_type   NUMBER(2) not null,
  blob_id     NUMBER(10) not null,
  description VARCHAR2(300)
)
;
create table T_BATCH_LIAB
(
  batch_id    NUMBER(10) not null,
  item_id     NUMBER(10) not null,
  liab_id     NUMBER(4) not null,
  product_id  NUMBER(10) not null,
  policy_id   NUMBER(10) not null,
  product_num CHAR(3) not null,
  insert_time DATE default SYSDATE not null,
  update_time DATE default SYSDATE not null
)
;
create table T_BATCH_MATURITY_REDO_LIST
(
  list_id        NUMBER,
  policy_id      NUMBER,
  souce_opt_type VARCHAR2(1),
  redo_count     NUMBER,
  insert_time    DATE,
  update_time    DATE
)
;
create table T_BATCH_POLICY_CHANGE
(
  batch_change_id          NUMBER(10) not null,
  batch_service_id         NUMBER(10) not null,
  handler_id               NUMBER(10),
  insert_time              DATE default SYSDATE not null,
  change_status            VARCHAR2(2) default -1 not null,
  validate_time            DATE,
  apply_type               CHAR(1),
  service_type             CHAR(1),
  need_underwrite          CHAR(1) default 'N',
  ratifier_id              NUMBER(10),
  ratification_time        DATE,
  ratif_notes              VARCHAR2(4000),
  apply_code               VARCHAR2(20),
  organ_id                 VARCHAR2(40),
  apply_time               DATE default sysdate not null,
  cancel_id                NUMBER(10),
  cancel_time              DATE,
  cancel_note              VARCHAR2(4000),
  record_time              DATE,
  finish_time              DATE,
  service_emp              NUMBER(10),
  ratification_update_time DATE
)
;
create table T_BATCH_REPORT
(
  report_id        NUMBER(10) not null,
  batch_id         NUMBER(10) not null,
  reporter_id      NUMBER(10) not null,
  reporter_organ   VARCHAR2(40) not null,
  report_time      DATE not null,
  super_organ      VARCHAR2(40) not null,
  report_content   VARCHAR2(1000) not null,
  forsee_amount    NUMBER(14,2),
  confirmed        CHAR(1) not null,
  superior_id      NUMBER(10),
  superior_opinion VARCHAR2(1000),
  confirm_time     DATE,
  insert_time      DATE default SYSDATE not null,
  update_time      DATE default SYSDATE not null
)
;

create table T_BATCH_SERVICE
(
  batch_service_id    NUMBER(10) not null,
  batch_service_name  VARCHAR2(50) not null,
  change_source       VARCHAR2(2) not null,
  organ_personal_auth CHAR(1) default 'N' not null
)
;
create table T_BATCH_SUB_JOB
(
  job_id       NUMBER(10),
  schedule_id  NUMBER(8) not null,
  job_desc     VARCHAR2(40),
  package_name VARCHAR2(80) not null,
  para_num     NUMBER(2) default 0 not null
)
;
create table T_BATCH_SUB_TASK
(
  task_id       NUMBER(10),
  job_id        NUMBER(10) not null,
  schedule_id   NUMBER(8) not null,
  opt_id        NUMBER(8) not null,
  task_status   NUMBER(1) default 0 not null,
  ora_job_id    VARCHAR2(40),
  insert_time   DATE default sysdate not null,
  start_time    DATE,
  end_time      DATE,
  para_value_01 VARCHAR2(40),
  para_value_02 VARCHAR2(40),
  para_value_03 VARCHAR2(40),
  para_value_04 VARCHAR2(40),
  para_value_05 VARCHAR2(40),
  para_value_06 VARCHAR2(40),
  para_value_07 VARCHAR2(40),
  para_value_08 VARCHAR2(40),
  para_value_09 VARCHAR2(40),
  para_value_10 VARCHAR2(40),
  result_desc   VARCHAR2(4000)
)

create table T_BATCH_UNIT
(
  batch_id             NUMBER(10) not null,
  unit_num             NUMBER(10) not null,
  insured_id           NUMBER(10) not null,
  apply_name           VARCHAR2(120) not null,
  apply_certi_type     NUMBER(2) not null,
  apply_certi_code     VARCHAR2(50) not null,
  accident_status      VARCHAR2(2),
  accident_place       VARCHAR2(600),
  accident_time        DATE,
  accident_type        VARCHAR2(1),
  accident_id          VARCHAR2(20),
  claim_sum            NUMBER(14,2),
  register_conclusion  CHAR(1),
  noregister_cause     VARCHAR2(2),
  case_id              NUMBER(10),
  hospital_code        VARCHAR2(20),
  hospital             VARCHAR2(400),
  insert_time          DATE default SYSDATE not null,
  update_time          DATE default SYSDATE not null,
  diagnosis_count      NUMBER(4) default 0 not null,
  liab_id              NUMBER(4),
  pay_mode             NUMBER(2),
  acco_name_init       VARCHAR2(100),
  bank_code_init       VARCHAR2(20),
  bank_account_init    VARCHAR2(40),
  account_check_status CHAR(1),
  check_memo           VARCHAR2(400),
  acco_name            VARCHAR2(120),
  bank_code            VARCHAR2(20),
  bank_account         VARCHAR2(40),
  pay_certi_type       NUMBER(2),
  pay_certi_code       VARCHAR2(50),
  telephone            VARCHAR2(30),
  email                VARCHAR2(100)
)
;
create table T_UPLOAD_BUS_TYPE
(
  bus_id   NUMBER(3) not null,
  bus_desc VARCHAR2(100) not null
)
;
create table T_BATCH_UPLOAD_STATUS
(
  status_id    NUMBER(3) not null,
  status_desc  VARCHAR2(100) not null,
  busiess_type NUMBER(3)
)
;
create table T_BATCH_UPLOAD
(
  batch_upload_id NUMBER(10) not null,
  batch_status    NUMBER(3),
  bussiess_id     NUMBER(3),
  upload_date     DATE default sysdate,
  update_operator NUMBER(10),
  upload_data     CLOB,
  organ_id        VARCHAR2(40)
)
;
create table T_BATCH_UPLOAD_DETAIL
(
  batch_detail_id NUMBER(10) not null,
  pk_colum1       NUMBER(10),
  pk_colum2       NUMBER(10),
  pk_colum3       NUMBER(10),
  upload_data     CLOB,
  batch_upload_id NUMBER(10),
  detail_status   NUMBER(3)
)
;
create table T_TOPIC
(
  topic_id NUMBER not null,
  top_name VARCHAR2(20)
)
;

create table T_BBS
(
  topic_id    NUMBER not null,
  top_id      NUMBER not null,
  root_id     NUMBER,
  parent_id   NUMBER,
  subject     VARCHAR2(50),
  description VARCHAR2(4000),
  create_dt   DATE,
  modify_dt   DATE,
  author      VARCHAR2(10),
  author_ip   VARCHAR2(20),
  count       NUMBER(6),
  click_num   NUMBER(10) default 0,
  blob_id     NUMBER(12)
)
;
create table T_BBS_ADMIN
(
  user_id  NUMBER(10) not null,
  topic_id NUMBER(2) not null
)
;
create table T_BENE_INFO
(
  fee_id       NUMBER(12) not null,
  bene_name    VARCHAR2(100),
  certi_type   NUMBER(2),
  certi_code   VARCHAR2(50),
  claim_pay_id NUMBER(12)
)
;
create table T_BENE_LOG
(
  change_id   NUMBER(10) not null,
  bene_id     NUMBER(10) not null,
  old_new     CHAR(1) not null,
  policy_id   NUMBER(10) not null,
  insurant    NUMBER(10) not null,
  bene_type   CHAR(1) not null,
  bene_order  CHAR(1) not null,
  real_name   VARCHAR2(40) not null,
  gender      CHAR(1),
  birthday    DATE,
  certi_type  NUMBER(2),
  certi_code  VARCHAR2(50),
  bene_rate   NUMBER(4,3) not null,
  relation_id NUMBER(2) not null
)
;
create table T_BENE_NATURE
(
  nature_id   NUMBER(2) not null,
  bene_nature VARCHAR2(20)
)
;
create table T_BESPOKE_TYPE
(
  type_id   VARCHAR2(2) not null,
  type_desc VARCHAR2(20)
)
;
create table T_BILLCARD_DEPLOY
(
  deploy_id    NUMBER(10) not null,
  card_id      NUMBER(3) not null,
  organ_id     VARCHAR2(40) not null,
  deploy_date  DATE,
  start_no     NUMBER(10) not null,
  deploy_num   NUMBER(10) not null,
  sum_print    NUMBER(12,2) not null,
  sum_deploy   NUMBER(12,2) not null,
  operate_id   NUMBER(10) not null,
  operate_date DATE default SYSDATE not null,
  dept_id      VARCHAR2(20),
  out_organ_id VARCHAR2(40),
  out_dept_id  VARCHAR2(20),
  insert_time  DATE default SYSDATE not null,
  update_time  DATE default SYSDATE not null,
  pkg_id       NUMBER(7)
)
;
create table T_BILLCARD_DEPLOY_PRINT
(
  flow_id     NUMBER(10) not null,
  deploy_id   NUMBER(10),
  printing_id NUMBER(10),
  start_no    NUMBER(10),
  num         NUMBER(10)
)
;
create table T_BILLCARD_DRAW
(
  draw_id          NUMBER(10) not null,
  card_id          NUMBER(10),
  card_type        CHAR(1),
  organ_id         VARCHAR2(40),
  dept_id          VARCHAR2(20),
  draw_date        DATE,
  draw_num         NUMBER(10),
  start_no         VARCHAR2(30),
  operate_id       NUMBER(10),
  operate_date     DATE,
  emp_id           NUMBER(10),
  agent_id         NUMBER(10),
  sum_prem         NUMBER(10,2),
  agency_code      VARCHAR2(20),
  insert_time      DATE default SYSDATE not null,
  update_time      DATE default SYSDATE not null,
  draw_organ       VARCHAR2(40) not null,
  bank_agency      VARCHAR2(20),
  approver         VARCHAR2(50),
  draw_state       NUMBER(2),
  pkg_id           NUMBER(7),
  effective_date   DATE default date '1900-1-1',
  expiration_date  DATE default date '9999-9-9',
  single_agent_id  NUMBER(10),
  sell_way         VARCHAR2(2),
  outer_agent_code VARCHAR2(25),
  outer_real_name  VARCHAR2(100)
)
;
create table T_PRINTERY
(
  printery_id   NUMBER(10) not null,
  printery_name VARCHAR2(100) not null,
  linkman       VARCHAR2(40),
  address       VARCHAR2(100),
  telephone     VARCHAR2(30),
  zip           VARCHAR2(6)
)
;
create table T_BILLCARD_PRINTING
(
  printing_id     NUMBER(10) not null,
  card_id         NUMBER(10),
  printing_num    NUMBER(10),
  start_num       NUMBER,
  manufacturer    VARCHAR2(100),
  linkman         VARCHAR2(30),
  link_tel        VARCHAR2(30),
  operate_id      NUMBER(10),
  operate_date    DATE,
  notes           VARCHAR2(150),
  sum_print       NUMBER(12,2),
  unit_print      NUMBER(12,4),
  organ_id        VARCHAR2(40),
  input_num       NUMBER(10),
  printery_id     NUMBER(10),
  insert_time     DATE default SYSDATE not null,
  update_time     DATE default SYSDATE not null,
  finished        CHAR(1) default 'Y' not null,
  pkg_id          NUMBER(7),
  effective_date  DATE default date '1900-1-1',
  expiration_date DATE default date '9999-9-9'
)
;
create table T_BILLCARD_INPUT
(
  input_id     NUMBER(10) not null,
  card_id      NUMBER(10),
  input_num    NUMBER(10),
  start_no     VARCHAR2(30),
  operate_id   NUMBER(10),
  operate_date DATE default sysdate,
  printing_id  NUMBER(10),
  deploy_id    NUMBER(10),
  sum_print    NUMBER(12,2),
  sum_draw     NUMBER(12,2),
  organ_id     VARCHAR2(40),
  dept_id      VARCHAR2(20),
  insert_time  DATE default SYSDATE not null,
  update_time  DATE default SYSDATE not null,
  notes        VARCHAR2(150),
  printery_id  NUMBER(10),
  pkg_id       NUMBER(7)
)
;
create table T_SETTLEMENT_TYPE
(
  type_id   NUMBER(2) not null,
  type_name VARCHAR2(20) not null
)
;
create table T_BILLCARD_SETTLEMENT
(
  settlement_id   VARCHAR2(20) not null,
  agency_code     VARCHAR2(20),
  agent_id        NUMBER(10) not null,
  card_id         NUMBER(10) not null,
  card_num        NUMBER(10) default 0 not null,
  premium         NUMBER(12,2) default 0 not null,
  check_emp       NUMBER(10) not null,
  deal_emp        NUMBER(10) not null,
  settlement_date DATE not null,
  insert_time     DATE not null,
  organ_id        VARCHAR2(40) not null,
  dept_id         VARCHAR2(20) not null,
  status          NUMBER(2),
  single_agent_id NUMBER(10),
  group_single    CHAR(1),
  sell_way        VARCHAR2(2),
  settlement_type NUMBER(2) default 1 not null,
  bank_agency     VARCHAR2(20)
)
;
create table T_BILLCARD_STATUS
(
  bill_status NUMBER(2) not null,
  notes       VARCHAR2(50)
)
;
create table T_BILLCARD_DETAIL
(
  detail_id        NUMBER(20) not null,
  card_id          NUMBER(10),
  input_id         NUMBER(10),
  bill_no          VARCHAR2(30) not null,
  draw_id          NUMBER(10),
  organ_id         VARCHAR2(40),
  dept_id          VARCHAR2(20),
  agent_id         NUMBER(10),
  bill_status      NUMBER(2),
  return_id        NUMBER(10),
  return_date      DATE,
  printing_id      NUMBER(10),
  emp_id           NUMBER(10),
  draw_date        DATE,
  ret_emp_id       NUMBER(10),
  print_price      NUMBER(12,6) default 0,
  add_price        NUMBER(12,6) default 0,
  trans_price      NUMBER(12,6) default 0,
  policy_id        NUMBER(10),
  customer_id      NUMBER(10),
  agency_code      VARCHAR2(20),
  insert_time      DATE default SYSDATE not null,
  update_time      DATE default SYSDATE not null,
  apply_code       VARCHAR2(20),
  settlement_id    VARCHAR2(20),
  bank_agency      VARCHAR2(20),
  ret_date_updated CHAR(1) default 'N',
  pkg_id           NUMBER(7),
  effective_date   DATE default date '1900-1-1',
  expiration_date  DATE default date '9999-9-9',
  bill_seq_num     NUMBER(10) not null
)
;
create table T_BILLCARD_DETAIL_BAK
(
  detail_id     NUMBER(20) not null,
  card_id       NUMBER(10),
  input_id      NUMBER(10),
  bill_no       VARCHAR2(30) not null,
  draw_id       NUMBER(10),
  organ_id      VARCHAR2(40),
  dept_id       VARCHAR2(20),
  agent_id      NUMBER(10),
  bill_status   NUMBER(2),
  return_id     NUMBER(10),
  return_date   DATE,
  printing_id   NUMBER(10),
  emp_id        NUMBER(10),
  draw_date     DATE,
  ret_emp_id    NUMBER(10),
  print_price   NUMBER(12,6),
  add_price     NUMBER(12,6),
  trans_price   NUMBER(12,6),
  policy_id     NUMBER(10),
  customer_id   NUMBER(10),
  agency_code   VARCHAR2(20),
  insert_time   DATE not null,
  update_time   DATE not null,
  apply_code    VARCHAR2(20),
  settlement_id VARCHAR2(20),
  bank_agency   VARCHAR2(20)
)
;
create table T_BILLCARD_DETAIL_DEL
(
  detail_id   NUMBER(20),
  delete_time DATE default SYSDATE not null
)
;
create table T_BILLCARD_DETAIL_LOG
(
  change_id       NUMBER(10) not null,
  old_new         CHAR(1) not null,
  detail_id       NUMBER(20) not null,
  card_id         NUMBER(10),
  input_id        NUMBER(10),
  bill_no         VARCHAR2(30) not null,
  draw_id         NUMBER(10),
  organ_id        VARCHAR2(40),
  dept_id         VARCHAR2(20),
  agent_id        NUMBER(10),
  bill_status     NUMBER(2),
  return_id       NUMBER(10),
  return_date     DATE,
  printing_id     NUMBER(10),
  emp_id          NUMBER(10),
  draw_date       DATE,
  ret_emp_id      NUMBER(10),
  print_price     NUMBER(12,6) default 0,
  add_price       NUMBER(12,6) default 0,
  trans_price     NUMBER(12,6) default 0,
  policy_id       NUMBER(10),
  customer_id     NUMBER(10),
  agency_code     VARCHAR2(20),
  insert_time     DATE default SYSDATE not null,
  update_time     DATE default SYSDATE not null,
  apply_code      VARCHAR2(20),
  settlement_id   VARCHAR2(20),
  pkg_id          NUMBER(7),
  effective_date  DATE default date '1900-1-1',
  expiration_date DATE default date '9999-9-9'
)
;
create table T_BILLCARD_DETAIL_TEMP
(
  detail_id        NUMBER(20) not null,
  card_id          NUMBER(10),
  input_id         NUMBER(10),
  bill_no          VARCHAR2(30) not null,
  draw_id          NUMBER(10),
  organ_id         VARCHAR2(40),
  dept_id          VARCHAR2(20),
  agent_id         NUMBER(10),
  bill_status      NUMBER(2),
  return_id        NUMBER(10),
  return_date      DATE,
  printing_id      NUMBER(10),
  emp_id           NUMBER(10),
  draw_date        DATE,
  ret_emp_id       NUMBER(10),
  print_price      NUMBER(12,6),
  add_price        NUMBER(12,6),
  trans_price      NUMBER(12,6),
  policy_id        NUMBER(10),
  customer_id      NUMBER(10),
  agency_code      VARCHAR2(20),
  insert_time      DATE not null,
  update_time      DATE not null,
  apply_code       VARCHAR2(20),
  settlement_id    VARCHAR2(20),
  bank_agency      VARCHAR2(20),
  ret_date_updated CHAR(1),
  pkg_id           NUMBER(7),
  effective_date   DATE,
  expiration_date  DATE,
  bill_seq_num     NUMBER(10) not null
)
;
create table T_BILLCARD_DETAIL_TEMP2
(
  detail_id        NUMBER(20) not null,
  card_id          NUMBER(10),
  input_id         NUMBER(10),
  bill_no          VARCHAR2(30) not null,
  draw_id          NUMBER(10),
  organ_id         VARCHAR2(40),
  dept_id          VARCHAR2(20),
  agent_id         NUMBER(10),
  bill_status      NUMBER(2),
  return_id        NUMBER(10),
  return_date      DATE,
  printing_id      NUMBER(10),
  emp_id           NUMBER(10),
  draw_date        DATE,
  ret_emp_id       NUMBER(10),
  print_price      NUMBER(12,6),
  add_price        NUMBER(12,6),
  trans_price      NUMBER(12,6),
  policy_id        NUMBER(10),
  customer_id      NUMBER(10),
  agency_code      VARCHAR2(20),
  insert_time      DATE not null,
  update_time      DATE not null,
  apply_code       VARCHAR2(20),
  settlement_id    VARCHAR2(20),
  bank_agency      VARCHAR2(20),
  ret_date_updated CHAR(1),
  pkg_id           NUMBER(7),
  effective_date   DATE,
  expiration_date  DATE,
  bill_seq_num     NUMBER(10) not null
)
;
create table T_BILLCARD_DRAW_PRINT
(
  flow_id     NUMBER(10) not null,
  draw_id     NUMBER(10),
  printing_id NUMBER(10),
  start_no    NUMBER(10),
  num         NUMBER(10)
)
;
create table T_BILLCARD_HISTORY
(
  status_change_id   NUMBER(10) not null,
  bill_no            VARCHAR2(30),
  card_code          VARCHAR2(250),
  policy_code        VARCHAR2(20),
  settlement_id      VARCHAR2(20),
  detail_id          NUMBER(20),
  bill_status        VARCHAR2(100),
  printing_id        NUMBER(10),
  printery_code      VARCHAR2(150),
  unit_print         NUMBER(12,4),
  print_trans_price  NUMBER(12,6),
  deploy_id          NUMBER(10),
  deploy_add_price   NUMBER(12,6),
  input_organ_code   VARCHAR2(100),
  input_dept_code    VARCHAR2(100),
  target_organ_code  VARCHAR2(100),
  target_dept_code   VARCHAR2(100),
  draw_agent_code    VARCHAR2(100),
  draw_id            NUMBER(10),
  draw_emp_code      VARCHAR2(100),
  draw_date          VARCHAR2(50),
  draw_agency_code   VARCHAR2(150),
  over_draw_month    NUMBER(4,1),
  return_agent_code  VARCHAR2(100),
  return_date        VARCHAR2(50),
  return_emp_code    VARCHAR2(100),
  status_change_date VARCHAR2(50),
  start_num          NUMBER,
  changed_num        NUMBER(10)
)
;
create table T_BILLCARD_PRE
(
  pre_id           NUMBER(10) not null,
  card_id          NUMBER(10) not null,
  organ_id         VARCHAR2(40),
  dept_id          VARCHAR2(20),
  bill_status      NUMBER(2) not null,
  bill_start       VARCHAR2(30) not null,
  bill_end         VARCHAR2(30) not null,
  apply_type_code  NUMBER(3),
  apply_code_start VARCHAR2(30),
  apply_code_end   VARCHAR2(30),
  printing_id      NUMBER(10),
  print_price      NUMBER(12,6) default 0,
  trans_price      NUMBER(12,6) default 0,
  input_id         NUMBER(10),
  deploy_id        NUMBER(10),
  add_price        NUMBER(12,6) default 0,
  insert_time      DATE default SYSDATE,
  update_time      DATE default SYSDATE,
  pkg_id           NUMBER(7),
  effective_date   DATE,
  expiration_date  DATE
)
;
create table T_BILLCARD_PRE_TEMP
(
  pre_id           NUMBER(10) not null,
  card_id          NUMBER(10) not null,
  organ_id         VARCHAR2(40),
  dept_id          VARCHAR2(20),
  bill_status      NUMBER(2) not null,
  bill_start       VARCHAR2(30) not null,
  bill_end         VARCHAR2(30) not null,
  apply_type_code  NUMBER(3),
  apply_code_start VARCHAR2(30),
  apply_code_end   VARCHAR2(30),
  printing_id      NUMBER(10),
  print_price      NUMBER(12,6),
  trans_price      NUMBER(12,6),
  input_id         NUMBER(10),
  deploy_id        NUMBER(10),
  add_price        NUMBER(12,6),
  insert_time      DATE,
  update_time      DATE,
  pkg_id           NUMBER(7)
)
;
create table T_BILLCARD_PRODUCT
(
  card_id         NUMBER(3) not null,
  product_num     CHAR(3) not null,
  product_id      NUMBER(10) not null,
  main_rider      CHAR(1) not null,
  amount          NUMBER(14,2),
  unit            NUMBER(10),
  benefit_level   VARCHAR2(20),
  prem            NUMBER(12,2),
  coverage_period CHAR(1) not null,
  coverage_year   NUMBER(5)
)
;
create table T_BILLCARD_RECORD
(
  id          NUMBER(10) not null,
  policy_code VARCHAR2(20),
  bill_seq    VARCHAR2(10) not null,
  bill_type   VARCHAR2(3) not null,
  bill_no     VARCHAR2(30) not null,
  print_time  DATE not null,
  organ_id    VARCHAR2(40) not null,
  status      NUMBER(2) not null,
  info        VARCHAR2(200),
  insert_time DATE not null,
  update_time DATE not null,
  apply_code  VARCHAR2(20)
)
;
create table T_BILLCARD_RECORD_LIST
(
  id          NUMBER(10) not null,
  policy_code VARCHAR2(20),
  bill_seq    VARCHAR2(10) not null,
  bill_type   VARCHAR2(3) not null,
  bill_no     VARCHAR2(30) not null,
  print_time  DATE not null,
  organ_id    VARCHAR2(40) not null,
  status      NUMBER(2) not null,
  info        VARCHAR2(200),
  insert_time DATE not null,
  bill_status VARCHAR2(2),
  apply_code  VARCHAR2(20)
)
;
create table T_REPRESENTATION_CATE
(
  cate_id      NUMBER(2) not null,
  cate_name    VARCHAR2(255) not null,
  display_text VARCHAR2(255) not null,
  sort_num     NUMBER(2) not null
)
;
create table T_REPRESENTATION
(
  representation_id   NUMBER(10) not null,
  organ_id            VARCHAR2(40) not null,
  cate_id             NUMBER(2) not null,
  full_text           VARCHAR2(4000) not null,
  for_applicant       VARCHAR2(1) not null,
  for_insurant        VARCHAR2(1) not null,
  for_second_insurant VARCHAR2(1) not null,
  sort_num            VARCHAR2(4) not null,
  manual_uw           VARCHAR2(1) default 'Y' not null
)
;
create table T_BILLCARD_REPRE
(
  billcard_id       NUMBER(10) not null,
  representation_id NUMBER(10) not null,
  sort_num          VARCHAR2(4) not null
)
;
create table T_BILLCARD_SETTLEMENT_DETAIL
(
  settlement_id VARCHAR2(20) not null,
  deal_type     NUMBER(2) not null,
  s_no          NUMBER(10) not null,
  e_no          NUMBER(10) not null
)
;
create table T_BILLCARD_STOCK
(
  organ_id     VARCHAR2(40) not null,
  card_id      NUMBER(3) not null,
  stock_amount NUMBER(10),
  price        NUMBER(10,6),
  dept_id      VARCHAR2(20),
  stock_id     NUMBER(10) not null,
  insert_time  DATE default SYSDATE not null,
  update_time  DATE default SYSDATE not null,
  pkg_id       NUMBER(7)
)
;
create table T_BILLCARD_STOCK_INFO
(
  info_id      NUMBER(20) not null,
  organ_id     VARCHAR2(40) not null,
  dept_id      VARCHAR2(20),
  card_id      NUMBER(3) not null,
  stock_amount NUMBER(20),
  bill_start   VARCHAR2(30) not null,
  bill_end     VARCHAR2(30) not null,
  insert_time  DATE default SYSDATE not null,
  update_time  DATE default SYSDATE not null
)
;
create table T_BILLCARD_TEMPLATE
(
  model_id     NUMBER(10) not null,
  card_type    VARCHAR2(20),
  card_id      NUMBER(10),
  organ_id     VARCHAR2(40),
  update_date  DATE,
  note         VARCHAR2(200),
  file_content BLOB,
  card_name    VARCHAR2(100),
  file_name    VARCHAR2(150)
)
;
create table T_BILLCARD_TMP
(
  settlement_id VARCHAR2(20),
  billno_new    VARCHAR2(30),
  billno_old    VARCHAR2(30)
)
;
create table T_BILLCARD_USEDEPT
(
  card_id   NUMBER(10) not null,
  organ_id  VARCHAR2(40),
  dept_id   VARCHAR2(20) not null,
  limit_num NUMBER(10),
  limited   CHAR(1)
)
;
create table T_BILLCARD_VALIDATE
(
  validate_id  NUMBER(10) not null,
  card_id      NUMBER(10) not null,
  year_no      VARCHAR2(10),
  start_date   DATE,
  end_date     DATE,
  validate_num NUMBER(10),
  status       VARCHAR2(1) default '1',
  update_date  DATE,
  emp_id       NUMBER(10),
  cancell_num  NUMBER(10) default 10,
  organ_id     VARCHAR2(40),
  warning_num  NUMBER(10)
)
;
create table T_BILL_FEE_TYPE
(
  bill_type VARCHAR2(2) not null,
  fee_type  NUMBER(3) not null
)
;
create table T_BIRTHDAY_PRODUCTS
(
  product_id NUMBER(7) not null,
  scan_time  VARCHAR2(100) not null
)
;
create table T_BIZ_ACCOUNTING_INFO
(
  fee_id        NUMBER(12) not null,
  data_table    NUMBER(2),
  dr_seg1       VARCHAR2(25),
  dr_seg2       VARCHAR2(25),
  dr_seg3       VARCHAR2(25),
  dr_seg4       VARCHAR2(25),
  dr_seg5       VARCHAR2(25),
  dr_seg6       VARCHAR2(25),
  dr_seg7       VARCHAR2(25),
  dr_seg8       VARCHAR2(25),
  dr_seg9       VARCHAR2(25),
  dr_seg10      VARCHAR2(25),
  cr_seg1       VARCHAR2(25),
  cr_seg2       VARCHAR2(25),
  cr_seg3       VARCHAR2(25),
  cr_seg4       VARCHAR2(25),
  cr_seg5       VARCHAR2(25),
  cr_seg6       VARCHAR2(25),
  cr_seg7       VARCHAR2(25),
  cr_seg8       VARCHAR2(25),
  cr_seg9       VARCHAR2(25),
  cr_seg10      VARCHAR2(25),
  je_posting_id NUMBER(10),
  list_id       NUMBER(16) not null,
  update_time   DATE default sysdate
)
;

create table T_BIZ_LABEL_CATEGORY
(
  category NUMBER(9) not null,
  name     VARCHAR2(20) not null,
  descs    VARCHAR2(200)
)
;
create table T_BIZ_LABEL
(
  label_id    NUMBER(9) not null,
  label_code  VARCHAR2(20) not null,
  label_name  VARCHAR2(20) not null,
  category_id NUMBER(9) not null,
  label_desc  VARCHAR2(200)
)
;
create table T_BIZ_LABEL_MAPPING
(
  label_id  NUMBER(9) not null,
  object_id NUMBER(9) not null
)
;
create table T_BIZ_TYPE
(
  biz_type_id NUMBER(2) not null,
  biz_type    VARCHAR2(100) not null,
  fee_type_id NUMBER(2) not null
)
;
create table T_BLACKLIST_STATUS
(
  status_id   NUMBER(1) not null,
  status_desc VARCHAR2(40) not null
)
;
create table T_BLACKLIST
(
  list_id     NUMBER(10) not null,
  status      NUMBER(1) default 0 not null,
  real_name   VARCHAR2(40) not null,
  reason      VARCHAR2(4000),
  person_type NUMBER(1) not null,
  agent_id    NUMBER(10),
  customer_id NUMBER(10),
  source_type NUMBER(2) not null,
  insert_id   NUMBER(10),
  insert_time DATE default SYSDATE not null,
  update_time DATE default SYSDATE not null,
  deleted     CHAR(1) default 'N' not null,
  deleter_id  NUMBER(10)
)
;
create table T_BLOB_TEMP
(
  blob_id     NUMBER(12) not null,
  content     CLOB,
  create_date DATE default SYSDATE not null
)
;
create table T_BOND_FORM_TYPE
(
  form_type VARCHAR2(1) not null,
  type_name VARCHAR2(20) not null
)
;
create table T_BOND_ISSUE_TYPE
(
  issue_type VARCHAR2(1) not null,
  type_name  VARCHAR2(20) not null
)
;
create table T_BOND_PARVALUE_TYPE
(
  parvalue_type VARCHAR2(1) not null,
  type_name     VARCHAR2(20) not null
)
;
create table T_BOND_PAY_TYPE
(
  pay_type  NUMBER(2) not null,
  type_name VARCHAR2(20) not null
)
;
create table T_BOND_RATE_TYPE
(
  rate_type VARCHAR2(1) not null,
  type_name VARCHAR2(20) not null
)
;
create table T_BOND_TERM_TYPE
(
  term_type VARCHAR2(1) not null,
  type_name VARCHAR2(20) not null
)
;
create table T_MARKET_TYPE
(
  market_type VARCHAR2(1) not null,
  type_name   VARCHAR2(50) not null
)
;
create table T_MARKET
(
  market_no    VARCHAR2(2) not null,
  market_name  VARCHAR2(50) not null,
  market_type  VARCHAR2(1) not null,
  money_id     NUMBER(6) not null,
  market_state CHAR(1) not null
)
;
create table T_BOND
(
  bond_no       VARCHAR2(20) not null,
  bond_name     VARCHAR2(100) not null,
  issue_place   VARCHAR2(100) not null,
  issue_date    DATE not null,
  unit_parvalue NUMBER(10,2) not null,
  value_date    DATE not null,
  bond_term     NUMBER(5) not null,
  due_date      DATE not null,
  bond_rate     NUMBER(7,6) not null,
  market_no     VARCHAR2(2) not null,
  pay_type      NUMBER(2) not null,
  term_type     VARCHAR2(1) not null,
  issue_type    VARCHAR2(1) not null,
  parvalue_type VARCHAR2(1) not null,
  rate_type     VARCHAR2(1) not null,
  form_type     VARCHAR2(1) not null,
  money_id      NUMBER(6) not null,
  risk_class    VARCHAR2(1) not null,
  bond_state    VARCHAR2(1) default '1' not null,
  insert_person NUMBER(10) not null,
  insert_date   DATE default SYSDATE not null,
  updater_id    NUMBER(10),
  update_time   DATE
)
;
create table T_VOUCHER_SOURCE
(
  source_id         NUMBER(4) not null,
  source_name       VARCHAR2(30) not null,
  need_auto_posting NUMBER(1) default 0
)
;
create table T_VOUCHER_STATUS
(
  status      VARCHAR2(2) not null,
  status_name VARCHAR2(60) not null
)
;
create table T_VOUCHER_HEAD
(
  voucher_head_id NUMBER(10) not null,
  book_id         NUMBER(10) not null,
  year_period     CHAR(4) not null,
  period_id       CHAR(6) not null,
  total_code      VARCHAR2(20),
  voucher_cate_id NUMBER(2) not null,
  voucher_code    VARCHAR2(20),
  source_id       NUMBER(4) not null,
  counteract      CHAR(1),
  counteract_id   NUMBER(10),
  maker_id        NUMBER(10) not null,
  maker_name      VARCHAR2(40),
  voucher_time    DATE,
  entry_time      DATE default sysdate not null,
  status          VARCHAR2(2) default '1' not null,
  auditor_id      NUMBER(10),
  auditor_name    VARCHAR2(40),
  auditing_time   DATE,
  tally_id        NUMBER(10),
  tally_name      VARCHAR2(40),
  tally_time      DATE,
  bill_count      NUMBER(3) default 0 not null,
  remark          VARCHAR2(100),
  sys_lock_time   DATE,
  sys_locker_id   NUMBER(10),
  sys_lock_status CHAR(1) default '0' not null,
  total_amt       NUMBER(12,2) default 0 not null
)
;
create table T_BOND_BUY
(
  trans_no       VARCHAR2(20) not null,
  bond_no        VARCHAR2(20) not null,
  fund_code      VARCHAR2(20) not null,
  account_code   VARCHAR2(20) not null,
  trans_date     DATE not null,
  trans_amount   NUMBER(10) not null,
  parvalue       NUMBER(14,2),
  appre_depre    NUMBER(14,2) not null,
  add_fee        NUMBER(14,2) not null,
  actual_cost    NUMBER(14,2) not null,
  undue_interest NUMBER(14,2) not null,
  due_interest   NUMBER(14,2) not null,
  actual_payment NUMBER(14,2) not null,
  remark         VARCHAR2(4000) not null,
  checker_id     NUMBER(10) not null,
  posted         CHAR(1) default 'N' not null,
  post_date      DATE,
  cred_id        NUMBER(10),
  post_id        NUMBER(10),
  post_organ     VARCHAR2(40),
  post_dept      VARCHAR2(20),
  insert_person  NUMBER(10) not null,
  insert_date    DATE default SYSDATE not null,
  updater_id     NUMBER(10),
  update_time    DATE,
  trans_price    NUMBER(10,2) not null,
  trans_sum      NUMBER(14,2) not null,
  transactor_id  NUMBER(10) not null,
  market_class   VARCHAR2(1) not null
)
;
create table T_BOND_FUND
(
  bond_no           VARCHAR2(20) not null,
  fund_code         VARCHAR2(20) not null,
  accum_amount      NUMBER(12) not null,
  unit_cost         NUMBER(10,2) not null,
  appre_depre       NUMBER(14,2) not null,
  amortized_fee     NUMBER(14,2) not null,
  remain_days       NUMBER(10) not null,
  total_cost        NUMBER(14,2) not null,
  recover_date      DATE not null,
  account_code      VARCHAR2(20) not null,
  no_hold_interest  NUMBER(14,2) not null,
  drawable_interest NUMBER(14,2) not null
)
;
create table T_BOND_RATE
(
  bond_no       VARCHAR2(20) not null,
  start_date    DATE not null,
  bond_rate     NUMBER(7,6) not null,
  insert_person NUMBER(10) not null,
  insert_date   DATE default SYSDATE not null,
  updater_id    NUMBER(10),
  update_time   DATE
)
;
create table T_BOND_RECOVER_TYPE
(
  recover_type VARCHAR2(1) not null,
  type_name    VARCHAR2(20) not null
)
;
create table T_BOND_RECOVER
(
  recover_id     NUMBER(10) not null,
  bond_no        VARCHAR2(20) not null,
  fund_code      VARCHAR2(20) not null,
  recover_date   DATE not null,
  recover_amount NUMBER(10) not null,
  recover_type   VARCHAR2(1) not null,
  handler_person NUMBER(10) not null,
  handler_organ  VARCHAR2(40) not null,
  posted         CHAR(1) default 'N' not null,
  handler_dept   VARCHAR2(20) not null,
  post_date      DATE,
  cred_id        NUMBER(10),
  post_id        NUMBER(10),
  post_organ     VARCHAR2(40),
  post_dept      VARCHAR2(20),
  insert_person  NUMBER(10) not null,
  recover_sum    NUMBER(14,2) not null,
  insert_date    DATE default SYSDATE not null,
  updater_id     NUMBER(10),
  update_time    DATE,
  account_code   VARCHAR2(20) not null
)
;
create table T_BOND_SALE
(
  trans_no       VARCHAR2(20) not null,
  bond_no        VARCHAR2(20) not null,
  fund_code      VARCHAR2(20) not null,
  account_code   VARCHAR2(20) not null,
  trans_date     DATE not null,
  trans_amount   NUMBER(10) not null,
  parvalue       NUMBER(10,2),
  unit_price     NUMBER(10,2),
  trans_sum      NUMBER(14,2) not null,
  add_fee        NUMBER(14,2) not null,
  undue_interest NUMBER(14,2) not null,
  due_interest   NUMBER(14,2) not null,
  actual_receipt NUMBER(14,2) not null,
  appre_depre    NUMBER(14,2) not null,
  amortized_fee  NUMBER(14,2) not null,
  book_cost      NUMBER(14,2) not null,
  income         NUMBER(14,2) not null,
  remark         VARCHAR2(4000) not null,
  checker_id     NUMBER(10) not null,
  posted         CHAR(1) default 'N' not null,
  post_date      DATE,
  cred_id        NUMBER(10),
  post_id        NUMBER(10),
  post_organ     VARCHAR2(40),
  post_dept      VARCHAR2(20),
  insert_person  NUMBER(10) not null,
  insert_date    DATE default SYSDATE not null,
  update_time    DATE,
  updater_id     NUMBER(10),
  trans_price    NUMBER(10,2) not null,
  transactor_id  NUMBER(10) not null
)
;
create table T_BOND_SHIFT
(
  trans_no      NUMBER(20) not null,
  bond_no       VARCHAR2(20) not null,
  fund_code     VARCHAR2(20) not null,
  account_code  VARCHAR2(20) not null,
  shift_flag    VARCHAR2(1) not null,
  trans_date    DATE not null,
  trans_amount  NUMBER(10) not null,
  appre_depre   NUMBER(14,2) not null,
  transactor_id NUMBER(10) not null,
  posted        CHAR(1) default 'N' not null,
  post_date     DATE,
  cred_id       NUMBER(10),
  post_id       NUMBER(10),
  post_organ    VARCHAR2(40),
  post_dept     VARCHAR2(20),
  insert_person NUMBER(10) not null,
  insert_date   DATE default SYSDATE not null,
  updater_id    NUMBER(10),
  update_time   DATE
)
;
create table T_BONUS_ADJUST_RATE
(
  adjust_date DATE not null,
  rate_f1     NUMBER(5,4) default 1 not null,
  rate_f2     NUMBER(5,4) default 1 not null,
  rate_f3     NUMBER(5,4) default 1
)
;
create table T_BONUS_BASIC_FACTOR
(
  factor_id          NUMBER(10) not null,
  start_date         DATE not null,
  end_date           DATE not null,
  product_id         NUMBER(10) not null,
  age_1              NUMBER(3) default 999 not null,
  gender_1           CHAR(1) default 'N' not null,
  age_2              NUMBER(3) default 999 not null,
  smoking            CHAR(1) default 'W' not null,
  waived             CHAR(1) default 'W' not null,
  policy_year        NUMBER(3) default 999 not null,
  premium_year       NUMBER(3) default 0 not null,
  period             NUMBER(4) default 0 not null,
  bonus_factor       NUMBER(18,10) default 0 not null,
  pay_period         CHAR(1) default '0' not null,
  pay_year           NUMBER(3) default 0 not null,
  pay_type           CHAR(1) default '0' not null,
  pre_bonus_factor_h NUMBER(18,10) default 0 not null,
  pre_bonus_factor_m NUMBER(18,10) default 0 not null,
  pre_bonus_factor_l NUMBER(18,10) default 0 not null,
  factor_flag        CHAR(1)
)
;
create table T_BONUS_BASIC_FACTOR_TEST
(
  factor_id          NUMBER(10) not null,
  start_date         DATE not null,
  end_date           DATE not null,
  product_id         NUMBER(10) not null,
  age_1              NUMBER(3) not null,
  gender_1           CHAR(1) not null,
  age_2              NUMBER(3),
  smoking            CHAR(1),
  waived             CHAR(1),
  policy_year        NUMBER(3) not null,
  premium_year       NUMBER(3),
  period             NUMBER(4),
  bonus_factor       NUMBER(18,10) not null,
  pay_period         CHAR(1),
  pay_year           NUMBER(3),
  pay_type           CHAR(1),
  pre_bonus_factor_h NUMBER(18,10),
  pre_bonus_factor_m NUMBER(18,10),
  pre_bonus_factor_l NUMBER(18,10)
)
;
create table T_BONUS_FACTOR
(
  start_date    DATE not null,
  end_date      DATE not null,
  payable_bonus NUMBER(14,2) default 0 not null,
  bonus_factor  NUMBER(18,10) default 0 not null,
  update_time   DATE default SYSDATE,
  update_id     NUMBER(10),
  sigma_factor  NUMBER(20,6) default 0 not null
)
;
create table T_BONUS_MORT_RATE
(
  start_date    DATE default SYSDATE not null,
  policy_year   NUMBER(3) default 1 not null,
  rate          NUMBER(7,6) not null,
  insert_person NUMBER(10) not null,
  insert_date   DATE default SYSDATE not null,
  updater_id    NUMBER(10) not null,
  update_time   DATE default SYSDATE not null
)
;
create table T_BONUS_PARAM_CONFIG
(
  product_id     NUMBER(7) not null,
  effective_date VARCHAR2(14) not null,
  insert_time    DATE default SYSDATE not null,
  update_time    DATE,
  annual_roi     NUMBER(10,6),
  bonus_rate     NUMBER(10,6),
  profit_rate    NUMBER(10,6)
)
;
create table T_BONUS_SOURCE
(
  bonus_source VARCHAR2(2) not null,
  source_desc  VARCHAR2(100) not null
)
;
create table T_BOOK_MONEY
(
  book_id         NUMBER(10) not null,
  money_id        NUMBER(6) not null,
  exchange_method CHAR(1),
  money_precision NUMBER(2)
)
;
create table T_BOOK_ORGAN
(
  book_id  NUMBER(10) not null,
  organ_id VARCHAR2(40) not null
)
;
create table T_BRIEF
(
  book_id    NUMBER(10) not null,
  brief_code VARCHAR2(10) not null,
  brief      VARCHAR2(100) not null
)
;
create table T_BUSINESS_TYPE
(
  type_id            NUMBER(2) not null,
  business_type_name VARCHAR2(30)
)
;
create table T_BUSINESS_LOCK
(
  lock_id       NUMBER(10) not null,
  business_type NUMBER(10) not null,
  business_id1  VARCHAR2(20) not null,
  business_id2  VARCHAR2(20),
  business_id3  VARCHAR2(20),
  insert_time   DATE default SYSDATE
)
;
create table T_BUSINESS_LOCK_LIST
(
  lock_list_id NUMBER(10) not null,
  lock_id      NUMBER(10) not null,
  lock_begin   DATE,
  lock_end     DATE
)
;
create table T_NOTIFY_TYPE
(
  notify_type NUMBER(5) not null,
  type_name   VARCHAR2(50) not null
)
;
create table T_BUSI_NOTIFIED
(
  notify_id      NUMBER(12) not null,
  type_id        NUMBER(5) not null,
  busi_id        VARCHAR2(100) not null,
  busi_no        VARCHAR2(100),
  busi_time      DATE,
  para1          VARCHAR2(100),
  para2          VARCHAR2(100),
  para3          VARCHAR2(100),
  para4          VARCHAR2(100),
  para5          VARCHAR2(100),
  abandoned      CHAR(1) default 'Y' not null,
  collecte_at    DATE not null,
  create_at      DATE not null,
  correlation_id VARCHAR2(40)
)
;
create table T_BUSI_NOTIFY
(
  notify_id   NUMBER(12) not null,
  type_id     NUMBER(5) not null,
  busi_id     VARCHAR2(100) not null,
  busi_no     VARCHAR2(100),
  busi_time   DATE,
  para1       VARCHAR2(120),
  para2       VARCHAR2(100),
  para3       VARCHAR2(100),
  para4       VARCHAR2(100),
  para5       VARCHAR2(100),
  collecte_at DATE default SYSDATE not null
)
;
create table T_CALCU_LIMIT
(
  product_id             NUMBER(10) not null,
  benefit_level          VARCHAR2(20) default '0' not null,
  claim_cnt_min          NUMBER(3) default 0 not null,
  claim_cnt_max          NUMBER(3) default 999 not null,
  once_per_pay_limit     NUMBER(10) default 9999999999 not null,
  year_per_pay_limit     NUMBER(10) default 9999999999 not null,
  coverage_per_pay_limit NUMBER(10) default 9999999999 not null,
  life_pay_limit         NUMBER(10) default 9999999999 not null,
  day_per_pay_limit      NUMBER(10) default 9999999999 not null,
  month_per_pay_limit    NUMBER(10) default 9999999999 not null,
  once_pay_rate          NUMBER(4,3) default 1 not null,
  coverage_except        NUMBER(10) default 0 not null
)
;
create table T_CALC_WAY
(
  calc_way      CHAR(1) not null,
  calc_way_desc VARCHAR2(20) not null
)
;
create table T_CALLCENTER_TRANS
(
  trans_id              NUMBER(10) not null,
  interface_name        VARCHAR2(255),
  interface_action_type NUMBER(3),
  interface_mainsql     CLOB,
  insert_time           DATE,
  interface_param       CLOB
)
;
create table T_CALTYPE_CATE
(
  cate_id  NUMBER(2) not null,
  category VARCHAR2(40)
)
;
create table T_CALTYPE_END
(
  end_id   NUMBER(2) not null,
  end_desc VARCHAR2(100)
)
;
create table T_CALTYPE_START
(
  start_id   NUMBER(2) not null,
  start_desc VARCHAR2(100)
)
;
create table T_CANCEL_POLICY_PRE
(
  id           NUMBER(10) not null,
  policy_id    NUMBER(10),
  cancel_times NUMBER(10),
  cancel_cause VARCHAR2(4000),
  insert_time  DATE
)
;
create table T_CAPITAL_DISTRI_TYPE
(
  distri_type         VARCHAR2(3) not null,
  type_name           VARCHAR2(50) not null,
  account_capital     CHAR(1) default 0 not null,
  account_fund        CHAR(1) default 0 not null,
  need_service_charge CHAR(1)
)
;
create table T_PAY_PLAN
(
  plan_id         NUMBER(10) not null,
  item_id         NUMBER(10),
  liab_id         NUMBER(4) not null,
  policy_id       NUMBER(10),
  pay_due_date    DATE not null,
  pay_num         NUMBER(6) not null,
  begin_date      DATE not null,
  end_date        DATE,
  pay_ensure      NUMBER(3),
  pay_type        CHAR(1) default '0' not null,
  increase_rate   NUMBER(5,4) default 0 not null,
  simple_compound CHAR(1) default '0' not null,
  increase_freq   CHAR(1) default '0' not null,
  increase_year   NUMBER(2) default 0 not null,
  pay_status      CHAR(1),
  pre_item_id     NUMBER(10),
  insert_time     DATE default (sysdate),
  update_time     DATE
)
;
create table T_CONTRACT_BENE
(
  bene_id             NUMBER(10) not null,
  policy_id           NUMBER(10) not null,
  insurant            NUMBER(10) not null,
  bene_type           CHAR(1) not null,
  bene_order          CHAR(1) not null,
  real_name           VARCHAR2(120) not null,
  gender              CHAR(1),
  birthday            DATE,
  certi_type          NUMBER(2),
  certi_code          VARCHAR2(50),
  telephone           VARCHAR2(30),
  address             VARCHAR2(150),
  zip                 VARCHAR2(10),
  bene_rate           NUMBER(7,6) default 1,
  relation_id         NUMBER(2) not null,
  mobile_tel          VARCHAR2(30),
  address_2           VARCHAR2(100),
  address_3           VARCHAR2(100),
  address_4           VARCHAR2(100),
  auth_draw           NUMBER(2) default 10 not null,
  bank_code           VARCHAR2(20),
  bank_account        VARCHAR2(40),
  trans_app_id        NUMBER(10),
  trans_ins_id        NUMBER(10),
  trans_pay_type      CHAR(1),
  trans_pay_year      NUMBER(3),
  trans_charge_period CHAR(1),
  trans_charge_year   NUMBER(3),
  target_policy_id    NUMBER(10),
  legal_bene          CHAR(1) not null,
  trustee_id          NUMBER(10),
  insert_time         DATE default SYSDATE not null,
  update_time         DATE default SYSDATE not null,
  expire_bene_type    CHAR(1),
  certi_start_date    DATE,
  certi_end_date      DATE,
  seat_address        VARCHAR2(50),
  is_holder           CHAR(1)
)
;
create table T_PAY_DUE
(
  pay_id           NUMBER(10) not null,
  item_id          NUMBER(10) not null,
  liab_id          NUMBER(4) not null,
  bene_id          NUMBER(10),
  pay_due_date     DATE not null,
  policy_id        NUMBER(10) not null,
  pay_num          NUMBER(6) not null,
  fee_amount       NUMBER(14,2) not null,
  print_num        NUMBER(4) default 0 not null,
  plan_id          NUMBER(10),
  fee_status       NUMBER(2) not null,
  telephone        VARCHAR2(30),
  mobile_tel       VARCHAR2(30),
  address          VARCHAR2(100),
  address_2        VARCHAR2(100),
  address_3        VARCHAR2(100),
  address_4        VARCHAR2(100),
  is_realized      CHAR(1) default 'Y' not null,
  additional_prem  NUMBER(10,2) default 0 not null,
  repay_loan       NUMBER(10,2) default 0 not null,
  repay_prem       NUMBER(10,2) default 0 not null,
  insert_time      DATE default SYSDATE not null,
  contact_name     VARCHAR2(120),
  sum_assured_paid NUMBER(14,2) default 0 not null,
  total_bonus      NUMBER(14,2) default 0 not null,
  special_bonus    NUMBER(14,2) default 0 not null,
  case_id          NUMBER(10),
  period           NUMBER(4) default 9999 not null,
  policy_year      NUMBER(4) default 0 not null,
  cash_value       NUMBER(14,2) default 0 not null,
  loan_amount      NUMBER(16,6) default 0 not null,
  loan_interest    NUMBER(16,6) default 0 not null
)
;
create table T_PAYEE
(
  payee_id        NUMBER(10) not null,
  due_id          NUMBER(10) not null,
  assignee_type   VARCHAR2(2) default '0' not null,
  assignee_id     NUMBER(10),
  payee_name      VARCHAR2(150),
  assignee_rate   NUMBER(4,3) default 1,
  auth_draw       NUMBER(2) not null,
  bank_code       VARCHAR2(20),
  bank_account    VARCHAR2(40),
  deposit_account VARCHAR2(40),
  telephone       VARCHAR2(30),
  mobile_tel      VARCHAR2(30),
  address         VARCHAR2(400),
  address_2       VARCHAR2(100),
  address_3       VARCHAR2(100),
  address_4       VARCHAR2(100),
  print_num       NUMBER(4) default 0 not null,
  plan_id         NUMBER(10),
  fee_status      NUMBER(2) not null,
  zip             VARCHAR2(10),
  certi_type      NUMBER(2),
  certi_code      VARCHAR2(50),
  birthday        DATE,
  gender          CHAR(1),
  relation_id     NUMBER(2)
)
;
create table T_PAY_FEE
(
  fee_id           NUMBER(12) not null,
  fee_amount       NUMBER(14,2) not null,
  money_id         NUMBER(6) not null,
  fee_status       NUMBER(2) not null,
  fee_type         NUMBER(3) not null,
  pay_mode         NUMBER(2) not null,
  insured_id       NUMBER(10),
  policy_id        NUMBER(10) not null,
  product_num      CHAR(3) not null,
  insured_1        NUMBER(10),
  product_id       NUMBER(10) not null,
  head_id          VARCHAR2(40) not null,
  branch_id        VARCHAR2(40) not null,
  dept_id          VARCHAR2(20) not null,
  organ_id         VARCHAR2(40),
  cashier_id       NUMBER(10),
  cashier_organ    VARCHAR2(40),
  cashier_dept     VARCHAR2(20),
  check_enter_time DATE,
  finish_time      DATE,
  posted           CHAR(1) default 'N' not null,
  post_id          NUMBER(10),
  cred_id          NUMBER(10),
  insert_time      DATE default SYSDATE not null,
  change_id        NUMBER(10),
  case_id          NUMBER(10),
  bill_id          NUMBER(10),
  ins_type         CHAR(1) not null,
  policy_type      CHAR(1) not null,
  benefit_type     VARCHAR2(2) not null,
  busi_type        CHAR(1) not null,
  period_type      CHAR(1) not null,
  target_type      CHAR(1) not null,
  item_id          NUMBER(10),
  liab_id          NUMBER(4) not null,
  pay_due_date     DATE not null,
  auth_draw        NUMBER(2) not null,
  pay_num          NUMBER(6) not null,
  plan_id          NUMBER(10),
  payable_id       NUMBER(10),
  assignee_id      NUMBER(10),
  due_id           NUMBER(10),
  payee_id         NUMBER(10),
  additional_prem  NUMBER(10,2) default 0 not null,
  repay_loan       NUMBER(10,2) default 0 not null,
  repay_prem       NUMBER(10,2) default 0 not null,
  policy_year      NUMBER(4) default 0 not null,
  product_fee_id   NUMBER(14),
  list_id          NUMBER(14),
  related_id       NUMBER(12),
  circ_audited     CHAR(1) default 'N' not null
)
;
create table T_CAPITAL_DISTRIBUTE
(
  capital_id      NUMBER(10) not null,
  distri_date     DATE not null,
  item_id         NUMBER(10),
  policy_id       NUMBER(10) not null,
  insured_id      NUMBER(10),
  product_id      NUMBER(10) not null,
  distri_amount   NUMBER(16,6) not null,
  posted          CHAR(1) default 'N' not null,
  post_id         NUMBER(10),
  cred_id         NUMBER(10),
  insert_person   NUMBER(10) not null,
  insert_date     DATE default SYSDATE not null,
  updater_id      NUMBER(10),
  update_time     DATE,
  prem_id         NUMBER(14),
  reallocated     CHAR(1) default 'Y' not null,
  distri_type     VARCHAR2(3) not null,
  capital_source  VARCHAR2(1) default '1' not null,
  capital_chg_id  NUMBER(10),
  pay_fee_id      NUMBER(12),
  bonus_allot     VARCHAR2(1) default 0 not null,
  bonus_sa        NUMBER(14,2) default 0 not null,
  reallo_date     DATE,
  origin_amount   NUMBER(14,4) default 0 not null,
  origin_bonus_sa NUMBER(14,2) default 0 not null,
  money_id        NUMBER(6) not null,
  cash_bank       VARCHAR2(20),
  cash_account    VARCHAR2(40),
  case_id         NUMBER(10),
  charge_type     CHAR(1),
  dividend_choice NUMBER(2),
  trans_chg_id    NUMBER(10),
  reversal_id     NUMBER(10),
  related_id      NUMBER(10),
  company_id      NUMBER(10),
  group_item_id   NUMBER(10),
  risk_fee        NUMBER(16,6) default 0,
  finish_time     DATE default sysdate,
  organ_id        VARCHAR2(40),
  account_code    VARCHAR2(20)
)
;


create table T_CAPITAL_DISTRIBUTE_0701
(
  capital_id      NUMBER(10) not null,
  distri_date     DATE not null,
  item_id         NUMBER(10),
  policy_id       NUMBER(10) not null,
  insured_id      NUMBER(10),
  product_id      NUMBER(10) not null,
  distri_amount   NUMBER(16,6) not null,
  posted          CHAR(1) not null,
  post_id         NUMBER(10),
  cred_id         NUMBER(10),
  insert_person   NUMBER(10) not null,
  insert_date     DATE not null,
  updater_id      NUMBER(10),
  update_time     DATE,
  prem_id         NUMBER(14),
  reallocated     CHAR(1) not null,
  distri_type     VARCHAR2(2) not null,
  capital_source  VARCHAR2(1) not null,
  capital_chg_id  NUMBER(10),
  pay_fee_id      NUMBER(12),
  bonus_allot     VARCHAR2(1) not null,
  bonus_sa        NUMBER(14,2) not null,
  reallo_date     DATE,
  origin_amount   NUMBER(14,4) not null,
  origin_bonus_sa NUMBER(14,2) not null,
  money_id        NUMBER(6) not null,
  cash_bank       VARCHAR2(20),
  cash_account    VARCHAR2(40),
  case_id         NUMBER(10),
  charge_type     CHAR(1),
  dividend_choice NUMBER(2),
  trans_chg_id    NUMBER(10),
  reversal_id     NUMBER(10),
  related_id      NUMBER(10),
  company_id      NUMBER(10),
  group_item_id   NUMBER(10),
  risk_fee        NUMBER(16,6),
  finish_time     DATE
)
;
create table T_CAPITAL_DISTRIBUTE_120801
(
  capital_id      NUMBER(10) not null,
  distri_date     DATE not null,
  item_id         NUMBER(10),
  policy_id       NUMBER(10) not null,
  insured_id      NUMBER(10),
  product_id      NUMBER(10) not null,
  distri_amount   NUMBER(16,6) not null,
  posted          CHAR(1) not null,
  post_id         NUMBER(10),
  cred_id         NUMBER(10),
  insert_person   NUMBER(10) not null,
  insert_date     DATE not null,
  updater_id      NUMBER(10),
  update_time     DATE,
  prem_id         NUMBER(14),
  reallocated     CHAR(1) not null,
  distri_type     VARCHAR2(2) not null,
  capital_source  VARCHAR2(1) not null,
  capital_chg_id  NUMBER(10),
  pay_fee_id      NUMBER(12),
  bonus_allot     VARCHAR2(1) not null,
  bonus_sa        NUMBER(14,2) not null,
  reallo_date     DATE,
  origin_amount   NUMBER(14,4) not null,
  origin_bonus_sa NUMBER(14,2) not null,
  money_id        NUMBER(6) not null,
  cash_bank       VARCHAR2(20),
  cash_account    VARCHAR2(40),
  case_id         NUMBER(10),
  charge_type     CHAR(1),
  dividend_choice NUMBER(2),
  trans_chg_id    NUMBER(10),
  reversal_id     NUMBER(10),
  related_id      NUMBER(10),
  company_id      NUMBER(10),
  group_item_id   NUMBER(10),
  risk_fee        NUMBER(16,6),
  finish_time     DATE,
  organ_id        VARCHAR2(40),
  account_code    VARCHAR2(20)
)
;
create table T_CAPITAL_DISTRIBUTE_CHG
(
  change_id       NUMBER(10) not null,
  old_new         CHAR(1) not null,
  capital_id      NUMBER(10) not null,
  distri_date     DATE not null,
  item_id         NUMBER(10),
  policy_id       NUMBER(10) not null,
  insured_id      NUMBER(10),
  product_id      NUMBER(10) not null,
  distri_type     VARCHAR2(3) not null,
  capital_source  VARCHAR2(1) default '1' not null,
  distri_amount   NUMBER(16,6) not null,
  prem_id         NUMBER(14),
  fee_id          NUMBER(14),
  capital_chg_id  NUMBER(10),
  reallocated     CHAR(1) default 'Y' not null,
  posted          CHAR(1) default 'N' not null,
  post_id         NUMBER(10),
  cred_id         NUMBER(10),
  insert_person   NUMBER(10) not null,
  insert_date     DATE default SYSDATE not null,
  updater_id      NUMBER(10),
  update_time     DATE,
  pay_fee_id      NUMBER(12),
  bonus_allot     VARCHAR2(1) default '0' not null,
  bonus_sa        NUMBER(14,2) default 0 not null,
  reallo_date     DATE,
  origin_amount   NUMBER(14,4) default 0 not null,
  origin_bonus_sa NUMBER(14,2) default 0 not null,
  cash_bank       VARCHAR2(20),
  cash_account    VARCHAR2(40),
  charge_type     CHAR(1),
  reversal_id     NUMBER(10),
  related_id      NUMBER(10),
  dividend_choice NUMBER(2),
  company_id      NUMBER(10),
  group_item_id   NUMBER(10),
  risk_fee        NUMBER(16,6) default 0,
  case_id         NUMBER(10),
  organ_id        VARCHAR2(40),
  account_code    VARCHAR2(20)
)
;
create table T_CAPITAL_DISTRIBUTE_DEL
(
  capital_id  NUMBER(10),
  delete_time DATE default SYSDATE not null
)
;
create table T_CAPITAL_OLD_NEW_RELATION
(
  old_capital_id NUMBER(12) not null,
  new_capital_id NUMBER(12) not null,
  vat_rate       NUMBER(5,4)
)
;

create table T_CAPITAL_SPLIT_QUEUE
(
  list_id     NUMBER(10) not null,
  capital_id  NUMBER(12),
  distri_type NUMBER(3),
  policy_id   NUMBER(10),
  insert_time DATE,
  reason_id   NUMBER(2),
  status_id   NUMBER(2),
  fail_count  NUMBER(2),
  fail_log    VARCHAR2(4000)
)
;
create table T_CAPITAL_SPLIT_SUCCESS
(
  list_id     NUMBER(10) not null,
  capital_id  NUMBER(12),
  distri_type NUMBER(3),
  policy_id   NUMBER(10),
  insert_time DATE
)
;
create table T_CAPITAL_TRANSFER_UNSUCCESS
(
  unsuccess_id   VARCHAR2(20),
  unsuccess_name VARCHAR2(100),
  unsuccess_type NUMBER(2)
)
;

create table T_CARD_IDENT
(
  ident_id   NUMBER(7) not null,
  ident_name VARCHAR2(100) not null,
  card_id    NUMBER(10)
)
;

create table T_CARD_IDENT_DATELIMIT
(
  ident_id    NUMBER not null,
  card_id     NUMBER,
  insert_time DATE default SYSDATE,
  end_date    DATE
)
;
create table T_CARD_RIDER
(
  main_card   NUMBER(3) not null,
  rider_card  NUMBER(3) not null,
  rider_order NUMBER(10)
)
;
create table T_IMAGE_CONTENT_TYPE
(
  image_content_type NUMBER(2) not null,
  type_name          VARCHAR2(100) not null,
  card_id            NUMBER(10) not null
)
;
create table T_CARD_SECTION_CONFIG
(
  image_content_type NUMBER(2) not null,
  start_no           NUMBER(20) not null,
  end_no             NUMBER(20) not null,
  version            NUMBER(6) not null
)
;
create table T_CARD_WITHDRAW_PRINT
(
  list_id       NUMBER(10) not null,
  start_no      VARCHAR2(30),
  end_no        VARCHAR2(30),
  unit          NUMBER(10),
  actual_amount NUMBER(12,2),
  agent_name    VARCHAR2(40),
  agent_code    VARCHAR2(25),
  agancy_code   VARCHAR2(20),
  card_fee      NUMBER(10),
  print_id      NUMBER(10),
  print_num     NUMBER(10) default 0,
  print_date    DATE,
  insert_time   DATE default SYSDATE
)
;

create table T_CASE_LIMIT
(
  organ_id   VARCHAR2(40) not null,
  level_id   NUMBER(4) not null,
  case_level VARCHAR2(1) not null
)
;

create table T_CASH_ACC_TYPE
(
  type_code CHAR(3) not null,
  type_name VARCHAR2(30) not null
)
;
create table T_CASH_ACCOUNT
(
  cash_bank    VARCHAR2(20) not null,
  cash_account VARCHAR2(40) not null,
  account_type CHAR(3) not null,
  usid         NUMBER(10) not null,
  sap_account  VARCHAR2(10) not null
)
;
create table T_CASH_ACC_MAP
(
  account_type CHAR(3) not null,
  fee_type     NUMBER(3) not null,
  pay_mode     NUMBER(2) not null
)
;
create table T_CASH_BANK
(
  config_id    NUMBER(10) not null,
  organ_id     VARCHAR2(40) not null,
  dept_id      VARCHAR2(20),
  fee_type     NUMBER(3),
  pay_mode     NUMBER(2),
  cash_bank    VARCHAR2(20) not null,
  cash_account VARCHAR2(40) not null,
  special_id   NUMBER(3) default 0 not null,
  is_gather    CHAR(1) default 'W' not null,
  use_by_child CHAR(1) default 'N'
)
;
create table T_CASH_TYPE
(
  cash_type   NUMBER(4) not null,
  description VARCHAR2(50) not null,
  sign_number NUMBER(1) not null
)
;
create table T_CASH_FLOW
(
  cash_flow_seq NUMBER(20) not null,
  account_code  VARCHAR2(20) not null,
  occur_type    NUMBER(4) not null,
  occur_time    DATE not null,
  ctrl_no       VARCHAR2(20),
  last_balance  NUMBER(14,2) not null,
  change_amount NUMBER(14,2) not null,
  balance       NUMBER(14,2) not null,
  insert_person NUMBER(10) not null,
  insert_date   DATE default SYSDATE not null,
  update_time   DATE,
  fund_code     VARCHAR2(20) not null
)
;
create table T_CASH_GL
(
  fee_id      NUMBER(20) not null,
  fee_type    NUMBER(3) not null,
  pay_mode    NUMBER(2) not null,
  currency_id NUMBER(6) not null,
  organ_id    VARCHAR2(40) not null,
  policy_id   NUMBER(10),
  fee_status  NUMBER(2) not null,
  fee_amount  NUMBER(12,2) not null,
  finish_time DATE not null,
  posted      CHAR(1) not null,
  created_by  NUMBER(10),
  posting_id  NUMBER(10)
)
;
create table T_CASH_ITEM_TYPE
(
  cash_type_id VARCHAR2(2) not null,
  type_name    VARCHAR2(50)
)
;
create table T_CASH_ITEM
(
  cash_item_id   VARCHAR2(10) not null,
  cash_type_id   VARCHAR2(2),
  cash_item_name VARCHAR2(50),
  parent_item_id VARCHAR2(10),
  leaf           CHAR(1) not null,
  flowdirect     CHAR(1) default '1' not null
)
;
create table T_CASH_VALUE
(
  value_id               NUMBER(10) not null,
  product_id             NUMBER(7) not null,
  premium_year           NUMBER(3) default 0 not null,
  period                 NUMBER(4) default 0 not null,
  pay_period             CHAR(1) default '0' not null,
  pay_year               NUMBER(3) default 0 not null,
  end_period             CHAR(1) default '0' not null,
  end_year               NUMBER(3) default 0 not null,
  pay_ensure             NUMBER(3) default 0 not null,
  pay_type               CHAR(1) default '0' not null,
  increase_rate          NUMBER(5,4) default 0 not null,
  increase_freq          CHAR(1) default '0' not null,
  increase_year          NUMBER(2) default 0 not null,
  pay_rate               NUMBER(4,3) default 0 not null,
  except_value           NUMBER(10) default 0 not null,
  housekeeper            CHAR(1) default 'W' not null,
  retired                CHAR(1) default 'W' not null,
  job_cate               NUMBER(2) default 0 not null,
  gender                 CHAR(1) default 'N' not null,
  age                    NUMBER(3) default 999 not null,
  age_month              NUMBER(2) default 99 not null,
  smoking                CHAR(1) default 'W' not null,
  insured_category       CHAR(1) default '0' not null,
  gender_related         CHAR(1) default 'N' not null,
  age_related            NUMBER(3) default 999 not null,
  related_month          NUMBER(2) default 99 not null,
  benefit_level          VARCHAR2(20) default '0' not null,
  charge_type            CHAR(1) default '0' not null,
  waive_status           CHAR(1) default '0' not null,
  year                   NUMBER(3) default 999 not null,
  value_start            NUMBER(16,6) not null,
  value_end              NUMBER(16,6) not null,
  paid_up_sum            NUMBER(12,2) not null,
  simple_compound        CHAR(1) default '0' not null,
  resv_end               NUMBER(12,2) default 0 not null,
  resv_start             NUMBER(12,2) default 0 not null,
  accident_sum           NUMBER(12,2) default 0 not null,
  disease_sum            NUMBER(12,2) default 0 not null,
  naar_sum               NUMBER(12,2) default 0 not null,
  resv_pua               NUMBER(12,2) default 0 not null,
  a_factor               NUMBER(12,2) default (0),
  mortality_sum          NUMBER(12,2) default 0 not null,
  np_sr                  NUMBER(16,6) default 0 not null,
  month_value_start      NUMBER(16,6),
  month_value_end        NUMBER(16,6),
  month                  NUMBER(4) default 9999 not null,
  claimed_resv_end       NUMBER(12,2) default 0 not null,
  claimed_resv_start     NUMBER(12,2) default 0 not null,
  evaluated_prem         NUMBER(12,2),
  claimed_evaluated_prem NUMBER(12,2),
  accum_period           NUMBER(4) default 9999,
  prem                   NUMBER(18,8),
  begin_date             DATE,
  end_date               DATE,
  organ_id               VARCHAR2(40)
)
;
create table T_CASH_VALUE_BAK
(
  value_id               NUMBER(10) not null,
  product_id             NUMBER(7) not null,
  premium_year           NUMBER(3) default 0 not null,
  period                 NUMBER(4) default 0 not null,
  pay_period             CHAR(1) default '0' not null,
  pay_year               NUMBER(3) default 0 not null,
  end_period             CHAR(1) default '0' not null,
  end_year               NUMBER(3) default 0 not null,
  pay_ensure             NUMBER(3) default 0 not null,
  pay_type               CHAR(1) default '0' not null,
  increase_rate          NUMBER(5,4) default 0 not null,
  increase_freq          CHAR(1) default '0' not null,
  increase_year          NUMBER(2) default 0 not null,
  pay_rate               NUMBER(4,3) default 0 not null,
  except_value           NUMBER(10) default 0 not null,
  housekeeper            CHAR(1) default 'W' not null,
  retired                CHAR(1) default 'W' not null,
  job_cate               NUMBER(2) default 0 not null,
  gender                 CHAR(1) default 'N' not null,
  age                    NUMBER(3) default 999 not null,
  age_month              NUMBER(2) default 99 not null,
  smoking                CHAR(1) default 'W' not null,
  insured_category       CHAR(1) default '0' not null,
  gender_related         CHAR(1) default 'N' not null,
  age_related            NUMBER(3) default 999 not null,
  related_month          NUMBER(2) default 99 not null,
  benefit_level          VARCHAR2(20) default '0' not null,
  charge_type            CHAR(1) default '0' not null,
  waive_status           CHAR(1) default '0' not null,
  year                   NUMBER(3) default 999 not null,
  value_start            NUMBER(16,6) not null,
  value_end              NUMBER(16,6) not null,
  paid_up_sum            NUMBER(12,2) not null,
  simple_compound        CHAR(1) default '0' not null,
  resv_end               NUMBER(12,2) default 0 not null,
  resv_start             NUMBER(12,2) default 0 not null,
  accident_sum           NUMBER(12,2) default 0 not null,
  disease_sum            NUMBER(12,2) default 0 not null,
  naar_sum               NUMBER(12,2) default '0' not null,
  resv_pua               NUMBER(12,2) default 0 not null,
  a_factor               NUMBER(12,2) default 0,
  mortality_sum          NUMBER(12,2) default 0 not null,
  np_sr                  NUMBER(16,6) default 0 not null,
  month_value_start      NUMBER(16,6),
  month_value_end        NUMBER(16,6),
  month                  NUMBER(4) default 9999 not null,
  upload_date            DATE default SYSDATE,
  claimed_resv_end       NUMBER(12,2) default 0 not null,
  claimed_resv_start     NUMBER(12,2) default 0 not null,
  evaluated_prem         NUMBER(12,2),
  claimed_evaluated_prem NUMBER(12,2),
  accum_period           NUMBER(4) default 9999
)
;
create table T_CASH_VALUE_EX_SURVIVAL
(
  value_id               NUMBER(10) not null,
  product_id             NUMBER(7) not null,
  premium_year           NUMBER(3) default 0 not null,
  period                 NUMBER(4) default 0 not null,
  pay_period             CHAR(1) default '0' not null,
  pay_year               NUMBER(3) default 0 not null,
  end_period             CHAR(1) default '0' not null,
  end_year               NUMBER(3) default 0 not null,
  pay_ensure             NUMBER(3) default 0 not null,
  pay_type               CHAR(1) default '0' not null,
  increase_rate          NUMBER(5,4) default 0 not null,
  increase_freq          CHAR(1) default '0' not null,
  increase_year          NUMBER(2) default 0 not null,
  pay_rate               NUMBER(4,3) default 0 not null,
  except_value           NUMBER(10) default 0 not null,
  housekeeper            CHAR(1) default 'W' not null,
  retired                CHAR(1) default 'W' not null,
  job_cate               NUMBER(2) default 0 not null,
  gender                 CHAR(1) default 'N' not null,
  age                    NUMBER(3) default 999 not null,
  age_month              NUMBER(2) default 99 not null,
  smoking                CHAR(1) default 'W' not null,
  insured_category       CHAR(1) default '0' not null,
  gender_related         CHAR(1) default 'N' not null,
  age_related            NUMBER(3) default 999 not null,
  related_month          NUMBER(2) default 99 not null,
  benefit_level          VARCHAR2(20) default '0' not null,
  charge_type            CHAR(1) default '0' not null,
  waive_status           CHAR(1) default '0' not null,
  year                   NUMBER(3) default 999 not null,
  value_start            NUMBER(16,6) not null,
  value_end              NUMBER(16,6) not null,
  paid_up_sum            NUMBER(12,2) default 0 not null,
  simple_compound        CHAR(1) default '0' not null,
  resv_end               NUMBER(12,2) default 0 not null,
  resv_start             NUMBER(12,2) default 0 not null,
  accident_sum           NUMBER(12,2) default 0 not null,
  disease_sum            NUMBER(12,2) default 0 not null,
  naar_sum               NUMBER(12,2) default '0' not null,
  resv_pua               NUMBER(12,2) default 0 not null,
  a_factor               NUMBER(12,2) default 0,
  mortality_sum          NUMBER(12,2) default 0 not null,
  np_sr                  NUMBER(16,6) default 0 not null,
  month_value_start      NUMBER(16,6),
  month_value_end        NUMBER(16,6),
  month                  NUMBER(4) default 9999 not null,
  claimed_resv_end       NUMBER(12,2) default 0 not null,
  claimed_resv_start     NUMBER(12,2) default 0 not null,
  evaluated_prem         NUMBER(12,2),
  claimed_evaluated_prem NUMBER(12,2),
  accum_period           NUMBER(4) default 9999
)
;
create table T_CAS_PRINT_STATUS
(
  status_id   NUMBER(2) not null,
  status_desc VARCHAR2(100)
)
;
create table T_CAS_POLICY_PRINT
(
  print_id           NUMBER(10) not null,
  policy_id          NUMBER(10),
  insurant_num       NUMBER(10),
  segment_num        NUMBER(10),
  templet_type       NUMBER(2),
  process_status     NUMBER(2),
  insert_time        DATE,
  request_time       DATE,
  request_count      NUMBER(2),
  jms_correlation_id VARCHAR2(50),
  response_time      DATE,
  file_finish_time   DATE,
  file_path          VARCHAR2(1000),
  error_log          VARCHAR2(4000),
  message_log        VARCHAR2(4000),
  mail_id            VARCHAR2(50)
)
;
create table T_CAUSE_GROUP
(
  cause_grp_id NUMBER(10) not null,
  description  VARCHAR2(100)
)
;
create table T_CERTIFICATE_TYPE
(
  type_id   NUMBER(2) not null,
  type_name VARCHAR2(30) not null
)
;
create table T_CERT_PRINT_MAIN
(
  print_no         NUMBER(10) not null,
  polno            VARCHAR2(16),
  certno           VARCHAR2(16),
  plan_name        VARCHAR2(100),
  company_name     VARCHAR2(100),
  insurant_name    VARCHAR2(100),
  agent_name       VARCHAR2(50),
  address          VARCHAR2(100),
  telephone        VARCHAR2(50),
  report_year      VARCHAR2(10),
  plan_create_date DATE
)
;
create table T_CERT_PRINT_FEE_INFO
(
  print_no       NUMBER(10),
  polno          VARCHAR2(16),
  certno         VARCHAR2(16),
  period_type    NUMBER(1),
  fund_code      VARCHAR2(4),
  tax            VARCHAR2(4),
  enterprise_amt NUMBER(14,4),
  personal_amt   NUMBER(14,4),
  transfer_amt   NUMBER(14,4),
  attach_rate    NUMBER(14,4),
  attatch_amt    NUMBER(14,4),
  no_attach_amt  NUMBER(14,4),
  bonus          NUMBER(14,4)
)
;
create table T_CERT_PRINT_PAY_DETAIL
(
  print_no       NUMBER(10),
  polno          VARCHAR2(16),
  certno         VARCHAR2(16),
  pay_date       DATE,
  enterprise_amt NUMBER(14,4),
  personal_amt   NUMBER(14,4)
)
;
create table T_CESSION_TYPE
(
  cession_type VARCHAR2(2) not null,
  type_name    VARCHAR2(30) not null
)
;
create table T_CFG_BANK_PRODUCT
(
  internal_id  VARCHAR2(10) not null,
  product_abbr VARCHAR2(200) not null,
  agent_flag   VARCHAR2(2) not null
)
;
create table T_CHANGE_AMOUNT_RATE
(
  amount_id    NUMBER(10),
  product_id   NUMBER(7),
  premium_year NUMBER(3) default 0,
  period       NUMBER(4) default 0,
  policy_year  NUMBER(3) default 999,
  value_start  NUMBER(16,6),
  value_end    NUMBER(16,6)
)
;
create table T_CHANGE_COLUMN
(
  alter_id        NUMBER(10) not null,
  change_id       NUMBER(10) not null,
  policy_id       NUMBER(10) not null,
  pk_id           VARCHAR2(50) not null,
  pk_name         VARCHAR2(50) not null,
  table_name      VARCHAR2(50) not null,
  where_condition VARCHAR2(4000),
  validate_type   CHAR(1) not null,
  rollback_type   CHAR(1) not null,
  insert_time     DATE default sysdate
)
;
create table T_CHANGE_COLUMN_VALUE
(
  column_id   NUMBER(10) not null,
  alter_id    NUMBER(10) not null,
  column_name VARCHAR2(50) not null,
  old_value   VARCHAR2(100),
  new_value   VARCHAR2(100)
)
;
create table T_CHANGE_FEE_LOG
(
  list_id      NUMBER(10) not null,
  opt_id       NUMBER(10) not null,
  insert_time  DATE default SYSDATE not null,
  change_id    NUMBER(10) not null,
  insured_id   NUMBER(10),
  fee_type     NUMBER(3) not null,
  pay_mode     NUMBER(2) not null,
  bank_code    VARCHAR2(20),
  bank_account VARCHAR2(40),
  policy_year  NUMBER(5)
)
;
create table T_CHANGE_RECORD_CHANGE
(
  record_id         NUMBER(10) not null,
  change_id         NUMBER(10) not null,
  change_date       DATE default SYSDATE,
  old_change_record VARCHAR2(4000),
  new_change_record VARCHAR2(4000),
  updater_id        NUMBER(10),
  update_time       DATE default SYSDATE
)
;
create table T_CHANGE_TABLE
(
  list_id         NUMBER(10) not null,
  change_id       NUMBER(10) not null,
  policy_id       NUMBER(10) not null,
  pk_id           VARCHAR2(50) not null,
  pk_name         VARCHAR2(50) not null,
  table_name      VARCHAR2(50) not null,
  where_condition VARCHAR2(4000),
  validate_type   CHAR(1) not null,
  rollback_type   CHAR(1) not null,
  insert_time     DATE default sysdate
)
;
create table T_COL_TYPE
(
  type_id   NUMBER(4) not null,
  type_name VARCHAR2(40) not null
)
;
create table T_CHANGE_TABLE_COLUMN
(
  column_id   NUMBER(10) not null,
  list_id     NUMBER(10) not null,
  column_name VARCHAR2(50) not null,
  column_type NUMBER(4) not null,
  old_value   VARCHAR2(100),
  new_value   VARCHAR2(100),
  insert_time DATE default sysdate
)
;
create table T_CHANGE_TYPE
(
  change_type CHAR(1) not null,
  change_name VARCHAR2(40) not null
)
;
create table T_PREM_ROLE
(
  prem_role CHAR(1) not null,
  role_name VARCHAR2(30) not null
)
;
create table T_PREM_TYPE
(
  prem_prem VARCHAR2(1) not null,
  type_name VARCHAR2(30) not null
)
;
create table T_CHARGE_FEE
(
  product_id         NUMBER(7) not null,
  prem_type          VARCHAR2(1) default '0' not null,
  opt_flag           CHAR(1) not null,
  assign_rate        NUMBER(5,4),
  assign_amount      NUMBER(14,4),
  premium_year       NUMBER(3) default 0 not null,
  period             NUMBER(4) default 0 not null,
  account_att_type   NUMBER(2) default 0 not null,
  start_date         DATE default to_date('1900-01-01','yyyy-mm-dd') not null,
  low_year           NUMBER(3) default 0 not null,
  high_year          NUMBER(3) default 999 not null,
  low_prem           NUMBER(10) default 0 not null,
  high_prem          NUMBER(10) default 9999999999 not null,
  accum_low_prem     NUMBER(10) default 0 not null,
  accum_high_prem    NUMBER(10) default 9999999999 not null,
  prem_role          CHAR(1) default (0) not null,
  organ_id           VARCHAR2(40) default '1000000' not null,
  low_age            NUMBER(3) default 0 not null,
  high_age           NUMBER(3) default 999 not null,
  benefit_trans_rate NUMBER(5,4)
)
;
create table T_CHARGE_PREM
(
  product_id   NUMBER(7) not null,
  charge_type  CHAR(1) not null,
  charge_value NUMBER(10) default 0 not null,
  min_age      NUMBER(3) default 0 not null,
  max_age      NUMBER(3) default 999 not null,
  min_prem     NUMBER(10) default 0 not null,
  max_prem     NUMBER(10) default 9999999999 not null
)
;
create table T_CHECK
(
  check_num      NUMBER(4) not null,
  check_brief    VARCHAR2(200) not null,
  check_desc     VARCHAR2(4000),
  check_cate     VARCHAR2(40) not null,
  charge_stand   NUMBER(10,2),
  parent_num     NUMBER(4),
  check_level    NUMBER(1) not null,
  stand_range    VARCHAR2(100),
  word_input     CHAR(1) default 'Y' not null,
  word_necessary CHAR(1) default 'Y' not null,
  unit           VARCHAR2(100),
  weight         NUMBER(5,2),
  old_seq        NUMBER(10)
)
;
create table T_CHECKING
(
  checking_id   NUMBER(12) not null,
  trans_id      NUMBER(12),
  system_code   VARCHAR2(30),
  checking_date DATE,
  total_num     NUMBER(12),
  total_fee     NUMBER(12,2),
  succ_num      NUMBER(12),
  succ_fee      NUMBER(12,2),
  fail_num      NUMBER(12),
  fail_fee      NUMBER(12,2),
  insert_time   DATE,
  update_time   DATE
)
;
create table T_CHECKING_DETAIL
(
  detail_id    NUMBER(12) not null,
  checking_id  NUMBER(12) not null,
  data_id      NUMBER(12) not null,
  check_result VARCHAR2(1),
  error_type   NUMBER(12),
  error_desc   VARCHAR2(500),
  insert_time  DATE
)
;
create table T_CHECK_TYPE
(
  check_type_id CHAR(1),
  type_name     VARCHAR2(40)
)
;
create table T_CHECK_PHYSICAL
(
  organ_id         VARCHAR2(40) not null,
  check_type_id    CHAR(1) not null,
  underwrite_class VARCHAR2(1) not null,
  min_age          VARCHAR2(3) default '0' not null,
  max_age          VARCHAR2(3) default '999' not null,
  take_proportion  VARCHAR2(3) default '100' not null,
  id               VARCHAR2(10) not null
)
;
create table T_CHECK_PROBLEM
(
  item_id     NUMBER(10) not null,
  policy_id   NUMBER(10) not null,
  option_id   NUMBER(10),
  category_id NUMBER(5),
  notes       VARCHAR2(1000) not null,
  receiptor   CHAR(1) not null
)
;
create table T_CHECK_RULE
(
  rule_id      NUMBER(10) not null,
  amount_type  CHAR(1) default '1' not null,
  low_amount   NUMBER(10) default 0 not null,
  up_amount    NUMBER(10) default 9999999999 not null,
  low_age      NUMBER(3) default 0 not null,
  up_age       NUMBER(3) default 999 not null,
  check_num    NUMBER(4) not null,
  uw_type      VARCHAR2(1) default '1' not null,
  organ_id     VARCHAR2(40) default '1',
  special_area CHAR(1) default 'N'
)
;
create table T_CHEQUE
(
  cheque_code   VARCHAR2(40) not null,
  cheque_status NUMBER(2) default 1 not null
)
;
create table T_CHEQUE_DETAIL
(
  send_id       NUMBER(10) not null,
  bank_code     VARCHAR2(20) not null,
  cheque_code   VARCHAR2(40) not null,
  cheque_type   VARCHAR2(2),
  fee_amount    NUMBER(12,2) not null,
  transfer_date DATE not null,
  collect_pay   CHAR(1) not null,
  status        CHAR(1) not null,
  unsuccess_id  VARCHAR2(2)
)
;
create table T_CHEQUE_PRINT_MAIN
(
  cheque_print_id       NUMBER(12) not null,
  create_date           DATE,
  templet_id            VARCHAR2(10),
  bank_code             VARCHAR2(20),
  bank_name             VARCHAR2(100),
  cheque_code           VARCHAR2(40),
  cheque_type           VARCHAR2(2),
  cheque_date           DATE,
  fee_amount            NUMBER(10,2),
  amount_char           VARCHAR2(150),
  payee_name            VARCHAR2(150),
  payee_address_1       VARCHAR2(100),
  payee_address_2       VARCHAR2(100),
  payee_address_3       VARCHAR2(100),
  payee_address_4       VARCHAR2(100),
  payee_zip             VARCHAR2(10),
  withdraw_desc         VARCHAR2(500),
  payee_certi_type_desc VARCHAR2(20),
  payee_certi_code      VARCHAR2(50),
  print_group           NUMBER(10) not null,
  vb_print_desc         VARCHAR2(1000),
  vb_print_state        NUMBER(1) default 0 not null,
  vb_print_time         DATE
)
;
create table T_CHK_MESSAGE_TBL
(
  message_id   NUMBER(16) not null,
  appno        VARCHAR2(16) not null,
  error_type   NUMBER(5),
  message      VARCHAR2(400),
  issue_emp    NUMBER(10),
  issue_date   DATE,
  deal_emp     NUMBER(10),
  deal_date    DATE,
  deal_message VARCHAR2(400),
  status       NUMBER(1) default 1 not null,
  organ_id     VARCHAR2(40) not null,
  deptno       VARCHAR2(20) not null,
  lcd          DATE not null,
  lcu          VARCHAR2(10) not null
)
;
create table T_CIITC_ACCIDENT_CAUSE_MAP
(
  list_id       NUMBER(10) not null,
  source_table  VARCHAR2(100),
  source_code   VARCHAR2(100),
  source_value  VARCHAR2(100),
  mapping_table VARCHAR2(100),
  mapping_code  VARCHAR2(100),
  mapping_value VARCHAR2(100)
)
;
create table T_CIITC_ACCOUNT_CONFIG
(
  bank_name      VARCHAR2(200),
  account_holder VARCHAR2(200),
  accountno      VARCHAR2(200),
  contact_name   VARCHAR2(200),
  contact_tele   VARCHAR2(200),
  contact_email  VARCHAR2(200),
  organ_id       VARCHAR2(40),
  company_name   VARCHAR2(100)
)
;
create table T_CIITC_APPLY_SOURCE_MAP
(
  list_id       NUMBER(10) not null,
  source_table  VARCHAR2(100),
  source_code   VARCHAR2(100),
  source_value  VARCHAR2(100),
  mapping_table VARCHAR2(100),
  mapping_code  VARCHAR2(100),
  mapping_value VARCHAR2(100)
)
;
create table T_CIITC_BATCH_VERIFY
(
  accum_bill_id NUMBER(10) not null,
  policy_id     NUMBER(10) not null,
  customer_id   NUMBER(10) not null,
  result_code   NUMBER(1),
  result_desc   VARCHAR2(4000),
  insert_time   DATE default sysdate,
  update_time   DATE default sysdate
)
;
create table T_CIITC_BENEFICIARY_TYPE_MAP
(
  list_id       NUMBER(10) not null,
  source_table  VARCHAR2(100),
  source_code   VARCHAR2(100),
  source_value  VARCHAR2(100),
  mapping_table VARCHAR2(100),
  mapping_code  VARCHAR2(100),
  mapping_value VARCHAR2(100)
)
;
create table T_CIITC_BENEFIT_TYPE_MAP
(
  list_id       NUMBER(10) not null,
  source_table  VARCHAR2(100),
  source_code   VARCHAR2(100),
  source_value  VARCHAR2(100),
  mapping_table VARCHAR2(100),
  mapping_code  VARCHAR2(100),
  mapping_value VARCHAR2(100)
)
;
create table T_CIITC_CANNCEL_MAP
(
  list_id       NUMBER(10) not null,
  source_table  VARCHAR2(100),
  source_code   VARCHAR2(100),
  source_value  VARCHAR2(100),
  mapping_table VARCHAR2(100),
  mapping_code  VARCHAR2(100),
  mapping_value VARCHAR2(100)
)
;
create table T_CIITC_CERTI_TYPE_MAP
(
  list_id       NUMBER(10) not null,
  source_table  VARCHAR2(100),
  source_code   VARCHAR2(100),
  source_value  VARCHAR2(100),
  mapping_table VARCHAR2(100),
  mapping_code  VARCHAR2(100),
  mapping_value VARCHAR2(100)
)
;
create table T_CIITC_CHARGE_FREQUENCY_MAP
(
  list_id       NUMBER(10) not null,
  source_table  VARCHAR2(100),
  source_code   VARCHAR2(100),
  source_value  VARCHAR2(100),
  mapping_table VARCHAR2(100),
  mapping_code  VARCHAR2(100),
  mapping_value VARCHAR2(100)
)
;
create table T_CIITC_CLAIM_DECISION_MAP
(
  list_id       NUMBER(10) not null,
  source_table  VARCHAR2(100),
  source_code   VARCHAR2(100),
  source_value  VARCHAR2(100),
  mapping_table VARCHAR2(100),
  mapping_code  VARCHAR2(100),
  mapping_value VARCHAR2(100)
)
;
create table T_CIITC_CLAIM_TYPE_MAP
(
  list_id       NUMBER(10) not null,
  source_table  VARCHAR2(100),
  source_code   VARCHAR2(100),
  source_value  VARCHAR2(100),
  mapping_table VARCHAR2(100),
  mapping_code  VARCHAR2(100),
  mapping_value VARCHAR2(100)
)
;
create table T_CIITC_COMPANY_NATURE_MAP
(
  list_id       NUMBER(10) not null,
  source_table  VARCHAR2(100),
  source_code   VARCHAR2(100),
  source_value  VARCHAR2(100),
  mapping_table VARCHAR2(100),
  mapping_code  VARCHAR2(100),
  mapping_value VARCHAR2(100)
)
;
create table T_CIITC_CONFIG
(
  user_name        VARCHAR2(200) not null,
  password         VARCHAR2(200),
  customer_wsdl    VARCHAR2(200),
  policy_wsdl      VARCHAR2(200),
  taret_name_space VARCHAR2(200),
  config_type      VARCHAR2(30) not null,
  version          VARCHAR2(10)
)
;
create table T_CIITC_CUSTOMER_INFO
(
  customer_id NUMBER(10) not null,
  real_name   VARCHAR2(100) not null,
  gender      CHAR(1) not null,
  birthday    DATE not null,
  certi_type  NUMBER(2) not null,
  certi_code  VARCHAR2(50) not null,
  customer_no VARCHAR2(30),
  exist_indi  CHAR(1)
)
;
create table T_CIITC_DEPOSIT_TYPE_MAP
(
  list_id       NUMBER(10) not null,
  source_table  VARCHAR2(100),
  source_code   VARCHAR2(100),
  source_value  VARCHAR2(100),
  mapping_table VARCHAR2(100),
  mapping_code  VARCHAR2(100),
  mapping_value VARCHAR2(100)
)
;
create table T_CIITC_DISCOUNT_TYPE_MAP
(
  list_id       NUMBER(10) not null,
  source_table  VARCHAR2(100),
  source_code   VARCHAR2(100),
  source_value  VARCHAR2(200),
  mapping_table VARCHAR2(100),
  mapping_code  VARCHAR2(100),
  mapping_value VARCHAR2(200)
)
;
create table T_CIITC_DISEASE_MAP
(
  list_id       NUMBER(10) not null,
  source_table  VARCHAR2(100),
  source_code   VARCHAR2(100),
  source_value  VARCHAR2(200),
  mapping_table VARCHAR2(100),
  mapping_code  VARCHAR2(100),
  mapping_value VARCHAR2(200)
)
;
create table T_CIITC_DISTRICT_CODE_MAP
(
  list_id       NUMBER(10) not null,
  district_code NUMBER(10),
  district_name VARCHAR2(200),
  mapping_code  NUMBER(10),
  mapping_name  VARCHAR2(200)
)
;
create table T_CIITC_DISTRICT_MAP
(
  list_id        NUMBER(10) not null,
  source_table   VARCHAR2(100),
  source_code    VARCHAR2(100),
  source_value   VARCHAR2(100),
  source_value2  VARCHAR2(100),
  mapping_table  VARCHAR2(100),
  mapping_code   VARCHAR2(100),
  mapping_value  VARCHAR2(100),
  mapping_code2  VARCHAR2(100),
  mapping_value2 VARCHAR2(100)
)
;
create table T_CIITC_ENDORSEMENT_MAP
(
  list_id       NUMBER(10) not null,
  source_table  VARCHAR2(100),
  source_code   VARCHAR2(100),
  source_value  VARCHAR2(100),
  mapping_table VARCHAR2(100),
  mapping_code  VARCHAR2(100),
  mapping_value VARCHAR2(100)
)
;
create table T_CIITC_END_CAUSE_MAP
(
  list_id       NUMBER(10) not null,
  source_table  VARCHAR2(100),
  source_code   VARCHAR2(100),
  source_value  VARCHAR2(100),
  mapping_table VARCHAR2(100),
  mapping_code  VARCHAR2(100),
  mapping_value VARCHAR2(100)
)
;
create table T_CIITC_EXPORT_REG
(
  list_id                  NUMBER(10) not null,
  policy_id                NUMBER(10),
  policy_no                VARCHAR2(30),
  sequence_no              VARCHAR2(30),
  register_date            VARCHAR2(19),
  expected_terminiate_date DATE,
  reject_reason            VARCHAR2(2000),
  contact_name             VARCHAR2(300),
  contact_tele             VARCHAR2(100),
  contact_email            VARCHAR2(100),
  trans_receiv_date        DATE,
  insert_time              DATE,
  update_time              DATE
)
;
create table T_CIITC_GENDER_MAP
(
  list_id       NUMBER(10) not null,
  source_table  VARCHAR2(100),
  source_code   VARCHAR2(100),
  source_value  VARCHAR2(100),
  mapping_table VARCHAR2(100),
  mapping_code  VARCHAR2(100),
  mapping_value VARCHAR2(100)
)
;
create table T_CIITC_HOSPITAL_MAP
(
  list_id       NUMBER(10) not null,
  source_table  VARCHAR2(100),
  source_code   VARCHAR2(100),
  source_value  VARCHAR2(200),
  mapping_table VARCHAR2(100),
  mapping_code  VARCHAR2(100),
  mapping_value VARCHAR2(200)
)
;
create table T_CIITC_HOSPITAL_MED_TYPE_MAP
(
  list_id       NUMBER(10) not null,
  source_table  VARCHAR2(100),
  source_code   VARCHAR2(100),
  source_value  VARCHAR2(200),
  mapping_table VARCHAR2(100),
  mapping_code  VARCHAR2(100),
  mapping_value VARCHAR2(200)
)
;
create table T_CIITC_INS_TYPE_MAP
(
  list_id       NUMBER(10) not null,
  source_table  VARCHAR2(100),
  source_code   VARCHAR2(100),
  source_value  VARCHAR2(100),
  mapping_table VARCHAR2(100),
  mapping_code  VARCHAR2(100),
  mapping_value VARCHAR2(100)
)
;
create table T_CIITC_JOB_CATEGORY_MAP
(
  list_id       NUMBER(10) not null,
  source_table  VARCHAR2(100),
  source_code   VARCHAR2(100),
  source_value  VARCHAR2(100),
  mapping_table VARCHAR2(100),
  mapping_code  VARCHAR2(100),
  mapping_value VARCHAR2(100)
)
;
create table T_CIITC_LIABILITY_CATEGORY_MAP
(
  list_id       NUMBER(10) not null,
  source_table  VARCHAR2(100),
  source_code   VARCHAR2(100),
  source_value  VARCHAR2(100),
  mapping_table VARCHAR2(100),
  mapping_code  VARCHAR2(100),
  mapping_value VARCHAR2(100)
)
;
create table T_CIITC_LIABILITY_MAP
(
  liab_id      VARCHAR2(100) not null,
  mapping_code VARCHAR2(100),
  mapping_name VARCHAR2(100)
)
;
create table T_CIITC_LIABILITY_STATUS_MAP
(
  list_id       NUMBER(10) not null,
  source_table  VARCHAR2(100),
  source_code   VARCHAR2(100),
  source_value  VARCHAR2(100),
  mapping_table VARCHAR2(100),
  mapping_code  VARCHAR2(100),
  mapping_value VARCHAR2(100)
)
;
create table T_CIITC_MEDICAL_FEE_MAP
(
  list_id       NUMBER(10) not null,
  source_table  VARCHAR2(100),
  source_code   VARCHAR2(100),
  source_value  VARCHAR2(100),
  mapping_table VARCHAR2(100),
  mapping_code  VARCHAR2(100),
  mapping_value VARCHAR2(100)
)
;
create table T_CIITC_NATIONALITY_MAP
(
  list_id       NUMBER(10) not null,
  source_table  VARCHAR2(100),
  source_code   VARCHAR2(100),
  source_value  VARCHAR2(100),
  mapping_table VARCHAR2(100),
  mapping_code  VARCHAR2(100),
  mapping_value VARCHAR2(100)
)
;
create table T_CIITC_OPERATOR_CODE_MAP
(
  source_table  VARCHAR2(100) not null,
  source_code   VARCHAR2(100) not null,
  source_value  VARCHAR2(1000),
  mapping_table VARCHAR2(100),
  mapping_code  VARCHAR2(100),
  mapping_value VARCHAR2(200)
)
;
create table T_CIITC_ORGAN_CODE
(
  organ_code VARCHAR2(20) not null,
  organ_name VARCHAR2(200),
  organ_type VARCHAR2(20)
)
;
create table T_CIITC_PACKAGE_MAP
(
  product_id   VARCHAR2(100) not null,
  internal_id  VARCHAR2(100),
  mapping_code VARCHAR2(100),
  mapping_name VARCHAR2(100)
)
;
create table T_CIITC_PARA_DATA
(
  list_id       NUMBER not null,
  queue_list_id NUMBER,
  para_1        VARCHAR2(30),
  para_2        VARCHAR2(30),
  para_3        VARCHAR2(30),
  para_4        VARCHAR2(30),
  para_5        VARCHAR2(30),
  para_6        VARCHAR2(30),
  para_7        VARCHAR2(30),
  para_8        VARCHAR2(30),
  para_9        VARCHAR2(30),
  para_10       VARCHAR2(30),
  insert_time   DATE,
  update_time   DATE default sysdate
)
;
create table T_CIITC_PERIOD_TYPE_MAP
(
  list_id       NUMBER(10) not null,
  source_table  VARCHAR2(100),
  source_code   VARCHAR2(100),
  source_value  VARCHAR2(100),
  mapping_table VARCHAR2(100),
  mapping_code  VARCHAR2(100),
  mapping_value VARCHAR2(100)
)
;
create table T_CIITC_POLICY_EXPORT
(
  list_id              NUMBER(10) not null,
  policy_id            NUMBER(10),
  policy_no            VARCHAR2(30),
  sequence_no          VARCHAR2(30),
  transfer_sequence_no VARCHAR2(50),
  trans_apply_date     DATE,
  trans_receiv_date    DATE,
  company_name         VARCHAR2(100),
  bank_name            VARCHAR2(100),
  account_holder       VARCHAR2(20),
  account_no           VARCHAR2(50),
  contact_name         VARCHAR2(100),
  contact_tele         VARCHAR2(100),
  contact_email        VARCHAR2(100),
  insert_time          DATE,
  update_time          DATE
)
;
create table T_CIITC_POLICY_TYPE_MAP
(
  list_id       NUMBER(10) not null,
  source_table  VARCHAR2(100),
  source_code   VARCHAR2(100),
  source_value  VARCHAR2(100),
  mapping_table VARCHAR2(100),
  mapping_code  VARCHAR2(100),
  mapping_value VARCHAR2(100)
)
;
create table T_CIITC_PROCESS_MAP
(
  list_id       NUMBER(10) not null,
  source_table  VARCHAR2(100),
  source_code   VARCHAR2(100),
  source_value  VARCHAR2(100),
  mapping_table VARCHAR2(100),
  mapping_code  VARCHAR2(100),
  mapping_value VARCHAR2(100)
)
;
create table T_CIITC_PRODUCT_MAP
(
  product_id   VARCHAR2(100) not null,
  internal_id  VARCHAR2(100),
  mapping_code VARCHAR2(100),
  mapping_name VARCHAR2(100)
)
;
create table T_CIITC_QUEUE
(
  busi_queue_id     NUMBER(10) not null,
  policy_id         NUMBER(10),
  curr_order_code   NUMBER(10),
  queue_status      CHAR(1),
  inert_time        DATE default sysdate,
  update_time       DATE default sysdate,
  exits_error_queue CHAR(1)
)
;
create table T_CIITC_QUEUE_DETAIL
(
  list_id         NUMBER(10) not null,
  busi_queue_id   NUMBER(10),
  policy_id       NUMBER(10),
  change_id       NUMBER(10),
  case_id         NUMBER(10),
  busi_model_type VARCHAR2(100),
  detail_status   CHAR(1),
  order_code      NUMBER(10),
  fail_times      NUMBER(10),
  insert_time     DATE,
  update_time     DATE
)
;
create table T_CIITC_QUEUE_DETAIL_EXT
(
  list_id      NUMBER(10),
  queue_flag   NUMBER(1),
  queue_status NUMBER(1),
  deposit_id   NUMBER(10),
  run_times    NUMBER default 0
)
;
create table T_CIITC_RECEIPT_FEE_TYPE_MAP
(
  list_id       NUMBER(10) not null,
  source_table  VARCHAR2(100),
  source_code   VARCHAR2(100),
  source_value  VARCHAR2(100),
  mapping_table VARCHAR2(100),
  mapping_code  VARCHAR2(100),
  mapping_value VARCHAR2(100)
)
;
create table T_CIITC_RECEIPT_TYPE_MAP
(
  list_id       NUMBER(10) not null,
  source_table  VARCHAR2(100),
  source_code   VARCHAR2(100),
  source_value  VARCHAR2(100),
  mapping_table VARCHAR2(100),
  mapping_code  VARCHAR2(100),
  mapping_value VARCHAR2(100)
)
;
create table T_CIITC_RELATION_CODE_MAP
(
  list_id       NUMBER(10) not null,
  source_table  VARCHAR2(100),
  source_code   VARCHAR2(100),
  source_value  VARCHAR2(100),
  mapping_table VARCHAR2(100),
  mapping_code  VARCHAR2(100),
  mapping_value VARCHAR2(100)
)
;
create table T_CIITC_SALES_CHANNEL_MAP
(
  list_id       NUMBER(10) not null,
  source_table  VARCHAR2(100),
  source_code   VARCHAR2(100),
  source_value  VARCHAR2(100),
  mapping_table VARCHAR2(100),
  mapping_code  VARCHAR2(100),
  mapping_value VARCHAR2(100)
)
;
create table T_CIITC_TRANS
(
  busi_queue_id      NUMBER(10),
  sync_adhoc         CHAR(1),
  ciitc_service_code CHAR(6),
  busi_status        CHAR(1),
  insert_time        DATE default sysdate,
  update_time        DATE default sysdate,
  trans_id           NUMBER(10) not null
)
;
create table T_CIITC_TRANSACTION_TYPE
(
  trans_type     CHAR(6) not null,
  trans_desc     VARCHAR2(400),
  sync_adhoc     CHAR(1),
  mail_supervise CHAR(1) default 'N' not null
)
;
create table T_CIITC_TRANS_AMOUNT
(
  list_id           NUMBER(10) not null,
  policy_id         NUMBER(10),
  policy_no         VARCHAR2(30),
  sequence_no       VARCHAR2(30),
  contact_name      VARCHAR2(300),
  contact_tele      VARCHAR2(100),
  contact_email     VARCHAR2(100),
  trans_receiv_date DATE,
  trans_amount      NUMBER(14,2),
  insert_time       DATE,
  update_time       DATE
)
;
create table T_CIITC_TRANS_DETAIL
(
  list_id        NUMBER(10) not null,
  busi_queue_id  NUMBER(10),
  last_send_indi CHAR(1),
  req_message    CLOB,
  rep_message    CLOB,
  busi_status    CHAR(1),
  result_status  CHAR(1),
  result_desc    VARCHAR2(1000),
  insert_time    DATE default sysdate,
  update_time    DATE default sysdate,
  ciitc_busi_no  VARCHAR2(50),
  trans_id       NUMBER(10) not null
)
;
create table T_CIITC_TRANS_VERIFY
(
  list_id           NUMBER(10) not null,
  check_date        VARCHAR2(50),
  request_total_num VARCHAR2(50),
  com_success_num   VARCHAR2(50),
  com_fail_num      VARCHAR2(50),
  total_num         VARCHAR2(50),
  success_num       VARCHAR2(50),
  fail_num          VARCHAR2(50),
  company_code      VARCHAR2(50),
  insert_time       DATE,
  update_time       DATE
)
;
create table T_CIITC_TRAN_VERIFY_DETAIL
(
  list_id                NUMBER(20) not null,
  check_date             VARCHAR2(50),
  trans_date             VARCHAR2(50),
  check_trans_type       VARCHAR2(50),
  policy_no              VARCHAR2(50),
  sequence_no            VARCHAR2(50),
  endorsement_no         VARCHAR2(50),
  claim_no               VARCHAR2(50),
  fee_id                 VARCHAR2(50),
  fee_status             VARCHAR2(50),
  renewal_endorsement_no VARCHAR2(50),
  com_fee_id             VARCHAR2(50),
  return_code            VARCHAR2(50),
  error_message          CLOB,
  trans_id               NUMBER(10) not null
)
;
create table T_CIITC_UW_DECISION_MAP
(
  list_id       NUMBER(10) not null,
  source_table  VARCHAR2(100),
  source_code   VARCHAR2(100),
  source_value  VARCHAR2(100),
  mapping_table VARCHAR2(100),
  mapping_code  VARCHAR2(100),
  mapping_value VARCHAR2(100)
)
;
create table T_CIITC_YES_NO_MAP
(
  list_id       NUMBER(10) not null,
  source_table  VARCHAR2(100),
  source_code   VARCHAR2(100),
  source_value  VARCHAR2(100),
  mapping_table VARCHAR2(100),
  mapping_code  VARCHAR2(100),
  mapping_value VARCHAR2(100)
)
;
create table T_CIRCAS_ACCOMMODATE_CAUSE
(
  accommodate_cause CHAR(3) not null,
  full_name         VARCHAR2(300) not null,
  abbr_name         VARCHAR2(20)
)
;
create table T_CIRCAS_ACCOMMODATE_CAUSE_MAP
(
  map_id            NUMBER(4) not null,
  accommodate_cause CHAR(3) not null,
  cause_id          NUMBER(4) not null
)
;
create table T_CIRCAS_ACCOUNT_SORT
(
  p         VARCHAR2(10) not null,
  full_name VARCHAR2(100)
)
;
create table T_CIRCAS_AGENT_INFO
(
  agentno    VARCHAR2(20),
  agent_name VARCHAR2(40),
  quano      VARCHAR2(20),
  profno     VARCHAR2(20),
  idno       VARCHAR2(50)
)
;
create table T_CIRCAS_AGT_CODE
(
  agt_code     VARCHAR2(20),
  agt_name     VARCHAR2(60),
  agt_address  VARCHAR2(100),
  agt_org_type VARCHAR2(2),
  agt_busi_num VARCHAR2(20),
  startdate    DATE,
  enddate      DATE,
  signdate     DATE,
  quitdate     DATE,
  isulqulifd   CHAR(1)
)
;
create table T_CIRCAS_AGT_ORG_TYPE
(
  a           CHAR(2) not null,
  full_name   VARCHAR2(40) not null,
  abbr_name   VARCHAR2(40),
  description VARCHAR2(300)
)
;
create table T_CIRCAS_AGT_ORG_TYPE_MAP
(
  map_id      NUMBER(4) not null,
  a           CHAR(2) not null,
  agency_type CHAR(1) not null
)
;
create table T_CIRCAS_AMT_TYPE
(
  am          CHAR(2) not null,
  full_name   VARCHAR2(40) not null,
  description VARCHAR2(300)
)
;
create table T_CIRCAS_AMT_TYPE_MAP
(
  map_id       NUMBER(4) not null,
  am           CHAR(2) not null,
  type_id      NUMBER(3) not null,
  period_type  CHAR(1) default '0',
  benefit_type VARCHAR2(2) default '0',
  fee_purpose  NUMBER(1) default 0
)
;
create table T_CIRCAS_BANC_SPECI_INFO
(
  banc_speci_no   VARCHAR2(20),
  banc_speci_name VARCHAR2(30),
  sex             CHAR(1),
  id_type         VARCHAR2(2),
  idno            VARCHAR2(20),
  quano           VARCHAR2(38),
  joindate        DATE,
  leavedate       DATE,
  edu_degree      VARCHAR2(2),
  accreditation   CHAR(1),
  branch          VARCHAR2(30),
  rank            VARCHAR2(1),
  source          VARCHAR2(30),
  iscompliant     CHAR(1),
  isulqulifd      CHAR(1)
)
;
create table T_CIRCAS_BILL_CODE_INFO
(
  bill_code   VARCHAR2(30),
  bill_name   VARCHAR2(180),
  c_bill_type CHAR(1),
  isimportant CHAR(1)
)
;
create table T_CIRCAS_BILL_INFO
(
  bill_code       VARCHAR2(30),
  start_print_no  VARCHAR2(30),
  end_print_no    VARCHAR2(30),
  print_no        VARCHAR2(30),
  use_status      VARCHAR2(20),
  branch_code     VARCHAR2(30),
  use_time        DATE,
  verific_time    DATE,
  invalid_time    DATE,
  n_serial_amount NUMBER(8)
)
;
create table T_CIRCAS_BILL_STATUS_CODE
(
  p           VARCHAR2(10) not null,
  full_name   VARCHAR2(40),
  description VARCHAR2(100)
)
;
create table T_CIRCAS_BILL_STATUS_CODE_MAP
(
  map_id          NUMBER(2),
  bill_status     VARCHAR2(10),
  billcard_status NUMBER(2)
)
;
create table T_CIRCAS_BILL_TYPE_CODE
(
  p           VARCHAR2(10) not null,
  full_name   VARCHAR2(40),
  description VARCHAR2(400)
)
;
create table T_CIRCAS_BILL_TYPE_CODE_MAP
(
  map_id     NUMBER(2),
  p          VARCHAR2(10),
  image_type NUMBER(2),
  card_id    NUMBER(10),
  card_type  CHAR(1)
)
;
create table T_CIRCAS_BRANCH_INFO
(
  branch_code     VARCHAR2(30),
  branch_id       VARCHAR2(15),
  branch_name     VARCHAR2(60),
  branch_address  VARCHAR2(100),
  branch_level    CHAR(1),
  up_branch_code  VARCHAR2(30),
  branch_busi_num VARCHAR2(20),
  startdate       DATE,
  enddate         DATE default date'9999-01-01',
  leader_code     VARCHAR2(20)
)
;
create table T_CIRCAS_BUSI_SRC_TYPE
(
  b           VARCHAR2(20) not null,
  full_name   VARCHAR2(40) not null,
  description VARCHAR2(300)
)
;
create table T_CIRCAS_BUSI_SRC_TYPE_MAP
(
  map_id      NUMBER(4) not null,
  b           VARCHAR2(10) not null,
  sell_way    VARCHAR2(2) not null,
  policy_type CHAR(1) not null
)
;
create table T_CIRCAS_CITY
(
  region_cod CHAR(6),
  full_name  VARCHAR2(50) not null
)
;
create table T_CIRCAS_CITY_MAP
(
  map_id     NUMBER(4),
  region_cod CHAR(6) not null,
  area_code  VARCHAR2(6) not null
)
;
create table T_CIRCAS_CLAIM_MAIN
(
  caseno            VARCHAR2(30),
  payseq            NUMBER(2),
  polno             VARCHAR2(30),
  certno            VARCHAR2(30),
  listno            VARCHAR2(30),
  branch_code       VARCHAR2(30),
  gp_type           CHAR(1),
  prpl_no           VARCHAR2(30),
  app_name          VARCHAR2(300),
  app_idcard_type   VARCHAR2(2),
  app_idcard_no     VARCHAR2(90),
  insurd_name       VARCHAR2(300),
  ins_idcard_type   VARCHAR2(2),
  ins_idcard_no     VARCHAR2(90),
  benename          VARCHAR2(100),
  app_date          DATE,
  pol_eff_date      DATE,
  brno              NUMBER(2),
  plan_code         VARCHAR2(10),
  busi_src_type     VARCHAR2(3),
  agt_code          VARCHAR2(20),
  salesman_no       VARCHAR2(16),
  speciman_no       VARCHAR2(20),
  staff_no          VARCHAR2(20),
  c_rpt_no          VARCHAR2(30),
  docu_date         DATE,
  case_date         DATE default date'9999-01-01',
  reckon_loss       NUMBER(16,2),
  check_date        DATE,
  end_date          DATE,
  paid_name         VARCHAR2(90),
  paid_idcard_type  VARCHAR2(2),
  paid_idcard_no    VARCHAR2(90),
  amt_type          VARCHAR2(2),
  gained_date       DATE,
  curno             VARCHAR2(2),
  payab_amt_cnvt    NUMBER(16,2),
  payab_vou_code    VARCHAR2(20),
  paid_amt_cnvt     NUMBER(16,2),
  paid_vou_code     VARCHAR2(20),
  collectpay_code   CHAR(1),
  pay_account_code  VARCHAR2(20),
  pay_check_no      VARCHAR2(20),
  reje_amt          NUMBER(16,2),
  check_fee         NUMBER(16,2),
  accommodate_cause VARCHAR2(3),
  n_share_sum       NUMBER(16,2),
  n_share_sum_n     NUMBER(16,2),
  claim_main_id     NUMBER(20)
)
;
create table T_CIRCAS_CLAIM_REPORT
(
  c_rpt_no        VARCHAR2(30),
  caseno          VARCHAR2(30),
  notifier_name   VARCHAR2(90),
  docu_date       DATE,
  case_date       DATE default date'9999-01-01',
  n_rpt_amt       NUMBER(16,2),
  polno           VARCHAR2(30),
  certno          VARCHAR2(30),
  listno          VARCHAR2(30),
  branch_code     VARCHAR2(30),
  gp_type         CHAR(1),
  c_recall_mrk    CHAR(1),
  t_recall_tm     DATE,
  claim_report_id NUMBER(20)
)
;
create table T_CIRCAS_COLLECTPAY_CODE
(
  p           VARCHAR2(10) not null,
  full_name   VARCHAR2(40),
  description VARCHAR2(400)
)
;
create table T_CIRCAS_COLLECTPAY_CODE_MAP
(
  map_id  NUMBER(2),
  p       VARCHAR2(10),
  mode_id NUMBER(2)
)
;
create table T_CIRCAS_CUR
(
  c_code CHAR(2) not null,
  c_abbr VARCHAR2(5) not null,
  c_name VARCHAR2(30)
)
;
create table T_CIRCAS_CUR_MAP
(
  map_id   NUMBER(4) not null,
  c_code   CHAR(2) not null,
  money_id NUMBER(6) not null
)
;
create table T_CIRCAS_EDU_DEGREE_CODE
(
  p         VARCHAR2(10) not null,
  full_name VARCHAR2(40)
)
;
create table T_CIRCAS_EDU_DEGREE_CODE_MAP
(
  map_id       NUMBER(2),
  p            VARCHAR2(10),
  education_id VARCHAR2(2) not null
)
;
create table T_CIRCAS_ENDO_FEE
(
  entno               VARCHAR2(30),
  entprintcode        VARCHAR2(30),
  gp_type             CHAR(1),
  branch_code         VARCHAR2(30),
  polno               VARCHAR2(30),
  certno              VARCHAR2(30),
  prpl_no             VARCHAR2(30),
  app_name            VARCHAR2(300),
  app_idcard_type     VARCHAR2(2),
  app_idcard_no       VARCHAR2(90),
  insname             VARCHAR2(300),
  ins_idcard_type     VARCHAR2(2),
  ins_idcard_no       VARCHAR2(90),
  app_date            DATE,
  pol_eff_date        DATE,
  brno                NUMBER(2),
  plan_code           VARCHAR2(10),
  period              NUMBER(4),
  prem_type           VARCHAR2(4),
  prem_term           NUMBER(4),
  busi_src_type       VARCHAR2(3),
  agt_code            VARCHAR2(20),
  salesman_no         VARCHAR2(20),
  speciman_no         VARCHAR2(20),
  staff_no            VARCHAR2(20),
  pos_type            VARCHAR2(2),
  amt_type            VARCHAR2(2),
  sum_ins             NUMBER(16,2),
  proc_date           DATE,
  edr_eff_date        DATE,
  curno               VARCHAR2(2),
  payab_date          DATE,
  amt_payab_cnvt      NUMBER(16,2),
  endo_vou_code       VARCHAR2(20),
  gained_pay_date     DATE,
  amt_incured_cnvt    NUMBER(16,2),
  actendo_vou_code    VARCHAR2(20),
  collectpay_way_code CHAR(1),
  bank_account_code   VARCHAR2(20),
  check_code          VARCHAR2(20),
  surrender_cause     VARCHAR2(2),
  endo_content        VARCHAR2(900),
  endo_fee_id         NUMBER(20)
)
;
create table T_CIRCAS_EXTRACT_OPT
(
  opt_id   NUMBER(10),
  opt_date DATE,
  end_date DATE,
  status   CHAR(1)
)
;
create table T_CIRCAS_GENER_ACCOUNT_CODE
(
  account_code   VARCHAR2(25),
  account_name   VARCHAR2(100),
  account_sort   CHAR(1),
  balance_aspect CHAR(1),
  accrual_aspect CHAR(1),
  start_time     DATE,
  end_time       DATE,
  description    VARCHAR2(100)
)
;
create table T_CIRCAS_ID_CARD_TYPE
(
  p         VARCHAR2(10) not null,
  full_name VARCHAR2(100)
)
;
create table T_CIRCAS_ID_CARD_TYPE_MAP
(
  map_id     NUMBER,
  card_type  VARCHAR2(10),
  certi_type NUMBER(2)
)
;
create table T_CIRCAS_NEW_BUSINESS
(
  p         VARCHAR2(10) not null,
  full_name VARCHAR2(400)
)
;
create table T_CIRCAS_PAY_DUE
(
  polno             VARCHAR2(30),
  certno            VARCHAR2(30),
  listno            VARCHAR2(30),
  branch_code       VARCHAR2(30),
  gp_type           CHAR(1),
  prpl_no           VARCHAR2(30),
  app_name          VARCHAR2(300),
  app_idcard_type   VARCHAR2(2),
  app_idcard_no     VARCHAR2(90),
  insname           VARCHAR2(300),
  ins_idcard_type   VARCHAR2(2),
  ins_idcard_no     VARCHAR2(90),
  benename          VARCHAR2(300),
  app_date          DATE,
  pol_eff_date      DATE,
  brno              NUMBER(2),
  plan_code         VARCHAR2(10),
  period            NUMBER(4),
  prem_type         VARCHAR2(4),
  prem_term         NUMBER(4),
  annuity_type      VARCHAR2(4),
  anustartdate      DATE,
  annuity_term      NUMBER(4),
  busi_src_type     VARCHAR2(3),
  agt_code          VARCHAR2(20),
  salesman_no       VARCHAR2(16),
  speciman_no       VARCHAR2(20),
  staff_no          VARCHAR2(20),
  amt_type          VARCHAR2(2),
  accru_date        DATE,
  curno             VARCHAR2(2),
  accru_amt         NUMBER(16,2),
  paya_vou_code     VARCHAR2(20),
  gained_date       DATE,
  pay_amt           NUMBER(16,2),
  act_vou_code      VARCHAR2(20),
  collectpay_code   CHAR(1),
  bank_account_code VARCHAR2(20),
  check_code        VARCHAR2(20),
  payeename         VARCHAR2(30),
  payee_idcard_type VARCHAR2(2),
  payee_idcard_no   VARCHAR2(90),
  pay_due_id        NUMBER(20)
)
;
create table T_CIRCAS_PLAN_DESIGN
(
  p           VARCHAR2(20) not null,
  full_name   VARCHAR2(100),
  abbr_name   VARCHAR2(100),
  description VARCHAR2(100)
)
;
create table T_CIRCAS_PLAN_DESIGN_MAP
(
  map_id       NUMBER(2),
  p            VARCHAR2(10),
  busi_type    CHAR(1),
  benefit_type VARCHAR2(2)
)
;
create table T_CIRCAS_PLAN_INFO
(
  plan_code   VARCHAR2(10),
  full_name   VARCHAR2(180),
  abbr_name   VARCHAR2(60),
  plan_type   VARCHAR2(5),
  design_type VARCHAR2(5),
  regu_type   CHAR(1),
  mainoratta  CHAR(1),
  undertype   CHAR(1),
  file_code   VARCHAR2(20),
  file_date   DATE,
  startdate   DATE,
  stopdate    DATE,
  plan_period CHAR(1),
  hesi_days   NUMBER(2),
  grac_days   NUMBER(2)
)
;
create table T_CIRCAS_PLAN_PERIOD
(
  p           CHAR(1) not null,
  full_name   VARCHAR2(40) not null,
  description VARCHAR2(100)
)
;
create table T_CIRCAS_PLAN_PERIOD_MAP
(
  map_id      NUMBER(4) not null,
  p           CHAR(1) not null,
  period_type CHAR(1) not null
)
;
create table T_CIRCAS_PLAN_TYPE
(
  p           VARCHAR2(20) not null,
  full_name   VARCHAR2(50) not null,
  abbr_name   VARCHAR2(50),
  description VARCHAR2(300)
)
;
create table T_CIRCAS_PLAN_TYPE_MAP
(
  map_id       NUMBER(4) not null,
  p            CHAR(5) not null,
  benefit_type VARCHAR2(2) not null,
  busi_type    CHAR(1) not null
)
;
create table T_CIRCAS_POL_MAIN
(
  polno            VARCHAR2(30) not null,
  certno           VARCHAR2(30) not null,
  pol_prt_code     VARCHAR2(30),
  prpl_no          VARCHAR2(30) not null,
  prpl_prt_code    VARCHAR2(30),
  post_code        VARCHAR2(6),
  branch_code      VARCHAR2(30),
  gp_type          CHAR(1),
  app_name         VARCHAR2(300),
  app_idcard_type  VARCHAR2(2),
  app_idcard_no    VARCHAR2(90),
  app_income       NUMBER(16,2),
  insname          VARCHAR2(300),
  ins_idcard_type  VARCHAR2(2),
  ins_idcard_no    VARCHAR2(90),
  app_ins_relation VARCHAR2(2),
  benename         VARCHAR2(300) default '法定',
  sum_ins          NUMBER(16,2),
  sum_ins_death    NUMBER(16,2),
  app_date         DATE,
  input_date       DATE,
  underwr_date     DATE,
  eff_date         DATE,
  recp_date        DATE default date'9999-01-01',
  revisit_date     DATE default date'9999-01-01',
  matu_date        DATE,
  conta_name       VARCHAR2(90),
  conta_tel        VARCHAR2(15),
  busi_src_type    VARCHAR2(3),
  agt_code         VARCHAR2(20),
  salesman_no      VARCHAR2(16),
  banc_speci_no    VARCHAR2(20),
  staff_no         VARCHAR2(20),
  extra_memo       VARCHAR2(300),
  reins_type       CHAR(1) default '0',
  pol_main_id      NUMBER(20)
)
;
create table T_CIRCAS_POS_TYPE
(
  po          CHAR(2) not null,
  full_name   VARCHAR2(100) not null,
  description VARCHAR2(300)
)
;
create table T_CIRCAS_POS_TYPE_MAP
(
  po         CHAR(2) not null,
  service_id NUMBER(10),
  map_id     NUMBER(2)
)
;
create table T_CIRCAS_PREM_INFO
(
  polno                     VARCHAR2(30),
  certno                    VARCHAR2(30),
  gp_type                   CHAR(1),
  branch_code               VARCHAR2(30),
  prpl_no                   VARCHAR2(30),
  app_name                  VARCHAR2(300),
  app_idcard_type           VARCHAR2(2),
  app_idcard_no             VARCHAR2(90),
  insname                   VARCHAR2(300),
  ins_idcard_type           VARCHAR2(2),
  ins_idcard_no             VARCHAR2(90),
  app_date                  DATE,
  eff_date                  DATE,
  brno                      NUMBER(2),
  plan_code                 VARCHAR2(10),
  sum_ins                   NUMBER(16,2),
  sum_ins_death             NUMBER(16,2),
  amt_type                  VARCHAR2(2),
  period                    NUMBER(4),
  prem_term                 NUMBER(4),
  curno                     VARCHAR2(2),
  payab_date                DATE,
  payab_prem_cnvt           NUMBER(16,2),
  payabcol_vou_cod          VARCHAR2(20),
  gained_date               DATE,
  tot_prem_cnvt             NUMBER(16,2),
  precol_vou_cod            VARCHAR2(20),
  actcol_vou_cod            VARCHAR2(20),
  prem_invo_code            VARCHAR2(30),
  collectpay_code           CHAR(1),
  bank_account_code         VARCHAR2(20),
  check_code                VARCHAR2(20),
  prem_psns                 NUMBER(8),
  new_busi_code             VARCHAR2(2),
  prem_type                 VARCHAR2(4),
  busi_src_type             VARCHAR2(3),
  agt_code                  VARCHAR2(20),
  proc_rate                 NUMBER(6,4),
  payabproc_vou_cod         VARCHAR2(20),
  actproc_vou_code          VARCHAR2(20),
  salesman_no               VARCHAR2(16),
  com_rate                  NUMBER(5,2),
  payabcom_vou_cod          VARCHAR2(20),
  actcom_vou_code           VARCHAR2(20),
  speciman_no               VARCHAR2(20),
  spc_bonus_rat             NUMBER(5,2),
  spc_payabbonus_vou_code   VARCHAR2(20),
  special_actbonus_vou_code VARCHAR2(20),
  staff_no                  VARCHAR2(20),
  staff_bonus_rate          NUMBER(5,2),
  payabbonus_vou_code       VARCHAR2(20),
  actbonus_vou_code         VARCHAR2(20),
  prem_info_id              NUMBER(20)
)
;
create table T_CIRCAS_PREM_TYPE
(
  p           VARCHAR2(20) not null,
  full_name   VARCHAR2(100) not null,
  description VARCHAR2(300)
)
;
create table T_CIRCAS_PREM_TYPE_MAP
(
  map_id      NUMBER(4) not null,
  p           VARCHAR2(20) not null,
  end_period  CHAR(1) not null,
  pay_type    CHAR(1) not null,
  charge_mode CHAR(1) not null
)
;
create table T_CIRCAS_REALTIONSHIP_CODE
(
  p         VARCHAR2(10) not null,
  full_name VARCHAR2(40)
)
;
create table T_CIRCAS_REALTIONSHIP_CODE_MAP
(
  map_id      NUMBER(2),
  p           VARCHAR2(10),
  relation_id NUMBER(2)
)
;
create table T_CIRCAS_SALESMAN_INFO
(
  salesman_no    VARCHAR2(16),
  salesman_name  VARCHAR2(30),
  quano          VARCHAR2(20),
  quaenddate     DATE,
  profno         VARCHAR2(26),
  profstartdate  DATE,
  profenddate    DATE,
  id_type        VARCHAR2(2),
  idno           VARCHAR2(20),
  joindate       DATE,
  leavedate      DATE,
  up_salesman_no VARCHAR2(16),
  source         VARCHAR2(2),
  edu_degree     VARCHAR2(2),
  iscompliant    CHAR(1),
  isulqulifd     CHAR(1),
  branch_info    VARCHAR2(30)
)
;
create table T_CIRCAS_STAFF_INFO
(
  staff_no      VARCHAR2(20),
  staff_name    VARCHAR2(30),
  sex           CHAR(1),
  id_type       VARCHAR2(2),
  idno          VARCHAR2(60),
  quano         VARCHAR2(19),
  joindate      DATE,
  leavedate     DATE,
  edu_degree    VARCHAR2(2),
  accreditation CHAR(1),
  depart_info   VARCHAR2(30),
  is_leader     CHAR(1),
  staff_rank    VARCHAR2(30)
)
;
create table T_CIRCAS_SUB_ACCOUNT_CODE
(
  account_code    VARCHAR2(25),
  account_name    VARCHAR2(100),
  account_degree  CHAR(1),
  up_account_code VARCHAR2(20),
  account_sort    CHAR(1),
  balance_aspect  CHAR(1),
  accrual_aspect  CHAR(1),
  start_time      DATE,
  end_time        DATE,
  description     VARCHAR2(100)
)
;
create table T_CIRCAS_SURRENDER_CAUSE
(
  p         VARCHAR2(20) not null,
  full_name VARCHAR2(100)
)
;
create table T_CIRCAS_VOUCHER_INFO
(
  voucher_date    DATE,
  branch_info     VARCHAR2(30),
  voucher_code    VARCHAR2(20),
  entry_sn        VARCHAR2(3),
  account_code    VARCHAR2(25),
  curno           VARCHAR2(2),
  debit_sum       NUMBER(16,2),
  debit_sum_rmb   NUMBER(16,2),
  credit_sum      NUMBER(16,2),
  credit_sum_rmb  NUMBER(16,2),
  brief           VARCHAR2(100),
  collectpay_code CHAR(1),
  bank_acc        VARCHAR2(20),
  check_id        VARCHAR2(20),
  oppo_bank_acc   VARCHAR2(20),
  oppo_check_id   VARCHAR2(20),
  proposal_code   VARCHAR2(30),
  polno           VARCHAR2(30),
  entno           VARCHAR2(30),
  caseno          VARCHAR2(20),
  plan_code       VARCHAR2(10),
  profit_center   VARCHAR2(100),
  department      VARCHAR2(100),
  personal        VARCHAR2(30),
  is_original     CHAR(1),
  voucher_info_id NUMBER(20)
)
;
create table T_CIRC_ACCIDENT
(
  accident_type NUMBER(2) not null,
  accident_desc VARCHAR2(200) not null
)
;
create table T_CIRC_ACCIDENT_MAP
(
  circ_accident_type NUMBER(2) not null,
  accident_id        VARCHAR2(10) not null
)
;
create table T_CIRC_ACCOUNT_TYPE
(
  type_id   NUMBER(2) not null,
  type_name VARCHAR2(20)
)
;
create table T_CIRC_FREQ
(
  freq_id   NUMBER(2) not null,
  freq_name VARCHAR2(20)
)
;
create table T_CIRC_ACCOUNT_CODE
(
  account_id        NUMBER(5) not null,
  account_code      VARCHAR2(10) not null,
  account_name      VARCHAR2(200),
  account_type      NUMBER(2),
  freq_express      NUMBER(2),
  freq_month        NUMBER(2),
  freq_quarter      NUMBER(2),
  freq_half_year    NUMBER(2),
  freq_year         NUMBER(2),
  account_grade     NUMBER(2),
  account_parent    NUMBER(5),
  is_basic          CHAR(1) default 'Y' not null,
  sum_from          VARCHAR2(300),
  sub_from          VARCHAR2(300),
  freq_yearly       CHAR(1),
  is_valid          CHAR(1) default 'N' not null,
  is_report_acc     CHAR(1) default 'N' not null,
  is_null           CHAR(1) default 'Y',
  is_zf_check       CHAR(1) default 'N',
  four_organ_report CHAR(1) default 'N',
  new_sum_from      VARCHAR2(300)
)
;






create table T_CIRC_ACCOUNT_DATA_ALL
(
  organ_id              VARCHAR2(40) not null,
  benefit_type          VARCHAR2(2) default '0',
  busi_type             CHAR(1) default '0',
  sub_benefit_type      VARCHAR2(2) default '0',
  policy_type           VARCHAR2(1) default '0',
  period_type           VARCHAR2(3) default '0',
  liab_type             NUMBER(2) default 0,
  sell_way              VARCHAR2(2) default '0',
  sub_liab_type         NUMBER(2) default 0,
  policy_num            NUMBER(14),
  insured_num           NUMBER(14),
  amount                NUMBER(14,2),
  year                  NUMBER(4),
  month                 NUMBER(2),
  tp_annuity_flag       NUMBER(1) default 0,
  period_flag           NUMBER(1) default 0,
  product_num           NUMBER(14),
  fee                   NUMBER(14,2),
  policy_year           NUMBER(2) default 0,
  charge_type           CHAR(1) default '0',
  stat_fee_type         NUMBER(2) default 0,
  plan                  NUMBER(1) default 0,
  tax                   NUMBER(1) default 0,
  charge_year           NUMBER(3) default 0,
  sub_sub_liab_type     NUMBER(2) default 0,
  confirm_pay           NUMBER(20,2) default 0,
  unconfirm_pay         NUMBER(20,2) default 0,
  confirm_pay_insured   NUMBER(20) default 0,
  unconfirm_pay_insured NUMBER(20) default 0,
  special_type_id       NUMBER(2) default 0,
  circ_cliam_liab_type  NUMBER(2) default 0,
  circ_accident_type    NUMBER(2) default 0
)
;
create table T_CIRC_CONTENT
(
  content_id   NUMBER(2) not null,
  content_name VARCHAR2(20) not null
)
;
create table T_CIRC_SELL_WAY
(
  sell_way VARCHAR2(2) not null,
  way_name VARCHAR2(200) not null
)
;
create table T_CIRC_STAT_FEE_TYPE
(
  stat_fee_id   NUMBER(2) not null,
  stat_fee_name VARCHAR2(200) not null
)
;
create table T_CIRC_ACCOUNT_DIM_DEF
(
  account_id           NUMBER(5) not null,
  benefit_type         VARCHAR2(2) default '0' not null,
  busi_type            CHAR(1) default '0' not null,
  sub_benefit_type     VARCHAR2(2) default '0' not null,
  policy_type          VARCHAR2(1) default '0' not null,
  period_type          VARCHAR2(3) default '0' not null,
  liab_type            NUMBER(2) default 0 not null,
  sell_way             VARCHAR2(2) default '0' not null,
  tp_annuity_flag      NUMBER(1) default 0 not null,
  sub_liab_type        NUMBER(2) default 0 not null,
  content              NUMBER(2),
  period_flag          NUMBER(1) default 0 not null,
  policy_year          NUMBER(2) default 0,
  charge_type          CHAR(1) default '0',
  stat_fee_type        NUMBER(2) default 0,
  plan                 NUMBER(1) default 0,
  tax                  NUMBER(1) default 0,
  charge_year          NUMBER(3) default 0,
  sub_sub_liab_type    NUMBER(2) default 0,
  special_type_id      NUMBER(2) default 0,
  circ_cliam_liab_type NUMBER(2) default 0,
  circ_accident_type   NUMBER(2) default 0
)
;
create table T_CIRC_ACCOUNT_GRADE_CHECK
(
  left_sum  VARCHAR2(400),
  left_sub  VARCHAR2(400),
  right_sum VARCHAR2(400),
  right_sub VARCHAR2(400),
  is_valid  CHAR(1) default 'N' not null
)
;
create table T_CIRC_AREA
(
  area_id     NUMBER(5) not null,
  area_code   VARCHAR2(6) not null,
  area_name   VARCHAR2(50),
  n_area_code VARCHAR2(6)
)
;
create table T_CIRC_AREA_CHECK_ACCOUNT
(
  area_code    VARCHAR2(12),
  account_code VARCHAR2(10) not null
)
;
create table T_CIRC_AREA_DATA
(
  area_code    VARCHAR2(12) not null,
  account_code VARCHAR2(10) not null,
  amount       NUMBER(20,2) not null,
  stat_year    NUMBER(4) not null,
  stat_month   NUMBER(4) not null,
  intervaltype NUMBER(4) not null
)
;
create table T_CIRC_AREA_DATA_CHECK_ERROR
(
  area_code    VARCHAR2(20) not null,
  account_code VARCHAR2(10) not null,
  up_amount    NUMBER(20,2) not null,
  down_amount  NUMBER(20,2) not null,
  stat_year    NUMBER(4) not null,
  stat_month   NUMBER(4) not null,
  intervaltype NUMBER(4) not null
)
;
create table T_CIRC_AREA_FOUR
(
  area_id   NUMBER(5) not null,
  area_code VARCHAR2(6) not null,
  area_name VARCHAR2(50)
)
;
create table T_CIRC_AREA_FOUR_MAP
(
  organ_id VARCHAR2(40) not null,
  area_id  NUMBER(5) not null
)
;
create table T_CIRC_AREA_MAP
(
  organ_id VARCHAR2(40) not null,
  area_id  NUMBER(5)
)
;
create table T_CIRC_BIZ_DATA
(
  organ_id              VARCHAR2(40) not null,
  policy_num            NUMBER(15),
  policy_type           CHAR(1) not null,
  sell_way              VARCHAR2(2),
  product_id            NUMBER(7) not null,
  internal_id           VARCHAR2(10),
  benefit_type          VARCHAR2(2) not null,
  busi_type             CHAR(1) not null,
  period_type           CHAR(1),
  insured_num           NUMBER(20),
  amount                NUMBER(20,2),
  insert_date           DATE default SYSDATE,
  period_flag           NUMBER(1) default 0,
  tp_annuity_flag       NUMBER(1) default 0,
  product_num           NUMBER(10),
  fee                   NUMBER(20,2),
  policy_year           NUMBER(2) default 0,
  charge_type           CHAR(1) default '0',
  stat_fee_type         NUMBER(2) default 0,
  due_date              DATE,
  plan                  NUMBER(1) default 0,
  tax                   NUMBER(1) default 0,
  charge_year           NUMBER(3) default 0,
  fee_type              NUMBER(3),
  confirm_pay           NUMBER(20,2) default 0,
  unconfirm_pay         NUMBER(20,2) default 0,
  confirm_pay_insured   NUMBER(20) default 0,
  unconfirm_pay_insured NUMBER(20) default 0,
  claim_liab_id         NUMBER(5) default 0,
  circ_accident_type    NUMBER(2) default 0
)
;
create table T_CIRC_BIZ_DATA_GRP_TWO
(
  organ_id              VARCHAR2(40) not null,
  benefit_type          VARCHAR2(2),
  busi_type             CHAR(1),
  sub_benefit_type      VARCHAR2(2),
  policy_type           VARCHAR2(1),
  period_type           VARCHAR2(3) default '0',
  liab_type             NUMBER(2),
  sell_way              VARCHAR2(2),
  sub_liab_type         NUMBER(2),
  policy_num            NUMBER(14),
  insured_num           NUMBER(14),
  amount                NUMBER(14,2),
  year                  NUMBER(4),
  month                 NUMBER(2),
  tp_annuity_flag       NUMBER(1) default 0,
  period_flag           NUMBER(1) default 0,
  product_num           NUMBER(10),
  fee                   NUMBER(20,2),
  policy_year           NUMBER(2) default 0,
  charge_type           CHAR(1) default '0',
  stat_fee_type         NUMBER(2) default 0,
  plan                  NUMBER(1) default 0,
  tax                   NUMBER(1) default 0,
  charge_year           NUMBER(3) default 0,
  sub_sub_liab_type     NUMBER(2),
  special_type_id       NUMBER(2) default 0,
  circ_cliam_liab_type  NUMBER(2) default 0,
  confirm_pay           NUMBER(20,2) default 0,
  unconfirm_pay         NUMBER(20,2) default 0,
  confirm_pay_insured   NUMBER(20) default 0,
  unconfirm_pay_insured NUMBER(20) default 0,
  circ_accident_type    NUMBER(2) default 0
)
;
create table T_CIRC_BIZ_DATA_SIMPLE_GROUP
(
  organ_id              VARCHAR2(40) not null,
  benefit_type          VARCHAR2(2),
  busi_type             CHAR(1),
  sub_benefit_type      VARCHAR2(2),
  policy_type           VARCHAR2(1),
  period_type           VARCHAR2(3) default '0',
  liab_type             NUMBER(2),
  sell_way              VARCHAR2(2),
  sub_liab_type         NUMBER(2),
  policy_num            NUMBER(14),
  insured_num           NUMBER(14),
  amount                NUMBER(14,2),
  year                  NUMBER(4),
  month                 NUMBER(2),
  tp_annuity_flag       NUMBER(1) default 0,
  period_flag           NUMBER(1) default 0,
  product_num           NUMBER(10),
  fee                   NUMBER(20,2),
  policy_year           NUMBER(2) default 0,
  charge_type           CHAR(1) default '0',
  stat_fee_type         NUMBER(2) default 0,
  plan                  NUMBER(1) default 0,
  tax                   NUMBER(1) default 0,
  charge_year           NUMBER(3) default 0,
  sub_sub_liab_type     NUMBER(2),
  special_type_id       NUMBER(2) default 0,
  circ_cliam_liab_type  NUMBER(2) default 0,
  confirm_pay           NUMBER(20,2) default 0,
  unconfirm_pay         NUMBER(20,2) default 0,
  confirm_pay_insured   NUMBER(20) default 0,
  unconfirm_pay_insured NUMBER(20) default 0,
  circ_accident_type    NUMBER(2) default 0
)
;
create table T_CIRC_BIZ_DATA_TWO
(
  organ_id              VARCHAR2(40) not null,
  policy_num            NUMBER(15),
  policy_type           CHAR(1) not null,
  sell_way              VARCHAR2(2),
  product_id            NUMBER(7) not null,
  internal_id           VARCHAR2(10),
  benefit_type          VARCHAR2(2) not null,
  busi_type             CHAR(1) not null,
  period_type           CHAR(1),
  insured_num           NUMBER(20),
  amount                NUMBER(20,2),
  insert_date           DATE default sysdate,
  period_flag           NUMBER(1) default 0,
  tp_annuity_flag       NUMBER(1) default 0,
  product_num           NUMBER(10),
  fee                   NUMBER(20,2),
  policy_year           NUMBER(2) default 0,
  charge_type           CHAR(1) default '0',
  stat_fee_type         NUMBER(2) default 0,
  due_date              DATE,
  plan                  NUMBER(1) default 0,
  tax                   NUMBER(1) default 0,
  charge_year           NUMBER(3) default 0,
  fee_type              NUMBER(3),
  confirm_pay           NUMBER(20,2) default 0,
  unconfirm_pay         NUMBER(20,2) default 0,
  confirm_pay_insured   NUMBER(20) default 0,
  unconfirm_pay_insured NUMBER(20) default 0,
  claim_liab_id         NUMBER(5) default 0,
  circ_accident_type    NUMBER(2) default 0
)
;
create table T_CIRC_BLOB
(
  blob_id     NUMBER(12) not null,
  content     BLOB,
  create_date DATE default SYSDATE not null,
  call_id     NUMBER(10),
  stat_year   NUMBER(4),
  stat_month  NUMBER(2),
  area_type   CHAR(1) default '1'
)
;
create table T_CIRC_BLOB_BACKUP
(
  blob_id     NUMBER(12),
  content     BLOB,
  call_id     NUMBER(10),
  stat_date   VARCHAR2(7),
  stat_year   NUMBER(4),
  stat_month  NUMBER(2),
  insert_date DATE
)
;
create table T_CIRC_CAPITAL_CLAIM
(
  distri_amount NUMBER(16,6) not null,
  policy_id     NUMBER(10) not null,
  product_id    NUMBER(10) not null,
  item_id       NUMBER(10)
)
;
create table T_CIRC_CAPITAL_FEE
(
  distri_amount NUMBER(16,6) not null,
  policy_id     NUMBER(10) not null,
  product_id    NUMBER(10) not null,
  item_id       NUMBER(10)
)
;
create table T_CIRC_CAPITAL_GRP_FEE
(
  period_prem  NUMBER,
  organ_id     VARCHAR2(40) not null,
  policy_type  CHAR(1) not null,
  sell_way     VARCHAR2(2) not null,
  product_id   NUMBER(10) not null,
  policy_year  NUMBER(2) not null,
  charge_type  CHAR(1),
  premium_year NUMBER,
  fee_type     NUMBER
)
;
create table T_CIRC_CAPITAL_PRD_CLAIM
(
  organ_id     VARCHAR2(40) not null,
  fee_amount   NUMBER,
  fee_type     NUMBER,
  item_id      NUMBER(10),
  product_id   NUMBER(10) not null,
  policy_type  CHAR(1) not null,
  premium_year NUMBER
)
;
create table T_CIRC_CAPITAL_PRD_FEE
(
  organ_id     VARCHAR2(40) not null,
  policy_type  CHAR(1) not null,
  sell_way     VARCHAR2(2) not null,
  product_id   NUMBER(10) not null,
  policy_year  NUMBER(2) not null,
  charge_type  CHAR(1),
  premium_year NUMBER,
  fee_type     NUMBER,
  period_prem  NUMBER(16,6) not null,
  policy_id    NUMBER(10) not null
)
;
create table T_CIRC_CAP_CUST
(
  policy_id     NUMBER(10) not null,
  distri_type   VARCHAR2(2) not null,
  distri_amount NUMBER(16,6) not null,
  product_id    NUMBER(10) not null
)
;
create table T_CIRC_CAP_GRP
(
  distri_amount NUMBER,
  product_id    NUMBER(10) not null,
  organ_id      VARCHAR2(40) not null
)
;
create table T_CIRC_CAP_ORGAN
(
  distri_type   VARCHAR2(2) not null,
  distri_amount NUMBER(16,6) not null,
  product_id    NUMBER(10) not null,
  organ_id      VARCHAR2(40) not null
)
;
create table T_CIRC_CHECK_ERROR
(
  organ_id     VARCHAR2(40),
  stat_year    NUMBER(4),
  stat_month   NUMBER(2),
  left_sum     VARCHAR2(400),
  left_sub     VARCHAR2(400),
  right_sum    VARCHAR2(400),
  right_sub    VARCHAR2(400),
  left_amount  NUMBER(16,2),
  right_amount NUMBER(16,2),
  check_date   DATE default sysdate
)
;
create table T_CIRC_CLAIM_FEE
(
  organ_id     VARCHAR2(40) not null,
  fee_amount   NUMBER(14,2) not null,
  fee_type     NUMBER(3) not null,
  item_id      NUMBER(10) not null,
  product_id   NUMBER(10) not null,
  policy_type  CHAR(1) not null,
  premium_year NUMBER
)
;
create table T_CIRC_CLAIM_FEE_1
(
  organ_id     VARCHAR2(40) not null,
  fee_amount   NUMBER(14,2) not null,
  fee_type     NUMBER(3) not null,
  item_id      NUMBER(10) not null,
  product_id   NUMBER(10) not null,
  policy_type  CHAR(1) not null,
  premium_year NUMBER
)
;
create table T_CIRC_CLAIM_FEE_2
(
  organ_id     VARCHAR2(40) not null,
  fee_amount   NUMBER(14,2) not null,
  fee_type     NUMBER,
  item_id      NUMBER(10) not null,
  product_id   NUMBER(10) not null,
  policy_type  CHAR(1) not null,
  premium_year NUMBER
)
;
create table T_CIRC_CLAIM_FEE_NEW
(
  organ_id     VARCHAR2(40),
  fee_amount   NUMBER,
  fee_type     NUMBER,
  item_id      NUMBER(10),
  product_id   NUMBER(10),
  policy_type  CHAR(1),
  premium_year NUMBER
)
;
create table T_CIRC_CLAIM_LIAB_MAP
(
  circ_cliam_liab_type NUMBER(2) not null,
  claim_liab_id        NUMBER(4) not null
)
;
create table T_CIRC_COMPANY
(
  comp_id    NUMBER(3) not null,
  comp_code  VARCHAR2(6),
  comp_name  VARCHAR2(50),
  is_current NUMBER(1) default (0)
)
;
create table T_CIRC_COMP_TYPE
(
  type_id   NUMBER(2) not null,
  type_name VARCHAR2(20)
)
;
create table T_CIRC_DISTRI_TYPE
(
  sum_sub     NUMBER,
  distri_type VARCHAR2(2)
)
;
create table T_CIRC_END_AMOUNT
(
  organ_id    VARCHAR2(40) not null,
  policy_type CHAR(1) not null,
  sell_way    VARCHAR2(2) not null,
  product_id  NUMBER(10) not null,
  insured_1   NUMBER(10) not null,
  amount      NUMBER(14,2),
  policy_id   NUMBER(10) not null
)
;
create table T_CIRC_END_POLICY
(
  organ_id    VARCHAR2(40) not null,
  policy_id   NUMBER(10) not null,
  policy_type CHAR(1) not null,
  sell_way    VARCHAR2(2) not null,
  product_id  NUMBER(10) not null
)
;
create table T_CIRC_FEE
(
  finish_time DATE,
  posted      CHAR(1) not null,
  fee_id      NUMBER(12) not null,
  fee_status  NUMBER(2) not null,
  policy_id   NUMBER(10)
)
;
create table T_CIRC_FEE_75
(
  organ_id    VARCHAR2(40) not null,
  fee_id      NUMBER(12) not null,
  policy_type CHAR(1) not null
)
;
create table T_CIRC_FEE_801
(
  fee_id NUMBER(12) not null
)
;
create table T_CIRC_FEE_TYPE_MAP
(
  fee_type    NUMBER(3) not null,
  period_type CHAR(1),
  liab_type   NUMBER(2),
  stat_fee_id NUMBER(2),
  sum_way     NUMBER(1) default 1 not null
)
;
create table T_CIRC_GEL_ACCOUNT_MAP
(
  map_id          NUMBER(10) not null,
  book_id         NUMBER(10) not null,
  gl_account_code VARCHAR2(10) not null,
  organ_id        VARCHAR2(40) not null,
  circ_account_id NUMBER(10) not null,
  create_time     DATE default (Sysdate)
)
;
create table T_CIRC_NEW_PRD_G_FEE
(
  organ_id     VARCHAR2(40) not null,
  policy_type  CHAR(1) not null,
  sell_way     VARCHAR2(2) not null,
  product_id   NUMBER(10) not null,
  policy_year  NUMBER(2) not null,
  charge_type  CHAR(1) not null,
  premium_year NUMBER(3) not null,
  fee_type     NUMBER(3) not null,
  period_prem  NUMBER
)
;
create table T_CIRC_NEW_PROD_FEE
(
  organ_id     VARCHAR2(40) not null,
  policy_type  CHAR(1) not null,
  sell_way     VARCHAR2(2) not null,
  product_id   NUMBER(10) not null,
  policy_year  NUMBER(2) not null,
  charge_type  CHAR(1) not null,
  premium_year NUMBER(3) not null,
  fee_type     NUMBER(3) not null,
  period_prem  NUMBER(12,2) not null
)
;
create table T_CIRC_N_PRD_GRP_FEE
(
  organ_id     VARCHAR2(40),
  policy_type  CHAR(1),
  sell_way     VARCHAR2(2),
  product_id   NUMBER(10),
  policy_year  NUMBER(2),
  charge_type  CHAR(1),
  premium_year NUMBER,
  fee_type     NUMBER,
  period_prem  NUMBER
)
;
create table T_CIRC_PAY_FEE_1
(
  organ_id        VARCHAR2(40),
  policy_type     CHAR(1) not null,
  sell_way        NUMBER,
  product_id      NUMBER(10) not null,
  tp_annuity_flag NUMBER,
  policy_year     NUMBER,
  charge_type     NUMBER,
  fee_type        NUMBER(3) not null,
  fee_amount      NUMBER(14,2) not null,
  item_id         NUMBER(10),
  policy_id       NUMBER(10) not null
)
;
create table T_CIRC_PAY_FEE_2
(
  organ_id        VARCHAR2(40),
  policy_type     CHAR(1) not null,
  sell_way        NUMBER,
  product_id      NUMBER(10) not null,
  tp_annuity_flag NUMBER,
  policy_year     NUMBER,
  charge_type     NUMBER,
  fee_type        NUMBER(3) not null,
  fee_amount      NUMBER(14,2) not null,
  item_id         NUMBER(10),
  policy_id       NUMBER(10) not null,
  premium_year    NUMBER
)
;
create table T_CIRC_PAY_FEE_3
(
  organ_id        VARCHAR2(40),
  policy_type     CHAR(1) not null,
  sell_way        NUMBER,
  product_id      NUMBER(10) not null,
  tp_annuity_flag NUMBER,
  policy_year     NUMBER,
  charge_type     NUMBER,
  fee_type        NUMBER(3) not null,
  fee_amount      NUMBER(14,2) not null,
  item_id         NUMBER(10),
  policy_id       NUMBER(10) not null,
  premium_year    NUMBER
)
;
create table T_CIRC_POLICY_AMOUNT
(
  organ_id    VARCHAR2(40) not null,
  policy_id   NUMBER(10) not null,
  policy_type CHAR(1) not null,
  sell_way    VARCHAR2(2) not null,
  product_id  NUMBER(10) not null,
  insured_1   NUMBER(10) not null,
  amount      NUMBER(14,2)
)
;
create table T_CIRC_PROD_FEE
(
  organ_id     VARCHAR2(40) not null,
  policy_type  CHAR(1) not null,
  sell_way     VARCHAR2(2) not null,
  product_id   NUMBER(10) not null,
  policy_year  NUMBER(2) not null,
  charge_type  CHAR(1) not null,
  premium_year NUMBER(3) not null,
  fee_type     NUMBER(3) not null,
  period_prem  NUMBER(12,2) not null,
  policy_id    NUMBER(10)
)
;
create table T_CIRC_PROD_FEE_75
(
  fee_id      NUMBER(12) not null,
  organ_id    VARCHAR2(40) not null,
  policy_type CHAR(1) not null,
  period_prem NUMBER(12,2) not null,
  product_id  NUMBER(10) not null
)
;
create table T_CIRC_PROD_FEE_801
(
  organ_id     VARCHAR2(40) not null,
  policy_type  CHAR(1) not null,
  sell_way     VARCHAR2(2) not null,
  product_id   NUMBER(10) not null,
  policy_year  NUMBER(2) not null,
  charge_type  CHAR(1) not null,
  premium_year NUMBER(3) not null,
  fee_type     NUMBER(3) not null,
  period_prem  NUMBER
)
;
create table T_CIRC_PROD_GRP_FEE
(
  organ_id     VARCHAR2(40) not null,
  policy_type  CHAR(1) not null,
  sell_way     VARCHAR2(2) not null,
  product_id   NUMBER(10) not null,
  policy_year  NUMBER(2) not null,
  charge_type  CHAR(1) not null,
  premium_year NUMBER(3) not null,
  fee_type     NUMBER(3) not null,
  period_prem  NUMBER
)
;
create table T_CIRC_PROD_LIAB
(
  type_id           VARCHAR2(6) not null,
  liab_type         NUMBER(2) not null,
  sub_liab_type     NUMBER(2),
  liab_desc         VARCHAR2(200),
  sub_sub_liab_type NUMBER(2)
)
;
create table T_CIRC_PROD_LIAB_MAP
(
  internal_id VARCHAR2(10) not null,
  type_id     VARCHAR2(6) not null
)
;
create table T_CIRC_SELL_PROD
(
  sell_prod_id     NUMBER(3),
  sell_organ_id    VARCHAR2(100),
  no_sell_organ_id VARCHAR2(100),
  internal_id      VARCHAR2(100) not null,
  name             VARCHAR2(70) not null,
  policy_type      VARCHAR2(2) not null,
  benefit_type     NUMBER(1) not null,
  sub_benefit_type VARCHAR2(2) not null,
  busi_type        VARCHAR2(2) not null,
  period_type      VARCHAR2(2) not null
)
;
create table T_CIRC_SELL_WAY_MAP
(
  policy_type   VARCHAR2(2) not null,
  sell_way      VARCHAR2(2),
  circ_sell_way NUMBER(2) not null,
  map_id        NUMBER(4) not null
)
;
create table T_CIRC_SPECIAL_BUSI
(
  type_id      VARCHAR2(6) not null,
  special_desc VARCHAR2(200)
)
;
create table T_CIRC_SPECIAL_BUSI_MAP
(
  type_id     VARCHAR2(6) not null,
  internal_id VARCHAR2(10) not null
)
;
create table T_CIRC_SUPERVISE_CODE
(
  account_code VARCHAR2(40) not null,
  account_desc VARCHAR2(800),
  data_unit    VARCHAR2(80),
  need_note    CHAR(1),
  is_upload    CHAR(1),
  freq_quarter NUMBER(2),
  freq_year    NUMBER(2),
  freq_year_du NUMBER(2),
  report_level VARCHAR2(20) default '3',
  insert_time  DATE default sysdate
)
;
create table T_CIRC_SUPERVISE_DATA
(
  account_code VARCHAR2(40) not null,
  data         VARCHAR2(400),
  note         VARCHAR2(4000),
  stat_year    VARCHAR2(10) not null,
  stat_month   VARCHAR2(10) not null,
  insert_time  DATE default sysdate
)
;

create table T_CIRC_UPLOAD_ERROR
(
  error_id       NUMBER(10) not null,
  upload_id      NUMBER(10),
  error_position NUMBER(7),
  error_data     VARCHAR2(200),
  insert_date    DATE default sysdate
)
;
create table T_CIRC_UPLOAD_FILE
(
  upload_id       NUMBER(10) not null,
  file_name       VARCHAR2(100),
  upload_time     DATE default sysdate,
  type_id         NUMBER(2),
  text_id         NUMBER(10),
  upload_user     NUMBER(10),
  total_record    NUMBER(10),
  error_record    NUMBER(10),
  handle_status   CHAR(1),
  amend_upload_id NUMBER(10)
)
;
create table T_CIRC_VOUCHER_BAK
(
  organ_id     VARCHAR2(40),
  amount       NUMBER(20,2),
  account_id   NUMBER(5),
  account_code VARCHAR2(10),
  stat_year    NUMBER(4),
  stat_month   NUMBER(2),
  insert_date  DATE default SYSDATE
)
;
create table T_CIRC_VOUCHER_DATA
(
  account_id   NUMBER(5) not null,
  account_code VARCHAR2(10) not null,
  organ_id     VARCHAR2(40) not null,
  stat_year    NUMBER(4) not null,
  stat_month   NUMBER(2) not null,
  amount       NUMBER(20,2),
  insert_date  DATE default sysdate
)
;
create table T_CIRC_VOUCHER_DATA_BAK
(
  area_code    VARCHAR2(6),
  amount       NUMBER(14,2),
  account_id   NUMBER(5),
  account_code VARCHAR2(10),
  account_name VARCHAR2(200),
  stat_year    NUMBER(4),
  stat_month   NUMBER(2),
  insert_date  DATE
)
;
create table T_CIRC_VOUCHER_DATA_FOUR
(
  account_id   NUMBER(5) not null,
  account_code VARCHAR2(10) not null,
  organ_id     VARCHAR2(40) not null,
  stat_year    NUMBER(4) not null,
  stat_month   NUMBER(2) not null,
  amount       NUMBER(20,2),
  insert_date  DATE default sysdate
)
;
create table T_CIRC_VOUCHER_DATA_LOAD
(
  account_code VARCHAR2(10) not null,
  organ_id     VARCHAR2(40) not null,
  stat_year    NUMBER(4) not null,
  stat_month   NUMBER(2) not null,
  amount       NUMBER(14,2)
)
;
create table T_CIRC_VOUCHER_DATA_PLUS
(
  list_id      NUMBER(10) not null,
  account_id   NUMBER(5) not null,
  account_code VARCHAR2(10) not null,
  organ_id     VARCHAR2(40) not null,
  stat_year    NUMBER(4) not null,
  stat_month   NUMBER(2) not null,
  end_month    NUMBER(2) not null,
  amount       NUMBER(20,2) default 0,
  note         VARCHAR2(1000),
  insert_date  DATE,
  update_date  DATE
)
;
create table T_CIRC_VOUCHER_DATA_PLUS_1
(
  list_id      NUMBER(10) not null,
  account_id   NUMBER(5) not null,
  account_code VARCHAR2(10) not null,
  organ_id     VARCHAR2(40) not null,
  stat_year    NUMBER(4) not null,
  stat_month   NUMBER(2) not null,
  end_month    NUMBER(2) not null,
  amount       NUMBER(20,2),
  note         VARCHAR2(1000),
  insert_date  DATE,
  update_date  DATE
)
;
create table T_CIRC_VOUCHER_DATA_TMP
(
  area_code    VARCHAR2(6),
  account_code VARCHAR2(10),
  account_name VARCHAR2(200),
  amount       NUMBER(20,2),
  account_id   NUMBER(5),
  insert_date  DATE default SYSDATE,
  stat_year    NUMBER(4),
  stat_month   NUMBER(2)
)
;
create table T_CIRC_VOUCHER_DATA_TMP_FOUR
(
  area_code    VARCHAR2(6) not null,
  account_code VARCHAR2(10) not null,
  account_id   NUMBER(5),
  account_name VARCHAR2(200) not null,
  stat_year    NUMBER(4) not null,
  stat_month   NUMBER(2) not null,
  amount       NUMBER(20,2),
  insert_date  DATE default sysdate
)
;
create table T_CIRC_VOUCHER_DATA_TMP_TWO
(
  area_code    VARCHAR2(6),
  account_code VARCHAR2(10),
  account_name VARCHAR2(200),
  amount       NUMBER(20,2),
  account_id   NUMBER(5),
  insert_date  DATE,
  stat_year    NUMBER(4),
  stat_month   NUMBER(2)
)
;
create table T_CIRC_VOUCHER_DATA_TWO
(
  account_id   NUMBER(5) not null,
  account_code VARCHAR2(10) not null,
  organ_id     VARCHAR2(40) not null,
  stat_year    NUMBER(4) not null,
  stat_month   NUMBER(2) not null,
  amount       NUMBER(20,2),
  insert_date  DATE
)
;
create table T_CIRC_YEAR_POLICY
(
  organ_id    VARCHAR2(40) not null,
  policy_id   NUMBER(10) not null,
  policy_type CHAR(1) not null,
  sell_way    VARCHAR2(2) not null,
  product_id  NUMBER(10) not null
)
;
create table T_CIRC_ZF_CHECK_INFO
(
  list_id      NUMBER(10) not null,
  account_code VARCHAR2(10),
  organ_id     VARCHAR2(40),
  stat_year    NUMBER(4) not null,
  stat_month   NUMBER(2) not null,
  is_null      CHAR(1) default 'N',
  is_empty     CHAR(1) default 'N',
  is_zf_check  CHAR(1) default 'N',
  insert_date  DATE,
  area_code    VARCHAR2(6)
)
;
create table T_CITTC_MAPPING
(
  list_id       NUMBER(10) not null,
  source_table  VARCHAR2(100),
  maping_table  VARCHAR2(100),
  default_code  VARCHAR2(100),
  default_value VARCHAR2(100)
)
;
create table T_REVERSAL_CAUSE
(
  reversal_cause VARCHAR2(2) not null,
  cause_name     VARCHAR2(50) not null
)
;
create table T_REVERSAL_STATUS
(
  reversal_status VARCHAR2(2) not null,
  status_name     VARCHAR2(50) not null
)
;
create table T_REVERSAL_TYPE
(
  reversal_type VARCHAR2(2) not null,
  type_name     VARCHAR2(50) not null
)
;
create table T_REVERSAL
(
  reversal_id     NUMBER(10) not null,
  policy_id       NUMBER(10),
  reversal_type   VARCHAR2(2) not null,
  reversal_cause  VARCHAR2(2) not null,
  apply_note      VARCHAR2(1000),
  handler_id      NUMBER(10),
  record_time     DATE,
  validate_time   DATE,
  finish_time     DATE,
  reversal_status VARCHAR2(2) default '0' not null,
  cancel_id       NUMBER(10),
  cancel_time     DATE,
  insert_time     DATE default SYSDATE not null,
  update_time     DATE default SYSDATE not null,
  apply_name      VARCHAR2(50),
  apply_biz_note  VARCHAR2(1000),
  case_id         NUMBER(10)
)
;
create table T_CLAIM_FEE
(
  fee_id             NUMBER(12) not null,
  case_id            NUMBER(10) not null,
  insured_id         NUMBER(10),
  fee_amount         NUMBER(14,2) not null,
  money_id           NUMBER(6) not null,
  fee_status         NUMBER(2) not null,
  fee_type           NUMBER(3) not null,
  pay_mode           NUMBER(2) not null,
  policy_id          NUMBER(10) not null,
  product_num        CHAR(3) not null,
  product_id         NUMBER(10) not null,
  head_id            VARCHAR2(40) not null,
  branch_id          VARCHAR2(40) not null,
  organ_id           VARCHAR2(40) not null,
  dept_id            VARCHAR2(20) not null,
  cashier_id         NUMBER(10),
  cashier_organ      VARCHAR2(40),
  cashier_dept       VARCHAR2(20),
  check_enter_time   DATE,
  finish_time        DATE,
  posted             CHAR(1) default 'N' not null,
  post_id            NUMBER(10),
  cred_id            NUMBER(10),
  insert_time        DATE default SYSDATE not null,
  bill_id            NUMBER(10),
  item_id            NUMBER(10) not null,
  policy_type        CHAR(1) not null,
  update_time        DATE default SYSDATE not null,
  liab_id            NUMBER(4),
  circ_audited       CHAR(1) default 'N' not null,
  reversal_id        NUMBER(10),
  inspect_id         NUMBER(10),
  change_id          NUMBER(10),
  inspect_pay_fee_id NUMBER(12),
  subtask_id         NUMBER(10)
)
;
create table T_UW_SOURCE_TYPE
(
  uw_source_type VARCHAR2(1) not null,
  type_name      VARCHAR2(30) not null
)
;
create table T_UW_STATUS
(
  uw_status   VARCHAR2(2) not null,
  status_name VARCHAR2(30) not null
)
;
create table T_RETURN_PREMIUM_CONCLUSION
(
  conclusion_id   CHAR(1) not null,
  conclusion_desc VARCHAR2(200)
)
;
create table T_UW_CANCEL_CAUSE
(
  cancel_code NUMBER(2) not null,
  cancel_desc VARCHAR2(30)
)
;
create table T_UW_PENDING
(
  pending_id VARCHAR2(2) not null,
  pend_cause VARCHAR2(50) not null
)
;
create table T_UW_POLICY
(
  underwrite_id         NUMBER(10) not null,
  uw_source_type        VARCHAR2(1) not null,
  uw_status             VARCHAR2(2) not null,
  policy_id             NUMBER(10) not null,
  policy_code           VARCHAR2(20),
  apply_code            VARCHAR2(20),
  dept_id               VARCHAR2(20) not null,
  service_id            NUMBER(10) not null,
  change_id             NUMBER(10),
  case_id               NUMBER(10),
  case_no               VARCHAR2(20),
  proposer_id           NUMBER(10) not null,
  propose_desc          VARCHAR2(1000),
  insert_time           DATE default SYSDATE not null,
  assumpsit             VARCHAR2(4000),
  applicant_id          NUMBER(10),
  job_cate_id           NUMBER(10),
  job_class_1           NUMBER(2),
  em_life               NUMBER(4),
  em_ill                NUMBER(4),
  organ_id              VARCHAR2(40) not null,
  uw_level              NUMBER(2),
  validate_date         DATE,
  end_date              DATE,
  discount_prem         NUMBER(12,2) default 0 not null,
  company_prem          NUMBER(12,2),
  employee_prem         NUMBER(12,2),
  period_prem           NUMBER(12,2) not null,
  underwrite_time       DATE,
  underwriter_id        NUMBER(10),
  apply_date            DATE not null,
  company_id            NUMBER(10),
  linkman               VARCHAR2(40),
  linkman_title         VARCHAR2(50),
  linkman_dept          VARCHAR2(40),
  link_celler           VARCHAR2(30),
  email                 VARCHAR2(50),
  fax                   VARCHAR2(30),
  link_notes            VARCHAR2(1000),
  uw_type               VARCHAR2(1) not null,
  campaign_code         VARCHAR2(10),
  agriculture_net       CHAR(1),
  prorate               CHAR(1),
  full_declare          CHAR(1) default 0 not null,
  uw_pending            VARCHAR2(2),
  cancel_cause          NUMBER(2),
  check_note            VARCHAR2(1000),
  uw_notes              VARCHAR2(4000),
  link_tel              VARCHAR2(30),
  agent_discount_rate   NUMBER(4,3) default 1 not null,
  hi_validate_date      DATE,
  hi_plan_id            NUMBER(10),
  hi_end_date           DATE,
  sin_emp_ins_amount    NUMBER(10),
  dou_emp_ins_amount    NUMBER(10),
  organ_uw_level        NUMBER(2),
  escalated_head_organ  CHAR(1) default 'N' not null,
  holder_emp_num        NUMBER(10),
  grp_busi_type         CHAR(1),
  conclusion_id         CHAR(1),
  claim_agree           CHAR(1),
  claim_reason          VARCHAR2(3000),
  detail_uw_source_type VARCHAR2(1),
  display_assumpsit     CHAR(1),
  input_validate_date   DATE,
  is_upload             CHAR(1),
  no_contains_country   VARCHAR2(4000)
)
;
create table T_CLAIM_HANDLE_PREM
(
  prem_id   NUMBER(10) not null,
  prem_desc VARCHAR2(255)
)
;
create table T_CLAIM_POLICY
(
  case_id           NUMBER(10) not null,
  policy_id         NUMBER(10) not null,
  liability_status  NUMBER(2) not null,
  end_date          DATE not null,
  claim_liab_status NUMBER(2) not null,
  claim_end_date    DATE not null,
  prem_status       NUMBER(2) not null,
  claim_prem_status NUMBER(2) not null,
  underwrite_id     NUMBER(10),
  insert_time       DATE default SYSDATE not null,
  update_time       DATE default SYSDATE not null,
  handle_prem       NUMBER(10),
  insured_id        NUMBER(10)
)
;
create table T_CLAIM_ADJUST
(
  fee_id      NUMBER(12) not null,
  case_id     NUMBER(10) not null,
  insured_id  NUMBER(10) not null,
  fee_amount  NUMBER(14,2) not null,
  money_id    NUMBER(6) not null,
  fee_type    NUMBER(3) not null,
  policy_id   NUMBER(10) not null,
  product_num CHAR(3),
  product_id  NUMBER(10),
  head_id     VARCHAR2(40) not null,
  branch_id   VARCHAR2(40) not null,
  organ_id    VARCHAR2(40) not null,
  dept_id     VARCHAR2(20) not null,
  insert_time DATE default SYSDATE not null,
  pay_fee     NUMBER(12),
  claim_fee   NUMBER(12),
  product_fee NUMBER(14),
  policy_fee  NUMBER(12),
  item_id     NUMBER(10),
  update_time DATE default SYSDATE not null
)
;
create table T_CLAIM_OPT_TYPE
(
  type_id   NUMBER(10) not null,
  type_name VARCHAR2(20) not null
)
;
create table T_CLAIM_RECTIFY_REASON
(
  reason_id   NUMBER(10) not null,
  reason_name VARCHAR2(200) not null
)
;
create table T_CLAIM_OPT_LOG
(
  log_id         NUMBER(10) not null,
  case_id        NUMBER(10),
  batch_id       NUMBER(10),
  opt_id         NUMBER(10) not null,
  type_id        NUMBER(10) not null,
  status_before  NUMBER(2) not null,
  status_after   NUMBER(2) not null,
  opt_desc       VARCHAR2(4000),
  insert_time    DATE default SYSDATE not null,
  rectify_reason NUMBER(10)
)
;
create table T_CLAIM_ADJUST_LOG
(
  log_id      NUMBER(10) not null,
  rectify_id  NUMBER(10) not null,
  fee_id      NUMBER(12) not null,
  case_id     NUMBER(10) not null,
  insured_id  NUMBER(10) not null,
  fee_amount  NUMBER(14,2) not null,
  money_id    NUMBER(6) not null,
  fee_type    NUMBER(3) not null,
  policy_id   NUMBER(10) not null,
  product_num CHAR(3),
  product_id  NUMBER(10),
  head_id     VARCHAR2(40) not null,
  branch_id   VARCHAR2(40) not null,
  organ_id    VARCHAR2(40) not null,
  dept_id     VARCHAR2(20) not null,
  insert_time DATE default SYSDATE not null,
  pay_fee     NUMBER(12),
  claim_fee   NUMBER(12),
  product_fee NUMBER(14),
  policy_fee  NUMBER(12),
  item_id     NUMBER(10),
  update_time DATE default SYSDATE not null
)
;
create table T_CLAIM_BACK_TYPE
(
  back_type NUMBER(1) not null,
  type_name VARCHAR2(200)
)
;
create table T_CLAIM_BACK_ENTRY
(
  list_id        NUMBER(10) not null,
  case_id        NUMBER(10),
  operator_id    NUMBER(10),
  back_type      NUMBER(1),
  back_cause     VARCHAR2(1000),
  insert_time    DATE,
  cause_category NUMBER(2)
)
;
create table T_CLAIM_BANK_ACCOUNT
(
  list_id            NUMBER(10) not null,
  policy_id          NUMBER(10),
  change_id          NUMBER(10),
  case_id            NUMBER(10),
  insured_id         NUMBER(10),
  bank_code          VARCHAR2(20) not null,
  bank_account       VARCHAR2(40) not null,
  acco_name          VARCHAR2(120),
  certi_type         NUMBER(2),
  certi_code         VARCHAR2(50),
  account_status     VARCHAR2(1) not null,
  suspend_cause      VARCHAR2(1),
  apply_date         DATE not null,
  operater_id        NUMBER(10) not null,
  insert_time        DATE default SYSDATE not null,
  ibg_code           VARCHAR2(30),
  send_id            NUMBER(10),
  is_basic           CHAR(1) default 'N' not null,
  account_type       CHAR(1) default '7' not null,
  cause_desc         VARCHAR2(1000),
  unsuccess_id       VARCHAR2(4),
  record_id          NUMBER(10),
  record_time        DATE,
  organ_id           VARCHAR2(40),
  transfer_name      VARCHAR2(100),
  prov_district_name VARCHAR2(50),
  city_district_name VARCHAR2(50),
  public_private     CHAR(1) default '1',
  true_sign          CHAR(1),
  update_time        DATE default SYSDATE
)
;
create table T_CLAIM_BANK_ACCOUNT_BAK
(
  list_id            NUMBER(10) not null,
  policy_id          NUMBER(10),
  change_id          NUMBER(10),
  case_id            NUMBER(10),
  insured_id         NUMBER(10),
  bank_code          VARCHAR2(20) not null,
  bank_account       VARCHAR2(40) not null,
  acco_name          VARCHAR2(100),
  certi_type         NUMBER(2),
  certi_code         VARCHAR2(50),
  account_status     VARCHAR2(1) not null,
  suspend_cause      VARCHAR2(1),
  apply_date         DATE not null,
  operater_id        NUMBER(10) not null,
  insert_time        DATE default SYSDATE not null,
  ibg_code           VARCHAR2(30),
  send_id            NUMBER(10),
  is_basic           CHAR(1) default 'N' not null,
  account_type       CHAR(1) default '7' not null,
  cause_desc         VARCHAR2(1000),
  unsuccess_id       VARCHAR2(4),
  record_id          NUMBER(10),
  record_time        DATE,
  organ_id           VARCHAR2(40),
  transfer_name      VARCHAR2(100),
  prov_district_name VARCHAR2(50),
  city_district_name VARCHAR2(50),
  public_private     CHAR(1) default '1'
)
;
create table T_CLAIM_BANK_ACCOUNT_LOG
(
  change_id          NUMBER(10) not null,
  list_id            NUMBER(10) not null,
  policy_id          NUMBER(10),
  old_new            CHAR(1) not null,
  case_id            NUMBER(10),
  insured_id         NUMBER(10),
  bank_code          VARCHAR2(20) not null,
  bank_account       VARCHAR2(40) not null,
  acco_name          VARCHAR2(100),
  certi_type         NUMBER(2),
  certi_code         VARCHAR2(50),
  account_status     VARCHAR2(1) not null,
  suspend_cause      VARCHAR2(1),
  apply_date         DATE not null,
  operater_id        NUMBER(10) not null,
  insert_time        DATE default SYSDATE not null,
  ibg_code           VARCHAR2(30),
  send_id            NUMBER(10),
  is_basic           CHAR(1) default 'N' not null,
  account_type       CHAR(1) default '7' not null,
  cause_desc         VARCHAR2(1000),
  unsuccess_id       VARCHAR2(4),
  record_id          NUMBER(10),
  record_time        DATE,
  organ_id           VARCHAR2(40),
  transfer_name      VARCHAR2(100),
  prov_district_name VARCHAR2(50),
  city_district_name VARCHAR2(50),
  public_private     CHAR(1) default '1'
)
;
create table T_CLAIM_BATCH_DIAG_INTF
(
  correlationid        VARCHAR2(36) not null,
  batchno              VARCHAR2(20) not null,
  id                   NUMBER(2) not null,
  accidentid           VARCHAR2(10) not null,
  medicaldiagnosistype VARCHAR2(4),
  surgerycode          VARCHAR2(10),
  surgerydiagnosistype VARCHAR2(4)
)
;
create table T_CLAIM_SOURCE
(
  source_id   NUMBER(5) not null,
  source_code VARCHAR2(10) not null,
  type_id     NUMBER(4),
  source_name VARCHAR2(100) not null,
  is_valid    CHAR(1) not null,
  operator    NUMBER(10),
  insert_time DATE default sysdate,
  update_time DATE default sysdate
)
;
create table T_CLAIM_BATCH_INTF
(
  correlationid      VARCHAR2(36) not null,
  batchno            VARCHAR2(20) not null,
  policycode         VARCHAR2(20) not null,
  organid            VARCHAR2(40) not null,
  deptid             VARCHAR2(20) not null,
  superorgan         VARCHAR2(40),
  claimsum           NUMBER(14,2) not null,
  applytype          CHAR(1) not null,
  applyname          VARCHAR2(150) not null,
  applytel           VARCHAR2(40),
  applytime          DATE not null,
  accepttime         DATE not null,
  accepterid         NUMBER(10) not null,
  registerconclusion CHAR(1) not null,
  noregistercause    VARCHAR2(2),
  subscribe          CHAR(1) not null,
  subscribeexplain   VARCHAR2(1000),
  subscribetime      DATE not null,
  subscriberid       NUMBER(10) not null,
  finishtime         DATE not null,
  accidenttype       VARCHAR2(2) not null,
  accidentid         VARCHAR2(10),
  casesource         NUMBER(5) not null,
  isupdate           CHAR(1) default 'N' not null,
  updatetime         DATE default SYSDATE not null
)
;
create table T_CLAIM_CASE_ASSIGN
(
  assign_log_id NUMBER(10),
  case_id       NUMBER(10) not null,
  assignee_id   NUMBER(10) not null,
  register_id   NUMBER(10) not null,
  assigner_id   NUMBER(10) not null,
  assign_time   DATE default SYSDATE not null
)
;
create table T_CLAIM_CASE_DEL
(
  case_id     NUMBER(10),
  delete_time DATE default SYSDATE not null
)
;
create table T_CLAIM_CASE_INTF
(
  correlationid      VARCHAR2(36) not null,
  batchno            VARCHAR2(20) not null,
  caseno             VARCHAR2(20) not null,
  insurednum         NUMBER(10) not null,
  realname           VARCHAR2(100) not null,
  gender             VARCHAR2(1) not null,
  birthday           DATE not null,
  certitype          VARCHAR2(2) not null,
  certicode          VARCHAR2(50) not null,
  telephone          VARCHAR2(30),
  email              VARCHAR2(100),
  accidenttime       DATE not null,
  accidentid         VARCHAR2(20),
  hospital           VARCHAR2(400),
  hospitalcode       VARCHAR2(20),
  accidentplace      VARCHAR2(600),
  diagnosiscount     NUMBER(4),
  claimsum           NUMBER(14,2) not null,
  registerconclusion CHAR(1) not null,
  noregistercause    VARCHAR2(2),
  audittime          DATE,
  auditorid          NUMBER(10),
  accidentareaid     VARCHAR2(10)
)
;
create table T_REPORT_STATUS
(
  report_status NUMBER(2) not null,
  status_desc   VARCHAR2(20) not null
)
;
create table T_REPORT_CASE
(
  case_id          NUMBER(10) not null,
  report_no        VARCHAR2(20) not null,
  report_status    NUMBER(2) not null,
  register_id      NUMBER(10),
  reporter_name    VARCHAR2(120) not null,
  relation_id      NUMBER(2),
  report_time      DATE not null,
  report_type      CHAR(1),
  link_name        VARCHAR2(120),
  link_tel         VARCHAR2(40),
  link_addr        VARCHAR2(150),
  link_zip         VARCHAR2(10),
  case_notes       VARCHAR2(1000),
  recorder_id      NUMBER(10) not null,
  claimer_name     VARCHAR2(120) not null,
  claimer_gender   CHAR(1),
  certi_type       NUMBER(2),
  certi_code       VARCHAR2(50),
  accident_status  VARCHAR2(2),
  accident_place   VARCHAR2(100),
  accident_time    DATE not null,
  accident_id      VARCHAR2(20),
  accident_desc    VARCHAR2(1000),
  hospital_code    VARCHAR2(20),
  hospital         VARCHAR2(400),
  start_date       DATE,
  end_date         DATE,
  cure_fee         NUMBER(10,2),
  death_date       DATE,
  accident_type    VARCHAR2(1),
  case_type        CHAR(1) default '0' not null,
  surgery_type     NUMBER(2) default 0 not null,
  risk_type        VARCHAR2(2),
  link_addr_2      VARCHAR2(100),
  link_addr_3      VARCHAR2(100),
  link_addr_4      VARCHAR2(100),
  insert_time      DATE default SYSDATE not null,
  update_time      DATE default SYSDATE not null,
  one_off_inform   CHAR(1),
  case_level       VARCHAR2(1),
  link_mobile      VARCHAR2(30),
  report_source    NUMBER(2),
  apply_certi_type NUMBER(2),
  apply_certi_code VARCHAR2(50),
  report_organ_id  VARCHAR2(40),
  version          NUMBER(19) default 0 not null
)
;
create table T_CLAIM_CASE_LEVEL_CHANGE
(
  list_id     NUMBER(10) not null,
  case_id     NUMBER(10) not null,
  change_from VARCHAR2(1) not null,
  change_to   VARCHAR2(1) not null,
  change_time DATE not null,
  operator_id NUMBER(10) not null
)
;
create table T_CLAIM_COOPERATE_POLICY_FB
(
  list_id      NUMBER(8) not null,
  appreport_id VARCHAR2(40) not null,
  policy_code  VARCHAR2(50),
  liab_cate    NUMBER(4)
)
;
create table T_CLAIM_DUE
(
  list_id     NUMBER(10) not null,
  case_id     NUMBER(10) not null,
  category_id NUMBER(2) not null,
  due_amount  NUMBER(18,6) not null,
  liab_code   VARCHAR2(5)
)
;
create table T_CLAIM_DUE_FB
(
  list_id      NUMBER(10) not null,
  appreport_id VARCHAR2(40) not null,
  category_id  NUMBER(2) not null,
  liab_code    VARCHAR2(5)
)
;
create table T_CLAIM_ESTIMATE
(
  estimate_id NUMBER(10),
  case_id     NUMBER(10),
  item_id     NUMBER(10),
  amount      NUMBER(14,2),
  amount1     NUMBER(14,2),
  amount2     NUMBER(14,2),
  amount3     NUMBER(14,2),
  recorder_id NUMBER(10),
  insert_time DATE,
  modify_id   NUMBER(10),
  update_time DATE,
  describe1   VARCHAR2(50),
  describe2   VARCHAR2(50),
  describe3   VARCHAR2(50),
  describe4   VARCHAR2(50)
)
;
create table T_CLAIM_FEE_DEL
(
  fee_id      NUMBER(12),
  delete_time DATE default SYSDATE not null
)
;
create table T_INSPECTION_TYPE
(
  inspection_type    VARCHAR2(10) not null,
  inspection_content VARCHAR2(100) not null,
  allow_edit         CHAR(1) not null,
  need_record        CHAR(1) not null,
  url                VARCHAR2(100)
)
;
create table T_CLAIM_INSPECTION
(
  inspection_id      NUMBER(10) not null,
  case_id            NUMBER(10),
  inspection_type    VARCHAR2(10) not null,
  inspection_content VARCHAR2(2000) not null,
  necessary          CHAR(1) not null,
  insured_id         NUMBER(10) not null,
  inspect_addr       VARCHAR2(100),
  locale             VARCHAR2(4000),
  witness            VARCHAR2(30),
  inspect_way        VARCHAR2(100),
  inspection_report  VARCHAR2(4000),
  conclusion         VARCHAR2(150),
  propose_time       DATE default SYSDATE,
  proposer_id        NUMBER(10),
  inspector_id       NUMBER(10),
  inspect_status     CHAR(1) not null,
  finish_time        DATE,
  physician          VARCHAR2(100),
  send_num           NUMBER(2) default 0 not null,
  send_time          DATE,
  insert_time        DATE default SYSDATE not null,
  update_time        DATE default SYSDATE not null
)
;
create table T_CLAIM_INSPECT_EXT
(
  inspect_id    NUMBER(10),
  policy_code   VARCHAR2(20),
  batch_no      VARCHAR2(20),
  case_no       VARCHAR2(20),
  accident_time DATE,
  claim_sum     NUMBER(14,2),
  customer_id   NUMBER(10),
  bill_id       NUMBER(10)
)
;
create table T_CLAIM_INSPECT_OPERATION
(
  opt_id     NUMBER(10) not null,
  inspect_id NUMBER(10) not null,
  old_status NUMBER(2),
  new_status NUMBER(2) not null,
  operator   NUMBER(10) not null,
  opt_time   DATE default sysdate not null,
  back_desc  VARCHAR2(4000)
)
;
create table T_PAY_AGREE
(
  agree_id    NUMBER(4) not null,
  agree_cause VARCHAR2(100)
)
;
create table T_REJECT_CATEGORY
(
  category_id   NUMBER(2) not null,
  category_name VARCHAR2(40)
)
;
create table T_PAY_REJECT
(
  reject_id    NUMBER(4) not null,
  reject_cause VARCHAR2(1000),
  category_id  NUMBER(2)
)
;
create table T_CLAIM_PAY_CHANGED_REASON
(
  reason_id   NUMBER(10) not null,
  reason_desc VARCHAR2(255)
)
;
create table T_CLAIM_PAY_EXTRA_REASON
(
  reason_id NUMBER(10) not null,
  name      VARCHAR2(255) not null
)
;
create table T_CLAIM_PRODUCT
(
  case_id                     NUMBER(10) not null,
  item_id                     NUMBER(10) not null,
  policy_id                   NUMBER(10) not null,
  product_id                  NUMBER(10) not null,
  product_num                 CHAR(3) not null,
  insured_id                  NUMBER(10) not null,
  apply_type                  CHAR(1),
  register_conclusion         CHAR(1),
  keep_valid                  CHAR(1) default 'Y',
  exempted                    CHAR(1) default 'N',
  audit_conclusion            CHAR(1),
  audit_according             VARCHAR2(3000),
  reject_cause                NUMBER(4),
  agree_cause                 NUMBER(4),
  claim_remark                VARCHAR2(1000),
  apply_sum                   NUMBER(14,2),
  exempt_sum                  NUMBER(14,2),
  ss_audit_sum                NUMBER(14,2),
  ss_pay_sum                  NUMBER(14,2),
  audit_sum                   NUMBER(14,2),
  accomm_cause                NUMBER(4),
  decision_id                 NUMBER(2),
  pay_sum                     NUMBER(14,2),
  noregister_cause            VARCHAR2(2),
  calcu_sum                   NUMBER(14,2),
  reject_desc                 VARCHAR2(1000),
  liability_status            NUMBER(2) not null,
  end_date                    DATE not null,
  claim_liab_status           NUMBER(2) not null,
  claim_end_date              DATE not null,
  prem_status                 NUMBER(2) not null,
  claim_prem_status           NUMBER(2) not null,
  except_value                NUMBER(10) not null,
  pay_rate                    NUMBER(4,3) not null,
  except_accu                 NUMBER(12,2) default 0 not null,
  customer_pay                NUMBER(12,2) default 0 not null,
  exempt_cnt                  NUMBER(4) default 0 not null,
  exempt_amt                  NUMBER(12,2) default 0 not null,
  return_premium              CHAR(1) default 'N' not null,
  return_amount               NUMBER(14,2) default 0 not null,
  ineligible_incur            NUMBER(12,2) default 0 not null,
  ineligible_pay              NUMBER(12,2) default 0 not null,
  additional_incur            NUMBER(12,2) default 0 not null,
  additional_pay              NUMBER(12,2) default 0 not null,
  mr_incur                    NUMBER(12,2) default 0 not null,
  mr_pay                      NUMBER(12,2) default 0 not null,
  deduction_incur             NUMBER(12,2) default 0 not null,
  deduction_pay               NUMBER(12,2) default 0 not null,
  insert_time                 DATE default SYSDATE not null,
  update_time                 DATE default SYSDATE not null,
  exempt_start                DATE,
  exempt_end                  DATE,
  surrender                   CHAR(1) default 'N' not null,
  liab_id                     NUMBER(4),
  diagnosis_count             NUMBER(4) default 0 not null,
  divide_amount               NUMBER(12,2),
  pay_info                    VARCHAR2(1000),
  discrepant_pay_explain      VARCHAR2(1000),
  sub_conclusion              CHAR(2),
  end_agreement_reason        CHAR(2),
  amount_changed_reason       NUMBER(10),
  preclaim                    CHAR(1) default 'N' not null,
  adjust_bonus                NUMBER(14,2),
  cash_bonus                  NUMBER(14,2),
  adjust_bonus_pay            NUMBER(14,2),
  cash_bonus_pay              NUMBER(14,2),
  pay_extra_reason            NUMBER(10),
  end_agreement_reason_detail VARCHAR2(1000),
  agree_cause_detail          VARCHAR2(1000),
  accomm_cause_detail         VARCHAR2(1000),
  pay_extra_reason_detail     VARCHAR2(1000),
  related_actual_pay          NUMBER(10),
  related_total               NUMBER(10),
  related_previous_pay        NUMBER(10),
  paid_prem                   NUMBER(14,2)
)
;
create table T_PAYEE_BENE_RELATION
(
  relation_id   NUMBER(2) not null,
  relation_name VARCHAR2(100)
)
;
create table T_PAY_MODE_REASON
(
  reason_id   NUMBER(2) not null,
  reason_desc VARCHAR2(300),
  pay_mode    NUMBER(2) not null
)
;
create table T_CLAIM_OBJECT
(
  claim_object VARCHAR2(1) not null,
  object_name  VARCHAR2(40) not null
)
;
create table T_CLAIM_PAY
(
  fee_id                         NUMBER(12) not null,
  case_id                        NUMBER(10) not null,
  insured_id                     NUMBER(10) not null,
  bene_id                        NUMBER(10),
  fee_amount                     NUMBER(14,2) not null,
  money_id                       NUMBER(6) not null,
  fee_status                     NUMBER(2) not null,
  pay_mode                       NUMBER(2) not null,
  policy_id                      NUMBER(10) not null,
  product_num                    CHAR(3),
  product_id                     NUMBER(10),
  head_id                        VARCHAR2(40) not null,
  branch_id                      VARCHAR2(40) not null,
  organ_id                       VARCHAR2(40) not null,
  dept_id                        VARCHAR2(20) not null,
  cashier_id                     NUMBER(10),
  cashier_organ                  VARCHAR2(40),
  cashier_dept                   VARCHAR2(20),
  check_enter_time               DATE,
  finish_time                    DATE,
  insert_time                    DATE default SYSDATE not null,
  company_id                     NUMBER(10),
  hospital_code                  VARCHAR2(20),
  claim_object                   VARCHAR2(1),
  bene_name                      VARCHAR2(120),
  bene_type                      CHAR(1),
  bene_order                     CHAR(1),
  certi_type                     NUMBER(2),
  certi_code                     VARCHAR2(50),
  bene_rate                      NUMBER(4,3),
  bank_code                      VARCHAR2(20),
  bank_account                   VARCHAR2(40),
  transfer_code                  VARCHAR2(20),
  address_1                      VARCHAR2(150),
  address_2                      VARCHAR2(100),
  address_3                      VARCHAR2(100),
  address_4                      VARCHAR2(100),
  zip                            VARCHAR2(10),
  instalment                     CHAR(1) default 'N' not null,
  item_id                        NUMBER(10),
  liab_id                        NUMBER(4),
  update_time                    DATE default SYSDATE not null,
  bene_mobile                    VARCHAR2(30),
  payee_bene_relation            NUMBER(2),
  payee_name                     VARCHAR2(120),
  payee_certi_type               NUMBER(2),
  payee_certi_code               VARCHAR2(50),
  payee_mobile                   VARCHAR2(30),
  payee_zip                      VARCHAR2(10),
  payee_address                  VARCHAR2(150),
  pay_mode_reason                NUMBER(2),
  pay_mode_other_reason          VARCHAR2(300),
  bene_tel                       VARCHAR2(40),
  payee_tel                      VARCHAR2(40),
  gender                         CHAR(1),
  nationality                    VARCHAR2(50),
  holder_relation                NUMBER(2),
  insured_relation               NUMBER(2),
  bene_nature                    NUMBER(2) default 1 not null,
  certi_start_date               DATE,
  certi_end_date                 DATE,
  job_code                       VARCHAR2(20),
  rela_address                   VARCHAR2(150),
  rela_zip                       VARCHAR2(10),
  company_bene_name              VARCHAR2(100),
  company_certi_type             CHAR(1),
  company_certi_code             VARCHAR2(80),
  company_busi_scope             VARCHAR2(80),
  company_address                VARCHAR2(150),
  company_zip                    VARCHAR2(10),
  company_certi_start_date       DATE,
  company_certi_end_date         DATE,
  payee_bailee_type              NUMBER(2),
  company_other_certi_type       VARCHAR2(80),
  payee_certi_start_date         DATE,
  payee_certi_end_date           DATE,
  payee_com_cert_start_date      DATE,
  payee_com_cert_end_date        DATE,
  payee_company_name             VARCHAR2(100),
  payee_company_certi_type       CHAR(1),
  payee_company_certi_code       VARCHAR2(80),
  payee_company_other_certi_type VARCHAR2(80),
  payee_name_1                   VARCHAR2(120),
  payee_certi_type_1             VARCHAR2(2),
  payee_certi_code_1             VARCHAR2(80),
  payee_certi_start_date_1       DATE,
  payee_certi_end_date_1         DATE,
  bene_email                     VARCHAR2(100),
  payee_email                    VARCHAR2(100),
  bene_resident_type             NUMBER(2)
)
;
create table T_CLAIM_INSTALMENT
(
  instalment_id NUMBER(12) not null,
  claim_fee_id  NUMBER(12) not null,
  pay_due_date  DATE not null,
  pay_num       NUMBER(6) not null,
  fee_amount    NUMBER(14,2) not null
)
;
create table T_CLAIM_INSTALMENT_LOG
(
  log_id        NUMBER(10) not null,
  rectify_id    NUMBER(10) not null,
  instalment_id NUMBER(12) not null,
  claim_fee_id  NUMBER(12) not null,
  pay_due_date  DATE not null,
  pay_num       NUMBER(6) not null,
  fee_amount    NUMBER(14,2) not null
)
;
create table T_CLAIM_LIAB_LIMIT
(
  organ_id          VARCHAR2(40) not null,
  level_id          NUMBER(4) not null,
  liab_category     NUMBER(2) not null,
  max_amount        NUMBER(10) not null,
  max_rejected_rate NUMBER(7,6) default 0 not null,
  max_empty_rate    NUMBER(7,6) default 0 not null
)
;
create table T_CLAIM_LIMIT
(
  organ_id         VARCHAR2(40) not null,
  level_id         NUMBER(4) not null,
  liab_category    NUMBER(2) not null,
  audit_conclusion CHAR(1) not null,
  max_amount       NUMBER(10) not null
)
;
create table T_CLAIM_MAIL_CONFIG
(
  organ_id     VARCHAR2(40) not null,
  claim_amount NUMBER(14,2),
  claim_mail_1 VARCHAR2(100),
  claim_mail_2 VARCHAR2(100),
  claim_mail_3 VARCHAR2(100),
  claim_mail_4 VARCHAR2(100),
  claim_mail_5 VARCHAR2(100),
  claim_mail_6 VARCHAR2(100)
)
;
create table T_CLAIM_OLD_NEW_RELATION
(
  old_fee_id NUMBER(12) not null,
  new_fee_id NUMBER(12) not null,
  vat_rate   NUMBER(5,4)
)
;
create table T_CLAIM_ORDER_FB
(
  policy_id     NUMBER(10),
  apply_code    VARCHAR2(20) not null,
  sub_item_no   VARCHAR2(50),
  sub_item_name VARCHAR2(100),
  claim_order   VARCHAR2(3)
)
;
create table T_CLAIM_PAYMENT
(
  payment_id  NUMBER(10) not null,
  bill_no     VARCHAR2(40) not null,
  bill_type   NUMBER(2) default 1 not null,
  bill_status NUMBER(2) default 1 not null,
  case_id     NUMBER(10),
  batch_id    NUMBER(10),
  print_num   NUMBER(2) default 0,
  print_date  DATE,
  print_id    NUMBER(10),
  insert_time DATE default SYSDATE not null
)
;

create table T_CLAIM_PAYMENT_DETAIL
(
  detail_id  NUMBER(10) not null,
  payment_id NUMBER(10) not null,
  pay_amount NUMBER(16,6) not null,
  policy_id  NUMBER(10)
)
;
create table T_CLAIM_PAY_DEL
(
  fee_id      NUMBER(12),
  case_id     NUMBER(10),
  delete_time DATE default SYSDATE not null
)
;
create table T_CLAIM_PAY_INTF
(
  correlationid     VARCHAR2(36) not null,
  caseno            VARCHAR2(20) not null,
  payeebenerelation NUMBER(2) not null,
  paymode           NUMBER(2) not null,
  payeename         VARCHAR2(150),
  bankcode          VARCHAR2(20),
  bankacount        VARCHAR2(40),
  acconame          VARCHAR2(150),
  certitype         NUMBER(2),
  certicode         VARCHAR2(50),
  feeamount         NUMBER(14,2) not null
)
;
create table T_CLAIM_PAY_LIMIT
(
  policy_id    NUMBER(10) not null,
  insured_num  NUMBER(10) not null,
  item_id      NUMBER(10),
  account_code VARCHAR2(20) not null,
  pay_limit    NUMBER(16,6) not null
)
;
create table T_CLAIM_PAY_LOG
(
  log_id                NUMBER(10) not null,
  rectify_id            NUMBER(10) not null,
  fee_id                NUMBER(12) not null,
  case_id               NUMBER(10) not null,
  insured_id            NUMBER(10) not null,
  bene_id               NUMBER(10),
  fee_amount            NUMBER(14,2) not null,
  money_id              NUMBER(1) not null,
  fee_status            NUMBER(2) not null,
  pay_mode              NUMBER(2) not null,
  policy_id             NUMBER(10) not null,
  product_num           CHAR(3),
  product_id            NUMBER(10),
  head_id               VARCHAR2(40) not null,
  branch_id             VARCHAR2(40) not null,
  organ_id              VARCHAR2(40) not null,
  dept_id               VARCHAR2(20) not null,
  cashier_id            NUMBER(10),
  cashier_organ         VARCHAR2(40),
  cashier_dept          VARCHAR2(20),
  check_enter_time      DATE,
  finish_time           DATE,
  insert_time           DATE default SYSDATE not null,
  company_id            NUMBER(10),
  hospital_code         VARCHAR2(20),
  claim_object          VARCHAR2(1),
  bene_name             VARCHAR2(120),
  bene_type             CHAR(1),
  bene_order            CHAR(1),
  certi_type            NUMBER(2),
  certi_code            VARCHAR2(50),
  bene_rate             NUMBER(4,3),
  bank_code             VARCHAR2(20),
  bank_account          VARCHAR2(40),
  transfer_code         VARCHAR2(20),
  address_1             VARCHAR2(150),
  address_2             VARCHAR2(100),
  address_3             VARCHAR2(100),
  address_4             VARCHAR2(100),
  zip                   VARCHAR2(10),
  instalment            CHAR(1) default 'N' not null,
  item_id               NUMBER(10),
  liab_id               NUMBER(4),
  update_time           DATE default SYSDATE not null,
  bene_mobile           VARCHAR2(30),
  payee_bene_relation   NUMBER(2),
  payee_name            VARCHAR2(150),
  payee_certi_code      VARCHAR2(50),
  payee_mobile          VARCHAR2(30),
  payee_zip             VARCHAR2(10),
  payee_address         VARCHAR2(150),
  pay_mode_reason       NUMBER(2),
  pay_mode_other_reason VARCHAR2(300),
  payee_certi_type      NUMBER(2),
  bene_tel              VARCHAR2(40),
  payee_tel             VARCHAR2(40)
)
;
create table T_CLAIM_POLICY_ADVANCE
(
  advance_id NUMBER(12) not null,
  policy_id  NUMBER(10) not null,
  fee_amount NUMBER(14,2) not null,
  case_id    NUMBER(10) not null,
  money_id   NUMBER(6) not null
)
;
create table T_CLAIM_POLICY_DEL
(
  policy_id   NUMBER(10),
  case_id     NUMBER(10),
  delete_time DATE default SYSDATE not null
)
;
create table T_CLAIM_POLICY_LIMIT
(
  organ_id         VARCHAR2(40) not null,
  level_id         NUMBER(4) not null,
  audit_conclusion CHAR(1) not null,
  max_amount       NUMBER(10) not null
)
;
create table T_CLAIM_POLICY_LOG
(
  log_id            NUMBER(10) not null,
  rectify_id        NUMBER(10) not null,
  case_id           NUMBER(10) not null,
  policy_id         NUMBER(10) not null,
  liability_status  NUMBER(2) not null,
  end_date          DATE not null,
  claim_liab_status NUMBER(2) not null,
  claim_end_date    DATE not null,
  prem_status       NUMBER(2) not null,
  claim_prem_status NUMBER(2) not null,
  underwrite_id     NUMBER(10),
  insert_time       DATE default SYSDATE not null,
  update_time       DATE default SYSDATE not null,
  handle_prem       NUMBER(10)
)
;
create table T_CLAIM_POLICY_SEPARATE
(
  policy_id            NUMBER(10) not null,
  case_id              NUMBER(10) not null,
  item_id              NUMBER(10) not null,
  liab_id              NUMBER(4) not null,
  disease_code         NUMBER(20) not null,
  disease_detail       VARCHAR2(250),
  separate_value       NUMBER(14,2) not null,
  related_actual_pay   NUMBER(5),
  related_total        NUMBER(5),
  related_previous_pay NUMBER(5)
)
;
create table T_CLAIM_PRODUCT_DEL
(
  item_id     NUMBER(10),
  case_id     NUMBER(10),
  delete_time DATE default SYSDATE not null
)
;
create table T_CLAIM_PRODUCT_INTF
(
  correlationid      VARCHAR2(36) not null,
  caseno             VARCHAR2(20) not null,
  policycode         VARCHAR2(20) not null,
  productid          NUMBER(10) not null,
  keepvalid          CHAR(1) not null,
  registerconclusion CHAR(1) not null,
  noregistercause    VARCHAR2(2),
  auditconclusion    CHAR(1) not null,
  auditaccording     VARCHAR2(3000),
  applysum           NUMBER(14,2) not null,
  paysum             NUMBER(14,2) not null,
  calcusum           NUMBER(14,2) not null
)
;
create table T_CLAIM_PRODUCT_LOG
(
  log_id              NUMBER(10) not null,
  rectify_id          NUMBER(10) not null,
  case_id             NUMBER(10) not null,
  item_id             NUMBER(10) not null,
  policy_id           NUMBER(10) not null,
  product_id          NUMBER(10) not null,
  product_num         CHAR(3) not null,
  insured_id          NUMBER(10) not null,
  apply_type          CHAR(1),
  register_conclusion CHAR(1),
  keep_valid          CHAR(1) default 'Y',
  audit_conclusion    CHAR(1),
  audit_sum           NUMBER(14,2),
  pay_sum             NUMBER(14,2),
  liability_status    NUMBER(2) not null,
  end_date            DATE not null,
  claim_liab_status   NUMBER(2) not null,
  claim_end_date      DATE not null,
  prem_status         NUMBER(2) not null,
  claim_prem_status   NUMBER(2) not null,
  insert_time         DATE default SYSDATE not null
)
;
create table T_CLAIM_REPORT
(
  report_id        NUMBER(10) not null,
  case_id          NUMBER(10) not null,
  reporter_id      NUMBER(10) not null,
  report_time      DATE not null,
  super_organ      VARCHAR2(40) not null,
  report_content   VARCHAR2(1000) not null,
  forsee_amount    NUMBER(14,2),
  confirmed        CHAR(1) not null,
  superior_id      NUMBER(10),
  superior_opinion VARCHAR2(1000),
  confirm_time     DATE,
  reporter_organ   VARCHAR2(40) not null,
  insert_time      DATE default SYSDATE not null,
  update_time      DATE default SYSDATE not null
)
;
create table T_CLAIM_SOURCE_TYPE
(
  type_id     NUMBER(4) not null,
  type_name   VARCHAR2(50) not null,
  policy_auth CHAR(1) default 'N' not null,
  insert_time DATE default sysdate not null
)
;
create table T_CLAIM_SUBSCRIBE_LOG
(
  id                NUMBER(10) not null,
  case_id           NUMBER(10),
  subscribe         CHAR(1) not null,
  subscribe_explain VARCHAR2(1500),
  subscribe_time    DATE not null,
  subscriber_id     NUMBER(10) not null,
  batch_id          NUMBER(10)
)
;
create table T_CLAIM_SUBSCRIBE_REPORT
(
  log_id             NUMBER(10) not null,
  case_id            NUMBER(10) not null,
  oprater_id         NUMBER(10) not null,
  oprater_organ_id   NUMBER(10) not null,
  insert_time        DATE default SYSDATE,
  log_note           VARCHAR2(4000),
  head_company_level NUMBER(4)
)
;
create table T_CLAIM_TRANSFER
(
  list_id             NUMBER(10) not null,
  batch_id            NUMBER(10),
  case_id             NUMBER(10),
  change_id           NUMBER(10) not null,
  amount_account_indi CHAR(2) not null,
  out_account_code    VARCHAR2(20),
  change_amount       NUMBER(18,6) not null,
  change_type         NUMBER(2) not null,
  out_item_id         NUMBER(10),
  out_group_item_id   NUMBER(10),
  in_item_id          NUMBER(10),
  in_account_code     VARCHAR2(20),
  reverse_indi        CHAR(2) default 'N' not null,
  insert_time         DATE default sysdate not null,
  update_time         DATE default sysdate not null,
  out_acc_settle_date DATE
)
;
create table T_CLAIM_TYPE_LIAB
(
  claim_type    VARCHAR2(1) not null,
  liab_category NUMBER(2) not null,
  organ_id      VARCHAR2(40),
  head_id       VARCHAR2(40)
)
;
create table T_QUERY_LEVEL
(
  level_id   NUMBER(10) not null,
  level_desc VARCHAR2(50)
)
;
create table T_CLASS_QUERY_LEVEL
(
  organ_id    VARCHAR2(40) not null,
  class_id    NUMBER(1) not null,
  level_id    NUMBER(10) not null,
  insert_id   NUMBER(10) not null,
  update_id   NUMBER(10),
  insert_time DATE not null,
  update_time DATE
)
;
create table T_CLAUSE_TBL
(
  clause_id   NUMBER(4) not null,
  clause_desc VARCHAR2(120) not null
)
;
create table T_CLIENT_MACHINE
(
  client_id          NUMBER(10) not null,
  client_name        VARCHAR2(255) not null,
  client_password    VARCHAR2(255) not null,
  client_description VARCHAR2(400)
)
;
create table T_PROGRAM_TYPE
(
  program_type NUMBER(2) not null,
  type_name    VARCHAR2(255) not null
)
;
create table T_INTERFACE
(
  interface_id          NUMBER(10) not null,
  alias_name            VARCHAR2(255) not null,
  interface_name        VARCHAR2(255) not null,
  interface_description VARCHAR2(4000),
  program_name          VARCHAR2(1024) not null,
  program_type          NUMBER(2) not null,
  check_duplicate       CHAR(1) not null,
  need_log              CHAR(1) not null
)
;
create table T_CLIENT_AUTH
(
  client_id    NUMBER(10) not null,
  interface_id NUMBER(10) not null,
  insert_time  DATE default SYSDATE not null,
  update_time  DATE default SYSDATE not null,
  enable       CHAR(1) default 'Y' not null
)
;
create table T_CODE
(
  table_name           VARCHAR2(40) not null,
  table_desc           VARCHAR2(100) not null,
  need_cache           VARCHAR2(1) not null,
  cache_refresh_second NUMBER(10) not null,
  id_column            VARCHAR2(50) not null,
  id_column_type       VARCHAR2(1) not null,
  desc_column          VARCHAR2(50) not null,
  multi_lang           CHAR(1) default 'Y' not null,
  order_column         VARCHAR2(50),
  code_column          VARCHAR2(50),
  need_conv            CHAR(1) default ('N') not null,
  not_exist_msg_id     VARCHAR2(90) default 'MSG_10443' not null
)
;
create table T_COLLECT_PAY
(
  collect_pay CHAR(1) not null,
  type_name   VARCHAR2(20) not null
)
;
create table T_COMBO_TYPE
(
  combo_type VARCHAR2(10) not null,
  type_name  VARCHAR2(40)
)
;
create table T_COMBO_PRODUCT
(
  combo_type      VARCHAR2(10) not null,
  product_id      NUMBER(7) not null,
  charge_period   CHAR(1) not null,
  charge_year     NUMBER(3),
  coverage_period CHAR(1) not null,
  coverage_year   NUMBER(5),
  charge_type     CHAR(1) not null,
  amount          NUMBER(14,2) default (9999999999) not null,
  fee_amount      NUMBER(14,2) default (9999999999) not null
)
;
create table T_COMMISION
(
  product_id        NUMBER(7) not null,
  premium_year      NUMBER(3) default 0 not null,
  period            NUMBER(4) default 0 not null,
  age               NUMBER(3) default 999 not null,
  year              NUMBER(3) default 999 not null,
  start_date        DATE default to_date('2001-01-01','yyyy-mm-dd') not null,
  end_date          DATE default to_date('2050-01-01','yyyy-mm-dd') not null,
  commision_rate    NUMBER(5,4),
  agent_cate        VARCHAR2(1) not null,
  organ_id          VARCHAR2(40) default '0' not null,
  branch_bank       VARCHAR2(20) default '0' not null,
  commision_type_id NUMBER(5) not null,
  derivation        CHAR(1) default '0' not null,
  fee_type          NUMBER(3) default 0 not null,
  calc_type         CHAR(1) default '1' not null,
  commision_months  NUMBER(5,2),
  channel_type      CHAR(1) default '1',
  total_exite_rate  NUMBER(5,4) default 0,
  prem_start        NUMBER(14,4) default 0 not null,
  prem_end          NUMBER(14,4) default 9999999999.9999 not null
)
;
create table T_COMMISION_FEE_TYPE
(
  type_id        NUMBER(3) not null,
  type_name      VARCHAR2(40) not null,
  account_type   CHAR(1) not null,
  commision_type VARCHAR2(3)
)
;
create table T_COMMISION_CASH_BANK
(
  config_id    NUMBER(10) not null,
  organ_id     VARCHAR2(40) not null,
  dept_id      VARCHAR2(40),
  fee_type     NUMBER(3),
  pay_mode     NUMBER(2),
  cash_bank    VARCHAR2(40),
  cash_account VARCHAR2(40),
  special_id   NUMBER(3) default 0,
  is_gather    CHAR(1) default 'W',
  use_by_child CHAR(1) default 'N' not null
)
;
create table T_COMMISION_CATE
(
  cate_id   NUMBER(2) not null,
  cate_name VARCHAR2(30)
)
;
create table T_COMMISION_DETAIL
(
  commision_detail_id NUMBER(12) not null,
  policy_id           NUMBER(10),
  agent_id            NUMBER(10),
  product_id          NUMBER(10),
  charge_period       VARCHAR2(1),
  charge_year         NUMBER(3),
  coverage_period     CHAR(1),
  coverage_year       NUMBER(5),
  year                NUMBER(3),
  grade_id            VARCHAR2(3),
  accept_date         DATE,
  normal_prem         NUMBER(10,2),
  commision_rate      NUMBER(3,2),
  discount_rate       NUMBER(8,6),
  commision           NUMBER(10,2),
  commision_id        NUMBER(12)
)
;

create table T_COMMISION_EXCITE_RATE
(
  excite_rate_id  NUMBER(10) not null,
  organ_id        VARCHAR2(40) not null,
  product_id      NUMBER(7) not null,
  premium_year    NUMBER(3),
  excite_rate     NUMBER(5,4),
  excite_rate_min NUMBER(5,4),
  excite_rate_max NUMBER(5,4)
)
;
create table T_COMMISION_FEE
(
  fee_id           NUMBER(12) not null,
  head_id          VARCHAR2(40) not null,
  branch_id        VARCHAR2(40) not null,
  organ_id         VARCHAR2(40) not null,
  dept_id          VARCHAR2(20) not null,
  agent_id         NUMBER(10) not null,
  policy_type      CHAR(1) not null,
  policy_id        NUMBER(10),
  product_num      CHAR(3),
  product_id       NUMBER(7),
  charge_type      CHAR(1),
  policy_year      NUMBER(2),
  policy_period    NUMBER(4),
  fee_amount       NUMBER(12,2) not null,
  money_id         NUMBER(6) not null,
  fee_type         NUMBER(3) not null,
  fee_status       NUMBER(2) not null,
  pay_mode         NUMBER(2) not null,
  insert_time      DATE default SYSDATE not null,
  update_time      DATE default SYSDATE not null,
  finish_time      DATE,
  cancel_date      DATE,
  finish_id        NUMBER(10),
  cancel_id        NUMBER(10),
  posted           CHAR(1) default 'N' not null,
  post_id          NUMBER(10),
  cred_id          NUMBER(10),
  related_id       NUMBER(12),
  aggregation_id   NUMBER(10),
  agency_code      VARCHAR2(20),
  cashier_id       NUMBER(10),
  cash_bank        VARCHAR2(20),
  cash_account     VARCHAR2(40),
  payee_name       VARCHAR2(150),
  payee_certi_type NUMBER(2),
  payee_certi_code VARCHAR2(50),
  normal_prem      NUMBER(10,2),
  commision_rate   NUMBER(3,2),
  is_correct       CHAR(1) default 'N',
  agent_code       VARCHAR2(25),
  sequence_id      NUMBER(12),
  fee_year_month   VARCHAR2(10),
  cheque_code      VARCHAR2(50),
  draw_code        VARCHAR2(50),
  reversal_id      NUMBER(10),
  batch_no         VARCHAR2(19),
  audit_status     NUMBER(2),
  entry_code       VARCHAR2(30),
  send_id          NUMBER(10)
)
;
create table T_COMMISSION_PLAN
(
  item_id        NUMBER(10) not null,
  derivation     CHAR(1) not null,
  policy_year    NUMBER(2) not null,
  commision_rate NUMBER(5,4) not null,
  policy_id      NUMBER(10) not null,
  product_num    CHAR(3) not null,
  product_id     NUMBER(10) not null
)
;
create table T_COMMON_CUST_STATE
(
  biz_cust_id   NUMBER(20) not null,
  biz_cust_type NUMBER(2) not null,
  resident_type NUMBER(2) not null,
  policy_id     NUMBER(10)
)
;
create table T_COMMUT_TYPE
(
  type_code VARCHAR2(1) not null,
  type_name VARCHAR2(30) not null
)
;
create table T_COMMU_AWARD
(
  b_technical_post VARCHAR2(3) not null,
  grade_id         NUMBER(2) not null,
  money            NUMBER(10,2)
)
;
create table T_COMM_CALCU_DATE_CHANGE
(
  record_id            NUMBER(10) not null,
  current_month        VARCHAR2(2) not null,
  organ_id             VARCHAR2(40) not null,
  acknowledge_day      VARCHAR2(10),
  calculate_day        VARCHAR2(10),
  scan_day             VARCHAR2(10),
  end_day              VARCHAR2(10),
  operate_type         CHAR(1),
  operator_id          NUMBER(10),
  operate_time         DATE default sysdate,
  acknowledge_scan_day VARCHAR2(10)
)
;
create table T_COMM_CALCU_DATE_CONFIG
(
  config_id            NUMBER(10) not null,
  current_month        VARCHAR2(2) not null,
  organ_id             VARCHAR2(40) not null,
  acknowledge_day      VARCHAR2(10),
  calculate_day        VARCHAR2(10),
  scan_day             VARCHAR2(10),
  end_day              VARCHAR2(10),
  acknowledge_scan_day VARCHAR2(10)
)
;
create table T_COMM_CONF
(
  conf_id                 NUMBER(10) not null,
  commision_type_id       NUMBER(5),
  area_type               NUMBER(10) default 0 not null,
  agent_cate              VARCHAR2(1) not null,
  grade_id                VARCHAR2(3) default '0' not null,
  position_id             NUMBER(2) default 0 not null,
  months_start            NUMBER(4) default 0 not null,
  months_end              NUMBER(4) default 9999 not null,
  amount_start            NUMBER(14,4) default 0 not null,
  amount_end              NUMBER(14,4) default 9999999999.9999 not null,
  amount                  NUMBER(12,2),
  rate                    NUMBER(5,4),
  grade                   VARCHAR2(4),
  organ_id                VARCHAR2(40),
  policy_amount_start     NUMBER(7,2) default 0,
  policy_amount_end       NUMBER(7,2) default 9999.99,
  attendance_rate_start   NUMBER(3,2) default 0,
  attendance_rate_end     NUMBER(3,2) default 9.99,
  renew_rate_start        NUMBER(3,2) default 0,
  renew_rate_end          NUMBER(3,2) default 9.99,
  assess_time_start       NUMBER(1) default 0,
  assess_time_end         NUMBER(1) default 9,
  organ_business_grade_id NUMBER(10)
)
;
create table T_COMM_CONF_NEW
(
  conf_id                 NUMBER(10) not null,
  commision_type_id       NUMBER(5),
  area_type               NUMBER(10) default 0 not null,
  agent_cate              VARCHAR2(1) not null,
  grade_id                VARCHAR2(3) default '0' not null,
  position_id             NUMBER(2) default 0 not null,
  months_start            NUMBER(4) default 0 not null,
  months_end              NUMBER(4) default 9999 not null,
  amount_start            NUMBER(14,4) default 0 not null,
  amount_end              NUMBER(14,4) default 9999999999.9999 not null,
  amount                  NUMBER(12,2),
  rate                    NUMBER(5,4),
  grade                   VARCHAR2(4),
  organ_id                VARCHAR2(40),
  policy_amount_start     NUMBER(7,2) default 0,
  policy_amount_end       NUMBER(7,2) default 9999.99,
  attendance_rate_start   NUMBER(3,2) default 0,
  attendance_rate_end     NUMBER(3,2) default 9.99,
  renew_rate_start        NUMBER(3,2) default 0,
  renew_rate_end          NUMBER(3,2) default 9.99,
  assess_time_start       NUMBER(1) default 0,
  assess_time_end         NUMBER(1) default 9,
  organ_business_grade_id NUMBER(10)
)
;
create table T_COMM_ISSUE_MODE
(
  issue_mode NUMBER(2) not null,
  issue_name VARCHAR2(100) not null
)
;
create table T_COMM_RATE
(
  plan_code   VARCHAR2(10) not null,
  pol_yr      NUMBER(4) default 0 not null,
  region_code VARCHAR2(10) not null,
  agent_type  VARCHAR2(1) not null,
  agent_rank  VARCHAR2(2) not null,
  comm_rate   NUMBER(5,4) default 0 not null,
  start_date  DATE not null,
  end_date    DATE,
  fcu         VARCHAR2(10) not null,
  fcd         DATE not null,
  lcu         VARCHAR2(10) not null,
  lcd         DATE not null
)
;
create table T_COMM_SUSPEND_TYPE
(
  cause_id   NUMBER(2) not null,
  cause_name VARCHAR2(100) not null
)
;
create table T_COMM_TAX
(
  tax_type NUMBER(3) not null,
  tax_name VARCHAR2(30) not null
)
;
create table T_COMM_TAX_CONF
(
  organ_id                  VARCHAR2(40) not null,
  sales_tax_start           NUMBER(14,4),
  sales_tax_rate            NUMBER(5,4),
  sales_tax_add_rate        NUMBER(5,4),
  sales_cost_deduct_rate    NUMBER(5,4),
  fee_deduct_rate           NUMBER(5,4),
  fee_deduct_amount         NUMBER(14,4),
  personal_income_tax_rate1 NUMBER(5,4),
  fast_deduct_amount1       NUMBER(14,4),
  personal_income_tax_rate2 NUMBER(5,4),
  fast_deduct_amount2       NUMBER(14,4),
  personal_income_tax_rate3 NUMBER(5,4),
  fast_deduct_amount3       NUMBER(14,4),
  operator_id               NUMBER(10),
  insert_time               DATE,
  update_time               DATE
)
;
create table T_COMM_TAX_RATE
(
  list_id      NUMBER(10) not null,
  agent_cate   VARCHAR2(1) not null,
  organ_id     VARCHAR2(40) not null,
  tax_type     NUMBER(3) not null,
  start_amount NUMBER(10,2) not null,
  end_amount   NUMBER(10,2) not null,
  rapid_before NUMBER(10,2) not null,
  rate         NUMBER(5,4) not null,
  rapid_amount NUMBER(10,2) not null
)
;
create table T_COMPANY
(
  parent_id      CHAR(8),
  company_id     CHAR(8) not null,
  company_name   VARCHAR2(100),
  zip            CHAR(6),
  address        VARCHAR2(50),
  province_id    VARCHAR2(2),
  area_code      VARCHAR2(5),
  telephone      VARCHAR2(30),
  fax            VARCHAR2(9),
  email          VARCHAR2(50),
  homepage       VARCHAR2(50),
  category       VARCHAR2(10),
  description    VARCHAR2(4000),
  found_date     DATE,
  contact        VARCHAR2(10),
  register_date  DATE,
  login_count    NUMBER(8),
  class_id       CHAR(1),
  capital        VARCHAR2(10),
  tele_plaint    VARCHAR2(30),
  tele_life      VARCHAR2(30),
  tele_car       VARCHAR2(30),
  tele_property  VARCHAR2(30),
  tele_water     VARCHAR2(30),
  tele_special   VARCHAR2(30),
  tele_service   VARCHAR2(30),
  service_tenet  VARCHAR2(400),
  promise        VARCHAR2(400),
  province_grade CHAR(2),
  abbr_name      VARCHAR2(50),
  url            VARCHAR2(100),
  url_homepro    VARCHAR2(100),
  coop_home      CHAR(1) default 'n',
  bottom_fee     NUMBER(10,2) default 0,
  ally           VARCHAR2(10) default 'n',
  logo1_id       NUMBER(10) default 0,
  logo2_id       NUMBER(10) default 0,
  job_cate_id    NUMBER(7)
)
;
create table T_COMPANY_ACCOUNTS
(
  book_id   NUMBER(10) not null,
  accounts  VARCHAR2(20) not null,
  bank_code VARCHAR2(20) not null
)
;
create table T_COMPANY_CUSTOMER_DEL
(
  company_id  NUMBER(10),
  delete_time DATE default SYSDATE not null
)
;
create table T_COMPANY_CUSTOMER_EXT
(
  company_id NUMBER(10) not null,
  id_type    CHAR(1) not null,
  id_no      VARCHAR2(80)
)
;
create table T_COMPANY_CUSTOMER_EXT_LOG
(
  change_id  NUMBER(10) not null,
  company_id NUMBER(10) not null,
  id_type    CHAR(1) not null,
  id_no      VARCHAR2(80),
  old_new    CHAR(1) not null
)
;
create table T_COMPANY_CUSTOMER_INFO
(
  company_id                     NUMBER(10) not null,
  group_policy_id                NUMBER(10) not null,
  company_name                   VARCHAR2(240),
  company_address                VARCHAR2(100),
  business_scope                 VARCHAR2(150),
  business_license_no            VARCHAR2(20),
  business_license_period_begin  DATE,
  business_license_period_end    DATE,
  organ_code                     VARCHAR2(20),
  organ_period_begin             DATE,
  organ_period_end               DATE,
  tax_code                       VARCHAR2(20),
  tax_period_begin               DATE,
  tax_period_end                 DATE,
  other_certi_no1                VARCHAR2(20),
  other_certi_period_begin1      DATE,
  other_certi_period_end1        DATE,
  other_certi_no2                VARCHAR2(20),
  other_certi_period_begin2      DATE,
  other_certi_period_end2        DATE,
  other_certi_no3                VARCHAR2(20),
  other_certi_period_begin3      DATE,
  other_certi_period_end3        DATE,
  leader_name                    VARCHAR2(50),
  leader_dept                    VARCHAR2(150),
  leader_post                    VARCHAR2(150),
  leader_certi_no                VARCHAR2(20),
  leader_certi_period_begin      DATE,
  leader_certi_period_end        DATE,
  agent_name                     VARCHAR2(50),
  agent_dept                     VARCHAR2(150),
  agent_post                     VARCHAR2(150),
  agent_certi_type               NUMBER(2),
  agent_certi_no                 VARCHAR2(20),
  agent_certi_period_begin       DATE,
  agent_certi_period_end         DATE,
  agent_tel                      VARCHAR2(30),
  agent_email                    VARCHAR2(50),
  notes                          VARCHAR2(4000),
  insert_time                    DATE not null,
  leader_certi_type              NUMBER(2),
  actual_name                    VARCHAR2(50),
  actual_certi_type              NUMBER(2),
  actual_certi_no                VARCHAR2(20),
  actual_certi_period_begin      DATE,
  actual_certi_period_end        DATE,
  responsible_name               VARCHAR2(50),
  responsible_certi_type         NUMBER(2),
  responsible_certi_no           VARCHAR2(20),
  responsible_certi_period_begin DATE,
  responsible_certi_period_end   DATE
)
;
create table T_COMPANY_CUSTOMER_LOG
(
  change_id           NUMBER(10) not null,
  old_new             CHAR(1) not null,
  parent_id           NUMBER(10),
  company_id          NUMBER(10) not null,
  company_name        VARCHAR2(240) not null,
  abbr_name           VARCHAR2(120),
  parent_name         VARCHAR2(100),
  found_date          DATE,
  type_id             NUMBER(4),
  job_kind            NUMBER(2),
  tax_code            VARCHAR2(20),
  register_code       VARCHAR2(100),
  organ_code          VARCHAR2(20),
  staff_amount        NUMBER(10),
  register_capital    NUMBER(10),
  capital_investment  NUMBER(10),
  yield_rate          NUMBER(6,4),
  main_operation      VARCHAR2(100),
  distrinct_code      VARCHAR2(10),
  zip                 VARCHAR2(6),
  address             VARCHAR2(100),
  area_code           VARCHAR2(5),
  telephone           VARCHAR2(30),
  fax                 VARCHAR2(30),
  email               VARCHAR2(50),
  url                 VARCHAR2(50),
  notes               VARCHAR2(4000),
  leader_name         VARCHAR2(50),
  company_level       VARCHAR2(50),
  distribute_type     CHAR(1),
  address_2           VARCHAR2(100),
  address_3           VARCHAR2(100),
  address_4           VARCHAR2(100),
  hospital_agree      CHAR(1) default 'N' not null,
  pwd_print           NUMBER(4) default 0 not null,
  claim_bank          VARCHAR2(20),
  claim_account       VARCHAR2(40),
  password            VARCHAR2(32),
  retired_staff       NUMBER(10),
  ss_register_num     VARCHAR2(30),
  register_date       DATE,
  cust_grade          VARCHAR2(2) default '1' not null,
  country_code        VARCHAR2(3),
  cpf_bank            VARCHAR2(20),
  cpf_account         VARCHAR2(40),
  insert_time         DATE default SYSDATE not null,
  update_time         DATE default SYSDATE not null,
  social_date         DATE,
  on_duty_staff       NUMBER(10),
  id_type             CHAR(1),
  id_no               VARCHAR2(80),
  area_id             VARCHAR2(10),
  holder_type         NUMBER(2),
  certi_start_date    DATE,
  certi_end_date      DATE,
  ss_certi_type       CHAR(1),
  exempt_company      CHAR(1),
  company_type        NUMBER(2),
  resident_type       NUMBER(2),
  nonbusiness_company CHAR(1)
)
;
create table T_COMPANY_INDI_CUST_MAPPING
(
  policy_id   NUMBER(10) not null,
  company_id  NUMBER(10) not null,
  customer_id NUMBER(10) not null
)
;
create table T_COMPANY_INDI_MAP_LOG
(
  policy_id   NUMBER(10) not null,
  customer_id NUMBER(10) not null,
  company_id  NUMBER(10) not null,
  old_new     CHAR(1) not null,
  change_id   NUMBER(10) not null,
  insert_time DATE default SYSDATE,
  update_time DATE default SYSDATE
)
;

create table T_COMPANY_MODULE
(
  organ_id  VARCHAR2(40) not null,
  module_id VARCHAR2(20) not null,
  using     CHAR(1) default 'N'
)
;
create table T_COMPANY_ORGAN_TEST
(
  parent_id          VARCHAR2(40),
  organ_id           VARCHAR2(40) not null,
  company_name       VARCHAR2(100) not null,
  abbr_name          VARCHAR2(50) not null,
  status             CHAR(1) not null,
  area               VARCHAR2(2),
  area_name          VARCHAR2(8),
  district           VARCHAR2(8),
  is_business        CHAR(1),
  area_category_code VARCHAR2(2)
)
;
create table T_COMPANY_ORGAN_TWIN
(
  parent_id             VARCHAR2(40),
  organ_id              VARCHAR2(40) not null,
  full_id               VARCHAR2(500) not null,
  leaf                  CHAR(1) not null,
  class_id              NUMBER(1) not null,
  grade_id              NUMBER(10),
  financial_right       CHAR(1) not null,
  type_id               NUMBER(4),
  company_name          VARCHAR2(100) not null,
  abbr_name             VARCHAR2(50) not null,
  found_date            DATE,
  recall_date           DATE,
  status                CHAR(1) not null,
  delegate              VARCHAR2(40),
  tax_code              VARCHAR2(20),
  zip                   CHAR(6),
  address               VARCHAR2(100),
  area_code             VARCHAR2(5),
  telephone             VARCHAR2(30),
  fax                   VARCHAR2(30),
  email                 VARCHAR2(50),
  chief_claim           NUMBER(10),
  chief_group_uw        NUMBER(10),
  chief_indivi_uw       NUMBER(10),
  chief_claim_grp       NUMBER(10),
  chief_claim_health    NUMBER(10),
  insert_time           DATE not null,
  update_time           DATE not null,
  is_basic              CHAR(1) not null,
  leader_id             NUMBER(10),
  country_code          VARCHAR2(3),
  interest_tax_rate     NUMBER(4,4) not null,
  group_telephone1      VARCHAR2(30),
  group_telephone2      VARCHAR2(30),
  bank_telephone1       VARCHAR2(30),
  bank_telephone2       VARCHAR2(30),
  telephone2            VARCHAR2(30),
  commision_standard    NUMBER(1),
  assess_standard       NUMBER(1),
  circas_organ          VARCHAR2(15),
  is_interactive        CHAR(1),
  area                  VARCHAR2(2),
  area_name             VARCHAR2(8),
  prov_code             VARCHAR2(8),
  prov_name             VARCHAR2(100),
  city_code             VARCHAR2(8),
  city_name             VARCHAR2(100),
  district              VARCHAR2(8),
  check_mode            VARCHAR2(1),
  check_status          VARCHAR2(1),
  check_account         VARCHAR2(4000),
  check_date            DATE,
  is_business           CHAR(1) default 'N',
  organ_grade           VARCHAR2(30),
  insliscenceno         VARCHAR2(100),
  licence_start         DATE,
  licence_end           DATE,
  aml_district          VARCHAR2(10),
  area_category_code    VARCHAR2(2),
  class_four_organ_type VARCHAR2(2)
)
;
create table T_COMPANY_REGISTER
(
  register_id              NUMBER(20) not null,
  ecif_id                  NUMBER(20) not null,
  status                   NUMBER(2) not null,
  social_credit_type       NUMBER(2),
  input_social_credit_type VARCHAR2(100),
  social_credit_code       VARCHAR2(200),
  credit_certi_begin       DATE,
  credit_certi_end         DATE,
  other_certi_type         VARCHAR2(100),
  other_certi_code         VARCHAR2(200),
  other_certi_begin        DATE,
  other_certi_end          DATE,
  company_address          VARCHAR2(100),
  business_scope           VARCHAR2(150),
  certi_copy_type          NUMBER(2),
  input_copy_type          VARCHAR2(100),
  insert_time              DATE default SYSDATE,
  update_time              DATE default SYSDATE
)
;
create table T_COMPANY_REGISTER_LIST
(
  list_id                  NUMBER(20) not null,
  register_id              NUMBER(20) not null,
  ecif_id                  NUMBER(20) not null,
  status                   NUMBER(2) not null,
  social_credit_type       NUMBER(2),
  input_social_credit_type VARCHAR2(100),
  social_credit_code       VARCHAR2(200),
  credit_certi_begin       DATE,
  credit_certi_end         DATE,
  other_certi_type         VARCHAR2(100),
  other_certi_code         VARCHAR2(200),
  other_certi_begin        DATE,
  other_certi_end          DATE,
  company_address          VARCHAR2(100),
  business_scope           VARCHAR2(150),
  certi_copy_type          NUMBER(2),
  input_copy_type          VARCHAR2(100),
  operator_id              NUMBER(10),
  insert_time              DATE default SYSDATE,
  update_time              DATE default SYSDATE
)
;
create table T_COMPANY_STATEMENT
(
  cust_id          NUMBER(20) not null,
  ecif_id          NUMBER(20),
  resident_type    NUMBER(2),
  statement_status NUMBER(2),
  company_name     VARCHAR2(240),
  company_type     NUMBER(2),
  exempt_company   CHAR(1),
  insert_time      DATE default SYSDATE,
  update_time      DATE default SYSDATE
)
;
create table T_COMPENSATE_INFO
(
  sector_id       NUMBER(10) not null,
  policy_id       NUMBER(10) not null,
  item_id         NUMBER(10) not null,
  social_security CHAR(1) not null,
  amt_lower_limit NUMBER(8) not null,
  amt_upper_limit NUMBER(8) not null,
  pay_rate        NUMBER(4,3) not null,
  insert_time     DATE not null,
  update_time     DATE not null,
  except_value    NUMBER(8) not null
)
;
create table T_COMPONENT_DEF
(
  component_id   NUMBER(3) not null,
  component_name VARCHAR2(100) not null
)
;
create table T_COMP_BENE_REGISTER
(
  cust_id        NUMBER(20) not null,
  is_manager     VARCHAR2(10),
  is_partnership VARCHAR2(10),
  is_trust       VARCHAR2(10),
  is_fund        VARCHAR2(10)
)
;
create table T_COMP_BENE_REG_LIST
(
  list_id        NUMBER(20) not null,
  cust_id        NUMBER(20) not null,
  is_manager     VARCHAR2(10),
  is_partnership VARCHAR2(10),
  is_trust       VARCHAR2(10),
  is_fund        VARCHAR2(10)
)
;
create table T_COMP_CONTROLLER_MAP
(
  comp_cust_id    NUMBER(20) not null,
  control_cust_id NUMBER(20) not null
)
;
create table T_COMP_CUST_REGISTER
(
  cust_id          NUMBER(20) not null,
  cust_type        NUMBER(2) not null,
  comp_register_id NUMBER(20) not null,
  real_name        VARCHAR2(120),
  certi_type       NUMBER(2),
  certi_code       VARCHAR2(50),
  certi_start_date DATE,
  certi_end_date   DATE,
  rela_address     VARCHAR2(200),
  certi_copy_type  NUMBER(2),
  input_copy_type  VARCHAR2(100),
  valid_proof_type NUMBER(2),
  input_proof_type VARCHAR2(100),
  cust_dept        VARCHAR2(150),
  cust_post        VARCHAR2(150),
  mobile           VARCHAR2(30),
  insert_time      DATE default SYSDATE,
  update_time      DATE default SYSDATE
)
;
create table T_COMP_CUST_REGISTER_LIST
(
  list_id          NUMBER(20) not null,
  cust_id          NUMBER(20) not null,
  cust_type        NUMBER(2) not null,
  comp_register_id NUMBER(20) not null,
  real_name        VARCHAR2(120),
  certi_type       NUMBER(2),
  certi_code       VARCHAR2(50),
  certi_start_date DATE,
  certi_end_date   DATE,
  rela_address     VARCHAR2(200),
  certi_copy_type  NUMBER(2),
  input_copy_type  VARCHAR2(100),
  valid_proof_type NUMBER(2),
  input_proof_type VARCHAR2(100),
  cust_dept        VARCHAR2(150),
  cust_post        VARCHAR2(150),
  mobile           VARCHAR2(30),
  insert_time      DATE default SYSDATE,
  update_time      DATE default SYSDATE
)
;
create table T_COM_ORG_MAP
(
  organ_id  VARCHAR2(40) not null,
  map_value VARCHAR2(500) not null
)
;
create table T_CONCURRENCY_GROUP_TEAM
(
  group_policy_id NUMBER(10),
  team_no         NUMBER(10)
)
;
create table T_CONCURRENCY_GROUP_TEAMS
(
  group_policy_id NUMBER(10) not null,
  team_no         NUMBER(10) not null,
  policy_id       NUMBER(10) not null
)
;
create table T_CONSTRUCT_CAL_TYPE
(
  cal_type CHAR(1) not null,
  cal_desc VARCHAR2(60) not null
)
;
create table T_GROUP_POLICY_PRODUCT
(
  item_id                 NUMBER(10) not null,
  policy_id               NUMBER(10) not null,
  product_id              NUMBER(10) not null,
  master_id               NUMBER(10),
  main_rider              CHAR(1) not null,
  amount                  NUMBER(14,2) default 0 not null,
  unit                    NUMBER(12,2) default 0 not null,
  period_prem             NUMBER(12,2) default 0 not null,
  ins_status              NUMBER(3),
  check_id                NUMBER(10),
  checkout_time           DATE,
  validate_date           DATE,
  pause_date              DATE,
  resume_date             DATE,
  cancel_date             DATE,
  insure_stop             DATE,
  pay_stop                DATE,
  reduced_amount          NUMBER(14,2) default 0 not null,
  reduced_unit            NUMBER(10) default 0 not null,
  normal_prem             NUMBER(12,2) default 0 not null,
  weak_prem               NUMBER(12,2) default 0 not null,
  job_prem                NUMBER(12,2) default 0 not null,
  insured_amount          NUMBER(10),
  discount_rate           NUMBER(8,6) default 1 not null,
  next_time               DATE,
  policy_year             NUMBER(2) default 1 not null,
  policy_period           NUMBER(4) default 1 not null,
  bonus_choice            NUMBER(2),
  pay_period              CHAR(1),
  pay_year                NUMBER(3),
  end_period              CHAR(1),
  end_year                NUMBER(3),
  pay_ensure              NUMBER(3),
  pay_type                CHAR(1),
  charge_period           CHAR(1),
  charge_year             NUMBER(3),
  coverage_period         CHAR(1),
  coverage_year           NUMBER(5),
  except_value            NUMBER(10),
  benefit_level           VARCHAR2(20),
  reduced_level           VARCHAR2(20),
  charge_type             CHAR(1),
  charge_next             CHAR(1),
  opinion_id              NUMBER(2),
  decision_id             NUMBER(2),
  discount_prem           NUMBER(12,2) default 0 not null,
  product_num             CHAR(3) not null,
  disable_prem            NUMBER(12,2) default 0 not null,
  pay_rate                NUMBER(4,3) default 0 not null,
  coverage_month          NUMBER(2),
  premium_year            NUMBER(3),
  count_way               CHAR(1) not null,
  level_standard          CHAR(1),
  normal_stand            NUMBER(12,2) default 0 not null,
  weak_stand              NUMBER(12,2) default 0 not null,
  job_stand               NUMBER(12,2) default 0 not null,
  disable_stand           NUMBER(12,2) default 0 not null,
  hold_date               DATE,
  company_prem            NUMBER(12,2) default 0 not null,
  employee_prem           NUMBER(12,2) default 0 not null,
  tax_prem                NUMBER(12,2) default 0 not null,
  policy_prem             NUMBER(12,2) default 0 not null,
  policy_stand            NUMBER(12,2) default 0 not null,
  tax_prem_stand          NUMBER(12,2) default 0 not null,
  assign_way              VARCHAR2(1),
  assign_amount           NUMBER(12,2),
  assign_rate             NUMBER(4,3),
  pay_mode                NUMBER(2) not null,
  pay_next                NUMBER(2) not null,
  risk_code               VARCHAR2(2),
  exposure_rate           NUMBER(4,3) default 1 not null,
  reins_rate              NUMBER(16,6) default 0 not null,
  discount_tax            NUMBER(16,6) default 0 not null,
  insured_category        CHAR(1),
  live_range              VARCHAR2(1) default 0 not null,
  move_range              VARCHAR2(1) default 0 not null,
  insert_time             DATE default SYSDATE not null,
  update_time             DATE default SYSDATE not null,
  comm_amount             NUMBER(14,2),
  comm_balance            NUMBER(14,2),
  combo_type              VARCHAR2(10),
  combo_unit              NUMBER(12,2),
  group_premium           NUMBER(12,2) default 0,
  admin_fee_rate          NUMBER(11,10) default 0,
  per_diagnosis_fee       NUMBER(12,2) default 0,
  surplus_rate            NUMBER(10,6) default 1 not null,
  risk_rate_1             NUMBER(7,6) default 0 not null,
  max_add_risk            NUMBER(12,2) default 0 not null,
  charge_unit_amount      NUMBER(10) default 0 not null,
  charge_fee_source       VARCHAR2(1),
  charge_premium_year     CHAR(1) default 'N' not null,
  charge_period_alt       CHAR(1) default 'N' not null,
  charge_prem_type        CHAR(1) default 'N' not null,
  charge_pol_year         CHAR(1) default 'N' not null,
  charge_fee_mode         CHAR(1) default '0' not null,
  charge_section_cal_type VARCHAR2(1) default (1) not null,
  charge_prem_role        CHAR(1) default ('N') not null,
  charge_prem             CHAR(1) default 'N' not null,
  charge_accum_prem       CHAR(1) default 'N' not null,
  note_pay_type           CHAR(1),
  note_pay_ensure         CHAR(1),
  renew_decision          VARCHAR2(1) default '0' not null,
  except_type             CHAR(1) default '0' not null,
  comm_prem               NUMBER(12,2),
  is_continue_apply       CHAR(1),
  is_limit_comm_amount    CHAR(1),
  social_rate             NUMBER(4,3),
  is_add_transfer_annuity CHAR(1),
  travel_type             CHAR(1),
  expense_rate            NUMBER(5,4),
  display_rate_flag       CHAR(1) default 'Y',
  gpremium_minus_spremium CHAR(1)
)
;
create table T_CONSTRUCT_DETAIL
(
  list_id              NUMBER(10) not null,
  group_item_id        NUMBER(10) not null,
  construct_number     NUMBER(10),
  construct_name       VARCHAR2(333),
  construct_type       VARCHAR2(60),
  construct_addr       VARCHAR2(333),
  construct_begin_date DATE,
  construct_end_date   DATE,
  construct_area       NUMBER(10,2),
  construct_cost       NUMBER(10,2),
  cal_type             CHAR(1) not null
)
;
create table T_CONSTRUCT_DETAIL_LOG
(
  list_id              NUMBER(10) not null,
  group_item_id        NUMBER(10) not null,
  construct_number     NUMBER(10),
  construct_name       VARCHAR2(333),
  construct_type       VARCHAR2(60),
  construct_addr       VARCHAR2(333),
  construct_begin_date DATE,
  construct_end_date   DATE,
  construct_area       NUMBER(10,2),
  construct_cost       NUMBER(10,2),
  cal_type             CHAR(1) not null,
  old_new              NUMBER(10) not null,
  change_id            NUMBER(10) not null
)
;
create table T_PERIOD_LENGTH_TYPE
(
  length_type NUMBER(2) not null,
  type_name   VARCHAR2(100) not null
)
;
create table T_DEF_PERIOD_TYPE
(
  def_period_type NUMBER(4) not null,
  type_name       VARCHAR2(100) not null,
  length_type     NUMBER(2),
  period_length   NUMBER(4),
  is_forward      CHAR(1) default 'Y' not null,
  start_date_func VARCHAR2(100) not null
)
;
create table T_CONTRACT_ACCUTOR_PARAM
(
  list_id          NUMBER(10) not null,
  accutor_param_id NUMBER(10) not null,
  assumpsit_level  CHAR(1) not null,
  group_policy_id  NUMBER(10) not null,
  apply_level      VARCHAR2(100),
  insured_id       NUMBER(10),
  param_1          NUMBER(12,2),
  param_2          NUMBER(12,2),
  formula_1        VARCHAR2(100),
  formula_2        VARCHAR2(100),
  def_period_type  NUMBER(4)
)
;
create table T_CONTRACT_ACC_ASSU
(
  list_id          NUMBER(10),
  account_att_type NUMBER(2) not null,
  account_name     VARCHAR2(50) default 'DEFAULT' not null,
  item_id          NUMBER(10),
  group_item_id    NUMBER(10),
  company_id       NUMBER(10),
  opt_flag         CHAR(1) not null,
  assign_rate      NUMBER(19,18),
  assign_amount    NUMBER(14,4),
  topup_rate       NUMBER(5,4),
  deduct_account   CHAR(1) default ('N') not null,
  recorder_id      NUMBER(10) not null,
  insert_time      DATE default SYSDATE not null,
  updater_id       NUMBER(10) not null,
  update_time      DATE default SYSDATE not null,
  bonus_account    CHAR(1) default 'N',
  dummy_num        VARCHAR2(4)
)
;

create table T_CONTRACT_ACC_ASSU_LOG
(
  list_id          NUMBER(10),
  change_id        NUMBER(10),
  old_new          CHAR(1) not null,
  account_att_type NUMBER(2) not null,
  account_name     VARCHAR2(50) default 'DEFAULT' not null,
  item_id          NUMBER(10),
  group_item_id    NUMBER(10),
  company_id       NUMBER(10),
  opt_flag         CHAR(1) not null,
  assign_rate      NUMBER(5,4),
  assign_amount    NUMBER(14,4),
  topup_rate       NUMBER(5,4),
  deduct_account   CHAR(1) default 'N' not null,
  recorder_id      NUMBER(10) not null,
  insert_time      DATE default SYSDATE not null,
  updater_id       NUMBER(10) not null,
  update_time      DATE default SYSDATE not null,
  bonus_account    CHAR(1) default 'N'
)
;
create table T_CONTRACT_ACC_ATT_ASSU
(
  item_id          NUMBER(10) not null,
  account_att_type NUMBER(2) not null,
  bonus_mode       NUMBER(2) not null,
  recorder_id      NUMBER(10) not null,
  insert_time      DATE default SYSDATE not null,
  updater_id       NUMBER(10) not null,
  update_time      DATE default SYSDATE not null
)
;
create table T_CONTRACT_ACC_CFG
(
  item_id            NUMBER(10) not null,
  account_att_type   NUMBER(2) not null,
  account_name       VARCHAR2(50) not null,
  account_owner_type VARCHAR2(2)
)
;
create table T_CONTRACT_ACC_INT_SCHEME
(
  item_id      NUMBER(10) not null,
  account_name VARCHAR2(50) default 'DEFAULT' not null,
  start_date   DATE default to_date('1900-01-01','yyyy-mm-dd') not null,
  int_type     VARCHAR2(2) not null,
  int_rate     NUMBER(10,9),
  recorder_id  NUMBER(10) not null,
  insert_time  DATE default SYSDATE not null,
  updater_id   NUMBER(10) not null,
  update_time  DATE default SYSDATE not null
)
;
create table T_CONTRACT_ACC_PREM
(
  list_id          NUMBER(10),
  account_att_type NUMBER(2) not null,
  item_id          NUMBER(10),
  group_item_id    NUMBER(10),
  company_id       NUMBER(10),
  acc_init_prem    NUMBER(14,4) default 0 not null,
  acc_topup_prem   NUMBER(14,4) default 0 not null,
  recorder_id      NUMBER(10) not null,
  insert_time      DATE default SYSDATE not null,
  updater_id       NUMBER(10) not null,
  update_time      DATE default SYSDATE not null,
  dummy_num        VARCHAR2(4),
  account_name     VARCHAR2(50)
)
;
create table T_CONTRACT_ACC_SWITCH
(
  list_id       NUMBER(10),
  change_id     NUMBER(10),
  account_from  VARCHAR2(20),
  account_to    VARCHAR2(20),
  switch_type   CHAR(1),
  insert_time   DATE default SYSDATE,
  switch_amount NUMBER(16,6)
)
;
create table T_CONTRACT_ACC_TOPUP
(
  list_id          NUMBER(10) not null,
  change_id        NUMBER(10),
  account_att_type NUMBER(2) not null,
  item_id          NUMBER(10),
  group_item_id    NUMBER(10),
  company_id       NUMBER(10),
  topup_prem       NUMBER(14,4) default 0 not null,
  recorder_id      NUMBER(10) not null,
  insert_time      DATE default SYSDATE not null,
  updater_id       NUMBER(10) not null,
  update_time      DATE default SYSDATE not null
)
;
create table T_CONTRACT_ACC_TOPUUP_ASSU
(
  list_id          NUMBER(10) not null,
  change_id        NUMBER(10),
  account_att_type NUMBER(2) not null,
  account_name     VARCHAR2(50) default 'DEFAULT' not null,
  item_id          NUMBER(10),
  group_item_id    NUMBER(10),
  company_id       NUMBER(10),
  opt_flag         CHAR(1) not null,
  assign_rate      NUMBER(19,18),
  assign_amount    NUMBER(14,4),
  deduct_account   CHAR(1) default 'N' not null,
  recorder_id      NUMBER(10) not null,
  insert_time      DATE default SYSDATE not null,
  updater_id       NUMBER(10) not null,
  update_time      DATE default SYSDATE not null
)
;
create table T_CONTRACT_AMT_SECTOR
(
  sector_id       NUMBER(10) not null,
  policy_id       NUMBER(10) not null,
  item_id         NUMBER(10) not null,
  amt_lower_limit NUMBER(8) not null,
  amt_upper_limit NUMBER(8) not null,
  pay_rate        NUMBER(4,3) not null,
  insert_time     DATE default SYSDATE not null,
  update_time     DATE default SYSDATE not null
)
;
create table T_CONTRACT_AMT_SECTOR_LOG
(
  sector_id       NUMBER(10) not null,
  change_id       NUMBER(10),
  old_new         CHAR(1),
  policy_id       NUMBER(10) not null,
  item_id         NUMBER(10) not null,
  amt_lower_limit NUMBER(8) not null,
  amt_upper_limit NUMBER(8) not null,
  pay_rate        NUMBER(4,3) not null,
  insert_time     DATE default SYSDATE not null,
  update_time     DATE default SYSDATE not null
)
;
create table T_CONTRACT_ASSU_NOACC
(
  list_id          NUMBER(10) not null,
  account_att_type NUMBER(2) not null,
  account_name     VARCHAR2(50) not null,
  item_id          NUMBER(10),
  group_item_id    NUMBER(10),
  opt_flag         CHAR(1) not null,
  assign_rate      NUMBER(19,18),
  assign_amount    NUMBER(14,4),
  recorder_id      NUMBER(10) not null,
  insert_time      DATE default SYSDATE not null,
  updater_id       NUMBER(10) not null,
  update_time      DATE default SYSDATE not null
)
;
create table T_CO_ASSU_NOACC_DEPOSIT_CODE
(
  deposit_code      VARCHAR2(2) not null,
  deposit_code_desc VARCHAR2(50) not null
)
;
create table T_CONTRACT_ASSU_NOACC_LIST
(
  deposit_id       NUMBER(10) not null,
  list_id          NUMBER(10) not null,
  account_att_type NUMBER(2) not null,
  account_name     VARCHAR2(50) not null,
  policy_id        NUMBER(10),
  item_id          NUMBER(10),
  group_item_id    NUMBER(10),
  opt_flag         CHAR(1) not null,
  assign_rate      NUMBER(19,18),
  assign_amount    NUMBER(14,4),
  deposit_code     VARCHAR2(2) not null,
  recorder_id      NUMBER(10) not null,
  insert_time      DATE default SYSDATE not null,
  updater_id       NUMBER(10) not null,
  update_time      DATE default SYSDATE not null,
  due_time         DATE
)
;
create table T_CONTRACT_ASSU_NOACC_LIST_LOG
(
  deposit_id       NUMBER(10) not null,
  change_id        NUMBER(10) not null,
  old_new          CHAR(1) not null,
  list_id          NUMBER(10) not null,
  account_att_type NUMBER(2) not null,
  account_name     VARCHAR2(50) not null,
  policy_id        NUMBER(10),
  item_id          NUMBER(10),
  group_item_id    NUMBER(10),
  opt_flag         CHAR(1) not null,
  assign_rate      NUMBER(19,18),
  assign_amount    NUMBER(14,4),
  deposit_code     VARCHAR2(2) not null,
  recorder_id      NUMBER(10) not null,
  insert_time      DATE default SYSDATE not null,
  updater_id       NUMBER(10) not null,
  update_time      DATE default SYSDATE not null
)
;
create table T_CONTRACT_ASSU_NOACC_LOG
(
  list_id          NUMBER(10) not null,
  account_att_type NUMBER(2) not null,
  account_name     VARCHAR2(50) not null,
  item_id          NUMBER(10),
  group_item_id    NUMBER(10),
  opt_flag         CHAR(1) not null,
  assign_rate      NUMBER(19,18),
  assign_amount    NUMBER(14,4),
  recorder_id      NUMBER(10) not null,
  insert_time      DATE default SYSDATE not null,
  updater_id       NUMBER(10) not null,
  update_time      DATE default SYSDATE not null,
  change_id        NUMBER(10) not null,
  old_new          CHAR(1) not null
)
;
create table T_CONTRACT_BENE_DEL
(
  bene_id     NUMBER(10),
  policy_id   NUMBER(10),
  delete_time DATE default SYSDATE not null
)
;
create table T_CONTRACT_BENE_LOG
(
  change_id           NUMBER(10) not null,
  bene_id             NUMBER(10) not null,
  old_new             CHAR(1) not null,
  policy_id           NUMBER(10) not null,
  insurant            NUMBER(10) not null,
  bene_type           CHAR(1) not null,
  bene_order          CHAR(1) not null,
  real_name           VARCHAR2(120) not null,
  gender              CHAR(1),
  birthday            DATE,
  certi_type          NUMBER(2),
  certi_code          VARCHAR2(50),
  telephone           VARCHAR2(30),
  address             VARCHAR2(150),
  zip                 VARCHAR2(10),
  bene_rate           NUMBER(7,6) default 1,
  relation_id         NUMBER(2) not null,
  mobile_tel          VARCHAR2(30),
  address_2           VARCHAR2(100),
  address_3           VARCHAR2(100),
  address_4           VARCHAR2(100),
  auth_draw           NUMBER(2) default 10 not null,
  bank_code           VARCHAR2(20),
  bank_account        VARCHAR2(40),
  trans_app_id        NUMBER(10),
  trans_ins_id        NUMBER(10),
  trans_pay_type      CHAR(1),
  trans_pay_year      NUMBER(3),
  trans_charge_period CHAR(1),
  trans_charge_year   NUMBER(3),
  target_policy_id    NUMBER(10),
  legal_bene          CHAR(1) not null,
  trustee_id          NUMBER(10),
  insert_time         DATE default SYSDATE not null,
  update_time         DATE default SYSDATE not null,
  expire_bene_type    CHAR(1),
  certi_start_date    DATE,
  certi_end_date      DATE
)
;
create table T_CONTRACT_CANCEL_CAUSE
(
  cause_id   VARCHAR2(2) not null,
  cause_desc VARCHAR2(100) not null
)
;
create table T_CONTRACT_CANCEL
(
  cancel_id          NUMBER(10) not null,
  operater_id        NUMBER(10) not null,
  insert_time        DATE default SYSDATE not null,
  policy_id          NUMBER(10) not null,
  cause_id           VARCHAR2(2),
  maintenance_code   VARCHAR2(20),
  transfer_send_code VARCHAR2(20)
)
;
create table T_CONTRACT_CHARGE_ASSU
(
  item_id          NUMBER(10) not null,
  premium_year     NUMBER(3) default 0 not null,
  period           NUMBER(4) default 0 not null,
  prem_type        VARCHAR2(1) default '0' not null,
  account_att_type NUMBER(2) not null,
  low_year         NUMBER(3) default 0 not null,
  high_year        NUMBER(3) default 999 not null,
  low_prem         NUMBER(10) default 0 not null,
  high_prem        NUMBER(10) default 9999999999 not null,
  accum_low_prem   NUMBER(10) default 0 not null,
  accum_high_prem  NUMBER(10) default 9999999999 not null,
  opt_flag         CHAR(1) not null,
  assign_rate      NUMBER(11,10),
  assign_amount    NUMBER(14,4),
  recorder_id      NUMBER(10) not null,
  insert_time      DATE default SYSDATE not null,
  updater_id       NUMBER(10) not null,
  update_time      DATE default SYSDATE not null,
  prem_role        CHAR(1) default (0) not null,
  assign_rate2     NUMBER(11,10)
)
;
create table T_CONTRACT_CHARGE_ASSU_LOG
(
  change_id        NUMBER(10) not null,
  old_new          CHAR(1) not null,
  item_id          NUMBER(10) not null,
  premium_year     NUMBER(3) default 0 not null,
  period           NUMBER(4) default 0 not null,
  prem_type        VARCHAR2(1) not null,
  account_att_type NUMBER(2) not null,
  low_year         NUMBER(3) default 0 not null,
  high_year        NUMBER(3) default 999 not null,
  low_prem         NUMBER(10) default 0 not null,
  high_prem        NUMBER(10) default 9999999999 not null,
  accum_low_prem   NUMBER(10) default 0 not null,
  accum_high_prem  NUMBER(10) default 9999999999 not null,
  opt_flag         CHAR(1) not null,
  assign_rate      NUMBER(11,10),
  assign_amount    NUMBER(14,4),
  recorder_id      NUMBER(10) not null,
  insert_time      DATE default SYSDATE not null,
  updater_id       NUMBER(10) not null,
  update_time      DATE default SYSDATE not null,
  prem_role        CHAR(1) default (0) not null,
  assign_rate2     NUMBER(11,10)
)
;
create table T_CONTRACT_CLAIM_ORDER_FB
(
  apply_code    VARCHAR2(20) not null,
  sub_item_no   VARCHAR2(50),
  sub_item_name VARCHAR2(100),
  claim_order   VARCHAR2(3)
)
;
create table T_HI_PLAN_DETAIL_DESC
(
  detail_id       NUMBER(10) not null,
  detail_desc     VARCHAR2(100),
  detail_sequence NUMBER
)
;
create table T_HI_GRADE
(
  grade_id   NUMBER(10) not null,
  grade_desc VARCHAR2(100)
)
;
create table T_HI_PLAN_DETAIL
(
  list_id           NUMBER(10) not null,
  plan_id           NUMBER(10) not null,
  product_id        NUMBER(7),
  category_id       NUMBER(2),
  liab_id           NUMBER(4),
  grade_id          NUMBER(10) not null,
  detail_desc       VARCHAR2(100),
  detail_id         NUMBER(10),
  master_product_id NUMBER(7)
)
;
create table T_CONTRACT_GROUP_LIAB_HI
(
  group_item_id     NUMBER(10),
  plan_list_id      NUMBER(10) not null,
  excess_liquidity  NUMBER(10),
  pay_rate          NUMBER(4,3),
  basic_amount      NUMBER(14,2),
  premium           NUMBER(14,2),
  basic_amount_note VARCHAR2(100),
  insured_amount    NUMBER(10),
  policy_id         NUMBER(10)
)
;
create table T_CONTRACT_GROUP_LIAB_HI_LOG
(
  change_id         NUMBER(10) not null,
  old_new           CHAR(1) not null,
  group_item_id     NUMBER(10),
  plan_list_id      NUMBER(10) not null,
  excess_liquidity  NUMBER(10),
  pay_rate          NUMBER(4,3),
  basic_amount      NUMBER(14,2),
  premium           NUMBER(14,2),
  basic_amount_note VARCHAR2(100),
  insured_amount    NUMBER(10),
  policy_id         NUMBER(10) not null
)
;
create table T_CONTRACT_INVEST
(
  item_id       NUMBER(10) not null,
  account_code  VARCHAR2(20) not null,
  policy_id     NUMBER(10) not null,
  insured_id    NUMBER(10) not null,
  product_num   CHAR(3) not null,
  product_id    NUMBER(10) not null,
  opt_flag      CHAR(1) not null,
  assign_rate   NUMBER(5,4) default 0 not null,
  assign_amount NUMBER(14,4) default 0 not null,
  accum_amount  NUMBER(14,4) default 0 not null,
  apply_amount  NUMBER(14,4) default 0 not null,
  accum_units   NUMBER(14,4) default 0 not null,
  apply_units   NUMBER(14,4) default 0 not null,
  recorder_id   NUMBER(10) not null,
  record_time   DATE not null,
  checker_id    NUMBER(10),
  check_time    DATE,
  start_time    DATE not null,
  cpf_cost      NUMBER(13,3) default 0 not null,
  cash_cost     NUMBER(13,3) default 0 not null,
  negative_time DATE,
  updater_id    NUMBER(10),
  update_time   DATE default SYSDATE not null,
  insert_time   DATE default SYSDATE not null
)
;
create table T_CONTRACT_INVEST_CHG
(
  change_id     NUMBER(10) not null,
  old_new       CHAR(1) not null,
  item_id       NUMBER(10) not null,
  account_code  VARCHAR2(20) not null,
  policy_id     NUMBER(10) not null,
  insured_id    NUMBER(10) not null,
  product_num   CHAR(3) not null,
  product_id    NUMBER(10) not null,
  opt_flag      CHAR(1) default 'A' not null,
  assign_amount NUMBER(14,4) default 0 not null,
  assign_rate   NUMBER(5,4) default 0 not null,
  accum_amount  NUMBER(14,4) default 0 not null,
  apply_amount  NUMBER(14,4) default 0 not null,
  accum_units   NUMBER(14,4) default 0 not null,
  apply_units   NUMBER(14,4) default 0 not null,
  start_time    DATE not null,
  recorder_id   NUMBER(10) not null,
  record_time   DATE not null,
  checker_id    NUMBER(10),
  check_time    DATE,
  cpf_cost      NUMBER(13,3) default 0 not null,
  cash_cost     NUMBER(13,3) default 0 not null,
  negative_time DATE,
  insert_time   DATE default SYSDATE not null,
  update_time   DATE default SYSDATE not null
)
;

create table T_CONTRACT_INVEST_LOG
(
  item_id       NUMBER(10) not null,
  account_code  VARCHAR2(20) not null,
  start_time    DATE not null,
  policy_id     NUMBER(10) not null,
  insured_id    NUMBER(10) not null,
  product_num   CHAR(3) not null,
  product_id    NUMBER(10) not null,
  opt_flag      CHAR(1) not null,
  assign_rate   NUMBER(5,4) default 0 not null,
  assign_amount NUMBER(14,4) default 0 not null,
  recorder_id   NUMBER(10) not null,
  record_time   DATE not null,
  checker_id    NUMBER(10),
  check_time    DATE,
  insert_time   DATE default SYSDATE not null,
  update_time   DATE default SYSDATE not null
)
;
create table T_CONTRACT_INVEST_LOG_CHG
(
  change_id     NUMBER(10) not null,
  old_new       CHAR(1) not null,
  item_id       NUMBER(10) not null,
  account_code  VARCHAR2(20) not null,
  start_time    DATE not null,
  policy_id     NUMBER(10) not null,
  insured_id    NUMBER(10) not null,
  product_num   CHAR(3) not null,
  product_id    NUMBER(10) not null,
  opt_flag      CHAR(1) default 'A' not null,
  assign_amount NUMBER(14,4) default 0 not null,
  assign_rate   NUMBER(5,4) default 0 not null,
  recorder_id   NUMBER(10) not null,
  record_time   DATE not null,
  checker_id    NUMBER(10),
  check_time    DATE,
  insert_time   DATE default SYSDATE not null,
  update_time   DATE default SYSDATE not null
)
;
create table T_CONTRACT_LIAB_PAY_PARAM
(
  list_id                NUMBER(10) not null,
  policy_id              NUMBER(10) not null,
  item_id                NUMBER(10) not null,
  product_id             NUMBER(7) not null,
  liab_id                NUMBER(4) not null,
  except_amount          NUMBER(12,2) default 0,
  pay_rate               NUMBER(4,3) default 0,
  elimination_period     NUMBER(5),
  limit_comm_amount      NUMBER(14),
  sec_amount             NUMBER(14),
  special_medical_amount NUMBER(12,2),
  hospital_amount        NUMBER(12,2)
)
;
create table T_CONTRACT_LIAB_PAY_PARA_LOG
(
  change_id              NUMBER(10) not null,
  old_new                VARCHAR2(1) not null,
  list_id                NUMBER(10) not null,
  policy_id              NUMBER(10) not null,
  item_id                NUMBER(10) not null,
  product_id             NUMBER(7) not null,
  liab_id                NUMBER(4) not null,
  except_amount          NUMBER(12,2) not null,
  pay_rate               NUMBER(4,3),
  elimination_period     NUMBER(5),
  limit_comm_amount      NUMBER(14),
  sec_amount             NUMBER(14),
  hospital_amount        NUMBER(12,2),
  special_medical_amount NUMBER(12,2)
)
;
create table T_LOAN_STATUS
(
  loan_status CHAR(1) not null,
  status_name VARCHAR2(100) not null
)
;
create table T_CONTRACT_LOG
(
  change_id           NUMBER(10) not null,
  old_new             CHAR(1) not null,
  policy_id           NUMBER(10) not null,
  pay_next            NUMBER(2),
  pay_way             VARCHAR2(2),
  bank_code           VARCHAR2(20),
  bank_account        VARCHAR2(40),
  applicant_id        NUMBER(10),
  company_id          NUMBER(10),
  address_fee         VARCHAR2(200),
  zip_link            VARCHAR2(10),
  link_tel            VARCHAR2(50),
  linkman             VARCHAR2(120),
  linkman_title       VARCHAR2(50),
  linkman_dept        VARCHAR2(40),
  link_celler         VARCHAR2(30),
  email               VARCHAR2(50),
  fax                 VARCHAR2(30),
  link_notes          VARCHAR2(1000),
  head_id             VARCHAR2(40) not null,
  branch_id           VARCHAR2(40) not null,
  organ_id            VARCHAR2(40) not null,
  dept_id             VARCHAR2(20) not null,
  balance_prem        NUMBER(12,2),
  period_prem         NUMBER(12,2) not null,
  discount_prem       NUMBER(12,2) not null,
  company_prem        NUMBER(12,2),
  employee_prem       NUMBER(12,2),
  normal_prem         NUMBER(12,2) not null,
  normal_stand        NUMBER(12,2) not null,
  weak_prem           NUMBER(12,2),
  weak_stand          NUMBER(12,2),
  job_prem            NUMBER(12,2),
  job_stand           NUMBER(12,2),
  disable_prem        NUMBER(12,2),
  disable_stand       NUMBER(12,2),
  over_manage         CHAR(1) not null,
  deliver_type        CHAR(1),
  service_type        CHAR(1),
  overdue_manage      CHAR(1) default '1' not null,
  money_id            NUMBER(6) not null,
  assumpsit           VARCHAR2(4000),
  agreement_type      NUMBER(2),
  agreement_motive    VARCHAR2(200),
  agreement           VARCHAR2(4000),
  pay_times           NUMBER(4),
  agent_id            NUMBER(10) not null,
  sign_id             NUMBER(10),
  agency_code         VARCHAR2(20),
  branch_bank         VARCHAR2(20),
  agency_hand         NUMBER(10),
  apply_date          DATE not null,
  validate_date       DATE not null,
  accept_date         DATE not null,
  end_date            DATE not null,
  pause_date          DATE,
  liability_state     NUMBER(2) not null,
  suspend             CHAR(1) default 'N' not null,
  suspend_cause       NUMBER(2),
  pause_cause         NUMBER(2),
  end_cause           NUMBER(2),
  prem_status         NUMBER(2) not null,
  claim_deal          NUMBER(4),
  claim_emp           NUMBER(10),
  service_deal        NUMBER(4),
  service_emp         NUMBER(10),
  reissue_num         NUMBER(2) default 0 not null,
  policy_year         NUMBER(2),
  policy_period       NUMBER(4) not null,
  policy_code         VARCHAR2(20) not null,
  apply_code          VARCHAR2(20) not null,
  policy_type         CHAR(1) not null,
  group_single        CHAR(1) not null,
  real_insurant       CHAR(1) default 'Y' not null,
  pay_mode            NUMBER(2),
  ss_validate_date    DATE,
  nb_agency_code      VARCHAR2(20),
  balance_capital     NUMBER(14,4),
  em_ill              NUMBER(4),
  em_life             NUMBER(4),
  job_class_1         NUMBER(2),
  job_2               VARCHAR2(40),
  job_1               VARCHAR2(200),
  applicant_age       NUMBER(3),
  job_cate_id         NUMBER(10),
  relation_id         NUMBER(2),
  loan_status         CHAR(1) default '0' not null,
  derivation          CHAR(1) default '1' not null,
  former_id           NUMBER(10),
  next_period_prem    NUMBER(12,2) default 0 not null,
  next_discount_prem  NUMBER(12,2) default 0 not null,
  next_company_prem   NUMBER(12,2) default 0 not null,
  next_employee_prem  NUMBER(12,2) default 0 not null,
  next_normal_prem    NUMBER(12,2) default 0 not null,
  next_weak_prem      NUMBER(12,2) default 0 not null,
  next_job_prem       NUMBER(12,2) default 0 not null,
  next_disable_prem   NUMBER(12,2) default 0 not null,
  sell_way            VARCHAR2(2) default '0' not null,
  answer_type         VARCHAR2(1) default '0' not null,
  auto_decision       NUMBER(2) default 0 not null,
  tax_prem            NUMBER(12,2) default 0 not null,
  service_id          NUMBER(10) not null,
  service_date        DATE not null,
  print_time          DATE,
  policy_print        NUMBER(2) default 0 not null,
  unit_print          NUMBER(2) default 0 not null,
  receipt_print       NUMBER(2) default 0 not null,
  next_policy_prem    NUMBER(12,2) default 0 not null,
  next_tax_prem       NUMBER(12,2) default 0 not null,
  address_fee_2       VARCHAR2(100),
  address_fee_3       VARCHAR2(100),
  address_fee_4       VARCHAR2(100),
  indivi_enquiry      CHAR(1) default 'N' not null,
  tax_prem_stand      NUMBER(12,2) default 0 not null,
  matu_pay_mode       NUMBER(2),
  matu_process        VARCHAR2(1),
  matu_status         VARCHAR2(1),
  suspend_chg_id      NUMBER(10),
  received_date       DATE,
  emp_attach_type     CHAR(1),
  initial_vali_date   DATE,
  policy_prem         NUMBER(12,2) default 0 not null,
  policy_stand        NUMBER(12,2) default 0 not null,
  next_weak_stand     NUMBER(12,2) default 0 not null,
  next_job_stand      NUMBER(12,2) default 0 not null,
  next_disable_stand  NUMBER(12,2) default 0 not null,
  auto_end            DATE,
  assignee_type       VARCHAR2(2) default 0 not null,
  agriculture_net     CHAR(1),
  prorate             CHAR(1) default 'Y' not null,
  campaign_code       VARCHAR2(10),
  acknow_code         VARCHAR2(20),
  is_commission       CHAR(1) default 'Y' not null,
  whole_period        CHAR(1) default 'Y' not null,
  discount_tax        NUMBER(12,2) default 0 not null,
  next_discount_tax   NUMBER(12,2) default 0 not null,
  auto_surrender      CHAR(1) default 'N' not null,
  sur_notice_date     DATE,
  insert_time         DATE default SYSDATE not null,
  update_time         DATE default SYSDATE not null,
  commission_rate     NUMBER(4,3) default 0 not null,
  answer_assumpsit    VARCHAR2(1000),
  is_igp              CHAR(1),
  igp_type            CHAR(1),
  scheme_id           NUMBER(10),
  agent_discount_rate NUMBER(4,3) default 1 not null,
  invoice_amount      NUMBER(12,2),
  answer_tel          VARCHAR2(40),
  holiday_indi        CHAR(1) default 'N',
  holiday_start_date  DATE,
  holiday_end_date    DATE,
  holiday_pol_year    NUMBER(3),
  pld                 DATE default to_date('9999-09-09','yyyy-mm-dd'),
  holder_emp_num      NUMBER(10),
  grp_busi_type       CHAR(1),
  is_relocate         CHAR(1),
  is_switch_policy    CHAR(1),
  unite_system_check  CHAR(1)
)
;
create table T_CONTRACT_MASTER_0701
(
  policy_id            NUMBER(10) not null,
  policy_code          VARCHAR2(20) not null,
  apply_code           VARCHAR2(20) not null,
  policy_type          CHAR(1) not null,
  group_single         CHAR(1) not null,
  real_insurant        CHAR(1) not null,
  head_id              VARCHAR2(40) not null,
  branch_id            VARCHAR2(40) not null,
  organ_id             VARCHAR2(40) not null,
  dept_id              VARCHAR2(20) not null,
  balance_prem         NUMBER(12,2) not null,
  period_prem          NUMBER(12,2) not null,
  discount_prem        NUMBER(12,2) not null,
  company_prem         NUMBER(12,2),
  employee_prem        NUMBER(12,2) not null,
  normal_prem          NUMBER(12,2) not null,
  normal_stand         NUMBER(12,2) not null,
  weak_prem            NUMBER(12,2) not null,
  weak_stand           NUMBER(12,2) not null,
  job_prem             NUMBER(12,2) not null,
  job_stand            NUMBER(12,2) not null,
  disable_prem         NUMBER(12,2) not null,
  disable_stand        NUMBER(12,2) not null,
  over_manage          CHAR(1) not null,
  pay_mode             NUMBER(2) not null,
  pay_next             NUMBER(2) not null,
  pay_way              VARCHAR2(2),
  deliver_type         CHAR(1),
  service_type         CHAR(1),
  overdue_manage       CHAR(1) not null,
  bank_code            VARCHAR2(20),
  bank_account         VARCHAR2(40),
  money_id             NUMBER(6) not null,
  applicant_id         NUMBER(10),
  company_id           NUMBER(10),
  address_fee          VARCHAR2(150),
  zip_link             VARCHAR2(10),
  link_tel             VARCHAR2(50),
  linkman              VARCHAR2(40),
  linkman_title        VARCHAR2(50),
  linkman_dept         VARCHAR2(40),
  link_celler          VARCHAR2(30),
  email                VARCHAR2(50),
  fax                  VARCHAR2(30),
  link_notes           VARCHAR2(1000),
  apply_date           DATE not null,
  validate_date        DATE not null,
  accept_date          DATE not null,
  end_date             DATE not null,
  pause_date           DATE,
  liability_state      NUMBER(2) not null,
  suspend              CHAR(1) not null,
  suspend_cause        NUMBER(2),
  pause_cause          NUMBER(2),
  end_cause            NUMBER(2),
  prem_status          NUMBER(2) not null,
  claim_deal           NUMBER(4),
  service_deal         NUMBER(4),
  policy_year          NUMBER(2) not null,
  policy_period        NUMBER(4) not null,
  agent_id             NUMBER(10) not null,
  sign_id              NUMBER(10),
  agency_code          VARCHAR2(20),
  branch_bank          VARCHAR2(20),
  agency_hand          NUMBER(10),
  update_time          DATE not null,
  updater_id           NUMBER(10),
  insert_time          DATE not null,
  assumpsit            VARCHAR2(4000),
  agreement_type       NUMBER(2),
  agreement_motive     VARCHAR2(200),
  agreement            VARCHAR2(4000),
  pay_times            NUMBER(4),
  sys_lock_time        DATE,
  sys_locker_id        NUMBER(10),
  sys_lock_status      CHAR(1) not null,
  claim_emp            NUMBER(10),
  service_emp          NUMBER(10),
  reissue_num          NUMBER(2) not null,
  nb_agency_code       VARCHAR2(20),
  policy_print         NUMBER(2) not null,
  unit_print           NUMBER(2) not null,
  receipt_print        NUMBER(2) not null,
  appro_emp_id         NUMBER(10),
  balance_capital      NUMBER(14,4) not null,
  em_ill               NUMBER(4),
  em_life              NUMBER(4),
  relation_id          NUMBER(2),
  job_class_1          NUMBER(2),
  job_cate_id          NUMBER(10),
  job_2                VARCHAR2(40),
  job_1                VARCHAR2(100),
  applicant_age        NUMBER(3),
  loan_status          CHAR(1) not null,
  derivation           CHAR(1) not null,
  former_id            NUMBER(10),
  next_period_prem     NUMBER(12,2) not null,
  next_discount_prem   NUMBER(12,2) not null,
  next_company_prem    NUMBER(12,2) not null,
  next_employee_prem   NUMBER(12,2) not null,
  next_normal_prem     NUMBER(12,2) not null,
  next_weak_prem       NUMBER(12,2) not null,
  next_job_prem        NUMBER(12,2) not null,
  next_disable_prem    NUMBER(12,2) not null,
  print_time           DATE,
  sell_way             VARCHAR2(2) not null,
  tax_prem             NUMBER(12,2) not null,
  answer_type          VARCHAR2(1) not null,
  is_answered          VARCHAR2(1) not null,
  auto_decision        NUMBER(2) not null,
  service_id           NUMBER(10) not null,
  service_date         DATE not null,
  policy_prem          NUMBER(12,2) not null,
  policy_stand         NUMBER(12,2) not null,
  next_policy_prem     NUMBER(12,2) not null,
  next_tax_prem        NUMBER(12,2) not null,
  address_fee_2        VARCHAR2(100),
  address_fee_3        VARCHAR2(100),
  address_fee_4        VARCHAR2(100),
  indivi_enquiry       CHAR(1) not null,
  tax_prem_stand       NUMBER(12,2) not null,
  matu_pay_mode        NUMBER(2),
  matu_process         VARCHAR2(1),
  matu_status          VARCHAR2(1),
  suspend_chg_id       NUMBER(10),
  prem_change_time     DATE not null,
  received_date        DATE,
  emp_attach_type      CHAR(1),
  initial_vali_date    DATE,
  next_weak_stand      NUMBER(12,2) not null,
  next_job_stand       NUMBER(12,2) not null,
  next_disable_stand   NUMBER(12,2) not null,
  auto_end             DATE,
  assignee_type        VARCHAR2(2) not null,
  swiss_life           CHAR(1) not null,
  prorate              CHAR(1) not null,
  campaign_code        VARCHAR2(10),
  ss_validate_date     DATE,
  acknow_code          VARCHAR2(20),
  is_commission        CHAR(1) not null,
  whole_period         CHAR(1) not null,
  discount_tax         NUMBER(12,2) not null,
  next_discount_tax    NUMBER(12,2) not null,
  auto_surrender       CHAR(1) not null,
  sur_notice_date      DATE,
  send_out_date        DATE,
  send_out_id          NUMBER(10),
  commission_rate      NUMBER(4,3) not null,
  answer_assumpsit     VARCHAR2(1000),
  is_igp               CHAR(1),
  igp_type             CHAR(1),
  issue_way            NUMBER(10),
  scheme_id            NUMBER(10),
  agent_discount_rate  NUMBER(4,3) not null,
  invoice_amount       NUMBER(12,2),
  answer_tel           VARCHAR2(40),
  holiday_indi         CHAR(1),
  holiday_start_date   DATE,
  holiday_end_date     DATE,
  holiday_pol_year     NUMBER(3),
  hi_validate_date     DATE,
  hi_plan_id           NUMBER(10),
  hi_end_date          DATE,
  sin_emp_ins_amount   NUMBER(10),
  dou_emp_ins_amount   NUMBER(10),
  annuity_print        NUMBER(2) not null,
  annuity_print_time   DATE,
  list_print           NUMBER(2) not null,
  list_print_time      DATE,
  pld                  DATE,
  holder_emp_num       NUMBER(6),
  force_cancel_emp     NUMBER(10),
  force_cancel_time    DATE,
  force_cancel_remarks VARCHAR2(100),
  force_cancel_mark    VARCHAR2(40),
  air_code             VARCHAR2(12),
  grp_busi_type        CHAR(1)
)
;
create table T_CONTRACT_MASTER_DEL
(
  policy_id   NUMBER(10),
  delete_time DATE default SYSDATE not null
)
;
create table T_CONTRACT_MASTER_EXT
(
  policy_id              NUMBER(10) not null,
  confidential           CHAR(1) not null,
  insert_time            DATE default SYSDATE not null,
  update_time            DATE default SYSDATE not null,
  holder_type            NUMBER(2),
  clause_change          CHAR(1),
  all_business           CHAR(1),
  premium_divide         CHAR(1),
  all_biz_no             VARCHAR2(100),
  group_family           CHAR(1),
  apply_epolicy          CHAR(1),
  apply_way              NUMBER(2),
  apply_source           NUMBER(2),
  ori_company_code       VARCHAR2(30),
  ori_policy_code        VARCHAR2(50),
  tax_code               VARCHAR2(18),
  holder_id_2            NUMBER(10),
  unfreeze_date          DATE,
  input_source_code      VARCHAR2(5),
  calc_way               CHAR(1),
  add_related_disease    NUMBER(10),
  add_baby_disease       NUMBER(10),
  extend_hesitate_days   VARCHAR2(10),
  extend_hesitate_reason VARCHAR2(100),
  invoice_type           CHAR(1),
  epolicy_gene_time      DATE
)
;
create table T_CONTRACT_MASTER_EXT_DEL
(
  policy_id   NUMBER(10),
  delete_time DATE default SYSDATE not null
)
;
create table T_CONTRACT_MASTER_EXT_LOG
(
  policy_id         NUMBER(10),
  confidential      CHAR(1),
  change_id         NUMBER(10),
  old_new           CHAR(1),
  insert_time       DATE,
  update_time       DATE,
  apply_epolicy     CHAR(1),
  unfreeze_date     DATE,
  calc_way          CHAR(1),
  input_source_code VARCHAR2(5)
)
;
create table T_CONTRACT_MASTER_LIAB_HI
(
  policy_id         NUMBER(10) not null,
  item_id           NUMBER(10),
  plan_list_id      NUMBER(10) not null,
  excess_liquidity  NUMBER(10),
  pay_rate          NUMBER(4,3),
  basic_amount      NUMBER(14,2),
  premium           NUMBER(14,2),
  basic_amount_note VARCHAR2(100),
  insured_amount    NUMBER(10),
  insured_id        NUMBER(10)
)
;

create table T_CONTRACT_MASTER_LIAB_HI_LOG
(
  change_id         NUMBER(10) not null,
  old_new           CHAR(1) not null,
  policy_id         NUMBER(10) not null,
  item_id           NUMBER(10),
  plan_list_id      NUMBER(10) not null,
  excess_liquidity  NUMBER(10),
  pay_rate          NUMBER(4,3),
  basic_amount      NUMBER(14,2),
  premium           NUMBER(14,2),
  basic_amount_note VARCHAR2(100),
  insured_amount    NUMBER(10),
  insured_id        NUMBER(10) not null
)
;
create table T_CONTRACT_MASTER_RIDER_LX
(
  policy_code VARCHAR2(20) not null
)
;
create table T_CONTRACT_MASTER_SPE_PRD
(
  policy_id   NUMBER(10) not null,
  product_id  NUMBER(7) not null,
  insert_time DATE default SYSDATE,
  update_time DATE default SYSDATE
)
;
create table T_CONTRACT_MASTER_TEST
(
  policy_id       NUMBER(10) not null,
  branch_id       VARCHAR2(40) not null,
  apply_code      VARCHAR2(20) not null,
  policy_code     VARCHAR2(20) not null,
  policy_type     CHAR(1) not null,
  applicant_id    NUMBER(10),
  liability_state NUMBER(2) not null,
  apply_date      DATE not null,
  validate_date   DATE not null,
  pause_date      DATE,
  end_date        DATE not null
)
;
create table T_CONTRACT_MASTER_TEST2
(
  policy_id       NUMBER(10) not null,
  branch_id       VARCHAR2(40) not null,
  apply_code      VARCHAR2(20) not null,
  policy_code     VARCHAR2(20) not null,
  policy_type     CHAR(1) not null,
  applicant_id    NUMBER(10),
  liability_state NUMBER(2) not null,
  apply_date      DATE not null,
  validate_date   DATE not null,
  pause_date      DATE,
  end_date        DATE not null
)
;
create table T_CONTRACT_PARTIAL_SURR_FEE
(
  item_id     NUMBER(10) not null,
  low_year    NUMBER(3) default 0 not null,
  high_year   NUMBER(3) default 999 not null,
  rate        NUMBER(5,4),
  recorder_id NUMBER(10) not null,
  insert_time DATE default SYSDATE not null,
  updater_id  NUMBER(10) not null,
  update_time DATE default SYSDATE not null
)
;
create table T_LIAB_PAY_PARAM
(
  product_id   NUMBER(7) not null,
  liab_id      NUMBER(4) not null,
  relv1_value  VARCHAR2(20),
  relv2_value  VARCHAR2(20),
  relv3_value  VARCHAR2(20),
  relv4_value  VARCHAR2(20),
  relv5_value  VARCHAR2(20),
  relv6_value  VARCHAR2(20),
  param_1      NUMBER(14,4),
  param_2      NUMBER(12,2),
  svc_cnt_func VARCHAR2(100),
  bsc_pay_func VARCHAR2(100),
  insert_time  DATE default SYSDATE,
  update_time  DATE default SYSDATE,
  list_id      NUMBER(10) not null,
  recorder_id  NUMBER(10) not null,
  updater_id   NUMBER(10) not null,
  coverage     NUMBER(4),
  relv7_value  VARCHAR2(20),
  relv8_value  VARCHAR2(20),
  param_3      NUMBER(12,2)
)
;
create table T_CONTRACT_PAY_PARAM
(
  list_id           NUMBER(10) not null,
  liab_pay_param_id NUMBER(10) not null,
  assumpsit_level   CHAR(1) not null,
  group_item_id     NUMBER(10),
  apply_level       VARCHAR2(100),
  item_id           NUMBER(10),
  param_1           NUMBER(12,2),
  param_2           NUMBER(12,2),
  svc_cnt_func      VARCHAR2(100),
  bsc_pay_func      VARCHAR2(100),
  coverage          NUMBER(4)
)
;
create table T_CONTRACT_PRODUCT_CV
(
  item_id     NUMBER(10) not null,
  calc_date   DATE,
  cash_value  NUMBER(16,6),
  insert_time DATE default SYSDATE,
  update_time DATE default SYSDATE
)
;
create table T_CONTRACT_PRODUCT_CV_LOG
(
  change_id   NUMBER(10) not null,
  item_id     NUMBER(10) not null,
  old_new     CHAR(1) not null,
  calc_date   DATE,
  cash_value  NUMBER(16,6),
  insert_time DATE default SYSDATE,
  update_time DATE default SYSDATE
)
;
create table T_CONTRACT_PRODUCT_DEL
(
  item_id     NUMBER(10),
  policy_id   NUMBER(10),
  delete_time DATE default SYSDATE not null
)
;
create table T_TRAVEL_TYPE
(
  type_id   CHAR(1),
  type_name VARCHAR2(40)
)
;
create table T_CONTRACT_PRODUCT_EXT
(
  item_id                     NUMBER(10),
  sec_excpet_value            NUMBER(10),
  sec_amount                  NUMBER(14,2),
  limit_comm_amount           NUMBER(14,2),
  limit_comm_amount_balance   NUMBER(14,2),
  insert_time                 DATE default sysdate not null,
  update_time                 DATE default sysdate not null,
  elimination_period          NUMBER(5),
  social_security             CHAR(1),
  pay_multiple_five           NUMBER(10,2),
  pay_multiple_six            NUMBER(10,2),
  pay_multiple_seven          NUMBER(10,2),
  pay_multiple_eight          NUMBER(10,2),
  pay_multiple_nine           NUMBER(10,2),
  pay_multiple_ten            NUMBER(10,2),
  athlete_official            CHAR(1),
  number_adjust_rate          NUMBER(5,4),
  daily_allowance_amount      NUMBER(14,2),
  daily_accessorial_amount    NUMBER(14,2),
  bespoke_renew_limit         NUMBER(2),
  travel_type                 CHAR(1),
  is_continue_apply           CHAR(1),
  is_pay_account              CHAR(1),
  bespoke_renew_month         NUMBER(2),
  bespoke_renew_day           NUMBER(3),
  insured_group_code          VARCHAR2(300),
  group_name                  VARCHAR2(300),
  return_indi_rate            NUMBER(7,6),
  switch_comm_type            CHAR(1),
  switch_comm_rate            NUMBER(7,6),
  unit_deal_type              CHAR(1),
  quit_pay_rate               NUMBER(7,6),
  is_maturity_account         CHAR(1),
  tax_deferred_amount         NUMBER(14,2),
  switch_comm_amount_rate     NUMBER(7,6),
  is_annuity_transfered_accum CHAR(1),
  nursing_appro_age           NUMBER(4),
  disabled_organ              VARCHAR2(100),
  disabled_pay_rate_1         NUMBER(3),
  disabled_pay_rate_2         NUMBER(3),
  disabled_pay_rate_3         NUMBER(3),
  disabled_pay_rate_4         NUMBER(3),
  disabled_pay_rate_5         NUMBER(3),
  disabled_pay_rate_6         NUMBER(3),
  disabled_pay_rate_7         NUMBER(3),
  disabled_pay_rate_8         NUMBER(3),
  disabled_pay_rate_9         NUMBER(3),
  disabled_pay_rate_10        NUMBER(3),
  amount_reduce_times         NUMBER(3),
  amount_reduce_date          DATE,
  house_rate                  NUMBER(3,2),
  house_value                 NUMBER(14),
  hospital_pay_days           NUMBER(5),
  hospital_pay_accompany_days NUMBER(5),
  scheme                      CHAR(1),
  add_type                    VARCHAR2(10),
  final_transfer_date         DATE,
  renew_suspend               CHAR(1),
  pay_end_date                DATE,
  pay_method                  CHAR(1),
  transfered_policy_code      VARCHAR2(20),
  plan_id                     NUMBER(7),
  prem_assign_rate            NUMBER(4,3)
)
;
create table T_CONTRACT_PRODUCT_EXT_DEL
(
  item_id     NUMBER(10),
  delete_time DATE default SYSDATE not null
)
;
create table T_CONTRACT_PRODUCT_EXT_LOG
(
  change_id                   NUMBER(10),
  item_id                     NUMBER(10),
  old_new                     CHAR(1),
  sec_excpet_value            NUMBER(10),
  sec_amount                  NUMBER(14,2),
  limit_comm_amount           NUMBER(14,2),
  insert_time                 DATE default sysdate not null,
  update_time                 DATE default sysdate not null,
  limit_comm_amount_balance   NUMBER(14,2),
  elimination_period          NUMBER(5),
  social_security             CHAR(1),
  pay_multiple_five           NUMBER(10,2),
  pay_multiple_six            NUMBER(10,2),
  pay_multiple_seven          NUMBER(10,2),
  pay_multiple_eight          NUMBER(10,2),
  pay_multiple_nine           NUMBER(10,2),
  pay_multiple_ten            NUMBER(10,2),
  athlete_official            CHAR(1),
  number_adjust_rate          NUMBER(5,4),
  daily_allowance_amount      NUMBER(14,2),
  daily_accessorial_amount    NUMBER(14,2),
  bespoke_renew_limit         NUMBER(2),
  travel_type                 CHAR(1),
  is_pay_account              CHAR(1),
  bespoke_renew_month         NUMBER(2),
  bespoke_renew_day           NUMBER(3),
  is_continue_apply           CHAR(1),
  insured_group_code          VARCHAR2(300),
  group_name                  VARCHAR2(300),
  return_indi_rate            NUMBER(7,6),
  switch_comm_type            CHAR(1),
  switch_comm_rate            NUMBER(7,6),
  unit_deal_type              CHAR(1),
  quit_pay_rate               NUMBER(7,6),
  is_maturity_account         CHAR(1),
  tax_deferred_amount         NUMBER(14,2),
  switch_comm_amount_rate     NUMBER(7,6),
  is_annuity_transfered_accum CHAR(1),
  amount_reduce_times         NUMBER(3),
  amount_reduce_date          DATE,
  hospital_pay_days           NUMBER(5),
  hospital_pay_accompany_days NUMBER(5),
  scheme                      CHAR(1),
  add_type                    VARCHAR2(10),
  final_transfer_date         DATE,
  transfered_policy_code      VARCHAR2(20),
  pay_method                  CHAR(1),
  prem_assign_rate            NUMBER(4,3)
)
;
create table T_CONTRACT_PRODUCT_LOG
(
  change_id                NUMBER(10) not null,
  item_id                  NUMBER(10) not null,
  old_new                  CHAR(1) not null,
  master_id                NUMBER(10),
  policy_id                NUMBER(10) not null,
  product_num              CHAR(3) not null,
  product_id               NUMBER(10) not null,
  ins_type                 CHAR(1) not null,
  amount                   NUMBER(14,2),
  unit                     NUMBER(12,2),
  period_prem              NUMBER(12,2) not null,
  discount_prem            NUMBER(12,2) not null,
  company_prem             NUMBER(12,2),
  employee_prem            NUMBER(12,2),
  normal_prem              NUMBER(12,2) not null,
  normal_stand             NUMBER(12,2) not null,
  weak_prem                NUMBER(12,2) default 0,
  weak_stand               NUMBER(12,2) default 0,
  weak_year                NUMBER(2),
  weak_arith               CHAR(1) default '0',
  weak_rate                NUMBER(4,3) default 0,
  weak_kilo                NUMBER(8,2) default 0,
  job_prem                 NUMBER(12,2) default 0,
  job_stand                NUMBER(12,2) default 0,
  job_year                 NUMBER(2),
  job_arith                CHAR(1) default '0',
  job_rate                 NUMBER(4,3) default 0,
  job_kilo                 NUMBER(8,2) default 0,
  disable_prem             NUMBER(12,2) default 0,
  disable_stand            NUMBER(12,2) default 0,
  disable_year             NUMBER(2),
  disable_arith            CHAR(1) default '0',
  disable_rate             NUMBER(4,3) default 0,
  disable_kilo             NUMBER(8,2) default 0,
  dividend_choice          NUMBER(2),
  apply_date               DATE not null,
  end_date                 DATE not null,
  validate_date            DATE not null,
  paidup_date              DATE not null,
  pause_date               DATE,
  liability_state          NUMBER(2) default 1 not null,
  end_cause                NUMBER(2),
  prem_status              NUMBER(2) default 1 not null,
  premium_year             NUMBER(3) not null,
  pay_to_date              DATE,
  policy_year              NUMBER(2) not null,
  policy_period            NUMBER(4) not null,
  initial_type             CHAR(1) not null,
  renewal_type             CHAR(1) not null,
  insured_1                NUMBER(10) not null,
  age_1                    NUMBER(3),
  relation_1               NUMBER(2),
  relation_s               NUMBER(2) default 5 not null,
  job_1_1                  VARCHAR2(200),
  job_1_2                  VARCHAR2(40),
  job_class_1              NUMBER(2),
  job_cate_1               NUMBER(10),
  em_life_1                NUMBER(4) default 0,
  em_health_1              NUMBER(4) default 0,
  insured_2                NUMBER(10),
  age_2                    NUMBER(3),
  relation_2               NUMBER(2),
  job_2_1                  VARCHAR2(40),
  job_2_2                  VARCHAR2(40),
  job_class_2              NUMBER(2),
  job_cate_2               NUMBER(10),
  em_life_2                NUMBER(4) default 0,
  em_health_2              NUMBER(4) default 0,
  pay_period               CHAR(1),
  pay_year                 NUMBER(3),
  end_period               CHAR(1),
  end_year                 NUMBER(3),
  pay_ensure               NUMBER(3),
  pay_type                 CHAR(1),
  charge_period            CHAR(1),
  charge_year              NUMBER(3),
  coverage_period          CHAR(1) not null,
  coverage_year            NUMBER(5),
  short_end_time           DATE,
  except_value             NUMBER(10),
  benefit_level            VARCHAR2(20),
  housekeeper              CHAR(1),
  smoking                  CHAR(1),
  pay_rate                 NUMBER(4,3),
  insured_category         CHAR(1),
  insured_amount           NUMBER(10),
  retired_rate             NUMBER(4,3),
  start_pay                CHAR(1) default 'N' not null,
  pause_cause              NUMBER(2),
  gender_1                 CHAR(1) not null,
  gender_2                 CHAR(1),
  loan_status              CHAR(1) default '0' not null,
  suspend                  CHAR(1) default ('N') not null,
  suspend_cause            NUMBER(2),
  derivation               CHAR(1) default '1' not null,
  next_period_prem         NUMBER(12,2) default 0 not null,
  next_discount_prem       NUMBER(12,2) default 0 not null,
  next_company_prem        NUMBER(12,2) default 0 not null,
  next_employee_prem       NUMBER(12,2) default 0 not null,
  next_normal_prem         NUMBER(12,2) default 0 not null,
  next_weak_prem           NUMBER(12,2) default 0 not null,
  next_job_prem            NUMBER(12,2) default 0 not null,
  next_disable_prem        NUMBER(12,2) default 0 not null,
  age_month                NUMBER(2) default 99 not null,
  related_month            NUMBER(2) default 99 not null,
  increase_rate            NUMBER(5,4) default 0 not null,
  increase_freq            CHAR(1) default '0' not null,
  increase_year            NUMBER(2) default 0 not null,
  house_related            CHAR(1) default 'W' not null,
  smoking_related          CHAR(1) default 'W' not null,
  pay_mode                 NUMBER(2) not null,
  yrt_prem                 NUMBER(12,2) default 0 not null,
  expiry_cash_value        NUMBER(14,2) default 0 not null,
  tax_prem                 NUMBER(12,2) default 0 not null,
  retired                  CHAR(1) default 'W' not null,
  decision_id              NUMBER(2) default 1 not null,
  simple_compound          CHAR(1) default '0' not null,
  loan_rate                NUMBER(5,4),
  count_way                CHAR(1) not null,
  discount_rate            NUMBER(8,6) default 1.00 not null,
  policy_prem              NUMBER(12,2) default 0 not null,
  policy_stand             NUMBER(12,2) default 0 not null,
  bank_code                VARCHAR2(20),
  bank_account             VARCHAR2(40),
  next_policy_prem         NUMBER(12,2) default 0 not null,
  next_tax_prem            NUMBER(12,2) default 0 not null,
  tax_prem_stand           NUMBER(12,2) default 0 not null,
  assign_way               VARCHAR2(1),
  assign_amount            NUMBER(12,2),
  assign_rate              NUMBER(4,3),
  fund_due_date            DATE not null,
  start_pay_date           DATE,
  change_cause             CHAR(1) default '1' not null,
  renew_decision           VARCHAR2(1) default '1' not null,
  bonus_sa                 NUMBER(14,2) default 0 not null,
  policy_prem_waived       CHAR(1) default 'N' not null,
  policy_prem_source       VARCHAR2(1) default 0 not null,
  next_weak_stand          NUMBER(12,2) default 0 not null,
  next_job_stand           NUMBER(12,2) default 0 not null,
  next_disable_stand       NUMBER(12,2) default 0 not null,
  live_range               VARCHAR2(1) default '0' not null,
  move_range               VARCHAR2(1) default '0' not null,
  yrt_stand                NUMBER(12,2) default 0 not null,
  next_yrt_prem            NUMBER(12,2) default 0 not null,
  pay_next                 NUMBER(2) not null,
  reduced_amount           NUMBER(14,2),
  reduced_unit             NUMBER(12,2),
  reduced_level            VARCHAR2(20),
  underwriter_id           NUMBER(10),
  underwrite_time          DATE,
  reuw_desc                VARCHAR2(1000),
  decision_desc            VARCHAR2(1000),
  renew_cause              VARCHAR2(2),
  renew_desc               VARCHAR2(1000),
  latest_bonus_sa          NUMBER(14,2) default 0 not null,
  present_balance          NUMBER(10,2) default 0 not null,
  start_inst_date          DATE,
  anni_balance             NUMBER(14,4) default 0 not null,
  fix_increment            CHAR(1),
  cpf_cost                 NUMBER(13,3) default 0 not null,
  cash_cost                NUMBER(13,3) default 0 not null,
  origin_sa                NUMBER(14,2) default 0 not null,
  origin_bonus_sa          NUMBER(14,2) default 0 not null,
  lat_ori_bonus_sa         NUMBER(14,2) default 0 not null,
  bonus_due_date           DATE,
  risk_code                VARCHAR2(2),
  exposure_rate            NUMBER(4,3) default 1 not null,
  reins_rate               NUMBER(16,6) default 0 not null,
  start_pause_cause        NUMBER(2),
  start_end_cause          NUMBER(2),
  start_liab_state         NUMBER(2) default 1 not null,
  start_prem_status        NUMBER(2) default 1 not null,
  discount_tax             NUMBER(16,6) default 0 not null,
  next_discount_tax        NUMBER(16,6) default 0 not null,
  suspend_chg_id           NUMBER(10),
  tranche_code             VARCHAR2(2),
  mortality_rate           NUMBER(4,3) default 0 not null,
  medical_flag             CHAR(1) default 'N' not null,
  insert_time              DATE default SYSDATE not null,
  update_time              DATE default SYSDATE not null,
  waiver_id                NUMBER(10),
  next_amount              NUMBER(14,2),
  waiver_start             DATE,
  waiver_end               DATE,
  weak_start               DATE,
  weak_end                 DATE,
  job_start                DATE,
  job_end                  DATE,
  disable_start            DATE,
  disable_end              DATE,
  auto_permnt_lapse        CHAR(1) default 'N' not null,
  permnt_lapse_notice_date DATE,
  combo_type               VARCHAR2(10),
  combo_unit               NUMBER(12,2),
  donative_amount          NUMBER(14,2),
  pkg_id                   NUMBER(7),
  product_assumpsit        VARCHAR2(4000),
  rate_table_prem          NUMBER(12,2),
  actual_discount_rate     NUMBER(14,4),
  sub_end_cause            NUMBER(2),
  insurance_category       NUMBER(2),
  insured_ride_type        NUMBER(2),
  vehicle_type             NUMBER(2),
  vehicle_license_num      VARCHAR2(20),
  vehicle_fram_num         VARCHAR2(25),
  vehicle_engine_num       VARCHAR2(25),
  carrying_passenger_num   NUMBER(10),
  surrfee_plan             NUMBER(2),
  annuity_transfered       CHAR(1) default 'N',
  draw_annuity_rate        NUMBER(9,8) default 0,
  loan_amount              NUMBER(14,2)
)


create table T_CONTRACT_PRODUCT_TEST
(
  item_id         NUMBER(10) not null,
  product_num     VARCHAR2(10) not null,
  policy_id       NUMBER(10) not null,
  product_id      NUMBER(10) not null,
  coverage_period CHAR(1) not null,
  coverage_year   NUMBER(5),
  charge_period   CHAR(1) not null,
  charge_year     NUMBER(3),
  pay_type        CHAR(1),
  pay_mode        NUMBER(2) not null,
  initial_type    CHAR(1) not null,
  liability_state NUMBER(2) not null,
  discount_prem   NUMBER(12,2) not null,
  amount          NUMBER(14,2),
  unit            NUMBER(12,2),
  benefit_level   VARCHAR2(20),
  insured_1       NUMBER(10) not null,
  gender_1        CHAR(1) not null,
  job_class_1     NUMBER(2),
  age_1           NUMBER(3) not null,
  policy_year     NUMBER(2) not null,
  apply_date      DATE not null,
  validate_date   DATE not null,
  end_date        DATE not null,
  paidup_date     DATE not null,
  pause_date      DATE,
  fund_due_date   DATE not null,
  pay_to_date     DATE not null,
  loan_rate       NUMBER(5,4),
  fix_increment   CHAR(1),
  anni_balance    NUMBER(14,4) not null,
  premium_year    NUMBER(3) not null,
  job_cate_1      NUMBER(10),
  smoking         CHAR(1),
  age_month       NUMBER(2) not null,
  em_life_1       NUMBER(4) not null,
  master_id       NUMBER(10),
  job_kilo        NUMBER(8,2) not null,
  renewal_type    CHAR(1) not null,
  ins_type        CHAR(1) not null,
  period_prem     NUMBER(12,2) not null
)
;
create table T_CONTRACT_PRODUCT_TEST2
(
  item_id         NUMBER(10) not null,
  product_num     VARCHAR2(10) not null,
  policy_id       NUMBER(10) not null,
  product_id      NUMBER(10) not null,
  coverage_period CHAR(1) not null,
  coverage_year   NUMBER(5),
  charge_period   CHAR(1) not null,
  charge_year     NUMBER(3),
  pay_type        CHAR(1),
  pay_mode        NUMBER(2) not null,
  initial_type    CHAR(1) not null,
  liability_state NUMBER(2) not null,
  discount_prem   NUMBER(12,2) not null,
  amount          NUMBER(14,2),
  unit            NUMBER(12,2),
  benefit_level   VARCHAR2(20),
  insured_1       NUMBER(10) not null,
  gender_1        CHAR(1) not null,
  job_class_1     NUMBER(2),
  age_1           NUMBER(3) not null,
  policy_year     NUMBER(2) not null,
  apply_date      DATE not null,
  validate_date   DATE not null,
  end_date        DATE not null,
  paidup_date     DATE not null,
  pause_date      DATE,
  fund_due_date   DATE not null,
  pay_to_date     DATE not null,
  loan_rate       NUMBER(5,4),
  fix_increment   CHAR(1),
  anni_balance    NUMBER(14,4) not null
)
;
create table T_CONTRACT_SURPLUS_RATE
(
  policy_code  VARCHAR2(20),
  surplus_rate NUMBER(10,6)
)
;
create table T_CONTRACT_SURRENDER_FEE
(
  item_id     NUMBER(10) not null,
  low_year    NUMBER(3) default 0 not null,
  high_year   NUMBER(3) default 999 not null,
  rate        NUMBER(5,4),
  recorder_id NUMBER(10) not null,
  insert_time DATE default SYSDATE not null,
  updater_id  NUMBER(10) not null,
  update_time DATE default SYSDATE not null
)
;
create table T_CONTRACT_SURRENDER_FEE_0812
(
  item_id     NUMBER(10) not null,
  low_year    NUMBER(3) not null,
  high_year   NUMBER(3) not null,
  rate        NUMBER(5,4),
  recorder_id NUMBER(10) not null,
  insert_time DATE not null,
  updater_id  NUMBER(10) not null,
  update_time DATE not null
)
;
create table T_CONTRACT_SURRENDER_FEE_LOG
(
  change_id   NUMBER(10) not null,
  item_id     NUMBER(10) not null,
  old_new     CHAR(1) not null,
  low_year    NUMBER(3) not null,
  high_year   NUMBER(3) not null,
  rate        NUMBER(5,4),
  recorder_id NUMBER(10) not null,
  insert_time DATE default SYSDATE not null,
  updater_id  NUMBER(10) not null,
  update_time DATE default SYSDATE not null
)
;
create table T_CONTROLLER_COMP_STATE
(
  cust_id      NUMBER(20) not null,
  company_name VARCHAR2(240),
  country_code VARCHAR2(3),
  address      VARCHAR2(800)
)
;
create table T_CONTR_PROD_PERIOD_AMOUNT
(
  list_id             NUMBER(10) not null,
  item_id             NUMBER(10) not null,
  blance_year         NUMBER(4) not null,
  begin_sum_sa        NUMBER(12,2) not null,
  end_sum             NUMBER(12,2) not null,
  start_date          DATE not null,
  end_date            DATE not null,
  begin_sum_prem      NUMBER(12,2) not null,
  end_sum_prem        NUMBER(12,2) not null,
  inserted_by         NUMBER(10) not null,
  updated_by          NUMBER(10) not null,
  insert_time         DATE default sysdate not null,
  update_time         DATE default sysdate not null,
  bonus_balance_date  DATE,
  amount_balance_date DATE
)
;
create table T_CONVEY_TYPE
(
  convey_type_id NUMBER(2) not null,
  type_desc      VARCHAR2(200) not null
)
;
create table T_COST_CENTER
(
  cost_center_code VARCHAR2(20) not null,
  cost_center_name VARCHAR2(80) not null,
  organ_id         VARCHAR2(40),
  channel_type     CHAR(1),
  is_valid         CHAR(1) not null,
  insert_time      DATE,
  recorder_id      NUMBER(10),
  update_time      DATE,
  updater_id       NUMBER(10)
)
;
create table T_COUNT_BONUS_RATE
(
  bonus_cal_type VARCHAR2(2) not null,
  start_date     DATE not null,
  end_date       DATE not null,
  sa_rate        NUMBER(5,4) not null,
  bonus_rate     NUMBER(5,4) not null
)
;
create table T_COUNT_DEPT_AWARD
(
  count_award_id    NUMBER(10) not null,
  agent_id          NUMBER(10),
  commision_type_id NUMBER(5),
  year_month        VARCHAR2(6),
  dept_id           VARCHAR2(20),
  total_fyc         NUMBER(10,2),
  rate              NUMBER(5,4),
  money             NUMBER(10,2),
  commision_id      NUMBER(12)
)
;

create table T_COUNT_INDIV_AWARD
(
  count_award_id    NUMBER(10) not null,
  agent_id          NUMBER(10) not null,
  commision_type_id NUMBER(5),
  year_month        VARCHAR2(6),
  indiv_id          NUMBER(10),
  total_fyc         NUMBER(10,2),
  rate              NUMBER(4,3),
  money             NUMBER(10,2),
  commision_id      NUMBER(12)
)
;
create table T_COVERAGE_CATEGORY
(
  category_id NUMBER(10) not null,
  category    VARCHAR2(50)
)
;
create table T_COVERAGE
(
  coverage_id   NUMBER(10) not null,
  category_id   NUMBER(10),
  coverage_name VARCHAR2(100)
)
;
create table T_COVERAGE_CALTYPE
(
  type_id   NUMBER(3) not null,
  content   VARCHAR2(1000),
  type_desc VARCHAR2(4000),
  cate_id   NUMBER(2)
)
;
create table T_COVERAGE_CALCU
(
  product_id     NUMBER(7) not null,
  coverage_id    NUMBER(10) not null,
  order_no       NUMBER(2) not null,
  cal_type       NUMBER(3),
  start_type     NUMBER(3),
  end_type       NUMBER(3),
  cal_desc       VARCHAR2(2000),
  benefit_value1 NUMBER(12,2) default 0,
  benefit_value2 NUMBER(12,2) default 0,
  benefit_value3 NUMBER(12,2) default 0,
  benefit_value4 NUMBER(12,2) default 0,
  benefit_rate1  NUMBER(6,4) default 0,
  benefit_rate2  NUMBER(6,4) default 0,
  benefit_rate3  NUMBER(6,4) default 0,
  benefit_rate4  NUMBER(6,4) default 0,
  year_interval  NUMBER(2) default 0,
  hold_year      NUMBER(3) default 0,
  draw_age       NUMBER(3) default 0,
  start_age      NUMBER(3) default 0,
  end_age        NUMBER(3) default 0,
  increase_time  NUMBER(2) default 0,
  increase_rate  NUMBER(5,4) default 0
)
;
create table T_COVERAGE_CODE_MAPPING
(
  product_id       NUMBER(7),
  coverage_code    VARCHAR2(20),
  coverage_type    VARCHAR2(5),
  coverage_class_1 VARCHAR2(5),
  coverage_class_2 VARCHAR2(5),
  coverage_class_3 VARCHAR2(5),
  specific_code    VARCHAR2(10)
)
;
create table T_COVERAGE_DESC
(
  product_id    NUMBER(7) not null,
  category_id   NUMBER(10) not null,
  coverage_desc VARCHAR2(4000)
)
;
create table T_COVERAGE_LAYER
(
  product_id    NUMBER(7) not null,
  coverage_id   NUMBER(10) not null,
  benefit_level VARCHAR2(20) not null,
  benefit_value NUMBER(12,2) default 0,
  benefit_unit  VARCHAR2(10)
)
;
create table T_COVERAGE_MATERIAL
(
  coverage_id NUMBER(10) not null,
  material_id NUMBER(10) not null
)
;
create table T_COVERAGE_TYPE
(
  js_type_code VARCHAR2(10) not null,
  type_code    VARCHAR2(10) not null,
  js_type_name VARCHAR2(100) not null
)
;
create table T_COVER_CAUSE
(
  cause_code  NUMBER(3) not null,
  description VARCHAR2(100) not null
)
;
create table T_CPI
(
  appno              VARCHAR2(16),
  applicant          NUMBER(10) not null,
  memberno           NUMBER(6) not null,
  clientno           NUMBER(10),
  name               VARCHAR2(10) not null,
  sex                VARCHAR2(1),
  birthday           DATE,
  id_type            NUMBER(2) not null,
  idno               VARCHAR2(30) not null,
  home_tel           VARCHAR2(40),
  home_addr          VARCHAR2(60),
  home_pc            VARCHAR2(6),
  ascript_start_date DATE,
  rank               VARCHAR2(2) not null,
  salary             NUMBER(12,2) default 0 not null,
  pay_type           CHAR(1) not null,
  pay_age            NUMBER(4) default 0 not null,
  psn_sum            NUMBER(12,2) default 0 not null,
  corp_sum           NUMBER(12,2) default 0 not null,
  invest1_rate       NUMBER(5,4) default 0 not null,
  invest2_rate       NUMBER(5,4) default 0 not null,
  invest3_rate       NUMBER(5,4) default 0 not null,
  generate_flag      VARCHAR2(1) default 'N' not null
)
;
create table T_CREDENCE_PRINT
(
  print_id       NUMBER(12) not null,
  type           VARCHAR2(50),
  busi_source    VARCHAR2(10),
  receipt_code   VARCHAR2(20),
  policy_code    VARCHAR2(20),
  notice_code    VARCHAR2(200),
  applicant_name VARCHAR2(40),
  certi_code     VARCHAR2(50),
  amount         VARCHAR2(100),
  print_time     VARCHAR2(10),
  agent_code     VARCHAR2(25),
  handler_code   VARCHAR2(20),
  accepter_code  VARCHAR2(20),
  print_type     NUMBER(2),
  print_group    NUMBER(10)
)
;
create table T_CROSS_COMM_RATE
(
  product_id  NUMBER(7) not null,
  charge_type CHAR(1) not null,
  policy_year NUMBER(2) not null,
  rate        NUMBER(5,4)
)
;
create table T_CS_APPROVAL_LIMIT
(
  level_code        VARCHAR2(6) not null,
  cs_type           VARCHAR2(1) not null,
  service_id        NUMBER(4) not null,
  max_pay_amount    NUMBER(10) not null,
  max_receiv_amount NUMBER(10) not null
)
;
create table T_CS_BACK_TYPE
(
  back_type NUMBER(1),
  type_name VARCHAR2(200)
)
;
create table T_RETRACE_CAUSE
(
  cause_id   NUMBER(2) not null,
  cause_desc VARCHAR2(40) not null
)
;
create table T_CS_BACK_ENTRY
(
  list_id        NUMBER(10),
  change_id      NUMBER(10),
  operator_id    NUMBER(10),
  back_type      NUMBER(1),
  back_cause     VARCHAR2(1000),
  insert_time    DATE,
  cause_category NUMBER(2)
)
;
create table T_CS_BANK_ACCOUNT
(
  list_id            NUMBER(10) not null,
  policy_id          NUMBER(10),
  change_id          NUMBER(10),
  case_id            NUMBER(10),
  insured_id         NUMBER(10),
  bank_code          VARCHAR2(20) not null,
  bank_account       VARCHAR2(40) not null,
  acco_name          VARCHAR2(120),
  certi_type         NUMBER(2),
  certi_code         VARCHAR2(50),
  account_status     VARCHAR2(1) not null,
  suspend_cause      VARCHAR2(1),
  apply_date         DATE not null,
  operater_id        NUMBER(10) not null,
  insert_time        DATE default SYSDATE not null,
  ibg_code           VARCHAR2(30),
  send_id            NUMBER(10),
  is_basic           CHAR(1) default 'N' not null,
  account_type       CHAR(1) default '7' not null,
  cause_desc         VARCHAR2(1000),
  unsuccess_id       VARCHAR2(4),
  record_id          NUMBER(10),
  record_time        DATE,
  organ_id           VARCHAR2(40),
  transfer_name      VARCHAR2(100),
  prov_district_name VARCHAR2(50),
  city_district_name VARCHAR2(50),
  public_private     CHAR(1) default '1',
  true_sign          CHAR(1),
  update_time        DATE default SYSDATE
)
;
create table T_CS_BANK_ACCOUNT_BAK
(
  list_id            NUMBER(10) not null,
  policy_id          NUMBER(10),
  change_id          NUMBER(10),
  case_id            NUMBER(10),
  insured_id         NUMBER(10),
  bank_code          VARCHAR2(20) not null,
  bank_account       VARCHAR2(40) not null,
  acco_name          VARCHAR2(100),
  certi_type         NUMBER(2),
  certi_code         VARCHAR2(50),
  account_status     VARCHAR2(1) not null,
  suspend_cause      VARCHAR2(1),
  apply_date         DATE not null,
  operater_id        NUMBER(10) not null,
  insert_time        DATE default SYSDATE not null,
  ibg_code           VARCHAR2(30),
  send_id            NUMBER(10),
  is_basic           CHAR(1) default 'N' not null,
  account_type       CHAR(1) default '7' not null,
  cause_desc         VARCHAR2(1000),
  unsuccess_id       VARCHAR2(4),
  record_id          NUMBER(10),
  record_time        DATE,
  organ_id           VARCHAR2(40),
  transfer_name      VARCHAR2(100),
  prov_district_name VARCHAR2(50),
  city_district_name VARCHAR2(50),
  public_private     CHAR(1) default '1'
)
;
create table T_CS_BANK_ACCOUNT_LOG
(
  change_id          NUMBER(10) not null,
  old_new            CHAR(1) not null,
  list_id            NUMBER(10) not null,
  policy_id          NUMBER(10),
  case_id            NUMBER(10),
  insured_id         NUMBER(10),
  bank_code          VARCHAR2(20) not null,
  bank_account       VARCHAR2(40) not null,
  acco_name          VARCHAR2(100),
  certi_type         NUMBER(2),
  certi_code         VARCHAR2(50),
  account_status     VARCHAR2(1) not null,
  suspend_cause      VARCHAR2(1),
  apply_date         DATE not null,
  operater_id        NUMBER(10) not null,
  insert_time        DATE default SYSDATE not null,
  ibg_code           VARCHAR2(30),
  send_id            NUMBER(10),
  is_basic           CHAR(1) default 'N' not null,
  account_type       CHAR(1) default '7' not null,
  cause_desc         VARCHAR2(1000),
  unsuccess_id       VARCHAR2(4),
  record_id          NUMBER(10),
  record_time        DATE,
  organ_id           VARCHAR2(40),
  transfer_name      VARCHAR2(100),
  prov_district_name VARCHAR2(50),
  city_district_name VARCHAR2(50),
  public_private     CHAR(1) default '1'
)
;
create table T_CS_FEE_ACCOUNT_CHANGE
(
  list_id      NUMBER(10),
  fee_id       NUMBER(12),
  bank_code    VARCHAR2(20),
  bank_account VARCHAR2(40),
  change_date  DATE default SYSDATE,
  change_id    NUMBER(12),
  fee_amount   NUMBER(12,2),
  pay_mode     NUMBER(2),
  payee_name   VARCHAR2(150),
  acco_name    VARCHAR2(100)
)
;
create table T_CS_OPERATION_TYPE
(
  type_id   VARCHAR2(2),
  type_desc VARCHAR2(30)
)
;
create table T_CS_OPERATION
(
  operation_id   NUMBER(10),
  change_id      NUMBER(10),
  operation_type VARCHAR2(2),
  operator_id    NUMBER(10),
  operate_time   DATE,
  memo           VARCHAR2(300)
)
;
create table T_RETRACE_OPERATE
(
  operate_id   NUMBER(2) not null,
  operate_desc VARCHAR2(40) not null
)
;
create table T_CS_RETRACE_RECORD
(
  list_id         NUMBER(10) not null,
  change_id       NUMBER(10),
  operator_id     NUMBER(10),
  retrace_operate NUMBER(2),
  retrace_cause   VARCHAR2(1000),
  cause_category  NUMBER(2),
  insert_time     DATE
)
;
create table T_CS_RULE_ERR_RECORD
(
  record_id        NUMBER(10) not null,
  policy_code      VARCHAR2(20) not null,
  check_time       DATE not null,
  cs_rule_position VARCHAR2(100),
  change_id        NUMBER(10),
  service_id       NUMBER(10),
  record_type      CHAR(1) not null,
  cs_rule_code     VARCHAR2(1000),
  err_message      VARCHAR2(3990)
)
;
create table T_CS_SPECIAL_ROLLBACK
(
  change_id           NUMBER(10) not null,
  cause_id            NUMBER(2),
  cause_detail        VARCHAR2(1000),
  special_change_name VARCHAR2(50) not null
)
;
create table T_CS_USER_APPR
(
  user_id       NUMBER(10) not null,
  cs_appr_type  VARCHAR2(1) default '0' not null,
  cs_appr_level VARCHAR2(6),
  insert_id     NUMBER(10),
  updater_id    NUMBER(10),
  insert_time   DATE default sysdate,
  update_time   DATE default sysdate
)
;
create table T_CUMULATIVE_ACCOUNT
(
  account_id       NUMBER(10) not null,
  policy_id        NUMBER(10) not null,
  insured_num      NUMBER(10),
  policy_type      CHAR(1) not null,
  capital_balance  NUMBER(16,6) not null,
  interest_capital NUMBER(16,6) not null,
  interest_balance NUMBER(16,6) not null,
  interest_sum     NUMBER(16,6) not null,
  balance_date     DATE not null,
  create_time      DATE not null,
  settled_time     DATE not null,
  account_type     VARCHAR2(2) default '1' not null
)
;
create table T_CUMULATIVE_ACCOUNT_LOG
(
  change_id        NUMBER(10) not null,
  old_new          CHAR(1) not null,
  account_id       NUMBER(10) not null,
  policy_id        NUMBER(10) not null,
  insured_num      NUMBER(10),
  policy_type      CHAR(1) not null,
  capital_balance  NUMBER(16,6) not null,
  interest_capital NUMBER(16,6) not null,
  interest_balance NUMBER(16,6) not null,
  interest_sum     NUMBER(16,6) not null,
  balance_date     DATE not null,
  create_time      DATE not null,
  settled_time     DATE not null,
  account_type     VARCHAR2(2) default '1' not null
)
;
create table T_CUMULATIVE_LIST
(
  list_id     NUMBER(12) not null,
  account_id  NUMBER(10) not null,
  loan_time   DATE not null,
  loan_amount NUMBER(16,6) not null,
  loan_code   VARCHAR2(1) not null,
  change_id   NUMBER(10),
  recorder_id NUMBER(10) not null,
  record_time DATE default SYSDATE not null,
  case_id     NUMBER(10)
)
;
create table T_CUMULATIVE_LIST_LOG
(
  change_id   NUMBER(10) not null,
  old_new     CHAR(1) not null,
  list_id     NUMBER(12) not null,
  account_id  NUMBER(10) not null,
  loan_time   DATE not null,
  loan_amount NUMBER(16,6) not null,
  loan_code   VARCHAR2(1) not null,
  recorder_id NUMBER(10) not null,
  record_time DATE default SYSDATE not null,
  case_id     NUMBER(10)
)
;
create table T_CUMU_TYPE
(
  cumu_type_id NUMBER(3) not null,
  type_name    VARCHAR2(100) not null
)
;
create table T_CUMU_TOTAL
(
  cumu_type_id NUMBER(3) not null,
  stat_ymd     VARCHAR2(8) not null,
  sum_amount   NUMBER(16,4) not null,
  insert_time  DATE default sysdate not null
)
;
create table T_CUSTOMERMERGE_LOG
(
  log_id               NUMBER(10) not null,
  customer_id          NUMBER(10) not null,
  real_name            VARCHAR2(100) not null,
  gender               CHAR(1) not null,
  birthday             DATE not null,
  certi_type           NUMBER(2) not null,
  certi_code           VARCHAR2(50) not null,
  marriage_id          CHAR(1),
  education_id         VARCHAR2(2),
  address_1            VARCHAR2(150),
  zip_1                VARCHAR2(10),
  tel_1                VARCHAR2(40),
  job_com              VARCHAR2(100),
  tel_3                VARCHAR2(40),
  height               NUMBER(4,1),
  weight               NUMBER(5,2),
  rela_address         VARCHAR2(200),
  rela_zip             VARCHAR2(10),
  email                VARCHAR2(100),
  rela_other           VARCHAR2(30),
  income               NUMBER(10),
  job_1                VARCHAR2(200),
  job_2                VARCHAR2(40),
  job_class            NUMBER(2),
  job_code             VARCHAR2(20),
  job_cate_id          NUMBER(10),
  nationality          VARCHAR2(50),
  seat_address         VARCHAR2(100),
  job_kind             NUMBER(2),
  job_zip              VARCHAR2(50),
  job_address          VARCHAR2(200),
  other_address        VARCHAR2(200),
  other_zip            VARCHAR2(10),
  title                VARCHAR2(50),
  job_tel              VARCHAR2(30),
  em_life              NUMBER(4) not null,
  em_ill               NUMBER(4) not null,
  smoking              CHAR(1) not null,
  insert_time          DATE not null,
  status               CHAR(1) not null,
  death_time           DATE,
  job_class_2          NUMBER(2),
  job_code_2           VARCHAR2(20),
  job_cate_id_2        NUMBER(10),
  bp                   VARCHAR2(30),
  celler               VARCHAR2(30),
  driving_licence      CHAR(1) not null,
  ss_code              VARCHAR2(30),
  retired              CHAR(1) not null,
  ss_reg_code          VARCHAR2(30),
  region_code          VARCHAR2(10),
  password             VARCHAR2(32),
  rela_address_2       VARCHAR2(100),
  rela_address_3       VARCHAR2(100),
  rela_address_4       VARCHAR2(100),
  address_2            VARCHAR2(100),
  address_3            VARCHAR2(100),
  address_4            VARCHAR2(100),
  job_address_2        VARCHAR2(100),
  job_address_3        VARCHAR2(100),
  job_address_4        VARCHAR2(100),
  lang_id              VARCHAR2(3),
  homeplace            VARCHAR2(100),
  nation_code          VARCHAR2(2),
  accident_status      VARCHAR2(2) not null,
  update_time          DATE not null,
  householder          CHAR(1) not null,
  honor_title          VARCHAR2(30),
  organ_id             VARCHAR2(40),
  pwd_print            NUMBER(4) not null,
  cust_grade           VARCHAR2(2) not null,
  ori_certi_code       VARCHAR2(50),
  focus_type           VARCHAR2(1) not null,
  employed             CHAR(1) not null,
  emp_id               NUMBER(10),
  country_code         VARCHAR2(3),
  blacklist_cause      NUMBER(2),
  social_security      CHAR(1),
  industry             VARCHAR2(40),
  blacklist_date       DATE,
  blacklist_source     VARCHAR2(255),
  job_content          VARCHAR2(400),
  mobile               VARCHAR2(30),
  school               VARCHAR2(300),
  class_name           VARCHAR2(100),
  noteservice          CHAR(1),
  acc_noteservice      CHAR(1),
  certi_start_date     DATE,
  certi_end_date       DATE,
  pay_address          VARCHAR2(200),
  pay_zip              VARCHAR2(10),
  area_id              VARCHAR2(10),
  family_income        NUMBER(10),
  residence            VARCHAR2(50),
  address_type         CHAR(1),
  celler_areacode      VARCHAR2(10),
  special_work         CHAR(1),
  merge_insert_time    DATE not null,
  merge_operate_user   NUMBER(10) not null,
  merge_status         NUMBER(1) not null,
  merge_customernew_id NUMBER(10),
  merge_dcustomer_id   NUMBER(10),
  merge_scustomer_id   NUMBER(10),
  merge_business_type  VARCHAR2(100),
  business_id          NUMBER(10)
)
;

create table T_CUSTOMER_ADDRESS
(
  customer_id           NUMBER(10) not null,
  area_id_job           VARCHAR2(10),
  town_address_job      VARCHAR2(100),
  village_address_job   VARCHAR2(100),
  area_id_rela          VARCHAR2(10),
  town_address_rela     VARCHAR2(100),
  village_address_rela  VARCHAR2(100),
  area_id_other         VARCHAR2(10),
  town_address_other    VARCHAR2(100),
  village_address_other VARCHAR2(100),
  insert_time           DATE,
  update_time           DATE
)
;
create table T_CUSTOMER_ADDRESS_HOUSE
(
  customer_id     NUMBER(10) not null,
  addr_type       VARCHAR2(100) not null,
  area_id         VARCHAR2(10),
  town_address    VARCHAR2(100),
  village_address VARCHAR2(100),
  zip             VARCHAR2(10),
  whole_address   VARCHAR2(100)
)
;
create table T_CUSTOMER_ADDRESS_LOG
(
  change_id             NUMBER(10) not null,
  old_new               CHAR(1) not null,
  customer_id           NUMBER(10) not null,
  area_id_job           VARCHAR2(10),
  town_address_job      VARCHAR2(100),
  village_address_job   VARCHAR2(100),
  area_id_rela          VARCHAR2(10),
  town_address_rela     VARCHAR2(100),
  village_address_rela  VARCHAR2(100),
  area_id_other         VARCHAR2(10),
  town_address_other    VARCHAR2(100),
  village_address_other VARCHAR2(100)
)
;
create table T_CUSTOMER_CHANGE_UNIT
(
  change_id   NUMBER(10) not null,
  customer_id NUMBER(10) not null,
  policy_id   NUMBER(10),
  real_name   VARCHAR2(120),
  gender      CHAR(1),
  birthday    DATE,
  certi_type  NUMBER(2),
  certi_code  VARCHAR2(50)
)
;
create table T_CUSTOMER_DEL
(
  customer_id NUMBER(10),
  delete_time DATE default SYSDATE not null
)
;
create table T_CUSTOMER_EXT
(
  customer_id    NUMBER(10) not null,
  relation_first CHAR(1)
)
;
create table T_CUSTOMER_HOSPITAL
(
  customer_id   NUMBER(10) not null,
  hospital_code VARCHAR2(20) not null
)
;
create table T_CUSTOMER_HOSPITAL_LOG
(
  change_id     NUMBER(10) not null,
  old_new       CHAR(1) not null,
  customer_id   NUMBER(10) not null,
  hospital_code VARCHAR2(20) not null
)
;
create table T_CUSTOMER_LOG
(
  change_id           NUMBER(10) not null,
  old_new             CHAR(1) not null,
  customer_id         NUMBER(10) not null,
  real_name           VARCHAR2(120),
  gender              CHAR(1),
  birthday            DATE,
  death_time          DATE,
  certi_type          NUMBER(2),
  certi_code          VARCHAR2(50),
  marriage_id         CHAR(1),
  education_id        VARCHAR2(2),
  address_1           VARCHAR2(150),
  zip_1               VARCHAR2(10),
  tel_1               VARCHAR2(40),
  job_com             VARCHAR2(100),
  job_kind            NUMBER(2),
  tel_3               VARCHAR2(40),
  job_zip             VARCHAR2(50),
  email               VARCHAR2(100),
  rela_address        VARCHAR2(200),
  rela_zip            VARCHAR2(10),
  nationality         VARCHAR2(50),
  seat_address        VARCHAR2(200),
  income              NUMBER(10),
  job_code            VARCHAR2(20),
  job_cate_id         NUMBER(10),
  job_class           NUMBER(2),
  organ_id            VARCHAR2(40),
  celler              VARCHAR2(30),
  bp                  VARCHAR2(30),
  job_address         VARCHAR2(200),
  title               VARCHAR2(50),
  job_cate_id_2       NUMBER(10),
  ss_code             VARCHAR2(30),
  height              NUMBER(4,1),
  weight              NUMBER(5,2),
  driving_licence     CHAR(1) default 'N' not null,
  retired             CHAR(1) default 'N' not null,
  job_1               VARCHAR2(200),
  job_2               VARCHAR2(40),
  job_class_2         NUMBER(2),
  job_code_2          VARCHAR2(20),
  em_life             NUMBER(4),
  em_ill              NUMBER(4),
  smoking             CHAR(1),
  status              CHAR(1),
  ss_reg_code         VARCHAR2(30),
  region_code         VARCHAR2(10),
  rela_address_2      VARCHAR2(100),
  rela_address_3      VARCHAR2(100),
  rela_address_4      VARCHAR2(100),
  address_2           VARCHAR2(100),
  address_3           VARCHAR2(100),
  address_4           VARCHAR2(100),
  job_address_2       VARCHAR2(100),
  job_address_3       VARCHAR2(100),
  job_address_4       VARCHAR2(100),
  password            VARCHAR2(32),
  lang_id             VARCHAR2(3),
  homeplace           VARCHAR2(100),
  birthday_valid      CHAR(1) default 'Y' not null,
  accident_status     VARCHAR2(2) default '0' not null,
  householder         CHAR(1) default 'Y' not null,
  honor_title         VARCHAR2(30),
  pwd_print           NUMBER(4) default 0 not null,
  cust_grade          VARCHAR2(2) default 1 not null,
  ori_certi_code      VARCHAR2(50),
  focus_type          VARCHAR2(1) default '1' not null,
  employed            CHAR(1) default 'N' not null,
  emp_id              NUMBER(10),
  country_code        VARCHAR2(3),
  nation_code         VARCHAR2(2),
  blacklist_cause     NUMBER(2),
  insert_time         DATE default SYSDATE not null,
  update_time         DATE default SYSDATE not null,
  social_security     CHAR(1) default 'N',
  noteservice         CHAR(1) default 'N',
  acc_noteservice     CHAR(1) default 'N',
  rela_other          VARCHAR2(30),
  area_id             VARCHAR2(10),
  certi_start_date    DATE,
  certi_end_date      DATE,
  celler_areacode     VARCHAR2(10),
  address_type        CHAR(1),
  residence           VARCHAR2(50),
  family_income       NUMBER(10),
  pay_zip             VARCHAR2(10),
  pay_address         VARCHAR2(200),
  class_name          VARCHAR2(100),
  school              VARCHAR2(300),
  mobile              VARCHAR2(30),
  blacklist_source    VARCHAR2(255),
  blacklist_date      DATE,
  other_zip           VARCHAR2(10),
  other_address       VARCHAR2(200),
  job_tel             VARCHAR2(30),
  job_content         VARCHAR2(400),
  industry            VARCHAR2(40),
  income_tax_payment  CHAR(1),
  tax_register_no     VARCHAR2(50),
  sup_med_insurance   CHAR(1),
  resident_type       NUMBER(2),
  working_life        NUMBER(2),
  is_chinese_only     CHAR(1),
  authorization_sign  CHAR(1),
  is_paid_for_disease CHAR(1),
  is_filed_poor       CHAR(1)
)
;
create table T_CUSTOMER_MAOB_TEST
(
  customer_id        NUMBER(10) not null,
  real_name          VARCHAR2(120) not null,
  gender             CHAR(1) not null,
  birthday           DATE not null,
  certi_type         NUMBER(2) not null,
  certi_code         VARCHAR2(50) not null,
  marriage_id        CHAR(1),
  education_id       VARCHAR2(2),
  address_1          VARCHAR2(150),
  zip_1              VARCHAR2(10),
  tel_1              VARCHAR2(40),
  job_com            VARCHAR2(100),
  tel_3              VARCHAR2(40),
  height             NUMBER(4,1),
  weight             NUMBER(5,2),
  rela_address       VARCHAR2(200),
  rela_zip           VARCHAR2(10),
  email              VARCHAR2(100),
  rela_other         VARCHAR2(30),
  income             NUMBER(14,4),
  job_1              VARCHAR2(200),
  job_2              VARCHAR2(40),
  job_class          NUMBER(2),
  job_code           VARCHAR2(20),
  job_cate_id        NUMBER(10),
  nationality        VARCHAR2(50),
  seat_address       VARCHAR2(200),
  job_kind           NUMBER(2),
  job_zip            VARCHAR2(50),
  job_address        VARCHAR2(200),
  other_address      VARCHAR2(200),
  other_zip          VARCHAR2(10),
  title              VARCHAR2(50),
  job_tel            VARCHAR2(30),
  em_life            NUMBER(4) not null,
  em_ill             NUMBER(4) not null,
  smoking            CHAR(1) not null,
  insert_time        DATE not null,
  status             CHAR(1) not null,
  death_time         DATE,
  job_class_2        NUMBER(2),
  job_code_2         VARCHAR2(20),
  job_cate_id_2      NUMBER(10),
  bp                 VARCHAR2(30),
  celler             VARCHAR2(30),
  driving_licence    CHAR(1) not null,
  ss_code            VARCHAR2(30),
  retired            CHAR(1) not null,
  ss_reg_code        VARCHAR2(30),
  region_code        VARCHAR2(10),
  password           VARCHAR2(32),
  rela_address_2     VARCHAR2(100),
  rela_address_3     VARCHAR2(100),
  rela_address_4     VARCHAR2(100),
  address_2          VARCHAR2(100),
  address_3          VARCHAR2(100),
  address_4          VARCHAR2(100),
  job_address_2      VARCHAR2(100),
  job_address_3      VARCHAR2(100),
  job_address_4      VARCHAR2(100),
  lang_id            VARCHAR2(3),
  homeplace          VARCHAR2(100),
  nation_code        VARCHAR2(2),
  accident_status    VARCHAR2(2) not null,
  update_time        DATE not null,
  householder        CHAR(1) not null,
  honor_title        VARCHAR2(30),
  organ_id           VARCHAR2(40),
  pwd_print          NUMBER(4) not null,
  cust_grade         VARCHAR2(2) not null,
  ori_certi_code     VARCHAR2(50),
  focus_type         VARCHAR2(1) not null,
  employed           CHAR(1) not null,
  emp_id             NUMBER(10),
  country_code       VARCHAR2(3),
  blacklist_cause    NUMBER(2),
  social_security    CHAR(1),
  industry           VARCHAR2(40),
  blacklist_date     DATE,
  blacklist_source   VARCHAR2(255),
  job_content        VARCHAR2(400),
  mobile             VARCHAR2(30),
  school             VARCHAR2(300),
  class_name         VARCHAR2(100),
  noteservice        CHAR(1),
  acc_noteservice    CHAR(1),
  certi_start_date   DATE,
  certi_end_date     DATE,
  pay_address        VARCHAR2(200),
  pay_zip            VARCHAR2(10),
  area_id            VARCHAR2(10),
  residence          CHAR(1),
  family_income      NUMBER(14,4),
  address_type       CHAR(1),
  celler_areacode    VARCHAR2(10),
  income_tax_payment CHAR(1),
  tax_register_no    VARCHAR2(50),
  sup_med_insurance  CHAR(1),
  stage_id           NUMBER(2)
)
;
create table T_CUSTOMER_MAPPING
(
  mapping_id        NUMBER(10) not null,
  core_customer_id  NUMBER(10) not null,
  outer_customer_id NUMBER(10) not null,
  issue_way         NUMBER(10) not null,
  insert_time       DATE not null,
  update_time       DATE not null
)
;
create table T_CUSTOMER_MERGE
(
  merge_id       NUMBER(10),
  operator_id    NUMBER(10) not null,
  d_customer_id  NUMBER(10) not null,
  s_customer_id  NUMBER(10) not null,
  submit_time    DATE default SYSDATE not null,
  finish_time    DATE,
  operate_type   NUMBER(1) not null,
  operate_status NUMBER(1) not null,
  operate_result NUMBER(1),
  merge_result   VARCHAR2(2000)
)
;
create table T_CUSTOMER_REGISTER
(
  register_id      NUMBER(20) not null,
  biz_cust_id      NUMBER(20) not null,
  biz_cust_type    NUMBER(2) not null,
  status           NUMBER(2) not null,
  real_name        VARCHAR2(120) not null,
  gender           CHAR(1) not null,
  birthday         DATE not null,
  country_code     VARCHAR2(3) not null,
  seat_address     VARCHAR2(120),
  certi_type       NUMBER(2) not null,
  certi_code       VARCHAR2(50) not null,
  certi_start_date DATE,
  certi_end_date   DATE,
  job              VARCHAR2(200),
  job_content      VARCHAR2(400),
  job_class        NUMBER(2),
  job_code         VARCHAR2(20),
  job_cate_id      NUMBER(10),
  job_com          VARCHAR2(100),
  working_life     VARCHAR2(50),
  industry         VARCHAR2(100),
  rela_address     VARCHAR2(200),
  rela_zip         VARCHAR2(50),
  address_type     CHAR(1),
  mobile           VARCHAR2(30),
  certi_copy_type  NUMBER(2),
  input_copy_type  VARCHAR2(100),
  notes            VARCHAR2(1000),
  insert_time      DATE default SYSDATE,
  update_time      DATE default SYSDATE
)
;
create table T_CUSTOMER_REGISTER_LIST
(
  list_id          NUMBER(20) not null,
  register_id      NUMBER(20) not null,
  biz_cust_id      NUMBER(20) not null,
  biz_cust_type    NUMBER(2) not null,
  status           NUMBER(2) not null,
  real_name        VARCHAR2(120) not null,
  gender           CHAR(1) not null,
  birthday         DATE not null,
  country_code     VARCHAR2(3) not null,
  seat_address     VARCHAR2(120),
  certi_type       NUMBER(2) not null,
  certi_code       VARCHAR2(50) not null,
  certi_start_date DATE,
  certi_end_date   DATE,
  job              VARCHAR2(200),
  job_content      VARCHAR2(400),
  job_class        NUMBER(2),
  job_code         VARCHAR2(20),
  job_cate_id      NUMBER(10),
  job_com          VARCHAR2(100),
  working_life     VARCHAR2(50),
  industry         VARCHAR2(100),
  rela_address     VARCHAR2(200),
  rela_zip         VARCHAR2(50),
  address_type     CHAR(1),
  mobile           VARCHAR2(30),
  certi_copy_type  NUMBER(2),
  input_copy_type  VARCHAR2(100),
  notes            VARCHAR2(1000),
  operator_id      NUMBER(10),
  insert_time      DATE default SYSDATE,
  update_time      DATE default SYSDATE
)
;
create table T_CUSTOMER_REPRESENT
(
  policy_id         NUMBER(10) not null,
  customer_id       NUMBER(10) not null,
  representation_id NUMBER(10) not null,
  yes_no            CHAR(1) not null,
  notes             VARCHAR2(400),
  fill_1            VARCHAR2(400),
  fill_2            VARCHAR2(400),
  fill_3            VARCHAR2(400),
  fill_4            VARCHAR2(400),
  fill_5            VARCHAR2(400),
  fill_6            VARCHAR2(400),
  fill_7            VARCHAR2(400),
  fill_8            VARCHAR2(400),
  fill_9            VARCHAR2(400),
  fill_10           VARCHAR2(400),
  customer_repre_id NUMBER(10)
)
;
create table T_CUSTOMER_REPRESENT_LOG
(
  change_id         NUMBER(10) not null,
  policy_id         NUMBER(10) not null,
  customer_id       NUMBER(10) not null,
  representation_id NUMBER(10) not null,
  old_new           CHAR(1) not null,
  yes_no            CHAR(1) not null,
  notes             VARCHAR2(400),
  fill_1            VARCHAR2(400),
  fill_2            VARCHAR2(400),
  fill_3            VARCHAR2(400),
  fill_4            VARCHAR2(400),
  fill_5            VARCHAR2(400),
  fill_6            VARCHAR2(400),
  fill_7            VARCHAR2(400),
  fill_8            VARCHAR2(400),
  fill_9            VARCHAR2(400),
  fill_10           VARCHAR2(400)
)
;
create table T_CUSTOMER_REPRE_DETAIL
(
  detail_id         NUMBER(10),
  customer_repre_id NUMBER(10) not null,
  company_type      CHAR(1) not null,
  company_name      VARCHAR2(240),
  hold_date         DATE,
  product_name      VARCHAR2(200) not null,
  death_amount      NUMBER(12,2) not null,
  validate_date     DATE
)
;
create table T_CUSTOMER_RESIDENCE
(
  type_id   CHAR(1) not null,
  type_name VARCHAR2(50) not null
)
;
create table T_CUSTOMER_STATEMENT
(
  cust_id          NUMBER(20) not null,
  ecif_id          NUMBER(20),
  resident_type    NUMBER(2),
  statement_status NUMBER(2),
  surname          VARCHAR2(120),
  given_name       VARCHAR2(120),
  full_name        VARCHAR2(120),
  birthday         DATE,
  insert_time      DATE default SYSDATE,
  update_time      DATE default SYSDATE
)
;
create table T_CUSTOMER_TAX_INFO
(
  customer_id        NUMBER(10) not null,
  tax_branch_code    VARCHAR2(50),
  tax_branch_name    VARCHAR2(500),
  tax_land_code      VARCHAR2(10),
  social_credit_code VARCHAR2(50),
  tax_identify_code  VARCHAR2(50)
)
;
create table T_CUSTOMER_TAX_INFO_LOG
(
  change_id          NUMBER(10) not null,
  old_new            CHAR(1) not null,
  customer_id        NUMBER(10) not null,
  tax_branch_code    VARCHAR2(50),
  tax_branch_name    VARCHAR2(500),
  tax_land_code      VARCHAR2(10),
  social_credit_code VARCHAR2(50),
  tax_identify_code  VARCHAR2(50)
)
;
create table T_CUSTOMER_TEMP
(
  customer_id    NUMBER(10) not null,
  certi_end_date DATE
)
;
create table T_CUSTOMER_TMP1
(
  real_name  VARCHAR2(300) not null,
  gender     VARCHAR2(6) not null,
  certi_type NUMBER(2) not null,
  certi_code VARCHAR2(150) not null,
  birthday   DATE not null,
  amount     NUMBER(10,2)
)
;
create table T_CUSTOMER_TMP2
(
  insurant_num NUMBER(10) not null,
  real_name    VARCHAR2(300) not null,
  gender       CHAR(3) not null,
  certi_type   NUMBER(2) not null,
  certi_code   VARCHAR2(150) not null,
  birthday     DATE not null
)
;
create table T_CUSTOMER_TMP3
(
  insured_num NUMBER(10) not null,
  amount      NUMBER(10,2) not null
)
;
create table T_CUSTOMER_ZHONGYOU
(
  gender      CHAR(1),
  birthday    DATE,
  certi_type  NUMBER(2),
  real_name   VARCHAR2(100),
  certi_code  VARCHAR2(50),
  pay_amount  NUMBER(10,2),
  insured_num NUMBER(10),
  pay_amount1 NUMBER(10,2)
)
;
create table T_CUST_ACCOUNT
(
  account_id      NUMBER(10) not null,
  policy_id       NUMBER(10) not null,
  customer_id     NUMBER(10),
  company_id      NUMBER(10),
  cust_type       NUMBER(1) default 1 not null,
  account_purpose NUMBER(1) default 1 not null,
  bank_code       VARCHAR2(20) not null,
  bank_account    VARCHAR2(40) not null,
  status          CHAR(1) default '0' not null
)
;
create table T_CUST_ADDRESS_REGISTER
(
  cust_id              NUMBER(20) not null,
  cust_type            NUMBER(2) not null,
  area_id_rela         VARCHAR2(10),
  town_address_rela    VARCHAR2(100),
  village_address_rela VARCHAR2(100)
)
;
create table T_CUST_ADDR_REGISTER_LIST
(
  list_id              NUMBER(20) not null,
  cust_id              NUMBER(20) not null,
  cust_type            NUMBER(2) not null,
  area_id_rela         VARCHAR2(10),
  town_address_rela    VARCHAR2(100),
  village_address_rela VARCHAR2(100)
)
;
create table T_CUST_ARREAR
(
  arrear_id        NUMBER(10) not null,
  account_code     VARCHAR2(20) not null,
  arrear_date      DATE not null,
  arrear_amount    NUMBER(16,6) not null,
  deduction_amount NUMBER(16,6) not null,
  risk_fee         NUMBER(16,6),
  risk_amount      NUMBER(14,2),
  arrear_status    CHAR(1) default '0' not null,
  pay_off_date     DATE,
  pay_off_capital  NUMBER(10),
  pay_off_chg_id   NUMBER(10),
  capital_id       NUMBER(10),
  capital_chg_id   NUMBER(10) not null,
  policy_id        NUMBER(10) not null,
  item_id          NUMBER(10) not null,
  distri_type      VARCHAR2(3) not null,
  insert_time      DATE default sysdate not null,
  insert_id        NUMBER(10) not null,
  update_time      DATE default sysdate not null,
  update_id        NUMBER(10) not null
)
;
create table T_CUST_ARREAR_LOG
(
  change_id        NUMBER(10) not null,
  old_new          CHAR(1) not null,
  arrear_id        NUMBER(10) not null,
  account_code     VARCHAR2(20) not null,
  arrear_date      DATE not null,
  arrear_amount    NUMBER(16,6) not null,
  deduction_amount NUMBER(16,6) not null,
  risk_fee         NUMBER(16,6),
  risk_amount      NUMBER(14,2),
  arrear_status    CHAR(1) default '0' not null,
  pay_off_date     DATE,
  pay_off_capital  NUMBER(10),
  pay_off_chg_id   NUMBER(10),
  capital_id       NUMBER(10),
  capital_chg_id   NUMBER(10) not null,
  policy_id        NUMBER(10) not null,
  item_id          NUMBER(10) not null,
  distri_type      VARCHAR2(3) not null,
  insert_time      DATE default sysdate not null,
  insert_id        NUMBER(10) not null,
  update_time      DATE default sysdate not null,
  update_id        NUMBER(10) not null
)
;
create table T_CUST_COMP_STATE_ADDRESS
(
  cust_id       NUMBER(20) not null,
  address_type  NUMBER(2) not null,
  language_type NUMBER(2) not null,
  country_code  VARCHAR2(3),
  address       VARCHAR2(800)
)
;
create table T_CUST_COMP_STATE_TAXPAYER
(
  cust_id            NUMBER(20) not null,
  seq                NUMBER(2) not null,
  country_code       VARCHAR2(3),
  taxpayer_id        VARCHAR2(100),
  no_id_reason       NUMBER(2),
  input_no_id_reason VARCHAR2(400),
  attached_type      NUMBER(2) not null
)
;
create table T_CUST_DEPOSIT_DEL
(
  account_code VARCHAR2(20),
  delete_time  DATE default SYSDATE not null
)
;
create table T_CUST_DEPOSIT_DIFF
(
  account_code          VARCHAR2(20) not null,
  policy_id             NUMBER(10),
  item_id               NUMBER(10) not null,
  interest_capital      NUMBER(16,6),
  interest_capital_new  NUMBER(16,6) not null,
  interest_capital_diff NUMBER(16,6) not null,
  deposit_type          NUMBER(2),
  deposit_state         VARCHAR2(1),
  insert_date           DATE not null,
  update_date           DATE not null
)
;
create table T_DEPOSIT_CODE
(
  deposit_code VARCHAR2(2) not null,
  code_name    VARCHAR2(30) not null,
  account_type CHAR(1) default 1 not null
)
;
create table T_DEPOSIT_SUB_CODE
(
  deposit_sub_code VARCHAR2(2) not null,
  code_name        VARCHAR2(30) not null
)
;
create table T_CUST_DEPOSIT_LIST
(
  deposit_id       NUMBER(10) not null,
  account_code     VARCHAR2(20) not null,
  deposit_date     DATE not null,
  deposit_amount   NUMBER(16,6) not null,
  deposit_code     VARCHAR2(2) not null,
  balance_status   VARCHAR2(1) not null,
  insert_person    NUMBER(10) not null,
  insert_date      DATE default SYSDATE not null,
  updater_id       NUMBER(10),
  update_time      DATE,
  change_id        NUMBER(10),
  capital_id       NUMBER(10),
  balance_before   NUMBER(16,6),
  policy_id        NUMBER(10),
  item_id          NUMBER(10),
  group_item_id    NUMBER(10),
  company_id       NUMBER(10),
  distri_type      VARCHAR2(3),
  related_id       NUMBER(10),
  interest_amount  NUMBER(16,6) default 0 not null,
  cred_id          NUMBER(10),
  posted           CHAR(1) default 'N' not null,
  risk_amount      NUMBER(14,2),
  deposit_sub_code VARCHAR2(2)
)
;

create table T_CUST_DEPOSIT_LIST_DEL
(
  deposit_id   NUMBER(10),
  account_code VARCHAR2(20),
  delete_time  DATE default SYSDATE not null
)
;
create table T_CUST_DEPOSIT_LIST_LOG
(
  change_id        NUMBER(10) not null,
  deposit_id       NUMBER(10) not null,
  old_new          CHAR(1) not null,
  account_code     VARCHAR2(20) not null,
  deposit_date     DATE not null,
  deposit_amount   NUMBER(16,6) not null,
  deposit_code     VARCHAR2(2) not null,
  balance_status   VARCHAR2(1) not null,
  insert_person    NUMBER(10) not null,
  insert_date      DATE default SYSDATE not null,
  updater_id       NUMBER(10),
  update_time      DATE,
  capital_id       NUMBER(10),
  balance_before   NUMBER(16,6) not null,
  policy_id        NUMBER(10),
  item_id          NUMBER(10),
  group_item_id    NUMBER(10),
  company_id       NUMBER(10),
  distri_type      VARCHAR2(3),
  related_id       NUMBER(10),
  interest_amount  NUMBER(16,6) default 0 not null,
  cred_id          NUMBER(10),
  posted           CHAR(1) default 'N' not null,
  risk_amount      NUMBER(14,2),
  deposit_sub_code VARCHAR2(2)
)
;
create table T_CUST_DEPOSIT_LOG
(
  change_id         NUMBER(10) not null,
  account_code      VARCHAR2(20) not null,
  old_new           CHAR(1) not null,
  policy_id         NUMBER(10) not null,
  item_id           NUMBER(10),
  deposit_type      NUMBER(2) default 1 not null,
  capital_balance   NUMBER(16,6) not null,
  interest_capital  NUMBER(16,6) not null,
  interest_balance  NUMBER(16,6) not null,
  interest_sum      NUMBER(16,6) not null,
  balance_date      DATE not null,
  balance_year      CHAR(4) not null,
  depost_state      VARCHAR2(1) not null,
  money_id          NUMBER(6) not null,
  deposit_date      DATE not null,
  settle_date       DATE,
  cancel_date       DATE,
  insert_person     NUMBER(10) not null,
  insert_date       DATE default SYSDATE not null,
  updater_id        NUMBER(10),
  update_time       DATE,
  account_att_type  NUMBER(2) default 0 not null,
  account_name      VARCHAR2(50) default 'DEFAULT' not null,
  group_item_id     NUMBER(10),
  company_id        NUMBER(10),
  la_bal_id         NUMBER(10),
  gurnt_bal_date    DATE,
  bonus_bal_date    DATE,
  indiv_att_rate    NUMBER(5,4),
  deduct_date       DATE,
  deduct_year       NUMBER(4),
  comm_trans_amount NUMBER(16,6),
  dummy_num         VARCHAR2(4)
)


create table T_CUST_DEPOSIT_NEW
(
  account_code     VARCHAR2(20) not null,
  interest_capital NUMBER(16,6) not null,
  policy_id        NUMBER(10) not null,
  insert_date      DATE not null,
  update_date      DATE not null,
  item_id          NUMBER(10) not null,
  deposit_code     VARCHAR2(2) not null
)
;
create table T_CUST_DEPOSIT_TEST
(
  account_code     VARCHAR2(20) not null,
  depost_state     VARCHAR2(1) not null,
  money_id         NUMBER(6) not null,
  deposit_date     DATE not null,
  settle_date      DATE,
  cancel_date      DATE,
  insert_person    NUMBER(10) not null,
  insert_date      DATE not null,
  updater_id       NUMBER(10),
  update_time      DATE,
  capital_balance  NUMBER(16,6) not null,
  interest_capital NUMBER(16,6) not null,
  interest_balance NUMBER(16,6) not null,
  interest_sum     NUMBER(16,6) not null,
  balance_date     DATE not null,
  balance_year     CHAR(4) not null,
  policy_id        NUMBER(10) not null,
  item_id          NUMBER(10),
  deposit_type     NUMBER(2) not null,
  account_att_type NUMBER(2) not null,
  account_name     VARCHAR2(50) not null,
  group_item_id    NUMBER(10),
  company_id       NUMBER(10),
  la_bal_id        NUMBER(10),
  gurnt_bal_date   DATE,
  bonus_bal_date   DATE,
  indiv_att_rate   NUMBER(5,4),
  deduct_date      DATE,
  deduct_year      NUMBER(4)
)
;
create table T_CUST_REG_CRED_TYPE
(
  type_id   NUMBER(2) not null,
  type_name VARCHAR2(100) not null
)
;
create table T_CV_PROD_ORGAN
(
  product_id    NUMBER(7),
  organ_id      VARCHAR2(40),
  cash_organ_id VARCHAR2(40),
  insert_date   DATE,
  begin_date    DATE,
  end_date      DATE,
  interest_rate NUMBER(7,6)
)
;

create table T_CV_PROD_POLICY_YEAR
(
  product_id    NUMBER(10) not null,
  start_date    DATE not null,
  interest_rate NUMBER(7,6) not null,
  insert_person NUMBER(10) not null,
  insert_date   DATE default SYSDATE not null,
  updater_id    NUMBER(10),
  update_time   DATE,
  policy_year   VARCHAR2(3)
)
;
create table T_CYRIL_TEST
(
  list_id     NUMBER(10) not null,
  log_info    VARCHAR2(4000),
  insert_time DATE default sysdate not null,
  key_value_1 VARCHAR2(4000),
  kay_value_2 VARCHAR2(4000)
)
;
create table T_REVIEW_RESULT
(
  review_rusult_code CHAR(1) not null,
  review_rusult_name VARCHAR2(20) not null
)
;
create table T_C_ACCONAME_REVIEW_RECORD
(
  record_id      NUMBER(10) not null,
  change_id      NUMBER(10) not null,
  operator_id    NUMBER(10) not null,
  result_id      CHAR(1) not null,
  insert_time    DATE not null,
  change_reason  VARCHAR2(50),
  special_reason VARCHAR2(500)
)
;
create table T_DATA_ERROR
(
  policy_id  NUMBER(10),
  ctrlno     VARCHAR2(20),
  check_date DATE,
  error_id   NUMBER(5),
  error_msg  VARCHAR2(500)
)
;
create table T_DATA_REFERS
(
  list_id              NUMBER(15) not null,
  father_table_name    VARCHAR2(60) not null,
  father_table_pk_col1 VARCHAR2(30) not null,
  father_table_pk_col2 NUMBER(30),
  child_table_name     VARCHAR2(60) not null,
  child_table_pk_col1  VARCHAR2(30) not null,
  child_table_pk_col2  VARCHAR2(30),
  father_table_pk_col3 VARCHAR2(30)
)
;
create table T_DEBIT_NOTE_LIST_PRINT
(
  print_id              NUMBER(12) not null,
  print_date            DATE,
  agent_code            VARCHAR2(25),
  agent_name            VARCHAR2(100),
  agent_address1        VARCHAR2(100),
  agent_address2        VARCHAR2(100),
  agent_address3        VARCHAR2(100),
  agent_address4        VARCHAR2(100),
  agent_zip             VARCHAR2(10),
  year_month            VARCHAR2(10),
  group_id              NUMBER,
  agent_balance_life    NUMBER,
  agent_balance_general NUMBER
)
;
create table T_DEBIT_NOTE_LIST_PRINT_DETAIL
(
  print_id      NUMBER(12) not null,
  fee_time      DATE,
  note_type     NUMBER(1),
  debit_note_no VARCHAR2(12),
  policy_code   VARCHAR2(30),
  customer_name VARCHAR2(100),
  gst_prem      NUMBER(12,2),
  due_amount    NUMBER(12,2),
  comm_amount   NUMBER(12,2),
  gst_comm      NUMBER(12,2),
  pay_amount    NUMBER(12,2),
  nett_amount   NUMBER(12,2),
  comm_offset   VARCHAR2(1),
  prem          NUMBER(12,2),
  os_balance    NUMBER(12,2)
)
;
create table T_GROUP_POLICY_PRINT_MAIN
(
  policy_print_id           NUMBER(12) not null,
  printed                   NUMBER(1),
  policy_id                 NUMBER(10),
  policy_code               VARCHAR2(20),
  area                      VARCHAR2(30),
  send_code                 VARCHAR2(20),
  holder_name               VARCHAR2(240),
  holder_address            VARCHAR2(200),
  holder_phone              VARCHAR2(30),
  holder_zip                VARCHAR2(6),
  holder_date               VARCHAR2(20),
  effect_date               VARCHAR2(20),
  policy_year               VARCHAR2(60),
  valid_period              VARCHAR2(60),
  pay_mode                  VARCHAR2(60),
  charge_type               VARCHAR2(60),
  agent_code                VARCHAR2(25),
  agent_name                VARCHAR2(40),
  agent_organ               VARCHAR2(100),
  sum_fee                   VARCHAR2(30),
  assumpsit                 VARCHAR2(4000),
  print_date                DATE,
  insured_amount            NUMBER(10),
  dead_bene_name            VARCHAR2(50),
  checker_code              VARCHAR2(50),
  create_date               VARCHAR2(50),
  over_prem_cn              VARCHAR2(100),
  agent_name_cn             VARCHAR2(50),
  organ_name                VARCHAR2(100),
  real_insurant             CHAR(1) default 'Y',
  print_emp_id              NUMBER(10),
  holder_address_2          VARCHAR2(100),
  holder_address_3          VARCHAR2(100),
  holder_address_4          VARCHAR2(100),
  taxed_fee                 VARCHAR2(30),
  tax_prem                  VARCHAR2(30),
  policyholder              VARCHAR2(4000),
  emp_attach_type           VARCHAR2(30),
  duty                      VARCHAR2(4000),
  premium_rate              NUMBER(16,6),
  debit_note_no             VARCHAR2(12),
  sum_assured               NUMBER(16,2),
  end_date                  DATE,
  vb_print_desc             VARCHAR2(1000),
  vb_print_state            NUMBER(1) default 0 not null,
  vb_print_time             DATE,
  vb_ps_file                VARCHAR2(100),
  agent_telephone           VARCHAR2(60),
  agent_address             VARCHAR2(100),
  charge_period             VARCHAR2(60),
  is_retire                 CHAR(1) default '0',
  company_link_person       VARCHAR2(50),
  print_group_cash          CHAR(1) default '1',
  print_indi_cash           CHAR(1) default '1',
  print_transin_amount      CHAR(1) default '0',
  print_ascript_rate        CHAR(1) default '1',
  total_cert                NUMBER(10),
  product_list              VARCHAR2(500),
  fee_amount                NUMBER(13,2),
  reissue_num               NUMBER(2),
  checker_name              VARCHAR2(40),
  period_type               CHAR(1),
  linkman                   VARCHAR2(40),
  corp_discount_prem        NUMBER(12,2),
  corp_deduct_discount_prem NUMBER(12,2),
  person_discount_prem      NUMBER(12,2),
  public_discount_prem      NUMBER(12,2),
  admin_fee_rate            NUMBER(11,10),
  branch_name               VARCHAR2(100),
  company_id                NUMBER(10),
  branch_zip                VARCHAR2(6),
  agency_name               VARCHAR2(100),
  agency_address            VARCHAR2(100),
  agency_zip                VARCHAR2(6),
  reason_type               NUMBER(5),
  check_enter_time          DATE,
  policy_print              NUMBER(2),
  organ_id                  VARCHAR2(40),
  parent_id                 VARCHAR2(40),
  construct_name            VARCHAR2(333),
  construct_addr            VARCHAR2(333),
  construct_date            VARCHAR2(60),
  construct_area            NUMBER(10,2),
  construct_cost            NUMBER(10,2),
  construct_type            VARCHAR2(60),
  agent_company_name        VARCHAR2(100),
  agent_dept_id             VARCHAR2(60),
  agent_dept_name           VARCHAR2(100),
  accept_date               DATE,
  sub_charge_period         VARCHAR2(60),
  display_rate_flag         CHAR(1) default 'Y',
  display_assumpsit         CHAR(1),
  bill_code                 VARCHAR2(20)
)
;
create table T_DEBIT_NOTE_PRINT
(
  note_id               NUMBER(12) not null,
  group_policy_print_id NUMBER(12),
  note_type             NUMBER(1) not null,
  print_date            DATE
)
;
create table T_DEBIT_NOTE_PRINT_DETAIL
(
  note_id       NUMBER(12) not null,
  payer_name    VARCHAR2(100),
  debit_note_no VARCHAR2(14),
  address_1     VARCHAR2(200),
  address_2     VARCHAR2(100),
  address_3     VARCHAR2(100),
  address_4     VARCHAR2(100),
  zip           VARCHAR2(10),
  linkman       VARCHAR2(40),
  policy_code   VARCHAR2(30),
  product_name  VARCHAR2(80),
  prem          NUMBER(16,2),
  tax           NUMBER(12,2),
  sum_fee       NUMBER(16,2),
  desc1         VARCHAR2(50),
  desc2         VARCHAR2(100),
  agent_name    VARCHAR2(40),
  agent_email   VARCHAR2(50),
  agent_tel     VARCHAR2(30)
)
;
create table T_DEBUG_INFO
(
  module_id   NUMBER not null,
  debug_id    NUMBER not null,
  debug_info  VARCHAR2(200),
  insert_id   NUMBER,
  insert_date DATE
)
;
create table T_DEDUCTION_TYPE
(
  type_id   NUMBER(2) not null,
  type_name VARCHAR2(120)
)
;
create table T_DEFER_DECISION
(
  defer_id     NUMBER(10) not null,
  policy_id    NUMBER(10) not null,
  opt_date     DATE not null,
  new_end_date DATE not null,
  is_defer     CHAR(1) not null,
  insert_time  DATE not null,
  update_time  DATE not null
)
;
create table T_DEFER_DECISION_LOG
(
  defer_id     NUMBER(10) not null,
  policy_id    NUMBER(10) not null,
  old_new      CHAR(1) not null,
  new_end_date DATE not null,
  change_id    NUMBER(10) not null,
  is_defer     CHAR(1) not null,
  opt_date     DATE not null,
  insert_time  DATE not null,
  update_time  DATE not null
)
;
create table T_DEMAND_BATCH
(
  batch_id    NUMBER(10) not null,
  description VARCHAR2(2000) not null,
  begin_date  DATE not null,
  end_date    DATE not null
)
;
create table T_DEMAND_LIST
(
  demand_id     NUMBER(5) not null,
  demand_no     VARCHAR2(20) not null,
  demand_name   VARCHAR2(200) not null,
  demand_status VARCHAR2(1000) not null,
  demand_detail VARCHAR2(2000) not null,
  release_date  VARCHAR2(10) not null,
  module_id     NUMBER(2) not null,
  batch_id      NUMBER(10)
)
;
create table T_DEMAND_INVESTIGATE
(
  detail_id   NUMBER(10),
  user_id     NUMBER(10),
  demand_id   NUMBER(4),
  evaluation  NUMBER(1),
  insert_time DATE default SYSDATE,
  update_time DATE default SYSDATE,
  batch_id    NUMBER(10)
)
;
create table T_DENY_SWITCH_CAUSE
(
  cause_id   CHAR(1) not null,
  cause_text VARCHAR2(300)
)
;
create table T_DEPOSIT_TERM
(
  deposit_term VARCHAR2(2) not null,
  term_desc    VARCHAR2(20) not null
)
;
create table T_DEPOSIT_TYPE
(
  deposit_type VARCHAR2(1) not null,
  type_name    VARCHAR2(50) not null
)
;
create table T_DEPOSIT
(
  contract_no   VARCHAR2(30) not null,
  fund_code     VARCHAR2(20) not null,
  bank_code     VARCHAR2(20) not null,
  deposit_state VARCHAR2(1) not null,
  deposit_sum   NUMBER(15,2) not null,
  deposit_type  VARCHAR2(1) not null,
  deposit_term  VARCHAR2(2) not null,
  pay_period    NUMBER(4) not null,
  money_id      NUMBER(6) not null,
  deposit_date  DATE not null,
  due_date      DATE,
  settle_date   DATE,
  cancel_date   DATE,
  deposit_rate  NUMBER(7,6) not null,
  add_rate      NUMBER(7,6) default 0 not null,
  remark        VARCHAR2(4000),
  risk_class    VARCHAR2(1) not null,
  insert_person NUMBER(10) not null,
  insert_date   DATE not null,
  update_time   DATE,
  updater_id    NUMBER(10),
  account_code  VARCHAR2(20) not null,
  transactor_id NUMBER(10) not null,
  checker_id    NUMBER(10) not null
)
;
create table T_DEPOSIT_KEEP_BONUS
(
  list_id             NUMBER(10) not null,
  policy_id           NUMBER(10) not null,
  item_id             NUMBER(10),
  policy_year         NUMBER(5) not null,
  due_time            DATE not null,
  actual_date         DATE,
  reallocated         CHAR(1) default 'N' not null,
  bonus_source        VARCHAR2(2) not null,
  product_fee_list_id NUMBER(14),
  insert_id           VARCHAR2(10) not null,
  insert_time         DATE default sysdate not null,
  update_id           VARCHAR2(10),
  update_time         DATE default sysdate
)
;

create table T_DEPOSIT_KEEP_BONUS_LOG
(
  change_id           NUMBER(10) not null,
  old_new             CHAR(1) not null,
  list_id             NUMBER(10) not null,
  policy_id           NUMBER(10) not null,
  item_id             NUMBER(10),
  policy_year         NUMBER(5) not null,
  due_time            DATE not null,
  actual_date         DATE,
  reallocated         CHAR(1) default 'N' not null,
  bonus_source        VARCHAR2(2) not null,
  product_fee_list_id NUMBER(14),
  insert_id           VARCHAR2(10) not null,
  insert_time         DATE default sysdate not null,
  update_id           VARCHAR2(10),
  update_time         DATE default sysdate
)
;
create table T_DEPOSIT_PERIOD_BALANCE_DIFF
(
  account_code VARCHAR2(20) not null,
  policy_id    NUMBER(10),
  item_id      NUMBER(10),
  balance_id   NUMBER(10),
  start_date   DATE,
  end_date     DATE,
  begin_sum    NUMBER(16,6),
  end_sum      NUMBER(16,6),
  new_sum      NUMBER(16,6),
  sum_diff     NUMBER(16,6),
  insert_date  DATE not null,
  update_date  DATE not null
)
;
create table T_DEPOSIT_PERIOD_BALANCE_LOG
(
  change_id        NUMBER(10) not null,
  old_new          CHAR(1) not null,
  balance_id       NUMBER(10) not null,
  account_code     VARCHAR2(20) not null,
  start_date       DATE not null,
  end_date         DATE not null,
  begin_sum        NUMBER(16,6) default 0 not null,
  end_sum          NUMBER(16,6) default 0 not null,
  net_prem_sum     NUMBER(16,6) default 0 not null,
  gurnt_int_sum    NUMBER(16,6) default 0 not null,
  bonus_sum        NUMBER(16,6) default 0 not null,
  settle_int_sum   NUMBER(16,6) default 0 not null,
  gurnt_gap_sum    NUMBER(16,6) default 0 not null,
  loading_sum      NUMBER(16,6) default 0 not null,
  tma_sum          NUMBER(16,6) default 0 not null,
  tarification_sum NUMBER(16,6) default 0 not null,
  partial_sur_sum  NUMBER(16,6) default 0 not null,
  surrender_sum    NUMBER(16,6) default 0 not null,
  claim_fee_sum    NUMBER(16,6) default 0 not null,
  recorder_id      NUMBER(10) not null,
  insert_time      DATE default SYSDATE not null,
  updater_id       NUMBER(10) not null,
  update_time      DATE default SYSDATE not null,
  net_prem_int     NUMBER(16,6),
  loading_int      NUMBER(16,6),
  traification_int NUMBER(16,6),
  partial_sur_int  NUMBER(16,6),
  pay_fee_int      NUMBER(16,6),
  tran_bal_int     NUMBER(16,6),
  cont_prize_sum   NUMBER(16,6),
  cont_prize_int   NUMBER(16,6),
  pay_fee_sum      NUMBER(16,6),
  tran_bal_sum     NUMBER(16,6),
  begin_net_sum    NUMBER(16,6) default 0 not null,
  end_net_sum      NUMBER(16,6) default 0 not null
)
;
create table T_DEPOSIT_PERIOD_BALANCE_TEST
(
  balance_id       NUMBER(10),
  account_code     VARCHAR2(20),
  start_date       DATE,
  end_date         DATE,
  begin_sum        NUMBER(16,6),
  end_sum          NUMBER(16,6),
  net_prem_sum     NUMBER(16,6),
  gurnt_int_sum    NUMBER(16,6),
  bonus_sum        NUMBER(16,6),
  settle_int_sum   NUMBER(16,6),
  gurnt_gap_sum    NUMBER(16,6),
  loading_sum      NUMBER(16,6),
  tma_sum          NUMBER(16,6),
  tarification_sum NUMBER(16,6),
  partial_sur_sum  NUMBER(16,6),
  surrender_sum    NUMBER(16,6),
  claim_fee_sum    NUMBER(16,6),
  recorder_id      NUMBER(10),
  insert_time      DATE,
  updater_id       NUMBER(10),
  update_time      DATE,
  net_prem_int     NUMBER(16,6),
  loading_int      NUMBER(16,6),
  traification_int NUMBER(16,6),
  partial_sur_int  NUMBER(16,6),
  pay_fee_int      NUMBER(16,6),
  tran_bal_int     NUMBER(16,6),
  cont_prize_sum   NUMBER(16,6),
  cont_prize_int   NUMBER(16,6),
  pay_fee_sum      NUMBER(16,6),
  tran_bal_sum     NUMBER(16,6),
  begin_net_sum    NUMBER(16,6),
  end_net_sum      NUMBER(16,6)
)
;
create table T_DEPOSIT_RATE
(
  contract_no   VARCHAR2(30) not null,
  start_date    DATE not null,
  deposit_rate  NUMBER(7,6) not null,
  add_rate      NUMBER(7,6) not null,
  insert_person NUMBER(10) not null,
  nsert_date    DATE default SYSDATE not null,
  updater_id    NUMBER(10),
  update_time   DATE
)
;
create table T_DEPOSIT_RECOVER_TYPE
(
  recover_type VARCHAR2(1) not null,
  type_name    VARCHAR2(50) not null
)
;
create table T_DEPOSIT_RECOVER
(
  contract_no    VARCHAR2(30) not null,
  recover_date   DATE not null,
  recover_sum    NUMBER(14,2) not null,
  recover_type   VARCHAR2(1) not null,
  handler_person NUMBER(10) not null,
  posted         CHAR(1) default 'N' not null,
  post_date      DATE,
  cred_id        NUMBER(10),
  post_id        NUMBER(10),
  post_organ     VARCHAR2(40),
  post_dept      VARCHAR2(20),
  insert_person  NUMBER(10) not null,
  insert_date    DATE default SYSDATE not null,
  recover_id     NUMBER(10) not null,
  update_time    DATE,
  updater_id     NUMBER(10),
  checker_id     NUMBER(10) not null
)
;
create table T_DEPT_ASSESS
(
  dept_id      VARCHAR2(20) not null,
  year_querter VARCHAR2(6) not null
)
;
create table T_DEPT_BACKUP
(
  list_id      NUMBER(10) not null,
  year_month   VARCHAR2(6) not null,
  organ_id     VARCHAR2(40) not null,
  parent_id    VARCHAR2(20),
  dept_id      VARCHAR2(20) not null,
  principal_id NUMBER(10),
  status       CHAR(1) not null,
  cancel_date  DATE,
  train_man_id NUMBER(10),
  create_date  DATE,
  train_date   DATE,
  dept_grade   NUMBER(2),
  area_type    NUMBER(10),
  dept_cate    VARCHAR2(1),
  insert_time  DATE default SYSDATE,
  dept_name    VARCHAR2(100)
)
;
create table T_DEPT_CHANGE
(
  dept_chg_id      NUMBER(10) not null,
  organ_id         VARCHAR2(40) not null,
  parent_id        VARCHAR2(20),
  dept_id          VARCHAR2(20) not null,
  grade            NUMBER(1),
  leaf             CHAR(1) default 'N' not null,
  dept_name        VARCHAR2(100),
  principal_id     NUMBER(10),
  status           CHAR(1) default '1',
  cancel_date      DATE,
  zip              CHAR(6),
  address          VARCHAR2(100),
  area_code        VARCHAR2(5),
  telephone        VARCHAR2(30),
  fax              VARCHAR2(30),
  email            VARCHAR2(50),
  dept_cate        CHAR(1),
  dept_type        CHAR(1),
  train_man_id     NUMBER(10),
  update_time      DATE,
  updater_id       NUMBER(10),
  change_type_id   NUMBER(4),
  change_date      DATE,
  change_desc      VARCHAR2(400),
  operater_id      NUMBER(10),
  create_date      DATE,
  train_date       DATE,
  insider_id       NUMBER(10),
  area_type        NUMBER(10),
  dept_grade       NUMBER(2),
  collector_id     NUMBER(10),
  insert_time      DATE default SYSDATE not null,
  is_basic         CHAR(1) default 'N' not null,
  abbr_name        VARCHAR2(50),
  cancel_cause     VARCHAR2(6),
  valid_start_time DATE,
  valid_end_time   DATE,
  operate_time     DATE default SYSDATE not null
)
;
create table T_DEPT_DEL
(
  dept_id     VARCHAR2(20),
  delete_time DATE default SYSDATE not null
)
;
create table T_DEPT_DUMP
(
  organ_id        VARCHAR2(40) not null,
  parent_id       VARCHAR2(20),
  dept_id         VARCHAR2(20) not null,
  leaf            CHAR(1) not null,
  dept_name       VARCHAR2(100) not null,
  principal_id    NUMBER(10),
  status          CHAR(1) not null,
  cancel_date     DATE,
  zip             CHAR(6),
  address         VARCHAR2(100),
  area_code       VARCHAR2(5),
  telephone       VARCHAR2(30),
  fax             VARCHAR2(30),
  email           VARCHAR2(50),
  dept_cate       VARCHAR2(1),
  train_man_id    NUMBER(10),
  update_time     DATE,
  updater_id      NUMBER(10),
  create_date     DATE,
  train_date      DATE,
  insider_id      NUMBER(10),
  area_type       NUMBER(10),
  dept_grade      NUMBER(2),
  collector_id    NUMBER(10),
  insert_time     DATE not null,
  is_basic        CHAR(1) not null,
  abbr_name       VARCHAR2(50),
  cancel_cause    VARCHAR2(6),
  g_business_cate NUMBER(2),
  g_dept_grade    NUMBER(2),
  b_dept_grade    NUMBER(2),
  dept_type       CHAR(1),
  g_dept_cate     VARCHAR2(1),
  admin           CHAR(1) not null,
  cost_center     VARCHAR2(25),
  config_id       NUMBER(3)
)
;
create table T_DEPT_FYC
(
  dept_fyc_id NUMBER(10) not null,
  organ_id    VARCHAR2(40),
  dept_id     VARCHAR2(20),
  year_month  VARCHAR2(6),
  money       NUMBER(10,2),
  new_money   NUMBER(10,2),
  cross_money NUMBER(10,2)
)
;
create table T_DEPT_GRADE
(
  dept_grade NUMBER(2) not null,
  agent_cate VARCHAR2(1) not null,
  grade_name VARCHAR2(30)
)
;
create table T_DEPT_LOG
(
  organ_id     VARCHAR2(40) not null,
  parent_id    VARCHAR2(20),
  dept_id      VARCHAR2(20) not null,
  grade        NUMBER(1) not null,
  leaf         CHAR(1) default 'N' not null,
  dept_name    VARCHAR2(100),
  principal_id NUMBER(10),
  status       CHAR(1) default '1',
  cancel_date  DATE,
  zip          CHAR(6),
  address      VARCHAR2(100),
  area_code    VARCHAR2(5),
  telephone    VARCHAR2(30),
  fax          VARCHAR2(30),
  email        VARCHAR2(50),
  dept_cate    CHAR(1),
  dept_type    CHAR(1),
  train_man_id NUMBER(10),
  update_time  DATE,
  updater_id   NUMBER(10),
  log_date     DATE default SYSDATE,
  create_date  DATE,
  train_date   DATE
)
;
create table T_DEPT_PLAN
(
  dept_id  VARCHAR2(20) not null,
  organ_id VARCHAR2(40) not null,
  year     VARCHAR2(4) not null,
  amount   NUMBER(12,2)
)
;
create table T_DEPT_STATUS
(
  dept_status      CHAR(1) not null,
  dept_status_name VARCHAR2(30)
)
;
create table T_DIFF_RETURN_STATUS
(
  status_id   NUMBER(2) not null,
  status_desc VARCHAR2(50)
)
;
create table T_DIFF_RETURN_MAIN
(
  task_id              NUMBER(8) not null,
  insert_time          DATE,
  update_time          DATE,
  product_id           NUMBER(7) not null,
  accounting_year      NUMBER(4) not null,
  task_status          NUMBER(2) not null,
  is_approved          VARCHAR2(2),
  log_info             VARCHAR2(4000),
  uncommitted_reserves NUMBER(14,2),
  extra_cost           NUMBER(14,2),
  total_risk_prem      NUMBER(14,2),
  settled_fee          NUMBER(14,2),
  unsettled_fee        NUMBER(14,2),
  claim_ratio          NUMBER(5,4),
  total_diff_return    NUMBER(14,2),
  entry_id             NUMBER(10),
  auditor_id           NUMBER(10)
)
;
create table T_DIFF_RETURN_POLICY_STATUS
(
  status_id   NUMBER(2) not null,
  status_desc VARCHAR2(50)
)
;
create table T_DIFF_RETURN_POLICY
(
  policy_id       NUMBER(10) not null,
  accounting_year NUMBER(4) not null,
  insert_time     DATE,
  update_time     DATE,
  risk_prem       NUMBER(14,2),
  return_amount   NUMBER(14,2),
  return_status   NUMBER(2),
  log_info        VARCHAR2(4000)
)
;
create table T_DIFF_RETURN_POLICY_LOG
(
  policy_id       NUMBER(10) not null,
  accounting_year NUMBER(4) not null,
  insert_time     DATE,
  update_time     DATE,
  risk_prem       NUMBER(14,2),
  return_amount   NUMBER(14,2),
  return_status   NUMBER(2),
  log_info        VARCHAR2(4000),
  opt_id          NUMBER(10)
)
;
create table T_DIFF_RETURN_PRODUCT
(
  product_id       NUMBER(7) not null,
  need_diff_return VARCHAR2(2)
)
;
create table T_DIMISSION_SWITCH_RATE
(
  rate_id     NUMBER(6) not null,
  policy_id   NUMBER(10),
  insured_id  NUMBER(10),
  amount_rate NUMBER(12,2),
  bonus_rate  NUMBER(12,2),
  insert_time DATE,
  update_time DATE
)
;
create table T_DIRECT_DEPT_AWARD
(
  direct_dept_award_id NUMBER(4) not null,
  area_type            NUMBER(10),
  fyc_start            NUMBER(10,2),
  fyc_end              NUMBER(10,2),
  grade_id             VARCHAR2(2),
  rate                 NUMBER(4,3),
  description          VARCHAR2(200)
)
;
create table T_DIRECT_OR
(
  direct_or_id NUMBER(4) not null,
  area_type    NUMBER(10),
  fyc_start    NUMBER(10,2),
  fyc_end      NUMBER(10,2),
  grade_id     VARCHAR2(2),
  rate         NUMBER(4,3),
  description  VARCHAR2(200)
)
;
create table T_DISABILITY_CRITERION
(
  criterion_id   NUMBER(2) not null,
  criterion_desc VARCHAR2(200) not null
)
;
create table T_DISABILITY_CATEGORY
(
  category_id   NUMBER(4) not null,
  category_desc VARCHAR2(200) not null,
  criterion_id  NUMBER(2) not null
)
;
create table T_DISABILITY_DIRECTORY
(
  directory_id   NUMBER(6) not null,
  directory_desc VARCHAR2(200),
  category_id    NUMBER(4)
)
;
create table T_DISABILITY_DIRECTORY_DETAIL
(
  detail_id        NUMBER(6) not null,
  name             VARCHAR2(400) not null,
  criterion_id     NUMBER(2),
  category_id      NUMBER(4),
  directory_id     NUMBER(6),
  disability_code  VARCHAR2(150),
  disability_grade NUMBER(2),
  pay_rate         VARCHAR2(10)
)
;
create table T_DISABILITY_ENTRY
(
  disability_id        NUMBER(10) not null,
  case_id              NUMBER(10) not null,
  item_id              NUMBER(10) not null,
  liab_id              NUMBER(4) not null,
  criterion_id         NUMBER(2),
  grade                VARCHAR2(20),
  pay_rate             VARCHAR2(10),
  past_disability_rate VARCHAR2(10),
  disability_desc      VARCHAR2(4000),
  create_time          DATE default sysdate not null,
  update_time          DATE default sysdate not null
)
;
create table T_DISABILITY_ENTRY_LIST
(
  list_id             NUMBER(10) not null,
  disability_id       NUMBER(10) not null,
  detail_id           NUMBER(6),
  disability_grade    VARCHAR2(4),
  is_appraisal        CHAR(1),
  appraisal_organ     VARCHAR2(400),
  appraisal_personnel VARCHAR2(500),
  appraisal_date      DATE,
  unappravisal_reason VARCHAR2(4000)
)
;
create table T_DISEASE
(
  disease_id   NUMBER(4) not null,
  disease_name VARCHAR2(200) not null
)
;
create table T_DISEASE_SCHEME_AMOUNT
(
  list_id         NUMBER(10) not null,
  plan_id         NUMBER(10) not null,
  product_id      NUMBER(10) not null,
  product_num     CHAR(3),
  liab_id         NUMBER(10) not null,
  disease_code    NUMBER(10) not null,
  separate_amount NUMBER(14,2),
  separate_prem   NUMBER(14,2)
)
;
create table T_DISEASE_TYPE
(
  type_id   NUMBER(2) not null,
  type_name VARCHAR2(100) not null
)
;
create table T_DISEASE_TYPE_CONFIG
(
  type_id    NUMBER(2) not null,
  disease_id NUMBER(4) not null
)
;
create table T_DISHONEST_REPRESENT
(
  dis_represent_id     NUMBER(10) not null,
  insured_id           NUMBER(10),
  happen_time          DATE default SYSDATE not null,
  accident_time        DATE,
  investigate_time     DATE,
  represent            VARCHAR2(3000),
  insert_time          DATE default SYSDATE not null,
  update_time          DATE default SYSDATE not null,
  updater_id           NUMBER(10) not null,
  recorder_id          NUMBER(10) not null,
  uw_source_type       VARCHAR2(1),
  original_business_id NUMBER(10) not null,
  ecif_id              NUMBER(20)
)
;
create table T_DISTRIBUTE_ACCOUNT
(
  config_id       NUMBER(10) not null,
  distri_type     VARCHAR2(3) not null,
  capital_source  VARCHAR2(1) default '1' not null,
  money_id        NUMBER(6) not null,
  channel_check   CHAR(1) default 'N' not null,
  channel_type    CHAR(1),
  organ_check     CHAR(1) default 'N' not null,
  bank_check      CHAR(1) default 'N' not null,
  cash_bank       VARCHAR2(20),
  cash_account    VARCHAR2(40),
  product_check   CHAR(1) default 'Y' not null,
  product_id      NUMBER(10),
  book_id         NUMBER(10) not null,
  debit_account   VARCHAR2(40) not null,
  credit_account  VARCHAR2(40) not null,
  voucher_cate_id NUMBER(2) not null,
  description     VARCHAR2(100) not null,
  nsre            CHAR(1) default 'N' not null
)
;
create table T_DISTRICT_FOR_AGENT
(
  distrinct_code    VARCHAR2(10) not null,
  district_name     VARCHAR2(40) not null,
  district_level    CHAR(1),
  parent_code       VARCHAR2(10),
  full_code         VARCHAR2(10),
  agent_seq_start   NUMBER(10),
  agent_seq_end     NUMBER(10),
  policy_seq        NUMBER(10),
  customer_seq      NUMBER(10),
  agent_seq_current NUMBER(10)
)
;
create table T_DIVIDEND_FACTOR
(
  year              NUMBER(4),
  r_factor          NUMBER(6,4),
  d_factor          NUMBER(6,4),
  div_interest_rate NUMBER(6,4),
  issue_date        DATE
)
;
create table T_DIVIDEND_PUSH_RECORD
(
  record_id              NUMBER(10) not null,
  dividend_policy_amount NUMBER(4),
  dividend_day           VARCHAR2(32),
  dividend_file_day      VARCHAR2(32),
  file_message           CLOB,
  file_path              VARCHAR2(64),
  file_name              VARCHAR2(32),
  push_status            NUMBER(1) default 0,
  insert_time            DATE default sysdate,
  update_time            DATE default sysdate
)
;
create table T_DIVIDEND_PUSH_RECORD_ERROR
(
  record_id     NUMBER(10) not null,
  error_message VARCHAR2(4000),
  insert_time   DATE default sysdate,
  update_time   DATE default sysdate
)
;
create table T_DIVIDEND_TRIAL
(
  basic_id    NUMBER(10) not null,
  smoking     CHAR(1) default 'W' not null,
  gender      CHAR(1) default 'N' not null,
  age         NUMBER(3) default 999 not null,
  age_holder  NUMBER(3) default 999 not null,
  age_related NUMBER(3) default 999 not null,
  bene_status CHAR(1) default '0' not null,
  year        NUMBER(3) default 999 not null,
  expect_type VARCHAR2(2) not null,
  dividend    NUMBER(12,2) not null
)
;

create table T_DIVI_NOTICE
(
  polno       VARCHAR2(16),
  certno      VARCHAR2(16),
  div_year    NUMBER(4),
  div_amt     NUMBER(12,2),
  notice_type NUMBER(1),
  print_date  DATE,
  print_empno NUMBER(10)
)
;
create table T_DIVI_TRANSACTION
(
  tran_seq   VARCHAR2(16) not null,
  account_no NUMBER(20),
  polno      VARCHAR2(16) not null,
  certno     VARCHAR2(16) not null,
  plan_code  VARCHAR2(10) not null,
  fund_code  VARCHAR2(4) not null,
  tran_type  VARCHAR2(1) not null,
  bargn_sum  NUMBER(14,4) default 0 not null,
  bargn_date DATE,
  tran_src   VARCHAR2(1) not null,
  ctrlno     VARCHAR2(20),
  rcptno     VARCHAR2(16),
  cred_id    NUMBER(10),
  organ_id   VARCHAR2(40) not null,
  deptno     VARCHAR2(20) not null,
  fcd        DATE not null,
  fcu        VARCHAR2(10) not null,
  lcd        DATE not null,
  lcu        VARCHAR2(10) not null,
  entst_date DATE,
  tran_sts   VARCHAR2(1) default '1' not null
)
;
create table T_DM_COLS_TOBE_SYN
(
  column_name    VARCHAR2(30) not null,
  column_id      NUMBER,
  data_type      VARCHAR2(106),
  data_length    NUMBER not null,
  data_precision NUMBER,
  data_scale     NUMBER,
  table_name     VARCHAR2(30) not null,
  synchronized   VARCHAR2(1),
  ddl_type       VARCHAR2(30) default 'ADD',
  data_default   VARCHAR2(4000)
)
;

create table T_DM_CONSTRAINTS
(
  constraint_name VARCHAR2(30) not null,
  table_name      VARCHAR2(30) not null,
  disabled        VARCHAR2(1) default 'N' not null
)
;
create table T_DM_EXCEPT
(
  except_id       NUMBER(3) not null,
  except_obj_name VARCHAR2(30) not null,
  except_obj_type VARCHAR2(30) not null
)
;

create table T_DM_LOG
(
  log_id           NUMBER not null,
  log_info         VARCHAR2(4000),
  log_date         DATE,
  operation_number NUMBER(10)
)
;
create table T_DM_NULLFK_UPDATETIME_COLUMN
(
  table_name        VARCHAR2(30) not null,
  column_name       VARCHAR2(4000) not null,
  column_order      NUMBER default 1,
  parent_table_name VARCHAR2(30)
)
;
create table T_DM_NULLFK_VALUE
(
  nullfk_valueid   NUMBER(14) not null,
  fk_table_valueid NUMBER(12) not null,
  opt_id           NUMBER(10) not null,
  fk_field_name    VARCHAR2(30),
  field_type       VARCHAR2(30),
  fk_varchar2      VARCHAR2(100)
)
;

create table T_DM_OPT
(
  opt_id        NUMBER(10) not null,
  opt_date      DATE,
  opt_direction CHAR(1),
  opt_target    VARCHAR2(30),
  business_date DATE,
  success       CHAR(1) default 'N',
  error_log     VARCHAR2(4000)
)
;
create table T_DM_SCHEDULE
(
  schedule_list_id NUMBER(10) not null,
  direction        NUMBER(1),
  start_date       DATE,
  end_date         DATE,
  finished         NUMBER(1),
  result           VARCHAR2(10)
)
;
create table T_DM_TABLE_FK_REF
(
  foreign_key_table_name VARCHAR2(30),
  primary_key_table_name VARCHAR2(30),
  topology_layer         NUMBER(2)
)
;
create table T_DM_TABLE_KEY_INFO
(
  table_id                 NUMBER(4) not null,
  table_name               VARCHAR2(400),
  src_key_list             VARCHAR2(400),
  cnvt_src_ley_list        VARCHAR2(400),
  tgt_keyval_col_list      VARCHAR2(400),
  cnvt_tgt_keyval_col_list VARCHAR2(400)
)
;
create table T_DM_TABLE_LIST
(
  table_id                    NUMBER(4) not null,
  table_name                  VARCHAR2(40),
  synonym_name                VARCHAR2(40),
  globle_view_name            VARCHAR2(40),
  synchronize_back_delay_flag CHAR(1),
  indi_short_period_flag      CHAR(1)
)
;
create table T_DM_TABLE_RELATION
(
  config_id            NUMBER(4) not null,
  table_name           VARCHAR2(40),
  relation_number      NUMBER(12,2),
  back_relation_number NUMBER(12,2),
  parent_table         VARCHAR2(40),
  relation_logic       VARCHAR2(200),
  data_syn_way         NUMBER(1),
  old_relation_number  NUMBER(12,2)
)
;
create table T_DM_TABLE_VALUE
(
  value_id        NUMBER(12) not null,
  opt_id          NUMBER(10),
  table_id        NUMBER(4),
  relation_number NUMBER(10),
  pk_value1       VARCHAR2(100),
  pk_value2       VARCHAR2(100),
  pk_value3       VARCHAR2(100),
  pk_value4       VARCHAR2(100),
  pk_value5       VARCHAR2(100),
  pk_value6       VARCHAR2(100),
  pk_value7       VARCHAR2(100),
  pk_value8       VARCHAR2(100),
  pk_value9       VARCHAR2(100),
  pk_value10      VARCHAR2(100),
  pk_value11      VARCHAR2(100),
  pk_value12      VARCHAR2(100),
  pk_value13      VARCHAR2(100),
  pk_value14      VARCHAR2(100),
  pk_value15      VARCHAR2(100),
  pk_value16      VARCHAR2(100),
  synchron_delay  CHAR(1),
  value_verify    CHAR(1) default 'N'
)
;
create table T_DM_TABLE_VALUE_VERIFY
(
  table_value_id  NUMBER(10) not null,
  original_record VARCHAR2(4000),
  moved_record    VARCHAR2(4000),
  match           CHAR(1) default 'N',
  checktime       DATE
)
;
create table T_DM_UNPROCESSED_POLICIES
(
  policy_id     NUMBER(10) not null,
  policy_type   CHAR(1) not null,
  end_date      DATE,
  process_id    NUMBER(10) not null,
  operation_num NUMBER(10),
  direction     CHAR(1) default 1,
  failed        CHAR(1),
  clean         CHAR(1) default 'N'
)
;
create table T_DOUBLE_RECORD
(
  double_record_id NUMBER(10) not null,
  business_no      VARCHAR2(30) not null,
  send_code        VARCHAR2(20) not null,
  agent_code       VARCHAR2(25),
  certi_code       VARCHAR2(50),
  agent_type       VARCHAR2(2),
  op_code          VARCHAR2(2),
  op_name          VARCHAR2(30),
  op_timestamp     VARCHAR2(13),
  op_time          DATE,
  insert_time      DATE,
  remark_1         VARCHAR2(30),
  remark_2         VARCHAR2(30),
  remark_3         VARCHAR2(30),
  op_reason        CLOB
)
;
create table T_DOUBLE_RECORD_BANK
(
  bank_code VARCHAR2(20) not null,
  dr_type   CHAR(1)
)
;
create table T_DOUBLE_RECORD_CONFIG
(
  branch_bank VARCHAR2(20),
  organ_id    VARCHAR2(40)
)
;
create table T_DOUBLE_RECORD_POLICY
(
  policy_id         NUMBER(10) not null,
  send_code         VARCHAR2(20),
  has_double_record CHAR(1) default 'N'
)
;
create table T_DOUBLE_RECORD_RULE
(
  issue_way       NUMBER(10),
  bill_type       VARCHAR2(3),
  sell_way        VARCHAR2(2),
  min_age         NUMBER(3) not null,
  max_age         NUMBER(3) not null,
  de_product_type NUMBER(3) not null,
  de_organ_type   VARCHAR2(40) not null
)
;
create table T_DRAWABLE_CONTRACT_PRODUCT
(
  item_id     NUMBER(10),
  drawable    CHAR(1),
  insert_time DATE default SYSDATE,
  update_time DATE default SYSDATE
)
;
create table T_DRIVER_OCCU_TYPE
(
  occu_type NUMBER(3) not null,
  occu_name VARCHAR2(100) not null
)
;
create table T_DUMMY_INSURED
(
  policy_id             NUMBER(10) not null,
  dummy_num             VARCHAR2(4) not null,
  dummy_name            VARCHAR2(100) not null,
  job_class             NUMBER(10),
  insured_amount        NUMBER(10),
  average_age           NUMBER(2),
  prem_age              NUMBER(2),
  male_rate             NUMBER(4,3),
  gender                CHAR(1),
  smoking               CHAR(1),
  realized_amount       NUMBER(10) default 0 not null,
  insert_time           DATE default SYSDATE not null,
  update_time           DATE default SYSDATE not null,
  actual_insured_amount NUMBER(10),
  remark                VARCHAR2(4000),
  sin_emp_ins_amount    NUMBER(10),
  dou_emp_ins_amount    NUMBER(10),
  on_duty_staff         NUMBER(10),
  retired_staff         NUMBER(10)
)
;
create table T_DUMMY_GROUP
(
  policy_id       NUMBER(10) not null,
  dummy_num       VARCHAR2(4) not null,
  insured_id      NUMBER(10) not null,
  insured_amount  NUMBER(10) not null,
  realized_amount NUMBER(10) not null
)
;
create table T_DUMMY_GROUP_LOG
(
  change_id       NUMBER(10) not null,
  old_new         CHAR(1) not null,
  policy_id       NUMBER(10) not null,
  dummy_num       VARCHAR2(4) not null,
  insured_id      NUMBER(10) not null,
  insured_amount  NUMBER(10) not null,
  realized_amount NUMBER(10) not null
)
;
create table T_DUMMY_PRODUCT
(
  item_id                     NUMBER(10) not null,
  dummy_num                   VARCHAR2(4) not null,
  policy_id                   NUMBER(10) not null,
  product_num                 CHAR(3) not null,
  product_id                  NUMBER(10) not null,
  master_id                   NUMBER(10),
  ins_type                    CHAR(1) not null,
  amount                      NUMBER(14,2),
  unit                        NUMBER(12,2),
  discount_rate               NUMBER(8,6) not null,
  period_prem                 NUMBER(12,2),
  discount_prem               NUMBER(12,2),
  normal_prem                 NUMBER(12,2),
  normal_stand                NUMBER(12,2),
  job_class                   NUMBER(2),
  prem_age                    NUMBER(2),
  basic_code                  VARCHAR2(20),
  basic_id                    NUMBER(10),
  pay_period                  CHAR(1),
  pay_year                    NUMBER(3),
  end_period                  CHAR(1),
  end_year                    NUMBER(3),
  pay_ensure                  NUMBER(3),
  pay_type                    CHAR(1),
  charge_period               CHAR(1) not null,
  charge_year                 NUMBER(3),
  coverage_period             CHAR(1) not null,
  coverage_year               NUMBER(5),
  except_value                NUMBER(10),
  benefit_level               VARCHAR2(20),
  pay_rate                    NUMBER(4,3),
  insured_category            CHAR(1),
  insured_amount              NUMBER(10),
  count_way                   CHAR(1) not null,
  gender                      CHAR(1),
  smoking                     CHAR(1),
  charge_type                 CHAR(1),
  policy_prem                 NUMBER(12,2) default 0 not null,
  policy_stand                NUMBER(12,2) default 0 not null,
  tax_prem                    NUMBER(12,2) default 0 not null,
  tax_prem_stand              NUMBER(12,2) default 0 not null,
  pay_mode                    NUMBER(2) not null,
  policy_prem_source          VARCHAR2(1) not null,
  renew_decision              VARCHAR2(1) not null,
  discount_tax                NUMBER(16,6) default 0 not null,
  live_range                  VARCHAR2(1) default 0 not null,
  move_range                  VARCHAR2(1) default 0 not null,
  insert_time                 DATE default SYSDATE not null,
  update_time                 DATE default SYSDATE not null,
  validate_date               DATE,
  insurance_category          CHAR(1),
  insured_ride_type           NUMBER(2),
  vehicle_type                NUMBER(2),
  vehicle_license_num         VARCHAR2(20),
  vehicle_fram_num            VARCHAR2(20),
  vehicle_engine_num          VARCHAR2(20),
  carrying_passenger_num      NUMBER(10),
  insure_stop                 DATE,
  loan_amount                 NUMBER(14,2),
  sec_excpet_value            NUMBER(10),
  sec_amount                  NUMBER(14,2),
  limit_comm_amount           NUMBER(14,2),
  pay_multiple_five           NUMBER(10,2),
  pay_multiple_six            NUMBER(10,2),
  pay_multiple_seven          NUMBER(10,2),
  pay_multiple_eight          NUMBER(10,2),
  pay_multiple_nine           NUMBER(10,2),
  pay_multiple_ten            NUMBER(10,2),
  athlete_official            CHAR(1),
  daily_allowance_amount      NUMBER(14,2),
  daily_accessorial_amount    NUMBER(14,2),
  is_continue_apply           CHAR(1),
  hospital_pay_days           NUMBER(5),
  hospital_pay_accompany_days NUMBER(5)
)
;

create table T_DUMMY_GRP_PROD
(
  item_id                NUMBER(10) not null,
  dummy_num              VARCHAR2(4) not null,
  insured_id             NUMBER(10) not null,
  policy_id              NUMBER(10) not null,
  period_prem            NUMBER(12,2) not null,
  discount_prem          NUMBER(12,2) not null,
  discount_tax           NUMBER(16,6) not null,
  normal_prem            NUMBER(12,2) not null,
  tax_prem               NUMBER(12,2) not null,
  policy_prem            NUMBER(12,2) not null,
  validate_date          DATE not null,
  end_date               DATE not null,
  amount                 NUMBER(14,2),
  unit                   NUMBER(12,2),
  charge_type            CHAR(1),
  insurance_category     CHAR(1),
  insured_ride_type      NUMBER(2),
  vehicle_type           NUMBER(2),
  vehicle_license_num    VARCHAR2(20),
  vehicle_fram_num       VARCHAR2(20),
  vehicle_engine_num     VARCHAR2(20),
  carrying_passenger_num NUMBER(10),
  loan_amount            NUMBER(14,2)
)
;
create table T_DUMMY_GRP_PROD_LOG
(
  change_id     NUMBER(10) not null,
  old_new       CHAR(1) not null,
  item_id       NUMBER(10) not null,
  dummy_num     VARCHAR2(4) not null,
  insured_id    NUMBER(10) not null,
  policy_id     NUMBER(10) not null,
  period_prem   NUMBER(12,2) not null,
  discount_prem NUMBER(12,2) not null,
  discount_tax  NUMBER(16,6) not null,
  normal_prem   NUMBER(12,2) not null,
  tax_prem      NUMBER(12,2) not null,
  policy_prem   NUMBER(12,2) not null,
  validate_date DATE not null,
  end_date      DATE not null,
  amount        NUMBER(14,2),
  unit          NUMBER(12,2),
  charge_type   CHAR(1),
  loan_amount   NUMBER(14,2)
)
;
create table T_DUMMY_INSURED_LOG
(
  change_id             NUMBER(10) not null,
  old_new               CHAR(1) not null,
  policy_id             NUMBER(10) not null,
  dummy_num             VARCHAR2(4) not null,
  dummy_name            VARCHAR2(100) not null,
  job_class             NUMBER(10),
  insured_amount        NUMBER(10) not null,
  realized_amount       NUMBER(10) default 0 not null,
  average_age           NUMBER(2),
  prem_age              NUMBER(2),
  male_rate             NUMBER(4,3),
  gender                CHAR(1),
  smoking               CHAR(1),
  insert_time           DATE default SYSDATE not null,
  update_time           DATE default SYSDATE not null,
  actual_insured_amount VARCHAR2(4000),
  remark                VARCHAR2(4000),
  sin_emp_ins_amount    NUMBER(10),
  dou_emp_ins_amount    NUMBER(10),
  on_duty_staff         NUMBER(10),
  retired_staff         NUMBER(10)
)
;
create table T_DUMMY_POLICY_PROD_LIAB
(
  config_id NUMBER(10) not null,
  item_id   NUMBER(10) not null,
  dummy_num VARCHAR2(4) not null,
  liab_id   NUMBER(4),
  liab_type NUMBER(2)
)
;
create table T_DUMMY_POL_ACC_PARA
(
  group_policy_id  NUMBER(10) not null,
  dummy_num        VARCHAR2(4) not null,
  accutor_param_id NUMBER(10) not null,
  assumpsit_level  CHAR(1) not null,
  apply_level      VARCHAR2(100),
  insured_id       NUMBER(10),
  param_1          NUMBER(12,2),
  param_2          NUMBER(12,2),
  formula_1        VARCHAR2(100),
  formula_2        VARCHAR2(100),
  def_period_type  NUMBER(4)
)
;
create table T_DUMMY_POL_LIAB_HI
(
  group_policy_id   NUMBER(10) not null,
  dummy_num         VARCHAR2(4) not null,
  group_item_id     NUMBER(10) not null,
  plan_list_id      NUMBER(10) not null,
  excess_liquidity  NUMBER(10),
  pay_rate          NUMBER(4,3),
  basic_amount      NUMBER(14,2),
  premium           NUMBER(14,2),
  basic_amount_note VARCHAR2(100),
  insured_amount    NUMBER(10)
)
;
create table T_DUMMY_POL_LIAB_HI_LOG
(
  group_policy_id   NUMBER(10) not null,
  dummy_num         VARCHAR2(4) not null,
  group_item_id     NUMBER(10) not null,
  plan_list_id      NUMBER(10) not null,
  excess_liquidity  NUMBER(10),
  pay_rate          NUMBER(4,3),
  basic_amount      NUMBER(14,2),
  premium           NUMBER(14,2),
  basic_amount_note VARCHAR2(100),
  insured_amount    NUMBER(10),
  change_id         NUMBER(10) not null,
  old_new           CHAR(1) not null
)
;
create table T_DUMMY_POL_LIAB_PAY_PA
(
  group_policy_id        NUMBER(10) not null,
  group_item_id          NUMBER(10) not null,
  dummy_num              VARCHAR2(4) not null,
  liab_id                NUMBER(4) not null,
  product_id             NUMBER(7) not null,
  except_amount          NUMBER(12,2),
  pay_rate               NUMBER(4,3),
  elimination_period     NUMBER(5),
  limit_comm_amount      NUMBER(14),
  sec_amount             NUMBER(14),
  special_medical_amount NUMBER(12,2),
  hospital_amount        NUMBER(12,2)
)
;
create table T_DUMMY_POL_LIAB_PAY_PA_LOG
(
  group_policy_id        NUMBER(10) not null,
  group_item_id          NUMBER(10) not null,
  dummy_num              VARCHAR2(4) not null,
  liab_id                NUMBER(4) not null,
  product_id             NUMBER(7) not null,
  except_amount          NUMBER(12,2),
  pay_rate               NUMBER(4,3),
  elimination_period     NUMBER(5),
  limit_comm_amount      NUMBER(14),
  sec_amount             NUMBER(14),
  change_id              NUMBER(10) not null,
  old_new                CHAR(1) not null,
  special_medical_amount NUMBER(12,2),
  hospital_amount        NUMBER(12,2)
)
;
create table T_DUMMY_PRODUCT_CS
(
  group_policy_id NUMBER(10) not null,
  group_item_id   NUMBER(10) not null,
  dummy_num       VARCHAR2(4) not null,
  discount_prem   NUMBER(12,2),
  normal_stand    NUMBER(12,2),
  total_prem      NUMBER(12,2),
  validate_date   DATE,
  end_date        DATE,
  pay_mode        NUMBER(2),
  pay_next        NUMBER(2),
  total_amount    NUMBER(12,2)
)
;
create table T_DUMMY_PRODUCT_CS_LOG
(
  group_policy_id NUMBER(10) not null,
  group_item_id   NUMBER(10) not null,
  dummy_num       VARCHAR2(4) not null,
  change_id       NUMBER(10) not null,
  old_new         CHAR(1) not null,
  discount_prem   NUMBER(12,2),
  normal_stand    NUMBER(12,2),
  total_prem      NUMBER(12,2),
  validate_date   DATE,
  end_date        DATE,
  pay_mode        NUMBER(2),
  pay_next        NUMBER(2),
  total_amount    NUMBER(12,2)
)
;
create table T_DUMMY_PRODUCT_LOG
(
  change_id                   NUMBER(10) not null,
  old_new                     CHAR(1) not null,
  item_id                     NUMBER(10) not null,
  dummy_num                   VARCHAR2(4) not null,
  policy_id                   NUMBER(10) not null,
  product_num                 CHAR(3) not null,
  master_id                   NUMBER(10),
  product_id                  NUMBER(10) not null,
  ins_type                    CHAR(1) not null,
  count_way                   CHAR(1) not null,
  amount                      NUMBER(14,2),
  unit                        NUMBER(12,2),
  period_prem                 NUMBER(12,2),
  discount_prem               NUMBER(12,2),
  discount_rate               NUMBER(8,6) not null,
  discount_tax                NUMBER(16,6) default 0 not null,
  normal_prem                 NUMBER(12,2),
  normal_stand                NUMBER(12,2),
  tax_prem                    NUMBER(12,2) default 0 not null,
  tax_prem_stand              NUMBER(12,2) default 0 not null,
  policy_prem                 NUMBER(12,2) default 0 not null,
  policy_prem_source          VARCHAR2(1) not null,
  policy_stand                NUMBER(12,2) default 0 not null,
  pay_mode                    NUMBER(2) not null,
  renew_decision              VARCHAR2(1) not null,
  job_class                   NUMBER(2),
  prem_age                    NUMBER(2),
  gender                      CHAR(1),
  smoking                     CHAR(1),
  charge_type                 CHAR(1),
  basic_code                  VARCHAR2(20),
  basic_id                    NUMBER(10),
  charge_period               CHAR(1),
  charge_year                 NUMBER(3),
  coverage_period             CHAR(1),
  coverage_year               NUMBER(5),
  pay_period                  CHAR(1),
  pay_year                    NUMBER(3),
  end_period                  CHAR(1),
  end_year                    NUMBER(3),
  pay_ensure                  NUMBER(3),
  pay_type                    CHAR(1),
  except_value                NUMBER(10),
  benefit_level               VARCHAR2(20),
  pay_rate                    NUMBER(4,3),
  insured_category            CHAR(1),
  insured_amount              NUMBER(10),
  live_range                  VARCHAR2(1) default 0 not null,
  move_range                  VARCHAR2(1) default 0 not null,
  insure_stop                 DATE,
  loan_amount                 NUMBER(14,2),
  insured_ride_type           NUMBER(2),
  vehicle_type                NUMBER(2),
  vehicle_license_num         VARCHAR2(20),
  vehicle_fram_num            VARCHAR2(20),
  vehicle_engine_num          VARCHAR2(20),
  validate_date               DATE,
  carrying_passenger_num      NUMBER(10),
  pay_multiple_five           NUMBER(10,2),
  pay_multiple_six            NUMBER(10,2),
  pay_multiple_seven          NUMBER(10,2),
  pay_multiple_eight          NUMBER(10,2),
  pay_multiple_nine           NUMBER(10,2),
  pay_multiple_ten            NUMBER(10,2),
  athlete_official            CHAR(1),
  daily_allowance_amount      NUMBER(14,2),
  daily_accessorial_amount    NUMBER(14,2),
  limit_comm_amount           NUMBER(14,2),
  is_continue_apply           CHAR(1),
  hospital_pay_days           NUMBER(5),
  hospital_pay_accompany_days NUMBER(5)
)
;

create table T_DUMMY_PROD_ORGAN_CFG
(
  config_id  NUMBER(10) not null,
  product_id NUMBER(7) not null,
  organ_id   VARCHAR2(40) not null,
  start_time DATE not null,
  end_time   DATE not null
)
;
create table T_EBIZ_FEE_SETTLE_LIST
(
  list_id          NUMBER(10) not null,
  insert_id        NUMBER(10),
  insert_time      DATE default SYSDATE,
  policy_count     NUMBER(8),
  policy_list      CLOB,
  fee_type         NUMBER(4),
  pay_mode         NUMBER(2),
  fee_amount       NUMBER(14,2),
  cash_bank        VARCHAR2(40),
  cash_account     VARCHAR2(40),
  cheque_code      VARCHAR2(40),
  net_bank_code    VARCHAR2(40),
  net_bank_account VARCHAR2(40),
  settle_date      DATE,
  settle_id        NUMBER(10)
)
;
create table T_ECIF_COMP_MAP
(
  list_id    NUMBER(10) not null,
  company_id NUMBER(10),
  ecif_id    NUMBER(20),
  is_add     VARCHAR2(2)
)
;
create table T_ECIF_COMP_MAP_DEL
(
  list_id     NUMBER(10),
  company_id  NUMBER(10),
  ecif_id     NUMBER(20),
  delete_time DATE default SYSDATE not null
)
;
create table T_ECIF_CUSTOMER
(
  ecif_cust_id       NUMBER(10) not null,
  ecif_id            NUMBER(20) not null,
  real_name          VARCHAR2(120) not null,
  gender             CHAR(1) not null,
  birthday           DATE not null,
  certi_type         NUMBER(2) not null,
  certi_code         VARCHAR2(50) not null,
  marriage_id        CHAR(1),
  education_id       VARCHAR2(2),
  height             NUMBER(4,1),
  weight             NUMBER(5,2),
  email              VARCHAR2(100),
  income             NUMBER(14,4),
  smoking            CHAR(1) default 'N' not null,
  insert_time        DATE default sysdate not null,
  status             CHAR(1) default '2' not null,
  death_time         DATE,
  lang_id            VARCHAR2(3),
  homeplace          VARCHAR2(100),
  nation_code        VARCHAR2(2),
  accident_status    VARCHAR2(2) default '0' not null,
  update_time        DATE default sysdate not null,
  householder        CHAR(1) default 'Y' not null,
  honor_title        VARCHAR2(30),
  organ_id           VARCHAR2(40),
  cust_grade         VARCHAR2(2) default '1' not null,
  employed           CHAR(1) default 'N' not null,
  emp_id             NUMBER(10),
  certi_start_date   DATE,
  certi_end_date     DATE,
  family_income      NUMBER(10),
  working_life       NUMBER(2),
  is_chinese_only    CHAR(1),
  authorization_sign CHAR(1)
)
;
create table T_ECIF_CUSTOMER_DEL
(
  ecif_cust_id NUMBER(10),
  ecif_id      NUMBER(20),
  delete_time  DATE default SYSDATE not null
)
;
create table T_ECIF_CUST_ADDRESS
(
  ecif_cust_id   NUMBER(10) not null,
  ecif_id        NUMBER(20) not null,
  address_1      VARCHAR2(150),
  zip_1          VARCHAR2(10),
  rela_address   VARCHAR2(200),
  rela_zip       VARCHAR2(10),
  country_code   VARCHAR2(3),
  nationality    VARCHAR2(50),
  seat_address   VARCHAR2(200),
  job_address    VARCHAR2(200),
  other_address  VARCHAR2(200),
  other_zip      VARCHAR2(10),
  rela_address_2 VARCHAR2(100),
  rela_address_3 VARCHAR2(100),
  rela_address_4 VARCHAR2(100),
  address_2      VARCHAR2(100),
  address_3      VARCHAR2(100),
  address_4      VARCHAR2(100),
  job_address_2  VARCHAR2(100),
  job_address_3  VARCHAR2(100),
  job_address_4  VARCHAR2(100),
  address_type   CHAR(1),
  area_id_job    VARCHAR2(10),
  job_zip        VARCHAR2(50)
)
;
create table T_ECIF_CUST_ADDRESS_DEL
(
  ecif_cust_id NUMBER(10),
  ecif_id      NUMBER(20),
  delete_time  DATE default SYSDATE not null
)
;
create table T_ECIF_CUST_CONTACT
(
  ecif_cust_id    NUMBER(10) not null,
  ecif_id         NUMBER(20) not null,
  tel_1           VARCHAR2(40),
  tel_3           VARCHAR2(40),
  rela_other      VARCHAR2(40),
  bp              VARCHAR2(40),
  celler_areacode VARCHAR2(10),
  celler          VARCHAR2(40),
  mobile          VARCHAR2(40)
)
;
create table T_ECIF_CUST_CONTACT_DEL
(
  ecif_cust_id NUMBER(10),
  ecif_id      NUMBER(20),
  delete_time  DATE default SYSDATE not null
)
;
create table T_ECIF_CUST_JOB
(
  ecif_cust_id     NUMBER(10) not null,
  ecif_id          NUMBER(20) not null,
  job_com          VARCHAR2(100),
  corrent_job      VARCHAR2(200),
  part_job         VARCHAR2(40),
  job_class        NUMBER(2),
  job_code         VARCHAR2(20),
  job_cate_id      NUMBER(10),
  title            VARCHAR2(50),
  part_job_class   NUMBER(2),
  part_job_code    VARCHAR2(20),
  part_job_cate_id NUMBER(10),
  job_content      VARCHAR2(400),
  job_kind         NUMBER(2)
)
;
create table T_ECIF_CUST_JOB_DEL
(
  ecif_cust_id NUMBER(10),
  ecif_id      NUMBER(20),
  delete_time  DATE default SYSDATE not null
)
;
create table T_ECIF_CUST_MAP
(
  list_id     NUMBER(10) not null,
  customer_id NUMBER(10),
  ecif_id     NUMBER(20),
  is_add      VARCHAR2(2)
)
;
create table T_ECIF_CUST_MAP_DEL
(
  list_id     NUMBER(10),
  customer_id NUMBER(10),
  ecif_id     NUMBER(20),
  delete_time DATE default SYSDATE not null
)
;
create table T_ECIF_EVENT_BATCH
(
  batch_id    NUMBER(10) not null,
  business_id NUMBER(10),
  busi_module NUMBER(3),
  status      NUMBER(2),
  policy_type CHAR(1),
  batch_style NUMBER(2),
  batch_info  CLOB,
  insert_time DATE default SYSDATE,
  update_time DATE default SYSDATE
)
;
create table T_ECIF_EVENT_LIST
(
  list_id        NUMBER(10) not null,
  batch_id       NUMBER(10),
  customer_id    NUMBER(10),
  customer_type  NUMBER(2),
  company_id     NUMBER(10),
  ecif_id        NUMBER(20),
  fail_count     NUMBER(3) default 0,
  max_fail_count NUMBER(4) default 3,
  error_desc     CLOB,
  list_info      CLOB,
  insert_time    DATE default SYSDATE,
  update_time    DATE default SYSDATE
)
;
create table T_ECIF_EVENT_SUCCESS
(
  list_id       NUMBER(10) not null,
  batch_id      NUMBER(10),
  customer_id   NUMBER(10),
  customer_type NUMBER(2),
  company_id    NUMBER(10),
  ecif_id       NUMBER(20),
  list_info     CLOB,
  insert_time   DATE default SYSDATE
)
;
create table T_ECIF_MERGE_LOG
(
  log_id         NUMBER(10) not null,
  d_ecif_id      NUMBER(15) not null,
  s_ecif_id      NUMBER(15) not null,
  new_ecif_id    NUMBER(15),
  operation_id   NUMBER(10),
  operation_type VARCHAR2(200),
  merge_result   VARCHAR2(4000),
  insert_time    DATE default sysdate
)
;
create table T_ECIF_SYNC_DELETE
(
  list_id     NUMBER(10) not null,
  table_name  VARCHAR2(20),
  pk_column_1 NUMBER(12),
  pk_column_2 NUMBER(10),
  pk_column_3 NUMBER(10),
  insert_time DATE
)
;
create table T_ECOMMERCE_TRADE_DETAIL
(
  policy_id   NUMBER(10) not null,
  platform_id NUMBER(10) not null,
  prem_id     NUMBER(10),
  update_time DATE,
  mode_id     NUMBER(10)
)
;
create table T_ECOM_FINANCE_PLATFORM
(
  platform_id   NUMBER(10) default 0 not null,
  platform_code VARCHAR2(20) not null,
  platform_name VARCHAR2(20) not null
)
;
create table T_ECOM_FINANCE_CFG
(
  config_id         NUMBER(10),
  organ_id          VARCHAR2(40) not null,
  special_id        NUMBER(3) not null,
  cash_bank         VARCHAR2(20) not null,
  cash_account      VARCHAR2(40) not null,
  settle_id         NUMBER(10) not null,
  agent_id          NUMBER(10) not null,
  insert_time       DATE,
  update_time       DATE,
  platform_id       NUMBER(10) default 0 not null,
  input_source_code VARCHAR2(5)
)
;
create table T_ECOM_SETTLE_LIST
(
  list_id     NUMBER(10),
  send_code   VARCHAR2(15),
  period_prem NUMBER(12,2),
  agency_code VARCHAR2(15),
  blob_id     NUMBER(12),
  fee_id      NUMBER(12)
)
;

create table T_EDOC_COL
(
  col_id     NUMBER(10) not null,
  col_code   VARCHAR2(40) not null,
  col_name   VARCHAR2(100) not null,
  col_type   NUMBER(2) default 1 not null,
  col_length NUMBER(4),
  temp_table VARCHAR2(40)
)
;
create table T_EDOC_COL_DISPOSAL_TYPE
(
  disposal_type CHAR(2) not null,
  disposal_desc VARCHAR2(40) not null
)
;
create table T_EDOC_FIELD_INFO
(
  list_id     CHAR(10) not null,
  policy_id   NUMBER(10) not null,
  upload_id   NUMBER(10) not null,
  insert_time DATE default sysdate,
  update_time DATE default sysdate,
  text        CLOB
)
;
create table T_EDOC_MODULE
(
  module_id   NUMBER(10) not null,
  module_name VARCHAR2(80) not null,
  module_code VARCHAR2(20)
)
;
create table T_EDOC_MODULE_CATE
(
  cate_id   CHAR(1) not null,
  module_id NUMBER(10) not null
)
;
create table T_EDOC_MODULE_COL
(
  module_id NUMBER(10) not null,
  col_id    NUMBER(10) not null
)
;
create table T_EDOC_TEMPL_BIZ
(
  templ_id      CHAR(2) not null,
  func_type     NUMBER(2),
  edoc_func     VARCHAR2(200),
  sync_max_rows NUMBER(10) default 9999999999,
  process_id    NUMBER(10)
)
;
create table T_EDOC_TEMPL_COL
(
  templ_id      NUMBER(10) not null,
  col_seq       NUMBER(3) not null,
  col_id        NUMBER(10) not null,
  col_type      NUMBER(2) not null,
  col_length    NUMBER(4),
  disposal_type CHAR(2) default '0'
)
;
create table T_EDUCATE_BASE
(
  base_id   NUMBER(4) not null,
  area_type NUMBER(10),
  grade_id  VARCHAR2(3),
  amount    NUMBER(10,2)
)
;
create table T_EDUCATION_RATE
(
  education_id VARCHAR2(2) not null,
  rate         NUMBER(5,4)
)
;
create table T_EDUCATION_STAGE
(
  stage_id   NUMBER(2) not null,
  stage_desc VARCHAR2(100) not null
)
;
create table T_EMAIL_CONFIG
(
  system_code VARCHAR2(20) not null,
  emp_id      NUMBER(12) not null,
  email       VARCHAR2(100) not null,
  status      CHAR(1),
  insert_time DATE,
  update_time DATE
)
;
create table T_EMPLOYEE_AGENT
(
  agent_id              NUMBER(10) not null,
  real_name             VARCHAR2(40) not null,
  user_name             VARCHAR2(30),
  password              VARCHAR2(32),
  gender                CHAR(1),
  birthday              DATE,
  certi_type            NUMBER(2),
  certi_code            VARCHAR2(50),
  agent_code            VARCHAR2(25) not null,
  password_change       DATE,
  organ_id              VARCHAR2(40) not null,
  head_id               VARCHAR2(40) not null,
  branch_id             VARCHAR2(40) not null,
  user_status           CHAR(1),
  dept_id               VARCHAR2(20) not null,
  political_id          VARCHAR2(2),
  education_id          VARCHAR2(2),
  foreign_lang_id       VARCHAR2(3),
  foreign_level_id      VARCHAR2(2),
  compute_level         VARCHAR2(2),
  instructor_grade_id   VARCHAR2(2),
  begin_job_date        DATE,
  technical_post        VARCHAR2(20),
  native_place          VARCHAR2(5),
  register_address      VARCHAR2(100),
  family_address        VARCHAR2(100),
  address_area          VARCHAR2(10),
  telephone             VARCHAR2(30),
  old_job_unit          VARCHAR2(50),
  old_job_id            VARCHAR2(10),
  bp                    VARCHAR2(30),
  celler_tel            VARCHAR2(30),
  email                 VARCHAR2(50),
  address               VARCHAR2(100),
  marriage_id           CHAR(1),
  special_favor         VARCHAR2(30),
  cautioner1_name       VARCHAR2(40),
  cautioner1_certi_type NUMBER(2),
  cautioner1_certi_code VARCHAR2(50),
  cautioner1_unit       VARCHAR2(50),
  cautioner2_name       VARCHAR2(40),
  cautioner2_certi_type NUMBER(2),
  cautioner2_certi_code VARCHAR2(50),
  cautioner2_unit       VARCHAR2(50),
  train_man_id          NUMBER(10),
  recommend_man_id      NUMBER(10),
  grade_id              VARCHAR2(3),
  quality_grade_id      NUMBER(3),
  qualification_id      VARCHAR2(20),
  practice_id           VARCHAR2(50),
  invest_connect_id     VARCHAR2(20),
  other_certificate_id  VARCHAR2(20),
  enter_company_date    DATE,
  leave_company_date    DATE,
  agent_status          NUMBER(2) not null,
  update_time           DATE,
  updater_id            NUMBER(10),
  probation_date        DATE,
  turn_date             DATE,
  zip                   VARCHAR2(6),
  agent_cate            VARCHAR2(1) not null,
  sign_date             DATE,
  end_date              DATE,
  g_business_cate       NUMBER(2),
  g_grade_id            NUMBER(2),
  g_position_id         NUMBER(2),
  is_charge             NUMBER(1) not null,
  comm_account          VARCHAR2(40),
  prem_account          VARCHAR2(40),
  business_cate         NUMBER(2),
  dept_train_id         NUMBER(10),
  area_train_id         NUMBER(10),
  group_train_date      DATE,
  dept_train_date       DATE,
  area_train_date       DATE,
  nation_code           VARCHAR2(2),
  indirect_train_id     NUMBER(10),
  ind_dept_train_id     NUMBER(10),
  comm_bank_code        VARCHAR2(20),
  prem_bank_code        VARCHAR2(20),
  b_grade_id            VARCHAR2(3),
  b_instructor_id       VARCHAR2(3),
  b_technical_post      VARCHAR2(3),
  finance_post_id       VARCHAR2(3),
  b_grade_num           NUMBER(3),
  reenter_flag          CHAR(1),
  position_id           VARCHAR2(3),
  sell_grade            NUMBER(3),
  leave_cause           VARCHAR2(6),
  leave_target          NUMBER(3),
  c_grade_id            VARCHAR2(3),
  is_mdrt               CHAR(1),
  union_code            VARCHAR2(10),
  is_adp2               CHAR(1),
  adp2_date             DATE,
  isc_num               NUMBER(2) not null,
  insert_time           DATE not null,
  address_2             VARCHAR2(100),
  address_3             VARCHAR2(100),
  address_4             VARCHAR2(100),
  spouse_name           VARCHAR2(40),
  spouse_certi_code     VARCHAR2(50),
  citizen_type          VARCHAR2(6),
  docfpcap              CHAR(1),
  comm_ibg_code         VARCHAR2(30),
  source_code           VARCHAR2(30),
  letter_status         VARCHAR2(1)
)
;
create table T_EMPLOYEE_AUTHORITY_LOG
(
  emp_id                  NUMBER(10) not null,
  update_time             DATE not null,
  user_name               VARCHAR2(20),
  real_name               VARCHAR2(40) not null,
  pre_uw_type             VARCHAR2(1),
  pre_level_id            NUMBER(2),
  uw_type                 VARCHAR2(1),
  level_id                NUMBER(2),
  operator                NUMBER(10) not null,
  list_id                 NUMBER(10) not null,
  group_level_id          NUMBER(2),
  pre_group_level_id      NUMBER(2),
  pre_group_long_level_id NUMBER(2),
  group_long_level_id     NUMBER(2)
)
;
create table T_EMPLOYEE_CLAIM_LEVEL
(
  emp_id            NUMBER(10) not null,
  head_id           VARCHAR2(40) not null,
  individual_long   NUMBER(4),
  individual_short  NUMBER(4),
  group_long        NUMBER(4),
  group_short       NUMBER(4),
  batch_claim       NUMBER(2),
  insert_time       DATE default SYSDATE not null,
  update_time       DATE default SYSDATE not null,
  individual_simple NUMBER(4),
  group_simple      NUMBER(4)
)
;
create table T_EMPLOYEE_DEL
(
  emp_id      NUMBER(10),
  delete_time DATE default SYSDATE not null
)
;
create table T_EMPLOYEE_PROXY
(
  emp_id           NUMBER(10) not null,
  out_emp_code     VARCHAR2(10) not null,
  out_company_id   VARCHAR2(8) not null,
  out_company_name VARCHAR2(100) not null,
  out_organ_id     VARCHAR2(10) not null,
  out_organ_name   VARCHAR2(100) not null,
  approve_time     DATE,
  report_type      VARCHAR2(1) not null
)
;
create table T_EMPLOYEE_SIGNET
(
  emp_id     NUMBER(10) not null,
  signet_pic BLOB
)
;
create table T_EMP_BOOK
(
  book_id NUMBER(10) not null,
  emp_id  NUMBER(10) not null
)
;
create table T_EMP_CS_APPROVE_LEVEL
(
  level_code NUMBER(10) not null,
  level_name VARCHAR2(200)
)
;
create table T_EMP_CS_APPROVE_LOG
(
  organ_code        VARCHAR2(50),
  organ_name        VARCHAR2(200),
  user_code         VARCHAR2(50),
  user_name         VARCHAR2(200),
  cs_policy_belevel NUMBER(10),
  cs_audit_belevel  NUMBER(10),
  cs_policy_level   NUMBER(10),
  cs_audit_level    NUMBER(10),
  list_id           NUMBER(10) not null,
  update_time       DATE,
  opertor           NUMBER(10),
  emp_id            NUMBER(10)
)
;
create table T_EMP_LOG
(
  log_id   NUMBER(20) not null,
  emp_id   NUMBER(10) not null,
  log_desc VARCHAR2(4000) not null,
  log_time DATE default SYSDATE not null
)
;
create table T_EMP_PREM_SERI_DISEA_FEE_LOG
(
  log_id      NUMBER(10) not null,
  change_id   NUMBER(10),
  product_id  NUMBER(10),
  product_num CHAR(3),
  insert_time DATE,
  insured_1   NUMBER(10),
  policy_id   NUMBER(10),
  fee_type    NUMBER(3),
  amount      NUMBER(12,2),
  company_fee NUMBER(12,2)
)
;
create table T_EM_FEE
(
  fee_id        NUMBER(10) not null,
  product_id    NUMBER(7) not null,
  premium_year  NUMBER(3) default 0 not null,
  period        NUMBER(4) default 0 not null,
  gender        CHAR(1) default 'N' not null,
  age           NUMBER(3) default 999 not null,
  smoking       CHAR(1) default 'W' not null,
  year          NUMBER(3) default 999 not null,
  min_em        NUMBER(4) default 0 not null,
  max_em        NUMBER(4) default 9999 not null,
  opt_flag      CHAR(1) not null,
  assign_rate   NUMBER(5,4),
  assign_amount NUMBER(14,4),
  benefit_level VARCHAR2(20) default '0',
  pay_year      NUMBER(3) default 0,
  begin_date    DATE,
  end_date      DATE
)
;

create table T_EM_PREM
(
  basic_id   NUMBER(10) not null,
  gender     CHAR(1) default 'N' not null,
  age        NUMBER(3) default 999 not null,
  min_em     NUMBER(4) default 0 not null,
  max_em     NUMBER(4) default 0 not null,
  smoking    CHAR(1) default 'W' not null,
  extra_prem NUMBER(10,2)
)
;

create table T_EM_SUMLIMIT
(
  min_em     NUMBER(4) default 0 not null,
  max_em     NUMBER(4) default 9999 not null,
  max_life   NUMBER(10) default 9999999999,
  max_sudden NUMBER(10) default 9999999999,
  max_person NUMBER(10) default 9999999999,
  max_ill    NUMBER(10) default 9999999999
)
;
create table T_ENDOMAIN_PRINT
(
  print_id       NUMBER(12) not null,
  notice_code    VARCHAR2(200),
  notice_time    VARCHAR2(10),
  service_name   VARCHAR2(50),
  policy_code    VARCHAR2(20),
  applicant_name VARCHAR2(100),
  pos_txt        VARCHAR2(4000),
  remark         VARCHAR2(200),
  handler_code   VARCHAR2(20),
  accepter_code  VARCHAR2(20),
  print_time     VARCHAR2(10),
  print_type     NUMBER(2),
  print_group    NUMBER(10)
)
;
create table T_ENDOWMENT_INFO
(
  holder_id      NUMBER(10) not null,
  send_time      DATE,
  is_send        CHAR(1),
  inconform_time DATE,
  reconfirm_time DATE
)
;
create table T_ENDOWMENT_PRODUCTS
(
  product_id      NUMBER(7) not null,
  hold_date       VARCHAR2(100),
  need_accumulate CHAR(1) default 'Y' not null
)
;
create table T_ENDO_APP_STS_TBL
(
  endo_app_sts VARCHAR2(1) not null,
  full_name    VARCHAR2(40) not null,
  abbr_name    VARCHAR2(10) not null
)
;
create table T_ENDO_APPLY
(
  apply_seq      VARCHAR2(16) not null,
  entno          VARCHAR2(16),
  polno          VARCHAR2(16),
  certno         VARCHAR2(16),
  clientno       NUMBER(10),
  company_id     NUMBER(10),
  app_date       DATE,
  asnee_name     VARCHAR2(50),
  asnee_idno     VARCHAR2(20),
  pos_type       NUMBER(10) not null,
  endo_cause     VARCHAR2(10),
  proc_empno     NUMBER(10),
  proc_date      DATE,
  approver       NUMBER(10),
  approver_date  DATE,
  endo_empno     NUMBER(10),
  endo_date      DATE,
  app_txt        VARCHAR2(2000),
  endo_app_sts   VARCHAR2(1) not null,
  organ_id       VARCHAR2(40) not null,
  deptno         VARCHAR2(20) not null,
  fcd            DATE not null,
  fcu            VARCHAR2(10) not null,
  lcd            DATE not null,
  lcu            VARCHAR2(10) not null,
  accept_channel VARCHAR2(1) default '0' not null,
  asnee_sex      CHAR(1),
  asnee_id_type  NUMBER(2),
  asnee_type     CHAR(1),
  insert_time    DATE default SYSDATE not null,
  update_time    DATE default SYSDATE not null
)
;
create table T_ENDO_STS_TBL
(
  endo_sts  VARCHAR2(1) not null,
  full_name VARCHAR2(40) not null,
  abbr_name VARCHAR2(10) not null
)
;
create table T_ENDO_MAIN
(
  entno         VARCHAR2(16) not null,
  apply_seq     VARCHAR2(16),
  polno         VARCHAR2(16),
  certno        VARCHAR2(16),
  clientno      NUMBER(10),
  company_id    NUMBER(10),
  apply_date    DATE,
  pos_type      NUMBER(10) not null,
  endo_cause    VARCHAR2(10) not null,
  proc_empno    NUMBER(10),
  proc_date     DATE,
  approver      NUMBER(10) not null,
  approver_date DATE,
  endo_empno    NUMBER(10),
  endo_date     DATE,
  endo_sts      VARCHAR2(1) not null,
  pos_prn       VARCHAR2(1) default 'N' not null,
  pos_txt       VARCHAR2(2000),
  prn_date      DATE,
  organ_id      VARCHAR2(40) not null,
  deptno        VARCHAR2(20) not null,
  fcd           DATE not null,
  fcu           VARCHAR2(10) not null,
  lcd           DATE not null,
  lcu           VARCHAR2(10) not null,
  asnee_sex     CHAR(1),
  asnee_id_type NUMBER(2),
  asnee_type    CHAR(1),
  asnee_name    VARCHAR2(50),
  asnee_idno    VARCHAR2(20),
  insert_time   DATE default SYSDATE not null,
  update_time   DATE default SYSDATE not null
)
;
create table T_ENDO_CERT_DETAIL
(
  entno       VARCHAR2(16) not null,
  polno       VARCHAR2(16) not null,
  certno      VARCHAR2(16) not null,
  pos_type    NUMBER(10) not null,
  pos_item    VARCHAR2(32) not null,
  data_type   VARCHAR2(1),
  old_value   VARCHAR2(100),
  new_value   VARCHAR2(100),
  proc_date   DATE not null,
  organ_id    VARCHAR2(40) not null,
  deptno      VARCHAR2(20) not null,
  fcd         DATE not null,
  fcu         VARCHAR2(10) not null,
  lcd         DATE not null,
  lcu         VARCHAR2(10) not null,
  insert_time DATE default SYSDATE not null,
  update_time DATE default SYSDATE not null
)
;
create table T_ENDO_CLIENT_DETAIL
(
  entno       VARCHAR2(16) not null,
  clientno    NUMBER(10) not null,
  pos_type    NUMBER(10) not null,
  pos_item    VARCHAR2(32) not null,
  data_type   VARCHAR2(1),
  old_value   VARCHAR2(100),
  new_value   VARCHAR2(100),
  endo_date   DATE,
  organ_id    VARCHAR2(40) not null,
  deptno      VARCHAR2(20) not null,
  fcd         DATE not null,
  fcu         VARCHAR2(10) not null,
  lcd         DATE not null,
  lcu         VARCHAR2(10) not null,
  insert_time DATE default SYSDATE not null,
  update_time DATE default SYSDATE not null
)
;
create table T_ENDO_CONVERT_DETAIL
(
  apply_seq       VARCHAR2(16) not null,
  entno           VARCHAR2(16),
  polno           VARCHAR2(16) not null,
  certno          VARCHAR2(16) not null,
  acct_code       VARCHAR2(6) not null,
  entst_fund_code VARCHAR2(4) not null,
  entst_fund_amt  NUMBER(14,4) default 0 not null,
  bargn_fund_code VARCHAR2(4) not null,
  proc_empno      NUMBER(10),
  proc_date       DATE,
  organ_id        VARCHAR2(40) not null,
  deptno          VARCHAR2(20) not null,
  fcd             DATE not null,
  fcu             VARCHAR2(10) not null,
  lcd             DATE not null,
  lcu             VARCHAR2(10) not null,
  insert_time     DATE default SYSDATE not null,
  update_time     DATE default SYSDATE not null
)
;
create table T_SEX_TBL
(
  sex         VARCHAR2(1) not null,
  description VARCHAR2(40) not null
)
;
create table T_ENDO_INS_BENEF
(
  apply_seq   VARCHAR2(16) not null,
  entno       VARCHAR2(16),
  insno       NUMBER(10) not null,
  polno       VARCHAR2(16) not null,
  name        VARCHAR2(20) not null,
  sex         VARCHAR2(1) not null,
  benef_seq   NUMBER(2) default 1 not null,
  benef_rate  NUMBER(5,4) default 0 not null,
  benef_idno  VARCHAR2(20),
  organ_id    VARCHAR2(40) not null,
  deptno      VARCHAR2(20) not null,
  fcd         DATE not null,
  fcu         VARCHAR2(10) not null,
  lcd         DATE not null,
  lcu         VARCHAR2(10) not null,
  id_type     NUMBER(2),
  birthday    DATE,
  relation_id NUMBER(2),
  insert_time DATE default SYSDATE not null,
  update_time DATE default SYSDATE not null
)
;
create table T_ENDO_INS_CERT
(
  apply_seq          VARCHAR2(16) not null,
  entno              VARCHAR2(16),
  polno              VARCHAR2(16) not null,
  plan_code          VARCHAR2(10) not null,
  insno              NUMBER(10) not null,
  age                NUMBER(3) default 0 not null,
  ascript_start_date DATE not null,
  invest_auth        VARCHAR2(1) default 'N' not null,
  ins_rank           VARCHAR2(2) not null,
  pay_type           CHAR(1) not null,
  pay_age            NUMBER(4) default 0 not null,
  bankno             VARCHAR2(20),
  bank_acctno        VARCHAR2(30),
  prem_type          CHAR(1) not null,
  te_sum             NUMBER(12,2) default 0 not null,
  tp_sum             NUMBER(12,2) default 0 not null,
  fe_sum             NUMBER(12,2) default 0 not null,
  fp_sum             NUMBER(12,2) default 0 not null,
  salary             NUMBER(12,2) default 0 not null,
  salary_e_prem_rate NUMBER(5,4),
  salary_p_prem_rate NUMBER(5,4),
  organ_id           VARCHAR2(40) not null,
  deptno             VARCHAR2(20) not null,
  fcd                DATE not null,
  fcu                VARCHAR2(10) not null,
  lcd                DATE not null,
  lcu                VARCHAR2(10) not null,
  dividend_choice    NUMBER(1) default 2 not null,
  pay_date_type      NUMBER(1) default 1 not null,
  ins_seq            NUMBER(10),
  insert_time        DATE default SYSDATE not null,
  update_time        DATE default SYSDATE not null
)
;
create table T_ENDO_INS_INVEST
(
  apply_seq   VARCHAR2(16) not null,
  entno       VARCHAR2(16),
  insno       NUMBER(10) not null,
  auth_src    VARCHAR2(1) not null,
  fund_code   VARCHAR2(4) not null,
  invest_rate NUMBER(5,4) not null,
  proc_empno  NUMBER(10),
  proc_date   DATE,
  organ_id    VARCHAR2(40) not null,
  deptno      VARCHAR2(20) not null,
  fcd         DATE not null,
  fcu         VARCHAR2(10) not null,
  lcd         DATE not null,
  lcu         VARCHAR2(10) not null,
  insert_time DATE default SYSDATE not null,
  update_time DATE default SYSDATE not null
)
;
create table T_ENDO_INVEST_DETAIL
(
  apply_seq   VARCHAR2(16) not null,
  entno       VARCHAR2(16),
  polno       VARCHAR2(16) not null,
  certno      VARCHAR2(16) not null,
  auth_src    VARCHAR2(1) not null,
  fund_code   VARCHAR2(4) not null,
  invest_rate NUMBER(5,4) not null,
  proc_empno  NUMBER(10),
  proc_date   DATE,
  organ_id    VARCHAR2(40) not null,
  deptno      VARCHAR2(20) not null,
  fcd         DATE not null,
  fcu         VARCHAR2(10) not null,
  lcd         DATE not null,
  lcu         VARCHAR2(10) not null,
  insert_time DATE default SYSDATE not null,
  update_time DATE default SYSDATE not null
)
;
create table T_ENDO_POL_DETAIL
(
  entno       VARCHAR2(16) not null,
  polno       VARCHAR2(16) not null,
  pos_type    NUMBER(10) not null,
  pos_item    VARCHAR2(32) not null,
  data_type   VARCHAR2(1),
  old_value   VARCHAR2(100),
  new_value   VARCHAR2(100),
  endo_date   DATE,
  organ_id    VARCHAR2(40) not null,
  deptno      VARCHAR2(20) not null,
  fcd         DATE not null,
  fcu         VARCHAR2(10) not null,
  lcd         DATE not null,
  lcu         VARCHAR2(10) not null,
  insert_time DATE default SYSDATE not null,
  update_time DATE default SYSDATE not null
)
;
create table T_ENDO_PREMIUM
(
  apply_seq          VARCHAR2(16) not null,
  entno              VARCHAR2(16),
  polno              VARCHAR2(16) not null,
  certno             VARCHAR2(16) not null,
  salary             NUMBER(12,2) default 0 not null,
  te_sum             NUMBER(12,2) default 0 not null,
  tp_sum             NUMBER(12,2) default 0 not null,
  fe_sum             NUMBER(12,2) default 0 not null,
  fp_sum             NUMBER(12,2) default 0 not null,
  salary_e_prem_rate NUMBER(5,4) default 0 not null,
  salary_p_prem_rate NUMBER(5,4) default 0 not null,
  proc_empno         NUMBER(10),
  proc_date          DATE,
  organ_id           VARCHAR2(40) not null,
  deptno             VARCHAR2(20) not null,
  fcd                DATE not null,
  fcu                VARCHAR2(10) not null,
  lcd                DATE not null,
  lcu                VARCHAR2(10) not null,
  insert_time        DATE default SYSDATE not null,
  update_time        DATE default SYSDATE not null
)
;
create table T_REDU_TYPE_TBL
(
  redu_type NUMBER(2) not null,
  type_name VARCHAR2(30) not null
)
;
create table T_ENDO_REDUCE_DETAIL
(
  apply_seq   VARCHAR2(16) not null,
  entno       VARCHAR2(16),
  polno       VARCHAR2(16) not null,
  certno      VARCHAR2(16) not null,
  apply_sum   NUMBER(12,2) default 0 not null,
  redu_type   NUMBER(1) not null,
  proc_empno  NUMBER(10),
  proc_date   DATE,
  organ_id    VARCHAR2(40) not null,
  deptno      VARCHAR2(20) not null,
  fcd         DATE not null,
  fcu         VARCHAR2(10) not null,
  lcd         DATE not null,
  lcu         VARCHAR2(10) not null,
  insert_time DATE default SYSDATE not null,
  update_time DATE default SYSDATE not null
)
;
create table T_ENDO_SPLIT_DETAIL
(
  apply_seq   VARCHAR2(16) not null,
  entno       VARCHAR2(16),
  polno       VARCHAR2(16) not null,
  certno      VARCHAR2(16) not null,
  proc_empno  NUMBER(10),
  proc_date   DATE,
  organ_id    VARCHAR2(40) not null,
  deptno      VARCHAR2(20) not null,
  fcd         DATE not null,
  fcu         VARCHAR2(10) not null,
  lcd         DATE not null,
  lcu         VARCHAR2(10) not null,
  insert_time DATE default SYSDATE not null,
  update_time DATE default SYSDATE not null
)
;
create table T_END_AGREEMENT_CATEGORY
(
  category_id   NUMBER(4) not null,
  category_name VARCHAR2(100) not null
)
;
create table T_END_AGREEMENT_REASON
(
  reason_id          NUMBER(2) not null,
  reason_desc        VARCHAR2(200),
  reason_detail_desc VARCHAR2(4000),
  category_id        NUMBER(4)
)
;
create table T_END_RENEWAL_PROD_CFG
(
  cfg_id     NUMBER(4) not null,
  product_id NUMBER(7) not null,
  end_date   DATE
)
;
create table T_ENQUIRY
(
  enquiry_id       NUMBER(10) not null,
  company_name     VARCHAR2(100) not null,
  insured_amount   NUMBER(10) not null,
  male_rate        NUMBER(4,3) not null,
  insured_rate     NUMBER(4,3),
  average_age      NUMBER(2),
  trade_type       NUMBER(4),
  social_insurance CHAR(1),
  insured_history  VARCHAR2(4000),
  special_request  VARCHAR2(4000),
  time_limit       NUMBER(2) not null,
  inquirer_id      NUMBER(10) not null,
  agency_code      VARCHAR2(20) not null
)
;
create table T_ENQUIRY_PRODUCT
(
  item_id        NUMBER(10) not null,
  enquiry_id     NUMBER(10) not null,
  amount         NUMBER(14,2) not null,
  diagnosis_rate NUMBER(4,3) not null,
  hospital_rate  NUMBER(4,3) not null,
  exempt_amount  NUMBER(14,2) not null
)
;
create table T_ENTRUSTED_CONTRACT_ACC
(
  biz_id       NUMBER(10) not null,
  biz_type     NUMBER(2) not null,
  account_type NUMBER(2) not null,
  amount       NUMBER(12,2)
)
;
create table T_ENTRUSTED_CONTRACT_DUMMY_ACC
(
  biz_id       NUMBER(10) not null,
  dummy_num    VARCHAR2(4) not null,
  biz_type     NUMBER(2) not null,
  account_type NUMBER(2) not null,
  amount       NUMBER(12,2)
)
;
create table T_ENTRUSTED_CONTRACT_RATE
(
  policy_id    NUMBER(10) not null,
  rate_type    NUMBER(2) not null,
  account_type NUMBER(2) not null,
  assign_rate  NUMBER(4,3) not null
)
;
create table T_ENTRUSTED_LIAB_TYPE
(
  type_id        NUMBER(2) not null,
  type_name      VARCHAR2(120),
  master_type_id NUMBER(2)
)
;
create table T_EPOLICY_PRODUCT
(
  list_id    NUMBER(10) not null,
  product_id NUMBER(10),
  status     NUMBER(1)
)
;
create table T_ERROR_LOG
(
  log_id         NUMBER(10) not null,
  type_id        NUMBER(7) not null,
  error_desc     VARCHAR2(4000) not null,
  error_position VARCHAR2(100) not null,
  occur_time     DATE default SYSDATE not null,
  status         CHAR(1) default '0' not null
)
;
create table T_ERROR_POLICY
(
  policy_id  NUMBER(10) not null,
  product_id NUMBER(10),
  job_class  NUMBER(2)
)
;
create table T_INTERVIEW_STATUS
(
  status_name      VARCHAR2(60) not null,
  interview_status VARCHAR2(2) not null
)
;
create table T_INTERVIEW_SUGGEST
(
  general_suggest VARCHAR2(2) not null,
  suggest_name    VARCHAR2(60) not null
)
;
create table T_INTERVIEW_INFO
(
  interview_code   VARCHAR2(20) not null,
  real_name        VARCHAR2(40) not null,
  certi_code       VARCHAR2(50),
  gender           CHAR(1),
  birthday         DATE,
  education_id     VARCHAR2(2),
  resume           VARCHAR2(4000),
  position         VARCHAR2(50) not null,
  input_date       DATE default SYSDATE not null,
  updater_id       NUMBER(10),
  general_num      NUMBER(6,2),
  general_desc     VARCHAR2(1000),
  general_input_id NUMBER(10),
  general_suggest  VARCHAR2(2),
  suggest_date     DATE,
  interview_status VARCHAR2(2) not null
)
;
create table T_ESTIMATE_INFO
(
  estimate_id       NUMBER(10) not null,
  interview_code    VARCHAR2(20) not null,
  estimate_num      NUMBER(6,2) not null,
  estimate_desc     VARCHAR2(1000),
  estimate_input_id NUMBER(10),
  estimate_suggest  VARCHAR2(2) not null,
  estimate_date     DATE default SYSDATE not null
)
;
create table T_INTERVIEW_TYPE
(
  interview_type VARCHAR2(10) not null,
  interview_name VARCHAR2(60) not null,
  rate           NUMBER(5,3)
)
;
create table T_INTERVIEW_GRADE
(
  grade_code     VARCHAR2(10) not null,
  interview_type VARCHAR2(10) not null,
  grade          NUMBER(6,3) not null,
  grade_desc     VARCHAR2(500) not null
)
;
create table T_ESTIMATE_DETAIL
(
  list_id        NUMBER(10) not null,
  estimate_id    NUMBER(10) not null,
  grade_code     VARCHAR2(10) not null,
  interview_type VARCHAR2(10) not null
)
;
create table T_EVENT_EXCEPT_RATE
(
  product_id         NUMBER(7) not null,
  event_except_value NUMBER(10) not null,
  rate               NUMBER(4,3) not null,
  origin             CHAR(1) not null
)
;
create table T_EXCEPT_ANNUITY_BALANCE
(
  policy_id     NUMBER(10) not null,
  policy_code   VARCHAR2(20) not null,
  validate_date DATE,
  end_date      DATE,
  holder_id     NUMBER(10) not null,
  product_id    NUMBER(7) not null,
  is_fix        CHAR(1) default 'N' not null,
  recorder_id   NUMBER(10) not null,
  insert_time   DATE,
  updater_id    NUMBER(10) not null,
  update_time   DATE
)
;
create table T_EXCEPT_TYPE
(
  type_id   NUMBER(1) not null,
  type_name VARCHAR2(30) not null
)
;
create table T_EXCEPT_VALUE_RATE
(
  product_id   NUMBER(7) not null,
  except_value NUMBER(10) not null,
  rate         NUMBER(4,3) not null,
  origin       CHAR(1) not null
)
;
create table T_EXCHANGE_RATE
(
  standard_id       NUMBER(6) not null,
  exchange_id       NUMBER(6) not null,
  issue_date        DATE not null,
  cash_buy_rate     NUMBER(14,8) not null,
  voucher_buy_rate  NUMBER(14,8) not null,
  cash_sell_rate    NUMBER(14,8) not null,
  voucher_sell_rate NUMBER(14,8) not null
)
;
create table T_EXPENSE_RATE
(
  rate_id          NUMBER(10) not null,
  product_id       NUMBER(7) not null,
  premium_year     NUMBER(3) default 0 not null,
  period           NUMBER(4) default 0 not null,
  pay_period       CHAR(1) default '0' not null,
  pay_year         NUMBER(3) default 0 not null,
  end_period       CHAR(1) default '0' not null,
  end_year         NUMBER(3) default 0 not null,
  pay_ensure       NUMBER(3) default 0 not null,
  pay_type         CHAR(1) default '0' not null,
  increase_rate    NUMBER(5,4) default 0 not null,
  increase_freq    CHAR(1) default '0' not null,
  increase_year    NUMBER(2) default 0 not null,
  pay_rate         NUMBER(4,3) default 0 not null,
  except_value     NUMBER(10) default 0 not null,
  housekeeper      CHAR(1) default 'W' not null,
  retired          CHAR(1) default 'W' not null,
  job_cate         NUMBER(2) default 0 not null,
  gender           CHAR(1) default 'N' not null,
  age              NUMBER(3) default 999 not null,
  age_month        NUMBER(2) default 99 not null,
  smoking          CHAR(1) default 'W' not null,
  insured_category CHAR(1) default '0' not null,
  gender_related   CHAR(1) default 'N' not null,
  age_related      NUMBER(3) default 999 not null,
  related_month    NUMBER(2) default 99 not null,
  benefit_level    VARCHAR2(20) default '0' not null,
  year             NUMBER(3) default 999 not null,
  expense_rate     NUMBER(5,4),
  simple_compound  CHAR(1) default '0' not null
)
;
create table T_EXT_COL_CONFIG
(
  col_id      NUMBER(10) not null,
  table_name  VARCHAR2(100) not null,
  col_name    VARCHAR2(100) not null,
  col_desc    VARCHAR2(100) not null,
  insert_time DATE default SYSDATE
)
;
create