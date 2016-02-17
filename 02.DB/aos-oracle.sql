----------------------------------------------
-- Export file for user AOS@ORCL            --
-- Created by XChun on 2016-02-17, 10:33:20 --
----------------------------------------------

set define off
spool aos-oracle.log

prompt
prompt Creating table AOS_LOG_SESSION
prompt ==============================
prompt
create table AOS_LOG_SESSION
(
  id_          VARCHAR2(64) not null,
  user_id_     VARCHAR2(64) not null,
  account_     VARCHAR2(255) not null,
  user_name_   VARCHAR2(255) not null,
  ip_address_  VARCHAR2(255),
  client_type_ VARCHAR2(255),
  owner_       VARCHAR2(255),
  create_time_ DATE not null
)
;
comment on table AOS_LOG_SESSION
  is '会话日志记录表';
comment on column AOS_LOG_SESSION.id_
  is '会话ID';
comment on column AOS_LOG_SESSION.user_id_
  is '用户ID';
comment on column AOS_LOG_SESSION.account_
  is '登录帐户';
comment on column AOS_LOG_SESSION.user_name_
  is '用户姓名';
comment on column AOS_LOG_SESSION.ip_address_
  is '客户端IP地址';
comment on column AOS_LOG_SESSION.client_type_
  is '客户端类型';
comment on column AOS_LOG_SESSION.owner_
  is '宿主';
alter table AOS_LOG_SESSION
  add constraint AOS_LOG_SESSION_PKEY primary key (ID_);

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
  id_             VARCHAR2(64),
  cascade_id_     VARCHAR2(255),
  name_           VARCHAR2(255),
  hotkey_         VARCHAR2(255),
  parent_id_      VARCHAR2(64),
  pareant_name_   VARCHAR2(255),
  is_leaf_        VARCHAR2(255) default 1,
  is_auto_expand_ VARCHAR2(255) default 0,
  icon_name_      VARCHAR2(255),
  status_         VARCHAR2(255) default 1,
  type_           VARCHAR2(255),
  biz_code_       VARCHAR2(255),
  custom_code_    VARCHAR2(4000),
  create_time_    VARCHAR2(255),
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
create unique index BIN$y9DngOHsQa+bJS8Un4K9ZA==$0 on AOS_SYS_ORG (ID_);
alter table AOS_SYS_ORG
  add constraint BIN$3H11ai0tRjSJ2+XPbTFZFQ==$0 primary key (ID_);
alter table AOS_SYS_ORG
  add constraint BIN$46NVqVamQPWPRTEHrODl/g==$0
  check ("STATUS_" IS NOT NULL);
alter table AOS_SYS_ORG
  add constraint BIN$J167KgoBRUeoMb0SCyDXug==$0
  check ("CREATE_TIME_" IS NOT NULL);
alter table AOS_SYS_ORG
  add constraint BIN$KxdSEEajRx2fmBIjGvGv5g==$0
  check ("IS_AUTO_EXPAND_" IS NOT NULL);
alter table AOS_SYS_ORG
  add constraint BIN$Mb6ykhBIRFK3xW6gPd3r1g==$0
  check ("PARENT_ID_" IS NOT NULL);
alter table AOS_SYS_ORG
  add constraint BIN$MyALk+vHQ92KAdcH8v9dJg==$0
  check ("CASCADE_ID_" IS NOT NULL);
alter table AOS_SYS_ORG
  add constraint BIN$axE8IylDSOSBwymffTYO+g==$0
  check ("IS_LEAF_" IS NOT NULL);
alter table AOS_SYS_ORG
  add constraint BIN$d8E0puy/Qw2ymGfjDSMAfw==$0
  check ("NAME_" IS NOT NULL);
alter table AOS_SYS_ORG
  add constraint BIN$qVmrUdCLRwS6HmTMRazHEw==$0
  check ("ID_" IS NOT NULL);
alter table AOS_SYS_ORG
  add constraint BIN$uG4Au9T5Qgip5nSgBUnu0w==$0
  check ("TYPE_" IS NOT NULL);

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
  org_cascade_id_ VARCHAR2(255) not null,
  delete_flag_    VARCHAR2(255) not null
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
comment on column AOS_SYS_USER.delete_flag_
  is '逻辑删除标识';
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
prompt Creating table AOS_WF_EVT_LOG
prompt =============================
prompt
create table AOS_WF_EVT_LOG
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
alter table AOS_WF_EVT_LOG
  add primary key (LOG_NR_);

prompt
prompt Creating table AOS_WF_RE_DEPLOYMENT
prompt ===================================
prompt
create table AOS_WF_RE_DEPLOYMENT
(
  id_          NVARCHAR2(64) not null,
  name_        NVARCHAR2(255),
  category_    NVARCHAR2(255),
  tenant_id_   NVARCHAR2(255) default '',
  deploy_time_ TIMESTAMP(6)
)
;
alter table AOS_WF_RE_DEPLOYMENT
  add primary key (ID_);

prompt
prompt Creating table AOS_WF_GE_BYTEARRAY
prompt ==================================
prompt
create table AOS_WF_GE_BYTEARRAY
(
  id_            NVARCHAR2(64) not null,
  rev_           INTEGER,
  name_          NVARCHAR2(255),
  deployment_id_ NVARCHAR2(64),
  bytes_         BLOB,
  generated_     NUMBER(1)
)
;
create index ACT_IDX_BYTEAR_DEPL on AOS_WF_GE_BYTEARRAY (DEPLOYMENT_ID_);
alter table AOS_WF_GE_BYTEARRAY
  add primary key (ID_);
alter table AOS_WF_GE_BYTEARRAY
  add constraint ACT_FK_BYTEARR_DEPL foreign key (DEPLOYMENT_ID_)
  references AOS_WF_RE_DEPLOYMENT (ID_);
alter table AOS_WF_GE_BYTEARRAY
  add check (GENERATED_ IN (1,0));

prompt
prompt Creating table AOS_WF_GE_PROPERTY
prompt =================================
prompt
create table AOS_WF_GE_PROPERTY
(
  name_  NVARCHAR2(64) not null,
  value_ NVARCHAR2(300),
  rev_   INTEGER
)
;
alter table AOS_WF_GE_PROPERTY
  add primary key (NAME_);

prompt
prompt Creating table AOS_WF_HI_ACTINST
prompt ================================
prompt
create table AOS_WF_HI_ACTINST
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
create index ACT_IDX_HI_ACT_INST_END on AOS_WF_HI_ACTINST (END_TIME_);
create index ACT_IDX_HI_ACT_INST_EXEC on AOS_WF_HI_ACTINST (EXECUTION_ID_, ACT_ID_);
create index ACT_IDX_HI_ACT_INST_PROCINST on AOS_WF_HI_ACTINST (PROC_INST_ID_, ACT_ID_);
create index ACT_IDX_HI_ACT_INST_START on AOS_WF_HI_ACTINST (START_TIME_);
alter table AOS_WF_HI_ACTINST
  add primary key (ID_);

prompt
prompt Creating table AOS_WF_HI_ATTACHMENT
prompt ===================================
prompt
create table AOS_WF_HI_ATTACHMENT
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
alter table AOS_WF_HI_ATTACHMENT
  add primary key (ID_);

prompt
prompt Creating table AOS_WF_HI_COMMENT
prompt ================================
prompt
create table AOS_WF_HI_COMMENT
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
alter table AOS_WF_HI_COMMENT
  add primary key (ID_);

prompt
prompt Creating table AOS_WF_HI_DETAIL
prompt ===============================
prompt
create table AOS_WF_HI_DETAIL
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
create index ACT_IDX_HI_DETAIL_ACT_INST on AOS_WF_HI_DETAIL (ACT_INST_ID_);
create index ACT_IDX_HI_DETAIL_NAME on AOS_WF_HI_DETAIL (NAME_);
create index ACT_IDX_HI_DETAIL_PROC_INST on AOS_WF_HI_DETAIL (PROC_INST_ID_);
create index ACT_IDX_HI_DETAIL_TASK_ID on AOS_WF_HI_DETAIL (TASK_ID_);
create index ACT_IDX_HI_DETAIL_TIME on AOS_WF_HI_DETAIL (TIME_);
alter table AOS_WF_HI_DETAIL
  add primary key (ID_);

prompt
prompt Creating table AOS_WF_HI_IDENTITYLINK
prompt =====================================
prompt
create table AOS_WF_HI_IDENTITYLINK
(
  id_           NVARCHAR2(64) not null,
  group_id_     NVARCHAR2(255),
  type_         NVARCHAR2(255),
  user_id_      NVARCHAR2(255),
  task_id_      NVARCHAR2(64),
  proc_inst_id_ NVARCHAR2(64)
)
;
create index ACT_IDX_HI_IDENT_LNK_PROCINST on AOS_WF_HI_IDENTITYLINK (PROC_INST_ID_);
create index ACT_IDX_HI_IDENT_LNK_TASK on AOS_WF_HI_IDENTITYLINK (TASK_ID_);
create index ACT_IDX_HI_IDENT_LNK_USER on AOS_WF_HI_IDENTITYLINK (USER_ID_);
alter table AOS_WF_HI_IDENTITYLINK
  add primary key (ID_);

prompt
prompt Creating table AOS_WF_HI_PROCINST
prompt =================================
prompt
create table AOS_WF_HI_PROCINST
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
create index ACT_IDX_HI_PRO_INST_END on AOS_WF_HI_PROCINST (END_TIME_);
create index ACT_IDX_HI_PRO_I_BUSKEY on AOS_WF_HI_PROCINST (BUSINESS_KEY_);
alter table AOS_WF_HI_PROCINST
  add primary key (ID_);
alter table AOS_WF_HI_PROCINST
  add unique (PROC_INST_ID_);

prompt
prompt Creating table AOS_WF_HI_TASKINST
prompt =================================
prompt
create table AOS_WF_HI_TASKINST
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
create index ACT_IDX_HI_TASK_INST_PROCINST on AOS_WF_HI_TASKINST (PROC_INST_ID_);
alter table AOS_WF_HI_TASKINST
  add primary key (ID_);

prompt
prompt Creating table AOS_WF_HI_VARINST
prompt ================================
prompt
create table AOS_WF_HI_VARINST
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
create index ACT_IDX_HI_PROCVAR_NAME_TYPE on AOS_WF_HI_VARINST (NAME_, VAR_TYPE_);
create index ACT_IDX_HI_PROCVAR_PROC_INST on AOS_WF_HI_VARINST (PROC_INST_ID_);
create index ACT_IDX_HI_PROCVAR_TASK_ID on AOS_WF_HI_VARINST (TASK_ID_);
alter table AOS_WF_HI_VARINST
  add primary key (ID_);

prompt
prompt Creating table AOS_WF_ID_GROUP
prompt ==============================
prompt
create table AOS_WF_ID_GROUP
(
  id_   NVARCHAR2(64) not null,
  rev_  INTEGER,
  name_ NVARCHAR2(255),
  type_ NVARCHAR2(255)
)
;
alter table AOS_WF_ID_GROUP
  add primary key (ID_);

prompt
prompt Creating table AOS_WF_ID_INFO
prompt =============================
prompt
create table AOS_WF_ID_INFO
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
alter table AOS_WF_ID_INFO
  add primary key (ID_);

prompt
prompt Creating table AOS_WF_ID_USER
prompt =============================
prompt
create table AOS_WF_ID_USER
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
alter table AOS_WF_ID_USER
  add primary key (ID_);

prompt
prompt Creating table AOS_WF_ID_MEMBERSHIP
prompt ===================================
prompt
create table AOS_WF_ID_MEMBERSHIP
(
  user_id_  NVARCHAR2(64) not null,
  group_id_ NVARCHAR2(64) not null
)
;
create index ACT_IDX_MEMB_GROUP on AOS_WF_ID_MEMBERSHIP (GROUP_ID_);
create index ACT_IDX_MEMB_USER on AOS_WF_ID_MEMBERSHIP (USER_ID_);
alter table AOS_WF_ID_MEMBERSHIP
  add primary key (USER_ID_, GROUP_ID_);
alter table AOS_WF_ID_MEMBERSHIP
  add constraint ACT_FK_MEMB_GROUP foreign key (GROUP_ID_)
  references AOS_WF_ID_GROUP (ID_);
alter table AOS_WF_ID_MEMBERSHIP
  add constraint ACT_FK_MEMB_USER foreign key (USER_ID_)
  references AOS_WF_ID_USER (ID_);

prompt
prompt Creating table AOS_WF_RE_MODEL
prompt ==============================
prompt
create table AOS_WF_RE_MODEL
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
create index ACT_IDX_MODEL_DEPLOYMENT on AOS_WF_RE_MODEL (DEPLOYMENT_ID_);
create index ACT_IDX_MODEL_SOURCE on AOS_WF_RE_MODEL (EDITOR_SOURCE_VALUE_ID_);
create index ACT_IDX_MODEL_SOURCE_EXTRA on AOS_WF_RE_MODEL (EDITOR_SOURCE_EXTRA_VALUE_ID_);
alter table AOS_WF_RE_MODEL
  add primary key (ID_);
alter table AOS_WF_RE_MODEL
  add constraint ACT_FK_MODEL_DEPLOYMENT foreign key (DEPLOYMENT_ID_)
  references AOS_WF_RE_DEPLOYMENT (ID_);
alter table AOS_WF_RE_MODEL
  add constraint ACT_FK_MODEL_SOURCE foreign key (EDITOR_SOURCE_VALUE_ID_)
  references AOS_WF_GE_BYTEARRAY (ID_);
alter table AOS_WF_RE_MODEL
  add constraint ACT_FK_MODEL_SOURCE_EXTRA foreign key (EDITOR_SOURCE_EXTRA_VALUE_ID_)
  references AOS_WF_GE_BYTEARRAY (ID_);

