pprompt PL/SQL Developer import file
prompt Created on 2013年4月6日 by Administrator
set feedback off
set define off
prompt Creating EACODE...
create table EACODE
(
  field     VARCHAR2(15) not null,
  fieldname VARCHAR2(20) not null,
  code      VARCHAR2(10) not null,
  codedesc  VARCHAR2(100) not null,
  enabled   VARCHAR2(2) default '1' not null,
  editmode  VARCHAR2(2) default '1' not null,
  sortno    NUMBER,
  remark    VARCHAR2(200),
  codeid    VARCHAR2(8) not null
)
;
comment on table EACODE
  is '代码对照表';
comment on column EACODE.field
  is '对照字段';
comment on column EACODE.fieldname
  is '对照字段名称';
comment on column EACODE.code
  is '代码';
comment on column EACODE.codedesc
  is '代码描述';
comment on column EACODE.enabled
  is '启用状态(0:禁用;1:启用)';
comment on column EACODE.editmode
  is '编辑模式(0:只读;1:可编辑)';
comment on column EACODE.sortno
  is '排序号';
comment on column EACODE.remark
  is '备注';
comment on column EACODE.codeid
  is '对照ID';
create unique index INDEX_EACODE on EACODE (FIELD, CODE);
alter table EACODE
  add constraint PK_EACODE primary key (CODEID);

prompt Creating EADEPT...
create table EADEPT
(
  deptid   VARCHAR2(100) not null,
  deptname VARCHAR2(50) not null,
  parentid VARCHAR2(100) not null,
  customid VARCHAR2(20),
  sortno   NUMBER(4),
  leaf     VARCHAR2(2) default '0' not null,
  remark   VARCHAR2(100),
  enabled  NVARCHAR2(2) default '1' not null
)
;
comment on table EADEPT
  is '部门信息表';
comment on column EADEPT.deptid
  is '部门编号';
comment on column EADEPT.deptname
  is '部门名称';
comment on column EADEPT.parentid
  is '上级部门编号';
comment on column EADEPT.customid
  is '自定义部门编号';
comment on column EADEPT.sortno
  is '排序号';
comment on column EADEPT.leaf
  is '叶子节点(0:树枝节点;1:叶子节点)';
comment on column EADEPT.remark
  is '备注';
comment on column EADEPT.enabled
  is '启用状态(1:启用;0:停用)';
alter table EADEPT
  add constraint PK_EADEPT primary key (DEPTID);

prompt Creating EAEVENT...
create table EAEVENT
(
  eventid     VARCHAR2(20) not null,
  userid      VARCHAR2(8),
  account     VARCHAR2(30),
  username    VARCHAR2(20),
  description VARCHAR2(100),
  activetime  NUMBER(14),
  requestpath VARCHAR2(200),
  methodname  VARCHAR2(50),
  costtime    NUMBER
)
;
comment on table EAEVENT
  is '操作员事件表';
comment on column EAEVENT.eventid
  is '事件ID';
comment on column EAEVENT.userid
  is '用户ID';
comment on column EAEVENT.account
  is '登录账号';
comment on column EAEVENT.username
  is '用户名';
comment on column EAEVENT.description
  is '事件描述';
comment on column EAEVENT.activetime
  is '活动时间';
comment on column EAEVENT.requestpath
  is '请求路劲';
comment on column EAEVENT.methodname
  is 'Action方法名';
comment on column EAEVENT.costtime
  is '耗时';
alter table EAEVENT
  add constraint PK_EAEVENT primary key (EVENTID);

prompt Creating EAEXCEPTION...
create table EAEXCEPTION
(
  exceptionid VARCHAR2(20) not null,
  clazz       VARCHAR2(200),
  methodname  VARCHAR2(50),
  exception   VARCHAR2(2000),
  activetime  NUMBER(14)
)
;
comment on table EAEXCEPTION
  is '系统异常监控表';
comment on column EAEXCEPTION.exceptionid
  is '异常ID';
comment on column EAEXCEPTION.clazz
  is '异常类';
comment on column EAEXCEPTION.methodname
  is '异常方法';
comment on column EAEXCEPTION.exception
  is '异常信息';
comment on column EAEXCEPTION.activetime
  is '激活时间';
alter table EAEXCEPTION
  add constraint PK_EABEANMONITOR primary key (EXCEPTIONID);

prompt Creating EAHELP...
create table EAHELP
(
  helpid  VARCHAR2(8) not null,
  menuid  VARCHAR2(8) not null,
  content VARCHAR2(4000)
)
;
comment on table EAHELP
  is '帮助信息表';
comment on column EAHELP.helpid
  is '功能模块帮助编号
';
comment on column EAHELP.menuid
  is '菜单编号';
comment on column EAHELP.content
  is '帮助内容';
create unique index INDEX_MENUID on EAHELP (MENUID);
alter table EAHELP
  add constraint PK_EAHELP primary key (HELPID);

prompt Creating EAHTTPSESSION...
create table EAHTTPSESSION
(
  sessionid  VARCHAR2(100) not null,
  username   VARCHAR2(20),
  account    VARCHAR2(30),
  createtime VARCHAR2(20),
  loginip    VARCHAR2(15),
  userid     VARCHAR2(8),
  explorer   VARCHAR2(15)
)
;
comment on table EAHTTPSESSION
  is 'HTTP会话资源管理';
comment on column EAHTTPSESSION.sessionid
  is '会话ID';
comment on column EAHTTPSESSION.username
  is '用户名';
comment on column EAHTTPSESSION.account
  is '登录账户';
comment on column EAHTTPSESSION.createtime
  is '会话创建时间';
comment on column EAHTTPSESSION.loginip
  is '登录IP';
comment on column EAHTTPSESSION.userid
  is '用户编号';
comment on column EAHTTPSESSION.explorer
  is '客户端浏览器';
alter table EAHTTPSESSION
  add constraint PK_EAHTTPSESSION primary key (SESSIONID);

prompt Creating EAICON...
create table EAICON
(
  iconid   VARCHAR2(8) not null,
  filename VARCHAR2(50) not null,
  cssname  VARCHAR2(50) not null
)
;
comment on table EAICON
  is '系统图标表';
comment on column EAICON.iconid
  is '图标编号';
comment on column EAICON.filename
  is '文件名';
comment on column EAICON.cssname
  is 'CSS类名';
alter table EAICON
  add constraint PK_EAICON primary key (ICONID);
alter table EAICON
  add constraint UK1_EAICON unique (FILENAME);
alter table EAICON
  add constraint UK2_EAICON unique (CSSNAME);

prompt Creating EAJDBCMONITOR...
create table EAJDBCMONITOR
(
  monitorid  NUMBER(20) not null,
  sqltext    VARCHAR2(2000),
  starttime  NUMBER(14),
  costtime   NUMBER(8),
  effectrows NUMBER(8),
  type       VARCHAR2(1)
)
;
comment on table EAJDBCMONITOR
  is 'JDBC监控信息表';
comment on column EAJDBCMONITOR.monitorid
  is '监控ID';
comment on column EAJDBCMONITOR.sqltext
  is 'SQL语句';
comment on column EAJDBCMONITOR.starttime
  is '执行开始时间';
comment on column EAJDBCMONITOR.costtime
  is '执行总耗时';
comment on column EAJDBCMONITOR.effectrows
  is '影响行数';
comment on column EAJDBCMONITOR.type
  is '数据操作类型(1:INSERT;2:UPDATE;3:DELETE;4:SELECT;5:CALLPRC)';
alter table EAJDBCMONITOR
  add primary key (MONITORID);

prompt Creating EAMENU...
create table EAMENU
(
  menuid    VARCHAR2(60) not null,
  menuname  VARCHAR2(50) not null,
  parentid  VARCHAR2(60) not null,
  iconcls   VARCHAR2(50),
  expanded  VARCHAR2(2) default '0',
  request   VARCHAR2(100),
  leaf      VARCHAR2(2) default '0' not null,
  sortno    NUMBER(4),
  remark    VARCHAR2(200),
  icon      VARCHAR2(50),
  menutype  VARCHAR2(2) default '0',
  shortcut  VARCHAR2(50),
  width     NUMBER(4),
  height    NUMBER(4),
  scrollbar VARCHAR2(2) default '0'
)
;
comment on table EAMENU
  is '菜单资源信息表';
comment on column EAMENU.menuid
  is '菜单编号';
comment on column EAMENU.menuname
  is '菜单名称';
comment on column EAMENU.parentid
  is '上级菜单编号';
comment on column EAMENU.iconcls
  is '节点图标CSS类名';
comment on column EAMENU.expanded
  is '展开状态(1:展开;0:收缩)';
comment on column EAMENU.request
  is '请求地址';
comment on column EAMENU.leaf
  is '叶子节点(0:树枝节点;1:叶子节点)';
comment on column EAMENU.sortno
  is '排序号';
comment on column EAMENU.remark
  is '备注';
comment on column EAMENU.icon
  is '节点图标';
comment on column EAMENU.menutype
  is '菜单类型(1:系统菜单;0:业务菜单)';
comment on column EAMENU.shortcut
  is '桌面图标文件';
comment on column EAMENU.width
  is '桌面窗口宽度';
comment on column EAMENU.height
  is '桌面窗口高度';
comment on column EAMENU.scrollbar
  is '桌面窗口滚动条(1：有；0：无)';
alter table EAMENU
  add constraint PK_EAMENU primary key (MENUID);

prompt Creating EAMENUPART...
create table EAMENUPART
(
  partid  VARCHAR2(8) not null,
  menuid  VARCHAR2(60) not null,
  cmpid   VARCHAR2(20) not null,
  cmptype VARCHAR2(2) not null,
  remark  VARCHAR2(100) default ''
)
;
comment on table EAMENUPART
  is 'UI托管组件';
comment on column EAMENUPART.partid
  is 'UI组件编号';
comment on column EAMENUPART.menuid
  is '菜单ID';
comment on column EAMENUPART.cmpid
  is 'UI组件ID';
comment on column EAMENUPART.cmptype
  is 'UI组件类型(1:按钮组件;2:表单输入组件;3:容器面板组件)';
comment on column EAMENUPART.remark
  is '备注';
alter table EAMENUPART
  add constraint PK_EAMENUPART primary key (PARTID);

prompt Creating EAPARAM...
create table EAPARAM
(
  paramid    VARCHAR2(8) not null,
  paramkey   VARCHAR2(50) not null,
  paramvalue VARCHAR2(1000) not null,
  remark     VARCHAR2(200)
)
;
comment on table EAPARAM
  is '全局参数表';
comment on column EAPARAM.paramid
  is '参数编号';
comment on column EAPARAM.paramkey
  is '参数键名';
comment on column EAPARAM.paramvalue
  is '参数键值';
comment on column EAPARAM.remark
  is '备注';
alter table EAPARAM
  add constraint PK_EAPARAM primary key (PARAMID);
alter table EAPARAM
  add constraint UK_EAPARAM unique (PARAMKEY);

prompt Creating EAROLE...
create table EAROLE
(
  roleid   VARCHAR2(8) not null,
  rolename VARCHAR2(50) not null,
  deptid   VARCHAR2(100) not null,
  roletype VARCHAR2(2) default '1' not null,
  remark   VARCHAR2(2),
  locked   VARCHAR2(2) default '0'
)
;
comment on table EAROLE
  is '角色信息表';
comment on column EAROLE.roleid
  is '角色编号';
comment on column EAROLE.rolename
  is '角色名称';
comment on column EAROLE.deptid
  is '所属部门编号';
comment on column EAROLE.roletype
  is '角色类型(1:业务角色;2:管理角色 ;3:系统内置角色)';
comment on column EAROLE.remark
  is '备注';
comment on column EAROLE.locked
  is '锁定标志(1:锁定;0:激活)';
alter table EAROLE
  add constraint PK_EAROLE primary key (ROLEID);

prompt Creating EAROLEAUTHORIZE...
create table EAROLEAUTHORIZE
(
  roleid         VARCHAR2(8) not null,
  menuid         VARCHAR2(60) not null,
  authorizelevel VARCHAR2(2) default '1' not null,
  authorizeid    VARCHAR2(8) not null
)
;
comment on table EAROLEAUTHORIZE
  is '角色授权表';
comment on column EAROLEAUTHORIZE.roleid
  is '角色编号';
comment on column EAROLEAUTHORIZE.menuid
  is '菜单编号';
comment on column EAROLEAUTHORIZE.authorizelevel
  is '权限级别(1:访问权限;2:管理权限)';
comment on column EAROLEAUTHORIZE.authorizeid
  is '授权ID';
alter table EAROLEAUTHORIZE
  add constraint PK_EARWAUTHORIZE primary key (AUTHORIZEID);
alter table EAROLEAUTHORIZE
  add constraint UK_EARWAUTHORIZE unique (ROLEID, MENUID, AUTHORIZELEVEL);

prompt Creating EAROLEMENUPART...
create table EAROLEMENUPART
(
  authorizeid  VARCHAR2(8) not null,
  roleid       VARCHAR2(8) not null,
  menuid       VARCHAR2(60) not null,
  partid       VARCHAR2(8) not null,
  partauthtype VARCHAR2(1) not null
)
;
comment on table EAROLEMENUPART
  is 'UI元素角色授权表';
comment on column EAROLEMENUPART.authorizeid
  is '授权ID';
comment on column EAROLEMENUPART.roleid
  is '角色ID';
comment on column EAROLEMENUPART.menuid
  is '菜单ID';
comment on column EAROLEMENUPART.partid
  is 'UI元素ID';
comment on column EAROLEMENUPART.partauthtype
  is 'UI元素授权类型';
alter table EAROLEMENUPART
  add constraint PK_EAROLEMENUPART primary key (AUTHORIZEID);

prompt Creating EASEQUENCE...
create table EASEQUENCE
(
  sequenceid VARCHAR2(4) not null,
  fieldname  VARCHAR2(50) not null,
  maxid      VARCHAR2(50) not null,
  remark     VARCHAR2(100),
  pattern    VARCHAR2(50) not null,
  idtype     VARCHAR2(2) default 2 not null
)
;
comment on table EASEQUENCE
  is '序列号生成器';
comment on column EASEQUENCE.sequenceid
  is '编号';
comment on column EASEQUENCE.fieldname
  is '字段名';
comment on column EASEQUENCE.maxid
  is '当前最大值';
comment on column EASEQUENCE.remark
  is '备注';
comment on column EASEQUENCE.pattern
  is '样式';
comment on column EASEQUENCE.idtype
  is 'ID类型(1:系统内置;2:用户自定义)';
create unique index INDEX_EASEQUENCE on EASEQUENCE (FIELDNAME);
alter table EASEQUENCE
  add constraint PK_EASEQUENCE primary key (SEQUENCEID);

prompt Creating EAUSER...
create table EAUSER
(
  userid   VARCHAR2(8) not null,
  username VARCHAR2(20) not null,
  account  VARCHAR2(30) not null,
  password VARCHAR2(50) not null,
  sex      VARCHAR2(2) default '0' not null,
  deptid   VARCHAR2(100) not null,
  locked   VARCHAR2(2) default '0' not null,
  remark   VARCHAR2(50),
  usertype VARCHAR2(2) default '1',
  enabled  VARCHAR2(2) default '1' not null
)
;
comment on table EAUSER
  is '用户信息表';
comment on column EAUSER.userid
  is '用户编号';
comment on column EAUSER.username
  is '用户名';
comment on column EAUSER.account
  is '登陆帐户';
comment on column EAUSER.password
  is '密码';
comment on column EAUSER.sex
  is '性别(0:未知;1:男;2:女)';
comment on column EAUSER.deptid
  is '部门编号';
comment on column EAUSER.locked
  is '锁定标志(1:锁定;0:激活)';
comment on column EAUSER.remark
  is '备注';
comment on column EAUSER.usertype
  is '人员类型(1:经办员;2:管理员;3:系统内置人员;4;项目网站注册用户)';
comment on column EAUSER.enabled
  is '启用状态(1:启用;0:停用)';
create unique index UK_EAUSER on EAUSER (ACCOUNT);
alter table EAUSER
  add constraint PK_EAUSER primary key (USERID);

prompt Creating EAUSERAUTHORIZE...
create table EAUSERAUTHORIZE
(
  userid      VARCHAR2(8) not null,
  roleid      VARCHAR2(8) not null,
  authorizeid VARCHAR2(8) not null
)
;
comment on table EAUSERAUTHORIZE
  is '用户授权表';
comment on column EAUSERAUTHORIZE.userid
  is '用户编号';
comment on column EAUSERAUTHORIZE.roleid
  is '角色编号';
comment on column EAUSERAUTHORIZE.authorizeid
  is '授权ID';
alter table EAUSERAUTHORIZE
  add constraint PK_EAUSERAUTHORIZE primary key (AUTHORIZEID);

prompt Creating EAUSERMENUMAP...
create table EAUSERMENUMAP
(
  userid         VARCHAR2(8) not null,
  menuid         VARCHAR2(60) not null,
  authorizeid    VARCHAR2(8) not null,
  authorizelevel VARCHAR2(2) not null
)
;
comment on table EAUSERMENUMAP
  is '用户菜单映射表';
comment on column EAUSERMENUMAP.userid
  is '人员编号';
comment on column EAUSERMENUMAP.menuid
  is '菜单编号';
comment on column EAUSERMENUMAP.authorizeid
  is '授权编号';
comment on column EAUSERMENUMAP.authorizelevel
  is '权限级别(1:访问权限;2:管理权限)';
alter table EAUSERMENUMAP
  add constraint PK_EAUSERMENUMAP primary key (AUTHORIZEID);
alter table EAUSERMENUMAP
  add constraint UK_EAUSERMENUMAP unique (MENUID, USERID, AUTHORIZELEVEL);

prompt Creating EAUSERMENUPART...
create table EAUSERMENUPART
(
  authorizeid  VARCHAR2(8) not null,
  userid       VARCHAR2(8) not null,
  menuid       VARCHAR2(60) not null,
  partid       VARCHAR2(8) not null,
  partauthtype VARCHAR2(1) not null
)
;
comment on table EAUSERMENUPART
  is 'UI元素人员授权表';
comment on column EAUSERMENUPART.authorizeid
  is '授权ID';
comment on column EAUSERMENUPART.userid
  is '人员ID';
comment on column EAUSERMENUPART.menuid
  is '菜单ID';
comment on column EAUSERMENUPART.partid
  is 'UI元素ID';
comment on column EAUSERMENUPART.partauthtype
  is 'UI元素授权类型';
alter table EAUSERMENUPART
  add constraint PK_EAUSERMENUPART primary key (AUTHORIZEID);
alter table EAUSERMENUPART
  add constraint UK_EAUSERMENUPART unique (USERID, MENUID, PARTID);

prompt Creating EAUSERSUBINFO...
create table EAUSERSUBINFO
(
  userid     VARCHAR2(8) not null,
  theme      VARCHAR2(50),
  layout     VARCHAR2(1),
  background VARCHAR2(50)
)
;
comment on table EAUSERSUBINFO
  is '人员信息附加属性表';
comment on column EAUSERSUBINFO.userid
  is '人员编号';
comment on column EAUSERSUBINFO.theme
  is '自定义主题皮肤';
comment on column EAUSERSUBINFO.layout
  is '系统级缺省主界面布局模式。1:传统经典布局;2:个性桌面布局。';
comment on column EAUSERSUBINFO.background
  is '自定义桌面背景';
alter table EAUSERSUBINFO
  add constraint PK_EAUSERSUBINFO primary key (USERID);

prompt Creating EA_DEMO_BYJSB...
create table EA_DEMO_BYJSB
(
  sxh  VARCHAR2(20) not null,
  dwmc VARCHAR2(100),
  grbm VARCHAR2(20),
  xm   VARCHAR2(20),
  xb   VARCHAR2(3),
  xnl  NUMBER,
  fyze NUMBER(14,2),
  zfje NUMBER(14,2),
  ybbx NUMBER(14,2),
  jssj DATE,
  yymc VARCHAR2(50),
  jbr  VARCHAR2(20)
)
;
comment on table EA_DEMO_BYJSB
  is '演示表(病员结算明细)';
alter table EA_DEMO_BYJSB
  add constraint PK_EZ_BYJSB primary key (SXH);

prompt Creating EA_DEMO_BYMXB...
create table EA_DEMO_BYMXB
(
  sxh    VARCHAR2(20) not null,
  xh     VARCHAR2(20) not null,
  zflb   VARCHAR2(10),
  grbm   VARCHAR2(20),
  xm     VARCHAR2(20),
  sfdlmc VARCHAR2(20),
  sfxmmc VARCHAR2(100),
  sl     NUMBER(8,2),
  sjjg   NUMBER(14,3),
  fyze   NUMBER(14,2),
  cd     VARCHAR2(128),
  gg     VARCHAR2(50),
  sfsj   DATE,
  sfy    VARCHAR2(20)
)
;
comment on table EA_DEMO_BYMXB
  is '演示表(病员费用明细)';
alter table EA_DEMO_BYMXB
  add constraint PK_EZ_BYMXB primary key (SXH, XH);

prompt Creating EA_DEMO_CHINAAREA...
create table EA_DEMO_CHINAAREA
(
  areacode VARCHAR2(12),
  areaname VARCHAR2(50)
)
;
comment on table EA_DEMO_CHINAAREA
  is '演示表(中国行政区域)';
comment on column EA_DEMO_CHINAAREA.areacode
  is '区划代码';
comment on column EA_DEMO_CHINAAREA.areaname
  is '区划名称';

prompt Creating EA_DEMO_FCF...
create table EA_DEMO_FCF
(
  name     VARCHAR2(20),
  value    VARCHAR2(10),
  color    VARCHAR2(10),
  alpha    VARCHAR2(10),
  issliced VARCHAR2(1) default 0,
  product  VARCHAR2(1),
  fcfid    NUMBER(10) not null
)
;
comment on table EA_DEMO_FCF
  is '演示表(FlashReport数据源)';
comment on column EA_DEMO_FCF.name
  is '名称';
comment on column EA_DEMO_FCF.value
  is '值';
comment on column EA_DEMO_FCF.color
  is '颜色';
comment on column EA_DEMO_FCF.alpha
  is '透明度';
comment on column EA_DEMO_FCF.issliced
  is '是否浮动(仅对饼图有效)';
comment on column EA_DEMO_FCF.product
  is '产品';

prompt Creating EA_DEMO_SFXM...
create table EA_DEMO_SFXM
(
  xmid   VARCHAR2(20) not null,
  sfdlbm VARCHAR2(20),
  xmmc   VARCHAR2(100),
  xmrj   VARCHAR2(20),
  gg     VARCHAR2(50),
  dw     VARCHAR2(20),
  zfbl   NUMBER,
  jx     VARCHAR2(50),
  cd     VARCHAR2(100),
  qybz   VARCHAR2(3),
  yybm   VARCHAR2(8),
  ggsj   DATE
)
;
comment on table EA_DEMO_SFXM
  is '演示表(医院收费项目)';
alter table EA_DEMO_SFXM
  add constraint PK_EZ_SFXM primary key (XMID);

prompt Creating EA_DEMO_UPLOAD...
create table EA_DEMO_UPLOAD
(
  fileid   VARCHAR2(8) not null,
  title    VARCHAR2(100),
  path     VARCHAR2(100),
  filesize NUMBER(12),
  remark   VARCHAR2(200)
)
;
comment on table EA_DEMO_UPLOAD
  is '演示表(文件管理)';
comment on column EA_DEMO_UPLOAD.fileid
  is '文件ID';
comment on column EA_DEMO_UPLOAD.title
  is '文件标题';
comment on column EA_DEMO_UPLOAD.path
  is '文件存储相对路径';
comment on column EA_DEMO_UPLOAD.filesize
  is '文件大小';
comment on column EA_DEMO_UPLOAD.remark
  is '文件描述';
alter table EA_DEMO_UPLOAD
  add constraint PK_EA_DEMO_UPLOAD primary key (FILEID);
alter table EA_DEMO_UPLOAD
  add constraint UK_EA_DEMO_UPLOAD unique (PATH);

