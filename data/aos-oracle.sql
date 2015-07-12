--------------------------------------------
-- Export file for user AOS               --
-- Created by XChun on 2015/7/12, 15:14:31 --
--------------------------------------------

set define off
spool aos-oracle.log

prompt
prompt Creating table AOS_ACT_EVT_LOG
prompt ==============================
prompt
create table AOS_ACT_EVT_LOG
(
  log_nr_       NUMBER(19) not null,
  type_         NVARCHAR2(64),
  proc_def_id_  NVARCHAR2(64),
  proc_inst_id_ NVARCHAR2(64),
  execution_id_ NVARCHAR2(64),
  task_id_      NVARCHAR2(64),
  time_stamp_   TIMESTAMP(6) not null,
  user_id_      NVARCHAR2(255),
  data_         BLOB,
  lock_owner_   NVARCHAR2(255),
  lock_time_    TIMESTAMP(6),
  is_processed_ NUMBER(3) default 0
)
;
alter table AOS_ACT_EVT_LOG
  add primary key (LOG_NR_);

prompt
prompt Creating table AOS_ACT_RE_DEPLOYMENT
prompt ====================================
prompt
create table AOS_ACT_RE_DEPLOYMENT
(
  id_          NVARCHAR2(64) not null,
  name_        NVARCHAR2(255),
  category_    NVARCHAR2(255),
  tenant_id_   NVARCHAR2(255) default '',
  deploy_time_ TIMESTAMP(6)
)
;
alter table AOS_ACT_RE_DEPLOYMENT
  add primary key (ID_);

prompt
prompt Creating table AOS_ACT_GE_BYTEARRAY
prompt ===================================
prompt
create table AOS_ACT_GE_BYTEARRAY
(
  id_            NVARCHAR2(64) not null,
  rev_           INTEGER,
  name_          NVARCHAR2(255),
  deployment_id_ NVARCHAR2(64),
  bytes_         BLOB,
  generated_     NUMBER(1)
)
;
create index AOS_ACT_IDX_BYTEAR_DEPL on AOS_ACT_GE_BYTEARRAY (DEPLOYMENT_ID_);
alter table AOS_ACT_GE_BYTEARRAY
  add primary key (ID_);
alter table AOS_ACT_GE_BYTEARRAY
  add constraint AOS_ACT_FK_BYTEARR_DEPL foreign key (DEPLOYMENT_ID_)
  references AOS_ACT_RE_DEPLOYMENT (ID_);
alter table AOS_ACT_GE_BYTEARRAY
  add check (GENERATED_ IN (1,0));

prompt
prompt Creating table AOS_ACT_GE_PROPERTY
prompt ==================================
prompt
create table AOS_ACT_GE_PROPERTY
(
  name_  NVARCHAR2(64) not null,
  value_ NVARCHAR2(300),
  rev_   INTEGER
)
;
alter table AOS_ACT_GE_PROPERTY
  add primary key (NAME_);

prompt
prompt Creating table AOS_ACT_HI_ACTINST
prompt =================================
prompt
create table AOS_ACT_HI_ACTINST
(
  id_                NVARCHAR2(64) not null,
  proc_def_id_       NVARCHAR2(64) not null,
  proc_inst_id_      NVARCHAR2(64) not null,
  execution_id_      NVARCHAR2(64) not null,
  act_id_            NVARCHAR2(255) not null,
  task_id_           NVARCHAR2(64),
  call_proc_inst_id_ NVARCHAR2(64),
  act_name_          NVARCHAR2(255),
  act_type_          NVARCHAR2(255) not null,
  assignee_          NVARCHAR2(255),
  start_time_        TIMESTAMP(6) not null,
  end_time_          TIMESTAMP(6),
  duration_          NUMBER(19),
  tenant_id_         NVARCHAR2(255) default ''
)
;
create index AOS_ACT_IDX_HI_ACT_INST_1 on AOS_ACT_HI_ACTINST (START_TIME_);
create index AOS_ACT_IDX_HI_ACT_INST_2 on AOS_ACT_HI_ACTINST (END_TIME_);
create index AOS_ACT_IDX_HI_ACT_INST_3 on AOS_ACT_HI_ACTINST (PROC_INST_ID_, ACT_ID_);
create index AOS_ACT_IDX_HI_ACT_INST_4 on AOS_ACT_HI_ACTINST (EXECUTION_ID_, ACT_ID_);
alter table AOS_ACT_HI_ACTINST
  add primary key (ID_);

prompt
prompt Creating table AOS_ACT_HI_ATTACHMENT
prompt ====================================
prompt
create table AOS_ACT_HI_ATTACHMENT
(
  id_           NVARCHAR2(64) not null,
  rev_          INTEGER,
  user_id_      NVARCHAR2(255),
  name_         NVARCHAR2(255),
  description_  NVARCHAR2(2000),
  type_         NVARCHAR2(255),
  task_id_      NVARCHAR2(64),
  proc_inst_id_ NVARCHAR2(64),
  url_          NVARCHAR2(2000),
  content_id_   NVARCHAR2(64),
  time_         TIMESTAMP(6)
)
;
alter table AOS_ACT_HI_ATTACHMENT
  add primary key (ID_);

prompt
prompt Creating table AOS_ACT_HI_COMMENT
prompt =================================
prompt
create table AOS_ACT_HI_COMMENT
(
  id_           NVARCHAR2(64) not null,
  type_         NVARCHAR2(255),
  time_         TIMESTAMP(6) not null,
  user_id_      NVARCHAR2(255),
  task_id_      NVARCHAR2(64),
  proc_inst_id_ NVARCHAR2(64),
  action_       NVARCHAR2(255),
  message_      NVARCHAR2(2000),
  full_msg_     BLOB
)
;
alter table AOS_ACT_HI_COMMENT
  add primary key (ID_);

prompt
prompt Creating table AOS_ACT_HI_DETAIL
prompt ================================
prompt
create table AOS_ACT_HI_DETAIL
(
  id_           NVARCHAR2(64) not null,
  type_         NVARCHAR2(255) not null,
  proc_inst_id_ NVARCHAR2(64),
  execution_id_ NVARCHAR2(64),
  task_id_      NVARCHAR2(64),
  act_inst_id_  NVARCHAR2(64),
  name_         NVARCHAR2(255) not null,
  var_type_     NVARCHAR2(64),
  rev_          INTEGER,
  time_         TIMESTAMP(6) not null,
  bytearray_id_ NVARCHAR2(64),
  double_       NUMBER(*,10),
  long_         NUMBER(19),
  text_         NVARCHAR2(2000),
  text2_        NVARCHAR2(2000)
)
;
create index AOS_ACT_IDX_HI_DETAIL_1 on AOS_ACT_HI_DETAIL (PROC_INST_ID_);
create index AOS_ACT_IDX_HI_DETAIL_2 on AOS_ACT_HI_DETAIL (ACT_INST_ID_);
create index AOS_ACT_IDX_HI_DETAIL_3 on AOS_ACT_HI_DETAIL (TIME_);
create index AOS_ACT_IDX_HI_DETAIL_4 on AOS_ACT_HI_DETAIL (NAME_);
create index AOS_ACT_IDX_HI_DETAIL_5 on AOS_ACT_HI_DETAIL (TASK_ID_);
alter table AOS_ACT_HI_DETAIL
  add primary key (ID_);

prompt
prompt Creating table AOS_ACT_HI_IDENTITYLINK
prompt ======================================
prompt
create table AOS_ACT_HI_IDENTITYLINK
(
  id_           NVARCHAR2(64) not null,
  group_id_     NVARCHAR2(255),
  type_         NVARCHAR2(255),
  user_id_      NVARCHAR2(255),
  task_id_      NVARCHAR2(64),
  proc_inst_id_ NVARCHAR2(64)
)
;
create index AOS_ACT_IDX_HI_IDENT_LNK_1 on AOS_ACT_HI_IDENTITYLINK (USER_ID_);
create index AOS_ACT_IDX_HI_IDENT_LNK_2 on AOS_ACT_HI_IDENTITYLINK (TASK_ID_);
create index AOS_ACT_IDX_HI_IDENT_LNK_3 on AOS_ACT_HI_IDENTITYLINK (PROC_INST_ID_);
alter table AOS_ACT_HI_IDENTITYLINK
  add primary key (ID_);

prompt
prompt Creating table AOS_ACT_HI_PROCINST
prompt ==================================
prompt
create table AOS_ACT_HI_PROCINST
(
  id_                        NVARCHAR2(64) not null,
  proc_inst_id_              NVARCHAR2(64) not null,
  business_key_              NVARCHAR2(255),
  proc_def_id_               NVARCHAR2(64) not null,
  start_time_                TIMESTAMP(6) not null,
  end_time_                  TIMESTAMP(6),
  duration_                  NUMBER(19),
  start_user_id_             NVARCHAR2(255),
  start_act_id_              NVARCHAR2(255),
  end_act_id_                NVARCHAR2(255),
  super_process_instance_id_ NVARCHAR2(64),
  delete_reason_             NVARCHAR2(2000),
  tenant_id_                 NVARCHAR2(255) default '',
  name_                      NVARCHAR2(255)
)
;
create index AOS_ACT_IDX_HI_PRO_1 on AOS_ACT_HI_PROCINST (END_TIME_);
create index AOS_ACT_IDX_HI_PRO_2 on AOS_ACT_HI_PROCINST (BUSINESS_KEY_);
alter table AOS_ACT_HI_PROCINST
  add primary key (ID_);
alter table AOS_ACT_HI_PROCINST
  add unique (PROC_INST_ID_);

prompt
prompt Creating table AOS_ACT_HI_TASKINST
prompt ==================================
prompt
create table AOS_ACT_HI_TASKINST
(
  id_             NVARCHAR2(64) not null,
  proc_def_id_    NVARCHAR2(64),
  task_def_key_   NVARCHAR2(255),
  proc_inst_id_   NVARCHAR2(64),
  execution_id_   NVARCHAR2(64),
  parent_task_id_ NVARCHAR2(64),
  name_           NVARCHAR2(255),
  description_    NVARCHAR2(2000),
  owner_          NVARCHAR2(255),
  assignee_       NVARCHAR2(255),
  start_time_     TIMESTAMP(6) not null,
  claim_time_     TIMESTAMP(6),
  end_time_       TIMESTAMP(6),
  duration_       NUMBER(19),
  delete_reason_  NVARCHAR2(2000),
  priority_       INTEGER,
  due_date_       TIMESTAMP(6),
  form_key_       NVARCHAR2(255),
  category_       NVARCHAR2(255),
  tenant_id_      NVARCHAR2(255) default ''
)
;
alter table AOS_ACT_HI_TASKINST
  add primary key (ID_);

prompt
prompt Creating table AOS_ACT_HI_VARINST
prompt =================================
prompt
create table AOS_ACT_HI_VARINST
(
  id_                NVARCHAR2(64) not null,
  proc_inst_id_      NVARCHAR2(64),
  execution_id_      NVARCHAR2(64),
  task_id_           NVARCHAR2(64),
  name_              NVARCHAR2(255) not null,
  var_type_          NVARCHAR2(100),
  rev_               INTEGER,
  bytearray_id_      NVARCHAR2(64),
  double_            NUMBER(*,10),
  long_              NUMBER(19),
  text_              NVARCHAR2(2000),
  text2_             NVARCHAR2(2000),
  create_time_       TIMESTAMP(6),
  last_updated_time_ TIMESTAMP(6)
)
;
create index AOS_ACT_IDX_HI_PROCVAR_1 on AOS_ACT_HI_VARINST (PROC_INST_ID_);
create index AOS_ACT_IDX_HI_PROCVAR_2 on AOS_ACT_HI_VARINST (NAME_, VAR_TYPE_);
create index AOS_ACT_IDX_HI_PROCVAR_ID on AOS_ACT_HI_VARINST (TASK_ID_);
alter table AOS_ACT_HI_VARINST
  add primary key (ID_);

prompt
prompt Creating table AOS_ACT_ID_GROUP
prompt ===============================
prompt
create table AOS_ACT_ID_GROUP
(
  id_   NVARCHAR2(64) not null,
  rev_  INTEGER,
  name_ NVARCHAR2(255),
  type_ NVARCHAR2(255)
)
;
alter table AOS_ACT_ID_GROUP
  add primary key (ID_);

prompt
prompt Creating table AOS_ACT_ID_INFO
prompt ==============================
prompt
create table AOS_ACT_ID_INFO
(
  id_        NVARCHAR2(64) not null,
  rev_       INTEGER,
  user_id_   NVARCHAR2(64),
  type_      NVARCHAR2(64),
  key_       NVARCHAR2(255),
  value_     NVARCHAR2(255),
  password_  BLOB,
  parent_id_ NVARCHAR2(255)
)
;
alter table AOS_ACT_ID_INFO
  add primary key (ID_);

prompt
prompt Creating table AOS_ACT_ID_USER
prompt ==============================
prompt
create table AOS_ACT_ID_USER
(
  id_         NVARCHAR2(64) not null,
  rev_        INTEGER,
  first_      NVARCHAR2(255),
  last_       NVARCHAR2(255),
  email_      NVARCHAR2(255),
  pwd_        NVARCHAR2(255),
  picture_id_ NVARCHAR2(64)
)
;
alter table AOS_ACT_ID_USER
  add primary key (ID_);

prompt
prompt Creating table AOS_ACT_ID_MEMBERSHIP
prompt ====================================
prompt
create table AOS_ACT_ID_MEMBERSHIP
(
  user_id_  NVARCHAR2(64) not null,
  group_id_ NVARCHAR2(64) not null
)
;
create index AOS_ACT_IDX_MEMB_GROUP on AOS_ACT_ID_MEMBERSHIP (GROUP_ID_);
create index AOS_ACT_IDX_MEMB_USER on AOS_ACT_ID_MEMBERSHIP (USER_ID_);
alter table AOS_ACT_ID_MEMBERSHIP
  add primary key (USER_ID_, GROUP_ID_);
alter table AOS_ACT_ID_MEMBERSHIP
  add constraint AOS_ACT_FK_MEMB_GROUP foreign key (GROUP_ID_)
  references AOS_ACT_ID_GROUP (ID_);
alter table AOS_ACT_ID_MEMBERSHIP
  add constraint AOS_ACT_FK_MEMB_USER foreign key (USER_ID_)
  references AOS_ACT_ID_USER (ID_);

prompt
prompt Creating table AOS_ACT_RE_MODEL
prompt ===============================
prompt
create table AOS_ACT_RE_MODEL
(
  id_                           NVARCHAR2(64) not null,
  rev_                          INTEGER,
  name_                         NVARCHAR2(255),
  key_                          NVARCHAR2(255),
  category_                     NVARCHAR2(255),
  create_time_                  TIMESTAMP(6),
  last_update_time_             TIMESTAMP(6),
  version_                      INTEGER,
  meta_info_                    NVARCHAR2(2000),
  deployment_id_                NVARCHAR2(64),
  editor_source_value_id_       NVARCHAR2(64),
  editor_source_extra_value_id_ NVARCHAR2(64),
  tenant_id_                    NVARCHAR2(255) default ''
)
;
create index AOS_ACT_IDX_MODEL_DEPLOYMENT on AOS_ACT_RE_MODEL (DEPLOYMENT_ID_);
create index AOS_ACT_IDX_MODEL_SOURCE on AOS_ACT_RE_MODEL (EDITOR_SOURCE_VALUE_ID_);
create index AOS_ACT_IDX_MODEL_SOURCE_EXTRA on AOS_ACT_RE_MODEL (EDITOR_SOURCE_EXTRA_VALUE_ID_);
alter table AOS_ACT_RE_MODEL
  add primary key (ID_);
alter table AOS_ACT_RE_MODEL
  add constraint AOS_ACT_FK_MODEL_DEPLOYMENT foreign key (DEPLOYMENT_ID_)
  references AOS_ACT_RE_DEPLOYMENT (ID_);
alter table AOS_ACT_RE_MODEL
  add constraint AOS_ACT_FK_MODEL_SOURCE foreign key (EDITOR_SOURCE_VALUE_ID_)
  references AOS_ACT_GE_BYTEARRAY (ID_);
alter table AOS_ACT_RE_MODEL
  add constraint AOS_ACT_FK_MODEL_SOURCE_EXTRA foreign key (EDITOR_SOURCE_EXTRA_VALUE_ID_)
  references AOS_ACT_GE_BYTEARRAY (ID_);

prompt
prompt Creating table AOS_ACT_RE_PROCDEF
prompt =================================
prompt
create table AOS_ACT_RE_PROCDEF
(
  id_                     NVARCHAR2(64) not null,
  rev_                    INTEGER,
  category_               NVARCHAR2(255),
  name_                   NVARCHAR2(255),
  key_                    NVARCHAR2(255) not null,
  version_                INTEGER not null,
  deployment_id_          NVARCHAR2(64),
  resource_name_          NVARCHAR2(2000),
  dgrm_resource_name_     VARCHAR2(4000),
  description_            NVARCHAR2(2000),
  has_start_form_key_     NUMBER(1),
  has_graphical_notation_ NUMBER(1),
  suspension_state_       INTEGER,
  tenant_id_              NVARCHAR2(255) default ''
)
;
alter table AOS_ACT_RE_PROCDEF
  add primary key (ID_);
alter table AOS_ACT_RE_PROCDEF
  add constraint ACT_UNIQ_PROCDEF unique (KEY_, VERSION_, TENANT_ID_);
alter table AOS_ACT_RE_PROCDEF
  add check (HAS_START_FORM_KEY_ IN (1,0));
alter table AOS_ACT_RE_PROCDEF
  add check (HAS_GRAPHICAL_NOTATION_ IN (1,0));

