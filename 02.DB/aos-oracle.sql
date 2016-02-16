/*
Navicat Oracle Data Transfer
Oracle Client Version : 11.2.0.4.0

Source Server         : oracle-local-aos
Source Server Version : 100200
Source Host           : 127.0.0.1:1521
Source Schema         : AOS

Target Server Type    : ORACLE
Target Server Version : 100200
File Encoding         : 65001

Date: 2016-02-16 18:28:23
*/


-- ----------------------------
-- Table structure for AOS_LOG_SESSION
-- ----------------------------
DROP TABLE "AOS_LOG_SESSION";
CREATE TABLE "AOS_LOG_SESSION" (
"ID_" VARCHAR2(64 BYTE) NOT NULL ,
"USER_ID_" VARCHAR2(64 BYTE) NOT NULL ,
"ACCOUNT_" VARCHAR2(255 BYTE) NOT NULL ,
"USER_NAME_" VARCHAR2(255 BYTE) NOT NULL ,
"IP_ADDRESS_" VARCHAR2(255 BYTE) NULL ,
"CLIENT_TYPE_" VARCHAR2(255 BYTE) NULL ,
"OWNER_" VARCHAR2(255 BYTE) NULL ,
"CREATE_TIME_" DATE NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "AOS_LOG_SESSION" IS '会话日志记录表';
COMMENT ON COLUMN "AOS_LOG_SESSION"."ID_" IS '会话ID';
COMMENT ON COLUMN "AOS_LOG_SESSION"."USER_ID_" IS '用户ID';
COMMENT ON COLUMN "AOS_LOG_SESSION"."ACCOUNT_" IS '登录帐户';
COMMENT ON COLUMN "AOS_LOG_SESSION"."USER_NAME_" IS '用户姓名';
COMMENT ON COLUMN "AOS_LOG_SESSION"."IP_ADDRESS_" IS '客户端IP地址';
COMMENT ON COLUMN "AOS_LOG_SESSION"."CLIENT_TYPE_" IS '客户端类型';
COMMENT ON COLUMN "AOS_LOG_SESSION"."OWNER_" IS '宿主';

-- ----------------------------
-- Records of AOS_LOG_SESSION
-- ----------------------------
INSERT INTO "AOS_LOG_SESSION" VALUES ('37yzw6ztakzh1mc4rtxyv1mv8', 'fa04db9dd2f54d61b0c8202a25de2dc6', 'root', '超级用户', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36', 'XChun-PC:1690', TO_DATE('2016-02-16 00:31:30', 'YYYY-MM-DD HH24:MI:SS'));

-- ----------------------------
-- Table structure for AOS_SYS_CATALOG
-- ----------------------------
DROP TABLE "AOS_SYS_CATALOG";
CREATE TABLE "AOS_SYS_CATALOG" (
"ID_" VARCHAR2(64 BYTE) NOT NULL ,
"CASCADE_ID_" VARCHAR2(255 BYTE) NOT NULL ,
"ROOT_KEY_" VARCHAR2(255 BYTE) NOT NULL ,
"ROOT_NAME_" VARCHAR2(255 BYTE) NOT NULL ,
"NAME_" VARCHAR2(255 BYTE) NOT NULL ,
"HOTKEY_" VARCHAR2(255 BYTE) NULL ,
"PARENT_ID_" VARCHAR2(64 BYTE) NOT NULL ,
"IS_LEAF_" VARCHAR2(255 BYTE) DEFAULT 1  NOT NULL ,
"IS_AUTO_EXPAND_" VARCHAR2(255 BYTE) DEFAULT 0  NOT NULL ,
"ICON_NAME_" VARCHAR2(255 BYTE) NULL ,
"SORT_NO_" NUMBER(10) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "AOS_SYS_CATALOG" IS '分类表';
COMMENT ON COLUMN "AOS_SYS_CATALOG"."ID_" IS '流水号';
COMMENT ON COLUMN "AOS_SYS_CATALOG"."CASCADE_ID_" IS '节点语义ID';
COMMENT ON COLUMN "AOS_SYS_CATALOG"."ROOT_KEY_" IS '科目标识键';
COMMENT ON COLUMN "AOS_SYS_CATALOG"."ROOT_NAME_" IS '科目名称';
COMMENT ON COLUMN "AOS_SYS_CATALOG"."NAME_" IS '分类名称';
COMMENT ON COLUMN "AOS_SYS_CATALOG"."HOTKEY_" IS '热键';
COMMENT ON COLUMN "AOS_SYS_CATALOG"."PARENT_ID_" IS '父节点流水号';
COMMENT ON COLUMN "AOS_SYS_CATALOG"."IS_LEAF_" IS '是否叶子节点';
COMMENT ON COLUMN "AOS_SYS_CATALOG"."IS_AUTO_EXPAND_" IS '是否自动展开';
COMMENT ON COLUMN "AOS_SYS_CATALOG"."ICON_NAME_" IS '图标文件名称';
COMMENT ON COLUMN "AOS_SYS_CATALOG"."SORT_NO_" IS '排序号';

-- ----------------------------
-- Records of AOS_SYS_CATALOG
-- ----------------------------
INSERT INTO "AOS_SYS_CATALOG" VALUES ('38368661c53c40b6824869a0ccffad05', '0.002.001.001', 'DIC_TYPE', '词典分类科目', '工作流', null, '4018a2217b0542059a26ecf3f605d60f', '1', '0', 'folder6.png', '1');
INSERT INTO "AOS_SYS_CATALOG" VALUES ('4018a2217b0542059a26ecf3f605d60f', '0.002.001', 'DIC_TYPE', '词典分类科目', '系统管理', null, '21d03054afdf43d69972cf6f7db6cfa3', '0', '1', 'folder22.png', '2');
INSERT INTO "AOS_SYS_CATALOG" VALUES ('4018f65de18043c899b5e21ce7328df7', '0.001.002', 'PARAM_TYPE', '参数分类科目', '系统参数', null, 'cd14928a239b448b867c2e45246cd038', '0', '1', 'folder22.png', '1');
INSERT INTO "AOS_SYS_CATALOG" VALUES ('4ee1d6e48b31487b849a72cd03d2512a', '0.001.001', 'PARAM_TYPE', '参数分类科目', '业务参数', null, 'cd14928a239b448b867c2e45246cd038', '1', '0', 'user20.png', '2');
INSERT INTO "AOS_SYS_CATALOG" VALUES ('6f94ef4ac17d4d098f91f0a4579f8591', '0.001.002.001', 'PARAM_TYPE', '参数分类科目', '验证码', null, '4018f65de18043c899b5e21ce7328df7', '1', '0', 'ok3.png', '2');
INSERT INTO "AOS_SYS_CATALOG" VALUES ('8d6c9869e8b2427cb16cf3f4777bf236', '0.002.007', 'DIC_TYPE', '词典分类科目', '范例', null, '21d03054afdf43d69972cf6f7db6cfa3', '1', '0', 'folder11.png', '10');
INSERT INTO "AOS_SYS_CATALOG" VALUES ('a072411787f545edb7e7c3c23fa6c0ff', '0.001.002.004', 'PARAM_TYPE', '参数分类科目', '导航与菜单', null, '4018f65de18043c899b5e21ce7328df7', '1', '0', 'icon152.png', '3');
INSERT INTO "AOS_SYS_CATALOG" VALUES ('aa3082ab67e24d8b884bc4504d3d9945', '0.002.002', 'DIC_TYPE', '词典分类科目', '全局通用', null, '21d03054afdf43d69972cf6f7db6cfa3', '1', '0', 'folder24.png', '3');
INSERT INTO "AOS_SYS_CATALOG" VALUES ('c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', 'DIC_TYPE', '词典分类科目', '平台配置', null, '21d03054afdf43d69972cf6f7db6cfa3', '1', '0', 'folder2.png', '1');
INSERT INTO "AOS_SYS_CATALOG" VALUES ('cd14928a239b448b867c2e45246cd038', '0.001', 'PARAM_TYPE', '参数分类科目', '参数分类', null, '0', '0', '0', 'book.png', '1');
INSERT INTO "AOS_SYS_CATALOG" VALUES ('f22f39171b484d81a604d3eb50b33584', '0.001.002.002', 'PARAM_TYPE', '参数分类科目', '界面显示', null, '4018f65de18043c899b5e21ce7328df7', '1', '0', 'icon59.png', '1');
INSERT INTO "AOS_SYS_CATALOG" VALUES ('01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', 'PARAM_TYPE', '参数分类科目', '其它', null, '4018f65de18043c899b5e21ce7328df7', '1', '0', 'icon150.png', '9');
INSERT INTO "AOS_SYS_CATALOG" VALUES ('21d03054afdf43d69972cf6f7db6cfa3', '0.002', 'DIC_TYPE', '词典分类科目', '数据字典分类', null, '0', '0', '0', 'book.png', '2');

-- ----------------------------
-- Table structure for AOS_SYS_DIC
-- ----------------------------
DROP TABLE "AOS_SYS_DIC";
CREATE TABLE "AOS_SYS_DIC" (
"ID_" VARCHAR2(64 BYTE) NOT NULL ,
"CODE_" VARCHAR2(255 BYTE) NOT NULL ,
"DESC_" VARCHAR2(255 BYTE) NOT NULL ,
"HOTKEY_" VARCHAR2(255 BYTE) NULL ,
"STATUS_" VARCHAR2(255 BYTE) DEFAULT 1  NOT NULL ,
"DIC_INDEX_ID_" VARCHAR2(64 BYTE) NOT NULL ,
"REMARK_" VARCHAR2(4000 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "AOS_SYS_DIC" IS '数据字典明细表';
COMMENT ON COLUMN "AOS_SYS_DIC"."ID_" IS '流水号';
COMMENT ON COLUMN "AOS_SYS_DIC"."CODE_" IS '字典对照码';
COMMENT ON COLUMN "AOS_SYS_DIC"."DESC_" IS '字典对照值';
COMMENT ON COLUMN "AOS_SYS_DIC"."HOTKEY_" IS ' 热键';
COMMENT ON COLUMN "AOS_SYS_DIC"."STATUS_" IS '当前状态';
COMMENT ON COLUMN "AOS_SYS_DIC"."DIC_INDEX_ID_" IS '所属字典流水号';
COMMENT ON COLUMN "AOS_SYS_DIC"."REMARK_" IS '备注';

-- ----------------------------
-- Records of AOS_SYS_DIC
-- ----------------------------
INSERT INTO "AOS_SYS_DIC" VALUES ('045e7dce267b4ef3b098ca00030220bf', '2', '金卡', null, '1', '2724924f1cdd48d1aa1a84cb7dd9b3ee', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('074c63e541174ed0b7c71588936ae453', '1', '平铺', null, '1', 'ffc94f2b7ad14c78b14c46f8fab17543', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('075a268cd7e14a728ca841e769b9d5a6', '1', '缺省', null, '1', '79004d064e954e55b832a8a9a4332576', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('0825b66058c14bc5bfacdba1fd055af4', '2', '浮动菜单', null, '1', 'a9fd5aa3b7654326902a94e70bccedd8', '欢迎页显示的Mac风格的浮动菜单');
INSERT INTO "AOS_SYS_DIC" VALUES ('0ccc4a6e3df246d8bbd3ccb1d29eb4c4', '0', '停用', null, '1', '10a113b1dd6d492dad27c8b0a0fb7efc', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('0ee3e8b931374725b213150b021507cc', 'catalog', 'aos', null, '1', '2d977e97aacf4781836bac9f5e88ad2b', '数据库名/实例名');
INSERT INTO "AOS_SYS_DIC" VALUES ('15f728ef5143444f9bfafa1c5c8a6a3b', '3', '隐藏', null, '1', '2794338c8b4946b99c361dae80da71b1', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('1722aa532c4044ac8087579feac85f7f', 'neptune', 'neptune.png', null, '1', 'e9e9cfc195514b05890a2249b81dfe73', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('17b249a462e7409baa99f36057fa79e7', '1', '是', null, '1', '91bc8a695b744b27ba66a94561fd6dbc', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('1915d507f36d4ae688267ebca838d39f', 'blue', '#3399FF', null, '1', '61fd319a23b04bd1bdbce7037002976a', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('1bb70ce5d6e649fd9179f3a3d35367f9', 'blue', 'left-logo.png', null, '1', 'fa8097dd670643f9a03722c4074ecba5', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('1c2ebffd1b48420999ff57e2ec325270', '3', '未知', null, '1', 'f59d8693d8cf4f10850914e09ae9b93c', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('1deee1b367ae4ccb81226a86eb7d9675', '1', '普卡', null, '1', '2724924f1cdd48d1aa1a84cb7dd9b3ee', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('1fb134407f364baf8b857235c7828059', '2', '停用', null, '1', '0744eedeaaa143afa499254866aa75c9', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('226489afb7ab4cf69107a78c60ed2267', 'PENDING', '代理中', null, '1', 'c66f06c069224241a4785e77d1406f9c', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('23910ad1f9684644b214ff99209e94d4', '3', '关联页面', null, '1', '38841cd4f85f4ffb8c07c74650a130dc', '主页面上跳转出去的页面');
INSERT INTO "AOS_SYS_DIC" VALUES ('23a410439cf7459799c286745b123293', '1', '激活', null, '1', '2c90ab6212f44b08a1d8ed527c72795f', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('24bca6d79bb14b5f97fbddbe5219705b', '1', '按钮|菜单下拉项', null, '1', '7d048854ccdc4eab996dcb703722065b', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('27689b76c3cf4168a7efb737806e9ed7', '2', '已结束', null, '1', 'a06eb2af650444db903c945030334b12', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('29462076b88f4facb86f7647c04119d0', '2', '子页面', null, '1', '38841cd4f85f4ffb8c07c74650a130dc', '在主页面上的子导航打开的页面(内嵌式的)');
INSERT INTO "AOS_SYS_DIC" VALUES ('2a5d03f79fd64c2090c9847d1b1484f0', '3', '待签收', null, '1', '48062fd856f14794b03ceba2a1d6b60e', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('2bd5fc7756d74fe59f5b9372fd83d03c', '4', '分割符', null, '1', '38841cd4f85f4ffb8c07c74650a130dc', '子页面生成的二级导航菜单的分割符标识');
INSERT INTO "AOS_SYS_DIC" VALUES ('2ce972620b1d484e880ae17113f4cf05', 'tight', '组合按钮', null, '1', 'a19ac2af964c4a6e8af9c6f1c0d2673f', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('2e2ef7ebcd5449a1a1b593f63ddb17ba', '3', '管理员封锁', null, '1', '0744eedeaaa143afa499254866aa75c9', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('2ef4d36610334dc6bc9bd153be594da2', '3', 'DBSequence', null, '1', '2a9ac1749d224bef924cd258bf35254a', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('2f9994a32b3e4afd96420c180155065a', '3', '矢量图标', null, '1', '21136c3dc660464d92fccd66408e149b', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('3058d4cd6c514d23a27eee77b140a349', 'aos', 'left-logo.png', null, '1', 'fa8097dd670643f9a03722c4074ecba5', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('338541a1b2094ea5a0e51ce81f9012de', 'port', '3306', null, '1', '2d977e97aacf4781836bac9f5e88ad2b', '数据库主机端口');
INSERT INTO "AOS_SYS_DIC" VALUES ('37a243f7cb96413386c3ea781051244e', '3', '工作组', null, '1', '58b28eade8604dffa7c531b7b42af2fa', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('37d2d28ac8104f6481997b640c5d4fd0', '4', '其它', null, '1', '58b28eade8604dffa7c531b7b42af2fa', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('3a4466b864744a0da3b93eec3f24dfff', 'blue', '天蓝', null, '1', '3ba3a682c2ac4d52982411dd045fae32', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('3c56f07c48b746698591068c308064a7', 'gray', '银灰', null, '1', '3ba3a682c2ac4d52982411dd045fae32', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('3f1b50a0f5be46a69597fca95c1e82d7', '2', '大图标[64X64]', null, '1', '21136c3dc660464d92fccd66408e149b', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('4113d10127a34b4fa88b2d6b118accf0', '0', '否', null, '1', '91bc8a695b744b27ba66a94561fd6dbc', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('462d4322dd6c408c8d2dfa1241c209f6', '2', '挂起', null, '1', '2c90ab6212f44b08a1d8ed527c72795f', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('4ae7b6f7d54a4236ba9b18a9e05d7fb4', '4', '容器组件(窗口|面板|树|表格|工具栏等)', null, '1', '7d048854ccdc4eab996dcb703722065b', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('4af1d58e374149f38c5ae9f76674a79f', 'aos', '#FAFAFA', null, '1', '61fd319a23b04bd1bdbce7037002976a', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('4c5816e8db1c4f0995fbeb7a1b840685', '1', '主页面', null, '1', '38841cd4f85f4ffb8c07c74650a130dc', '点击主导航菜单打开的页面');
INSERT INTO "AOS_SYS_DIC" VALUES ('569b3bab75734c628a9bb0b3fbcd8922', '2', '显示', null, '1', '2794338c8b4946b99c361dae80da71b1', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('58195ff7a3084df2a2dd5b401aa29a77', '0', '系统导航', null, '1', '4c2a12d3890a449fa91521a29a3c2436', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('58fc07abcfdc46478ad14fb9d95214f6', 'dataBaseType', 'mysql', null, '1', '2d977e97aacf4781836bac9f5e88ad2b', '可选值：mysql、oracle、microsoft sql server、postgresql。');
INSERT INTO "AOS_SYS_DIC" VALUES ('5a53887315f7450e96816c1a46dc5b5e', '2', '项目组', null, '1', '58b28eade8604dffa7c531b7b42af2fa', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('5c4196e15f47466ea19137666e455504', 'neptune', 'left-logo.png', null, '1', 'fa8097dd670643f9a03722c4074ecba5', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('5dd1c5a1610544b490af86cc826e3663', '2', '表格列', null, '1', '7d048854ccdc4eab996dcb703722065b', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('5de14be720b546ebb9676db86cdc5f6c', '2', '女', null, '1', 'f59d8693d8cf4f10850914e09ae9b93c', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('5dfc1a71df524cd68311a95e7176cab7', 'gray', '#BCB0B0', null, '1', '1ec5d3c945de40469595c85955196e76', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('6a05b8c8ce244c3f9b4872f812c689ec', '1', '经办权限', null, '1', 'dd9f74d16be14db5b0f6d79720c8f177', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('6c575847953847ceb7d4675e94d78547', 'aos', '#99bce8', null, '1', '1ec5d3c945de40469595c85955196e76', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('6e018ced3ae046de93d74630a97361a1', 'aos', '#006699', null, '1', '54e48c66b3ef4d99823ca8217a2abf43', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('735edf2e8a1242078141405d344d3c84', '1', '未授权', null, '1', '2794338c8b4946b99c361dae80da71b1', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('786d09295c904608868807b9e08238ee', 'neptune', '#c0c0c0', null, '1', '1ec5d3c945de40469595c85955196e76', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('7b6226ba4b6b404bab3cc520d5c1e6b5', 'neptune', '海王星(水蓝)', null, '1', '3ba3a682c2ac4d52982411dd045fae32', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('84552cfdf36f4fee92d81a49340495ca', 'blue', '#DFE8F6', null, '1', '3146aefcb39344cebe6e0a9baa7a4a48', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('84ee7e35ab134ec1acd2cfd28d3915f6', 'standalone', '独立按钮', null, '1', 'a19ac2af964c4a6e8af9c6f1c0d2673f', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('85f5017c1860434eacfceb519b8ad8cd', 'blue', 'blue.png', null, '1', 'e9e9cfc195514b05890a2249b81dfe73', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('867c0aacba654feea60c22c5e4be9368', 'aos', 'red', null, '1', '3146aefcb39344cebe6e0a9baa7a4a48', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('871d7ac8ec704614a15d29f540b8b439', 'true', '显示', null, '1', '33a73af4b729448b91c13acf4d0a31e1', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('87923302cb424da9aa55b6a9ce77090b', '7', '激活', null, '1', '2794338c8b4946b99c361dae80da71b1', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('89f8ab9369a64de09a8207829f520297', 'gray', 'gray.png', null, '1', 'e9e9cfc195514b05890a2249b81dfe73', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('8b536d0c9a2e4e80b1edf91190b98253', '5', '编辑', null, '1', '2794338c8b4946b99c361dae80da71b1', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('8da661446e6d4e9cb49d2eb5ab225cd0', '2', '树状', null, '1', 'ffc94f2b7ad14c78b14c46f8fab17543', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('8e42e7df7bd044b89c7a5d5b59b44b18', '1', '男', null, '1', 'f59d8693d8cf4f10850914e09ae9b93c', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('92dfd82860a0474da735575e9b91f6de', 'classic', '经典主题', null, '1', 'a44dd9bbf55041368882e88821309355', '上Banner-左导航-中经办。');
INSERT INTO "AOS_SYS_DIC" VALUES ('958235d21e2f4d44babd8ae7da7dd7f8', '99', '撤消授权', null, '1', '2794338c8b4946b99c361dae80da71b1', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('99419e3ea3d64507aa507854fd210a75', '3', '表单元素(输入框|下拉框|选择框等)', null, '1', '7d048854ccdc4eab996dcb703722065b', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('9d1c5da19d0b4ad9b97b570ed4481bf2', 'false', '隐藏', null, '1', '33a73af4b729448b91c13acf4d0a31e1', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('9eb462a5fd0547b9898540b6e5a4ca98', 'gray', 'left-logo.png', null, '1', 'fa8097dd670643f9a03722c4074ecba5', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('a603159d47b94145a32b51f659b47c09', '4', '系统封锁', null, '1', '0744eedeaaa143afa499254866aa75c9', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('a63ab46c45b048b1a0d727c5f0d69f58', '3', '导入离线文件', null, '1', '483fb2ff35e84a42974e914851fae01a', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('a871329cbeb343bea48a467e05e066f5', '2', '在线克隆', null, '1', '483fb2ff35e84a42974e914851fae01a', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('a97934b734a94d70a71353bc78e572df', 'neptune', '#FAFAFA', null, '1', '61fd319a23b04bd1bdbce7037002976a', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('a9bef6122ad7444999ce17b4ad5a0628', '2', '发现', null, '1', '4c2a12d3890a449fa91521a29a3c2436', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('ac8049fc0ded42b09a3654ef547ac772', '1', '小图标[16X16]', null, '1', '21136c3dc660464d92fccd66408e149b', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('b18435d1752a4a8c96628402298c0493', 'gray', '#555555', null, '1', '61fd319a23b04bd1bdbce7037002976a', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('b1d95ea28e084b64b0f6a473e65fe2fd', 'aos', 'AOS', null, '0', '3ba3a682c2ac4d52982411dd045fae32', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('b5bdcaeeccd44ad9aceae1968fbe0851', 'userName', 'root', null, '1', '2d977e97aacf4781836bac9f5e88ad2b', '数据库用户名');
INSERT INTO "AOS_SYS_DIC" VALUES ('b85f79702d094f348e1c9e79e67d95b7', '1', '待办', null, '1', '48062fd856f14794b03ceba2a1d6b60e', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('ba5b0493f0544278a980e0f268baf83c', '1', '快捷菜单', null, '1', '4c2a12d3890a449fa91521a29a3c2436', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('040e1d4d8a914145884553f170e1bcfd', '1', '缺省', null, '1', 'cfcbc48fd8ad42678a52334bac8aa299', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('040fbde5cca746e7a90a9f888c033897', '4', '只读', null, '1', '2794338c8b4946b99c361dae80da71b1', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('c172686bc21e40efacca63c5b7e1c9d3', 'blue', '#99bce8', null, '1', '1ec5d3c945de40469595c85955196e76', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('c1c92ade06b94969b2b066184845781c', '6', '禁用', null, '1', '2794338c8b4946b99c361dae80da71b1', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('c20e301598954f0ab33445680ca1db27', 'gray', '#F0F0F0', null, '1', '3146aefcb39344cebe6e0a9baa7a4a48', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('c38ebb4d102440babfde6f6f8fbf5d00', '2', '办结', null, '1', '48062fd856f14794b03ceba2a1d6b60e', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('c3e008a5ba864e21b5a66230e389926c', '1', '行政部门', null, '1', '58b28eade8604dffa7c531b7b42af2fa', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('cc53b6f6235f413db559f4a7e7ba88e6', '1', '运行中', null, '1', 'a06eb2af650444db903c945030334b12', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('cc8d6e844c3c46e0bfc973ef51dcb4a3', 'neptune', '#D0DDF2', null, '1', '3146aefcb39344cebe6e0a9baa7a4a48', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('cd08dff488454293bc8aa8224eb719cb', 'password', '111111', null, '1', '2d977e97aacf4781836bac9f5e88ad2b', '数据库用户密码');
INSERT INTO "AOS_SYS_DIC" VALUES ('cde729266d09465ca624939dc05e6b4d', '2', 'UUID', null, '1', '2a9ac1749d224bef924cd258bf35254a', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('ce49529f302f446d8e6e4576578ad459', '3', '注册用户', null, '1', '0475e71c145f49acbe781b2e7310ab64', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('d93b044fec9941cd87ec8260fab2c9b9', 'gray', '#888888', null, '1', '54e48c66b3ef4d99823ca8217a2abf43', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('e81beb66246441228ba1bb17190db222', '2', '管理权限', null, '1', 'dd9f74d16be14db5b0f6d79720c8f177', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('ebe726f2cfa2434dbb7f943f6f42c3ad', '2', '超级用户', null, '1', '0475e71c145f49acbe781b2e7310ab64', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('f08565c1fd7444bcb24645e52335a1e1', '1', '快捷菜单', null, '1', 'a9fd5aa3b7654326902a94e70bccedd8', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('f1f754ae30d54e2895c32050ff4c1d3d', 'aos', 'aos.png', null, '1', 'e9e9cfc195514b05890a2249b81dfe73', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('f4108659f1f8461db381c2808b82e038', '1', '启用', null, '1', '10a113b1dd6d492dad27c8b0a0fb7efc', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('f5d18126770d42a4a6b922c3b67ed161', '1', '在线设计', null, '1', '483fb2ff35e84a42974e914851fae01a', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('f624177f00ba4f15a60a8188856b5425', '1', 'APPID', null, '1', '2a9ac1749d224bef924cd258bf35254a', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('f7b6f63fc5de469aaf90986188037516', 'neptune', '#006699', null, '1', '54e48c66b3ef4d99823ca8217a2abf43', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('f97e6ea7f6fe4f6e8b7fde75f0074e2c', '1', '缺省', null, '1', '0475e71c145f49acbe781b2e7310ab64', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('fac86f6625cb47fc8c1a4bab41dc1af4', 'ip', '127.0.0.1', null, '1', '2d977e97aacf4781836bac9f5e88ad2b', '数据库主机IP');
INSERT INTO "AOS_SYS_DIC" VALUES ('fedcb0e622734060a19a3d9b98e96f71', '4', '导入离线文本', null, '1', '483fb2ff35e84a42974e914851fae01a', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('bbef93ea807847029e98ed7023b47c6a', '1', '正常', null, '1', '0744eedeaaa143afa499254866aa75c9', null);
INSERT INTO "AOS_SYS_DIC" VALUES ('bc17f4f03f0d415c97a026e8ec5a999d', 'blue', '#6699CC', null, '1', '54e48c66b3ef4d99823ca8217a2abf43', null);

-- ----------------------------
-- Table structure for AOS_SYS_DIC_INDEX
-- ----------------------------
DROP TABLE "AOS_SYS_DIC_INDEX";
CREATE TABLE "AOS_SYS_DIC_INDEX" (
"ID_" VARCHAR2(64 BYTE) NOT NULL ,
"KEY_" VARCHAR2(255 BYTE) NOT NULL ,
"NAME_" VARCHAR2(255 BYTE) NOT NULL ,
"HOTKEY_" VARCHAR2(255 BYTE) NULL ,
"CATALOG_ID_" VARCHAR2(64 BYTE) NOT NULL ,
"CATALOG_CASCADE_ID_" VARCHAR2(255 BYTE) NOT NULL ,
"REMARK_" VARCHAR2(4000 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "AOS_SYS_DIC_INDEX" IS '数据字典索引表';
COMMENT ON COLUMN "AOS_SYS_DIC_INDEX"."ID_" IS '流水号';
COMMENT ON COLUMN "AOS_SYS_DIC_INDEX"."KEY_" IS '字典标识';
COMMENT ON COLUMN "AOS_SYS_DIC_INDEX"."NAME_" IS '字典名称';
COMMENT ON COLUMN "AOS_SYS_DIC_INDEX"."HOTKEY_" IS '热键';
COMMENT ON COLUMN "AOS_SYS_DIC_INDEX"."CATALOG_ID_" IS '所属分类流水号';
COMMENT ON COLUMN "AOS_SYS_DIC_INDEX"."CATALOG_CASCADE_ID_" IS '所属分类流节点语义ID';
COMMENT ON COLUMN "AOS_SYS_DIC_INDEX"."REMARK_" IS '备注';

-- ----------------------------
-- Records of AOS_SYS_DIC_INDEX
-- ----------------------------
INSERT INTO "AOS_SYS_DIC_INDEX" VALUES ('10a113b1dd6d492dad27c8b0a0fb7efc', 'enabled_', '使能状态', null, 'aa3082ab67e24d8b884bc4504d3d9945', '0.002.002', null);
INSERT INTO "AOS_SYS_DIC_INDEX" VALUES ('1ec5d3c945de40469595c85955196e76', 'cmp_border_color_', '组件边框颜色', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
INSERT INTO "AOS_SYS_DIC_INDEX" VALUES ('21136c3dc660464d92fccd66408e149b', 'icon_type_', '图标类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
INSERT INTO "AOS_SYS_DIC_INDEX" VALUES ('2724924f1cdd48d1aa1a84cb7dd9b3ee', 'card_type_', '信用卡类型', null, '8d6c9869e8b2427cb16cf3f4777bf236', '0.002.007', null);
INSERT INTO "AOS_SYS_DIC_INDEX" VALUES ('2794338c8b4946b99c361dae80da71b1', 'cmp_grant_type_', '界面元素授权类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
INSERT INTO "AOS_SYS_DIC_INDEX" VALUES ('2a9ac1749d224bef924cd258bf35254a', 'sequence_type_', 'ID类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
INSERT INTO "AOS_SYS_DIC_INDEX" VALUES ('2c90ab6212f44b08a1d8ed527c72795f', 'procdef_suspension_state_', '流程定义活动状态', null, '38368661c53c40b6824869a0ccffad05', '0.002.001.001', null);
INSERT INTO "AOS_SYS_DIC_INDEX" VALUES ('2d977e97aacf4781836bac9f5e88ad2b', 'webide_jdbc', 'WebIDE模块使用的JDBC连接', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', 'WebIDE模块使用的JDBC连接。');
INSERT INTO "AOS_SYS_DIC_INDEX" VALUES ('3146aefcb39344cebe6e0a9baa7a4a48', 'south_back_color_', '主页面south区域背景颜色', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
INSERT INTO "AOS_SYS_DIC_INDEX" VALUES ('33a73af4b729448b91c13acf4d0a31e1', 'is_show_top_nav_', '是否显示顶部导航条', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', '是否显示水平导航条。(只有在导航模式为1的情况，此设置才有效,导航模式为2，则水平导航条不会消失)。可选值：true| false。');
INSERT INTO "AOS_SYS_DIC_INDEX" VALUES ('38841cd4f85f4ffb8c07c74650a130dc', 'page_type_', '页面类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
INSERT INTO "AOS_SYS_DIC_INDEX" VALUES ('3ba3a682c2ac4d52982411dd045fae32', 'skin_', '界面皮肤', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
INSERT INTO "AOS_SYS_DIC_INDEX" VALUES ('48062fd856f14794b03ceba2a1d6b60e', 'proctask_status_', '任务状态', null, '38368661c53c40b6824869a0ccffad05', '0.002.001.001', null);
INSERT INTO "AOS_SYS_DIC_INDEX" VALUES ('483fb2ff35e84a42974e914851fae01a', 'create_type_', '流程模型创建方式', null, '38368661c53c40b6824869a0ccffad05', '0.002.001.001', '业务流程模型创建方式');
INSERT INTO "AOS_SYS_DIC_INDEX" VALUES ('4c2a12d3890a449fa91521a29a3c2436', 'nav_tab_index_', '导航缺省活动页', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
INSERT INTO "AOS_SYS_DIC_INDEX" VALUES ('54e48c66b3ef4d99823ca8217a2abf43', 'main_text_color_', '边界区域字体主颜色', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
INSERT INTO "AOS_SYS_DIC_INDEX" VALUES ('58b28eade8604dffa7c531b7b42af2fa', 'org_type_', '组织类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
INSERT INTO "AOS_SYS_DIC_INDEX" VALUES ('61fd319a23b04bd1bdbce7037002976a', 'nav_text_color_', '导航文字颜色', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
INSERT INTO "AOS_SYS_DIC_INDEX" VALUES ('79004d064e954e55b832a8a9a4332576', 'post_type_', '岗位类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
INSERT INTO "AOS_SYS_DIC_INDEX" VALUES ('7d048854ccdc4eab996dcb703722065b', 'page_el_type_', '页面元素类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
INSERT INTO "AOS_SYS_DIC_INDEX" VALUES ('91bc8a695b744b27ba66a94561fd6dbc', 'bool_', '是否布尔值字典', null, 'aa3082ab67e24d8b884bc4504d3d9945', '0.002.002', null);
INSERT INTO "AOS_SYS_DIC_INDEX" VALUES ('a06eb2af650444db903c945030334b12', 'procinst_status_', '流程实例状态', null, '38368661c53c40b6824869a0ccffad05', '0.002.001.001', null);
INSERT INTO "AOS_SYS_DIC_INDEX" VALUES ('a19ac2af964c4a6e8af9c6f1c0d2673f', 'navbar_btn_style_', '顶部导航条按钮风格', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
INSERT INTO "AOS_SYS_DIC_INDEX" VALUES ('a44dd9bbf55041368882e88821309355', 'theme_', '系统主题', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
INSERT INTO "AOS_SYS_DIC_INDEX" VALUES ('a9fd5aa3b7654326902a94e70bccedd8', 'module_user_nav_type', '导航菜单类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
INSERT INTO "AOS_SYS_DIC_INDEX" VALUES ('c66f06c069224241a4785e77d1406f9c', 'delegation_', '委派状态', null, '38368661c53c40b6824869a0ccffad05', '0.002.001.001', '流程任务的委派代理状态');
INSERT INTO "AOS_SYS_DIC_INDEX" VALUES ('cfcbc48fd8ad42678a52334bac8aa299', 'role_type_', '角色类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
INSERT INTO "AOS_SYS_DIC_INDEX" VALUES ('dd9f74d16be14db5b0f6d79720c8f177', 'grant_type_', '权限类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
INSERT INTO "AOS_SYS_DIC_INDEX" VALUES ('e9e9cfc195514b05890a2249b81dfe73', 'north_back_img_', '主页面north区域背景图片', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
INSERT INTO "AOS_SYS_DIC_INDEX" VALUES ('f59d8693d8cf4f10850914e09ae9b93c', 'sex_', '性别', null, 'aa3082ab67e24d8b884bc4504d3d9945', '0.002.002', null);
INSERT INTO "AOS_SYS_DIC_INDEX" VALUES ('fa8097dd670643f9a03722c4074ecba5', 'left_logo_', 'Banner左边logo图标', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
INSERT INTO "AOS_SYS_DIC_INDEX" VALUES ('ffc94f2b7ad14c78b14c46f8fab17543', 'nav_quick_layout_', '快捷菜单布局风格', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', '快捷菜单布局风格。');
INSERT INTO "AOS_SYS_DIC_INDEX" VALUES ('0475e71c145f49acbe781b2e7310ab64', 'user_type_', '用户类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
INSERT INTO "AOS_SYS_DIC_INDEX" VALUES ('0744eedeaaa143afa499254866aa75c9', 'user_status_', '用户状态', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);

-- ----------------------------
-- Table structure for AOS_SYS_ICON
-- ----------------------------
DROP TABLE "AOS_SYS_ICON";
CREATE TABLE "AOS_SYS_ICON" (
"ID_" VARCHAR2(64 BYTE) NOT NULL ,
"NAME_" VARCHAR2(255 BYTE) NOT NULL ,
"TYPE_" VARCHAR2(255 BYTE) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "AOS_SYS_ICON" IS '图标大全';
COMMENT ON COLUMN "AOS_SYS_ICON"."ID_" IS '流水号';
COMMENT ON COLUMN "AOS_SYS_ICON"."NAME_" IS '名称';
COMMENT ON COLUMN "AOS_SYS_ICON"."TYPE_" IS '类型';

-- ----------------------------
-- Records of AOS_SYS_ICON
-- ----------------------------
INSERT INTO "AOS_SYS_ICON" VALUES ('2904', '10.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2905', '11.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2906', '13.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2907', '14.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2908', '15.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2909', '17.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2910', '19.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2911', '2.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2912', '21.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2913', '22.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2914', '23.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2915', '24.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2916', '25.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2917', '26.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2918', '28.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2919', '3.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2920', '30.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2921', '32.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2922', '34.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2923', '35.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2924', '36.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2925', '37.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2926', '38.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2927', '39.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2928', '4.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2929', '40.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2930', '41.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2931', '42.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2932', '43.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2933', '44.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2934', '45.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2935', '46.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2936', '47.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2937', '48.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2938', '49.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2939', '5.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2940', '51.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2941', '52.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2942', '53.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2943', '54.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2944', '55.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2945', '56.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2946', '6.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2947', '7.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2948', '8.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('2949', '9.png', '2');
INSERT INTO "AOS_SYS_ICON" VALUES ('10047', 'add.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10048', 'add2.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10049', 'against.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10050', 'agree.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10051', 'app_columns.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10052', 'app_list.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10053', 'bars.gif', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10054', 'basket.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10055', 'book.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10056', 'book_user.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10057', 'bug.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10058', 'bullet_black.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10059', 'bullet_blue.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10060', 'bullet_green.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10061', 'bullet_group.gif', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10062', 'bullet_group2.gif', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10063', 'bullet_group3.gif', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10064', 'bullet_group4.gif', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10065', 'bullet_purple.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10066', 'bullet_red.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10067', 'bullet_yellow.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10068', 'chart_curve.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10069', 'chart_flipped.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10070', 'chart_line.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10071', 'chart_pie.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10072', 'close.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10073', 'close2.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10074', 'config.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10075', 'config1.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10076', 'config3.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10077', 'connect.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10078', 'copy.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10079', 'cut.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10080', 'cv.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10081', 'c_key.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10082', 'database.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10083', 'database_add.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10084', 'del.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10085', 'del1.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10086', 'del2.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10087', 'del_folder.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10088', 'del_page.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10089', 'detail.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10090', 'disconnect.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10091', 'doc_ok.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10092', 'down.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10093', 'down_left.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10094', 'down_right.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10095', 'edit.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10096', 'edit2.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10097', 'email.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10098', 'email2.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10099', 'email3.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10100', 'email_go.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10101', 'email_open.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('827', 'fa-adjust', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1096', 'fa-adn', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('817', 'fa-align-center', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('819', 'fa-align-justify', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('816', 'fa-align-left', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('818', 'fa-align-right', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('987', 'fa-ambulance', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1049', 'fa-anchor', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1107', 'fa-android', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1240', 'fa-angellist', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('996', 'fa-angle-double-down', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('993', 'fa-angle-double-left', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('994', 'fa-angle-double-right', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('995', 'fa-angle-double-up', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1000', 'fa-angle-down', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('997', 'fa-angle-left', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('998', 'fa-angle-right', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('999', 'fa-angle-up', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1105', 'fa-apple', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1118', 'fa-archive', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1230', 'fa-area-chart', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('926', 'fa-arrow-circle-down', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('923', 'fa-arrow-circle-left', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('790', 'fa-arrow-circle-o-down', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1126', 'fa-arrow-circle-o-left', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1125', 'fa-arrow-circle-o-right', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('791', 'fa-arrow-circle-o-up', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('924', 'fa-arrow-circle-right', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('925', 'fa-arrow-circle-up', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('858', 'fa-arrow-down', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('855', 'fa-arrow-left', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('856', 'fa-arrow-right', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('857', 'fa-arrow-up', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('832', 'fa-arrows', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('932', 'fa-arrows-alt', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('884', 'fa-arrows-h', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('883', 'fa-arrows-v', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('864', 'fa-asterisk', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1226', 'fa-at', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('835', 'fa-backward', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('854', 'fa-ban', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('885', 'fa-bar-chart', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('804', 'fa-barcode', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('942', 'fa-bars', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('990', 'fa-beer', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1160', 'fa-behance', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1161', 'fa-behance-square', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('917', 'fa-bell', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('981', 'fa-bell-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1222', 'fa-bell-slash', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1223', 'fa-bell-slash-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1237', 'fa-bicycle', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1206', 'fa-binoculars', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1229', 'fa-birthday-cake', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1097', 'fa-bitbucket', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1098', 'fa-bitbucket-square', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('812', 'fa-bold', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('970', 'fa-bolt', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1203', 'fa-bomb', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('807', 'fa-book', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('808', 'fa-bookmark', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('907', 'fa-bookmark-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('931', 'fa-briefcase', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1076', 'fa-btc', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1119', 'fa-bug', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1154', 'fa-building', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('985', 'fa-building-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('916', 'fa-bullhorn', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1051', 'fa-bullseye', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1238', 'fa-bus', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1213', 'fa-calculator', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('873', 'fa-calendar', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1039', 'fa-calendar-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('810', 'fa-camera', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('888', 'fa-camera-retro', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1165', 'fa-car', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('955', 'fa-caret-down', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('957', 'fa-caret-left', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('958', 'fa-caret-right', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1066', 'fa-caret-square-o-down', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1127', 'fa-caret-square-o-left', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1068', 'fa-caret-square-o-right', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1067', 'fa-caret-square-o-up', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('956', 'fa-caret-up', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1241', 'fa-cc', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1219', 'fa-cc-amex', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1218', 'fa-cc-discover', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1217', 'fa-cc-mastercard', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1220', 'fa-cc-paypal', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1221', 'fa-cc-stripe', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1216', 'fa-cc-visa', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('918', 'fa-certificate', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1028', 'fa-chain-broken', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('777', 'fa-check', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('848', 'fa-check-circle', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('853', 'fa-check-circle-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1061', 'fa-check-square', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('831', 'fa-check-square-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1046', 'fa-chevron-circle-down', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1043', 'fa-chevron-circle-left', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1044', 'fa-chevron-circle-right', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1045', 'fa-chevron-circle-up', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('878', 'fa-chevron-down', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('843', 'fa-chevron-left', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('844', 'fa-chevron-right', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('877', 'fa-chevron-up', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1155', 'fa-child', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1009', 'fa-circle', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1005', 'fa-circle-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1185', 'fa-circle-o-notch', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1197', 'fa-circle-thin', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('973', 'fa-clipboard', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('787', 'fa-clock-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('935', 'fa-cloud', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('976', 'fa-cloud-download', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('977', 'fa-cloud-upload', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1022', 'fa-code', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1027', 'fa-code-fork', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1182', 'fa-codepen', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('982', 'fa-coffee', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('783', 'fa-cog', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('890', 'fa-cogs', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('959', 'fa-columns', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('875', 'fa-comment', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('968', 'fa-comment-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('891', 'fa-comments', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('969', 'fa-comments-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1065', 'fa-compass', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('861', 'fa-compress', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1225', 'fa-copyright', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('913', 'fa-credit-card', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1026', 'fa-crop', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('851', 'fa-crosshairs', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1048', 'fa-css3', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1158', 'fa-cube', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1159', 'fa-cubes', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('983', 'fa-cutlery', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1171', 'fa-database', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1146', 'fa-delicious', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1001', 'fa-desktop', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1169', 'fa-deviantart', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1147', 'fa-digg', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1128', 'fa-dot-circle-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('789', 'fa-download', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1109', 'fa-dribbble', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1092', 'fa-dropbox', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1150', 'fa-drupal', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('842', 'fa-eject', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1052', 'fa-ellipsis-h', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1053', 'fa-ellipsis-v', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1187', 'fa-empire', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('963', 'fa-envelope', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('768', 'fa-envelope-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1135', 'fa-envelope-square', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1034', 'fa-eraser', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1069', 'fa-eur', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('975', 'fa-exchange', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1031', 'fa-exclamation', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('865', 'fa-exclamation-circle', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('871', 'fa-exclamation-triangle', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('860', 'fa-expand', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('899', 'fa-external-link', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1063', 'fa-external-link-square', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('869', 'fa-eye', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('870', 'fa-eye-slash', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1227', 'fa-eyedropper', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('910', 'fa-facebook', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('887', 'fa-facebook-square', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('834', 'fa-fast-backward', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('840', 'fa-fast-forward', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1153', 'fa-fax', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1113', 'fa-female', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('989', 'fa-fighter-jet', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1077', 'fa-file', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1177', 'fa-file-archive-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1178', 'fa-file-audio-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1180', 'fa-file-code-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1174', 'fa-file-excel-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1176', 'fa-file-image-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('786', 'fa-file-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1172', 'fa-file-pdf-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1175', 'fa-file-powerpoint-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1078', 'fa-file-text', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('984', 'fa-file-text-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1179', 'fa-file-video-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1173', 'fa-file-word-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('938', 'fa-files-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('773', 'fa-film', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('930', 'fa-filter', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('868', 'fa-fire', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1040', 'fa-fire-extinguisher', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('798', 'fa-flag', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1020', 'fa-flag-checkered', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1019', 'fa-flag-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('936', 'fa-flask', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1095', 'fa-flickr', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('940', 'fa-floppy-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('881', 'fa-folder', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1012', 'fa-folder-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('882', 'fa-folder-open', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1013', 'fa-folder-open-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('811', 'fa-font', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('839', 'fa-forward', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1111', 'fa-foursquare', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1015', 'fa-frown-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1204', 'fa-futbol-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1017', 'fa-gamepad', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('966', 'fa-gavel', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1070', 'fa-gbp', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('866', 'fa-gift', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1189', 'fa-git', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1188', 'fa-git-square', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('911', 'fa-github', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1011', 'fa-github-alt', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('902', 'fa-github-square', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1115', 'fa-gittip', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('765', 'fa-glass', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('927', 'fa-globe', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1141', 'fa-google', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('953', 'fa-google-plus', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('952', 'fa-google-plus-square', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1215', 'fa-google-wallet', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1139', 'fa-graduation-cap', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('991', 'fa-h-square', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1190', 'fa-hacker-news', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('922', 'fa-hand-o-down', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('920', 'fa-hand-o-left', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('919', 'fa-hand-o-right', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('921', 'fa-hand-o-up', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('915', 'fa-hdd-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1198', 'fa-header', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('799', 'fa-headphones', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('769', 'fa-heart', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('895', 'fa-heart-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1196', 'fa-history', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('785', 'fa-home', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('986', 'fa-hospital-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1047', 'fa-html5', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1242', 'fa-ils', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('792', 'fa-inbox', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('822', 'fa-indent', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1030', 'fa-info', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('850', 'fa-info-circle', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1072', 'fa-inr', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1094', 'fa-instagram', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1239', 'fa-ioxhost', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('813', 'fa-italic', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1151', 'fa-joomla', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1073', 'fa-jpy', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1183', 'fa-jsfiddle', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('889', 'fa-key', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1018', 'fa-keyboard-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1075', 'fa-krw', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1152', 'fa-language', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1002', 'fa-laptop', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1233', 'fa-lastfm', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1234', 'fa-lastfm-square', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('867', 'fa-leaf', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('904', 'fa-lemon-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1060', 'fa-level-down', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1059', 'fa-level-up', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1184', 'fa-life-ring', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('974', 'fa-lightbulb-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1232', 'fa-line-chart', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('934', 'fa-link', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('964', 'fa-linkedin', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('897', 'fa-linkedin-square', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1108', 'fa-linux', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('820', 'fa-list', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('796', 'fa-list-alt', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('944', 'fa-list-ol', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('943', 'fa-list-ul', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1025', 'fa-location-arrow', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('797', 'fa-lock', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1101', 'fa-long-arrow-down', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1103', 'fa-long-arrow-left', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1104', 'fa-long-arrow-right', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1102', 'fa-long-arrow-up', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('948', 'fa-magic', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('876', 'fa-magnet', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1114', 'fa-male', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('826', 'fa-map-marker', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1042', 'fa-maxcdn', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1243', 'fa-meanpath', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('988', 'fa-medkit', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1016', 'fa-meh-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1036', 'fa-microphone', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1037', 'fa-microphone-slash', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('863', 'fa-minus', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('846', 'fa-minus-circle', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1057', 'fa-minus-square', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1058', 'fa-minus-square-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1004', 'fa-mobile', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('954', 'fa-money', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1117', 'fa-moon-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('766', 'fa-music', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1211', 'fa-newspaper-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1137', 'fa-openid', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('821', 'fa-outdent', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1123', 'fa-pagelines', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1228', 'fa-paint-brush', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1194', 'fa-paper-plane', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1195', 'fa-paper-plane-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('939', 'fa-paperclip', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1199', 'fa-paragraph', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('837', 'fa-pause', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1156', 'fa-paw', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1214', 'fa-paypal', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('825', 'fa-pencil', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1062', 'fa-pencil-square', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('829', 'fa-pencil-square-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('905', 'fa-phone', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('908', 'fa-phone-square', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('824', 'fa-picture-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1231', 'fa-pie-chart', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1148', 'fa-pied-piper', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1149', 'fa-pied-piper-alt', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('950', 'fa-pinterest', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('951', 'fa-pinterest-square', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('872', 'fa-plane', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('836', 'fa-play', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1055', 'fa-play-circle', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('793', 'fa-play-circle-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1207', 'fa-plug', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('862', 'fa-plus', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('845', 'fa-plus-circle', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('992', 'fa-plus-square', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1132', 'fa-plus-square-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('781', 'fa-power-off', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('809', 'fa-print', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1035', 'fa-puzzle-piece', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1192', 'fa-qq', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('803', 'fa-qrcode', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1029', 'fa-question', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('849', 'fa-question-circle', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1006', 'fa-quote-left', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1007', 'fa-quote-right', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('874', 'fa-random', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1186', 'fa-rebel', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1164', 'fa-recycle', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1142', 'fa-reddit', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1143', 'fa-reddit-square', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('795', 'fa-refresh', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1122', 'fa-renren', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('794', 'fa-repeat', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1010', 'fa-reply', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1023', 'fa-reply-all', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('879', 'fa-retweet', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('788', 'fa-road', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1041', 'fa-rocket', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('914', 'fa-rss', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1054', 'fa-rss-square', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1074', 'fa-rub', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('937', 'fa-scissors', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('767', 'fa-search', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('780', 'fa-search-minus', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('779', 'fa-search-plus', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('859', 'fa-share', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1201', 'fa-share-alt', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1202', 'fa-share-alt-square', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1064', 'fa-share-square', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('830', 'fa-share-square-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1038', 'fa-shield', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('880', 'fa-shopping-cart', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('900', 'fa-sign-in', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('896', 'fa-sign-out', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('782', 'fa-signal', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('971', 'fa-sitemap', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1110', 'fa-skype', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1134', 'fa-slack', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1200', 'fa-sliders', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1208', 'fa-slideshare', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1014', 'fa-smile-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('960', 'fa-sort', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1079', 'fa-sort-alpha-asc', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1080', 'fa-sort-alpha-desc', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1081', 'fa-sort-amount-asc', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1082', 'fa-sort-amount-desc', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('962', 'fa-sort-asc', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('961', 'fa-sort-desc', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1083', 'fa-sort-numeric-asc', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1084', 'fa-sort-numeric-desc', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1170', 'fa-soundcloud', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1133', 'fa-space-shuttle', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1008', 'fa-spinner', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1157', 'fa-spoon', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1168', 'fa-spotify', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('941', 'fa-square', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('906', 'fa-square-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1124', 'fa-stack-exchange', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1093', 'fa-stack-overflow', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('770', 'fa-star', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('894', 'fa-star-half', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1024', 'fa-star-half-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('771', 'fa-star-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1162', 'fa-steam', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1163', 'fa-steam-square', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('833', 'fa-step-backward', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('841', 'fa-step-forward', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('979', 'fa-stethoscope', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('838', 'fa-stop', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('945', 'fa-strikethrough', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1145', 'fa-stumbleupon', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1144', 'fa-stumbleupon-circle', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1033', 'fa-subscript', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('980', 'fa-suitcase', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1116', 'fa-sun-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1032', 'fa-superscript', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('947', 'fa-table', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1003', 'fa-tablet', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('967', 'fa-tachometer', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('805', 'fa-tag', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('806', 'fa-tags', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('929', 'fa-tasks', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1166', 'fa-taxi', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1191', 'fa-tencent-weibo', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1021', 'fa-terminal', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('814', 'fa-text-height', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('815', 'fa-text-width', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('775', 'fa-th', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('774', 'fa-th-large', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('776', 'fa-th-list', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('898', 'fa-thumb-tack', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1086', 'fa-thumbs-down', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('893', 'fa-thumbs-o-down', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('892', 'fa-thumbs-o-up', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1085', 'fa-thumbs-up', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1056', 'fa-ticket', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('778', 'fa-times', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('847', 'fa-times-circle', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('852', 'fa-times-circle-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('828', 'fa-tint', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1235', 'fa-toggle-off', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1236', 'fa-toggle-on', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1224', 'fa-trash', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('784', 'fa-trash-o', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1167', 'fa-tree', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1112', 'fa-trello', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('901', 'fa-trophy', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('949', 'fa-truck', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1131', 'fa-try', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1205', 'fa-tty', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1099', 'fa-tumblr', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1100', 'fa-tumblr-square', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1209', 'fa-twitch', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('909', 'fa-twitter', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('886', 'fa-twitter-square', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('972', 'fa-umbrella', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('946', 'fa-underline', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('965', 'fa-undo', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1138', 'fa-university', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('912', 'fa-unlock', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1050', 'fa-unlock-alt', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('903', 'fa-upload', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1071', 'fa-usd', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('772', 'fa-user', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('978', 'fa-user-md', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('933', 'fa-users', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('823', 'fa-video-camera', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1130', 'fa-vimeo-square', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1181', 'fa-vine', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1120', 'fa-vk', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('801', 'fa-volume-down', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('800', 'fa-volume-off', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('802', 'fa-volume-up', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1121', 'fa-weibo', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1193', 'fa-weixin', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1129', 'fa-wheelchair', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1212', 'fa-wifi', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1106', 'fa-windows', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1136', 'fa-wordpress', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('928', 'fa-wrench', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1089', 'fa-xing', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1090', 'fa-xing-square', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1140', 'fa-yahoo', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1210', 'fa-yelp', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1088', 'fa-youtube', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1091', 'fa-youtube-play', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('1087', 'fa-youtube-square', '3');
INSERT INTO "AOS_SYS_ICON" VALUES ('10102', 'filter.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10103', 'folder1.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10104', 'folder10.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10105', 'folder11.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10106', 'folder12.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10107', 'folder13.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10108', 'folder14.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10109', 'folder15.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10110', 'folder16.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10111', 'folder17.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10112', 'folder18.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10113', 'folder19.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10114', 'folder2.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10115', 'folder20.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10116', 'folder21.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10117', 'folder22.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10118', 'folder23.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10119', 'folder24.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10120', 'folder25.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10121', 'folder26.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10122', 'folder27.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10123', 'folder28.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10124', 'folder4.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10125', 'folder5.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10126', 'folder6.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10127', 'folder7.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10128', 'folder8.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10129', 'folder9.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10130', 'forward.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10131', 'freelance.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10132', 'go.gif', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10133', 'go.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10134', 'go1.gif', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10135', 'go1.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10136', 'help.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10137', 'home.gif', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10138', 'home.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10139', 'icon134.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10140', 'icon137.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10141', 'icon140.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10142', 'icon141.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10143', 'icon146.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10144', 'icon15.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10145', 'icon150.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10146', 'icon152.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10147', 'icon153.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10148', 'icon154.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10149', 'icon17.gif', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10150', 'icon25.gif', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10151', 'icon26.gif', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10152', 'icon31.gif', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10153', 'icon32.gif', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10154', 'icon34.gif', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10155', 'icon35.gif', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10156', 'icon36.gif', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10157', 'icon37.gif', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10158', 'icon38.gif', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10159', 'icon39.gif', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10160', 'icon41.gif', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10161', 'icon42.gif', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10162', 'icon5.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10163', 'icon56.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10164', 'icon59.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10165', 'icon63.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10166', 'icon65.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10167', 'icon66.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10168', 'icon67.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10169', 'icon68.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10170', 'icon7.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10171', 'icon70.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10172', 'icon71.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10173', 'icon72.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10174', 'icon75.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10175', 'icon76.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10176', 'icon77.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10177', 'icon78.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10178', 'icon79.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10179', 'icon8.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10180', 'icon80.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10181', 'icon82.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10182', 'icon85.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10183', 'icon86.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10184', 'icon88.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10185', 'icon9.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10186', 'icon96.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10187', 'icon_19.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10188', 'icq.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10189', 'id.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10190', 'ins.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10191', 'jar.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10192', 'key.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10193', 'layout.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10194', 'layout2.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10195', 'left.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10196', 'lightbulb.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10197', 'lock.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10198', 'lock3.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10199', 'modules_wizard.gif', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10200', 'monitor.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10201', 'node.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10202', 'ok.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10203', 'ok1.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10204', 'ok3.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10205', 'ok4.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10206', 'ok5.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10207', 'org.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10208', 'org2.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10209', 'outs.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10210', 'own.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10211', 'page.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10212', 'page2.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10213', 'page3.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10214', 'page_code.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10215', 'page_font.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10216', 'page_next.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10217', 'page_office.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10218', 'page_paint.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10219', 'page_picture.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10220', 'page_vector.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10221', 'paint2.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10222', 'paste.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10223', 'picture.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10224', 'pictures.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10225', 'picture_empty.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10226', 'plugin.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10227', 'plugin2.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10228', 'printer.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10229', 'query.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10230', 'redo.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10231', 'refresh.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10232', 'refresh2.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10233', 'right.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10234', 'save.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10235', 'save_all.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10236', 'search.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10237', 'security.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10238', 'send_receive.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10239', 'shape_align_bottom.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10240', 'shape_align_center.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10241', 'shape_align_middle.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10242', 'shape_group.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10243', 'shape_handles.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10244', 'shape_move_back.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10245', 'share.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10246', 'sitemap.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10247', 'sql.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10248', 'sql2.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10249', 'sql3.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10250', 'stop.gif', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10251', 'stop2.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10252', 'stop3.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10253', 'system.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10254', 'table.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10255', 'table2.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10256', 'tables.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10257', 'tables_relation.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10258', 'table_edit.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10259', 'tag.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10260', 'task.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10261', 'task1.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10262', 'task_finish.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10263', 'task_list.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10264', 'terminal.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10265', 'textfield.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10266', 'text_cap.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10267', 'text_col.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10268', 'text_list.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10269', 'text_upper.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10270', 'theme.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10271', 'time.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10272', 'timeline.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10273', 'undo.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10274', 'up.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10275', 'up2.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10276', 'up_left.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10277', 'up_right.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10278', 'user1.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10279', 'user20.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10280', 'user3.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10281', 'user6.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10282', 'user8.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10283', 'vcard.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10284', 'vector.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10285', 'wand.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10286', 'webcam.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10287', 'zoom_in.png', '1');
INSERT INTO "AOS_SYS_ICON" VALUES ('10288', 'zoom_out.png', '1');

-- ----------------------------
-- Table structure for AOS_SYS_MODULE
-- ----------------------------
DROP TABLE "AOS_SYS_MODULE";
CREATE TABLE "AOS_SYS_MODULE" (
"ID_" VARCHAR2(64 BYTE) NOT NULL ,
"CASCADE_ID_" VARCHAR2(255 BYTE) NOT NULL ,
"NAME_" VARCHAR2(255 BYTE) NOT NULL ,
"URL_" VARCHAR2(255 BYTE) NULL ,
"HOTKEY_" VARCHAR2(255 BYTE) NULL ,
"PARENT_ID_" VARCHAR2(64 BYTE) NOT NULL ,
"IS_LEAF_" VARCHAR2(255 BYTE) DEFAULT 1  NOT NULL ,
"IS_AUTO_EXPAND_" VARCHAR2(255 BYTE) DEFAULT 0  NOT NULL ,
"ICON_NAME_" VARCHAR2(255 BYTE) NULL ,
"STATUS_" VARCHAR2(255 BYTE) DEFAULT 1  NOT NULL ,
"PARENT_NAME_" VARCHAR2(255 BYTE) NOT NULL ,
"VECTOR_" VARCHAR2(255 BYTE) NULL ,
"SORT_NO_" NUMBER(10) DEFAULT 0  NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "AOS_SYS_MODULE" IS '功能模块表';
COMMENT ON COLUMN "AOS_SYS_MODULE"."ID_" IS '功能模块流水号';
COMMENT ON COLUMN "AOS_SYS_MODULE"."CASCADE_ID_" IS '节点语义ID';
COMMENT ON COLUMN "AOS_SYS_MODULE"."NAME_" IS '功能模块名称';
COMMENT ON COLUMN "AOS_SYS_MODULE"."URL_" IS '主页面URL';
COMMENT ON COLUMN "AOS_SYS_MODULE"."HOTKEY_" IS '热键';
COMMENT ON COLUMN "AOS_SYS_MODULE"."PARENT_ID_" IS '父节点流水号';
COMMENT ON COLUMN "AOS_SYS_MODULE"."IS_LEAF_" IS '是否叶子节点';
COMMENT ON COLUMN "AOS_SYS_MODULE"."IS_AUTO_EXPAND_" IS '是否自动展开';
COMMENT ON COLUMN "AOS_SYS_MODULE"."ICON_NAME_" IS '节点图标文件名称';
COMMENT ON COLUMN "AOS_SYS_MODULE"."STATUS_" IS '当前状态';
COMMENT ON COLUMN "AOS_SYS_MODULE"."PARENT_NAME_" IS '父节点名称';
COMMENT ON COLUMN "AOS_SYS_MODULE"."VECTOR_" IS '矢量图标';
COMMENT ON COLUMN "AOS_SYS_MODULE"."SORT_NO_" IS '排序号';

-- ----------------------------
-- Records of AOS_SYS_MODULE
-- ----------------------------
INSERT INTO "AOS_SYS_MODULE" VALUES ('0b99e9d118b54ee084d9e74bd72cdd1c', '0.001.002', '资源管理', null, null, '7a6d3674e5204937951d01544e18e3aa', '0', '1', 'folder14.png', '1', '系统管理', null, '20');
INSERT INTO "AOS_SYS_MODULE" VALUES ('1886bf699ec74f79959bdc8ca8e5371a', '0.001.006.004', '会话监控', 'system/sessionLog/init.jhtml', null, '5b9a439743f141729f46a07e8e222a47', '1', '0', 'c_key.png', '1', '监控与审计', null, '10');
INSERT INTO "AOS_SYS_MODULE" VALUES ('1906d5a892654e2bb882851e0ea7322f', '0.001.008.001', '图标', 'system/icon/init.jhtml', null, '524e5f5c3e5b4cdb90611cd8b15ca684', '1', '0', 'page_picture.png', '1', '开发工具箱', null, '60');
INSERT INTO "AOS_SYS_MODULE" VALUES ('1cf1947152174cacaf226fa54ca51351', '0.004.002.001.009', '表单校验', 'demo/initFormValidate.jhtml', null, 'f73a952eefa2406c9327da6252c4ca79', '1', '0', null, '1', '表单', null, '8');
INSERT INTO "AOS_SYS_MODULE" VALUES ('25406890354f4514909e2ad1c0fd678d', '0.004.002.003.001', '表格①', 'demo/grid/initGrid1.jhtml', null, 'dbf75990cf784e79920caf7eb47856f6', '1', '0', null, '1', '表格', null, '10');
INSERT INTO "AOS_SYS_MODULE" VALUES ('266bbec9e0af4612afa5139aade0a511', '0.004.002.001.006', '组合选择框', 'demo/initFormComboBox.jhtml', null, 'f73a952eefa2406c9327da6252c4ca79', '1', '0', null, '1', '表单', null, '30');
INSERT INTO "AOS_SYS_MODULE" VALUES ('2790bf6cc0b54c36b56c90429c112ab2', '0.001.008.005', 'WebIDE', 'system/coder/init.jhtml', null, '524e5f5c3e5b4cdb90611cd8b15ca684', '1', '0', 'icon15.png', '1', '开发工具箱', null, '5');
INSERT INTO "AOS_SYS_MODULE" VALUES ('29873ca569fb46c3bbd951a8a1df2472', '0.002', '项目导航', null, null, '2a4c060f44d944ea926fe44522ce7b39', '0', '1', 'folder2.png', '1', 'AOS应用基础平台', 'fa-github-alt', '20');
INSERT INTO "AOS_SYS_MODULE" VALUES ('2a4c060f44d944ea926fe44522ce7b39', '0', 'AOS应用基础平台', null, null, 'p', '0', '1', 'home.png', '1', 'root', null, '1');
INSERT INTO "AOS_SYS_MODULE" VALUES ('327677ef8d2a4e5caf3c4cbc9b72d0b0', '0.004.002.003.004', '客户端分页表格', 'demo/grid/initGrid3.jhtml', null, 'dbf75990cf784e79920caf7eb47856f6', '1', '0', null, '1', '表格', null, '40');
INSERT INTO "AOS_SYS_MODULE" VALUES ('33baf8c9948b47cfa54cd8d7a5e1753d', '0.004.003', '综合实例', null, null, '6e10c86d1885434e80e6dfa0953e307d', '0', '1', null, '1', '范例', null, '20');
INSERT INTO "AOS_SYS_MODULE" VALUES ('38e28fce49414c4c9e95d032559d5bee', '0.004.002.002', '按钮', 'demo/initButton.jhtml', null, '6cab8b013c314b37aec7c4567d859fc8', '1', '0', null, '1', 'AOS UI组件库', null, '10');
INSERT INTO "AOS_SYS_MODULE" VALUES ('3bb16fa3935c41bebe4d3fcf3c4ebd5c', '0.004.004', '杂项', null, null, '6e10c86d1885434e80e6dfa0953e307d', '0', '0', null, '1', '范例', null, '15');
INSERT INTO "AOS_SYS_MODULE" VALUES ('4d3cfce7b9b146d2bc8482ec477517aa', '0.002.001', '首选项', 'system/preference/init.jhtml', null, '29873ca569fb46c3bbd951a8a1df2472', '1', '0', 'config1.png', '1', '项目导航', null, '10');
INSERT INTO "AOS_SYS_MODULE" VALUES ('524e5f5c3e5b4cdb90611cd8b15ca684', '0.001.008', '开发工具箱', null, null, '7a6d3674e5204937951d01544e18e3aa', '0', '0', 'folder9.png', '1', '系统管理', 'fa-bug', '70');
INSERT INTO "AOS_SYS_MODULE" VALUES ('591f2ffa62a1461887c1d6f02c60a1ff', '0.004.004.002', '消息通知窗口', 'demo/initNotification.jhtml', null, '3bb16fa3935c41bebe4d3fcf3c4ebd5c', '1', '0', null, '1', '杂项', null, '2');
INSERT INTO "AOS_SYS_MODULE" VALUES ('5ae41d35d16247febabf631a81a0d70d', '0.004.002.001.008', '表单数据交互', 'demo/initFormData.jhtml', null, 'f73a952eefa2406c9327da6252c4ca79', '1', '0', null, '1', '表单', null, '40');
INSERT INTO "AOS_SYS_MODULE" VALUES ('5b9a439743f141729f46a07e8e222a47', '0.001.006', '监控与审计', null, null, '7a6d3674e5204937951d01544e18e3aa', '0', '0', 'folder27.png', '1', '系统管理', null, '60');
INSERT INTO "AOS_SYS_MODULE" VALUES ('5fb994e71cb14a77891670990d7f554d', '0.001.001', '基础数据', null, null, '7a6d3674e5204937951d01544e18e3aa', '0', '1', 'folder2.png', '1', '系统管理', null, '10');
INSERT INTO "AOS_SYS_MODULE" VALUES ('619cb338b278406f8368471034d5946f', '0.001.004.006', '任务节点', 'workflow/procTask/init.jhtml', null, 'cfc4e4bd367047a29e0d72e688f860a2', '1', '0', 'task_list.png', '1', '业务流程管理', null, '40');
INSERT INTO "AOS_SYS_MODULE" VALUES ('65320b914c18453f9ca0a84d3f8a0a7b', '0.001.003.001', '组织架构', 'system/org/init.jhtml', null, 'b656d6afbbe844d0a6626d0eb590643f', '1', '0', 'icon56.png', '1', '组织与权限', null, '1');
INSERT INTO "AOS_SYS_MODULE" VALUES ('68822bfa39914373afe70dc343c84e94', '0.004.002.001.005', '常用表单元素', 'demo/initFormElements.jhtml', null, 'f73a952eefa2406c9327da6252c4ca79', '1', '0', null, '1', '表单', null, '10');
INSERT INTO "AOS_SYS_MODULE" VALUES ('6cab8b013c314b37aec7c4567d859fc8', '0.004.002', 'AOS UI组件库', null, null, '6e10c86d1885434e80e6dfa0953e307d', '0', '1', null, '1', '范例', null, '10');
INSERT INTO "AOS_SYS_MODULE" VALUES ('6e10c86d1885434e80e6dfa0953e307d', '0.004', '范例', null, null, '2a4c060f44d944ea926fe44522ce7b39', '0', '1', 'folder27.png', '1', 'AOS应用基础平台', 'fa-coffee', '40');
INSERT INTO "AOS_SYS_MODULE" VALUES ('704d4e51ffcf473fa95ab9e680177d46', '0.004.002.003.002', '表格②', 'demo/grid/initGrid2.jhtml', null, 'dbf75990cf784e79920caf7eb47856f6', '1', '0', null, '1', '表格', null, '20');
INSERT INTO "AOS_SYS_MODULE" VALUES ('715f6cf8d2ce4fa694baf2259327f6b1', '0.001.003.002', '岗位与授权', 'system/post/init.jhtml', null, 'b656d6afbbe844d0a6626d0eb590643f', '1', '0', 'icon137.png', '1', '组织与权限', null, '3');
INSERT INTO "AOS_SYS_MODULE" VALUES ('73b69ca49e2240ba8717fc13acb884c2', '0.004.002.001.001', '表单布局①', 'demo/initForm1.jhtml', null, 'f73a952eefa2406c9327da6252c4ca79', '1', '0', null, '1', '表单', null, '1');
INSERT INTO "AOS_SYS_MODULE" VALUES ('7a6d3674e5204937951d01544e18e3aa', '0.001', '系统管理', null, null, '2a4c060f44d944ea926fe44522ce7b39', '0', '1', 'folder22.png', '1', 'AOS应用基础平台', 'fa-cogs', '10');
INSERT INTO "AOS_SYS_MODULE" VALUES ('81fc0e05049e467d976ec523182421f2', '0.001.002.004', '序列号', 'system/idMgr/init.jhtml', null, '0b99e9d118b54ee084d9e74bd72cdd1c', '1', '0', 'id.png', '1', '资源管理', null, '30');
INSERT INTO "AOS_SYS_MODULE" VALUES ('870c482cdb2e4c8aa373dcf447964284', '0.004.002.003.003', '可编辑表格', 'demo/grid/initEditGrid.jhtml', null, 'dbf75990cf784e79920caf7eb47856f6', '1', '0', null, '1', '表格', null, '30');
INSERT INTO "AOS_SYS_MODULE" VALUES ('88bc371429ce4243a49c5893ae036f6a', '0.004.002.004', '报表', null, null, '6cab8b013c314b37aec7c4567d859fc8', '0', '0', null, '1', 'AOS UI组件库', null, '40');
INSERT INTO "AOS_SYS_MODULE" VALUES ('97c8a95d0aa84d7cba2a8b536ba5326a', '0.004.002.001.002', '表单布局②', 'demo/initForm2.jhtml', null, 'f73a952eefa2406c9327da6252c4ca79', '1', '0', null, '1', '表单', null, '2');
INSERT INTO "AOS_SYS_MODULE" VALUES ('9a8e5cedcd514af2b37cf5828f509f94', '0.001.001.003', '分类科目', 'system/catalog/init.jhtml', null, '5fb994e71cb14a77891670990d7f554d', '1', '0', 'icon146.png', '1', '基础数据', null, '20');
INSERT INTO "AOS_SYS_MODULE" VALUES ('9e4cf77815dd49fbac4158c62af3197a', '0.001.001.001', '键值参数', 'system/param/init.jhtml', null, '5fb994e71cb14a77891670990d7f554d', '1', '0', 'icon79.png', '1', '基础数据', null, '1');
INSERT INTO "AOS_SYS_MODULE" VALUES ('a21b52d911bb44c2978e52bbc523de51', '0.001.004.002', '流程部署', 'workflow/procDeploy/init.jhtml', null, 'cfc4e4bd367047a29e0d72e688f860a2', '1', '0', 'modules_wizard.gif', '1', '业务流程管理', null, '10');
INSERT INTO "AOS_SYS_MODULE" VALUES ('a27532c1cc8948e5b9bd7d8ac2e30a42', '0.004.002.006.001', '布局①', null, null, 'f84a495bca10403ebe8351d4737dfc72', '1', '0', null, '1', '容器布局', null, '1');
INSERT INTO "AOS_SYS_MODULE" VALUES ('a4d2ef333e35476680786df9a89e200b', '0.004.002.004.001', '报表①', 'demo/report/initReport1.jhtml', null, '88bc371429ce4243a49c5893ae036f6a', '1', '0', null, '1', '报表', null, '1');
INSERT INTO "AOS_SYS_MODULE" VALUES ('b656d6afbbe844d0a6626d0eb590643f', '0.001.003', '组织与权限', null, null, '7a6d3674e5204937951d01544e18e3aa', '0', '1', 'folder23.png', '1', '系统管理', null, '30');
INSERT INTO "AOS_SYS_MODULE" VALUES ('ba90369eb83540bab4d9492bc17f0937', '0.001.004.005', '流程实例', 'workflow/procInst/init.jhtml', null, 'cfc4e4bd367047a29e0d72e688f860a2', '1', '0', 'icon5.png', '1', '业务流程管理', null, '30');
INSERT INTO "AOS_SYS_MODULE" VALUES ('bc3c9877c598404da7e31355a4deebad', '0.001.008.002', 'WebSQL', 'system/webSql/init.jhtml', null, '524e5f5c3e5b4cdb90611cd8b15ca684', '1', '0', 'sql.png', '1', '开发工具箱', null, '10');
INSERT INTO "AOS_SYS_MODULE" VALUES ('bf530e26480d43b08dd20e31e31274af', '0.001.003.006', '角色与授权', 'system/role/init.jhtml', null, 'b656d6afbbe844d0a6626d0eb590643f', '1', '0', 'icon134.png', '1', '组织与权限', null, '5');
INSERT INTO "AOS_SYS_MODULE" VALUES ('cfc4e4bd367047a29e0d72e688f860a2', '0.001.004', '业务流程管理', null, null, '7a6d3674e5204937951d01544e18e3aa', '0', '1', 'folder24.png', '1', '系统管理', null, '40');
INSERT INTO "AOS_SYS_MODULE" VALUES ('d452524058ff42cfb9e5146dacd0cd79', '0.001.006.002', '操作日志', null, null, '5b9a439743f141729f46a07e8e222a47', '1', '0', 'user20.png', '1', '监控与审计', null, '20');
INSERT INTO "AOS_SYS_MODULE" VALUES ('dbf75990cf784e79920caf7eb47856f6', '0.004.002.003', '表格', null, null, '6cab8b013c314b37aec7c4567d859fc8', '0', '1', null, '1', 'AOS UI组件库', null, '30');
INSERT INTO "AOS_SYS_MODULE" VALUES ('e3e403f7b94247c7827d8f280f06b64d', '0.004.002.001.003', '表单布局③', 'demo/initForm3.jhtml', null, 'f73a952eefa2406c9327da6252c4ca79', '1', '0', null, '1', '表单', null, '3');
INSERT INTO "AOS_SYS_MODULE" VALUES ('e7bb35f24a634a759cef64d28411901f', '0.004.004.001', '存储过程调用', 'demo/procedure/init.jhtml', null, '3bb16fa3935c41bebe4d3fcf3c4ebd5c', '1', '0', null, '1', '杂项', null, '10');
INSERT INTO "AOS_SYS_MODULE" VALUES ('e9de0eacf61a4aa6b1ed0c210fc209fe', '0.004.004.003', '页面组件复用', 'demo/initShare.jhtml', null, '3bb16fa3935c41bebe4d3fcf3c4ebd5c', '1', '0', null, '1', '杂项', null, '20');
INSERT INTO "AOS_SYS_MODULE" VALUES ('f107450058a2438eb6ad9bf6a4d7e967', '0.001.001.002', '字典参数', 'system/dictionary/init.jhtml', null, '5fb994e71cb14a77891670990d7f554d', '1', '0', 'icon154.png', '1', '基础数据', null, '10');
INSERT INTO "AOS_SYS_MODULE" VALUES ('f405a849f27d4ddebf7f8a2dfbf30bea', '0.001.002.001', '功能模块', 'system/module/init.jhtml', null, '0b99e9d118b54ee084d9e74bd72cdd1c', '1', '0', 'icon75.png', '1', '资源管理', null, '10');
INSERT INTO "AOS_SYS_MODULE" VALUES ('f73a952eefa2406c9327da6252c4ca79', '0.004.002.001', '表单', null, null, '6cab8b013c314b37aec7c4567d859fc8', '0', '0', null, '1', 'AOS UI组件库', null, '20');
INSERT INTO "AOS_SYS_MODULE" VALUES ('078df89c7b5b478cb38fd607805c6155', '0.004.002.001.007', '常用表单元素API', 'demo/initFormApi.jhtml', null, 'f73a952eefa2406c9327da6252c4ca79', '1', '0', null, '1', '表单', null, '20');
INSERT INTO "AOS_SYS_MODULE" VALUES ('09b24aac059f4ba58bfb30652636b543', '0.004.003.001', '综合实例①', 'demo/layout/initLayout1.jhtml', null, '33baf8c9948b47cfa54cd8d7a5e1753d', '1', '0', null, '1', '综合实例', null, '10');
INSERT INTO "AOS_SYS_MODULE" VALUES ('fd88d0de59024e4db81ead8510b6bd98', '0.001.002.003', '页面组件', 'system/page/init.jhtml', null, '0b99e9d118b54ee084d9e74bd72cdd1c', '1', '0', 'icon59.png', '1', '资源管理', null, '20');
INSERT INTO "AOS_SYS_MODULE" VALUES ('f81608054a714b60adb0b1ed574c6b6c', '0.001.003.003', '用户与授权', 'system/user/init.jhtml', null, 'b656d6afbbe844d0a6626d0eb590643f', '1', '0', 'user6.png', '1', '组织与权限', null, '4');
INSERT INTO "AOS_SYS_MODULE" VALUES ('f84a495bca10403ebe8351d4737dfc72', '0.004.002.006', '容器布局', null, null, '6cab8b013c314b37aec7c4567d859fc8', '0', '0', null, '1', 'AOS UI组件库', null, '35');

-- ----------------------------
-- Table structure for AOS_SYS_MODULE_POST
-- ----------------------------
DROP TABLE "AOS_SYS_MODULE_POST";
CREATE TABLE "AOS_SYS_MODULE_POST" (
"ID_" VARCHAR2(64 BYTE) NOT NULL ,
"POST_ID_" VARCHAR2(64 BYTE) NOT NULL ,
"MODULE_ID_" VARCHAR2(64 BYTE) NOT NULL ,
"GRANT_TYPE_" VARCHAR2(255 BYTE) NOT NULL ,
"OPERATE_TIME_" VARCHAR2(255 BYTE) NOT NULL ,
"OPERATOR_ID_" VARCHAR2(64 BYTE) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "AOS_SYS_MODULE_POST" IS '功能模块-岗位关联表';
COMMENT ON COLUMN "AOS_SYS_MODULE_POST"."ID_" IS '流水号';
COMMENT ON COLUMN "AOS_SYS_MODULE_POST"."POST_ID_" IS '岗位流水号';
COMMENT ON COLUMN "AOS_SYS_MODULE_POST"."MODULE_ID_" IS '功能模块流水号';
COMMENT ON COLUMN "AOS_SYS_MODULE_POST"."GRANT_TYPE_" IS '权限类型(岗位仅提供经办权限)';
COMMENT ON COLUMN "AOS_SYS_MODULE_POST"."OPERATE_TIME_" IS '授权时间';
COMMENT ON COLUMN "AOS_SYS_MODULE_POST"."OPERATOR_ID_" IS '授权人流水号';

-- ----------------------------
-- Records of AOS_SYS_MODULE_POST
-- ----------------------------
INSERT INTO "AOS_SYS_MODULE_POST" VALUES ('01e6f6f7fe924b8d89a846c2dfc7a05f', '60cb0e6359ea46a19a841adc46cf66cf', '715f6cf8d2ce4fa694baf2259327f6b1', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_POST" VALUES ('0e95a8527f37467fa0246abbc9de4d95', '60cb0e6359ea46a19a841adc46cf66cf', 'ba90369eb83540bab4d9492bc17f0937', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_POST" VALUES ('30cea10ca6bb4628abc80116cf748be5', '60cb0e6359ea46a19a841adc46cf66cf', 'b656d6afbbe844d0a6626d0eb590643f', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_POST" VALUES ('30f6dae98d964d3ca62017bf09d8bb40', '60cb0e6359ea46a19a841adc46cf66cf', 'bc3c9877c598404da7e31355a4deebad', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_POST" VALUES ('324b0d0319084a6a9f9bc2c9c61d384e', '60cb0e6359ea46a19a841adc46cf66cf', '1906d5a892654e2bb882851e0ea7322f', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_POST" VALUES ('51d9d42511274b7c995eaaf1705f9179', '60cb0e6359ea46a19a841adc46cf66cf', '5b9a439743f141729f46a07e8e222a47', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_POST" VALUES ('5d2a3a46566f433f8ea44c6c795d162d', '60cb0e6359ea46a19a841adc46cf66cf', '81fc0e05049e467d976ec523182421f2', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_POST" VALUES ('5d9616a615814d3fb4a07300bce4156a', '60cb0e6359ea46a19a841adc46cf66cf', 'fd88d0de59024e4db81ead8510b6bd98', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_POST" VALUES ('65bf789caf3648d1a8653b142a9e130a', '60cb0e6359ea46a19a841adc46cf66cf', 'f405a849f27d4ddebf7f8a2dfbf30bea', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_POST" VALUES ('69063560c4374ab483bbe9ced3229420', '60cb0e6359ea46a19a841adc46cf66cf', '9a8e5cedcd514af2b37cf5828f509f94', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_POST" VALUES ('6c6f89adb49f4c7eacd83cf17196222f', '60cb0e6359ea46a19a841adc46cf66cf', 'f107450058a2438eb6ad9bf6a4d7e967', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_POST" VALUES ('7e48d55cede7414fb68dd14490e9a46f', '60cb0e6359ea46a19a841adc46cf66cf', 'd452524058ff42cfb9e5146dacd0cd79', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_POST" VALUES ('8c0b0aa02b14460b825b14b40cfe3ffc', '60cb0e6359ea46a19a841adc46cf66cf', '0b99e9d118b54ee084d9e74bd72cdd1c', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_POST" VALUES ('90c0cc96bc7f4ba39b7fa3983b33e405', '60cb0e6359ea46a19a841adc46cf66cf', '1886bf699ec74f79959bdc8ca8e5371a', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_POST" VALUES ('91003499b9f24bc58988395b591d7243', '60cb0e6359ea46a19a841adc46cf66cf', 'a21b52d911bb44c2978e52bbc523de51', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_POST" VALUES ('a193381281004ea38a889c5c2eb5a0b8', '60cb0e6359ea46a19a841adc46cf66cf', '9e4cf77815dd49fbac4158c62af3197a', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_POST" VALUES ('b9cb4fe117904e9b9619ab3cc539fb36', '60cb0e6359ea46a19a841adc46cf66cf', '65320b914c18453f9ca0a84d3f8a0a7b', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_POST" VALUES ('bb44d1afa45c46ad8a8534594c759a46', '60cb0e6359ea46a19a841adc46cf66cf', '2a4c060f44d944ea926fe44522ce7b39', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_POST" VALUES ('c3574201434947fe80c393907b96fd16', '60cb0e6359ea46a19a841adc46cf66cf', 'bf530e26480d43b08dd20e31e31274af', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_POST" VALUES ('caa084c048fa4fecb581680c06879e58', '60cb0e6359ea46a19a841adc46cf66cf', '7a6d3674e5204937951d01544e18e3aa', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_POST" VALUES ('d5e18c1411344768808c275c10b66e73', '60cb0e6359ea46a19a841adc46cf66cf', 'cfc4e4bd367047a29e0d72e688f860a2', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_POST" VALUES ('dec716f33f094267801fefc5e183b57c', '60cb0e6359ea46a19a841adc46cf66cf', '5fb994e71cb14a77891670990d7f554d', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_POST" VALUES ('eaf6119a463a47c3bd8343a99593f736', '60cb0e6359ea46a19a841adc46cf66cf', '524e5f5c3e5b4cdb90611cd8b15ca684', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_POST" VALUES ('f39c2c58db8a40db9f330c8d5fac608a', '60cb0e6359ea46a19a841adc46cf66cf', 'f81608054a714b60adb0b1ed574c6b6c', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_POST" VALUES ('f3e97c7d8a0f4cb29ba68fe5a6f00e09', '60cb0e6359ea46a19a841adc46cf66cf', '619cb338b278406f8368471034d5946f', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_POST" VALUES ('f97e552d5e0c4fcc965d70866c259d50', '60cb0e6359ea46a19a841adc46cf66cf', '2790bf6cc0b54c36b56c90429c112ab2', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');

-- ----------------------------
-- Table structure for AOS_SYS_MODULE_ROLE
-- ----------------------------
DROP TABLE "AOS_SYS_MODULE_ROLE";
CREATE TABLE "AOS_SYS_MODULE_ROLE" (
"ID_" VARCHAR2(64 BYTE) NOT NULL ,
"ROLE_ID_" VARCHAR2(64 BYTE) NOT NULL ,
"MODULE_ID_" VARCHAR2(64 BYTE) NOT NULL ,
"GRANT_TYPE_" VARCHAR2(255 BYTE) NOT NULL ,
"OPERATE_TIME_" VARCHAR2(255 BYTE) NOT NULL ,
"OPERATOR_ID_" VARCHAR2(64 BYTE) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "AOS_SYS_MODULE_ROLE" IS '功能模块-角色关联表';
COMMENT ON COLUMN "AOS_SYS_MODULE_ROLE"."ID_" IS '流水号';
COMMENT ON COLUMN "AOS_SYS_MODULE_ROLE"."ROLE_ID_" IS ' 角色流水号';
COMMENT ON COLUMN "AOS_SYS_MODULE_ROLE"."MODULE_ID_" IS '功能模块流水号';
COMMENT ON COLUMN "AOS_SYS_MODULE_ROLE"."GRANT_TYPE_" IS '权限类型';
COMMENT ON COLUMN "AOS_SYS_MODULE_ROLE"."OPERATE_TIME_" IS '授权时间';
COMMENT ON COLUMN "AOS_SYS_MODULE_ROLE"."OPERATOR_ID_" IS '授权人流水号';

-- ----------------------------
-- Records of AOS_SYS_MODULE_ROLE
-- ----------------------------
INSERT INTO "AOS_SYS_MODULE_ROLE" VALUES ('1939747179be463fb49c9c94c15cb5ae', '84f923b5e334498494eda38d8e86ef80', 'bf530e26480d43b08dd20e31e31274af', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_ROLE" VALUES ('3e5cbb7d49d94be7b6a2a37c5553a041', '84f923b5e334498494eda38d8e86ef80', 'fd88d0de59024e4db81ead8510b6bd98', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_ROLE" VALUES ('4697b53bc7e04d7cb2267d44e4f9b438', '84f923b5e334498494eda38d8e86ef80', '0b99e9d118b54ee084d9e74bd72cdd1c', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_ROLE" VALUES ('0b48f8f5677d4b4186e30d3434105847', '84f923b5e334498494eda38d8e86ef80', 'cfc4e4bd367047a29e0d72e688f860a2', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_ROLE" VALUES ('1186e6575fac43fe98640eca6e3c03b6', '84f923b5e334498494eda38d8e86ef80', '5fb994e71cb14a77891670990d7f554d', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_ROLE" VALUES ('5785a83aea394a1b9d5a66c85a377f2f', '84f923b5e334498494eda38d8e86ef80', '1906d5a892654e2bb882851e0ea7322f', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_ROLE" VALUES ('5b864436a0004966b711e75e05cabb47', '84f923b5e334498494eda38d8e86ef80', 'ba90369eb83540bab4d9492bc17f0937', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_ROLE" VALUES ('682b98882cd6488287e6863caa31ade4', '84f923b5e334498494eda38d8e86ef80', 'f107450058a2438eb6ad9bf6a4d7e967', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_ROLE" VALUES ('6f12960924884a56b49d3374fe1d0484', '84f923b5e334498494eda38d8e86ef80', '715f6cf8d2ce4fa694baf2259327f6b1', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_ROLE" VALUES ('700d87c2b3fc4e668a90bff6534993c4', '84f923b5e334498494eda38d8e86ef80', '2a4c060f44d944ea926fe44522ce7b39', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_ROLE" VALUES ('7c6fe595d4ba4bcb840952a6b8818e87', '84f923b5e334498494eda38d8e86ef80', '5b9a439743f141729f46a07e8e222a47', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_ROLE" VALUES ('814a381cf6284a42a9ef6ba4c4cf5390', '84f923b5e334498494eda38d8e86ef80', '9e4cf77815dd49fbac4158c62af3197a', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_ROLE" VALUES ('9fc58fccb59d4ef4add0bea95bde2f34', '84f923b5e334498494eda38d8e86ef80', 'f405a849f27d4ddebf7f8a2dfbf30bea', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_ROLE" VALUES ('a6fd89e9cd1b425491fd905d1ffacac8', '84f923b5e334498494eda38d8e86ef80', 'd452524058ff42cfb9e5146dacd0cd79', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_ROLE" VALUES ('a776b3fb9e944c0a89593a17cf9e8677', '84f923b5e334498494eda38d8e86ef80', '81fc0e05049e467d976ec523182421f2', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_ROLE" VALUES ('a864a8846d35415cb881f1f466b51e8d', '84f923b5e334498494eda38d8e86ef80', 'bc3c9877c598404da7e31355a4deebad', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_ROLE" VALUES ('b651fbaebbdf47ad9867aca4a39afb22', '84f923b5e334498494eda38d8e86ef80', '2790bf6cc0b54c36b56c90429c112ab2', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_ROLE" VALUES ('bc209a1defea47778a271b50f5c326b1', '84f923b5e334498494eda38d8e86ef80', '65320b914c18453f9ca0a84d3f8a0a7b', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_ROLE" VALUES ('bdf5f465e79a4dedb51fab2745c2ccc3', '84f923b5e334498494eda38d8e86ef80', 'a21b52d911bb44c2978e52bbc523de51', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_ROLE" VALUES ('c797efc13e314e43b08837cfc268cea9', '84f923b5e334498494eda38d8e86ef80', 'f81608054a714b60adb0b1ed574c6b6c', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_ROLE" VALUES ('c9407844cb9d4ec5b4df195cbee00ab0', '84f923b5e334498494eda38d8e86ef80', '7a6d3674e5204937951d01544e18e3aa', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_ROLE" VALUES ('caf19432391e46c8894455b9bd908a11', '84f923b5e334498494eda38d8e86ef80', '1886bf699ec74f79959bdc8ca8e5371a', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_ROLE" VALUES ('d22696d414434088bd8f6b47a9953f01', '84f923b5e334498494eda38d8e86ef80', '524e5f5c3e5b4cdb90611cd8b15ca684', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_ROLE" VALUES ('e70d4684d4bd489a93e44a2505cfb15c', '84f923b5e334498494eda38d8e86ef80', 'b656d6afbbe844d0a6626d0eb590643f', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_ROLE" VALUES ('e753111f16e443758e74637066dd845b', '84f923b5e334498494eda38d8e86ef80', '9a8e5cedcd514af2b37cf5828f509f94', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO "AOS_SYS_MODULE_ROLE" VALUES ('ecec404ec2a5449aafa701c3ca50cb2b', '84f923b5e334498494eda38d8e86ef80', '619cb338b278406f8368471034d5946f', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');

-- ----------------------------
-- Table structure for AOS_SYS_MODULE_USER
-- ----------------------------
DROP TABLE "AOS_SYS_MODULE_USER";
CREATE TABLE "AOS_SYS_MODULE_USER" (
"ID_" VARCHAR2(64 BYTE) NOT NULL ,
"USER_ID_" VARCHAR2(64 BYTE) NOT NULL ,
"MODULE_ID_" VARCHAR2(64 BYTE) NOT NULL ,
"GRANT_TYPE_" VARCHAR2(255 BYTE) NOT NULL ,
"OPERATE_TIME_" VARCHAR2(255 BYTE) NOT NULL ,
"OPERATOR_ID_" VARCHAR2(64 BYTE) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "AOS_SYS_MODULE_USER" IS '功能模块-用户关联表';
COMMENT ON COLUMN "AOS_SYS_MODULE_USER"."ID_" IS '流水号';
COMMENT ON COLUMN "AOS_SYS_MODULE_USER"."USER_ID_" IS ' 用户流水号';
COMMENT ON COLUMN "AOS_SYS_MODULE_USER"."MODULE_ID_" IS '功能模块流水号';
COMMENT ON COLUMN "AOS_SYS_MODULE_USER"."GRANT_TYPE_" IS '权限类型';
COMMENT ON COLUMN "AOS_SYS_MODULE_USER"."OPERATE_TIME_" IS '授权时间';
COMMENT ON COLUMN "AOS_SYS_MODULE_USER"."OPERATOR_ID_" IS '授权人';

-- ----------------------------
-- Records of AOS_SYS_MODULE_USER
-- ----------------------------

-- ----------------------------
-- Table structure for AOS_SYS_MODULE_USER_NAV
-- ----------------------------
DROP TABLE "AOS_SYS_MODULE_USER_NAV";
CREATE TABLE "AOS_SYS_MODULE_USER_NAV" (
"ID_" VARCHAR2(64 BYTE) NOT NULL ,
"MODULE_ID_" VARCHAR2(64 BYTE) NOT NULL ,
"USER_ID_" VARCHAR2(64 BYTE) NOT NULL ,
"NAV_ICON_" VARCHAR2(255 BYTE) NULL ,
"TYPE_" VARCHAR2(255 BYTE) NOT NULL ,
"SORT_NO_" NUMBER(10) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "AOS_SYS_MODULE_USER_NAV" IS '功能模块-用户关联表(浮动导航|快捷导航)';
COMMENT ON COLUMN "AOS_SYS_MODULE_USER_NAV"."ID_" IS '流水号';
COMMENT ON COLUMN "AOS_SYS_MODULE_USER_NAV"."MODULE_ID_" IS '功能模块流水号';
COMMENT ON COLUMN "AOS_SYS_MODULE_USER_NAV"."USER_ID_" IS '人员流水号';
COMMENT ON COLUMN "AOS_SYS_MODULE_USER_NAV"."NAV_ICON_" IS '浮动导航图标文件';
COMMENT ON COLUMN "AOS_SYS_MODULE_USER_NAV"."TYPE_" IS '导航类型';
COMMENT ON COLUMN "AOS_SYS_MODULE_USER_NAV"."SORT_NO_" IS '排序号';

-- ----------------------------
-- Records of AOS_SYS_MODULE_USER_NAV
-- ----------------------------
INSERT INTO "AOS_SYS_MODULE_USER_NAV" VALUES ('13e7e53c880a4eaebfdfc111ff0f234a', 'f405a849f27d4ddebf7f8a2dfbf30bea', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO "AOS_SYS_MODULE_USER_NAV" VALUES ('1771642b67a24ebc8925d05f9d6f0a99', 'bf530e26480d43b08dd20e31e31274af', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO "AOS_SYS_MODULE_USER_NAV" VALUES ('27496d1c07fb4de69e8ec80ca9d9b1b4', 'f81608054a714b60adb0b1ed574c6b6c', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO "AOS_SYS_MODULE_USER_NAV" VALUES ('27a1acfe21c54302bacef830362e9201', '1906d5a892654e2bb882851e0ea7322f', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO "AOS_SYS_MODULE_USER_NAV" VALUES ('3037dcb30d544c129c38c0ec0512f152', '65320b914c18453f9ca0a84d3f8a0a7b', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO "AOS_SYS_MODULE_USER_NAV" VALUES ('35cdbcbf1d164430ae5f870d9ca9c798', '5fb994e71cb14a77891670990d7f554d', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO "AOS_SYS_MODULE_USER_NAV" VALUES ('3e95a408ab4842a896fe28e22263770e', '2790bf6cc0b54c36b56c90429c112ab2', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO "AOS_SYS_MODULE_USER_NAV" VALUES ('4f6389bf9bbc41a785bafd3167d1c83f', 'b656d6afbbe844d0a6626d0eb590643f', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO "AOS_SYS_MODULE_USER_NAV" VALUES ('50f22340f1244e969e0150c5cb709d89', '9a8e5cedcd514af2b37cf5828f509f94', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO "AOS_SYS_MODULE_USER_NAV" VALUES ('5205631b91ad4abb877f9bf376401137', '0b99e9d118b54ee084d9e74bd72cdd1c', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO "AOS_SYS_MODULE_USER_NAV" VALUES ('6e2c4f1bbc794acbbbf30dd82b82e548', 'cfc4e4bd367047a29e0d72e688f860a2', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO "AOS_SYS_MODULE_USER_NAV" VALUES ('7c34dd645a584cf7bc01f49c491e4a6d', '7a6d3674e5204937951d01544e18e3aa', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO "AOS_SYS_MODULE_USER_NAV" VALUES ('87a378d1f1654e70a673e2492cf4b280', 'fd88d0de59024e4db81ead8510b6bd98', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO "AOS_SYS_MODULE_USER_NAV" VALUES ('91fd66009c774778bb8fe43afff6fc1a', '619cb338b278406f8368471034d5946f', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO "AOS_SYS_MODULE_USER_NAV" VALUES ('ab00d2b56d3c4e4a95c234b1624be55e', '81fc0e05049e467d976ec523182421f2', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO "AOS_SYS_MODULE_USER_NAV" VALUES ('d70a61cc8117438b8fa1d04df9b69ed1', '524e5f5c3e5b4cdb90611cd8b15ca684', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO "AOS_SYS_MODULE_USER_NAV" VALUES ('dcd3e9606ecb47d9970f6e25b538ca46', '9e4cf77815dd49fbac4158c62af3197a', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO "AOS_SYS_MODULE_USER_NAV" VALUES ('e09214ed6b5a4d9ea822d22b8290d459', 'f107450058a2438eb6ad9bf6a4d7e967', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO "AOS_SYS_MODULE_USER_NAV" VALUES ('e1620cfebcc54f9b964c4ce4faf51ea0', 'a21b52d911bb44c2978e52bbc523de51', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO "AOS_SYS_MODULE_USER_NAV" VALUES ('e855c201b896442d8099d815b0ae15f4', 'd452524058ff42cfb9e5146dacd0cd79', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO "AOS_SYS_MODULE_USER_NAV" VALUES ('f0072ce1b6884ae8af69d4b10c008e85', '5b9a439743f141729f46a07e8e222a47', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO "AOS_SYS_MODULE_USER_NAV" VALUES ('f3f0dfc36d7d440385ed86e33ee40fd9', '2a4c060f44d944ea926fe44522ce7b39', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO "AOS_SYS_MODULE_USER_NAV" VALUES ('f9651f4622c14612a9eb510eae8ef4e9', 'ba90369eb83540bab4d9492bc17f0937', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO "AOS_SYS_MODULE_USER_NAV" VALUES ('fdbdb721c58740ecb54f7e047bdbacdc', 'bc3c9877c598404da7e31355a4deebad', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO "AOS_SYS_MODULE_USER_NAV" VALUES ('0105d9c95caf420aa5bd544d83e87c77', '1886bf699ec74f79959bdc8ca8e5371a', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO "AOS_SYS_MODULE_USER_NAV" VALUES ('0ce2d5658fb64a4797ff75d9f459ef32', '715f6cf8d2ce4fa694baf2259327f6b1', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);

-- ----------------------------
-- Table structure for AOS_SYS_ORG
-- ----------------------------
DROP TABLE "AOS_SYS_ORG";
CREATE TABLE "AOS_SYS_ORG" (
"ID_" VARCHAR2(64 BYTE) NOT NULL ,
"CASCADE_ID_" VARCHAR2(255 BYTE) NOT NULL ,
"NAME_" VARCHAR2(255 BYTE) NOT NULL ,
"HOTKEY_" VARCHAR2(255 BYTE) NULL ,
"PARENT_ID_" VARCHAR2(64 BYTE) NOT NULL ,
"PAREANT_NAME_" VARCHAR2(255 BYTE) NULL ,
"IS_LEAF_" VARCHAR2(255 BYTE) DEFAULT 1  NOT NULL ,
"IS_AUTO_EXPAND_" VARCHAR2(255 BYTE) DEFAULT 0  NOT NULL ,
"ICON_NAME_" VARCHAR2(255 BYTE) NULL ,
"STATUS_" VARCHAR2(255 BYTE) DEFAULT 1  NOT NULL ,
"TYPE_" VARCHAR2(255 BYTE) NOT NULL ,
"BIZ_CODE_" VARCHAR2(255 BYTE) NULL ,
"CUSTOM_CODE_" VARCHAR2(4000 BYTE) NULL ,
"CREATE_TIME_" VARCHAR2(255 BYTE) NOT NULL ,
"CREATER_ID_" VARCHAR2(64 BYTE) NULL ,
"SORT_NO_" NUMBER(10) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "AOS_SYS_ORG" IS '组织表';
COMMENT ON COLUMN "AOS_SYS_ORG"."ID_" IS '流水号';
COMMENT ON COLUMN "AOS_SYS_ORG"."CASCADE_ID_" IS '节点语义ID';
COMMENT ON COLUMN "AOS_SYS_ORG"."NAME_" IS '组织名称';
COMMENT ON COLUMN "AOS_SYS_ORG"."HOTKEY_" IS '热键';
COMMENT ON COLUMN "AOS_SYS_ORG"."PARENT_ID_" IS '父节点流水号';
COMMENT ON COLUMN "AOS_SYS_ORG"."PAREANT_NAME_" IS '父节点名称';
COMMENT ON COLUMN "AOS_SYS_ORG"."IS_LEAF_" IS '是否叶子节点';
COMMENT ON COLUMN "AOS_SYS_ORG"."IS_AUTO_EXPAND_" IS '是否自动展开';
COMMENT ON COLUMN "AOS_SYS_ORG"."ICON_NAME_" IS '节点图标文件名称';
COMMENT ON COLUMN "AOS_SYS_ORG"."STATUS_" IS '当前状态';
COMMENT ON COLUMN "AOS_SYS_ORG"."TYPE_" IS '组织类型';
COMMENT ON COLUMN "AOS_SYS_ORG"."BIZ_CODE_" IS '业务对照码';
COMMENT ON COLUMN "AOS_SYS_ORG"."CUSTOM_CODE_" IS '自定义扩展码';
COMMENT ON COLUMN "AOS_SYS_ORG"."CREATE_TIME_" IS '创建时间';
COMMENT ON COLUMN "AOS_SYS_ORG"."CREATER_ID_" IS '创建人ID';
COMMENT ON COLUMN "AOS_SYS_ORG"."SORT_NO_" IS '排序号';

-- ----------------------------
-- Records of AOS_SYS_ORG
-- ----------------------------
INSERT INTO "AOS_SYS_ORG" VALUES ('0965ef0ffd294a838f53012e3ef9bfd0', '0.006.001', '上海分行', null, 'bd48c11cfd6f48e196c5fa399c410329', '投资银行部', '1', '0', null, '1', '1', null, null, '2016-02-01 23:56:02', 'fa04db9dd2f54d61b0c8202a25de2dc6', '1');
INSERT INTO "AOS_SYS_ORG" VALUES ('1e1441c6be2b4ffdb3f73759cb1e207b', '0.002', '会计结算部', null, '63cf387a243d4d9799367d773b853346', '中国嘉靖银行', '1', '0', null, '1', '1', null, null, '2016-02-01 23:53:10', 'fa04db9dd2f54d61b0c8202a25de2dc6', '10');
INSERT INTO "AOS_SYS_ORG" VALUES ('4be918af97ee491aa71378d065a8c7f7', '0.006.002', '昆明分行', null, 'bd48c11cfd6f48e196c5fa399c410329', '投资银行部', '1', '0', null, '1', '1', null, null, '2016-02-01 23:56:15', 'fa04db9dd2f54d61b0c8202a25de2dc6', '10');
INSERT INTO "AOS_SYS_ORG" VALUES ('63cf387a243d4d9799367d773b853346', '0', '中国嘉靖银行', null, 'p', 'root', '0', '1', 'home.png', '1', '1', null, null, '2012-01-01 12:12:12', 'fa04db9dd2f54d61b0c8202a25de2dc6', '0');
INSERT INTO "AOS_SYS_ORG" VALUES ('b2fa97f8bed34eee86201f01fa786ed4', '0.001', '信息技术部', null, '63cf387a243d4d9799367d773b853346', '中国嘉靖银行', '1', '0', null, '1', '1', null, null, '2016-02-01 20:53:34', 'fa04db9dd2f54d61b0c8202a25de2dc6', '1');
INSERT INTO "AOS_SYS_ORG" VALUES ('bd48c11cfd6f48e196c5fa399c410329', '0.006', '投资银行部', null, '63cf387a243d4d9799367d773b853346', '中国嘉靖银行', '0', '1', null, '1', '1', null, null, '2016-02-01 23:55:46', 'fa04db9dd2f54d61b0c8202a25de2dc6', '50');
INSERT INTO "AOS_SYS_ORG" VALUES ('d4392c4faf024a7e8a2c2607d77ab2fa', '0.005', '合规管理部', null, '63cf387a243d4d9799367d773b853346', '中国嘉靖银行', '1', '0', null, '1', '1', null, null, '2016-02-01 23:54:44', 'fa04db9dd2f54d61b0c8202a25de2dc6', '40');
INSERT INTO "AOS_SYS_ORG" VALUES ('e8b6092436054f5893b49ade58635105', '0.004', '风险管理部', null, '63cf387a243d4d9799367d773b853346', '中国嘉靖银行', '1', '0', null, '1', '1', null, null, '2016-02-01 23:53:58', 'fa04db9dd2f54d61b0c8202a25de2dc6', '30');

-- ----------------------------
-- Table structure for AOS_SYS_PAGE
-- ----------------------------
DROP TABLE "AOS_SYS_PAGE";
CREATE TABLE "AOS_SYS_PAGE" (
"ID_" VARCHAR2(64 BYTE) NOT NULL ,
"MODULE_ID_" VARCHAR2(64 BYTE) NOT NULL ,
"NAME_" VARCHAR2(255 BYTE) NULL ,
"URL_" VARCHAR2(255 BYTE) NULL ,
"TYPE_" VARCHAR2(255 BYTE) NOT NULL ,
"ENABLED_" VARCHAR2(255 BYTE) NOT NULL ,
"IS_DEFAULT_" VARCHAR2(255 BYTE) DEFAULT 0  NOT NULL ,
"ICON_" VARCHAR2(255 BYTE) NULL ,
"ICON_BIG_" VARCHAR2(255 BYTE) NULL ,
"VECTOR_" VARCHAR2(255 BYTE) NULL ,
"SORT_NO_" NUMBER(10) DEFAULT 0  NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "AOS_SYS_PAGE" IS '模块页面表';
COMMENT ON COLUMN "AOS_SYS_PAGE"."ID_" IS '流水号';
COMMENT ON COLUMN "AOS_SYS_PAGE"."MODULE_ID_" IS '功能模块ID';
COMMENT ON COLUMN "AOS_SYS_PAGE"."NAME_" IS '名称';
COMMENT ON COLUMN "AOS_SYS_PAGE"."URL_" IS '页面URL';
COMMENT ON COLUMN "AOS_SYS_PAGE"."TYPE_" IS '类型';
COMMENT ON COLUMN "AOS_SYS_PAGE"."ENABLED_" IS '使能状态';
COMMENT ON COLUMN "AOS_SYS_PAGE"."IS_DEFAULT_" IS '是否缺省子页面';
COMMENT ON COLUMN "AOS_SYS_PAGE"."ICON_" IS '小图标';
COMMENT ON COLUMN "AOS_SYS_PAGE"."ICON_BIG_" IS '大图标';
COMMENT ON COLUMN "AOS_SYS_PAGE"."VECTOR_" IS '矢量图标';
COMMENT ON COLUMN "AOS_SYS_PAGE"."SORT_NO_" IS '排序号';

-- ----------------------------
-- Records of AOS_SYS_PAGE
-- ----------------------------
INSERT INTO "AOS_SYS_PAGE" VALUES ('bcb82c68976d4527a8f1c8bdbb8b4a04', '1906d5a892654e2bb882851e0ea7322f', '矢量图标', 'initIconList.jhtml?type_=3', '2', '1', '0', 'vector.png', null, null, '4');
INSERT INTO "AOS_SYS_PAGE" VALUES ('c47935773e9443dd9a6ceecb69982ac2', '4d3cfce7b9b146d2bc8482ec477517aa', '我的快捷菜单', 'initMyNav.jhtml', '2', '1', '0', 'org.png', null, null, '4');
INSERT INTO "AOS_SYS_PAGE" VALUES ('c8548f73784d42989363712729a320e0', '1906d5a892654e2bb882851e0ea7322f', '分隔符', null, '4', '1', '0', null, null, null, '3');
INSERT INTO "AOS_SYS_PAGE" VALUES ('cacc4fcdc5454f1ebab63b00e4bf56cc', '4d3cfce7b9b146d2bc8482ec477517aa', '我的个人设置', 'initMyInfo.jhtml', '2', '1', '1', 'icon_19.png', null, null, '1');
INSERT INTO "AOS_SYS_PAGE" VALUES ('d45aefac856942d484441481cd142212', '4d3cfce7b9b146d2bc8482ec477517aa', '我的操作日志', null, '2', '1', '0', 'icon75.png', null, null, '6');
INSERT INTO "AOS_SYS_PAGE" VALUES ('dd3d77605b824ca18357222128aebc5b', '4d3cfce7b9b146d2bc8482ec477517aa', '分割符', null, '4', '1', '0', null, null, null, '5');
INSERT INTO "AOS_SYS_PAGE" VALUES ('19041a2cb7264838b48288ce9b0b8e80', '1906d5a892654e2bb882851e0ea7322f', '大图标[64X64]', 'initIconList.jhtml?type_=2', '2', '1', '0', 'picture.png', null, null, '2');
INSERT INTO "AOS_SYS_PAGE" VALUES ('9e30077a6bb043cc8db8c8d4b5fa5c91', '1906d5a892654e2bb882851e0ea7322f', '小图标[16X16]', 'initIconList.jhtml?type_=1', '2', '1', '1', 'pictures.png', null, null, '1');

-- ----------------------------
-- Table structure for AOS_SYS_PAGE_EL
-- ----------------------------
DROP TABLE "AOS_SYS_PAGE_EL";
CREATE TABLE "AOS_SYS_PAGE_EL" (
"ID_" VARCHAR2(64 BYTE) NOT NULL ,
"DOM_ID_" VARCHAR2(255 BYTE) NOT NULL ,
"NAME_" VARCHAR2(255 BYTE) NOT NULL ,
"TYPE_" VARCHAR2(255 BYTE) NOT NULL ,
"MODULE_ID_" VARCHAR2(64 BYTE) NOT NULL ,
"PAGE_ID_" VARCHAR2(64 BYTE) NOT NULL ,
"REMARK_" VARCHAR2(4000 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "AOS_SYS_PAGE_EL" IS '页面元素表';
COMMENT ON COLUMN "AOS_SYS_PAGE_EL"."ID_" IS '流水号';
COMMENT ON COLUMN "AOS_SYS_PAGE_EL"."DOM_ID_" IS 'DOM ID';
COMMENT ON COLUMN "AOS_SYS_PAGE_EL"."NAME_" IS '名称';
COMMENT ON COLUMN "AOS_SYS_PAGE_EL"."TYPE_" IS '类型';
COMMENT ON COLUMN "AOS_SYS_PAGE_EL"."MODULE_ID_" IS '所属功能模块流水号';
COMMENT ON COLUMN "AOS_SYS_PAGE_EL"."PAGE_ID_" IS '页面ID';
COMMENT ON COLUMN "AOS_SYS_PAGE_EL"."REMARK_" IS '备注';

-- ----------------------------
-- Records of AOS_SYS_PAGE_EL
-- ----------------------------

-- ----------------------------
-- Table structure for AOS_SYS_PAGE_EL_GRANT
-- ----------------------------
DROP TABLE "AOS_SYS_PAGE_EL_GRANT";
CREATE TABLE "AOS_SYS_PAGE_EL_GRANT" (
"ID_" VARCHAR2(64 BYTE) NOT NULL ,
"EL_ID_" VARCHAR2(64 BYTE) NOT NULL ,
"USER_ID_" VARCHAR2(64 BYTE) NULL ,
"ROLE_ID_" VARCHAR2(64 BYTE) NULL ,
"POST_ID_" VARCHAR2(64 BYTE) NULL ,
"GRANT_TYPE_" VARCHAR2(255 BYTE) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "AOS_SYS_PAGE_EL_GRANT" IS '页面元素授权表';
COMMENT ON COLUMN "AOS_SYS_PAGE_EL_GRANT"."ID_" IS '流水号';
COMMENT ON COLUMN "AOS_SYS_PAGE_EL_GRANT"."EL_ID_" IS '页面元素流水号';
COMMENT ON COLUMN "AOS_SYS_PAGE_EL_GRANT"."USER_ID_" IS '用户流水号';
COMMENT ON COLUMN "AOS_SYS_PAGE_EL_GRANT"."ROLE_ID_" IS '角色流水号';
COMMENT ON COLUMN "AOS_SYS_PAGE_EL_GRANT"."POST_ID_" IS '岗位流水号';
COMMENT ON COLUMN "AOS_SYS_PAGE_EL_GRANT"."GRANT_TYPE_" IS '权限类型';

-- ----------------------------
-- Records of AOS_SYS_PAGE_EL_GRANT
-- ----------------------------

-- ----------------------------
-- Table structure for AOS_SYS_PARAM
-- ----------------------------
DROP TABLE "AOS_SYS_PARAM";
CREATE TABLE "AOS_SYS_PARAM" (
"ID_" VARCHAR2(64 BYTE) NOT NULL ,
"KEY_" VARCHAR2(255 BYTE) NOT NULL ,
"VALUE_" VARCHAR2(255 BYTE) NULL ,
"CATALOG_ID_" VARCHAR2(64 BYTE) NOT NULL ,
"CATALOG_CASCADE_ID_" VARCHAR2(255 BYTE) NOT NULL ,
"NAME_" VARCHAR2(255 BYTE) NOT NULL ,
"IS_OVERWRITE_" VARCHAR2(255 BYTE) NOT NULL ,
"OVERWRITE_FIELD_" VARCHAR2(255 BYTE) NULL ,
"REMARK_" VARCHAR2(4000 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "AOS_SYS_PARAM" IS '参数表';
COMMENT ON COLUMN "AOS_SYS_PARAM"."ID_" IS '流水号';
COMMENT ON COLUMN "AOS_SYS_PARAM"."KEY_" IS '参数键';
COMMENT ON COLUMN "AOS_SYS_PARAM"."VALUE_" IS '参数值';
COMMENT ON COLUMN "AOS_SYS_PARAM"."CATALOG_ID_" IS '所属分类流水号';
COMMENT ON COLUMN "AOS_SYS_PARAM"."CATALOG_CASCADE_ID_" IS '所属分类节点语义ID';
COMMENT ON COLUMN "AOS_SYS_PARAM"."NAME_" IS '参数名称';
COMMENT ON COLUMN "AOS_SYS_PARAM"."IS_OVERWRITE_" IS '是否可覆盖';
COMMENT ON COLUMN "AOS_SYS_PARAM"."OVERWRITE_FIELD_" IS '覆盖来源字段';
COMMENT ON COLUMN "AOS_SYS_PARAM"."REMARK_" IS '备注';

-- ----------------------------
-- Records of AOS_SYS_PARAM
-- ----------------------------
INSERT INTO "AOS_SYS_PARAM" VALUES ('1bd1c0a5849d4a30b3f1eb2761b2865d', 'show_login_win_head_', 'true', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '是否显示登录窗口标题栏', '0', null, '是否显示登录窗口标题栏(Ext登录风格)。缺省值：false。可选值：true|false。');
INSERT INTO "AOS_SYS_PARAM" VALUES ('1cc1a1bee27f44389e7e64a89d9ccc76', 'msgtarget_', 'qtip', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '表单校验消息提示方式', '0', null, '可选值必须是下列值之一 (1)、qtip 当用户鼠标悬停在该域之上时显示包含了消息的迅速提示。(2)、title 显示消息以浏览器默认的title属性弹出。 (3)、under 在域下方添加一块包含了错误消息的div。(4)、side 添加一个错误图标在域的右边，鼠标悬停上面时弹出显示消息。');
INSERT INTO "AOS_SYS_PARAM" VALUES ('1f2adf3aa726447e9728a3f67b718b41', 'vercode_show_', '1', '6f94ef4ac17d4d098f91f0a4579f8591', '0.001.002.001', '验证码开关', '0', null, '是否在登录页面显示验证码及后台验证码验证。可选值：0(否) | 1(是)。');
INSERT INTO "AOS_SYS_PARAM" VALUES ('2e45751d623f48389e12bfb7c3891597', 'treenode_cursor_', 'pointer', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '树节点鼠标光标样式', '0', null, '缺省值：pointer。可选值：任何符合Css的cursor属性定义的值。default | pointer | auto等。');
INSERT INTO "AOS_SYS_PARAM" VALUES ('376a372433634af4b6d2d558f1959f5b', 'role_grant_mode_', '1', '01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', '角色授权模式', '0', null, '角色授权模式(角色可见度)。可选值：1|2。1：可见当前管理员创建的角色和当前管理员所属组织的其他管理员创建的角色。2：可见当前管理员创建的角色和当前管理员所属组织及其下级子孙组织的其他管理员创建的角色。');
INSERT INTO "AOS_SYS_PARAM" VALUES ('3ff54d336e57461d8cd708a8bad8bc36', 'combobox_emptytext', '请选择...', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '下拉选择框的缺省提示信息', '0', null, null);
INSERT INTO "AOS_SYS_PARAM" VALUES ('43fb125bed224cbbaf2390df1041c3b0', 'dev_account_', 'root', '01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', '开发者登录帐号', '0', null, '登录页面开发者按钮登录帐号。可以配置为任何一个存在的帐号。');
INSERT INTO "AOS_SYS_PARAM" VALUES ('47bd798e93314882af7244ba1ae9fbc8', 'vercode_characters_', 'abcdetx2345678', '6f94ef4ac17d4d098f91f0a4579f8591', '0.001.002.001', '验证码待选字符集', '0', null, '验证码待选字符集。');
INSERT INTO "AOS_SYS_PARAM" VALUES ('53267cbf8e9f4fc490798054fbe85c7e', 'copyright_', '2008-2015 OSWorks', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '版权信息', '0', null, '版权信息');
INSERT INTO "AOS_SYS_PARAM" VALUES ('58099059c3004213ae0977d4ed5551f5', 'prevent_rightclick_', 'false', '01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', '全局右键', '0', null, '阻止浏览器缺省鼠标右键事件。可选值：true|false。缺省值：true。');
INSERT INTO "AOS_SYS_PARAM" VALUES ('6032c7e953994a718f6072c956906538', 'app_title_', 'AOS : JavaEE应用基础平台', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '首页浏览器标题内容', '0', null, '首页浏览器标题内容');
INSERT INTO "AOS_SYS_PARAM" VALUES ('714d370fa7f54b01ae9a006806c60135', 'is_show_top_nav_', 'true', 'a072411787f545edb7e7c3c23fa6c0ff', '0.001.002.004', '水平导航条', '1', 'is_show_top_nav_', '是否显示水平导航条。(只有在导航模式为1的情况，此设置才有效,导航模式为2，则水平导航条不会消失)。可选值：true| false。');
INSERT INTO "AOS_SYS_PARAM" VALUES ('7290d8299cba41dc9e23323a0db22a95', 'json_format', '1', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', 'JSON输出模式', '0', null, ' json输出模式。0：格式化输出模式；1：压缩模式。');
INSERT INTO "AOS_SYS_PARAM" VALUES ('74d65234606c4f448eb06d6a07a6c138', 'user_head_catalog_id_', '613', '01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', '用户头像流文件分类ID', '0', null, '用户头像流文件分类ID，分类科目中的用户头像分类ID。用户上传文件时使用。');
INSERT INTO "AOS_SYS_PARAM" VALUES ('757f555c0d734539baa70e8a1788cc62', 'is_show_statusbar_', 'true', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '是否显示主界面状态栏', '0', null, '是否显示主界面状态栏。可选值：true|false。');
INSERT INTO "AOS_SYS_PARAM" VALUES ('7882ac5560ef4a04993279dfc24b6f23', 'user_obj_del_mode_', 'update', '01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', '用户对象删除模式', '0', null, '物理删除：delete；逻辑删除：update。');
INSERT INTO "AOS_SYS_PARAM" VALUES ('7bc3899d2fc24e4b804e6f763c3d6b36', 'dev_account_login_', '1', '01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', '开发者登录帐号开关', '0', null, '是否启用开发者登录帐号功能,如启用则在登录界面会出现[开发者]按钮。可选值：1 | 0。提示：系统若在生产模式下运行，则此配置忽略，自动关闭开发者登录功能。');
INSERT INTO "AOS_SYS_PARAM" VALUES ('7e4d320f454843739f40476dcbcdc91a', 'run_mode_', '0', '01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', '运行模式', '0', null, '0：开发模式；1：生产模式；2：在线体验模式');
INSERT INTO "AOS_SYS_PARAM" VALUES ('873c2cb1dde54b308211e8a2bc6edbb5', 'theme_', 'classic', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '系统主题风格', '1', 'theme_', '可选值：classic。缺省值：classic。');
INSERT INTO "AOS_SYS_PARAM" VALUES ('9cb03933f61e4c68a58e50873ac38fbd', 'page_load_msg_', '正在拼命加载页面, 请稍等...', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '页面加载等待提示信息', '0', null, null);
INSERT INTO "AOS_SYS_PARAM" VALUES ('a19b559ab8804f5887867df4151ad631', 'page_size_', '50', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '分页大小', '0', null, '缺省的分页大小。JSP页面的属性设置会覆盖这个配置。');
INSERT INTO "AOS_SYS_PARAM" VALUES ('a1ad9c90f524467180bceecd1f02b8b8', 'nav_mode_', '1', 'a072411787f545edb7e7c3c23fa6c0ff', '0.001.002.004', '导航模式', '1', 'nav_mode_', '可选值，1：水平导航按钮和垂直导航的卡片属于统一层级；2：水平导航按钮和垂直导航的卡片有上下级级联导航关系。(当前模式2未实现)');
INSERT INTO "AOS_SYS_PARAM" VALUES ('a843396066db4e77a7b9ed7ae4cdda37', 'login_page_', 'login.ext.jsp', '01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', '登录页面', '0', null, 'Ext原生风格的登录界面');
INSERT INTO "AOS_SYS_PARAM" VALUES ('ad9cb685144c4e36b19b31e53190221a', 'skin_', 'blue', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '系统缺省皮肤', '1', 'skin_', '可选值：blue|gray|neptune|aos。缺省值：blue。');
INSERT INTO "AOS_SYS_PARAM" VALUES ('b07b8e2cc1284d14b9e680a5cac0722a', 'app_name_', 'AOS : JavaEE应用基础平台', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '应用系统名称', '0', null, '应用系统名称');
INSERT INTO "AOS_SYS_PARAM" VALUES ('be82f58309a24ee397d3a24631e48405', 'vercode_length_', '4', '6f94ef4ac17d4d098f91f0a4579f8591', '0.001.002.001', '验证码长度', '0', null, '验证码长度');
INSERT INTO "AOS_SYS_PARAM" VALUES ('bf26e19236654718a6aa369f3e4b4bf7', 'coder_project_rootpath_', '0', '01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', '代码生成器使用的工程根目录', '0', null, '代码生成器的工程跟目录。如果为0则自动获取。');
INSERT INTO "AOS_SYS_PARAM" VALUES ('c744b99660c74302b7a3ae5834a7b6eb', 'grid_column_algin_', 'left', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '表格列内容对齐方式', '0', null, '表格列对齐模式。有效值：left|center|right。');
INSERT INTO "AOS_SYS_PARAM" VALUES ('d2a8d045aa7e44ef93f0735a4c486bc6', 'nav_tab_index_', '0', 'a072411787f545edb7e7c3c23fa6c0ff', '0.001.002.004', '导航缺省活动页', '1', 'nav_tab_index_', '左侧布局的导航卡片缺省激活的卡片索引号，索引下标从0开始。');
INSERT INTO "AOS_SYS_PARAM" VALUES ('d3b33d5dee5b46738f9525b8977d7673', 'login_back_img_', '-1', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '登录页面的背景图片', '0', null, '登录页面的背景图片。可选的预设背景图片为：0.jpg、1.jpg、2.jpg。如果需要随机出现背景，则将其设置为-1。');
INSERT INTO "AOS_SYS_PARAM" VALUES ('eeb66260a2c141b2a0bb06bb41d7803b', 'navbar_btn_style_', 'tight', 'a072411787f545edb7e7c3c23fa6c0ff', '0.001.002.004', '导航条按钮风格', '1', 'navbar_btn_style_', '顶部水平导航条的按钮样式风格。tight：组合按钮；standalone：独立按钮。');
INSERT INTO "AOS_SYS_PARAM" VALUES ('f18649a182a946a693b36f817374cb1c', 'welcome_page_title_', '欢迎', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '欢迎页标题', '0', null, '系统登录后第一个缺省打开的Tab页面的标题。缺省："欢迎"。');
INSERT INTO "AOS_SYS_PARAM" VALUES ('fcf73fa9129649a08ebb41e1ec8b5340', 'layout_', 'tab', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', 'Center区域布局风格', '1', 'layout_', '系统业务经办区域(center)布局风格。可选值：tab|page。缺省值：tab。tab：支持同时打开多个功能模块界面；page：当前只能打开1个功能界面。');
INSERT INTO "AOS_SYS_PARAM" VALUES ('fdd95913b7e54e3ca6be9557484159f5', 'tab_focus_color_', '#0099FF', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', 'Tab高亮颜色', '1', 'tab_focus_color_', '缺省的当前Tab卡片高亮提示颜色');
INSERT INTO "AOS_SYS_PARAM" VALUES ('0dabca413781404b9cbfaae3881fc5a6', 'app_ico', '/static/icon/ico/aos2.ico', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '应用系统小图标', '0', null, '浏览器标题栏左上角显示');
INSERT INTO "AOS_SYS_PARAM" VALUES ('19ad8d57d72b4ecf98ad133ebb6492bd', 'page_load_gif_', 'wheel.gif', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '页面刷新动画文件', '0', null, '页面刷新动画文件。可选的预设动画文件：run.gif、wheel.gif。动画path：/static/image/gif/pageload。');

-- ----------------------------
-- Table structure for AOS_SYS_POST
-- ----------------------------
DROP TABLE "AOS_SYS_POST";
CREATE TABLE "AOS_SYS_POST" (
"ID_" VARCHAR2(64 BYTE) NOT NULL ,
"NAME_" VARCHAR2(255 BYTE) NOT NULL ,
"STATUS_" VARCHAR2(255 BYTE) DEFAULT 1  NOT NULL ,
"TYPE_" VARCHAR2(255 BYTE) NOT NULL ,
"ORG_ID_" VARCHAR2(64 BYTE) NOT NULL ,
"CREATE_TIME_" VARCHAR2(255 BYTE) NOT NULL ,
"CREATER_ID_" VARCHAR2(64 BYTE) NOT NULL ,
"ORG_CASCADE_ID_" VARCHAR2(255 BYTE) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "AOS_SYS_POST" IS '岗位表';
COMMENT ON COLUMN "AOS_SYS_POST"."ID_" IS ' 流水号';
COMMENT ON COLUMN "AOS_SYS_POST"."NAME_" IS '岗位名称';
COMMENT ON COLUMN "AOS_SYS_POST"."STATUS_" IS '当前状态';
COMMENT ON COLUMN "AOS_SYS_POST"."TYPE_" IS '岗位类型';
COMMENT ON COLUMN "AOS_SYS_POST"."ORG_ID_" IS '所属部门流水号';
COMMENT ON COLUMN "AOS_SYS_POST"."CREATE_TIME_" IS '创建时间';
COMMENT ON COLUMN "AOS_SYS_POST"."CREATER_ID_" IS '创建人ID';
COMMENT ON COLUMN "AOS_SYS_POST"."ORG_CASCADE_ID_" IS '所属部门节点语义ID';

-- ----------------------------
-- Records of AOS_SYS_POST
-- ----------------------------
INSERT INTO "AOS_SYS_POST" VALUES ('60cb0e6359ea46a19a841adc46cf66cf', '研发岗位', '1', '1', 'b2fa97f8bed34eee86201f01fa786ed4', '2016-02-02 21:54:59', 'fa04db9dd2f54d61b0c8202a25de2dc6', '0.001');

-- ----------------------------
-- Table structure for AOS_SYS_ROLE
-- ----------------------------
DROP TABLE "AOS_SYS_ROLE";
CREATE TABLE "AOS_SYS_ROLE" (
"ID_" VARCHAR2(64 BYTE) NOT NULL ,
"NAME_" VARCHAR2(255 BYTE) NOT NULL ,
"STATUS_" VARCHAR2(255 BYTE) DEFAULT 1  NOT NULL ,
"TYPE_" VARCHAR2(255 BYTE) NOT NULL ,
"CREATE_TIME_" VARCHAR2(255 BYTE) NOT NULL ,
"CREATER_ID_" VARCHAR2(64 BYTE) NOT NULL ,
"CREATER_ORG_ID_" VARCHAR2(64 BYTE) NOT NULL ,
"CREATER_ORG_CASCADE_ID_" VARCHAR2(255 BYTE) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "AOS_SYS_ROLE" IS '角色表';
COMMENT ON COLUMN "AOS_SYS_ROLE"."ID_" IS ' 流水号';
COMMENT ON COLUMN "AOS_SYS_ROLE"."NAME_" IS '角色名称';
COMMENT ON COLUMN "AOS_SYS_ROLE"."STATUS_" IS '当前状态';
COMMENT ON COLUMN "AOS_SYS_ROLE"."TYPE_" IS '角色类型';
COMMENT ON COLUMN "AOS_SYS_ROLE"."CREATE_TIME_" IS '创建时间';
COMMENT ON COLUMN "AOS_SYS_ROLE"."CREATER_ID_" IS '创建人ID';
COMMENT ON COLUMN "AOS_SYS_ROLE"."CREATER_ORG_ID_" IS '创建人所属部门流水号';
COMMENT ON COLUMN "AOS_SYS_ROLE"."CREATER_ORG_CASCADE_ID_" IS '创建人所属部门节点语义ID';

-- ----------------------------
-- Records of AOS_SYS_ROLE
-- ----------------------------
INSERT INTO "AOS_SYS_ROLE" VALUES ('84f923b5e334498494eda38d8e86ef80', '研发角色', '1', '1', '2016-02-02 21:56:20', 'fa04db9dd2f54d61b0c8202a25de2dc6', '63cf387a243d4d9799367d773b853346', '0');

-- ----------------------------
-- Table structure for AOS_SYS_SEQUENCE
-- ----------------------------
DROP TABLE "AOS_SYS_SEQUENCE";
CREATE TABLE "AOS_SYS_SEQUENCE" (
"ID_" VARCHAR2(64 BYTE) NOT NULL ,
"NAME_" VARCHAR2(255 BYTE) NOT NULL ,
"TYPE_" VARCHAR2(255 BYTE) NULL ,
"PREFIX_" VARCHAR2(255 BYTE) NULL ,
"START_" VARCHAR2(255 BYTE) DEFAULT 1  NULL ,
"STEP_" VARCHAR2(255 BYTE) DEFAULT 1  NULL ,
"CUR_VALUE_" VARCHAR2(255 BYTE) DEFAULT 0  NULL ,
"STATUS_" VARCHAR2(255 BYTE) DEFAULT 1  NOT NULL ,
"CONNECTOR_" VARCHAR2(255 BYTE) NULL ,
"SUFFIX_" VARCHAR2(255 BYTE) NULL ,
"DB_SEQ_NAME_" VARCHAR2(255 BYTE) NULL ,
"MAX_VALUE_" VARCHAR2(255 BYTE) DEFAULT 9223372036854775807  NULL ,
"IS_CIRCUL_" VARCHAR2(255 BYTE) DEFAULT 0  NULL ,
"MIN_VALUE_" VARCHAR2(255 BYTE) DEFAULT 1  NULL ,
"IS_LEFTPAD_" VARCHAR2(255 BYTE) DEFAULT 0  NULL ,
"FORMAT_VALUE_" VARCHAR2(255 BYTE) NULL ,
"REMARK_" VARCHAR2(4000 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "AOS_SYS_SEQUENCE" IS 'ID配置表';
COMMENT ON COLUMN "AOS_SYS_SEQUENCE"."ID_" IS '流水号';
COMMENT ON COLUMN "AOS_SYS_SEQUENCE"."NAME_" IS '名称';
COMMENT ON COLUMN "AOS_SYS_SEQUENCE"."TYPE_" IS '类型';
COMMENT ON COLUMN "AOS_SYS_SEQUENCE"."PREFIX_" IS '前缀';
COMMENT ON COLUMN "AOS_SYS_SEQUENCE"."START_" IS '起始值';
COMMENT ON COLUMN "AOS_SYS_SEQUENCE"."STEP_" IS '递增步长';
COMMENT ON COLUMN "AOS_SYS_SEQUENCE"."CUR_VALUE_" IS '当前值';
COMMENT ON COLUMN "AOS_SYS_SEQUENCE"."STATUS_" IS '当前状态';
COMMENT ON COLUMN "AOS_SYS_SEQUENCE"."CONNECTOR_" IS '连接符';
COMMENT ON COLUMN "AOS_SYS_SEQUENCE"."SUFFIX_" IS '后缀';
COMMENT ON COLUMN "AOS_SYS_SEQUENCE"."DB_SEQ_NAME_" IS 'DBSequence名称';
COMMENT ON COLUMN "AOS_SYS_SEQUENCE"."MAX_VALUE_" IS '最大值';
COMMENT ON COLUMN "AOS_SYS_SEQUENCE"."IS_CIRCUL_" IS '是否循环';
COMMENT ON COLUMN "AOS_SYS_SEQUENCE"."MIN_VALUE_" IS '最小值';
COMMENT ON COLUMN "AOS_SYS_SEQUENCE"."IS_LEFTPAD_" IS '是否左补足';
COMMENT ON COLUMN "AOS_SYS_SEQUENCE"."FORMAT_VALUE_" IS '当前格式化值';
COMMENT ON COLUMN "AOS_SYS_SEQUENCE"."REMARK_" IS '备注';

-- ----------------------------
-- Records of AOS_SYS_SEQUENCE
-- ----------------------------
INSERT INTO "AOS_SYS_SEQUENCE" VALUES ('7487db32b061465da1af721e84e9942a', 'GUUID', '2', null, '1', '1', 'd7123d2c8af04dafab5d37d6d03937bb', '1', null, null, null, '9223372036854775807', '0', '1', '0', 'd7123d2c8af04dafab5d37d6d03937bb', '通用UUID。');
INSERT INTO "AOS_SYS_SEQUENCE" VALUES ('2abfc360e8a74e21bcda37113269fca0', 'DEMOID', '1', null, '1', '1', '6637', '1', null, null, null, '9223372036854775807', '0', '1', '0', '6637', '演示模块相关功能使用的ID发生器');
INSERT INTO "AOS_SYS_SEQUENCE" VALUES ('40b37118cebf431283415862d355c72c', 'CARDID', '1', null, '1', '1', '10004005', '1', null, null, null, '99999999', '0', '10000000', '0', '10004005', '范例系统卡号');

-- ----------------------------
-- Table structure for AOS_SYS_USER
-- ----------------------------
DROP TABLE "AOS_SYS_USER";
CREATE TABLE "AOS_SYS_USER" (
"ID_" VARCHAR2(64 BYTE) NOT NULL ,
"ACCOUNT_" VARCHAR2(255 BYTE) NOT NULL ,
"PASSWORD_" VARCHAR2(255 BYTE) NOT NULL ,
"NAME_" VARCHAR2(255 BYTE) NOT NULL ,
"SEX_" VARCHAR2(255 BYTE) DEFAULT 0  NOT NULL ,
"ORG_ID_" VARCHAR2(64 BYTE) NOT NULL ,
"STATUS_" VARCHAR2(255 BYTE) NOT NULL ,
"TYPE_" VARCHAR2(255 BYTE) NOT NULL ,
"BIZ_CODE_" VARCHAR2(255 BYTE) NULL ,
"CREATE_TIME_" VARCHAR2(255 BYTE) NOT NULL ,
"CREATER_ID_" VARCHAR2(64 BYTE) NOT NULL ,
"ORG_CASCADE_ID_" VARCHAR2(255 BYTE) NOT NULL ,
"DELETE_FLAG_" VARCHAR2(255 BYTE) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "AOS_SYS_USER" IS '用户基本信息表';
COMMENT ON COLUMN "AOS_SYS_USER"."ID_" IS '流水号';
COMMENT ON COLUMN "AOS_SYS_USER"."ACCOUNT_" IS '用户登录帐号';
COMMENT ON COLUMN "AOS_SYS_USER"."PASSWORD_" IS '密码';
COMMENT ON COLUMN "AOS_SYS_USER"."NAME_" IS '用户姓名';
COMMENT ON COLUMN "AOS_SYS_USER"."SEX_" IS '性别';
COMMENT ON COLUMN "AOS_SYS_USER"."ORG_ID_" IS '所属主部门流水号';
COMMENT ON COLUMN "AOS_SYS_USER"."STATUS_" IS '用户状态';
COMMENT ON COLUMN "AOS_SYS_USER"."TYPE_" IS '用户类型';
COMMENT ON COLUMN "AOS_SYS_USER"."BIZ_CODE_" IS '业务对照码';
COMMENT ON COLUMN "AOS_SYS_USER"."CREATE_TIME_" IS ' 经办时间';
COMMENT ON COLUMN "AOS_SYS_USER"."CREATER_ID_" IS '经办人流水号';
COMMENT ON COLUMN "AOS_SYS_USER"."ORG_CASCADE_ID_" IS '所属部门节点语义ID';
COMMENT ON COLUMN "AOS_SYS_USER"."DELETE_FLAG_" IS '逻辑删除标识';

-- ----------------------------
-- Records of AOS_SYS_USER
-- ----------------------------
INSERT INTO "AOS_SYS_USER" VALUES ('fa04db9dd2f54d61b0c8202a25de2dc6', 'root', 'gnRD3IiRP6s=', '超级用户', '1', '63cf387a243d4d9799367d773b853346', '1', '2', null, '2014-09-27 22:12:56', 'fa04db9dd2f54d61b0c8202a25de2dc6', '0', '0');
INSERT INTO "AOS_SYS_USER" VALUES ('fe24c4ac34444902a2129ec1debf9ed4', 'caocao', 'gnRD3IiRP6s=', '曹操', '3', 'b2fa97f8bed34eee86201f01fa786ed4', '1', '1', null, '2016-02-02 21:55:57', 'fa04db9dd2f54d61b0c8202a25de2dc6', '0.001', '0');

-- ----------------------------
-- Table structure for AOS_SYS_USER_CFG
-- ----------------------------
DROP TABLE "AOS_SYS_USER_CFG";
CREATE TABLE "AOS_SYS_USER_CFG" (
"ID_" VARCHAR2(64 BYTE) NOT NULL ,
"THEME_" VARCHAR2(255 BYTE) NULL ,
"SKIN_" VARCHAR2(255 BYTE) NULL ,
"LAYOUT_" VARCHAR2(255 BYTE) NULL ,
"NAV_MODE_" VARCHAR2(255 BYTE) NULL ,
"IS_SHOW_TOP_NAV_" VARCHAR2(255 BYTE) NULL ,
"NAVBAR_BTN_STYLE_" VARCHAR2(255 BYTE) NULL ,
"TAB_FOCUS_COLOR_" VARCHAR2(255 BYTE) NULL ,
"IS_SHOW_MAC_NAV_" VARCHAR2(255 BYTE) NULL ,
"NAV_TAB_INDEX_" VARCHAR2(255 BYTE) NULL ,
"NAV_QUICK_LAYOUT_" VARCHAR2(255 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "AOS_SYS_USER_CFG" IS '用户配置表';
COMMENT ON COLUMN "AOS_SYS_USER_CFG"."ID_" IS '用户ID';
COMMENT ON COLUMN "AOS_SYS_USER_CFG"."THEME_" IS '用户界面主题';
COMMENT ON COLUMN "AOS_SYS_USER_CFG"."SKIN_" IS '用户界面皮肤';
COMMENT ON COLUMN "AOS_SYS_USER_CFG"."LAYOUT_" IS '系统业务经办区域布局风格';
COMMENT ON COLUMN "AOS_SYS_USER_CFG"."NAV_MODE_" IS '导航模式';
COMMENT ON COLUMN "AOS_SYS_USER_CFG"."IS_SHOW_TOP_NAV_" IS '是否显示水平导航条';
COMMENT ON COLUMN "AOS_SYS_USER_CFG"."NAVBAR_BTN_STYLE_" IS '导航条按钮风格';
COMMENT ON COLUMN "AOS_SYS_USER_CFG"."TAB_FOCUS_COLOR_" IS 'Tab高亮颜色';
COMMENT ON COLUMN "AOS_SYS_USER_CFG"."IS_SHOW_MAC_NAV_" IS '欢迎页Mac导航显示开关';
COMMENT ON COLUMN "AOS_SYS_USER_CFG"."NAV_TAB_INDEX_" IS '导航缺省活动页';
COMMENT ON COLUMN "AOS_SYS_USER_CFG"."NAV_QUICK_LAYOUT_" IS '快捷菜单布局风格';

-- ----------------------------
-- Records of AOS_SYS_USER_CFG
-- ----------------------------
INSERT INTO "AOS_SYS_USER_CFG" VALUES ('fa04db9dd2f54d61b0c8202a25de2dc6', 'classic', 'blue', null, null, 'true', 'tight', '#0099FF', null, '0', null);
INSERT INTO "AOS_SYS_USER_CFG" VALUES ('fe24c4ac34444902a2129ec1debf9ed4', 'classic', 'blue', null, null, 'true', 'tight', '#0099FF', null, '0', null);

-- ----------------------------
-- Table structure for AOS_SYS_USER_EXT
-- ----------------------------
DROP TABLE "AOS_SYS_USER_EXT";
CREATE TABLE "AOS_SYS_USER_EXT" (
"ID_" VARCHAR2(64 BYTE) NOT NULL ,
"EMAIL_" VARCHAR2(255 BYTE) NULL ,
"FIXED_PHONE_" VARCHAR2(255 BYTE) NULL ,
"MOBILE_PHONE_" VARCHAR2(255 BYTE) NULL ,
"ADDRESS_" VARCHAR2(255 BYTE) NULL ,
"ZIP_" VARCHAR2(255 BYTE) NULL ,
"BIRTHDAY_" VARCHAR2(255 BYTE) NULL ,
"IDNO_" VARCHAR2(255 BYTE) NULL ,
"QQ_" VARCHAR2(255 BYTE) NULL ,
"DYNAMIC_FIELD_" VARCHAR2(4000 BYTE) NULL ,
"BYTEARRAY_ID_" VARCHAR2(64 BYTE) NULL ,
"REMARK_" VARCHAR2(4000 BYTE) NULL ,
"FILED1_" VARCHAR2(255 BYTE) NULL ,
"FILED2_" VARCHAR2(255 BYTE) NULL ,
"FILED3_" VARCHAR2(255 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "AOS_SYS_USER_EXT" IS '用户扩展信息表';
COMMENT ON COLUMN "AOS_SYS_USER_EXT"."ID_" IS '用户ID';
COMMENT ON COLUMN "AOS_SYS_USER_EXT"."EMAIL_" IS '电子邮件';
COMMENT ON COLUMN "AOS_SYS_USER_EXT"."FIXED_PHONE_" IS '固定电话';
COMMENT ON COLUMN "AOS_SYS_USER_EXT"."MOBILE_PHONE_" IS '移动电话';
COMMENT ON COLUMN "AOS_SYS_USER_EXT"."ADDRESS_" IS '联系地址';
COMMENT ON COLUMN "AOS_SYS_USER_EXT"."ZIP_" IS '邮编';
COMMENT ON COLUMN "AOS_SYS_USER_EXT"."BIRTHDAY_" IS '生日';
COMMENT ON COLUMN "AOS_SYS_USER_EXT"."IDNO_" IS '身份证号';
COMMENT ON COLUMN "AOS_SYS_USER_EXT"."QQ_" IS 'QQ';
COMMENT ON COLUMN "AOS_SYS_USER_EXT"."DYNAMIC_FIELD_" IS '动态扩展字段';
COMMENT ON COLUMN "AOS_SYS_USER_EXT"."BYTEARRAY_ID_" IS '用户头像流文件ID';
COMMENT ON COLUMN "AOS_SYS_USER_EXT"."REMARK_" IS '备注';
COMMENT ON COLUMN "AOS_SYS_USER_EXT"."FILED1_" IS '静态扩展字段1';
COMMENT ON COLUMN "AOS_SYS_USER_EXT"."FILED2_" IS '静态扩展字段2';
COMMENT ON COLUMN "AOS_SYS_USER_EXT"."FILED3_" IS '静态扩展字段3';

-- ----------------------------
-- Records of AOS_SYS_USER_EXT
-- ----------------------------
INSERT INTO "AOS_SYS_USER_EXT" VALUES ('fa04db9dd2f54d61b0c8202a25de2dc6', '307916217@qq.com', null, '186188188188', null, null, null, null, '307916217', null, null, '超级用户拥有系统最高权限。', null, null, null);
INSERT INTO "AOS_SYS_USER_EXT" VALUES ('fe24c4ac34444902a2129ec1debf9ed4', null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for AOS_SYS_USER_POST
-- ----------------------------
DROP TABLE "AOS_SYS_USER_POST";
CREATE TABLE "AOS_SYS_USER_POST" (
"ID_" VARCHAR2(64 BYTE) NOT NULL ,
"USER_ID_" VARCHAR2(64 BYTE) NOT NULL ,
"POST_ID_" VARCHAR2(64 BYTE) NOT NULL ,
"OPERATE_TIME_" VARCHAR2(255 BYTE) NOT NULL ,
"OPERATOR_ID_" VARCHAR2(64 BYTE) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "AOS_SYS_USER_POST" IS '用户-岗位关联表';
COMMENT ON COLUMN "AOS_SYS_USER_POST"."ID_" IS '流水号';
COMMENT ON COLUMN "AOS_SYS_USER_POST"."USER_ID_" IS '用户流水号';
COMMENT ON COLUMN "AOS_SYS_USER_POST"."POST_ID_" IS '岗位流水号';
COMMENT ON COLUMN "AOS_SYS_USER_POST"."OPERATE_TIME_" IS '授权时间';
COMMENT ON COLUMN "AOS_SYS_USER_POST"."OPERATOR_ID_" IS '授权人流水号';

-- ----------------------------
-- Records of AOS_SYS_USER_POST
-- ----------------------------

-- ----------------------------
-- Table structure for AOS_SYS_USER_ROLE
-- ----------------------------
DROP TABLE "AOS_SYS_USER_ROLE";
CREATE TABLE "AOS_SYS_USER_ROLE" (
"ID_" VARCHAR2(64 BYTE) NOT NULL ,
"USER_ID_" VARCHAR2(64 BYTE) NOT NULL ,
"ROLE_ID_" VARCHAR2(64 BYTE) NOT NULL ,
"OPERATE_TIME_" VARCHAR2(255 BYTE) NOT NULL ,
"OPERATOR_ID_" VARCHAR2(64 BYTE) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "AOS_SYS_USER_ROLE" IS '用户-角色关联表';
COMMENT ON COLUMN "AOS_SYS_USER_ROLE"."ID_" IS '流水号';
COMMENT ON COLUMN "AOS_SYS_USER_ROLE"."USER_ID_" IS '用户流水号';
COMMENT ON COLUMN "AOS_SYS_USER_ROLE"."ROLE_ID_" IS '角色流水号';
COMMENT ON COLUMN "AOS_SYS_USER_ROLE"."OPERATE_TIME_" IS '授权时间';
COMMENT ON COLUMN "AOS_SYS_USER_ROLE"."OPERATOR_ID_" IS '授权人流水号';

-- ----------------------------
-- Records of AOS_SYS_USER_ROLE
-- ----------------------------
INSERT INTO "AOS_SYS_USER_ROLE" VALUES ('b3fea94f5f0d4065b26c1b2e28fe3a75', 'fe24c4ac34444902a2129ec1debf9ed4', '84f923b5e334498494eda38d8e86ef80', '2016-02-02 21:56:35', 'fa04db9dd2f54d61b0c8202a25de2dc6');

-- ----------------------------
-- Table structure for AOS_WF_EVT_LOG
-- ----------------------------
DROP TABLE "AOS_WF_EVT_LOG";
CREATE TABLE "AOS_WF_EVT_LOG" (
"LOG_NR_" NUMBER(19) NOT NULL ,
"TYPE_" NVARCHAR2(64) NULL ,
"PROC_DEF_ID_" NVARCHAR2(64) NULL ,
"PROC_INST_ID_" NVARCHAR2(64) NULL ,
"EXECUTION_ID_" NVARCHAR2(64) NULL ,
"TASK_ID_" NVARCHAR2(64) NULL ,
"TIME_STAMP_" TIMESTAMP(6)  NOT NULL ,
"USER_ID_" NVARCHAR2(255) NULL ,
"DATA_" BLOB NULL ,
"LOCK_OWNER_" NVARCHAR2(255) NULL ,
"LOCK_TIME_" TIMESTAMP(6)  NULL ,
"IS_PROCESSED_" NUMBER(3) DEFAULT 0  NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of AOS_WF_EVT_LOG
-- ----------------------------

-- ----------------------------
-- Table structure for AOS_WF_GE_BYTEARRAY
-- ----------------------------
DROP TABLE "AOS_WF_GE_BYTEARRAY";
CREATE TABLE "AOS_WF_GE_BYTEARRAY" (
"ID_" NVARCHAR2(64) NOT NULL ,
"REV_" NUMBER NULL ,
"NAME_" NVARCHAR2(255) NULL ,
"DEPLOYMENT_ID_" NVARCHAR2(64) NULL ,
"BYTES_" BLOB NULL ,
"GENERATED_" NUMBER(1) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of AOS_WF_GE_BYTEARRAY
-- ----------------------------

-- ----------------------------
-- Table structure for AOS_WF_GE_PROPERTY
-- ----------------------------
DROP TABLE "AOS_WF_GE_PROPERTY";
CREATE TABLE "AOS_WF_GE_PROPERTY" (
"NAME_" NVARCHAR2(64) NOT NULL ,
"VALUE_" NVARCHAR2(300) NULL ,
"REV_" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of AOS_WF_GE_PROPERTY
-- ----------------------------
INSERT INTO "AOS_WF_GE_PROPERTY" VALUES ('schema.version', '5.18.0.0', '1');
INSERT INTO "AOS_WF_GE_PROPERTY" VALUES ('schema.history', 'create(5.18.0.0)', '1');
INSERT INTO "AOS_WF_GE_PROPERTY" VALUES ('next.dbid', '1', '1');

-- ----------------------------
-- Table structure for AOS_WF_HI_ACTINST
-- ----------------------------
DROP TABLE "AOS_WF_HI_ACTINST";
CREATE TABLE "AOS_WF_HI_ACTINST" (
"ID_" NVARCHAR2(64) NOT NULL ,
"PROC_DEF_ID_" NVARCHAR2(64) NOT NULL ,
"PROC_INST_ID_" NVARCHAR2(64) NOT NULL ,
"EXECUTION_ID_" NVARCHAR2(64) NOT NULL ,
"ACT_ID_" NVARCHAR2(255) NOT NULL ,
"TASK_ID_" NVARCHAR2(64) NULL ,
"CALL_PROC_INST_ID_" NVARCHAR2(64) NULL ,
"ACT_NAME_" NVARCHAR2(255) NULL ,
"ACT_TYPE_" NVARCHAR2(255) NOT NULL ,
"ASSIGNEE_" NVARCHAR2(255) NULL ,
"START_TIME_" TIMESTAMP(6)  NOT NULL ,
"END_TIME_" TIMESTAMP(6)  NULL ,
"DURATION_" NUMBER(19) NULL ,
"TENANT_ID_" NVARCHAR2(255) DEFAULT ''  NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of AOS_WF_HI_ACTINST
-- ----------------------------

-- ----------------------------
-- Table structure for AOS_WF_HI_ATTACHMENT
-- ----------------------------
DROP TABLE "AOS_WF_HI_ATTACHMENT";
CREATE TABLE "AOS_WF_HI_ATTACHMENT" (
"ID_" NVARCHAR2(64) NOT NULL ,
"REV_" NUMBER NULL ,
"USER_ID_" NVARCHAR2(255) NULL ,
"NAME_" NVARCHAR2(255) NULL ,
"DESCRIPTION_" NVARCHAR2(2000) NULL ,
"TYPE_" NVARCHAR2(255) NULL ,
"TASK_ID_" NVARCHAR2(64) NULL ,
"PROC_INST_ID_" NVARCHAR2(64) NULL ,
"URL_" NVARCHAR2(2000) NULL ,
"CONTENT_ID_" NVARCHAR2(64) NULL ,
"TIME_" TIMESTAMP(6)  NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of AOS_WF_HI_ATTACHMENT
-- ----------------------------

-- ----------------------------
-- Table structure for AOS_WF_HI_COMMENT
-- ----------------------------
DROP TABLE "AOS_WF_HI_COMMENT";
CREATE TABLE "AOS_WF_HI_COMMENT" (
"ID_" NVARCHAR2(64) NOT NULL ,
"TYPE_" NVARCHAR2(255) NULL ,
"TIME_" TIMESTAMP(6)  NOT NULL ,
"USER_ID_" NVARCHAR2(255) NULL ,
"TASK_ID_" NVARCHAR2(64) NULL ,
"PROC_INST_ID_" NVARCHAR2(64) NULL ,
"ACTION_" NVARCHAR2(255) NULL ,
"MESSAGE_" NVARCHAR2(2000) NULL ,
"FULL_MSG_" BLOB NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of AOS_WF_HI_COMMENT
-- ----------------------------

-- ----------------------------
-- Table structure for AOS_WF_HI_DETAIL
-- ----------------------------
DROP TABLE "AOS_WF_HI_DETAIL";
CREATE TABLE "AOS_WF_HI_DETAIL" (
"ID_" NVARCHAR2(64) NOT NULL ,
"TYPE_" NVARCHAR2(255) NOT NULL ,
"PROC_INST_ID_" NVARCHAR2(64) NULL ,
"EXECUTION_ID_" NVARCHAR2(64) NULL ,
"TASK_ID_" NVARCHAR2(64) NULL ,
"ACT_INST_ID_" NVARCHAR2(64) NULL ,
"NAME_" NVARCHAR2(255) NOT NULL ,
"VAR_TYPE_" NVARCHAR2(64) NULL ,
"REV_" NUMBER NULL ,
"TIME_" TIMESTAMP(6)  NOT NULL ,
"BYTEARRAY_ID_" NVARCHAR2(64) NULL ,
"DOUBLE_" NUMBER NULL ,
"LONG_" NUMBER(19) NULL ,
"TEXT_" NVARCHAR2(2000) NULL ,
"TEXT2_" NVARCHAR2(2000) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of AOS_WF_HI_DETAIL
-- ----------------------------

-- ----------------------------
-- Table structure for AOS_WF_HI_IDENTITYLINK
-- ----------------------------
DROP TABLE "AOS_WF_HI_IDENTITYLINK";
CREATE TABLE "AOS_WF_HI_IDENTITYLINK" (
"ID_" NVARCHAR2(64) NOT NULL ,
"GROUP_ID_" NVARCHAR2(255) NULL ,
"TYPE_" NVARCHAR2(255) NULL ,
"USER_ID_" NVARCHAR2(255) NULL ,
"TASK_ID_" NVARCHAR2(64) NULL ,
"PROC_INST_ID_" NVARCHAR2(64) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of AOS_WF_HI_IDENTITYLINK
-- ----------------------------

-- ----------------------------
-- Table structure for AOS_WF_HI_PROCINST
-- ----------------------------
DROP TABLE "AOS_WF_HI_PROCINST";
CREATE TABLE "AOS_WF_HI_PROCINST" (
"ID_" NVARCHAR2(64) NOT NULL ,
"PROC_INST_ID_" NVARCHAR2(64) NOT NULL ,
"BUSINESS_KEY_" NVARCHAR2(255) NULL ,
"PROC_DEF_ID_" NVARCHAR2(64) NOT NULL ,
"START_TIME_" TIMESTAMP(6)  NOT NULL ,
"END_TIME_" TIMESTAMP(6)  NULL ,
"DURATION_" NUMBER(19) NULL ,
"START_USER_ID_" NVARCHAR2(255) NULL ,
"START_ACT_ID_" NVARCHAR2(255) NULL ,
"END_ACT_ID_" NVARCHAR2(255) NULL ,
"SUPER_PROCESS_INSTANCE_ID_" NVARCHAR2(64) NULL ,
"DELETE_REASON_" NVARCHAR2(2000) NULL ,
"TENANT_ID_" NVARCHAR2(255) DEFAULT ''  NULL ,
"NAME_" NVARCHAR2(255) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of AOS_WF_HI_PROCINST
-- ----------------------------

-- ----------------------------
-- Table structure for AOS_WF_HI_TASKINST
-- ----------------------------
DROP TABLE "AOS_WF_HI_TASKINST";
CREATE TABLE "AOS_WF_HI_TASKINST" (
"ID_" NVARCHAR2(64) NOT NULL ,
"PROC_DEF_ID_" NVARCHAR2(64) NULL ,
"TASK_DEF_KEY_" NVARCHAR2(255) NULL ,
"PROC_INST_ID_" NVARCHAR2(64) NULL ,
"EXECUTION_ID_" NVARCHAR2(64) NULL ,
"PARENT_TASK_ID_" NVARCHAR2(64) NULL ,
"NAME_" NVARCHAR2(255) NULL ,
"DESCRIPTION_" NVARCHAR2(2000) NULL ,
"OWNER_" NVARCHAR2(255) NULL ,
"ASSIGNEE_" NVARCHAR2(255) NULL ,
"START_TIME_" TIMESTAMP(6)  NOT NULL ,
"CLAIM_TIME_" TIMESTAMP(6)  NULL ,
"END_TIME_" TIMESTAMP(6)  NULL ,
"DURATION_" NUMBER(19) NULL ,
"DELETE_REASON_" NVARCHAR2(2000) NULL ,
"PRIORITY_" NUMBER NULL ,
"DUE_DATE_" TIMESTAMP(6)  NULL ,
"FORM_KEY_" NVARCHAR2(255) NULL ,
"CATEGORY_" NVARCHAR2(255) NULL ,
"TENANT_ID_" NVARCHAR2(255) DEFAULT ''  NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of AOS_WF_HI_TASKINST
-- ----------------------------

-- ----------------------------
-- Table structure for AOS_WF_HI_VARINST
-- ----------------------------
DROP TABLE "AOS_WF_HI_VARINST";
CREATE TABLE "AOS_WF_HI_VARINST" (
"ID_" NVARCHAR2(64) NOT NULL ,
"PROC_INST_ID_" NVARCHAR2(64) NULL ,
"EXECUTION_ID_" NVARCHAR2(64) NULL ,
"TASK_ID_" NVARCHAR2(64) NULL ,
"NAME_" NVARCHAR2(255) NOT NULL ,
"VAR_TYPE_" NVARCHAR2(100) NULL ,
"REV_" NUMBER NULL ,
"BYTEARRAY_ID_" NVARCHAR2(64) NULL ,
"DOUBLE_" NUMBER NULL ,
"LONG_" NUMBER(19) NULL ,
"TEXT_" NVARCHAR2(2000) NULL ,
"TEXT2_" NVARCHAR2(2000) NULL ,
"CREATE_TIME_" TIMESTAMP(6)  NULL ,
"LAST_UPDATED_TIME_" TIMESTAMP(6)  NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of AOS_WF_HI_VARINST
-- ----------------------------

-- ----------------------------
-- Table structure for AOS_WF_ID_GROUP
-- ----------------------------
DROP TABLE "AOS_WF_ID_GROUP";
CREATE TABLE "AOS_WF_ID_GROUP" (
"ID_" NVARCHAR2(64) NOT NULL ,
"REV_" NUMBER NULL ,
"NAME_" NVARCHAR2(255) NULL ,
"TYPE_" NVARCHAR2(255) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of AOS_WF_ID_GROUP
-- ----------------------------

-- ----------------------------
-- Table structure for AOS_WF_ID_INFO
-- ----------------------------
DROP TABLE "AOS_WF_ID_INFO";
CREATE TABLE "AOS_WF_ID_INFO" (
"ID_" NVARCHAR2(64) NOT NULL ,
"REV_" NUMBER NULL ,
"USER_ID_" NVARCHAR2(64) NULL ,
"TYPE_" NVARCHAR2(64) NULL ,
"KEY_" NVARCHAR2(255) NULL ,
"VALUE_" NVARCHAR2(255) NULL ,
"PASSWORD_" BLOB NULL ,
"PARENT_ID_" NVARCHAR2(255) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of AOS_WF_ID_INFO
-- ----------------------------

-- ----------------------------
-- Table structure for AOS_WF_ID_MEMBERSHIP
-- ----------------------------
DROP TABLE "AOS_WF_ID_MEMBERSHIP";
CREATE TABLE "AOS_WF_ID_MEMBERSHIP" (
"USER_ID_" NVARCHAR2(64) NOT NULL ,
"GROUP_ID_" NVARCHAR2(64) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of AOS_WF_ID_MEMBERSHIP
-- ----------------------------

-- ----------------------------
-- Table structure for AOS_WF_ID_USER
-- ----------------------------
DROP TABLE "AOS_WF_ID_USER";
CREATE TABLE "AOS_WF_ID_USER" (
"ID_" NVARCHAR2(64) NOT NULL ,
"REV_" NUMBER NULL ,
"FIRST_" NVARCHAR2(255) NULL ,
"LAST_" NVARCHAR2(255) NULL ,
"EMAIL_" NVARCHAR2(255) NULL ,
"PWD_" NVARCHAR2(255) NULL ,
"PICTURE_ID_" NVARCHAR2(64) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of AOS_WF_ID_USER
-- ----------------------------

-- ----------------------------
-- Table structure for AOS_WF_RE_DEPLOYMENT
-- ----------------------------
DROP TABLE "AOS_WF_RE_DEPLOYMENT";
CREATE TABLE "AOS_WF_RE_DEPLOYMENT" (
"ID_" NVARCHAR2(64) NOT NULL ,
"NAME_" NVARCHAR2(255) NULL ,
"CATEGORY_" NVARCHAR2(255) NULL ,
"TENANT_ID_" NVARCHAR2(255) DEFAULT ''  NULL ,
"DEPLOY_TIME_" TIMESTAMP(6)  NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of AOS_WF_RE_DEPLOYMENT
-- ----------------------------

-- ----------------------------
-- Table structure for AOS_WF_RE_MODEL
-- ----------------------------
DROP TABLE "AOS_WF_RE_MODEL";
CREATE TABLE "AOS_WF_RE_MODEL" (
"ID_" NVARCHAR2(64) NOT NULL ,
"REV_" NUMBER NULL ,
"NAME_" NVARCHAR2(255) NULL ,
"KEY_" NVARCHAR2(255) NULL ,
"CATEGORY_" NVARCHAR2(255) NULL ,
"CREATE_TIME_" TIMESTAMP(6)  NULL ,
"LAST_UPDATE_TIME_" TIMESTAMP(6)  NULL ,
"VERSION_" NUMBER NULL ,
"META_INFO_" NVARCHAR2(2000) NULL ,
"DEPLOYMENT_ID_" NVARCHAR2(64) NULL ,
"EDITOR_SOURCE_VALUE_ID_" NVARCHAR2(64) NULL ,
"EDITOR_SOURCE_EXTRA_VALUE_ID_" NVARCHAR2(64) NULL ,
"TENANT_ID_" NVARCHAR2(255) DEFAULT ''  NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of AOS_WF_RE_MODEL
-- ----------------------------

-- ----------------------------
-- Table structure for AOS_WF_RE_PROCDEF
-- ----------------------------
DROP TABLE "AOS_WF_RE_PROCDEF";
CREATE TABLE "AOS_WF_RE_PROCDEF" (
"ID_" NVARCHAR2(64) NOT NULL ,
"REV_" NUMBER NULL ,
"CATEGORY_" NVARCHAR2(255) NULL ,
"NAME_" NVARCHAR2(255) NULL ,
"KEY_" NVARCHAR2(255) NOT NULL ,
"VERSION_" NUMBER NOT NULL ,
"DEPLOYMENT_ID_" NVARCHAR2(64) NULL ,
"RESOURCE_NAME_" NVARCHAR2(2000) NULL ,
"DGRM_RESOURCE_NAME_" VARCHAR2(4000 BYTE) NULL ,
"DESCRIPTION_" NVARCHAR2(2000) NULL ,
"HAS_START_FORM_KEY_" NUMBER(1) NULL ,
"HAS_GRAPHICAL_NOTATION_" NUMBER(1) NULL ,
"SUSPENSION_STATE_" NUMBER NULL ,
"TENANT_ID_" NVARCHAR2(255) DEFAULT ''  NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of AOS_WF_RE_PROCDEF
-- ----------------------------

-- ----------------------------
-- Table structure for AOS_WF_RU_EVENT_SUBSCR
-- ----------------------------
DROP TABLE "AOS_WF_RU_EVENT_SUBSCR";
CREATE TABLE "AOS_WF_RU_EVENT_SUBSCR" (
"ID_" NVARCHAR2(64) NOT NULL ,
"REV_" NUMBER NULL ,
"EVENT_TYPE_" NVARCHAR2(255) NOT NULL ,
"EVENT_NAME_" NVARCHAR2(255) NULL ,
"EXECUTION_ID_" NVARCHAR2(64) NULL ,
"PROC_INST_ID_" NVARCHAR2(64) NULL ,
"ACTIVITY_ID_" NVARCHAR2(64) NULL ,
"CONFIGURATION_" NVARCHAR2(255) NULL ,
"CREATED_" TIMESTAMP(6)  NOT NULL ,
"PROC_DEF_ID_" NVARCHAR2(64) NULL ,
"TENANT_ID_" NVARCHAR2(255) DEFAULT ''  NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of AOS_WF_RU_EVENT_SUBSCR
-- ----------------------------

-- ----------------------------
-- Table structure for AOS_WF_RU_EXECUTION
-- ----------------------------
DROP TABLE "AOS_WF_RU_EXECUTION";
CREATE TABLE "AOS_WF_RU_EXECUTION" (
"ID_" NVARCHAR2(64) NOT NULL ,
"REV_" NUMBER NULL ,
"PROC_INST_ID_" NVARCHAR2(64) NULL ,
"BUSINESS_KEY_" NVARCHAR2(255) NULL ,
"PARENT_ID_" NVARCHAR2(64) NULL ,
"PROC_DEF_ID_" NVARCHAR2(64) NULL ,
"SUPER_EXEC_" NVARCHAR2(64) NULL ,
"ACT_ID_" NVARCHAR2(255) NULL ,
"IS_ACTIVE_" NUMBER(1) NULL ,
"IS_CONCURRENT_" NUMBER(1) NULL ,
"IS_SCOPE_" NUMBER(1) NULL ,
"IS_EVENT_SCOPE_" NUMBER(1) NULL ,
"SUSPENSION_STATE_" NUMBER NULL ,
"CACHED_ENT_STATE_" NUMBER NULL ,
"TENANT_ID_" NVARCHAR2(255) DEFAULT ''  NULL ,
"NAME_" NVARCHAR2(255) NULL ,
"LOCK_TIME_" TIMESTAMP(6)  NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of AOS_WF_RU_EXECUTION
-- ----------------------------

-- ----------------------------
-- Table structure for AOS_WF_RU_IDENTITYLINK
-- ----------------------------
DROP TABLE "AOS_WF_RU_IDENTITYLINK";
CREATE TABLE "AOS_WF_RU_IDENTITYLINK" (
"ID_" NVARCHAR2(64) NOT NULL ,
"REV_" NUMBER NULL ,
"GROUP_ID_" NVARCHAR2(255) NULL ,
"TYPE_" NVARCHAR2(255) NULL ,
"USER_ID_" NVARCHAR2(255) NULL ,
"TASK_ID_" NVARCHAR2(64) NULL ,
"PROC_INST_ID_" NVARCHAR2(64) NULL ,
"PROC_DEF_ID_" NVARCHAR2(64) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of AOS_WF_RU_IDENTITYLINK
-- ----------------------------

-- ----------------------------
-- Table structure for AOS_WF_RU_JOB
-- ----------------------------
DROP TABLE "AOS_WF_RU_JOB";
CREATE TABLE "AOS_WF_RU_JOB" (
"ID_" NVARCHAR2(64) NOT NULL ,
"REV_" NUMBER NULL ,
"TYPE_" NVARCHAR2(255) NOT NULL ,
"LOCK_EXP_TIME_" TIMESTAMP(6)  NULL ,
"LOCK_OWNER_" NVARCHAR2(255) NULL ,
"EXCLUSIVE_" NUMBER(1) NULL ,
"EXECUTION_ID_" NVARCHAR2(64) NULL ,
"PROCESS_INSTANCE_ID_" NVARCHAR2(64) NULL ,
"PROC_DEF_ID_" NVARCHAR2(64) NULL ,
"RETRIES_" NUMBER NULL ,
"EXCEPTION_STACK_ID_" NVARCHAR2(64) NULL ,
"EXCEPTION_MSG_" NVARCHAR2(2000) NULL ,
"DUEDATE_" TIMESTAMP(6)  NULL ,
"REPEAT_" NVARCHAR2(255) NULL ,
"HANDLER_TYPE_" NVARCHAR2(255) NULL ,
"HANDLER_CFG_" NVARCHAR2(2000) NULL ,
"TENANT_ID_" NVARCHAR2(255) DEFAULT ''  NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of AOS_WF_RU_JOB
-- ----------------------------

-- ----------------------------
-- Table structure for AOS_WF_RU_TASK
-- ----------------------------
DROP TABLE "AOS_WF_RU_TASK";
CREATE TABLE "AOS_WF_RU_TASK" (
"ID_" NVARCHAR2(64) NOT NULL ,
"REV_" NUMBER NULL ,
"EXECUTION_ID_" NVARCHAR2(64) NULL ,
"PROC_INST_ID_" NVARCHAR2(64) NULL ,
"PROC_DEF_ID_" NVARCHAR2(64) NULL ,
"NAME_" NVARCHAR2(255) NULL ,
"PARENT_TASK_ID_" NVARCHAR2(64) NULL ,
"DESCRIPTION_" NVARCHAR2(2000) NULL ,
"TASK_DEF_KEY_" NVARCHAR2(255) NULL ,
"OWNER_" NVARCHAR2(255) NULL ,
"ASSIGNEE_" NVARCHAR2(255) NULL ,
"DELEGATION_" NVARCHAR2(64) NULL ,
"PRIORITY_" NUMBER NULL ,
"CREATE_TIME_" TIMESTAMP(6)  NULL ,
"DUE_DATE_" TIMESTAMP(6)  NULL ,
"CATEGORY_" NVARCHAR2(255) NULL ,
"SUSPENSION_STATE_" NUMBER NULL ,
"TENANT_ID_" NVARCHAR2(255) DEFAULT ''  NULL ,
"FORM_KEY_" NVARCHAR2(255) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of AOS_WF_RU_TASK
-- ----------------------------

-- ----------------------------
-- Table structure for AOS_WF_RU_VARIABLE
-- ----------------------------
DROP TABLE "AOS_WF_RU_VARIABLE";
CREATE TABLE "AOS_WF_RU_VARIABLE" (
"ID_" NVARCHAR2(64) NOT NULL ,
"REV_" NUMBER NULL ,
"TYPE_" NVARCHAR2(255) NOT NULL ,
"NAME_" NVARCHAR2(255) NOT NULL ,
"EXECUTION_ID_" NVARCHAR2(64) NULL ,
"PROC_INST_ID_" NVARCHAR2(64) NULL ,
"TASK_ID_" NVARCHAR2(64) NULL ,
"BYTEARRAY_ID_" NVARCHAR2(64) NULL ,
"DOUBLE_" NUMBER NULL ,
"LONG_" NUMBER(19) NULL ,
"TEXT_" NVARCHAR2(2000) NULL ,
"TEXT2_" NVARCHAR2(2000) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of AOS_WF_RU_VARIABLE
-- ----------------------------

-- ----------------------------
-- Procedure structure for AOS_PROC_DEMO
-- ----------------------------
CREATE OR REPLACE procedure "AOS_PROC_DEMO"(prm_name      IN VARCHAR2, --持卡人
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

-- ----------------------------
-- Procedure structure for AOS_PROC_DEMO2
-- ----------------------------
CREATE OR REPLACE procedure "AOS_PROC_DEMO2"(prm_name_ IN VARCHAR2, -- 模块名称
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

-- ----------------------------
-- Sequence structure for AOS_WF_EVT_LOG_SEQ
-- ----------------------------
DROP SEQUENCE "AOS_WF_EVT_LOG_SEQ";
CREATE SEQUENCE "AOS_WF_EVT_LOG_SEQ"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 999999999999999999999999999
 START WITH 1
 CACHE 20;

-- ----------------------------
-- Indexes structure for table AOS_LOG_SESSION
-- ----------------------------

-- ----------------------------
-- Checks structure for table AOS_LOG_SESSION
-- ----------------------------
ALTER TABLE "AOS_LOG_SESSION" ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "AOS_LOG_SESSION" ADD CHECK ("USER_ID_" IS NOT NULL);
ALTER TABLE "AOS_LOG_SESSION" ADD CHECK ("ACCOUNT_" IS NOT NULL);
ALTER TABLE "AOS_LOG_SESSION" ADD CHECK ("USER_NAME_" IS NOT NULL);
ALTER TABLE "AOS_LOG_SESSION" ADD CHECK ("CREATE_TIME_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_LOG_SESSION
-- ----------------------------
ALTER TABLE "AOS_LOG_SESSION" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_SYS_CATALOG
-- ----------------------------
CREATE UNIQUE INDEX "AOS_SYS_CATALOG_UKEY"
ON "AOS_SYS_CATALOG" ("CASCADE_ID_" ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_SYS_CATALOG
-- ----------------------------
ALTER TABLE "AOS_SYS_CATALOG" ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_CATALOG" ADD CHECK ("CASCADE_ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_CATALOG" ADD CHECK ("ROOT_KEY_" IS NOT NULL);
ALTER TABLE "AOS_SYS_CATALOG" ADD CHECK ("ROOT_NAME_" IS NOT NULL);
ALTER TABLE "AOS_SYS_CATALOG" ADD CHECK ("NAME_" IS NOT NULL);
ALTER TABLE "AOS_SYS_CATALOG" ADD CHECK ("PARENT_ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_CATALOG" ADD CHECK ("IS_LEAF_" IS NOT NULL);
ALTER TABLE "AOS_SYS_CATALOG" ADD CHECK ("IS_AUTO_EXPAND_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_CATALOG
-- ----------------------------
ALTER TABLE "AOS_SYS_CATALOG" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_SYS_DIC
-- ----------------------------

-- ----------------------------
-- Checks structure for table AOS_SYS_DIC
-- ----------------------------
ALTER TABLE "AOS_SYS_DIC" ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_DIC" ADD CHECK ("CODE_" IS NOT NULL);
ALTER TABLE "AOS_SYS_DIC" ADD CHECK ("DESC_" IS NOT NULL);
ALTER TABLE "AOS_SYS_DIC" ADD CHECK ("STATUS_" IS NOT NULL);
ALTER TABLE "AOS_SYS_DIC" ADD CHECK ("DIC_INDEX_ID_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_DIC
-- ----------------------------
ALTER TABLE "AOS_SYS_DIC" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_SYS_DIC_INDEX
-- ----------------------------
CREATE UNIQUE INDEX "AOS_SYS_DIC_INDEX_UKEY"
ON "AOS_SYS_DIC_INDEX" ("KEY_" ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_SYS_DIC_INDEX
-- ----------------------------
ALTER TABLE "AOS_SYS_DIC_INDEX" ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_DIC_INDEX" ADD CHECK ("KEY_" IS NOT NULL);
ALTER TABLE "AOS_SYS_DIC_INDEX" ADD CHECK ("NAME_" IS NOT NULL);
ALTER TABLE "AOS_SYS_DIC_INDEX" ADD CHECK ("CATALOG_ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_DIC_INDEX" ADD CHECK ("CATALOG_CASCADE_ID_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_DIC_INDEX
-- ----------------------------
ALTER TABLE "AOS_SYS_DIC_INDEX" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_SYS_ICON
-- ----------------------------
CREATE INDEX "AOS_SYS_ICON_UKEY"
ON "AOS_SYS_ICON" ("NAME_" ASC, "TYPE_" ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_SYS_ICON
-- ----------------------------
ALTER TABLE "AOS_SYS_ICON" ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_ICON" ADD CHECK ("NAME_" IS NOT NULL);
ALTER TABLE "AOS_SYS_ICON" ADD CHECK ("TYPE_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_ICON
-- ----------------------------
ALTER TABLE "AOS_SYS_ICON" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_SYS_MODULE
-- ----------------------------

-- ----------------------------
-- Checks structure for table AOS_SYS_MODULE
-- ----------------------------
ALTER TABLE "AOS_SYS_MODULE" ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_MODULE" ADD CHECK ("CASCADE_ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_MODULE" ADD CHECK ("NAME_" IS NOT NULL);
ALTER TABLE "AOS_SYS_MODULE" ADD CHECK ("PARENT_ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_MODULE" ADD CHECK ("IS_LEAF_" IS NOT NULL);
ALTER TABLE "AOS_SYS_MODULE" ADD CHECK ("IS_AUTO_EXPAND_" IS NOT NULL);
ALTER TABLE "AOS_SYS_MODULE" ADD CHECK ("STATUS_" IS NOT NULL);
ALTER TABLE "AOS_SYS_MODULE" ADD CHECK ("PARENT_NAME_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_MODULE
-- ----------------------------
ALTER TABLE "AOS_SYS_MODULE" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_SYS_MODULE_POST
-- ----------------------------
CREATE INDEX "AOS_SYS_MODULE_POST_UKEY"
ON "AOS_SYS_MODULE_POST" ("POST_ID_" ASC, "MODULE_ID_" ASC, "GRANT_TYPE_" ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_SYS_MODULE_POST
-- ----------------------------
ALTER TABLE "AOS_SYS_MODULE_POST" ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_MODULE_POST" ADD CHECK ("POST_ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_MODULE_POST" ADD CHECK ("MODULE_ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_MODULE_POST" ADD CHECK ("GRANT_TYPE_" IS NOT NULL);
ALTER TABLE "AOS_SYS_MODULE_POST" ADD CHECK ("OPERATE_TIME_" IS NOT NULL);
ALTER TABLE "AOS_SYS_MODULE_POST" ADD CHECK ("OPERATOR_ID_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_MODULE_POST
-- ----------------------------
ALTER TABLE "AOS_SYS_MODULE_POST" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_SYS_MODULE_ROLE
-- ----------------------------
CREATE INDEX "AOS_SYS_MOOLE_ROLE_UKEY"
ON "AOS_SYS_MODULE_ROLE" ("ROLE_ID_" ASC, "MODULE_ID_" ASC, "GRANT_TYPE_" ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_SYS_MODULE_ROLE
-- ----------------------------
ALTER TABLE "AOS_SYS_MODULE_ROLE" ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_MODULE_ROLE" ADD CHECK ("ROLE_ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_MODULE_ROLE" ADD CHECK ("MODULE_ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_MODULE_ROLE" ADD CHECK ("GRANT_TYPE_" IS NOT NULL);
ALTER TABLE "AOS_SYS_MODULE_ROLE" ADD CHECK ("OPERATE_TIME_" IS NOT NULL);
ALTER TABLE "AOS_SYS_MODULE_ROLE" ADD CHECK ("OPERATOR_ID_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_MODULE_ROLE
-- ----------------------------
ALTER TABLE "AOS_SYS_MODULE_ROLE" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_SYS_MODULE_USER
-- ----------------------------
CREATE INDEX "AOS_SYS_MODULE_USER_UKEY"
ON "AOS_SYS_MODULE_USER" ("USER_ID_" ASC, "MODULE_ID_" ASC, "GRANT_TYPE_" ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_SYS_MODULE_USER
-- ----------------------------
ALTER TABLE "AOS_SYS_MODULE_USER" ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_MODULE_USER" ADD CHECK ("USER_ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_MODULE_USER" ADD CHECK ("MODULE_ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_MODULE_USER" ADD CHECK ("GRANT_TYPE_" IS NOT NULL);
ALTER TABLE "AOS_SYS_MODULE_USER" ADD CHECK ("OPERATE_TIME_" IS NOT NULL);
ALTER TABLE "AOS_SYS_MODULE_USER" ADD CHECK ("OPERATOR_ID_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_MODULE_USER
-- ----------------------------
ALTER TABLE "AOS_SYS_MODULE_USER" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_SYS_MODULE_USER_NAV
-- ----------------------------
CREATE INDEX "AOS_SYS_MODULE_USER_NAV_UKEY"
ON "AOS_SYS_MODULE_USER_NAV" ("MODULE_ID_" ASC, "USER_ID_" ASC, "TYPE_" ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_SYS_MODULE_USER_NAV
-- ----------------------------
ALTER TABLE "AOS_SYS_MODULE_USER_NAV" ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_MODULE_USER_NAV" ADD CHECK ("MODULE_ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_MODULE_USER_NAV" ADD CHECK ("USER_ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_MODULE_USER_NAV" ADD CHECK ("TYPE_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_MODULE_USER_NAV
-- ----------------------------
ALTER TABLE "AOS_SYS_MODULE_USER_NAV" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Checks structure for table AOS_SYS_ORG
-- ----------------------------
ALTER TABLE "AOS_SYS_ORG" ADD CHECK ("STATUS_" IS NOT NULL);
ALTER TABLE "AOS_SYS_ORG" ADD CHECK ("CREATE_TIME_" IS NOT NULL);
ALTER TABLE "AOS_SYS_ORG" ADD CHECK ("IS_AUTO_EXPAND_" IS NOT NULL);
ALTER TABLE "AOS_SYS_ORG" ADD CHECK ("PARENT_ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_ORG" ADD CHECK ("CASCADE_ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_ORG" ADD CHECK ("IS_LEAF_" IS NOT NULL);
ALTER TABLE "AOS_SYS_ORG" ADD CHECK ("NAME_" IS NOT NULL);
ALTER TABLE "AOS_SYS_ORG" ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_ORG" ADD CHECK ("TYPE_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_ORG
-- ----------------------------
ALTER TABLE "AOS_SYS_ORG" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_SYS_PAGE
-- ----------------------------

-- ----------------------------
-- Checks structure for table AOS_SYS_PAGE
-- ----------------------------
ALTER TABLE "AOS_SYS_PAGE" ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_PAGE" ADD CHECK ("MODULE_ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_PAGE" ADD CHECK ("TYPE_" IS NOT NULL);
ALTER TABLE "AOS_SYS_PAGE" ADD CHECK ("ENABLED_" IS NOT NULL);
ALTER TABLE "AOS_SYS_PAGE" ADD CHECK ("IS_DEFAULT_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_PAGE
-- ----------------------------
ALTER TABLE "AOS_SYS_PAGE" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_SYS_PAGE_EL
-- ----------------------------
CREATE INDEX "AOS_SYS_PAGE_EL_UKEY"
ON "AOS_SYS_PAGE_EL" ("DOM_ID_" ASC, "MODULE_ID_" ASC, "PAGE_ID_" ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_SYS_PAGE_EL
-- ----------------------------
ALTER TABLE "AOS_SYS_PAGE_EL" ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_PAGE_EL" ADD CHECK ("DOM_ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_PAGE_EL" ADD CHECK ("NAME_" IS NOT NULL);
ALTER TABLE "AOS_SYS_PAGE_EL" ADD CHECK ("TYPE_" IS NOT NULL);
ALTER TABLE "AOS_SYS_PAGE_EL" ADD CHECK ("MODULE_ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_PAGE_EL" ADD CHECK ("PAGE_ID_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_PAGE_EL
-- ----------------------------
ALTER TABLE "AOS_SYS_PAGE_EL" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_SYS_PAGE_EL_GRANT
-- ----------------------------

-- ----------------------------
-- Checks structure for table AOS_SYS_PAGE_EL_GRANT
-- ----------------------------
ALTER TABLE "AOS_SYS_PAGE_EL_GRANT" ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_PAGE_EL_GRANT" ADD CHECK ("EL_ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_PAGE_EL_GRANT" ADD CHECK ("GRANT_TYPE_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_PAGE_EL_GRANT
-- ----------------------------
ALTER TABLE "AOS_SYS_PAGE_EL_GRANT" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_SYS_PARAM
-- ----------------------------
CREATE UNIQUE INDEX "AOS_SYS_PARAM_UKEY"
ON "AOS_SYS_PARAM" ("KEY_" ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_SYS_PARAM
-- ----------------------------
ALTER TABLE "AOS_SYS_PARAM" ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_PARAM" ADD CHECK ("KEY_" IS NOT NULL);
ALTER TABLE "AOS_SYS_PARAM" ADD CHECK ("CATALOG_ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_PARAM" ADD CHECK ("CATALOG_CASCADE_ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_PARAM" ADD CHECK ("NAME_" IS NOT NULL);
ALTER TABLE "AOS_SYS_PARAM" ADD CHECK ("IS_OVERWRITE_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_PARAM
-- ----------------------------
ALTER TABLE "AOS_SYS_PARAM" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_SYS_POST
-- ----------------------------

-- ----------------------------
-- Checks structure for table AOS_SYS_POST
-- ----------------------------
ALTER TABLE "AOS_SYS_POST" ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_POST" ADD CHECK ("NAME_" IS NOT NULL);
ALTER TABLE "AOS_SYS_POST" ADD CHECK ("STATUS_" IS NOT NULL);
ALTER TABLE "AOS_SYS_POST" ADD CHECK ("TYPE_" IS NOT NULL);
ALTER TABLE "AOS_SYS_POST" ADD CHECK ("ORG_ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_POST" ADD CHECK ("CREATE_TIME_" IS NOT NULL);
ALTER TABLE "AOS_SYS_POST" ADD CHECK ("CREATER_ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_POST" ADD CHECK ("ORG_CASCADE_ID_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_POST
-- ----------------------------
ALTER TABLE "AOS_SYS_POST" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_SYS_ROLE
-- ----------------------------

-- ----------------------------
-- Checks structure for table AOS_SYS_ROLE
-- ----------------------------
ALTER TABLE "AOS_SYS_ROLE" ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_ROLE" ADD CHECK ("NAME_" IS NOT NULL);
ALTER TABLE "AOS_SYS_ROLE" ADD CHECK ("STATUS_" IS NOT NULL);
ALTER TABLE "AOS_SYS_ROLE" ADD CHECK ("TYPE_" IS NOT NULL);
ALTER TABLE "AOS_SYS_ROLE" ADD CHECK ("CREATE_TIME_" IS NOT NULL);
ALTER TABLE "AOS_SYS_ROLE" ADD CHECK ("CREATER_ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_ROLE" ADD CHECK ("CREATER_ORG_ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_ROLE" ADD CHECK ("CREATER_ORG_CASCADE_ID_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_ROLE
-- ----------------------------
ALTER TABLE "AOS_SYS_ROLE" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_SYS_SEQUENCE
-- ----------------------------
CREATE UNIQUE INDEX "AOS_SYS_SEQUENCE_UKEY"
ON "AOS_SYS_SEQUENCE" ("NAME_" ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_SYS_SEQUENCE
-- ----------------------------
ALTER TABLE "AOS_SYS_SEQUENCE" ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_SEQUENCE" ADD CHECK ("NAME_" IS NOT NULL);
ALTER TABLE "AOS_SYS_SEQUENCE" ADD CHECK ("STATUS_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_SEQUENCE
-- ----------------------------
ALTER TABLE "AOS_SYS_SEQUENCE" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_SYS_USER
-- ----------------------------

-- ----------------------------
-- Checks structure for table AOS_SYS_USER
-- ----------------------------
ALTER TABLE "AOS_SYS_USER" ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_USER" ADD CHECK ("ACCOUNT_" IS NOT NULL);
ALTER TABLE "AOS_SYS_USER" ADD CHECK ("PASSWORD_" IS NOT NULL);
ALTER TABLE "AOS_SYS_USER" ADD CHECK ("NAME_" IS NOT NULL);
ALTER TABLE "AOS_SYS_USER" ADD CHECK ("SEX_" IS NOT NULL);
ALTER TABLE "AOS_SYS_USER" ADD CHECK ("ORG_ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_USER" ADD CHECK ("STATUS_" IS NOT NULL);
ALTER TABLE "AOS_SYS_USER" ADD CHECK ("TYPE_" IS NOT NULL);
ALTER TABLE "AOS_SYS_USER" ADD CHECK ("CREATE_TIME_" IS NOT NULL);
ALTER TABLE "AOS_SYS_USER" ADD CHECK ("CREATER_ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_USER" ADD CHECK ("ORG_CASCADE_ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_USER" ADD CHECK ("DELETE_FLAG_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_USER
-- ----------------------------
ALTER TABLE "AOS_SYS_USER" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_SYS_USER_CFG
-- ----------------------------

-- ----------------------------
-- Checks structure for table AOS_SYS_USER_CFG
-- ----------------------------
ALTER TABLE "AOS_SYS_USER_CFG" ADD CHECK ("ID_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_USER_CFG
-- ----------------------------
ALTER TABLE "AOS_SYS_USER_CFG" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_SYS_USER_EXT
-- ----------------------------

-- ----------------------------
-- Checks structure for table AOS_SYS_USER_EXT
-- ----------------------------
ALTER TABLE "AOS_SYS_USER_EXT" ADD CHECK ("ID_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_USER_EXT
-- ----------------------------
ALTER TABLE "AOS_SYS_USER_EXT" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_SYS_USER_POST
-- ----------------------------
CREATE INDEX "AOS_SYS_USER_POST_UKEY"
ON "AOS_SYS_USER_POST" ("USER_ID_" ASC, "POST_ID_" ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_SYS_USER_POST
-- ----------------------------
ALTER TABLE "AOS_SYS_USER_POST" ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_USER_POST" ADD CHECK ("USER_ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_USER_POST" ADD CHECK ("POST_ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_USER_POST" ADD CHECK ("OPERATE_TIME_" IS NOT NULL);
ALTER TABLE "AOS_SYS_USER_POST" ADD CHECK ("OPERATOR_ID_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_USER_POST
-- ----------------------------
ALTER TABLE "AOS_SYS_USER_POST" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_SYS_USER_ROLE
-- ----------------------------
CREATE INDEX "AOS_SYS_USER_ROLE_UKEY"
ON "AOS_SYS_USER_ROLE" ("USER_ID_" ASC, "ROLE_ID_" ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_SYS_USER_ROLE
-- ----------------------------
ALTER TABLE "AOS_SYS_USER_ROLE" ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_USER_ROLE" ADD CHECK ("USER_ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_USER_ROLE" ADD CHECK ("ROLE_ID_" IS NOT NULL);
ALTER TABLE "AOS_SYS_USER_ROLE" ADD CHECK ("OPERATE_TIME_" IS NOT NULL);
ALTER TABLE "AOS_SYS_USER_ROLE" ADD CHECK ("OPERATOR_ID_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_USER_ROLE
-- ----------------------------
ALTER TABLE "AOS_SYS_USER_ROLE" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_WF_EVT_LOG
-- ----------------------------

-- ----------------------------
-- Checks structure for table AOS_WF_EVT_LOG
-- ----------------------------
ALTER TABLE "AOS_WF_EVT_LOG" ADD CHECK ("TIME_STAMP_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_WF_EVT_LOG
-- ----------------------------
ALTER TABLE "AOS_WF_EVT_LOG" ADD PRIMARY KEY ("LOG_NR_");

-- ----------------------------
-- Indexes structure for table AOS_WF_GE_BYTEARRAY
-- ----------------------------
CREATE INDEX "ACT_IDX_BYTEAR_DEPL"
ON "AOS_WF_GE_BYTEARRAY" ("DEPLOYMENT_ID_" ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_WF_GE_BYTEARRAY
-- ----------------------------
ALTER TABLE "AOS_WF_GE_BYTEARRAY" ADD CHECK (GENERATED_ IN (1,0));

-- ----------------------------
-- Primary Key structure for table AOS_WF_GE_BYTEARRAY
-- ----------------------------
ALTER TABLE "AOS_WF_GE_BYTEARRAY" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_WF_GE_PROPERTY
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table AOS_WF_GE_PROPERTY
-- ----------------------------
ALTER TABLE "AOS_WF_GE_PROPERTY" ADD PRIMARY KEY ("NAME_");

-- ----------------------------
-- Indexes structure for table AOS_WF_HI_ACTINST
-- ----------------------------
CREATE INDEX "ACT_IDX_HI_ACT_INST_END"
ON "AOS_WF_HI_ACTINST" ("END_TIME_" ASC)
LOGGING;
CREATE INDEX "ACT_IDX_HI_ACT_INST_EXEC"
ON "AOS_WF_HI_ACTINST" ("EXECUTION_ID_" ASC, "ACT_ID_" ASC)
LOGGING;
CREATE INDEX "ACT_IDX_HI_ACT_INST_PROCINST"
ON "AOS_WF_HI_ACTINST" ("PROC_INST_ID_" ASC, "ACT_ID_" ASC)
LOGGING;
CREATE INDEX "ACT_IDX_HI_ACT_INST_START"
ON "AOS_WF_HI_ACTINST" ("START_TIME_" ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_WF_HI_ACTINST
-- ----------------------------
ALTER TABLE "AOS_WF_HI_ACTINST" ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "AOS_WF_HI_ACTINST" ADD CHECK ("PROC_DEF_ID_" IS NOT NULL);
ALTER TABLE "AOS_WF_HI_ACTINST" ADD CHECK ("PROC_INST_ID_" IS NOT NULL);
ALTER TABLE "AOS_WF_HI_ACTINST" ADD CHECK ("EXECUTION_ID_" IS NOT NULL);
ALTER TABLE "AOS_WF_HI_ACTINST" ADD CHECK ("ACT_ID_" IS NOT NULL);
ALTER TABLE "AOS_WF_HI_ACTINST" ADD CHECK ("ACT_TYPE_" IS NOT NULL);
ALTER TABLE "AOS_WF_HI_ACTINST" ADD CHECK ("START_TIME_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_WF_HI_ACTINST
-- ----------------------------
ALTER TABLE "AOS_WF_HI_ACTINST" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_WF_HI_ATTACHMENT
-- ----------------------------

-- ----------------------------
-- Checks structure for table AOS_WF_HI_ATTACHMENT
-- ----------------------------
ALTER TABLE "AOS_WF_HI_ATTACHMENT" ADD CHECK ("ID_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_WF_HI_ATTACHMENT
-- ----------------------------
ALTER TABLE "AOS_WF_HI_ATTACHMENT" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_WF_HI_COMMENT
-- ----------------------------

-- ----------------------------
-- Checks structure for table AOS_WF_HI_COMMENT
-- ----------------------------
ALTER TABLE "AOS_WF_HI_COMMENT" ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "AOS_WF_HI_COMMENT" ADD CHECK ("TIME_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_WF_HI_COMMENT
-- ----------------------------
ALTER TABLE "AOS_WF_HI_COMMENT" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_WF_HI_DETAIL
-- ----------------------------
CREATE INDEX "ACT_IDX_HI_DETAIL_ACT_INST"
ON "AOS_WF_HI_DETAIL" ("ACT_INST_ID_" ASC)
LOGGING;
CREATE INDEX "ACT_IDX_HI_DETAIL_NAME"
ON "AOS_WF_HI_DETAIL" ("NAME_" ASC)
LOGGING;
CREATE INDEX "ACT_IDX_HI_DETAIL_PROC_INST"
ON "AOS_WF_HI_DETAIL" ("PROC_INST_ID_" ASC)
LOGGING;
CREATE INDEX "ACT_IDX_HI_DETAIL_TASK_ID"
ON "AOS_WF_HI_DETAIL" ("TASK_ID_" ASC)
LOGGING;
CREATE INDEX "ACT_IDX_HI_DETAIL_TIME"
ON "AOS_WF_HI_DETAIL" ("TIME_" ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_WF_HI_DETAIL
-- ----------------------------
ALTER TABLE "AOS_WF_HI_DETAIL" ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "AOS_WF_HI_DETAIL" ADD CHECK ("TYPE_" IS NOT NULL);
ALTER TABLE "AOS_WF_HI_DETAIL" ADD CHECK ("NAME_" IS NOT NULL);
ALTER TABLE "AOS_WF_HI_DETAIL" ADD CHECK ("TIME_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_WF_HI_DETAIL
-- ----------------------------
ALTER TABLE "AOS_WF_HI_DETAIL" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_WF_HI_IDENTITYLINK
-- ----------------------------
CREATE INDEX "ACT_IDX_HI_IDENT_LNK_PROCINST"
ON "AOS_WF_HI_IDENTITYLINK" ("PROC_INST_ID_" ASC)
LOGGING;
CREATE INDEX "ACT_IDX_HI_IDENT_LNK_TASK"
ON "AOS_WF_HI_IDENTITYLINK" ("TASK_ID_" ASC)
LOGGING;
CREATE INDEX "ACT_IDX_HI_IDENT_LNK_USER"
ON "AOS_WF_HI_IDENTITYLINK" ("USER_ID_" ASC)
LOGGING;

-- ----------------------------
-- Primary Key structure for table AOS_WF_HI_IDENTITYLINK
-- ----------------------------
ALTER TABLE "AOS_WF_HI_IDENTITYLINK" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_WF_HI_PROCINST
-- ----------------------------
CREATE INDEX "ACT_IDX_HI_PRO_INST_END"
ON "AOS_WF_HI_PROCINST" ("END_TIME_" ASC)
LOGGING;
CREATE INDEX "ACT_IDX_HI_PRO_I_BUSKEY"
ON "AOS_WF_HI_PROCINST" ("BUSINESS_KEY_" ASC)
LOGGING;

-- ----------------------------
-- Uniques structure for table AOS_WF_HI_PROCINST
-- ----------------------------
ALTER TABLE "AOS_WF_HI_PROCINST" ADD UNIQUE ("PROC_INST_ID_");

-- ----------------------------
-- Checks structure for table AOS_WF_HI_PROCINST
-- ----------------------------
ALTER TABLE "AOS_WF_HI_PROCINST" ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "AOS_WF_HI_PROCINST" ADD CHECK ("PROC_INST_ID_" IS NOT NULL);
ALTER TABLE "AOS_WF_HI_PROCINST" ADD CHECK ("PROC_DEF_ID_" IS NOT NULL);
ALTER TABLE "AOS_WF_HI_PROCINST" ADD CHECK ("START_TIME_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_WF_HI_PROCINST
-- ----------------------------
ALTER TABLE "AOS_WF_HI_PROCINST" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_WF_HI_TASKINST
-- ----------------------------
CREATE INDEX "ACT_IDX_HI_TASK_INST_PROCINST"
ON "AOS_WF_HI_TASKINST" ("PROC_INST_ID_" ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_WF_HI_TASKINST
-- ----------------------------
ALTER TABLE "AOS_WF_HI_TASKINST" ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "AOS_WF_HI_TASKINST" ADD CHECK ("START_TIME_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_WF_HI_TASKINST
-- ----------------------------
ALTER TABLE "AOS_WF_HI_TASKINST" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_WF_HI_VARINST
-- ----------------------------
CREATE INDEX "ACT_IDX_HI_PROCVAR_NAME_TYPE"
ON "AOS_WF_HI_VARINST" ("NAME_" ASC, "VAR_TYPE_" ASC)
LOGGING;
CREATE INDEX "ACT_IDX_HI_PROCVAR_PROC_INST"
ON "AOS_WF_HI_VARINST" ("PROC_INST_ID_" ASC)
LOGGING;
CREATE INDEX "ACT_IDX_HI_PROCVAR_TASK_ID"
ON "AOS_WF_HI_VARINST" ("TASK_ID_" ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_WF_HI_VARINST
-- ----------------------------
ALTER TABLE "AOS_WF_HI_VARINST" ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "AOS_WF_HI_VARINST" ADD CHECK ("NAME_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_WF_HI_VARINST
-- ----------------------------
ALTER TABLE "AOS_WF_HI_VARINST" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_WF_ID_GROUP
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table AOS_WF_ID_GROUP
-- ----------------------------
ALTER TABLE "AOS_WF_ID_GROUP" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_WF_ID_INFO
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table AOS_WF_ID_INFO
-- ----------------------------
ALTER TABLE "AOS_WF_ID_INFO" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_WF_ID_MEMBERSHIP
-- ----------------------------
CREATE INDEX "ACT_IDX_MEMB_GROUP"
ON "AOS_WF_ID_MEMBERSHIP" ("GROUP_ID_" ASC)
LOGGING;
CREATE INDEX "ACT_IDX_MEMB_USER"
ON "AOS_WF_ID_MEMBERSHIP" ("USER_ID_" ASC)
LOGGING;

-- ----------------------------
-- Primary Key structure for table AOS_WF_ID_MEMBERSHIP
-- ----------------------------
ALTER TABLE "AOS_WF_ID_MEMBERSHIP" ADD PRIMARY KEY ("USER_ID_", "GROUP_ID_");

-- ----------------------------
-- Indexes structure for table AOS_WF_ID_USER
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table AOS_WF_ID_USER
-- ----------------------------
ALTER TABLE "AOS_WF_ID_USER" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_WF_RE_DEPLOYMENT
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table AOS_WF_RE_DEPLOYMENT
-- ----------------------------
ALTER TABLE "AOS_WF_RE_DEPLOYMENT" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_WF_RE_MODEL
-- ----------------------------
CREATE INDEX "ACT_IDX_MODEL_DEPLOYMENT"
ON "AOS_WF_RE_MODEL" ("DEPLOYMENT_ID_" ASC)
LOGGING;
CREATE INDEX "ACT_IDX_MODEL_SOURCE"
ON "AOS_WF_RE_MODEL" ("EDITOR_SOURCE_VALUE_ID_" ASC)
LOGGING;
CREATE INDEX "ACT_IDX_MODEL_SOURCE_EXTRA"
ON "AOS_WF_RE_MODEL" ("EDITOR_SOURCE_EXTRA_VALUE_ID_" ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_WF_RE_MODEL
-- ----------------------------
ALTER TABLE "AOS_WF_RE_MODEL" ADD CHECK ("ID_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_WF_RE_MODEL
-- ----------------------------
ALTER TABLE "AOS_WF_RE_MODEL" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_WF_RE_PROCDEF
-- ----------------------------

-- ----------------------------
-- Uniques structure for table AOS_WF_RE_PROCDEF
-- ----------------------------
ALTER TABLE "AOS_WF_RE_PROCDEF" ADD UNIQUE ("KEY_", "VERSION_", "TENANT_ID_");

-- ----------------------------
-- Checks structure for table AOS_WF_RE_PROCDEF
-- ----------------------------
ALTER TABLE "AOS_WF_RE_PROCDEF" ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "AOS_WF_RE_PROCDEF" ADD CHECK ("KEY_" IS NOT NULL);
ALTER TABLE "AOS_WF_RE_PROCDEF" ADD CHECK ("VERSION_" IS NOT NULL);
ALTER TABLE "AOS_WF_RE_PROCDEF" ADD CHECK (HAS_START_FORM_KEY_ IN (1,0));
ALTER TABLE "AOS_WF_RE_PROCDEF" ADD CHECK (HAS_GRAPHICAL_NOTATION_ IN (1,0));

-- ----------------------------
-- Primary Key structure for table AOS_WF_RE_PROCDEF
-- ----------------------------
ALTER TABLE "AOS_WF_RE_PROCDEF" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_WF_RU_EVENT_SUBSCR
-- ----------------------------
CREATE INDEX "ACT_IDX_EVENT_SUBSCR"
ON "AOS_WF_RU_EVENT_SUBSCR" ("EXECUTION_ID_" ASC)
LOGGING;
CREATE INDEX "ACT_IDX_EVENT_SUBSCR_CONFIG_"
ON "AOS_WF_RU_EVENT_SUBSCR" ("CONFIGURATION_" ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_WF_RU_EVENT_SUBSCR
-- ----------------------------
ALTER TABLE "AOS_WF_RU_EVENT_SUBSCR" ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "AOS_WF_RU_EVENT_SUBSCR" ADD CHECK ("EVENT_TYPE_" IS NOT NULL);
ALTER TABLE "AOS_WF_RU_EVENT_SUBSCR" ADD CHECK ("CREATED_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_WF_RU_EVENT_SUBSCR
-- ----------------------------
ALTER TABLE "AOS_WF_RU_EVENT_SUBSCR" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_WF_RU_EXECUTION
-- ----------------------------
CREATE INDEX "ACT_IDX_EXEC_BUSKEY"
ON "AOS_WF_RU_EXECUTION" ("BUSINESS_KEY_" ASC)
LOGGING;
CREATE INDEX "ACT_IDX_EXE_PARENT"
ON "AOS_WF_RU_EXECUTION" ("PARENT_ID_" ASC)
LOGGING;
CREATE INDEX "ACT_IDX_EXE_PROCDEF"
ON "AOS_WF_RU_EXECUTION" ("PROC_DEF_ID_" ASC)
LOGGING;
CREATE INDEX "ACT_IDX_EXE_PROCINST"
ON "AOS_WF_RU_EXECUTION" ("PROC_INST_ID_" ASC)
LOGGING;
CREATE INDEX "ACT_IDX_EXE_SUPER"
ON "AOS_WF_RU_EXECUTION" ("SUPER_EXEC_" ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_WF_RU_EXECUTION
-- ----------------------------
ALTER TABLE "AOS_WF_RU_EXECUTION" ADD CHECK (IS_ACTIVE_ IN (1,0));
ALTER TABLE "AOS_WF_RU_EXECUTION" ADD CHECK (IS_CONCURRENT_ IN (1,0));
ALTER TABLE "AOS_WF_RU_EXECUTION" ADD CHECK (IS_SCOPE_ IN (1,0));
ALTER TABLE "AOS_WF_RU_EXECUTION" ADD CHECK (IS_EVENT_SCOPE_ IN (1,0));

-- ----------------------------
-- Primary Key structure for table AOS_WF_RU_EXECUTION
-- ----------------------------
ALTER TABLE "AOS_WF_RU_EXECUTION" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_WF_RU_IDENTITYLINK
-- ----------------------------
CREATE INDEX "ACT_IDX_ATHRZ_PROCEDEF"
ON "AOS_WF_RU_IDENTITYLINK" ("PROC_DEF_ID_" ASC)
LOGGING;
CREATE INDEX "ACT_IDX_IDENT_LNK_GROUP"
ON "AOS_WF_RU_IDENTITYLINK" ("GROUP_ID_" ASC)
LOGGING;
CREATE INDEX "ACT_IDX_IDENT_LNK_USER"
ON "AOS_WF_RU_IDENTITYLINK" ("USER_ID_" ASC)
LOGGING;
CREATE INDEX "ACT_IDX_IDL_PROCINST"
ON "AOS_WF_RU_IDENTITYLINK" ("PROC_INST_ID_" ASC)
LOGGING;
CREATE INDEX "ACT_IDX_TSKASS_TASK"
ON "AOS_WF_RU_IDENTITYLINK" ("TASK_ID_" ASC)
LOGGING;

-- ----------------------------
-- Primary Key structure for table AOS_WF_RU_IDENTITYLINK
-- ----------------------------
ALTER TABLE "AOS_WF_RU_IDENTITYLINK" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_WF_RU_JOB
-- ----------------------------
CREATE INDEX "ACT_IDX_JOB_EXCEPTION"
ON "AOS_WF_RU_JOB" ("EXCEPTION_STACK_ID_" ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_WF_RU_JOB
-- ----------------------------
ALTER TABLE "AOS_WF_RU_JOB" ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "AOS_WF_RU_JOB" ADD CHECK ("TYPE_" IS NOT NULL);
ALTER TABLE "AOS_WF_RU_JOB" ADD CHECK (EXCLUSIVE_ IN (1,0));

-- ----------------------------
-- Primary Key structure for table AOS_WF_RU_JOB
-- ----------------------------
ALTER TABLE "AOS_WF_RU_JOB" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_WF_RU_TASK
-- ----------------------------
CREATE INDEX "ACT_IDX_TASK_CREATE"
ON "AOS_WF_RU_TASK" ("CREATE_TIME_" ASC)
LOGGING;
CREATE INDEX "ACT_IDX_TASK_EXEC"
ON "AOS_WF_RU_TASK" ("EXECUTION_ID_" ASC)
LOGGING;
CREATE INDEX "ACT_IDX_TASK_PROCDEF"
ON "AOS_WF_RU_TASK" ("PROC_DEF_ID_" ASC)
LOGGING;
CREATE INDEX "ACT_IDX_TASK_PROCINST"
ON "AOS_WF_RU_TASK" ("PROC_INST_ID_" ASC)
LOGGING;

-- ----------------------------
-- Primary Key structure for table AOS_WF_RU_TASK
-- ----------------------------
ALTER TABLE "AOS_WF_RU_TASK" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table AOS_WF_RU_VARIABLE
-- ----------------------------
CREATE INDEX "ACT_IDX_VARIABLE_TASK_ID"
ON "AOS_WF_RU_VARIABLE" ("TASK_ID_" ASC)
LOGGING;
CREATE INDEX "ACT_IDX_VAR_BYTEARRAY"
ON "AOS_WF_RU_VARIABLE" ("BYTEARRAY_ID_" ASC)
LOGGING;
CREATE INDEX "ACT_IDX_VAR_EXE"
ON "AOS_WF_RU_VARIABLE" ("EXECUTION_ID_" ASC)
LOGGING;
CREATE INDEX "ACT_IDX_VAR_PROCINST"
ON "AOS_WF_RU_VARIABLE" ("PROC_INST_ID_" ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_WF_RU_VARIABLE
-- ----------------------------
ALTER TABLE "AOS_WF_RU_VARIABLE" ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "AOS_WF_RU_VARIABLE" ADD CHECK ("TYPE_" IS NOT NULL);
ALTER TABLE "AOS_WF_RU_VARIABLE" ADD CHECK ("NAME_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_WF_RU_VARIABLE
-- ----------------------------
ALTER TABLE "AOS_WF_RU_VARIABLE" ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Foreign Key structure for table "AOS_WF_GE_BYTEARRAY"
-- ----------------------------
ALTER TABLE "AOS_WF_GE_BYTEARRAY" ADD FOREIGN KEY ("DEPLOYMENT_ID_") REFERENCES "AOS_WF_RE_DEPLOYMENT" ("ID_");

-- ----------------------------
-- Foreign Key structure for table "AOS_WF_ID_MEMBERSHIP"
-- ----------------------------
ALTER TABLE "AOS_WF_ID_MEMBERSHIP" ADD FOREIGN KEY ("GROUP_ID_") REFERENCES "AOS_WF_ID_GROUP" ("ID_");
ALTER TABLE "AOS_WF_ID_MEMBERSHIP" ADD FOREIGN KEY ("USER_ID_") REFERENCES "AOS_WF_ID_USER" ("ID_");

-- ----------------------------
-- Foreign Key structure for table "AOS_WF_RE_MODEL"
-- ----------------------------
ALTER TABLE "AOS_WF_RE_MODEL" ADD FOREIGN KEY ("DEPLOYMENT_ID_") REFERENCES "AOS_WF_RE_DEPLOYMENT" ("ID_");
ALTER TABLE "AOS_WF_RE_MODEL" ADD FOREIGN KEY ("EDITOR_SOURCE_VALUE_ID_") REFERENCES "AOS_WF_GE_BYTEARRAY" ("ID_");
ALTER TABLE "AOS_WF_RE_MODEL" ADD FOREIGN KEY ("EDITOR_SOURCE_EXTRA_VALUE_ID_") REFERENCES "AOS_WF_GE_BYTEARRAY" ("ID_");

-- ----------------------------
-- Foreign Key structure for table "AOS_WF_RU_EVENT_SUBSCR"
-- ----------------------------
ALTER TABLE "AOS_WF_RU_EVENT_SUBSCR" ADD FOREIGN KEY ("EXECUTION_ID_") REFERENCES "AOS_WF_RU_EXECUTION" ("ID_");

-- ----------------------------
-- Foreign Key structure for table "AOS_WF_RU_EXECUTION"
-- ----------------------------
ALTER TABLE "AOS_WF_RU_EXECUTION" ADD FOREIGN KEY ("PARENT_ID_") REFERENCES "AOS_WF_RU_EXECUTION" ("ID_");
ALTER TABLE "AOS_WF_RU_EXECUTION" ADD FOREIGN KEY ("PROC_DEF_ID_") REFERENCES "AOS_WF_RE_PROCDEF" ("ID_");
ALTER TABLE "AOS_WF_RU_EXECUTION" ADD FOREIGN KEY ("PROC_INST_ID_") REFERENCES "AOS_WF_RU_EXECUTION" ("ID_");
ALTER TABLE "AOS_WF_RU_EXECUTION" ADD FOREIGN KEY ("SUPER_EXEC_") REFERENCES "AOS_WF_RU_EXECUTION" ("ID_");

-- ----------------------------
-- Foreign Key structure for table "AOS_WF_RU_IDENTITYLINK"
-- ----------------------------
ALTER TABLE "AOS_WF_RU_IDENTITYLINK" ADD FOREIGN KEY ("PROC_DEF_ID_") REFERENCES "AOS_WF_RE_PROCDEF" ("ID_");
ALTER TABLE "AOS_WF_RU_IDENTITYLINK" ADD FOREIGN KEY ("PROC_INST_ID_") REFERENCES "AOS_WF_RU_EXECUTION" ("ID_");
ALTER TABLE "AOS_WF_RU_IDENTITYLINK" ADD FOREIGN KEY ("TASK_ID_") REFERENCES "AOS_WF_RU_TASK" ("ID_");

-- ----------------------------
-- Foreign Key structure for table "AOS_WF_RU_JOB"
-- ----------------------------
ALTER TABLE "AOS_WF_RU_JOB" ADD FOREIGN KEY ("EXCEPTION_STACK_ID_") REFERENCES "AOS_WF_GE_BYTEARRAY" ("ID_");

-- ----------------------------
-- Foreign Key structure for table "AOS_WF_RU_TASK"
-- ----------------------------
ALTER TABLE "AOS_WF_RU_TASK" ADD FOREIGN KEY ("EXECUTION_ID_") REFERENCES "AOS_WF_RU_EXECUTION" ("ID_");
ALTER TABLE "AOS_WF_RU_TASK" ADD FOREIGN KEY ("PROC_DEF_ID_") REFERENCES "AOS_WF_RE_PROCDEF" ("ID_");
ALTER TABLE "AOS_WF_RU_TASK" ADD FOREIGN KEY ("PROC_INST_ID_") REFERENCES "AOS_WF_RU_EXECUTION" ("ID_");

-- ----------------------------
-- Foreign Key structure for table "AOS_WF_RU_VARIABLE"
-- ----------------------------
ALTER TABLE "AOS_WF_RU_VARIABLE" ADD FOREIGN KEY ("BYTEARRAY_ID_") REFERENCES "AOS_WF_GE_BYTEARRAY" ("ID_");
ALTER TABLE "AOS_WF_RU_VARIABLE" ADD FOREIGN KEY ("EXECUTION_ID_") REFERENCES "AOS_WF_RU_EXECUTION" ("ID_");
ALTER TABLE "AOS_WF_RU_VARIABLE" ADD FOREIGN KEY ("PROC_INST_ID_") REFERENCES "AOS_WF_RU_EXECUTION" ("ID_");