prompt
prompt Creating table AOS_WF_RE_PROCDEF
prompt ================================
prompt
create table AOS_WF_RE_PROCDEF
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
alter table AOS_WF_RE_PROCDEF
  add primary key (ID_);
alter table AOS_WF_RE_PROCDEF
  add constraint ACT_UNIQ_PROCDEF unique (KEY_, VERSION_, TENANT_ID_);
alter table AOS_WF_RE_PROCDEF
  add check (HAS_START_FORM_KEY_ IN (1,0));
alter table AOS_WF_RE_PROCDEF
  add check (HAS_GRAPHICAL_NOTATION_ IN (1,0));

prompt
prompt Creating table AOS_WF_RU_EXECUTION
prompt ==================================
prompt
create table AOS_WF_RU_EXECUTION
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
create index ACT_IDX_EXEC_BUSKEY on AOS_WF_RU_EXECUTION (BUSINESS_KEY_);
create index ACT_IDX_EXE_PARENT on AOS_WF_RU_EXECUTION (PARENT_ID_);
create index ACT_IDX_EXE_PROCDEF on AOS_WF_RU_EXECUTION (PROC_DEF_ID_);
create index ACT_IDX_EXE_PROCINST on AOS_WF_RU_EXECUTION (PROC_INST_ID_);
create index ACT_IDX_EXE_SUPER on AOS_WF_RU_EXECUTION (SUPER_EXEC_);
alter table AOS_WF_RU_EXECUTION
  add primary key (ID_);
alter table AOS_WF_RU_EXECUTION
  add constraint ACT_FK_EXE_PARENT foreign key (PARENT_ID_)
  references AOS_WF_RU_EXECUTION (ID_);
alter table AOS_WF_RU_EXECUTION
  add constraint ACT_FK_EXE_PROCDEF foreign key (PROC_DEF_ID_)
  references AOS_WF_RE_PROCDEF (ID_);
alter table AOS_WF_RU_EXECUTION
  add constraint ACT_FK_EXE_PROCINST foreign key (PROC_INST_ID_)
  references AOS_WF_RU_EXECUTION (ID_);
alter table AOS_WF_RU_EXECUTION
  add constraint ACT_FK_EXE_SUPER foreign key (SUPER_EXEC_)
  references AOS_WF_RU_EXECUTION (ID_);
alter table AOS_WF_RU_EXECUTION
  add check (IS_ACTIVE_ IN (1,0));
alter table AOS_WF_RU_EXECUTION
  add check (IS_CONCURRENT_ IN (1,0));
alter table AOS_WF_RU_EXECUTION
  add check (IS_SCOPE_ IN (1,0));
alter table AOS_WF_RU_EXECUTION
  add check (IS_EVENT_SCOPE_ IN (1,0));

prompt
prompt Creating table AOS_WF_RU_EVENT_SUBSCR
prompt =====================================
prompt
create table AOS_WF_RU_EVENT_SUBSCR
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
create index ACT_IDX_EVENT_SUBSCR on AOS_WF_RU_EVENT_SUBSCR (EXECUTION_ID_);
create index ACT_IDX_EVENT_SUBSCR_CONFIG_ on AOS_WF_RU_EVENT_SUBSCR (CONFIGURATION_);
alter table AOS_WF_RU_EVENT_SUBSCR
  add primary key (ID_);
alter table AOS_WF_RU_EVENT_SUBSCR
  add constraint ACT_FK_EVENT_EXEC foreign key (EXECUTION_ID_)
  references AOS_WF_RU_EXECUTION (ID_);

prompt
prompt Creating table AOS_WF_RU_TASK
prompt =============================
prompt
create table AOS_WF_RU_TASK
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
create index ACT_IDX_TASK_CREATE on AOS_WF_RU_TASK (CREATE_TIME_);
create index ACT_IDX_TASK_EXEC on AOS_WF_RU_TASK (EXECUTION_ID_);
create index ACT_IDX_TASK_PROCDEF on AOS_WF_RU_TASK (PROC_DEF_ID_);
create index ACT_IDX_TASK_PROCINST on AOS_WF_RU_TASK (PROC_INST_ID_);
alter table AOS_WF_RU_TASK
  add primary key (ID_);
alter table AOS_WF_RU_TASK
  add constraint ACT_FK_TASK_EXE foreign key (EXECUTION_ID_)
  references AOS_WF_RU_EXECUTION (ID_);
alter table AOS_WF_RU_TASK
  add constraint ACT_FK_TASK_PROCDEF foreign key (PROC_DEF_ID_)
  references AOS_WF_RE_PROCDEF (ID_);
alter table AOS_WF_RU_TASK
  add constraint ACT_FK_TASK_PROCINST foreign key (PROC_INST_ID_)
  references AOS_WF_RU_EXECUTION (ID_);

prompt
prompt Creating table AOS_WF_RU_IDENTITYLINK
prompt =====================================
prompt
create table AOS_WF_RU_IDENTITYLINK
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
create index ACT_IDX_ATHRZ_PROCEDEF on AOS_WF_RU_IDENTITYLINK (PROC_DEF_ID_);
create index ACT_IDX_IDENT_LNK_GROUP on AOS_WF_RU_IDENTITYLINK (GROUP_ID_);
create index ACT_IDX_IDENT_LNK_USER on AOS_WF_RU_IDENTITYLINK (USER_ID_);
create index ACT_IDX_IDL_PROCINST on AOS_WF_RU_IDENTITYLINK (PROC_INST_ID_);
create index ACT_IDX_TSKASS_TASK on AOS_WF_RU_IDENTITYLINK (TASK_ID_);
alter table AOS_WF_RU_IDENTITYLINK
  add primary key (ID_);
alter table AOS_WF_RU_IDENTITYLINK
  add constraint ACT_FK_ATHRZ_PROCEDEF foreign key (PROC_DEF_ID_)
  references AOS_WF_RE_PROCDEF (ID_);
alter table AOS_WF_RU_IDENTITYLINK
  add constraint ACT_FK_IDL_PROCINST foreign key (PROC_INST_ID_)
  references AOS_WF_RU_EXECUTION (ID_);
alter table AOS_WF_RU_IDENTITYLINK
  add constraint ACT_FK_TSKASS_TASK foreign key (TASK_ID_)
  references AOS_WF_RU_TASK (ID_);

prompt
prompt Creating table AOS_WF_RU_JOB
prompt ============================
prompt
create table AOS_WF_RU_JOB
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
create index ACT_IDX_JOB_EXCEPTION on AOS_WF_RU_JOB (EXCEPTION_STACK_ID_);
alter table AOS_WF_RU_JOB
  add primary key (ID_);
alter table AOS_WF_RU_JOB
  add constraint ACT_FK_JOB_EXCEPTION foreign key (EXCEPTION_STACK_ID_)
  references AOS_WF_GE_BYTEARRAY (ID_);
alter table AOS_WF_RU_JOB
  add check (EXCLUSIVE_ IN (1,0));

prompt
prompt Creating table AOS_WF_RU_VARIABLE
prompt =================================
prompt
create table AOS_WF_RU_VARIABLE
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
create index ACT_IDX_VARIABLE_TASK_ID on AOS_WF_RU_VARIABLE (TASK_ID_);
create index ACT_IDX_VAR_BYTEARRAY on AOS_WF_RU_VARIABLE (BYTEARRAY_ID_);
create index ACT_IDX_VAR_EXE on AOS_WF_RU_VARIABLE (EXECUTION_ID_);
create index ACT_IDX_VAR_PROCINST on AOS_WF_RU_VARIABLE (PROC_INST_ID_);
alter table AOS_WF_RU_VARIABLE
  add primary key (ID_);
alter table AOS_WF_RU_VARIABLE
  add constraint ACT_FK_VAR_BYTEARRAY foreign key (BYTEARRAY_ID_)
  references AOS_WF_GE_BYTEARRAY (ID_);
alter table AOS_WF_RU_VARIABLE
  add constraint ACT_FK_VAR_EXE foreign key (EXECUTION_ID_)
  references AOS_WF_RU_EXECUTION (ID_);
alter table AOS_WF_RU_VARIABLE
  add constraint ACT_FK_VAR_PROCINST foreign key (PROC_INST_ID_)
  references AOS_WF_RU_EXECUTION (ID_);

prompt
prompt Creating sequence AOS_WF_EVT_LOG_SEQ
prompt ====================================
prompt
create sequence AOS_WF_EVT_LOG_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating procedure AOS_PROC_DEMO
prompt ================================
prompt
create or replace procedure aos_proc_demo(prm_name      IN VARCHAR2, --持卡人
                                          prm_number1   IN NUMBER, --信用额度
                                          prm_number2   IN NUMBER, --已消费额
                                          prm_outstring OUT VARCHAR2, --返回值
                                          prm_appcode   OUT NUMBER,
                                          prm_appmsg    OUT VARCHAR2) is
  n_balance_ NUMBER(10, 2);
begin
  prm_appcode   := 1; --成功请返回1。
  n_balance_    := prm_number1 - prm_number2;
  prm_outstring := '你好, ' || prm_name || '。' || '你的可用余额为：' || n_balance_ || '元。';
EXCEPTION
  WHEN OTHERS THEN
    prm_appcode := -1;
    prm_appmsg  := '出错：' || SQLERRM;
end aos_proc_demo;
/

prompt
prompt Creating procedure AOS_PROC_DEMO2
prompt =================================
prompt
create or replace procedure aos_proc_demo2(prm_name_ IN VARCHAR2, -- 模块名称
                                             prm_cur         OUT sys_refcursor, --结果集游标
                                             prm_appcode     OUT NUMBER,
                                             prm_appmsg      OUT VARCHAR2) is
begin
  prm_appcode := 1; --成功请返回1。
  open prm_cur for
    select id_, cascade_id_, name_, url_
      from aos_sys_module
     where name_ like '%' || prm_name_ || '%';
EXCEPTION
  WHEN OTHERS THEN
    prm_appcode  := -1;
    prm_appmsg := '出错：' || SQLERRM;
end aos_proc_demo2;
/


spool off