prompt
prompt Creating table AOS_ACT_RU_EXECUTION
prompt ===================================
prompt
create table AOS_ACT_RU_EXECUTION
(
  id_               NVARCHAR2(64) not null,
  rev_              INTEGER,
  proc_inst_id_     NVARCHAR2(64),
  business_key_     NVARCHAR2(255),
  parent_id_        NVARCHAR2(64),
  proc_def_id_      NVARCHAR2(64),
  super_exec_       NVARCHAR2(64),
  act_id_           NVARCHAR2(255),
  is_active_        NUMBER(1),
  is_concurrent_    NUMBER(1),
  is_scope_         NUMBER(1),
  is_event_scope_   NUMBER(1),
  suspension_state_ INTEGER,
  cached_ent_state_ INTEGER,
  tenant_id_        NVARCHAR2(255) default '',
  name_             NVARCHAR2(255),
  lock_time_        TIMESTAMP(6)
)
;
create index AOS_ACT_IDX_EXEC_BUSKEY on AOS_ACT_RU_EXECUTION (BUSINESS_KEY_);
create index AOS_ACT_IDX_EXE_PARENT on AOS_ACT_RU_EXECUTION (PARENT_ID_);
create index AOS_ACT_IDX_EXE_PROCDEF on AOS_ACT_RU_EXECUTION (PROC_DEF_ID_);
create index AOS_ACT_IDX_EXE_PROCINST on AOS_ACT_RU_EXECUTION (PROC_INST_ID_);
create index AOS_ACT_IDX_EXE_SUPER on AOS_ACT_RU_EXECUTION (SUPER_EXEC_);
alter table AOS_ACT_RU_EXECUTION
  add primary key (ID_);
alter table AOS_ACT_RU_EXECUTION
  add constraint AOS_ACT_FK_EXE_PARENT foreign key (PARENT_ID_)
  references AOS_ACT_RU_EXECUTION (ID_);
alter table AOS_ACT_RU_EXECUTION
  add constraint AOS_ACT_FK_EXE_PROCDEF foreign key (PROC_DEF_ID_)
  references AOS_ACT_RE_PROCDEF (ID_);
alter table AOS_ACT_RU_EXECUTION
  add constraint AOS_ACT_FK_EXE_PROCINST foreign key (PROC_INST_ID_)
  references AOS_ACT_RU_EXECUTION (ID_);
alter table AOS_ACT_RU_EXECUTION
  add constraint AOS_ACT_FK_EXE_SUPER foreign key (SUPER_EXEC_)
  references AOS_ACT_RU_EXECUTION (ID_);
alter table AOS_ACT_RU_EXECUTION
  add check (IS_ACTIVE_ IN (1,0));
alter table AOS_ACT_RU_EXECUTION
  add check (IS_CONCURRENT_ IN (1,0));
alter table AOS_ACT_RU_EXECUTION
  add check (IS_SCOPE_ IN (1,0));
alter table AOS_ACT_RU_EXECUTION
  add check (IS_EVENT_SCOPE_ IN (1,0));

prompt
prompt Creating table AOS_ACT_RU_EVENT_SUBSCR
prompt ======================================
prompt
create table AOS_ACT_RU_EVENT_SUBSCR
(
  id_            NVARCHAR2(64) not null,
  rev_           INTEGER,
  event_type_    NVARCHAR2(255) not null,
  event_name_    NVARCHAR2(255),
  execution_id_  NVARCHAR2(64),
  proc_inst_id_  NVARCHAR2(64),
  activity_id_   NVARCHAR2(64),
  configuration_ NVARCHAR2(255),
  created_       TIMESTAMP(6) not null,
  proc_def_id_   NVARCHAR2(64),
  tenant_id_     NVARCHAR2(255) default ''
)
;
create index AOS_ACT_IDX_EVENT_SUBSCR on AOS_ACT_RU_EVENT_SUBSCR (EXECUTION_ID_);
create index AOS_ACT_IDX_EVENT_SUB_CFG on AOS_ACT_RU_EVENT_SUBSCR (CONFIGURATION_);
alter table AOS_ACT_RU_EVENT_SUBSCR
  add primary key (ID_);
alter table AOS_ACT_RU_EVENT_SUBSCR
  add constraint AOS_ACT_FK_EVENT_EXEC foreign key (EXECUTION_ID_)
  references AOS_ACT_RU_EXECUTION (ID_);

prompt
prompt Creating table AOS_ACT_RU_TASK
prompt ==============================
prompt
create table AOS_ACT_RU_TASK
(
  id_               NVARCHAR2(64) not null,
  rev_              INTEGER,
  execution_id_     NVARCHAR2(64),
  proc_inst_id_     NVARCHAR2(64),
  proc_def_id_      NVARCHAR2(64),
  name_             NVARCHAR2(255),
  parent_task_id_   NVARCHAR2(64),
  description_      NVARCHAR2(2000),
  task_def_key_     NVARCHAR2(255),
  owner_            NVARCHAR2(255),
  assignee_         NVARCHAR2(255),
  delegation_       NVARCHAR2(64),
  priority_         INTEGER,
  create_time_      TIMESTAMP(6),
  due_date_         TIMESTAMP(6),
  category_         NVARCHAR2(255),
  suspension_state_ INTEGER,
  tenant_id_        NVARCHAR2(255) default '',
  form_key_         NVARCHAR2(255)
)
;
create index AOS_ACT_IDX_TASK_CREATE on AOS_ACT_RU_TASK (CREATE_TIME_);
create index AOS_ACT_IDX_TASK_EXEC on AOS_ACT_RU_TASK (EXECUTION_ID_);
create index AOS_ACT_IDX_TASK_PROCDEF on AOS_ACT_RU_TASK (PROC_DEF_ID_);
create index AOS_ACT_IDX_TASK_PROCINST on AOS_ACT_RU_TASK (PROC_INST_ID_);
alter table AOS_ACT_RU_TASK
  add primary key (ID_);
alter table AOS_ACT_RU_TASK
  add constraint AOS_ACT_FK_TASK_EXE foreign key (EXECUTION_ID_)
  references AOS_ACT_RU_EXECUTION (ID_);
alter table AOS_ACT_RU_TASK
  add constraint AOS_ACT_FK_TASK_PROCDEF foreign key (PROC_DEF_ID_)
  references AOS_ACT_RE_PROCDEF (ID_);
alter table AOS_ACT_RU_TASK
  add constraint AOS_ACT_FK_TASK_PROCINST foreign key (PROC_INST_ID_)
  references AOS_ACT_RU_EXECUTION (ID_);

prompt
prompt Creating table AOS_ACT_RU_IDENTITYLINK
prompt ======================================
prompt
create table AOS_ACT_RU_IDENTITYLINK
(
  id_           NVARCHAR2(64) not null,
  rev_          INTEGER,
  group_id_     NVARCHAR2(255),
  type_         NVARCHAR2(255),
  user_id_      NVARCHAR2(255),
  task_id_      NVARCHAR2(64),
  proc_inst_id_ NVARCHAR2(64),
  proc_def_id_  NVARCHAR2(64)
)
;
create index AOS_ACT_IDX_ATHRZ_PROCEDEF on AOS_ACT_RU_IDENTITYLINK (PROC_DEF_ID_);
create index AOS_ACT_IDX_IDENT_LNK_GROUP on AOS_ACT_RU_IDENTITYLINK (GROUP_ID_);
create index AOS_ACT_IDX_IDENT_LNK_USER on AOS_ACT_RU_IDENTITYLINK (USER_ID_);
create index AOS_ACT_IDX_IDL_PROCINST on AOS_ACT_RU_IDENTITYLINK (PROC_INST_ID_);
create index AOS_ACT_IDX_TSKASS_TASK on AOS_ACT_RU_IDENTITYLINK (TASK_ID_);
alter table AOS_ACT_RU_IDENTITYLINK
  add primary key (ID_);
alter table AOS_ACT_RU_IDENTITYLINK
  add constraint AOS_ACT_FK_ATHRZ_PROCEDEF foreign key (PROC_DEF_ID_)
  references AOS_ACT_RE_PROCDEF (ID_);
alter table AOS_ACT_RU_IDENTITYLINK
  add constraint AOS_ACT_FK_IDL_PROCINST foreign key (PROC_INST_ID_)
  references AOS_ACT_RU_EXECUTION (ID_);
alter table AOS_ACT_RU_IDENTITYLINK
  add constraint AOS_ACT_FK_TSKASS_TASK foreign key (TASK_ID_)
  references AOS_ACT_RU_TASK (ID_);

prompt
prompt Creating table AOS_ACT_RU_JOB
prompt =============================
prompt
create table AOS_ACT_RU_JOB
(
  id_                  NVARCHAR2(64) not null,
  rev_                 INTEGER,
  type_                NVARCHAR2(255) not null,
  lock_exp_time_       TIMESTAMP(6),
  lock_owner_          NVARCHAR2(255),
  exclusive_           NUMBER(1),
  execution_id_        NVARCHAR2(64),
  process_instance_id_ NVARCHAR2(64),
  proc_def_id_         NVARCHAR2(64),
  retries_             INTEGER,
  exception_stack_id_  NVARCHAR2(64),
  exception_msg_       NVARCHAR2(2000),
  duedate_             TIMESTAMP(6),
  repeat_              NVARCHAR2(255),
  handler_type_        NVARCHAR2(255),
  handler_cfg_         NVARCHAR2(2000),
  tenant_id_           NVARCHAR2(255) default ''
)
;
create index AOS_ACT_IDX_JOB_EXCEPTION on AOS_ACT_RU_JOB (EXCEPTION_STACK_ID_);
alter table AOS_ACT_RU_JOB
  add primary key (ID_);
alter table AOS_ACT_RU_JOB
  add constraint AOS_ACT_FK_JOB_EXCEPTION foreign key (EXCEPTION_STACK_ID_)
  references AOS_ACT_GE_BYTEARRAY (ID_);
alter table AOS_ACT_RU_JOB
  add check (EXCLUSIVE_ IN (1,0));

prompt
prompt Creating table AOS_ACT_RU_VARIABLE
prompt ==================================
prompt
create table AOS_ACT_RU_VARIABLE
(
  id_           NVARCHAR2(64) not null,
  rev_          INTEGER,
  type_         NVARCHAR2(255) not null,
  name_         NVARCHAR2(255) not null,
  execution_id_ NVARCHAR2(64),
  proc_inst_id_ NVARCHAR2(64),
  task_id_      NVARCHAR2(64),
  bytearray_id_ NVARCHAR2(64),
  double_       NUMBER(*,10),
  long_         NUMBER(19),
  text_         NVARCHAR2(2000),
  text2_        NVARCHAR2(2000)
)
;
create index AOS_ACT_IDX_VARIABLE_TASK_ID on AOS_ACT_RU_VARIABLE (TASK_ID_);
create index AOS_ACT_IDX_VAR_BYTEARRAY on AOS_ACT_RU_VARIABLE (BYTEARRAY_ID_);
create index AOS_ACT_IDX_VAR_EXE on AOS_ACT_RU_VARIABLE (EXECUTION_ID_);
create index AOS_ACT_IDX_VAR_PROCINST on AOS_ACT_RU_VARIABLE (PROC_INST_ID_);
alter table AOS_ACT_RU_VARIABLE
  add primary key (ID_);
alter table AOS_ACT_RU_VARIABLE
  add constraint AOS_ACT_FK_VAR_BYTEARRAY foreign key (BYTEARRAY_ID_)
  references AOS_ACT_GE_BYTEARRAY (ID_);
alter table AOS_ACT_RU_VARIABLE
  add constraint AOS_ACT_FK_VAR_EXE foreign key (EXECUTION_ID_)
  references AOS_ACT_RU_EXECUTION (ID_);
alter table AOS_ACT_RU_VARIABLE
  add constraint AOS_ACT_FK_VAR_PROCINST foreign key (PROC_INST_ID_)
  references AOS_ACT_RU_EXECUTION (ID_);

prompt
prompt Creating table AOS_SYS_BYTEARRAY
prompt ================================
prompt
create table AOS_SYS_BYTEARRAY
(
  id_                 VARCHAR2(64) not null,
  key_                VARCHAR2(255) not null,
  name_               VARCHAR2(255) not null,
  catalog_id_         VARCHAR2(64) not null,
  catalog_cascade_id_ VARCHAR2(64) not null,
  content_type_       VARCHAR2(255) not null,
  size_               NUMBER(20) not null,
  bytes_              BLOB not null,
  create_time_        VARCHAR2(255) not null,
  creater_id_         VARCHAR2(64) not null,
  title_              VARCHAR2(255),
  remark_             VARCHAR2(4000)
)
;
comment on table AOS_SYS_BYTEARRAY
  is '流文件表';
comment on column AOS_SYS_BYTEARRAY.id_
  is '流水号';
comment on column AOS_SYS_BYTEARRAY.key_
  is '标识键';
comment on column AOS_SYS_BYTEARRAY.name_
  is '名称';
comment on column AOS_SYS_BYTEARRAY.catalog_id_
  is '分类ID';
comment on column AOS_SYS_BYTEARRAY.catalog_cascade_id_
  is '分类级联ID';
comment on column AOS_SYS_BYTEARRAY.content_type_
  is '内容类型';
comment on column AOS_SYS_BYTEARRAY.size_
  is '大小';
comment on column AOS_SYS_BYTEARRAY.bytes_
  is '流文件';
comment on column AOS_SYS_BYTEARRAY.create_time_
  is '创建时间';
comment on column AOS_SYS_BYTEARRAY.creater_id_
  is '操作人ID';
comment on column AOS_SYS_BYTEARRAY.title_
  is '标题';
comment on column AOS_SYS_BYTEARRAY.remark_
  is '备注';
create unique index AOS_SYS_BYTEARRAY_UKEY on AOS_SYS_BYTEARRAY (KEY_);
alter table AOS_SYS_BYTEARRAY
  add constraint AOS_SYS_BYTEARRAY_PKEY primary key (ID_);

prompt
prompt Creating table AOS_SYS_CATALOG
prompt ==============================
prompt
create table AOS_SYS_CATALOG
(
  id_             VARCHAR2(64) not null,
  cascade_id_     VARCHAR2(255) not null,
  root_key_       VARCHAR2(255) not null,
  root_name_      VARCHAR2(255) not null,
  name_           VARCHAR2(255) not null,
  hotkey_         VARCHAR2(255),
  parent_id_      VARCHAR2(64) not null,
  is_leaf_        VARCHAR2(255) default 1 not null,
  is_auto_expand_ VARCHAR2(255) default 0 not null,
  icon_name_      VARCHAR2(255),
  sort_no_        NUMBER(10)
)
;
comment on table AOS_SYS_CATALOG
  is '分类表';
comment on column AOS_SYS_CATALOG.id_
  is '流水号';
comment on column AOS_SYS_CATALOG.cascade_id_
  is '节点语义ID';
comment on column AOS_SYS_CATALOG.root_key_
  is '科目标识键';
comment on column AOS_SYS_CATALOG.root_name_
  is '科目名称';
comment on column AOS_SYS_CATALOG.name_
  is '分类名称';
comment on column AOS_SYS_CATALOG.hotkey_
  is '热键';
comment on column AOS_SYS_CATALOG.parent_id_
  is '父节点流水号';
comment on column AOS_SYS_CATALOG.is_leaf_
  is '是否叶子节点';
comment on column AOS_SYS_CATALOG.is_auto_expand_
  is '是否自动展开';
comment on column AOS_SYS_CATALOG.icon_name_
  is '图标文件名称';
comment on column AOS_SYS_CATALOG.sort_no_
  is '排序号';
create unique index AOS_SYS_CATALOG_UKEY on AOS_SYS_CATALOG (CASCADE_ID_);
alter table AOS_SYS_CATALOG
  add constraint AOS_SYS_CATALOG_PKEY primary key (ID_);

prompt
prompt Creating table AOS_SYS_DIC
prompt ==========================
prompt
create table AOS_SYS_DIC
(
  id_           VARCHAR2(64) not null,
  code_         VARCHAR2(255) not null,
  desc_         VARCHAR2(255) not null,
  hotkey_       VARCHAR2(255),
  status_       VARCHAR2(255) default 1 not null,
  dic_index_id_ VARCHAR2(64) not null,
  remark_       VARCHAR2(4000)
)
;
comment on table AOS_SYS_DIC
  is '数据字典明细表';
comment on column AOS_SYS_DIC.id_
  is '流水号';
comment on column AOS_SYS_DIC.code_
  is '字典对照码';
comment on column AOS_SYS_DIC.desc_
  is '字典对照值';
comment on column AOS_SYS_DIC.hotkey_
  is ' 热键';
comment on column AOS_SYS_DIC.status_
  is '当前状态';
comment on column AOS_SYS_DIC.dic_index_id_
  is '所属字典流水号';
comment on column AOS_SYS_DIC.remark_
  is '备注';
alter table AOS_SYS_DIC
  add constraint AOS_SYS_DIC_PKEY primary key (ID_);

prompt
prompt Creating table AOS_SYS_DIC_INDEX
prompt ================================
prompt
create table AOS_SYS_DIC_INDEX
(
  id_                 VARCHAR2(64) not null,
  key_                VARCHAR2(255) not null,
  name_               VARCHAR2(255) not null,
  hotkey_             VARCHAR2(255),
  catalog_id_         VARCHAR2(64) not null,
  catalog_cascade_id_ VARCHAR2(255) not null,
  remark_             VARCHAR2(4000)
)
;
comment on table AOS_SYS_DIC_INDEX
  is '数据字典索引表';
comment on column AOS_SYS_DIC_INDEX.id_
  is '流水号';
comment on column AOS_SYS_DIC_INDEX.key_
  is '字典标识';
comment on column AOS_SYS_DIC_INDEX.name_
  is '字典名称';
comment on column AOS_SYS_DIC_INDEX.hotkey_
  is '热键';
comment on column AOS_SYS_DIC_INDEX.catalog_id_
  is '所属分类流水号';
comment on column AOS_SYS_DIC_INDEX.catalog_cascade_id_
  is '所属分类流节点语义ID';
comment on column AOS_SYS_DIC_INDEX.remark_
  is '备注';
create unique index AOS_SYS_DIC_INDEX_UKEY on AOS_SYS_DIC_INDEX (KEY_);
alter table AOS_SYS_DIC_INDEX
  add constraint AOS_SYS_DIC_INDEX_PKEY primary key (ID_);

prompt
prompt Creating table AOS_SYS_ICON
prompt ===========================
prompt
create table AOS_SYS_ICON
(
  id_   VARCHAR2(64) not null,
  name_ VARCHAR2(255) not null,
  type_ VARCHAR2(255) not null
)
;
comment on table AOS_SYS_ICON
  is '图标大全';
comment on column AOS_SYS_ICON.id_
  is '流水号';
comment on column AOS_SYS_ICON.name_
  is '名称';
comment on column AOS_SYS_ICON.type_
  is '类型';
create index AOS_SYS_ICON_UKEY on AOS_SYS_ICON (NAME_, TYPE_);
alter table AOS_SYS_ICON
  add constraint AOS_SYS_ICON_PKEY primary key (ID_);