prompt Disabling triggers for EACODE...
alter table EACODE disable all triggers;
prompt Disabling triggers for EADEPT...
alter table EADEPT disable all triggers;
prompt Disabling triggers for EAEVENT...
alter table EAEVENT disable all triggers;
prompt Disabling triggers for EAEXCEPTION...
alter table EAEXCEPTION disable all triggers;
prompt Disabling triggers for EAHELP...
alter table EAHELP disable all triggers;
prompt Disabling triggers for EAHTTPSESSION...
alter table EAHTTPSESSION disable all triggers;
prompt Disabling triggers for EAICON...
alter table EAICON disable all triggers;
prompt Disabling triggers for EAJDBCMONITOR...
alter table EAJDBCMONITOR disable all triggers;
prompt Disabling triggers for EAMENU...
alter table EAMENU disable all triggers;
prompt Disabling triggers for EAMENUPART...
alter table EAMENUPART disable all triggers;
prompt Disabling triggers for EAPARAM...
alter table EAPARAM disable all triggers;
prompt Disabling triggers for EAROLE...
alter table EAROLE disable all triggers;
prompt Disabling triggers for EAROLEAUTHORIZE...
alter table EAROLEAUTHORIZE disable all triggers;
prompt Disabling triggers for EAROLEMENUPART...
alter table EAROLEMENUPART disable all triggers;
prompt Disabling triggers for EASEQUENCE...
alter table EASEQUENCE disable all triggers;
prompt Disabling triggers for EAUSER...
alter table EAUSER disable all triggers;
prompt Disabling triggers for EAUSERAUTHORIZE...
alter table EAUSERAUTHORIZE disable all triggers;
prompt Disabling triggers for EAUSERMENUMAP...
alter table EAUSERMENUMAP disable all triggers;
prompt Disabling triggers for EAUSERMENUPART...
alter table EAUSERMENUPART disable all triggers;
prompt Disabling triggers for EAUSERSUBINFO...
alter table EAUSERSUBINFO disable all triggers;
prompt Disabling triggers for EA_DEMO_BYJSB...
alter table EA_DEMO_BYJSB disable all triggers;
prompt Disabling triggers for EA_DEMO_BYMXB...
alter table EA_DEMO_BYMXB disable all triggers;
prompt Disabling triggers for EA_DEMO_CHINAAREA...
alter table EA_DEMO_CHINAAREA disable all triggers;
prompt Disabling triggers for EA_DEMO_FCF...
alter table EA_DEMO_FCF disable all triggers;
prompt Disabling triggers for EA_DEMO_SFXM...
alter table EA_DEMO_SFXM disable all triggers;
prompt Disabling triggers for EA_DEMO_UPLOAD...
alter table EA_DEMO_UPLOAD disable all triggers;
prompt Loading EACODE...
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('SEX', '性别', '0', '未知', '1', '0', 1, null, '10000000');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('SEX', '性别', '1', '男', '1', '0', 2, null, '10000001');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('SEX', '性别', '2', '女', '1', '0', 3, null, '10000002');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('LOCKED', '锁定', '0', '激活', '1', '0', 2, null, '10000003');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('LOCKED', '锁定', '1', '锁定', '1', '0', 1, null, '10000004');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('ROLETYPE', '角色类型', '2', '管理角色', '1', '0', 2, null, '10000005');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('ROLETYPE', '角色类型', '1', '业务角色', '1', '0', 1, null, '10000006');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('LEAF', '节点类型', '1', '叶子节点`', '1', '0', 1, null, '10000007');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('LEAF', '节点类型', '0', '树枝节点', '1', '0', 2, null, '10000008');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('EDITMODE', '编辑模式', '0', '只读', '1', '0', 1, null, '10000009');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('EDITMODE', '编辑模式', '1', '可编辑', '1', '0', 2, null, '10000010');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('ENABLED', '启用状态', '0', '禁用', '1', '0', 1, null, '10000011');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('ENABLED', '启用状态', '1', '启用', '1', '0', 2, null, '10000012');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('AUTHORIZELEVEL', '权限级别', '1', '访问权限', '1', '0', 1, null, '10000015');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('AUTHORIZELEVEL', '权限级别', '2', '管理权限', '1', '0', 2, null, '10000016');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('ROLETYPE', '角色类型', '3', '系统内置角色', '1', '0', 3, null, '10000018');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('MENUTYPE', '菜单类型', '1', '系统菜单', '1', '0', 1, null, '10000039');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('MENUTYPE', '菜单类型', '0', '业务菜单', '1', '0', 2, null, '10000040');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('USERTYPE', '人员类型', '1', '经办员', '1', '0', 1, null, '10000041');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('USERTYPE', '人员类型', '2', '管理员', '1', '0', 2, null, '10000042');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('USERTYPE', '人员类型', '3', '系统内置用户', '1', '0', 3, null, '10000043');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('QYBZ', '启用标志', '1', '启用', '1', '1', 1, '表格演示例子中使用', '10000044');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('QYBZ', '启用标志', '0', '停用', '1', '1', 2, '表格演示例子中使用', '10000047');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('CMPTYPE', 'UI元素类型', '1', '按钮', '1', '0', 1, null, '10000048');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('CMPTYPE', 'UI元素类型', '2', '表单输入(textField|textArea|comboBox|checkBox|radioBox|htmlEditor)', '1', '0', 2, null, '10000049');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('CMPTYPE', 'UI组件类型', '3', '面板容器(Panel|TabPanel|GridPanel|FormPanel|TreePanel)', '1', '0', 3, null, '10000050');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('PARTAUTHTYPE', 'UI元素授权类型', '1', '禁用', '1', '0', 2, null, '10000051');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('PARTAUTHTYPE', 'UI元素授权类型', '3', '只读', '1', '0', 3, null, '10000052');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('PARTAUTHTYPE', 'UI元素授权类型', '4', '编辑', '1', '0', 4, null, '10000053');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('PARTAUTHTYPE', 'UI元素授权类型', '5', '显示', '1', '0', 5, null, '10000054');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('PARTAUTHTYPE', 'UI元素授权类型', '6', '隐藏', '1', '0', 6, null, '10000055');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('PARTAUTHTYPE', 'UI元素授权类型', '0', '挂起', '1', '0', 1, null, '10000056');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('PARTAUTHTYPE', 'UI元素授权类型', '2', '激活', '1', '0', 4, null, '10000057');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('ADVISETYPE', '通知类型', '1', '方法调用', '1', '0', 1, null, '10000058');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('ADVISETYPE', '通知类型', '2', '异常捕获', '1', '0', 2, null, '10000059');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('EXPAND', '节点状态', '1', '展开', '1', '0', null, null, '10000062');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('EXPAND', '展开状态', '0', '收缩', '1', '0', null, null, '10000063');
commit;
prompt 37 records loaded
prompt Loading EADEPT...
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001', 'G4Stuido开发平台', '0', '01        ', 1, '0', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001001', '研发中心', '001', '0101      ', 2, '0', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001001001', '研发1部', '001001', null, 1, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002', '国家金保工程', '001', '0         ', 2, '0', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001', '社保行政经办机构', '001002', '01        ', 0, '0', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001001', '北京市社保局', '001002001', '0101      ', null, '0', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001001001', '朝阳区社保局', '001002001001', '010101    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001001002', '海淀区社保局', '001002001001', '010102    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001001003', '东城区社保局', '001002001001', '010103    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001001004', '西城区社保局', '001002001001', '010104    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001001005', '崇文区社保局', '001002001001', '010105    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001001006', '宣武区社保局', '001002001001', '010106    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001001007', '怀柔区社保局', '001002001001', '010107    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001001008', '石景山区社保局', '001002001001', '010108    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001002', '上海市社保局', '001002001', '0102      ', 0, '0', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001002001', '黄浦区社保局', '001002001002', '010201    ', 0, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001002002', '卢湾区社保局', '001002001002', '010202    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001002003', '徐汇区社保局', '001002001002', '010203    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001002004', '虹口区社保局', '001002001002', '010204    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001002005', '浦东新区社保局', '001002001002', '010205    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001002006', '松江区社保局', '001002001002', '010206    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001003', '天津市社保局', '001002001', '0103      ', 0, '0', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001003001', '和平区社保局', '001002001003', '010301    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001003002', '塘沽区社保局', '001002001003', '010302    ', 0, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001003003', '大港区社保局', '001002001003', '010303    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001003004', '东丽区社保局', '001002001003', '010304    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001003005', '西青区社保局', '001002001003', '010305    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001004', '重庆市社保局', '001002001', '0104      ', null, '0', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001004001', '万州区社保局', '001002001004', '010401    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001004002', '涪陵区社保局', '001002001004', '010402    ', 0, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001004003', '渝中区社保局', '001002001004', '010403    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001005', '广东省社保局', '001002001', '0105      ', 0, '0', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001005003', '潮州市社保局', '001002001005', '010503    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001005004', '中山市社保局', '001002001005', '010504    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001005005', '深圳市社保局', '001002001005', '010501    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001006', '云南省社保局', '001002001', '0106      ', null, '0', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001006001', '昆明市社保局', '001002001006', '010601    ', null, '0', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001006001001', '五华区社保局', '001002001006001', '01060101  ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001006001002', '盘龙区社保局', '001002001006001', '01060102  ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001006001003', '东川区社保局', '001002001006001', '01060103  ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001006001004', '经开区社保局', '001002001006001', '01060104  ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001006002', '大理州社保局', '001002001006', '010602    ', null, '0', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001006002001', '弥渡县社保局', '001002001006002', '01060201  ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001006002002', '祥云县社保局', '001002001006002', '01060202  ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001006002003', '下关市社保局', '001002001006002', '01060203  ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001006002004', '剑川县社保局', '001002001006002', '01060204  ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001006003', '曲靖市社保局', '001002001006', null, 0, '1', null, '1');
commit;
prompt 47 records loaded
prompt Loading EAEVENT...
prompt Table is empty
prompt Loading EAEXCEPTION...
prompt Table is empty
prompt Loading EAHELP...
prompt Table is empty
prompt Loading EAHTTPSESSION...
prompt Table is empty
prompt Loading EAICON...
insert into EAICON (iconid, filename, cssname)
values ('10000018', 'accept.png', 'acceptIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000046', 'add.png', 'addIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000008', 'application.png', 'applicationIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000010', 'application_cascade.png', 'application_cascadeIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000009', 'application_double.png', 'application_doubleIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000005', 'application_home.png', 'application_homeIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000028', 'application_view_list.png', 'application_view_listIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000063', 'app_boxes.png', 'app_boxesIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000064', 'app_left.png', 'app_leftIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000065', 'app_right.png', 'app_rightIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000022', 'arrow_refresh.png', 'arrow_refreshIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000066', 'arrow_switch.png', 'arrow_switchIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000048', 'award_star_silver_3.png', 'award_star_silver_3Icon');
insert into EAICON (iconid, filename, cssname)
values ('10000025', 'book_previous.png', 'book_previousIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000053', 'bug.png', 'bugIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000033', 'building.png', 'buildingIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000032', 'chart_organisation.png', 'chart_organisationIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000037', 'collapse-all.gif', 'collapse-allIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000007', 'comments.png', 'commentsIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000012', 'comments_add.png', 'comments_addIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000017', 'comment_add.png', 'comment_addIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000054', 'config.png', 'configIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000004', 'cup.png', 'cupIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000051', 'database_connect.png', 'database_connectIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000056', 'database_refresh.png', 'database_refreshIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000019', 'delete.png', 'deleteIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000049', 'disconnect.png', 'disconnectIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000058', 'docs.gif', 'docsIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000062', 'download.png', 'downloadIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000047', 'edit1.png', 'edit1Icon');
insert into EAICON (iconid, filename, cssname)
values ('10000052', 'exclamation.png', 'exclamationIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000036', 'expand-all.gif', 'expand-allIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000001', 'folder_camera.png', 'folder_cameraIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000003', 'folder_feed.png', 'folder_feedIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000002', 'folder_user.png', 'folder_userIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000000', 'folder_wrench.png', 'folder_wrenchIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000006', 'group.png', 'groupIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000039', 'group_link.png', 'group_linkIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000027', 'image.png', 'imageIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000029', 'key.png', 'keyIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000031', 'layout_content.png', 'layout_contentIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000023', 'lock.png', 'lockIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000041', 'medal_gold_1.png', 'medal_gold_1Icon');
insert into EAICON (iconid, filename, cssname)
values ('10000040', 'medal_silver_3.png', 'medal_silver_3Icon');
insert into EAICON (iconid, filename, cssname)
values ('10000060', 'message_edit.png', 'message_editIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000013', 'page_add.png', 'page_addIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000015', 'page_del.png', 'page_delIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000014', 'page_edit_1.png', 'page_edit_1Icon');
insert into EAICON (iconid, filename, cssname)
values ('10000044', 'page_excel.png', 'page_excelIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000030', 'page_find.png', 'page_findIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000016', 'page_refresh.png', 'page_refreshIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000045', 'plugin.png', 'pluginIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000043', 'preview.png', 'previewIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000042', 'printer.png', 'printerIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000055', 'server_connect.png', 'server_connectIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000020', 'status_away.png', 'status_awayIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000021', 'status_busy.png', 'status_busyIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000035', 'status_online.png', 'status_onlineIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000050', 'table.png', 'tableIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000011', 'tbar_synchronize.png', 'tbar_synchronizeIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000059', 'theme2.png', 'theme2Icon');
insert into EAICON (iconid, filename, cssname)
values ('10000061', 'upload.png', 'uploadIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000038', 'user.png', 'userIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000057', 'user_comment.png', 'user_commentIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000034', 'user_female.png', 'user_femaleIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000026', 'window_caise_list.png', 'window_caise_listIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000024', 'wrench.png', 'wrenchIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000067', 'plugin_add.png', 'plugin_addIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000068', 'plugin_edit.png', 'plugin_editIcon');
commit;
prompt 69 records loaded
prompt Loading EAJDBCMONITOR...
prompt Table is empty
prompt Loading EAMENU...
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021316', '图表综合范例一(动态数据源)', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=integrateFlashReport1Init', '1', 16, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021317', '图表综合范例二(动态数据源)', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=integrateFlashReport2Init', '1', 17, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('010214', '页面布局', '0102', null, '0', null, '0', 7, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021401', 'Form布局', '010214', null, '0', 'demo/formDemo.do?reqCode=formLayoutInit', '1', 1, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021402', 'Column布局', '010214', null, '0', 'demo/formDemo.do?reqCode=columnLayoutInit', '1', 2, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021403', '表单综合布局1', '010214', null, '0', 'demo/formDemo.do?reqCode=complexLayoutInit', '1', 3, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021404', '表单综合布局2', '010214', null, '0', 'demo/formDemo.do?reqCode=complexLayout2Init', '1', 4, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021405', 'Viewport布局', '010214', null, '0', 'demo/commonUiDemo.do?reqCode=viewportLayoutInit', '1', 5, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021406', 'Viewport嵌套布局', '010214', null, '0', 'demo/commonUiDemo.do?reqCode=viewportComplexLayoutInit', '1', 6, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('010215', '综合', '0102', null, '0', null, '0', 8, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021501', '综合实例1', '010215', null, '0', 'demo/integrateDemo.do?reqCode=queryDemo1Init', '1', 1, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021502', '综合实例2', '010215', null, '0', 'demo/integrateDemo.do?reqCode=queryDemo2Init', '1', 2, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021503', '综合实例3', '010215', null, '0', 'demo/integrateDemo.do?reqCode=collectDataInit', '1', 3, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021504', '综合实例4', '010215', null, '0', 'demo/integrateDemo.do?reqCode=collectDataByWindowInit', '1', 4, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021505', '综合实例5', '010215', null, '0', 'demo/integrateDemo.do?reqCode=manageDataInit', '1', 5, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021506', '综合实例6', '010215', null, '0', 'demo/integrateDemo.do?reqCode=manageData4In1Init', '1', 6, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('010216', '其它', '0102', null, '0', null, '0', 9, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021601', '存储过程调用', '010216', null, '0', 'demo/integrateDemo.do?reqCode=callPrcInit', '1', 1, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021602', '文件管理(上传下载)', '010216', null, '0', 'demo/otherDemo.do?reqCode=uploadInit', '1', 2, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021603', '演示UI元素授权', '010216', null, '0', 'demo/integrateDemo.do?reqCode=manageData4In1Init', '1', 3, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('0103', '开发人员工具箱', '01', 'configIcon', '0', null, '0', 2, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('010301', '其它', '0103', null, '0', null, '0', 8, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01030101', '系统预置图标', '010301', 'imagesIcon', '0', 'resource.do?reqCode=iconInit', '1', 1, null, 'images.png', '0', 'shortcut_9.png', null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('010302', '调试', '0103', null, '0', null, '0', 9, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01030201', '调试页面1', '010302', null, '0', 'demo/test.do?reqCode=test1Init', '1', 1, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01030202', '调试页面2', '010302', null, '0', 'demo/test.do?reqCode=test2Init', '1', 2, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01030203', '调试页面3', '010302', null, '0', 'demo/test.do?reqCode=test3Init', '1', 3, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01030204', '调试页面4', '010302', null, '0', 'demo/test.do?reqCode=test4Init', '1', 4, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01030205', '调试页面5', '010302', null, '0', 'demo/test.do?reqCode=test5Initt', '1', 5, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021318', '拆线组合图（双Y轴）', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=fcfLineMs2YInit', '1', 19, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021319', '动态切换图表类型', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=integrateFlashReport3Init', '1', 18, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021604', '导入Excel文件(xls格式)', '010216', null, '0', 'demo/excelReportDemo.do?reqCode=importInit', '1', 4, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021605', '客户端请求异常处理', '010216', null, '0', 'demo/otherDemo.do?reqCode=exceptionInit', '1', 5, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01', 'G4Stuido开发平台', '0', null, '0', null, '0', 1, null, null, '1', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('0101', '系统管理', '01', 'folder_wrenchIcon', '0', null, '0', 1, null, null, '1', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('010102', '权限管理', '0101', null, '1', null, '0', 1, null, null, '1', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01010201', '组织机构管理', '010102', 'chart_organisationIcon', '0', 'organization.do?reqCode=departmentInit', '1', 1, null, 'chart_organisation.png', '1', 'onebit_18.png', null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01010202', '人员管理与授权', '010102', 'group_linkIcon', '0', 'user.do?reqCode=userInit', '1', 3, null, 'group_link.png', '1', 'groupofusers.png', null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01010204', '角色管理与授权', '010102', 'award_star_silver_3Icon', '0', 'role.do?reqCode=roleInit', '1', 2, null, 'award_star_silver_3.png', '1', 'favbadd.png', null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01010205', '菜单资源管理', '010102', 'arrow_switchIcon', '0', 'resource.do?reqCode=menuResourceInit', '1', 4, null, 'arrow_switch.png', '1', 'documentsorcopy.png', null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01010206', 'UI元素托管', '010102', 'app_boxesIcon', '0', 'part.do?reqCode=init', '1', 5, null, 'app_boxes.png', '1', 'file.png', null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01010207', 'UI元素角色授权', '010102', 'app_leftIcon', '0', 'rolePart.do?reqCode=init', '1', 6, null, 'app_left.png', '1', 'filelocked.png', null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01010208', 'UI元素人员授权', '010102', 'app_rightIcon', '0', 'userPart.do?reqCode=init', '1', 7, null, 'app_right.png', '1', 'addfile.png', null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('010103', '基础数据维护', '0101', null, '1', null, '0', 2, null, null, '1', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01010301', '字典维护', '010103', 'application_view_listIcon', '0', 'resource.do?reqCode=codeTableInit', '1', 1, null, 'application_view_list.png', '1', 'shortcut_11.png', null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01010303', '全局参数表维护', '010103', 'configIcon', '0', 'param.do?reqCode=init', '1', 2, null, 'config.png', '1', 'textfile.png', null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('010104', '运行监控', '0101', null, '1', null, '0', 3, null, null, '1', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01010401', 'Session会话监控', '010104', 'user_commentIcon', '0', 'sessionMonitor.do?reqCode=init', '1', 2, null, 'user_comment.png', '1', 'onebit_22.png', null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01010403', 'Requst请求跟踪', '010104', 'bugIcon', '0', 'eventTrack.do?reqCode=init', '1', 1, null, 'bug.png', '1', 'onebit_08.png', null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01010405', 'JDBC执行监控', '010104', 'database_refreshIcon', '0', 'jdbcMonitor.do?reqCode=jdbcInit', '1', 3, null, 'database_refresh.png', '1', 'shortcut_8.png', null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01010406', '系统异常监控', '010104', 'disconnectIcon', '0', 'beanMonitor.do?reqCode=init', '1', 4, null, 'disconnect.png', '1', 'close.png', null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01010407', '服务器信息', '010104', 'server_connectIcon', '0', 'serverInfo.do?reqCode=init', '1', 5, null, 'server_connect.png', '1', 'onebit_12.png', null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('0102', '标准范例子系统', '01', 'folder_cameraIcon', '0', null, '0', 3, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('010208', '表单及表单元素', '0102', null, '0', null, '0', 1, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01020801', '基本输入(属性配置)', '010208', null, '0', 'demo/formDemo.do?reqCode=basicInput4PropertyInit', '1', 1, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01020802', '基本输入(方法行为)', '010208', null, '0', 'demo/formDemo.do?reqCode=basicInput4MethodInit', '1', 2, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01020803', '日历选择框(日期、时间)', '010208', null, '0', 'demo/formDemo.do?reqCode=dataTimeInputInit', '1', 3, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01020804', '下拉选择框(本地数据源)', '010208', null, '0', 'demo/formDemo.do?reqCode=selectInputBasedLocalDataSourceInit', '1', 4, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01020805', '下拉选择框(字典数据源)', '010208', null, '0', 'demo/formDemo.do?reqCode=selectInputBasedCodeTableDataSourceInit', '1', 5, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01020806', '下拉选择框(远程数据源)', '010208', null, '0', 'demo/formDemo.do?reqCode=selectInputBasedRemoteDataSourceInit', '1', 6, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01020807', '下拉选择框(N级联动)', '010208', null, '0', 'demo/formDemo.do?reqCode=selectInputBasedMultilevelInit', '1', 7, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01020808', '单选框、复选框', '010208', null, '0', 'demo/formDemo.do?reqCode=radioCheckBoxInit', '1', 8, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01020809', '表单异步交互(提交、数据填充)', '010208', null, '0', 'demo/formDemo.do?reqCode=formSubmitInit', '1', 9, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01020810', '表单同步提交', '010208', null, '0', 'demo/formDemo.do?reqCode=formSynSubmitInit', '1', 10, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01020813', '工具栏、菜单栏', '010208', null, '0', 'demo/formDemo.do?reqCode=toobarDemo1Init', '1', 11, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01020814', '消息对话框', '010208', null, '0', 'demo/formDemo.do?reqCode=msgDemo1Init', '1', 12, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01020815', '富文本输入框', '010208', null, '0', 'demo/formDemo.do?reqCode=htmlEditorInit', '1', 13, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01020816', '富文本输入框(扩展)', '010208', null, '0', 'demo/formDemo.do?reqCode=htmlEditor2Init', '1', 14, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('010209', '窗口及面板', '0102', null, '0', null, '0', 2, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01020901', '面板范例一', '010209', null, '0', 'demo/commonUiDemo.do?reqCode=panelDemo1Init', '1', 1, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01020902', '窗口范例一', '010209', null, '0', 'demo/commonUiDemo.do?reqCode=windowDemo1Init', '1', 2, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01020903', 'Tab标签卡范例一', '010209', null, '0', 'demo/commonUiDemo.do?reqCode=tabPanelDemo1Init', '1', 3, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('010210', '表格', '0102', null, '0', null, '0', 3, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021001', '表格范例一(基本特性)', '010210', null, '0', 'demo/gridDemo.do?reqCode=gridDemo1Init', '1', 1, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021002', '表格范例二(行级展开)', '010210', null, '0', 'demo/gridDemo.do?reqCode=gridDemo2Init', '1', 2, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021003', '表格范例三(可编辑表格)', '010210', null, '0', 'demo/gridDemo.do?reqCode=gridDemo3Init', '1', 3, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021004', '表格范例四(列锁定)', '010210', null, '0', 'demo/gridDemo.do?reqCode=gridDemo4Init', '1', 4, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021005', '表格范例五(缓冲表格)', '010210', null, '0', 'demo/gridDemo.do?reqCode=gridDemo5Init', '1', 5, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021006', '表格范例六(合计表格)', '010210', null, '0', 'demo/gridDemo.do?reqCode=gridDemo6Init', '1', 6, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021007', '表格范例七(表头分组)', '010210', null, '0', 'demo/gridDemo.do?reqCode=gridDemo7Init', '1', 7, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('010211', '树', '0102', null, '0', null, '0', 4, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021101', '树范例一(普通树)', '010211', null, '0', 'demo/treeDemo.do?reqCode=treeDemo1Init', '1', 1, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021102', '树范例二(异步树)', '010211', null, '0', 'demo/treeDemo.do?reqCode=treeDemo2Init', '1', 2, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021103', '树范例三(复选树)', '010211', null, '0', 'demo/treeDemo.do?reqCode=treeDemo3Init', '1', 3, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021104', '树范例四(级联复选树)', '010211', null, '0', 'demo/treeDemo.do?reqCode=treeDemo4Init', '1', 4, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021105', '树范例五(下拉树)', '010211', null, '0', 'demo/treeDemo.do?reqCode=treeDemo5Init', '1', 5, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021106', '树范例六(异步表格树)', '010211', null, '0', 'demo/treeDemo.do?reqCode=treeDemo6Init', '1', 6, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021107', '树范例七(下拉树2)', '010211', null, '0', 'demo/treeDemo.do?reqCode=treeDemo8Init', '1', 7, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('010212', '报表', '0102', null, '0', null, '0', 5, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021201', 'Applet报表', '010212', null, '0', 'demo/jasperReportDemo.do?reqCode=appletInit', '1', 1, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021202', 'PDF报表', '010212', null, '0', 'demo/jasperReportDemo.do?reqCode=pdfInit', '1', 2, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021203', 'Excel报表', '010212', null, '0', 'demo/excelReportDemo.do?reqCode=exportInit', '1', 3, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('010213', '图表', '0102', null, '0', null, '0', 6, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021301', '2D柱状图', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=fcf2DColumnInit', '1', 1, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021302', '3D柱状图', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=fcf3DColumnInit', '1', 2, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021303', '2D饼图', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=fcf2DPieInit', '1', 3, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021304', '3D饼图', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=fcf3DPieInit', '1', 4, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021305', '2D柱状组合图', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=fcf2DColumnMsInit', '1', 5, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021306', '3D柱状组合图', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=fcf3DColumnMsInit', '1', 6, null, null, '0', null, null, null, '0');
commit;
prompt 100 records committed...
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021307', '折线图', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=fcfLineInit', '1', 7, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021308', '折线组合图', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=fcfLineMsInit', '1', 8, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021309', '面积图', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=fcfAreaInit', '1', 9, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021310', '面积组合图', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=fcfAreaMsInit', '1', 10, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021311', '环状图', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=fcfCircularityInit', '1', 11, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021312', '3D折线柱状交叉图', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=fcf3DLineColumnInit', '1', 12, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021313', '2D栏位图', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=fcf2DBarInit', '1', 13, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021314', '2D栏位组合图', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=fcf2DBarMsInit', '1', 14, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021315', '交互图(JS调用|下钻[超链接])', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=fcfAdvancedInit', '1', 15, null, null, '0', null, null, null, '0');
commit;
prompt 109 records loaded
prompt Loading EAMENUPART...
insert into EAMENUPART (partid, menuid, cmpid, cmptype, remark)
values ('10000116', '01021603', 'id_tbi_add', '1', '工具栏新增按钮');
insert into EAMENUPART (partid, menuid, cmpid, cmptype, remark)
values ('10000107', '0102071803', 'id_txt_xmid', '2', '项目ID输入框');
insert into EAMENUPART (partid, menuid, cmpid, cmptype, remark)
values ('10000108', '0102071803', 'id_btn_print', '1', '打印按钮');
insert into EAMENUPART (partid, menuid, cmpid, cmptype, remark)
values ('10000109', '0102071803', 'id_grid_sfxm', '3', '医院收费项目表格');
insert into EAMENUPART (partid, menuid, cmpid, cmptype, remark)
values ('10000113', '01021603', 'id_txt_xmid', '2', '项目ID文本输入框');
insert into EAMENUPART (partid, menuid, cmpid, cmptype, remark)
values ('10000114', '01021603', 'id_btn_print', '1', '打印按钮');
insert into EAMENUPART (partid, menuid, cmpid, cmptype, remark)
values ('10000115', '01021603', 'id_grid_sfxm', '3', '收费项目表格');
commit;
prompt 7 records loaded
prompt Loading EAPARAM...
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000008', 'SYS_DEFAULT_THEME', 'default', '系统默认主题皮肤');
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000009', 'DEFAULT_ADMIN_ACCOUNT', 'super', '默认超级管理员帐户');
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000010', 'DEFAULT_DEVELOP_ACCOUNT', 'developer', '系统默认开发专用帐户');
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000017', 'SYS_TITLE', 'G4Studio：JavaEE行业应用二次快速开发平台V5.2', '系统标题');
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000018', 'LOGIN_WINDOW_TITLE', 'G4Studio - JavaEE行业应用二次快速开发平台V5.2', '登录窗口标题');
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000019', 'LOGIN_WINDOW_BANNER', '/resource/image/login_banner.png', '登录窗口的Banner图片。尺寸规格:450 X 70');
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000020', 'WEST_NAVIGATE_TITLE', '系统导航', '左边菜单导航栏标题');
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000021', 'BOTTOM_COPYRIGHT', 'Copyright 2008 XiongChun 中国.上海', '右下角的版权信息');
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000022', 'MENU_FIRST', 'G4Studio', '中心面板导航菜单的第一个节点名');
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000023', 'WELCOME_PAGE_TITLE', '我的工作台', '缺省欢迎页面的标题');
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000024', 'INDEX_BANNER', '/resource/image/title_banner.png', '首页Banner图片,必须为透明的PNG图片,建议尺寸:600 X 58');
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000025', 'PAGE_LOAD_MSG', 'G4模板引擎组件正在驱动页面,请稍等...', '页面加载等待提示信息');
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000027', 'MULTI_SESSION', '1', '是否运行同一个帐户建立多个会话连接。1:允许;0:不允许');
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000028', 'WEST_CARDMENU_ACTIVEONTOP', '1', '左侧卡片树菜单当前活动卡片是否置顶1:置顶;0:不置顶');
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000029', 'TITLE_ICON', 'g4.ico', '显示在浏览器标题前面的小图标(注:必须为.ico格式)');
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000031', 'EXCEPTION_CLIENT_WIN_SIZE', '400,150', '客户端异常信息窗口宽度高度设置');
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000030', 'EXCEPTION_CLIENT_MSG', '系统发生错误，请和管理员联系。', '客户端异常响应概要信息');
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000033', 'APP_LAYOUT', '1', '系统级缺省主界面布局模式。1:传统经典布局;2:个性桌面布局。');
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000034', 'DESKTOP_BACKGROUND', 'desktop2.jpg', '系统缺省桌面背景图片');
commit;
prompt 19 records loaded
prompt Loading EAROLE...
insert into EAROLE (roleid, rolename, deptid, roletype, remark, locked)
values ('10000069', '昆明市社保局管理角色', '001002001006001', '2', null, '0');
insert into EAROLE (roleid, rolename, deptid, roletype, remark, locked)
values ('10000070', '昆明市社保局业务经办角色', '001002001006001', '1', null, '0');
insert into EAROLE (roleid, rolename, deptid, roletype, remark, locked)
values ('10000071', '五华区社保局管理角色', '001002001006001001', '2', null, '0');
insert into EAROLE (roleid, rolename, deptid, roletype, remark, locked)
values ('10000072', '五华区社保局业务角色', '001002001006001001', '1', null, '0');
insert into EAROLE (roleid, rolename, deptid, roletype, remark, locked)
values ('10000073', '盘龙区社保局管理角色', '001002001006001002', '2', null, '0');
insert into EAROLE (roleid, rolename, deptid, roletype, remark, locked)
values ('10000074', '盘龙区社保局业务经办角色', '001002001006001002', '1', null, '0');
commit;
prompt 6 records loaded
prompt Loading EAROLEAUTHORIZE...
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000069', '01', '2', '10001340');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000069', '0102', '2', '10001341');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000069', '010215', '2', '10001342');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000069', '01021501', '2', '10001343');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000069', '01021502', '2', '10001344');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000069', '01021503', '2', '10001345');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000069', '01021504', '2', '10001346');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000069', '01021505', '2', '10001347');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000069', '01021506', '2', '10001348');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000071', '01', '1', '10001349');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000071', '0101', '1', '10001350');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000071', '010102', '1', '10001351');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000071', '01010201', '1', '10001352');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000071', '01010202', '1', '10001353');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000071', '01010204', '1', '10001354');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000071', '01', '2', '10001355');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000071', '0102', '2', '10001356');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000071', '010216', '2', '10001357');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000071', '01021601', '2', '10001358');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000071', '01021602', '2', '10001359');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000071', '01021603', '2', '10001360');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '01', '1', '10001368');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '0101', '1', '10001369');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '010102', '1', '10001370');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '01010201', '1', '10001371');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '01010202', '1', '10001372');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '01010204', '1', '10001373');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '01010207', '1', '10001374');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '01010208', '1', '10001375');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000070', '01', '1', '10001386');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000070', '0102', '1', '10001387');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000070', '010215', '1', '10001388');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000070', '01021505', '1', '10001389');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000070', '01021506', '1', '10001390');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000072', '01', '1', '10001395');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000072', '0102', '1', '10001396');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000072', '010216', '1', '10001397');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000072', '01021601', '1', '10001398');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000072', '01021602', '1', '10001399');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000072', '01021603', '1', '10001400');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '01', '2', '10001413');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '0102', '2', '10001414');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '010210', '2', '10001415');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '01021001', '2', '10001416');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '01021002', '2', '10001417');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '01021003', '2', '10001418');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '01021004', '2', '10001419');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '01021005', '2', '10001420');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '01021006', '2', '10001421');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '01021007', '2', '10001422');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '010216', '2', '10001423');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '01021601', '2', '10001424');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '01021602', '2', '10001425');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '01021603', '2', '10001426');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000074', '01', '1', '10001427');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000074', '0102', '1', '10001428');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000074', '010210', '1', '10001429');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000074', '01021001', '1', '10001430');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000074', '01021002', '1', '10001431');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000074', '01021003', '1', '10001432');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000074', '01021004', '1', '10001433');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000074', '01021005', '1', '10001434');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000074', '01021006', '1', '10001435');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000074', '01021007', '1', '10001436');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000074', '010216', '1', '10001437');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000074', '01021601', '1', '10001438');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000074', '01021602', '1', '10001439');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000074', '01021603', '1', '10001440');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000069', '01', '1', '10001441');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000069', '0101', '1', '10001442');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000069', '010102', '1', '10001443');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000069', '01010201', '1', '10001444');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000069', '01010202', '1', '10001445');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000069', '01010204', '1', '10001446');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000069', '01010207', '1', '10001447');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000069', '01010208', '1', '10001448');
commit;
prompt 76 records loaded
prompt Loading EAROLEMENUPART...
insert into EAROLEMENUPART (authorizeid, roleid, menuid, partid, partauthtype)
values ('10000006', '10000074', '01021603', '10000115', '1');
insert into EAROLEMENUPART (authorizeid, roleid, menuid, partid, partauthtype)
values ('10000007', '10000074', '01021603', '10000114', '1');
insert into EAROLEMENUPART (authorizeid, roleid, menuid, partid, partauthtype)
values ('10000008', '10000074', '01021603', '10000113', '3');
insert into EAROLEMENUPART (authorizeid, roleid, menuid, partid, partauthtype)
values ('10000009', '10000072', '01021603', '10000115', '1');
insert into EAROLEMENUPART (authorizeid, roleid, menuid, partid, partauthtype)
values ('10000010', '10000072', '01021603', '10000114', '1');
insert into EAROLEMENUPART (authorizeid, roleid, menuid, partid, partauthtype)
values ('10000011', '10000072', '01021603', '10000113', '3');
insert into EAROLEMENUPART (authorizeid, roleid, menuid, partid, partauthtype)
values ('10000012', '10000074', '01021603', '10000116', '1');
commit;
prompt 7 records loaded
prompt Loading EASEQUENCE...
insert into EASEQUENCE (sequenceid, fieldname, maxid, remark, pattern, idtype)
values ('1000', 'CODEID', '10000063', '代码表ID', '00000000', '1');
insert into EASEQUENCE (sequenceid, fieldname, maxid, remark, pattern, idtype)
values ('1001', 'ROLEID', '10000074', '角色ID', '00000000', '1');
insert into EASEQUENCE (sequenceid, fieldname, maxid, remark, pattern, idtype)
values ('1002', 'USERID', '10004890', '用户ID', '00000000', '1');
insert into EASEQUENCE (sequenceid, fieldname, maxid, remark, pattern, idtype)
values ('1003', 'PARAMID', '10000034', '参数ID', '00000000', '1');
insert into EASEQUENCE (sequenceid, fieldname, maxid, remark, pattern, idtype)
values ('1004', 'EXCEPTIONID', '10000067', '异常ID', '00000000', '1');
insert into EASEQUENCE (sequenceid, fieldname, maxid, remark, pattern, idtype)
values ('1005', 'AUTHORIZEID_ROLE', '10001448', '角色授权ID', '00000000', '1');
insert into EASEQUENCE (sequenceid, fieldname, maxid, remark, pattern, idtype)
values ('1006', 'AUTHORIZEID_USER', '10004856', '人员授权ID', '00000000', '1');
insert into EASEQUENCE (sequenceid, fieldname, maxid, remark, pattern, idtype)
values ('1007', 'AUTHORIZEID_USERMENUMAP', '10000343', '人员菜单映射ID', '00000000', '1');
insert into EASEQUENCE (sequenceid, fieldname, maxid, remark, pattern, idtype)
values ('1008', 'XMID', '1000341254', '演示表(EZ_CHARGECATALOG)项目ID', '0000000000', '1');
insert into EASEQUENCE (sequenceid, fieldname, maxid, remark, pattern, idtype)
values ('1009', 'EVENTID', '100000000034826', '事件ID', '000000000000000', '1');
insert into EASEQUENCE (sequenceid, fieldname, maxid, remark, pattern, idtype)
values ('1010', 'MONITORID', '100000000058564', 'SpringBean监控ID', '000000000000000', '1');
insert into EASEQUENCE (sequenceid, fieldname, maxid, remark, pattern, idtype)
values ('1011', 'FILEID', '10000111', '文件ID', '00000000', '1');
insert into EASEQUENCE (sequenceid, fieldname, maxid, remark, pattern, idtype)
values ('1012', 'PARTID', '10000116', 'UI元素ID', '00000000', '1');
insert into EASEQUENCE (sequenceid, fieldname, maxid, remark, pattern, idtype)
values ('1013', 'AUTHORIZEID_EAUSERAUTHORIZE', '10000000', 'UI元素人员授权ID', '00000000', '1');
insert into EASEQUENCE (sequenceid, fieldname, maxid, remark, pattern, idtype)
values ('1014', 'AUTHORIZEID_EAROLEAUTHORIZE', '10000012', 'UI元素角色授权ID', '00000000', '1');
commit;
prompt 15 records loaded
prompt Loading EAUSER...
insert into EAUSER (userid, username, account, password, sex, deptid, locked, remark, usertype, enabled)
values ('10000000', '超级用户', 'super', 'RPEobhXzwig=', '1', '001', '0', '超级用户,享有系统最高管理权限', '3', '1');
insert into EAUSER (userid, username, account, password, sex, deptid, locked, remark, usertype, enabled)
values ('10000001', '开发人员', 'developer', 'RPEobhXzwig=', '0', '001', '0', '1', '3', '1');
insert into EAUSER (userid, username, account, password, sex, deptid, locked, remark, usertype, enabled)
values ('10004885', '熊春_a_1', 'xiongchun_a_1', 'RPEobhXzwig=', '0', '001002001006001', '0', '昆明市社保局管理员', '2', '1');
insert into EAUSER (userid, username, account, password, sex, deptid, locked, remark, usertype, enabled)
values ('10004886', '熊春_b_1', 'xiongchun_b_1', 'RPEobhXzwig=', '0', '001002001006001', '0', null, '1', '1');
insert into EAUSER (userid, username, account, password, sex, deptid, locked, remark, usertype, enabled)
values ('10004887', '熊春_a_2', 'xiongchun_a_2', 'RPEobhXzwig=', '0', '001002001006001001', '0', '五华区社保局管理员', '2', '1');
insert into EAUSER (userid, username, account, password, sex, deptid, locked, remark, usertype, enabled)
values ('10004888', '熊春_b_2', 'xiongchun_b_2', 'RPEobhXzwig=', '0', '001002001006001001', '0', '五华区社保局业务经办员', '1', '1');
insert into EAUSER (userid, username, account, password, sex, deptid, locked, remark, usertype, enabled)
values ('10004889', '熊春_a_3', 'xiongchun_a_3', 'RPEobhXzwig=', '0', '001002001006001002', '0', '盘龙区社保局管理员', '2', '1');
insert into EAUSER (userid, username, account, password, sex, deptid, locked, remark, usertype, enabled)
values ('10004890', '熊春_b_3', 'xiongchun_b_3', 'RPEobhXzwig=', '0', '001002001006001002', '0', '盘龙区社保局业务经办员', '1', '1');
commit;
prompt 8 records loaded
prompt Loading EAUSERAUTHORIZE...
insert into EAUSERAUTHORIZE (userid, roleid, authorizeid)
values ('10004885', '10000069', '10004851');
insert into EAUSERAUTHORIZE (userid, roleid, authorizeid)
values ('10004887', '10000071', '10004852');
insert into EAUSERAUTHORIZE (userid, roleid, authorizeid)
values ('10004889', '10000073', '10004853');
insert into EAUSERAUTHORIZE (userid, roleid, authorizeid)
values ('10004888', '10000072', '10004854');
insert into EAUSERAUTHORIZE (userid, roleid, authorizeid)
values ('10004886', '10000070', '10004855');
insert into EAUSERAUTHORIZE (userid, roleid, authorizeid)
values ('10004890', '10000074', '10004856');
commit;
prompt 6 records loaded
prompt Loading EAUSERMENUMAP...
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000022', '01', '10000163', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000027', '01', '10000157', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000029', '01', '10000179', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000030', '01', '10000185', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000031', '01', '10000189', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000032', '01', '10000193', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000040', '01', '10000308', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000027', '0101', '10000158', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000029', '0101', '10000180', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000030', '0101', '10000186', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000031', '0101', '10000190', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000032', '0101', '10000194', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000027', '010103', '10000159', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000029', '010103', '10000181', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000030', '010103', '10000187', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000031', '010103', '10000191', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000032', '010103', '10000195', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000027', '01010301', '10000160', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000029', '01010301', '10000182', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000030', '01010301', '10000188', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000031', '01010301', '10000192', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000032', '01010301', '10000196', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000027', '01010302', '10000162', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000029', '01010302', '10000184', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000027', '01010303', '10000161', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000029', '01010303', '10000183', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000022', '0102', '10000164', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000040', '0102', '10000309', '1');
commit;
prompt 28 records loaded
prompt Loading EAUSERMENUPART...
prompt Table is empty
prompt Loading EAUSERSUBINFO...
insert into EAUSERSUBINFO (userid, theme, layout, background)
values ('10000000', 'lightRed', null, null);
insert into EAUSERSUBINFO (userid, theme, layout, background)
values ('10000001', 'default', '1', 'desktop1.jpg');
insert into EAUSERSUBINFO (userid, theme, layout, background)
values ('10004885', null, null, null);
insert into EAUSERSUBINFO (userid, theme, layout, background)
values ('10004886', null, null, null);
insert into EAUSERSUBINFO (userid, theme, layout, background)
values ('10004887', null, null, null);
insert into EAUSERSUBINFO (userid, theme, layout, background)
values ('10004888', null, null, null);
insert into EAUSERSUBINFO (userid, theme, layout, background)
values ('10004889', null, null, null);
insert into EAUSERSUBINFO (userid, theme, layout, background)
values ('10004890', null, null, null);
commit;
prompt 8 records loaded
prompt Loading EA_DEMO_BYJSB...
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000001042', '美国国防部', '001999', '王玲', '女', 77, 20101.29, 0, 20101.29, to_date('03-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000004561', '美国国防部', '000410', '马鸣文', '男', 85, 27803.35, 13.84, 27789.51, to_date('31-03-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000004306', '美国国防部', '002618', '梁晨', '男', 80, 29354.35, 0, 29354.35, to_date('31-03-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000004236', '美国国防部', '003521', '刘槐', '男', 79, 3551.82, 0, 3551.82, to_date('31-03-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000004277', '美国国防部', '001758', '周光华', '男', 81, 10455.43, 41.52, 10413.91, to_date('31-03-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000004435', '美国国防部', '000698', '纳梓彬', '男', 85, 50253.03, 138.4, 50114.63, to_date('31-03-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000004335', '美国国防部', '000992', '刘宗敬', '男', 84, 38700.92, 0, 38700.92, to_date('31-03-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000004223', '美国国防部', '002614', '马继武', '男', 88, 8771.32, 0, 8771.32, to_date('31-03-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000004326', '美国国防部', '000643', '齐岳', '男', 81, 15085.67, 0, 15085.67, to_date('31-03-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000002919', '美国国防部', '000871', '连光彩', '男', 86, 20628.03, 0, 20628.03, to_date('31-03-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000001150', '美国国防部', '001841', '鲁月英', '女', 79, 18398.57, 0, 18398.57, to_date('31-03-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000002554', '美国国防部', '000478', '张福基', '男', 81, 28484.7, 41.52, 28443.18, to_date('31-03-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000002366', '美国国防部', '000554', '赵瑞兰', '女', 82, 22886.96, 0, 22886.96, to_date('31-03-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000001132', '美国国防部', '002215', '曲贵和', '男', 78, 46600.76, 33.08, 46567.68, to_date('31-03-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000004363', '美国国防部', '001614', '郭志光', '男', 76, 9200.76, 0, 9200.76, to_date('31-03-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000003304', '美国国防部', '000169', '王喜云', '男', 80, 33303.11, 0, 33303.11, to_date('31-03-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005510', '美国国防部', '000282', '赵岵生', '女', 81, 76.95, 0, 76.95, to_date('13-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005514', '美国国防部', '002585', '戴钧', '男', 77, 253.72, 0, 253.72, to_date('13-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005515', '美国国防部', '002585', '戴钧', '男', 77, 315.45, 0, 315.45, to_date('13-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005516', '美国国防部', '002585', '戴钧', '男', 77, 185, 0, 185, to_date('13-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005520', '美国国防部', '002585', '戴钧', '男', 77, 107.6, 0, 107.6, to_date('13-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145620');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005205', '美国国防部', '001858', '何智深', '男', 78, 144.5, 0, 144.5, to_date('07-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005217', '美国国防部', '001737', '孙自元', '男', 86, 314.86, 0, 314.86, to_date('07-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005269', '美国国防部', '002569', '李国民', '男', 79, 172.68, 0, 172.68, to_date('08-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005289', '美国国防部', '004077', '罗耀彬', '男', 75, 164.16, 0, 164.16, to_date('08-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145599');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005293', '美国国防部', '003568', '周登岐', '男', 81, 145.95, 0, 145.95, to_date('08-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005297', '美国国防部', '002521', '李丽华', '女', 79, 144.49, 0, 144.49, to_date('08-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005300', '美国国防部', '004077', '罗耀彬', '男', 75, 3.84, 0, 3.84, to_date('08-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145599');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005302', '美国国防部', '002521', '李丽华', '女', 79, 148.68, 0, 148.68, to_date('08-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005713', '美国国防部', '001731', '潘宝坤　', '男', 79, 102.53, 0, 102.53, to_date('15-04-2009 10:12:10', 'dd-mm-yyyy hh24:mi:ss'), '北京市第一人民医院', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005714', '美国国防部', '001006', '王廷玉', '男', 80, 290.58, 0, 290.58, to_date('17-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145640');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005720', '美国国防部', '005147', '吴定文', '男', 76, 68.88, 0, 68.88, to_date('17-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145640');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005874', '美国国防部', '002639', '蔡惠霖', '男', 79, 63.18, 0, 63.18, to_date('14-05-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11130085');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000003900', '美国国防部', '001587', '吴明道', '男', 76, 14645.51, 0, 14645.51, to_date('08-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000000935', '美国国防部', '001420', '刘宗旺', '男', 81, 34113.88, 1.38, 34112.5, to_date('08-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005374', '美国国防部', '003886', '刘云光', '男', 81, 133.63, 0, 133.63, to_date('09-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005376', '美国国防部', '001514', '汤幼盘', '男', 77, 218.95, 0, 218.95, to_date('09-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005395', '美国国防部', '000630', '李同道', '男', 80, 149.09, 0, 149.09, to_date('09-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000003894', '美国国防部', '000873', '王理合', '男', 82, 17959.09, 0, 17959.09, to_date('09-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005425', '美国国防部', '000120', '王品珩', '男', 77, 502.48, 0, 502.48, to_date('09-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005433', '美国国防部', '002557', '高永庆', '男', 80, 214.57, 0, 214.57, to_date('10-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005440', '美国国防部', '001324', '周天启', '女', 74, 74, 0, 74, to_date('10-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145593');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005444', '美国国防部', '004077', '罗耀彬', '男', 75, 305, 0, 305, to_date('10-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145593');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005445', '美国国防部', '001324', '周天启', '女', 74, 27, 0, 27, to_date('10-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145599');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005449', '美国国防部', '002472', '李凤翔', '男', 82, 132.26, 0, 132.26, to_date('10-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145593');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005450', '美国国防部', '002472', '李凤翔', '男', 82, 95.94, 5.76, 90.18, to_date('10-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145593');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005451', '美国国防部', '002472', '李凤翔', '男', 82, 166.44, 0, 166.44, to_date('10-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145593');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000004571', '美国国防部', '000842', '张文光', '男', 84, 7025.69, 0, 7025.69, to_date('10-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005458', '美国国防部', '002137', '文兆光', '男', 78, 197.06, 0, 197.06, to_date('10-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005459', '美国国防部', '002137', '文兆光', '男', 78, 356.17, 0, 356.17, to_date('10-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005463', '美国国防部', '001093', '蒋世荣', '男', 81, 212.61, 0, 212.61, to_date('10-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145593');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005464', '美国国防部', '004763', '钟开泰', '男', 80, 200.4, 0, 200.4, to_date('10-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145593');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005465', '美国国防部', '001997', '乌汝政', '男', 74, 381.28, 0, 381.28, to_date('10-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000004466', '美国国防部', '002804', '黄彦超', '男', 77, 14178.69, 0, 14178.69, to_date('10-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005473', '美国国防部', '000871', '连光彩', '男', 86, 207.84, 0, 207.84, to_date('11-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005475', '美国国防部', '000871', '连光彩', '男', 86, 274.07, 0, 274.07, to_date('11-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005490', '美国国防部', '000853', '王永高', '男', 75, 208.52, 0, 208.52, to_date('13-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000004023', '美国国防部', '000589', '邹瑞荣', '女', 81, 11115.78, 4.58, 11111.2, to_date('13-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005499', '美国国防部', '001888', '宋连升', '男', 83, 102.03, 29.47, 72.56, to_date('13-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005506', '美国国防部', '000282', '赵岵生', '女', 81, 358.84, 0, 358.84, to_date('13-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005508', '美国国防部', '000282', '赵岵生', '女', 81, 209.19, 0, 209.19, to_date('13-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005509', '美国国防部', '000630', '李同道', '男', 80, 50.43, 0, 50.43, to_date('13-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005651', '美国国防部', '000602', '李海庆', '男', 82, .49, 0, .49, to_date('16-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005652', '美国国防部', '000602', '李海庆', '男', 82, 172.91, 0, 172.91, to_date('16-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005658', '美国国防部', '000630', '李同道', '男', 80, 155.21, 0, 155.21, to_date('16-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005659', '美国国防部', '000630', '李同道', '男', 80, 69.85, 0, 69.85, to_date('16-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005743', '美国国防部', '001517', '周瑞', '男', 75, 15, 0, 15, to_date('18-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005744', '美国国防部', '001517', '周瑞', '男', 75, 80, 0, 80, to_date('18-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005746', '美国国防部', '001234', '曹应珍', '女', 77, 38.21, 0, 38.21, to_date('18-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005747', '美国国防部', '001234', '曹应珍', '女', 77, 370.34, 0, 370.34, to_date('18-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005765', '美国国防部', '000853', '王永高', '男', 75, 248.61, 0, 248.61, to_date('20-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145593');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005569', '美国国防部', '000768', '刘嘉喜', '男', 86, 56.54, 0, 56.54, to_date('14-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005583', '美国国防部', '001514', '汤幼盘', '男', 77, 82, 0, 82, to_date('14-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005597', '美国国防部', '000979', '温凤仙', '女', 73, 221.58, 0, 221.58, to_date('15-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145608');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005605', '美国国防部', '001008', '段庆生', '男', 77, 304.24, 0, 304.24, to_date('15-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005623', '美国国防部', '000966', '张兴华', '男', 84, 208.18, 0, 208.18, to_date('15-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000004218', '美国国防部', '005145', '石仁杰', '男', 76, 22657, 0, 22657, to_date('15-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000004620', '美国国防部', '000124', '杨艺芳', '女', 78, 44522.13, .24, 44521.89, to_date('15-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005631', '美国国防部', '000416', '景秀英', '女', 76, 70, 10, 60, to_date('15-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145608');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005640', '美国国防部', '004133', '张国维', '男', 75, 169.12, 0, 169.12, to_date('16-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005642', '美国国防部', '002557', '高永庆', '男', 80, 139.48, 0, 139.48, to_date('16-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005780', '美国国防部', '000282', '赵岵生', '女', 81, 121.11, 0, 121.11, to_date('20-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145593');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005783', '美国国防部', '000979', '温凤仙', '女', 73, 101.38, 0, 101.38, to_date('20-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145593');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005675', '美国国防部', '002149', '马懿', '女', 79, 173.53, 0, 173.53, to_date('16-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005676', '美国国防部', '002149', '马懿', '女', 79, 94.2, 0, 94.2, to_date('16-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005677', '美国国防部', '002149', '马懿', '女', 79, 416.7, 0, 416.7, to_date('16-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005678', '美国国防部', '002149', '马懿', '女', 79, 150, 0, 150, to_date('16-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005682', '美国国防部', '001093', '蒋世荣', '男', 81, 232.98, 0, 232.98, to_date('16-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005696', '美国国防部', '001308', '何琼芳', '女', 77, .49, 0, .49, to_date('17-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005697', '美国国防部', '001308', '何琼芳', '女', 77, 204.96, 0, 204.96, to_date('17-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005704', '美国国防部', '004077', '罗耀彬', '男', 75, 50, 0, 50, to_date('17-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145640');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005706', '美国国防部', '004077', '罗耀彬', '男', 75, 225, 10, 215, to_date('17-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145640');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005709', '美国国防部', '004077', '罗耀彬', '男', 75, 15, 0, 15, to_date('17-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145640');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005717', '美国国防部', '005147', '吴定文', '男', 76, 79.79, 0, 79.79, to_date('17-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145640');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005553', '美国国防部', '004416', '陈仙娥', '女', 78, 237.02, 0, 237.02, to_date('14-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145606');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000002646', '美国国防部', '002451', '马春喜', '男', 77, 10788.07, 90.11, 10697.96, to_date('03-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005095', '美国国防部', '000943', '陈立基', '男', 80, 967.12, 0, 967.12, to_date('03-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145624');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005097', '美国国防部', '002343', '王金德', '男', 78, 170.93, 0, 170.93, to_date('03-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11145597');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000004260', '美国国防部', '002776', '原俊华', '女', 76, 6272.9, 62.6, 6210.3, to_date('03-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000003906', '美国国防部', '004961', '张剑云', '男', null, 27195.52, 27.68, 27167.84, to_date('03-04-2009', 'dd-mm-yyyy'), '北京市第一人民医院', '11138416');
commit;
prompt 100 records loaded
prompt Loading EA_DEMO_BYMXB...
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063409', '住院', '000768', '刘嘉喜', '经血管介入诊疗', '经皮选择性浅静脉置管术', 1, 5, 5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063410', '住院', '000768', '刘嘉喜', '一般检查治疗', '普通输液器输液(第一组)', 1, 5, 5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063411', '住院', '000768', '刘嘉喜', '材料费', 'BD留置针', 1, 17.43, 17.43, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063412', '住院', '000768', '刘嘉喜', '材料费', '一次性硬膜外麻醉包(河南AS-E)', 1, 42, 42, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063413', '住院', '000768', '刘嘉喜', '材料费', '医用可吸收缝合线(强生薇乔J397G4/0)', 1, 49.71, 49.71, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063414', '住院', '000768', '刘嘉喜', '手术治疗', '硬膜外阻滞麻醉(2小时及以内)', 1, 180, 180, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063415', '住院', '000768', '刘嘉喜', '西药', '氯化钠针500ml玻璃', 2, 2.07, 4.14, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063416', '住院', '000768', '刘嘉喜', '西药', '乳酸钠林格针', 2, 6.27, 12.54, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063417', '住院', '000768', '刘嘉喜', '一般检查治疗', '氧气吸入(普通给氧)', 2.5, 3, 7.5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063418', '住院', '000768', '刘嘉喜', '手术治疗', '麻醉中监测', 2.5, 50, 125, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063419', '住院', '000768', '刘嘉喜', '西药', '布比卡因针', 3, .91, 2.73, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063420', '住院', '000768', '刘嘉喜', '西药', '哌替啶针', 6, 2.67, 16.02, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063421', '住院', '000768', '刘嘉喜', '一般检查治疗', '静脉输液(第二组起）', 1, 1, 1, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063422', '住院', '000768', '刘嘉喜', '物理治疗与康复', '红外线治疗', 1, 10, 10, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063423', '住院', '000768', '刘嘉喜', '西药', '果糖针', 1, 45.53, 45.53, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063424', '住院', '000768', '刘嘉喜', '物理治疗与康复', '气压治疗', 2, 15, 30, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063425', '住院', '000768', '刘嘉喜', '一般医疗服务', '住院诊查费', 1, 3, 3, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063426', '住院', '000768', '刘嘉喜', '床位费', '二床间一档', 1, 40, 40, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063427', '住院', '000169', '王喜云', '西药', '氨溴索粉针', 2, 16.07, 32.14, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063428', '住院', '000169', '王喜云', '西药', '安茶碱片', 1, .02, .02, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063429', '住院', '000169', '王喜云', '西药', '尼麦角林片', 1, 1, 1, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063430', '住院', '000169', '王喜云', '西药', '阿卡波糖片(J)', 1, 2.48, 2.48, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063431', '住院', '000169', '王喜云', '物理治疗与康复', '红外线治疗', 1, 10, 10, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063432', '住院', '000169', '王喜云', '物理治疗与康复', '红外线治疗', 2, 10, 20, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063433', '住院', '000169', '王喜云', '一般检查治疗', '吸痰护理', 1, 5, 5, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063434', '住院', '000169', '王喜云', '西药', '安茶碱片', 1, .02, .02, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063435', '住院', '000169', '王喜云', '西药', '尼麦角林片', 1, 1, 1, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063436', '住院', '000169', '王喜云', '一般检查治疗', '雾化吸入', 1, 2, 2, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063437', '住院', '000169', '王喜云', '西药', '阿卡波糖片(J)', 1, 2.48, 2.48, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063438', '住院', '000169', '王喜云', '西药', '氯化钠针100ml(直立软袋)', 1, 5.11, 5.11, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063439', '住院', '000169', '王喜云', '西药', '氯化钠针100ml(直立软袋)', 1, 5.11, 5.11, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063440', '住院', '000169', '王喜云', '西药', '氨溴索针', 1, 6.79, 6.79, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063441', '住院', '000169', '王喜云', '物理治疗与康复', '红外线治疗', 1, 10, 10, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063442', '住院', '000169', '王喜云', '西药', '吸入用布地奈德混悬液', 1, 19.47, 19.47, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063443', '住院', '000169', '王喜云', '物理治疗与康复', '红外线治疗', 2, 10, 20, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063444', '住院', '000169', '王喜云', '西药', '头孢吡肟粉针', 4, 43.67, 174.68, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063445', '住院', '000169', '王喜云', '西药', '阿普唑仑片100', 1, .11, .11, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063446', '住院', '000169', '王喜云', '临床各系统诊疗', '血氧饱和度监测', 1, 2, 2, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063447', '住院', '000169', '王喜云', '西药', '氟伐他汀钠胶囊', 1, 4.7, 4.7, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063448', '住院', '000169', '王喜云', '一般检查治疗', '吸痰护理', 1, 5, 5, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063449', '住院', '000169', '王喜云', '一般检查治疗', '吸痰护理', 1, 5, 5, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063450', '住院', '000169', '王喜云', '一般医疗服务', '住院诊查费', 1, 3, 3, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063451', '住院', '000169', '王喜云', '床位费', '二床间一档', 1, 40, 40, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063452', '住院', '000169', '王喜云', '西药', '阿司匹林肠溶片(J)', 1, .5, .5, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063453', '住院', '000169', '王喜云', '西药', '阿米三嗪箩巴新片', 1, 3.07, 3.07, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063454', '住院', '000169', '王喜云', '西药', '安茶碱片', 1, .02, .02, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063455', '住院', '000169', '王喜云', '西药', '速尿片', 1, .02, .02, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063456', '住院', '000169', '王喜云', '西药', '螺内酯片', 1, .11, .11, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063457', '住院', '000169', '王喜云', '材料费', '一次性双鼻输氧管', 1, .9, .9, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063458', '住院', '000169', '王喜云', '西药', '尼麦角林片', 1, 1, 1, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063459', '住院', '000169', '王喜云', '西药', '比索洛尔片(J)', 1, 3.45, 3.45, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063460', '住院', '000169', '王喜云', '西药', '骨化三醇胶丸', 1, 4.97, 4.97, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063461', '住院', '000169', '王喜云', '西药', '氨氯地平片(J)', 1, 5.84, 5.84, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063462', '住院', '000169', '王喜云', '西药', '氨溴索粉针', 2, 16.07, 32.14, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063463', '住院', '000169', '王喜云', '西药', '安茶碱片', 1, .02, .02, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063464', '住院', '000169', '王喜云', '西药', '阿卡波糖片(J)', 1, 2.48, 2.48, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063465', '住院', '000169', '王喜云', '物理治疗与康复', '红外线治疗', 1, 10, 10, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063466', '住院', '000169', '王喜云', '物理治疗与康复', '红外线治疗', 2, 10, 20, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063467', '住院', '000169', '王喜云', '一般检查治疗', '吸痰护理', 1, 5, 5, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063468', '住院', '000169', '王喜云', '西药', '安茶碱片', 1, .02, .02, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063469', '住院', '000169', '王喜云', '西药', '阿卡波糖片(J)', 1, 2.48, 2.48, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063470', '住院', '000169', '王喜云', '物理治疗与康复', '红外线治疗', 1, 10, 10, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063471', '住院', '000169', '王喜云', '物理治疗与康复', '红外线治疗', 2, 10, 20, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063472', '住院', '000169', '王喜云', '西药', '头孢吡肟粉针', 4, 43.67, 174.68, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063473', '住院', '000169', '王喜云', '西药', '氟伐他汀钠胶囊', 1, 4.7, 4.7, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063474', '住院', '000169', '王喜云', '一般检查治疗', '吸痰护理', 1, 5, 5, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063475', '住院', '000169', '王喜云', '一般检查治疗', '吸痰护理', 1, 5, 5, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063476', '住院', '000169', '王喜云', '一般医疗服务', '住院诊查费', 1, 3, 3, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063477', '住院', '000169', '王喜云', '床位费', '二床间一档', 1, 40, 40, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063478', '住院', '000169', '王喜云', '西药', '安茶碱片', 1, .02, .02, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063479', '住院', '000169', '王喜云', '西药', '阿卡波糖片(J)', 1, 2.48, 2.48, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063480', '住院', '000169', '王喜云', '西药', '氯霉素滴眼液', 1, 2.88, 2.88, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063481', '住院', '000169', '王喜云', '一般检查治疗', 'Ⅱ级护理', 1, 5, 5, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063482', '住院', '000169', '王喜云', '一般检查治疗', '吸痰护理', 1, 5, 5, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063483', '住院', '000169', '王喜云', '西药', '氯化钠针100ml(直立软袋)', 1, 5.11, 5.11, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063484', '住院', '000169', '王喜云', '西药', '氯化钠针250ml(直立软袋)', 1, 5.45, 5.45, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063485', '住院', '000169', '王喜云', '西药', '氯化钠针250ml(直立软袋)', 1, 5.45, 5.45, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063486', '住院', '000169', '王喜云', '物理治疗与康复', '红外线治疗', 1, 10, 10, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063487', '住院', '000169', '王喜云', '一般检查治疗', '雾化吸入', 1, 2, 2, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063488', '住院', '000169', '王喜云', '临床各系统诊疗', '血氧饱和度监测', 1, 2, 2, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063489', '住院', '000169', '王喜云', '西药', '阿卡波糖片(J)', 1, 2.48, 2.48, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063490', '住院', '000169', '王喜云', '一般检查治疗', 'Ⅱ级护理', 1, 5, 5, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063491', '住院', '000169', '王喜云', '物理治疗与康复', '红外线治疗', 2, 10, 20, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063492', '住院', '000169', '王喜云', '西药', '脑蛋白水解物粉针60', 3, 59.22, 177.66, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063493', '住院', '000169', '王喜云', '西药', '头孢吡肟粉针', 4, 43.67, 174.68, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063494', '住院', '000169', '王喜云', '中药、中成药', '舒血宁针2ml', 10, 11.75, 117.5, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063495', '住院', '000169', '王喜云', '临床各系统诊疗', '血氧饱和度监测', 24, 2, 48, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063496', '住院', '000169', '王喜云', '一般检查治疗', '氧气吸入(普通给氧)', 24, 3, 72, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063497', '住院', '000842', '张文光', '检验', '丙型肝炎抗体测定(定性测定)(输血前四项)', 1, 20, 20, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063498', '住院', '000842', '张文光', '检验', '人免疫缺陷病毒抗体测定（免疫学法）(输血前四项)', 1, 25, 25, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063499', '住院', '000842', '张文光', '西药', '低分子量肝素钠粉针（skn）', 1, 26.62, 26.62, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063500', '住院', '000842', '张文光', '西药', '酚氨咖敏（克感敏片）', 2, 3.22, 6.44, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063501', '住院', '000842', '张文光', '西药', '云南白药酊', 2, 29.76, 59.52, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063502', '住院', '000842', '张文光', '西药', '左卡尼汀针', 5, 44, 220, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063503', '住院', '000842', '张文光', '中药饮片', '板蓝根*', 10, .84, 8.4, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063504', '住院', '000842', '张文光', '西药', '低分子量肝素钠粉针（skn）', 1, 26.62, 26.62, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063505', '住院', '000842', '张文光', '中药、中成药', '参麦针100ml', 1, 103.95, 103.95, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063506', '住院', '000842', '张文光', '中药、中成药', '六味地黄浓缩丸200', 2, 11.22, 22.44, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063507', '住院', '000842', '张文光', '中药、中成药', '血塞通软胶囊', 2, 38.28, 76.56, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063508', '住院', '000842', '张文光', '西药', '低分子量肝素钠粉针（skn）', 1, 26.62, 26.62, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
commit;
prompt 100 records committed...
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063509', '住院', '000842', '张文光', '西药', '左卡尼汀针', 5, 44, 220, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063510', '住院', '000842', '张文光', '西药', '低分子量肝素钠粉针（skn）', 1, 26.62, 26.62, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063511', '住院', '000842', '张文光', '西药', '骨化三醇胶丸', 2, 49.7, 99.4, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063512', '住院', '000842', '张文光', '西药', '曲美他嗪片', 2, 53.98, 107.96, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063513', '住院', '000842', '张文光', '临床各系统诊疗', '血液透析滤过', 2, 500, 1000, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063514', '住院', '000842', '张文光', '一般检查治疗', '普通输液器输液(第一组)', 6, 5, 30, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063515', '住院', '000842', '张文光', '中药、中成药', '参麦针10ml', 6, 16.48, 98.88, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063516', '住院', '000842', '张文光', '一般检查治疗', '静脉注射', 13, 4, 52, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063517', '住院', '000842', '张文光', '临床各系统诊疗', '血液透析', 17, 400, 6800, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063518', '住院', '000842', '张文光', '临床各系统诊疗', '血透监测', 19, 120, 2280, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063519', '住院', '000842', '张文光', '中药、中成药', '仙灵骨葆胶囊', 2, 27.79, 55.58, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063520', '住院', '000842', '张文光', '西药', '低分子量肝素钠粉针（skn）', 1, 26.62, 26.62, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063521', '住院', '000842', '张文光', '中药、中成药', '参麦针100ml', 1, 103.95, 103.95, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063522', '住院', '000842', '张文光', '中药、中成药', '百令胶囊', 2, 36.5, 73, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063523', '住院', '000842', '张文光', '西药', '左卡尼汀针', 2, 44, 88, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063524', '住院', '000842', '张文光', '检验', '尿素测定（酶促动力学法）(肾功能1)（10项）', 1, 8, 8, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063525', '住院', '000842', '张文光', '检验', '血清尿酸测定(肾功能1)（10项）', 1, 8, 8, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063526', '住院', '000842', '张文光', '西药', '氯化钠针100ml(直立软袋)', 1, 5.11, 5.11, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063527', '住院', '000842', '张文光', '西药', '低分子量肝素钠粉针（skn）', 1, 26.62, 26.62, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063528', '住院', '000842', '张文光', '中药、中成药', '参麦针100ml', 1, 103.95, 103.95, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063529', '住院', '000842', '张文光', '西药', '丹参川芎嗪针', 2, 42.02, 84.04, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063530', '住院', '000842', '张文光', '西药', '低分子量肝素钠粉针（skn）', 1, 26.62, 26.62, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063531', '住院', '000842', '张文光', '中药、中成药', '参麦针100ml', 1, 103.95, 103.95, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063532', '住院', '000842', '张文光', '西药', '头孢羟氨苄片', 2, 28.58, 57.16, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063533', '住院', '000842', '张文光', '西药', '云南白药酊', 2, 29.76, 59.52, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063534', '住院', '000842', '张文光', '西药', '泮托拉唑胶囊(pls)', 2, 58.3, 116.6, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063535', '住院', '000842', '张文光', '西药', '左卡尼汀针', 5, 44, 220, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063536', '住院', '000842', '张文光', '临床各系统诊疗', '十二通道心电图床旁检查', 1, 25, 25, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063537', '住院', '000842', '张文光', '西药', '低分子量肝素钠粉针（skn）', 1, 26.62, 26.62, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063538', '住院', '000842', '张文光', '中药、中成药', '参麦针100ml', 1, 103.95, 103.95, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063539', '住院', '000842', '张文光', '中药、中成药', '复方丹参片', 2, 1.04, 2.08, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063540', '住院', '000842', '张文光', '中药、中成药', '心血康胶囊', 2, 7.76, 15.52, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063541', '住院', '000842', '张文光', '西药', '低分子量肝素钠粉针（skn）', -1, -26.62, -26.62, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), null);
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063542', '住院', '000842', '张文光', '中药、中成药', '参麦针100ml', -1, -103.95, -103.95, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), null);
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063216', '住院', '000768', '刘嘉喜', '检验', '血清前白蛋白测定（免疫比浊法等）(肝功能1)', 1, 10, 10, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063217', '住院', '000768', '刘嘉喜', '检验', '血清载脂蛋白AⅠ测定', 1, 10, 10, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063218', '住院', '000768', '刘嘉喜', '检验', '血清载脂蛋白B测定(肝功能1)', 1, 10, 10, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063219', '住院', '000768', '刘嘉喜', '检验', '血清肌酸激酶－MB同工酶质量测定(肝功能1)', 1, 50, 50, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063347', '住院', '000169', '王喜云', '一般医疗服务', '住院诊查费', 1, 3, 3, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063348', '住院', '000169', '王喜云', '床位费', '二床间一档', 1, 40, 40, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063349', '住院', '000169', '王喜云', '西药', '安茶碱片', 1, .02, .02, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063350', '住院', '000169', '王喜云', '西药', '阿卡波糖片(J)', 1, 2.48, 2.48, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063351', '住院', '000169', '王喜云', '一般检查治疗', 'Ⅱ级护理', 1, 5, 5, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063352', '住院', '000169', '王喜云', '一般检查治疗', '吸痰护理', 1, 5, 5, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063353', '住院', '000169', '王喜云', '西药', '氯化钠针250ml(直立软袋)', 1, 5.45, 5.45, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063354', '住院', '000169', '王喜云', '物理治疗与康复', '红外线治疗', 1, 10, 10, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063355', '住院', '000169', '王喜云', '物理治疗与康复', '红外线治疗', 2, 10, 20, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063356', '住院', '000169', '王喜云', '西药', '脑蛋白水解物粉针60', 3, 59.22, 177.66, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063357', '住院', '000169', '王喜云', '推拿疗法', '其他推拿治疗', 1, 25, 25, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063358', '住院', '000169', '王喜云', '物理治疗与康复', '气压治疗', 2, 15, 30, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063359', '住院', '000169', '王喜云', '西药', '头孢吡肟粉针', 4, 43.67, 174.68, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063360', '住院', '000169', '王喜云', '中药、中成药', '舒血宁针2ml', 10, 11.75, 117.5, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063361', '住院', '000169', '王喜云', '临床各系统诊疗', '血氧饱和度监测', 24, 2, 48, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063362', '住院', '000169', '王喜云', '一般检查治疗', '氧气吸入(普通给氧)', 24, 3, 72, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063363', '住院', '000169', '王喜云', '临床各系统诊疗', '遥测心电监护', 24, 6, 144, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063364', '住院', '000169', '王喜云', '西药', '碳酸钙D3片', 1, .95, .95, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063365', '住院', '000842', '张文光', '西药', '云南白药酊', 2, 29.76, 59.52, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063366', '住院', '000842', '张文光', '西药', '低分子量肝素钠粉针（skn）', 1, 26.62, 26.62, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063367', '住院', '000842', '张文光', '西药', '低分子量肝素钠粉针（skn）', 1, 26.62, 26.62, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063368', '住院', '000842', '张文光', '西药', '低分子量肝素钠粉针（skn）', 1, 26.62, 26.62, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063369', '住院', '000842', '张文光', '西药', '单硝酸异山梨酯缓释片(J)', 2, 16.27, 32.54, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063370', '住院', '000842', '张文光', '中药、中成药', '速效救心丸120', 2, 20.33, 40.66, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063371', '住院', '000842', '张文光', '中药、中成药', '复方丹参滴丸', 2, 23.93, 47.86, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063372', '住院', '000842', '张文光', '西药', '左卡尼汀针', 5, 44, 220, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063373', '住院', '000842', '张文光', '西药', '低分子量肝素钠粉针（skn）', 1, 26.62, 26.62, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063374', '住院', '000842', '张文光', '中药、中成药', '复方丹参滴丸', 2, 23.93, 47.86, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063375', '住院', '000842', '张文光', '中药、中成药', '天麻醒脑胶囊', 2, 27.94, 55.88, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063376', '住院', '000842', '张文光', '检验', '无机磷测定(肾功能1)（10项）', 1, 4, 4, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063377', '住院', '000842', '张文光', '检验', '肌酐测定（酶促动力学法等）(肾功能1)（10项）', 1, 5, 5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063378', '住院', '000842', '张文光', '检验', '葡萄糖测定(肾功能1)（10项）', 1, 5, 5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063379', '住院', '000842', '张文光', '检验', '乳酸脱氢酶测定（速率法等）(肝功能1)', 1, 5, 5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063380', '住院', '000842', '张文光', '检验', '血清γ-谷氨酰基转移酶测定(手工法、速率法等)g1', 1, 5, 5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063381', '住院', '000842', '张文光', '检验', '血清白蛋白测定（化学法等）(肝功能1）', 1, 5, 5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063382', '住院', '000842', '张文光', '检验', '血清丙氨酸氨基转移酶测定(手工法、速率法等)肝功能', 1, 5, 5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063383', '住院', '000842', '张文光', '检验', '血清甘油三酯测定（化学法、酶法等）(肝功能1)', 1, 5, 5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063384', '住院', '000842', '张文光', '检验', '血清间接胆红素测定（手工法、速率法等）(肝功能1)', 1, 5, 5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063385', '住院', '000842', '张文光', '检验', '血清碱性磷酸酶测定（手工法、速率法等）(肝功能1)', 1, 5, 5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063386', '住院', '000842', '张文光', '检验', '血清天门冬氨酸氨基转移酶测定（手工法、速率法等）', 1, 5, 5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063387', '住院', '000842', '张文光', '检验', '血清直接胆红素测定（化学法、酶促法等）(肝功能1）', 1, 5, 5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063388', '住院', '000842', '张文光', '检验', '血清总胆固醇测定（化学法、酶法等）(肝功能1)', 1, 5, 5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063389', '住院', '000842', '张文光', '检验', '血清总胆红素测定（化学法、酶促法等)（肝功能1）', 1, 5, 5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063390', '住院', '000842', '张文光', '检验', '血清总蛋白测定（化学法等）(肝功能1）', 1, 5, 5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063391', '住院', '000842', '张文光', '检验', '乙型肝炎e抗体测定(定量测定)(输血前四项)', 1, 18, 18, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063392', '住院', '000842', '张文光', '检验', '乙型肝炎e抗原测定(定量测定)(输血前四项)', 1, 18, 18, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063393', '住院', '000842', '张文光', '检验', '乙型肝炎表面抗体测定(定量测定)(输血前四项)', 1, 18, 18, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063394', '住院', '000842', '张文光', '检验', '乙型肝炎表面抗原(定量测定)(输血前四项)', 1, 18, 18, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063395', '住院', '000842', '张文光', '检验', '乙型肝炎核心抗体测定(定量测定)(输血前四项)', 1, 18, 18, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063396', '住院', '000842', '张文光', '一般检查治疗', '氧气吸入(普通给氧)', 35.5, 3, 106.5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063397', '住院', '000842', '张文光', '西药', '低分子量肝素钠粉针（skn）', 1, 26.62, 26.62, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063398', '住院', '000842', '张文光', '西药', '吡诺克辛滴眼液', 2, 15.14, 30.28, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063399', '住院', '000768', '刘嘉喜', '西药', '氯化钾针', 1, .5, .5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063400', '住院', '000768', '刘嘉喜', '一般检查治疗', '静脉输液(第二组起）', 1, 1, 1, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063401', '住院', '000768', '刘嘉喜', '西药', '10%葡萄糖针500ml塑料', 1, 3.28, 3.28, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063402', '住院', '000768', '刘嘉喜', '一般检查治疗', '普通输液器输液(第一组)', 1, 5, 5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063403', '住院', '000768', '刘嘉喜', '西药', '氯化钠针250ml(直立软袋)', 1, 5.45, 5.45, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063404', '住院', '000768', '刘嘉喜', '西药', '头孢替安粉针0.5', 6, 45.1, 270.6, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063405', '住院', '000768', '刘嘉喜', '手术治疗', '椎管内麻醉（2小时以上）', .5, 40, 20, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063406', '住院', '000768', '刘嘉喜', '西药', '利多卡因针', 1, .44, .44, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063407', '住院', '000768', '刘嘉喜', '一般检查治疗', '静脉输液(第二组起）', 1, 1, 1, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063408', '住院', '000768', '刘嘉喜', '西药', '氟哌利多针', 1, 2, 2, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
commit;
prompt 200 records loaded
prompt Loading EA_DEMO_CHINAAREA...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230804', '前进区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230805', '东风区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230811', '郊　区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230822', '桦南县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230826', '桦川县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230828', '汤原县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230833', '抚远县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230881', '同江市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230882', '富锦市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230901', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230902', '新兴区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230903', '桃山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230904', '茄子河区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230921', '勃利县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231001', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231002', '东安区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231003', '阳明区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231004', '爱民区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231005', '西安区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231024', '东宁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231025', '林口县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231081', '绥芬河市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231083', '海林市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231084', '宁安市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231085', '穆棱市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231102', '爱辉区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231121', '嫩江县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231123', '逊克县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231124', '孙吴县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231181', '北安市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231182', '五大连池市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231201', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231202', '北林区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231221', '望奎县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231222', '兰西县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231223', '青冈县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231224', '庆安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231225', '明水县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231226', '绥棱县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231281', '安达市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231282', '肇东市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231283', '海伦市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('232721', '呼玛县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('232722', '塔河县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('232723', '漠河县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310101', '黄浦区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310103', '卢湾区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310104', '徐汇区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310105', '长宁区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310106', '静安区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310107', '普陀区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310108', '闸北区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310109', '虹口区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310110', '杨浦区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310112', '闵行区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310113', '宝山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310114', '嘉定区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310115', '浦东新区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310116', '金山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310117', '松江区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310118', '青浦区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310119', '南汇区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310120', '奉贤区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310230', '崇明县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320102', '玄武区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320103', '白下区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320104', '秦淮区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320105', '建邺区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320106', '鼓楼区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320107', '下关区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320111', '浦口区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320113', '栖霞区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320114', '雨花台区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320115', '江宁区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320116', '六合区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320124', '溧水县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320125', '高淳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320201', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320202', '崇安区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320203', '南长区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320204', '北塘区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320205', '锡山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320206', '惠山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320211', '滨湖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320281', '江阴市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320282', '宜兴市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320301', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320302', '鼓楼区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320303', '云龙区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320304', '九里区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320305', '贾汪区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320311', '泉山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320321', '丰　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320322', '沛　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320323', '铜山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320324', '睢宁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320381', '新沂市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320382', '邳州市');
commit;
prompt 100 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320401', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320402', '天宁区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320404', '钟楼区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320405', '戚墅堰区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320411', '新北区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320412', '武进区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320481', '溧阳市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320482', '金坛市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320501', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320502', '沧浪区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320503', '平江区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320504', '金阊区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320505', '虎丘区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320506', '吴中区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320507', '相城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320581', '常熟市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320582', '张家港市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320583', '昆山市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320584', '吴江市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320585', '太仓市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320601', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320602', '崇川区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320611', '港闸区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320621', '海安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320623', '如东县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320681', '启东市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320682', '如皋市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320683', '通州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320684', '海门市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320701', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320703', '连云区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320705', '新浦区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320706', '海州区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320721', '赣榆县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320722', '东海县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320723', '灌云县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320724', '灌南县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320801', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320802', '清河区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320803', '楚州区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320804', '淮阴区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320811', '清浦区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320826', '涟水县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320829', '洪泽县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320830', '盱眙县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320831', '金湖县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320901', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320902', '亭湖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320903', '盐都区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320921', '响水县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320922', '滨海县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320923', '阜宁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320924', '射阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320925', '建湖县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320981', '东台市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320982', '大丰市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321001', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321002', '广陵区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321003', '邗江区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321011', '郊　区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321023', '宝应县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321081', '仪征市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321084', '高邮市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321088', '江都市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321102', '京口区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321111', '润州区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321112', '丹徒区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321181', '丹阳市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321182', '扬中市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321183', '句容市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321201', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321202', '海陵区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321203', '高港区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321281', '兴化市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321282', '靖江市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321283', '泰兴市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321284', '姜堰市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321301', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321302', '宿城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321311', '宿豫区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321322', '沭阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321323', '泗阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321324', '泗洪县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330102', '上城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330103', '下城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330104', '江干区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330105', '拱墅区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330106', '西湖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330108', '滨江区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330109', '萧山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330110', '余杭区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330122', '桐庐县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330127', '淳安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330182', '建德市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330183', '富阳市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330185', '临安市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330201', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330203', '海曙区');
commit;
prompt 200 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330204', '江东区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330205', '江北区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330206', '北仑区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330211', '镇海区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330212', '鄞州区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330225', '象山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330226', '宁海县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330281', '余姚市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330282', '慈溪市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330283', '奉化市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330301', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330302', '鹿城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330303', '龙湾区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330304', '瓯海区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330322', '洞头县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330324', '永嘉县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330326', '平阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330327', '苍南县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330328', '文成县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330329', '泰顺县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330381', '瑞安市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330382', '乐清市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330401', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330402', '秀城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330411', '秀洲区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330421', '嘉善县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330424', '海盐县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330481', '海宁市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330482', '平湖市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330483', '桐乡市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330501', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330502', '吴兴区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330503', '南浔区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330521', '德清县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330522', '长兴县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330523', '安吉县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330601', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330602', '越城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330621', '绍兴县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330624', '新昌县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330681', '诸暨市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330682', '上虞市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330683', '嵊州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330701', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330702', '婺城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330703', '金东区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330723', '武义县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330726', '浦江县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330727', '磐安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330781', '兰溪市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330782', '义乌市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330783', '东阳市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330784', '永康市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330801', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330802', '柯城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330803', '衢江区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330822', '常山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330824', '开化县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330825', '龙游县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330881', '江山市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330901', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330902', '定海区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330903', '普陀区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330921', '岱山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330922', '嵊泗县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331001', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331002', '椒江区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331003', '黄岩区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331004', '路桥区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331021', '玉环县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331022', '三门县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331023', '天台县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331024', '仙居县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331081', '温岭市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331082', '临海市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331102', '莲都区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331121', '青田县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331122', '缙云县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331123', '遂昌县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331124', '松阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331125', '云和县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331126', '庆元县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331127', '景宁畲族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331181', '龙泉市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340102', '瑶海区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340103', '庐阳区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340104', '蜀山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340111', '包河区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340121', '长丰县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340122', '肥东县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340123', '肥西县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340201', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340202', '镜湖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340203', '马塘区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340204', '新芜区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340207', '鸠江区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340221', '芜湖县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340222', '繁昌县');
commit;
prompt 300 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340223', '南陵县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340301', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340302', '龙子湖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340303', '蚌山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340304', '禹会区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340311', '淮上区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340321', '怀远县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340322', '五河县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340323', '固镇县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340401', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340402', '大通区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340403', '田家庵区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340404', '谢家集区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340405', '八公山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340406', '潘集区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340421', '凤台县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340501', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340502', '金家庄区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340503', '花山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340504', '雨山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340521', '当涂县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340601', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340602', '杜集区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340603', '相山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340604', '烈山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340621', '濉溪县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340701', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340702', '铜官山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340703', '狮子山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340711', '郊　区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340721', '铜陵县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340801', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340802', '迎江区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340803', '大观区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340811', '郊　区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340822', '怀宁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340823', '枞阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340824', '潜山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340825', '太湖县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340826', '宿松县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340827', '望江县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340828', '岳西县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340881', '桐城市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341001', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341002', '屯溪区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341003', '黄山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341004', '徽州区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341021', '歙　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341022', '休宁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341023', '黟　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341024', '祁门县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341102', '琅琊区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341103', '南谯区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341122', '来安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341124', '全椒县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341125', '定远县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341126', '凤阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341181', '天长市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341182', '明光市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341201', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341202', '颍州区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341203', '颍东区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341204', '颍泉区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341221', '临泉县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341222', '太和县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341225', '阜南县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341226', '颍上县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341282', '界首市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341301', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341302', '墉桥区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341321', '砀山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341322', '萧　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341323', '灵璧县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341324', '泗　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341401', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341402', '居巢区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341421', '庐江县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341422', '无为县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341423', '含山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341424', '和　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341501', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341502', '金安区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341503', '裕安区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341521', '寿　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341522', '霍邱县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341523', '舒城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341524', '金寨县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341525', '霍山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341601', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341602', '谯城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341621', '涡阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341622', '蒙城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341623', '利辛县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341701', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341702', '贵池区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341721', '东至县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341722', '石台县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341723', '青阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341801', '市辖区');
commit;
prompt 400 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341802', '宣州区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341821', '郎溪县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341822', '广德县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341823', '泾　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341824', '绩溪县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341825', '旌德县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341881', '宁国市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350102', '鼓楼区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350103', '台江区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350104', '仓山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350105', '马尾区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350111', '晋安区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350121', '闽侯县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350122', '连江县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350123', '罗源县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350124', '闽清县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350125', '永泰县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350128', '平潭县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350181', '福清市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350182', '长乐市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350201', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350203', '思明区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350205', '海沧区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350206', '湖里区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350211', '集美区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350212', '同安区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350213', '翔安区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350301', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350302', '城厢区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350303', '涵江区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350304', '荔城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350305', '秀屿区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350322', '仙游县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350401', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350402', '梅列区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350403', '三元区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350421', '明溪县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350423', '清流县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350424', '宁化县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350425', '大田县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350426', '尤溪县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350427', '沙　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350428', '将乐县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350429', '泰宁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350430', '建宁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350481', '永安市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350501', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350502', '鲤城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350503', '丰泽区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350504', '洛江区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350505', '泉港区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350521', '惠安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350524', '安溪县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350525', '永春县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350526', '德化县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350527', '金门县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350581', '石狮市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350582', '晋江市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350583', '南安市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350601', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350602', '芗城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350603', '龙文区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350622', '云霄县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350623', '漳浦县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350624', '诏安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350625', '长泰县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350626', '东山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350627', '南靖县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350628', '平和县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350629', '华安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350681', '龙海市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350701', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350702', '延平区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350721', '顺昌县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350722', '浦城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350723', '光泽县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350724', '松溪县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350725', '政和县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350781', '邵武市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350782', '武夷山市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350783', '建瓯市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350784', '建阳市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350801', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350802', '新罗区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350821', '长汀县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350822', '永定县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350823', '上杭县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350824', '武平县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350825', '连城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350881', '漳平市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350901', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350902', '蕉城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350921', '霞浦县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350922', '古田县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350923', '屏南县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350924', '寿宁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350925', '周宁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350926', '柘荣县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350981', '福安市');
commit;
prompt 500 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350982', '福鼎市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360102', '东湖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360103', '西湖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360104', '青云谱区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360105', '湾里区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360111', '青山湖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360121', '南昌县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360122', '新建县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360123', '安义县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360124', '进贤县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360201', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360202', '昌江区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360203', '珠山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360222', '浮梁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360281', '乐平市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360301', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360302', '安源区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360313', '湘东区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360321', '莲花县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360322', '上栗县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360323', '芦溪县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360401', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360402', '庐山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360403', '浔阳区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360421', '九江县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360423', '武宁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360424', '修水县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360425', '永修县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360426', '德安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360427', '星子县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360428', '都昌县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360429', '湖口县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360430', '彭泽县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360481', '瑞昌市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360501', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360502', '渝水区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360521', '分宜县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360601', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360602', '月湖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360622', '余江县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360681', '贵溪市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360701', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360702', '章贡区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360721', '赣　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360722', '信丰县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360723', '大余县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360724', '上犹县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360725', '崇义县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360726', '安远县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360727', '龙南县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360728', '定南县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360729', '全南县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360730', '宁都县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360731', '于都县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360732', '兴国县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360733', '会昌县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360734', '寻乌县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360735', '石城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360781', '瑞金市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360782', '南康市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360801', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360802', '吉州区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360803', '青原区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360821', '吉安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360822', '吉水县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360823', '峡江县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360824', '新干县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360825', '永丰县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360826', '泰和县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360827', '遂川县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360828', '万安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360829', '安福县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360830', '永新县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360881', '井冈山市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360901', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360902', '袁州区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360921', '奉新县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360922', '万载县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360923', '上高县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360924', '宜丰县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360925', '靖安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360926', '铜鼓县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360981', '丰城市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360982', '樟树市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360983', '高安市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361001', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361002', '临川区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361021', '南城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361022', '黎川县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361023', '南丰县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361024', '崇仁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361025', '乐安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361026', '宜黄县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361027', '金溪县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361028', '资溪县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361029', '东乡县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361030', '广昌县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361102', '信州区');
commit;
prompt 600 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361121', '上饶县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361122', '广丰县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361123', '玉山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361124', '铅山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361125', '横峰县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361126', '弋阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361127', '余干县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361128', '鄱阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361129', '万年县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361130', '婺源县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361181', '德兴市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370102', '历下区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370103', '市中区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370104', '槐荫区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370105', '天桥区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370112', '历城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370113', '长清区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370124', '平阴县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370125', '济阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370126', '商河县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370181', '章丘市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370201', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370202', '市南区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370203', '市北区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370205', '四方区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370211', '黄岛区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370212', '崂山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370213', '李沧区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370214', '城阳区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370281', '胶州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370282', '即墨市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370283', '平度市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370284', '胶南市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370285', '莱西市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370301', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370302', '淄川区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370303', '张店区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370304', '博山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370305', '临淄区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370306', '周村区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370321', '桓台县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370322', '高青县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370323', '沂源县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370401', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370402', '市中区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370403', '薛城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370404', '峄城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370405', '台儿庄区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370406', '山亭区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370481', '滕州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370501', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370502', '东营区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370503', '河口区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370521', '垦利县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370522', '利津县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370523', '广饶县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370601', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370602', '芝罘区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370611', '福山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370612', '牟平区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370613', '莱山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370634', '长岛县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370681', '龙口市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370682', '莱阳市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370683', '莱州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370684', '蓬莱市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370685', '招远市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370686', '栖霞市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370687', '海阳市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370701', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370702', '潍城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370703', '寒亭区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370704', '坊子区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370705', '奎文区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370724', '临朐县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370725', '昌乐县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370781', '青州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370782', '诸城市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370783', '寿光市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370784', '安丘市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370785', '高密市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370786', '昌邑市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370801', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370802', '市中区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370811', '任城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370826', '微山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370827', '鱼台县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370828', '金乡县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370829', '嘉祥县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370830', '汶上县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370831', '泗水县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370832', '梁山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370881', '曲阜市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370882', '兖州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370883', '邹城市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370901', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370902', '泰山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370903', '岱岳区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370921', '宁阳县');
commit;
prompt 700 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370923', '东平县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370982', '新泰市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370983', '肥城市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371001', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371002', '环翠区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371081', '文登市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371082', '荣成市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371083', '乳山市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371102', '东港区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371103', '岚山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371121', '五莲县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371122', '莒　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371201', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371202', '莱城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371203', '钢城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371301', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371302', '兰山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371311', '罗庄区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371312', '河东区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371321', '沂南县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371322', '郯城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371323', '沂水县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371324', '苍山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371325', '费　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371326', '平邑县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371327', '莒南县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371328', '蒙阴县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371329', '临沭县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371401', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371402', '德城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371421', '陵　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371422', '宁津县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371423', '庆云县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371424', '临邑县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371425', '齐河县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371426', '平原县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371427', '夏津县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371428', '武城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371481', '乐陵市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371482', '禹城市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371501', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371502', '东昌府区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371521', '阳谷县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371522', '莘　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371523', '茌平县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371524', '东阿县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371525', '冠　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371526', '高唐县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371581', '临清市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371601', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371602', '滨城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371621', '惠民县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371622', '阳信县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371623', '无棣县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371624', '沾化县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371625', '博兴县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371626', '邹平县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371701', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371702', '牡丹区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371721', '曹　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371722', '单　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371723', '成武县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371724', '巨野县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371725', '郓城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371726', '鄄城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371727', '定陶县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371728', '东明县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410102', '中原区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410103', '二七区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410104', '管城回族区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410105', '金水区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410106', '上街区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410108', '邙山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410122', '中牟县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410181', '巩义市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410182', '荥阳市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410183', '新密市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410184', '新郑市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410185', '登封市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410201', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410202', '龙亭区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410203', '顺河回族区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410204', '鼓楼区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410205', '南关区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410211', '郊　区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410221', '杞　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410222', '通许县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410223', '尉氏县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410224', '开封县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410225', '兰考县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410301', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410302', '老城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410303', '西工区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410304', '廛河回族区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410305', '涧西区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410306', '吉利区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410307', '洛龙区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410322', '孟津县');
commit;
prompt 800 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410323', '新安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410324', '栾川县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410325', '嵩　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410326', '汝阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410327', '宜阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410328', '洛宁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410329', '伊川县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410381', '偃师市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410401', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410402', '新华区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410403', '卫东区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410404', '石龙区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410411', '湛河区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410421', '宝丰县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410422', '叶　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410423', '鲁山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410425', '郏　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410481', '舞钢市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410482', '汝州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410501', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410502', '文峰区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410503', '北关区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410505', '殷都区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410506', '龙安区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410522', '安阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410523', '汤阴县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410526', '滑　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410527', '内黄县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410581', '林州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410601', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410602', '鹤山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410603', '山城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410611', '淇滨区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410621', '浚　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410622', '淇　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410701', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410702', '红旗区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410703', '卫滨区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410704', '凤泉区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410711', '牧野区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410721', '新乡县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410724', '获嘉县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410725', '原阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410726', '延津县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410727', '封丘县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410728', '长垣县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410781', '卫辉市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410782', '辉县市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410801', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410802', '解放区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410803', '中站区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410804', '马村区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410811', '山阳区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410821', '修武县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410822', '博爱县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410823', '武陟县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410825', '温　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410881', '济源市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410882', '沁阳市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410883', '孟州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410901', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410902', '华龙区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410922', '清丰县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410923', '南乐县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410926', '范　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410927', '台前县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410928', '濮阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411001', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411002', '魏都区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411023', '许昌县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411024', '鄢陵县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411025', '襄城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411081', '禹州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411082', '长葛市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411102', '源汇区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411103', '郾城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411104', '召陵区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411121', '舞阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411122', '临颍县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411201', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411202', '湖滨区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411221', '渑池县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411222', '陕　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411224', '卢氏县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411281', '义马市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411282', '灵宝市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411301', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411302', '宛城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411303', '卧龙区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411321', '南召县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411322', '方城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411323', '西峡县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411324', '镇平县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411325', '内乡县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411326', '淅川县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411327', '社旗县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411328', '唐河县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411329', '新野县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411330', '桐柏县');
commit;
prompt 900 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411381', '邓州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411401', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411402', '梁园区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411403', '睢阳区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411421', '民权县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411422', '睢　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411423', '宁陵县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411424', '柘城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411425', '虞城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411426', '夏邑县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411481', '永城市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411501', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411502', '师河区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411503', '平桥区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411521', '罗山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411522', '光山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411523', '新　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411524', '商城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411525', '固始县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411526', '潢川县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411527', '淮滨县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411528', '息　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411601', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411602', '川汇区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411621', '扶沟县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411622', '西华县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411623', '商水县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411624', '沈丘县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411625', '郸城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411626', '淮阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411627', '太康县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411628', '鹿邑县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411681', '项城市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411701', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411702', '驿城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411721', '西平县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411722', '上蔡县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411723', '平舆县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411724', '正阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411725', '确山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411726', '泌阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411727', '汝南县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411728', '遂平县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411729', '新蔡县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420102', '江岸区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420103', '江汉区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420104', '乔口区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420105', '汉阳区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420106', '武昌区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420107', '青山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420111', '洪山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420112', '东西湖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420113', '汉南区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420114', '蔡甸区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420115', '江夏区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420116', '黄陂区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420117', '新洲区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420201', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420202', '黄石港区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420203', '西塞山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420204', '下陆区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420205', '铁山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420222', '阳新县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420281', '大冶市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420301', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420302', '茅箭区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420303', '张湾区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420321', '郧　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420322', '郧西县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420323', '竹山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420324', '竹溪县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420325', '房　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420381', '丹江口市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420501', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420502', '西陵区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420503', '伍家岗区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420504', '点军区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420505', '猇亭区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420506', '夷陵区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420525', '远安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420526', '兴山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420527', '秭归县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420528', '长阳土家族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420529', '五峰土家族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420581', '宜都市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420582', '当阳市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420583', '枝江市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420601', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420602', '襄城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420606', '樊城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420607', '襄阳区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420624', '南漳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420625', '谷城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420626', '保康县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420682', '老河口市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420683', '枣阳市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420684', '宜城市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420701', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420702', '梁子湖区');
commit;
prompt 1000 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420703', '华容区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420704', '鄂城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420801', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420802', '东宝区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420804', '掇刀区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420821', '京山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420822', '沙洋县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420881', '钟祥市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420901', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420902', '孝南区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420921', '孝昌县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420922', '大悟县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420923', '云梦县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420981', '应城市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420982', '安陆市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420984', '汉川市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421001', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421002', '沙市区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421003', '荆州区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421022', '公安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421023', '监利县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421024', '江陵县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421081', '石首市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421083', '洪湖市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421087', '松滋市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421102', '黄州区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421121', '团风县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421122', '红安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421123', '罗田县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421124', '英山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421125', '浠水县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421126', '蕲春县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421127', '黄梅县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421181', '麻城市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421182', '武穴市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421201', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421202', '咸安区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421221', '嘉鱼县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421222', '通城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421223', '崇阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421224', '通山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421281', '赤壁市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421301', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421302', '曾都区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421381', '广水市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('422801', '恩施市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('422802', '利川市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('422822', '建始县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('422823', '巴东县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('422825', '宣恩县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('422826', '咸丰县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('422827', '来凤县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('422828', '鹤峰县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('429004', '仙桃市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('429005', '潜江市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('429006', '天门市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('429021', '神农架林区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430102', '芙蓉区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430103', '天心区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430104', '岳麓区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430105', '开福区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430111', '雨花区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430121', '长沙县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430122', '望城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430124', '宁乡县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430181', '浏阳市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430201', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430202', '荷塘区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430203', '芦淞区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430204', '石峰区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430211', '天元区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430221', '株洲县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430223', '攸　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430224', '茶陵县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430225', '炎陵县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430281', '醴陵市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430301', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430302', '雨湖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430304', '岳塘区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430321', '湘潭县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430381', '湘乡市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430382', '韶山市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430401', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430405', '珠晖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430406', '雁峰区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430407', '石鼓区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430408', '蒸湘区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430412', '南岳区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430421', '衡阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430422', '衡南县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430423', '衡山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430424', '衡东县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430426', '祁东县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430481', '耒阳市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430482', '常宁市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430501', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430502', '双清区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430503', '大祥区');
commit;
prompt 1100 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430511', '北塔区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430521', '邵东县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430522', '新邵县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430523', '邵阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430524', '隆回县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430525', '洞口县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430527', '绥宁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430528', '新宁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430529', '城步苗族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430581', '武冈市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430601', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430602', '岳阳楼区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430603', '云溪区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430611', '君山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430621', '岳阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430623', '华容县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430624', '湘阴县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430626', '平江县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430681', '汨罗市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430682', '临湘市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430701', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430702', '武陵区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430703', '鼎城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430721', '安乡县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430722', '汉寿县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430723', '澧　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430724', '临澧县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430725', '桃源县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430726', '石门县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430781', '津市市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430801', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430802', '永定区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430811', '武陵源区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430821', '慈利县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430822', '桑植县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430901', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430902', '资阳区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430903', '赫山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430921', '南　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430922', '桃江县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150404', '松山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150421', '阿鲁科尔沁旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150422', '巴林左旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150423', '巴林右旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150424', '林西县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150425', '克什克腾旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150426', '翁牛特旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150428', '喀喇沁旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150429', '宁城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150430', '敖汉旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150501', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150502', '科尔沁区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150521', '科尔沁左翼中旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150522', '科尔沁左翼后旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150523', '开鲁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150524', '库伦旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150525', '奈曼旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150526', '扎鲁特旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150581', '霍林郭勒市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150602', '东胜区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150621', '达拉特旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150622', '准格尔旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150623', '鄂托克前旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150624', '鄂托克旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150625', '杭锦旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150626', '乌审旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150627', '伊金霍洛旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150701', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150702', '海拉尔区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150721', '阿荣旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150722', '莫力达瓦达斡尔族自治旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150723', '鄂伦春自治旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150724', '鄂温克族自治旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150725', '陈巴尔虎旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150726', '新巴尔虎左旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150727', '新巴尔虎右旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150781', '满洲里市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150782', '牙克石市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150783', '扎兰屯市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150784', '额尔古纳市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150785', '根河市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150801', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150802', '临河区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150821', '五原县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150822', '磴口县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150823', '乌拉特前旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150824', '乌拉特中旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150825', '乌拉特后旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150826', '杭锦后旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150901', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150902', '集宁区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150921', '卓资县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150922', '化德县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150923', '商都县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150924', '兴和县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150925', '凉城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150926', '察哈尔右翼前旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150927', '察哈尔右翼中旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150928', '察哈尔右翼后旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150929', '四子王旗');
commit;
prompt 1200 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150981', '丰镇市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152201', '乌兰浩特市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152202', '阿尔山市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152221', '科尔沁右翼前旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152222', '科尔沁右翼中旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152223', '扎赉特旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152224', '突泉县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152501', '二连浩特市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152502', '锡林浩特市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152522', '阿巴嘎旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152523', '苏尼特左旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152524', '苏尼特右旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152525', '东乌珠穆沁旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152526', '西乌珠穆沁旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152527', '太仆寺旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152528', '镶黄旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152529', '正镶白旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152530', '正蓝旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152531', '多伦县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152921', '阿拉善左旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152922', '阿拉善右旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152923', '额济纳旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210102', '和平区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210103', '沈河区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210104', '大东区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210105', '皇姑区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210106', '铁西区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210111', '苏家屯区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210112', '东陵区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210113', '新城子区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210114', '于洪区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210122', '辽中县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210123', '康平县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210124', '法库县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210181', '新民市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210201', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210202', '中山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210203', '西岗区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210204', '沙河口区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210211', '甘井子区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210212', '旅顺口区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210213', '金州区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210224', '长海县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210281', '瓦房店市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210282', '普兰店市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210283', '庄河市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210301', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210302', '铁东区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210303', '铁西区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210304', '立山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210311', '千山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210321', '台安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210323', '岫岩满族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210381', '海城市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210401', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210402', '新抚区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210403', '东洲区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210404', '望花区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210411', '顺城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210421', '抚顺县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210422', '新宾满族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210423', '清原满族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210501', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210502', '平山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210503', '溪湖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210504', '明山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210505', '南芬区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210521', '本溪满族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210522', '桓仁满族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210601', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210602', '元宝区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210603', '振兴区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210604', '振安区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210624', '宽甸满族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210681', '东港市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210682', '凤城市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210701', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210702', '古塔区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210703', '凌河区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210711', '太和区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210726', '黑山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210727', '义　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210781', '凌海市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210782', '北宁市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210801', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210802', '站前区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210803', '西市区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210804', '鲅鱼圈区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210811', '老边区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210881', '盖州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210882', '大石桥市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210901', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210902', '海州区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210903', '新邱区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210904', '太平区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210905', '清河门区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210911', '细河区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210921', '阜新蒙古族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210922', '彰武县');
commit;
prompt 1300 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211001', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211002', '白塔区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211003', '文圣区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211004', '宏伟区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211005', '弓长岭区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211011', '太子河区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211021', '辽阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211081', '灯塔市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211102', '双台子区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211103', '兴隆台区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211121', '大洼县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211122', '盘山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211201', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211202', '银州区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211204', '清河区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211221', '铁岭县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211223', '西丰县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211224', '昌图县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211281', '调兵山市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211282', '开原市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211301', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211302', '双塔区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211303', '龙城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211321', '朝阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211322', '建平县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211324', '喀喇沁左翼蒙古族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211381', '北票市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211382', '凌源市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211401', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211402', '连山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211403', '龙港区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211404', '南票区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211421', '绥中县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211422', '建昌县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211481', '兴城市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220102', '南关区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220103', '宽城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220104', '朝阳区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220105', '二道区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220106', '绿园区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220112', '双阳区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220122', '农安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220181', '九台市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220182', '榆树市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220183', '德惠市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220201', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220202', '昌邑区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220203', '龙潭区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220204', '船营区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220211', '丰满区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220221', '永吉县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220281', '蛟河市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220282', '桦甸市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220283', '舒兰市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220284', '磐石市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220301', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220302', '铁西区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220303', '铁东区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220322', '梨树县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220323', '伊通满族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220381', '公主岭市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220382', '双辽市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220401', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220402', '龙山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220403', '西安区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220421', '东丰县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220422', '东辽县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220501', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220502', '东昌区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220503', '二道江区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220521', '通化县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220523', '辉南县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220524', '柳河县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220581', '梅河口市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220582', '集安市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220601', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220602', '八道江区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220621', '抚松县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220622', '靖宇县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220623', '长白朝鲜族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220625', '江源县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220681', '临江市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220701', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220702', '宁江区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220721', '前郭尔罗斯蒙古族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220722', '长岭县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220723', '乾安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220724', '扶余县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220801', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220802', '洮北区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220821', '镇赉县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220822', '通榆县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220881', '洮南市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220882', '大安市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('222401', '延吉市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('222402', '图们市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('222403', '敦化市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('222404', '珲春市');
commit;
prompt 1400 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('222405', '龙井市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('222406', '和龙市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('222424', '汪清县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('222426', '安图县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230102', '道里区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230103', '南岗区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230104', '道外区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230106', '香坊区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230107', '动力区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230108', '平房区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230109', '松北区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230111', '呼兰区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230123', '依兰县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230124', '方正县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230125', '宾　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230126', '巴彦县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230127', '木兰县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230128', '通河县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230129', '延寿县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230181', '阿城市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230182', '双城市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230183', '尚志市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230184', '五常市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230201', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230202', '龙沙区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230203', '建华区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230204', '铁锋区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230205', '昂昂溪区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230206', '富拉尔基区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230207', '碾子山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230208', '梅里斯达斡尔族区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230221', '龙江县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230223', '依安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230224', '泰来县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230225', '甘南县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230227', '富裕县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230229', '克山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230230', '克东县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230231', '拜泉县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230281', '讷河市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230301', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230302', '鸡冠区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230303', '恒山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230304', '滴道区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230305', '梨树区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230306', '城子河区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230307', '麻山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230321', '鸡东县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230381', '虎林市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230382', '密山市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230401', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230402', '向阳区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230403', '工农区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230404', '南山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230405', '兴安区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230406', '东山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230407', '兴山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230421', '萝北县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230422', '绥滨县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230501', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230502', '尖山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230503', '岭东区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230505', '四方台区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230506', '宝山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230521', '集贤县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230522', '友谊县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230523', '宝清县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230524', '饶河县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230601', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230602', '萨尔图区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230603', '龙凤区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230604', '让胡路区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230605', '红岗区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230606', '大同区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230621', '肇州县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230622', '肇源县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230623', '林甸县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230624', '杜尔伯特蒙古族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230701', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230702', '伊春区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230703', '南岔区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230704', '友好区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230705', '西林区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230706', '翠峦区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230707', '新青区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230708', '美溪区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230709', '金山屯区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230710', '五营区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230711', '乌马河区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230712', '汤旺河区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230713', '带岭区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230714', '乌伊岭区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230715', '红星区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230716', '上甘岭区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230722', '嘉荫县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230781', '铁力市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230801', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230802', '永红区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230803', '向阳区');
commit;
prompt 1500 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('110101', '东城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('110102', '西城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('110103', '崇文区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('110104', '宣武区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('110105', '朝阳区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('110106', '丰台区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('110107', '石景山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('110108', '海淀区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('110109', '门头沟区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('110111', '房山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('110112', '通州区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('110113', '顺义区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('110114', '昌平区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('110115', '大兴区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('110116', '怀柔区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('110117', '平谷区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('110228', '密云县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('110229', '延庆县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('120101', '和平区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('120102', '河东区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('120103', '河西区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('120104', '南开区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('120105', '河北区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('120106', '红桥区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('120107', '塘沽区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('120108', '汉沽区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('120109', '大港区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('120110', '东丽区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('120111', '西青区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('120112', '津南区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('120113', '北辰区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('120114', '武清区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('120115', '宝坻区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('120221', '宁河县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('120223', '静海县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('120225', '蓟　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130102', '长安区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130103', '桥东区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130104', '桥西区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130105', '新华区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130107', '井陉矿区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130108', '裕华区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130121', '井陉县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130123', '正定县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130124', '栾城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130125', '行唐县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130126', '灵寿县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130127', '高邑县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130128', '深泽县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130129', '赞皇县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130130', '无极县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130131', '平山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130132', '元氏县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130133', '赵　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130181', '辛集市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130182', '藁城市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130183', '晋州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130184', '新乐市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130185', '鹿泉市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130201', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130202', '路南区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130203', '路北区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130204', '古冶区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130205', '开平区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130207', '丰南区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130208', '丰润区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130223', '滦　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130224', '滦南县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130225', '乐亭县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130227', '迁西县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130229', '玉田县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130230', '唐海县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130281', '遵化市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130283', '迁安市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130301', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130302', '海港区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130303', '山海关区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130304', '北戴河区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130321', '青龙满族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130322', '昌黎县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130323', '抚宁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130324', '卢龙县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130401', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130402', '邯山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130403', '丛台区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130404', '复兴区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130406', '峰峰矿区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130421', '邯郸县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130423', '临漳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130424', '成安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130425', '大名县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130426', '涉　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130427', '磁　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130428', '肥乡县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130429', '永年县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130430', '邱　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130431', '鸡泽县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130432', '广平县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130433', '馆陶县');
commit;
prompt 1600 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130434', '魏　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130435', '曲周县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130481', '武安市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130501', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130502', '桥东区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130503', '桥西区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130521', '邢台县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130522', '临城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130523', '内丘县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130524', '柏乡县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130525', '隆尧县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130526', '任　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130527', '南和县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130528', '宁晋县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130529', '巨鹿县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130530', '新河县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130531', '广宗县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130532', '平乡县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130533', '威　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130534', '清河县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130535', '临西县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130581', '南宫市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130582', '沙河市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130601', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130602', '新市区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130603', '北市区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130604', '南市区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130621', '满城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130622', '清苑县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130623', '涞水县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130624', '阜平县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130625', '徐水县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130626', '定兴县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130627', '唐　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130628', '高阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130629', '容城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130630', '涞源县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130631', '望都县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130632', '安新县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130633', '易　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130634', '曲阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130635', '蠡　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130636', '顺平县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130637', '博野县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130638', '雄　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130681', '涿州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130682', '定州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130683', '安国市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130684', '高碑店市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130701', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130702', '桥东区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130703', '桥西区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130705', '宣化区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130706', '下花园区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130721', '宣化县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130722', '张北县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130723', '康保县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130724', '沽源县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130725', '尚义县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130726', '蔚　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130727', '阳原县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130728', '怀安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130729', '万全县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130730', '怀来县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130731', '涿鹿县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130732', '赤城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130733', '崇礼县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130801', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130802', '双桥区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130803', '双滦区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130804', '鹰手营子矿区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130821', '承德县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130822', '兴隆县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130823', '平泉县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130824', '滦平县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130825', '隆化县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130826', '丰宁满族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130827', '宽城满族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130828', '围场满族蒙古族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130901', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130902', '新华区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130903', '运河区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130921', '沧　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130922', '青　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130923', '东光县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130924', '海兴县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130925', '盐山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130926', '肃宁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130927', '南皮县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130928', '吴桥县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130929', '献　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130930', '孟村回族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130981', '泊头市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130982', '任丘市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130983', '黄骅市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130984', '河间市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131001', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131002', '安次区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131003', '广阳区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131022', '固安县');
commit;
prompt 1700 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131023', '永清县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131024', '香河县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131025', '大城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131026', '文安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131028', '大厂回族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131081', '霸州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131082', '三河市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131102', '桃城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131121', '枣强县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131122', '武邑县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131123', '武强县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131124', '饶阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131125', '安平县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131126', '故城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131127', '景　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131128', '阜城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131181', '冀州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131182', '深州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140105', '小店区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140106', '迎泽区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140107', '杏花岭区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140108', '尖草坪区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140109', '万柏林区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140110', '晋源区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140121', '清徐县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140122', '阳曲县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140123', '娄烦县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140181', '古交市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140201', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140202', '城　区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140203', '矿　区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140211', '南郊区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140212', '新荣区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140221', '阳高县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140222', '天镇县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140223', '广灵县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140224', '灵丘县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140225', '浑源县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140226', '左云县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140227', '大同县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140301', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140302', '城　区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140303', '矿　区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140311', '郊　区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140321', '平定县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140322', '盂　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140401', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140402', '城　区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140411', '郊　区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140421', '长治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140423', '襄垣县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140424', '屯留县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140425', '平顺县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140426', '黎城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140427', '壶关县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140428', '长子县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140429', '武乡县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140430', '沁　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140431', '沁源县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140481', '潞城市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140501', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140502', '城　区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140521', '沁水县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140522', '阳城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140524', '陵川县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140525', '泽州县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140581', '高平市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140601', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140602', '朔城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140603', '平鲁区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140621', '山阴县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140622', '应　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140623', '右玉县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140624', '怀仁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140701', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140702', '榆次区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140721', '榆社县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140722', '左权县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140723', '和顺县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140724', '昔阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140725', '寿阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140726', '太谷县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140727', '祁　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140728', '平遥县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140729', '灵石县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140781', '介休市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140801', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140802', '盐湖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140821', '临猗县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140822', '万荣县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140823', '闻喜县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140824', '稷山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140825', '新绛县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140826', '绛　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140827', '垣曲县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140828', '夏　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140829', '平陆县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140830', '芮城县');
commit;
prompt 1800 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140881', '永济市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140882', '河津市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140901', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140902', '忻府区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140921', '定襄县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140922', '五台县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140923', '代　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140924', '繁峙县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140925', '宁武县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140926', '静乐县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140927', '神池县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140928', '五寨县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140929', '岢岚县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140930', '河曲县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140931', '保德县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140932', '偏关县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140981', '原平市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141001', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141002', '尧都区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141021', '曲沃县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141022', '翼城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141023', '襄汾县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141024', '洪洞县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141025', '古　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141026', '安泽县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141027', '浮山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141028', '吉　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141029', '乡宁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141030', '大宁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141031', '隰　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141032', '永和县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141033', '蒲　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141034', '汾西县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141081', '侯马市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141082', '霍州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141102', '离石区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141121', '文水县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141122', '交城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141123', '兴　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141124', '临　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141125', '柳林县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141126', '石楼县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141127', '岚　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141128', '方山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141129', '中阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141130', '交口县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141181', '孝义市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141182', '汾阳市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150102', '新城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150103', '回民区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150104', '玉泉区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150105', '赛罕区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150121', '土默特左旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150122', '托克托县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150123', '和林格尔县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150124', '清水河县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150125', '武川县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150201', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150202', '东河区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150203', '昆都仑区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150204', '青山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150205', '石拐区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150206', '白云矿区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150207', '九原区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150221', '土默特右旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150222', '固阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150223', '达尔罕茂明安联合旗');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150301', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150302', '海勃湾区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150303', '海南区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150304', '乌达区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150401', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150402', '红山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150403', '元宝山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450205', '柳北区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450221', '柳江县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450222', '柳城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450223', '鹿寨县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450224', '融安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450225', '融水苗族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450226', '三江侗族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450301', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450302', '秀峰区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450303', '叠彩区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450304', '象山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450305', '七星区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450311', '雁山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450321', '阳朔县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450322', '临桂县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450323', '灵川县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450324', '全州县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450325', '兴安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450326', '永福县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450327', '灌阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450328', '龙胜各族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450329', '资源县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450330', '平乐县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450331', '荔蒲县');
commit;
prompt 1900 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450332', '恭城瑶族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450401', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450403', '万秀区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450404', '蝶山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450405', '长洲区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450421', '苍梧县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450422', '藤　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450423', '蒙山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450481', '岑溪市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450501', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450502', '海城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450503', '银海区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450512', '铁山港区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450521', '合浦县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450601', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450602', '港口区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450603', '防城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450621', '上思县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450681', '东兴市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450701', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450702', '钦南区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450703', '钦北区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450721', '灵山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450722', '浦北县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450801', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450802', '港北区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450803', '港南区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450804', '覃塘区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450821', '平南县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450881', '桂平市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450901', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450902', '玉州区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450921', '容　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450922', '陆川县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450923', '博白县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450924', '兴业县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450981', '北流市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451001', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451002', '右江区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451021', '田阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451022', '田东县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451023', '平果县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451024', '德保县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451025', '靖西县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451026', '那坡县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451027', '凌云县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451028', '乐业县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451029', '田林县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451030', '西林县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451031', '隆林各族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451102', '八步区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451121', '昭平县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451122', '钟山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451123', '富川瑶族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451201', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451202', '金城江区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451221', '南丹县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451222', '天峨县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451223', '凤山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451224', '东兰县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451225', '罗城仫佬族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451226', '环江毛南族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451227', '巴马瑶族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451228', '都安瑶族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451229', '大化瑶族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451281', '宜州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451301', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451302', '兴宾区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451321', '忻城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451322', '象州县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451323', '武宣县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451324', '金秀瑶族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451381', '合山市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451401', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451402', '江洲区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451421', '扶绥县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451422', '宁明县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451423', '龙州县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451424', '大新县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451425', '天等县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451481', '凭祥市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('460101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('460105', '秀英区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('460106', '龙华区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('460107', '琼山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('460108', '美兰区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('460201', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469001', '五指山市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469002', '琼海市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469003', '儋州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469005', '文昌市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469006', '万宁市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469007', '东方市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469025', '定安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469026', '屯昌县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469027', '澄迈县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469028', '临高县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469030', '白沙黎族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469031', '昌江黎族自治县');
commit;
prompt 2000 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469033', '乐东黎族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469034', '陵水黎族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469035', '保亭黎族苗族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469036', '琼中黎族苗族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469037', '西沙群岛');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469038', '南沙群岛');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469039', '中沙群岛的岛礁及其海域');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500101', '万州区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500102', '涪陵区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500103', '渝中区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500104', '大渡口区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500105', '江北区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500106', '沙坪坝区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500107', '九龙坡区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500108', '南岸区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500109', '北碚区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500110', '万盛区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500111', '双桥区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500112', '渝北区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500113', '巴南区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500114', '黔江区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500115', '长寿区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500222', '綦江县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500223', '潼南县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500224', '铜梁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500225', '大足县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500226', '荣昌县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500227', '璧山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500228', '梁平县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500229', '城口县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500230', '丰都县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500231', '垫江县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500232', '武隆县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500233', '忠　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500234', '开　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500235', '云阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500236', '奉节县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500237', '巫山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500238', '巫溪县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500240', '石柱土家族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500241', '秀山土家族苗族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500242', '酉阳土家族苗族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500243', '彭水苗族土家族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500381', '江津市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500382', '合川市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500383', '永川市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500384', '南川市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510104', '锦江区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510105', '青羊区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510106', '金牛区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510107', '武侯区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510108', '成华区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510112', '龙泉驿区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510113', '青白江区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510114', '新都区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510115', '温江区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510121', '金堂县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510122', '双流县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510124', '郫　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510129', '大邑县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510131', '蒲江县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510132', '新津县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510181', '都江堰市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510182', '彭州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510183', '邛崃市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510184', '崇州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510301', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510302', '自流井区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510303', '贡井区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510304', '大安区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510311', '沿滩区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510321', '荣　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510322', '富顺县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510401', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510402', '东　区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510403', '西　区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510411', '仁和区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510421', '米易县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510422', '盐边县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510501', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510502', '江阳区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510503', '纳溪区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510504', '龙马潭区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510521', '泸　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510522', '合江县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510524', '叙永县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510525', '古蔺县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510601', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510603', '旌阳区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510623', '中江县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510626', '罗江县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510681', '广汉市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510682', '什邡市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510683', '绵竹市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510701', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510703', '涪城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510704', '游仙区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510722', '三台县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510723', '盐亭县');
commit;
prompt 2100 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510724', '安　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510725', '梓潼县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510726', '北川羌族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510727', '平武县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510781', '江油市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510801', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510802', '市中区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510811', '元坝区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510812', '朝天区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510821', '旺苍县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510822', '青川县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510823', '剑阁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510824', '苍溪县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510901', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510903', '船山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510904', '安居区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510921', '蓬溪县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510922', '射洪县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510923', '大英县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511001', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511002', '市中区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511011', '东兴区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511024', '威远县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511025', '资中县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511028', '隆昌县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511102', '市中区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511111', '沙湾区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511112', '五通桥区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511113', '金口河区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511123', '犍为县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511124', '井研县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511126', '夹江县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511129', '沐川县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511132', '峨边彝族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511133', '马边彝族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511181', '峨眉山市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511301', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511302', '顺庆区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511303', '高坪区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511304', '嘉陵区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511321', '南部县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511322', '营山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511323', '蓬安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511324', '仪陇县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511325', '西充县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511381', '阆中市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511401', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511402', '东坡区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511421', '仁寿县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511422', '彭山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511423', '洪雅县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511424', '丹棱县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511425', '青神县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511501', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511502', '翠屏区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511521', '宜宾县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511522', '南溪县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511523', '江安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511524', '长宁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511525', '高　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511526', '珙　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511527', '筠连县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511528', '兴文县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511529', '屏山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511601', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511602', '广安区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511621', '岳池县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511622', '武胜县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511623', '邻水县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511681', '华莹市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511701', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511702', '通川区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511721', '达　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511722', '宣汉县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511723', '开江县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511724', '大竹县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511725', '渠　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511781', '万源市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511801', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511802', '雨城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511821', '名山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511822', '荥经县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511823', '汉源县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511824', '石棉县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511825', '天全县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511826', '芦山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511827', '宝兴县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511901', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511902', '巴州区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511921', '通江县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511922', '南江县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511923', '平昌县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('512001', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('512002', '雁江区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('512021', '安岳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('512022', '乐至县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('512081', '简阳市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513221', '汶川县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513222', '理　县');
commit;
prompt 2200 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513223', '茂　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513224', '松潘县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513225', '九寨沟县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513226', '金川县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513227', '小金县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513228', '黑水县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513229', '马尔康县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513230', '壤塘县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513231', '阿坝县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513232', '若尔盖县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513233', '红原县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513321', '康定县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513322', '泸定县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513323', '丹巴县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513324', '九龙县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513325', '雅江县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513326', '道孚县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513327', '炉霍县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513328', '甘孜县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513329', '新龙县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513330', '德格县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513331', '白玉县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513332', '石渠县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513333', '色达县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513334', '理塘县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513335', '巴塘县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513336', '乡城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513337', '稻城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513338', '得荣县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513401', '西昌市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513422', '木里藏族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513423', '盐源县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513424', '德昌县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513425', '会理县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513426', '会东县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513427', '宁南县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513428', '普格县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513429', '布拖县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513430', '金阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513431', '昭觉县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513432', '喜德县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513433', '冕宁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513434', '越西县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513435', '甘洛县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513436', '美姑县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513437', '雷波县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520102', '南明区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520103', '云岩区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520111', '花溪区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520112', '乌当区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520113', '白云区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520114', '小河区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520121', '开阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520122', '息烽县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520123', '修文县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520181', '清镇市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520201', '钟山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520203', '六枝特区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520221', '水城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520222', '盘　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520301', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520302', '红花岗区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520303', '汇川区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520321', '遵义县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520322', '桐梓县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520323', '绥阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520324', '正安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520325', '道真仡佬族苗族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520326', '务川仡佬族苗族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520327', '凤冈县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520328', '湄潭县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520329', '余庆县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520330', '习水县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520381', '赤水市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520382', '仁怀市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520401', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520402', '西秀区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520421', '平坝县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520422', '普定县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520423', '镇宁布依族苗族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520424', '关岭布依族苗族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520425', '紫云苗族布依族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522201', '铜仁市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522222', '江口县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522223', '玉屏侗族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522224', '石阡县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522225', '思南县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522226', '印江土家族苗族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522227', '德江县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522228', '沿河土家族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522229', '松桃苗族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522230', '万山特区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522301', '兴义市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522322', '兴仁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522323', '普安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522324', '晴隆县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522325', '贞丰县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522326', '望谟县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522327', '册亨县');
commit;
prompt 2300 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522328', '安龙县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522401', '毕节市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522422', '大方县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522423', '黔西县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522424', '金沙县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522425', '织金县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522426', '纳雍县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522427', '威宁彝族回族苗族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522428', '赫章县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522601', '凯里市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522622', '黄平县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522623', '施秉县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522624', '三穗县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522625', '镇远县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522626', '岑巩县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522627', '天柱县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522628', '锦屏县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522629', '剑河县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522630', '台江县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522631', '黎平县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522632', '榕江县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522633', '从江县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522634', '雷山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522635', '麻江县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522636', '丹寨县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522701', '都匀市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522702', '福泉市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522722', '荔波县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522723', '贵定县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522725', '瓮安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522726', '独山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522727', '平塘县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522728', '罗甸县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522729', '长顺县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522730', '龙里县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522731', '惠水县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522732', '三都水族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530102', '五华区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530103', '盘龙区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530111', '官渡区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530112', '西山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530113', '东川区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530121', '呈贡县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530122', '晋宁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530124', '富民县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530125', '宜良县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530126', '石林彝族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530127', '嵩明县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530128', '禄劝彝族苗族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530129', '寻甸回族彝族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530181', '安宁市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530301', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530302', '麒麟区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530321', '马龙县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530322', '陆良县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530323', '师宗县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530324', '罗平县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530325', '富源县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530326', '会泽县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530328', '沾益县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530381', '宣威市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530401', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530402', '红塔区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530421', '江川县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530422', '澄江县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530423', '通海县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530424', '华宁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530425', '易门县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530426', '峨山彝族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530427', '新平彝族傣族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530428', '元江哈尼族彝族傣族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530501', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530502', '隆阳区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530521', '施甸县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530522', '腾冲县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530523', '龙陵县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530524', '昌宁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530601', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530602', '昭阳区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530621', '鲁甸县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530622', '巧家县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530623', '盐津县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530624', '大关县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530625', '永善县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530626', '绥江县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530627', '镇雄县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530628', '彝良县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530629', '威信县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530630', '水富县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530701', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530702', '古城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530721', '玉龙纳西族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530722', '永胜县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530723', '华坪县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530724', '宁蒗彝族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530801', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530802', '翠云区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530821', '普洱哈尼族彝族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530822', '墨江哈尼族自治县');
commit;
prompt 2400 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530823', '景东彝族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530824', '景谷傣族彝族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530825', '镇沅彝族哈尼族拉祜族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530826', '江城哈尼族彝族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530827', '孟连傣族拉祜族佤族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530828', '澜沧拉祜族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530829', '西盟佤族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530901', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530902', '临翔区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530921', '凤庆县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530922', '云　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530923', '永德县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530924', '镇康县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530925', '双江拉祜族佤族布朗族傣族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530926', '耿马傣族佤族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530927', '沧源佤族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532301', '楚雄市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532322', '双柏县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532323', '牟定县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532324', '南华县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532325', '姚安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532326', '大姚县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532327', '永仁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532328', '元谋县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532329', '武定县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532331', '禄丰县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532501', '个旧市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532502', '开远市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532522', '蒙自县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532523', '屏边苗族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532524', '建水县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532525', '石屏县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532526', '弥勒县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532527', '泸西县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532528', '元阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532529', '红河县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532530', '金平苗族瑶族傣族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532531', '绿春县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532532', '河口瑶族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532621', '文山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532622', '砚山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532623', '西畴县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532624', '麻栗坡县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532625', '马关县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532626', '丘北县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532627', '广南县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532628', '富宁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532801', '景洪市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532822', '勐海县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532823', '勐腊县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532901', '大理市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532922', '漾濞彝族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532923', '祥云县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532924', '宾川县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532925', '弥渡县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532926', '南涧彝族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532927', '巍山彝族回族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532928', '永平县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532929', '云龙县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532930', '洱源县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532931', '剑川县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532932', '鹤庆县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('533102', '瑞丽市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('533103', '潞西市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('533122', '梁河县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('533123', '盈江县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('533124', '陇川县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('533321', '泸水县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('533323', '福贡县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('533324', '贡山独龙族怒族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('533325', '兰坪白族普米族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('533421', '香格里拉县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('533422', '德钦县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('533423', '维西傈僳族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('540101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('540102', '城关区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('540121', '林周县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('540122', '当雄县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('540123', '尼木县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('540124', '曲水县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('540125', '堆龙德庆县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('540126', '达孜县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('540127', '墨竹工卡县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542121', '昌都县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542122', '江达县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542123', '贡觉县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542124', '类乌齐县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542125', '丁青县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542126', '察雅县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542127', '八宿县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542128', '左贡县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542129', '芒康县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542132', '洛隆县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542133', '边坝县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542221', '乃东县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542222', '扎囊县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542223', '贡嘎县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542224', '桑日县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542225', '琼结县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542226', '曲松县');
commit;
prompt 2500 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542227', '措美县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542228', '洛扎县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542229', '加查县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542231', '隆子县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542232', '错那县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542233', '浪卡子县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542301', '日喀则市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542322', '南木林县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542323', '江孜县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542324', '定日县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542325', '萨迦县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542326', '拉孜县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542327', '昂仁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542328', '谢通门县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542329', '白朗县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542330', '仁布县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542331', '康马县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542332', '定结县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542333', '仲巴县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542334', '亚东县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542335', '吉隆县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542336', '聂拉木县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542337', '萨嘎县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542338', '岗巴县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542421', '那曲县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542422', '嘉黎县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542423', '比如县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542424', '聂荣县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542425', '安多县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542426', '申扎县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542427', '索　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542428', '班戈县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542429', '巴青县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542430', '尼玛县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542521', '普兰县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542522', '札达县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542523', '噶尔县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542524', '日土县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542525', '革吉县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542526', '改则县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542527', '措勤县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542621', '林芝县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542622', '工布江达县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542623', '米林县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542624', '墨脱县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542625', '波密县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542626', '察隅县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542627', '朗　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610102', '新城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610103', '碑林区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610104', '莲湖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610111', '灞桥区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610112', '未央区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610113', '雁塔区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610114', '阎良区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610115', '临潼区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610116', '长安区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610122', '蓝田县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610124', '周至县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610125', '户　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610126', '高陵县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610201', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610202', '王益区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610203', '印台区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610204', '耀州区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610222', '宜君县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610301', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610302', '渭滨区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610303', '金台区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610304', '陈仓区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610322', '凤翔县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610323', '岐山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610324', '扶风县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610326', '眉　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610327', '陇　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610328', '千阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610329', '麟游县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610330', '凤　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610331', '太白县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610401', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610402', '秦都区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610403', '杨凌区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610404', '渭城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610422', '三原县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610423', '泾阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610424', '乾　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610425', '礼泉县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610426', '永寿县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610427', '彬　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610428', '长武县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610429', '旬邑县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610430', '淳化县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610431', '武功县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610481', '兴平市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610501', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610502', '临渭区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610521', '华　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610522', '潼关县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610523', '大荔县');
commit;
prompt 2600 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610524', '合阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610525', '澄城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610526', '蒲城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610527', '白水县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610528', '富平县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610581', '韩城市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610582', '华阴市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610601', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610602', '宝塔区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610621', '延长县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610622', '延川县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610623', '子长县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610624', '安塞县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610625', '志丹县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610626', '吴旗县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610627', '甘泉县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610628', '富　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610629', '洛川县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610630', '宜川县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610631', '黄龙县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610632', '黄陵县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610701', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610702', '汉台区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610721', '南郑县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610722', '城固县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610723', '洋　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610724', '西乡县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610725', '勉　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610726', '宁强县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610727', '略阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610728', '镇巴县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610729', '留坝县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610730', '佛坪县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610801', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610802', '榆阳区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610821', '神木县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610822', '府谷县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610823', '横山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610824', '靖边县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610825', '定边县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610826', '绥德县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610827', '米脂县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610828', '佳　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610829', '吴堡县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610830', '清涧县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610831', '子洲县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610901', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610902', '汉滨区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610921', '汉阴县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610922', '石泉县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610923', '宁陕县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610924', '紫阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610925', '岚皋县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610926', '平利县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610927', '镇坪县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610928', '旬阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610929', '白河县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('611001', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('611002', '商州区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('611021', '洛南县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('611022', '丹凤县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('611023', '商南县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('611024', '山阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('611025', '镇安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('611026', '柞水县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620102', '城关区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620103', '七里河区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620104', '西固区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620105', '安宁区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620111', '红古区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620121', '永登县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620122', '皋兰县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620123', '榆中县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620201', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620301', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620302', '金川区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620321', '永昌县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620401', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620402', '白银区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620403', '平川区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620421', '靖远县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620422', '会宁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620423', '景泰县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620501', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620502', '秦城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620503', '北道区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620521', '清水县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620522', '秦安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620523', '甘谷县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620524', '武山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620525', '张家川回族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620601', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620602', '凉州区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620621', '民勤县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620622', '古浪县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620623', '天祝藏族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620701', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620702', '甘州区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620721', '肃南裕固族自治县');
commit;
prompt 2700 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620722', '民乐县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620723', '临泽县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620724', '高台县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620725', '山丹县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620801', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620802', '崆峒区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620821', '泾川县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620822', '灵台县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620823', '崇信县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620824', '华亭县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620825', '庄浪县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620826', '静宁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620901', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620902', '肃州区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620921', '金塔县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620922', '安西县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620923', '肃北蒙古族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620924', '阿克塞哈萨克族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620981', '玉门市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620982', '敦煌市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621001', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621002', '西峰区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621021', '庆城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621022', '环　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621023', '华池县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621024', '合水县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621025', '正宁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621026', '宁　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621027', '镇原县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621102', '安定区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621121', '通渭县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621122', '陇西县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621123', '渭源县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621124', '临洮县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621125', '漳　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621126', '岷　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621201', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621202', '武都区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621221', '成　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621222', '文　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621223', '宕昌县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621224', '康　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621225', '西和县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621226', '礼　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621227', '徽　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621228', '两当县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('622901', '临夏市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('622921', '临夏县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('622922', '康乐县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('622923', '永靖县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('622924', '广河县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('622925', '和政县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('622926', '东乡族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('622927', '积石山保安族东乡族撒拉族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('623001', '合作市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('623021', '临潭县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('623022', '卓尼县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('623023', '舟曲县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('623024', '迭部县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('623025', '玛曲县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('623026', '碌曲县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('623027', '夏河县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('630101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('630102', '城东区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('630103', '城中区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('630104', '城西区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('630105', '城北区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('630121', '大通回族土族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('630122', '湟中县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('630123', '湟源县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632121', '平安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632122', '民和回族土族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632123', '乐都县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632126', '互助土族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632127', '化隆回族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632128', '循化撒拉族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632221', '门源回族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632222', '祁连县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632223', '海晏县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632224', '刚察县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632321', '同仁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632322', '尖扎县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632323', '泽库县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632324', '河南蒙古族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632521', '共和县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632522', '同德县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632523', '贵德县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632524', '兴海县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632525', '贵南县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632621', '玛沁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632622', '班玛县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632623', '甘德县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632624', '达日县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632625', '久治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632626', '玛多县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632721', '玉树县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632722', '杂多县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632723', '称多县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632724', '治多县');
commit;
prompt 2800 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632725', '囊谦县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632726', '曲麻莱县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632801', '格尔木市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632802', '德令哈市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632821', '乌兰县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632822', '都兰县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632823', '天峻县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640104', '兴庆区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640105', '西夏区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640106', '金凤区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640121', '永宁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640122', '贺兰县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640181', '灵武市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640201', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640202', '大武口区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640205', '惠农区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640221', '平罗县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640301', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640302', '利通区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640323', '盐池县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640324', '同心县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640381', '青铜峡市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640401', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640402', '原州区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640422', '西吉县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640423', '隆德县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640424', '泾源县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640425', '彭阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640501', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640502', '沙坡头区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640521', '中宁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640522', '海原县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('650101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('650102', '天山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('650103', '沙依巴克区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('650104', '新市区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('650105', '水磨沟区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('650106', '头屯河区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('650107', '达坂城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('650108', '东山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('650121', '乌鲁木齐县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('650201', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('650202', '独山子区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('650203', '克拉玛依区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('650204', '白碱滩区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('650205', '乌尔禾区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652101', '吐鲁番市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652122', '鄯善县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652123', '托克逊县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652201', '哈密市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652222', '巴里坤哈萨克自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652223', '伊吾县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652301', '昌吉市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652302', '阜康市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652303', '米泉市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652323', '呼图壁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652324', '玛纳斯县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652325', '奇台县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652327', '吉木萨尔县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652328', '木垒哈萨克自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652701', '博乐市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652722', '精河县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652723', '温泉县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652801', '库尔勒市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652822', '轮台县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652823', '尉犁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652824', '若羌县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652825', '且末县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652826', '焉耆回族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652827', '和静县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652828', '和硕县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652829', '博湖县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652901', '阿克苏市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652922', '温宿县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652923', '库车县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652924', '沙雅县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652925', '新和县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652926', '拜城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652927', '乌什县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652928', '阿瓦提县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652929', '柯坪县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653001', '阿图什市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653022', '阿克陶县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653023', '阿合奇县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653024', '乌恰县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653101', '喀什市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653121', '疏附县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653122', '疏勒县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653123', '英吉沙县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653124', '泽普县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653125', '莎车县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653126', '叶城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653127', '麦盖提县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653128', '岳普湖县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653129', '伽师县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653130', '巴楚县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653131', '塔什库尔干塔吉克自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653201', '和田市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653221', '和田县');
commit;
prompt 2900 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653222', '墨玉县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653223', '皮山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653224', '洛浦县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653225', '策勒县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653226', '于田县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653227', '民丰县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654002', '伊宁市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654003', '奎屯市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654021', '伊宁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654022', '察布查尔锡伯自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654023', '霍城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654024', '巩留县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654025', '新源县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654026', '昭苏县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654027', '特克斯县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654028', '尼勒克县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654201', '塔城市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654202', '乌苏市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654221', '额敏县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654223', '沙湾县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654224', '托里县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654225', '裕民县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654226', '和布克赛尔蒙古自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654301', '阿勒泰市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654321', '布尔津县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654322', '富蕴县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654323', '福海县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654324', '哈巴河县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654325', '青河县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654326', '吉木乃县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('659001', '石河子市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('659002', '阿拉尔市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('659003', '图木舒克市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('659004', '五家渠市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1102', '县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1201', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1202', '县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1301', '石家庄市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1302', '唐山市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1303', '秦皇岛市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1304', '邯郸市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1305', '邢台市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1306', '保定市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1307', '张家口市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1308', '承德市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1309', '沧州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1310', '廊坊市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1311', '衡水市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1401', '太原市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1402', '大同市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1403', '阳泉市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1404', '长治市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1405', '晋城市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1406', '朔州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1407', '晋中市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1408', '运城市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1409', '忻州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1410', '临汾市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1411', '吕梁市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1501', '呼和浩特市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1502', '包头市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1503', '乌海市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1504', '赤峰市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1505', '通辽市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1506', '鄂尔多斯市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1507', '呼伦贝尔市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1508', '巴彦淖尔市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1509', '乌兰察布市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1522', '兴安盟');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1525', '锡林郭勒盟');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1529', '阿拉善盟');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2101', '沈阳市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2102', '大连市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2103', '鞍山市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2104', '抚顺市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2105', '本溪市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2106', '丹东市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2107', '锦州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2108', '营口市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2109', '阜新市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2110', '辽阳市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2111', '盘锦市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2112', '铁岭市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2113', '朝阳市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2114', '葫芦岛市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2201', '长春市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2202', '吉林市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2203', '四平市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2204', '辽源市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2205', '通化市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2206', '白山市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2207', '松原市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2208', '白城市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2224', '延边朝鲜族自治州');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2301', '哈尔滨市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2302', '齐齐哈尔市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2303', '鸡西市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2304', '鹤岗市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2305', '双鸭山市');
commit;
prompt 3000 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2306', '大庆市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2307', '伊春市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2308', '佳木斯市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2309', '七台河市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2310', '牡丹江市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2311', '黑河市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2312', '绥化市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2327', '大兴安岭地区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3102', '县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3201', '南京市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3202', '无锡市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3203', '徐州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3204', '常州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3205', '苏州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3206', '南通市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3207', '连云港市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3208', '淮安市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3209', '盐城市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3210', '扬州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3211', '镇江市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3212', '泰州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3213', '宿迁市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3301', '杭州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3302', '宁波市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3303', '温州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3304', '嘉兴市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3305', '湖州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3306', '绍兴市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3307', '金华市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3308', '衢州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3309', '舟山市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3310', '台州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3311', '丽水市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3401', '合肥市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3402', '芜湖市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3403', '蚌埠市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3404', '淮南市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3405', '马鞍山市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3406', '淮北市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3407', '铜陵市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3408', '安庆市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3410', '黄山市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3411', '滁州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3412', '阜阳市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3413', '宿州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3414', '巢湖市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3415', '六安市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3416', '亳州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3417', '池州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3418', '宣城市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3501', '福州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3502', '厦门市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3503', '莆田市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3504', '三明市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3505', '泉州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3506', '漳州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3507', '南平市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3508', '龙岩市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3509', '宁德市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3601', '南昌市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3602', '景德镇市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3603', '萍乡市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3604', '九江市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3605', '新余市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3606', '鹰潭市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3607', '赣州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3608', '吉安市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3609', '宜春市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3610', '抚州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3611', '上饶市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3701', '济南市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3702', '青岛市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3703', '淄博市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3704', '枣庄市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3705', '东营市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3706', '烟台市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3707', '潍坊市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3708', '济宁市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3709', '泰安市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3710', '威海市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3711', '日照市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3712', '莱芜市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3713', '临沂市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3714', '德州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3715', '聊城市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3716', '滨州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3717', '荷泽市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4101', '郑州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4102', '开封市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4103', '洛阳市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4104', '平顶山市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4105', '安阳市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4106', '鹤壁市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4107', '新乡市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4108', '焦作市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4109', '濮阳市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4110', '许昌市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4111', '漯河市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4112', '三门峡市');
commit;
prompt 3100 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4113', '南阳市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4114', '商丘市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4115', '信阳市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4116', '周口市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4117', '驻马店市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4201', '武汉市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4202', '黄石市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4203', '十堰市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4205', '宜昌市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4206', '襄樊市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4207', '鄂州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4208', '荆门市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4209', '孝感市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4210', '荆州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4211', '黄冈市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4212', '咸宁市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4213', '随州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4228', '恩施土家族苗族自治州');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4290', '省直辖行政单位');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4301', '长沙市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4302', '株洲市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4303', '湘潭市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4304', '衡阳市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4305', '邵阳市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4306', '岳阳市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4307', '常德市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4308', '张家界市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4309', '益阳市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4310', '郴州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4311', '永州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4312', '怀化市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4313', '娄底市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4331', '湘西土家族苗族自治州');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4401', '广州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4402', '韶关市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4403', '深圳市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4404', '珠海市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4405', '汕头市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4406', '佛山市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4407', '江门市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4408', '湛江市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4409', '茂名市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4412', '肇庆市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4413', '惠州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4414', '梅州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4415', '汕尾市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4416', '河源市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4417', '阳江市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4418', '清远市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4419', '东莞市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4420', '中山市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4451', '潮州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4452', '揭阳市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4453', '云浮市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4501', '南宁市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4502', '柳州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4503', '桂林市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4504', '梧州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4505', '北海市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4506', '防城港市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4507', '钦州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4508', '贵港市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4509', '玉林市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4510', '百色市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4511', '贺州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4512', '河池市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4513', '来宾市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4514', '崇左市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4601', '海口市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4602', '三亚市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4690', '省直辖县级行政单位');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5001', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5002', '县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5003', '市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5101', '成都市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5103', '自贡市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5104', '攀枝花市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5105', '泸州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5106', '德阳市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5107', '绵阳市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5108', '广元市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5109', '遂宁市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5110', '内江市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5111', '乐山市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5113', '南充市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5114', '眉山市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5115', '宜宾市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5116', '广安市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5117', '达州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5118', '雅安市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5119', '巴中市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5120', '资阳市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5132', '阿坝藏族羌族自治州');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5133', '甘孜藏族自治州');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5134', '凉山彝族自治州');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5201', '贵阳市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5202', '六盘水市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5203', '遵义市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5204', '安顺市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5222', '铜仁地区');
commit;
prompt 3200 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5223', '黔西南布依族苗族自治州');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5224', '毕节地区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5226', '黔东南苗族侗族自治州');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5227', '黔南布依族苗族自治州');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5301', '昆明市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5303', '曲靖市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5304', '玉溪市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5305', '保山市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5306', '昭通市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5307', '丽江市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5308', '思茅市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5309', '临沧市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5323', '楚雄彝族自治州');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5325', '红河哈尼族彝族自治州');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5326', '文山壮族苗族自治州');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5328', '西双版纳傣族自治州');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5329', '大理白族自治州');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5331', '德宏傣族景颇族自治州');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5333', '怒江傈僳族自治州');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5334', '迪庆藏族自治州');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5401', '拉萨市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5421', '昌都地区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5422', '山南地区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5423', '日喀则地区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5424', '那曲地区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5425', '阿里地区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5426', '林芝地区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6101', '西安市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6102', '铜川市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6103', '宝鸡市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6104', '咸阳市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6105', '渭南市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6106', '延安市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6107', '汉中市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6108', '榆林市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6109', '安康市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6110', '商洛市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6201', '兰州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6202', '嘉峪关市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6203', '金昌市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6204', '白银市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6205', '天水市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6206', '武威市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6207', '张掖市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6208', '平凉市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6209', '酒泉市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6210', '庆阳市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6211', '定西市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6212', '陇南市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6229', '临夏回族自治州');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6230', '甘南藏族自治州');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6301', '西宁市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6321', '海东地区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6322', '海北藏族自治州');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6323', '黄南藏族自治州');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6325', '海南藏族自治州');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6326', '果洛藏族自治州');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6327', '玉树藏族自治州');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6328', '海西蒙古族藏族自治州');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6401', '银川市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6402', '石嘴山市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6403', '吴忠市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6404', '固原市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6405', '中卫市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6501', '乌鲁木齐市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6502', '克拉玛依市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6521', '吐鲁番地区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6522', '哈密地区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6523', '昌吉回族自治州');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6527', '博尔塔拉蒙古自治州');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6528', '巴音郭楞蒙古自治州');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6529', '阿克苏地区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6530', '克孜勒苏柯尔克孜自治州');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6531', '喀什地区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6532', '和田地区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6540', '伊犁哈萨克自治州');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6542', '塔城地区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6543', '阿勒泰地区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6590', '省直辖行政单位');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('11', '北京市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('12', '天津市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('13', '河北省');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('14', '山西省');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('15', '内蒙古自治区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('21', '辽宁省');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('22', '吉林省');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('23', '黑龙江省');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('31', '上海市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('32', '江苏省');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('33', '浙江省');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('34', '安徽省');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('35', '福建省');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('36', '江西省');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('37', '山东省');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('41', '河南省');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('42', '湖北省');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('43', '湖南省');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('44', '广东省');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('45', '广西壮族自治区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('46', '海南省');
commit;
prompt 3300 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('50', '重庆市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('51', '四川省');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('52', '贵州省');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('53', '云南省');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('54', '西藏自治区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('61', '陕西省');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('62', '甘肃省');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('63', '青海省');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('64', '宁夏回族自治区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('65', '新疆维吾尔自治区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('71', '台湾省');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('81', '香港特别行政区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('82', '澳门特别行政区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430923', '安化县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430981', '沅江市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431001', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431002', '北湖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431003', '苏仙区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431021', '桂阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431022', '宜章县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431023', '永兴县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431024', '嘉禾县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431025', '临武县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431026', '汝城县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431027', '桂东县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431028', '安仁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431081', '资兴市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431102', '芝山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431103', '冷水滩区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431121', '祁阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431122', '东安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431123', '双牌县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431124', '道　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431125', '江永县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431126', '宁远县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431127', '蓝山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431128', '新田县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431129', '江华瑶族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431201', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431202', '鹤城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431221', '中方县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431222', '沅陵县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431223', '辰溪县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431224', '溆浦县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431225', '会同县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431226', '麻阳苗族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431227', '新晃侗族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431228', '芷江侗族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431229', '靖州苗族侗族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431230', '通道侗族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431281', '洪江市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431301', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431302', '娄星区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431321', '双峰县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431322', '新化县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431381', '冷水江市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431382', '涟源市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('433101', '吉首市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('433122', '泸溪县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('433123', '凤凰县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('433124', '花垣县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('433125', '保靖县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('433126', '古丈县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('433127', '永顺县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('433130', '龙山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440102', '东山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440103', '荔湾区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440104', '越秀区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440105', '海珠区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440106', '天河区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440107', '芳村区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440111', '白云区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440112', '黄埔区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440113', '番禺区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440114', '花都区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440183', '增城市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440184', '从化市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440201', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440203', '武江区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440204', '浈江区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440205', '曲江区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440222', '始兴县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440224', '仁化县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440229', '翁源县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440232', '乳源瑶族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440233', '新丰县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440281', '乐昌市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440282', '南雄市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440301', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440303', '罗湖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440304', '福田区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440305', '南山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440306', '宝安区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440307', '龙岗区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440308', '盐田区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440401', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440402', '香洲区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440403', '斗门区');
commit;
prompt 3400 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440404', '金湾区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440501', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440507', '龙湖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440511', '金平区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440512', '濠江区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440513', '潮阳区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440514', '潮南区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440515', '澄海区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440523', '南澳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440601', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440604', '禅城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440605', '南海区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440606', '顺德区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440607', '三水区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440608', '高明区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440701', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440703', '蓬江区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440704', '江海区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440705', '新会区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440781', '台山市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440783', '开平市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440784', '鹤山市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440785', '恩平市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440801', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440802', '赤坎区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440803', '霞山区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440804', '坡头区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440811', '麻章区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440823', '遂溪县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440825', '徐闻县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440881', '廉江市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440882', '雷州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440883', '吴川市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440901', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440902', '茂南区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440903', '茂港区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440923', '电白县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440981', '高州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440982', '化州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440983', '信宜市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441201', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441202', '端州区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441203', '鼎湖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441223', '广宁县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441224', '怀集县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441225', '封开县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441226', '德庆县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441283', '高要市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441284', '四会市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441301', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441302', '惠城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441303', '惠阳区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441322', '博罗县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441323', '惠东县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441324', '龙门县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441401', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441402', '梅江区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441421', '梅　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441422', '大埔县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441423', '丰顺县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441424', '五华县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441426', '平远县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441427', '蕉岭县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441481', '兴宁市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441501', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441502', '城　区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441521', '海丰县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441523', '陆河县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441581', '陆丰市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441601', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441602', '源城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441621', '紫金县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441622', '龙川县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441623', '连平县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441624', '和平县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441625', '东源县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441701', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441702', '江城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441721', '阳西县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441723', '阳东县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441781', '阳春市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441801', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441802', '清城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441821', '佛冈县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441823', '阳山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441825', '连山壮族瑶族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441826', '连南瑶族自治县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441827', '清新县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441881', '英德市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441882', '连州市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('445101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('445102', '湘桥区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('445121', '潮安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('445122', '饶平县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('445201', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('445202', '榕城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('445221', '揭东县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('445222', '揭西县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('445224', '惠来县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('445281', '普宁市');
commit;
prompt 3500 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('445301', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('445302', '云城区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('445321', '新兴县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('445322', '郁南县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('445323', '云安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('445381', '罗定市');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450101', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450102', '兴宁区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450103', '青秀区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450105', '江南区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450107', '西乡塘区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450108', '良庆区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450109', '邕宁区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450122', '武鸣县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450123', '隆安县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450124', '马山县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450125', '上林县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450126', '宾阳县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450127', '横　县');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450201', '市辖区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450202', '城中区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450203', '鱼峰区');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450204', '柳南区');
commit;
prompt 3523 records loaded
prompt Loading EA_DEMO_FCF...
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('一月', '1098', 'AFD8F8', null, '0', '1', 1);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('二月', '40000', 'F6BD0F', null, '0', '1', 2);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('三月', '99999', '8BBA00', null, '0', '1', 3);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('四月', '109000', '008E8E', null, '0', '1', 4);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('五月', '35000', 'D64646', null, '1', '1', 5);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('六月', '90000', '8E468E', '60', '0', '1', 6);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('七月', '50000', '588526', null, '0', '1', 7);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('八月', '63000', 'B3AA00', null, '1', '1', 8);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('九月', '152000', '008ED6', null, '0', '1', 9);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('十月', '122000', '9D080D', null, '0', '1', 10);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('十一月', '30000', 'A186BE', null, '0', '1', 11);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('十二月', '50000', '1EBE38', null, '0', '1', 12);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('一月', '150000', 'AFD8F8', null, '0', '2', 1);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('二月', '20000', 'F6BD0F', null, '0', '2', 2);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('三月', '50000', 'FF8E46', null, '0', '2', 3);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('四月', '9000', '008E8E', null, '0', '2', 4);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('五月', '85000', 'D64646', null, '1', '2', 5);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('六月', '10000', '8E468E', '60', '0', '2', 6);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('七月', '40000', '588526', null, '0', '2', 7);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('八月', '78000', 'B3AA00', null, '1', '2', 8);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('九月', '112000', '008ED6', null, '0', '2', 9);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('十月', '172000', '9D080D', null, '0', '2', 10);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('十一月', '10000', 'A186BE', null, '0', '2', 11);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('十二月', '50000', '1EBE38', null, '0', '2', 12);
commit;
prompt 24 records loaded
prompt Loading EA_DEMO_SFXM...
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105703', '02', '发酵虫草菌粉胶囊', 'fjccjfjn', '0.25g×50粒', '瓶', .9, '胶囊剂', '昆明老拔云堂药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105704', '01', '注射用甲磺酸培氟沙星', 'zsyjhspfsx', '0.2g', '盒', .9, '冻干粉针', '海口康力元制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105705', '01', '注射用甲磺酸培氟沙星', 'zsyjhspfsx', '0.4g', '盒', .9, '冻干粉针', '海口康力元制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105706', '01', '注射用甲磺酸培氟沙星', 'zsyjhspfsx', '0.2g', '盒', .9, '粉针剂', '哈尔滨三联药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105707', '01', '注射用甲磺酸培氟沙星', 'zsyjhspfsx', '0.4g', '盒', .9, '粉针剂', '哈尔滨三联药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105708', '01', '甲磺酸培氟沙星注射液', 'jhspfsxzsy', '5ml:0.4g', '支', .9, '注射液', '白求恩医科大学制药厂', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105709', '01', '甲磺酸培氟沙星注射液', 'jhspfsxzsy', '5ml:0.4g', '盒', .9, '注射剂', '白求恩医科大学制药厂', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105710', '01', '注射用盐酸左氧氟沙星', 'zsyyszyfsx', '0.3g', '支', .9, '注射剂', '山西威奇达药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105711', '01', '注射用盐酸左氧氟沙星', 'zsyyszyfsx', '0.4g', '支', .9, '注射剂', '山西威奇达药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105712', '01', '注射用甲磺酸左氧氟沙星', 'zsyjhszyfsx', '0.1g', '支', .9, '注射剂', '吉林省西点药业科技发展股份有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105713', '01', '注射用甲磺酸左氧氟沙星', 'zsyjhszyfsx', '0.2g', '支', .9, '注射剂', '吉林省西点药业科技发展股份有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105714', '01', '乳酸左氧氟沙星注射剂', 'rszyfsxzsj', '100ml:0.2g', '瓶', .9, '注射液', '哈尔滨三联药业', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105715', '01', '盐酸左氧氟沙星氯化钠注射液', 'yszyfsxlhnzsy', '100ml:0.3g', '瓶', .9, '注射剂', '广东彼迪药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105716', '01', '盐酸左氧氟沙星注射液', 'yszyfsxzsy', '10ml:0.3g', '盒', .9, '注射剂', '白求恩医科大学制药厂', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105717', '01', '甲磺酸帕珠沙星氯化钠注射液', 'jhspzsxlhnzsy', '100ml:0.5g', '瓶', .9, '注射液', '山东康宁药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105718', '01', '奥硝唑注射液', 'axzzsy', '10ml:0.5g', '盒', .9, '注射剂', '山西普德药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105719', '01', '利福平注射液', 'lfpzsy', '5ml×0.3g', '盒', .9, '注射液', '沈阳双鼎制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105720', '01', '利福霉素钠注射液', 'lfmsnzsy', '5ml×0.25g', '盒', .9, '注射液', '沈阳双鼎制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105721', '01', '注射用利福霉素钠', 'zsylfmsn', '250mg', '支', .9, '冻干粉针', '哈尔滨三联药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105722', '01', '氟康唑胶囊', 'fkzjn', '0.15g×3粒', '盒', .9, '胶囊剂', '河南辅仁堂制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105723', '01', '氟康唑胶囊', 'fkzjn', '0.1g×6S’', '盒', .9, '胶囊剂', '广东彼迪药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105724', '01', '注射用克林霉素磷酸酯', 'zsyklmslsz', '1.2g', '支', .9, '冻干粉针', '内蒙古白医制药股份有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105725', '01', '头孢哌酮钠舒巴坦钠注射剂', 'tbptnsbtnzsj', '1.0g', '支', .9, '注射剂', '苏州二叶制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105726', '01', '注射用头孢哌酮钠舒巴坦钠(2:1', 'zsytbptnsbtn(2', '1.5g', '支', .9, '注射剂', '苏州东瑞制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105727', '01', '注射用头孢哌酮钠舒巴坦钠(2:2', 'zsytbptnsbtn(2', '3g', '支', .9, '注射剂', '苏州东瑞制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105728', '01', '注射用头孢哌酮钠舒巴坦钠', 'zsytbptnsbtn', '1.0g', '盒', .9, '注射剂', '江西东风药业股份有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105729', '01', '注射用头孢哌酮钠舒巴坦钠', 'zsytbptnsbtn', '2.0g', '盒', .9, '注射剂', '江西东风药业股份有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105730', '01', '注射用头孢哌酮钠舒巴坦钠(2.1', 'zsytbptnsbtn(2', '2.25g', '瓶', .9, '注射剂', '杭州国光药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105731', '01', '碘海醇溶液', 'dhcry', '50ml*32.4g', '瓶', .9, '溶液剂', '扬子江药业集团有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105732', '01', '碘海醇注射液', 'dhczsy', '300mg*20ml', '瓶', .9, '注射液', '上海奈科明制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105733', '01', '碘海醇注射液', 'dhczsy', '32.4g*50ml', '瓶', .9, '注射剂', '江苏海慈药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105734', '01', '异维A酸胶丸', 'ywasjw', '10mg*15粒/盒', '盒', .9, '软胶丸', '上海中洋海洋生物工程股份有限公司东海制药厂', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105735', '01', '坎地沙坦脂胶囊', 'kdstzjn', '4ml*14粒', '盒', .9, '胶囊剂', '江苏苏中药业集团股份有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105736', '01', '替米沙坦片', 'tmstp', '40mg*20片/盒', '盒', .9, '片剂', '重庆康尔威药业股份有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105737', '01', '缬沙坦分散片', 'xstfsp', '80mg×7片', '盒', .9, '分散片剂', '海南皇隆制药厂有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105738', '01', '缬沙坦分散片', 'xstfsp', '80mg×14片', '盒', .9, '分散片剂', '海南皇隆制药厂有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105739', '01', '注射用硝普钠', 'zsyxpn', '50mg', '盒', 1, '冻干粉针', '开封康诺药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105740', '01', '磷酸川芎嗪注射液', 'lscxqzsy', '2ml：50mg', '盒', .9, '注射剂', '河南天方药业股份有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105741', '01', '磷酸川芎嗪葡萄糖注射液', 'lscxqpttzsy', '100ml:0.1g', '瓶', .9, '注射液', '河南帅克制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105742', '01', '注射用磷酸川芎嗪', 'zsylscxq', '0.1g/瓶', '瓶', .9, '粉针剂', '福建省闽东力捷迅药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105743', '01', '单硝酸异山梨酯注射液', 'dxsyslzzsy', '2ml：25mg', '支', .9, '注射剂', '南宁枫叶药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105744', '01', '注射用单硝酸异山梨酯', 'zsydxsyslz', '25mg', '支', .9, '注射液', '武汉华龙生物制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105745', '01', '复方磺胺甲噁唑片', 'ffhajzp', '0.5g', '瓶', 1, '片剂', '云南南诏药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105746', '01', '磺胺嘧啶钠注射液', 'hamdnzsy', '2ml：0.4g', '支', 1, '注射液', '海南制药厂有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105747', '01', '乳酸环丙沙星注射液', 'rshbsxzsy', '100ml*0.2g', '盒', 1, '注射液', '四川科伦药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105748', '01', '氧氟沙星滴耳液', 'yfsxdey', '5ml.15mg', '支', 1, '滴耳液', '郑州卓峰制药厂', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105749', '01', '氧氟沙星滴眼液', 'yfsxdyy', '15mg/5ml', '支', .9, '外用剂', '日本参天制药株式会社', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105750', '01', '氧氟沙星眼膏', 'yfsxyg', '3.5g', '支', .9, '眼膏剂', '日本参天制药株式会社', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105751', '01', '氧氟沙星片', 'yfsxp', '0.1g*12片', '盒', .9, '片剂', '江西南昌制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105752', '01', '氧氟沙星片', 'yfsxp', '0.1×12片', '盒', .9, '片剂', '浙江得恩得制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105753', '01', '氧氟沙星氯化钠注射液', 'yfsxlhnzsy', '100ml', '瓶', 1, '注射剂', '六枝工矿（集团大华药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105754', '01', '氧氟沙星氯化钠注射液', 'yfsxlhnzsy', '100ml', '瓶', 1, '注射剂', '六枝工矿（集团大华药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105755', '01', '氟罗沙星注射液', 'flsxzsy', '100ml:0.4g', '袋', .9, '注射剂', '四川美大康佳乐药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105756', '01', '加替沙星注射剂', 'jtsxzsj', '0.2g', '支', .9, '粉针剂', '浙江亚太药业股份有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105757', '01', '盐酸加替沙星氯化钠注射剂', 'ysjtsxlhnzsj', '0.2g*100ml', '瓶', .9, '注射液', '陕西金裕制药', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105758', '01', '加替沙星注射液', 'jtsxzsy', '0.2g', '盒', .9, '注射液', '西安交大药业集团陕西金麒麟药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105759', '01', '加替沙星胶囊', 'jtsxjn', '200mg×8粒', '盒', .9, '胶囊剂', '湖北省益康制药厂', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105760', '01', '加替沙星片', 'jtsxp', '0.2g*12片', '盒', .9, '片剂', '西安万隆制药有限责任公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105761', '01', '加替沙星注射剂', 'jtsxzsj', '10ml:200mg', '盒', .9, '注射剂', '安徽大东方药业' || chr(10) || '有限责任公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105762', '01', '洛美沙星注射剂', 'lmsxzsj', '0.1g*12', '盒', .9, '注射液', '浙江贡肽药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105763', '01', '门冬氨酸洛美沙星注射液', 'mdaslmsxzsy', '10ml:0.2g', '支', .9, '注射剂', '长春大政国际经贸(集团制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105764', '01', '盐酸洛美沙星片', 'yslmsxp', '0.3g*6片', '盒', .9, '片剂', '广州欧化药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105765', '01', '盐酸洛美沙星片', 'yslmsxp', '0.1g*12片', '盒', .9, '片剂', '广州欧化药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105766', '01', '注射用克林霉素磷酸酯', 'zsyklmslsz', '0.15g', '瓶', .9, '注射剂', '浙江九旭药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105767', '01', '注射用盐酸氨溴索', 'zsyysaxs', '30mg', '瓶', .9, '冻干粉针剂', '南京长澳制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105768', '01', '糜蛋白酶注射剂', 'mdbmzsj', '5mg*5ml', '盒', .9, '注射剂', '上海第一生化制药厂', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105769', '01', '乙酰半胱氨酸胶囊', 'yxbgasjn', '0.2g', '盒', .9, '胶囊剂', '广东人人康药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105770', '01', '复方甘草合剂', 'ffgchj', '180ml', '瓶', 1, '口服溶液剂', '南京白敬宇制药有限责任公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105771', '01', '复方甘草合剂', 'ffgchj', '100ml', '瓶', 1, '口服溶液剂', '南京白敬宇制药有限责任公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105772', '01', '复方磷酸可待因溶液', 'fflskdyry', '60ml', '瓶', .9, '溶液剂', '深圳市制药厂', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105773', '01', '注射用氢溴酸右美沙芬', 'zsyqxsymsf', '5mg', '支', .9, '冻干粉', '江苏金丝利药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105774', '91', '洁白胶囊', 'jbjn', '0.4g×20', '盒', .9, '胶囊剂', '兰州和盛堂制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105775', '91', '六味安消胶囊', 'lwaxjn', '0.5g*36粒', '盒', .9, '胶囊剂', '江西银涛药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105776', '91', '诺迪康胶囊', 'ndkjn', '10粒/盒', '盒', .9, '胶囊剂', '成都诺迪康生物制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105777', '91', '奇正消痛贴膏', 'qzxttg', '5贴', '盒', .9, '外用膏', '甘肃奇正藏药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105778', '02', '陈香露白露片', 'cxlblp', '100片', '瓶', .9, '片剂', '云南医药工业股份有限公司昆明振华制药厂', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105779', '02', '陈香露白露片', 'cxlblp', '100×1瓶', '瓶', .9, '片剂', '贵港市冠峰制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105780', '02', '陈香露白露片', 'cxlblp', '0.3×100', '瓶', .9, '片剂', '四川康福来制药厂', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105781', '02', '陈香露白露片', 'cxlblp', '0.3×100s', '瓶', .9, '片剂', '广西千珍制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105782', '02', '复方罗布麻片', 'fflbmp', '100×1', '瓶', .9, '片剂', '东芝堂药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105783', '02', '人参再造丸', 'rczzw', '3.0g*10丸', '盒', 1, '丸剂', '腾冲制药厂', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105784', '02', '祖师麻注射液', 'zsmzsy', '2ml×10支', '盒', .9, '注射液', '万容三九药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105785', '02', '祖师麻注射液', 'zsmzsy', '2ml×10', '盒', .9, '注射液', '甘肃兰药药业集团有限责任公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105786', '02', '肾炎四味片', 'syswp', '360mg*100片', '瓶', 1, '片剂', '湖北亿雄祥瑞药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105787', '02', '普乐安片', 'plap', '0.5g×60片', '盒', 1, '片剂', '昆明老拔云堂制药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105788', '02', '宝光风湿液', 'bgfsy', '100ml*2瓶/盒', '盒', 1, '口服液', '广东罗浮山药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105789', '02', '消炎利胆片', 'xyldp', '12片*3板', '盒', 1, '片剂', '广西帮琪药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105790', '02', '京万红软膏', 'jwhrg', '10g/支', '支', 1, '软膏剂', '天津达仁堂达二药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105791', '02', '化痔栓', 'hzs', '10枚', '瓶', .9, '栓剂', '广州敬修堂药业股份制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105792', '02', '肛泰栓', 'gts', '0.5g*4s', '盒', .9, '栓剂', '烟台荣昌制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105793', '02', '肛泰栓', 'gts', '12g*6枚', '盒', .9, '栓剂', '烟台荣昌制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105794', '02', '九华痔疮栓', 'jhzcs', '2.1*5枚', '盒', .9, '栓剂', '江西瑞金三九药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105795', '02', '痔疮栓', 'zcs', '10粒/盒', '盒', .9, '栓剂', '湖北东信药业有限公司　', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105796', '02', '金钱草颗粒', 'jqckl', '15g*10袋', '盒', .9, '颗粒剂', '广西南宁维威制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105797', '01', '曲安奈德益康唑软膏', 'qandykzrg', '15g:0.15g', '支', .9, '软膏剂', '湖南迪诺制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105798', '01', '头孢吡肟注射液', 'tbbwzsy', '2.0g', '瓶', .9, '注射剂', '北京太洋药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105799', '01', '头孢唑肟钠注射液', 'tbzwnzsy', '2.0g', '支', .9, '注射剂', '苏州二叶制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105800', '01', '注射用头孢哌酮钠舒巴坦钠（2：1', 'zsytbptnsbtn21', '0.75g', '盒', .9, '粉针剂', '海南中化联合制业工业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105801', '01', '注射用盐酸罂粟碱', 'zsyysysj', '30mg', '支', .9, '粉针剂', '黑龙江飞峡制药工业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105802', '01', '脑蛋白水解物注射液', 'ndbsjwzsy', '5ml×5支', '支', .9, '注射液', '吉林龙泰制药股份有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105803', '01', '注射用脑蛋白水解物', 'zsyndbsjw', '氨基酸350mg与总氮60mg', '盒', .9, '冻干粉针', '海口康力元制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105804', '01', '注射用脑蛋白水解物', 'zsyndbsjw', '氨基酸700mg与总氮120mg', '盒', .9, '冻干粉针', '海口康力元制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105805', '01', '注射用脑蛋白水解物', 'zsyndbsjw', '氨基酸700mg;总氮120mg', '瓶', .9, '冻干粉针', '海口康力元制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105806', '01', '注射用脑蛋白水解物(冻干', 'zsyndbsjw(dg', '游离氨基酸350mg+总氮60mg', '支', .9, '注射剂', '海口康力元制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105807', '01', '脑蛋白水解物注射液', 'ndbsjwzsy', '20m1/支', '支', .9, '注射剂', '哈尔滨三联药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105808', '01', '小牛血去蛋白提取物注射液', 'xnxqdbtqwzsy', '2ml:80mg', '盒', .9, '注射剂', '武汉人福药业责任有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105809', '01', '小牛血去蛋白提取物注射液', 'xnxqdbtqwzsy', '5ml:0.2g', '盒', .9, '注射剂', '武汉人福药业责任有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105810', '01', '注射用吡拉西坦', 'zsyblxt', '8g', '盒', .9, '冻干粉针', '海口康力元制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105811', '01', '盐酸吡硫醇注射剂', 'ysblczsj', '0.2g', '盒', .9, '注射剂', '广东顺峰药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105812', '01', '注射用盐酸吡硫醇', 'zsyysblc', '0.2g×4支', '支', .9, '冻干粉针', '北京四环科宝制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105813', '01', '茴拉西坦片', 'hlxtp', '100mg/片', '盒', .9, '片剂', '西安海欣制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105814', '01', '注射用盐酸甲氯芬酯', 'zsyysjlfz', '0.1g', '瓶', .9, '冻干粉针', '广东阳江制药厂有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105815', '01', '注射用盐酸甲氯芬酯', 'zsyysjlfz', '0.25g', '瓶', .9, '冻干粉针', '广东阳江制药厂有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105816', '01', '注射用盐酸甲氯芬酯', 'zsyysjlfz', '0.1g', '瓶', .9, '粉针剂', '北京紫竹药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105817', '01', '氨酪酸注射液', 'alszsy', '5ml:1g', '盒', .9, '注射剂', '湖南五洲通药业有限责任公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105818', '01', '注射用氨酪酸', 'zsyals', '1g', '支', .9, '粉针剂', '哈尔滨三联药业', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105819', '01', '注射用氨酪酸', 'zsyals', '0.5g', '瓶', .9, '冻干粉针', '广东阳江制药厂有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105820', '01', '注射用氨酪酸', 'zsyals', '1.0g', '瓶', .9, '冻干粉针', '广东阳江制药厂有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105821', '01', '注射用苯巴比妥钠', 'zsybbbtn', '0.1g', '瓶', 1, '注射剂', '福建省闽东力捷迅药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105822', '01', '佐匹克隆片', 'zpklp', '7.5mg×12', '盒', .9, '片剂', '齐鲁制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105823', '01', '甘油果糖注射液', 'gygtzsy', '250ml:25g', '瓶', 1, '注射剂', '广东彼迪药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105824', '01', '天麻素注射液', 'tmszsy', '0.2g:2ml', '支', .9, '注射液', '悦康药业集团有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105825', '01', '天麻素注射液', 'tmszsy', '2ml:0.2g', '支', .9, '注射剂', '西安博森生物制药有限责任公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105826', '01', '盐酸丁咯地尔注射剂', 'ysdkdezsj', '0.2g', '支', .9, '注射剂', '苏州二叶制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105827', '01', '胸腺肽注射液', 'xxtzsy', '2ml:10mg', '盒', .9, '注射剂', '武汉人福药业责任有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105828', '01', '注射用胸腺肽', 'zsyxxt', '20mg', '支', .9, '冻干粉针', '内蒙古白医制药股份有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105829', '01', '胸腺肽注射剂', 'xxtzsj', '5ml：50mg', '支', .9, '注射剂', '吉林玉皇药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105830', '01', '胸腺肽注射剂', 'xxtzsj', '10ml：80mg', '支', .9, '注射剂', '吉林玉皇药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105831', '01', '注射用头孢米诺钠', 'zsytbmnn', '1.0g（每盒一瓶，配套包装0.9%氟化钠注射液1', '盒', .9, '注射剂', '海南中化联合制药工业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105832', '01', '注射用头孢米诺', 'zsytbmn', '0.5g*1支/盒', '盒', .9, '注射剂', '苏州东瑞制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105833', '01', '注射用头孢米诺', 'zsytbmn', '1g*1支/盒', '盒', .9, '注射剂', '苏州东瑞制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105634', '01', '胸腺肽肠溶片', 'xxtcrp', '20mg×6片', '盒', .9, '片剂', '黑龙江江世药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105635', '01', '胸腺肽肠溶片', 'xxtcrp', '20mg×10片', '盒', .9, '片剂', '黑龙江江世药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105636', '01', '胎盘多肽注射液', 'tpdtzsy', '4ml', '支', .9, '注射液', '贵阳黔峰生物制品有限责任公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105637', '01', '兰索拉唑片', 'lslzp', '30mg*14片', '盒', .9, '肠溶片', '海南益尔药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105638', '01', '胰酶肠溶片', 'ymcrp', '0.3g*12片*2板', '盒', .9, '片剂', '山西.长治市三宝生化药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105639', '01', '阿托品注射液', 'atpzsy', '0.5mg', '盒', 1, '注射液', '天津金耀氨基酸有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105640', '01', '阿托品注射液', 'atpzsy', '5mg', '盒', 1, '注射液', '天津金耀氨基酸有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105641', '01', '硫酸阿托品注射剂', 'lsatpzsj', '0.5mg/1ml/10', '盒', 1, '注射剂', '天津药业集团有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105642', '01', '硫酸阿托品注射剂', 'lsatpzsj', '1mg/1ml/10', '盒', 1, '注射剂', '天津药业集团新郑股份有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105643', '01', '硫酸阿托品注射液', 'lsatpzsy', '1ml×0.5g×10支', '盒', 1, '注射液', '天津药业集团新郑股份有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105644', '01', '氢溴酸山莨菪碱(654-2）注射剂', 'qxssldj(654-2z', '10mg/1ml/10', '盒', 1, '注射剂', '郑州卓峰制药厂', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105645', '01', '氢溴酸山莨菪碱注射液', 'qxssldjzsy', '10mg*1ml', '盒', 1, '注射液', '泗水希尔康制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105646', '01', '山莨菪碱注射液', 'sldjzsy', '1ml*10支*10mg', '盒', 1, '注射剂', '希尔康制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105647', '01', '盐酸消旋莨菪碱', 'ysxxldj', '10mg:1ml', '盒', 1, '注射液', '郑州卓峰制药厂', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105648', '01', '盐酸消旋山莨菪碱', 'ysxxsldj', '10mg×10', '盒', 1, '注射液', '郑州卓峰制药厂', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105649', '01', '盐酸消旋山莨菪碱注射液', 'ysxxsldjzsy', '1ml×10mg×10支', '盒', 1, '注射剂', '徐州莱恩药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105650', '01', '注射用丁溴东莨菪碱', 'zsydxdldj', null, '瓶', .9, '注射剂', '海南双成药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105651', '01', '盐酸甲氧氯普胺注射剂', 'ysjylpazsj', '10mg/1ml/10', '盒', 1, '注射剂', '昆明市宇斯药业有限责任公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105652', '01', '盐酸甲氧氯普胺注射剂', 'ysjylpazsj', '10mg/1ml', '支', 1, '注射剂', '大同长兴制药', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105653', '01', '盐酸甲氧氯普胺注射剂', 'ysjylpazsj', '10mg 10支* 1ml', '瓶', 1, '针剂', '天津药业集团新郑股份有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105654', '01', '盐酸甲氧氯普胺注射剂', 'ysjylpazsj', '1ml×10', '盒', 1, '注射液', '郑州羚锐制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105655', '01', '昂丹司琼注射液', 'adsqzsy', '4mg:2ml', '支', .9, '注射液', '西南药业股份有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105656', '01', '盐酸昂丹司琼注射液', 'ysadsqzsy', '4mg*2ml*6支', '支', .9, '注射剂', '齐鲁制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105657', '01', '昂丹司琼注射液', 'adsqzsy', '8mg*4ml', '盒', .9, '注射液', '西南合成制药股份有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105658', '01', '昂丹司琼注射液', 'adsqzsy', '4mg:2ml', '支', .9, '注射液', '山东齐鲁制药', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105659', '01', '注射用盐酸格拉司琼', 'zsyysglsq', '3mg', '盒', .9, '冻干粉', '河南省中泰药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105660', '01', '格拉司琼氯化钠注射液', 'glsqlhnzsy', '100ml:3mg', '瓶', .9, '注射剂', '沈阳北方制药厂', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105661', '01', '盐酸阿扎司琼氯化钠注射液', 'ysazsqlhnzsy', '50ml:10mg', '瓶', .9, '注射剂', '山东鲁抗辰欣药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105662', '01', '盐酸氨溴索葡萄糖注射液', 'ysaxspttzsy', '100ml:30mg', '瓶', .9, '注射液', '河南帅克制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105663', '01', '注射用盐酸氨溴索', 'zsyysaxs', '15mg', '支', .9, '冻干粉针剂', '山东罗欣药业', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105664', '01', '注射用盐酸氨溴索', 'zsyysaxs', '15mg', '瓶', .9, '冻干粉针剂', '南京长澳制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105665', '01', '加替沙星氯化钠注射液', 'jtsxlhnzsy', '100ml:0.2g', '瓶', .9, '注射剂', '江苏正大丰海制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105666', '01', '加替沙星注射剂', 'jtsxzsj', '0.2g:100ml', '瓶', .9, '注射剂', '北京双鹤药业股份有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105667', '01', '门冬氨酸洛美沙星注射液', 'mdaslmsxzsy', '10ml:0.2g', '支', .9, '注射剂', '长春大政国际经贸（集团制药有限责任公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105668', '01', '整蛋白型肠内营养剂', 'zdbxcnyyj', '40g*6袋', '袋', .9, '干混悬剂', '上海宝龙药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105669', '01', '整蛋白型肠内营养剂', 'zdbxcnyyj', '40g', '袋', .9, '混悬剂', '上海世康特制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105670', '01', '整蛋白型肠内营养剂', 'zdbxcnyyj', '80g', '袋', .9, '混悬剂', '上海世康特制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105671', '01', '整蛋白型肠内营养剂', 'zdbxcnyyj', '30ml', '瓶', .9, '口服液体剂', '广西广明药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105672', '01', '维生素C片', 'wsscp', '100mg*100片', '瓶', .9, '片剂', '山西临汾奇林药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105673', '01', '安乃近片', 'anjp', '0.25g', '瓶', .9, '片剂', '云南南诏药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105674', '01', '安乃近片', 'anjp', '0.5g', '瓶', .9, '片剂', '云南南诏药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105675', '01', '骨肽注射液', 'gtzsy', '10ml:50mg', '支', .9, '注射液', '诺氏制药（吉林有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105676', '01', '骨肽注射液', 'gtzsy', '20ml:100mg', '支', .9, '注射液', '诺氏制药（吉林有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105677', '01', '骨肽注射液', 'gtzsy', '2ml', '支', .9, '注射剂', '长春天诚药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105678', '01', '骨肽注射液', 'gtzsy', '10ml:50mg', '支', .9, '注射液', '诺氏制药（吉林有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105679', '01', '骨肽注射液', 'gtzsy', '10ml:50mg', '支', .9, '注射剂', '哈高科白天鹅药业集团有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105680', '01', '骨肽注射液', 'gtzsy', '2ml:10mg', '瓶', .9, '注射剂', '南京新百药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105681', '01', '骨肽氯化钠注射液', 'gtlhnzsy', '100ML:0.1G多肽与氯化钠0.87G', '瓶', .9, '注射液', '哈尔滨三联药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105682', '01', '骨肽注射液', 'gtzsy', '2ml:10mg', '支', .9, '注射剂', '云南南诏药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105683', '01', '柳酚咖敏片', 'lfkmp', '6片/盒', '盒', .9, '片剂', '香港乐信药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105684', '01', '氨咖黄敏胶囊', 'akhmjn', '复方', '盒', .9, '胶囊剂', '云南南诏药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105685', '01', '洛索洛芬片', 'lslfp', '60mg*10S', '盒', .9, '片剂', '兴安药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105686', '02', '苦胆草片', 'kdcp', '16×1', '包', .9, '片剂', '云南滇中药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105687', '01', '人血白蛋白', 'rxbdb', '10g:50ml', '瓶', .9, '注射液', '广东卫伦制药', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105688', '01', '缩宫素注射剂', 'sgszsj', '10u:1ml', '盒', 1, '注射液', '上海一生化药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105689', '01', '双唑泰栓', 'szts', '7枚', '盒', .9, '栓剂', '锦州九泰药业', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105690', '01', '碘[131I]化钠胶囊', 'd[131i]hnjn', null, null, 1, '胶囊', '中核高通同位素股份有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105691', '01', '锝[99mTc]甲氧异腈', 'd[99mtc]jyyj', null, null, .9, '注射剂', '中核高通同位素股份有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105692', '01', '锝[99mTc]亚甲基二膦酸盐', 'd[99mtc]yjjels', null, null, .9, '注射剂', '中核高通同位素股份有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105693', '01', '碘[125I]种籽', 'd[125i]zz', null, null, .9, '种子源', '北京原博公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105694', '01', '钐[153Sm]来昔决南', 's[153sm]lxjn', null, null, .9, '注射液', '中核高通同位素股份有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105695', '01', '锶[89Sr]二氯化锶', 's[89sr]elhs', null, null, .9, '注射剂', '中核高通同位素股份有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105696', '01', '硫代硫酸钠', 'ldlsn', '0.64g', '瓶', 1, '粉针剂溶酶结晶', '上海新亚药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105697', '01', '碘解磷定注射液', 'djldzsy', '0.5g5*20ml', '盒', 1, '注射液', '开封制药集团', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105698', '01', '盐酸纳络酮注射液', 'ysnltzsy', '0.4mg*10ml', '盒', 1, '注射液', '益侨(湖南)制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105699', '02', '排石颗粒', 'pskl', '20g×10袋', '盒', .9, '颗粒剂', '广东益和堂制药有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105700', '02', '小金丸', 'xjw', '0.6g×4瓶', '盒', .9, '丸剂', '四川康定金珠制药有限责任公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105701', '02', '复方苦参注射液', 'ffkczsy', '5ml', '盒', .9, '注射液', '山西金晶药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105702', '02', '蟾酥注射液', 'cszsy', '10ml', '支', .9, '注射液', '重庆莱美药业有限公司', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
commit;
prompt 200 records loaded
prompt Loading EA_DEMO_UPLOAD...
prompt Table is empty
prompt Enabling triggers for EACODE...
alter table EACODE enable all triggers;
prompt Enabling triggers for EADEPT...
alter table EADEPT enable all triggers;
prompt Enabling triggers for EAEVENT...
alter table EAEVENT enable all triggers;
prompt Enabling triggers for EAEXCEPTION...
alter table EAEXCEPTION enable all triggers;
prompt Enabling triggers for EAHELP...
alter table EAHELP enable all triggers;
prompt Enabling triggers for EAHTTPSESSION...
alter table EAHTTPSESSION enable all triggers;
prompt Enabling triggers for EAICON...
alter table EAICON enable all triggers;
prompt Enabling triggers for EAJDBCMONITOR...
alter table EAJDBCMONITOR enable all triggers;
prompt Enabling triggers for EAMENU...
alter table EAMENU enable all triggers;
prompt Enabling triggers for EAMENUPART...
alter table EAMENUPART enable all triggers;
prompt Enabling triggers for EAPARAM...
alter table EAPARAM enable all triggers;
prompt Enabling triggers for EAROLE...
alter table EAROLE enable all triggers;
prompt Enabling triggers for EAROLEAUTHORIZE...
alter table EAROLEAUTHORIZE enable all triggers;
prompt Enabling triggers for EAROLEMENUPART...
alter table EAROLEMENUPART enable all triggers;
prompt Enabling triggers for EASEQUENCE...
alter table EASEQUENCE enable all triggers;
prompt Enabling triggers for EAUSER...
alter table EAUSER enable all triggers;
prompt Enabling triggers for EAUSERAUTHORIZE...
alter table EAUSERAUTHORIZE enable all triggers;
prompt Enabling triggers for EAUSERMENUMAP...
alter table EAUSERMENUMAP enable all triggers;
prompt Enabling triggers for EAUSERMENUPART...
alter table EAUSERMENUPART enable all triggers;
prompt Enabling triggers for EAUSERSUBINFO...
alter table EAUSERSUBINFO enable all triggers;
prompt Enabling triggers for EA_DEMO_BYJSB...
alter table EA_DEMO_BYJSB enable all triggers;
prompt Enabling triggers for EA_DEMO_BYMXB...
alter table EA_DEMO_BYMXB enable all triggers;
prompt Enabling triggers for EA_DEMO_CHINAAREA...
alter table EA_DEMO_CHINAAREA enable all triggers;
prompt Enabling triggers for EA_DEMO_FCF...
alter table EA_DEMO_FCF enable all triggers;
prompt Enabling triggers for EA_DEMO_SFXM...
alter table EA_DEMO_SFXM enable all triggers;
prompt Enabling triggers for EA_DEMO_UPLOAD...
alter table EA_DEMO_UPLOAD enable all triggers;
set feedback on
set define on
prompt Done.

-- Create sequence 
create sequence G4_SEQ_EAJDBCMONITOR_MONITORID
minvalue 1
maxvalue 9999999999
start with 5381
increment by 1
nocache;
--
create or replace trigger "G4_TRIGGER_EAJDBCMONITOR"
before insert on EAJDBCMONITOR
for each row
begin
select G4_SEQ_EAJDBCMONITOR_MONITORID.nextval into :new.monitorid from dual;
end ;
/

create or replace procedure g4_prc_cursor_demo(prm_Xm       IN VARCHAR2,
                                               prm_Cur      OUT sys_refcursor,
                                               prm_AppCode  OUT VARCHAR2,
                                               prm_ErrorMsg OUT VARCHAR2) is
begin
  prm_AppCode := 1;
  open prm_Cur for
    select xm, fyze from ea_demo_byjsb where xm like '%' || prm_Xm || '%';
EXCEPTION
  WHEN OTHERS THEN
    prm_AppCode  := -1;
    prm_ErrorMsg := '出错：' || SQLERRM;
end g4_prc_cursor_demo;

/

create or replace procedure g4_prc_demo(prm_myname   IN VARCHAR2,
                                        prm_number1  IN NUMBER,
                                        prm_number2  IN NUMBER,
                                        prm_sum      OUT NUMBER,
                                        prm_result   OUT VARCHAR2,
                                        prm_AppCode  OUT VARCHAR2,
                                        prm_ErrorMsg OUT VARCHAR2) is
begin
  prm_sum      := prm_number1 + prm_number2;
  prm_result   := 'hello, ' || prm_myname || '!';
  prm_AppCode  := 1;
  prm_ErrorMsg := '';
end g4_prc_demo;
/