prompt PL/SQL Developer import file
prompt Created on 2016年2月17日 by XChun
set feedback off
set define off
prompt Loading AOS_LOG_SESSION...
insert into AOS_LOG_SESSION (id_, user_id_, account_, user_name_, ip_address_, client_type_, owner_, create_time_)
values ('37yzw6ztakzh1mc4rtxyv1mv8', 'fa04db9dd2f54d61b0c8202a25de2dc6', 'root', '超级用户', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36', 'XChun-PC:1690', to_date('16-02-2016 00:31:30', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 1 records loaded
prompt Loading AOS_SYS_CATALOG...
insert into AOS_SYS_CATALOG (id_, cascade_id_, root_key_, root_name_, name_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, sort_no_)
values ('38368661c53c40b6824869a0ccffad05', '0.002.001.001', 'DIC_TYPE', '词典分类科目', '工作流', null, '4018a2217b0542059a26ecf3f605d60f', '1', '0', 'folder6.png', 1);
insert into AOS_SYS_CATALOG (id_, cascade_id_, root_key_, root_name_, name_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, sort_no_)
values ('4018a2217b0542059a26ecf3f605d60f', '0.002.001', 'DIC_TYPE', '词典分类科目', '系统管理', null, '21d03054afdf43d69972cf6f7db6cfa3', '0', '1', 'folder22.png', 2);
insert into AOS_SYS_CATALOG (id_, cascade_id_, root_key_, root_name_, name_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, sort_no_)
values ('4018f65de18043c899b5e21ce7328df7', '0.001.002', 'PARAM_TYPE', '参数分类科目', '系统参数', null, 'cd14928a239b448b867c2e45246cd038', '0', '1', 'folder22.png', 1);
insert into AOS_SYS_CATALOG (id_, cascade_id_, root_key_, root_name_, name_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, sort_no_)
values ('4ee1d6e48b31487b849a72cd03d2512a', '0.001.001', 'PARAM_TYPE', '参数分类科目', '业务参数', null, 'cd14928a239b448b867c2e45246cd038', '1', '0', 'user20.png', 2);
insert into AOS_SYS_CATALOG (id_, cascade_id_, root_key_, root_name_, name_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, sort_no_)
values ('6f94ef4ac17d4d098f91f0a4579f8591', '0.001.002.001', 'PARAM_TYPE', '参数分类科目', '验证码', null, '4018f65de18043c899b5e21ce7328df7', '1', '0', 'ok3.png', 2);
insert into AOS_SYS_CATALOG (id_, cascade_id_, root_key_, root_name_, name_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, sort_no_)
values ('8d6c9869e8b2427cb16cf3f4777bf236', '0.002.007', 'DIC_TYPE', '词典分类科目', '范例', null, '21d03054afdf43d69972cf6f7db6cfa3', '1', '0', 'folder11.png', 10);
insert into AOS_SYS_CATALOG (id_, cascade_id_, root_key_, root_name_, name_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, sort_no_)
values ('a072411787f545edb7e7c3c23fa6c0ff', '0.001.002.004', 'PARAM_TYPE', '参数分类科目', '导航与菜单', null, '4018f65de18043c899b5e21ce7328df7', '1', '0', 'icon152.png', 3);
insert into AOS_SYS_CATALOG (id_, cascade_id_, root_key_, root_name_, name_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, sort_no_)
values ('aa3082ab67e24d8b884bc4504d3d9945', '0.002.002', 'DIC_TYPE', '词典分类科目', '全局通用', null, '21d03054afdf43d69972cf6f7db6cfa3', '1', '0', 'folder24.png', 3);
insert into AOS_SYS_CATALOG (id_, cascade_id_, root_key_, root_name_, name_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, sort_no_)
values ('c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', 'DIC_TYPE', '词典分类科目', '平台配置', null, '21d03054afdf43d69972cf6f7db6cfa3', '1', '0', 'folder2.png', 1);
insert into AOS_SYS_CATALOG (id_, cascade_id_, root_key_, root_name_, name_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, sort_no_)
values ('cd14928a239b448b867c2e45246cd038', '0.001', 'PARAM_TYPE', '参数分类科目', '参数分类', null, '0', '0', '0', 'book.png', 1);
insert into AOS_SYS_CATALOG (id_, cascade_id_, root_key_, root_name_, name_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, sort_no_)
values ('f22f39171b484d81a604d3eb50b33584', '0.001.002.002', 'PARAM_TYPE', '参数分类科目', '界面显示', null, '4018f65de18043c899b5e21ce7328df7', '1', '0', 'icon59.png', 1);
insert into AOS_SYS_CATALOG (id_, cascade_id_, root_key_, root_name_, name_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, sort_no_)
values ('01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', 'PARAM_TYPE', '参数分类科目', '其它', null, '4018f65de18043c899b5e21ce7328df7', '1', '0', 'icon150.png', 9);
insert into AOS_SYS_CATALOG (id_, cascade_id_, root_key_, root_name_, name_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, sort_no_)
values ('21d03054afdf43d69972cf6f7db6cfa3', '0.002', 'DIC_TYPE', '词典分类科目', '数据字典分类', null, '0', '0', '0', 'book.png', 2);
commit;
prompt 13 records loaded
prompt Loading AOS_SYS_DIC...
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('045e7dce267b4ef3b098ca00030220bf', '2', '金卡', null, '1', '2724924f1cdd48d1aa1a84cb7dd9b3ee', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('074c63e541174ed0b7c71588936ae453', '1', '平铺', null, '1', 'ffc94f2b7ad14c78b14c46f8fab17543', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('075a268cd7e14a728ca841e769b9d5a6', '1', '缺省', null, '1', '79004d064e954e55b832a8a9a4332576', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('0825b66058c14bc5bfacdba1fd055af4', '2', '浮动菜单', null, '1', 'a9fd5aa3b7654326902a94e70bccedd8', '欢迎页显示的Mac风格的浮动菜单');
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('0ccc4a6e3df246d8bbd3ccb1d29eb4c4', '0', '停用', null, '1', '10a113b1dd6d492dad27c8b0a0fb7efc', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('0ee3e8b931374725b213150b021507cc', 'catalog', 'aos', null, '1', '2d977e97aacf4781836bac9f5e88ad2b', '数据库名/实例名');
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('15f728ef5143444f9bfafa1c5c8a6a3b', '3', '隐藏', null, '1', '2794338c8b4946b99c361dae80da71b1', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('1722aa532c4044ac8087579feac85f7f', 'neptune', 'neptune.png', null, '1', 'e9e9cfc195514b05890a2249b81dfe73', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('17b249a462e7409baa99f36057fa79e7', '1', '是', null, '1', '91bc8a695b744b27ba66a94561fd6dbc', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('1915d507f36d4ae688267ebca838d39f', 'blue', '#3399FF', null, '1', '61fd319a23b04bd1bdbce7037002976a', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('1bb70ce5d6e649fd9179f3a3d35367f9', 'blue', 'left-logo.png', null, '1', 'fa8097dd670643f9a03722c4074ecba5', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('1c2ebffd1b48420999ff57e2ec325270', '3', '未知', null, '1', 'f59d8693d8cf4f10850914e09ae9b93c', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('1deee1b367ae4ccb81226a86eb7d9675', '1', '普卡', null, '1', '2724924f1cdd48d1aa1a84cb7dd9b3ee', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('1fb134407f364baf8b857235c7828059', '2', '停用', null, '1', '0744eedeaaa143afa499254866aa75c9', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('226489afb7ab4cf69107a78c60ed2267', 'PENDING', '代理中', null, '1', 'c66f06c069224241a4785e77d1406f9c', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('23910ad1f9684644b214ff99209e94d4', '3', '关联页面', null, '1', '38841cd4f85f4ffb8c07c74650a130dc', '主页面上跳转出去的页面');
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('23a410439cf7459799c286745b123293', '1', '激活', null, '1', '2c90ab6212f44b08a1d8ed527c72795f', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('24bca6d79bb14b5f97fbddbe5219705b', '1', '按钮|菜单下拉项', null, '1', '7d048854ccdc4eab996dcb703722065b', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('27689b76c3cf4168a7efb737806e9ed7', '2', '已结束', null, '1', 'a06eb2af650444db903c945030334b12', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('29462076b88f4facb86f7647c04119d0', '2', '子页面', null, '1', '38841cd4f85f4ffb8c07c74650a130dc', '在主页面上的子导航打开的页面(内嵌式的)');
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('2a5d03f79fd64c2090c9847d1b1484f0', '3', '待签收', null, '1', '48062fd856f14794b03ceba2a1d6b60e', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('2bd5fc7756d74fe59f5b9372fd83d03c', '4', '分割符', null, '1', '38841cd4f85f4ffb8c07c74650a130dc', '子页面生成的二级导航菜单的分割符标识');
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('2ce972620b1d484e880ae17113f4cf05', 'tight', '组合按钮', null, '1', 'a19ac2af964c4a6e8af9c6f1c0d2673f', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('2e2ef7ebcd5449a1a1b593f63ddb17ba', '3', '管理员封锁', null, '1', '0744eedeaaa143afa499254866aa75c9', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('2ef4d36610334dc6bc9bd153be594da2', '3', 'DBSequence', null, '1', '2a9ac1749d224bef924cd258bf35254a', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('2f9994a32b3e4afd96420c180155065a', '3', '矢量图标', null, '1', '21136c3dc660464d92fccd66408e149b', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('3058d4cd6c514d23a27eee77b140a349', 'aos', 'left-logo.png', null, '1', 'fa8097dd670643f9a03722c4074ecba5', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('338541a1b2094ea5a0e51ce81f9012de', 'port', '3306', null, '1', '2d977e97aacf4781836bac9f5e88ad2b', '数据库主机端口');
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('37a243f7cb96413386c3ea781051244e', '3', '工作组', null, '1', '58b28eade8604dffa7c531b7b42af2fa', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('37d2d28ac8104f6481997b640c5d4fd0', '4', '其它', null, '1', '58b28eade8604dffa7c531b7b42af2fa', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('3a4466b864744a0da3b93eec3f24dfff', 'blue', '天蓝', null, '1', '3ba3a682c2ac4d52982411dd045fae32', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('3c56f07c48b746698591068c308064a7', 'gray', '银灰', null, '1', '3ba3a682c2ac4d52982411dd045fae32', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('3f1b50a0f5be46a69597fca95c1e82d7', '2', '大图标[64X64]', null, '1', '21136c3dc660464d92fccd66408e149b', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('4113d10127a34b4fa88b2d6b118accf0', '0', '否', null, '1', '91bc8a695b744b27ba66a94561fd6dbc', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('462d4322dd6c408c8d2dfa1241c209f6', '2', '挂起', null, '1', '2c90ab6212f44b08a1d8ed527c72795f', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('4ae7b6f7d54a4236ba9b18a9e05d7fb4', '4', '容器组件(窗口|面板|树|表格|工具栏等)', null, '1', '7d048854ccdc4eab996dcb703722065b', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('4af1d58e374149f38c5ae9f76674a79f', 'aos', '#FAFAFA', null, '1', '61fd319a23b04bd1bdbce7037002976a', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('4c5816e8db1c4f0995fbeb7a1b840685', '1', '主页面', null, '1', '38841cd4f85f4ffb8c07c74650a130dc', '点击主导航菜单打开的页面');
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('569b3bab75734c628a9bb0b3fbcd8922', '2', '显示', null, '1', '2794338c8b4946b99c361dae80da71b1', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('58195ff7a3084df2a2dd5b401aa29a77', '0', '系统导航', null, '1', '4c2a12d3890a449fa91521a29a3c2436', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('58fc07abcfdc46478ad14fb9d95214f6', 'dataBaseType', 'mysql', null, '1', '2d977e97aacf4781836bac9f5e88ad2b', '可选值：mysql、oracle、microsoft sql server、postgresql。');
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('5a53887315f7450e96816c1a46dc5b5e', '2', '项目组', null, '1', '58b28eade8604dffa7c531b7b42af2fa', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('5c4196e15f47466ea19137666e455504', 'neptune', 'left-logo.png', null, '1', 'fa8097dd670643f9a03722c4074ecba5', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('5dd1c5a1610544b490af86cc826e3663', '2', '表格列', null, '1', '7d048854ccdc4eab996dcb703722065b', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('5de14be720b546ebb9676db86cdc5f6c', '2', '女', null, '1', 'f59d8693d8cf4f10850914e09ae9b93c', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('5dfc1a71df524cd68311a95e7176cab7', 'gray', '#BCB0B0', null, '1', '1ec5d3c945de40469595c85955196e76', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('6a05b8c8ce244c3f9b4872f812c689ec', '1', '经办权限', null, '1', 'dd9f74d16be14db5b0f6d79720c8f177', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('6c575847953847ceb7d4675e94d78547', 'aos', '#99bce8', null, '1', '1ec5d3c945de40469595c85955196e76', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('6e018ced3ae046de93d74630a97361a1', 'aos', '#006699', null, '1', '54e48c66b3ef4d99823ca8217a2abf43', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('735edf2e8a1242078141405d344d3c84', '1', '未授权', null, '1', '2794338c8b4946b99c361dae80da71b1', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('786d09295c904608868807b9e08238ee', 'neptune', '#c0c0c0', null, '1', '1ec5d3c945de40469595c85955196e76', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('7b6226ba4b6b404bab3cc520d5c1e6b5', 'neptune', '海王星(水蓝)', null, '1', '3ba3a682c2ac4d52982411dd045fae32', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('84552cfdf36f4fee92d81a49340495ca', 'blue', '#DFE8F6', null, '1', '3146aefcb39344cebe6e0a9baa7a4a48', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('84ee7e35ab134ec1acd2cfd28d3915f6', 'standalone', '独立按钮', null, '1', 'a19ac2af964c4a6e8af9c6f1c0d2673f', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('85f5017c1860434eacfceb519b8ad8cd', 'blue', 'blue.png', null, '1', 'e9e9cfc195514b05890a2249b81dfe73', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('867c0aacba654feea60c22c5e4be9368', 'aos', 'red', null, '1', '3146aefcb39344cebe6e0a9baa7a4a48', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('871d7ac8ec704614a15d29f540b8b439', 'true', '显示', null, '1', '33a73af4b729448b91c13acf4d0a31e1', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('87923302cb424da9aa55b6a9ce77090b', '7', '激活', null, '1', '2794338c8b4946b99c361dae80da71b1', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('89f8ab9369a64de09a8207829f520297', 'gray', 'gray.png', null, '1', 'e9e9cfc195514b05890a2249b81dfe73', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('8b536d0c9a2e4e80b1edf91190b98253', '5', '编辑', null, '1', '2794338c8b4946b99c361dae80da71b1', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('8da661446e6d4e9cb49d2eb5ab225cd0', '2', '树状', null, '1', 'ffc94f2b7ad14c78b14c46f8fab17543', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('8e42e7df7bd044b89c7a5d5b59b44b18', '1', '男', null, '1', 'f59d8693d8cf4f10850914e09ae9b93c', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('92dfd82860a0474da735575e9b91f6de', 'classic', '经典主题', null, '1', 'a44dd9bbf55041368882e88821309355', '上Banner-左导航-中经办。');
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('958235d21e2f4d44babd8ae7da7dd7f8', '99', '撤消授权', null, '1', '2794338c8b4946b99c361dae80da71b1', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('99419e3ea3d64507aa507854fd210a75', '3', '表单元素(输入框|下拉框|选择框等)', null, '1', '7d048854ccdc4eab996dcb703722065b', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('9d1c5da19d0b4ad9b97b570ed4481bf2', 'false', '隐藏', null, '1', '33a73af4b729448b91c13acf4d0a31e1', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('9eb462a5fd0547b9898540b6e5a4ca98', 'gray', 'left-logo.png', null, '1', 'fa8097dd670643f9a03722c4074ecba5', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('a603159d47b94145a32b51f659b47c09', '4', '系统封锁', null, '1', '0744eedeaaa143afa499254866aa75c9', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('a63ab46c45b048b1a0d727c5f0d69f58', '3', '导入离线文件', null, '1', '483fb2ff35e84a42974e914851fae01a', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('a871329cbeb343bea48a467e05e066f5', '2', '在线克隆', null, '1', '483fb2ff35e84a42974e914851fae01a', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('a97934b734a94d70a71353bc78e572df', 'neptune', '#FAFAFA', null, '1', '61fd319a23b04bd1bdbce7037002976a', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('a9bef6122ad7444999ce17b4ad5a0628', '2', '发现', null, '1', '4c2a12d3890a449fa91521a29a3c2436', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('ac8049fc0ded42b09a3654ef547ac772', '1', '小图标[16X16]', null, '1', '21136c3dc660464d92fccd66408e149b', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('b18435d1752a4a8c96628402298c0493', 'gray', '#555555', null, '1', '61fd319a23b04bd1bdbce7037002976a', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('b1d95ea28e084b64b0f6a473e65fe2fd', 'aos', 'AOS', null, '0', '3ba3a682c2ac4d52982411dd045fae32', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('b5bdcaeeccd44ad9aceae1968fbe0851', 'userName', 'root', null, '1', '2d977e97aacf4781836bac9f5e88ad2b', '数据库用户名');
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('b85f79702d094f348e1c9e79e67d95b7', '1', '待办', null, '1', '48062fd856f14794b03ceba2a1d6b60e', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('ba5b0493f0544278a980e0f268baf83c', '1', '快捷菜单', null, '1', '4c2a12d3890a449fa91521a29a3c2436', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('040e1d4d8a914145884553f170e1bcfd', '1', '缺省', null, '1', 'cfcbc48fd8ad42678a52334bac8aa299', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('040fbde5cca746e7a90a9f888c033897', '4', '只读', null, '1', '2794338c8b4946b99c361dae80da71b1', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('c172686bc21e40efacca63c5b7e1c9d3', 'blue', '#99bce8', null, '1', '1ec5d3c945de40469595c85955196e76', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('c1c92ade06b94969b2b066184845781c', '6', '禁用', null, '1', '2794338c8b4946b99c361dae80da71b1', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('c20e301598954f0ab33445680ca1db27', 'gray', '#F0F0F0', null, '1', '3146aefcb39344cebe6e0a9baa7a4a48', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('c38ebb4d102440babfde6f6f8fbf5d00', '2', '办结', null, '1', '48062fd856f14794b03ceba2a1d6b60e', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('c3e008a5ba864e21b5a66230e389926c', '1', '行政部门', null, '1', '58b28eade8604dffa7c531b7b42af2fa', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('cc53b6f6235f413db559f4a7e7ba88e6', '1', '运行中', null, '1', 'a06eb2af650444db903c945030334b12', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('cc8d6e844c3c46e0bfc973ef51dcb4a3', 'neptune', '#D0DDF2', null, '1', '3146aefcb39344cebe6e0a9baa7a4a48', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('cd08dff488454293bc8aa8224eb719cb', 'password', '111111', null, '1', '2d977e97aacf4781836bac9f5e88ad2b', '数据库用户密码');
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('cde729266d09465ca624939dc05e6b4d', '2', 'UUID', null, '1', '2a9ac1749d224bef924cd258bf35254a', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('ce49529f302f446d8e6e4576578ad459', '3', '注册用户', null, '1', '0475e71c145f49acbe781b2e7310ab64', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('d93b044fec9941cd87ec8260fab2c9b9', 'gray', '#888888', null, '1', '54e48c66b3ef4d99823ca8217a2abf43', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('e81beb66246441228ba1bb17190db222', '2', '管理权限', null, '1', 'dd9f74d16be14db5b0f6d79720c8f177', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('ebe726f2cfa2434dbb7f943f6f42c3ad', '2', '超级用户', null, '1', '0475e71c145f49acbe781b2e7310ab64', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('f08565c1fd7444bcb24645e52335a1e1', '1', '快捷菜单', null, '1', 'a9fd5aa3b7654326902a94e70bccedd8', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('f1f754ae30d54e2895c32050ff4c1d3d', 'aos', 'aos.png', null, '1', 'e9e9cfc195514b05890a2249b81dfe73', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('f4108659f1f8461db381c2808b82e038', '1', '启用', null, '1', '10a113b1dd6d492dad27c8b0a0fb7efc', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('f5d18126770d42a4a6b922c3b67ed161', '1', '在线设计', null, '1', '483fb2ff35e84a42974e914851fae01a', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('f624177f00ba4f15a60a8188856b5425', '1', 'APPID', null, '1', '2a9ac1749d224bef924cd258bf35254a', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('f7b6f63fc5de469aaf90986188037516', 'neptune', '#006699', null, '1', '54e48c66b3ef4d99823ca8217a2abf43', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('f97e6ea7f6fe4f6e8b7fde75f0074e2c', '1', '缺省', null, '1', '0475e71c145f49acbe781b2e7310ab64', null);
commit;
prompt 100 records committed...
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('fac86f6625cb47fc8c1a4bab41dc1af4', 'ip', '127.0.0.1', null, '1', '2d977e97aacf4781836bac9f5e88ad2b', '数据库主机IP');
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('fedcb0e622734060a19a3d9b98e96f71', '4', '导入离线文本', null, '1', '483fb2ff35e84a42974e914851fae01a', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('bbef93ea807847029e98ed7023b47c6a', '1', '正常', null, '1', '0744eedeaaa143afa499254866aa75c9', null);
insert into AOS_SYS_DIC (id_, code_, desc_, hotkey_, status_, dic_index_id_, remark_)
values ('bc17f4f03f0d415c97a026e8ec5a999d', 'blue', '#6699CC', null, '1', '54e48c66b3ef4d99823ca8217a2abf43', null);
commit;
prompt 104 records loaded
prompt Loading AOS_SYS_DIC_INDEX...
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('10a113b1dd6d492dad27c8b0a0fb7efc', 'enabled_', '使能状态', null, 'aa3082ab67e24d8b884bc4504d3d9945', '0.002.002', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('1ec5d3c945de40469595c85955196e76', 'cmp_border_color_', '组件边框颜色', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('21136c3dc660464d92fccd66408e149b', 'icon_type_', '图标类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('2724924f1cdd48d1aa1a84cb7dd9b3ee', 'card_type_', '信用卡类型', null, '8d6c9869e8b2427cb16cf3f4777bf236', '0.002.007', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('2794338c8b4946b99c361dae80da71b1', 'cmp_grant_type_', '界面元素授权类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('2a9ac1749d224bef924cd258bf35254a', 'sequence_type_', 'ID类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('2c90ab6212f44b08a1d8ed527c72795f', 'procdef_suspension_state_', '流程定义活动状态', null, '38368661c53c40b6824869a0ccffad05', '0.002.001.001', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('2d977e97aacf4781836bac9f5e88ad2b', 'webide_jdbc', 'WebIDE模块使用的JDBC连接', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', 'WebIDE模块使用的JDBC连接。');
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('3146aefcb39344cebe6e0a9baa7a4a48', 'south_back_color_', '主页面south区域背景颜色', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('33a73af4b729448b91c13acf4d0a31e1', 'is_show_top_nav_', '是否显示顶部导航条', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', '是否显示水平导航条。(只有在导航模式为1的情况，此设置才有效,导航模式为2，则水平导航条不会消失)。可选值：true| false。');
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('38841cd4f85f4ffb8c07c74650a130dc', 'page_type_', '页面类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('3ba3a682c2ac4d52982411dd045fae32', 'skin_', '界面皮肤', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('48062fd856f14794b03ceba2a1d6b60e', 'proctask_status_', '任务状态', null, '38368661c53c40b6824869a0ccffad05', '0.002.001.001', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('483fb2ff35e84a42974e914851fae01a', 'create_type_', '流程模型创建方式', null, '38368661c53c40b6824869a0ccffad05', '0.002.001.001', '业务流程模型创建方式');
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('4c2a12d3890a449fa91521a29a3c2436', 'nav_tab_index_', '导航缺省活动页', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('54e48c66b3ef4d99823ca8217a2abf43', 'main_text_color_', '边界区域字体主颜色', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('58b28eade8604dffa7c531b7b42af2fa', 'org_type_', '组织类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('61fd319a23b04bd1bdbce7037002976a', 'nav_text_color_', '导航文字颜色', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('79004d064e954e55b832a8a9a4332576', 'post_type_', '岗位类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('7d048854ccdc4eab996dcb703722065b', 'page_el_type_', '页面元素类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('91bc8a695b744b27ba66a94561fd6dbc', 'bool_', '是否布尔值字典', null, 'aa3082ab67e24d8b884bc4504d3d9945', '0.002.002', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('a06eb2af650444db903c945030334b12', 'procinst_status_', '流程实例状态', null, '38368661c53c40b6824869a0ccffad05', '0.002.001.001', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('a19ac2af964c4a6e8af9c6f1c0d2673f', 'navbar_btn_style_', '顶部导航条按钮风格', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('a44dd9bbf55041368882e88821309355', 'theme_', '系统主题', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('a9fd5aa3b7654326902a94e70bccedd8', 'module_user_nav_type', '导航菜单类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('c66f06c069224241a4785e77d1406f9c', 'delegation_', '委派状态', null, '38368661c53c40b6824869a0ccffad05', '0.002.001.001', '流程任务的委派代理状态');
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('cfcbc48fd8ad42678a52334bac8aa299', 'role_type_', '角色类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('dd9f74d16be14db5b0f6d79720c8f177', 'grant_type_', '权限类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('e9e9cfc195514b05890a2249b81dfe73', 'north_back_img_', '主页面north区域背景图片', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('f59d8693d8cf4f10850914e09ae9b93c', 'sex_', '性别', null, 'aa3082ab67e24d8b884bc4504d3d9945', '0.002.002', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('fa8097dd670643f9a03722c4074ecba5', 'left_logo_', 'Banner左边logo图标', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('ffc94f2b7ad14c78b14c46f8fab17543', 'nav_quick_layout_', '快捷菜单布局风格', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', '快捷菜单布局风格。');
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('0475e71c145f49acbe781b2e7310ab64', 'user_type_', '用户类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
insert into AOS_SYS_DIC_INDEX (id_, key_, name_, hotkey_, catalog_id_, catalog_cascade_id_, remark_)
values ('0744eedeaaa143afa499254866aa75c9', 'user_status_', '用户状态', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
commit;
prompt 34 records loaded
prompt Loading AOS_SYS_ICON...
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2904', '10.png', '2');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('2905', '11.png', '2');
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
values ('10047', 'add.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10048', 'add2.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10049', 'against.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10050', 'agree.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10051', 'app_columns.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10052', 'app_list.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10053', 'bars.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10054', 'basket.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10055', 'book.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10056', 'book_user.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10057', 'bug.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10058', 'bullet_black.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10059', 'bullet_blue.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10060', 'bullet_green.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10061', 'bullet_group.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10062', 'bullet_group2.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10063', 'bullet_group3.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10064', 'bullet_group4.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10065', 'bullet_purple.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10066', 'bullet_red.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10067', 'bullet_yellow.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10068', 'chart_curve.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10069', 'chart_flipped.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10070', 'chart_line.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10071', 'chart_pie.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10072', 'close.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10073', 'close2.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10074', 'config.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10075', 'config1.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10076', 'config3.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10077', 'connect.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10078', 'copy.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10079', 'cut.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10080', 'cv.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10081', 'c_key.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10082', 'database.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10083', 'database_add.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10084', 'del.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10085', 'del1.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10086', 'del2.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10087', 'del_folder.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10088', 'del_page.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10089', 'detail.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10090', 'disconnect.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10091', 'doc_ok.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10092', 'down.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10093', 'down_left.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10094', 'down_right.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10095', 'edit.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10096', 'edit2.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10097', 'email.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10098', 'email2.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10099', 'email3.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10100', 'email_go.png', '1');
commit;
prompt 100 records committed...
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10101', 'email_open.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('827', 'fa-adjust', '3');
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
values ('10102', 'filter.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10103', 'folder1.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10104', 'folder10.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10105', 'folder11.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10106', 'folder12.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10107', 'folder13.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10108', 'folder14.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10109', 'folder15.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10110', 'folder16.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10111', 'folder17.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10112', 'folder18.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10113', 'folder19.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10114', 'folder2.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10115', 'folder20.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10116', 'folder21.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10117', 'folder22.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10118', 'folder23.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10119', 'folder24.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10120', 'folder25.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10121', 'folder26.png', '1');
commit;
prompt 600 records committed...
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10122', 'folder27.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10123', 'folder28.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10124', 'folder4.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10125', 'folder5.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10126', 'folder6.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10127', 'folder7.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10128', 'folder8.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10129', 'folder9.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10130', 'forward.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10131', 'freelance.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10132', 'go.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10133', 'go.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10134', 'go1.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10135', 'go1.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10136', 'help.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10137', 'home.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10138', 'home.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10139', 'icon134.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10140', 'icon137.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10141', 'icon140.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10142', 'icon141.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10143', 'icon146.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10144', 'icon15.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10145', 'icon150.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10146', 'icon152.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10147', 'icon153.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10148', 'icon154.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10149', 'icon17.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10150', 'icon25.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10151', 'icon26.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10152', 'icon31.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10153', 'icon32.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10154', 'icon34.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10155', 'icon35.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10156', 'icon36.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10157', 'icon37.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10158', 'icon38.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10159', 'icon39.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10160', 'icon41.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10161', 'icon42.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10162', 'icon5.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10163', 'icon56.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10164', 'icon59.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10165', 'icon63.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10166', 'icon65.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10167', 'icon66.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10168', 'icon67.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10169', 'icon68.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10170', 'icon7.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10171', 'icon70.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10172', 'icon71.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10173', 'icon72.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10174', 'icon75.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10175', 'icon76.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10176', 'icon77.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10177', 'icon78.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10178', 'icon79.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10179', 'icon8.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10180', 'icon80.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10181', 'icon82.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10182', 'icon85.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10183', 'icon86.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10184', 'icon88.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10185', 'icon9.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10186', 'icon96.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10187', 'icon_19.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10188', 'icq.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10189', 'id.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10190', 'ins.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10191', 'jar.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10192', 'key.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10193', 'layout.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10194', 'layout2.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10195', 'left.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10196', 'lightbulb.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10197', 'lock.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10198', 'lock3.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10199', 'modules_wizard.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10200', 'monitor.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10201', 'node.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10202', 'ok.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10203', 'ok1.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10204', 'ok3.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10205', 'ok4.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10206', 'ok5.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10207', 'org.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10208', 'org2.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10209', 'outs.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10210', 'own.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10211', 'page.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10212', 'page2.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10213', 'page3.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10214', 'page_code.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10215', 'page_font.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10216', 'page_next.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10217', 'page_office.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10218', 'page_paint.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10219', 'page_picture.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10220', 'page_vector.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10221', 'paint2.png', '1');
commit;
prompt 700 records committed...
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10222', 'paste.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10223', 'picture.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10224', 'pictures.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10225', 'picture_empty.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10226', 'plugin.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10227', 'plugin2.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10228', 'printer.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10229', 'query.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10230', 'redo.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10231', 'refresh.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10232', 'refresh2.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10233', 'right.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10234', 'save.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10235', 'save_all.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10236', 'search.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10237', 'security.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10238', 'send_receive.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10239', 'shape_align_bottom.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10240', 'shape_align_center.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10241', 'shape_align_middle.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10242', 'shape_group.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10243', 'shape_handles.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10244', 'shape_move_back.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10245', 'share.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10246', 'sitemap.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10247', 'sql.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10248', 'sql2.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10249', 'sql3.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10250', 'stop.gif', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10251', 'stop2.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10252', 'stop3.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10253', 'system.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10254', 'table.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10255', 'table2.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10256', 'tables.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10257', 'tables_relation.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10258', 'table_edit.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10259', 'tag.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10260', 'task.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10261', 'task1.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10262', 'task_finish.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10263', 'task_list.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10264', 'terminal.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10265', 'textfield.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10266', 'text_cap.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10267', 'text_col.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10268', 'text_list.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10269', 'text_upper.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10270', 'theme.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10271', 'time.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10272', 'timeline.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10273', 'undo.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10274', 'up.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10275', 'up2.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10276', 'up_left.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10277', 'up_right.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10278', 'user1.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10279', 'user20.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10280', 'user3.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10281', 'user6.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10282', 'user8.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10283', 'vcard.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10284', 'vector.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10285', 'wand.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10286', 'webcam.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10287', 'zoom_in.png', '1');
insert into AOS_SYS_ICON (id_, name_, type_)
values ('10288', 'zoom_out.png', '1');
commit;
prompt 767 records loaded
prompt Loading AOS_SYS_MODULE...
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('0b99e9d118b54ee084d9e74bd72cdd1c', '0.001.002', '资源管理', null, null, '7a6d3674e5204937951d01544e18e3aa', '0', '1', 'folder14.png', '1', '系统管理', null, 20);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('1886bf699ec74f79959bdc8ca8e5371a', '0.001.006.004', '会话监控', 'system/sessionLog/init.jhtml', null, '5b9a439743f141729f46a07e8e222a47', '1', '0', 'c_key.png', '1', '监控与审计', null, 10);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('1906d5a892654e2bb882851e0ea7322f', '0.001.008.001', '图标', 'system/icon/init.jhtml', null, '524e5f5c3e5b4cdb90611cd8b15ca684', '1', '0', 'page_picture.png', '1', '开发工具箱', null, 60);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('1cf1947152174cacaf226fa54ca51351', '0.004.002.001.009', '表单校验', 'demo/initFormValidate.jhtml', null, 'f73a952eefa2406c9327da6252c4ca79', '1', '0', null, '1', '表单', null, 8);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('25406890354f4514909e2ad1c0fd678d', '0.004.002.003.001', '表格①', 'demo/grid/initGrid1.jhtml', null, 'dbf75990cf784e79920caf7eb47856f6', '1', '0', null, '1', '表格', null, 10);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('266bbec9e0af4612afa5139aade0a511', '0.004.002.001.006', '组合选择框', 'demo/initFormComboBox.jhtml', null, 'f73a952eefa2406c9327da6252c4ca79', '1', '0', null, '1', '表单', null, 30);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('2790bf6cc0b54c36b56c90429c112ab2', '0.001.008.005', 'WebIDE', 'system/coder/init.jhtml', null, '524e5f5c3e5b4cdb90611cd8b15ca684', '1', '0', 'icon15.png', '1', '开发工具箱', null, 5);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('29873ca569fb46c3bbd951a8a1df2472', '0.002', '项目导航', null, null, '2a4c060f44d944ea926fe44522ce7b39', '0', '1', 'folder2.png', '1', 'AOS应用基础平台', 'fa-github-alt', 20);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('2a4c060f44d944ea926fe44522ce7b39', '0', 'AOS应用基础平台', null, null, 'p', '0', '1', 'home.png', '1', 'root', null, 1);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('327677ef8d2a4e5caf3c4cbc9b72d0b0', '0.004.002.003.004', '客户端分页表格', 'demo/grid/initGrid3.jhtml', null, 'dbf75990cf784e79920caf7eb47856f6', '1', '0', null, '1', '表格', null, 40);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('33baf8c9948b47cfa54cd8d7a5e1753d', '0.004.003', '综合实例', null, null, '6e10c86d1885434e80e6dfa0953e307d', '0', '1', null, '1', '范例', null, 20);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('38e28fce49414c4c9e95d032559d5bee', '0.004.002.002', '按钮', 'demo/initButton.jhtml', null, '6cab8b013c314b37aec7c4567d859fc8', '1', '0', null, '1', 'AOS UI组件库', null, 10);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('3bb16fa3935c41bebe4d3fcf3c4ebd5c', '0.004.004', '杂项', null, null, '6e10c86d1885434e80e6dfa0953e307d', '0', '0', null, '1', '范例', null, 15);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('4d3cfce7b9b146d2bc8482ec477517aa', '0.002.001', '首选项', 'system/preference/init.jhtml', null, '29873ca569fb46c3bbd951a8a1df2472', '1', '0', 'config1.png', '1', '项目导航', null, 10);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('524e5f5c3e5b4cdb90611cd8b15ca684', '0.001.008', '开发工具箱', null, null, '7a6d3674e5204937951d01544e18e3aa', '0', '0', 'folder9.png', '1', '系统管理', 'fa-bug', 70);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('591f2ffa62a1461887c1d6f02c60a1ff', '0.004.004.002', '消息通知窗口', 'demo/initNotification.jhtml', null, '3bb16fa3935c41bebe4d3fcf3c4ebd5c', '1', '0', null, '1', '杂项', null, 2);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('5ae41d35d16247febabf631a81a0d70d', '0.004.002.001.008', '表单数据交互', 'demo/initFormData.jhtml', null, 'f73a952eefa2406c9327da6252c4ca79', '1', '0', null, '1', '表单', null, 40);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('5b9a439743f141729f46a07e8e222a47', '0.001.006', '监控与审计', null, null, '7a6d3674e5204937951d01544e18e3aa', '0', '0', 'folder27.png', '1', '系统管理', null, 60);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('5fb994e71cb14a77891670990d7f554d', '0.001.001', '基础数据', null, null, '7a6d3674e5204937951d01544e18e3aa', '0', '1', 'folder2.png', '1', '系统管理', null, 10);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('619cb338b278406f8368471034d5946f', '0.001.004.006', '任务节点', 'workflow/procTask/init.jhtml', null, 'cfc4e4bd367047a29e0d72e688f860a2', '1', '0', 'task_list.png', '1', '业务流程管理', null, 40);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('65320b914c18453f9ca0a84d3f8a0a7b', '0.001.003.001', '组织架构', 'system/org/init.jhtml', null, 'b656d6afbbe844d0a6626d0eb590643f', '1', '0', 'icon56.png', '1', '组织与权限', null, 1);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('68822bfa39914373afe70dc343c84e94', '0.004.002.001.005', '常用表单元素', 'demo/initFormElements.jhtml', null, 'f73a952eefa2406c9327da6252c4ca79', '1', '0', null, '1', '表单', null, 10);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('6cab8b013c314b37aec7c4567d859fc8', '0.004.002', 'AOS UI组件库', null, null, '6e10c86d1885434e80e6dfa0953e307d', '0', '1', null, '1', '范例', null, 10);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('6e10c86d1885434e80e6dfa0953e307d', '0.004', '范例', null, null, '2a4c060f44d944ea926fe44522ce7b39', '0', '1', 'folder27.png', '1', 'AOS应用基础平台', 'fa-coffee', 40);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('704d4e51ffcf473fa95ab9e680177d46', '0.004.002.003.002', '表格②', 'demo/grid/initGrid2.jhtml', null, 'dbf75990cf784e79920caf7eb47856f6', '1', '0', null, '1', '表格', null, 20);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('715f6cf8d2ce4fa694baf2259327f6b1', '0.001.003.002', '岗位与授权', 'system/post/init.jhtml', null, 'b656d6afbbe844d0a6626d0eb590643f', '1', '0', 'icon137.png', '1', '组织与权限', null, 3);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('73b69ca49e2240ba8717fc13acb884c2', '0.004.002.001.001', '表单布局①', 'demo/initForm1.jhtml', null, 'f73a952eefa2406c9327da6252c4ca79', '1', '0', null, '1', '表单', null, 1);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('7a6d3674e5204937951d01544e18e3aa', '0.001', '系统管理', null, null, '2a4c060f44d944ea926fe44522ce7b39', '0', '1', 'folder22.png', '1', 'AOS应用基础平台', 'fa-cogs', 10);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('81fc0e05049e467d976ec523182421f2', '0.001.002.004', '序列号', 'system/idMgr/init.jhtml', null, '0b99e9d118b54ee084d9e74bd72cdd1c', '1', '0', 'id.png', '1', '资源管理', null, 30);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('870c482cdb2e4c8aa373dcf447964284', '0.004.002.003.003', '可编辑表格', 'demo/grid/initEditGrid.jhtml', null, 'dbf75990cf784e79920caf7eb47856f6', '1', '0', null, '1', '表格', null, 30);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('88bc371429ce4243a49c5893ae036f6a', '0.004.002.004', '报表', null, null, '6cab8b013c314b37aec7c4567d859fc8', '0', '0', null, '1', 'AOS UI组件库', null, 40);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('97c8a95d0aa84d7cba2a8b536ba5326a', '0.004.002.001.002', '表单布局②', 'demo/initForm2.jhtml', null, 'f73a952eefa2406c9327da6252c4ca79', '1', '0', null, '1', '表单', null, 2);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('9a8e5cedcd514af2b37cf5828f509f94', '0.001.001.003', '分类科目', 'system/catalog/init.jhtml', null, '5fb994e71cb14a77891670990d7f554d', '1', '0', 'icon146.png', '1', '基础数据', null, 20);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('9e4cf77815dd49fbac4158c62af3197a', '0.001.001.001', '键值参数', 'system/param/init.jhtml', null, '5fb994e71cb14a77891670990d7f554d', '1', '0', 'icon79.png', '1', '基础数据', null, 1);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('a21b52d911bb44c2978e52bbc523de51', '0.001.004.002', '流程部署', 'workflow/procDeploy/init.jhtml', null, 'cfc4e4bd367047a29e0d72e688f860a2', '1', '0', 'modules_wizard.gif', '1', '业务流程管理', null, 10);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('a27532c1cc8948e5b9bd7d8ac2e30a42', '0.004.002.006.001', '布局①', null, null, 'f84a495bca10403ebe8351d4737dfc72', '1', '0', null, '1', '容器布局', null, 1);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('a4d2ef333e35476680786df9a89e200b', '0.004.002.004.001', '报表①', 'demo/report/initReport1.jhtml', null, '88bc371429ce4243a49c5893ae036f6a', '1', '0', null, '1', '报表', null, 1);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('b656d6afbbe844d0a6626d0eb590643f', '0.001.003', '组织与权限', null, null, '7a6d3674e5204937951d01544e18e3aa', '0', '1', 'folder23.png', '1', '系统管理', null, 30);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('ba90369eb83540bab4d9492bc17f0937', '0.001.004.005', '流程实例', 'workflow/procInst/init.jhtml', null, 'cfc4e4bd367047a29e0d72e688f860a2', '1', '0', 'icon5.png', '1', '业务流程管理', null, 30);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('bc3c9877c598404da7e31355a4deebad', '0.001.008.002', 'WebSQL', 'system/webSql/init.jhtml', null, '524e5f5c3e5b4cdb90611cd8b15ca684', '1', '0', 'sql.png', '1', '开发工具箱', null, 10);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('bf530e26480d43b08dd20e31e31274af', '0.001.003.006', '角色与授权', 'system/role/init.jhtml', null, 'b656d6afbbe844d0a6626d0eb590643f', '1', '0', 'icon134.png', '1', '组织与权限', null, 5);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('cfc4e4bd367047a29e0d72e688f860a2', '0.001.004', '业务流程管理', null, null, '7a6d3674e5204937951d01544e18e3aa', '0', '1', 'folder24.png', '1', '系统管理', null, 40);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('d452524058ff42cfb9e5146dacd0cd79', '0.001.006.002', '操作日志', null, null, '5b9a439743f141729f46a07e8e222a47', '1', '0', 'user20.png', '1', '监控与审计', null, 20);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('dbf75990cf784e79920caf7eb47856f6', '0.004.002.003', '表格', null, null, '6cab8b013c314b37aec7c4567d859fc8', '0', '1', null, '1', 'AOS UI组件库', null, 30);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('e3e403f7b94247c7827d8f280f06b64d', '0.004.002.001.003', '表单布局③', 'demo/initForm3.jhtml', null, 'f73a952eefa2406c9327da6252c4ca79', '1', '0', null, '1', '表单', null, 3);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('e7bb35f24a634a759cef64d28411901f', '0.004.004.001', '存储过程调用', 'demo/procedure/init.jhtml', null, '3bb16fa3935c41bebe4d3fcf3c4ebd5c', '1', '0', null, '1', '杂项', null, 10);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('e9de0eacf61a4aa6b1ed0c210fc209fe', '0.004.004.003', '页面组件复用', 'demo/initShare.jhtml', null, '3bb16fa3935c41bebe4d3fcf3c4ebd5c', '1', '0', null, '1', '杂项', null, 20);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('f107450058a2438eb6ad9bf6a4d7e967', '0.001.001.002', '字典参数', 'system/dictionary/init.jhtml', null, '5fb994e71cb14a77891670990d7f554d', '1', '0', 'icon154.png', '1', '基础数据', null, 10);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('f405a849f27d4ddebf7f8a2dfbf30bea', '0.001.002.001', '功能模块', 'system/module/init.jhtml', null, '0b99e9d118b54ee084d9e74bd72cdd1c', '1', '0', 'icon75.png', '1', '资源管理', null, 10);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('f73a952eefa2406c9327da6252c4ca79', '0.004.002.001', '表单', null, null, '6cab8b013c314b37aec7c4567d859fc8', '0', '0', null, '1', 'AOS UI组件库', null, 20);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('078df89c7b5b478cb38fd607805c6155', '0.004.002.001.007', '常用表单元素API', 'demo/initFormApi.jhtml', null, 'f73a952eefa2406c9327da6252c4ca79', '1', '0', null, '1', '表单', null, 20);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('09b24aac059f4ba58bfb30652636b543', '0.004.003.001', '综合实例①', 'demo/layout/initLayout1.jhtml', null, '33baf8c9948b47cfa54cd8d7a5e1753d', '1', '0', null, '1', '综合实例', null, 10);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('fd88d0de59024e4db81ead8510b6bd98', '0.001.002.003', '页面组件', 'system/page/init.jhtml', null, '0b99e9d118b54ee084d9e74bd72cdd1c', '1', '0', 'icon59.png', '1', '资源管理', null, 20);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('f81608054a714b60adb0b1ed574c6b6c', '0.001.003.003', '用户与授权', 'system/user/init.jhtml', null, 'b656d6afbbe844d0a6626d0eb590643f', '1', '0', 'user6.png', '1', '组织与权限', null, 4);
insert into AOS_SYS_MODULE (id_, cascade_id_, name_, url_, hotkey_, parent_id_, is_leaf_, is_auto_expand_, icon_name_, status_, parent_name_, vector_, sort_no_)
values ('f84a495bca10403ebe8351d4737dfc72', '0.004.002.006', '容器布局', null, null, '6cab8b013c314b37aec7c4567d859fc8', '0', '0', null, '1', 'AOS UI组件库', null, 35);
commit;
prompt 55 records loaded
prompt Loading AOS_SYS_MODULE_POST...
insert into AOS_SYS_MODULE_POST (id_, post_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('01e6f6f7fe924b8d89a846c2dfc7a05f', '60cb0e6359ea46a19a841adc46cf66cf', '715f6cf8d2ce4fa694baf2259327f6b1', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_POST (id_, post_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('0e95a8527f37467fa0246abbc9de4d95', '60cb0e6359ea46a19a841adc46cf66cf', 'ba90369eb83540bab4d9492bc17f0937', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_POST (id_, post_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('30cea10ca6bb4628abc80116cf748be5', '60cb0e6359ea46a19a841adc46cf66cf', 'b656d6afbbe844d0a6626d0eb590643f', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_POST (id_, post_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('30f6dae98d964d3ca62017bf09d8bb40', '60cb0e6359ea46a19a841adc46cf66cf', 'bc3c9877c598404da7e31355a4deebad', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_POST (id_, post_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('324b0d0319084a6a9f9bc2c9c61d384e', '60cb0e6359ea46a19a841adc46cf66cf', '1906d5a892654e2bb882851e0ea7322f', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_POST (id_, post_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('51d9d42511274b7c995eaaf1705f9179', '60cb0e6359ea46a19a841adc46cf66cf', '5b9a439743f141729f46a07e8e222a47', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_POST (id_, post_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('5d2a3a46566f433f8ea44c6c795d162d', '60cb0e6359ea46a19a841adc46cf66cf', '81fc0e05049e467d976ec523182421f2', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_POST (id_, post_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('5d9616a615814d3fb4a07300bce4156a', '60cb0e6359ea46a19a841adc46cf66cf', 'fd88d0de59024e4db81ead8510b6bd98', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_POST (id_, post_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('65bf789caf3648d1a8653b142a9e130a', '60cb0e6359ea46a19a841adc46cf66cf', 'f405a849f27d4ddebf7f8a2dfbf30bea', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_POST (id_, post_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('69063560c4374ab483bbe9ced3229420', '60cb0e6359ea46a19a841adc46cf66cf', '9a8e5cedcd514af2b37cf5828f509f94', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_POST (id_, post_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('6c6f89adb49f4c7eacd83cf17196222f', '60cb0e6359ea46a19a841adc46cf66cf', 'f107450058a2438eb6ad9bf6a4d7e967', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_POST (id_, post_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('7e48d55cede7414fb68dd14490e9a46f', '60cb0e6359ea46a19a841adc46cf66cf', 'd452524058ff42cfb9e5146dacd0cd79', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_POST (id_, post_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('8c0b0aa02b14460b825b14b40cfe3ffc', '60cb0e6359ea46a19a841adc46cf66cf', '0b99e9d118b54ee084d9e74bd72cdd1c', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_POST (id_, post_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('90c0cc96bc7f4ba39b7fa3983b33e405', '60cb0e6359ea46a19a841adc46cf66cf', '1886bf699ec74f79959bdc8ca8e5371a', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_POST (id_, post_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('91003499b9f24bc58988395b591d7243', '60cb0e6359ea46a19a841adc46cf66cf', 'a21b52d911bb44c2978e52bbc523de51', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_POST (id_, post_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('a193381281004ea38a889c5c2eb5a0b8', '60cb0e6359ea46a19a841adc46cf66cf', '9e4cf77815dd49fbac4158c62af3197a', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_POST (id_, post_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('b9cb4fe117904e9b9619ab3cc539fb36', '60cb0e6359ea46a19a841adc46cf66cf', '65320b914c18453f9ca0a84d3f8a0a7b', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_POST (id_, post_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('bb44d1afa45c46ad8a8534594c759a46', '60cb0e6359ea46a19a841adc46cf66cf', '2a4c060f44d944ea926fe44522ce7b39', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_POST (id_, post_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('c3574201434947fe80c393907b96fd16', '60cb0e6359ea46a19a841adc46cf66cf', 'bf530e26480d43b08dd20e31e31274af', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_POST (id_, post_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('caa084c048fa4fecb581680c06879e58', '60cb0e6359ea46a19a841adc46cf66cf', '7a6d3674e5204937951d01544e18e3aa', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_POST (id_, post_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('d5e18c1411344768808c275c10b66e73', '60cb0e6359ea46a19a841adc46cf66cf', 'cfc4e4bd367047a29e0d72e688f860a2', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_POST (id_, post_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('dec716f33f094267801fefc5e183b57c', '60cb0e6359ea46a19a841adc46cf66cf', '5fb994e71cb14a77891670990d7f554d', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_POST (id_, post_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('eaf6119a463a47c3bd8343a99593f736', '60cb0e6359ea46a19a841adc46cf66cf', '524e5f5c3e5b4cdb90611cd8b15ca684', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_POST (id_, post_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('f39c2c58db8a40db9f330c8d5fac608a', '60cb0e6359ea46a19a841adc46cf66cf', 'f81608054a714b60adb0b1ed574c6b6c', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_POST (id_, post_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('f3e97c7d8a0f4cb29ba68fe5a6f00e09', '60cb0e6359ea46a19a841adc46cf66cf', '619cb338b278406f8368471034d5946f', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_POST (id_, post_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('f97e552d5e0c4fcc965d70866c259d50', '60cb0e6359ea46a19a841adc46cf66cf', '2790bf6cc0b54c36b56c90429c112ab2', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
commit;
prompt 26 records loaded
prompt Loading AOS_SYS_MODULE_ROLE...
insert into AOS_SYS_MODULE_ROLE (id_, role_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('1939747179be463fb49c9c94c15cb5ae', '84f923b5e334498494eda38d8e86ef80', 'bf530e26480d43b08dd20e31e31274af', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_ROLE (id_, role_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('3e5cbb7d49d94be7b6a2a37c5553a041', '84f923b5e334498494eda38d8e86ef80', 'fd88d0de59024e4db81ead8510b6bd98', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_ROLE (id_, role_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('4697b53bc7e04d7cb2267d44e4f9b438', '84f923b5e334498494eda38d8e86ef80', '0b99e9d118b54ee084d9e74bd72cdd1c', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_ROLE (id_, role_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('0b48f8f5677d4b4186e30d3434105847', '84f923b5e334498494eda38d8e86ef80', 'cfc4e4bd367047a29e0d72e688f860a2', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_ROLE (id_, role_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('1186e6575fac43fe98640eca6e3c03b6', '84f923b5e334498494eda38d8e86ef80', '5fb994e71cb14a77891670990d7f554d', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_ROLE (id_, role_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('5785a83aea394a1b9d5a66c85a377f2f', '84f923b5e334498494eda38d8e86ef80', '1906d5a892654e2bb882851e0ea7322f', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_ROLE (id_, role_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('5b864436a0004966b711e75e05cabb47', '84f923b5e334498494eda38d8e86ef80', 'ba90369eb83540bab4d9492bc17f0937', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_ROLE (id_, role_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('682b98882cd6488287e6863caa31ade4', '84f923b5e334498494eda38d8e86ef80', 'f107450058a2438eb6ad9bf6a4d7e967', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_ROLE (id_, role_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('6f12960924884a56b49d3374fe1d0484', '84f923b5e334498494eda38d8e86ef80', '715f6cf8d2ce4fa694baf2259327f6b1', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_ROLE (id_, role_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('700d87c2b3fc4e668a90bff6534993c4', '84f923b5e334498494eda38d8e86ef80', '2a4c060f44d944ea926fe44522ce7b39', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_ROLE (id_, role_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('7c6fe595d4ba4bcb840952a6b8818e87', '84f923b5e334498494eda38d8e86ef80', '5b9a439743f141729f46a07e8e222a47', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_ROLE (id_, role_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('814a381cf6284a42a9ef6ba4c4cf5390', '84f923b5e334498494eda38d8e86ef80', '9e4cf77815dd49fbac4158c62af3197a', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_ROLE (id_, role_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('9fc58fccb59d4ef4add0bea95bde2f34', '84f923b5e334498494eda38d8e86ef80', 'f405a849f27d4ddebf7f8a2dfbf30bea', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_ROLE (id_, role_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('a6fd89e9cd1b425491fd905d1ffacac8', '84f923b5e334498494eda38d8e86ef80', 'd452524058ff42cfb9e5146dacd0cd79', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_ROLE (id_, role_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('a776b3fb9e944c0a89593a17cf9e8677', '84f923b5e334498494eda38d8e86ef80', '81fc0e05049e467d976ec523182421f2', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_ROLE (id_, role_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('a864a8846d35415cb881f1f466b51e8d', '84f923b5e334498494eda38d8e86ef80', 'bc3c9877c598404da7e31355a4deebad', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_ROLE (id_, role_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('b651fbaebbdf47ad9867aca4a39afb22', '84f923b5e334498494eda38d8e86ef80', '2790bf6cc0b54c36b56c90429c112ab2', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_ROLE (id_, role_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('bc209a1defea47778a271b50f5c326b1', '84f923b5e334498494eda38d8e86ef80', '65320b914c18453f9ca0a84d3f8a0a7b', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_ROLE (id_, role_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('bdf5f465e79a4dedb51fab2745c2ccc3', '84f923b5e334498494eda38d8e86ef80', 'a21b52d911bb44c2978e52bbc523de51', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_ROLE (id_, role_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('c797efc13e314e43b08837cfc268cea9', '84f923b5e334498494eda38d8e86ef80', 'f81608054a714b60adb0b1ed574c6b6c', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_ROLE (id_, role_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('c9407844cb9d4ec5b4df195cbee00ab0', '84f923b5e334498494eda38d8e86ef80', '7a6d3674e5204937951d01544e18e3aa', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_ROLE (id_, role_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('caf19432391e46c8894455b9bd908a11', '84f923b5e334498494eda38d8e86ef80', '1886bf699ec74f79959bdc8ca8e5371a', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_ROLE (id_, role_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('d22696d414434088bd8f6b47a9953f01', '84f923b5e334498494eda38d8e86ef80', '524e5f5c3e5b4cdb90611cd8b15ca684', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_ROLE (id_, role_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('e70d4684d4bd489a93e44a2505cfb15c', '84f923b5e334498494eda38d8e86ef80', 'b656d6afbbe844d0a6626d0eb590643f', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_ROLE (id_, role_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('e753111f16e443758e74637066dd845b', '84f923b5e334498494eda38d8e86ef80', '9a8e5cedcd514af2b37cf5828f509f94', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
insert into AOS_SYS_MODULE_ROLE (id_, role_id_, module_id_, grant_type_, operate_time_, operator_id_)
values ('ecec404ec2a5449aafa701c3ca50cb2b', '84f923b5e334498494eda38d8e86ef80', '619cb338b278406f8368471034d5946f', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
commit;
prompt 26 records loaded
prompt Loading AOS_SYS_MODULE_USER...
prompt Table is empty
prompt Loading AOS_SYS_MODULE_USER_NAV...
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('13e7e53c880a4eaebfdfc111ff0f234a', 'f405a849f27d4ddebf7f8a2dfbf30bea', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('1771642b67a24ebc8925d05f9d6f0a99', 'bf530e26480d43b08dd20e31e31274af', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('27496d1c07fb4de69e8ec80ca9d9b1b4', 'f81608054a714b60adb0b1ed574c6b6c', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('27a1acfe21c54302bacef830362e9201', '1906d5a892654e2bb882851e0ea7322f', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('3037dcb30d544c129c38c0ec0512f152', '65320b914c18453f9ca0a84d3f8a0a7b', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('35cdbcbf1d164430ae5f870d9ca9c798', '5fb994e71cb14a77891670990d7f554d', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('3e95a408ab4842a896fe28e22263770e', '2790bf6cc0b54c36b56c90429c112ab2', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('4f6389bf9bbc41a785bafd3167d1c83f', 'b656d6afbbe844d0a6626d0eb590643f', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('50f22340f1244e969e0150c5cb709d89', '9a8e5cedcd514af2b37cf5828f509f94', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('5205631b91ad4abb877f9bf376401137', '0b99e9d118b54ee084d9e74bd72cdd1c', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('6e2c4f1bbc794acbbbf30dd82b82e548', 'cfc4e4bd367047a29e0d72e688f860a2', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('7c34dd645a584cf7bc01f49c491e4a6d', '7a6d3674e5204937951d01544e18e3aa', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('87a378d1f1654e70a673e2492cf4b280', 'fd88d0de59024e4db81ead8510b6bd98', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('91fd66009c774778bb8fe43afff6fc1a', '619cb338b278406f8368471034d5946f', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('ab00d2b56d3c4e4a95c234b1624be55e', '81fc0e05049e467d976ec523182421f2', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('d70a61cc8117438b8fa1d04df9b69ed1', '524e5f5c3e5b4cdb90611cd8b15ca684', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('dcd3e9606ecb47d9970f6e25b538ca46', '9e4cf77815dd49fbac4158c62af3197a', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('e09214ed6b5a4d9ea822d22b8290d459', 'f107450058a2438eb6ad9bf6a4d7e967', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('e1620cfebcc54f9b964c4ce4faf51ea0', 'a21b52d911bb44c2978e52bbc523de51', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('e855c201b896442d8099d815b0ae15f4', 'd452524058ff42cfb9e5146dacd0cd79', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('f0072ce1b6884ae8af69d4b10c008e85', '5b9a439743f141729f46a07e8e222a47', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('f3f0dfc36d7d440385ed86e33ee40fd9', '2a4c060f44d944ea926fe44522ce7b39', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('f9651f4622c14612a9eb510eae8ef4e9', 'ba90369eb83540bab4d9492bc17f0937', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('fdbdb721c58740ecb54f7e047bdbacdc', 'bc3c9877c598404da7e31355a4deebad', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('0105d9c95caf420aa5bd544d83e87c77', '1886bf699ec74f79959bdc8ca8e5371a', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
insert into AOS_SYS_MODULE_USER_NAV (id_, module_id_, user_id_, nav_icon_, type_, sort_no_)
values ('0ce2d5658fb64a4797ff75d9f459ef32', '715f6cf8d2ce4fa694baf2259327f6b1', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
commit;
prompt 26 records loaded
prompt Loading AOS_SYS_ORG...
insert into AOS_SYS_ORG (id_, cascade_id_, name_, hotkey_, parent_id_, pareant_name_, is_leaf_, is_auto_expand_, icon_name_, status_, type_, biz_code_, custom_code_, create_time_, creater_id_, sort_no_)
values ('0965ef0ffd294a838f53012e3ef9bfd0', '0.006.001', '上海分行', null, 'bd48c11cfd6f48e196c5fa399c410329', '投资银行部', '1', '0', null, '1', '1', null, null, '2016-02-01 23:56:02', 'fa04db9dd2f54d61b0c8202a25de2dc6', 1);
insert into AOS_SYS_ORG (id_, cascade_id_, name_, hotkey_, parent_id_, pareant_name_, is_leaf_, is_auto_expand_, icon_name_, status_, type_, biz_code_, custom_code_, create_time_, creater_id_, sort_no_)
values ('1e1441c6be2b4ffdb3f73759cb1e207b', '0.002', '会计结算部', null, '63cf387a243d4d9799367d773b853346', '中国嘉靖银行', '1', '0', null, '1', '1', null, null, '2016-02-01 23:53:10', 'fa04db9dd2f54d61b0c8202a25de2dc6', 10);
insert into AOS_SYS_ORG (id_, cascade_id_, name_, hotkey_, parent_id_, pareant_name_, is_leaf_, is_auto_expand_, icon_name_, status_, type_, biz_code_, custom_code_, create_time_, creater_id_, sort_no_)
values ('4be918af97ee491aa71378d065a8c7f7', '0.006.002', '昆明分行', null, 'bd48c11cfd6f48e196c5fa399c410329', '投资银行部', '1', '0', null, '1', '1', null, null, '2016-02-01 23:56:15', 'fa04db9dd2f54d61b0c8202a25de2dc6', 10);
insert into AOS_SYS_ORG (id_, cascade_id_, name_, hotkey_, parent_id_, pareant_name_, is_leaf_, is_auto_expand_, icon_name_, status_, type_, biz_code_, custom_code_, create_time_, creater_id_, sort_no_)
values ('63cf387a243d4d9799367d773b853346', '0', '中国嘉靖银行', null, 'p', 'root', '0', '1', 'home.png', '1', '1', null, null, '2012-01-01 12:12:12', 'fa04db9dd2f54d61b0c8202a25de2dc6', 0);
insert into AOS_SYS_ORG (id_, cascade_id_, name_, hotkey_, parent_id_, pareant_name_, is_leaf_, is_auto_expand_, icon_name_, status_, type_, biz_code_, custom_code_, create_time_, creater_id_, sort_no_)
values ('b2fa97f8bed34eee86201f01fa786ed4', '0.001', '信息技术部', null, '63cf387a243d4d9799367d773b853346', '中国嘉靖银行', '1', '0', null, '1', '1', null, null, '2016-02-01 20:53:34', 'fa04db9dd2f54d61b0c8202a25de2dc6', 1);
insert into AOS_SYS_ORG (id_, cascade_id_, name_, hotkey_, parent_id_, pareant_name_, is_leaf_, is_auto_expand_, icon_name_, status_, type_, biz_code_, custom_code_, create_time_, creater_id_, sort_no_)
values ('bd48c11cfd6f48e196c5fa399c410329', '0.006', '投资银行部', null, '63cf387a243d4d9799367d773b853346', '中国嘉靖银行', '0', '1', null, '1', '1', null, null, '2016-02-01 23:55:46', 'fa04db9dd2f54d61b0c8202a25de2dc6', 50);
insert into AOS_SYS_ORG (id_, cascade_id_, name_, hotkey_, parent_id_, pareant_name_, is_leaf_, is_auto_expand_, icon_name_, status_, type_, biz_code_, custom_code_, create_time_, creater_id_, sort_no_)
values ('d4392c4faf024a7e8a2c2607d77ab2fa', '0.005', '合规管理部', null, '63cf387a243d4d9799367d773b853346', '中国嘉靖银行', '1', '0', null, '1', '1', null, null, '2016-02-01 23:54:44', 'fa04db9dd2f54d61b0c8202a25de2dc6', 40);
insert into AOS_SYS_ORG (id_, cascade_id_, name_, hotkey_, parent_id_, pareant_name_, is_leaf_, is_auto_expand_, icon_name_, status_, type_, biz_code_, custom_code_, create_time_, creater_id_, sort_no_)
values ('e8b6092436054f5893b49ade58635105', '0.004', '风险管理部', null, '63cf387a243d4d9799367d773b853346', '中国嘉靖银行', '1', '0', null, '1', '1', null, null, '2016-02-01 23:53:58', 'fa04db9dd2f54d61b0c8202a25de2dc6', 30);
commit;
prompt 8 records loaded
prompt Loading AOS_SYS_PAGE...
insert into AOS_SYS_PAGE (id_, module_id_, name_, url_, type_, enabled_, is_default_, icon_, icon_big_, vector_, sort_no_)
values ('bcb82c68976d4527a8f1c8bdbb8b4a04', '1906d5a892654e2bb882851e0ea7322f', '矢量图标', 'initIconList.jhtml?type_=3', '2', '1', '0', 'vector.png', null, null, 4);
insert into AOS_SYS_PAGE (id_, module_id_, name_, url_, type_, enabled_, is_default_, icon_, icon_big_, vector_, sort_no_)
values ('c47935773e9443dd9a6ceecb69982ac2', '4d3cfce7b9b146d2bc8482ec477517aa', '我的快捷菜单', 'initMyNav.jhtml', '2', '1', '0', 'org.png', null, null, 4);
insert into AOS_SYS_PAGE (id_, module_id_, name_, url_, type_, enabled_, is_default_, icon_, icon_big_, vector_, sort_no_)
values ('c8548f73784d42989363712729a320e0', '1906d5a892654e2bb882851e0ea7322f', '分隔符', null, '4', '1', '0', null, null, null, 3);
insert into AOS_SYS_PAGE (id_, module_id_, name_, url_, type_, enabled_, is_default_, icon_, icon_big_, vector_, sort_no_)
values ('cacc4fcdc5454f1ebab63b00e4bf56cc', '4d3cfce7b9b146d2bc8482ec477517aa', '我的个人设置', 'initMyInfo.jhtml', '2', '1', '1', 'icon_19.png', null, null, 1);
insert into AOS_SYS_PAGE (id_, module_id_, name_, url_, type_, enabled_, is_default_, icon_, icon_big_, vector_, sort_no_)
values ('d45aefac856942d484441481cd142212', '4d3cfce7b9b146d2bc8482ec477517aa', '我的操作日志', null, '2', '1', '0', 'icon75.png', null, null, 6);
insert into AOS_SYS_PAGE (id_, module_id_, name_, url_, type_, enabled_, is_default_, icon_, icon_big_, vector_, sort_no_)
values ('dd3d77605b824ca18357222128aebc5b', '4d3cfce7b9b146d2bc8482ec477517aa', '分割符', null, '4', '1', '0', null, null, null, 5);
insert into AOS_SYS_PAGE (id_, module_id_, name_, url_, type_, enabled_, is_default_, icon_, icon_big_, vector_, sort_no_)
values ('19041a2cb7264838b48288ce9b0b8e80', '1906d5a892654e2bb882851e0ea7322f', '大图标[64X64]', 'initIconList.jhtml?type_=2', '2', '1', '0', 'picture.png', null, null, 2);
insert into AOS_SYS_PAGE (id_, module_id_, name_, url_, type_, enabled_, is_default_, icon_, icon_big_, vector_, sort_no_)
values ('9e30077a6bb043cc8db8c8d4b5fa5c91', '1906d5a892654e2bb882851e0ea7322f', '小图标[16X16]', 'initIconList.jhtml?type_=1', '2', '1', '1', 'pictures.png', null, null, 1);
commit;
prompt 8 records loaded
prompt Loading AOS_SYS_PAGE_EL...
prompt Table is empty
prompt Loading AOS_SYS_PAGE_EL_GRANT...
prompt Table is empty
prompt Loading AOS_SYS_PARAM...
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('1bd1c0a5849d4a30b3f1eb2761b2865d', 'show_login_win_head_', 'true', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '是否显示登录窗口标题栏', '0', null, '是否显示登录窗口标题栏(Ext登录风格)。缺省值：false。可选值：true|false。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('1cc1a1bee27f44389e7e64a89d9ccc76', 'msgtarget_', 'qtip', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '表单校验消息提示方式', '0', null, '可选值必须是下列值之一 (1)、qtip 当用户鼠标悬停在该域之上时显示包含了消息的迅速提示。(2)、title 显示消息以浏览器默认的title属性弹出。 (3)、under 在域下方添加一块包含了错误消息的div。(4)、side 添加一个错误图标在域的右边，鼠标悬停上面时弹出显示消息。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('1f2adf3aa726447e9728a3f67b718b41', 'vercode_show_', '1', '6f94ef4ac17d4d098f91f0a4579f8591', '0.001.002.001', '验证码开关', '0', null, '是否在登录页面显示验证码及后台验证码验证。可选值：0(否) | 1(是)。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('2e45751d623f48389e12bfb7c3891597', 'treenode_cursor_', 'pointer', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '树节点鼠标光标样式', '0', null, '缺省值：pointer。可选值：任何符合Css的cursor属性定义的值。default | pointer | auto等。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('376a372433634af4b6d2d558f1959f5b', 'role_grant_mode_', '1', '01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', '角色授权模式', '0', null, '角色授权模式(角色可见度)。可选值：1|2。1：可见当前管理员创建的角色和当前管理员所属组织的其他管理员创建的角色。2：可见当前管理员创建的角色和当前管理员所属组织及其下级子孙组织的其他管理员创建的角色。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('3ff54d336e57461d8cd708a8bad8bc36', 'combobox_emptytext', '请选择...', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '下拉选择框的缺省提示信息', '0', null, null);
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('43fb125bed224cbbaf2390df1041c3b0', 'dev_account_', 'root', '01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', '开发者登录帐号', '0', null, '登录页面开发者按钮登录帐号。可以配置为任何一个存在的帐号。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('47bd798e93314882af7244ba1ae9fbc8', 'vercode_characters_', 'abcdetx2345678', '6f94ef4ac17d4d098f91f0a4579f8591', '0.001.002.001', '验证码待选字符集', '0', null, '验证码待选字符集。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('53267cbf8e9f4fc490798054fbe85c7e', 'copyright_', '2008-2015 OSWorks', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '版权信息', '0', null, '版权信息');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('58099059c3004213ae0977d4ed5551f5', 'prevent_rightclick_', 'false', '01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', '全局右键', '0', null, '阻止浏览器缺省鼠标右键事件。可选值：true|false。缺省值：true。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('6032c7e953994a718f6072c956906538', 'app_title_', 'AOS : JavaEE应用基础平台', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '首页浏览器标题内容', '0', null, '首页浏览器标题内容');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('714d370fa7f54b01ae9a006806c60135', 'is_show_top_nav_', 'true', 'a072411787f545edb7e7c3c23fa6c0ff', '0.001.002.004', '水平导航条', '1', 'is_show_top_nav_', '是否显示水平导航条。(只有在导航模式为1的情况，此设置才有效,导航模式为2，则水平导航条不会消失)。可选值：true| false。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('7290d8299cba41dc9e23323a0db22a95', 'json_format', '1', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', 'JSON输出模式', '0', null, ' json输出模式。0：格式化输出模式；1：压缩模式。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('74d65234606c4f448eb06d6a07a6c138', 'user_head_catalog_id_', '613', '01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', '用户头像流文件分类ID', '0', null, '用户头像流文件分类ID，分类科目中的用户头像分类ID。用户上传文件时使用。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('757f555c0d734539baa70e8a1788cc62', 'is_show_statusbar_', 'true', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '是否显示主界面状态栏', '0', null, '是否显示主界面状态栏。可选值：true|false。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('7882ac5560ef4a04993279dfc24b6f23', 'user_obj_del_mode_', 'update', '01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', '用户对象删除模式', '0', null, '物理删除：delete；逻辑删除：update。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('7bc3899d2fc24e4b804e6f763c3d6b36', 'dev_account_login_', '1', '01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', '开发者登录帐号开关', '0', null, '是否启用开发者登录帐号功能,如启用则在登录界面会出现[开发者]按钮。可选值：1 | 0。提示：系统若在生产模式下运行，则此配置忽略，自动关闭开发者登录功能。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('7e4d320f454843739f40476dcbcdc91a', 'run_mode_', '0', '01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', '运行模式', '0', null, '0：开发模式；1：生产模式；2：在线体验模式');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('873c2cb1dde54b308211e8a2bc6edbb5', 'theme_', 'classic', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '系统主题风格', '1', 'theme_', '可选值：classic。缺省值：classic。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('9cb03933f61e4c68a58e50873ac38fbd', 'page_load_msg_', '正在拼命加载页面, 请稍等...', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '页面加载等待提示信息', '0', null, null);
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('a19b559ab8804f5887867df4151ad631', 'page_size_', '50', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '分页大小', '0', null, '缺省的分页大小。JSP页面的属性设置会覆盖这个配置。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('a1ad9c90f524467180bceecd1f02b8b8', 'nav_mode_', '1', 'a072411787f545edb7e7c3c23fa6c0ff', '0.001.002.004', '导航模式', '1', 'nav_mode_', '可选值，1：水平导航按钮和垂直导航的卡片属于统一层级；2：水平导航按钮和垂直导航的卡片有上下级级联导航关系。(当前模式2未实现)');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('a843396066db4e77a7b9ed7ae4cdda37', 'login_page_', 'login.ext.jsp', '01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', '登录页面', '0', null, 'Ext原生风格的登录界面');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('ad9cb685144c4e36b19b31e53190221a', 'skin_', 'blue', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '系统缺省皮肤', '1', 'skin_', '可选值：blue|gray|neptune|aos。缺省值：blue。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('b07b8e2cc1284d14b9e680a5cac0722a', 'app_name_', 'AOS : JavaEE应用基础平台', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '应用系统名称', '0', null, '应用系统名称');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('be82f58309a24ee397d3a24631e48405', 'vercode_length_', '4', '6f94ef4ac17d4d098f91f0a4579f8591', '0.001.002.001', '验证码长度', '0', null, '验证码长度');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('bf26e19236654718a6aa369f3e4b4bf7', 'coder_project_rootpath_', '0', '01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', '代码生成器使用的工程根目录', '0', null, '代码生成器的工程跟目录。如果为0则自动获取。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('c744b99660c74302b7a3ae5834a7b6eb', 'grid_column_algin_', 'left', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '表格列内容对齐方式', '0', null, '表格列对齐模式。有效值：left|center|right。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('d2a8d045aa7e44ef93f0735a4c486bc6', 'nav_tab_index_', '0', 'a072411787f545edb7e7c3c23fa6c0ff', '0.001.002.004', '导航缺省活动页', '1', 'nav_tab_index_', '左侧布局的导航卡片缺省激活的卡片索引号，索引下标从0开始。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('d3b33d5dee5b46738f9525b8977d7673', 'login_back_img_', '-1', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '登录页面的背景图片', '0', null, '登录页面的背景图片。可选的预设背景图片为：0.jpg、1.jpg、2.jpg。如果需要随机出现背景，则将其设置为-1。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('eeb66260a2c141b2a0bb06bb41d7803b', 'navbar_btn_style_', 'tight', 'a072411787f545edb7e7c3c23fa6c0ff', '0.001.002.004', '导航条按钮风格', '1', 'navbar_btn_style_', '顶部水平导航条的按钮样式风格。tight：组合按钮；standalone：独立按钮。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('f18649a182a946a693b36f817374cb1c', 'welcome_page_title_', '欢迎', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '欢迎页标题', '0', null, '系统登录后第一个缺省打开的Tab页面的标题。缺省："欢迎"。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('fcf73fa9129649a08ebb41e1ec8b5340', 'layout_', 'tab', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', 'Center区域布局风格', '1', 'layout_', '系统业务经办区域(center)布局风格。可选值：tab|page。缺省值：tab。tab：支持同时打开多个功能模块界面；page：当前只能打开1个功能界面。');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('fdd95913b7e54e3ca6be9557484159f5', 'tab_focus_color_', '#0099FF', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', 'Tab高亮颜色', '1', 'tab_focus_color_', '缺省的当前Tab卡片高亮提示颜色');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('0dabca413781404b9cbfaae3881fc5a6', 'app_ico', '/static/icon/ico/aos2.ico', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '应用系统小图标', '0', null, '浏览器标题栏左上角显示');
insert into AOS_SYS_PARAM (id_, key_, value_, catalog_id_, catalog_cascade_id_, name_, is_overwrite_, overwrite_field_, remark_)
values ('19ad8d57d72b4ecf98ad133ebb6492bd', 'page_load_gif_', 'wheel.gif', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '页面刷新动画文件', '0', null, '页面刷新动画文件。可选的预设动画文件：run.gif、wheel.gif。动画path：/static/image/gif/pageload。');
commit;
prompt 36 records loaded
prompt Loading AOS_SYS_POST...
insert into AOS_SYS_POST (id_, name_, status_, type_, org_id_, create_time_, creater_id_, org_cascade_id_)
values ('60cb0e6359ea46a19a841adc46cf66cf', '研发岗位', '1', '1', 'b2fa97f8bed34eee86201f01fa786ed4', '2016-02-02 21:54:59', 'fa04db9dd2f54d61b0c8202a25de2dc6', '0.001');
commit;
prompt 1 records loaded
prompt Loading AOS_SYS_ROLE...
insert into AOS_SYS_ROLE (id_, name_, status_, type_, create_time_, creater_id_, creater_org_id_, creater_org_cascade_id_)
values ('84f923b5e334498494eda38d8e86ef80', '研发角色', '1', '1', '2016-02-02 21:56:20', 'fa04db9dd2f54d61b0c8202a25de2dc6', '63cf387a243d4d9799367d773b853346', '0');
commit;
prompt 1 records loaded
prompt Loading AOS_SYS_SEQUENCE...
insert into AOS_SYS_SEQUENCE (id_, name_, type_, prefix_, start_, step_, cur_value_, status_, connector_, suffix_, db_seq_name_, max_value_, is_circul_, min_value_, is_leftpad_, format_value_, remark_)
values ('7487db32b061465da1af721e84e9942a', 'GUUID', '2', null, '1', '1', 'd7123d2c8af04dafab5d37d6d03937bb', '1', null, null, null, '9223372036854775807', '0', '1', '0', 'd7123d2c8af04dafab5d37d6d03937bb', '通用UUID。');
insert into AOS_SYS_SEQUENCE (id_, name_, type_, prefix_, start_, step_, cur_value_, status_, connector_, suffix_, db_seq_name_, max_value_, is_circul_, min_value_, is_leftpad_, format_value_, remark_)
values ('2abfc360e8a74e21bcda37113269fca0', 'DEMOID', '1', null, '1', '1', '6637', '1', null, null, null, '9223372036854775807', '0', '1', '0', '6637', '演示模块相关功能使用的ID发生器');
insert into AOS_SYS_SEQUENCE (id_, name_, type_, prefix_, start_, step_, cur_value_, status_, connector_, suffix_, db_seq_name_, max_value_, is_circul_, min_value_, is_leftpad_, format_value_, remark_)
values ('40b37118cebf431283415862d355c72c', 'CARDID', '1', null, '1', '1', '10004005', '1', null, null, null, '99999999', '0', '10000000', '0', '10004005', '范例系统卡号');
commit;
prompt 3 records loaded
prompt Loading AOS_SYS_USER...
insert into AOS_SYS_USER (id_, account_, password_, name_, sex_, org_id_, status_, type_, biz_code_, create_time_, creater_id_, org_cascade_id_, delete_flag_)
values ('fa04db9dd2f54d61b0c8202a25de2dc6', 'root', 'gnRD3IiRP6s=', '超级用户', '1', '63cf387a243d4d9799367d773b853346', '1', '2', null, '2014-09-27 22:12:56', 'fa04db9dd2f54d61b0c8202a25de2dc6', '0', '0');
insert into AOS_SYS_USER (id_, account_, password_, name_, sex_, org_id_, status_, type_, biz_code_, create_time_, creater_id_, org_cascade_id_, delete_flag_)
values ('fe24c4ac34444902a2129ec1debf9ed4', 'caocao', 'gnRD3IiRP6s=', '曹操', '3', 'b2fa97f8bed34eee86201f01fa786ed4', '1', '1', null, '2016-02-02 21:55:57', 'fa04db9dd2f54d61b0c8202a25de2dc6', '0.001', '0');
commit;
prompt 2 records loaded
prompt Loading AOS_SYS_USER_CFG...
insert into AOS_SYS_USER_CFG (id_, theme_, skin_, layout_, nav_mode_, is_show_top_nav_, navbar_btn_style_, tab_focus_color_, is_show_mac_nav_, nav_tab_index_, nav_quick_layout_)
values ('fa04db9dd2f54d61b0c8202a25de2dc6', 'classic', 'blue', null, null, 'true', 'tight', '#0099FF', null, '0', null);
insert into AOS_SYS_USER_CFG (id_, theme_, skin_, layout_, nav_mode_, is_show_top_nav_, navbar_btn_style_, tab_focus_color_, is_show_mac_nav_, nav_tab_index_, nav_quick_layout_)
values ('fe24c4ac34444902a2129ec1debf9ed4', 'classic', 'blue', null, null, 'true', 'tight', '#0099FF', null, '0', null);
commit;
prompt 2 records loaded
prompt Loading AOS_SYS_USER_EXT...
insert into AOS_SYS_USER_EXT (id_, email_, fixed_phone_, mobile_phone_, address_, zip_, birthday_, idno_, qq_, dynamic_field_, bytearray_id_, remark_, filed1_, filed2_, filed3_)
values ('fa04db9dd2f54d61b0c8202a25de2dc6', '307916217@qq.com', null, '186188188188', null, null, null, null, '307916217', null, null, '超级用户拥有系统最高权限。', null, null, null);
insert into AOS_SYS_USER_EXT (id_, email_, fixed_phone_, mobile_phone_, address_, zip_, birthday_, idno_, qq_, dynamic_field_, bytearray_id_, remark_, filed1_, filed2_, filed3_)
values ('fe24c4ac34444902a2129ec1debf9ed4', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
commit;
prompt 2 records loaded
prompt Loading AOS_SYS_USER_POST...
prompt Table is empty
prompt Loading AOS_SYS_USER_ROLE...
insert into AOS_SYS_USER_ROLE (id_, user_id_, role_id_, operate_time_, operator_id_)
values ('b3fea94f5f0d4065b26c1b2e28fe3a75', 'fe24c4ac34444902a2129ec1debf9ed4', '84f923b5e334498494eda38d8e86ef80', '2016-02-02 21:56:35', 'fa04db9dd2f54d61b0c8202a25de2dc6');
commit;
prompt 1 records loaded
prompt Loading AOS_WF_GE_PROPERTY...
insert into AOS_WF_GE_PROPERTY (name_, value_, rev_)
values ('schema.version', '5.18.0.0', 1);
insert into AOS_WF_GE_PROPERTY (name_, value_, rev_)
values ('schema.history', 'create(5.18.0.0)', 1);
insert into AOS_WF_GE_PROPERTY (name_, value_, rev_)
values ('next.dbid', '1', 1);
commit;
prompt 3 records loaded
prompt Loading AOS_WF_HI_ACTINST...
prompt Table is empty
prompt Loading AOS_WF_HI_ATTACHMENT...
prompt Table is empty
prompt Loading AOS_WF_HI_DETAIL...
prompt Table is empty
prompt Loading AOS_WF_HI_IDENTITYLINK...
prompt Table is empty
prompt Loading AOS_WF_HI_PROCINST...
prompt Table is empty
prompt Loading AOS_WF_HI_TASKINST...
prompt Table is empty
prompt Loading AOS_WF_HI_VARINST...
prompt Table is empty
prompt Loading AOS_WF_ID_GROUP...
prompt Table is empty
prompt Loading AOS_WF_ID_USER...
prompt Table is empty
prompt Loading AOS_WF_ID_MEMBERSHIP...
prompt Table is empty
prompt Loading AOS_WF_RE_DEPLOYMENT...
prompt Table is empty
prompt Loading AOS_WF_RE_MODEL...
prompt Table is empty
prompt Loading AOS_WF_RE_PROCDEF...
prompt Table is empty
prompt Loading AOS_WF_RU_EXECUTION...
prompt Table is empty
prompt Loading AOS_WF_RU_EVENT_SUBSCR...
prompt Table is empty
prompt Loading AOS_WF_RU_TASK...
prompt Table is empty
prompt Loading AOS_WF_RU_IDENTITYLINK...
prompt Table is empty
prompt Loading AOS_WF_RU_JOB...
prompt Table is empty
prompt Loading AOS_WF_RU_VARIABLE...
prompt Table is empty
set feedback on
set define on
prompt Done.