prompt
prompt Creating table AOS_SYS_MODULE
prompt =============================
prompt
create table AOS_SYS_MODULE
(
  id_             VARCHAR2(64) not null,
  cascade_id_     VARCHAR2(255) not null,
  name_           VARCHAR2(255) not null,
  url_            VARCHAR2(255),
  hotkey_         VARCHAR2(255),
  parent_id_      VARCHAR2(64) not null,
  is_leaf_        VARCHAR2(255) default 1 not null,
  is_auto_expand_ VARCHAR2(255) default 0 not null,
  icon_name_      VARCHAR2(255),
  status_         VARCHAR2(255) default 1 not null,
  parent_name_    VARCHAR2(255) not null,
  vector_         VARCHAR2(255),
  sort_no_        NUMBER(10) default 0
)
;
comment on table AOS_SYS_MODULE
  is '功能模块表';
comment on column AOS_SYS_MODULE.id_
  is '功能模块流水号';
comment on column AOS_SYS_MODULE.cascade_id_
  is '节点语义ID';
comment on column AOS_SYS_MODULE.name_
  is '功能模块名称';
comment on column AOS_SYS_MODULE.url_
  is '主页面URL';
comment on column AOS_SYS_MODULE.hotkey_
  is '热键';
comment on column AOS_SYS_MODULE.parent_id_
  is '父节点流水号';
comment on column AOS_SYS_MODULE.is_leaf_
  is '是否叶子节点';
comment on column AOS_SYS_MODULE.is_auto_expand_
  is '是否自动展开';
comment on column AOS_SYS_MODULE.icon_name_
  is '节点图标文件名称';
comment on column AOS_SYS_MODULE.status_
  is '当前状态';
comment on column AOS_SYS_MODULE.parent_name_
  is '父节点名称';
comment on column AOS_SYS_MODULE.vector_
  is '矢量图标';
comment on column AOS_SYS_MODULE.sort_no_
  is '排序号';
alter table AOS_SYS_MODULE
  add constraint AOS_SYS_MODULE_PKEY primary key (ID_);

prompt
prompt Creating table AOS_SYS_MODULE_POST
prompt ==================================
prompt
create table AOS_SYS_MODULE_POST
(
  id_           VARCHAR2(64) not null,
  post_id_      VARCHAR2(64) not null,
  module_id_    VARCHAR2(64) not null,
  grant_type_   VARCHAR2(255) not null,
  operate_time_ VARCHAR2(255) not null,
  operator_id_  VARCHAR2(64) not null
)
;
comment on table AOS_SYS_MODULE_POST
  is '功能模块-岗位关联表';
comment on column AOS_SYS_MODULE_POST.id_
  is '流水号';
comment on column AOS_SYS_MODULE_POST.post_id_
  is '岗位流水号';
comment on column AOS_SYS_MODULE_POST.module_id_
  is '功能模块流水号';
comment on column AOS_SYS_MODULE_POST.grant_type_
  is '权限类型(岗位仅提供经办权限)';
comment on column AOS_SYS_MODULE_POST.operate_time_
  is '授权时间';
comment on column AOS_SYS_MODULE_POST.operator_id_
  is '授权人流水号';
create index AOS_SYS_MODULE_POST_UKEY on AOS_SYS_MODULE_POST (POST_ID_, MODULE_ID_, GRANT_TYPE_);
alter table AOS_SYS_MODULE_POST
  add constraint AOS_SYS_MODULE_POST_PKEY primary key (ID_);

prompt
prompt Creating table AOS_SYS_MODULE_ROLE
prompt ==================================
prompt
create table AOS_SYS_MODULE_ROLE
(
  id_           VARCHAR2(64) not null,
  role_id_      VARCHAR2(64) not null,
  module_id_    VARCHAR2(64) not null,
  grant_type_   VARCHAR2(255) not null,
  operate_time_ VARCHAR2(255) not null,
  operator_id_  VARCHAR2(64) not null
)
;
comment on table AOS_SYS_MODULE_ROLE
  is '功能模块-角色关联表';
comment on column AOS_SYS_MODULE_ROLE.id_
  is '流水号';
comment on column AOS_SYS_MODULE_ROLE.role_id_
  is ' 角色流水号';
comment on column AOS_SYS_MODULE_ROLE.module_id_
  is '功能模块流水号';
comment on column AOS_SYS_MODULE_ROLE.grant_type_
  is '权限类型';
comment on column AOS_SYS_MODULE_ROLE.operate_time_
  is '授权时间';
comment on column AOS_SYS_MODULE_ROLE.operator_id_
  is '授权人流水号';
create index AOS_SYS_MOOLE_ROLE_UKEY on AOS_SYS_MODULE_ROLE (ROLE_ID_, MODULE_ID_, GRANT_TYPE_);
alter table AOS_SYS_MODULE_ROLE
  add constraint AOS_SYS_MOOLE_ROLE_PKEY primary key (ID_);

prompt
prompt Creating table AOS_SYS_MODULE_USER
prompt ==================================
prompt
create table AOS_SYS_MODULE_USER
(
  id_           VARCHAR2(64) not null,
  user_id_      VARCHAR2(64) not null,
  module_id_    VARCHAR2(64) not null,
  grant_type_   VARCHAR2(255) not null,
  operate_time_ VARCHAR2(255) not null,
  operator_id_  VARCHAR2(64) not null
)
;
comment on table AOS_SYS_MODULE_USER
  is '功能模块-用户关联表';
comment on column AOS_SYS_MODULE_USER.id_
  is '流水号';
comment on column AOS_SYS_MODULE_USER.user_id_
  is ' 用户流水号';
comment on column AOS_SYS_MODULE_USER.module_id_
  is '功能模块流水号';
comment on column AOS_SYS_MODULE_USER.grant_type_
  is '权限类型';
comment on column AOS_SYS_MODULE_USER.operate_time_
  is '授权时间';
comment on column AOS_SYS_MODULE_USER.operator_id_
  is '授权人';
create index AOS_SYS_MODULE_USER_UKEY on AOS_SYS_MODULE_USER (USER_ID_, MODULE_ID_, GRANT_TYPE_);
alter table AOS_SYS_MODULE_USER
  add constraint AOS_SYS_MODULE_USER_PKEY primary key (ID_);

prompt
prompt Creating table AOS_SYS_MODULE_USER_NAV
prompt ======================================
prompt
create table AOS_SYS_MODULE_USER_NAV
(
  id_        VARCHAR2(64) not null,
  module_id_ VARCHAR2(64) not null,
  user_id_   VARCHAR2(64) not null,
  nav_icon_  VARCHAR2(255),
  type_      VARCHAR2(255) not null,
  sort_no_   NUMBER(10)
)
;
comment on table AOS_SYS_MODULE_USER_NAV
  is '功能模块-用户关联表(浮动导航|快捷导航)';
comment on column AOS_SYS_MODULE_USER_NAV.id_
  is '流水号';
comment on column AOS_SYS_MODULE_USER_NAV.module_id_
  is '功能模块流水号';
comment on column AOS_SYS_MODULE_USER_NAV.user_id_
  is '人员流水号';
comment on column AOS_SYS_MODULE_USER_NAV.nav_icon_
  is '浮动导航图标文件';
comment on column AOS_SYS_MODULE_USER_NAV.type_
  is '导航类型';
comment on column AOS_SYS_MODULE_USER_NAV.sort_no_
  is '排序号';
create index AOS_SYS_MODULE_USER_NAV_UKEY on AOS_SYS_MODULE_USER_NAV (MODULE_ID_, USER_ID_, TYPE_);
alter table AOS_SYS_MODULE_USER_NAV
  add constraint AOS_SYS_MODULE_USER_NAV_PKEY primary key (ID_);

prompt
prompt Creating table AOS_SYS_ORG
prompt ==========================
prompt
create table AOS_SYS_ORG
(
  id_             VARCHAR2(64) not null,
  cascade_id_     VARCHAR2(255) not null,
  name_           VARCHAR2(255) not null,
  hotkey_         VARCHAR2(255),
  parent_id_      VARCHAR2(64) not null,
  pareant_name_   VARCHAR2(255),
  is_leaf_        VARCHAR2(255) default 1 not null,
  is_auto_expand_ VARCHAR2(255) default 0 not null,
  icon_name_      VARCHAR2(255),
  status_         VARCHAR2(255) default 1 not null,
  type_           VARCHAR2(255) not null,
  biz_code_       VARCHAR2(255),
  custom_code_    VARCHAR2(4000),
  create_time_    VARCHAR2(255) not null,
  creater_id_     VARCHAR2(64),
  sort_no_        NUMBER(10)
)
;
comment on table AOS_SYS_ORG
  is '组织表';
comment on column AOS_SYS_ORG.id_
  is '流水号';
comment on column AOS_SYS_ORG.cascade_id_
  is '节点语义ID';
comment on column AOS_SYS_ORG.name_
  is '组织名称';
comment on column AOS_SYS_ORG.hotkey_
  is '热键';
comment on column AOS_SYS_ORG.parent_id_
  is '父节点流水号';
comment on column AOS_SYS_ORG.pareant_name_
  is '父节点名称';
comment on column AOS_SYS_ORG.is_leaf_
  is '是否叶子节点';
comment on column AOS_SYS_ORG.is_auto_expand_
  is '是否自动展开';
comment on column AOS_SYS_ORG.icon_name_
  is '节点图标文件名称';
comment on column AOS_SYS_ORG.status_
  is '当前状态';
comment on column AOS_SYS_ORG.type_
  is '组织类型';
comment on column AOS_SYS_ORG.biz_code_
  is '业务对照码';
comment on column AOS_SYS_ORG.custom_code_
  is '自定义扩展码';
comment on column AOS_SYS_ORG.create_time_
  is '创建时间';
comment on column AOS_SYS_ORG.creater_id_
  is '创建人ID';
comment on column AOS_SYS_ORG.sort_no_
  is '排序号';
alter table AOS_SYS_ORG
  add constraint AOS_SYS_ORG_PKEY primary key (ID_);

prompt
prompt Creating table AOS_SYS_PAGE
prompt ===========================
prompt
create table AOS_SYS_PAGE
(
  id_         VARCHAR2(64) not null,
  module_id_  VARCHAR2(64) not null,
  name_       VARCHAR2(255),
  url_        VARCHAR2(255),
  type_       VARCHAR2(255) not null,
  enabled_    VARCHAR2(255) not null,
  is_default_ VARCHAR2(255) default 0 not null,
  icon_       VARCHAR2(255),
  icon_big_   VARCHAR2(255),
  vector_     VARCHAR2(255),
  sort_no_    NUMBER(10) default 0
)
;
comment on table AOS_SYS_PAGE
  is '模块页面表';
comment on column AOS_SYS_PAGE.id_
  is '流水号';
comment on column AOS_SYS_PAGE.module_id_
  is '功能模块ID';
comment on column AOS_SYS_PAGE.name_
  is '名称';
comment on column AOS_SYS_PAGE.url_
  is '页面URL';
comment on column AOS_SYS_PAGE.type_
  is '类型';
comment on column AOS_SYS_PAGE.enabled_
  is '使能状态';
comment on column AOS_SYS_PAGE.is_default_
  is '是否缺省子页面';
comment on column AOS_SYS_PAGE.icon_
  is '小图标';
comment on column AOS_SYS_PAGE.icon_big_
  is '大图标';
comment on column AOS_SYS_PAGE.vector_
  is '矢量图标';
comment on column AOS_SYS_PAGE.sort_no_
  is '排序号';
alter table AOS_SYS_PAGE
  add constraint AOS_SYS_PAGE_PKEY primary key (ID_);

prompt
prompt Creating table AOS_SYS_PAGE_EL
prompt ==============================
prompt
create table AOS_SYS_PAGE_EL
(
  id_        VARCHAR2(64) not null,
  dom_id_    VARCHAR2(255) not null,
  name_      VARCHAR2(255) not null,
  type_      VARCHAR2(255) not null,
  module_id_ VARCHAR2(64) not null,
  page_id_   VARCHAR2(64) not null,
  remark_    VARCHAR2(4000)
)
;
comment on table AOS_SYS_PAGE_EL
  is '页面元素表';
comment on column AOS_SYS_PAGE_EL.id_
  is '流水号';
comment on column AOS_SYS_PAGE_EL.dom_id_
  is 'DOM ID';
comment on column AOS_SYS_PAGE_EL.name_
  is '名称';
comment on column AOS_SYS_PAGE_EL.type_
  is '类型';
comment on column AOS_SYS_PAGE_EL.module_id_
  is '所属功能模块流水号';
comment on column AOS_SYS_PAGE_EL.page_id_
  is '页面ID';
comment on column AOS_SYS_PAGE_EL.remark_
  is '备注';
create index AOS_SYS_PAGE_EL_UKEY on AOS_SYS_PAGE_EL (DOM_ID_, MODULE_ID_, PAGE_ID_);
alter table AOS_SYS_PAGE_EL
  add constraint AOS_SYS_PAGE_EL_PKEY primary key (ID_);

prompt
prompt Creating table AOS_SYS_PAGE_EL_GRANT
prompt ====================================
prompt
create table AOS_SYS_PAGE_EL_GRANT
(
  id_         VARCHAR2(64) not null,
  el_id_      VARCHAR2(64) not null,
  user_id_    VARCHAR2(64),
  role_id_    VARCHAR2(64),
  post_id_    VARCHAR2(64),
  grant_type_ VARCHAR2(255) not null
)
;
comment on table AOS_SYS_PAGE_EL_GRANT
  is '页面元素授权表';
comment on column AOS_SYS_PAGE_EL_GRANT.id_
  is '流水号';
comment on column AOS_SYS_PAGE_EL_GRANT.el_id_
  is '页面元素流水号';
comment on column AOS_SYS_PAGE_EL_GRANT.user_id_
  is '用户流水号';
comment on column AOS_SYS_PAGE_EL_GRANT.role_id_
  is '角色流水号';
comment on column AOS_SYS_PAGE_EL_GRANT.post_id_
  is '岗位流水号';
comment on column AOS_SYS_PAGE_EL_GRANT.grant_type_
  is '权限类型';
alter table AOS_SYS_PAGE_EL_GRANT
  add constraint AOS_SYS_PAGE_EL_GRANT_PKEY primary key (ID_);

prompt
prompt Creating table AOS_SYS_PARAM
prompt ============================
prompt
create table AOS_SYS_PARAM
(
  id_                 VARCHAR2(64) not null,
  key_                VARCHAR2(255) not null,
  value_              VARCHAR2(255),
  catalog_id_         VARCHAR2(64) not null,
  catalog_cascade_id_ VARCHAR2(255) not null,
  name_               VARCHAR2(255) not null,
  is_overwrite_       VARCHAR2(255) not null,
  overwrite_field_    VARCHAR2(255),
  remark_             VARCHAR2(4000)
)
;
comment on table AOS_SYS_PARAM
  is '参数表';
comment on column AOS_SYS_PARAM.id_
  is '流水号';
comment on column AOS_SYS_PARAM.key_
  is '参数键';
comment on column AOS_SYS_PARAM.value_
  is '参数值';
comment on column AOS_SYS_PARAM.catalog_id_
  is '所属分类流水号';
comment on column AOS_SYS_PARAM.catalog_cascade_id_
  is '所属分类节点语义ID';
comment on column AOS_SYS_PARAM.name_
  is '参数名称';
comment on column AOS_SYS_PARAM.is_overwrite_
  is '是否可覆盖';
comment on column AOS_SYS_PARAM.overwrite_field_
  is '覆盖来源字段';
comment on column AOS_SYS_PARAM.remark_
  is '备注';
create unique index AOS_SYS_PARAM_UKEY on AOS_SYS_PARAM (KEY_);
alter table AOS_SYS_PARAM
  add constraint AOS_SYS_PARAM_PKEY primary key (ID_);

prompt
prompt Creating table AOS_SYS_POST
prompt ===========================
prompt
create table AOS_SYS_POST
(
  id_             VARCHAR2(64) not null,
  name_           VARCHAR2(255) not null,
  status_         VARCHAR2(255) default 1 not null,
  type_           VARCHAR2(255) not null,
  org_id_         VARCHAR2(64) not null,
  create_time_    VARCHAR2(255) not null,
  creater_id_     VARCHAR2(64) not null,
  org_cascade_id_ VARCHAR2(255) not null
)
;
comment on table AOS_SYS_POST
  is '岗位表';
comment on column AOS_SYS_POST.id_
  is ' 流水号';
comment on column AOS_SYS_POST.name_
  is '岗位名称';
comment on column AOS_SYS_POST.status_
  is '当前状态';
comment on column AOS_SYS_POST.type_
  is '岗位类型';
comment on column AOS_SYS_POST.org_id_
  is '所属部门流水号';
comment on column AOS_SYS_POST.create_time_
  is '创建时间';
comment on column AOS_SYS_POST.creater_id_
  is '创建人ID';
comment on column AOS_SYS_POST.org_cascade_id_
  is '所属部门节点语义ID';
alter table AOS_SYS_POST
  add constraint AOS_SYS_POST_PKEY primary key (ID_);

prompt
prompt Creating table AOS_SYS_ROLE
prompt ===========================
prompt
create table AOS_SYS_ROLE
(
  id_                     VARCHAR2(64) not null,
  name_                   VARCHAR2(255) not null,
  status_                 VARCHAR2(255) default 1 not null,
  type_                   VARCHAR2(255) not null,
  create_time_            VARCHAR2(255) not null,
  creater_id_             VARCHAR2(64) not null,
  creater_org_id_         VARCHAR2(64) not null,
  creater_org_cascade_id_ VARCHAR2(255) not null
)
;
comment on table AOS_SYS_ROLE
  is '角色表';
comment on column AOS_SYS_ROLE.id_
  is ' 流水号';
comment on column AOS_SYS_ROLE.name_
  is '角色名称';
comment on column AOS_SYS_ROLE.status_
  is '当前状态';
comment on column AOS_SYS_ROLE.type_
  is '角色类型';
comment on column AOS_SYS_ROLE.create_time_
  is '创建时间';
comment on column AOS_SYS_ROLE.creater_id_
  is '创建人ID';
comment on column AOS_SYS_ROLE.creater_org_id_
  is '创建人所属部门流水号';
comment on column AOS_SYS_ROLE.creater_org_cascade_id_
  is '创建人所属部门节点语义ID';
alter table AOS_SYS_ROLE
  add constraint AOS_SYS_ROLE_PKEY primary key (ID_);

prompt
prompt Creating table AOS_SYS_SEQUENCE
prompt ===============================
prompt
create table AOS_SYS_SEQUENCE
(
  id_           VARCHAR2(64) not null,
  name_         VARCHAR2(255) not null,
  type_         VARCHAR2(255),
  prefix_       VARCHAR2(255),
  start_        VARCHAR2(255) default 1,
  step_         VARCHAR2(255) default 1,
  cur_value_    VARCHAR2(255) default 0,
  status_       VARCHAR2(255) default 1 not null,
  connector_    VARCHAR2(255),
  suffix_       VARCHAR2(255),
  db_seq_name_  VARCHAR2(255),
  max_value_    VARCHAR2(255) default 9223372036854775807,
  is_circul_    VARCHAR2(255) default 0,
  min_value_    VARCHAR2(255) default 1,
  is_leftpad_   VARCHAR2(255) default 0,
  format_value_ VARCHAR2(255),
  remark_       VARCHAR2(4000)
)
;
comment on table AOS_SYS_SEQUENCE
  is 'ID配置表';
comment on column AOS_SYS_SEQUENCE.id_
  is '流水号';
comment on column AOS_SYS_SEQUENCE.name_
  is '名称';
comment on column AOS_SYS_SEQUENCE.type_
  is '类型';
comment on column AOS_SYS_SEQUENCE.prefix_
  is '前缀';
comment on column AOS_SYS_SEQUENCE.start_
  is '起始值';
comment on column AOS_SYS_SEQUENCE.step_
  is '递增步长';
comment on column AOS_SYS_SEQUENCE.cur_value_
  is '当前值';
comment on column AOS_SYS_SEQUENCE.status_
  is '当前状态';
comment on column AOS_SYS_SEQUENCE.connector_
  is '连接符';
comment on column AOS_SYS_SEQUENCE.suffix_
  is '后缀';
comment on column AOS_SYS_SEQUENCE.db_seq_name_
  is 'DBSequence名称';
comment on column AOS_SYS_SEQUENCE.max_value_
  is '最大值';
comment on column AOS_SYS_SEQUENCE.is_circul_
  is '是否循环';
comment on column AOS_SYS_SEQUENCE.min_value_
  is '最小值';
comment on column AOS_SYS_SEQUENCE.is_leftpad_
  is '是否左补足';
comment on column AOS_SYS_SEQUENCE.format_value_
  is '当前格式化值';
comment on column AOS_SYS_SEQUENCE.remark_
  is '备注';
create unique index AOS_SYS_SEQUENCE_UKEY on AOS_SYS_SEQUENCE (NAME_);
alter table AOS_SYS_SEQUENCE
  add constraint AOS_SYS_SEQUENCE_PKEY primary key (ID_);

prompt
prompt Creating table AOS_SYS_USER
prompt ===========================
prompt
create table AOS_SYS_USER
(
  id_             VARCHAR2(64) not null,
  account_        VARCHAR2(255) not null,
  password_       VARCHAR2(255) not null,
  name_           VARCHAR2(255) not null,
  sex_            VARCHAR2(255) default 0 not null,
  org_id_         VARCHAR2(64) not null,
  status_         VARCHAR2(255) not null,
  type_           VARCHAR2(255) not null,
  biz_code_       VARCHAR2(255),
  create_time_    VARCHAR2(255) not null,
  creater_id_     VARCHAR2(64) not null,
  org_cascade_id_ VARCHAR2(255) not null
)
;
comment on table AOS_SYS_USER
  is '用户基本信息表';
comment on column AOS_SYS_USER.id_
  is '流水号';
comment on column AOS_SYS_USER.account_
  is '用户登录帐号';
comment on column AOS_SYS_USER.password_
  is '密码';
comment on column AOS_SYS_USER.name_
  is '用户姓名';
comment on column AOS_SYS_USER.sex_
  is '性别';
comment on column AOS_SYS_USER.org_id_
  is '所属主部门流水号';
comment on column AOS_SYS_USER.status_
  is '用户状态';
comment on column AOS_SYS_USER.type_
  is '用户类型';
comment on column AOS_SYS_USER.biz_code_
  is '业务对照码';
comment on column AOS_SYS_USER.create_time_
  is ' 经办时间';
comment on column AOS_SYS_USER.creater_id_
  is '经办人流水号';
comment on column AOS_SYS_USER.org_cascade_id_
  is '所属部门节点语义ID';
create unique index AOS_SYS_USER_UKEY on AOS_SYS_USER (ACCOUNT_);
alter table AOS_SYS_USER
  add constraint AOS_SYS_USER_PKEY primary key (ID_);

prompt
prompt Creating table AOS_SYS_USER_CFG
prompt ===============================
prompt
create table AOS_SYS_USER_CFG
(
  id_               VARCHAR2(64) not null,
  theme_            VARCHAR2(255),
  skin_             VARCHAR2(255),
  layout_           VARCHAR2(255),
  nav_mode_         VARCHAR2(255),
  is_show_top_nav_  VARCHAR2(255),
  navbar_btn_style_ VARCHAR2(255),
  tab_focus_color_  VARCHAR2(255),
  is_show_mac_nav_  VARCHAR2(255),
  nav_tab_index_    VARCHAR2(255),
  nav_quick_layout_ VARCHAR2(255)
)
;
comment on table AOS_SYS_USER_CFG
  is '用户配置表';
comment on column AOS_SYS_USER_CFG.id_
  is '用户ID';
comment on column AOS_SYS_USER_CFG.theme_
  is '用户界面主题';
comment on column AOS_SYS_USER_CFG.skin_
  is '用户界面皮肤';
comment on column AOS_SYS_USER_CFG.layout_
  is '系统业务经办区域布局风格';
comment on column AOS_SYS_USER_CFG.nav_mode_
  is '导航模式';
comment on column AOS_SYS_USER_CFG.is_show_top_nav_
  is '是否显示水平导航条';
comment on column AOS_SYS_USER_CFG.navbar_btn_style_
  is '导航条按钮风格';
comment on column AOS_SYS_USER_CFG.tab_focus_color_
  is 'Tab高亮颜色';
comment on column AOS_SYS_USER_CFG.is_show_mac_nav_
  is '欢迎页Mac导航显示开关';
comment on column AOS_SYS_USER_CFG.nav_tab_index_
  is '导航缺省活动页';
comment on column AOS_SYS_USER_CFG.nav_quick_layout_
  is '快捷菜单布局风格';
alter table AOS_SYS_USER_CFG
  add constraint AOS_SYS_USER_CFG_PKEY primary key (ID_);

prompt
prompt Creating table AOS_SYS_USER_EXT
prompt ===============================
prompt
create table AOS_SYS_USER_EXT
(
  id_            VARCHAR2(64) not null,
  email_         VARCHAR2(255),
  fixed_phone_   VARCHAR2(255),
  mobile_phone_  VARCHAR2(255),
  address_       VARCHAR2(255),
  zip_           VARCHAR2(255),
  birthday_      VARCHAR2(255),
  idno_          VARCHAR2(255),
  qq_            VARCHAR2(255),
  dynamic_field_ VARCHAR2(4000),
  bytearray_id_  VARCHAR2(64),
  remark_        VARCHAR2(4000),
  filed1_        VARCHAR2(255),
  filed2_        VARCHAR2(255),
  filed3_        VARCHAR2(255)
)
;
comment on table AOS_SYS_USER_EXT
  is '用户扩展信息表';
comment on column AOS_SYS_USER_EXT.id_
  is '用户ID';
comment on column AOS_SYS_USER_EXT.email_
  is '电子邮件';
comment on column AOS_SYS_USER_EXT.fixed_phone_
  is '固定电话';
comment on column AOS_SYS_USER_EXT.mobile_phone_
  is '移动电话';
comment on column AOS_SYS_USER_EXT.address_
  is '联系地址';
comment on column AOS_SYS_USER_EXT.zip_
  is '邮编';
comment on column AOS_SYS_USER_EXT.birthday_
  is '生日';
comment on column AOS_SYS_USER_EXT.idno_
  is '身份证号';
comment on column AOS_SYS_USER_EXT.qq_
  is 'QQ';
comment on column AOS_SYS_USER_EXT.dynamic_field_
  is '动态扩展字段';
comment on column AOS_SYS_USER_EXT.bytearray_id_
  is '用户头像流文件ID';
comment on column AOS_SYS_USER_EXT.remark_
  is '备注';
comment on column AOS_SYS_USER_EXT.filed1_
  is '静态扩展字段1';
comment on column AOS_SYS_USER_EXT.filed2_
  is '静态扩展字段2';
comment on column AOS_SYS_USER_EXT.filed3_
  is '静态扩展字段3';
alter table AOS_SYS_USER_EXT
  add constraint AOS_SYS_USER_EXT_PKEY primary key (ID_);

prompt
prompt Creating table AOS_SYS_USER_POST
prompt ================================
prompt
create table AOS_SYS_USER_POST
(
  id_           VARCHAR2(64) not null,
  user_id_      VARCHAR2(64) not null,
  post_id_      VARCHAR2(64) not null,
  operate_time_ VARCHAR2(255) not null,
  operator_id_  VARCHAR2(64) not null
)
;
comment on table AOS_SYS_USER_POST
  is '用户-岗位关联表';
comment on column AOS_SYS_USER_POST.id_
  is '流水号';
comment on column AOS_SYS_USER_POST.user_id_
  is '用户流水号';
comment on column AOS_SYS_USER_POST.post_id_
  is '岗位流水号';
comment on column AOS_SYS_USER_POST.operate_time_
  is '授权时间';
comment on column AOS_SYS_USER_POST.operator_id_
  is '授权人流水号';
create index AOS_SYS_USER_POST_UKEY on AOS_SYS_USER_POST (USER_ID_, POST_ID_);
alter table AOS_SYS_USER_POST
  add constraint AOS_SYS_USER_POST_PKEY primary key (ID_);

prompt
prompt Creating table AOS_SYS_USER_ROLE
prompt ================================
prompt
create table AOS_SYS_USER_ROLE
(
  id_           VARCHAR2(64) not null,
  user_id_      VARCHAR2(64) not null,
  role_id_      VARCHAR2(64) not null,
  operate_time_ VARCHAR2(255) not null,
  operator_id_  VARCHAR2(64) not null
)
;
comment on table AOS_SYS_USER_ROLE
  is '用户-角色关联表';
comment on column AOS_SYS_USER_ROLE.id_
  is '流水号';
comment on column AOS_SYS_USER_ROLE.user_id_
  is '用户流水号';
comment on column AOS_SYS_USER_ROLE.role_id_
  is '角色流水号';
comment on column AOS_SYS_USER_ROLE.operate_time_
  is '授权时间';
comment on column AOS_SYS_USER_ROLE.operator_id_
  is '授权人流水号';
create index AOS_SYS_USER_ROLE_UKEY on AOS_SYS_USER_ROLE (USER_ID_, ROLE_ID_);
alter table AOS_SYS_USER_ROLE
  add constraint AOS_SYS_USER_ROLE_PKEY primary key (ID_);

prompt
prompt Creating table AOS_SYS_WF_MODEL
prompt ===============================
prompt
create table AOS_SYS_WF_MODEL
(
  id_             VARCHAR2(64) not null,
  model_id_       VARCHAR2(64) not null,
  create_type_    VARCHAR2(255) not null,
  name_           VARCHAR2(255) not null,
  create_user_id_ VARCHAR2(64) not null,
  create_user_    VARCHAR2(255) not null,
  create_time_    VARCHAR2(255) not null,
  remark_         VARCHAR2(4000)
)
;
comment on table AOS_SYS_WF_MODEL
  is '流程模型扩展表';
comment on column AOS_SYS_WF_MODEL.id_
  is '流水号';
comment on column AOS_SYS_WF_MODEL.model_id_
  is '模型id';
comment on column AOS_SYS_WF_MODEL.create_type_
  is '模型创建方式';
comment on column AOS_SYS_WF_MODEL.name_
  is '流程名称';
comment on column AOS_SYS_WF_MODEL.create_user_id_
  is '创建人流水号';
comment on column AOS_SYS_WF_MODEL.create_user_
  is '创建人';
comment on column AOS_SYS_WF_MODEL.create_time_
  is '创建时间';
comment on column AOS_SYS_WF_MODEL.remark_
  is '备注';
create unique index AOS_SYS_WF_MODEL_UKEY on AOS_SYS_WF_MODEL (MODEL_ID_);
alter table AOS_SYS_WF_MODEL
  add constraint AOS_SYS_WF_MODEL_PKEY primary key (ID_);

prompt
prompt Creating table AOS_SYS_WF_PROCDEF
prompt =================================
prompt
create table AOS_SYS_WF_PROCDEF
(
  id_             VARCHAR2(64) not null,
  model_id_       VARCHAR2(64) not null,
  proc_def_id_    VARCHAR2(64) not null,
  deploy_user_id_ VARCHAR2(64) not null,
  deploy_user_    VARCHAR2(255) not null,
  deploy_time_    VARCHAR2(255) not null
)
;
comment on table AOS_SYS_WF_PROCDEF
  is '流程定义扩展表';
comment on column AOS_SYS_WF_PROCDEF.id_
  is '流水号';
comment on column AOS_SYS_WF_PROCDEF.model_id_
  is '模型id';
comment on column AOS_SYS_WF_PROCDEF.proc_def_id_
  is '流程定义id';
comment on column AOS_SYS_WF_PROCDEF.deploy_user_id_
  is ' 部署人流水号';
comment on column AOS_SYS_WF_PROCDEF.deploy_user_
  is '部署人';
comment on column AOS_SYS_WF_PROCDEF.deploy_time_
  is '部署时间';
create unique index AOS_SYS_WF_PROCDEF_UKEY on AOS_SYS_WF_PROCDEF (PROC_DEF_ID_);
alter table AOS_SYS_WF_PROCDEF
  add constraint AOS_SYS_WF_PROCDEF_PKEY primary key (ID_);

prompt
prompt Creating sequence ACT_EVT_LOG_SEQ
prompt =================================
prompt
create sequence ACT_EVT_LOG_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;


spool off

prompt PL/SQL Developer import file
prompt Created on 2015年7月13日 by XChun
set feedback off
set define off
prompt Loading AOS_ACT_GE_PROPERTY...
insert into AOS_ACT_GE_PROPERTY (name_, value_, rev_)
values ('schema.version', '5.17.0.2', 1);
insert into AOS_ACT_GE_PROPERTY (name_, value_, rev_)
values ('schema.history', 'create(5.17.0.2)', 1);
insert into AOS_ACT_GE_PROPERTY (name_, value_, rev_)
values ('next.dbid', '2501', 2);
commit;
prompt 3 records loaded
prompt Loading AOS_SYS_CATALOG...
insert into AOS_SYS_CATALOG (id_, cascade_id_, root_key_, root_name_, name_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, sort_no_)
values ('10', '0.001', 'PARAM_TYPE', '参数分类科目', '参数分类', null, '0', '0', '0', 'book.png', 1);
insert into AOS_SYS_CATALOG (id_, cascade_id_, root_key_, root_name_, name_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, sort_no_)
values ('11', '0.001.001', 'PARAM_TYPE', '参数分类科目', '业务参数', null, '10', '1', '0', 'user20.png', 2);
insert into AOS_SYS_CATALOG (id_, cascade_id_, root_key_, root_name_, name_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, sort_no_)
values ('12', '0.001.002', 'PARAM_TYPE', '参数分类科目', '系统参数', null, '10', '0', '1', 'folder22.png', 1);
insert into AOS_SYS_CATALOG (id_, cascade_id_, root_key_, root_name_, name_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, sort_no_)
values ('1689', '0.005', 'WF_PROC_TYPE', '流程分类', '流程分类', null, '0', '0', '0', 'book.png', 50);
insert into AOS_SYS_CATALOG (id_, cascade_id_, root_key_, root_name_, name_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, sort_no_)
values ('1690', '0.005.001', 'WF_PROC_TYPE', '流程分类', '默认分类', null, '1689', '1', '0', null, 10);
insert into AOS_SYS_CATALOG (id_, cascade_id_, root_key_, root_name_, name_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, sort_no_)
values ('38', '0.002', 'DIC_TYPE', '词典分类科目', '数据字典分类', null, '0', '0', '0', 'book.png', 2);
insert into AOS_SYS_CATALOG (id_, cascade_id_, root_key_, root_name_, name_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, sort_no_)
values ('39', '0.002.001', 'DIC_TYPE', '词典分类科目', '系统管理', null, '38', '0', '1', 'folder22.png', 2);
insert into AOS_SYS_CATALOG (id_, cascade_id_, root_key_, root_name_, name_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, sort_no_)
values ('40', '0.002.002', 'DIC_TYPE', '词典分类科目', '全局通用', null, '38', '1', '0', 'folder24.png', 3);
insert into AOS_SYS_CATALOG (id_, cascade_id_, root_key_, root_name_, name_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, sort_no_)
values ('410', '0.001.002.001', 'PARAM_TYPE', '参数分类科目', '验证码', null, '12', '1', '0', 'ok3.png', 2);
insert into AOS_SYS_CATALOG (id_, cascade_id_, root_key_, root_name_, name_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, sort_no_)
values ('413', '0.001.002.002', 'PARAM_TYPE', '参数分类科目', '界面显示', null, '12', '1', '0', 'icon59.png', 1);
insert into AOS_SYS_CATALOG (id_, cascade_id_, root_key_, root_name_, name_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, sort_no_)
values ('414', '0.001.002.003', 'PARAM_TYPE', '参数分类科目', '其它', null, '12', '1', '0', 'icon150.png', 9);
insert into AOS_SYS_CATALOG (id_, cascade_id_, root_key_, root_name_, name_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, sort_no_)
values ('423', '0.001.002.004', 'PARAM_TYPE', '参数分类科目', '导航与菜单', null, '12', '1', '0', 'icon152.png', 3);
insert into AOS_SYS_CATALOG (id_, cascade_id_, root_key_, root_name_, name_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, sort_no_)
values ('47', '0.001.004.001', 'PARAM_TYPE', '参数分类科目', 'XXA业务域', null, '46', '1', '0', null, 1);
insert into AOS_SYS_CATALOG (id_, cascade_id_, root_key_, root_name_, name_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, sort_no_)
values ('48', '0.001.004.002', 'PARAM_TYPE', '参数分类科目', 'XXB业务域', null, '46', '1', '0', null, 2);
insert into AOS_SYS_CATALOG (id_, cascade_id_, root_key_, root_name_, name_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, sort_no_)
values ('505', '0.003', 'WF_MODEL_TYPE', '流程模型分类', '流程模型分类', null, '0', '0', '0', 'book.png', 3);
insert into AOS_SYS_CATALOG (id_, cascade_id_, root_key_, root_name_, name_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, sort_no_)
values ('506', '0.003.001', 'WF_PROCESS_TYPE', '流程分类', '默认分类', null, '505', '1', '0', null, 1);
insert into AOS_SYS_CATALOG (id_, cascade_id_, root_key_, root_name_, name_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, sort_no_)
values ('542', '0.002.001.001', 'DIC_TYPE', '词典分类科目', '工作流', null, '39', '1', '0', 'folder6.png', 1);
insert into AOS_SYS_CATALOG (id_, cascade_id_, root_key_, root_name_, name_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, sort_no_)
values ('611', '0.004', 'BYTE_FILE_TYPE', '流文件分类', '流文件分类', null, '0', '0', '0', 'book.png', 4);
insert into AOS_SYS_CATALOG (id_, cascade_id_, root_key_, root_name_, name_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, sort_no_)
values ('613', '0.004.001', 'BYTE_FILE_TYPE', '流文件分类', '用户头像', null, '611', '1', '0', 'vcard.png', 1);
insert into AOS_SYS_CATALOG (id_, cascade_id_, root_key_, root_name_, name_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, sort_no_)
values ('614', '0.004.002', 'BYTE_FILE_TYPE', '流文件分类', '报表模版', null, '611', '1', '0', 'page_paint.png', 2);
insert into AOS_SYS_CATALOG (id_, cascade_id_, root_key_, root_name_, name_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, sort_no_)
values ('616', '0.004.003', 'BYTE_FILE_TYPE', '流文件分类', '序列化对象', null, '611', '1', '0', 'plugin.png', 3);
insert into AOS_SYS_CATALOG (id_, cascade_id_, root_key_, root_name_, name_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, sort_no_)
values ('80', '0.002.006', 'DIC_TYPE', '词典分类科目', '平台配置', null, '38', '1', '0', 'folder2.png', 1);
commit;
prompt 22 records loaded
prompt Loading AOS_SYS_DIC...
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('123', '2', '表格列', null, '1', '122', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('124', '3', '表单元素(输入框|下拉框|选择框等)', null, '1', '122', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('125', '4', '容器组件(窗口|面板|树|表格|工具栏等)', null, '1', '122', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('1637', '1', '主页面', null, '1', '1636', '点击主导航菜单打开的页面');
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('1638', '2', '子页面', null, '1', '1636', '在主页面上的子导航打开的页面(内嵌式的)');
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('1640', '3', '关联页面', null, '1', '1636', '主页面上跳转出去的页面');
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('1651', '4', '分割符', null, '1', '1636', '子页面生成的二级导航菜单的分割符标识');
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('1671', '1', '平铺', null, '1', '1670', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('1672', '2', '树状', null, '1', '1670', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('1674', '0', '系统导航', null, '1', '1673', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('1675', '1', '快捷菜单', null, '1', '1673', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('1676', '2', '发现', null, '1', '1673', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('1681', '4', '导入离线文本', null, '1', '543', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('1686', '1', '激活', null, '1', '1685', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('1687', '2', '挂起', null, '1', '1685', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('1694', 'PENDING', '代理中', null, '1', '1693', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('1697', '9', '结束', null, '1', '1685', '引擎中并非有次状态，只为表格显示非空而增加。');
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('1699', '1', '待办', null, '1', '1698', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('1700', '2', '办结', null, '1', '1698', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('1705', 'neptune', '#c0c0c0', null, '1', '1704', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('1706', 'blue', '#99bce8', null, '1', '1704', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('1707', 'aos', '#99bce8', null, '1', '1704', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('1708', 'gray', '#BCB0B0', null, '1', '1704', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('1709', '3', '待签收', null, '1', '1698', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('239', '1', '行政部门', null, '1', '238', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('240', '2', '项目组', null, '1', '238', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('241', '4', '其它', null, '1', '238', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('253', '3', '工作组', null, '1', '238', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('290', '1', '正常', null, '1', '289', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('291', '3', '管理员封锁', null, '1', '289', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('292', '2', '停用', null, '1', '289', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('294', '1', '缺省', null, '1', '293', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('307', '0', '未知', null, '1', '306', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('308', '1', '男', null, '1', '306', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('309', '2', '女', null, '1', '306', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('310', '2', '超级用户', null, '1', '293', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('311', '4', '系统封锁', null, '1', '289', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('312', '3', '注册用户', null, '1', '293', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('315', '1', '缺省', null, '1', '314', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('322', '1', '缺省', null, '1', '321', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('335', '1', '经办权限', null, '1', '334', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('336', '2', '管理权限', null, '1', '334', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('353', 'blue', 'blue.png', null, '1', '352', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('354', 'gray', 'gray.png', null, '1', '352', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('355', 'neptune', 'neptune.png', null, '1', '352', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('356', 'aos', 'aos.png', null, '1', '352', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('358', 'blue', '#DFE8F6', null, '1', '357', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('360', 'gray', '#F0F0F0', null, '1', '357', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('361', 'neptune', '#D0DDF2', null, '1', '357', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('362', 'aos', 'red', null, '1', '357', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('367', 'neptune', '#006699', null, '1', '365', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('368', 'blue', '#6699CC', null, '1', '365', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('369', 'gray', '#888888', null, '1', '365', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('370', 'aos', '#006699', null, '1', '365', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('372', 'neptune', '#FAFAFA', null, '1', '371', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('373', 'blue', '#3399FF', null, '1', '371', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('374', 'gray', '#555555', null, '1', '371', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('375', 'aos', '#FAFAFA', null, '1', '371', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('377', 'neptune', 'left-logo.png', null, '1', '376', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('378', 'blue', 'left-logo.png', null, '1', '376', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('379', 'gray', 'left-logo.png', null, '1', '376', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('380', 'aos', 'left-logo.png', null, '1', '376', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('405', '1', '小图标[16X16]', null, '1', '404', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('406', '2', '大图标[64X64]', null, '1', '404', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('407', '3', '矢量图标', null, '1', '404', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('456', '1', '按钮|菜单下拉项', null, '1', '122', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('463', '1', '未授权', null, '1', '462', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('464', '2', '显示', null, '1', '462', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('465', '3', '隐藏', null, '1', '462', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('466', '4', '只读', null, '1', '462', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('467', '5', '编辑', null, '1', '462', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('468', '6', '禁用', null, '1', '462', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('469', '7', '激活', null, '1', '462', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('472', '99', '撤消授权', null, '1', '462', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('544', '1', '在线设计', null, '1', '543', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('545', '2', '在线克隆', null, '1', '543', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('551', '3', '导入离线文件', null, '1', '543', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('553', '1', '运行中', null, '1', '552', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('554', '2', '已结束', null, '1', '552', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('648', 'classic', '经典主题', null, '1', '647', '上Banner-左导航-中经办。');
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('650', 'blue', '天蓝', null, '1', '649', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('651', 'gray', '银灰', null, '1', '649', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('652', 'neptune', '海王星(水蓝)', null, '1', '649', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('653', 'aos', 'AOS', null, '0', '649', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('655', 'tab', 'Tab风格', null, '1', '654', '支持打开多个业务经办界面。');
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('656', 'page', '单页风格', null, '0', '654', '只能打开一个功能页面');
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('658', '1', '同级', null, '1', '657', '水平导航按钮和垂直导航的卡片属于统一层级。');
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('659', '2', '级联', null, '0', '657', '水平导航按钮和垂直导航的卡片有上下级级联导航关系');
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('661', 'true', '显示', null, '1', '660', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('662', 'false', '隐藏', null, '1', '660', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('664', 'tight', '组合按钮', null, '1', '663', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('665', 'standalone', '独立按钮', null, '1', '663', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('667', '1', '显示', null, '1', '666', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('668', '0', '隐藏', null, '1', '666', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('682', '1', '快捷菜单', null, '1', '681', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('683', '2', '浮动菜单', null, '1', '681', '欢迎页显示的Mac风格的浮动菜单');
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('83', '1', '是', null, '1', '82', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('84', '0', '否', null, '1', '82', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('86', '0', '停用', null, '1', '85', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('87', '1', '启用', null, '1', '85', null);
commit;
prompt 100 records committed...
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('89', '1', 'APPID', null, '1', '88', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('90', '2', 'UUID', null, '1', '88', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('91', '3', 'DBSequence', null, '1', '88', null);
commit;
prompt 103 records loaded
prompt Loading AOS_SYS_DIC_INDEX...
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('122', 'page_el_type_', '页面元素类型', null, '39', '0.002.001', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('1636', 'page_type_', '页面类型', null, '39', '0.002.001', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('1670', 'nav_quick_layout_', '快捷菜单布局风格', null, '80', '0.002.006', '快捷菜单布局风格。');
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('1673', 'nav_tab_index_', '导航缺省活动页', null, '80', '0.002.006', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('1685', 'suspension_state_', '实例/任务活动状态', null, '542', '0.002.001.001', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('1693', 'delegation_', '委派状态', null, '542', '0.002.001.001', '流程任务的委派代理状态');
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('1698', 'proctask_status_', '任务状态', null, '542', '0.002.001.001', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('1704', 'cmp_border_color_', '组件边框颜色', null, '80', '0.002.006', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('238', 'org_type_', '组织类型', null, '39', '0.002.001', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('289', 'user_status_', '用户状态', null, '39', '0.002.001', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('293', 'user_type_', '用户类型', null, '39', '0.002.001', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('306', 'sex_', '性别', null, '40', '0.002.002', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('314', 'post_type_', '岗位类型', null, '39', '0.002.001', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('321', 'role_type_', '角色类型', null, '39', '0.002.001', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('334', 'grant_type_', '权限类型', null, '39', '0.002.001', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('352', 'north_back_img_', '主页面north区域背景图片', null, '80', '0.002.006', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('357', 'south_back_color_', '主页面south区域背景颜色', null, '80', '0.002.006', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('365', 'main_text_color_', '边界区域字体主颜色', null, '80', '0.002.006', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('371', 'nav_text_color_', '导航文字颜色', null, '80', '0.002.006', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('376', 'left_logo_', 'Banner左边logo图标', null, '80', '0.002.006', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('404', 'icon_type_', '图标类型', null, '39', '0.002.001', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('462', 'cmp_grant_type_', '界面元素授权类型', null, '39', '0.002.001', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('543', 'create_type_', '流程模型创建方式', null, '542', '0.002.001.001', '业务流程模型创建方式');
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('552', 'procinst_status_', '流程实例状态', null, '542', '0.002.001.001', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('647', 'theme_', '系统主题', null, '80', '0.002.006', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('649', 'skin_', '界面皮肤', null, '80', '0.002.006', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('654', 'layout_', '业务经办区域布局风格', null, '80', '0.002.006', '系统业务经办区域(center)布局风格。可选值：tab|page。缺省值：tab。tab：支持同时打开多个功能模块界面；page：当前只能打开1个功能界面。');
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('657', 'nav_mode_', '导航模式', null, '80', '0.002.006', '顶部导航条和左侧树状导航的关系');
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('660', 'is_show_top_nav_', '是否显示顶部导航条', null, '80', '0.002.006', '是否显示水平导航条。(只有在导航模式为1的情况，此设置才有效,导航模式为2，则水平导航条不会消失)。可选值：true| false。');
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('663', 'navbar_btn_style_', '顶部导航条按钮风格', null, '80', '0.002.006', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('666', 'is_show_mac_nav_', '是否显示Mac浮动导航', null, '80', '0.002.006', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('681', 'module_user_nav_type', '导航菜单类型', null, '39', '0.002.001', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('82', 'bool_', '是否布尔值字典', null, '40', '0.002.002', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('85', 'enabled_', '使能状态', null, '40', '0.002.002', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('88', 'sequence_type_', 'ID类型', null, '39', '0.002.001', null);
commit;
prompt 35 records loaded
prompt Loading AOS_SYS_ICON...
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2906', '13.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2907', '14.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2908', '15.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2909', '17.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2910', '19.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2911', '2.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2912', '21.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2913', '22.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2914', '23.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2915', '24.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2916', '25.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2917', '26.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2918', '28.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2919', '3.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2920', '30.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2921', '32.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2922', '34.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2923', '35.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2924', '36.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2925', '37.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2926', '38.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2927', '39.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2928', '4.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2929', '40.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2930', '41.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2931', '42.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2932', '43.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2933', '44.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2934', '45.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2935', '46.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2936', '47.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2937', '48.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2938', '49.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2939', '5.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2940', '51.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2941', '52.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2942', '53.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2943', '54.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2944', '55.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2945', '56.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2946', '6.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2947', '7.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2948', '8.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2949', '9.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7637', 'add.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7638', 'add2.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7639', 'against.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7640', 'agree.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7641', 'app_columns.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7642', 'app_list.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7643', 'arraw_return.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7644', 'arrow_branch.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7645', 'arrow_divide.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7646', 'arrow_down.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7647', 'arrow_left.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7648', 'arrow_merge.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7649', 'arrow_redo.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7650', 'arrow_right.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7651', 'arrow_switch.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7652', 'arrow_undo.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7653', 'arrow_up.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7654', 'basket.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7655', 'book.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7656', 'book_user.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7657', 'bug.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7658', 'bullet_blue.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7659', 'chart_curve.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7660', 'chart_flipped.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7661', 'chart_line.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7662', 'chart_pie.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7663', 'close.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7664', 'config.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7665', 'config1.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7666', 'config3.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7667', 'connect.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7668', 'copy.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7669', 'cut.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7670', 'cv.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7671', 'c_key.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7672', 'database.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7673', 'database_add.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7674', 'del.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7675', 'del1.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7676', 'del2.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7677', 'del3.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7678', 'del_folder.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7679', 'del_page.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7680', 'detail.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7681', 'disconnect.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7682', 'doc_ok.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7683', 'edit.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7684', 'edit2.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7685', 'email.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7686', 'email2.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7687', 'email3.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7688', 'email_go.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7689', 'email_open.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7690', 'exit.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7691', 'exit2.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('827', 'fa-adjust', '3');
commit;
prompt 100 records committed...
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1096', 'fa-adn', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('817', 'fa-align-center', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('819', 'fa-align-justify', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('816', 'fa-align-left', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('818', 'fa-align-right', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('987', 'fa-ambulance', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1049', 'fa-anchor', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1107', 'fa-android', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1240', 'fa-angellist', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('996', 'fa-angle-double-down', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('993', 'fa-angle-double-left', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('994', 'fa-angle-double-right', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('995', 'fa-angle-double-up', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1000', 'fa-angle-down', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('997', 'fa-angle-left', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('998', 'fa-angle-right', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('999', 'fa-angle-up', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1105', 'fa-apple', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1118', 'fa-archive', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1230', 'fa-area-chart', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('926', 'fa-arrow-circle-down', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('923', 'fa-arrow-circle-left', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('790', 'fa-arrow-circle-o-down', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1126', 'fa-arrow-circle-o-left', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1125', 'fa-arrow-circle-o-right', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('791', 'fa-arrow-circle-o-up', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('924', 'fa-arrow-circle-right', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('925', 'fa-arrow-circle-up', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('858', 'fa-arrow-down', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('855', 'fa-arrow-left', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('856', 'fa-arrow-right', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('857', 'fa-arrow-up', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('832', 'fa-arrows', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('932', 'fa-arrows-alt', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('884', 'fa-arrows-h', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('883', 'fa-arrows-v', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('864', 'fa-asterisk', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1226', 'fa-at', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('835', 'fa-backward', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('854', 'fa-ban', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('885', 'fa-bar-chart', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('804', 'fa-barcode', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('942', 'fa-bars', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('990', 'fa-beer', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1160', 'fa-behance', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1161', 'fa-behance-square', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('917', 'fa-bell', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('981', 'fa-bell-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2904', '10.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2905', '11.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1222', 'fa-bell-slash', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1223', 'fa-bell-slash-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1237', 'fa-bicycle', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1206', 'fa-binoculars', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1229', 'fa-birthday-cake', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1097', 'fa-bitbucket', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1098', 'fa-bitbucket-square', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('812', 'fa-bold', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('970', 'fa-bolt', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1203', 'fa-bomb', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('807', 'fa-book', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('808', 'fa-bookmark', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('907', 'fa-bookmark-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('931', 'fa-briefcase', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1076', 'fa-btc', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1119', 'fa-bug', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1154', 'fa-building', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('985', 'fa-building-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('916', 'fa-bullhorn', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1051', 'fa-bullseye', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1238', 'fa-bus', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1213', 'fa-calculator', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('873', 'fa-calendar', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1039', 'fa-calendar-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('810', 'fa-camera', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('888', 'fa-camera-retro', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1165', 'fa-car', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('955', 'fa-caret-down', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('957', 'fa-caret-left', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('958', 'fa-caret-right', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1066', 'fa-caret-square-o-down', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1127', 'fa-caret-square-o-left', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1068', 'fa-caret-square-o-right', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1067', 'fa-caret-square-o-up', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('956', 'fa-caret-up', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1241', 'fa-cc', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1219', 'fa-cc-amex', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1218', 'fa-cc-discover', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1217', 'fa-cc-mastercard', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1220', 'fa-cc-paypal', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1221', 'fa-cc-stripe', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1216', 'fa-cc-visa', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('918', 'fa-certificate', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1028', 'fa-chain-broken', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('777', 'fa-check', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('848', 'fa-check-circle', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('853', 'fa-check-circle-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1061', 'fa-check-square', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('831', 'fa-check-square-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1046', 'fa-chevron-circle-down', '3');
commit;
prompt 200 records committed...
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1043', 'fa-chevron-circle-left', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1044', 'fa-chevron-circle-right', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1045', 'fa-chevron-circle-up', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('878', 'fa-chevron-down', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('843', 'fa-chevron-left', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('844', 'fa-chevron-right', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('877', 'fa-chevron-up', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1155', 'fa-child', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1009', 'fa-circle', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1005', 'fa-circle-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1185', 'fa-circle-o-notch', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1197', 'fa-circle-thin', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('973', 'fa-clipboard', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('787', 'fa-clock-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('935', 'fa-cloud', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('976', 'fa-cloud-download', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('977', 'fa-cloud-upload', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1022', 'fa-code', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1027', 'fa-code-fork', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1182', 'fa-codepen', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('982', 'fa-coffee', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('783', 'fa-cog', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('890', 'fa-cogs', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('959', 'fa-columns', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('875', 'fa-comment', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('968', 'fa-comment-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('891', 'fa-comments', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('969', 'fa-comments-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1065', 'fa-compass', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('861', 'fa-compress', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1225', 'fa-copyright', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('913', 'fa-credit-card', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1026', 'fa-crop', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('851', 'fa-crosshairs', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1048', 'fa-css3', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1158', 'fa-cube', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1159', 'fa-cubes', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('983', 'fa-cutlery', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1171', 'fa-database', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1146', 'fa-delicious', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1001', 'fa-desktop', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1169', 'fa-deviantart', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1147', 'fa-digg', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1128', 'fa-dot-circle-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('789', 'fa-download', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1109', 'fa-dribbble', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1092', 'fa-dropbox', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1150', 'fa-drupal', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('842', 'fa-eject', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1052', 'fa-ellipsis-h', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1053', 'fa-ellipsis-v', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1187', 'fa-empire', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('963', 'fa-envelope', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('768', 'fa-envelope-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1135', 'fa-envelope-square', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1034', 'fa-eraser', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1069', 'fa-eur', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('975', 'fa-exchange', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1031', 'fa-exclamation', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('865', 'fa-exclamation-circle', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('871', 'fa-exclamation-triangle', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('860', 'fa-expand', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('899', 'fa-external-link', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1063', 'fa-external-link-square', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('869', 'fa-eye', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('870', 'fa-eye-slash', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1227', 'fa-eyedropper', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('910', 'fa-facebook', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('887', 'fa-facebook-square', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('834', 'fa-fast-backward', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('840', 'fa-fast-forward', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1153', 'fa-fax', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1113', 'fa-female', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('989', 'fa-fighter-jet', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1077', 'fa-file', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1177', 'fa-file-archive-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1178', 'fa-file-audio-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1180', 'fa-file-code-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1174', 'fa-file-excel-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1176', 'fa-file-image-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('786', 'fa-file-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1172', 'fa-file-pdf-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1175', 'fa-file-powerpoint-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1078', 'fa-file-text', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('984', 'fa-file-text-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1179', 'fa-file-video-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1173', 'fa-file-word-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('938', 'fa-files-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('773', 'fa-film', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('930', 'fa-filter', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('868', 'fa-fire', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1040', 'fa-fire-extinguisher', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('798', 'fa-flag', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1020', 'fa-flag-checkered', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1019', 'fa-flag-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('936', 'fa-flask', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1095', 'fa-flickr', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('940', 'fa-floppy-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('881', 'fa-folder', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1012', 'fa-folder-o', '3');
commit;
prompt 300 records committed...
insert into AOS_SYS_ICON (id_, name_, type_)
values ('882', 'fa-folder-open', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1013', 'fa-folder-open-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('811', 'fa-font', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('839', 'fa-forward', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1111', 'fa-foursquare', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1015', 'fa-frown-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1204', 'fa-futbol-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1017', 'fa-gamepad', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('966', 'fa-gavel', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1070', 'fa-gbp', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('866', 'fa-gift', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1189', 'fa-git', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1188', 'fa-git-square', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('911', 'fa-github', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1011', 'fa-github-alt', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('902', 'fa-github-square', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1115', 'fa-gittip', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('765', 'fa-glass', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('927', 'fa-globe', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1141', 'fa-google', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('953', 'fa-google-plus', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('952', 'fa-google-plus-square', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1215', 'fa-google-wallet', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1139', 'fa-graduation-cap', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('991', 'fa-h-square', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1190', 'fa-hacker-news', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('922', 'fa-hand-o-down', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('920', 'fa-hand-o-left', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('919', 'fa-hand-o-right', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('921', 'fa-hand-o-up', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('915', 'fa-hdd-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1198', 'fa-header', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('799', 'fa-headphones', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('769', 'fa-heart', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('895', 'fa-heart-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1196', 'fa-history', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('785', 'fa-home', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('986', 'fa-hospital-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1047', 'fa-html5', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1242', 'fa-ils', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('792', 'fa-inbox', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('822', 'fa-indent', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1030', 'fa-info', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('850', 'fa-info-circle', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1072', 'fa-inr', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1094', 'fa-instagram', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1239', 'fa-ioxhost', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('813', 'fa-italic', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1151', 'fa-joomla', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1073', 'fa-jpy', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1183', 'fa-jsfiddle', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('889', 'fa-key', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1018', 'fa-keyboard-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1075', 'fa-krw', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1152', 'fa-language', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1002', 'fa-laptop', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1233', 'fa-lastfm', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1234', 'fa-lastfm-square', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('867', 'fa-leaf', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('904', 'fa-lemon-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1060', 'fa-level-down', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1059', 'fa-level-up', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1184', 'fa-life-ring', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('974', 'fa-lightbulb-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1232', 'fa-line-chart', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('934', 'fa-link', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('964', 'fa-linkedin', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('897', 'fa-linkedin-square', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1108', 'fa-linux', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('820', 'fa-list', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('796', 'fa-list-alt', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('944', 'fa-list-ol', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('943', 'fa-list-ul', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1025', 'fa-location-arrow', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('797', 'fa-lock', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1101', 'fa-long-arrow-down', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1103', 'fa-long-arrow-left', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1104', 'fa-long-arrow-right', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1102', 'fa-long-arrow-up', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('948', 'fa-magic', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('876', 'fa-magnet', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1114', 'fa-male', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('826', 'fa-map-marker', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1042', 'fa-maxcdn', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1243', 'fa-meanpath', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('988', 'fa-medkit', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1016', 'fa-meh-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1036', 'fa-microphone', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1037', 'fa-microphone-slash', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('863', 'fa-minus', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('846', 'fa-minus-circle', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1057', 'fa-minus-square', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1058', 'fa-minus-square-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1004', 'fa-mobile', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('954', 'fa-money', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1117', 'fa-moon-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('766', 'fa-music', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1211', 'fa-newspaper-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1137', 'fa-openid', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('821', 'fa-outdent', '3');
commit;
prompt 400 records committed...
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1123', 'fa-pagelines', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1228', 'fa-paint-brush', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1194', 'fa-paper-plane', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1195', 'fa-paper-plane-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('939', 'fa-paperclip', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1199', 'fa-paragraph', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('837', 'fa-pause', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1156', 'fa-paw', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1214', 'fa-paypal', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('825', 'fa-pencil', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1062', 'fa-pencil-square', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('829', 'fa-pencil-square-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('905', 'fa-phone', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('908', 'fa-phone-square', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('824', 'fa-picture-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1231', 'fa-pie-chart', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1148', 'fa-pied-piper', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1149', 'fa-pied-piper-alt', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('950', 'fa-pinterest', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('951', 'fa-pinterest-square', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('872', 'fa-plane', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('836', 'fa-play', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1055', 'fa-play-circle', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('793', 'fa-play-circle-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1207', 'fa-plug', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('862', 'fa-plus', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('845', 'fa-plus-circle', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('992', 'fa-plus-square', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1132', 'fa-plus-square-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('781', 'fa-power-off', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('809', 'fa-print', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1035', 'fa-puzzle-piece', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1192', 'fa-qq', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('803', 'fa-qrcode', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1029', 'fa-question', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('849', 'fa-question-circle', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1006', 'fa-quote-left', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1007', 'fa-quote-right', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('874', 'fa-random', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1186', 'fa-rebel', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1164', 'fa-recycle', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1142', 'fa-reddit', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1143', 'fa-reddit-square', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('795', 'fa-refresh', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1122', 'fa-renren', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('794', 'fa-repeat', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1010', 'fa-reply', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1023', 'fa-reply-all', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('879', 'fa-retweet', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('788', 'fa-road', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1041', 'fa-rocket', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('914', 'fa-rss', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1054', 'fa-rss-square', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1074', 'fa-rub', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('937', 'fa-scissors', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('767', 'fa-search', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('780', 'fa-search-minus', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('779', 'fa-search-plus', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('859', 'fa-share', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1201', 'fa-share-alt', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1202', 'fa-share-alt-square', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1064', 'fa-share-square', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('830', 'fa-share-square-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1038', 'fa-shield', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('880', 'fa-shopping-cart', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('900', 'fa-sign-in', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('896', 'fa-sign-out', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('782', 'fa-signal', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('971', 'fa-sitemap', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1110', 'fa-skype', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1134', 'fa-slack', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1200', 'fa-sliders', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1208', 'fa-slideshare', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1014', 'fa-smile-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('960', 'fa-sort', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1079', 'fa-sort-alpha-asc', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1080', 'fa-sort-alpha-desc', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1081', 'fa-sort-amount-asc', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1082', 'fa-sort-amount-desc', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('962', 'fa-sort-asc', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('961', 'fa-sort-desc', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1083', 'fa-sort-numeric-asc', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1084', 'fa-sort-numeric-desc', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1170', 'fa-soundcloud', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1133', 'fa-space-shuttle', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1008', 'fa-spinner', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1157', 'fa-spoon', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1168', 'fa-spotify', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('941', 'fa-square', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('906', 'fa-square-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1124', 'fa-stack-exchange', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1093', 'fa-stack-overflow', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('770', 'fa-star', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('894', 'fa-star-half', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1024', 'fa-star-half-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('771', 'fa-star-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1162', 'fa-steam', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1163', 'fa-steam-square', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('833', 'fa-step-backward', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('841', 'fa-step-forward', '3');
commit;
prompt 500 records committed...
insert into AOS_SYS_ICON (id_, name_, type_)
values ('979', 'fa-stethoscope', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('838', 'fa-stop', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('945', 'fa-strikethrough', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1145', 'fa-stumbleupon', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1144', 'fa-stumbleupon-circle', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1033', 'fa-subscript', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('980', 'fa-suitcase', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1116', 'fa-sun-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1032', 'fa-superscript', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('947', 'fa-table', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1003', 'fa-tablet', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('967', 'fa-tachometer', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('805', 'fa-tag', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('806', 'fa-tags', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('929', 'fa-tasks', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1166', 'fa-taxi', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1191', 'fa-tencent-weibo', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1021', 'fa-terminal', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('814', 'fa-text-height', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('815', 'fa-text-width', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('775', 'fa-th', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('774', 'fa-th-large', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('776', 'fa-th-list', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('898', 'fa-thumb-tack', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1086', 'fa-thumbs-down', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('893', 'fa-thumbs-o-down', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('892', 'fa-thumbs-o-up', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1085', 'fa-thumbs-up', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1056', 'fa-ticket', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('778', 'fa-times', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('847', 'fa-times-circle', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('852', 'fa-times-circle-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('828', 'fa-tint', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1235', 'fa-toggle-off', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1236', 'fa-toggle-on', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1224', 'fa-trash', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('784', 'fa-trash-o', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1167', 'fa-tree', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1112', 'fa-trello', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('901', 'fa-trophy', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('949', 'fa-truck', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1131', 'fa-try', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1205', 'fa-tty', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1099', 'fa-tumblr', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1100', 'fa-tumblr-square', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1209', 'fa-twitch', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('909', 'fa-twitter', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('886', 'fa-twitter-square', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('972', 'fa-umbrella', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('946', 'fa-underline', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('965', 'fa-undo', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1138', 'fa-university', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('912', 'fa-unlock', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1050', 'fa-unlock-alt', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('903', 'fa-upload', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1071', 'fa-usd', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('772', 'fa-user', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('978', 'fa-user-md', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('933', 'fa-users', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('823', 'fa-video-camera', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1130', 'fa-vimeo-square', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1181', 'fa-vine', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1120', 'fa-vk', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('801', 'fa-volume-down', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('800', 'fa-volume-off', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('802', 'fa-volume-up', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1121', 'fa-weibo', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1193', 'fa-weixin', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1129', 'fa-wheelchair', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1212', 'fa-wifi', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1106', 'fa-windows', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1136', 'fa-wordpress', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('928', 'fa-wrench', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1089', 'fa-xing', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1090', 'fa-xing-square', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1140', 'fa-yahoo', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1210', 'fa-yelp', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1088', 'fa-youtube', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1091', 'fa-youtube-play', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('1087', 'fa-youtube-square', '3');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7692', 'folder1.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7693', 'folder10.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7694', 'folder11.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7695', 'folder12.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7696', 'folder13.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7697', 'folder14.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7698', 'folder15.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7699', 'folder16.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7700', 'folder17.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7701', 'folder18.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7702', 'folder19.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7703', 'folder2.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7704', 'folder20.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7705', 'folder21.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7706', 'folder22.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7707', 'folder23.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7708', 'folder24.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7709', 'folder25.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7710', 'folder26.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7711', 'folder27.png', '1');
commit;
prompt 600 records committed...
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7712', 'folder28.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7713', 'folder4.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7714', 'folder5.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7715', 'folder6.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7716', 'folder7.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7717', 'folder8.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7718', 'folder9.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7719', 'forward.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7720', 'freelance.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7721', 'go.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7722', 'go.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7723', 'go1.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7724', 'go1.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7725', 'help.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7726', 'home.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7727', 'home.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7728', 'icon134.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7729', 'icon137.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7730', 'icon140.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7731', 'icon141.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7732', 'icon146.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7733', 'icon15.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7734', 'icon150.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7735', 'icon152.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7736', 'icon153.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7737', 'icon154.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7738', 'icon17.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7739', 'icon25.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7740', 'icon26.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7741', 'icon28.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7742', 'icon31.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7743', 'icon32.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7744', 'icon34.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7745', 'icon35.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7746', 'icon36.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7747', 'icon37.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7748', 'icon38.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7749', 'icon39.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7750', 'icon41.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7751', 'icon42.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7752', 'icon5.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7753', 'icon56.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7754', 'icon59.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7755', 'icon63.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7756', 'icon65.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7757', 'icon66.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7758', 'icon67.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7759', 'icon68.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7760', 'icon7.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7761', 'icon70.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7762', 'icon71.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7763', 'icon72.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7764', 'icon75.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7765', 'icon76.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7766', 'icon77.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7767', 'icon78.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7768', 'icon79.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7769', 'icon8.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7770', 'icon80.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7771', 'icon82.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7772', 'icon85.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7773', 'icon86.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7774', 'icon88.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7775', 'icon9.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7776', 'icon96.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7777', 'icon_19.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7778', 'icq.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7779', 'id.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7780', 'jar.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7781', 'key.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7782', 'layout.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7783', 'layout2.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7784', 'lightbulb.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7785', 'lock.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7786', 'lock3.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7787', 'monitor.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7788', 'node.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7789', 'ok.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7790', 'ok1.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7791', 'ok2.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7792', 'ok3.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7793', 'ok4.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7794', 'ok5.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7795', 'org.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7796', 'org2.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7797', 'own.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7798', 'page.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7799', 'page2.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7800', 'page3.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7801', 'page_code.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7802', 'page_font.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7803', 'page_next.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7804', 'page_office.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7805', 'page_paint.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7806', 'page_picture.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7807', 'page_vector.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7808', 'paint2.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7809', 'paste.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7810', 'picture.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7811', 'pictures.png', '1');
commit;
prompt 700 records committed...
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7812', 'picture_empty.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7813', 'plugin.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7814', 'plugin1.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7815', 'plugin2.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7816', 'printer.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7817', 'query.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7818', 'refresh.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7819', 'refresh1.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7820', 'refresh2.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7821', 'refresh3.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7822', 'refresh4.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7823', 'save.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7824', 'save_all.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7825', 'search.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7826', 'security.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7827', 'send_receive.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7828', 'shape_align_bottom.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7829', 'shape_align_center.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7830', 'shape_align_middle.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7831', 'shape_group.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7832', 'shape_handles.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7833', 'shape_move_back.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7834', 'share.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7835', 'sitemap.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7836', 'sql.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7837', 'sql2.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7838', 'sql3.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7839', 'stop.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7840', 'stop2.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7841', 'stop3.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7842', 'system.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7843', 'table.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7844', 'table2.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7845', 'tables.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7846', 'tables_relation.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7847', 'table_edit.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7848', 'tag.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7849', 'task.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7850', 'task1.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7851', 'task_finish.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7852', 'task_list.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7853', 'terminal.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7854', 'textfield.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7855', 'text_cap.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7856', 'text_col.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7857', 'text_list.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7858', 'text_upper.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7859', 'theme.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7860', 'time.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7861', 'timeline.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7862', 'user1.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7863', 'user20.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7864', 'user3.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7865', 'user6.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7866', 'user8.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7867', 'vcard.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7868', 'vector.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7869', 'wand.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7870', 'webcam.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7871', 'zoom_in.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('7872', 'zoom_out.png', '1');
commit;
prompt 761 records loaded
prompt Loading AOS_SYS_MODULE...
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('0', '0', 'AOS应用基础平台', null, null, 'p', '0', '1', 'home.png', '1', 'root', null, 1);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('1680', '0.001.004.002', '流程建模', 'bpm/procModel/init.jhtml', null, '189', '1', '0', 'icon8.png', '1', '工作流', null, 10);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('1688', '0.001.004.003', '流程配置与管理', 'bpm/procDef/init.jhtml', null, '189', '1', '0', 'icon79.png', '1', '工作流', null, 20);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('1691', '0.001.004.006', '流程任务监管', 'bpm/procTask/init.jhtml', null, '189', '1', '0', 'task_list.png', '1', '工作流', null, 40);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('1710', '0.001.004.007', '流程历史数据查询', null, null, '189', '1', '0', 'icon71.png', '1', '工作流', null, 90);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('1711', '0.001.010', '数据集成', null, null, '183', '0', '0', 'folder10.png', '1', '控制台', null, 55);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('1712', '0.001.010.001', '数据管道', null, null, '1711', '1', '0', 'tables_relation.png', '1', '数据集成', null, 10);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('1713', '0.001.011', '复杂事件处理', null, null, '183', '0', '0', 'folder6.png', '1', '控制台', null, 58);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('1714', '0.001.011.001', '事件流定义', null, null, '1713', '1', '0', null, '1', '复杂事件处理', null, 10);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('183', '0.001', '控制台', null, null, '0', '0', '1', 'folder22.png', '1', 'AOS应用基础平台', 'fa-cogs', 10);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('184', '0.002', '工作台', null, null, '0', '0', '1', 'folder23.png', '1', 'AOS应用基础平台', 'fa-github-alt', 20);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('186', '0.001.001', '基础数据', null, null, '183', '0', '1', 'folder2.png', '1', '控制台', null, 10);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('187', '0.001.002', '资源', null, null, '183', '0', '1', 'folder14.png', '1', '控制台', null, 20);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('188', '0.001.003', '组织与权限', null, null, '183', '0', '1', 'folder5.png', '1', '控制台', null, 30);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('189', '0.001.004', '工作流', null, null, '183', '0', '1', 'folder24.png', '1', '控制台', null, 40);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('190', '0.001.005', '服务治理', null, null, '183', '0', '0', 'folder7.png', '1', '控制台', null, 50);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('191', '0.001.006', '监控与审计', null, null, '183', '0', '0', 'folder8.png', '1', '控制台', null, 60);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('192', '0.001.001.001', '参数表', 'system/param/init.jhtml', null, '186', '1', '0', 'icon79.png', '1', '基础数据', null, 1);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('193', '0.001.001.002', '数据字典', 'system/dictionary/init.jhtml', null, '186', '1', '0', 'icon154.png', '1', '基础数据', null, 10);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('194', '0.001.001.003', '分类科目', 'system/catalog/init.jhtml', null, '186', '1', '0', 'icon146.png', '1', '基础数据', null, 20);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('195', '0.001.002.004', '序列号', 'system/idMgr/init.jhtml', null, '187', '1', '0', 'id.png', '1', '资源', null, 30);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('197', '0.001.002.001', '功能模块', 'system/module/init.jhtml', null, '187', '1', '0', 'icon75.png', '1', '资源', null, 10);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('199', '0.001.003.001', '组织架构', 'system/org/init.jhtml', null, '188', '1', '0', 'icon56.png', '1', '组织与权限', null, 1);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('200', '0.001.003.002', '岗位与授权', 'system/post/init.jhtml', null, '188', '1', '0', 'icon137.png', '1', '组织与权限', null, 3);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('201', '0.001.003.003', '用户与授权', 'system/user/init.jhtml', null, '188', '1', '0', 'user6.png', '1', '组织与权限', null, 4);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('203', '0.001.005.001', '服务注册', null, null, '190', '1', '0', null, '1', '服务治理', null, 1);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('204', '0.001.006.001', '数据审计', null, null, '191', '1', '0', null, '1', '监控与审计', null, 1);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('205', '0.001.006.002', '业务经办日志', null, null, '191', '1', '0', null, '1', '监控与审计', null, 3);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('207', '0.002.001', '首选项', 'system/preference/init.jhtml', null, '184', '1', '0', 'config1.png', '1', '工作台', null, 10);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('212', '0.002.006', '我的流程', null, null, '184', '1', '1', 'icon8.png', '1', '工作台', null, 40);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('213', '0.002.007', '我的任务', 'bpm/mytask/init.jhtml', null, '184', '1', '1', 'task_list.png', '1', '工作台', null, 30);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('225', '0.001.008.002', 'WebSQL', 'system/webSql/init.jhtml', null, '555', '1', '0', 'sql.png', '1', '工具箱', null, 11);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('227', '0.001.009.001', 'AOS开发指南', null, null, '576', '1', '0', 'lightbulb.png', '1', '帮助', null, 1);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('228', '0.001.009.002', 'AOS开发者社区', null, null, '576', '1', '0', 'icq.png', '1', '帮助', null, 2);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('236', '0.004', '演示', null, null, '0', '0', '1', 'folder27.png', '1', 'AOS应用基础平台', 'fa-coffee', 40);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('237', '0.004.001', '示例1', null, null, '236', '1', '0', null, '1', '演示', null, 1);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('242', '0.001.006.004', '系统管理日志', null, null, '191', '1', '0', null, '1', '监控与审计', null, 2);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('304', '0.001.003.006', '角色与授权', 'system/role/init.jhtml', null, '188', '1', '0', 'icon134.png', '1', '组织与权限', null, 5);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('393', '0.001.008.001', '图标大全', 'system/icon/init.jhtml', null, '555', '1', '0', 'page_picture.png', '1', '工具箱', null, 90);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('454', '0.001.002.003', '页面组件', 'system/page/init.jhtml', null, '187', '1', '0', 'icon59.png', '1', '资源', null, 20);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('486', '0.001.004.005', '流程实例监管', 'bpm/procInst/init.jhtml', null, '189', '1', '0', 'icon5.png', '1', '工作流', null, 30);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('489', '0.002.005', '我的消息', null, null, '184', '1', '0', 'email2.png', '1', '工作台', null, 20);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('530', '0.001.002.005', '数据源', null, null, '187', '1', '0', 'database_add.png', '1', '资源', null, 50);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('555', '0.001.008', '工具箱', null, null, '183', '0', '0', 'folder9.png', '1', '控制台', 'fa-bug', 70);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('576', '0.001.009', '帮助', null, null, '183', '0', '0', 'folder11.png', '1', '控制台', null, 80);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('615', '0.001.002.006', '流文件', 'system/byteObj/init.jhtml', null, '187', '1', '0', 'page_office.png', '1', '资源', null, 40);
commit;
prompt 46 records loaded
prompt Loading AOS_SYS_MODULE_POST...
prompt Table is empty
prompt Loading AOS_SYS_MODULE_ROLE...
insert into AOS_SYS_MODULE_ROLE (id_, role_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('4277', '541', '0', '1', '2015-07-07 19:58:29', '1');
insert into AOS_SYS_MODULE_ROLE (id_, role_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('4278', '541', '184', '1', '2015-07-07 19:58:29', '1');
insert into AOS_SYS_MODULE_ROLE (id_, role_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('4279', '541', '207', '1', '2015-07-07 19:58:29', '1');
insert into AOS_SYS_MODULE_ROLE (id_, role_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('4280', '541', '489', '1', '2015-07-07 19:58:29', '1');
insert into AOS_SYS_MODULE_ROLE (id_, role_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('4281', '541', '213', '1', '2015-07-07 19:58:29', '1');
commit;
prompt 5 records loaded
prompt Loading AOS_SYS_MODULE_USER...
insert into AOS_SYS_MODULE_USER (id_, user_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('4308', '21', '0', '1', '2015-07-08 21:55:28', '1');
insert into AOS_SYS_MODULE_USER (id_, user_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('4309', '21', '183', '1', '2015-07-08 21:55:28', '1');
insert into AOS_SYS_MODULE_USER (id_, user_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('4310', '21', '186', '1', '2015-07-08 21:55:28', '1');
insert into AOS_SYS_MODULE_USER (id_, user_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('4311', '21', '192', '1', '2015-07-08 21:55:28', '1');
insert into AOS_SYS_MODULE_USER (id_, user_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('4312', '21', '193', '1', '2015-07-08 21:55:28', '1');
insert into AOS_SYS_MODULE_USER (id_, user_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('4313', '21', '194', '1', '2015-07-08 21:55:28', '1');
insert into AOS_SYS_MODULE_USER (id_, user_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('4314', '21', '187', '1', '2015-07-08 21:55:28', '1');
insert into AOS_SYS_MODULE_USER (id_, user_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('4315', '21', '197', '1', '2015-07-08 21:55:28', '1');
insert into AOS_SYS_MODULE_USER (id_, user_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('4316', '21', '454', '1', '2015-07-08 21:55:28', '1');
insert into AOS_SYS_MODULE_USER (id_, user_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('4317', '21', '195', '1', '2015-07-08 21:55:28', '1');
insert into AOS_SYS_MODULE_USER (id_, user_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('4318', '21', '615', '1', '2015-07-08 21:55:28', '1');
insert into AOS_SYS_MODULE_USER (id_, user_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('4319', '21', '530', '1', '2015-07-08 21:55:28', '1');
insert into AOS_SYS_MODULE_USER (id_, user_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('4320', '21', '188', '1', '2015-07-08 21:55:28', '1');
insert into AOS_SYS_MODULE_USER (id_, user_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('4321', '21', '199', '1', '2015-07-08 21:55:28', '1');
insert into AOS_SYS_MODULE_USER (id_, user_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('4322', '21', '200', '1', '2015-07-08 21:55:28', '1');
insert into AOS_SYS_MODULE_USER (id_, user_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('4323', '21', '201', '1', '2015-07-08 21:55:28', '1');
insert into AOS_SYS_MODULE_USER (id_, user_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('4324', '21', '304', '1', '2015-07-08 21:55:28', '1');
insert into AOS_SYS_MODULE_USER (id_, user_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('4325', '21', '0', '2', '2015-07-08 21:56:33', '1');
insert into AOS_SYS_MODULE_USER (id_, user_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('4326', '21', '183', '2', '2015-07-08 21:56:33', '1');
insert into AOS_SYS_MODULE_USER (id_, user_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('4327', '21', '186', '2', '2015-07-08 21:56:33', '1');
insert into AOS_SYS_MODULE_USER (id_, user_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('4328', '21', '192', '2', '2015-07-08 21:56:33', '1');
insert into AOS_SYS_MODULE_USER (id_, user_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('4329', '21', '193', '2', '2015-07-08 21:56:33', '1');
insert into AOS_SYS_MODULE_USER (id_, user_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('4330', '21', '194', '2', '2015-07-08 21:56:33', '1');
insert into AOS_SYS_MODULE_USER (id_, user_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('4331', '21', '187', '2', '2015-07-08 21:56:33', '1');
insert into AOS_SYS_MODULE_USER (id_, user_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('4332', '21', '197', '2', '2015-07-08 21:56:34', '1');
insert into AOS_SYS_MODULE_USER (id_, user_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('4333', '21', '454', '2', '2015-07-08 21:56:34', '1');
insert into AOS_SYS_MODULE_USER (id_, user_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('4334', '21', '195', '2', '2015-07-08 21:56:34', '1');
insert into AOS_SYS_MODULE_USER (id_, user_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('4335', '21', '615', '2', '2015-07-08 21:56:34', '1');
insert into AOS_SYS_MODULE_USER (id_, user_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('4336', '21', '530', '2', '2015-07-08 21:56:34', '1');
commit;
prompt 29 records loaded
prompt Loading AOS_SYS_MODULE_USER_NAV...
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('1', '192', '1', '25.png', '2', 0);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('2', '193', '1', '11.png', '2', 0);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('3', '200', '1', '30.png', '2', 0);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('3401', '194', '1', '32.png', '2', 4);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('3588', '0', '15', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('3589', '183', '15', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('3590', '186', '15', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('3591', '192', '15', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('3592', '193', '15', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('3593', '194', '15', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('3594', '187', '15', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('3595', '454', '15', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('3596', '195', '15', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('3597', '190', '15', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('3598', '203', '15', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('3599', '184', '15', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('3600', '207', '15', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('3601', '489', '15', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('3602', '213', '15', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('3603', '211', '15', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('3604', '495', '15', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('3605', '497', '15', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('3606', '192', '15', '28.png', '2', 1);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('4', '201', '1', '41.png', '2', 0);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('4177', '0', '1', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('4178', '183', '1', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('4179', '186', '1', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('4180', '192', '1', null, '1', 1);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('4181', '193', '1', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('4182', '194', '1', null, '1', 3);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('4183', '187', '1', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('4184', '197', '1', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('4185', '454', '1', null, '1', 4);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('4186', '195', '1', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('4187', '615', '1', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('4188', '530', '1', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('4189', '188', '1', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('4190', '199', '1', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('4191', '200', '1', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('4192', '201', '1', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('4193', '304', '1', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('4194', '189', '1', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('4195', '533', '1', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('4196', '534', '1', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('4197', '202', '1', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('4198', '535', '1', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('4199', '486', '1', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('4200', '499', '1', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('4201', '500', '1', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('4202', '555', '1', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('4203', '393', '1', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('4204', '225', '1', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('4205', '217', '1', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('4206', '220', '1', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('4207', '222', '1', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('4208', '184', '1', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('4209', '207', '1', null, '1', 2);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('4210', '489', '1', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('5', '304', '1', '28.png', '2', 0);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('6', '199', '1', '7.png', '2', 0);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('7', '197', '1', '51.png', '2', 0);
commit;
prompt 61 records loaded
prompt Loading AOS_SYS_ORG...
insert into AOS_SYS_ORG (id_, cascade_id_, name_, hotkey_, parent_id_, pareant_name_, is_leaf_, is_auto_expand_, icon_name_, status_, type_, biz_code_, custom_code_, create_time_, creater_id_, sort_no_)
values ('0', '0', 'OSWorks', null, 'p', 'root', '0', '1', 'home.png', '1', '1', null, null, '2012-01-01 12:12:12', '1', 0);
insert into AOS_SYS_ORG (id_, cascade_id_, name_, hotkey_, parent_id_, pareant_name_, is_leaf_, is_auto_expand_, icon_name_, status_, type_, biz_code_, custom_code_, create_time_, creater_id_, sort_no_)
values ('284', '0.007', '项目部', null, '0', 'OSWorks', '1', '0', null, '1', '1', null, null, '2012-01-01 12:12:12', '1', 3);
insert into AOS_SYS_ORG (id_, cascade_id_, name_, hotkey_, parent_id_, pareant_name_, is_leaf_, is_auto_expand_, icon_name_, status_, type_, biz_code_, custom_code_, create_time_, creater_id_, sort_no_)
values ('285', '0.003', '产品部', null, '0', 'OSWorks', '1', '0', null, '1', '1', null, null, '2012-01-01 12:12:12', '1', 2);
insert into AOS_SYS_ORG (id_, cascade_id_, name_, hotkey_, parent_id_, pareant_name_, is_leaf_, is_auto_expand_, icon_name_, status_, type_, biz_code_, custom_code_, create_time_, creater_id_, sort_no_)
values ('286', '0.004', '软件过程支持部', null, '0', 'OSWorks', '1', '0', null, '1', '1', null, null, '2012-01-01 12:12:12', '1', 4);
insert into AOS_SYS_ORG (id_, cascade_id_, name_, hotkey_, parent_id_, pareant_name_, is_leaf_, is_auto_expand_, icon_name_, status_, type_, biz_code_, custom_code_, create_time_, creater_id_, sort_no_)
values ('287', '0.005', '总务办', null, '0', 'OSWorks', '0', '1', null, '1', '1', null, null, '2012-01-01 12:12:12', '1', 5);
insert into AOS_SYS_ORG (id_, cascade_id_, name_, hotkey_, parent_id_, pareant_name_, is_leaf_, is_auto_expand_, icon_name_, status_, type_, biz_code_, custom_code_, create_time_, creater_id_, sort_no_)
values ('288', '0.008', '市场部', null, '0', 'OSWorks', '1', '0', null, '1', '1', null, null, '2012-01-01 12:12:12', '1', 1);
insert into AOS_SYS_ORG (id_, cascade_id_, name_, hotkey_, parent_id_, pareant_name_, is_leaf_, is_auto_expand_, icon_name_, status_, type_, biz_code_, custom_code_, create_time_, creater_id_, sort_no_)
values ('424', '0.005.001', '部门1', null, '287', '总务办', '0', '1', null, '1', '1', null, null, '2012-01-01 12:12:12', '1', 1);
insert into AOS_SYS_ORG (id_, cascade_id_, name_, hotkey_, parent_id_, pareant_name_, is_leaf_, is_auto_expand_, icon_name_, status_, type_, biz_code_, custom_code_, create_time_, creater_id_, sort_no_)
values ('441', '0.005.001.001', '部门1-1', null, '424', '部门1', '1', '0', null, '1', '1', null, null, '2012-01-01 12:12:12', '4', 1);
commit;
prompt 8 records loaded
prompt Loading AOS_SYS_PAGE...
insert into AOS_SYS_PAGE (id_, module_id_, name_, url_, type_, enabled_, is_default_, icon_, icon_big_, vector_, sort_no_)
values ('1646', '207', '我的个人资料', 'initMyInfo.jhtml', '2', '1', '1', 'vcard.png', null, null, 1);
insert into AOS_SYS_PAGE (id_, module_id_, name_, url_, type_, enabled_, is_default_, icon_, icon_big_, vector_, sort_no_)
values ('1647', '207', '我的偏好设置', 'initMySettings.jhtml', '2', '1', '0', 'icon79.png', null, null, 2);
insert into AOS_SYS_PAGE (id_, module_id_, name_, url_, type_, enabled_, is_default_, icon_, icon_big_, vector_, sort_no_)
values ('1648', '207', '系统安全选项', 'initSecurityCfg.jhtml', '2', '1', '0', 'system.png', null, null, 3);
insert into AOS_SYS_PAGE (id_, module_id_, name_, url_, type_, enabled_, is_default_, icon_, icon_big_, vector_, sort_no_)
values ('1649', '207', '自定义菜单', 'initMyNav.jhtml', '2', '1', '0', 'icon_19.png', null, null, 4);
insert into AOS_SYS_PAGE (id_, module_id_, name_, url_, type_, enabled_, is_default_, icon_, icon_big_, vector_, sort_no_)
values ('1650', '207', '我的操作日志', null, '2', '1', '0', 'icon75.png', null, null, 6);
insert into AOS_SYS_PAGE (id_, module_id_, name_, url_, type_, enabled_, is_default_, icon_, icon_big_, vector_, sort_no_)
values ('1652', '207', '分割符', null, '4', '1', '0', null, null, null, 5);
insert into AOS_SYS_PAGE (id_, module_id_, name_, url_, type_, enabled_, is_default_, icon_, icon_big_, vector_, sort_no_)
values ('1677', '393', '小图标[16X16]', 'initIconList.jhtml?type_=1', '2', '1', '1', 'pictures.png', null, null, 1);
insert into AOS_SYS_PAGE (id_, module_id_, name_, url_, type_, enabled_, is_default_, icon_, icon_big_, vector_, sort_no_)
values ('1678', '393', '大图标[64X64]', 'initIconList.jhtml?type_=2', '2', '1', '0', 'picture.png', null, null, 2);
insert into AOS_SYS_PAGE (id_, module_id_, name_, url_, type_, enabled_, is_default_, icon_, icon_big_, vector_, sort_no_)
values ('1679', '393', '矢量图标', 'initIconList.jhtml?type_=3', '2', '1', '0', 'vector.png', null, null, 4);
insert into AOS_SYS_PAGE (id_, module_id_, name_, url_, type_, enabled_, is_default_, icon_, icon_big_, vector_, sort_no_)
values ('1701', '213', '待办任务', 'initDo.jhtml', '2', '1', '1', 'task_list.png', null, null, 10);
insert into AOS_SYS_PAGE (id_, module_id_, name_, url_, type_, enabled_, is_default_, icon_, icon_big_, vector_, sort_no_)
values ('1702', '213', '已办任务', 'initDone.jhtml', '2', '1', '0', 'task_finish.png', null, null, 20);
insert into AOS_SYS_PAGE (id_, module_id_, name_, url_, type_, enabled_, is_default_, icon_, icon_big_, vector_, sort_no_)
values ('1703', '393', '分隔符', null, '4', '1', '0', null, null, null, 3);
commit;
prompt 12 records loaded
prompt Loading AOS_SYS_PAGE_EL...
insert into AOS_SYS_PAGE_EL (id_, dom_id_, name_, type_, module_id_, page_id_, remark_)
values ('1666', '_btn_demo', '文本按钮', '1', '207', '207', '演示页面元素授权');
insert into AOS_SYS_PAGE_EL (id_, dom_id_, name_, type_, module_id_, page_id_, remark_)
values ('1667', '_btn_save_demo', '个人信息保存按钮', '1', '207', '1646', '演示页面元素授权');
insert into AOS_SYS_PAGE_EL (id_, dom_id_, name_, type_, module_id_, page_id_, remark_)
values ('477', '_btn_add_demo', '弹出新增参数窗口按钮', '1', '192', '192', null);
commit;
prompt 3 records loaded
prompt Loading AOS_SYS_PAGE_EL_GRANT...
prompt Table is empty
prompt Loading AOS_SYS_PARAM...
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('1668', 'nav_tab_index_', '0', '423', '0.001.002.004', '导航缺省活动页', '1', 'nav_tab_index_', '左侧布局的导航卡片缺省激活的卡片索引号，索引下标从0开始。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('1669', 'nav_quick_layout_', '1', '423', '0.001.002.004', '快捷菜单布局风格', '1', 'nav_quick_layout_', '快捷菜单布局风格。1:平铺。2：树状。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('302', 'theme_', 'classic', '413', '0.001.002.002', '系统主题风格', '1', 'theme_', '可选值：classic。缺省值：classic。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('303', 'layout_', 'tab', '413', '0.001.002.002', 'Center区域布局风格', '1', 'layout_', '系统业务经办区域(center)布局风格。可选值：tab|page。缺省值：tab。tab：支持同时打开多个功能模块界面；page：当前只能打开1个功能界面。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('35', 'skin_', 'blue', '413', '0.001.002.002', '系统缺省皮肤', '1', 'skin_', '可选值：blue|gray|neptune|aos。缺省值：blue。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('359', 'copyright_', '2008-2015 OSWorks', '413', '0.001.002.002', '版权信息', '0', null, '版权信息');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('36', 'tab_focus_color_', '#0099FF', '413', '0.001.002.002', 'Tab高亮颜色', '1', 'tab_focus_color_', '缺省的当前Tab卡片高亮提示颜色');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('363', 'app_title_', 'AOS : JavaEE应用基础平台', '413', '0.001.002.002', '首页浏览器标题内容', '0', null, '首页浏览器标题内容');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('37', 'prevent_rightclick_', 'false', '414', '0.001.002.003', '全局右键', '0', null, '阻止浏览器缺省鼠标右键事件。可选值：true|false。缺省值：true。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('382', 'nav_mode_', '1', '423', '0.001.002.004', '导航模式', '1', 'nav_mode_', '可选值，1：水平导航按钮和垂直导航的卡片属于统一层级；2：水平导航按钮和垂直导航的卡片有上下级级联导航关系。(当前模式2未实现)');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('389', 'is_show_top_nav_', 'true', '423', '0.001.002.004', '水平导航条', '1', 'is_show_top_nav_', '是否显示水平导航条。(只有在导航模式为1的情况，此设置才有效,导航模式为2，则水平导航条不会消失)。可选值：true| false。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('390', 'navbar_btn_style_', 'tight', '423', '0.001.002.004', '导航条按钮风格', '1', 'navbar_btn_style_', '顶部水平导航条的按钮样式风格。tight：组合按钮；standalone：独立按钮。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('408', 'login_page_', 'login-ext.jsp', '414', '0.001.002.003', '登录页面', '0', null, 'Ext原生风格的登录界面');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('409', 'vercode_show_', '1', '410', '0.001.002.001', '验证码开关', '0', null, '是否在登录页面显示验证码及后台验证码验证。可选值：0(否) | 1(是)。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('411', 'vercode_length_', '4', '410', '0.001.002.001', '验证码长度', '0', null, '验证码长度');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('412', 'vercode_characters_', 'abcdetx2345678', '410', '0.001.002.001', '验证码待选字符集', '0', null, '验证码待选字符集。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('415', 'login_back_img_', '-1', '413', '0.001.002.002', '登录页面的背景图片', '0', null, '登录页面的背景图片。可选的预设背景图片为：0.jpg、1.jpg、2.jpg、3.jpg。如果需要随机出现背景，则将其设置为-1。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('416', 'page_load_gif_', 'wheel.gif', '413', '0.001.002.002', '页面刷新动画文件', '0', null, '页面刷新动画文件。可选的预设动画文件：run.gif、wheel.gif。动画path：/static/image/gif/pageload。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('417', 'dev_account_', 'root', '414', '0.001.002.003', '开发者登录帐号', '0', null, '登录页面开发者按钮登录帐号。可以配置为任何一个存在的帐号。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('418', 'dev_account_login_', '1', '414', '0.001.002.003', '开发者登录帐号开关', '0', null, '是否启用开发者登录帐号功能,如启用则在登录界面会出现[开发者]按钮。可选值：1 | 0。提示：系统若在生产模式下运行，则此配置忽略，自动关闭开发者登录功能。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('419', 'welcome_page_title_', '欢迎', '413', '0.001.002.002', '欢迎页标题', '0', null, '系统登录后第一个缺省打开的Tab页面的标题。缺省："欢迎"。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('420', 'is_show_mac_nav_', '1', '423', '0.001.002.004', 'Mac导航显示开关', '1', 'is_show_mac_nav_', '欢迎页Mac导航显示开关。可选值：0 | 1。缺省值：1。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('585', 'show_login_win_head_', 'true', '413', '0.001.002.002', '是否显示登录窗口标题栏', '0', null, '是否显示登录窗口标题栏(Ext登录风格)。缺省值：false。可选值：true|false。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('586', 'is_show_statusbar_', 'true', '413', '0.001.002.002', '是否显示主界面状态栏', '0', null, '是否显示主界面状态栏。可选值：true|false。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('607', 'role_grant_mode_', '1', '414', '0.001.002.003', '角色授权模式', '0', null, '角色授权模式(角色可见度)。可选值：1|2。1：可见当前管理员创建的角色和当前管理员所属组织的其他管理员创建的角色。2：可见当前管理员创建的角色和当前管理员所属组织及其下级子孙组织的其他管理员创建的角色。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('609', 'grid_column_algin_', 'left', '413', '0.001.002.002', '表格列内容对齐方式', '0', null, '表格列对齐模式。有效值：left|center|right。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('623', 'byteobj_maxsize_', '50', '414', '0.001.002.003', '流文件最大值(KB)', '0', null, '单位：KB');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('637', 'user_head_catalog_id_', '613', '414', '0.001.002.003', '用户头像流文件分类ID', '0', null, '用户头像流文件分类ID，分类科目中的用户头像分类ID。用户上传文件时使用。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('74', 'app_name_', 'AOS : JavaEE应用基础平台', '413', '0.001.002.002', '应用系统名称', '0', null, '应用系统名称');
commit;
prompt 29 records loaded
prompt Loading AOS_SYS_POST...
insert into AOS_SYS_POST (id_, name_, status_, type_, org_id_, create_time_, creater_id_, org_cascade_id_)
values ('538', '岗位1', '1', '1', '288', '2014-12-10 02:25:17', '1', '0.008');
insert into AOS_SYS_POST (id_, name_, status_, type_, org_id_, create_time_, creater_id_, org_cascade_id_)
values ('539', '岗位2', '1', '1', '285', '2014-12-10 02:25:24', '1', '0.003');
insert into AOS_SYS_POST (id_, name_, status_, type_, org_id_, create_time_, creater_id_, org_cascade_id_)
values ('540', '岗位3', '1', '1', '284', '2014-12-10 02:26:56', '1', '0.007');
commit;
prompt 3 records loaded
prompt Loading AOS_SYS_ROLE...
insert into AOS_SYS_ROLE (id_, name_, status_, type_, create_time_, creater_id_, creater_org_id_, creater_org_cascade_id_)
values ('449', '测试角色1', '1', '1', '2014-11-18 12:56:15', '4', '287', '0.005');
insert into AOS_SYS_ROLE (id_, name_, status_, type_, create_time_, creater_id_, creater_org_id_, creater_org_cascade_id_)
values ('455', '测试角色', '1', '1', '2014-11-23 19:58:19', '4', '288', '0.008');
insert into AOS_SYS_ROLE (id_, name_, status_, type_, create_time_, creater_id_, creater_org_id_, creater_org_cascade_id_)
values ('541', '角色1', '1', '1', '2014-12-10 02:28:26', '1', '0', '0');
insert into AOS_SYS_ROLE (id_, name_, status_, type_, create_time_, creater_id_, creater_org_id_, creater_org_cascade_id_)
values ('605', '角色2', '1', '1', '2015-01-22 00:48:47', '1', '0', '0');
commit;
prompt 4 records loaded
prompt Loading AOS_SYS_SEQUENCE...
insert into AOS_SYS_SEQUENCE (id_, name_, type_, prefix_, start_, step_, cur_value_, status_, connector_, suffix_, db_seq_name_, max_value_, is_circul_, min_value_, is_leftpad_, format_value_, remark_)
values ('1', 'GID', '1', null, '1', '1', '1721', '1', null, null, null, '9999999999', '0', '1', '0', '1721', '系统管理-实体表流水号。');
insert into AOS_SYS_SEQUENCE (id_, name_, type_, prefix_, start_, step_, cur_value_, status_, connector_, suffix_, db_seq_name_, max_value_, is_circul_, min_value_, is_leftpad_, format_value_, remark_)
values ('1635', 'ICONID', '1', null, '1', '1', '7872', '1', null, null, null, '9223372036854775807', '0', '1', '0', '7872', '图标ID');
insert into AOS_SYS_SEQUENCE (id_, name_, type_, prefix_, start_, step_, cur_value_, status_, connector_, suffix_, db_seq_name_, max_value_, is_circul_, min_value_, is_leftpad_, format_value_, remark_)
values ('2', 'GUUID', '2', null, '1', '1', 'bd749e4c-0512-4b01-9ef7-7f42af3812a0', '1', null, null, null, '9223372036854775807', '0', '1', '0', 'bd749e4c-0512-4b01-9ef7-7f42af3812a0', '通用UUID。');
insert into AOS_SYS_SEQUENCE (id_, name_, type_, prefix_, start_, step_, cur_value_, status_, connector_, suffix_, db_seq_name_, max_value_, is_circul_, min_value_, is_leftpad_, format_value_, remark_)
values ('3', 'TESTID', '1', null, '1', '1', '00000050', '1', null, null, null, '99999999', '1', '1', '1', '00000050', '测试用ID');
insert into AOS_SYS_SEQUENCE (id_, name_, type_, prefix_, start_, step_, cur_value_, status_, connector_, suffix_, db_seq_name_, max_value_, is_circul_, min_value_, is_leftpad_, format_value_, remark_)
values ('313', 'USERID', '1', null, '1', '1', '21', '1', null, null, null, '9223372036854775807', '0', '1', '0', '21', '用户ID');
insert into AOS_SYS_SEQUENCE (id_, name_, type_, prefix_, start_, step_, cur_value_, status_, connector_, suffix_, db_seq_name_, max_value_, is_circul_, min_value_, is_leftpad_, format_value_, remark_)
values ('337', 'RID', '1', null, '1', '1', '4340', '1', null, null, null, '9999999999', '0', '1', '0', '4340', '系统管理-关联表流水号。');
insert into AOS_SYS_SEQUENCE (id_, name_, type_, prefix_, start_, step_, cur_value_, status_, connector_, suffix_, db_seq_name_, max_value_, is_circul_, min_value_, is_leftpad_, format_value_, remark_)
values ('546', 'BPMID', '1', null, '1', '1', '119', '1', null, null, null, '9999999999', '0', '1', '0', '119', '流程引擎相关辅助表的流水号');
insert into AOS_SYS_SEQUENCE (id_, name_, type_, prefix_, start_, step_, cur_value_, status_, connector_, suffix_, db_seq_name_, max_value_, is_circul_, min_value_, is_leftpad_, format_value_, remark_)
values ('8', 'TESTID1', '1', 'TEST{yyyyMMdd}', '1', '1', '0059', '1', '-', '{HHmmss}', null, '9999', '1', '1', '1', 'TEST20150121-0059-005407', '测试ID，前缀后缀支持日期时间表达式。');
commit;
prompt 8 records loaded
prompt Loading AOS_SYS_USER...
insert into AOS_SYS_USER (id_, account_, password_, name_, sex_, org_id_, status_, type_, biz_code_, create_time_, creater_id_, org_cascade_id_)
values ('1', 'root', 'Q31Ox+QY0vs=', '超级用户', '1', '0', '1', '2', null, '2014-09-27 22:12:56', '1', '0');
insert into AOS_SYS_USER (id_, account_, password_, name_, sex_, org_id_, status_, type_, biz_code_, create_time_, creater_id_, org_cascade_id_)
values ('15', 'xxd', 'Q31Ox+QY0vs=', '熊小朵', '0', '441', '1', '1', null, '2014-12-10 02:19:12', '1', '0.005.001.001');
insert into AOS_SYS_USER (id_, account_, password_, name_, sex_, org_id_, status_, type_, biz_code_, create_time_, creater_id_, org_cascade_id_)
values ('19', 'xxx', 'ByOPAM8ATmY=', '熊小雄', '1', '285', '1', '1', null, '2015-01-25 16:20:54', '1', '0.003');
insert into AOS_SYS_USER (id_, account_, password_, name_, sex_, org_id_, status_, type_, biz_code_, create_time_, creater_id_, org_cascade_id_)
values ('20', 'xcc', '5SIDJ03AkJI=', '熊楚楚', '0', '0', '1', '1', null, '2015-02-01 22:19:03', '1', '0');
insert into AOS_SYS_USER (id_, account_, password_, name_, sex_, org_id_, status_, type_, biz_code_, create_time_, creater_id_, org_cascade_id_)
values ('21', 'admin', 'ByOPAM8ATmY=', 'admin', '0', '0', '1', '1', null, '2015-07-08 21:55:10', '1', '0');
commit;
prompt 5 records loaded
prompt Loading AOS_SYS_USER_CFG...
insert into AOS_SYS_USER_CFG (id_, theme_, skin_, layout_, nav_mode_, is_show_top_nav_, navbar_btn_style_, tab_focus_color_, is_show_mac_nav_, nav_tab_index_, nav_quick_layout_)
values ('1', 'classic', 'blue', 'tab', '1', 'true', 'tight', '#0099FF', '1', '0', '1');
insert into AOS_SYS_USER_CFG (id_, theme_, skin_, layout_, nav_mode_, is_show_top_nav_, navbar_btn_style_, tab_focus_color_, is_show_mac_nav_, nav_tab_index_, nav_quick_layout_)
values ('15', 'classic', 'blue', 'tab', '1', 'true', 'tight', '#0099FF', '1', '1', '1');
insert into AOS_SYS_USER_CFG (id_, theme_, skin_, layout_, nav_mode_, is_show_top_nav_, navbar_btn_style_, tab_focus_color_, is_show_mac_nav_, nav_tab_index_, nav_quick_layout_)
values ('19', 'classic', 'neptune', 'tab', '1', 'true', 'tight', '#0099FF', '1', '1', null);
insert into AOS_SYS_USER_CFG (id_, theme_, skin_, layout_, nav_mode_, is_show_top_nav_, navbar_btn_style_, tab_focus_color_, is_show_mac_nav_, nav_tab_index_, nav_quick_layout_)
values ('20', 'classic', 'neptune', 'tab', '1', 'true', 'tight', '#0099FF', '1', '1', '1');
insert into AOS_SYS_USER_CFG (id_, theme_, skin_, layout_, nav_mode_, is_show_top_nav_, navbar_btn_style_, tab_focus_color_, is_show_mac_nav_, nav_tab_index_, nav_quick_layout_)
values ('21', 'classic', 'blue', 'tab', '1', 'true', 'tight', '#0099FF', '1', '1', '1');
commit;
prompt 5 records loaded
prompt Loading AOS_SYS_USER_EXT...
insert into AOS_SYS_USER_EXT (id_, email_, fixed_phone_, mobile_phone_, address_, zip_, birthday_, idno_, qq_, dynamic_field_, bytearray_id_, remark_, filed1_, filed2_, filed3_)
values ('1', '307916217@qq.com', null, '18616786188', null, null, null, null, '307916217', null, '1717', '超级用户拥有系统最高权限。', null, null, null);
insert into AOS_SYS_USER_EXT (id_, email_, fixed_phone_, mobile_phone_, address_, zip_, birthday_, idno_, qq_, dynamic_field_, bytearray_id_, remark_, filed1_, filed2_, filed3_)
values ('15', null, null, null, null, null, '2015-02-01', null, null, null, '646', null, null, null, null);
insert into AOS_SYS_USER_EXT (id_, email_, fixed_phone_, mobile_phone_, address_, zip_, birthday_, idno_, qq_, dynamic_field_, bytearray_id_, remark_, filed1_, filed2_, filed3_)
values ('19', 'xxx@qq.com', '0871-3131921', '18616786188', '云南大理', '53021890', '2015-01-30', '532925108211170651', '307916217', null, '644', '备注内容', '100', '100', '100');
insert into AOS_SYS_USER_EXT (id_, email_, fixed_phone_, mobile_phone_, address_, zip_, birthday_, idno_, qq_, dynamic_field_, bytearray_id_, remark_, filed1_, filed2_, filed3_)
values ('20', null, null, null, null, null, null, null, null, null, null, null, '100', '100', null);
insert into AOS_SYS_USER_EXT (id_, email_, fixed_phone_, mobile_phone_, address_, zip_, birthday_, idno_, qq_, dynamic_field_, bytearray_id_, remark_, filed1_, filed2_, filed3_)
values ('21', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
commit;
prompt 5 records loaded
prompt Loading AOS_SYS_USER_POST...
prompt Table is empty
prompt Loading AOS_SYS_USER_ROLE...
prompt Table is empty
prompt Loading AOS_SYS_WF_MODEL...
prompt Table is empty
prompt Loading AOS_SYS_WF_PROCDEF...
prompt Table is empty
set feedback on
set define on
prompt Done.


