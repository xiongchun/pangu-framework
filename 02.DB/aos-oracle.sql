/*
Navicat Oracle Data Transfer
Oracle Client Version : 11.2.0.4.0

Source Server         : 127.0.0.1_orcl_aos
Source Server Version : 100200
Source Host           : 127.0.0.1:1521
Source Schema         : AOS

Target Server Type    : ORACLE
Target Server Version : 100200
File Encoding         : 65001

Date: 2016-05-08 16:28:13
*/
--工具导出后修改 1、注释drop table 语句；2、删除建表语句中的空格

-- ----------------------------
-- Table structure for AOS_LOG_SESSION
-- ----------------------------
-- DROP TABLE AOS_LOG_SESSION;
CREATE TABLE AOS_LOG_SESSION (
ID_ VARCHAR2(64 BYTE) NOT NULL ,
USER_ID_ VARCHAR2(64 BYTE) NOT NULL ,
ACCOUNT_ VARCHAR2(255 BYTE) NOT NULL ,
USER_NAME_ VARCHAR2(255 BYTE) NOT NULL ,
IP_ADDRESS_ VARCHAR2(255 BYTE) NULL ,
CLIENT_TYPE_ VARCHAR2(255 BYTE) NULL ,
OWNER_ VARCHAR2(255 BYTE) NULL ,
CREATE_TIME_ DATE NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE
;
COMMENT ON TABLE AOS_LOG_SESSION IS '会话日志记录表';
COMMENT ON COLUMN AOS_LOG_SESSION.ID_ IS '会话ID';
COMMENT ON COLUMN AOS_LOG_SESSION.USER_ID_ IS '用户ID';
COMMENT ON COLUMN AOS_LOG_SESSION.ACCOUNT_ IS '登录帐户';
COMMENT ON COLUMN AOS_LOG_SESSION.USER_NAME_ IS '用户姓名';
COMMENT ON COLUMN AOS_LOG_SESSION.IP_ADDRESS_ IS '客户端IP地址';
COMMENT ON COLUMN AOS_LOG_SESSION.CLIENT_TYPE_ IS '客户端类型';
COMMENT ON COLUMN AOS_LOG_SESSION.OWNER_ IS '宿主';

-- ----------------------------
-- Records of AOS_LOG_SESSION
-- ----------------------------
INSERT INTO AOS_LOG_SESSION VALUES ('3q2odgynfqdtqvzn1g5pwhio', 'fa04db9dd2f54d61b0c8202a25de2dc6', 'root', '超级用户', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.155 Safari/537.36', 'PC1024500:10010', TO_DATE('2016-05-07 22:16:28', 'YYYY-MM-DD HH24:MI:SS'));

-- ----------------------------
-- Table structure for AOS_SYS_CATALOG
-- ----------------------------
-- DROP TABLE IF EXISTS AOS_SYS_CATALOG;
CREATE TABLE AOS_SYS_CATALOG (
ID_ VARCHAR2(64 BYTE) NOT NULL ,
CASCADE_ID_ VARCHAR2(255 BYTE) NOT NULL ,
ROOT_KEY_ VARCHAR2(255 BYTE) NOT NULL ,
ROOT_NAME_ VARCHAR2(255 BYTE) NOT NULL ,
NAME_ VARCHAR2(255 BYTE) NOT NULL ,
HOTKEY_ VARCHAR2(255 BYTE) NULL ,
PARENT_ID_ VARCHAR2(64 BYTE) NOT NULL ,
IS_LEAF_ VARCHAR2(255 BYTE) DEFAULT 1  NOT NULL ,
IS_AUTO_EXPAND_ VARCHAR2(255 BYTE) DEFAULT 0  NOT NULL ,
ICON_NAME_ VARCHAR2(255 BYTE) NULL ,
SORT_NO_ NUMBER(10) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE
;
COMMENT ON TABLE AOS_SYS_CATALOG IS '分类表';
COMMENT ON COLUMN AOS_SYS_CATALOG.ID_ IS '流水号';
COMMENT ON COLUMN AOS_SYS_CATALOG.CASCADE_ID_ IS '节点语义ID';
COMMENT ON COLUMN AOS_SYS_CATALOG.ROOT_KEY_ IS '科目标识键';
COMMENT ON COLUMN AOS_SYS_CATALOG.ROOT_NAME_ IS '科目名称';
COMMENT ON COLUMN AOS_SYS_CATALOG.NAME_ IS '分类名称';
COMMENT ON COLUMN AOS_SYS_CATALOG.HOTKEY_ IS '热键';
COMMENT ON COLUMN AOS_SYS_CATALOG.PARENT_ID_ IS '父节点流水号';
COMMENT ON COLUMN AOS_SYS_CATALOG.IS_LEAF_ IS '是否叶子节点';
COMMENT ON COLUMN AOS_SYS_CATALOG.IS_AUTO_EXPAND_ IS '是否自动展开';
COMMENT ON COLUMN AOS_SYS_CATALOG.ICON_NAME_ IS '图标文件名称';
COMMENT ON COLUMN AOS_SYS_CATALOG.SORT_NO_ IS '排序号';

-- ----------------------------
-- Records of AOS_SYS_CATALOG
-- ----------------------------
INSERT INTO AOS_SYS_CATALOG VALUES ('01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', 'PARAM_TYPE', '参数分类科目', '其它', null, '4018f65de18043c899b5e21ce7328df7', '1', '0', 'icon150.png', '9');
INSERT INTO AOS_SYS_CATALOG VALUES ('21d03054afdf43d69972cf6f7db6cfa3', '0.002', 'DIC_TYPE', '词典分类科目', '数据字典分类', null, '0', '0', '0', 'book.png', '2');
INSERT INTO AOS_SYS_CATALOG VALUES ('38368661c53c40b6824869a0ccffad05', '0.002.001.001', 'DIC_TYPE', '词典分类科目', '工作流', null, '4018a2217b0542059a26ecf3f605d60f', '1', '0', 'folder6.png', '1');
INSERT INTO AOS_SYS_CATALOG VALUES ('4018a2217b0542059a26ecf3f605d60f', '0.002.001', 'DIC_TYPE', '词典分类科目', '系统管理', null, '21d03054afdf43d69972cf6f7db6cfa3', '0', '1', 'folder22.png', '2');
INSERT INTO AOS_SYS_CATALOG VALUES ('4018f65de18043c899b5e21ce7328df7', '0.001.002', 'PARAM_TYPE', '参数分类科目', '系统参数', null, 'cd14928a239b448b867c2e45246cd038', '0', '1', 'folder22.png', '1');
INSERT INTO AOS_SYS_CATALOG VALUES ('4ee1d6e48b31487b849a72cd03d2512a', '0.001.001', 'PARAM_TYPE', '参数分类科目', '业务参数', null, 'cd14928a239b448b867c2e45246cd038', '1', '0', 'user20.png', '2');
INSERT INTO AOS_SYS_CATALOG VALUES ('6f94ef4ac17d4d098f91f0a4579f8591', '0.001.002.001', 'PARAM_TYPE', '参数分类科目', '验证码', null, '4018f65de18043c899b5e21ce7328df7', '1', '0', 'ok3.png', '2');
INSERT INTO AOS_SYS_CATALOG VALUES ('8d6c9869e8b2427cb16cf3f4777bf236', '0.002.007', 'DIC_TYPE', '词典分类科目', '范例', null, '21d03054afdf43d69972cf6f7db6cfa3', '1', '0', 'folder11.png', '10');
INSERT INTO AOS_SYS_CATALOG VALUES ('a072411787f545edb7e7c3c23fa6c0ff', '0.001.002.004', 'PARAM_TYPE', '参数分类科目', '导航与菜单', null, '4018f65de18043c899b5e21ce7328df7', '1', '0', 'icon152.png', '3');
INSERT INTO AOS_SYS_CATALOG VALUES ('aa3082ab67e24d8b884bc4504d3d9945', '0.002.002', 'DIC_TYPE', '词典分类科目', '全局通用', null, '21d03054afdf43d69972cf6f7db6cfa3', '1', '0', 'folder24.png', '3');
INSERT INTO AOS_SYS_CATALOG VALUES ('c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', 'DIC_TYPE', '词典分类科目', '平台配置', null, '21d03054afdf43d69972cf6f7db6cfa3', '1', '0', 'folder2.png', '1');
INSERT INTO AOS_SYS_CATALOG VALUES ('cd14928a239b448b867c2e45246cd038', '0.001', 'PARAM_TYPE', '参数分类科目', '参数分类', null, '0', '0', '0', 'book.png', '1');
INSERT INTO AOS_SYS_CATALOG VALUES ('f22f39171b484d81a604d3eb50b33584', '0.001.002.002', 'PARAM_TYPE', '参数分类科目', '界面显示', null, '4018f65de18043c899b5e21ce7328df7', '1', '0', 'icon59.png', '1');

-- ----------------------------
-- Table structure for AOS_SYS_DIC
-- ----------------------------
-- DROP TABLE IF EXISTS AOS_SYS_DIC;
CREATE TABLE AOS_SYS_DIC (
ID_ VARCHAR2(64 BYTE) NOT NULL ,
CODE_ VARCHAR2(255 BYTE) NOT NULL ,
DESC_ VARCHAR2(255 BYTE) NOT NULL ,
HOTKEY_ VARCHAR2(255 BYTE) NULL ,
STATUS_ VARCHAR2(255 BYTE) DEFAULT 1  NOT NULL ,
DIC_INDEX_ID_ VARCHAR2(64 BYTE) NOT NULL ,
REMARK_ VARCHAR2(4000 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE
;
COMMENT ON TABLE AOS_SYS_DIC IS '数据字典明细表';
COMMENT ON COLUMN AOS_SYS_DIC.ID_ IS '流水号';
COMMENT ON COLUMN AOS_SYS_DIC.CODE_ IS '字典对照码';
COMMENT ON COLUMN AOS_SYS_DIC.DESC_ IS '字典对照值';
COMMENT ON COLUMN AOS_SYS_DIC.HOTKEY_ IS ' 热键';
COMMENT ON COLUMN AOS_SYS_DIC.STATUS_ IS '当前状态';
COMMENT ON COLUMN AOS_SYS_DIC.DIC_INDEX_ID_ IS '所属字典流水号';
COMMENT ON COLUMN AOS_SYS_DIC.REMARK_ IS '备注';

-- ----------------------------
-- Records of AOS_SYS_DIC
-- ----------------------------
INSERT INTO AOS_SYS_DIC VALUES ('bc17f4f03f0d415c97a026e8ec5a999d', 'blue', '#6699CC', null, '1', '54e48c66b3ef4d99823ca8217a2abf43', null);
INSERT INTO AOS_SYS_DIC VALUES ('c172686bc21e40efacca63c5b7e1c9d3', 'blue', '#99bce8', null, '1', '1ec5d3c945de40469595c85955196e76', null);
INSERT INTO AOS_SYS_DIC VALUES ('c1c92ade06b94969b2b066184845781c', '6', '禁用', null, '1', '2794338c8b4946b99c361dae80da71b1', null);
INSERT INTO AOS_SYS_DIC VALUES ('c20e301598954f0ab33445680ca1db27', 'gray', '#F0F0F0', null, '1', '3146aefcb39344cebe6e0a9baa7a4a48', null);
INSERT INTO AOS_SYS_DIC VALUES ('c38ebb4d102440babfde6f6f8fbf5d00', '2', '办结', null, '1', '48062fd856f14794b03ceba2a1d6b60e', null);
INSERT INTO AOS_SYS_DIC VALUES ('c3e008a5ba864e21b5a66230e389926c', '1', '行政部门', null, '1', '58b28eade8604dffa7c531b7b42af2fa', null);
INSERT INTO AOS_SYS_DIC VALUES ('cc53b6f6235f413db559f4a7e7ba88e6', '1', '运行中', null, '1', 'a06eb2af650444db903c945030334b12', null);
INSERT INTO AOS_SYS_DIC VALUES ('cc8d6e844c3c46e0bfc973ef51dcb4a3', 'neptune', '#D0DDF2', null, '1', '3146aefcb39344cebe6e0a9baa7a4a48', null);
INSERT INTO AOS_SYS_DIC VALUES ('cd08dff488454293bc8aa8224eb719cb', 'password', '111111', null, '1', '2d977e97aacf4781836bac9f5e88ad2b', '数据库用户密码');
INSERT INTO AOS_SYS_DIC VALUES ('cde729266d09465ca624939dc05e6b4d', '2', 'UUID', null, '1', '2a9ac1749d224bef924cd258bf35254a', null);
INSERT INTO AOS_SYS_DIC VALUES ('ce49529f302f446d8e6e4576578ad459', '3', '注册用户', null, '1', '0475e71c145f49acbe781b2e7310ab64', null);
INSERT INTO AOS_SYS_DIC VALUES ('d93b044fec9941cd87ec8260fab2c9b9', 'gray', '#888888', null, '1', '54e48c66b3ef4d99823ca8217a2abf43', null);
INSERT INTO AOS_SYS_DIC VALUES ('e81beb66246441228ba1bb17190db222', '2', '管理权限', null, '1', 'dd9f74d16be14db5b0f6d79720c8f177', null);
INSERT INTO AOS_SYS_DIC VALUES ('ebe726f2cfa2434dbb7f943f6f42c3ad', '2', '超级用户', null, '1', '0475e71c145f49acbe781b2e7310ab64', null);
INSERT INTO AOS_SYS_DIC VALUES ('f08565c1fd7444bcb24645e52335a1e1', '1', '快捷菜单', null, '1', 'a9fd5aa3b7654326902a94e70bccedd8', null);
INSERT INTO AOS_SYS_DIC VALUES ('f1f754ae30d54e2895c32050ff4c1d3d', 'aos', 'aos.png', null, '1', 'e9e9cfc195514b05890a2249b81dfe73', null);
INSERT INTO AOS_SYS_DIC VALUES ('f4108659f1f8461db381c2808b82e038', '1', '启用', null, '1', '10a113b1dd6d492dad27c8b0a0fb7efc', null);
INSERT INTO AOS_SYS_DIC VALUES ('f5d18126770d42a4a6b922c3b67ed161', '1', '在线设计', null, '1', '483fb2ff35e84a42974e914851fae01a', null);
INSERT INTO AOS_SYS_DIC VALUES ('f624177f00ba4f15a60a8188856b5425', '1', 'APPID', null, '1', '2a9ac1749d224bef924cd258bf35254a', null);
INSERT INTO AOS_SYS_DIC VALUES ('f7b6f63fc5de469aaf90986188037516', 'neptune', '#006699', null, '1', '54e48c66b3ef4d99823ca8217a2abf43', null);
INSERT INTO AOS_SYS_DIC VALUES ('f97e6ea7f6fe4f6e8b7fde75f0074e2c', '1', '缺省', null, '1', '0475e71c145f49acbe781b2e7310ab64', null);
INSERT INTO AOS_SYS_DIC VALUES ('fac86f6625cb47fc8c1a4bab41dc1af4', 'ip', '127.0.0.1', null, '1', '2d977e97aacf4781836bac9f5e88ad2b', '数据库主机IP');
INSERT INTO AOS_SYS_DIC VALUES ('fedcb0e622734060a19a3d9b98e96f71', '4', '导入离线文本', null, '1', '483fb2ff35e84a42974e914851fae01a', null);
INSERT INTO AOS_SYS_DIC VALUES ('040e1d4d8a914145884553f170e1bcfd', '1', '缺省', null, '1', 'cfcbc48fd8ad42678a52334bac8aa299', null);
INSERT INTO AOS_SYS_DIC VALUES ('040fbde5cca746e7a90a9f888c033897', '4', '只读', null, '1', '2794338c8b4946b99c361dae80da71b1', null);
INSERT INTO AOS_SYS_DIC VALUES ('045e7dce267b4ef3b098ca00030220bf', '2', '金卡', null, '1', '2724924f1cdd48d1aa1a84cb7dd9b3ee', null);
INSERT INTO AOS_SYS_DIC VALUES ('074c63e541174ed0b7c71588936ae453', '1', '平铺', null, '1', 'ffc94f2b7ad14c78b14c46f8fab17543', null);
INSERT INTO AOS_SYS_DIC VALUES ('075a268cd7e14a728ca841e769b9d5a6', '1', '缺省', null, '1', '79004d064e954e55b832a8a9a4332576', null);
INSERT INTO AOS_SYS_DIC VALUES ('0825b66058c14bc5bfacdba1fd055af4', '2', '浮动菜单', null, '1', 'a9fd5aa3b7654326902a94e70bccedd8', '欢迎页显示的Mac风格的浮动菜单');
INSERT INTO AOS_SYS_DIC VALUES ('0ccc4a6e3df246d8bbd3ccb1d29eb4c4', '0', '停用', null, '1', '10a113b1dd6d492dad27c8b0a0fb7efc', null);
INSERT INTO AOS_SYS_DIC VALUES ('0ee3e8b931374725b213150b021507cc', 'catalog', 'aos', null, '1', '2d977e97aacf4781836bac9f5e88ad2b', '数据库名/实例名');
INSERT INTO AOS_SYS_DIC VALUES ('15f728ef5143444f9bfafa1c5c8a6a3b', '3', '隐藏', null, '1', '2794338c8b4946b99c361dae80da71b1', null);
INSERT INTO AOS_SYS_DIC VALUES ('1722aa532c4044ac8087579feac85f7f', 'neptune', 'neptune.png', null, '1', 'e9e9cfc195514b05890a2249b81dfe73', null);
INSERT INTO AOS_SYS_DIC VALUES ('17b249a462e7409baa99f36057fa79e7', '1', '是', null, '1', '91bc8a695b744b27ba66a94561fd6dbc', null);
INSERT INTO AOS_SYS_DIC VALUES ('1915d507f36d4ae688267ebca838d39f', 'blue', '#3399FF', null, '1', '61fd319a23b04bd1bdbce7037002976a', null);
INSERT INTO AOS_SYS_DIC VALUES ('1bb70ce5d6e649fd9179f3a3d35367f9', 'blue', 'left-logo.png', null, '1', 'fa8097dd670643f9a03722c4074ecba5', null);
INSERT INTO AOS_SYS_DIC VALUES ('1c2ebffd1b48420999ff57e2ec325270', '3', '未知', null, '1', 'f59d8693d8cf4f10850914e09ae9b93c', null);
INSERT INTO AOS_SYS_DIC VALUES ('1deee1b367ae4ccb81226a86eb7d9675', '1', '普卡', null, '1', '2724924f1cdd48d1aa1a84cb7dd9b3ee', null);
INSERT INTO AOS_SYS_DIC VALUES ('1fb134407f364baf8b857235c7828059', '2', '停用', null, '1', '0744eedeaaa143afa499254866aa75c9', null);
INSERT INTO AOS_SYS_DIC VALUES ('226489afb7ab4cf69107a78c60ed2267', 'PENDING', '代理中', null, '1', 'c66f06c069224241a4785e77d1406f9c', null);
INSERT INTO AOS_SYS_DIC VALUES ('23910ad1f9684644b214ff99209e94d4', '3', '关联页面', null, '1', '38841cd4f85f4ffb8c07c74650a130dc', '主页面上跳转出去的页面');
INSERT INTO AOS_SYS_DIC VALUES ('23a410439cf7459799c286745b123293', '1', '激活', null, '1', '2c90ab6212f44b08a1d8ed527c72795f', null);
INSERT INTO AOS_SYS_DIC VALUES ('24bca6d79bb14b5f97fbddbe5219705b', '1', '按钮|菜单下拉项', null, '1', '7d048854ccdc4eab996dcb703722065b', null);
INSERT INTO AOS_SYS_DIC VALUES ('27689b76c3cf4168a7efb737806e9ed7', '2', '已结束', null, '1', 'a06eb2af650444db903c945030334b12', null);
INSERT INTO AOS_SYS_DIC VALUES ('29462076b88f4facb86f7647c04119d0', '2', '子页面', null, '1', '38841cd4f85f4ffb8c07c74650a130dc', '在主页面上的子导航打开的页面(内嵌式的)');
INSERT INTO AOS_SYS_DIC VALUES ('2a5d03f79fd64c2090c9847d1b1484f0', '3', '待签收', null, '1', '48062fd856f14794b03ceba2a1d6b60e', null);
INSERT INTO AOS_SYS_DIC VALUES ('2bd5fc7756d74fe59f5b9372fd83d03c', '4', '分割符', null, '1', '38841cd4f85f4ffb8c07c74650a130dc', '子页面生成的二级导航菜单的分割符标识');
INSERT INTO AOS_SYS_DIC VALUES ('2ce972620b1d484e880ae17113f4cf05', 'tight', '组合按钮', null, '1', 'a19ac2af964c4a6e8af9c6f1c0d2673f', null);
INSERT INTO AOS_SYS_DIC VALUES ('2e2ef7ebcd5449a1a1b593f63ddb17ba', '3', '管理员封锁', null, '1', '0744eedeaaa143afa499254866aa75c9', null);
INSERT INTO AOS_SYS_DIC VALUES ('2ef4d36610334dc6bc9bd153be594da2', '3', 'DBSequence', null, '1', '2a9ac1749d224bef924cd258bf35254a', null);
INSERT INTO AOS_SYS_DIC VALUES ('2f9994a32b3e4afd96420c180155065a', '3', '矢量图标', null, '1', '21136c3dc660464d92fccd66408e149b', null);
INSERT INTO AOS_SYS_DIC VALUES ('3058d4cd6c514d23a27eee77b140a349', 'aos', 'left-logo.png', null, '1', 'fa8097dd670643f9a03722c4074ecba5', null);
INSERT INTO AOS_SYS_DIC VALUES ('338541a1b2094ea5a0e51ce81f9012de', 'port', '3306', null, '1', '2d977e97aacf4781836bac9f5e88ad2b', '数据库主机端口');
INSERT INTO AOS_SYS_DIC VALUES ('37a243f7cb96413386c3ea781051244e', '3', '工作组', null, '1', '58b28eade8604dffa7c531b7b42af2fa', null);
INSERT INTO AOS_SYS_DIC VALUES ('37d2d28ac8104f6481997b640c5d4fd0', '4', '其它', null, '1', '58b28eade8604dffa7c531b7b42af2fa', null);
INSERT INTO AOS_SYS_DIC VALUES ('3a4466b864744a0da3b93eec3f24dfff', 'blue', '天蓝', null, '1', '3ba3a682c2ac4d52982411dd045fae32', null);
INSERT INTO AOS_SYS_DIC VALUES ('3c56f07c48b746698591068c308064a7', 'gray', '银灰', null, '1', '3ba3a682c2ac4d52982411dd045fae32', null);
INSERT INTO AOS_SYS_DIC VALUES ('3f1b50a0f5be46a69597fca95c1e82d7', '2', '大图标[64X64]', null, '1', '21136c3dc660464d92fccd66408e149b', null);
INSERT INTO AOS_SYS_DIC VALUES ('4113d10127a34b4fa88b2d6b118accf0', '0', '否', null, '1', '91bc8a695b744b27ba66a94561fd6dbc', null);
INSERT INTO AOS_SYS_DIC VALUES ('462d4322dd6c408c8d2dfa1241c209f6', '2', '挂起', null, '1', '2c90ab6212f44b08a1d8ed527c72795f', null);
INSERT INTO AOS_SYS_DIC VALUES ('4ae7b6f7d54a4236ba9b18a9e05d7fb4', '4', '容器组件(窗口|面板|树|表格|工具栏等)', null, '1', '7d048854ccdc4eab996dcb703722065b', null);
INSERT INTO AOS_SYS_DIC VALUES ('4af1d58e374149f38c5ae9f76674a79f', 'aos', '#FAFAFA', null, '1', '61fd319a23b04bd1bdbce7037002976a', null);
INSERT INTO AOS_SYS_DIC VALUES ('4c5816e8db1c4f0995fbeb7a1b840685', '1', '主页面', null, '1', '38841cd4f85f4ffb8c07c74650a130dc', '点击主导航菜单打开的页面');
INSERT INTO AOS_SYS_DIC VALUES ('569b3bab75734c628a9bb0b3fbcd8922', '2', '显示', null, '1', '2794338c8b4946b99c361dae80da71b1', null);
INSERT INTO AOS_SYS_DIC VALUES ('58195ff7a3084df2a2dd5b401aa29a77', '0', '系统导航', null, '1', '4c2a12d3890a449fa91521a29a3c2436', null);
INSERT INTO AOS_SYS_DIC VALUES ('58fc07abcfdc46478ad14fb9d95214f6', 'dataBaseType', 'mysql', null, '1', '2d977e97aacf4781836bac9f5e88ad2b', '可选值：mysql、oracle、microsoft sql server、postgresql。');
INSERT INTO AOS_SYS_DIC VALUES ('5a53887315f7450e96816c1a46dc5b5e', '2', '项目组', null, '1', '58b28eade8604dffa7c531b7b42af2fa', null);
INSERT INTO AOS_SYS_DIC VALUES ('5c4196e15f47466ea19137666e455504', 'neptune', 'left-logo.png', null, '1', 'fa8097dd670643f9a03722c4074ecba5', null);
INSERT INTO AOS_SYS_DIC VALUES ('5dd1c5a1610544b490af86cc826e3663', '2', '表格列', null, '1', '7d048854ccdc4eab996dcb703722065b', null);
INSERT INTO AOS_SYS_DIC VALUES ('5de14be720b546ebb9676db86cdc5f6c', '2', '女', null, '1', 'f59d8693d8cf4f10850914e09ae9b93c', null);
INSERT INTO AOS_SYS_DIC VALUES ('5dfc1a71df524cd68311a95e7176cab7', 'gray', '#BCB0B0', null, '1', '1ec5d3c945de40469595c85955196e76', null);
INSERT INTO AOS_SYS_DIC VALUES ('6a05b8c8ce244c3f9b4872f812c689ec', '1', '经办权限', null, '1', 'dd9f74d16be14db5b0f6d79720c8f177', null);
INSERT INTO AOS_SYS_DIC VALUES ('6c575847953847ceb7d4675e94d78547', 'aos', '#99bce8', null, '1', '1ec5d3c945de40469595c85955196e76', null);
INSERT INTO AOS_SYS_DIC VALUES ('6e018ced3ae046de93d74630a97361a1', 'aos', '#006699', null, '1', '54e48c66b3ef4d99823ca8217a2abf43', null);
INSERT INTO AOS_SYS_DIC VALUES ('735edf2e8a1242078141405d344d3c84', '1', '未授权', null, '1', '2794338c8b4946b99c361dae80da71b1', null);
INSERT INTO AOS_SYS_DIC VALUES ('786d09295c904608868807b9e08238ee', 'neptune', '#c0c0c0', null, '1', '1ec5d3c945de40469595c85955196e76', null);
INSERT INTO AOS_SYS_DIC VALUES ('7b6226ba4b6b404bab3cc520d5c1e6b5', 'neptune', '海王星(水蓝)', null, '1', '3ba3a682c2ac4d52982411dd045fae32', null);
INSERT INTO AOS_SYS_DIC VALUES ('84552cfdf36f4fee92d81a49340495ca', 'blue', '#DFE8F6', null, '1', '3146aefcb39344cebe6e0a9baa7a4a48', null);
INSERT INTO AOS_SYS_DIC VALUES ('84ee7e35ab134ec1acd2cfd28d3915f6', 'standalone', '独立按钮', null, '1', 'a19ac2af964c4a6e8af9c6f1c0d2673f', null);
INSERT INTO AOS_SYS_DIC VALUES ('85f5017c1860434eacfceb519b8ad8cd', 'blue', 'blue.png', null, '1', 'e9e9cfc195514b05890a2249b81dfe73', null);
INSERT INTO AOS_SYS_DIC VALUES ('867c0aacba654feea60c22c5e4be9368', 'aos', 'red', null, '1', '3146aefcb39344cebe6e0a9baa7a4a48', null);
INSERT INTO AOS_SYS_DIC VALUES ('871d7ac8ec704614a15d29f540b8b439', 'true', '显示', null, '1', '33a73af4b729448b91c13acf4d0a31e1', null);
INSERT INTO AOS_SYS_DIC VALUES ('87923302cb424da9aa55b6a9ce77090b', '7', '激活', null, '1', '2794338c8b4946b99c361dae80da71b1', null);
INSERT INTO AOS_SYS_DIC VALUES ('89f8ab9369a64de09a8207829f520297', 'gray', 'gray.png', null, '1', 'e9e9cfc195514b05890a2249b81dfe73', null);
INSERT INTO AOS_SYS_DIC VALUES ('8b536d0c9a2e4e80b1edf91190b98253', '5', '编辑', null, '1', '2794338c8b4946b99c361dae80da71b1', null);
INSERT INTO AOS_SYS_DIC VALUES ('8da661446e6d4e9cb49d2eb5ab225cd0', '2', '树状', null, '1', 'ffc94f2b7ad14c78b14c46f8fab17543', null);
INSERT INTO AOS_SYS_DIC VALUES ('8e42e7df7bd044b89c7a5d5b59b44b18', '1', '男', null, '1', 'f59d8693d8cf4f10850914e09ae9b93c', null);
INSERT INTO AOS_SYS_DIC VALUES ('92dfd82860a0474da735575e9b91f6de', 'classic', '经典主题', null, '1', 'a44dd9bbf55041368882e88821309355', '上Banner-左导航-中经办。');
INSERT INTO AOS_SYS_DIC VALUES ('958235d21e2f4d44babd8ae7da7dd7f8', '99', '撤消授权', null, '1', '2794338c8b4946b99c361dae80da71b1', null);
INSERT INTO AOS_SYS_DIC VALUES ('99419e3ea3d64507aa507854fd210a75', '3', '表单元素(输入框|下拉框|选择框等)', null, '1', '7d048854ccdc4eab996dcb703722065b', null);
INSERT INTO AOS_SYS_DIC VALUES ('9d1c5da19d0b4ad9b97b570ed4481bf2', 'false', '隐藏', null, '1', '33a73af4b729448b91c13acf4d0a31e1', null);
INSERT INTO AOS_SYS_DIC VALUES ('9eb462a5fd0547b9898540b6e5a4ca98', 'gray', 'left-logo.png', null, '1', 'fa8097dd670643f9a03722c4074ecba5', null);
INSERT INTO AOS_SYS_DIC VALUES ('a603159d47b94145a32b51f659b47c09', '4', '系统封锁', null, '1', '0744eedeaaa143afa499254866aa75c9', null);
INSERT INTO AOS_SYS_DIC VALUES ('a63ab46c45b048b1a0d727c5f0d69f58', '3', '导入离线文件', null, '1', '483fb2ff35e84a42974e914851fae01a', null);
INSERT INTO AOS_SYS_DIC VALUES ('a871329cbeb343bea48a467e05e066f5', '2', '在线克隆', null, '1', '483fb2ff35e84a42974e914851fae01a', null);
INSERT INTO AOS_SYS_DIC VALUES ('a97934b734a94d70a71353bc78e572df', 'neptune', '#FAFAFA', null, '1', '61fd319a23b04bd1bdbce7037002976a', null);
INSERT INTO AOS_SYS_DIC VALUES ('a9bef6122ad7444999ce17b4ad5a0628', '2', '发现', null, '1', '4c2a12d3890a449fa91521a29a3c2436', null);
INSERT INTO AOS_SYS_DIC VALUES ('ac8049fc0ded42b09a3654ef547ac772', '1', '小图标[16X16]', null, '1', '21136c3dc660464d92fccd66408e149b', null);
INSERT INTO AOS_SYS_DIC VALUES ('b18435d1752a4a8c96628402298c0493', 'gray', '#555555', null, '1', '61fd319a23b04bd1bdbce7037002976a', null);
INSERT INTO AOS_SYS_DIC VALUES ('b1d95ea28e084b64b0f6a473e65fe2fd', 'aos', 'AOS', null, '0', '3ba3a682c2ac4d52982411dd045fae32', null);
INSERT INTO AOS_SYS_DIC VALUES ('b5bdcaeeccd44ad9aceae1968fbe0851', 'userName', 'root', null, '1', '2d977e97aacf4781836bac9f5e88ad2b', '数据库用户名');
INSERT INTO AOS_SYS_DIC VALUES ('b85f79702d094f348e1c9e79e67d95b7', '1', '待办', null, '1', '48062fd856f14794b03ceba2a1d6b60e', null);
INSERT INTO AOS_SYS_DIC VALUES ('ba5b0493f0544278a980e0f268baf83c', '1', '快捷菜单', null, '1', '4c2a12d3890a449fa91521a29a3c2436', null);
INSERT INTO AOS_SYS_DIC VALUES ('bbef93ea807847029e98ed7023b47c6a', '1', '正常', null, '1', '0744eedeaaa143afa499254866aa75c9', null);

-- ----------------------------
-- Table structure for AOS_SYS_DIC_INDEX
-- ----------------------------
-- DROP TABLE IF EXISTS AOS_SYS_DIC_INDEX;
CREATE TABLE AOS_SYS_DIC_INDEX (
ID_ VARCHAR2(64 BYTE) NOT NULL ,
KEY_ VARCHAR2(255 BYTE) NOT NULL ,
NAME_ VARCHAR2(255 BYTE) NOT NULL ,
HOTKEY_ VARCHAR2(255 BYTE) NULL ,
CATALOG_ID_ VARCHAR2(64 BYTE) NOT NULL ,
CATALOG_CASCADE_ID_ VARCHAR2(255 BYTE) NOT NULL ,
REMARK_ VARCHAR2(4000 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE
;
COMMENT ON TABLE AOS_SYS_DIC_INDEX IS '数据字典索引表';
COMMENT ON COLUMN AOS_SYS_DIC_INDEX.ID_ IS '流水号';
COMMENT ON COLUMN AOS_SYS_DIC_INDEX.KEY_ IS '字典标识';
COMMENT ON COLUMN AOS_SYS_DIC_INDEX.NAME_ IS '字典名称';
COMMENT ON COLUMN AOS_SYS_DIC_INDEX.HOTKEY_ IS '热键';
COMMENT ON COLUMN AOS_SYS_DIC_INDEX.CATALOG_ID_ IS '所属分类流水号';
COMMENT ON COLUMN AOS_SYS_DIC_INDEX.CATALOG_CASCADE_ID_ IS '所属分类流节点语义ID';
COMMENT ON COLUMN AOS_SYS_DIC_INDEX.REMARK_ IS '备注';

-- ----------------------------
-- Records of AOS_SYS_DIC_INDEX
-- ----------------------------
INSERT INTO AOS_SYS_DIC_INDEX VALUES ('cfcbc48fd8ad42678a52334bac8aa299', 'role_type_', '角色类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
INSERT INTO AOS_SYS_DIC_INDEX VALUES ('dd9f74d16be14db5b0f6d79720c8f177', 'grant_type_', '权限类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
INSERT INTO AOS_SYS_DIC_INDEX VALUES ('e9e9cfc195514b05890a2249b81dfe73', 'north_back_img_', '主页面north区域背景图片', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
INSERT INTO AOS_SYS_DIC_INDEX VALUES ('f59d8693d8cf4f10850914e09ae9b93c', 'sex_', '性别', null, 'aa3082ab67e24d8b884bc4504d3d9945', '0.002.002', null);
INSERT INTO AOS_SYS_DIC_INDEX VALUES ('fa8097dd670643f9a03722c4074ecba5', 'left_logo_', 'Banner左边logo图标', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
INSERT INTO AOS_SYS_DIC_INDEX VALUES ('ffc94f2b7ad14c78b14c46f8fab17543', 'nav_quick_layout_', '快捷菜单布局风格', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', '快捷菜单布局风格。');
INSERT INTO AOS_SYS_DIC_INDEX VALUES ('0475e71c145f49acbe781b2e7310ab64', 'user_type_', '用户类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
INSERT INTO AOS_SYS_DIC_INDEX VALUES ('0744eedeaaa143afa499254866aa75c9', 'user_status_', '用户状态', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
INSERT INTO AOS_SYS_DIC_INDEX VALUES ('10a113b1dd6d492dad27c8b0a0fb7efc', 'enabled_', '使能状态', null, 'aa3082ab67e24d8b884bc4504d3d9945', '0.002.002', null);
INSERT INTO AOS_SYS_DIC_INDEX VALUES ('1ec5d3c945de40469595c85955196e76', 'cmp_border_color_', '组件边框颜色', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
INSERT INTO AOS_SYS_DIC_INDEX VALUES ('21136c3dc660464d92fccd66408e149b', 'icon_type_', '图标类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
INSERT INTO AOS_SYS_DIC_INDEX VALUES ('2724924f1cdd48d1aa1a84cb7dd9b3ee', 'card_type_', '信用卡类型', null, '8d6c9869e8b2427cb16cf3f4777bf236', '0.002.007', null);
INSERT INTO AOS_SYS_DIC_INDEX VALUES ('2794338c8b4946b99c361dae80da71b1', 'cmp_grant_type_', '界面元素授权类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
INSERT INTO AOS_SYS_DIC_INDEX VALUES ('2a9ac1749d224bef924cd258bf35254a', 'sequence_type_', 'ID类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
INSERT INTO AOS_SYS_DIC_INDEX VALUES ('2c90ab6212f44b08a1d8ed527c72795f', 'procdef_suspension_state_', '流程定义活动状态', null, '38368661c53c40b6824869a0ccffad05', '0.002.001.001', null);
INSERT INTO AOS_SYS_DIC_INDEX VALUES ('2d977e97aacf4781836bac9f5e88ad2b', 'webide_jdbc', 'WebIDE模块使用的JDBC连接', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', 'WebIDE模块使用的JDBC连接。');
INSERT INTO AOS_SYS_DIC_INDEX VALUES ('3146aefcb39344cebe6e0a9baa7a4a48', 'south_back_color_', '主页面south区域背景颜色', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
INSERT INTO AOS_SYS_DIC_INDEX VALUES ('33a73af4b729448b91c13acf4d0a31e1', 'is_show_top_nav_', '是否显示顶部导航条', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', '是否显示水平导航条。(只有在导航模式为1的情况，此设置才有效,导航模式为2，则水平导航条不会消失)。可选值：true| false。');
INSERT INTO AOS_SYS_DIC_INDEX VALUES ('38841cd4f85f4ffb8c07c74650a130dc', 'page_type_', '页面类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
INSERT INTO AOS_SYS_DIC_INDEX VALUES ('3ba3a682c2ac4d52982411dd045fae32', 'skin_', '界面皮肤', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
INSERT INTO AOS_SYS_DIC_INDEX VALUES ('48062fd856f14794b03ceba2a1d6b60e', 'proctask_status_', '任务状态', null, '38368661c53c40b6824869a0ccffad05', '0.002.001.001', null);
INSERT INTO AOS_SYS_DIC_INDEX VALUES ('483fb2ff35e84a42974e914851fae01a', 'create_type_', '流程模型创建方式', null, '38368661c53c40b6824869a0ccffad05', '0.002.001.001', '业务流程模型创建方式');
INSERT INTO AOS_SYS_DIC_INDEX VALUES ('4c2a12d3890a449fa91521a29a3c2436', 'nav_tab_index_', '导航缺省活动页', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
INSERT INTO AOS_SYS_DIC_INDEX VALUES ('54e48c66b3ef4d99823ca8217a2abf43', 'main_text_color_', '边界区域字体主颜色', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
INSERT INTO AOS_SYS_DIC_INDEX VALUES ('58b28eade8604dffa7c531b7b42af2fa', 'org_type_', '组织类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
INSERT INTO AOS_SYS_DIC_INDEX VALUES ('61fd319a23b04bd1bdbce7037002976a', 'nav_text_color_', '导航文字颜色', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
INSERT INTO AOS_SYS_DIC_INDEX VALUES ('79004d064e954e55b832a8a9a4332576', 'post_type_', '岗位类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
INSERT INTO AOS_SYS_DIC_INDEX VALUES ('7d048854ccdc4eab996dcb703722065b', 'page_el_type_', '页面元素类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
INSERT INTO AOS_SYS_DIC_INDEX VALUES ('91bc8a695b744b27ba66a94561fd6dbc', 'bool_', '是否布尔值字典', null, 'aa3082ab67e24d8b884bc4504d3d9945', '0.002.002', null);
INSERT INTO AOS_SYS_DIC_INDEX VALUES ('a06eb2af650444db903c945030334b12', 'procinst_status_', '流程实例状态', null, '38368661c53c40b6824869a0ccffad05', '0.002.001.001', null);
INSERT INTO AOS_SYS_DIC_INDEX VALUES ('a19ac2af964c4a6e8af9c6f1c0d2673f', 'navbar_btn_style_', '顶部导航条按钮风格', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
INSERT INTO AOS_SYS_DIC_INDEX VALUES ('a44dd9bbf55041368882e88821309355', 'theme_', '系统主题', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
INSERT INTO AOS_SYS_DIC_INDEX VALUES ('a9fd5aa3b7654326902a94e70bccedd8', 'module_user_nav_type', '导航菜单类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
INSERT INTO AOS_SYS_DIC_INDEX VALUES ('c66f06c069224241a4785e77d1406f9c', 'delegation_', '委派状态', null, '38368661c53c40b6824869a0ccffad05', '0.002.001.001', '流程任务的委派代理状态');

-- ----------------------------
-- Table structure for AOS_SYS_ICON
-- ----------------------------
-- DROP TABLE IF EXISTS AOS_SYS_ICON;
CREATE TABLE AOS_SYS_ICON (
ID_ VARCHAR2(64 BYTE) NOT NULL ,
NAME_ VARCHAR2(255 BYTE) NOT NULL ,
TYPE_ VARCHAR2(255 BYTE) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE
;
COMMENT ON TABLE AOS_SYS_ICON IS '图标大全';
COMMENT ON COLUMN AOS_SYS_ICON.ID_ IS '流水号';
COMMENT ON COLUMN AOS_SYS_ICON.NAME_ IS '名称';
COMMENT ON COLUMN AOS_SYS_ICON.TYPE_ IS '类型';

-- ----------------------------
-- Records of AOS_SYS_ICON
-- ----------------------------
INSERT INTO AOS_SYS_ICON VALUES ('1001', 'fa-desktop', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1169', 'fa-deviantart', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1147', 'fa-digg', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1128', 'fa-dot-circle-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('789', 'fa-download', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1109', 'fa-dribbble', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1092', 'fa-dropbox', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1150', 'fa-drupal', '3');
INSERT INTO AOS_SYS_ICON VALUES ('842', 'fa-eject', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1052', 'fa-ellipsis-h', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1053', 'fa-ellipsis-v', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1187', 'fa-empire', '3');
INSERT INTO AOS_SYS_ICON VALUES ('963', 'fa-envelope', '3');
INSERT INTO AOS_SYS_ICON VALUES ('768', 'fa-envelope-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1135', 'fa-envelope-square', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1034', 'fa-eraser', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1069', 'fa-eur', '3');
INSERT INTO AOS_SYS_ICON VALUES ('975', 'fa-exchange', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1031', 'fa-exclamation', '3');
INSERT INTO AOS_SYS_ICON VALUES ('865', 'fa-exclamation-circle', '3');
INSERT INTO AOS_SYS_ICON VALUES ('871', 'fa-exclamation-triangle', '3');
INSERT INTO AOS_SYS_ICON VALUES ('860', 'fa-expand', '3');
INSERT INTO AOS_SYS_ICON VALUES ('899', 'fa-external-link', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1063', 'fa-external-link-square', '3');
INSERT INTO AOS_SYS_ICON VALUES ('869', 'fa-eye', '3');
INSERT INTO AOS_SYS_ICON VALUES ('870', 'fa-eye-slash', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1227', 'fa-eyedropper', '3');
INSERT INTO AOS_SYS_ICON VALUES ('910', 'fa-facebook', '3');
INSERT INTO AOS_SYS_ICON VALUES ('887', 'fa-facebook-square', '3');
INSERT INTO AOS_SYS_ICON VALUES ('834', 'fa-fast-backward', '3');
INSERT INTO AOS_SYS_ICON VALUES ('840', 'fa-fast-forward', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1153', 'fa-fax', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1113', 'fa-female', '3');
INSERT INTO AOS_SYS_ICON VALUES ('989', 'fa-fighter-jet', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1077', 'fa-file', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1177', 'fa-file-archive-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1178', 'fa-file-audio-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1180', 'fa-file-code-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1174', 'fa-file-excel-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1176', 'fa-file-image-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('786', 'fa-file-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1172', 'fa-file-pdf-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1175', 'fa-file-powerpoint-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1078', 'fa-file-text', '3');
INSERT INTO AOS_SYS_ICON VALUES ('984', 'fa-file-text-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1179', 'fa-file-video-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1173', 'fa-file-word-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('938', 'fa-files-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('773', 'fa-film', '3');
INSERT INTO AOS_SYS_ICON VALUES ('930', 'fa-filter', '3');
INSERT INTO AOS_SYS_ICON VALUES ('868', 'fa-fire', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1040', 'fa-fire-extinguisher', '3');
INSERT INTO AOS_SYS_ICON VALUES ('798', 'fa-flag', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1020', 'fa-flag-checkered', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1019', 'fa-flag-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('936', 'fa-flask', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1095', 'fa-flickr', '3');
INSERT INTO AOS_SYS_ICON VALUES ('940', 'fa-floppy-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('881', 'fa-folder', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1012', 'fa-folder-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('882', 'fa-folder-open', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1013', 'fa-folder-open-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('811', 'fa-font', '3');
INSERT INTO AOS_SYS_ICON VALUES ('839', 'fa-forward', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1111', 'fa-foursquare', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1015', 'fa-frown-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1204', 'fa-futbol-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1017', 'fa-gamepad', '3');
INSERT INTO AOS_SYS_ICON VALUES ('966', 'fa-gavel', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1070', 'fa-gbp', '3');
INSERT INTO AOS_SYS_ICON VALUES ('866', 'fa-gift', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1189', 'fa-git', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1188', 'fa-git-square', '3');
INSERT INTO AOS_SYS_ICON VALUES ('911', 'fa-github', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1011', 'fa-github-alt', '3');
INSERT INTO AOS_SYS_ICON VALUES ('902', 'fa-github-square', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1115', 'fa-gittip', '3');
INSERT INTO AOS_SYS_ICON VALUES ('765', 'fa-glass', '3');
INSERT INTO AOS_SYS_ICON VALUES ('927', 'fa-globe', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1141', 'fa-google', '3');
INSERT INTO AOS_SYS_ICON VALUES ('953', 'fa-google-plus', '3');
INSERT INTO AOS_SYS_ICON VALUES ('952', 'fa-google-plus-square', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1215', 'fa-google-wallet', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1139', 'fa-graduation-cap', '3');
INSERT INTO AOS_SYS_ICON VALUES ('991', 'fa-h-square', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1190', 'fa-hacker-news', '3');
INSERT INTO AOS_SYS_ICON VALUES ('922', 'fa-hand-o-down', '3');
INSERT INTO AOS_SYS_ICON VALUES ('920', 'fa-hand-o-left', '3');
INSERT INTO AOS_SYS_ICON VALUES ('919', 'fa-hand-o-right', '3');
INSERT INTO AOS_SYS_ICON VALUES ('921', 'fa-hand-o-up', '3');
INSERT INTO AOS_SYS_ICON VALUES ('915', 'fa-hdd-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1198', 'fa-header', '3');
INSERT INTO AOS_SYS_ICON VALUES ('799', 'fa-headphones', '3');
INSERT INTO AOS_SYS_ICON VALUES ('769', 'fa-heart', '3');
INSERT INTO AOS_SYS_ICON VALUES ('895', 'fa-heart-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1196', 'fa-history', '3');
INSERT INTO AOS_SYS_ICON VALUES ('785', 'fa-home', '3');
INSERT INTO AOS_SYS_ICON VALUES ('986', 'fa-hospital-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1047', 'fa-html5', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1242', 'fa-ils', '3');
INSERT INTO AOS_SYS_ICON VALUES ('792', 'fa-inbox', '3');
INSERT INTO AOS_SYS_ICON VALUES ('822', 'fa-indent', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1030', 'fa-info', '3');
INSERT INTO AOS_SYS_ICON VALUES ('850', 'fa-info-circle', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1072', 'fa-inr', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1094', 'fa-instagram', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1239', 'fa-ioxhost', '3');
INSERT INTO AOS_SYS_ICON VALUES ('813', 'fa-italic', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1151', 'fa-joomla', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1073', 'fa-jpy', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1183', 'fa-jsfiddle', '3');
INSERT INTO AOS_SYS_ICON VALUES ('889', 'fa-key', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1018', 'fa-keyboard-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1075', 'fa-krw', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1152', 'fa-language', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1002', 'fa-laptop', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1233', 'fa-lastfm', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1234', 'fa-lastfm-square', '3');
INSERT INTO AOS_SYS_ICON VALUES ('867', 'fa-leaf', '3');
INSERT INTO AOS_SYS_ICON VALUES ('904', 'fa-lemon-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1060', 'fa-level-down', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1059', 'fa-level-up', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1184', 'fa-life-ring', '3');
INSERT INTO AOS_SYS_ICON VALUES ('974', 'fa-lightbulb-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1232', 'fa-line-chart', '3');
INSERT INTO AOS_SYS_ICON VALUES ('934', 'fa-link', '3');
INSERT INTO AOS_SYS_ICON VALUES ('964', 'fa-linkedin', '3');
INSERT INTO AOS_SYS_ICON VALUES ('897', 'fa-linkedin-square', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1108', 'fa-linux', '3');
INSERT INTO AOS_SYS_ICON VALUES ('820', 'fa-list', '3');
INSERT INTO AOS_SYS_ICON VALUES ('796', 'fa-list-alt', '3');
INSERT INTO AOS_SYS_ICON VALUES ('944', 'fa-list-ol', '3');
INSERT INTO AOS_SYS_ICON VALUES ('943', 'fa-list-ul', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1025', 'fa-location-arrow', '3');
INSERT INTO AOS_SYS_ICON VALUES ('797', 'fa-lock', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1101', 'fa-long-arrow-down', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1103', 'fa-long-arrow-left', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1104', 'fa-long-arrow-right', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1102', 'fa-long-arrow-up', '3');
INSERT INTO AOS_SYS_ICON VALUES ('948', 'fa-magic', '3');
INSERT INTO AOS_SYS_ICON VALUES ('876', 'fa-magnet', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1114', 'fa-male', '3');
INSERT INTO AOS_SYS_ICON VALUES ('826', 'fa-map-marker', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1042', 'fa-maxcdn', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1243', 'fa-meanpath', '3');
INSERT INTO AOS_SYS_ICON VALUES ('988', 'fa-medkit', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1016', 'fa-meh-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1036', 'fa-microphone', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1037', 'fa-microphone-slash', '3');
INSERT INTO AOS_SYS_ICON VALUES ('863', 'fa-minus', '3');
INSERT INTO AOS_SYS_ICON VALUES ('846', 'fa-minus-circle', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1057', 'fa-minus-square', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1058', 'fa-minus-square-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1004', 'fa-mobile', '3');
INSERT INTO AOS_SYS_ICON VALUES ('954', 'fa-money', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1117', 'fa-moon-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('766', 'fa-music', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1211', 'fa-newspaper-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1137', 'fa-openid', '3');
INSERT INTO AOS_SYS_ICON VALUES ('821', 'fa-outdent', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1123', 'fa-pagelines', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1228', 'fa-paint-brush', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1194', 'fa-paper-plane', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1195', 'fa-paper-plane-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('939', 'fa-paperclip', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1199', 'fa-paragraph', '3');
INSERT INTO AOS_SYS_ICON VALUES ('837', 'fa-pause', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1156', 'fa-paw', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1214', 'fa-paypal', '3');
INSERT INTO AOS_SYS_ICON VALUES ('825', 'fa-pencil', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1062', 'fa-pencil-square', '3');
INSERT INTO AOS_SYS_ICON VALUES ('829', 'fa-pencil-square-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('905', 'fa-phone', '3');
INSERT INTO AOS_SYS_ICON VALUES ('908', 'fa-phone-square', '3');
INSERT INTO AOS_SYS_ICON VALUES ('824', 'fa-picture-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1231', 'fa-pie-chart', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1148', 'fa-pied-piper', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1149', 'fa-pied-piper-alt', '3');
INSERT INTO AOS_SYS_ICON VALUES ('950', 'fa-pinterest', '3');
INSERT INTO AOS_SYS_ICON VALUES ('951', 'fa-pinterest-square', '3');
INSERT INTO AOS_SYS_ICON VALUES ('872', 'fa-plane', '3');
INSERT INTO AOS_SYS_ICON VALUES ('836', 'fa-play', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1055', 'fa-play-circle', '3');
INSERT INTO AOS_SYS_ICON VALUES ('793', 'fa-play-circle-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1207', 'fa-plug', '3');
INSERT INTO AOS_SYS_ICON VALUES ('862', 'fa-plus', '3');
INSERT INTO AOS_SYS_ICON VALUES ('845', 'fa-plus-circle', '3');
INSERT INTO AOS_SYS_ICON VALUES ('992', 'fa-plus-square', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1132', 'fa-plus-square-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('781', 'fa-power-off', '3');
INSERT INTO AOS_SYS_ICON VALUES ('809', 'fa-print', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1035', 'fa-puzzle-piece', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1192', 'fa-qq', '3');
INSERT INTO AOS_SYS_ICON VALUES ('803', 'fa-qrcode', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1029', 'fa-question', '3');
INSERT INTO AOS_SYS_ICON VALUES ('849', 'fa-question-circle', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1006', 'fa-quote-left', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1007', 'fa-quote-right', '3');
INSERT INTO AOS_SYS_ICON VALUES ('874', 'fa-random', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1186', 'fa-rebel', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1164', 'fa-recycle', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1142', 'fa-reddit', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1143', 'fa-reddit-square', '3');
INSERT INTO AOS_SYS_ICON VALUES ('795', 'fa-refresh', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1122', 'fa-renren', '3');
INSERT INTO AOS_SYS_ICON VALUES ('794', 'fa-repeat', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1010', 'fa-reply', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1023', 'fa-reply-all', '3');
INSERT INTO AOS_SYS_ICON VALUES ('879', 'fa-retweet', '3');
INSERT INTO AOS_SYS_ICON VALUES ('788', 'fa-road', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1041', 'fa-rocket', '3');
INSERT INTO AOS_SYS_ICON VALUES ('914', 'fa-rss', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1054', 'fa-rss-square', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1074', 'fa-rub', '3');
INSERT INTO AOS_SYS_ICON VALUES ('937', 'fa-scissors', '3');
INSERT INTO AOS_SYS_ICON VALUES ('767', 'fa-search', '3');
INSERT INTO AOS_SYS_ICON VALUES ('780', 'fa-search-minus', '3');
INSERT INTO AOS_SYS_ICON VALUES ('779', 'fa-search-plus', '3');
INSERT INTO AOS_SYS_ICON VALUES ('859', 'fa-share', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1201', 'fa-share-alt', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1202', 'fa-share-alt-square', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1064', 'fa-share-square', '3');
INSERT INTO AOS_SYS_ICON VALUES ('830', 'fa-share-square-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1038', 'fa-shield', '3');
INSERT INTO AOS_SYS_ICON VALUES ('880', 'fa-shopping-cart', '3');
INSERT INTO AOS_SYS_ICON VALUES ('900', 'fa-sign-in', '3');
INSERT INTO AOS_SYS_ICON VALUES ('896', 'fa-sign-out', '3');
INSERT INTO AOS_SYS_ICON VALUES ('782', 'fa-signal', '3');
INSERT INTO AOS_SYS_ICON VALUES ('971', 'fa-sitemap', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1110', 'fa-skype', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1134', 'fa-slack', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1200', 'fa-sliders', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1208', 'fa-slideshare', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1014', 'fa-smile-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('960', 'fa-sort', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1079', 'fa-sort-alpha-asc', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1080', 'fa-sort-alpha-desc', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1081', 'fa-sort-amount-asc', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1082', 'fa-sort-amount-desc', '3');
INSERT INTO AOS_SYS_ICON VALUES ('962', 'fa-sort-asc', '3');
INSERT INTO AOS_SYS_ICON VALUES ('961', 'fa-sort-desc', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1083', 'fa-sort-numeric-asc', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1084', 'fa-sort-numeric-desc', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1170', 'fa-soundcloud', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1133', 'fa-space-shuttle', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1008', 'fa-spinner', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1157', 'fa-spoon', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1168', 'fa-spotify', '3');
INSERT INTO AOS_SYS_ICON VALUES ('941', 'fa-square', '3');
INSERT INTO AOS_SYS_ICON VALUES ('906', 'fa-square-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1124', 'fa-stack-exchange', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1093', 'fa-stack-overflow', '3');
INSERT INTO AOS_SYS_ICON VALUES ('770', 'fa-star', '3');
INSERT INTO AOS_SYS_ICON VALUES ('894', 'fa-star-half', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1024', 'fa-star-half-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('771', 'fa-star-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1162', 'fa-steam', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1163', 'fa-steam-square', '3');
INSERT INTO AOS_SYS_ICON VALUES ('833', 'fa-step-backward', '3');
INSERT INTO AOS_SYS_ICON VALUES ('841', 'fa-step-forward', '3');
INSERT INTO AOS_SYS_ICON VALUES ('979', 'fa-stethoscope', '3');
INSERT INTO AOS_SYS_ICON VALUES ('838', 'fa-stop', '3');
INSERT INTO AOS_SYS_ICON VALUES ('945', 'fa-strikethrough', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1145', 'fa-stumbleupon', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1144', 'fa-stumbleupon-circle', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1033', 'fa-subscript', '3');
INSERT INTO AOS_SYS_ICON VALUES ('980', 'fa-suitcase', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1116', 'fa-sun-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1032', 'fa-superscript', '3');
INSERT INTO AOS_SYS_ICON VALUES ('947', 'fa-table', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1003', 'fa-tablet', '3');
INSERT INTO AOS_SYS_ICON VALUES ('967', 'fa-tachometer', '3');
INSERT INTO AOS_SYS_ICON VALUES ('805', 'fa-tag', '3');
INSERT INTO AOS_SYS_ICON VALUES ('806', 'fa-tags', '3');
INSERT INTO AOS_SYS_ICON VALUES ('929', 'fa-tasks', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1166', 'fa-taxi', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1191', 'fa-tencent-weibo', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1021', 'fa-terminal', '3');
INSERT INTO AOS_SYS_ICON VALUES ('814', 'fa-text-height', '3');
INSERT INTO AOS_SYS_ICON VALUES ('815', 'fa-text-width', '3');
INSERT INTO AOS_SYS_ICON VALUES ('775', 'fa-th', '3');
INSERT INTO AOS_SYS_ICON VALUES ('774', 'fa-th-large', '3');
INSERT INTO AOS_SYS_ICON VALUES ('776', 'fa-th-list', '3');
INSERT INTO AOS_SYS_ICON VALUES ('898', 'fa-thumb-tack', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1086', 'fa-thumbs-down', '3');
INSERT INTO AOS_SYS_ICON VALUES ('893', 'fa-thumbs-o-down', '3');
INSERT INTO AOS_SYS_ICON VALUES ('892', 'fa-thumbs-o-up', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1085', 'fa-thumbs-up', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1056', 'fa-ticket', '3');
INSERT INTO AOS_SYS_ICON VALUES ('778', 'fa-times', '3');
INSERT INTO AOS_SYS_ICON VALUES ('847', 'fa-times-circle', '3');
INSERT INTO AOS_SYS_ICON VALUES ('852', 'fa-times-circle-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('828', 'fa-tint', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1235', 'fa-toggle-off', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1236', 'fa-toggle-on', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1224', 'fa-trash', '3');
INSERT INTO AOS_SYS_ICON VALUES ('784', 'fa-trash-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1167', 'fa-tree', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1112', 'fa-trello', '3');
INSERT INTO AOS_SYS_ICON VALUES ('901', 'fa-trophy', '3');
INSERT INTO AOS_SYS_ICON VALUES ('949', 'fa-truck', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1131', 'fa-try', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1205', 'fa-tty', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1099', 'fa-tumblr', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1100', 'fa-tumblr-square', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1209', 'fa-twitch', '3');
INSERT INTO AOS_SYS_ICON VALUES ('909', 'fa-twitter', '3');
INSERT INTO AOS_SYS_ICON VALUES ('886', 'fa-twitter-square', '3');
INSERT INTO AOS_SYS_ICON VALUES ('972', 'fa-umbrella', '3');
INSERT INTO AOS_SYS_ICON VALUES ('946', 'fa-underline', '3');
INSERT INTO AOS_SYS_ICON VALUES ('965', 'fa-undo', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1138', 'fa-university', '3');
INSERT INTO AOS_SYS_ICON VALUES ('912', 'fa-unlock', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1050', 'fa-unlock-alt', '3');
INSERT INTO AOS_SYS_ICON VALUES ('903', 'fa-upload', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1071', 'fa-usd', '3');
INSERT INTO AOS_SYS_ICON VALUES ('772', 'fa-user', '3');
INSERT INTO AOS_SYS_ICON VALUES ('978', 'fa-user-md', '3');
INSERT INTO AOS_SYS_ICON VALUES ('933', 'fa-users', '3');
INSERT INTO AOS_SYS_ICON VALUES ('823', 'fa-video-camera', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1130', 'fa-vimeo-square', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1181', 'fa-vine', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1120', 'fa-vk', '3');
INSERT INTO AOS_SYS_ICON VALUES ('801', 'fa-volume-down', '3');
INSERT INTO AOS_SYS_ICON VALUES ('800', 'fa-volume-off', '3');
INSERT INTO AOS_SYS_ICON VALUES ('802', 'fa-volume-up', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1121', 'fa-weibo', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1193', 'fa-weixin', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1129', 'fa-wheelchair', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1212', 'fa-wifi', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1106', 'fa-windows', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1136', 'fa-wordpress', '3');
INSERT INTO AOS_SYS_ICON VALUES ('928', 'fa-wrench', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1089', 'fa-xing', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1090', 'fa-xing-square', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1140', 'fa-yahoo', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1210', 'fa-yelp', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1088', 'fa-youtube', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1091', 'fa-youtube-play', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1087', 'fa-youtube-square', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1baf9b4c23594aff9d889c3a37ceacb6', 'filter.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('1c0c430bb2f44b52bebc808afad3a822', 'folder1.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('73442b4d747a44c9b9767410423d8b52', 'folder10.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('da27c91d3b264f7eb2aef9e35836db48', 'folder11.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('1a604dddd5ae448d9b9463131c1517db', 'folder12.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('4e281f7e04a645b08959560c18f63e62', 'folder13.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('143fb3019ba0402ca149d4a7fc41be0a', 'folder14.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('14750b70b3d3459e95c0a247488c5543', 'folder15.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('0a071424dfa8483ea012c5393e31e28a', 'folder16.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('5ac66ccd98584c2d8e70541aa4bf1f46', 'folder17.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('14b88ceea5e8466b9f413c9100f46541', 'folder18.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('61c1c37a55cb40c1993c683c5c9ae0d6', 'folder19.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('a344208821f648fe8ee41f7749aee0db', 'folder2.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('f14ec93420404bdf846ce7198a0182b6', 'folder20.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('b0f5eba0882a45079a0f3966dc53df9f', 'folder21.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('e1aa1ef518cb4702bac82220449abbcc', 'folder22.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('1c5eac8e5c30456782d3465977e7f086', 'folder23.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('2c39e332a2b844208ffec44fbebebfa5', 'folder24.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('9b5df6eb66a1427988f0dcb4471a1d45', 'folder25.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('4bf6b2303a304f63ab6639e721545356', 'folder26.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('fbea8ce436874bdbba82d129c350c14b', 'folder27.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('5f6b1dbe61084f2b8fe61536fc6e1226', 'folder28.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('473b7e69ded841fb83b823b9d0123a85', 'folder4.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('c3607c02487442ef8ca8812becc92530', 'folder5.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('d2244b2bd3ca49f6b8243c2c9b542173', 'folder6.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('5222f432c54041a79b0787d1648597f6', 'folder7.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('70d6d73569244e5caf981c2f756d0de6', 'folder8.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('87d116725d7c4f5f9abea8dce4c8be84', 'folder9.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('35e04100ff4a4e9d96c441566b0b317e', 'forward.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('2f37e28c3c6b4827b6033717dbbbc5df', 'freelance.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('6e1a289c8aa347d28f0e8a531415c11d', 'go.gif', '1');
INSERT INTO AOS_SYS_ICON VALUES ('55714690e924408195fe1cd0025bb713', 'go.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('e8ba480842c443008b5b22bc7a445617', 'go1.gif', '1');
INSERT INTO AOS_SYS_ICON VALUES ('c572057a98eb4eda83d63c18ed8e1440', 'go1.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('18db08f42d7348b8a48602c7e4a70582', 'help.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('792ea9660aec4810b8766311e2a26f8a', 'home.gif', '1');
INSERT INTO AOS_SYS_ICON VALUES ('6d98bcd139bc4f549e6d902269abb679', 'home.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('144ba848466c422aaa8ed3c3cf20f8c4', 'icon134.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('426562bb142848f199fbdc9996283e85', 'icon137.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('2f761bc057e64ba4909e3377e05533cf', 'icon140.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('7c2f282864c24744810769a5db59fb92', 'icon141.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('ab8f7baaa32b466b9003b6e8e7d0d51a', 'icon146.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('d015c6483d88419581556af2728d8551', 'icon15.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('3a6931e78c3846d3a75c786872204015', 'icon150.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('fcec578afbdd4429a39e9d96eaf09be3', 'icon152.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('9013ce3344dc4bfe98d441ab4ea10ab6', 'icon153.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('960c1fb7025e4f57a742ccc8c53c4002', 'icon154.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('8eda0bb5c0a84b16931180062e34ca73', 'icon17.gif', '1');
INSERT INTO AOS_SYS_ICON VALUES ('a197df64a56d41858da7a870ca26a487', 'icon25.gif', '1');
INSERT INTO AOS_SYS_ICON VALUES ('ebe8caeaf77a48ff887e1122908396d8', 'icon26.gif', '1');
INSERT INTO AOS_SYS_ICON VALUES ('f654403de45340608e729e78ca82c03a', 'icon31.gif', '1');
INSERT INTO AOS_SYS_ICON VALUES ('337c00d310d240c9b9e65f47df3c72bb', 'icon32.gif', '1');
INSERT INTO AOS_SYS_ICON VALUES ('6e48d223c61f46daad7e6479432cd763', 'icon34.gif', '1');
INSERT INTO AOS_SYS_ICON VALUES ('2415f0d36cab4253a6e54dd4e275325a', 'icon35.gif', '1');
INSERT INTO AOS_SYS_ICON VALUES ('b86d4a786afb42af8df8d2236cd1a0a1', 'icon36.gif', '1');
INSERT INTO AOS_SYS_ICON VALUES ('8c58e9688a284fe4b5f4c9c1ed551c5e', 'icon37.gif', '1');
INSERT INTO AOS_SYS_ICON VALUES ('0cf6eefdec56478389d557477af18cb2', 'icon38.gif', '1');
INSERT INTO AOS_SYS_ICON VALUES ('7f796cc3059248699cc32f2e62bab3b1', 'icon39.gif', '1');
INSERT INTO AOS_SYS_ICON VALUES ('9f0408c42a0440aca0937c788447d54f', 'icon41.gif', '1');
INSERT INTO AOS_SYS_ICON VALUES ('2bd6656f53e7498b92fb09716528394b', 'icon42.gif', '1');
INSERT INTO AOS_SYS_ICON VALUES ('5e14135349a24e1894200cb606edeba8', 'icon5.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('7dabf30aa90d49d192b7a9380e612816', 'icon56.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('03dc1ea6a1c642408c831627202a638d', 'icon59.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('9171ea0f076a46b7acf257f2f090de44', 'icon63.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('d2b7d9bfaf1444c1bdb7c6f8cdf365a8', 'icon65.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('967a235786d94b6eb60e0f177c4354cf', 'icon66.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('ce1feb874bcf4c088acfda24b2c440b2', 'icon67.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('8bcbcd182251455f8246e51b3fffee6b', 'icon68.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('6323d288e66d4e93bd585343d16f040d', 'icon7.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('c56bba79e8774ca98fcc1ce6f9e6d386', 'icon70.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('256b5aeed9f74faa8985e9e3dbed727c', 'icon71.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('803d5c7fc27d4f32a0c1b2f42c5cc1d8', 'icon72.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('da185cdc84914df7b73e0683eb15f05c', 'icon75.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('6acf334502a54e71a5c9fe1f3ed54da9', 'icon76.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('e8640cbe85754f7e8301c96f5d7a3900', 'icon77.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('a969728cb76f4d3ba5f5dd72159920c5', 'icon78.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('a48e0e2c021945ac9a5a11471ffbb7a5', 'icon79.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('8de7136a667b4285b69f19c057862421', 'icon8.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('81e10b6b52844b23a8bce2018be6c267', 'icon80.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('20cef761c78e47d3b6425ad2f0c4edb1', 'icon82.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('3afde4cf4c8b40deb600149d1dcfd66b', 'icon85.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('d0b1b4b7becb41fda3ac54a263d70c8d', 'icon86.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('07c575e9489e4680926335572b608f57', 'icon88.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('007a9fbf420248399f534b4e2cf0e1c0', 'icon9.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('bec8245f30b743c1b3ee0310b478c806', 'icon96.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('782523736f5a42fba167086e92893c0f', 'icon_19.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('3efbbf1c76fa406581e4243a6eadbb15', 'icq.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('f6237be28aef4daa963bf5ebe643b3ed', 'id.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('b9e936bf4b9a4824a7ad4870b3ea5bbd', 'ins.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('c649f90455504312b885216633f5a1d1', 'jar.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('05e6218477e34ec390a40f617c6700bf', 'key.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('62f6ecaa086049069ebb7db38faa6776', 'layout.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('812717901c8242489bd617dc330b26ad', 'layout2.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('e258914fb691499f8f5d50b440435d67', 'left.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('349c1847f7584499b683a6e94b08a4d3', 'lightbulb.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('907561e28ec24355b44296288bf11d73', 'lock.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('3c66e7d0900140808ce4b80b0ce09fff', 'lock3.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('41a1a152f2da4624bf877651b5eb29e0', 'modules_wizard.gif', '1');
INSERT INTO AOS_SYS_ICON VALUES ('e70d207843094c09a7e090c8814a9980', 'monitor.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('511ec93ed9af434282ad9d5539ccd9da', 'node.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('92c656594abe4787b58321dc8fedc0a1', 'ok.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('064f6505037e42dbadb98e27aa7db4d9', 'ok1.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('df27ffb5896e454f88a4a1d3391779a3', 'ok3.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('23e42a38f85e400ebc762060f7011253', 'ok4.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('c110aad7e7a046f2bb4976841372f607', 'ok5.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('6e990812617948fe931a86e519357fe8', 'org.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('2e53344d6b9b4fb1adaffec632e74897', 'org2.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('35b49190c48d4af584b4dda07c253a5c', 'outs.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('3008f35f33cb4a98a0388dc41b2e5373', 'own.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('de42451d28fa4126a076ba8b4f09d2f5', 'page.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('4121fc743815424f8f3f940af69df79a', 'page2.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('4ad28f42a70e446eab1c14db3fa5e70a', 'page3.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('698f281e799f40f4ab3498ed08be39a4', 'page_code.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('c8e5d3e8c7c1473db27c08e2e611711b', 'page_font.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('22198523572f41ebb2381e4a183d877f', 'page_next.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('62cf2ed24e4e461c94abb5a9abe5e683', 'page_office.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('b7ad2e3a35724e5a8b6f01716766db4a', 'page_paint.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('809975321e1647458e0db7d3d49ebed6', 'page_picture.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('133803dde52749a6b656d9e1003540c1', 'page_vector.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('711e604ce8034001b03262527d500e23', 'paint2.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('bfd235f00b2f48e4abeb24a1ca5afca5', 'paste.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('ccaf6bdcdeb44ab0a7368c147fab8e65', 'picture.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('5f07f0c5143b46fd83ef711f1d50e715', 'pictures.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('5603760c8a0246ae8d1bdcff31fadd81', 'picture_empty.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('1b16a0ad1b9641ddb3b8050c47149976', 'plugin.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('53d33394cae242f489bea0c50d726293', 'plugin2.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('3e0179bbe4e64618ab8365694834fe71', 'printer.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('2d0cc988b207437bae92815d8d98d4f9', 'query.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('e00df6459c55499dbc6cb67f54021e3e', 'redo.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('5a21811d4df54f7983e8c418b9c5c1a3', 'refresh.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('c56e21c9947f40fb84a610839b9cf00b', 'refresh2.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('1a4e7c58e2d54119af7c2aea637e2310', 'right.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('d77fcdacfb08437695a7e04d47243ccf', 'save.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('f12935b448314700b181620d0922db67', 'save_all.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('1d49a2905c8540309cf1a46a0721060e', 'search.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('c3bafe3755fc400db05fb6d93a6d5f59', 'security.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('f11ff9d66cf64ec6b037e228c95bda93', 'send_receive.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('ded21d3dda51487c997434ea65da381b', 'shape_align_bottom.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('ac0aa7a5768b4862a4abe99fb428f3a0', 'shape_align_center.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('101f39ec7029453aad7aa81e2ca11042', 'shape_align_middle.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('c2383a3c9d6945d0bd01562801677b34', 'shape_group.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('a01994ff9f794a9391159ea56efe62a9', 'shape_handles.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('11a3ad97dc284b85825af63167542040', 'shape_move_back.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('8c111d8f7b404ae28dc34ea9441b9a6f', 'share.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('e5acb5b077f04900b0bc57e9386b54f4', 'sitemap.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('f5df6b88023d4ea796193a3130e3dcbb', 'sql.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('a0a5b4218dd240a98cd911e024c6db6c', 'sql2.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('c59e996331fe4d9d8aa26747632dd8bc', 'sql3.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('b9e2a7879c894245838fe7dad1bed189', 'stop.gif', '1');
INSERT INTO AOS_SYS_ICON VALUES ('7d074e97cdf64a62818d1948b9b512ea', 'stop2.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('0672b133e51a44cdbc7199cab8bca7fb', 'stop3.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('8c2c52aecbf14cb697e95fa458100014', 'system.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('3df55e796fcb4e1f984b3716ad7d76f7', 'table.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('7118be6210a64c4c8612759f22fa95bc', 'table2.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('4cab8a14ef9e476c8da1b73eb524c923', 'tables.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('bbece7c0b0744f3a9f3d432f0cdd04df', 'tables_relation.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('b8ae6dfbab194316bfdfc4e7dbe42964', 'table_edit.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('320fb6a3064446daa198e22769ce2b15', 'tag.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('6b8405eecb164071abf1cd6c8eb0c657', 'task.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('aec9b1c3c79e41199cd93134a04eaa8d', 'task1.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('aef0a104574d42dea37debcd245ecf39', 'task_finish.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('e80bed5a53604e6d99f9df711fafe0a7', 'task_list.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('41597de05a574eec816c013502f89eeb', 'terminal.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('7f1adfc9ab57443f96f6b0e98096a56e', 'textfield.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('c375cc1467724f129abf014a953ae370', 'text_cap.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('b6197f73a2514ee7904643c77c7731c2', 'text_col.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('0b7986a188ee497fb94f6fdae045cfb0', 'text_list.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('31410057b57f40a0aed63eba8d4cd6ef', 'text_upper.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('6e117bfb64194214ac8f4f5da1829e93', 'theme.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('92b2b1c9ef2f43fa9e46875d41e9d081', 'time.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('1079777d6a3d47108d711a933b21e851', 'timeline.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('d367385d456043a1abe1c675825d4c38', 'undo.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('2d911cdcaf4a4c2ba018f20576dd206c', 'up.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('5079472358c549019841ddcf016ad2cd', 'up2.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('1ea8a628bd7c4447aa9e4f870e404f67', 'up_left.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('f4ff7dcb2d0f4a0b8afaa7be470cd06d', 'up_right.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('03e7724a9631410e9e4e9eec7203855f', 'user1.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('af34719b66f74fe484633e949a8543b4', 'user2.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('44407cdd2c574172be9877fccd42d3aa', 'user20.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('f4596067c6744c858e93c778a0ed64f0', 'user3.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('af9452de30334069abefe0fa28c60425', 'user6.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('b083c35f6d6e413a9c5ec8dbe0b7e135', 'user8.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('5f6bf977cd5e430a9bf4f717b3b3c634', 'vcard.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('63ff261e677d4174b871a3b9bbba99b2', 'vector.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('c660e3d08f364af6aea803f409c5b8d6', 'wand.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('baf06321b8604c669768877c5159efd7', 'webcam.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('a8fa66e08c6542f181f85fc69ebf4ecc', 'zoom_in.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('4b4f9f23b6ba4ba0baadd59c2fc5683d', 'zoom_out.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('2904', '10.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2905', '11.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2906', '13.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2907', '14.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2908', '15.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2909', '17.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2910', '19.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2911', '2.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2912', '21.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2913', '22.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2914', '23.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2915', '24.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2916', '25.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2917', '26.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2918', '28.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2919', '3.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2920', '30.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2921', '32.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2922', '34.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2923', '35.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2924', '36.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2925', '37.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2926', '38.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2927', '39.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2928', '4.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2929', '40.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2930', '41.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2931', '42.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2932', '43.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2933', '44.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2934', '45.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2935', '46.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2936', '47.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2937', '48.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2938', '49.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2939', '5.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2940', '51.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2941', '52.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2942', '53.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2943', '54.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2944', '55.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2945', '56.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2946', '6.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2947', '7.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2948', '8.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('2949', '9.png', '2');
INSERT INTO AOS_SYS_ICON VALUES ('25108abb6e734cfe9af974c5dc40f5e2', 'add.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('4960df5e6b7f420fa88df573e23d47eb', 'add2.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('4914a176e99b4dde8d4e42b34e7d52c0', 'against.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('2d156d2bde114f55ac8ff5b3a0436dbd', 'agree.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('a88b89d37629474aab08ccdedfab86d2', 'app_columns.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('e726e35e6750424a815df031ad0644fa', 'app_list.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('8e076a983908415da05538daf97d8e82', 'bars.gif', '1');
INSERT INTO AOS_SYS_ICON VALUES ('9e5e17e7ed7443b38045a7a4f7791c5c', 'basket.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('5c047570b7f64ce0895c47b11dca6e81', 'book.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('4a238489a6cd452b967b8896388eecbf', 'book_user.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('def3d983a0cd4787b4877466701d4214', 'bug.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('20446fb926fb4cc2ab9daeeac37c7984', 'bullet_black.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('1e657a99f5344401ad26c55715520cc5', 'bullet_blue.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('166f426e35c34e318f59879704fbf207', 'bullet_green.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('7a41173f5f934055871956f66932944f', 'bullet_group.gif', '1');
INSERT INTO AOS_SYS_ICON VALUES ('e76b14527d0446e7893a0691d851ab5a', 'bullet_group2.gif', '1');
INSERT INTO AOS_SYS_ICON VALUES ('bf3262602df1473b89a7ddb92304cc1e', 'bullet_group3.gif', '1');
INSERT INTO AOS_SYS_ICON VALUES ('d99b4713dc534797859e484d8832f0d4', 'bullet_group4.gif', '1');
INSERT INTO AOS_SYS_ICON VALUES ('872ef86b8cf843578bf9ee48c06f6ba9', 'bullet_purple.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('5c2e7c0910b240be8349a807c7ddc32a', 'bullet_red.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('223d8143779f480fb14e01555c00d3e3', 'bullet_yellow.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('ea92806185c84cf3be52d01c75b206f2', 'chart_curve.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('308304ece8934ae18657a78c992bb73c', 'chart_flipped.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('c90940d49fc1455bbbfdc67b551f7131', 'chart_line.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('bd9cde7da21a4661a63f56f2e9d70b9e', 'chart_pie.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('5a8e4815b3144a73bfb822c26cda9ac9', 'close.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('45cfb0060bfe4da3a5d2bac66da18255', 'close2.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('fd451e7df9984d6ca5452a2da4ad0f7f', 'config.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('43a7586a5eba45659cb261f3e109c568', 'config1.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('2556e3a496d140e2a54c416794e4238d', 'config3.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('047f898dfb904919ba1f817e18613151', 'connect.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('8203944c9014420ab24423da18584f56', 'copy.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('c6936b9e013149f8b260f2fe6af55082', 'cut.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('de387797fc7b4a25a658e4700e0a0132', 'cv.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('2e48a135e5cf4fc196efedef52fca447', 'c_key.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('58bec3b3e40449e5b19dc8266687f194', 'database.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('b2825a176941457b9cd6483beda555da', 'database_add.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('8d23bcd74ea1446fa3ebf3b269ca638a', 'del.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('fd123729c00d43a88ec8b3b8267c377c', 'del1.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('1ab69b40188a4aeca3ae461aeae9a7b6', 'del2.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('204b3f94ae9b4461b99e45d9b8486fce', 'del_folder.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('151a2a438dd149159acfa83c99abb086', 'del_page.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('c76537a3c6854f30a6ccfe2403b9dd38', 'detail.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('c4aa77d65f7a4ed3b6c932bc7bf4bfda', 'disconnect.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('afd75d2b110c4f0f91046d78adb5d3ab', 'doc_ok.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('0e4040e071684e3e8545582cde162336', 'down.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('91a1db0d7044496a82d29d9c79da680d', 'down_left.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('2444eb2ddecd48909ba31e6689301b7a', 'down_right.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('498239527c9a45d58322ad290908a233', 'edit.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('12f0994d2d15465d83da56844f0ddc9f', 'edit2.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('9a55475ef7ff406ba34682f2ef1eae3b', 'email.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('bcf69eed5d3348ce88fac540f303f3dc', 'email2.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('11a10e50b4574c6c9836fc703c5a1281', 'email3.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('55e5d794206b433ab861b4d3f102cee0', 'email_go.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('3234441b64b1460cbe41695d1cfb5db9', 'email_open.png', '1');
INSERT INTO AOS_SYS_ICON VALUES ('827', 'fa-adjust', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1096', 'fa-adn', '3');
INSERT INTO AOS_SYS_ICON VALUES ('817', 'fa-align-center', '3');
INSERT INTO AOS_SYS_ICON VALUES ('819', 'fa-align-justify', '3');
INSERT INTO AOS_SYS_ICON VALUES ('816', 'fa-align-left', '3');
INSERT INTO AOS_SYS_ICON VALUES ('818', 'fa-align-right', '3');
INSERT INTO AOS_SYS_ICON VALUES ('987', 'fa-ambulance', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1049', 'fa-anchor', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1107', 'fa-android', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1240', 'fa-angellist', '3');
INSERT INTO AOS_SYS_ICON VALUES ('996', 'fa-angle-double-down', '3');
INSERT INTO AOS_SYS_ICON VALUES ('993', 'fa-angle-double-left', '3');
INSERT INTO AOS_SYS_ICON VALUES ('994', 'fa-angle-double-right', '3');
INSERT INTO AOS_SYS_ICON VALUES ('995', 'fa-angle-double-up', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1000', 'fa-angle-down', '3');
INSERT INTO AOS_SYS_ICON VALUES ('997', 'fa-angle-left', '3');
INSERT INTO AOS_SYS_ICON VALUES ('998', 'fa-angle-right', '3');
INSERT INTO AOS_SYS_ICON VALUES ('999', 'fa-angle-up', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1105', 'fa-apple', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1118', 'fa-archive', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1230', 'fa-area-chart', '3');
INSERT INTO AOS_SYS_ICON VALUES ('926', 'fa-arrow-circle-down', '3');
INSERT INTO AOS_SYS_ICON VALUES ('923', 'fa-arrow-circle-left', '3');
INSERT INTO AOS_SYS_ICON VALUES ('790', 'fa-arrow-circle-o-down', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1126', 'fa-arrow-circle-o-left', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1125', 'fa-arrow-circle-o-right', '3');
INSERT INTO AOS_SYS_ICON VALUES ('791', 'fa-arrow-circle-o-up', '3');
INSERT INTO AOS_SYS_ICON VALUES ('924', 'fa-arrow-circle-right', '3');
INSERT INTO AOS_SYS_ICON VALUES ('925', 'fa-arrow-circle-up', '3');
INSERT INTO AOS_SYS_ICON VALUES ('858', 'fa-arrow-down', '3');
INSERT INTO AOS_SYS_ICON VALUES ('855', 'fa-arrow-left', '3');
INSERT INTO AOS_SYS_ICON VALUES ('856', 'fa-arrow-right', '3');
INSERT INTO AOS_SYS_ICON VALUES ('857', 'fa-arrow-up', '3');
INSERT INTO AOS_SYS_ICON VALUES ('832', 'fa-arrows', '3');
INSERT INTO AOS_SYS_ICON VALUES ('932', 'fa-arrows-alt', '3');
INSERT INTO AOS_SYS_ICON VALUES ('884', 'fa-arrows-h', '3');
INSERT INTO AOS_SYS_ICON VALUES ('883', 'fa-arrows-v', '3');
INSERT INTO AOS_SYS_ICON VALUES ('864', 'fa-asterisk', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1226', 'fa-at', '3');
INSERT INTO AOS_SYS_ICON VALUES ('835', 'fa-backward', '3');
INSERT INTO AOS_SYS_ICON VALUES ('854', 'fa-ban', '3');
INSERT INTO AOS_SYS_ICON VALUES ('885', 'fa-bar-chart', '3');
INSERT INTO AOS_SYS_ICON VALUES ('804', 'fa-barcode', '3');
INSERT INTO AOS_SYS_ICON VALUES ('942', 'fa-bars', '3');
INSERT INTO AOS_SYS_ICON VALUES ('990', 'fa-beer', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1160', 'fa-behance', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1161', 'fa-behance-square', '3');
INSERT INTO AOS_SYS_ICON VALUES ('917', 'fa-bell', '3');
INSERT INTO AOS_SYS_ICON VALUES ('981', 'fa-bell-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1222', 'fa-bell-slash', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1223', 'fa-bell-slash-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1237', 'fa-bicycle', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1206', 'fa-binoculars', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1229', 'fa-birthday-cake', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1097', 'fa-bitbucket', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1098', 'fa-bitbucket-square', '3');
INSERT INTO AOS_SYS_ICON VALUES ('812', 'fa-bold', '3');
INSERT INTO AOS_SYS_ICON VALUES ('970', 'fa-bolt', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1203', 'fa-bomb', '3');
INSERT INTO AOS_SYS_ICON VALUES ('807', 'fa-book', '3');
INSERT INTO AOS_SYS_ICON VALUES ('808', 'fa-bookmark', '3');
INSERT INTO AOS_SYS_ICON VALUES ('907', 'fa-bookmark-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('931', 'fa-briefcase', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1076', 'fa-btc', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1119', 'fa-bug', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1154', 'fa-building', '3');
INSERT INTO AOS_SYS_ICON VALUES ('985', 'fa-building-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('916', 'fa-bullhorn', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1051', 'fa-bullseye', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1238', 'fa-bus', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1213', 'fa-calculator', '3');
INSERT INTO AOS_SYS_ICON VALUES ('873', 'fa-calendar', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1039', 'fa-calendar-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('810', 'fa-camera', '3');
INSERT INTO AOS_SYS_ICON VALUES ('888', 'fa-camera-retro', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1165', 'fa-car', '3');
INSERT INTO AOS_SYS_ICON VALUES ('955', 'fa-caret-down', '3');
INSERT INTO AOS_SYS_ICON VALUES ('957', 'fa-caret-left', '3');
INSERT INTO AOS_SYS_ICON VALUES ('958', 'fa-caret-right', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1066', 'fa-caret-square-o-down', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1127', 'fa-caret-square-o-left', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1068', 'fa-caret-square-o-right', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1067', 'fa-caret-square-o-up', '3');
INSERT INTO AOS_SYS_ICON VALUES ('956', 'fa-caret-up', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1241', 'fa-cc', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1219', 'fa-cc-amex', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1218', 'fa-cc-discover', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1217', 'fa-cc-mastercard', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1220', 'fa-cc-paypal', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1221', 'fa-cc-stripe', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1216', 'fa-cc-visa', '3');
INSERT INTO AOS_SYS_ICON VALUES ('918', 'fa-certificate', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1028', 'fa-chain-broken', '3');
INSERT INTO AOS_SYS_ICON VALUES ('777', 'fa-check', '3');
INSERT INTO AOS_SYS_ICON VALUES ('848', 'fa-check-circle', '3');
INSERT INTO AOS_SYS_ICON VALUES ('853', 'fa-check-circle-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1061', 'fa-check-square', '3');
INSERT INTO AOS_SYS_ICON VALUES ('831', 'fa-check-square-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1046', 'fa-chevron-circle-down', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1043', 'fa-chevron-circle-left', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1044', 'fa-chevron-circle-right', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1045', 'fa-chevron-circle-up', '3');
INSERT INTO AOS_SYS_ICON VALUES ('878', 'fa-chevron-down', '3');
INSERT INTO AOS_SYS_ICON VALUES ('843', 'fa-chevron-left', '3');
INSERT INTO AOS_SYS_ICON VALUES ('844', 'fa-chevron-right', '3');
INSERT INTO AOS_SYS_ICON VALUES ('877', 'fa-chevron-up', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1155', 'fa-child', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1009', 'fa-circle', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1005', 'fa-circle-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1185', 'fa-circle-o-notch', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1197', 'fa-circle-thin', '3');
INSERT INTO AOS_SYS_ICON VALUES ('973', 'fa-clipboard', '3');
INSERT INTO AOS_SYS_ICON VALUES ('787', 'fa-clock-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('935', 'fa-cloud', '3');
INSERT INTO AOS_SYS_ICON VALUES ('976', 'fa-cloud-download', '3');
INSERT INTO AOS_SYS_ICON VALUES ('977', 'fa-cloud-upload', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1022', 'fa-code', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1027', 'fa-code-fork', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1182', 'fa-codepen', '3');
INSERT INTO AOS_SYS_ICON VALUES ('982', 'fa-coffee', '3');
INSERT INTO AOS_SYS_ICON VALUES ('783', 'fa-cog', '3');
INSERT INTO AOS_SYS_ICON VALUES ('890', 'fa-cogs', '3');
INSERT INTO AOS_SYS_ICON VALUES ('959', 'fa-columns', '3');
INSERT INTO AOS_SYS_ICON VALUES ('875', 'fa-comment', '3');
INSERT INTO AOS_SYS_ICON VALUES ('968', 'fa-comment-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('891', 'fa-comments', '3');
INSERT INTO AOS_SYS_ICON VALUES ('969', 'fa-comments-o', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1065', 'fa-compass', '3');
INSERT INTO AOS_SYS_ICON VALUES ('861', 'fa-compress', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1225', 'fa-copyright', '3');
INSERT INTO AOS_SYS_ICON VALUES ('913', 'fa-credit-card', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1026', 'fa-crop', '3');
INSERT INTO AOS_SYS_ICON VALUES ('851', 'fa-crosshairs', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1048', 'fa-css3', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1158', 'fa-cube', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1159', 'fa-cubes', '3');
INSERT INTO AOS_SYS_ICON VALUES ('983', 'fa-cutlery', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1171', 'fa-database', '3');
INSERT INTO AOS_SYS_ICON VALUES ('1146', 'fa-delicious', '3');

-- ----------------------------
-- Table structure for AOS_SYS_MODULE
-- ----------------------------
-- DROP TABLE IF EXISTS AOS_SYS_MODULE;
CREATE TABLE AOS_SYS_MODULE (
ID_ VARCHAR2(64 BYTE) NOT NULL ,
CASCADE_ID_ VARCHAR2(255 BYTE) NOT NULL ,
NAME_ VARCHAR2(255 BYTE) NOT NULL ,
URL_ VARCHAR2(255 BYTE) NULL ,
HOTKEY_ VARCHAR2(255 BYTE) NULL ,
PARENT_ID_ VARCHAR2(64 BYTE) NOT NULL ,
IS_LEAF_ VARCHAR2(255 BYTE) DEFAULT 1  NOT NULL ,
IS_AUTO_EXPAND_ VARCHAR2(255 BYTE) DEFAULT 0  NOT NULL ,
ICON_NAME_ VARCHAR2(255 BYTE) NULL ,
STATUS_ VARCHAR2(255 BYTE) DEFAULT 1  NOT NULL ,
PARENT_NAME_ VARCHAR2(255 BYTE) NOT NULL ,
VECTOR_ VARCHAR2(255 BYTE) NULL ,
SORT_NO_ NUMBER(10) DEFAULT 0  NULL 
)
LOGGING
NOCOMPRESS
NOCACHE
;
COMMENT ON TABLE AOS_SYS_MODULE IS '功能模块表';
COMMENT ON COLUMN AOS_SYS_MODULE.ID_ IS '功能模块流水号';
COMMENT ON COLUMN AOS_SYS_MODULE.CASCADE_ID_ IS '节点语义ID';
COMMENT ON COLUMN AOS_SYS_MODULE.NAME_ IS '功能模块名称';
COMMENT ON COLUMN AOS_SYS_MODULE.URL_ IS '主页面URL';
COMMENT ON COLUMN AOS_SYS_MODULE.HOTKEY_ IS '热键';
COMMENT ON COLUMN AOS_SYS_MODULE.PARENT_ID_ IS '父节点流水号';
COMMENT ON COLUMN AOS_SYS_MODULE.IS_LEAF_ IS '是否叶子节点';
COMMENT ON COLUMN AOS_SYS_MODULE.IS_AUTO_EXPAND_ IS '是否自动展开';
COMMENT ON COLUMN AOS_SYS_MODULE.ICON_NAME_ IS '节点图标文件名称';
COMMENT ON COLUMN AOS_SYS_MODULE.STATUS_ IS '当前状态';
COMMENT ON COLUMN AOS_SYS_MODULE.PARENT_NAME_ IS '父节点名称';
COMMENT ON COLUMN AOS_SYS_MODULE.VECTOR_ IS '矢量图标';
COMMENT ON COLUMN AOS_SYS_MODULE.SORT_NO_ IS '排序号';

-- ----------------------------
-- Records of AOS_SYS_MODULE
-- ----------------------------
INSERT INTO AOS_SYS_MODULE VALUES ('078df89c7b5b478cb38fd607805c6155', '0.004.002.001.007', '常用表单元素API', 'demo/initFormApi.jhtml', null, 'f73a952eefa2406c9327da6252c4ca79', '1', '0', null, '1', '表单', null, '20');
INSERT INTO AOS_SYS_MODULE VALUES ('09b24aac059f4ba58bfb30652636b543', '0.004.003.001', '综合实例①', 'demo/misc/initMisc1.jhtml', null, '33baf8c9948b47cfa54cd8d7a5e1753d', '1', '0', null, '1', '综合实例', null, '10');
INSERT INTO AOS_SYS_MODULE VALUES ('0b99e9d118b54ee084d9e74bd72cdd1c', '0.001.002', '资源管理', null, null, '7a6d3674e5204937951d01544e18e3aa', '0', '1', 'folder14.png', '1', '系统管理', null, '20');
INSERT INTO AOS_SYS_MODULE VALUES ('1886bf699ec74f79959bdc8ca8e5371a', '0.001.006.004', '在线用户', 'system/sessionLog/init.jhtml', null, '5b9a439743f141729f46a07e8e222a47', '1', '0', 'user2.png', '1', '监控与审计', null, '10');
INSERT INTO AOS_SYS_MODULE VALUES ('1906d5a892654e2bb882851e0ea7322f', '0.001.008.001', '图标', 'system/icon/init.jhtml', null, '524e5f5c3e5b4cdb90611cd8b15ca684', '1', '0', 'page_picture.png', '1', '开发工具箱', null, '60');
INSERT INTO AOS_SYS_MODULE VALUES ('1cf1947152174cacaf226fa54ca51351', '0.004.002.001.009', '表单校验', 'demo/initFormValidate.jhtml', null, 'f73a952eefa2406c9327da6252c4ca79', '1', '0', null, '1', '表单', null, '8');
INSERT INTO AOS_SYS_MODULE VALUES ('25406890354f4514909e2ad1c0fd678d', '0.004.002.003.001', '表格①', 'demo/grid/initGrid1.jhtml', null, 'dbf75990cf784e79920caf7eb47856f6', '1', '0', null, '1', '表格', null, '10');
INSERT INTO AOS_SYS_MODULE VALUES ('266bbec9e0af4612afa5139aade0a511', '0.004.002.001.006', '组合选择框', 'demo/initFormComboBox.jhtml', null, 'f73a952eefa2406c9327da6252c4ca79', '1', '0', null, '1', '表单', null, '30');
INSERT INTO AOS_SYS_MODULE VALUES ('2790bf6cc0b54c36b56c90429c112ab2', '0.001.008.005', 'WebIDE', 'system/coder/init.jhtml', null, '524e5f5c3e5b4cdb90611cd8b15ca684', '1', '0', 'icon15.png', '1', '开发工具箱', null, '5');
INSERT INTO AOS_SYS_MODULE VALUES ('29873ca569fb46c3bbd951a8a1df2472', '0.002', '项目导航', null, null, '2a4c060f44d944ea926fe44522ce7b39', '0', '1', 'folder2.png', '1', 'AOS应用基础平台', 'fa-github-alt', '20');
INSERT INTO AOS_SYS_MODULE VALUES ('2a4c060f44d944ea926fe44522ce7b39', '0', 'AOS应用基础平台', null, null, 'p', '0', '1', 'home.png', '1', 'root', null, '1');
INSERT INTO AOS_SYS_MODULE VALUES ('327677ef8d2a4e5caf3c4cbc9b72d0b0', '0.004.002.003.004', '客户端分页表格', 'demo/grid/initGrid3.jhtml', null, 'dbf75990cf784e79920caf7eb47856f6', '1', '0', null, '1', '表格', null, '40');
INSERT INTO AOS_SYS_MODULE VALUES ('33baf8c9948b47cfa54cd8d7a5e1753d', '0.004.003', '综合实例', null, null, '6e10c86d1885434e80e6dfa0953e307d', '0', '1', null, '1', '范例', null, '20');
INSERT INTO AOS_SYS_MODULE VALUES ('38e28fce49414c4c9e95d032559d5bee', '0.004.002.002', '按钮', 'demo/initButton.jhtml', null, '6cab8b013c314b37aec7c4567d859fc8', '1', '0', null, '1', 'AOS UI组件库', null, '10');
INSERT INTO AOS_SYS_MODULE VALUES ('3bb16fa3935c41bebe4d3fcf3c4ebd5c', '0.004.004', '杂项', null, null, '6e10c86d1885434e80e6dfa0953e307d', '0', '0', null, '1', '范例', null, '15');
INSERT INTO AOS_SYS_MODULE VALUES ('4d3cfce7b9b146d2bc8482ec477517aa', '0.002.001', '首选项', 'system/preference/init.jhtml', null, '29873ca569fb46c3bbd951a8a1df2472', '1', '0', 'config1.png', '1', '项目导航', null, '10');
INSERT INTO AOS_SYS_MODULE VALUES ('524e5f5c3e5b4cdb90611cd8b15ca684', '0.001.008', '开发工具箱', null, null, '7a6d3674e5204937951d01544e18e3aa', '0', '0', 'folder9.png', '1', '系统管理', 'fa-bug', '70');
INSERT INTO AOS_SYS_MODULE VALUES ('591f2ffa62a1461887c1d6f02c60a1ff', '0.004.004.002', '消息通知窗口', 'demo/initNotification.jhtml', null, '3bb16fa3935c41bebe4d3fcf3c4ebd5c', '1', '0', null, '1', '杂项', null, '2');
INSERT INTO AOS_SYS_MODULE VALUES ('5ae41d35d16247febabf631a81a0d70d', '0.004.002.001.008', '表单数据交互', 'demo/initFormData.jhtml', null, 'f73a952eefa2406c9327da6252c4ca79', '1', '0', null, '1', '表单', null, '40');
INSERT INTO AOS_SYS_MODULE VALUES ('5b9a439743f141729f46a07e8e222a47', '0.001.006', '监控与审计', null, null, '7a6d3674e5204937951d01544e18e3aa', '0', '0', 'folder27.png', '1', '系统管理', null, '60');
INSERT INTO AOS_SYS_MODULE VALUES ('5fb994e71cb14a77891670990d7f554d', '0.001.001', '基础数据', null, null, '7a6d3674e5204937951d01544e18e3aa', '0', '1', 'folder2.png', '1', '系统管理', null, '10');
INSERT INTO AOS_SYS_MODULE VALUES ('619cb338b278406f8368471034d5946f', '0.001.004.006', '任务节点', 'workflow/procTask/init.jhtml', null, 'cfc4e4bd367047a29e0d72e688f860a2', '1', '0', 'task_list.png', '1', '业务流程管理', null, '40');
INSERT INTO AOS_SYS_MODULE VALUES ('65320b914c18453f9ca0a84d3f8a0a7b', '0.001.003.001', '组织架构', 'system/org/init.jhtml', null, 'b656d6afbbe844d0a6626d0eb590643f', '1', '0', 'icon56.png', '1', '组织与权限', null, '1');
INSERT INTO AOS_SYS_MODULE VALUES ('68822bfa39914373afe70dc343c84e94', '0.004.002.001.005', '常用表单元素', 'demo/initFormElements.jhtml', null, 'f73a952eefa2406c9327da6252c4ca79', '1', '0', null, '1', '表单', null, '10');
INSERT INTO AOS_SYS_MODULE VALUES ('6cab8b013c314b37aec7c4567d859fc8', '0.004.002', 'AOS UI组件库', null, null, '6e10c86d1885434e80e6dfa0953e307d', '0', '1', null, '1', '范例', null, '10');
INSERT INTO AOS_SYS_MODULE VALUES ('6e10c86d1885434e80e6dfa0953e307d', '0.004', '范例', null, null, '2a4c060f44d944ea926fe44522ce7b39', '0', '1', 'folder27.png', '1', 'AOS应用基础平台', 'fa-coffee', '40');
INSERT INTO AOS_SYS_MODULE VALUES ('704d4e51ffcf473fa95ab9e680177d46', '0.004.002.003.002', '表格②', 'demo/grid/initGrid2.jhtml', null, 'dbf75990cf784e79920caf7eb47856f6', '1', '0', null, '1', '表格', null, '20');
INSERT INTO AOS_SYS_MODULE VALUES ('715f6cf8d2ce4fa694baf2259327f6b1', '0.001.003.002', '岗位与授权', 'system/post/init.jhtml', null, 'b656d6afbbe844d0a6626d0eb590643f', '1', '0', 'icon137.png', '1', '组织与权限', null, '3');
INSERT INTO AOS_SYS_MODULE VALUES ('73b69ca49e2240ba8717fc13acb884c2', '0.004.002.001.001', '表单布局①', 'demo/initForm1.jhtml', null, 'f73a952eefa2406c9327da6252c4ca79', '1', '0', null, '1', '表单', null, '1');
INSERT INTO AOS_SYS_MODULE VALUES ('7a6d3674e5204937951d01544e18e3aa', '0.001', '系统管理', null, null, '2a4c060f44d944ea926fe44522ce7b39', '0', '1', 'folder22.png', '1', 'AOS应用基础平台', 'fa-cogs', '10');
INSERT INTO AOS_SYS_MODULE VALUES ('7e6951e668be44b39fb9f9fd20b21315', '0.004.003.002', '综合实例②', 'demo/misc/initMisc2.jhtml', null, '33baf8c9948b47cfa54cd8d7a5e1753d', '1', '0', null, '1', '综合实例', null, '20');
INSERT INTO AOS_SYS_MODULE VALUES ('81fc0e05049e467d976ec523182421f2', '0.001.002.004', '序列号', 'system/idMgr/init.jhtml', null, '0b99e9d118b54ee084d9e74bd72cdd1c', '1', '0', 'id.png', '1', '资源管理', null, '30');
INSERT INTO AOS_SYS_MODULE VALUES ('870c482cdb2e4c8aa373dcf447964284', '0.004.002.003.003', '可编辑表格', 'demo/grid/initEditGrid.jhtml', null, 'dbf75990cf784e79920caf7eb47856f6', '1', '0', null, '1', '表格', null, '30');
INSERT INTO AOS_SYS_MODULE VALUES ('88bc371429ce4243a49c5893ae036f6a', '0.004.002.004', '报表', null, null, '6cab8b013c314b37aec7c4567d859fc8', '0', '0', null, '1', 'AOS UI组件库', null, '40');
INSERT INTO AOS_SYS_MODULE VALUES ('97c8a95d0aa84d7cba2a8b536ba5326a', '0.004.002.001.002', '表单布局②', 'demo/initForm2.jhtml', null, 'f73a952eefa2406c9327da6252c4ca79', '1', '0', null, '1', '表单', null, '2');
INSERT INTO AOS_SYS_MODULE VALUES ('9a8e5cedcd514af2b37cf5828f509f94', '0.001.001.003', '分类科目', 'system/catalog/init.jhtml', null, '5fb994e71cb14a77891670990d7f554d', '1', '0', 'icon146.png', '1', '基础数据', null, '20');
INSERT INTO AOS_SYS_MODULE VALUES ('9e4cf77815dd49fbac4158c62af3197a', '0.001.001.001', '键值参数', 'system/param/init.jhtml', null, '5fb994e71cb14a77891670990d7f554d', '1', '0', 'icon79.png', '1', '基础数据', null, '1');
INSERT INTO AOS_SYS_MODULE VALUES ('a21b52d911bb44c2978e52bbc523de51', '0.001.004.002', '流程部署', 'workflow/procDeploy/init.jhtml', null, 'cfc4e4bd367047a29e0d72e688f860a2', '1', '0', 'modules_wizard.gif', '1', '业务流程管理', null, '10');
INSERT INTO AOS_SYS_MODULE VALUES ('a27532c1cc8948e5b9bd7d8ac2e30a42', '0.004.002.006.001', '布局①', null, null, 'f84a495bca10403ebe8351d4737dfc72', '1', '0', null, '1', '容器布局', null, '1');
INSERT INTO AOS_SYS_MODULE VALUES ('a4d2ef333e35476680786df9a89e200b', '0.004.002.004.001', '报表①', 'demo/report/initReport1.jhtml', null, '88bc371429ce4243a49c5893ae036f6a', '1', '0', null, '1', '报表', null, '1');
INSERT INTO AOS_SYS_MODULE VALUES ('b4485f8151ae4a7db09ee6cd70c5e24f', '0.004.003.003', '综合实例③', 'demo/misc/initMisc3.jhtml', null, '33baf8c9948b47cfa54cd8d7a5e1753d', '1', '0', null, '1', '综合实例', null, '30');
INSERT INTO AOS_SYS_MODULE VALUES ('b656d6afbbe844d0a6626d0eb590643f', '0.001.003', '组织与权限', null, null, '7a6d3674e5204937951d01544e18e3aa', '0', '1', 'folder23.png', '1', '系统管理', null, '30');
INSERT INTO AOS_SYS_MODULE VALUES ('ba90369eb83540bab4d9492bc17f0937', '0.001.004.005', '流程实例', 'workflow/procInst/init.jhtml', null, 'cfc4e4bd367047a29e0d72e688f860a2', '1', '0', 'icon5.png', '1', '业务流程管理', null, '30');
INSERT INTO AOS_SYS_MODULE VALUES ('bc3c9877c598404da7e31355a4deebad', '0.001.008.002', 'WebSQL', 'system/webSql/init.jhtml', null, '524e5f5c3e5b4cdb90611cd8b15ca684', '1', '0', 'sql.png', '1', '开发工具箱', null, '10');
INSERT INTO AOS_SYS_MODULE VALUES ('bf530e26480d43b08dd20e31e31274af', '0.001.003.006', '角色与授权', 'system/role/init.jhtml', null, 'b656d6afbbe844d0a6626d0eb590643f', '1', '0', 'icon134.png', '1', '组织与权限', null, '5');
INSERT INTO AOS_SYS_MODULE VALUES ('ce516df0e9ae4cecab146ddd0fb56a75', '0.004.003.004', '综合实例④', 'demo/misc/initMisc4.jhtml', null, '33baf8c9948b47cfa54cd8d7a5e1753d', '1', '0', null, '1', '综合实例', null, '40');
INSERT INTO AOS_SYS_MODULE VALUES ('cfc4e4bd367047a29e0d72e688f860a2', '0.001.004', '业务流程管理', null, null, '7a6d3674e5204937951d01544e18e3aa', '0', '1', 'folder24.png', '1', '系统管理', null, '40');
INSERT INTO AOS_SYS_MODULE VALUES ('dbf75990cf784e79920caf7eb47856f6', '0.004.002.003', '表格', null, null, '6cab8b013c314b37aec7c4567d859fc8', '0', '1', null, '1', 'AOS UI组件库', null, '30');
INSERT INTO AOS_SYS_MODULE VALUES ('e3e403f7b94247c7827d8f280f06b64d', '0.004.002.001.003', '表单布局③', 'demo/initForm3.jhtml', null, 'f73a952eefa2406c9327da6252c4ca79', '1', '0', null, '1', '表单', null, '3');
INSERT INTO AOS_SYS_MODULE VALUES ('e7bb35f24a634a759cef64d28411901f', '0.004.004.001', '存储过程调用', 'demo/procedure/init.jhtml', null, '3bb16fa3935c41bebe4d3fcf3c4ebd5c', '1', '0', null, '1', '杂项', null, '10');
INSERT INTO AOS_SYS_MODULE VALUES ('e9de0eacf61a4aa6b1ed0c210fc209fe', '0.004.004.003', '页面组件复用', 'demo/initShare.jhtml', null, '3bb16fa3935c41bebe4d3fcf3c4ebd5c', '1', '0', null, '1', '杂项', null, '20');
INSERT INTO AOS_SYS_MODULE VALUES ('f107450058a2438eb6ad9bf6a4d7e967', '0.001.001.002', '字典参数', 'system/dictionary/init.jhtml', null, '5fb994e71cb14a77891670990d7f554d', '1', '0', 'icon154.png', '1', '基础数据', null, '10');
INSERT INTO AOS_SYS_MODULE VALUES ('f405a849f27d4ddebf7f8a2dfbf30bea', '0.001.002.001', '功能模块', 'system/module/init.jhtml', null, '0b99e9d118b54ee084d9e74bd72cdd1c', '1', '0', 'icon75.png', '1', '资源管理', null, '10');
INSERT INTO AOS_SYS_MODULE VALUES ('f73a952eefa2406c9327da6252c4ca79', '0.004.002.001', '表单', null, null, '6cab8b013c314b37aec7c4567d859fc8', '0', '0', null, '1', 'AOS UI组件库', null, '20');
INSERT INTO AOS_SYS_MODULE VALUES ('f81608054a714b60adb0b1ed574c6b6c', '0.001.003.003', '用户与授权', 'system/user/init.jhtml', null, 'b656d6afbbe844d0a6626d0eb590643f', '1', '0', 'user6.png', '1', '组织与权限', null, '4');
INSERT INTO AOS_SYS_MODULE VALUES ('f84a495bca10403ebe8351d4737dfc72', '0.004.002.006', '容器布局', null, null, '6cab8b013c314b37aec7c4567d859fc8', '0', '0', null, '1', 'AOS UI组件库', null, '35');
INSERT INTO AOS_SYS_MODULE VALUES ('fd88d0de59024e4db81ead8510b6bd98', '0.001.002.003', '页面组件', 'system/page/init.jhtml', null, '0b99e9d118b54ee084d9e74bd72cdd1c', '1', '0', 'icon59.png', '1', '资源管理', null, '20');

-- ----------------------------
-- Table structure for AOS_SYS_MODULE_POST
-- ----------------------------
-- DROP TABLE IF EXISTS AOS_SYS_MODULE_POST;
CREATE TABLE AOS_SYS_MODULE_POST (
ID_ VARCHAR2(64 BYTE) NOT NULL ,
POST_ID_ VARCHAR2(64 BYTE) NOT NULL ,
MODULE_ID_ VARCHAR2(64 BYTE) NOT NULL ,
GRANT_TYPE_ VARCHAR2(255 BYTE) NOT NULL ,
OPERATE_TIME_ VARCHAR2(255 BYTE) NOT NULL ,
OPERATOR_ID_ VARCHAR2(64 BYTE) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE
;
COMMENT ON TABLE AOS_SYS_MODULE_POST IS '功能模块-岗位关联表';
COMMENT ON COLUMN AOS_SYS_MODULE_POST.ID_ IS '流水号';
COMMENT ON COLUMN AOS_SYS_MODULE_POST.POST_ID_ IS '岗位流水号';
COMMENT ON COLUMN AOS_SYS_MODULE_POST.MODULE_ID_ IS '功能模块流水号';
COMMENT ON COLUMN AOS_SYS_MODULE_POST.GRANT_TYPE_ IS '权限类型(岗位仅提供经办权限)';
COMMENT ON COLUMN AOS_SYS_MODULE_POST.OPERATE_TIME_ IS '授权时间';
COMMENT ON COLUMN AOS_SYS_MODULE_POST.OPERATOR_ID_ IS '授权人流水号';

-- ----------------------------
-- Records of AOS_SYS_MODULE_POST
-- ----------------------------

-- ----------------------------
-- Table structure for AOS_SYS_MODULE_ROLE
-- ----------------------------
-- DROP TABLE IF EXISTS AOS_SYS_MODULE_ROLE;
CREATE TABLE AOS_SYS_MODULE_ROLE (
ID_ VARCHAR2(64 BYTE) NOT NULL ,
ROLE_ID_ VARCHAR2(64 BYTE) NOT NULL ,
MODULE_ID_ VARCHAR2(64 BYTE) NOT NULL ,
GRANT_TYPE_ VARCHAR2(255 BYTE) NOT NULL ,
OPERATE_TIME_ VARCHAR2(255 BYTE) NOT NULL ,
OPERATOR_ID_ VARCHAR2(64 BYTE) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE
;
COMMENT ON TABLE AOS_SYS_MODULE_ROLE IS '功能模块-角色关联表';
COMMENT ON COLUMN AOS_SYS_MODULE_ROLE.ID_ IS '流水号';
COMMENT ON COLUMN AOS_SYS_MODULE_ROLE.ROLE_ID_ IS ' 角色流水号';
COMMENT ON COLUMN AOS_SYS_MODULE_ROLE.MODULE_ID_ IS '功能模块流水号';
COMMENT ON COLUMN AOS_SYS_MODULE_ROLE.GRANT_TYPE_ IS '权限类型';
COMMENT ON COLUMN AOS_SYS_MODULE_ROLE.OPERATE_TIME_ IS '授权时间';
COMMENT ON COLUMN AOS_SYS_MODULE_ROLE.OPERATOR_ID_ IS '授权人流水号';

-- ----------------------------
-- Records of AOS_SYS_MODULE_ROLE
-- ----------------------------
INSERT INTO AOS_SYS_MODULE_ROLE VALUES ('caf19432391e46c8894455b9bd908a11', '84f923b5e334498494eda38d8e86ef80', '1886bf699ec74f79959bdc8ca8e5371a', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO AOS_SYS_MODULE_ROLE VALUES ('d22696d414434088bd8f6b47a9953f01', '84f923b5e334498494eda38d8e86ef80', '524e5f5c3e5b4cdb90611cd8b15ca684', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO AOS_SYS_MODULE_ROLE VALUES ('e70d4684d4bd489a93e44a2505cfb15c', '84f923b5e334498494eda38d8e86ef80', 'b656d6afbbe844d0a6626d0eb590643f', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO AOS_SYS_MODULE_ROLE VALUES ('e753111f16e443758e74637066dd845b', '84f923b5e334498494eda38d8e86ef80', '9a8e5cedcd514af2b37cf5828f509f94', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO AOS_SYS_MODULE_ROLE VALUES ('ecec404ec2a5449aafa701c3ca50cb2b', '84f923b5e334498494eda38d8e86ef80', '619cb338b278406f8368471034d5946f', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO AOS_SYS_MODULE_ROLE VALUES ('0b48f8f5677d4b4186e30d3434105847', '84f923b5e334498494eda38d8e86ef80', 'cfc4e4bd367047a29e0d72e688f860a2', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO AOS_SYS_MODULE_ROLE VALUES ('1186e6575fac43fe98640eca6e3c03b6', '84f923b5e334498494eda38d8e86ef80', '5fb994e71cb14a77891670990d7f554d', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO AOS_SYS_MODULE_ROLE VALUES ('1939747179be463fb49c9c94c15cb5ae', '84f923b5e334498494eda38d8e86ef80', 'bf530e26480d43b08dd20e31e31274af', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO AOS_SYS_MODULE_ROLE VALUES ('3e5cbb7d49d94be7b6a2a37c5553a041', '84f923b5e334498494eda38d8e86ef80', 'fd88d0de59024e4db81ead8510b6bd98', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO AOS_SYS_MODULE_ROLE VALUES ('4697b53bc7e04d7cb2267d44e4f9b438', '84f923b5e334498494eda38d8e86ef80', '0b99e9d118b54ee084d9e74bd72cdd1c', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO AOS_SYS_MODULE_ROLE VALUES ('5785a83aea394a1b9d5a66c85a377f2f', '84f923b5e334498494eda38d8e86ef80', '1906d5a892654e2bb882851e0ea7322f', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO AOS_SYS_MODULE_ROLE VALUES ('5b864436a0004966b711e75e05cabb47', '84f923b5e334498494eda38d8e86ef80', 'ba90369eb83540bab4d9492bc17f0937', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO AOS_SYS_MODULE_ROLE VALUES ('682b98882cd6488287e6863caa31ade4', '84f923b5e334498494eda38d8e86ef80', 'f107450058a2438eb6ad9bf6a4d7e967', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO AOS_SYS_MODULE_ROLE VALUES ('6f12960924884a56b49d3374fe1d0484', '84f923b5e334498494eda38d8e86ef80', '715f6cf8d2ce4fa694baf2259327f6b1', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO AOS_SYS_MODULE_ROLE VALUES ('700d87c2b3fc4e668a90bff6534993c4', '84f923b5e334498494eda38d8e86ef80', '2a4c060f44d944ea926fe44522ce7b39', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO AOS_SYS_MODULE_ROLE VALUES ('7c6fe595d4ba4bcb840952a6b8818e87', '84f923b5e334498494eda38d8e86ef80', '5b9a439743f141729f46a07e8e222a47', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO AOS_SYS_MODULE_ROLE VALUES ('814a381cf6284a42a9ef6ba4c4cf5390', '84f923b5e334498494eda38d8e86ef80', '9e4cf77815dd49fbac4158c62af3197a', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO AOS_SYS_MODULE_ROLE VALUES ('9fc58fccb59d4ef4add0bea95bde2f34', '84f923b5e334498494eda38d8e86ef80', 'f405a849f27d4ddebf7f8a2dfbf30bea', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO AOS_SYS_MODULE_ROLE VALUES ('a776b3fb9e944c0a89593a17cf9e8677', '84f923b5e334498494eda38d8e86ef80', '81fc0e05049e467d976ec523182421f2', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO AOS_SYS_MODULE_ROLE VALUES ('a864a8846d35415cb881f1f466b51e8d', '84f923b5e334498494eda38d8e86ef80', 'bc3c9877c598404da7e31355a4deebad', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO AOS_SYS_MODULE_ROLE VALUES ('b651fbaebbdf47ad9867aca4a39afb22', '84f923b5e334498494eda38d8e86ef80', '2790bf6cc0b54c36b56c90429c112ab2', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO AOS_SYS_MODULE_ROLE VALUES ('bc209a1defea47778a271b50f5c326b1', '84f923b5e334498494eda38d8e86ef80', '65320b914c18453f9ca0a84d3f8a0a7b', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO AOS_SYS_MODULE_ROLE VALUES ('bdf5f465e79a4dedb51fab2745c2ccc3', '84f923b5e334498494eda38d8e86ef80', 'a21b52d911bb44c2978e52bbc523de51', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO AOS_SYS_MODULE_ROLE VALUES ('c797efc13e314e43b08837cfc268cea9', '84f923b5e334498494eda38d8e86ef80', 'f81608054a714b60adb0b1ed574c6b6c', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO AOS_SYS_MODULE_ROLE VALUES ('c9407844cb9d4ec5b4df195cbee00ab0', '84f923b5e334498494eda38d8e86ef80', '7a6d3674e5204937951d01544e18e3aa', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');

-- ----------------------------
-- Table structure for AOS_SYS_MODULE_USER
-- ----------------------------
-- DROP TABLE IF EXISTS AOS_SYS_MODULE_USER;
CREATE TABLE AOS_SYS_MODULE_USER (
ID_ VARCHAR2(64 BYTE) NOT NULL ,
USER_ID_ VARCHAR2(64 BYTE) NOT NULL ,
MODULE_ID_ VARCHAR2(64 BYTE) NOT NULL ,
GRANT_TYPE_ VARCHAR2(255 BYTE) NOT NULL ,
OPERATE_TIME_ VARCHAR2(255 BYTE) NOT NULL ,
OPERATOR_ID_ VARCHAR2(64 BYTE) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE
;
COMMENT ON TABLE AOS_SYS_MODULE_USER IS '功能模块-用户关联表';
COMMENT ON COLUMN AOS_SYS_MODULE_USER.ID_ IS '流水号';
COMMENT ON COLUMN AOS_SYS_MODULE_USER.USER_ID_ IS ' 用户流水号';
COMMENT ON COLUMN AOS_SYS_MODULE_USER.MODULE_ID_ IS '功能模块流水号';
COMMENT ON COLUMN AOS_SYS_MODULE_USER.GRANT_TYPE_ IS '权限类型';
COMMENT ON COLUMN AOS_SYS_MODULE_USER.OPERATE_TIME_ IS '授权时间';
COMMENT ON COLUMN AOS_SYS_MODULE_USER.OPERATOR_ID_ IS '授权人';

-- ----------------------------
-- Records of AOS_SYS_MODULE_USER
-- ----------------------------

-- ----------------------------
-- Table structure for AOS_SYS_MODULE_USER_NAV
-- ----------------------------
-- DROP TABLE IF EXISTS AOS_SYS_MODULE_USER_NAV;
CREATE TABLE AOS_SYS_MODULE_USER_NAV (
ID_ VARCHAR2(64 BYTE) NOT NULL ,
MODULE_ID_ VARCHAR2(64 BYTE) NOT NULL ,
USER_ID_ VARCHAR2(64 BYTE) NOT NULL ,
NAV_ICON_ VARCHAR2(255 BYTE) NULL ,
TYPE_ VARCHAR2(255 BYTE) NOT NULL ,
SORT_NO_ NUMBER(10) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE
;
COMMENT ON TABLE AOS_SYS_MODULE_USER_NAV IS '功能模块-用户关联表(浮动导航|快捷导航)';
COMMENT ON COLUMN AOS_SYS_MODULE_USER_NAV.ID_ IS '流水号';
COMMENT ON COLUMN AOS_SYS_MODULE_USER_NAV.MODULE_ID_ IS '功能模块流水号';
COMMENT ON COLUMN AOS_SYS_MODULE_USER_NAV.USER_ID_ IS '人员流水号';
COMMENT ON COLUMN AOS_SYS_MODULE_USER_NAV.NAV_ICON_ IS '浮动导航图标文件';
COMMENT ON COLUMN AOS_SYS_MODULE_USER_NAV.TYPE_ IS '导航类型';
COMMENT ON COLUMN AOS_SYS_MODULE_USER_NAV.SORT_NO_ IS '排序号';

-- ----------------------------
-- Records of AOS_SYS_MODULE_USER_NAV
-- ----------------------------
INSERT INTO AOS_SYS_MODULE_USER_NAV VALUES ('0105d9c95caf420aa5bd544d83e87c77', '1886bf699ec74f79959bdc8ca8e5371a', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO AOS_SYS_MODULE_USER_NAV VALUES ('0ce2d5658fb64a4797ff75d9f459ef32', '715f6cf8d2ce4fa694baf2259327f6b1', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO AOS_SYS_MODULE_USER_NAV VALUES ('13e7e53c880a4eaebfdfc111ff0f234a', 'f405a849f27d4ddebf7f8a2dfbf30bea', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO AOS_SYS_MODULE_USER_NAV VALUES ('1771642b67a24ebc8925d05f9d6f0a99', 'bf530e26480d43b08dd20e31e31274af', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO AOS_SYS_MODULE_USER_NAV VALUES ('27496d1c07fb4de69e8ec80ca9d9b1b4', 'f81608054a714b60adb0b1ed574c6b6c', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO AOS_SYS_MODULE_USER_NAV VALUES ('27a1acfe21c54302bacef830362e9201', '1906d5a892654e2bb882851e0ea7322f', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO AOS_SYS_MODULE_USER_NAV VALUES ('3037dcb30d544c129c38c0ec0512f152', '65320b914c18453f9ca0a84d3f8a0a7b', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO AOS_SYS_MODULE_USER_NAV VALUES ('35cdbcbf1d164430ae5f870d9ca9c798', '5fb994e71cb14a77891670990d7f554d', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO AOS_SYS_MODULE_USER_NAV VALUES ('3e95a408ab4842a896fe28e22263770e', '2790bf6cc0b54c36b56c90429c112ab2', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO AOS_SYS_MODULE_USER_NAV VALUES ('4f6389bf9bbc41a785bafd3167d1c83f', 'b656d6afbbe844d0a6626d0eb590643f', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO AOS_SYS_MODULE_USER_NAV VALUES ('50f22340f1244e969e0150c5cb709d89', '9a8e5cedcd514af2b37cf5828f509f94', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO AOS_SYS_MODULE_USER_NAV VALUES ('5205631b91ad4abb877f9bf376401137', '0b99e9d118b54ee084d9e74bd72cdd1c', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO AOS_SYS_MODULE_USER_NAV VALUES ('6e2c4f1bbc794acbbbf30dd82b82e548', 'cfc4e4bd367047a29e0d72e688f860a2', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO AOS_SYS_MODULE_USER_NAV VALUES ('7c34dd645a584cf7bc01f49c491e4a6d', '7a6d3674e5204937951d01544e18e3aa', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO AOS_SYS_MODULE_USER_NAV VALUES ('87a378d1f1654e70a673e2492cf4b280', 'fd88d0de59024e4db81ead8510b6bd98', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO AOS_SYS_MODULE_USER_NAV VALUES ('91fd66009c774778bb8fe43afff6fc1a', '619cb338b278406f8368471034d5946f', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO AOS_SYS_MODULE_USER_NAV VALUES ('ab00d2b56d3c4e4a95c234b1624be55e', '81fc0e05049e467d976ec523182421f2', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO AOS_SYS_MODULE_USER_NAV VALUES ('d70a61cc8117438b8fa1d04df9b69ed1', '524e5f5c3e5b4cdb90611cd8b15ca684', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO AOS_SYS_MODULE_USER_NAV VALUES ('dcd3e9606ecb47d9970f6e25b538ca46', '9e4cf77815dd49fbac4158c62af3197a', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO AOS_SYS_MODULE_USER_NAV VALUES ('e09214ed6b5a4d9ea822d22b8290d459', 'f107450058a2438eb6ad9bf6a4d7e967', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO AOS_SYS_MODULE_USER_NAV VALUES ('e1620cfebcc54f9b964c4ce4faf51ea0', 'a21b52d911bb44c2978e52bbc523de51', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO AOS_SYS_MODULE_USER_NAV VALUES ('f0072ce1b6884ae8af69d4b10c008e85', '5b9a439743f141729f46a07e8e222a47', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO AOS_SYS_MODULE_USER_NAV VALUES ('f3f0dfc36d7d440385ed86e33ee40fd9', '2a4c060f44d944ea926fe44522ce7b39', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO AOS_SYS_MODULE_USER_NAV VALUES ('f9651f4622c14612a9eb510eae8ef4e9', 'ba90369eb83540bab4d9492bc17f0937', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO AOS_SYS_MODULE_USER_NAV VALUES ('fdbdb721c58740ecb54f7e047bdbacdc', 'bc3c9877c598404da7e31355a4deebad', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);

-- ----------------------------
-- Table structure for AOS_SYS_ORG
-- ----------------------------
-- DROP TABLE IF EXISTS AOS_SYS_ORG;
CREATE TABLE AOS_SYS_ORG (
ID_ VARCHAR2(64 BYTE) NOT NULL ,
CASCADE_ID_ VARCHAR2(255 BYTE) NULL ,
NAME_ VARCHAR2(255 BYTE) NULL ,
HOTKEY_ VARCHAR2(255 BYTE) NULL ,
PARENT_ID_ VARCHAR2(64 BYTE) NULL ,
PAREANT_NAME_ VARCHAR2(255 BYTE) NULL ,
IS_LEAF_ VARCHAR2(255 BYTE) DEFAULT 1  NULL ,
IS_AUTO_EXPAND_ VARCHAR2(255 BYTE) DEFAULT 0  NULL ,
ICON_NAME_ VARCHAR2(255 BYTE) NULL ,
STATUS_ VARCHAR2(255 BYTE) DEFAULT 1  NULL ,
TYPE_ VARCHAR2(255 BYTE) NULL ,
BIZ_CODE_ VARCHAR2(255 BYTE) NULL ,
CUSTOM_CODE_ VARCHAR2(4000 BYTE) NULL ,
CREATE_TIME_ VARCHAR2(255 BYTE) NULL ,
CREATER_ID_ VARCHAR2(64 BYTE) NULL ,
SORT_NO_ NUMBER(10) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE
;
COMMENT ON TABLE AOS_SYS_ORG IS '组织表';
COMMENT ON COLUMN AOS_SYS_ORG.ID_ IS '流水号';
COMMENT ON COLUMN AOS_SYS_ORG.CASCADE_ID_ IS '节点语义ID';
COMMENT ON COLUMN AOS_SYS_ORG.NAME_ IS '组织名称';
COMMENT ON COLUMN AOS_SYS_ORG.HOTKEY_ IS '热键';
COMMENT ON COLUMN AOS_SYS_ORG.PARENT_ID_ IS '父节点流水号';
COMMENT ON COLUMN AOS_SYS_ORG.PAREANT_NAME_ IS '父节点名称';
COMMENT ON COLUMN AOS_SYS_ORG.IS_LEAF_ IS '是否叶子节点';
COMMENT ON COLUMN AOS_SYS_ORG.IS_AUTO_EXPAND_ IS '是否自动展开';
COMMENT ON COLUMN AOS_SYS_ORG.ICON_NAME_ IS '节点图标文件名称';
COMMENT ON COLUMN AOS_SYS_ORG.STATUS_ IS '当前状态';
COMMENT ON COLUMN AOS_SYS_ORG.TYPE_ IS '组织类型';
COMMENT ON COLUMN AOS_SYS_ORG.BIZ_CODE_ IS '业务对照码';
COMMENT ON COLUMN AOS_SYS_ORG.CUSTOM_CODE_ IS '自定义扩展码';
COMMENT ON COLUMN AOS_SYS_ORG.CREATE_TIME_ IS '创建时间';
COMMENT ON COLUMN AOS_SYS_ORG.CREATER_ID_ IS '创建人ID';
COMMENT ON COLUMN AOS_SYS_ORG.SORT_NO_ IS '排序号';

-- ----------------------------
-- Records of AOS_SYS_ORG
-- ----------------------------
INSERT INTO AOS_SYS_ORG VALUES ('0965ef0ffd294a838f53012e3ef9bfd0', '0.006.001', '上海分行', null, 'bd48c11cfd6f48e196c5fa399c410329', '投资银行部', '1', '0', null, '1', '1', null, null, '2016-02-01 23:56:02', 'fa04db9dd2f54d61b0c8202a25de2dc6', '1');
INSERT INTO AOS_SYS_ORG VALUES ('1e1441c6be2b4ffdb3f73759cb1e207b', '0.002', '会计结算部', null, '63cf387a243d4d9799367d773b853346', '中国嘉靖银行', '1', '0', null, '1', '1', null, null, '2016-02-01 23:53:10', 'fa04db9dd2f54d61b0c8202a25de2dc6', '10');
INSERT INTO AOS_SYS_ORG VALUES ('4be918af97ee491aa71378d065a8c7f7', '0.006.002', '昆明分行', null, 'bd48c11cfd6f48e196c5fa399c410329', '投资银行部', '1', '0', null, '1', '1', null, null, '2016-02-01 23:56:15', 'fa04db9dd2f54d61b0c8202a25de2dc6', '10');
INSERT INTO AOS_SYS_ORG VALUES ('63cf387a243d4d9799367d773b853346', '0', '中国嘉靖银行', null, 'p', 'root', '0', '1', 'home.png', '1', '1', null, null, '2012-01-01 12:12:12', 'fa04db9dd2f54d61b0c8202a25de2dc6', '0');
INSERT INTO AOS_SYS_ORG VALUES ('b2fa97f8bed34eee86201f01fa786ed4', '0.001', '信息技术部', null, '63cf387a243d4d9799367d773b853346', '中国嘉靖银行', '1', '0', null, '1', '1', null, null, '2016-02-01 20:53:34', 'fa04db9dd2f54d61b0c8202a25de2dc6', '1');
INSERT INTO AOS_SYS_ORG VALUES ('bd48c11cfd6f48e196c5fa399c410329', '0.006', '投资银行部', null, '63cf387a243d4d9799367d773b853346', '中国嘉靖银行', '0', '1', null, '1', '1', null, null, '2016-02-01 23:55:46', 'fa04db9dd2f54d61b0c8202a25de2dc6', '50');
INSERT INTO AOS_SYS_ORG VALUES ('d4392c4faf024a7e8a2c2607d77ab2fa', '0.005', '合规管理部', null, '63cf387a243d4d9799367d773b853346', '中国嘉靖银行', '1', '0', null, '1', '1', null, null, '2016-02-01 23:54:44', 'fa04db9dd2f54d61b0c8202a25de2dc6', '40');
INSERT INTO AOS_SYS_ORG VALUES ('e8b6092436054f5893b49ade58635105', '0.004', '风险管理部', null, '63cf387a243d4d9799367d773b853346', '中国嘉靖银行', '1', '0', null, '1', '1', null, null, '2016-02-01 23:53:58', 'fa04db9dd2f54d61b0c8202a25de2dc6', '30');

-- ----------------------------
-- Table structure for AOS_SYS_PAGE
-- ----------------------------
-- DROP TABLE IF EXISTS AOS_SYS_PAGE;
CREATE TABLE AOS_SYS_PAGE (
ID_ VARCHAR2(64 BYTE) NOT NULL ,
MODULE_ID_ VARCHAR2(64 BYTE) NOT NULL ,
NAME_ VARCHAR2(255 BYTE) NULL ,
URL_ VARCHAR2(255 BYTE) NULL ,
TYPE_ VARCHAR2(255 BYTE) NOT NULL ,
ENABLED_ VARCHAR2(255 BYTE) NOT NULL ,
IS_DEFAULT_ VARCHAR2(255 BYTE) DEFAULT 0  NOT NULL ,
ICON_ VARCHAR2(255 BYTE) NULL ,
ICON_BIG_ VARCHAR2(255 BYTE) NULL ,
VECTOR_ VARCHAR2(255 BYTE) NULL ,
SORT_NO_ NUMBER(10) DEFAULT 0  NULL 
)
LOGGING
NOCOMPRESS
NOCACHE
;
COMMENT ON TABLE AOS_SYS_PAGE IS '模块页面表';
COMMENT ON COLUMN AOS_SYS_PAGE.ID_ IS '流水号';
COMMENT ON COLUMN AOS_SYS_PAGE.MODULE_ID_ IS '功能模块ID';
COMMENT ON COLUMN AOS_SYS_PAGE.NAME_ IS '名称';
COMMENT ON COLUMN AOS_SYS_PAGE.URL_ IS '页面URL';
COMMENT ON COLUMN AOS_SYS_PAGE.TYPE_ IS '类型';
COMMENT ON COLUMN AOS_SYS_PAGE.ENABLED_ IS '使能状态';
COMMENT ON COLUMN AOS_SYS_PAGE.IS_DEFAULT_ IS '是否缺省子页面';
COMMENT ON COLUMN AOS_SYS_PAGE.ICON_ IS '小图标';
COMMENT ON COLUMN AOS_SYS_PAGE.ICON_BIG_ IS '大图标';
COMMENT ON COLUMN AOS_SYS_PAGE.VECTOR_ IS '矢量图标';
COMMENT ON COLUMN AOS_SYS_PAGE.SORT_NO_ IS '排序号';

-- ----------------------------
-- Records of AOS_SYS_PAGE
-- ----------------------------
INSERT INTO AOS_SYS_PAGE VALUES ('19041a2cb7264838b48288ce9b0b8e80', '1906d5a892654e2bb882851e0ea7322f', '大图标[64X64]', 'initIconList.jhtml?type_=2', '2', '1', '0', 'picture.png', null, null, '2');
INSERT INTO AOS_SYS_PAGE VALUES ('9e30077a6bb043cc8db8c8d4b5fa5c91', '1906d5a892654e2bb882851e0ea7322f', '小图标[16X16]', 'initIconList.jhtml?type_=1', '2', '1', '1', 'pictures.png', null, null, '1');
INSERT INTO AOS_SYS_PAGE VALUES ('bcb82c68976d4527a8f1c8bdbb8b4a04', '1906d5a892654e2bb882851e0ea7322f', '矢量图标', 'initIconList.jhtml?type_=3', '2', '1', '0', 'vector.png', null, null, '4');
INSERT INTO AOS_SYS_PAGE VALUES ('c47935773e9443dd9a6ceecb69982ac2', '4d3cfce7b9b146d2bc8482ec477517aa', '我的快捷菜单', 'initMyNav.jhtml', '2', '1', '0', 'org.png', null, null, '4');
INSERT INTO AOS_SYS_PAGE VALUES ('c8548f73784d42989363712729a320e0', '1906d5a892654e2bb882851e0ea7322f', '分隔符', null, '4', '1', '0', null, null, null, '3');
INSERT INTO AOS_SYS_PAGE VALUES ('cacc4fcdc5454f1ebab63b00e4bf56cc', '4d3cfce7b9b146d2bc8482ec477517aa', '我的个人设置', 'initMyInfo.jhtml', '2', '1', '1', 'icon_19.png', null, null, '1');
INSERT INTO AOS_SYS_PAGE VALUES ('d45aefac856942d484441481cd142212', '4d3cfce7b9b146d2bc8482ec477517aa', '我的操作日志', null, '2', '1', '0', 'icon75.png', null, null, '6');
INSERT INTO AOS_SYS_PAGE VALUES ('dd3d77605b824ca18357222128aebc5b', '4d3cfce7b9b146d2bc8482ec477517aa', '分割符', null, '4', '1', '0', null, null, null, '5');

-- ----------------------------
-- Table structure for AOS_SYS_PAGE_EL
-- ----------------------------
-- DROP TABLE IF EXISTS AOS_SYS_PAGE_EL;
CREATE TABLE AOS_SYS_PAGE_EL (
ID_ VARCHAR2(64 BYTE) NOT NULL ,
DOM_ID_ VARCHAR2(255 BYTE) NOT NULL ,
NAME_ VARCHAR2(255 BYTE) NOT NULL ,
TYPE_ VARCHAR2(255 BYTE) NOT NULL ,
MODULE_ID_ VARCHAR2(64 BYTE) NOT NULL ,
PAGE_ID_ VARCHAR2(64 BYTE) NOT NULL ,
REMARK_ VARCHAR2(4000 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE
;
COMMENT ON TABLE AOS_SYS_PAGE_EL IS '页面元素表';
COMMENT ON COLUMN AOS_SYS_PAGE_EL.ID_ IS '流水号';
COMMENT ON COLUMN AOS_SYS_PAGE_EL.DOM_ID_ IS 'DOM ID';
COMMENT ON COLUMN AOS_SYS_PAGE_EL.NAME_ IS '名称';
COMMENT ON COLUMN AOS_SYS_PAGE_EL.TYPE_ IS '类型';
COMMENT ON COLUMN AOS_SYS_PAGE_EL.MODULE_ID_ IS '所属功能模块流水号';
COMMENT ON COLUMN AOS_SYS_PAGE_EL.PAGE_ID_ IS '页面ID';
COMMENT ON COLUMN AOS_SYS_PAGE_EL.REMARK_ IS '备注';

-- ----------------------------
-- Records of AOS_SYS_PAGE_EL
-- ----------------------------

-- ----------------------------
-- Table structure for AOS_SYS_PAGE_EL_GRANT
-- ----------------------------
-- DROP TABLE IF EXISTS AOS_SYS_PAGE_EL_GRANT;
CREATE TABLE AOS_SYS_PAGE_EL_GRANT (
ID_ VARCHAR2(64 BYTE) NOT NULL ,
EL_ID_ VARCHAR2(64 BYTE) NOT NULL ,
USER_ID_ VARCHAR2(64 BYTE) NULL ,
ROLE_ID_ VARCHAR2(64 BYTE) NULL ,
POST_ID_ VARCHAR2(64 BYTE) NULL ,
GRANT_TYPE_ VARCHAR2(255 BYTE) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE
;
COMMENT ON TABLE AOS_SYS_PAGE_EL_GRANT IS '页面元素授权表';
COMMENT ON COLUMN AOS_SYS_PAGE_EL_GRANT.ID_ IS '流水号';
COMMENT ON COLUMN AOS_SYS_PAGE_EL_GRANT.EL_ID_ IS '页面元素流水号';
COMMENT ON COLUMN AOS_SYS_PAGE_EL_GRANT.USER_ID_ IS '用户流水号';
COMMENT ON COLUMN AOS_SYS_PAGE_EL_GRANT.ROLE_ID_ IS '角色流水号';
COMMENT ON COLUMN AOS_SYS_PAGE_EL_GRANT.POST_ID_ IS '岗位流水号';
COMMENT ON COLUMN AOS_SYS_PAGE_EL_GRANT.GRANT_TYPE_ IS '权限类型';

-- ----------------------------
-- Records of AOS_SYS_PAGE_EL_GRANT
-- ----------------------------

-- ----------------------------
-- Table structure for AOS_SYS_PARAM
-- ----------------------------
-- DROP TABLE IF EXISTS AOS_SYS_PARAM;
CREATE TABLE AOS_SYS_PARAM (
ID_ VARCHAR2(64 BYTE) NOT NULL ,
KEY_ VARCHAR2(255 BYTE) NOT NULL ,
VALUE_ VARCHAR2(255 BYTE) NULL ,
CATALOG_ID_ VARCHAR2(64 BYTE) NOT NULL ,
CATALOG_CASCADE_ID_ VARCHAR2(255 BYTE) NOT NULL ,
NAME_ VARCHAR2(255 BYTE) NOT NULL ,
IS_OVERWRITE_ VARCHAR2(255 BYTE) NOT NULL ,
OVERWRITE_FIELD_ VARCHAR2(255 BYTE) NULL ,
REMARK_ VARCHAR2(4000 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE
;
COMMENT ON TABLE AOS_SYS_PARAM IS '参数表';
COMMENT ON COLUMN AOS_SYS_PARAM.ID_ IS '流水号';
COMMENT ON COLUMN AOS_SYS_PARAM.KEY_ IS '参数键';
COMMENT ON COLUMN AOS_SYS_PARAM.VALUE_ IS '参数值';
COMMENT ON COLUMN AOS_SYS_PARAM.CATALOG_ID_ IS '所属分类流水号';
COMMENT ON COLUMN AOS_SYS_PARAM.CATALOG_CASCADE_ID_ IS '所属分类节点语义ID';
COMMENT ON COLUMN AOS_SYS_PARAM.NAME_ IS '参数名称';
COMMENT ON COLUMN AOS_SYS_PARAM.IS_OVERWRITE_ IS '是否可覆盖';
COMMENT ON COLUMN AOS_SYS_PARAM.OVERWRITE_FIELD_ IS '覆盖来源字段';
COMMENT ON COLUMN AOS_SYS_PARAM.REMARK_ IS '备注';

-- ----------------------------
-- Records of AOS_SYS_PARAM
-- ----------------------------
INSERT INTO AOS_SYS_PARAM VALUES ('19ad8d57d72b4ecf98ad133ebb6492bd', 'page_load_gif_', 'wheel.gif', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '页面刷新动画文件', '0', null, '页面刷新动画文件。可选的预设动画文件：run.gif、wheel.gif。动画path：/static/image/gif/pageload。');
INSERT INTO AOS_SYS_PARAM VALUES ('1bd1c0a5849d4a30b3f1eb2761b2865d', 'show_login_win_head_', 'true', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '是否显示登录窗口标题栏', '0', null, '是否显示登录窗口标题栏(Ext登录风格)。缺省值：false。可选值：true|false。');
INSERT INTO AOS_SYS_PARAM VALUES ('1cc1a1bee27f44389e7e64a89d9ccc76', 'msgtarget_', 'qtip', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '表单校验消息提示方式', '0', null, '可选值必须是下列值之一 (1)、qtip 当用户鼠标悬停在该域之上时显示包含了消息的迅速提示。(2)、title 显示消息以浏览器默认的title属性弹出。 (3)、under 在域下方添加一块包含了错误消息的div。(4)、side 添加一个错误图标在域的右边，鼠标悬停上面时弹出显示消息。');
INSERT INTO AOS_SYS_PARAM VALUES ('1f2adf3aa726447e9728a3f67b718b41', 'vercode_show_', '1', '6f94ef4ac17d4d098f91f0a4579f8591', '0.001.002.001', '验证码开关', '0', null, '是否在登录页面显示验证码及后台验证码验证。可选值：0(否) | 1(是)。');
INSERT INTO AOS_SYS_PARAM VALUES ('2e45751d623f48389e12bfb7c3891597', 'treenode_cursor_', 'pointer', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '树节点鼠标光标样式', '0', null, '缺省值：pointer。可选值：任何符合Css的cursor属性定义的值。default | pointer | auto等。');
INSERT INTO AOS_SYS_PARAM VALUES ('376a372433634af4b6d2d558f1959f5b', 'role_grant_mode_', '1', '01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', '角色授权模式', '0', null, '角色授权模式(角色可见度)。可选值：1|2。1：可见当前管理员创建的角色和当前管理员所属组织的其他管理员创建的角色。2：可见当前管理员创建的角色和当前管理员所属组织及其下级子孙组织的其他管理员创建的角色。');
INSERT INTO AOS_SYS_PARAM VALUES ('3ff54d336e57461d8cd708a8bad8bc36', 'combobox_emptytext', '请选择...', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '下拉选择框的缺省提示信息', '0', null, null);
INSERT INTO AOS_SYS_PARAM VALUES ('43fb125bed224cbbaf2390df1041c3b0', 'dev_account_', 'root', '01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', '开发者登录帐号', '0', null, '登录页面开发者按钮登录帐号。可以配置为任何一个存在的帐号。');
INSERT INTO AOS_SYS_PARAM VALUES ('47bd798e93314882af7244ba1ae9fbc8', 'vercode_characters_', 'abcdetx2345678', '6f94ef4ac17d4d098f91f0a4579f8591', '0.001.002.001', '验证码待选字符集', '0', null, '验证码待选字符集。');
INSERT INTO AOS_SYS_PARAM VALUES ('53267cbf8e9f4fc490798054fbe85c7e', 'copyright_', '2008-2015 OSWorks', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '版权信息', '0', null, '版权信息');
INSERT INTO AOS_SYS_PARAM VALUES ('58099059c3004213ae0977d4ed5551f5', 'prevent_rightclick_', 'false', '01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', '全局右键', '0', null, '阻止浏览器缺省鼠标右键事件。可选值：true|false。缺省值：true。');
INSERT INTO AOS_SYS_PARAM VALUES ('6032c7e953994a718f6072c956906538', 'app_title_', 'AOS : JavaEE应用基础平台', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '首页浏览器标题内容', '0', null, '首页浏览器标题内容');
INSERT INTO AOS_SYS_PARAM VALUES ('714d370fa7f54b01ae9a006806c60135', 'is_show_top_nav_', 'true', 'a072411787f545edb7e7c3c23fa6c0ff', '0.001.002.004', '水平导航条', '1', 'is_show_top_nav_', '是否显示水平导航条。(只有在导航模式为1的情况，此设置才有效,导航模式为2，则水平导航条不会消失)。可选值：true| false。');
INSERT INTO AOS_SYS_PARAM VALUES ('7290d8299cba41dc9e23323a0db22a95', 'json_format', '1', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', 'JSON输出模式', '0', null, ' json输出模式。0：格式化输出模式；1：压缩模式。');
INSERT INTO AOS_SYS_PARAM VALUES ('74d65234606c4f448eb06d6a07a6c138', 'user_head_catalog_id_', '613', '01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', '用户头像流文件分类ID', '0', null, '用户头像流文件分类ID，分类科目中的用户头像分类ID。用户上传文件时使用。');
INSERT INTO AOS_SYS_PARAM VALUES ('757f555c0d734539baa70e8a1788cc62', 'is_show_statusbar_', 'true', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '是否显示主界面状态栏', '0', null, '是否显示主界面状态栏。可选值：true|false。');
INSERT INTO AOS_SYS_PARAM VALUES ('7882ac5560ef4a04993279dfc24b6f23', 'user_obj_del_mode_', 'update', '01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', '用户对象删除模式', '0', null, '物理删除：delete；逻辑删除：update。');
INSERT INTO AOS_SYS_PARAM VALUES ('7bc3899d2fc24e4b804e6f763c3d6b36', 'dev_account_login_', '1', '01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', '开发者登录帐号开关', '0', null, '是否启用开发者登录帐号功能,如启用则在登录界面会出现[开发者]按钮。可选值：1 | 0。提示：系统若在生产模式下运行，则此配置忽略，自动关闭开发者登录功能。');
INSERT INTO AOS_SYS_PARAM VALUES ('7e4d320f454843739f40476dcbcdc91a', 'run_mode_', '0', '01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', '运行模式', '0', null, '0：开发模式；1：生产模式；2：在线体验模式');
INSERT INTO AOS_SYS_PARAM VALUES ('873c2cb1dde54b308211e8a2bc6edbb5', 'theme_', 'classic', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '系统主题风格', '1', 'theme_', '可选值：classic。缺省值：classic。');
INSERT INTO AOS_SYS_PARAM VALUES ('9cb03933f61e4c68a58e50873ac38fbd', 'page_load_msg_', '正在拼命加载页面, 请稍等...', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '页面加载等待提示信息', '0', null, null);
INSERT INTO AOS_SYS_PARAM VALUES ('a19b559ab8804f5887867df4151ad631', 'page_size_', '50', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '分页大小', '0', null, '缺省的分页大小。JSP页面的属性设置会覆盖这个配置。');
INSERT INTO AOS_SYS_PARAM VALUES ('a1ad9c90f524467180bceecd1f02b8b8', 'nav_mode_', '1', 'a072411787f545edb7e7c3c23fa6c0ff', '0.001.002.004', '导航模式', '1', 'nav_mode_', '可选值，1：水平导航按钮和垂直导航的卡片属于统一层级；2：水平导航按钮和垂直导航的卡片有上下级级联导航关系。(当前模式2未实现)');
INSERT INTO AOS_SYS_PARAM VALUES ('a843396066db4e77a7b9ed7ae4cdda37', 'login_page_', 'login.ext.jsp', '01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', '登录页面', '0', null, 'Ext原生风格的登录界面');
INSERT INTO AOS_SYS_PARAM VALUES ('ad9cb685144c4e36b19b31e53190221a', 'skin_', 'blue', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '系统缺省皮肤', '1', 'skin_', '可选值：blue|gray|neptune|aos。缺省值：blue。');
INSERT INTO AOS_SYS_PARAM VALUES ('b07b8e2cc1284d14b9e680a5cac0722a', 'app_name_', 'AOS : JavaEE应用基础平台', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '应用系统名称', '0', null, '应用系统名称');
INSERT INTO AOS_SYS_PARAM VALUES ('be82f58309a24ee397d3a24631e48405', 'vercode_length_', '4', '6f94ef4ac17d4d098f91f0a4579f8591', '0.001.002.001', '验证码长度', '0', null, '验证码长度');
INSERT INTO AOS_SYS_PARAM VALUES ('bf26e19236654718a6aa369f3e4b4bf7', 'coder_project_rootpath_', '0', '01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', '代码生成器使用的工程根目录', '0', null, '代码生成器的工程跟目录。如果为0则自动获取。');
INSERT INTO AOS_SYS_PARAM VALUES ('c744b99660c74302b7a3ae5834a7b6eb', 'grid_column_algin_', 'left', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '表格列内容对齐方式', '0', null, '表格列对齐模式。有效值：left|center|right。');
INSERT INTO AOS_SYS_PARAM VALUES ('d2a8d045aa7e44ef93f0735a4c486bc6', 'nav_tab_index_', '0', 'a072411787f545edb7e7c3c23fa6c0ff', '0.001.002.004', '导航缺省活动页', '1', 'nav_tab_index_', '左侧布局的导航卡片缺省激活的卡片索引号，索引下标从0开始。');
INSERT INTO AOS_SYS_PARAM VALUES ('d3b33d5dee5b46738f9525b8977d7673', 'login_back_img_', '-1', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '登录页面的背景图片', '0', null, '登录页面的背景图片。可选的预设背景图片为：0.jpg、1.jpg、2.jpg。如果需要随机出现背景，则将其设置为-1。');
INSERT INTO AOS_SYS_PARAM VALUES ('eeb66260a2c141b2a0bb06bb41d7803b', 'navbar_btn_style_', 'tight', 'a072411787f545edb7e7c3c23fa6c0ff', '0.001.002.004', '导航条按钮风格', '1', 'navbar_btn_style_', '顶部水平导航条的按钮样式风格。tight：组合按钮；standalone：独立按钮。');
INSERT INTO AOS_SYS_PARAM VALUES ('f18649a182a946a693b36f817374cb1c', 'welcome_page_title_', '欢迎', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '欢迎页标题', '0', null, '系统登录后第一个缺省打开的Tab页面的标题。缺省：欢迎。');
INSERT INTO AOS_SYS_PARAM VALUES ('fcf73fa9129649a08ebb41e1ec8b5340', 'layout_', 'tab', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', 'Center区域布局风格', '1', 'layout_', '系统业务经办区域(center)布局风格。可选值：tab|page。缺省值：tab。tab：支持同时打开多个功能模块界面；page：当前只能打开1个功能界面。');
INSERT INTO AOS_SYS_PARAM VALUES ('fdd95913b7e54e3ca6be9557484159f5', 'tab_focus_color_', '#0099FF', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', 'Tab高亮颜色', '1', 'tab_focus_color_', '缺省的当前Tab卡片高亮提示颜色');
INSERT INTO AOS_SYS_PARAM VALUES ('0dabca413781404b9cbfaae3881fc5a6', 'app_ico', '/static/icon/ico/aos2.ico', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '应用系统小图标', '0', null, '浏览器标题栏左上角显示');

-- ----------------------------
-- Table structure for AOS_SYS_POST
-- ----------------------------
-- DROP TABLE IF EXISTS AOS_SYS_POST;
CREATE TABLE AOS_SYS_POST (
ID_ VARCHAR2(64 BYTE) NOT NULL ,
NAME_ VARCHAR2(255 BYTE) NOT NULL ,
STATUS_ VARCHAR2(255 BYTE) DEFAULT 1  NOT NULL ,
TYPE_ VARCHAR2(255 BYTE) NOT NULL ,
ORG_ID_ VARCHAR2(64 BYTE) NOT NULL ,
CREATE_TIME_ VARCHAR2(255 BYTE) NOT NULL ,
CREATER_ID_ VARCHAR2(64 BYTE) NOT NULL ,
ORG_CASCADE_ID_ VARCHAR2(255 BYTE) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE
;
COMMENT ON TABLE AOS_SYS_POST IS '岗位表';
COMMENT ON COLUMN AOS_SYS_POST.ID_ IS ' 流水号';
COMMENT ON COLUMN AOS_SYS_POST.NAME_ IS '岗位名称';
COMMENT ON COLUMN AOS_SYS_POST.STATUS_ IS '当前状态';
COMMENT ON COLUMN AOS_SYS_POST.TYPE_ IS '岗位类型';
COMMENT ON COLUMN AOS_SYS_POST.ORG_ID_ IS '所属部门流水号';
COMMENT ON COLUMN AOS_SYS_POST.CREATE_TIME_ IS '创建时间';
COMMENT ON COLUMN AOS_SYS_POST.CREATER_ID_ IS '创建人ID';
COMMENT ON COLUMN AOS_SYS_POST.ORG_CASCADE_ID_ IS '所属部门节点语义ID';

-- ----------------------------
-- Records of AOS_SYS_POST
-- ----------------------------

-- ----------------------------
-- Table structure for AOS_SYS_ROLE
-- ----------------------------
-- DROP TABLE IF EXISTS AOS_SYS_ROLE;
CREATE TABLE AOS_SYS_ROLE (
ID_ VARCHAR2(64 BYTE) NOT NULL ,
NAME_ VARCHAR2(255 BYTE) NOT NULL ,
STATUS_ VARCHAR2(255 BYTE) DEFAULT 1  NOT NULL ,
TYPE_ VARCHAR2(255 BYTE) NOT NULL ,
CREATE_TIME_ VARCHAR2(255 BYTE) NOT NULL ,
CREATER_ID_ VARCHAR2(64 BYTE) NOT NULL ,
CREATER_ORG_ID_ VARCHAR2(64 BYTE) NOT NULL ,
CREATER_ORG_CASCADE_ID_ VARCHAR2(255 BYTE) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE
;
COMMENT ON TABLE AOS_SYS_ROLE IS '角色表';
COMMENT ON COLUMN AOS_SYS_ROLE.ID_ IS ' 流水号';
COMMENT ON COLUMN AOS_SYS_ROLE.NAME_ IS '角色名称';
COMMENT ON COLUMN AOS_SYS_ROLE.STATUS_ IS '当前状态';
COMMENT ON COLUMN AOS_SYS_ROLE.TYPE_ IS '角色类型';
COMMENT ON COLUMN AOS_SYS_ROLE.CREATE_TIME_ IS '创建时间';
COMMENT ON COLUMN AOS_SYS_ROLE.CREATER_ID_ IS '创建人ID';
COMMENT ON COLUMN AOS_SYS_ROLE.CREATER_ORG_ID_ IS '创建人所属部门流水号';
COMMENT ON COLUMN AOS_SYS_ROLE.CREATER_ORG_CASCADE_ID_ IS '创建人所属部门节点语义ID';

-- ----------------------------
-- Records of AOS_SYS_ROLE
-- ----------------------------
INSERT INTO AOS_SYS_ROLE VALUES ('84f923b5e334498494eda38d8e86ef80', '研发角色', '1', '1', '2016-02-02 21:56:20', 'fa04db9dd2f54d61b0c8202a25de2dc6', '63cf387a243d4d9799367d773b853346', '0');

-- ----------------------------
-- Table structure for AOS_SYS_SEQUENCE
-- ----------------------------
-- DROP TABLE IF EXISTS AOS_SYS_SEQUENCE;
CREATE TABLE AOS_SYS_SEQUENCE (
ID_ VARCHAR2(64 BYTE) NOT NULL ,
NAME_ VARCHAR2(255 BYTE) NOT NULL ,
TYPE_ VARCHAR2(255 BYTE) NULL ,
PREFIX_ VARCHAR2(255 BYTE) NULL ,
START_ VARCHAR2(255 BYTE) DEFAULT 1  NULL ,
STEP_ VARCHAR2(255 BYTE) DEFAULT 1  NULL ,
CUR_VALUE_ VARCHAR2(255 BYTE) DEFAULT 0  NULL ,
STATUS_ VARCHAR2(255 BYTE) DEFAULT 1  NOT NULL ,
CONNECTOR_ VARCHAR2(255 BYTE) NULL ,
SUFFIX_ VARCHAR2(255 BYTE) NULL ,
DB_SEQ_NAME_ VARCHAR2(255 BYTE) NULL ,
MAX_VALUE_ VARCHAR2(255 BYTE) DEFAULT 9223372036854775807  NULL ,
IS_CIRCUL_ VARCHAR2(255 BYTE) DEFAULT 0  NULL ,
MIN_VALUE_ VARCHAR2(255 BYTE) DEFAULT 1  NULL ,
IS_LEFTPAD_ VARCHAR2(255 BYTE) DEFAULT 0  NULL ,
FORMAT_VALUE_ VARCHAR2(255 BYTE) NULL ,
REMARK_ VARCHAR2(4000 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE
;
COMMENT ON TABLE AOS_SYS_SEQUENCE IS 'ID配置表';
COMMENT ON COLUMN AOS_SYS_SEQUENCE.ID_ IS '流水号';
COMMENT ON COLUMN AOS_SYS_SEQUENCE.NAME_ IS '名称';
COMMENT ON COLUMN AOS_SYS_SEQUENCE.TYPE_ IS '类型';
COMMENT ON COLUMN AOS_SYS_SEQUENCE.PREFIX_ IS '前缀';
COMMENT ON COLUMN AOS_SYS_SEQUENCE.START_ IS '起始值';
COMMENT ON COLUMN AOS_SYS_SEQUENCE.STEP_ IS '递增步长';
COMMENT ON COLUMN AOS_SYS_SEQUENCE.CUR_VALUE_ IS '当前值';
COMMENT ON COLUMN AOS_SYS_SEQUENCE.STATUS_ IS '当前状态';
COMMENT ON COLUMN AOS_SYS_SEQUENCE.CONNECTOR_ IS '连接符';
COMMENT ON COLUMN AOS_SYS_SEQUENCE.SUFFIX_ IS '后缀';
COMMENT ON COLUMN AOS_SYS_SEQUENCE.DB_SEQ_NAME_ IS 'DBSequence名称';
COMMENT ON COLUMN AOS_SYS_SEQUENCE.MAX_VALUE_ IS '最大值';
COMMENT ON COLUMN AOS_SYS_SEQUENCE.IS_CIRCUL_ IS '是否循环';
COMMENT ON COLUMN AOS_SYS_SEQUENCE.MIN_VALUE_ IS '最小值';
COMMENT ON COLUMN AOS_SYS_SEQUENCE.IS_LEFTPAD_ IS '是否左补足';
COMMENT ON COLUMN AOS_SYS_SEQUENCE.FORMAT_VALUE_ IS '当前格式化值';
COMMENT ON COLUMN AOS_SYS_SEQUENCE.REMARK_ IS '备注';

-- ----------------------------
-- Records of AOS_SYS_SEQUENCE
-- ----------------------------
INSERT INTO AOS_SYS_SEQUENCE VALUES ('2abfc360e8a74e21bcda37113269fca0', 'DEMOID', '1', null, '1', '1', '7644', '1', null, null, null, '9223372036854775807', '0', '1', '0', '7644', '演示模块相关功能使用的ID发生器');
INSERT INTO AOS_SYS_SEQUENCE VALUES ('40b37118cebf431283415862d355c72c', 'CARDID', '1', null, '1', '1', '10005012', '1', null, null, null, '99999999', '0', '10000000', '0', '10005012', '范例系统卡号');
INSERT INTO AOS_SYS_SEQUENCE VALUES ('7487db32b061465da1af721e84e9942a', 'GUUID', '2', null, '1', '1', 'd7123d2c8af04dafab5d37d6d03937bb', '1', null, null, null, '9223372036854775807', '0', '1', '0', 'd7123d2c8af04dafab5d37d6d03937bb', '通用UUID。');

-- ----------------------------
-- Table structure for AOS_SYS_USER
-- ----------------------------
-- DROP TABLE IF EXISTS AOS_SYS_USER;
CREATE TABLE AOS_SYS_USER (
ID_ VARCHAR2(64 BYTE) NOT NULL ,
ACCOUNT_ VARCHAR2(255 BYTE) NOT NULL ,
PASSWORD_ VARCHAR2(255 BYTE) NOT NULL ,
NAME_ VARCHAR2(255 BYTE) NOT NULL ,
SEX_ VARCHAR2(255 BYTE) DEFAULT 0  NOT NULL ,
ORG_ID_ VARCHAR2(64 BYTE) NOT NULL ,
STATUS_ VARCHAR2(255 BYTE) NOT NULL ,
TYPE_ VARCHAR2(255 BYTE) NOT NULL ,
BIZ_CODE_ VARCHAR2(255 BYTE) NULL ,
CREATE_TIME_ VARCHAR2(255 BYTE) NOT NULL ,
CREATER_ID_ VARCHAR2(64 BYTE) NOT NULL ,
ORG_CASCADE_ID_ VARCHAR2(255 BYTE) NOT NULL ,
DELETE_FLAG_ VARCHAR2(255 BYTE) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE
;
COMMENT ON TABLE AOS_SYS_USER IS '用户基本信息表';
COMMENT ON COLUMN AOS_SYS_USER.ID_ IS '流水号';
COMMENT ON COLUMN AOS_SYS_USER.ACCOUNT_ IS '用户登录帐号';
COMMENT ON COLUMN AOS_SYS_USER.PASSWORD_ IS '密码';
COMMENT ON COLUMN AOS_SYS_USER.NAME_ IS '用户姓名';
COMMENT ON COLUMN AOS_SYS_USER.SEX_ IS '性别';
COMMENT ON COLUMN AOS_SYS_USER.ORG_ID_ IS '所属主部门流水号';
COMMENT ON COLUMN AOS_SYS_USER.STATUS_ IS '用户状态';
COMMENT ON COLUMN AOS_SYS_USER.TYPE_ IS '用户类型';
COMMENT ON COLUMN AOS_SYS_USER.BIZ_CODE_ IS '业务对照码';
COMMENT ON COLUMN AOS_SYS_USER.CREATE_TIME_ IS ' 经办时间';
COMMENT ON COLUMN AOS_SYS_USER.CREATER_ID_ IS '经办人流水号';
COMMENT ON COLUMN AOS_SYS_USER.ORG_CASCADE_ID_ IS '所属部门节点语义ID';
COMMENT ON COLUMN AOS_SYS_USER.DELETE_FLAG_ IS '逻辑删除标识';

-- ----------------------------
-- Records of AOS_SYS_USER
-- ----------------------------
INSERT INTO AOS_SYS_USER VALUES ('fa04db9dd2f54d61b0c8202a25de2dc6', 'root', 'gnRD3IiRP6s=', '超级用户', '1', '63cf387a243d4d9799367d773b853346', '1', '2', null, '2014-09-27 22:12:56', 'fa04db9dd2f54d61b0c8202a25de2dc6', '0', '0');
INSERT INTO AOS_SYS_USER VALUES ('fe24c4ac34444902a2129ec1debf9ed4', 'caocao', 'gnRD3IiRP6s=', '曹操', '3', 'b2fa97f8bed34eee86201f01fa786ed4', '1', '1', null, '2016-02-02 21:55:57', 'fa04db9dd2f54d61b0c8202a25de2dc6', '0.001', '0');

-- ----------------------------
-- Table structure for AOS_SYS_USER_CFG
-- ----------------------------
-- DROP TABLE IF EXISTS AOS_SYS_USER_CFG;
CREATE TABLE AOS_SYS_USER_CFG (
ID_ VARCHAR2(64 BYTE) NOT NULL ,
THEME_ VARCHAR2(255 BYTE) NULL ,
SKIN_ VARCHAR2(255 BYTE) NULL ,
IS_SHOW_TOP_NAV_ VARCHAR2(255 BYTE) NULL ,
NAVBAR_BTN_STYLE_ VARCHAR2(255 BYTE) NULL ,
TAB_FOCUS_COLOR_ VARCHAR2(255 BYTE) NULL ,
NAV_TAB_INDEX_ VARCHAR2(255 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE
;
COMMENT ON TABLE AOS_SYS_USER_CFG IS '用户配置表';
COMMENT ON COLUMN AOS_SYS_USER_CFG.ID_ IS '用户ID';
COMMENT ON COLUMN AOS_SYS_USER_CFG.THEME_ IS '用户界面主题';
COMMENT ON COLUMN AOS_SYS_USER_CFG.SKIN_ IS '用户界面皮肤';
COMMENT ON COLUMN AOS_SYS_USER_CFG.IS_SHOW_TOP_NAV_ IS '是否显示水平导航条';
COMMENT ON COLUMN AOS_SYS_USER_CFG.NAVBAR_BTN_STYLE_ IS '导航条按钮风格';
COMMENT ON COLUMN AOS_SYS_USER_CFG.TAB_FOCUS_COLOR_ IS 'Tab高亮颜色';
COMMENT ON COLUMN AOS_SYS_USER_CFG.NAV_TAB_INDEX_ IS '导航缺省活动页';

-- ----------------------------
-- Records of AOS_SYS_USER_CFG
-- ----------------------------
INSERT INTO AOS_SYS_USER_CFG VALUES ('fa04db9dd2f54d61b0c8202a25de2dc6', 'classic', 'blue', 'true', 'tight', '#0099FF', '0');
INSERT INTO AOS_SYS_USER_CFG VALUES ('fe24c4ac34444902a2129ec1debf9ed4', 'classic', 'blue', 'true', 'tight', '#0099FF', '0');

-- ----------------------------
-- Table structure for AOS_SYS_USER_EXT
-- ----------------------------
-- DROP TABLE IF EXISTS AOS_SYS_USER_EXT;
CREATE TABLE AOS_SYS_USER_EXT (
ID_ VARCHAR2(64 BYTE) NOT NULL ,
EMAIL_ VARCHAR2(255 BYTE) NULL ,
FIXED_PHONE_ VARCHAR2(255 BYTE) NULL ,
MOBILE_PHONE_ VARCHAR2(255 BYTE) NULL ,
ADDRESS_ VARCHAR2(255 BYTE) NULL ,
ZIP_ VARCHAR2(255 BYTE) NULL ,
BIRTHDAY_ VARCHAR2(255 BYTE) NULL ,
IDNO_ VARCHAR2(255 BYTE) NULL ,
QQ_ VARCHAR2(255 BYTE) NULL ,
DYNAMIC_FIELD_ VARCHAR2(4000 BYTE) NULL ,
REMARK_ VARCHAR2(4000 BYTE) NULL ,
FILED1_ VARCHAR2(255 BYTE) NULL ,
FILED2_ VARCHAR2(255 BYTE) NULL ,
FILED3_ VARCHAR2(255 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE
;
COMMENT ON TABLE AOS_SYS_USER_EXT IS '用户扩展信息表';
COMMENT ON COLUMN AOS_SYS_USER_EXT.ID_ IS '用户ID';
COMMENT ON COLUMN AOS_SYS_USER_EXT.EMAIL_ IS '电子邮件';
COMMENT ON COLUMN AOS_SYS_USER_EXT.FIXED_PHONE_ IS '固定电话';
COMMENT ON COLUMN AOS_SYS_USER_EXT.MOBILE_PHONE_ IS '移动电话';
COMMENT ON COLUMN AOS_SYS_USER_EXT.ADDRESS_ IS '联系地址';
COMMENT ON COLUMN AOS_SYS_USER_EXT.ZIP_ IS '邮编';
COMMENT ON COLUMN AOS_SYS_USER_EXT.BIRTHDAY_ IS '生日';
COMMENT ON COLUMN AOS_SYS_USER_EXT.IDNO_ IS '身份证号';
COMMENT ON COLUMN AOS_SYS_USER_EXT.QQ_ IS 'QQ';
COMMENT ON COLUMN AOS_SYS_USER_EXT.DYNAMIC_FIELD_ IS '动态扩展字段';
COMMENT ON COLUMN AOS_SYS_USER_EXT.REMARK_ IS '备注';
COMMENT ON COLUMN AOS_SYS_USER_EXT.FILED1_ IS '静态扩展字段1';
COMMENT ON COLUMN AOS_SYS_USER_EXT.FILED2_ IS '静态扩展字段2';
COMMENT ON COLUMN AOS_SYS_USER_EXT.FILED3_ IS '静态扩展字段3';

-- ----------------------------
-- Records of AOS_SYS_USER_EXT
-- ----------------------------
INSERT INTO AOS_SYS_USER_EXT VALUES ('fa04db9dd2f54d61b0c8202a25de2dc6', '307916217@qq.com', null, '186188188188', null, null, null, null, '307916217', null, '超级用户拥有系统最高权限。', null, null, null);
INSERT INTO AOS_SYS_USER_EXT VALUES ('fe24c4ac34444902a2129ec1debf9ed4', null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for AOS_SYS_USER_POST
-- ----------------------------
-- DROP TABLE IF EXISTS AOS_SYS_USER_POST;
CREATE TABLE AOS_SYS_USER_POST (
ID_ VARCHAR2(64 BYTE) NOT NULL ,
USER_ID_ VARCHAR2(64 BYTE) NOT NULL ,
POST_ID_ VARCHAR2(64 BYTE) NOT NULL ,
OPERATE_TIME_ VARCHAR2(255 BYTE) NOT NULL ,
OPERATOR_ID_ VARCHAR2(64 BYTE) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE
;
COMMENT ON TABLE AOS_SYS_USER_POST IS '用户-岗位关联表';
COMMENT ON COLUMN AOS_SYS_USER_POST.ID_ IS '流水号';
COMMENT ON COLUMN AOS_SYS_USER_POST.USER_ID_ IS '用户流水号';
COMMENT ON COLUMN AOS_SYS_USER_POST.POST_ID_ IS '岗位流水号';
COMMENT ON COLUMN AOS_SYS_USER_POST.OPERATE_TIME_ IS '授权时间';
COMMENT ON COLUMN AOS_SYS_USER_POST.OPERATOR_ID_ IS '授权人流水号';

-- ----------------------------
-- Records of AOS_SYS_USER_POST
-- ----------------------------

-- ----------------------------
-- Table structure for AOS_SYS_USER_ROLE
-- ----------------------------
-- DROP TABLE IF EXISTS AOS_SYS_USER_ROLE;
CREATE TABLE AOS_SYS_USER_ROLE (
ID_ VARCHAR2(64 BYTE) NOT NULL ,
USER_ID_ VARCHAR2(64 BYTE) NOT NULL ,
ROLE_ID_ VARCHAR2(64 BYTE) NOT NULL ,
OPERATE_TIME_ VARCHAR2(255 BYTE) NOT NULL ,
OPERATOR_ID_ VARCHAR2(64 BYTE) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE
;
COMMENT ON TABLE AOS_SYS_USER_ROLE IS '用户-角色关联表';
COMMENT ON COLUMN AOS_SYS_USER_ROLE.ID_ IS '流水号';
COMMENT ON COLUMN AOS_SYS_USER_ROLE.USER_ID_ IS '用户流水号';
COMMENT ON COLUMN AOS_SYS_USER_ROLE.ROLE_ID_ IS '角色流水号';
COMMENT ON COLUMN AOS_SYS_USER_ROLE.OPERATE_TIME_ IS '授权时间';
COMMENT ON COLUMN AOS_SYS_USER_ROLE.OPERATOR_ID_ IS '授权人流水号';

-- ----------------------------
-- Records of AOS_SYS_USER_ROLE
-- ----------------------------

-- ----------------------------
-- Table structure for AOS_WF_EVT_LOG
-- ----------------------------
-- DROP TABLE IF EXISTS AOS_WF_EVT_LOG;
CREATE TABLE AOS_WF_EVT_LOG (
LOG_NR_ NUMBER(19) NOT NULL ,
TYPE_ NVARCHAR2(64) NULL ,
PROC_DEF_ID_ NVARCHAR2(64) NULL ,
PROC_INST_ID_ NVARCHAR2(64) NULL ,
EXECUTION_ID_ NVARCHAR2(64) NULL ,
TASK_ID_ NVARCHAR2(64) NULL ,
TIME_STAMP_ TIMESTAMP(6)  NOT NULL ,
USER_ID_ NVARCHAR2(255) NULL ,
DATA_ BLOB NULL ,
LOCK_OWNER_ NVARCHAR2(255) NULL ,
LOCK_TIME_ TIMESTAMP(6)  NULL ,
IS_PROCESSED_ NUMBER(3) DEFAULT 0  NULL 
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
-- DROP TABLE IF EXISTS AOS_WF_GE_BYTEARRAY;
CREATE TABLE AOS_WF_GE_BYTEARRAY (
ID_ NVARCHAR2(64) NOT NULL ,
REV_ NUMBER NULL ,
NAME_ NVARCHAR2(255) NULL ,
DEPLOYMENT_ID_ NVARCHAR2(64) NULL ,
BYTES_ BLOB NULL ,
GENERATED_ NUMBER(1) NULL 
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
-- DROP TABLE IF EXISTS AOS_WF_GE_PROPERTY;
CREATE TABLE AOS_WF_GE_PROPERTY (
NAME_ NVARCHAR2(64) NOT NULL ,
VALUE_ NVARCHAR2(300) NULL ,
REV_ NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE
;

-- ----------------------------
-- Records of AOS_WF_GE_PROPERTY
-- ----------------------------
INSERT INTO AOS_WF_GE_PROPERTY VALUES ('next.dbid', '1', '1');
INSERT INTO AOS_WF_GE_PROPERTY VALUES ('schema.history', 'create(5.18.0.0)', '1');
INSERT INTO AOS_WF_GE_PROPERTY VALUES ('schema.version', '5.18.0.0', '1');

-- ----------------------------
-- Table structure for AOS_WF_HI_ACTINST
-- ----------------------------
-- DROP TABLE IF EXISTS AOS_WF_HI_ACTINST;
CREATE TABLE AOS_WF_HI_ACTINST (
ID_ NVARCHAR2(64) NOT NULL ,
PROC_DEF_ID_ NVARCHAR2(64) NOT NULL ,
PROC_INST_ID_ NVARCHAR2(64) NOT NULL ,
EXECUTION_ID_ NVARCHAR2(64) NOT NULL ,
ACT_ID_ NVARCHAR2(255) NOT NULL ,
TASK_ID_ NVARCHAR2(64) NULL ,
CALL_PROC_INST_ID_ NVARCHAR2(64) NULL ,
ACT_NAME_ NVARCHAR2(255) NULL ,
ACT_TYPE_ NVARCHAR2(255) NOT NULL ,
ASSIGNEE_ NVARCHAR2(255) NULL ,
START_TIME_ TIMESTAMP(6)  NOT NULL ,
END_TIME_ TIMESTAMP(6)  NULL ,
DURATION_ NUMBER(19) NULL ,
TENANT_ID_ NVARCHAR2(255) DEFAULT ''  NULL 
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
-- DROP TABLE IF EXISTS AOS_WF_HI_ATTACHMENT;
CREATE TABLE AOS_WF_HI_ATTACHMENT (
ID_ NVARCHAR2(64) NOT NULL ,
REV_ NUMBER NULL ,
USER_ID_ NVARCHAR2(255) NULL ,
NAME_ NVARCHAR2(255) NULL ,
DESCRIPTION_ NVARCHAR2(2000) NULL ,
TYPE_ NVARCHAR2(255) NULL ,
TASK_ID_ NVARCHAR2(64) NULL ,
PROC_INST_ID_ NVARCHAR2(64) NULL ,
URL_ NVARCHAR2(2000) NULL ,
CONTENT_ID_ NVARCHAR2(64) NULL ,
TIME_ TIMESTAMP(6)  NULL 
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
-- DROP TABLE IF EXISTS AOS_WF_HI_COMMENT;
CREATE TABLE AOS_WF_HI_COMMENT (
ID_ NVARCHAR2(64) NOT NULL ,
TYPE_ NVARCHAR2(255) NULL ,
TIME_ TIMESTAMP(6)  NOT NULL ,
USER_ID_ NVARCHAR2(255) NULL ,
TASK_ID_ NVARCHAR2(64) NULL ,
PROC_INST_ID_ NVARCHAR2(64) NULL ,
ACTION_ NVARCHAR2(255) NULL ,
MESSAGE_ NVARCHAR2(2000) NULL ,
FULL_MSG_ BLOB NULL 
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
-- DROP TABLE IF EXISTS AOS_WF_HI_DETAIL;
CREATE TABLE AOS_WF_HI_DETAIL (
ID_ NVARCHAR2(64) NOT NULL ,
TYPE_ NVARCHAR2(255) NOT NULL ,
PROC_INST_ID_ NVARCHAR2(64) NULL ,
EXECUTION_ID_ NVARCHAR2(64) NULL ,
TASK_ID_ NVARCHAR2(64) NULL ,
ACT_INST_ID_ NVARCHAR2(64) NULL ,
NAME_ NVARCHAR2(255) NOT NULL ,
VAR_TYPE_ NVARCHAR2(64) NULL ,
REV_ NUMBER NULL ,
TIME_ TIMESTAMP(6)  NOT NULL ,
BYTEARRAY_ID_ NVARCHAR2(64) NULL ,
DOUBLE_ NUMBER NULL ,
LONG_ NUMBER(19) NULL ,
TEXT_ NVARCHAR2(2000) NULL ,
TEXT2_ NVARCHAR2(2000) NULL 
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
-- DROP TABLE IF EXISTS AOS_WF_HI_IDENTITYLINK;
CREATE TABLE AOS_WF_HI_IDENTITYLINK (
ID_ NVARCHAR2(64) NOT NULL ,
GROUP_ID_ NVARCHAR2(255) NULL ,
TYPE_ NVARCHAR2(255) NULL ,
USER_ID_ NVARCHAR2(255) NULL ,
TASK_ID_ NVARCHAR2(64) NULL ,
PROC_INST_ID_ NVARCHAR2(64) NULL 
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
-- DROP TABLE IF EXISTS AOS_WF_HI_PROCINST;
CREATE TABLE AOS_WF_HI_PROCINST (
ID_ NVARCHAR2(64) NOT NULL ,
PROC_INST_ID_ NVARCHAR2(64) NOT NULL ,
BUSINESS_KEY_ NVARCHAR2(255) NULL ,
PROC_DEF_ID_ NVARCHAR2(64) NOT NULL ,
START_TIME_ TIMESTAMP(6)  NOT NULL ,
END_TIME_ TIMESTAMP(6)  NULL ,
DURATION_ NUMBER(19) NULL ,
START_USER_ID_ NVARCHAR2(255) NULL ,
START_ACT_ID_ NVARCHAR2(255) NULL ,
END_ACT_ID_ NVARCHAR2(255) NULL ,
SUPER_PROCESS_INSTANCE_ID_ NVARCHAR2(64) NULL ,
DELETE_REASON_ NVARCHAR2(2000) NULL ,
TENANT_ID_ NVARCHAR2(255) DEFAULT ''  NULL ,
NAME_ NVARCHAR2(255) NULL 
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
-- DROP TABLE IF EXISTS AOS_WF_HI_TASKINST;
CREATE TABLE AOS_WF_HI_TASKINST (
ID_ NVARCHAR2(64) NOT NULL ,
PROC_DEF_ID_ NVARCHAR2(64) NULL ,
TASK_DEF_KEY_ NVARCHAR2(255) NULL ,
PROC_INST_ID_ NVARCHAR2(64) NULL ,
EXECUTION_ID_ NVARCHAR2(64) NULL ,
PARENT_TASK_ID_ NVARCHAR2(64) NULL ,
NAME_ NVARCHAR2(255) NULL ,
DESCRIPTION_ NVARCHAR2(2000) NULL ,
OWNER_ NVARCHAR2(255) NULL ,
ASSIGNEE_ NVARCHAR2(255) NULL ,
START_TIME_ TIMESTAMP(6)  NOT NULL ,
CLAIM_TIME_ TIMESTAMP(6)  NULL ,
END_TIME_ TIMESTAMP(6)  NULL ,
DURATION_ NUMBER(19) NULL ,
DELETE_REASON_ NVARCHAR2(2000) NULL ,
PRIORITY_ NUMBER NULL ,
DUE_DATE_ TIMESTAMP(6)  NULL ,
FORM_KEY_ NVARCHAR2(255) NULL ,
CATEGORY_ NVARCHAR2(255) NULL ,
TENANT_ID_ NVARCHAR2(255) DEFAULT ''  NULL 
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
-- DROP TABLE IF EXISTS AOS_WF_HI_VARINST;
CREATE TABLE AOS_WF_HI_VARINST (
ID_ NVARCHAR2(64) NOT NULL ,
PROC_INST_ID_ NVARCHAR2(64) NULL ,
EXECUTION_ID_ NVARCHAR2(64) NULL ,
TASK_ID_ NVARCHAR2(64) NULL ,
NAME_ NVARCHAR2(255) NOT NULL ,
VAR_TYPE_ NVARCHAR2(100) NULL ,
REV_ NUMBER NULL ,
BYTEARRAY_ID_ NVARCHAR2(64) NULL ,
DOUBLE_ NUMBER NULL ,
LONG_ NUMBER(19) NULL ,
TEXT_ NVARCHAR2(2000) NULL ,
TEXT2_ NVARCHAR2(2000) NULL ,
CREATE_TIME_ TIMESTAMP(6)  NULL ,
LAST_UPDATED_TIME_ TIMESTAMP(6)  NULL 
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
-- DROP TABLE IF EXISTS AOS_WF_ID_GROUP;
CREATE TABLE AOS_WF_ID_GROUP (
ID_ NVARCHAR2(64) NOT NULL ,
REV_ NUMBER NULL ,
NAME_ NVARCHAR2(255) NULL ,
TYPE_ NVARCHAR2(255) NULL 
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
-- DROP TABLE IF EXISTS AOS_WF_ID_INFO;
CREATE TABLE AOS_WF_ID_INFO (
ID_ NVARCHAR2(64) NOT NULL ,
REV_ NUMBER NULL ,
USER_ID_ NVARCHAR2(64) NULL ,
TYPE_ NVARCHAR2(64) NULL ,
KEY_ NVARCHAR2(255) NULL ,
VALUE_ NVARCHAR2(255) NULL ,
PASSWORD_ BLOB NULL ,
PARENT_ID_ NVARCHAR2(255) NULL 
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
-- DROP TABLE IF EXISTS AOS_WF_ID_MEMBERSHIP;
CREATE TABLE AOS_WF_ID_MEMBERSHIP (
USER_ID_ NVARCHAR2(64) NOT NULL ,
GROUP_ID_ NVARCHAR2(64) NOT NULL 
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
-- DROP TABLE IF EXISTS AOS_WF_ID_USER;
CREATE TABLE AOS_WF_ID_USER (
ID_ NVARCHAR2(64) NOT NULL ,
REV_ NUMBER NULL ,
FIRST_ NVARCHAR2(255) NULL ,
LAST_ NVARCHAR2(255) NULL ,
EMAIL_ NVARCHAR2(255) NULL ,
PWD_ NVARCHAR2(255) NULL ,
PICTURE_ID_ NVARCHAR2(64) NULL 
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
-- DROP TABLE IF EXISTS AOS_WF_RE_DEPLOYMENT;
CREATE TABLE AOS_WF_RE_DEPLOYMENT (
ID_ NVARCHAR2(64) NOT NULL ,
NAME_ NVARCHAR2(255) NULL ,
CATEGORY_ NVARCHAR2(255) NULL ,
TENANT_ID_ NVARCHAR2(255) DEFAULT ''  NULL ,
DEPLOY_TIME_ TIMESTAMP(6)  NULL 
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
-- DROP TABLE IF EXISTS AOS_WF_RE_MODEL;
CREATE TABLE AOS_WF_RE_MODEL (
ID_ NVARCHAR2(64) NOT NULL ,
REV_ NUMBER NULL ,
NAME_ NVARCHAR2(255) NULL ,
KEY_ NVARCHAR2(255) NULL ,
CATEGORY_ NVARCHAR2(255) NULL ,
CREATE_TIME_ TIMESTAMP(6)  NULL ,
LAST_UPDATE_TIME_ TIMESTAMP(6)  NULL ,
VERSION_ NUMBER NULL ,
META_INFO_ NVARCHAR2(2000) NULL ,
DEPLOYMENT_ID_ NVARCHAR2(64) NULL ,
EDITOR_SOURCE_VALUE_ID_ NVARCHAR2(64) NULL ,
EDITOR_SOURCE_EXTRA_VALUE_ID_ NVARCHAR2(64) NULL ,
TENANT_ID_ NVARCHAR2(255) DEFAULT ''  NULL 
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
-- DROP TABLE IF EXISTS AOS_WF_RE_PROCDEF;
CREATE TABLE AOS_WF_RE_PROCDEF (
ID_ NVARCHAR2(64) NOT NULL ,
REV_ NUMBER NULL ,
CATEGORY_ NVARCHAR2(255) NULL ,
NAME_ NVARCHAR2(255) NULL ,
KEY_ NVARCHAR2(255) NOT NULL ,
VERSION_ NUMBER NOT NULL ,
DEPLOYMENT_ID_ NVARCHAR2(64) NULL ,
RESOURCE_NAME_ NVARCHAR2(2000) NULL ,
DGRM_RESOURCE_NAME_ VARCHAR2(4000 BYTE) NULL ,
DESCRIPTION_ NVARCHAR2(2000) NULL ,
HAS_START_FORM_KEY_ NUMBER(1) NULL ,
HAS_GRAPHICAL_NOTATION_ NUMBER(1) NULL ,
SUSPENSION_STATE_ NUMBER NULL ,
TENANT_ID_ NVARCHAR2(255) DEFAULT ''  NULL 
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
-- DROP TABLE IF EXISTS AOS_WF_RU_EVENT_SUBSCR;
CREATE TABLE AOS_WF_RU_EVENT_SUBSCR (
ID_ NVARCHAR2(64) NOT NULL ,
REV_ NUMBER NULL ,
EVENT_TYPE_ NVARCHAR2(255) NOT NULL ,
EVENT_NAME_ NVARCHAR2(255) NULL ,
EXECUTION_ID_ NVARCHAR2(64) NULL ,
PROC_INST_ID_ NVARCHAR2(64) NULL ,
ACTIVITY_ID_ NVARCHAR2(64) NULL ,
CONFIGURATION_ NVARCHAR2(255) NULL ,
CREATED_ TIMESTAMP(6)  NOT NULL ,
PROC_DEF_ID_ NVARCHAR2(64) NULL ,
TENANT_ID_ NVARCHAR2(255) DEFAULT ''  NULL 
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
-- DROP TABLE IF EXISTS AOS_WF_RU_EXECUTION;
CREATE TABLE AOS_WF_RU_EXECUTION (
ID_ NVARCHAR2(64) NOT NULL ,
REV_ NUMBER NULL ,
PROC_INST_ID_ NVARCHAR2(64) NULL ,
BUSINESS_KEY_ NVARCHAR2(255) NULL ,
PARENT_ID_ NVARCHAR2(64) NULL ,
PROC_DEF_ID_ NVARCHAR2(64) NULL ,
SUPER_EXEC_ NVARCHAR2(64) NULL ,
ACT_ID_ NVARCHAR2(255) NULL ,
IS_ACTIVE_ NUMBER(1) NULL ,
IS_CONCURRENT_ NUMBER(1) NULL ,
IS_SCOPE_ NUMBER(1) NULL ,
IS_EVENT_SCOPE_ NUMBER(1) NULL ,
SUSPENSION_STATE_ NUMBER NULL ,
CACHED_ENT_STATE_ NUMBER NULL ,
TENANT_ID_ NVARCHAR2(255) DEFAULT ''  NULL ,
NAME_ NVARCHAR2(255) NULL ,
LOCK_TIME_ TIMESTAMP(6)  NULL 
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
-- DROP TABLE IF EXISTS AOS_WF_RU_IDENTITYLINK;
CREATE TABLE AOS_WF_RU_IDENTITYLINK (
ID_ NVARCHAR2(64) NOT NULL ,
REV_ NUMBER NULL ,
GROUP_ID_ NVARCHAR2(255) NULL ,
TYPE_ NVARCHAR2(255) NULL ,
USER_ID_ NVARCHAR2(255) NULL ,
TASK_ID_ NVARCHAR2(64) NULL ,
PROC_INST_ID_ NVARCHAR2(64) NULL ,
PROC_DEF_ID_ NVARCHAR2(64) NULL 
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
-- DROP TABLE IF EXISTS AOS_WF_RU_JOB;
CREATE TABLE AOS_WF_RU_JOB (
ID_ NVARCHAR2(64) NOT NULL ,
REV_ NUMBER NULL ,
TYPE_ NVARCHAR2(255) NOT NULL ,
LOCK_EXP_TIME_ TIMESTAMP(6)  NULL ,
LOCK_OWNER_ NVARCHAR2(255) NULL ,
EXCLUSIVE_ NUMBER(1) NULL ,
EXECUTION_ID_ NVARCHAR2(64) NULL ,
PROCESS_INSTANCE_ID_ NVARCHAR2(64) NULL ,
PROC_DEF_ID_ NVARCHAR2(64) NULL ,
RETRIES_ NUMBER NULL ,
EXCEPTION_STACK_ID_ NVARCHAR2(64) NULL ,
EXCEPTION_MSG_ NVARCHAR2(2000) NULL ,
DUEDATE_ TIMESTAMP(6)  NULL ,
REPEAT_ NVARCHAR2(255) NULL ,
HANDLER_TYPE_ NVARCHAR2(255) NULL ,
HANDLER_CFG_ NVARCHAR2(2000) NULL ,
TENANT_ID_ NVARCHAR2(255) DEFAULT ''  NULL 
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
-- DROP TABLE IF EXISTS AOS_WF_RU_TASK;
CREATE TABLE AOS_WF_RU_TASK (
ID_ NVARCHAR2(64) NOT NULL ,
REV_ NUMBER NULL ,
EXECUTION_ID_ NVARCHAR2(64) NULL ,
PROC_INST_ID_ NVARCHAR2(64) NULL ,
PROC_DEF_ID_ NVARCHAR2(64) NULL ,
NAME_ NVARCHAR2(255) NULL ,
PARENT_TASK_ID_ NVARCHAR2(64) NULL ,
DESCRIPTION_ NVARCHAR2(2000) NULL ,
TASK_DEF_KEY_ NVARCHAR2(255) NULL ,
OWNER_ NVARCHAR2(255) NULL ,
ASSIGNEE_ NVARCHAR2(255) NULL ,
DELEGATION_ NVARCHAR2(64) NULL ,
PRIORITY_ NUMBER NULL ,
CREATE_TIME_ TIMESTAMP(6)  NULL ,
DUE_DATE_ TIMESTAMP(6)  NULL ,
CATEGORY_ NVARCHAR2(255) NULL ,
SUSPENSION_STATE_ NUMBER NULL ,
TENANT_ID_ NVARCHAR2(255) DEFAULT ''  NULL ,
FORM_KEY_ NVARCHAR2(255) NULL 
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
-- DROP TABLE IF EXISTS AOS_WF_RU_VARIABLE;
CREATE TABLE AOS_WF_RU_VARIABLE (
ID_ NVARCHAR2(64) NOT NULL ,
REV_ NUMBER NULL ,
TYPE_ NVARCHAR2(255) NOT NULL ,
NAME_ NVARCHAR2(255) NOT NULL ,
EXECUTION_ID_ NVARCHAR2(64) NULL ,
PROC_INST_ID_ NVARCHAR2(64) NULL ,
TASK_ID_ NVARCHAR2(64) NULL ,
BYTEARRAY_ID_ NVARCHAR2(64) NULL ,
DOUBLE_ NUMBER NULL ,
LONG_ NUMBER(19) NULL ,
TEXT_ NVARCHAR2(2000) NULL ,
TEXT2_ NVARCHAR2(2000) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE
;

-- ----------------------------
-- Records of AOS_WF_RU_VARIABLE
-- ----------------------------

-- ----------------------------
-- Table structure for DEMO_ACCOUNT
-- ----------------------------
-- DROP TABLE IF EXISTS DEMO_ACCOUNT;
CREATE TABLE DEMO_ACCOUNT (
ID_ NVARCHAR2(64) NOT NULL ,
NAME_ NVARCHAR2(255) NOT NULL ,
CARD_ID_ NVARCHAR2(255) NOT NULL ,
CARD_TYPE_ NVARCHAR2(6) NOT NULL ,
BALANCE_ NUMBER NULL ,
CREDIT_LINE_ NUMBER NULL ,
ORG_ID_ NVARCHAR2(64) NULL ,
ID_NO_ NVARCHAR2(255) NULL ,
SEX_ NVARCHAR2(6) NULL ,
BIRTHDAY_ DATE NULL ,
AGE_ NUMBER(11) NULL ,
ADDRESS_ NVARCHAR2(255) NULL ,
CREATE_TIME_ DATE NOT NULL ,
CREATE_USER_ID_ NVARCHAR2(64) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE
;
COMMENT ON TABLE DEMO_ACCOUNT IS '银行信用卡账户表';
COMMENT ON COLUMN DEMO_ACCOUNT.ID_ IS '流水号';
COMMENT ON COLUMN DEMO_ACCOUNT.NAME_ IS '姓名';
COMMENT ON COLUMN DEMO_ACCOUNT.CARD_ID_ IS '卡号';
COMMENT ON COLUMN DEMO_ACCOUNT.CARD_TYPE_ IS '卡类型';
COMMENT ON COLUMN DEMO_ACCOUNT.BALANCE_ IS '可用余额';
COMMENT ON COLUMN DEMO_ACCOUNT.CREDIT_LINE_ IS '信用额度';
COMMENT ON COLUMN DEMO_ACCOUNT.ORG_ID_ IS '所属银行机构ID';
COMMENT ON COLUMN DEMO_ACCOUNT.ID_NO_ IS '身份证号';
COMMENT ON COLUMN DEMO_ACCOUNT.SEX_ IS '性别';
COMMENT ON COLUMN DEMO_ACCOUNT.BIRTHDAY_ IS '生日';
COMMENT ON COLUMN DEMO_ACCOUNT.AGE_ IS '年龄';
COMMENT ON COLUMN DEMO_ACCOUNT.ADDRESS_ IS '地址';
COMMENT ON COLUMN DEMO_ACCOUNT.CREATE_TIME_ IS '创建时间';
COMMENT ON COLUMN DEMO_ACCOUNT.CREATE_USER_ID_ IS '创建人ID';

-- ----------------------------
-- Records of DEMO_ACCOUNT
-- ----------------------------
INSERT INTO DEMO_ACCOUNT VALUES ('7016', '李话', '10004384', '2', '55628.46', '80000', '000', '2925197310248976', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '24', '上海霞飞路832号', TO_DATE('2016-04-24 21:51:26', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7017', '张零', '10004385', '1', '52494.43', '80000', '000', '2925193612222217', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '22', '上海霞飞路352号', TO_DATE('2016-04-24 21:51:26', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7018', '段堪', '10004386', '2', '74231.65', '80000', '000', '2925192211177164', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '49', '上海霞飞路335号', TO_DATE('2016-04-24 21:51:26', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7019', '张茄蒜', '10004387', '1', '49857.89', '80000', '000', '2925196711295696', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '50', '上海霞飞路899号', TO_DATE('2016-04-24 21:51:26', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7020', '黄吓粕', '10004388', '1', '32365.84', '80000', '000', '2925194311143876', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '21', '上海霞飞路616号', TO_DATE('2016-04-24 21:51:26', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7021', '刘偶', '10004389', '2', '21795.90', '80000', '000', '2925196110105758', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '39', '上海霞飞路228号', TO_DATE('2016-04-24 21:51:26', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7022', '黄萧奔', '10004390', '2', '48237.14', '80000', '000', '2925192411239377', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '90', '上海霞飞路363号', TO_DATE('2016-04-24 21:51:26', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7023', '周奄', '10004391', '1', '26985.86', '80000', '000', '2925199110234384', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '33', '上海霞飞路905号', TO_DATE('2016-04-24 21:51:26', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7024', '郤听届', '10004392', '2', '78382.10', '80000', '000', '2925200712221895', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '27', '上海霞飞路943号', TO_DATE('2016-04-24 21:51:26', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7025', '郤肿邑', '10004393', '1', '37891.98', '80000', '000', '2925194910139166', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '78', '上海霞飞路933号', TO_DATE('2016-04-24 21:51:26', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7026', '郤淋监', '10004394', '2', '55632.10', '80000', '000', '2925196810196758', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '48', '上海霞飞路950号', TO_DATE('2016-04-24 21:51:27', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7027', '熊寐', '10004395', '2', '66967.50', '80000', '000', '2925194910116797', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '33', '上海霞飞路526号', TO_DATE('2016-04-24 21:51:27', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7028', '黄娄', '10004396', '1', '46838.94', '80000', '000', '2925199911135993', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '31', '上海霞飞路744号', TO_DATE('2016-04-24 21:51:27', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7029', '毛雍', '10004397', '2', '22244.78', '80000', '000', '2925201411224915', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '47', '上海霞飞路851号', TO_DATE('2016-04-24 21:51:27', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7030', '黄保', '10004398', '1', '57742.50', '80000', '000', '2925197412263997', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '66', '上海霞飞路722号', TO_DATE('2016-04-24 21:51:27', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7031', '段开撒', '10004399', '2', '75957.55', '80000', '000', '2925201311145590', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '52', '上海霞飞路67号', TO_DATE('2016-04-24 21:51:27', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7032', '熊蓉贝', '10004400', '2', '18892.13', '80000', '000', '2925193910251212', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '92', '上海霞飞路267号', TO_DATE('2016-04-24 21:51:27', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7033', '赵旷正', '10004401', '1', '54357.27', '80000', '000', '2925195411219976', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '64', '上海霞飞路234号', TO_DATE('2016-04-24 21:51:27', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7034', '李搅晶', '10004402', '1', '61007.90', '80000', '000', '2925198411117947', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '51', '上海霞飞路595号', TO_DATE('2016-04-24 21:51:27', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7035', '熊瞅萨', '10004403', '1', '75351.24', '80000', '000', '2925193312152904', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '87', '上海霞飞路972号', TO_DATE('2016-04-24 21:51:27', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7036', '张襄', '10004404', '1', '22688.40', '80000', '000', '2925192612247748', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '67', '上海霞飞路978号', TO_DATE('2016-04-24 21:51:27', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7037', '赵偿摔', '10004405', '1', '17132.39', '80000', '000', '2925199111213433', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '75', '上海霞飞路919号', TO_DATE('2016-04-24 21:51:27', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7038', '段砰', '10004406', '2', '37873.94', '80000', '000', '2925194611266966', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '78', '上海霞飞路32号', TO_DATE('2016-04-24 21:51:27', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7039', '熊倪', '10004407', '1', '7427.17', '80000', '000', '2925199311288668', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '86', '上海霞飞路344号', TO_DATE('2016-04-24 21:51:28', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7040', '段棵', '10004408', '2', '72926.79', '80000', '000', '2925199310113434', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '25', '上海霞飞路56号', TO_DATE('2016-04-24 21:51:28', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7041', '刘战哭', '10004409', '1', '71540.90', '80000', '000', '2925192211192335', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '59', '上海霞飞路516号', TO_DATE('2016-04-24 21:51:28', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7042', '李检即', '10004410', '2', '75776.91', '80000', '000', '2925200912286396', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '63', '上海霞飞路632号', TO_DATE('2016-04-24 21:51:28', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7043', '刘瞎坊', '10004411', '1', '55803.42', '80000', '000', '2925198112183913', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '61', '上海霞飞路650号', TO_DATE('2016-04-24 21:51:28', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7044', '毛挥', '10004412', '2', '49990.73', '80000', '000', '2925197112248100', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '64', '上海霞飞路948号', TO_DATE('2016-04-24 21:51:28', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7045', '张氛遏', '10004413', '2', '73620.32', '80000', '000', '2925199911211346', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '41', '上海霞飞路533号', TO_DATE('2016-04-24 21:51:28', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7046', '张刹刽', '10004414', '2', '51179.77', '80000', '000', '2925195212177694', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '44', '上海霞飞路555号', TO_DATE('2016-04-24 21:51:28', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7047', '郤介', '10004415', '2', '37720', '80000', '000', '2925195912248606', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '78', '上海霞飞路159号', TO_DATE('2016-04-24 21:51:28', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7048', '毛轰', '10004416', '2', '47652.70', '80000', '000', '2925199511171342', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '76', '上海霞飞路532号', TO_DATE('2016-04-24 21:51:28', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7049', '毛饲', '10004417', '2', '42792.59', '80000', '000', '2925195210195647', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '40', '上海霞飞路973号', TO_DATE('2016-04-24 21:51:28', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7050', '赵表趣', '10004418', '1', '49688.95', '80000', '000', '2925198112127701', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '72', '上海霞飞路270号', TO_DATE('2016-04-24 21:51:28', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7051', '周潘弛', '10004419', '1', '51138.17', '80000', '000', '2925200011136509', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '73', '上海霞飞路566号', TO_DATE('2016-04-24 21:51:28', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7052', '黄印', '10004420', '1', '42352.42', '80000', '000', '2925196711232172', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '68', '上海霞飞路338号', TO_DATE('2016-04-24 21:51:28', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7053', '段毯', '10004421', '1', '16492.20', '80000', '000', '2925200510208618', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '75', '上海霞飞路886号', TO_DATE('2016-04-24 21:51:28', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7054', '刘必帛', '10004422', '1', '15236.25', '80000', '000', '2925200112284563', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '52', '上海霞飞路145号', TO_DATE('2016-04-24 21:51:29', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7055', '段莹', '10004423', '1', '45661.79', '80000', '000', '2925201011161552', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '26', '上海霞飞路344号', TO_DATE('2016-04-24 21:51:29', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7056', '熊墙', '10004424', '1', '31034.51', '80000', '000', '2925194411309079', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '93', '上海霞飞路369号', TO_DATE('2016-04-24 21:51:29', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7057', '黄炊', '10004425', '1', '68129.87', '80000', '000', '2925195710288784', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '93', '上海霞飞路369号', TO_DATE('2016-04-24 21:51:29', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7058', '刘脊炼', '10004426', '1', '71338.31', '80000', '000', '2925196011115790', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '87', '上海霞飞路362号', TO_DATE('2016-04-24 21:51:29', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7059', '周酬', '10004427', '2', '56275.19', '80000', '000', '2925194011153225', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '57', '上海霞飞路278号', TO_DATE('2016-04-24 21:51:29', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7060', '李氦', '10004428', '2', '8568.73', '80000', '000', '2925196610282968', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '93', '上海霞飞路994号', TO_DATE('2016-04-24 21:51:29', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7061', '段显', '10004429', '1', '7359.34', '80000', '000', '2925196311117529', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '49', '上海霞飞路532号', TO_DATE('2016-04-24 21:51:29', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7062', '毛免恩', '10004430', '2', '71416.31', '80000', '000', '2925200211146962', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '44', '上海霞飞路666号', TO_DATE('2016-04-24 21:51:29', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7063', '黄拷', '10004431', '2', '26911.91', '80000', '000', '2925199511138499', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '57', '上海霞飞路730号', TO_DATE('2016-04-24 21:51:29', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7064', '张贯', '10004432', '1', '43729.68', '80000', '000', '2925194411118502', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '84', '上海霞飞路428号', TO_DATE('2016-04-24 21:51:29', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7065', '刘消', '10004433', '2', '57685.90', '80000', '000', '2925194611131085', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '68', '上海霞飞路922号', TO_DATE('2016-04-24 21:51:29', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7066', '熊鼎扮', '10004434', '2', '43193.12', '80000', '000', '2925199110288582', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '30', '上海霞飞路449号', TO_DATE('2016-04-24 21:51:30', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7067', '李覆', '10004435', '1', '74824.11', '80000', '000', '2925199912122755', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '55', '上海霞飞路95号', TO_DATE('2016-04-24 21:51:30', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7068', '郤勋', '10004436', '2', '46757.99', '80000', '000', '2925194510172341', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '84', '上海霞飞路286号', TO_DATE('2016-04-24 21:51:30', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7069', '熊鄙玫', '10004437', '1', '32371.17', '80000', '000', '2925196010177286', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '99', '上海霞飞路895号', TO_DATE('2016-04-24 21:51:30', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7070', '周魂维', '10004438', '1', '10159.66', '80000', '000', '2925197012183569', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '87', '上海霞飞路662号', TO_DATE('2016-04-24 21:51:30', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7557', '周破辩', '10004925', '1', '19022.75', '80000', '000', '2925192711122375', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '49', '上海霞飞路744号', TO_DATE('2016-04-24 21:52:08', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7558', '毛豆', '10004926', '2', '43165.73', '80000', '000', '2925199610117615', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '35', '上海霞飞路284号', TO_DATE('2016-04-24 21:52:08', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7559', '熊欧计', '10004927', '1', '53155.98', '80000', '000', '2925192512257233', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '55', '上海霞飞路64号', TO_DATE('2016-04-24 21:52:08', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7560', '毛给矢', '10004928', '1', '32372.70', '80000', '000', '2925192511186461', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '69', '上海霞飞路439号', TO_DATE('2016-04-24 21:52:08', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7561', '段需磋', '10004929', '1', '73781.76', '80000', '000', '2925201411202185', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '51', '上海霞飞路452号', TO_DATE('2016-04-24 21:52:08', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7562', '段篷汗', '10004930', '1', '75413.30', '80000', '000', '2925192811105699', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '43', '上海霞飞路907号', TO_DATE('2016-04-24 21:52:08', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7563', '周述汞', '10004931', '2', '50617.22', '80000', '000', '2925200711128019', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '35', '上海霞飞路318号', TO_DATE('2016-04-24 21:52:08', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7564', '熊怠垂', '10004932', '2', '74571.34', '80000', '000', '2925197412141672', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '19', '上海霞飞路789号', TO_DATE('2016-04-24 21:52:08', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7565', '黄郝', '10004933', '2', '38740.33', '80000', '000', '2925193711232069', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '76', '上海霞飞路810号', TO_DATE('2016-04-24 21:52:08', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7566', '李胎择', '10004934', '2', '51976.56', '80000', '000', '2925198010204701', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '98', '上海霞飞路193号', TO_DATE('2016-04-24 21:52:08', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7567', '毛曲', '10004935', '1', '68508.57', '80000', '000', '2925200111147549', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '84', '上海霞飞路245号', TO_DATE('2016-04-24 21:52:08', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7568', '毛镍抚', '10004936', '2', '57456.47', '80000', '000', '2925193111249154', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '36', '上海霞飞路490号', TO_DATE('2016-04-24 21:52:09', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7569', '李橱', '10004937', '2', '61445.69', '80000', '000', '2925199510258891', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '93', '上海霞飞路992号', TO_DATE('2016-04-24 21:52:09', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7570', '李菠', '10004938', '2', '75622.82', '80000', '000', '2925198411229987', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '30', '上海霞飞路551号', TO_DATE('2016-04-24 21:52:09', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7571', '黄炎笺', '10004939', '2', '74744.97', '80000', '000', '2925199010201845', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '35', '上海霞飞路673号', TO_DATE('2016-04-24 21:52:09', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7572', '熊币宣', '10004940', '1', '59068.16', '80000', '000', '2925194310132168', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '44', '上海霞飞路418号', TO_DATE('2016-04-24 21:52:09', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7573', '李盂', '10004941', '2', '11527.87', '80000', '000', '2925196911223376', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '88', '上海霞飞路743号', TO_DATE('2016-04-24 21:52:09', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7574', '张腰积', '10004942', '2', '11111.33', '80000', '000', '2925200111109618', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '74', '上海霞飞路140号', TO_DATE('2016-04-24 21:52:09', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7575', '毛钙', '10004943', '2', '24522.73', '80000', '000', '2925192810191648', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '26', '上海霞飞路813号', TO_DATE('2016-04-24 21:52:09', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7576', '郤阜', '10004944', '1', '59940.40', '80000', '000', '2925199311173604', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '46', '上海霞飞路728号', TO_DATE('2016-04-24 21:52:09', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7577', '张瘴', '10004945', '2', '47297.83', '80000', '000', '2925200210128589', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '38', '上海霞飞路298号', TO_DATE('2016-04-24 21:52:09', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7578', '赵翰露', '10004946', '1', '40592.33', '80000', '000', '2925198811144693', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '79', '上海霞飞路448号', TO_DATE('2016-04-24 21:52:09', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7579', '黄覆', '10004947', '1', '13701.38', '80000', '000', '2925200412281858', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '79', '上海霞飞路217号', TO_DATE('2016-04-24 21:52:09', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7580', '熊狈监', '10004948', '1', '43654.70', '80000', '000', '2925194711197716', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '99', '上海霞飞路915号', TO_DATE('2016-04-24 21:52:09', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7581', '刘哲', '10004949', '2', '50664.78', '80000', '000', '2925196012294197', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '84', '上海霞飞路263号', TO_DATE('2016-04-24 21:52:09', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7582', '赵茵村', '10004950', '2', '78067.68', '80000', '000', '2925193111211352', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '61', '上海霞飞路707号', TO_DATE('2016-04-24 21:52:10', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7583', '张诚', '10004951', '1', '22002.48', '80000', '000', '2925194610271485', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '55', '上海霞飞路449号', TO_DATE('2016-04-24 21:52:10', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7584', '郤藤曰', '10004952', '2', '47967.74', '80000', '000', '2925194512255258', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '55', '上海霞飞路454号', TO_DATE('2016-04-24 21:52:10', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7585', '郤彤', '10004953', '1', '39373.30', '80000', '000', '2925199611255989', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '82', '上海霞飞路950号', TO_DATE('2016-04-24 21:52:10', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7586', '张斟湛', '10004954', '2', '77925.27', '80000', '000', '2925200511204907', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '32', '上海霞飞路634号', TO_DATE('2016-04-24 21:52:10', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7587', '黄唱鹿', '10004955', '2', '23034.87', '80000', '000', '2925196212226618', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '92', '上海霞飞路960号', TO_DATE('2016-04-24 21:52:10', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7588', '段孰滩', '10004956', '2', '55509.64', '80000', '000', '2925194912228499', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '33', '上海霞飞路522号', TO_DATE('2016-04-24 21:52:10', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7589', '熊瞄居', '10004957', '1', '39558.70', '80000', '000', '2925195512159175', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '94', '上海霞飞路666号', TO_DATE('2016-04-24 21:52:10', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7590', '赵趟都', '10004958', '2', '16553.63', '80000', '000', '2925198110212638', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '36', '上海霞飞路17号', TO_DATE('2016-04-24 21:52:10', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7591', '黄踩', '10004959', '2', '54133.98', '80000', '000', '2925194711282924', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '82', '上海霞飞路670号', TO_DATE('2016-04-24 21:52:10', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7592', '刘挣', '10004960', '1', '57044.92', '80000', '000', '2925193312248649', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '94', '上海霞飞路309号', TO_DATE('2016-04-24 21:52:10', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7593', '张批坪', '10004961', '2', '47624.11', '80000', '000', '2925198910256951', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '86', '上海霞飞路461号', TO_DATE('2016-04-24 21:52:10', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7594', '黄懒卷', '10004962', '1', '28008.11', '80000', '000', '2925198111162709', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '21', '上海霞飞路611号', TO_DATE('2016-04-24 21:52:10', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7595', '黄诣胚', '10004963', '2', '61024.57', '80000', '000', '2925195512121153', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '64', '上海霞飞路757号', TO_DATE('2016-04-24 21:52:10', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7596', '赵莹竿', '10004964', '2', '28312.70', '80000', '000', '2925197612235170', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '57', '上海霞飞路401号', TO_DATE('2016-04-24 21:52:11', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7597', '黄峭', '10004965', '2', '44445.73', '80000', '000', '2925192411307826', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '87', '上海霞飞路835号', TO_DATE('2016-04-24 21:52:11', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7598', '张挫空', '10004966', '2', '64766.14', '80000', '000', '2925200512187750', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '91', '上海霞飞路898号', TO_DATE('2016-04-24 21:52:11', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7599', '刘富', '10004967', '2', '72309.47', '80000', '000', '2925198111257173', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '60', '上海霞飞路157号', TO_DATE('2016-04-24 21:52:11', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7600', '毛夺', '10004968', '1', '79433.59', '80000', '000', '2925195410153483', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '84', '上海霞飞路755号', TO_DATE('2016-04-24 21:52:11', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7601', '段吐', '10004969', '1', '24876.96', '80000', '000', '2925192010132235', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '32', '上海霞飞路903号', TO_DATE('2016-04-24 21:52:11', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7602', '黄宴玲', '10004970', '2', '8539.21', '80000', '000', '2925196311188572', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '99', '上海霞飞路146号', TO_DATE('2016-04-24 21:52:11', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7603', '熊瓶锯', '10004971', '2', '74764.84', '80000', '000', '2925196212182023', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '77', '上海霞飞路259号', TO_DATE('2016-04-24 21:52:11', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7604', '李雾社', '10004972', '2', '73885.70', '80000', '000', '2925199711233573', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '21', '上海霞飞路748号', TO_DATE('2016-04-24 21:52:11', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7605', '张整', '10004973', '2', '79601.66', '80000', '000', '2925198612278903', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '74', '上海霞飞路510号', TO_DATE('2016-04-24 21:52:11', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7606', '李暑衍', '10004974', '1', '46161.82', '80000', '000', '2925197610292528', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '30', '上海霞飞路317号', TO_DATE('2016-04-24 21:52:11', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7607', '赵蒜课', '10004975', '2', '70470.38', '80000', '000', '2925194011128475', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '65', '上海霞飞路328号', TO_DATE('2016-04-24 21:52:11', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7608', '郤畦沧', '10004976', '2', '12051.10', '80000', '000', '2925197011161984', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '66', '上海霞飞路813号', TO_DATE('2016-04-24 21:52:12', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7609', '毛褂', '10004977', '2', '48284.18', '80000', '000', '2925193310137498', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '89', '上海霞飞路808号', TO_DATE('2016-04-24 21:52:12', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7610', '段暴', '10004978', '2', '15546.20', '80000', '000', '2925196811145020', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '51', '上海霞飞路313号', TO_DATE('2016-04-24 21:52:12', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7611', '李强', '10004979', '1', '56750.40', '80000', '000', '2925197211205633', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '25', '上海霞飞路113号', TO_DATE('2016-04-24 21:52:12', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7612', '郤链', '10004980', '1', '32338.13', '80000', '000', '2925200510142711', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '37', '上海霞飞路154号', TO_DATE('2016-04-24 21:52:12', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7613', '赵瞅', '10004981', '1', '39053.65', '80000', '000', '2925198312255031', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '55', '上海霞飞路795号', TO_DATE('2016-04-24 21:52:12', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7614', '李酿', '10004982', '2', '52719.97', '80000', '000', '2925200011274653', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '47', '上海霞飞路37号', TO_DATE('2016-04-24 21:52:12', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7615', '毛腰燕', '10004983', '1', '39937.75', '80000', '000', '2925192112172037', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '75', '上海霞飞路173号', TO_DATE('2016-04-24 21:52:12', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7616', '张啪', '10004984', '2', '66865.48', '80000', '000', '2925196211165486', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '52', '上海霞飞路45号', TO_DATE('2016-04-24 21:52:12', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7617', '黄络踏', '10004985', '1', '75297.96', '80000', '000', '2925201312176547', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '40', '上海霞飞路300号', TO_DATE('2016-04-24 21:52:12', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7618', '郤毁核', '10004986', '1', '60911.61', '80000', '000', '2925197012281529', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '45', '上海霞飞路797号', TO_DATE('2016-04-24 21:52:12', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7619', '熊别', '10004987', '2', '45959.59', '80000', '000', '2925193410121793', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '99', '上海霞飞路415号', TO_DATE('2016-04-24 21:52:12', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7620', '张俭', '10004988', '2', '76719.92', '80000', '000', '2925194110172960', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '47', '上海霞飞路208号', TO_DATE('2016-04-24 21:52:12', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7621', '熊苹儒', '10004989', '1', '16785.60', '80000', '000', '2925193610272573', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '77', '上海霞飞路931号', TO_DATE('2016-04-24 21:52:12', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7622', '刘瘟', '10004990', '2', '36727.84', '80000', '000', '2925198611167184', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '43', '上海霞飞路544号', TO_DATE('2016-04-24 21:52:13', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7623', '李躺', '10004991', '2', '16743.95', '80000', '000', '2925195510103222', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '87', '上海霞飞路324号', TO_DATE('2016-04-24 21:52:13', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7624', '赵戳', '10004992', '1', '15787.48', '80000', '000', '2925200512219277', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '57', '上海霞飞路780号', TO_DATE('2016-04-24 21:52:13', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7625', '张漆', '10004993', '1', '14111.85', '80000', '000', '2925193811244835', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '52', '上海霞飞路486号', TO_DATE('2016-04-24 21:52:13', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7626', '黄收', '10004994', '2', '32388.77', '80000', '000', '2925199812241682', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '78', '上海霞飞路432号', TO_DATE('2016-04-24 21:52:13', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7627', '李冗蜜', '10004995', '1', '73440.26', '80000', '000', '2925192411217527', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '56', '上海霞飞路415号', TO_DATE('2016-04-24 21:52:13', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7628', '周毡', '10004996', '1', '78155.30', '80000', '000', '2925201210267543', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '71', '上海霞飞路356号', TO_DATE('2016-04-24 21:52:13', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7629', '李迹', '10004997', '2', '53448.52', '80000', '000', '2925196211248755', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '66', '上海霞飞路305号', TO_DATE('2016-04-24 21:52:13', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7630', '赵蛰醇', '10004998', '2', '13039.10', '80000', '000', '2925200010285335', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '100', '上海霞飞路220号', TO_DATE('2016-04-24 21:52:13', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7631', '毛典', '10004999', '1', '73470.54', '80000', '000', '2925195011125983', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '96', '上海霞飞路385号', TO_DATE('2016-04-24 21:52:13', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7632', '毛畸干', '10005000', '2', '8075.89', '80000', '000', '2925198111299691', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '73', '上海霞飞路612号', TO_DATE('2016-04-24 21:52:13', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7633', '李滨绽', '10005001', '2', '34633.43', '80000', '000', '2925200110134208', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '60', '上海霞飞路99号', TO_DATE('2016-04-24 21:52:13', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7634', '段衫兼', '10005002', '2', '16127.90', '80000', '000', '2925198310228581', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '93', '上海霞飞路1000号', TO_DATE('2016-04-24 21:52:13', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7635', '赵况撑', '10005003', '1', '52390.67', '80000', '000', '2925195411124141', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '70', '上海霞飞路467号', TO_DATE('2016-04-24 21:52:14', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7636', '熊榆彬', '10005004', '1', '25505.81', '80000', '000', '2925199811158241', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '68', '上海霞飞路16号', TO_DATE('2016-04-24 21:52:14', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7637', '张糯', '10005005', '1', '49568.35', '80000', '000', '2925201110303048', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '84', '上海霞飞路716号', TO_DATE('2016-04-24 21:52:14', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7638', '刘鹰傣', '10005006', '2', '23818.87', '80000', '000', '2925193611308671', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '43', '上海霞飞路515号', TO_DATE('2016-04-24 21:58:05', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7639', '毛萎', '10005007', '1', '74167.81', '80000', '000', '2925196610128997', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '27', '上海霞飞路276号', TO_DATE('2016-04-24 21:58:48', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7640', '段桂', '10005008', '2', '20906.45', '80000', '000', '2925193412284598', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '28', '上海霞飞路962号', TO_DATE('2016-04-24 21:59:52', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7641', '郤雁', '10005009', '1', '23868.76', '80000', '000', '2925195210235716', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '59', '上海霞飞路137号', TO_DATE('2016-04-24 22:01:29', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7642', '黄述促', '10005010', '2', '58446.62', '80000', '000', '2925194310154057', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '52', '上海霞飞路740号', TO_DATE('2016-04-24 22:02:24', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7643', '周根', '10005011', '1', '59843.31', '80000', '000', '2925197112187201', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '78', '上海霞飞路780号', TO_DATE('2016-04-24 22:03:03', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7644', '熊戈嗽', '10005012', '2', '57582.36', '80000', '000', '2925192112295287', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '80', '上海霞飞路398号', TO_DATE('2016-04-24 22:03:18', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7071', '李害', '10004439', '1', '48798.76', '80000', '000', '2925197910192232', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '43', '上海霞飞路967号', TO_DATE('2016-04-24 21:51:30', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7072', '熊宫', '10004440', '1', '79481.40', '80000', '000', '2925196712175767', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '66', '上海霞飞路734号', TO_DATE('2016-04-24 21:51:30', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7073', '李阔鸯', '10004441', '2', '79678.59', '80000', '000', '2925193811285597', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '73', '上海霞飞路454号', TO_DATE('2016-04-24 21:51:30', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7074', '黄请', '10004442', '1', '41109.91', '80000', '000', '2925200011112895', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '61', '上海霞飞路59号', TO_DATE('2016-04-24 21:51:30', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7075', '段讶笼', '10004443', '1', '46166.52', '80000', '000', '2925201311167510', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '44', '上海霞飞路526号', TO_DATE('2016-04-24 21:51:30', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7076', '毛忌', '10004444', '1', '61015.10', '80000', '000', '2925201112206213', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '57', '上海霞飞路709号', TO_DATE('2016-04-24 21:51:30', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7077', '周点付', '10004445', '1', '74425.21', '80000', '000', '2925201011141906', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '29', '上海霞飞路37号', TO_DATE('2016-04-24 21:51:30', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7078', '郤遥胡', '10004446', '1', '46746.93', '80000', '000', '2925197912124875', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '90', '上海霞飞路278号', TO_DATE('2016-04-24 21:51:30', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7079', '李城萨', '10004447', '2', '75654.44', '80000', '000', '2925196411217498', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '48', '上海霞飞路606号', TO_DATE('2016-04-24 21:51:30', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7080', '张井晕', '10004448', '1', '16024.88', '80000', '000', '2925193111149176', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '98', '上海霞飞路721号', TO_DATE('2016-04-24 21:51:31', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7081', '赵疆滇', '10004449', '2', '60862.25', '80000', '000', '2925201411116586', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '96', '上海霞飞路769号', TO_DATE('2016-04-24 21:51:31', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7082', '刘捶', '10004450', '1', '26358.57', '80000', '000', '2925198611302593', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '24', '上海霞飞路249号', TO_DATE('2016-04-24 21:51:31', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7083', '周拨', '10004451', '2', '13041.27', '80000', '000', '2925199610292442', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '26', '上海霞飞路993号', TO_DATE('2016-04-24 21:51:31', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7084', '黄罩非', '10004452', '2', '14560.72', '80000', '000', '2925196411189038', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '25', '上海霞飞路747号', TO_DATE('2016-04-24 21:51:31', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7085', '熊酸', '10004453', '2', '7874.15', '80000', '000', '2925196411132336', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '38', '上海霞飞路669号', TO_DATE('2016-04-24 21:51:31', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7086', '周夹赵', '10004454', '2', '61567.26', '80000', '000', '2925194010286972', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '44', '上海霞飞路433号', TO_DATE('2016-04-24 21:51:31', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7087', '张袖狙', '10004455', '2', '34646.67', '80000', '000', '2925193010255458', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '60', '上海霞飞路420号', TO_DATE('2016-04-24 21:51:31', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7088', '李违少', '10004456', '2', '62471.82', '80000', '000', '2925198710109268', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '91', '上海霞飞路702号', TO_DATE('2016-04-24 21:51:31', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7089', '黄克殷', '10004457', '2', '23492.13', '80000', '000', '2925199311185276', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '42', '上海霞飞路305号', TO_DATE('2016-04-24 21:51:31', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7090', '李绵您', '10004458', '2', '20144.42', '80000', '000', '2925196411168997', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '55', '上海霞飞路402号', TO_DATE('2016-04-24 21:51:31', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7091', '周央稠', '10004459', '1', '11629.99', '80000', '000', '2925195511219088', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '59', '上海霞飞路769号', TO_DATE('2016-04-24 21:51:31', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7092', '毛酶', '10004460', '1', '53376.25', '80000', '000', '2925193111126526', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '19', '上海霞飞路983号', TO_DATE('2016-04-24 21:51:31', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7093', '郤蜂', '10004461', '1', '29737.95', '80000', '000', '2925192010177828', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '84', '上海霞飞路422号', TO_DATE('2016-04-24 21:51:32', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7094', '赵跃', '10004462', '1', '42897.10', '80000', '000', '2925198410122576', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '22', '上海霞飞路239号', TO_DATE('2016-04-24 21:51:32', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7095', '刘塞都', '10004463', '1', '48114.94', '80000', '000', '2925198712242365', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '77', '上海霞飞路986号', TO_DATE('2016-04-24 21:51:32', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7096', '周布', '10004464', '2', '41214.25', '80000', '000', '2925197311196162', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '41', '上海霞飞路613号', TO_DATE('2016-04-24 21:51:32', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7097', '熊颅', '10004465', '1', '44777.51', '80000', '000', '2925200411285854', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '50', '上海霞飞路14号', TO_DATE('2016-04-24 21:51:32', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7098', '郤帐除', '10004466', '2', '74628.61', '80000', '000', '2925192511139542', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '69', '上海霞飞路277号', TO_DATE('2016-04-24 21:51:32', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7099', '张剃', '10004467', '2', '54135.88', '80000', '000', '2925200610246900', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '61', '上海霞飞路193号', TO_DATE('2016-04-24 21:51:32', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7100', '李怜仍', '10004468', '1', '56362.97', '80000', '000', '2925197412161605', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '44', '上海霞飞路450号', TO_DATE('2016-04-24 21:51:32', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7101', '赵绒俄', '10004469', '1', '73406.53', '80000', '000', '2925199111106567', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '78', '上海霞飞路356号', TO_DATE('2016-04-24 21:51:32', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7102', '周蛮大', '10004470', '1', '30164.76', '80000', '000', '2925200511213313', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '45', '上海霞飞路671号', TO_DATE('2016-04-24 21:51:32', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7103', '赵栽接', '10004471', '2', '18400.95', '80000', '000', '2925198411121501', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '38', '上海霞飞路513号', TO_DATE('2016-04-24 21:51:32', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7104', '赵烹', '10004472', '2', '20321.16', '80000', '000', '2925194110193150', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '42', '上海霞飞路991号', TO_DATE('2016-04-24 21:51:32', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7105', '李产', '10004473', '2', '12844.13', '80000', '000', '2925192610143716', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '87', '上海霞飞路503号', TO_DATE('2016-04-24 21:51:32', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7106', '黄寸', '10004474', '2', '40449.76', '80000', '000', '2925200812265678', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '82', '上海霞飞路299号', TO_DATE('2016-04-24 21:51:33', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7107', '刘难', '10004475', '1', '55874.79', '80000', '000', '2925194412259791', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '47', '上海霞飞路109号', TO_DATE('2016-04-24 21:51:33', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7108', '周亚逐', '10004476', '2', '17978.50', '80000', '000', '2925201311163640', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '67', '上海霞飞路248号', TO_DATE('2016-04-24 21:51:33', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7109', '李却', '10004477', '2', '54857.52', '80000', '000', '2925200311245536', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '27', '上海霞飞路727号', TO_DATE('2016-04-24 21:51:33', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7110', '熊慎蝗', '10004478', '1', '75721.64', '80000', '000', '2925198711111246', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '48', '上海霞飞路492号', TO_DATE('2016-04-24 21:51:33', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7111', '熊绚', '10004479', '1', '45186.23', '80000', '000', '2925199210194367', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '33', '上海霞飞路914号', TO_DATE('2016-04-24 21:51:33', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7112', '李厘姆', '10004480', '1', '76432.27', '80000', '000', '2925194910132541', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '76', '上海霞飞路210号', TO_DATE('2016-04-24 21:51:33', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7113', '张征', '10004481', '1', '67196.56', '80000', '000', '2925200511122968', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '53', '上海霞飞路429号', TO_DATE('2016-04-24 21:51:33', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7114', '毛搓府', '10004482', '1', '18744.82', '80000', '000', '2925194311167024', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '69', '上海霞飞路108号', TO_DATE('2016-04-24 21:51:33', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7115', '李谷慰', '10004483', '1', '76852.43', '80000', '000', '2925198712259957', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '53', '上海霞飞路582号', TO_DATE('2016-04-24 21:51:33', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7116', '李线', '10004484', '2', '79393.60', '80000', '000', '2925195611292906', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '97', '上海霞飞路393号', TO_DATE('2016-04-24 21:51:33', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7117', '赵贾林', '10004485', '2', '63358.42', '80000', '000', '2925197212218648', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '23', '上海霞飞路999号', TO_DATE('2016-04-24 21:51:33', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7118', '周韦', '10004486', '1', '77120.75', '80000', '000', '2925198212214655', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '32', '上海霞飞路419号', TO_DATE('2016-04-24 21:51:33', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7119', '熊永亥', '10004487', '1', '47325.70', '80000', '000', '2925196611145118', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '33', '上海霞飞路139号', TO_DATE('2016-04-24 21:51:33', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7120', '毛玲哺', '10004488', '2', '76154.31', '80000', '000', '2925196410123750', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '63', '上海霞飞路961号', TO_DATE('2016-04-24 21:51:34', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7121', '郤毡', '10004489', '1', '21668.70', '80000', '000', '2925196910239171', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '72', '上海霞飞路136号', TO_DATE('2016-04-24 21:51:34', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7122', '刘盔蛀', '10004490', '2', '17670.26', '80000', '000', '2925193410259780', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '78', '上海霞飞路353号', TO_DATE('2016-04-24 21:51:34', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7123', '黄寸瀑', '10004491', '2', '63855.96', '80000', '000', '2925200712274934', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '87', '上海霞飞路840号', TO_DATE('2016-04-24 21:51:34', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7124', '张场', '10004492', '2', '60127.20', '80000', '000', '2925195511161298', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '44', '上海霞飞路936号', TO_DATE('2016-04-24 21:51:34', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7125', '赵椅苑', '10004493', '2', '52678.95', '80000', '000', '2925195110256118', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '98', '上海霞飞路117号', TO_DATE('2016-04-24 21:51:34', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7126', '段冒厕', '10004494', '2', '71880.96', '80000', '000', '2925200810114070', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '68', '上海霞飞路546号', TO_DATE('2016-04-24 21:51:34', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7127', '赵渡', '10004495', '2', '69179.71', '80000', '000', '2925198910155248', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '54', '上海霞飞路745号', TO_DATE('2016-04-24 21:51:34', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7128', '刘眯', '10004496', '2', '67959.58', '80000', '000', '2925198512273646', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '97', '上海霞飞路989号', TO_DATE('2016-04-24 21:51:34', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7129', '周即扒', '10004497', '1', '63890.48', '80000', '000', '2925196811146350', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '72', '上海霞飞路539号', TO_DATE('2016-04-24 21:51:34', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7130', '郤丙福', '10004498', '2', '71426.35', '80000', '000', '2925196210214378', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '45', '上海霞飞路742号', TO_DATE('2016-04-24 21:51:34', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7131', '张番降', '10004499', '1', '55027.80', '80000', '000', '2925193812218906', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '95', '上海霞飞路482号', TO_DATE('2016-04-24 21:51:34', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7132', '黄据', '10004500', '1', '44204.49', '80000', '000', '2925201411109304', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '90', '上海霞飞路314号', TO_DATE('2016-04-24 21:51:35', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7133', '段苹', '10004501', '2', '68796.64', '80000', '000', '2925198110202085', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '92', '上海霞飞路7号', TO_DATE('2016-04-24 21:51:35', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7134', '赵态', '10004502', '1', '32761.90', '80000', '000', '2925197810203551', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '79', '上海霞飞路17号', TO_DATE('2016-04-24 21:51:35', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7135', '熊显挟', '10004503', '2', '13448.74', '80000', '000', '2925197810123527', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '95', '上海霞飞路733号', TO_DATE('2016-04-24 21:51:35', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7136', '熊蝇辫', '10004504', '2', '26581.81', '80000', '000', '2925200110258141', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '53', '上海霞飞路78号', TO_DATE('2016-04-24 21:51:35', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7137', '黄顿', '10004505', '2', '67242.47', '80000', '000', '2925193012278228', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '25', '上海霞飞路274号', TO_DATE('2016-04-24 21:51:35', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7138', '段益', '10004506', '1', '7777.89', '80000', '000', '2925195310303384', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '38', '上海霞飞路334号', TO_DATE('2016-04-24 21:51:35', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7139', '毛罢炔', '10004507', '2', '32958.62', '80000', '000', '2925201511213278', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '37', '上海霞飞路924号', TO_DATE('2016-04-24 21:51:35', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7140', '熊胚', '10004508', '1', '22791.11', '80000', '000', '2925200412189221', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '96', '上海霞飞路959号', TO_DATE('2016-04-24 21:51:35', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7141', '李甚', '10004509', '2', '52109.67', '80000', '000', '2925198211258486', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '38', '上海霞飞路355号', TO_DATE('2016-04-24 21:51:35', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7142', '段蹦', '10004510', '2', '51535.25', '80000', '000', '2925192911309213', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '55', '上海霞飞路941号', TO_DATE('2016-04-24 21:51:35', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7143', '郤晌', '10004511', '1', '58507.72', '80000', '000', '2925197811206189', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '94', '上海霞飞路616号', TO_DATE('2016-04-24 21:51:35', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7144', '刘循', '10004512', '2', '59910.18', '80000', '000', '2925196712261036', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '26', '上海霞飞路274号', TO_DATE('2016-04-24 21:51:35', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7145', '刘徒埔', '10004513', '2', '31317.20', '80000', '000', '2925198211153738', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '64', '上海霞飞路79号', TO_DATE('2016-04-24 21:51:36', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7146', '熊恿', '10004514', '2', '48069.70', '80000', '000', '2925198110118660', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '25', '上海霞飞路86号', TO_DATE('2016-04-24 21:51:36', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7147', '刘吕迟', '10004515', '2', '18267.62', '80000', '000', '2925198511256473', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '52', '上海霞飞路110号', TO_DATE('2016-04-24 21:51:36', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7148', '毛设莆', '10004516', '2', '73350.19', '80000', '000', '2925199012191625', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '96', '上海霞飞路162号', TO_DATE('2016-04-24 21:51:36', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7149', '赵拍挫', '10004517', '1', '28145.97', '80000', '000', '2925194711285185', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '75', '上海霞飞路613号', TO_DATE('2016-04-24 21:51:36', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7150', '李桶', '10004518', '2', '23256.20', '80000', '000', '2925200410132016', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '36', '上海霞飞路572号', TO_DATE('2016-04-24 21:51:36', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7151', '段浆', '10004519', '1', '58241.17', '80000', '000', '2925201111233369', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '76', '上海霞飞路751号', TO_DATE('2016-04-24 21:51:36', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7152', '黄诊', '10004520', '2', '42391.65', '80000', '000', '2925200010135106', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '57', '上海霞飞路382号', TO_DATE('2016-04-24 21:51:36', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7153', '张梢精', '10004521', '2', '22878.11', '80000', '000', '2925194512163766', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '30', '上海霞飞路437号', TO_DATE('2016-04-24 21:51:36', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7154', '熊栓盂', '10004522', '2', '19757.52', '80000', '000', '2925201511197768', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '78', '上海霞飞路648号', TO_DATE('2016-04-24 21:51:36', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7155', '张枉夫', '10004523', '1', '33688.13', '80000', '000', '2925196711222006', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '87', '上海霞飞路453号', TO_DATE('2016-04-24 21:51:36', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7156', '段肾咖', '10004524', '1', '39284.75', '80000', '000', '2925200310189082', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '76', '上海霞飞路171号', TO_DATE('2016-04-24 21:51:36', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7157', '赵隧', '10004525', '2', '20767.62', '80000', '000', '2925197412111342', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '51', '上海霞飞路271号', TO_DATE('2016-04-24 21:51:36', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7158', '周矫', '10004526', '1', '15032.23', '80000', '000', '2925196411292783', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '38', '上海霞飞路721号', TO_DATE('2016-04-24 21:51:36', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7159', '黄嘿焉', '10004527', '1', '70375.65', '80000', '000', '2925194211171786', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '65', '上海霞飞路914号', TO_DATE('2016-04-24 21:51:37', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7160', '黄驰陆', '10004528', '1', '6921.58', '80000', '000', '2925192611171455', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '43', '上海霞飞路691号', TO_DATE('2016-04-24 21:51:37', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7161', '周换没', '10004529', '1', '61315.76', '80000', '000', '2925199211209151', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '33', '上海霞飞路467号', TO_DATE('2016-04-24 21:51:37', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7162', '毛顾钮', '10004530', '2', '67421.82', '80000', '000', '2925197211128618', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '23', '上海霞飞路411号', TO_DATE('2016-04-24 21:51:37', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7163', '熊后', '10004531', '1', '12647.35', '80000', '000', '2925199812143787', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '24', '上海霞飞路50号', TO_DATE('2016-04-24 21:51:37', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7164', '周蛋孺', '10004532', '1', '42081.68', '80000', '000', '2925194110121125', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '93', '上海霞飞路561号', TO_DATE('2016-04-24 21:51:37', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7165', '李嫁惯', '10004533', '2', '57883.37', '80000', '000', '2925193812289036', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '51', '上海霞飞路360号', TO_DATE('2016-04-24 21:51:37', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7166', '赵秘', '10004534', '2', '61299.14', '80000', '000', '2925197711214491', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '81', '上海霞飞路431号', TO_DATE('2016-04-24 21:51:37', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7167', '黄魏癣', '10004535', '2', '15313.26', '80000', '000', '2925194511285684', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '23', '上海霞飞路129号', TO_DATE('2016-04-24 21:51:37', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7168', '郤命', '10004536', '1', '37241.50', '80000', '000', '2925200112204097', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '77', '上海霞飞路961号', TO_DATE('2016-04-24 21:51:37', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7169', '熊疫', '10004537', '2', '22609.21', '80000', '000', '2925200312167934', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '43', '上海霞飞路63号', TO_DATE('2016-04-24 21:51:37', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7170', '毛搁', '10004538', '2', '50295.50', '80000', '000', '2925199410224384', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '86', '上海霞飞路801号', TO_DATE('2016-04-24 21:51:37', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7171', '毛挟粉', '10004539', '2', '22356.39', '80000', '000', '2925198810196688', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '81', '上海霞飞路121号', TO_DATE('2016-04-24 21:51:38', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7172', '李冯', '10004540', '2', '49962.16', '80000', '000', '2925195912121466', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '97', '上海霞飞路834号', TO_DATE('2016-04-24 21:51:38', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7173', '郤又乓', '10004541', '2', '47658.54', '80000', '000', '2925194611261145', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '41', '上海霞飞路230号', TO_DATE('2016-04-24 21:51:38', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7174', '周橡臆', '10004542', '1', '51590.25', '80000', '000', '2925199012235797', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '74', '上海霞飞路897号', TO_DATE('2016-04-24 21:51:38', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7175', '熊萍', '10004543', '1', '19466.20', '80000', '000', '2925194110249013', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '56', '上海霞飞路743号', TO_DATE('2016-04-24 21:51:38', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7176', '李望音', '10004544', '2', '30838.16', '80000', '000', '2925193511221808', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '70', '上海霞飞路653号', TO_DATE('2016-04-24 21:51:38', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7177', '张蜂氰', '10004545', '1', '79785.40', '80000', '000', '2925198312251859', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '85', '上海霞飞路277号', TO_DATE('2016-04-24 21:51:38', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7178', '李粮吧', '10004546', '1', '68279.67', '80000', '000', '2925197511293650', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '99', '上海霞飞路827号', TO_DATE('2016-04-24 21:51:38', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7179', '熊恃糕', '10004547', '2', '61389.58', '80000', '000', '2925197611272351', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '83', '上海霞飞路722号', TO_DATE('2016-04-24 21:51:38', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7180', '熊翔', '10004548', '1', '57027.36', '80000', '000', '2925194210268463', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '97', '上海霞飞路283号', TO_DATE('2016-04-24 21:51:38', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7181', '毛胺', '10004549', '2', '43220.15', '80000', '000', '2925196611106463', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '31', '上海霞飞路554号', TO_DATE('2016-04-24 21:51:38', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7182', '赵筛', '10004550', '2', '6806.97', '80000', '000', '2925199511251818', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '45', '上海霞飞路641号', TO_DATE('2016-04-24 21:51:38', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7183', '张迟', '10004551', '2', '37094.80', '80000', '000', '2925192411237873', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '65', '上海霞飞路757号', TO_DATE('2016-04-24 21:51:38', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7184', '刘潮', '10004552', '1', '72338.90', '80000', '000', '2925194412241213', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '49', '上海霞飞路416号', TO_DATE('2016-04-24 21:51:39', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7185', '张茫斩', '10004553', '1', '51875.71', '80000', '000', '2925194110198115', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '32', '上海霞飞路972号', TO_DATE('2016-04-24 21:51:39', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7186', '段邦', '10004554', '1', '44467.70', '80000', '000', '2925197511288821', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '22', '上海霞飞路875号', TO_DATE('2016-04-24 21:51:39', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7187', '周磕', '10004555', '2', '23769.99', '80000', '000', '2925194410236251', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '65', '上海霞飞路692号', TO_DATE('2016-04-24 21:51:39', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7188', '毛俱榨', '10004556', '1', '58902.44', '80000', '000', '2925194311257845', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '98', '上海霞飞路96号', TO_DATE('2016-04-24 21:51:39', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7189', '段舵', '10004557', '2', '7870.17', '80000', '000', '2925195112169081', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '83', '上海霞飞路600号', TO_DATE('2016-04-24 21:51:39', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7190', '周稳', '10004558', '1', '77989.51', '80000', '000', '2925192510114159', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '66', '上海霞飞路924号', TO_DATE('2016-04-24 21:51:39', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7191', '郤迅恐', '10004559', '2', '8630.59', '80000', '000', '2925201510116194', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '70', '上海霞飞路397号', TO_DATE('2016-04-24 21:51:39', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7192', '郤普辊', '10004560', '1', '11404.23', '80000', '000', '2925201412219129', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '70', '上海霞飞路817号', TO_DATE('2016-04-24 21:51:39', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7193', '毛周', '10004561', '2', '29378.92', '80000', '000', '2925197711259348', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '84', '上海霞飞路700号', TO_DATE('2016-04-24 21:51:39', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7194', '周盖', '10004562', '2', '66168.60', '80000', '000', '2925199712115778', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '89', '上海霞飞路753号', TO_DATE('2016-04-24 21:51:39', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7195', '黄诈', '10004563', '1', '51553.24', '80000', '000', '2925193712216007', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '81', '上海霞飞路853号', TO_DATE('2016-04-24 21:51:39', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7196', '李黄', '10004564', '2', '46886.66', '80000', '000', '2925198811175670', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '65', '上海霞飞路715号', TO_DATE('2016-04-24 21:51:39', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7197', '赵缕馁', '10004565', '1', '42793.25', '80000', '000', '2925198611223007', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '24', '上海霞飞路740号', TO_DATE('2016-04-24 21:51:40', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7198', '李疯富', '10004566', '1', '45593.91', '80000', '000', '2925196210149199', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '38', '上海霞飞路427号', TO_DATE('2016-04-24 21:51:40', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7199', '刘腻乎', '10004567', '2', '37525.75', '80000', '000', '2925197611275673', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '70', '上海霞飞路946号', TO_DATE('2016-04-24 21:51:40', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7200', '毛妨铱', '10004568', '1', '21130.56', '80000', '000', '2925195110128163', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '63', '上海霞飞路328号', TO_DATE('2016-04-24 21:51:40', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7201', '李哨', '10004569', '2', '56215.46', '80000', '000', '2925201511114898', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '34', '上海霞飞路846号', TO_DATE('2016-04-24 21:51:40', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7202', '黄猾', '10004570', '2', '78426.22', '80000', '000', '2925196211199779', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '62', '上海霞飞路989号', TO_DATE('2016-04-24 21:51:40', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7203', '李塘竭', '10004571', '2', '17915.49', '80000', '000', '2925201111151946', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '22', '上海霞飞路469号', TO_DATE('2016-04-24 21:51:40', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7204', '张翱桔', '10004572', '1', '20596.90', '80000', '000', '2925199411229548', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '66', '上海霞飞路449号', TO_DATE('2016-04-24 21:51:40', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7205', '李锈鞠', '10004573', '2', '41261.45', '80000', '000', '2925198511174037', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '71', '上海霞飞路222号', TO_DATE('2016-04-24 21:51:40', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7206', '赵阁', '10004574', '2', '21257.30', '80000', '000', '2925201110234619', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '62', '上海霞飞路163号', TO_DATE('2016-04-24 21:51:40', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7207', '赵洪', '10004575', '1', '67571.78', '80000', '000', '2925198611276967', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '79', '上海霞飞路823号', TO_DATE('2016-04-24 21:51:40', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7208', '赵臃畔', '10004576', '1', '64943.37', '80000', '000', '2925193410276548', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '31', '上海霞飞路556号', TO_DATE('2016-04-24 21:51:41', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7209', '周力柠', '10004577', '2', '52189.83', '80000', '000', '2925193711251300', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '32', '上海霞飞路20号', TO_DATE('2016-04-24 21:51:41', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7210', '周轿', '10004578', '2', '40038.70', '80000', '000', '2925201312215619', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '72', '上海霞飞路379号', TO_DATE('2016-04-24 21:51:41', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7211', '李镁用', '10004579', '1', '64727.79', '80000', '000', '2925192611214908', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '41', '上海霞飞路940号', TO_DATE('2016-04-24 21:51:41', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7212', '赵烙', '10004580', '2', '19114.30', '80000', '000', '2925199612203111', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '29', '上海霞飞路327号', TO_DATE('2016-04-24 21:51:41', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7213', '段校肃', '10004581', '2', '27349.44', '80000', '000', '2925198511199885', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '90', '上海霞飞路174号', TO_DATE('2016-04-24 21:51:41', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7214', '黄坡业', '10004582', '2', '58073.37', '80000', '000', '2925195910115178', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '21', '上海霞飞路653号', TO_DATE('2016-04-24 21:51:41', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7215', '段男', '10004583', '2', '22743.41', '80000', '000', '2925200710154120', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '27', '上海霞飞路901号', TO_DATE('2016-04-24 21:51:41', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7216', '赵圃仟', '10004584', '2', '47994.47', '80000', '000', '2925194210259240', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '18', '上海霞飞路730号', TO_DATE('2016-04-24 21:51:41', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7217', '赵允', '10004585', '2', '49947.42', '80000', '000', '2925193911245040', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '54', '上海霞飞路688号', TO_DATE('2016-04-24 21:51:41', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7218', '张保', '10004586', '1', '24085.80', '80000', '000', '2925197111137033', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '81', '上海霞飞路775号', TO_DATE('2016-04-24 21:51:41', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7219', '赵荚', '10004587', '1', '48650.59', '80000', '000', '2925200311189315', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '89', '上海霞飞路762号', TO_DATE('2016-04-24 21:51:42', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7220', '周篙', '10004588', '2', '22634.24', '80000', '000', '2925192611143725', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '93', '上海霞飞路208号', TO_DATE('2016-04-24 21:51:42', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7221', '周樱', '10004589', '1', '69139.76', '80000', '000', '2925198010307557', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '20', '上海霞飞路878号', TO_DATE('2016-04-24 21:51:42', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7222', '刘腺寥', '10004590', '1', '75359.18', '80000', '000', '2925195511109749', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '73', '上海霞飞路348号', TO_DATE('2016-04-24 21:51:42', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7223', '李踏', '10004591', '2', '39531.72', '80000', '000', '2925193812258258', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '84', '上海霞飞路95号', TO_DATE('2016-04-24 21:51:42', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7224', '段念沁', '10004592', '2', '61055.59', '80000', '000', '2925197710139259', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '22', '上海霞飞路431号', TO_DATE('2016-04-24 21:51:42', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7225', '周文盲', '10004593', '2', '6436.38', '80000', '000', '2925195011298546', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '51', '上海霞飞路75号', TO_DATE('2016-04-24 21:51:42', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7226', '段颐屑', '10004594', '1', '40943.62', '80000', '000', '2925196211271351', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '23', '上海霞飞路142号', TO_DATE('2016-04-24 21:51:42', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7227', '毛每仕', '10004595', '2', '41711.49', '80000', '000', '2925200512244482', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '48', '上海霞飞路724号', TO_DATE('2016-04-24 21:51:42', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7228', '赵舶', '10004596', '2', '20608.50', '80000', '000', '2925198311265461', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '77', '上海霞飞路141号', TO_DATE('2016-04-24 21:51:42', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7229', '郤狼愈', '10004597', '1', '62434.52', '80000', '000', '2925198211119968', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '74', '上海霞飞路282号', TO_DATE('2016-04-24 21:51:42', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7230', '黄板', '10004598', '2', '23932.13', '80000', '000', '2925195911295597', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '28', '上海霞飞路296号', TO_DATE('2016-04-24 21:51:42', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7231', '熊铡', '10004599', '2', '51772.63', '80000', '000', '2925198810211522', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '24', '上海霞飞路182号', TO_DATE('2016-04-24 21:51:43', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7232', '张笺封', '10004600', '2', '50920.20', '80000', '000', '2925201311108283', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '87', '上海霞飞路576号', TO_DATE('2016-04-24 21:51:43', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7233', '毛弄占', '10004601', '1', '76864.91', '80000', '000', '2925193712235443', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '38', '上海霞飞路292号', TO_DATE('2016-04-24 21:51:43', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7234', '赵提', '10004602', '2', '27812.70', '80000', '000', '2925193111204404', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '44', '上海霞飞路841号', TO_DATE('2016-04-24 21:51:43', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7235', '赵瓤胖', '10004603', '1', '36389.35', '80000', '000', '2925194511246170', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '48', '上海霞飞路360号', TO_DATE('2016-04-24 21:51:43', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7236', '熊斯台', '10004604', '2', '24394.75', '80000', '000', '2925198710125316', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '32', '上海霞飞路972号', TO_DATE('2016-04-24 21:51:43', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7237', '黄娜', '10004605', '1', '50960.15', '80000', '000', '2925199411244825', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '51', '上海霞飞路760号', TO_DATE('2016-04-24 21:51:43', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7238', '段铀', '10004606', '1', '69880.23', '80000', '000', '2925197111171908', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '47', '上海霞飞路64号', TO_DATE('2016-04-24 21:51:43', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7239', '熊矽', '10004607', '2', '59985.51', '80000', '000', '2925192111211251', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '89', '上海霞飞路879号', TO_DATE('2016-04-24 21:51:43', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7240', '周焰', '10004608', '2', '27296.57', '80000', '000', '2925198110223491', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '88', '上海霞飞路654号', TO_DATE('2016-04-24 21:51:43', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7241', '张婉', '10004609', '1', '19155.75', '80000', '000', '2925194510118048', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '31', '上海霞飞路734号', TO_DATE('2016-04-24 21:51:44', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7242', '段川驳', '10004610', '1', '78734.72', '80000', '000', '2925193110119679', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '32', '上海霞飞路190号', TO_DATE('2016-04-24 21:51:44', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7243', '熊钥拧', '10004611', '1', '39203.52', '80000', '000', '2925196812149407', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '66', '上海霞飞路655号', TO_DATE('2016-04-24 21:51:44', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7244', '黄荣', '10004612', '1', '24399.21', '80000', '000', '2925197912264673', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '82', '上海霞飞路203号', TO_DATE('2016-04-24 21:51:44', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7245', '赵费眺', '10004613', '1', '47082.57', '80000', '000', '2925192911164743', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '75', '上海霞飞路137号', TO_DATE('2016-04-24 21:51:44', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7246', '周刊', '10004614', '1', '56830.60', '80000', '000', '2925201212152573', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '60', '上海霞飞路911号', TO_DATE('2016-04-24 21:51:44', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7247', '刘诽祸', '10004615', '2', '49206.90', '80000', '000', '2925195411139423', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '61', '上海霞飞路177号', TO_DATE('2016-04-24 21:51:44', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7248', '张拒貌', '10004616', '1', '66203.90', '80000', '000', '2925195812293652', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '36', '上海霞飞路207号', TO_DATE('2016-04-24 21:51:44', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7249', '李狭脆', '10004617', '2', '22914.83', '80000', '000', '2925197312164120', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '98', '上海霞飞路715号', TO_DATE('2016-04-24 21:51:44', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7250', '熊惹狱', '10004618', '1', '27113.70', '80000', '000', '2925196911252727', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '61', '上海霞飞路244号', TO_DATE('2016-04-24 21:51:44', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7251', '周潜瘤', '10004619', '2', '34790.43', '80000', '000', '2925197011246547', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '39', '上海霞飞路994号', TO_DATE('2016-04-24 21:51:44', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7252', '段砧文', '10004620', '1', '39728.57', '80000', '000', '2925200511304025', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '38', '上海霞飞路98号', TO_DATE('2016-04-24 21:51:44', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7253', '段平事', '10004621', '2', '19007.51', '80000', '000', '2925201411129624', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '30', '上海霞飞路940号', TO_DATE('2016-04-24 21:51:44', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7254', '赵礁', '10004622', '1', '22720.26', '80000', '000', '2925192212278211', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '94', '上海霞飞路209号', TO_DATE('2016-04-24 21:51:45', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7255', '赵眺糜', '10004623', '1', '73321.64', '80000', '000', '2925195412129345', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '85', '上海霞飞路906号', TO_DATE('2016-04-24 21:51:45', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7256', '黄锑', '10004624', '1', '35870.85', '80000', '000', '2925200511152474', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '63', '上海霞飞路563号', TO_DATE('2016-04-24 21:51:45', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7257', '段螺', '10004625', '1', '76880.33', '80000', '000', '2925196812225860', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '95', '上海霞飞路361号', TO_DATE('2016-04-24 21:51:45', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7258', '周蹭', '10004626', '1', '8742.62', '80000', '000', '2925196511164812', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '38', '上海霞飞路853号', TO_DATE('2016-04-24 21:51:45', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7259', '刘耪', '10004627', '1', '42493.33', '80000', '000', '2925200310287576', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '76', '上海霞飞路365号', TO_DATE('2016-04-24 21:51:45', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7260', '黄显肖', '10004628', '1', '38332.27', '80000', '000', '2925201311238941', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '92', '上海霞飞路46号', TO_DATE('2016-04-24 21:51:45', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7261', '郤脖', '10004629', '2', '44499.13', '80000', '000', '2925199212277282', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '93', '上海霞飞路925号', TO_DATE('2016-04-24 21:51:45', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7262', '毛讼', '10004630', '1', '69074.60', '80000', '000', '2925195912222462', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '62', '上海霞飞路106号', TO_DATE('2016-04-24 21:51:45', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7263', '周鉴', '10004631', '2', '61901.42', '80000', '000', '2925200110219579', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '29', '上海霞飞路574号', TO_DATE('2016-04-24 21:51:45', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7264', '毛她巢', '10004632', '1', '7128.46', '80000', '000', '2925193110268192', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '27', '上海霞飞路822号', TO_DATE('2016-04-24 21:51:45', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7265', '黄狠含', '10004633', '1', '20892.84', '80000', '000', '2925193911242160', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '80', '上海霞飞路746号', TO_DATE('2016-04-24 21:51:45', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7266', '黄阔佯', '10004634', '1', '7320.80', '80000', '000', '2925192912221822', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '35', '上海霞飞路953号', TO_DATE('2016-04-24 21:51:46', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7267', '赵醛清', '10004635', '2', '43443.34', '80000', '000', '2925194012188684', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '41', '上海霞飞路810号', TO_DATE('2016-04-24 21:51:46', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7268', '赵恬', '10004636', '1', '23651.86', '80000', '000', '2925195511222284', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '63', '上海霞飞路165号', TO_DATE('2016-04-24 21:51:46', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7269', '刘及', '10004637', '1', '39082.84', '80000', '000', '2925195812133311', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '45', '上海霞飞路834号', TO_DATE('2016-04-24 21:51:46', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7270', '刘比饱', '10004638', '2', '26773.20', '80000', '000', '2925198211143501', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '51', '上海霞飞路461号', TO_DATE('2016-04-24 21:51:46', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7271', '段予', '10004639', '2', '15533.26', '80000', '000', '2925192411169139', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '19', '上海霞飞路436号', TO_DATE('2016-04-24 21:51:46', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7272', '郤懂', '10004640', '1', '16314.10', '80000', '000', '2925194011243413', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '37', '上海霞飞路87号', TO_DATE('2016-04-24 21:51:46', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7273', '张爸浅', '10004641', '1', '60339.88', '80000', '000', '2925199611193101', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '90', '上海霞飞路285号', TO_DATE('2016-04-24 21:51:46', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7274', '赵掺', '10004642', '2', '10472.12', '80000', '000', '2925196911191422', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '50', '上海霞飞路114号', TO_DATE('2016-04-24 21:51:46', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7275', '段骄泪', '10004643', '2', '74143.75', '80000', '000', '2925192710268066', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '53', '上海霞飞路131号', TO_DATE('2016-04-24 21:51:46', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7276', '刘讲', '10004644', '1', '65762.73', '80000', '000', '2925192811228675', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '56', '上海霞飞路164号', TO_DATE('2016-04-24 21:51:46', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7277', '郤嫁讽', '10004645', '2', '20754.44', '80000', '000', '2925198112198215', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '90', '上海霞飞路415号', TO_DATE('2016-04-24 21:51:46', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7278', '毛滩', '10004646', '1', '28320.79', '80000', '000', '2925199911169831', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '65', '上海霞飞路2号', TO_DATE('2016-04-24 21:51:47', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7279', '郤掸驼', '10004647', '1', '71658.53', '80000', '000', '2925199710249921', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '91', '上海霞飞路824号', TO_DATE('2016-04-24 21:51:47', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7280', '郤倦翰', '10004648', '1', '68658.85', '80000', '000', '2925196712206206', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '96', '上海霞飞路946号', TO_DATE('2016-04-24 21:51:47', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7281', '张职', '10004649', '2', '41128.62', '80000', '000', '2925194211285701', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '28', '上海霞飞路371号', TO_DATE('2016-04-24 21:51:47', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7282', '李志深', '10004650', '1', '36277.43', '80000', '000', '2925194210232459', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '54', '上海霞飞路328号', TO_DATE('2016-04-24 21:51:47', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7283', '熊粮', '10004651', '1', '42556.57', '80000', '000', '2925200711265990', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '21', '上海霞飞路836号', TO_DATE('2016-04-24 21:51:47', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7284', '黄降叙', '10004652', '2', '55027.60', '80000', '000', '2925195012258220', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '72', '上海霞飞路447号', TO_DATE('2016-04-24 21:51:47', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7285', '郤捍', '10004653', '2', '23191.45', '80000', '000', '2925195212288779', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '49', '上海霞飞路679号', TO_DATE('2016-04-24 21:51:47', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7286', '毛橱', '10004654', '1', '62621.43', '80000', '000', '2925196911302311', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '33', '上海霞飞路753号', TO_DATE('2016-04-24 21:51:47', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7287', '黄蹲捧', '10004655', '1', '70904.31', '80000', '000', '2925196211134392', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '23', '上海霞飞路727号', TO_DATE('2016-04-24 21:51:47', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7288', '郤匹与', '10004656', '2', '12188.28', '80000', '000', '2925198911167450', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '92', '上海霞飞路212号', TO_DATE('2016-04-24 21:51:47', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7289', '赵醋诽', '10004657', '1', '75135.81', '80000', '000', '2925193012176919', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '51', '上海霞飞路266号', TO_DATE('2016-04-24 21:51:47', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7290', '刘晒店', '10004658', '2', '30283.70', '80000', '000', '2925198812172619', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '42', '上海霞飞路69号', TO_DATE('2016-04-24 21:51:48', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7291', '赵察嗓', '10004659', '1', '6681.28', '80000', '000', '2925194711237106', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '27', '上海霞飞路349号', TO_DATE('2016-04-24 21:51:48', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7292', '黄早', '10004660', '2', '66237.98', '80000', '000', '2925194710165469', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '51', '上海霞飞路476号', TO_DATE('2016-04-24 21:51:48', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7293', '段观女', '10004661', '1', '27463.68', '80000', '000', '2925200810254695', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '49', '上海霞飞路424号', TO_DATE('2016-04-24 21:51:48', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7294', '熊绅', '10004662', '1', '66249.39', '80000', '000', '2925192412282429', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '79', '上海霞飞路706号', TO_DATE('2016-04-24 21:51:48', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7295', '赵耿', '10004663', '2', '29916.75', '80000', '000', '2925195911221525', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '94', '上海霞飞路613号', TO_DATE('2016-04-24 21:51:48', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7296', '李惑蓬', '10004664', '2', '22120.23', '80000', '000', '2925198111119420', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '55', '上海霞飞路898号', TO_DATE('2016-04-24 21:51:48', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7297', '段扯', '10004665', '1', '74170.70', '80000', '000', '2925200812249898', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '85', '上海霞飞路243号', TO_DATE('2016-04-24 21:51:48', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7298', '刘庭', '10004666', '2', '77032.22', '80000', '000', '2925194410248330', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '35', '上海霞飞路575号', TO_DATE('2016-04-24 21:51:48', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7299', '周嫉辣', '10004667', '1', '27646.88', '80000', '000', '2925195411127009', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '66', '上海霞飞路454号', TO_DATE('2016-04-24 21:51:48', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7300', '张汾', '10004668', '1', '75259.90', '80000', '000', '2925196112131635', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '20', '上海霞飞路378号', TO_DATE('2016-04-24 21:51:48', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7301', '赵庶', '10004669', '1', '60234.17', '80000', '000', '2925195212252433', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '89', '上海霞飞路992号', TO_DATE('2016-04-24 21:51:48', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7302', '李饺灭', '10004670', '1', '33219.80', '80000', '000', '2925200711166840', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '84', '上海霞飞路737号', TO_DATE('2016-04-24 21:51:48', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7303', '李挥翘', '10004671', '1', '40696.81', '80000', '000', '2925197010209987', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '59', '上海霞飞路510号', TO_DATE('2016-04-24 21:51:49', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7304', '段惶', '10004672', '2', '67760.91', '80000', '000', '2925199211273638', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '28', '上海霞飞路457号', TO_DATE('2016-04-24 21:51:49', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7305', '黄壹万', '10004673', '2', '42434.32', '80000', '000', '2925197012165468', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '98', '上海霞飞路969号', TO_DATE('2016-04-24 21:51:49', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7306', '段刊', '10004674', '2', '38080.79', '80000', '000', '2925192211201919', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '95', '上海霞飞路406号', TO_DATE('2016-04-24 21:51:49', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7307', '张级', '10004675', '2', '41284.24', '80000', '000', '2925198711138049', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '57', '上海霞飞路3号', TO_DATE('2016-04-24 21:51:49', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7308', '李靖顷', '10004676', '1', '64184.30', '80000', '000', '2925200011195064', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '93', '上海霞飞路800号', TO_DATE('2016-04-24 21:51:49', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7309', '熊碱', '10004677', '2', '14480.16', '80000', '000', '2925201210172369', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '31', '上海霞飞路291号', TO_DATE('2016-04-24 21:51:49', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7310', '李博', '10004678', '1', '69259.95', '80000', '000', '2925197311225144', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '74', '上海霞飞路783号', TO_DATE('2016-04-24 21:51:49', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7311', '郤蝉认', '10004679', '2', '40434.90', '80000', '000', '2925195412245578', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '29', '上海霞飞路330号', TO_DATE('2016-04-24 21:51:49', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7312', '周耶', '10004680', '1', '63895.21', '80000', '000', '2925195411124955', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '37', '上海霞飞路261号', TO_DATE('2016-04-24 21:51:49', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7313', '段厢宇', '10004681', '2', '17476.52', '80000', '000', '2925199010259891', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '57', '上海霞飞路154号', TO_DATE('2016-04-24 21:51:49', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7314', '熊妖', '10004682', '1', '22521.90', '80000', '000', '2925196211181017', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '33', '上海霞飞路228号', TO_DATE('2016-04-24 21:51:49', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7315', '郤侥讥', '10004683', '1', '44223.53', '80000', '000', '2925194312191394', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '38', '上海霞飞路862号', TO_DATE('2016-04-24 21:51:49', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7316', '李优', '10004684', '1', '70972.56', '80000', '000', '2925200011237955', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '82', '上海霞飞路25号', TO_DATE('2016-04-24 21:51:50', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7317', '郤堕危', '10004685', '2', '6691.57', '80000', '000', '2925192611126153', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '29', '上海霞飞路49号', TO_DATE('2016-04-24 21:51:50', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7318', '毛摔', '10004686', '1', '20582.60', '80000', '000', '2925194912128917', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '70', '上海霞飞路256号', TO_DATE('2016-04-24 21:51:50', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7319', '毛及', '10004687', '2', '43839.60', '80000', '000', '2925199311158912', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '62', '上海霞飞路449号', TO_DATE('2016-04-24 21:51:50', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7320', '赵弥芭', '10004688', '2', '40695.26', '80000', '000', '2925199711106905', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '81', '上海霞飞路338号', TO_DATE('2016-04-24 21:51:50', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7321', '黄都', '10004689', '2', '29656.67', '80000', '000', '2925195311125866', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '85', '上海霞飞路430号', TO_DATE('2016-04-24 21:51:50', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7322', '周懒', '10004690', '2', '62003.20', '80000', '000', '2925199412163211', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '45', '上海霞飞路869号', TO_DATE('2016-04-24 21:51:50', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7323', '张扭赞', '10004691', '2', '76466.80', '80000', '000', '2925197311245337', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '49', '上海霞飞路126号', TO_DATE('2016-04-24 21:51:50', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7324', '周厉缺', '10004692', '2', '35599.66', '80000', '000', '2925201212151325', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '34', '上海霞飞路319号', TO_DATE('2016-04-24 21:51:50', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7325', '黄坚', '10004693', '1', '12583.52', '80000', '000', '2925194410238343', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '70', '上海霞飞路340号', TO_DATE('2016-04-24 21:51:50', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7326', '李逾鸿', '10004694', '1', '9155.26', '80000', '000', '2925197411261989', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '32', '上海霞飞路720号', TO_DATE('2016-04-24 21:51:50', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7327', '段次', '10004695', '1', '23980.42', '80000', '000', '2925200311193357', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '96', '上海霞飞路534号', TO_DATE('2016-04-24 21:51:50', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7328', '张撂知', '10004696', '1', '36104.26', '80000', '000', '2925192910172292', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '64', '上海霞飞路351号', TO_DATE('2016-04-24 21:51:51', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7329', '张柔', '10004697', '2', '6100.99', '80000', '000', '2925194511162773', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '46', '上海霞飞路499号', TO_DATE('2016-04-24 21:51:51', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7330', '赵万灶', '10004698', '2', '26255.27', '80000', '000', '2925201310234956', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '50', '上海霞飞路609号', TO_DATE('2016-04-24 21:51:51', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7331', '赵忌', '10004699', '1', '74478.41', '80000', '000', '2925194911176867', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '42', '上海霞飞路552号', TO_DATE('2016-04-24 21:51:51', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7332', '郤霓丛', '10004700', '1', '34705.20', '80000', '000', '2925192612251222', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '46', '上海霞飞路552号', TO_DATE('2016-04-24 21:51:51', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7333', '赵道', '10004701', '2', '39309.21', '80000', '000', '2925195211238267', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '28', '上海霞飞路343号', TO_DATE('2016-04-24 21:51:51', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7334', '熊骑', '10004702', '2', '24473.90', '80000', '000', '2925195210259973', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '68', '上海霞飞路809号', TO_DATE('2016-04-24 21:51:51', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7335', '毛态好', '10004703', '2', '33615.83', '80000', '000', '2925193211148219', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '79', '上海霞飞路618号', TO_DATE('2016-04-24 21:51:51', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7336', '李秉', '10004704', '1', '6742.55', '80000', '000', '2925197211226030', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '76', '上海霞飞路836号', TO_DATE('2016-04-24 21:51:51', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7337', '周净', '10004705', '2', '63162.42', '80000', '000', '2925201110269173', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '70', '上海霞飞路521号', TO_DATE('2016-04-24 21:51:51', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7338', '郤罕渔', '10004706', '2', '75107.33', '80000', '000', '2925199212234726', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '35', '上海霞飞路727号', TO_DATE('2016-04-24 21:51:51', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7339', '郤三街', '10004707', '2', '38768.50', '80000', '000', '2925192611234472', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '54', '上海霞飞路278号', TO_DATE('2016-04-24 21:51:51', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7340', '张袭缕', '10004708', '1', '16736.71', '80000', '000', '2925199111245201', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '26', '上海霞飞路48号', TO_DATE('2016-04-24 21:51:52', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7341', '刘元捧', '10004709', '1', '20162.10', '80000', '000', '2925195611126157', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '71', '上海霞飞路355号', TO_DATE('2016-04-24 21:51:52', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7342', '黄顾', '10004710', '1', '51831.40', '80000', '000', '2925200411181054', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '96', '上海霞飞路397号', TO_DATE('2016-04-24 21:51:52', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7343', '赵益蹈', '10004711', '1', '49024.74', '80000', '000', '2925198510241184', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '22', '上海霞飞路428号', TO_DATE('2016-04-24 21:51:52', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7344', '刘鸵务', '10004712', '2', '53297.94', '80000', '000', '2925200912108243', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '29', '上海霞飞路683号', TO_DATE('2016-04-24 21:51:52', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7345', '黄盔订', '10004713', '2', '77379.35', '80000', '000', '2925193712217560', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '99', '上海霞飞路749号', TO_DATE('2016-04-24 21:51:52', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7346', '毛渡隶', '10004714', '2', '19011.54', '80000', '000', '2925200910118416', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '95', '上海霞飞路300号', TO_DATE('2016-04-24 21:51:52', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7347', '黄蹋', '10004715', '2', '71974.35', '80000', '000', '2925194211298202', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '72', '上海霞飞路767号', TO_DATE('2016-04-24 21:51:52', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7348', '赵纷督', '10004716', '2', '73597.15', '80000', '000', '2925192011145041', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '37', '上海霞飞路694号', TO_DATE('2016-04-24 21:51:52', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7349', '段棚', '10004717', '1', '23790.81', '80000', '000', '2925192211281518', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '100', '上海霞飞路62号', TO_DATE('2016-04-24 21:51:52', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7350', '郤堂', '10004718', '2', '71093.14', '80000', '000', '2925199010185007', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '94', '上海霞飞路22号', TO_DATE('2016-04-24 21:51:52', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7351', '张苑堂', '10004719', '1', '54346.62', '80000', '000', '2925192412134996', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '86', '上海霞飞路962号', TO_DATE('2016-04-24 21:51:52', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7352', '周陶', '10004720', '2', '72423.25', '80000', '000', '2925198912181604', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '66', '上海霞飞路869号', TO_DATE('2016-04-24 21:51:52', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7353', '赵量烫', '10004721', '2', '14936.58', '80000', '000', '2925199911133355', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '42', '上海霞飞路427号', TO_DATE('2016-04-24 21:51:53', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7354', '周淌堰', '10004722', '1', '30060.29', '80000', '000', '2925192610211007', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '80', '上海霞飞路243号', TO_DATE('2016-04-24 21:51:53', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7355', '赵盛妨', '10004723', '2', '65445.75', '80000', '000', '2925195612295985', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '85', '上海霞飞路12号', TO_DATE('2016-04-24 21:51:53', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7356', '段瞥绑', '10004724', '2', '64791.26', '80000', '000', '2925193311161706', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '96', '上海霞飞路304号', TO_DATE('2016-04-24 21:51:53', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7357', '张哀', '10004725', '2', '37903.64', '80000', '000', '2925192211242750', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '30', '上海霞飞路45号', TO_DATE('2016-04-24 21:51:53', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7358', '段厨', '10004726', '1', '73963.16', '80000', '000', '2925200711199488', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '48', '上海霞飞路554号', TO_DATE('2016-04-24 21:51:53', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7359', '熊仁', '10004727', '2', '70415.34', '80000', '000', '2925200810115403', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '24', '上海霞飞路320号', TO_DATE('2016-04-24 21:51:53', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7360', '黄炕鞋', '10004728', '1', '19137.13', '80000', '000', '2925197511181924', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '76', '上海霞飞路444号', TO_DATE('2016-04-24 21:51:53', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7361', '段阜于', '10004729', '2', '57620.57', '80000', '000', '2925194210144160', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '21', '上海霞飞路918号', TO_DATE('2016-04-24 21:51:53', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7362', '毛锻柴', '10004730', '2', '39515.67', '80000', '000', '2925194111181460', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '83', '上海霞飞路611号', TO_DATE('2016-04-24 21:51:53', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7363', '郤倘', '10004731', '1', '70328.32', '80000', '000', '2925198212254181', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '73', '上海霞飞路982号', TO_DATE('2016-04-24 21:51:53', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7364', '周蚜蜕', '10004732', '2', '74072.97', '80000', '000', '2925200510154566', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '77', '上海霞飞路220号', TO_DATE('2016-04-24 21:51:53', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7365', '黄贯', '10004733', '2', '67480.51', '80000', '000', '2925192811253028', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '93', '上海霞飞路552号', TO_DATE('2016-04-24 21:51:53', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7366', '段瞬魂', '10004734', '2', '25762.77', '80000', '000', '2925195412202557', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '81', '上海霞飞路118号', TO_DATE('2016-04-24 21:51:53', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7367', '张沂', '10004735', '2', '54086.85', '80000', '000', '2925195612206337', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '42', '上海霞飞路773号', TO_DATE('2016-04-24 21:51:54', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7368', '黄悟', '10004736', '2', '39716.18', '80000', '000', '2925193911148001', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '58', '上海霞飞路759号', TO_DATE('2016-04-24 21:51:54', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7369', '黄事比', '10004737', '2', '7280.89', '80000', '000', '2925196612101253', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '68', '上海霞飞路107号', TO_DATE('2016-04-24 21:51:54', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7370', '周敲桅', '10004738', '2', '41822.30', '80000', '000', '2925193410142878', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '47', '上海霞飞路141号', TO_DATE('2016-04-24 21:51:54', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7371', '周酣', '10004739', '1', '21149.79', '80000', '000', '2925197711207401', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '97', '上海霞飞路338号', TO_DATE('2016-04-24 21:51:54', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7372', '刘碑', '10004740', '2', '70590.86', '80000', '000', '2925200610165871', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '33', '上海霞飞路178号', TO_DATE('2016-04-24 21:51:54', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7373', '张就买', '10004741', '2', '29481.47', '80000', '000', '2925200611193424', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '93', '上海霞飞路510号', TO_DATE('2016-04-24 21:51:54', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7374', '李沦拂', '10004742', '2', '67693.88', '80000', '000', '2925198411188460', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '29', '上海霞飞路261号', TO_DATE('2016-04-24 21:51:54', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7375', '张漳粉', '10004743', '2', '38078.80', '80000', '000', '2925193512246351', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '43', '上海霞飞路99号', TO_DATE('2016-04-24 21:51:54', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7376', '郤偏', '10004744', '2', '31092.21', '80000', '000', '2925194710138711', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '89', '上海霞飞路957号', TO_DATE('2016-04-24 21:51:54', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7377', '李拼举', '10004745', '2', '40789.96', '80000', '000', '2925194012247339', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '90', '上海霞飞路29号', TO_DATE('2016-04-24 21:51:54', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7378', '刘巾四', '10004746', '1', '47134.53', '80000', '000', '2925197311124911', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '52', '上海霞飞路50号', TO_DATE('2016-04-24 21:51:54', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7379', '周吧', '10004747', '1', '69902.59', '80000', '000', '2925193110289565', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '82', '上海霞飞路367号', TO_DATE('2016-04-24 21:51:54', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7380', '赵纫清', '10004748', '2', '32533.12', '80000', '000', '2925194812172459', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '65', '上海霞飞路407号', TO_DATE('2016-04-24 21:51:54', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7381', '毛腾', '10004749', '2', '36055.50', '80000', '000', '2925196811262279', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '77', '上海霞飞路789号', TO_DATE('2016-04-24 21:51:55', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7382', '黄己拧', '10004750', '2', '71615.35', '80000', '000', '2925192911178665', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '22', '上海霞飞路381号', TO_DATE('2016-04-24 21:51:55', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7383', '熊汁瘫', '10004751', '1', '67303.10', '80000', '000', '2925195610274308', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '33', '上海霞飞路154号', TO_DATE('2016-04-24 21:51:55', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7384', '熊靡粟', '10004752', '2', '32748.82', '80000', '000', '2925200410251351', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '73', '上海霞飞路700号', TO_DATE('2016-04-24 21:51:55', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7385', '毛建珊', '10004753', '2', '77497.20', '80000', '000', '2925196411306552', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '98', '上海霞飞路766号', TO_DATE('2016-04-24 21:51:55', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7386', '赵挥', '10004754', '1', '52335.77', '80000', '000', '2925199212273409', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '40', '上海霞飞路79号', TO_DATE('2016-04-24 21:51:55', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7387', '段箍础', '10004755', '2', '50624.56', '80000', '000', '2925198711225215', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '37', '上海霞飞路199号', TO_DATE('2016-04-24 21:51:55', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7388', '李樊', '10004756', '1', '15279.74', '80000', '000', '2925197910181729', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '26', '上海霞飞路998号', TO_DATE('2016-04-24 21:51:55', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7389', '赵票', '10004757', '1', '30246.75', '80000', '000', '2925199210114825', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '42', '上海霞飞路718号', TO_DATE('2016-04-24 21:51:55', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7390', '毛防鲸', '10004758', '2', '27316.40', '80000', '000', '2925198611299132', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '20', '上海霞飞路389号', TO_DATE('2016-04-24 21:51:55', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7391', '周膳渡', '10004759', '2', '79698.54', '80000', '000', '2925195212187317', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '58', '上海霞飞路700号', TO_DATE('2016-04-24 21:51:55', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7392', '周街', '10004760', '2', '45119.29', '80000', '000', '2925200111303227', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '78', '上海霞飞路156号', TO_DATE('2016-04-24 21:51:55', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7393', '熊舶', '10004761', '1', '53198.35', '80000', '000', '2925200712305697', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '50', '上海霞飞路586号', TO_DATE('2016-04-24 21:51:55', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7394', '黄朔叉', '10004762', '2', '30559.15', '80000', '000', '2925196412259330', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '61', '上海霞飞路790号', TO_DATE('2016-04-24 21:51:55', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7395', '李抽', '10004763', '2', '72490.40', '80000', '000', '2925192211273072', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '38', '上海霞飞路251号', TO_DATE('2016-04-24 21:51:55', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7396', '周螟啊', '10004764', '2', '16040.98', '80000', '000', '2925192211192860', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '83', '上海霞飞路505号', TO_DATE('2016-04-24 21:51:56', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7397', '赵牡宇', '10004765', '2', '32207.20', '80000', '000', '2925194312288066', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '75', '上海霞飞路847号', TO_DATE('2016-04-24 21:51:56', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7398', '郤因淘', '10004766', '2', '78282.60', '80000', '000', '2925200111181852', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '26', '上海霞飞路633号', TO_DATE('2016-04-24 21:51:56', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7399', '熊胁忻', '10004767', '1', '27567.29', '80000', '000', '2925198510154918', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '83', '上海霞飞路486号', TO_DATE('2016-04-24 21:51:56', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7400', '郤除', '10004768', '2', '14481.52', '80000', '000', '2925198611262504', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '43', '上海霞飞路229号', TO_DATE('2016-04-24 21:51:56', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7401', '周劈', '10004769', '1', '64580.76', '80000', '000', '2925194811246754', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '34', '上海霞飞路328号', TO_DATE('2016-04-24 21:51:56', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7402', '周铡剃', '10004770', '1', '13213.37', '80000', '000', '2925200711116891', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '46', '上海霞飞路113号', TO_DATE('2016-04-24 21:51:56', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7403', '郤赛趁', '10004771', '2', '21387.14', '80000', '000', '2925197111215852', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '76', '上海霞飞路933号', TO_DATE('2016-04-24 21:51:56', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7404', '刘血', '10004772', '1', '79009.50', '80000', '000', '2925198012287274', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '62', '上海霞飞路805号', TO_DATE('2016-04-24 21:51:56', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7405', '李遥', '10004773', '2', '33905.22', '80000', '000', '2925194711285899', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '94', '上海霞飞路966号', TO_DATE('2016-04-24 21:51:56', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7406', '段级民', '10004774', '2', '57970.26', '80000', '000', '2925192112109622', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '70', '上海霞飞路73号', TO_DATE('2016-04-24 21:51:56', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7407', '周盐烽', '10004775', '1', '17406.33', '80000', '000', '2925199310178520', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '53', '上海霞飞路572号', TO_DATE('2016-04-24 21:51:56', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7408', '郤礼油', '10004776', '1', '58353.47', '80000', '000', '2925197411291294', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '74', '上海霞飞路47号', TO_DATE('2016-04-24 21:51:56', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7409', '毛牧', '10004777', '2', '14192.31', '80000', '000', '2925192811288626', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '73', '上海霞飞路45号', TO_DATE('2016-04-24 21:51:56', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7410', '刘馁斡', '10004778', '1', '42497.88', '80000', '000', '2925193911203979', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '85', '上海霞飞路140号', TO_DATE('2016-04-24 21:51:57', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7411', '段绊', '10004779', '1', '42006.30', '80000', '000', '2925198011211331', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '89', '上海霞飞路600号', TO_DATE('2016-04-24 21:51:57', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7412', '周毒', '10004780', '2', '49006.10', '80000', '000', '2925193711214358', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '44', '上海霞飞路209号', TO_DATE('2016-04-24 21:51:57', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7413', '张食艳', '10004781', '1', '60334.80', '80000', '000', '2925194410245482', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '37', '上海霞飞路365号', TO_DATE('2016-04-24 21:51:57', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7414', '郤苔藐', '10004782', '1', '6580.30', '80000', '000', '2925197411277080', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '52', '上海霞飞路694号', TO_DATE('2016-04-24 21:51:57', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7415', '赵祥', '10004783', '2', '24243.96', '80000', '000', '2925194510263087', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '52', '上海霞飞路905号', TO_DATE('2016-04-24 21:51:57', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7416', '毛乡哨', '10004784', '2', '43395.66', '80000', '000', '2925197410266999', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '31', '上海霞飞路691号', TO_DATE('2016-04-24 21:51:57', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7417', '赵矫', '10004785', '2', '13898.29', '80000', '000', '2925196410182139', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '24', '上海霞飞路893号', TO_DATE('2016-04-24 21:51:57', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7418', '熊措当', '10004786', '2', '68427.24', '80000', '000', '2925200211143800', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '82', '上海霞飞路170号', TO_DATE('2016-04-24 21:51:57', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7419', '段呈', '10004787', '1', '76419.30', '80000', '000', '2925199211309644', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '90', '上海霞飞路749号', TO_DATE('2016-04-24 21:51:57', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7420', '毛吉', '10004788', '1', '9626.40', '80000', '000', '2925201411214432', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '76', '上海霞飞路814号', TO_DATE('2016-04-24 21:51:57', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7421', '熊鼻朝', '10004789', '1', '27220.25', '80000', '000', '2925193311129868', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '53', '上海霞飞路352号', TO_DATE('2016-04-24 21:51:57', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7422', '李彦咬', '10004790', '1', '40324.23', '80000', '000', '2925193510235981', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '19', '上海霞飞路186号', TO_DATE('2016-04-24 21:51:57', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7423', '周念', '10004791', '2', '68469.21', '80000', '000', '2925192511209074', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '83', '上海霞飞路151号', TO_DATE('2016-04-24 21:51:57', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7424', '刘哀', '10004792', '2', '69797.20', '80000', '000', '2925194212297908', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '24', '上海霞飞路182号', TO_DATE('2016-04-24 21:51:58', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7425', '段视', '10004793', '2', '66837.41', '80000', '000', '2925196312193288', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '77', '上海霞飞路275号', TO_DATE('2016-04-24 21:51:58', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7426', '毛峪', '10004794', '1', '12355.71', '80000', '000', '2925199112225790', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '74', '上海霞飞路10号', TO_DATE('2016-04-24 21:51:58', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7427', '张减', '10004795', '2', '13169.10', '80000', '000', '2925192212136862', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '78', '上海霞飞路480号', TO_DATE('2016-04-24 21:51:58', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7428', '段梯', '10004796', '2', '73881.83', '80000', '000', '2925192612131961', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '76', '上海霞飞路122号', TO_DATE('2016-04-24 21:51:58', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7429', '熊哪跑', '10004797', '1', '61229.16', '80000', '000', '2925195712282873', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '68', '上海霞飞路17号', TO_DATE('2016-04-24 21:51:58', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7430', '赵鉴尚', '10004798', '2', '17199.52', '80000', '000', '2925193011117727', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '45', '上海霞飞路855号', TO_DATE('2016-04-24 21:51:58', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7431', '李奉', '10004799', '1', '41172.45', '80000', '000', '2925195512112615', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '20', '上海霞飞路764号', TO_DATE('2016-04-24 21:51:58', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7432', '周个学', '10004800', '2', '12182.93', '80000', '000', '2925195510175036', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '45', '上海霞飞路712号', TO_DATE('2016-04-24 21:51:58', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7433', '郤尸锦', '10004801', '1', '63884.35', '80000', '000', '2925195710177739', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '38', '上海霞飞路221号', TO_DATE('2016-04-24 21:51:58', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7434', '周唁细', '10004802', '2', '70992.21', '80000', '000', '2925192712308766', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '88', '上海霞飞路513号', TO_DATE('2016-04-24 21:51:58', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7435', '李脑焰', '10004803', '1', '76851.32', '80000', '000', '2925200011183792', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '46', '上海霞飞路190号', TO_DATE('2016-04-24 21:51:58', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7436', '黄逃霓', '10004804', '1', '45355.31', '80000', '000', '2925196610264031', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '79', '上海霞飞路887号', TO_DATE('2016-04-24 21:51:58', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7437', '张娃渝', '10004805', '1', '24684.12', '80000', '000', '2925200710208198', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '28', '上海霞飞路244号', TO_DATE('2016-04-24 21:51:58', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7438', '李悲', '10004806', '2', '35261.84', '80000', '000', '2925193011143153', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '58', '上海霞飞路805号', TO_DATE('2016-04-24 21:51:58', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7439', '郤减陪', '10004807', '1', '65974.37', '80000', '000', '2925193210308956', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '83', '上海霞飞路322号', TO_DATE('2016-04-24 21:51:59', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7440', '黄锦毖', '10004808', '2', '41002.59', '80000', '000', '2925192610161216', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '95', '上海霞飞路129号', TO_DATE('2016-04-24 21:51:59', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7441', '刘弹跃', '10004809', '2', '20608.40', '80000', '000', '2925197911201578', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '34', '上海霞飞路36号', TO_DATE('2016-04-24 21:51:59', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7442', '李漏沉', '10004810', '1', '76929.38', '80000', '000', '2925199512267335', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '93', '上海霞飞路383号', TO_DATE('2016-04-24 21:51:59', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7443', '黄钡', '10004811', '1', '52194.30', '80000', '000', '2925192410191044', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '92', '上海霞飞路528号', TO_DATE('2016-04-24 21:51:59', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7444', '毛拜锨', '10004812', '1', '59840.56', '80000', '000', '2925193412237059', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '95', '上海霞飞路232号', TO_DATE('2016-04-24 21:51:59', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7445', '毛喜斗', '10004813', '2', '20763.68', '80000', '000', '2925196311306812', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '72', '上海霞飞路979号', TO_DATE('2016-04-24 21:51:59', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7446', '黄晒胯', '10004814', '1', '61391.16', '80000', '000', '2925194611121550', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '85', '上海霞飞路349号', TO_DATE('2016-04-24 21:51:59', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7447', '李兵钱', '10004815', '2', '65361.10', '80000', '000', '2925197310239148', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '99', '上海霞飞路101号', TO_DATE('2016-04-24 21:51:59', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7448', '熊恼', '10004816', '2', '52431.52', '80000', '000', '2925200811201443', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '99', '上海霞飞路666号', TO_DATE('2016-04-24 21:51:59', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7449', '黄临', '10004817', '1', '36727.50', '80000', '000', '2925195711191307', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '86', '上海霞飞路187号', TO_DATE('2016-04-24 21:51:59', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7450', '黄芭', '10004818', '2', '61657.20', '80000', '000', '2925193611278544', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '62', '上海霞飞路213号', TO_DATE('2016-04-24 21:51:59', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7451', '毛堰', '10004819', '1', '6652.93', '80000', '000', '2925192212249338', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '62', '上海霞飞路600号', TO_DATE('2016-04-24 21:51:59', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7452', '张号荤', '10004820', '2', '61491.30', '80000', '000', '2925197312142769', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '67', '上海霞飞路2号', TO_DATE('2016-04-24 21:51:59', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7453', '毛堕', '10004821', '1', '29216.22', '80000', '000', '2925192811189566', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '81', '上海霞飞路746号', TO_DATE('2016-04-24 21:52:00', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7454', '赵搂速', '10004822', '1', '22570.49', '80000', '000', '2925194411297950', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '43', '上海霞飞路683号', TO_DATE('2016-04-24 21:52:00', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7455', '段瘦肿', '10004823', '2', '11521.63', '80000', '000', '2925193311221978', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '94', '上海霞飞路896号', TO_DATE('2016-04-24 21:52:00', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7456', '毛诉', '10004824', '1', '78763.46', '80000', '000', '2925198511126468', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '79', '上海霞飞路933号', TO_DATE('2016-04-24 21:52:00', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7457', '熊榆', '10004825', '2', '52073.44', '80000', '000', '2925192810156096', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '28', '上海霞飞路440号', TO_DATE('2016-04-24 21:52:00', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7458', '毛岂', '10004826', '1', '23091.66', '80000', '000', '2925198111285793', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '51', '上海霞飞路784号', TO_DATE('2016-04-24 21:52:00', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7459', '赵井春', '10004827', '2', '69478.65', '80000', '000', '2925194811139075', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '29', '上海霞飞路418号', TO_DATE('2016-04-24 21:52:00', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7460', '段那', '10004828', '1', '37468.97', '80000', '000', '2925192711104399', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '21', '上海霞飞路375号', TO_DATE('2016-04-24 21:52:00', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7461', '张坯', '10004829', '2', '78573.78', '80000', '000', '2925192812186072', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '59', '上海霞飞路405号', TO_DATE('2016-04-24 21:52:00', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7462', '郤睫', '10004830', '1', '63653.14', '80000', '000', '2925199512122657', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '26', '上海霞飞路812号', TO_DATE('2016-04-24 21:52:00', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7463', '赵摘', '10004831', '2', '47673.50', '80000', '000', '2925197911215155', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '87', '上海霞飞路111号', TO_DATE('2016-04-24 21:52:00', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7464', '赵欠丁', '10004832', '1', '51312.35', '80000', '000', '2925200810208640', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '24', '上海霞飞路143号', TO_DATE('2016-04-24 21:52:00', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7465', '段脆', '10004833', '2', '65050.32', '80000', '000', '2925198011186282', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '31', '上海霞飞路257号', TO_DATE('2016-04-24 21:52:00', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7466', '段读馈', '10004834', '1', '7590.53', '80000', '000', '2925200710198982', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '48', '上海霞飞路614号', TO_DATE('2016-04-24 21:52:00', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7467', '周艰', '10004835', '2', '7316.85', '80000', '000', '2925194410182137', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '57', '上海霞飞路601号', TO_DATE('2016-04-24 21:52:01', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7468', '周隅标', '10004836', '2', '49084.15', '80000', '000', '2925194610113181', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '67', '上海霞飞路719号', TO_DATE('2016-04-24 21:52:01', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7469', '黄茂', '10004837', '2', '66849.24', '80000', '000', '2925201111295828', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '43', '上海霞飞路173号', TO_DATE('2016-04-24 21:52:01', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7470', '周涡', '10004838', '1', '9633.22', '80000', '000', '2925195511224021', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '49', '上海霞飞路713号', TO_DATE('2016-04-24 21:52:01', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7471', '黄拱刊', '10004839', '1', '35906.67', '80000', '000', '2925196712174750', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '72', '上海霞飞路72号', TO_DATE('2016-04-24 21:52:01', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7472', '周溉', '10004840', '1', '25803.73', '80000', '000', '2925193210268000', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '23', '上海霞飞路596号', TO_DATE('2016-04-24 21:52:01', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7473', '刘妒', '10004841', '1', '73588.31', '80000', '000', '2925193911193115', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '67', '上海霞飞路426号', TO_DATE('2016-04-24 21:52:01', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7474', '黄摇', '10004842', '1', '62477.58', '80000', '000', '2925194711114922', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '95', '上海霞飞路748号', TO_DATE('2016-04-24 21:52:01', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7475', '段宴碳', '10004843', '1', '76284.83', '80000', '000', '2925193110242954', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '68', '上海霞飞路333号', TO_DATE('2016-04-24 21:52:01', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7476', '毛铸', '10004844', '2', '59451.74', '80000', '000', '2925197811298049', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '90', '上海霞飞路703号', TO_DATE('2016-04-24 21:52:01', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7477', '郤弹影', '10004845', '1', '44755.54', '80000', '000', '2925199212179589', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '41', '上海霞飞路884号', TO_DATE('2016-04-24 21:52:02', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7478', '毛硫庇', '10004846', '1', '30420.41', '80000', '000', '2925194311267475', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '55', '上海霞飞路761号', TO_DATE('2016-04-24 21:52:02', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7479', '李颇么', '10004847', '1', '11509.72', '80000', '000', '2925197212225883', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '96', '上海霞飞路615号', TO_DATE('2016-04-24 21:52:02', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7480', '段养', '10004848', '1', '56270.28', '80000', '000', '2925200912113620', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '99', '上海霞飞路417号', TO_DATE('2016-04-24 21:52:02', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7481', '刘畦蒲', '10004849', '1', '34608.60', '80000', '000', '2925193212193762', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '62', '上海霞飞路958号', TO_DATE('2016-04-24 21:52:02', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7482', '赵骋', '10004850', '1', '59066.95', '80000', '000', '2925194212159988', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '20', '上海霞飞路807号', TO_DATE('2016-04-24 21:52:02', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7483', '黄洗', '10004851', '2', '42553.31', '80000', '000', '2925194112204816', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '56', '上海霞飞路557号', TO_DATE('2016-04-24 21:52:02', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7484', '郤瞬岳', '10004852', '2', '75628.60', '80000', '000', '2925195210256612', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '42', '上海霞飞路653号', TO_DATE('2016-04-24 21:52:02', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7485', '熊回', '10004853', '1', '73410.43', '80000', '000', '2925198511229992', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '61', '上海霞飞路510号', TO_DATE('2016-04-24 21:52:02', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7486', '刘阵坷', '10004854', '2', '66108.98', '80000', '000', '2925197611207814', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '21', '上海霞飞路400号', TO_DATE('2016-04-24 21:52:02', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7487', '段烁', '10004855', '1', '63810.24', '80000', '000', '2925199412274655', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '34', '上海霞飞路907号', TO_DATE('2016-04-24 21:52:02', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7488', '段渤疏', '10004856', '2', '13457.59', '80000', '000', '2925199112195198', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '46', '上海霞飞路536号', TO_DATE('2016-04-24 21:52:02', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7489', '毛堆柯', '10004857', '1', '63976.65', '80000', '000', '2925193111149549', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '61', '上海霞飞路224号', TO_DATE('2016-04-24 21:52:02', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7490', '毛倒', '10004858', '2', '52176.58', '80000', '000', '2925194612198024', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '87', '上海霞飞路286号', TO_DATE('2016-04-24 21:52:02', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7491', '刘动', '10004859', '1', '71436.41', '80000', '000', '2925196812162435', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '73', '上海霞飞路433号', TO_DATE('2016-04-24 21:52:03', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7492', '郤婪', '10004860', '1', '13264.63', '80000', '000', '2925197911239370', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '86', '上海霞飞路159号', TO_DATE('2016-04-24 21:52:03', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7493', '赵卑', '10004861', '2', '26545.19', '80000', '000', '2925199610303432', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '88', '上海霞飞路919号', TO_DATE('2016-04-24 21:52:03', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7494', '郤幸礼', '10004862', '2', '10750', '80000', '000', '2925192410295722', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '92', '上海霞飞路59号', TO_DATE('2016-04-24 21:52:03', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7495', '刘译', '10004863', '1', '13502.50', '80000', '000', '2925196911117340', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '40', '上海霞飞路527号', TO_DATE('2016-04-24 21:52:03', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7496', '熊家', '10004864', '1', '13708.32', '80000', '000', '2925195710271903', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '48', '上海霞飞路919号', TO_DATE('2016-04-24 21:52:03', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7497', '周丹巨', '10004865', '1', '62967.63', '80000', '000', '2925198410276468', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '91', '上海霞飞路342号', TO_DATE('2016-04-24 21:52:03', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7498', '毛浪', '10004866', '1', '66157.80', '80000', '000', '2925192612247501', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '30', '上海霞飞路94号', TO_DATE('2016-04-24 21:52:03', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7499', '周迸', '10004867', '2', '6969.30', '80000', '000', '2925194510217753', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '80', '上海霞飞路39号', TO_DATE('2016-04-24 21:52:03', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7500', '熊豁楔', '10004868', '1', '23748.55', '80000', '000', '2925192112166183', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '25', '上海霞飞路937号', TO_DATE('2016-04-24 21:52:03', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7501', '郤萌', '10004869', '2', '77216.81', '80000', '000', '2925194011234182', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '82', '上海霞飞路892号', TO_DATE('2016-04-24 21:52:03', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7502', '赵富寸', '10004870', '1', '62624.86', '80000', '000', '2925195411187553', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '73', '上海霞飞路328号', TO_DATE('2016-04-24 21:52:03', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7503', '刘么滨', '10004871', '1', '70485.37', '80000', '000', '2925199312286815', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '31', '上海霞飞路790号', TO_DATE('2016-04-24 21:52:03', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7504', '段菲场', '10004872', '1', '52366.45', '80000', '000', '2925194311205463', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '65', '上海霞飞路60号', TO_DATE('2016-04-24 21:52:04', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7505', '郤爱', '10004873', '1', '29220.18', '80000', '000', '2925199511122922', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '44', '上海霞飞路823号', TO_DATE('2016-04-24 21:52:04', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7506', '刘谩', '10004874', '2', '47412.82', '80000', '000', '2925198810231917', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '75', '上海霞飞路356号', TO_DATE('2016-04-24 21:52:04', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7507', '张储', '10004875', '2', '75999.30', '80000', '000', '2925193411275008', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '57', '上海霞飞路321号', TO_DATE('2016-04-24 21:52:04', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7508', '李倘豆', '10004876', '2', '25854.75', '80000', '000', '2925192211125985', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '61', '上海霞飞路938号', TO_DATE('2016-04-24 21:52:04', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7509', '黄聪', '10004877', '1', '19011.32', '80000', '000', '2925194610306772', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '64', '上海霞飞路390号', TO_DATE('2016-04-24 21:52:04', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7510', '张挖欣', '10004878', '1', '57011.10', '80000', '000', '2925196010279367', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '94', '上海霞飞路378号', TO_DATE('2016-04-24 21:52:04', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7511', '黄悦象', '10004879', '2', '30197.47', '80000', '000', '2925200312296254', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '100', '上海霞飞路324号', TO_DATE('2016-04-24 21:52:04', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7512', '刘馋慈', '10004880', '1', '25674.88', '80000', '000', '2925196511115514', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '80', '上海霞飞路702号', TO_DATE('2016-04-24 21:52:04', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7513', '张梭诞', '10004881', '2', '16198.34', '80000', '000', '2925200312126721', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '64', '上海霞飞路457号', TO_DATE('2016-04-24 21:52:04', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7514', '熊盖募', '10004882', '1', '57416.44', '80000', '000', '2925196112114458', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '99', '上海霞飞路457号', TO_DATE('2016-04-24 21:52:04', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7515', '郤冲', '10004883', '1', '56762.44', '80000', '000', '2925195611197041', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '50', '上海霞飞路299号', TO_DATE('2016-04-24 21:52:04', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7516', '段悬', '10004884', '2', '69888.59', '80000', '000', '2925193012276758', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '19', '上海霞飞路699号', TO_DATE('2016-04-24 21:52:04', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7517', '张冶', '10004885', '1', '11758.37', '80000', '000', '2925194211214609', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '81', '上海霞飞路64号', TO_DATE('2016-04-24 21:52:04', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7518', '段坊', '10004886', '1', '75462.29', '80000', '000', '2925196111271203', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '60', '上海霞飞路630号', TO_DATE('2016-04-24 21:52:05', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7519', '张歹', '10004887', '1', '42446.60', '80000', '000', '2925195311249059', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '42', '上海霞飞路902号', TO_DATE('2016-04-24 21:52:05', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7520', '熊皇', '10004888', '1', '67161.26', '80000', '000', '2925197612298186', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '22', '上海霞飞路832号', TO_DATE('2016-04-24 21:52:05', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7521', '黄驭', '10004889', '2', '37148.86', '80000', '000', '2925200810114337', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '69', '上海霞飞路449号', TO_DATE('2016-04-24 21:52:05', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7522', '郤岁', '10004890', '1', '40239.34', '80000', '000', '2925194811133900', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '30', '上海霞飞路335号', TO_DATE('2016-04-24 21:52:05', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7523', '周情秆', '10004891', '1', '19972.73', '80000', '000', '2925195011115862', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '84', '上海霞飞路515号', TO_DATE('2016-04-24 21:52:05', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7524', '刘诵靴', '10004892', '1', '54332.74', '80000', '000', '2925199212233743', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '65', '上海霞飞路961号', TO_DATE('2016-04-24 21:52:05', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7525', '毛霍', '10004893', '1', '13737.12', '80000', '000', '2925192011121853', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '89', '上海霞飞路24号', TO_DATE('2016-04-24 21:52:05', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7526', '熊狱', '10004894', '1', '37571.38', '80000', '000', '2925195710279609', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '32', '上海霞飞路678号', TO_DATE('2016-04-24 21:52:05', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7527', '黄更扳', '10004895', '2', '66747.39', '80000', '000', '2925192410252049', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '50', '上海霞飞路513号', TO_DATE('2016-04-24 21:52:05', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7528', '李逞靠', '10004896', '2', '14551.98', '80000', '000', '2925193712254951', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '49', '上海霞飞路908号', TO_DATE('2016-04-24 21:52:05', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7529', '张妒', '10004897', '2', '61559.58', '80000', '000', '2925192312235399', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '96', '上海霞飞路815号', TO_DATE('2016-04-24 21:52:05', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7530', '张挫', '10004898', '1', '52567.63', '80000', '000', '2925195712233765', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '34', '上海霞飞路31号', TO_DATE('2016-04-24 21:52:05', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7531', '张市', '10004899', '2', '52402.88', '80000', '000', '2925193411236458', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '84', '上海霞飞路739号', TO_DATE('2016-04-24 21:52:06', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7532', '李精', '10004900', '1', '52996.96', '80000', '000', '2925201010108914', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '52', '上海霞飞路522号', TO_DATE('2016-04-24 21:52:06', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7533', '熊亮', '10004901', '2', '46386.30', '80000', '000', '2925193910239539', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '35', '上海霞飞路852号', TO_DATE('2016-04-24 21:52:06', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7534', '赵乍袄', '10004902', '2', '51245.21', '80000', '000', '2925199710217434', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '45', '上海霞飞路458号', TO_DATE('2016-04-24 21:52:06', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7535', '段凋牡', '10004903', '2', '12153.21', '80000', '000', '2925196811233893', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '39', '上海霞飞路693号', TO_DATE('2016-04-24 21:52:06', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7536', '段吃特', '10004904', '2', '79150.62', '80000', '000', '2925192110116713', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '24', '上海霞飞路344号', TO_DATE('2016-04-24 21:52:06', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7537', '赵允愧', '10004905', '2', '30122.21', '80000', '000', '2925201011178444', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '24', '上海霞飞路20号', TO_DATE('2016-04-24 21:52:06', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7538', '张垃狭', '10004906', '1', '68223.27', '80000', '000', '2925193411249726', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '58', '上海霞飞路481号', TO_DATE('2016-04-24 21:52:06', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7539', '段郭', '10004907', '1', '72972.49', '80000', '000', '2925200711298855', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '75', '上海霞飞路917号', TO_DATE('2016-04-24 21:52:06', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7540', '郤存', '10004908', '2', '68658.20', '80000', '000', '2925199311169693', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '37', '上海霞飞路344号', TO_DATE('2016-04-24 21:52:06', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7541', '毛怀淹', '10004909', '2', '33513.59', '80000', '000', '2925197011187956', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '30', '上海霞飞路866号', TO_DATE('2016-04-24 21:52:06', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7542', '段丹蹭', '10004910', '2', '41480.19', '80000', '000', '2925198611245841', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '35', '上海霞飞路670号', TO_DATE('2016-04-24 21:52:06', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7543', '熊乾北', '10004911', '1', '43592.35', '80000', '000', '2925197410217804', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '52', '上海霞飞路101号', TO_DATE('2016-04-24 21:52:06', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7544', '李漓梦', '10004912', '2', '53746.42', '80000', '000', '2925194212198151', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '82', '上海霞飞路243号', TO_DATE('2016-04-24 21:52:07', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7545', '李伸', '10004913', '2', '36186.29', '80000', '000', '2925193610154916', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '44', '上海霞飞路864号', TO_DATE('2016-04-24 21:52:07', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7546', '刘小苗', '10004914', '2', '23191.42', '80000', '000', '2925201010161264', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '56', '上海霞飞路567号', TO_DATE('2016-04-24 21:52:07', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7547', '毛并设', '10004915', '2', '37326.86', '80000', '000', '2925199212261434', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '66', '上海霞飞路378号', TO_DATE('2016-04-24 21:52:07', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7548', '毛旋屠', '10004916', '2', '27216.81', '80000', '000', '2925195310181916', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '75', '上海霞飞路915号', TO_DATE('2016-04-24 21:52:07', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7549', '刘螟', '10004917', '1', '29001.20', '80000', '000', '2925194412161265', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '63', '上海霞飞路635号', TO_DATE('2016-04-24 21:52:07', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7550', '毛列灸', '10004918', '2', '63627.39', '80000', '000', '2925199010284601', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '30', '上海霞飞路448号', TO_DATE('2016-04-24 21:52:07', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7551', '张块', '10004919', '2', '18701.41', '80000', '000', '2925194911217468', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '38', '上海霞飞路346号', TO_DATE('2016-04-24 21:52:07', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7552', '段溃', '10004920', '1', '19006.13', '80000', '000', '2925201211238314', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '70', '上海霞飞路380号', TO_DATE('2016-04-24 21:52:07', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7553', '熊喝啮', '10004921', '2', '7724.43', '80000', '000', '2925201310223412', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '95', '上海霞飞路626号', TO_DATE('2016-04-24 21:52:07', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7554', '毛源', '10004922', '2', '27132.90', '80000', '000', '2925200710284568', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '60', '上海霞飞路408号', TO_DATE('2016-04-24 21:52:07', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7555', '段倡', '10004923', '1', '12923.70', '80000', '000', '2925195811241483', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '37', '上海霞飞路280号', TO_DATE('2016-04-24 21:52:07', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7556', '赵释妥', '10004924', '2', '12329.95', '80000', '000', '2925201311207051', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '36', '上海霞飞路860号', TO_DATE('2016-04-24 21:52:08', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6800', '刘尿', '10004168', '1', '46496.95', '80000', '000', '2925199710183250', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '72', '上海霞飞路30号', TO_DATE('2016-04-24 21:51:07', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6801', '张誊奸', '10004169', '1', '63993.99', '80000', '000', '2925194912196841', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '59', '上海霞飞路651号', TO_DATE('2016-04-24 21:51:07', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6802', '刘癣腐', '10004170', '2', '20634.47', '80000', '000', '2925194012214625', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '85', '上海霞飞路261号', TO_DATE('2016-04-24 21:51:07', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6803', '郤航诧', '10004171', '1', '42430.50', '80000', '000', '2925199412157204', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '60', '上海霞飞路26号', TO_DATE('2016-04-24 21:51:08', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6804', '周盔霜', '10004172', '2', '47352.95', '80000', '000', '2925195311102116', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '82', '上海霞飞路731号', TO_DATE('2016-04-24 21:51:08', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6805', '黄吊耿', '10004173', '1', '25996.13', '80000', '000', '2925196011265961', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '62', '上海霞飞路394号', TO_DATE('2016-04-24 21:51:08', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6806', '段昼', '10004174', '1', '50049.23', '80000', '000', '2925194910218258', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '28', '上海霞飞路866号', TO_DATE('2016-04-24 21:51:08', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6807', '熊沁', '10004175', '1', '67139.90', '80000', '000', '2925196611226462', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '37', '上海霞飞路949号', TO_DATE('2016-04-24 21:51:08', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6808', '段努', '10004176', '2', '36413.29', '80000', '000', '2925196412252492', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '34', '上海霞飞路588号', TO_DATE('2016-04-24 21:51:08', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6809', '郤缝', '10004177', '2', '9724.71', '80000', '000', '2925197211277889', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '39', '上海霞飞路164号', TO_DATE('2016-04-24 21:51:08', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6810', '周尤', '10004178', '1', '32473.43', '80000', '000', '2925197710204501', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '40', '上海霞飞路872号', TO_DATE('2016-04-24 21:51:08', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6811', '黄歧府', '10004179', '1', '42052.94', '80000', '000', '2925194312266348', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '96', '上海霞飞路605号', TO_DATE('2016-04-24 21:51:08', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6812', '李尹', '10004180', '2', '58373.72', '80000', '000', '2925199011152053', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '37', '上海霞飞路594号', TO_DATE('2016-04-24 21:51:09', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6813', '黄镍陛', '10004181', '1', '76242.30', '80000', '000', '2925192511272859', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '36', '上海霞飞路504号', TO_DATE('2016-04-24 21:51:09', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6814', '毛赁势', '10004182', '1', '69266.38', '80000', '000', '2925193511294973', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '40', '上海霞飞路403号', TO_DATE('2016-04-24 21:51:09', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6815', '张较', '10004183', '1', '69607.65', '80000', '000', '2925193910247536', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '33', '上海霞飞路418号', TO_DATE('2016-04-24 21:51:09', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6816', '周览', '10004184', '1', '25220.39', '80000', '000', '2925194012194159', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '66', '上海霞飞路571号', TO_DATE('2016-04-24 21:51:09', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6817', '张墨', '10004185', '1', '18196.12', '80000', '000', '2925200410214482', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '84', '上海霞飞路576号', TO_DATE('2016-04-24 21:51:09', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6818', '郤孽', '10004186', '2', '50548.38', '80000', '000', '2925199811203790', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '22', '上海霞飞路44号', TO_DATE('2016-04-24 21:51:09', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6819', '毛富', '10004187', '2', '73126.60', '80000', '000', '2925195311236161', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '46', '上海霞飞路741号', TO_DATE('2016-04-24 21:51:09', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6820', '熊权鳖', '10004188', '1', '69437.62', '80000', '000', '2925200611259134', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '47', '上海霞飞路146号', TO_DATE('2016-04-24 21:51:09', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6821', '周痘船', '10004189', '2', '64871.39', '80000', '000', '2925198610114298', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '73', '上海霞飞路697号', TO_DATE('2016-04-24 21:51:09', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6822', '毛践', '10004190', '1', '25306.58', '80000', '000', '2925192310227598', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '30', '上海霞飞路670号', TO_DATE('2016-04-24 21:51:10', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6823', '熊腰', '10004191', '1', '33153.36', '80000', '000', '2925195410154563', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '74', '上海霞飞路678号', TO_DATE('2016-04-24 21:51:10', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6824', '刘祷馈', '10004192', '2', '33762.61', '80000', '000', '2925201311219936', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '36', '上海霞飞路304号', TO_DATE('2016-04-24 21:51:10', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6825', '李剖泻', '10004193', '1', '48567.96', '80000', '000', '2925196510261584', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '34', '上海霞飞路344号', TO_DATE('2016-04-24 21:51:10', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6826', '熊黎员', '10004194', '1', '59570.40', '80000', '000', '2925193711184752', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '56', '上海霞飞路609号', TO_DATE('2016-04-24 21:51:10', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6827', '郤乓', '10004195', '2', '72620.11', '80000', '000', '2925200212195049', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '41', '上海霞飞路134号', TO_DATE('2016-04-24 21:51:10', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6828', '黄奠', '10004196', '1', '58530.51', '80000', '000', '2925192511305716', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '67', '上海霞飞路31号', TO_DATE('2016-04-24 21:51:10', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6829', '郤驼', '10004197', '2', '29297.20', '80000', '000', '2925193611254942', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '78', '上海霞飞路102号', TO_DATE('2016-04-24 21:51:10', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6830', '郤梯赫', '10004198', '2', '63659.70', '80000', '000', '2925199612154135', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '60', '上海霞飞路629号', TO_DATE('2016-04-24 21:51:11', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6831', '黄沧', '10004199', '2', '57830.19', '80000', '000', '2925195511219175', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '44', '上海霞飞路551号', TO_DATE('2016-04-24 21:51:11', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6832', '赵泪', '10004200', '1', '9577.31', '80000', '000', '2925193511241781', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '94', '上海霞飞路528号', TO_DATE('2016-04-24 21:51:11', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6833', '周窗魔', '10004201', '2', '46805.40', '80000', '000', '2925199911171153', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '89', '上海霞飞路83号', TO_DATE('2016-04-24 21:51:11', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6834', '刘摄', '10004202', '2', '69498.78', '80000', '000', '2925193411244132', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '77', '上海霞飞路263号', TO_DATE('2016-04-24 21:51:11', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6835', '赵屑', '10004203', '1', '10257.35', '80000', '000', '2925196712129045', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '47', '上海霞飞路872号', TO_DATE('2016-04-24 21:51:11', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6836', '李鲜碌', '10004204', '2', '77719.16', '80000', '000', '2925199912119439', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '92', '上海霞飞路520号', TO_DATE('2016-04-24 21:51:11', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6837', '黄喝', '10004205', '1', '72907.53', '80000', '000', '2925200311123795', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '64', '上海霞飞路292号', TO_DATE('2016-04-24 21:51:11', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6838', '周癣', '10004206', '2', '33008.50', '80000', '000', '2925198411264239', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '50', '上海霞飞路965号', TO_DATE('2016-04-24 21:51:11', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6839', '毛掸', '10004207', '1', '34176.65', '80000', '000', '2925192311272133', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '21', '上海霞飞路194号', TO_DATE('2016-04-24 21:51:12', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6840', '熊沼纬', '10004208', '1', '70797.45', '80000', '000', '2925200510165257', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '91', '上海霞飞路135号', TO_DATE('2016-04-24 21:51:12', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6841', '段弥贝', '10004209', '1', '53147.11', '80000', '000', '2925198712216140', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '43', '上海霞飞路456号', TO_DATE('2016-04-24 21:51:12', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6842', '郤挂沧', '10004210', '2', '12560.45', '80000', '000', '2925201110309819', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '63', '上海霞飞路600号', TO_DATE('2016-04-24 21:51:12', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6843', '毛惋', '10004211', '1', '19099.43', '80000', '000', '2925193311297119', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '75', '上海霞飞路636号', TO_DATE('2016-04-24 21:51:12', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6844', '张押', '10004212', '1', '25297.40', '80000', '000', '2925194712157194', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '37', '上海霞飞路872号', TO_DATE('2016-04-24 21:51:12', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6845', '段肃隶', '10004213', '1', '74778.13', '80000', '000', '2925196311114816', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '22', '上海霞飞路805号', TO_DATE('2016-04-24 21:51:12', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6846', '周耿', '10004214', '2', '20505.78', '80000', '000', '2925196012177507', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '58', '上海霞飞路761号', TO_DATE('2016-04-24 21:51:12', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6847', '赵茎乞', '10004215', '1', '42046.25', '80000', '000', '2925196210264256', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '50', '上海霞飞路921号', TO_DATE('2016-04-24 21:51:12', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6848', '李轴体', '10004216', '1', '28539.38', '80000', '000', '2925197911252139', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '82', '上海霞飞路153号', TO_DATE('2016-04-24 21:51:12', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6849', '黄烹', '10004217', '1', '32060.12', '80000', '000', '2925194510298736', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '36', '上海霞飞路316号', TO_DATE('2016-04-24 21:51:13', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6850', '郤肌振', '10004218', '1', '28772.56', '80000', '000', '2925196712195750', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '38', '上海霞飞路421号', TO_DATE('2016-04-24 21:51:13', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6851', '黄输', '10004219', '1', '26626.37', '80000', '000', '2925195312252740', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '91', '上海霞飞路149号', TO_DATE('2016-04-24 21:51:13', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6852', '毛堤贪', '10004220', '2', '28433.64', '80000', '000', '2925200810278343', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '42', '上海霞飞路941号', TO_DATE('2016-04-24 21:51:13', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6853', '黄偶擎', '10004221', '1', '9881.28', '80000', '000', '2925196910181803', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '60', '上海霞飞路906号', TO_DATE('2016-04-24 21:51:13', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6873', '刘招', '10004241', '1', '69456.37', '80000', '000', '2925197110161948', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '52', '上海霞飞路89号', TO_DATE('2016-04-24 21:51:15', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6874', '张椿', '10004242', '2', '77280.70', '80000', '000', '2925200412201095', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '63', '上海霞飞路953号', TO_DATE('2016-04-24 21:51:15', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6875', '刘焰', '10004243', '1', '29230.37', '80000', '000', '2925199611307840', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '56', '上海霞飞路562号', TO_DATE('2016-04-24 21:51:15', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6876', '周土', '10004244', '1', '13526.59', '80000', '000', '2925196910195378', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '38', '上海霞飞路652号', TO_DATE('2016-04-24 21:51:15', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6877', '段顽胁', '10004245', '2', '75125.50', '80000', '000', '2925199910183391', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '51', '上海霞飞路329号', TO_DATE('2016-04-24 21:51:15', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6878', '周梧丘', '10004246', '2', '34512.59', '80000', '000', '2925199312153698', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '52', '上海霞飞路601号', TO_DATE('2016-04-24 21:51:15', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6879', '毛掩', '10004247', '2', '14651.70', '80000', '000', '2925200711269433', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '28', '上海霞飞路992号', TO_DATE('2016-04-24 21:51:15', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6880', '郤龄滨', '10004248', '2', '31874.46', '80000', '000', '2925200112217478', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '35', '上海霞飞路585号', TO_DATE('2016-04-24 21:51:15', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6881', '毛集', '10004249', '1', '34454.88', '80000', '000', '2925193010281440', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '55', '上海霞飞路64号', TO_DATE('2016-04-24 21:51:16', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6882', '段咆疽', '10004250', '1', '25314.55', '80000', '000', '2925198110207002', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '87', '上海霞飞路24号', TO_DATE('2016-04-24 21:51:16', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6883', '周郑', '10004251', '1', '42691.28', '80000', '000', '2925192710239962', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '38', '上海霞飞路998号', TO_DATE('2016-04-24 21:51:16', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6884', '熊贼泡', '10004252', '1', '18653.96', '80000', '000', '2925193912244724', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '41', '上海霞飞路281号', TO_DATE('2016-04-24 21:51:16', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6885', '周辆', '10004253', '2', '38102.96', '80000', '000', '2925196211208482', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '19', '上海霞飞路715号', TO_DATE('2016-04-24 21:51:16', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6886', '李伦', '10004254', '1', '60342.73', '80000', '000', '2925196411274708', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '71', '上海霞飞路236号', TO_DATE('2016-04-24 21:51:16', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6887', '周辖', '10004255', '1', '69431.21', '80000', '000', '2925198610249919', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '70', '上海霞飞路945号', TO_DATE('2016-04-24 21:51:16', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6888', '李缩咒', '10004256', '2', '6327.92', '80000', '000', '2925198511177093', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '68', '上海霞飞路57号', TO_DATE('2016-04-24 21:51:16', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6889', '段劳', '10004257', '1', '69348.69', '80000', '000', '2925200811183334', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '50', '上海霞飞路996号', TO_DATE('2016-04-24 21:51:16', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6890', '熊墨', '10004258', '2', '55683.57', '80000', '000', '2925197812144737', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '60', '上海霞飞路415号', TO_DATE('2016-04-24 21:51:16', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6891', '周闰', '10004259', '2', '13509.97', '80000', '000', '2925201010143610', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '46', '上海霞飞路778号', TO_DATE('2016-04-24 21:51:16', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6892', '黄血', '10004260', '1', '39901.37', '80000', '000', '2925196911258432', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '98', '上海霞飞路593号', TO_DATE('2016-04-24 21:51:16', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6893', '李盘爆', '10004261', '2', '59917.27', '80000', '000', '2925197312283131', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '75', '上海霞飞路174号', TO_DATE('2016-04-24 21:51:17', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6894', '刘膝', '10004262', '1', '53225.52', '80000', '000', '2925196011133371', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '28', '上海霞飞路201号', TO_DATE('2016-04-24 21:51:17', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6895', '熊俯存', '10004263', '1', '46223.48', '80000', '000', '2925201412143740', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '88', '上海霞飞路90号', TO_DATE('2016-04-24 21:51:17', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6896', '段庭度', '10004264', '2', '71956.29', '80000', '000', '2925194811262725', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '96', '上海霞飞路470号', TO_DATE('2016-04-24 21:51:17', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6897', '熊槛', '10004265', '2', '35117.73', '80000', '000', '2925199211263500', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '25', '上海霞飞路798号', TO_DATE('2016-04-24 21:51:17', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6898', '李淘', '10004266', '1', '77097.20', '80000', '000', '2925192311216531', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '37', '上海霞飞路337号', TO_DATE('2016-04-24 21:51:17', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6899', '黄愚狠', '10004267', '2', '64461.66', '80000', '000', '2925197311194036', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '33', '上海霞飞路380号', TO_DATE('2016-04-24 21:51:17', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6900', '李弛助', '10004268', '1', '67252.73', '80000', '000', '2925195611299255', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '96', '上海霞飞路780号', TO_DATE('2016-04-24 21:51:17', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6901', '刘羚', '10004269', '1', '15306.36', '80000', '000', '2925200111127492', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '62', '上海霞飞路385号', TO_DATE('2016-04-24 21:51:17', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6902', '黄聋', '10004270', '2', '33182.57', '80000', '000', '2925194311293703', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '54', '上海霞飞路133号', TO_DATE('2016-04-24 21:51:17', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6903', '毛夯摈', '10004271', '1', '11451.76', '80000', '000', '2925194710271372', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '45', '上海霞飞路33号', TO_DATE('2016-04-24 21:51:17', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6904', '段均讫', '10004272', '2', '57896.72', '80000', '000', '2925201312183172', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '55', '上海霞飞路323号', TO_DATE('2016-04-24 21:51:17', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6905', '张箔照', '10004273', '1', '6677.73', '80000', '000', '2925192912173790', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '95', '上海霞飞路551号', TO_DATE('2016-04-24 21:51:17', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6906', '张讳', '10004274', '1', '58702.47', '80000', '000', '2925198212117004', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '91', '上海霞飞路270号', TO_DATE('2016-04-24 21:51:17', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6907', '毛钓滚', '10004275', '1', '46329.20', '80000', '000', '2925194211259923', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '78', '上海霞飞路492号', TO_DATE('2016-04-24 21:51:18', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6854', '周烛', '10004222', '2', '17538.81', '80000', '000', '2925199211171005', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '78', '上海霞飞路416号', TO_DATE('2016-04-24 21:51:13', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6855', '毛隋犹', '10004223', '1', '27945.12', '80000', '000', '2925192912225614', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '22', '上海霞飞路290号', TO_DATE('2016-04-24 21:51:13', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6856', '李税若', '10004224', '1', '37807.94', '80000', '000', '2925200111277243', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '29', '上海霞飞路972号', TO_DATE('2016-04-24 21:51:13', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6857', '刘贡', '10004225', '2', '16698.73', '80000', '000', '2925197611287874', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '81', '上海霞飞路92号', TO_DATE('2016-04-24 21:51:13', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6858', '刘妮匿', '10004226', '1', '29963.39', '80000', '000', '2925195011229064', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '87', '上海霞飞路265号', TO_DATE('2016-04-24 21:51:14', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6859', '赵使辩', '10004227', '2', '70327.87', '80000', '000', '2925193311172686', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '27', '上海霞飞路879号', TO_DATE('2016-04-24 21:51:14', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6860', '黄践舰', '10004228', '1', '30311.50', '80000', '000', '2925194212191184', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '71', '上海霞飞路31号', TO_DATE('2016-04-24 21:51:14', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6861', '李皑愁', '10004229', '1', '65793.94', '80000', '000', '2925199011101510', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '68', '上海霞飞路599号', TO_DATE('2016-04-24 21:51:14', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6862', '郤漳', '10004230', '1', '48005.45', '80000', '000', '2925193711124046', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '28', '上海霞飞路814号', TO_DATE('2016-04-24 21:51:14', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6863', '黄帆', '10004231', '1', '18864.93', '80000', '000', '2925194311264962', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '59', '上海霞飞路421号', TO_DATE('2016-04-24 21:51:14', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6864', '郤殴拘', '10004232', '2', '8883.78', '80000', '000', '2925193612233529', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '22', '上海霞飞路838号', TO_DATE('2016-04-24 21:51:14', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6865', '刘酥', '10004233', '2', '49861', '80000', '000', '2925194911171975', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '31', '上海霞飞路431号', TO_DATE('2016-04-24 21:51:14', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6866', '段乓', '10004234', '1', '22294.50', '80000', '000', '2925192212233509', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '64', '上海霞飞路219号', TO_DATE('2016-04-24 21:51:14', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6867', '刘农膀', '10004235', '1', '39778.89', '80000', '000', '2925200710158107', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '53', '上海霞飞路995号', TO_DATE('2016-04-24 21:51:14', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6868', '黄任', '10004236', '1', '61787.76', '80000', '000', '2925194411141671', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '92', '上海霞飞路6号', TO_DATE('2016-04-24 21:51:14', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6869', '郤痢隆', '10004237', '2', '37904.30', '80000', '000', '2925193711174024', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '61', '上海霞飞路896号', TO_DATE('2016-04-24 21:51:15', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6870', '毛溅', '10004238', '2', '19085.57', '80000', '000', '2925199811167225', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '84', '上海霞飞路752号', TO_DATE('2016-04-24 21:51:15', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6871', '周梆睫', '10004239', '2', '58612.80', '80000', '000', '2925197111296424', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '23', '上海霞飞路577号', TO_DATE('2016-04-24 21:51:15', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6872', '黄爱仅', '10004240', '1', '73227.89', '80000', '000', '2925197111225435', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '21', '上海霞飞路578号', TO_DATE('2016-04-24 21:51:15', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6908', '刘鸵', '10004276', '2', '38090.64', '80000', '000', '2925195110127937', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '24', '上海霞飞路888号', TO_DATE('2016-04-24 21:51:18', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6909', '张牙', '10004277', '1', '44361.12', '80000', '000', '2925198512256677', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '81', '上海霞飞路112号', TO_DATE('2016-04-24 21:51:18', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6910', '李丁', '10004278', '2', '26869.58', '80000', '000', '2925199611306901', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '63', '上海霞飞路430号', TO_DATE('2016-04-24 21:51:18', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6911', '赵炬强', '10004279', '2', '7529.20', '80000', '000', '2925195111168843', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '29', '上海霞飞路155号', TO_DATE('2016-04-24 21:51:18', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6912', '李钟札', '10004280', '2', '31440.34', '80000', '000', '2925197111253179', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '99', '上海霞飞路113号', TO_DATE('2016-04-24 21:51:18', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6913', '李冲夷', '10004281', '2', '28849.45', '80000', '000', '2925195310239290', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '97', '上海霞飞路637号', TO_DATE('2016-04-24 21:51:18', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6914', '毛渗', '10004282', '1', '19609.79', '80000', '000', '2925197610212065', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '66', '上海霞飞路262号', TO_DATE('2016-04-24 21:51:18', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6915', '刘船', '10004283', '2', '56992.16', '80000', '000', '2925200810197947', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '45', '上海霞飞路462号', TO_DATE('2016-04-24 21:51:18', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6916', '周伍', '10004284', '1', '71842.76', '80000', '000', '2925198011123434', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '26', '上海霞飞路426号', TO_DATE('2016-04-24 21:51:18', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6917', '黄伴统', '10004285', '1', '58742.76', '80000', '000', '2925200411237624', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '58', '上海霞飞路959号', TO_DATE('2016-04-24 21:51:18', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6918', '黄造径', '10004286', '1', '29354.55', '80000', '000', '2925198711268874', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '40', '上海霞飞路177号', TO_DATE('2016-04-24 21:51:18', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6919', '毛淌', '10004287', '1', '26195.83', '80000', '000', '2925194611251928', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '49', '上海霞飞路697号', TO_DATE('2016-04-24 21:51:18', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6920', '郤氯', '10004288', '2', '60936.30', '80000', '000', '2925192911136281', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '59', '上海霞飞路571号', TO_DATE('2016-04-24 21:51:19', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6921', '黄喇躯', '10004289', '1', '38811.12', '80000', '000', '2925194911199820', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '24', '上海霞飞路139号', TO_DATE('2016-04-24 21:51:19', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6922', '刘陕尾', '10004290', '1', '36910.40', '80000', '000', '2925195611271066', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '90', '上海霞飞路475号', TO_DATE('2016-04-24 21:51:19', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6923', '郤艾筋', '10004291', '1', '17004.10', '80000', '000', '2925192710136584', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '82', '上海霞飞路1号', TO_DATE('2016-04-24 21:51:19', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6924', '赵咆蚊', '10004292', '2', '57128.56', '80000', '000', '2925199112123381', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '84', '上海霞飞路219号', TO_DATE('2016-04-24 21:51:19', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6925', '刘咙', '10004293', '1', '6386.96', '80000', '000', '2925200310118220', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '66', '上海霞飞路392号', TO_DATE('2016-04-24 21:51:19', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6926', '刘神', '10004294', '1', '58387.36', '80000', '000', '2925192410199021', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '35', '上海霞飞路310号', TO_DATE('2016-04-24 21:51:19', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6927', '郤熔', '10004295', '1', '74342.62', '80000', '000', '2925192411201572', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '95', '上海霞飞路81号', TO_DATE('2016-04-24 21:51:19', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6928', '赵离', '10004296', '2', '71186.90', '80000', '000', '2925193011124895', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '73', '上海霞飞路149号', TO_DATE('2016-04-24 21:51:19', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6929', '熊钱', '10004297', '1', '29060.17', '80000', '000', '2925199711238682', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '71', '上海霞飞路470号', TO_DATE('2016-04-24 21:51:19', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6930', '毛豆漠', '10004298', '1', '50204.55', '80000', '000', '2925195712275211', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '31', '上海霞飞路977号', TO_DATE('2016-04-24 21:51:19', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6931', '黄葡编', '10004299', '1', '77682.12', '80000', '000', '2925196812289173', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '80', '上海霞飞路135号', TO_DATE('2016-04-24 21:51:19', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6932', '周召砷', '10004300', '1', '71405.23', '80000', '000', '2925201211139811', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '36', '上海霞飞路523号', TO_DATE('2016-04-24 21:51:19', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6933', '周仑姻', '10004301', '2', '6715.21', '80000', '000', '2925200712144678', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '90', '上海霞飞路997号', TO_DATE('2016-04-24 21:51:19', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6934', '赵香没', '10004302', '2', '79168.46', '80000', '000', '2925195111123266', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '82', '上海霞飞路43号', TO_DATE('2016-04-24 21:51:20', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6935', '周伎', '10004303', '2', '36355.50', '80000', '000', '2925200910267587', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '55', '上海霞飞路485号', TO_DATE('2016-04-24 21:51:20', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6936', '刘惺诈', '10004304', '1', '13341.13', '80000', '000', '2925198111227660', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '80', '上海霞飞路743号', TO_DATE('2016-04-24 21:51:20', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6937', '刘仙不', '10004305', '2', '6869.25', '80000', '000', '2925198810188654', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '44', '上海霞飞路269号', TO_DATE('2016-04-24 21:51:20', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6938', '刘氰', '10004306', '1', '54615.41', '80000', '000', '2925195311296211', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '55', '上海霞飞路794号', TO_DATE('2016-04-24 21:51:20', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6939', '刘擅', '10004307', '1', '11687.61', '80000', '000', '2925198710187233', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '53', '上海霞飞路408号', TO_DATE('2016-04-24 21:51:20', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6940', '赵泼沟', '10004308', '2', '79117.86', '80000', '000', '2925194711217123', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '32', '上海霞飞路380号', TO_DATE('2016-04-24 21:51:20', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6941', '周猿', '10004309', '1', '60345.33', '80000', '000', '2925198712151161', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '65', '上海霞飞路1号', TO_DATE('2016-04-24 21:51:20', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6942', '刘杖皖', '10004310', '2', '21626.91', '80000', '000', '2925198810116332', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '64', '上海霞飞路534号', TO_DATE('2016-04-24 21:51:20', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6943', '周嚣蜀', '10004311', '1', '72944.84', '80000', '000', '2925197111306585', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '63', '上海霞飞路680号', TO_DATE('2016-04-24 21:51:20', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6944', '毛婚隶', '10004312', '2', '53298.59', '80000', '000', '2925200712166038', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '83', '上海霞飞路692号', TO_DATE('2016-04-24 21:51:20', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6945', '黄诸雇', '10004313', '2', '46251.40', '80000', '000', '2925192111199249', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '22', '上海霞飞路540号', TO_DATE('2016-04-24 21:51:20', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6946', '毛辽戳', '10004314', '1', '16314.10', '80000', '000', '2925193910235188', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '43', '上海霞飞路200号', TO_DATE('2016-04-24 21:51:21', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6947', '黄倔', '10004315', '1', '28110.34', '80000', '000', '2925195411133016', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '40', '上海霞飞路332号', TO_DATE('2016-04-24 21:51:21', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6948', '刘娄', '10004316', '1', '18337.94', '80000', '000', '2925197511256297', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '99', '上海霞飞路227号', TO_DATE('2016-04-24 21:51:21', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6949', '周蔬幂', '10004317', '2', '73296.45', '80000', '000', '2925193711113651', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '96', '上海霞飞路31号', TO_DATE('2016-04-24 21:51:21', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6950', '黄譬涩', '10004318', '2', '38182.66', '80000', '000', '2925196712264275', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '93', '上海霞飞路812号', TO_DATE('2016-04-24 21:51:21', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6951', '段死', '10004319', '1', '76477.12', '80000', '000', '2925199610269163', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '46', '上海霞飞路98号', TO_DATE('2016-04-24 21:51:21', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6952', '郤耀毯', '10004320', '2', '38594.43', '80000', '000', '2925192912286145', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '98', '上海霞飞路997号', TO_DATE('2016-04-24 21:51:21', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6953', '周苯', '10004321', '1', '62412.56', '80000', '000', '2925195312296206', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '51', '上海霞飞路39号', TO_DATE('2016-04-24 21:51:21', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6954', '周路', '10004322', '1', '28543.91', '80000', '000', '2925194212136827', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '23', '上海霞飞路266号', TO_DATE('2016-04-24 21:51:21', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6955', '张拳', '10004323', '2', '52056.69', '80000', '000', '2925192512127322', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '37', '上海霞飞路90号', TO_DATE('2016-04-24 21:51:21', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6956', '毛鹤账', '10004324', '2', '53917.30', '80000', '000', '2925192311241364', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '68', '上海霞飞路752号', TO_DATE('2016-04-24 21:51:21', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6957', '黄迟嗜', '10004325', '2', '47702.30', '80000', '000', '2925197611247080', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '41', '上海霞飞路132号', TO_DATE('2016-04-24 21:51:21', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6958', '周秸蓬', '10004326', '1', '40026.98', '80000', '000', '2925199212238265', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '79', '上海霞飞路941号', TO_DATE('2016-04-24 21:51:22', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6959', '熊滴崇', '10004327', '2', '32814.77', '80000', '000', '2925196211128344', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '33', '上海霞飞路161号', TO_DATE('2016-04-24 21:51:22', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6960', '张丈匆', '10004328', '2', '19806.77', '80000', '000', '2925194711138855', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '42', '上海霞飞路813号', TO_DATE('2016-04-24 21:51:22', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6961', '周辣', '10004329', '2', '48711.30', '80000', '000', '2925198211152240', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '31', '上海霞飞路915号', TO_DATE('2016-04-24 21:51:22', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6962', '熊疥洁', '10004330', '1', '42134.90', '80000', '000', '2925195612236788', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '39', '上海霞飞路656号', TO_DATE('2016-04-24 21:51:22', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6963', '熊理', '10004331', '2', '58726.26', '80000', '000', '2925194911133567', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '24', '上海霞飞路489号', TO_DATE('2016-04-24 21:51:22', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6964', '李绚辑', '10004332', '2', '35133.65', '80000', '000', '2925199310149122', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '85', '上海霞飞路8号', TO_DATE('2016-04-24 21:51:22', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6965', '段尚', '10004333', '1', '69015.19', '80000', '000', '2925199411292701', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '18', '上海霞飞路31号', TO_DATE('2016-04-24 21:51:22', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6966', '熊摇锑', '10004334', '2', '65887.31', '80000', '000', '2925196112172615', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '73', '上海霞飞路445号', TO_DATE('2016-04-24 21:51:22', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6967', '赵椰', '10004335', '2', '31645.46', '80000', '000', '2925197511203258', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '73', '上海霞飞路861号', TO_DATE('2016-04-24 21:51:22', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6968', '张尖', '10004336', '1', '50445.39', '80000', '000', '2925199810221137', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '53', '上海霞飞路178号', TO_DATE('2016-04-24 21:51:22', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6969', '段笋', '10004337', '2', '36124.75', '80000', '000', '2925192711152046', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '20', '上海霞飞路603号', TO_DATE('2016-04-24 21:51:22', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6970', '张糠', '10004338', '2', '58529.17', '80000', '000', '2925199911248358', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '50', '上海霞飞路672号', TO_DATE('2016-04-24 21:51:22', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6971', '熊抄', '10004339', '2', '56003.58', '80000', '000', '2925199310164082', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '99', '上海霞飞路164号', TO_DATE('2016-04-24 21:51:23', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6972', '毛捻', '10004340', '2', '7831.56', '80000', '000', '2925199010153108', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '79', '上海霞飞路766号', TO_DATE('2016-04-24 21:51:23', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6973', '黄骂', '10004341', '1', '15720.41', '80000', '000', '2925199510125710', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '31', '上海霞飞路653号', TO_DATE('2016-04-24 21:51:23', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6974', '赵姚观', '10004342', '1', '77305.19', '80000', '000', '2925196311113059', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '40', '上海霞飞路977号', TO_DATE('2016-04-24 21:51:23', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6975', '张美于', '10004343', '1', '73318.38', '80000', '000', '2925197410257082', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '87', '上海霞飞路586号', TO_DATE('2016-04-24 21:51:23', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6976', '刘蛤', '10004344', '1', '79356.60', '80000', '000', '2925200011133645', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '93', '上海霞飞路997号', TO_DATE('2016-04-24 21:51:23', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6977', '段琼', '10004345', '2', '71197.87', '80000', '000', '2925194111229541', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '81', '上海霞飞路958号', TO_DATE('2016-04-24 21:51:23', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6978', '段键', '10004346', '2', '45308.19', '80000', '000', '2925200511225353', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '84', '上海霞飞路552号', TO_DATE('2016-04-24 21:51:23', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6979', '郤抒个', '10004347', '2', '11535.20', '80000', '000', '2925199712259685', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '58', '上海霞飞路24号', TO_DATE('2016-04-24 21:51:23', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6980', '刘跃硷', '10004348', '1', '79074.15', '80000', '000', '2925200710172809', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '73', '上海霞飞路127号', TO_DATE('2016-04-24 21:51:23', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6981', '刘争', '10004349', '2', '27540.27', '80000', '000', '2925197811274124', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '22', '上海霞飞路881号', TO_DATE('2016-04-24 21:51:23', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6982', '周辕', '10004350', '1', '68401.57', '80000', '000', '2925194212179287', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '80', '上海霞飞路245号', TO_DATE('2016-04-24 21:51:23', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6983', '赵喧宿', '10004351', '2', '42176.20', '80000', '000', '2925193711273226', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '73', '上海霞飞路195号', TO_DATE('2016-04-24 21:51:23', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6984', '张绿邪', '10004352', '1', '9607.30', '80000', '000', '2925192211163569', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '64', '上海霞飞路281号', TO_DATE('2016-04-24 21:51:23', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6985', '赵短', '10004353', '2', '64508.93', '80000', '000', '2925197110209372', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '59', '上海霞飞路647号', TO_DATE('2016-04-24 21:51:24', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6986', '周沼', '10004354', '1', '18203.38', '80000', '000', '2925192412163280', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '100', '上海霞飞路11号', TO_DATE('2016-04-24 21:51:24', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6987', '黄妹', '10004355', '2', '20320.97', '80000', '000', '2925193711227488', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '60', '上海霞飞路960号', TO_DATE('2016-04-24 21:51:24', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6988', '赵图萝', '10004356', '1', '78291.16', '80000', '000', '2925198510163138', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '23', '上海霞飞路376号', TO_DATE('2016-04-24 21:51:24', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6989', '郤斑丸', '10004357', '2', '30149.61', '80000', '000', '2925195211278900', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '36', '上海霞飞路578号', TO_DATE('2016-04-24 21:51:24', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6990', '毛拳睡', '10004358', '2', '46150.30', '80000', '000', '2925195912124724', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '80', '上海霞飞路173号', TO_DATE('2016-04-24 21:51:24', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6991', '熊膳舀', '10004359', '2', '68392.95', '80000', '000', '2925200611292770', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '90', '上海霞飞路348号', TO_DATE('2016-04-24 21:51:24', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6992', '张录', '10004360', '1', '71896.31', '80000', '000', '2925197610126720', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '19', '上海霞飞路621号', TO_DATE('2016-04-24 21:51:24', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6993', '郤曙', '10004361', '1', '27626.20', '80000', '000', '2925192310224654', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '35', '上海霞飞路790号', TO_DATE('2016-04-24 21:51:24', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6994', '张浑甩', '10004362', '2', '67623.38', '80000', '000', '2925194810206736', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '18', '上海霞飞路40号', TO_DATE('2016-04-24 21:51:24', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6995', '郤墨', '10004363', '1', '46787.57', '80000', '000', '2925192411176959', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '79', '上海霞飞路795号', TO_DATE('2016-04-24 21:51:24', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6996', '张熬宦', '10004364', '2', '50918.61', '80000', '000', '2925196612265142', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '82', '上海霞飞路97号', TO_DATE('2016-04-24 21:51:24', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6997', '赵观淋', '10004365', '1', '18374.88', '80000', '000', '2925195411117315', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '64', '上海霞飞路843号', TO_DATE('2016-04-24 21:51:24', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6998', '周碾', '10004366', '1', '29151.85', '80000', '000', '2925199511263554', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '50', '上海霞飞路332号', TO_DATE('2016-04-24 21:51:24', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6999', '刘疑下', '10004367', '1', '20301.16', '80000', '000', '2925198111275147', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '87', '上海霞飞路82号', TO_DATE('2016-04-24 21:51:25', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7000', '张待', '10004368', '1', '32437.89', '80000', '000', '2925198410101879', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '80', '上海霞飞路928号', TO_DATE('2016-04-24 21:51:25', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7001', '郤桶', '10004369', '2', '32567.92', '80000', '000', '2925193711142977', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '65', '上海霞飞路848号', TO_DATE('2016-04-24 21:51:25', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7002', '毛尽痪', '10004370', '1', '33676.55', '80000', '000', '2925199512119068', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '29', '上海霞飞路955号', TO_DATE('2016-04-24 21:51:25', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7003', '李膊', '10004371', '1', '55386.30', '80000', '000', '2925194211306234', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '45', '上海霞飞路486号', TO_DATE('2016-04-24 21:51:25', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7004', '段洋', '10004372', '1', '30550.98', '80000', '000', '2925198912103980', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '74', '上海霞飞路525号', TO_DATE('2016-04-24 21:51:25', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7005', '段摊州', '10004373', '2', '61912.73', '80000', '000', '2925192312238585', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '83', '上海霞飞路534号', TO_DATE('2016-04-24 21:51:25', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7006', '刘聋芬', '10004374', '1', '64900.40', '80000', '000', '2925197311231010', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '70', '上海霞飞路603号', TO_DATE('2016-04-24 21:51:25', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7007', '刘眺努', '10004375', '2', '51233.29', '80000', '000', '2925197312176085', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '89', '上海霞飞路637号', TO_DATE('2016-04-24 21:51:25', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7008', '黄柄', '10004376', '2', '47366.63', '80000', '000', '2925199311178384', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '34', '上海霞飞路417号', TO_DATE('2016-04-24 21:51:25', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7009', '熊羽', '10004377', '2', '41759.61', '80000', '000', '2925193312204654', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '20', '上海霞飞路764号', TO_DATE('2016-04-24 21:51:25', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7010', '毛已凹', '10004378', '2', '13689.63', '80000', '000', '2925198111182275', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '94', '上海霞飞路688号', TO_DATE('2016-04-24 21:51:25', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7011', '黄痰洱', '10004379', '1', '11664.11', '80000', '000', '2925199111145678', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '69', '上海霞飞路577号', TO_DATE('2016-04-24 21:51:25', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7012', '郤拭', '10004380', '1', '51583.72', '80000', '000', '2925201112206133', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '44', '上海霞飞路159号', TO_DATE('2016-04-24 21:51:25', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7013', '张幽串', '10004381', '1', '33534.85', '80000', '000', '2925196111101743', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '30', '上海霞飞路26号', TO_DATE('2016-04-24 21:51:26', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7014', '赵疟', '10004382', '2', '43561', '80000', '000', '2925199211266897', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '92', '上海霞飞路107号', TO_DATE('2016-04-24 21:51:26', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('7015', '刘腋蓑', '10004383', '1', '54852.40', '80000', '000', '2925193510237790', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '73', '上海霞飞路535号', TO_DATE('2016-04-24 21:51:26', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6638', '毛均放', '10004006', '2', '43564.47', '80000', '000', '2925196912171318', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '88', '上海霞飞路580号', TO_DATE('2016-04-24 21:50:49', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6639', '刘贴劫', '10004007', '2', '10006.18', '80000', '000', '2925195111227810', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '42', '上海霞飞路8号', TO_DATE('2016-04-24 21:50:50', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6640', '郤芹', '10004008', '1', '49670.47', '80000', '000', '2925196111177374', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '98', '上海霞飞路27号', TO_DATE('2016-04-24 21:50:50', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6641', '毛秦烟', '10004009', '2', '12499.93', '80000', '000', '2925198111134596', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '37', '上海霞飞路640号', TO_DATE('2016-04-24 21:50:50', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6642', '熊移', '10004010', '2', '50077.32', '80000', '000', '2925195912163086', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '60', '上海霞飞路15号', TO_DATE('2016-04-24 21:50:50', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6643', '张腿', '10004011', '2', '28854.48', '80000', '000', '2925196611112784', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '18', '上海霞飞路986号', TO_DATE('2016-04-24 21:50:50', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6644', '毛祥', '10004012', '1', '49407.70', '80000', '000', '2925195711286290', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '68', '上海霞飞路937号', TO_DATE('2016-04-24 21:50:50', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6645', '黄航涛', '10004013', '1', '19418.72', '80000', '000', '2925195212268890', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '25', '上海霞飞路408号', TO_DATE('2016-04-24 21:50:50', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6646', '周碉', '10004014', '2', '58464.67', '80000', '000', '2925193611239845', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '92', '上海霞飞路926号', TO_DATE('2016-04-24 21:50:50', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6647', '郤僚镭', '10004015', '2', '51873.59', '80000', '000', '2925194212153394', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '59', '上海霞飞路54号', TO_DATE('2016-04-24 21:50:50', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6648', '郤很宇', '10004016', '2', '52692.54', '80000', '000', '2925193710241751', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '84', '上海霞飞路676号', TO_DATE('2016-04-24 21:50:51', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6649', '段妨', '10004017', '2', '61325.34', '80000', '000', '2925200511114199', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '59', '上海霞飞路31号', TO_DATE('2016-04-24 21:50:51', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6650', '刘舷杠', '10004018', '2', '53578.49', '80000', '000', '2925198211115151', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '87', '上海霞飞路930号', TO_DATE('2016-04-24 21:50:51', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6651', '张铁', '10004019', '1', '25743.54', '80000', '000', '2925201411278792', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '47', '上海霞飞路58号', TO_DATE('2016-04-24 21:50:51', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6652', '熊邻吕', '10004020', '1', '15899.50', '80000', '000', '2925195511232654', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '25', '上海霞飞路75号', TO_DATE('2016-04-24 21:50:51', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6653', '熊米', '10004021', '1', '63871.30', '80000', '000', '2925194211289125', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '48', '上海霞飞路682号', TO_DATE('2016-04-24 21:50:51', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6654', '段堵澜', '10004022', '2', '36218.55', '80000', '000', '2925196012107590', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '66', '上海霞飞路555号', TO_DATE('2016-04-24 21:50:51', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6655', '刘焰说', '10004023', '1', '55271.68', '80000', '000', '2925196310105481', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '34', '上海霞飞路397号', TO_DATE('2016-04-24 21:50:51', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6656', '毛辨央', '10004024', '2', '10514.39', '80000', '000', '2925197211107129', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '56', '上海霞飞路102号', TO_DATE('2016-04-24 21:50:51', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6657', '赵染吁', '10004025', '2', '28650.64', '80000', '000', '2925198412281876', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '35', '上海霞飞路263号', TO_DATE('2016-04-24 21:50:52', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6658', '张吨镭', '10004026', '1', '33356.62', '80000', '000', '2925192110288400', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '92', '上海霞飞路951号', TO_DATE('2016-04-24 21:50:52', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6659', '周咎', '10004027', '2', '67105.65', '80000', '000', '2925192512253754', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '40', '上海霞飞路858号', TO_DATE('2016-04-24 21:50:52', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6660', '熊忍', '10004028', '2', '37519.17', '80000', '000', '2925193510207026', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '48', '上海霞飞路549号', TO_DATE('2016-04-24 21:50:52', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6661', '郤嫁', '10004029', '2', '51449.99', '80000', '000', '2925194110115019', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '55', '上海霞飞路656号', TO_DATE('2016-04-24 21:50:52', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6662', '黄厘', '10004030', '1', '77427.80', '80000', '000', '2925192411295712', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '77', '上海霞飞路439号', TO_DATE('2016-04-24 21:50:52', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6663', '熊派晌', '10004031', '1', '25261.39', '80000', '000', '2925192812297659', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '44', '上海霞飞路169号', TO_DATE('2016-04-24 21:50:52', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6664', '段沦', '10004032', '1', '14346.55', '80000', '000', '2925199711205804', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '94', '上海霞飞路307号', TO_DATE('2016-04-24 21:50:52', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6665', '段衫', '10004033', '1', '59805.36', '80000', '000', '2925196610162522', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '93', '上海霞飞路443号', TO_DATE('2016-04-24 21:50:52', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6666', '毛俭实', '10004034', '1', '43696.35', '80000', '000', '2925198811174956', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '86', '上海霞飞路390号', TO_DATE('2016-04-24 21:50:52', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6667', '赵秤企', '10004035', '2', '69474.60', '80000', '000', '2925192811183980', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '62', '上海霞飞路755号', TO_DATE('2016-04-24 21:50:53', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6668', '张宴糖', '10004036', '2', '45404.81', '80000', '000', '2925200412209317', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '93', '上海霞飞路723号', TO_DATE('2016-04-24 21:50:53', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6669', '周奎务', '10004037', '2', '46898.16', '80000', '000', '2925196211218551', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '98', '上海霞飞路583号', TO_DATE('2016-04-24 21:50:53', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6670', '周麻棺', '10004038', '2', '48689.75', '80000', '000', '2925194710117895', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '29', '上海霞飞路932号', TO_DATE('2016-04-24 21:50:53', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6671', '李权', '10004039', '2', '21372.25', '80000', '000', '2925192611231729', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '86', '上海霞飞路211号', TO_DATE('2016-04-24 21:50:53', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6672', '熊爸', '10004040', '1', '51168.69', '80000', '000', '2925197911202985', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '33', '上海霞飞路540号', TO_DATE('2016-04-24 21:50:53', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6673', '李选', '10004041', '2', '24751.10', '80000', '000', '2925200812184547', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '92', '上海霞飞路540号', TO_DATE('2016-04-24 21:50:53', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6674', '毛鹊', '10004042', '2', '40699.37', '80000', '000', '2925199710243822', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '94', '上海霞飞路999号', TO_DATE('2016-04-24 21:50:53', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6675', '赵膜', '10004043', '2', '71460.49', '80000', '000', '2925200812199675', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '23', '上海霞飞路963号', TO_DATE('2016-04-24 21:50:53', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6676', '赵匈痕', '10004044', '1', '50846.20', '80000', '000', '2925196910119868', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '76', '上海霞飞路918号', TO_DATE('2016-04-24 21:50:54', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6677', '郤鸡', '10004045', '1', '29761.72', '80000', '000', '2925201010141060', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '87', '上海霞飞路373号', TO_DATE('2016-04-24 21:50:54', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6678', '熊犊', '10004046', '2', '25364.12', '80000', '000', '2925200410203377', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '81', '上海霞飞路199号', TO_DATE('2016-04-24 21:50:54', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6679', '郤畜', '10004047', '2', '19939.62', '80000', '000', '2925198810181381', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '78', '上海霞飞路659号', TO_DATE('2016-04-24 21:50:54', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6680', '刘虚让', '10004048', '2', '25616.17', '80000', '000', '2925194511119133', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '26', '上海霞飞路37号', TO_DATE('2016-04-24 21:50:54', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6681', '段烫', '10004049', '1', '69541.80', '80000', '000', '2925198110113870', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '20', '上海霞飞路280号', TO_DATE('2016-04-24 21:50:54', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6682', '李田擂', '10004050', '2', '75306.88', '80000', '000', '2925199110122537', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '48', '上海霞飞路21号', TO_DATE('2016-04-24 21:50:54', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6683', '李攫', '10004051', '2', '68330.52', '80000', '000', '2925193111297255', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '61', '上海霞飞路744号', TO_DATE('2016-04-24 21:50:54', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6684', '刘仟辜', '10004052', '2', '65430.28', '80000', '000', '2925199710167414', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '83', '上海霞飞路776号', TO_DATE('2016-04-24 21:50:54', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6685', '张新', '10004053', '1', '48089.78', '80000', '000', '2925194112115860', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '67', '上海霞飞路102号', TO_DATE('2016-04-24 21:50:54', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6686', '郤驼横', '10004054', '2', '12852.97', '80000', '000', '2925194311137227', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '21', '上海霞飞路877号', TO_DATE('2016-04-24 21:50:55', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6687', '黄欠宴', '10004055', '1', '16932.70', '80000', '000', '2925198511275139', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '45', '上海霞飞路765号', TO_DATE('2016-04-24 21:50:55', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6688', '张姐鳖', '10004056', '1', '22389.86', '80000', '000', '2925194012206564', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '67', '上海霞飞路992号', TO_DATE('2016-04-24 21:50:55', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6689', '李芬记', '10004057', '2', '76274.25', '80000', '000', '2925196210179172', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '75', '上海霞飞路282号', TO_DATE('2016-04-24 21:50:55', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6690', '刘饺剃', '10004058', '1', '60817.20', '80000', '000', '2925194410156086', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '32', '上海霞飞路474号', TO_DATE('2016-04-24 21:50:55', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6691', '段陀', '10004059', '1', '13092.30', '80000', '000', '2925195912289899', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '33', '上海霞飞路861号', TO_DATE('2016-04-24 21:50:55', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6692', '郤慢', '10004060', '2', '39688.14', '80000', '000', '2925196011167306', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '21', '上海霞飞路860号', TO_DATE('2016-04-24 21:50:55', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6693', '赵莆', '10004061', '2', '20646.48', '80000', '000', '2925192512231123', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '29', '上海霞飞路780号', TO_DATE('2016-04-24 21:50:55', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6694', '段绑艺', '10004062', '2', '56360.70', '80000', '000', '2925200712223879', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '47', '上海霞飞路9号', TO_DATE('2016-04-24 21:50:55', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6695', '李地村', '10004063', '2', '75295.10', '80000', '000', '2925192112266546', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '72', '上海霞飞路978号', TO_DATE('2016-04-24 21:50:56', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6696', '李唁', '10004064', '2', '69137.25', '80000', '000', '2925200610268280', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '19', '上海霞飞路807号', TO_DATE('2016-04-24 21:50:56', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6697', '刘床寄', '10004065', '1', '29559.86', '80000', '000', '2925199812175394', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '40', '上海霞飞路452号', TO_DATE('2016-04-24 21:50:56', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6698', '段汕蕾', '10004066', '1', '76914.61', '80000', '000', '2925195611183048', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '51', '上海霞飞路709号', TO_DATE('2016-04-24 21:50:56', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6699', '毛涕', '10004067', '1', '58080.76', '80000', '000', '2925196812231371', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '25', '上海霞飞路280号', TO_DATE('2016-04-24 21:50:56', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6700', '刘真臆', '10004068', '2', '42240.71', '80000', '000', '2925194910294976', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '33', '上海霞飞路523号', TO_DATE('2016-04-24 21:50:56', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6701', '李孟哗', '10004069', '2', '75623.70', '80000', '000', '2925197212155995', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '68', '上海霞飞路370号', TO_DATE('2016-04-24 21:50:56', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6702', '段天', '10004070', '1', '73177.28', '80000', '000', '2925195012269911', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '21', '上海霞飞路200号', TO_DATE('2016-04-24 21:50:56', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6703', '黄议仙', '10004071', '1', '20773.66', '80000', '000', '2925197210206598', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '44', '上海霞飞路269号', TO_DATE('2016-04-24 21:50:56', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6704', '黄蒂企', '10004072', '2', '65862.71', '80000', '000', '2925199311192070', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '82', '上海霞飞路560号', TO_DATE('2016-04-24 21:50:57', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6705', '段才羞', '10004073', '2', '31471.69', '80000', '000', '2925197611279486', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '61', '上海霞飞路621号', TO_DATE('2016-04-24 21:50:57', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6706', '张剑铸', '10004074', '2', '26183.53', '80000', '000', '2925200610127006', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '68', '上海霞飞路199号', TO_DATE('2016-04-24 21:50:57', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6707', '郤痔丁', '10004075', '1', '75039.45', '80000', '000', '2925192411248070', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '47', '上海霞飞路120号', TO_DATE('2016-04-24 21:50:57', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6708', '李尽', '10004076', '2', '13445.73', '80000', '000', '2925196010207653', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '26', '上海霞飞路7号', TO_DATE('2016-04-24 21:50:57', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6709', '赵枫', '10004077', '1', '19846.27', '80000', '000', '2925196211146979', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '72', '上海霞飞路43号', TO_DATE('2016-04-24 21:50:57', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6710', '郤场梳', '10004078', '2', '73440.41', '80000', '000', '2925198711224076', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '45', '上海霞飞路50号', TO_DATE('2016-04-24 21:50:57', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6711', '李聂逐', '10004079', '1', '44256.20', '80000', '000', '2925197210251433', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '49', '上海霞飞路707号', TO_DATE('2016-04-24 21:50:57', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6712', '熊紧', '10004080', '2', '28814.11', '80000', '000', '2925196710164850', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '45', '上海霞飞路747号', TO_DATE('2016-04-24 21:50:57', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6713', '黄愧阁', '10004081', '1', '39012.83', '80000', '000', '2925199711202405', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '61', '上海霞飞路432号', TO_DATE('2016-04-24 21:50:57', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6714', '熊燕', '10004082', '2', '49134.87', '80000', '000', '2925200312251203', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '65', '上海霞飞路584号', TO_DATE('2016-04-24 21:50:58', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6715', '张骨拜', '10004083', '2', '7708.56', '80000', '000', '2925200312202355', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '85', '上海霞飞路857号', TO_DATE('2016-04-24 21:50:58', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6716', '李卿谷', '10004084', '1', '55542.89', '80000', '000', '2925197711124337', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '40', '上海霞飞路805号', TO_DATE('2016-04-24 21:50:58', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6717', '段汞', '10004085', '1', '10482.90', '80000', '000', '2925198711293550', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '81', '上海霞飞路699号', TO_DATE('2016-04-24 21:50:58', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6718', '黄尚骆', '10004086', '1', '29411.16', '80000', '000', '2925195612263580', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '80', '上海霞飞路818号', TO_DATE('2016-04-24 21:50:58', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6719', '熊看', '10004087', '1', '64602.15', '80000', '000', '2925197410268263', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '73', '上海霞飞路290号', TO_DATE('2016-04-24 21:50:58', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6720', '周琴', '10004088', '2', '56887.61', '80000', '000', '2925197712122255', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '34', '上海霞飞路265号', TO_DATE('2016-04-24 21:50:58', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6721', '熊怔', '10004089', '1', '64068.30', '80000', '000', '2925192411217364', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '70', '上海霞飞路484号', TO_DATE('2016-04-24 21:50:58', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6722', '黄护', '10004090', '1', '69723.71', '80000', '000', '2925196411122441', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '37', '上海霞飞路974号', TO_DATE('2016-04-24 21:50:58', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6723', '段俩', '10004091', '1', '20901.33', '80000', '000', '2925197211116094', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '93', '上海霞飞路779号', TO_DATE('2016-04-24 21:50:59', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6724', '熊噎', '10004092', '1', '75302.34', '80000', '000', '2925198610261012', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '70', '上海霞飞路274号', TO_DATE('2016-04-24 21:50:59', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6725', '张搐姚', '10004093', '2', '61251.72', '80000', '000', '2925194911102036', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '19', '上海霞飞路731号', TO_DATE('2016-04-24 21:50:59', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6726', '熊抨褐', '10004094', '1', '59247.39', '80000', '000', '2925193512177615', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '79', '上海霞飞路348号', TO_DATE('2016-04-24 21:50:59', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6727', '熊冗绍', '10004095', '2', '71979.50', '80000', '000', '2925197611263569', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '38', '上海霞飞路18号', TO_DATE('2016-04-24 21:50:59', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6728', '赵哲', '10004096', '1', '20514.73', '80000', '000', '2925193311227484', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '54', '上海霞飞路639号', TO_DATE('2016-04-24 21:50:59', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6729', '周给凸', '10004097', '2', '21869.60', '80000', '000', '2925198611118335', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '86', '上海霞飞路718号', TO_DATE('2016-04-24 21:50:59', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6730', '段吁蛮', '10004098', '1', '25374.11', '80000', '000', '2925192711121245', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '95', '上海霞飞路489号', TO_DATE('2016-04-24 21:50:59', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6731', '段抉唬', '10004099', '2', '76097.10', '80000', '000', '2925192511267485', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '81', '上海霞飞路683号', TO_DATE('2016-04-24 21:50:59', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6732', '黄示', '10004100', '1', '37172.31', '80000', '000', '2925192211204113', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '65', '上海霞飞路485号', TO_DATE('2016-04-24 21:51:00', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6733', '段伐', '10004101', '1', '11132.50', '80000', '000', '2925194810152737', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '95', '上海霞飞路42号', TO_DATE('2016-04-24 21:51:00', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6734', '郤蔷惕', '10004102', '2', '37270.68', '80000', '000', '2925193112266137', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '52', '上海霞飞路234号', TO_DATE('2016-04-24 21:51:00', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6735', '李号', '10004103', '1', '45697.41', '80000', '000', '2925195411187529', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '30', '上海霞飞路222号', TO_DATE('2016-04-24 21:51:00', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6736', '张衅对', '10004104', '1', '9067.69', '80000', '000', '2925199712275390', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '44', '上海霞飞路515号', TO_DATE('2016-04-24 21:51:00', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6737', '毛戊找', '10004105', '2', '41948.51', '80000', '000', '2925199411155793', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '41', '上海霞飞路60号', TO_DATE('2016-04-24 21:51:00', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6738', '段话噶', '10004106', '2', '41501.29', '80000', '000', '2925198310113262', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '88', '上海霞飞路53号', TO_DATE('2016-04-24 21:51:00', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6739', '黄署虽', '10004107', '1', '43519.81', '80000', '000', '2925199712126111', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '66', '上海霞飞路829号', TO_DATE('2016-04-24 21:51:00', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6740', '赵酉', '10004108', '2', '12921.14', '80000', '000', '2925201211226247', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '32', '上海霞飞路338号', TO_DATE('2016-04-24 21:51:01', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6741', '赵比', '10004109', '2', '29576.38', '80000', '000', '2925193111177301', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '79', '上海霞飞路300号', TO_DATE('2016-04-24 21:51:01', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6742', '段叫', '10004110', '1', '36739.10', '80000', '000', '2925196910288897', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '73', '上海霞飞路244号', TO_DATE('2016-04-24 21:51:01', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6743', '熊尚', '10004111', '1', '38538.81', '80000', '000', '2925192610238710', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '49', '上海霞飞路144号', TO_DATE('2016-04-24 21:51:01', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6744', '毛网寸', '10004112', '2', '56749.96', '80000', '000', '2925193910236826', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '29', '上海霞飞路387号', TO_DATE('2016-04-24 21:51:01', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6745', '郤桓携', '10004113', '1', '57599.76', '80000', '000', '2925199810192717', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '27', '上海霞飞路306号', TO_DATE('2016-04-24 21:51:01', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6746', '黄似掷', '10004114', '1', '32527.10', '80000', '000', '2925195411269918', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '77', '上海霞飞路446号', TO_DATE('2016-04-24 21:51:01', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6747', '郤沽俱', '10004115', '1', '54719.81', '80000', '000', '2925201212196254', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '38', '上海霞飞路145号', TO_DATE('2016-04-24 21:51:01', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6748', '黄璃', '10004116', '1', '27788.38', '80000', '000', '2925200910181160', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '80', '上海霞飞路915号', TO_DATE('2016-04-24 21:51:02', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6749', '毛馒', '10004117', '2', '30213.50', '80000', '000', '2925193610271353', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '80', '上海霞飞路464号', TO_DATE('2016-04-24 21:51:02', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6750', '赵悸', '10004118', '1', '51123.80', '80000', '000', '2925192312244725', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '63', '上海霞飞路993号', TO_DATE('2016-04-24 21:51:02', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6751', '刘员颁', '10004119', '1', '57596.36', '80000', '000', '2925193410128001', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '32', '上海霞飞路758号', TO_DATE('2016-04-24 21:51:02', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6752', '熊描', '10004120', '1', '34995.10', '80000', '000', '2925195011176234', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '54', '上海霞飞路580号', TO_DATE('2016-04-24 21:51:02', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6753', '黄勾', '10004121', '2', '79839.18', '80000', '000', '2925192311201838', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '57', '上海霞飞路267号', TO_DATE('2016-04-24 21:51:02', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6754', '张虎', '10004122', '2', '61408.18', '80000', '000', '2925194611151326', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '81', '上海霞飞路597号', TO_DATE('2016-04-24 21:51:02', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6755', '熊夷躁', '10004123', '1', '59665.87', '80000', '000', '2925199911193457', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '32', '上海霞飞路672号', TO_DATE('2016-04-24 21:51:02', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6756', '周因胆', '10004124', '1', '73125.34', '80000', '000', '2925196611149952', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '73', '上海霞飞路96号', TO_DATE('2016-04-24 21:51:02', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6757', '张帐诧', '10004125', '1', '65058.84', '80000', '000', '2925197812292356', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '22', '上海霞飞路545号', TO_DATE('2016-04-24 21:51:02', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6758', '郤旅捞', '10004126', '1', '29870.19', '80000', '000', '2925194411234053', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '85', '上海霞飞路861号', TO_DATE('2016-04-24 21:51:03', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6759', '黄膜', '10004127', '1', '37608.35', '80000', '000', '2925196612301802', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '54', '上海霞飞路853号', TO_DATE('2016-04-24 21:51:03', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6760', '张向铭', '10004128', '1', '7366.77', '80000', '000', '2925195412284491', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '50', '上海霞飞路487号', TO_DATE('2016-04-24 21:51:03', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6761', '赵媳效', '10004129', '2', '45862.59', '80000', '000', '2925199412215141', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '90', '上海霞飞路154号', TO_DATE('2016-04-24 21:51:03', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6762', '黄厂', '10004130', '2', '51653.76', '80000', '000', '2925198011212434', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '98', '上海霞飞路130号', TO_DATE('2016-04-24 21:51:03', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6763', '郤抗裔', '10004131', '1', '68322.52', '80000', '000', '2925198511219336', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '56', '上海霞飞路276号', TO_DATE('2016-04-24 21:51:03', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6764', '毛竖蔫', '10004132', '1', '63551.69', '80000', '000', '2925198912131551', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '42', '上海霞飞路408号', TO_DATE('2016-04-24 21:51:03', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6765', '刘塘狸', '10004133', '2', '71226.29', '80000', '000', '2925196011271751', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '52', '上海霞飞路616号', TO_DATE('2016-04-24 21:51:03', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6766', '毛橡', '10004134', '2', '6681.49', '80000', '000', '2925195511122700', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '80', '上海霞飞路165号', TO_DATE('2016-04-24 21:51:03', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6767', '刘闷', '10004135', '1', '54786.14', '80000', '000', '2925199111133458', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '62', '上海霞飞路357号', TO_DATE('2016-04-24 21:51:04', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6768', '周厚叙', '10004136', '1', '10943.15', '80000', '000', '2925199411287001', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '49', '上海霞飞路52号', TO_DATE('2016-04-24 21:51:04', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6769', '段僻', '10004137', '1', '56003.60', '80000', '000', '2925194310286610', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '74', '上海霞飞路221号', TO_DATE('2016-04-24 21:51:04', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6770', '毛橙庶', '10004138', '1', '35847.91', '80000', '000', '2925192711247440', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '58', '上海霞飞路158号', TO_DATE('2016-04-24 21:51:04', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6771', '赵及', '10004139', '2', '40734.52', '80000', '000', '2925198810216641', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '38', '上海霞飞路592号', TO_DATE('2016-04-24 21:51:04', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6772', '李轿盛', '10004140', '1', '34588.45', '80000', '000', '2925201511114421', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '42', '上海霞飞路140号', TO_DATE('2016-04-24 21:51:04', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6773', '毛哇仙', '10004141', '2', '6137.30', '80000', '000', '2925198811198319', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '60', '上海霞飞路84号', TO_DATE('2016-04-24 21:51:04', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6774', '赵硒洪', '10004142', '1', '24279.30', '80000', '000', '2925193311291903', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '43', '上海霞飞路575号', TO_DATE('2016-04-24 21:51:04', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6775', '周邻阔', '10004143', '2', '41156.35', '80000', '000', '2925201510233950', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '41', '上海霞飞路911号', TO_DATE('2016-04-24 21:51:04', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6776', '赵喝', '10004144', '1', '78231.43', '80000', '000', '2925196912216035', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '99', '上海霞飞路497号', TO_DATE('2016-04-24 21:51:05', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6777', '赵闭破', '10004145', '1', '37194.79', '80000', '000', '2925195611115232', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '96', '上海霞飞路654号', TO_DATE('2016-04-24 21:51:05', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6778', '段借漾', '10004146', '2', '52671.32', '80000', '000', '2925194812165439', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '46', '上海霞飞路332号', TO_DATE('2016-04-24 21:51:05', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6779', '毛白搏', '10004147', '1', '17615.71', '80000', '000', '2925195211265564', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '42', '上海霞飞路230号', TO_DATE('2016-04-24 21:51:05', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6780', '周咕魁', '10004148', '1', '62817.18', '80000', '000', '2925199211224540', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '34', '上海霞飞路700号', TO_DATE('2016-04-24 21:51:05', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6781', '郤砂焊', '10004149', '2', '75223.13', '80000', '000', '2925195011303811', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '45', '上海霞飞路196号', TO_DATE('2016-04-24 21:51:05', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6782', '李华', '10004150', '1', '77685.40', '80000', '000', '2925193011253594', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '48', '上海霞飞路797号', TO_DATE('2016-04-24 21:51:05', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6783', '刘如', '10004151', '1', '35387.30', '80000', '000', '2925197511286826', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '28', '上海霞飞路707号', TO_DATE('2016-04-24 21:51:05', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6784', '张著必', '10004152', '1', '55547.63', '80000', '000', '2925197511281329', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '28', '上海霞飞路318号', TO_DATE('2016-04-24 21:51:05', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6785', '段昆埔', '10004153', '2', '16924.43', '80000', '000', '2925192612192241', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '60', '上海霞飞路709号', TO_DATE('2016-04-24 21:51:05', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6786', '熊够辱', '10004154', '1', '62424.87', '80000', '000', '2925199810258333', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '56', '上海霞飞路137号', TO_DATE('2016-04-24 21:51:06', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6787', '刘试尼', '10004155', '2', '47424.10', '80000', '000', '2925198011153307', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '93', '上海霞飞路225号', TO_DATE('2016-04-24 21:51:06', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6788', '周铃', '10004156', '2', '56518.43', '80000', '000', '2925199010207610', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '26', '上海霞飞路224号', TO_DATE('2016-04-24 21:51:06', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6789', '段珐纷', '10004157', '2', '16145.39', '80000', '000', '2925197311128819', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '86', '上海霞飞路815号', TO_DATE('2016-04-24 21:51:06', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6790', '黄间', '10004158', '2', '75981.10', '80000', '000', '2925193010247932', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '49', '上海霞飞路482号', TO_DATE('2016-04-24 21:51:06', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6791', '周甫', '10004159', '2', '8129.59', '80000', '000', '2925194510152392', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '77', '上海霞飞路553号', TO_DATE('2016-04-24 21:51:06', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6792', '郤栅沙', '10004160', '1', '31922.74', '80000', '000', '2925199511174921', '3', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '48', '上海霞飞路503号', TO_DATE('2016-04-24 21:51:06', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6793', '毛炎衍', '10004161', '1', '45697.46', '80000', '000', '2925197611289616', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '35', '上海霞飞路103号', TO_DATE('2016-04-24 21:51:06', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6794', '黄冯同', '10004162', '1', '29046.53', '80000', '000', '2925193811198986', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '83', '上海霞飞路434号', TO_DATE('2016-04-24 21:51:07', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6795', '毛钩', '10004163', '2', '57958.71', '80000', '000', '2925193210128887', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '19', '上海霞飞路741号', TO_DATE('2016-04-24 21:51:07', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6796', '李维脯', '10004164', '2', '8822.41', '80000', '000', '2925195311214532', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '80', '上海霞飞路429号', TO_DATE('2016-04-24 21:51:07', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6797', '周耗逃', '10004165', '1', '29492.45', '80000', '000', '2925195211136902', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '92', '上海霞飞路423号', TO_DATE('2016-04-24 21:51:07', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6798', '刘胺猪', '10004166', '1', '44592.17', '80000', '000', '2925200811134086', '1', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '34', '上海霞飞路401号', TO_DATE('2016-04-24 21:51:07', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO DEMO_ACCOUNT VALUES ('6799', '段韩', '10004167', '2', '75843.10', '80000', '000', '2925197512147144', '2', TO_DATE('2016-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '68', '上海霞飞路206号', TO_DATE('2016-04-24 21:51:07', 'YYYY-MM-DD HH24:MI:SS'), '1');

-- ----------------------------
-- Table structure for DEMO_ORG
-- ----------------------------
-- DROP TABLE IF EXISTS DEMO_ORG;
CREATE TABLE DEMO_ORG (
ID_ NVARCHAR2(64) NOT NULL ,
CASCADE_ID_ NVARCHAR2(255) NULL ,
NAME_ NVARCHAR2(255) NULL ,
HOTKEY_ NVARCHAR2(255) NULL ,
PARENT_ID_ NVARCHAR2(64) NOT NULL ,
IS_LEAF_ NVARCHAR2(6) NOT NULL ,
IS_AUTO_EXPAND_ NVARCHAR2(6) NULL ,
ICON_NAME_ NVARCHAR2(255) NULL ,
ADDRESS_ NVARCHAR2(255) NULL ,
CREATE_TIME_ DATE NOT NULL ,
CREATE_USER_ID_ NVARCHAR2(255) NOT NULL ,
SORT_NO_ NUMBER(11) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE
;
COMMENT ON TABLE DEMO_ORG IS '银行组织机构表';
COMMENT ON COLUMN DEMO_ORG.ID_ IS '流水号';
COMMENT ON COLUMN DEMO_ORG.CASCADE_ID_ IS '节点语义ID';
COMMENT ON COLUMN DEMO_ORG.NAME_ IS '组织名称';
COMMENT ON COLUMN DEMO_ORG.HOTKEY_ IS '热键';
COMMENT ON COLUMN DEMO_ORG.PARENT_ID_ IS '父节点流水号';
COMMENT ON COLUMN DEMO_ORG.IS_LEAF_ IS '是否叶子节点';
COMMENT ON COLUMN DEMO_ORG.IS_AUTO_EXPAND_ IS '是否自动展开';
COMMENT ON COLUMN DEMO_ORG.ICON_NAME_ IS '节点图标文件名称';
COMMENT ON COLUMN DEMO_ORG.ADDRESS_ IS '地址';
COMMENT ON COLUMN DEMO_ORG.CREATE_TIME_ IS '创建时间';
COMMENT ON COLUMN DEMO_ORG.CREATE_USER_ID_ IS '创建人ID';
COMMENT ON COLUMN DEMO_ORG.SORT_NO_ IS '排序号';

-- ----------------------------
-- Records of DEMO_ORG
-- ----------------------------
INSERT INTO DEMO_ORG VALUES ('0', '0', '中国嘉靖银行', null, 'p', '0', '1', null, null, TO_DATE('2016-04-24 23:26:09', 'YYYY-MM-DD HH24:MI:SS'), '1', null);
INSERT INTO DEMO_ORG VALUES ('1', '0.001', '中国嘉靖银行上海分行', null, '0', '1', '0', null, null, TO_DATE('2016-04-24 23:27:22', 'YYYY-MM-DD HH24:MI:SS'), '1', null);
INSERT INTO DEMO_ORG VALUES ('2', '0.002', '中国嘉靖银行四川分行', null, '0', '1', '0', null, null, TO_DATE('2016-04-24 23:28:01', 'YYYY-MM-DD HH24:MI:SS'), '1', null);
INSERT INTO DEMO_ORG VALUES ('3', '0.003', '中国嘉靖银行云南分行', null, '0', '0', '1', null, null, TO_DATE('2016-04-24 23:28:29', 'YYYY-MM-DD HH24:MI:SS'), '1', null);
INSERT INTO DEMO_ORG VALUES ('4', '0.003.001', '云南分行昆明支行', null, '3', '1', '0', null, null, TO_DATE('2016-04-24 23:29:06', 'YYYY-MM-DD HH24:MI:SS'), '1', null);
INSERT INTO DEMO_ORG VALUES ('5', '0.003.002', '云南分行大理支行', null, '3', '1', '0', null, null, TO_DATE('2016-04-24 23:29:21', 'YYYY-MM-DD HH24:MI:SS'), '1', null);

-- ----------------------------
-- Procedure structure for AOS_PROC_DEMO
-- ----------------------------
CREATE OR REPLACE procedure AOS_PROC_DEMO(prm_name      IN VARCHAR2, --持卡人
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
CREATE OR REPLACE procedure AOS_PROC_DEMO2(prm_name_ IN VARCHAR2, -- 模块名称
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
DROP SEQUENCE AOS_WF_EVT_LOG_SEQ;
CREATE SEQUENCE AOS_WF_EVT_LOG_SEQ
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
ALTER TABLE AOS_LOG_SESSION ADD CHECK (ID_ IS NOT NULL);
ALTER TABLE AOS_LOG_SESSION ADD CHECK (USER_ID_ IS NOT NULL);
ALTER TABLE AOS_LOG_SESSION ADD CHECK (ACCOUNT_ IS NOT NULL);
ALTER TABLE AOS_LOG_SESSION ADD CHECK (USER_NAME_ IS NOT NULL);
ALTER TABLE AOS_LOG_SESSION ADD CHECK (CREATE_TIME_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_LOG_SESSION
-- ----------------------------
ALTER TABLE AOS_LOG_SESSION ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_SYS_CATALOG
-- ----------------------------
CREATE UNIQUE INDEX AOS_SYS_CATALOG_UKEY
ON AOS_SYS_CATALOG (CASCADE_ID_ ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_SYS_CATALOG
-- ----------------------------
ALTER TABLE AOS_SYS_CATALOG ADD CHECK (ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_CATALOG ADD CHECK (CASCADE_ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_CATALOG ADD CHECK (ROOT_KEY_ IS NOT NULL);
ALTER TABLE AOS_SYS_CATALOG ADD CHECK (ROOT_NAME_ IS NOT NULL);
ALTER TABLE AOS_SYS_CATALOG ADD CHECK (NAME_ IS NOT NULL);
ALTER TABLE AOS_SYS_CATALOG ADD CHECK (PARENT_ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_CATALOG ADD CHECK (IS_LEAF_ IS NOT NULL);
ALTER TABLE AOS_SYS_CATALOG ADD CHECK (IS_AUTO_EXPAND_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_CATALOG
-- ----------------------------
ALTER TABLE AOS_SYS_CATALOG ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_SYS_DIC
-- ----------------------------

-- ----------------------------
-- Checks structure for table AOS_SYS_DIC
-- ----------------------------
ALTER TABLE AOS_SYS_DIC ADD CHECK (ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_DIC ADD CHECK (CODE_ IS NOT NULL);
ALTER TABLE AOS_SYS_DIC ADD CHECK (DESC_ IS NOT NULL);
ALTER TABLE AOS_SYS_DIC ADD CHECK (STATUS_ IS NOT NULL);
ALTER TABLE AOS_SYS_DIC ADD CHECK (DIC_INDEX_ID_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_DIC
-- ----------------------------
ALTER TABLE AOS_SYS_DIC ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_SYS_DIC_INDEX
-- ----------------------------
CREATE UNIQUE INDEX AOS_SYS_DIC_INDEX_UKEY
ON AOS_SYS_DIC_INDEX (KEY_ ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_SYS_DIC_INDEX
-- ----------------------------
ALTER TABLE AOS_SYS_DIC_INDEX ADD CHECK (ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_DIC_INDEX ADD CHECK (KEY_ IS NOT NULL);
ALTER TABLE AOS_SYS_DIC_INDEX ADD CHECK (NAME_ IS NOT NULL);
ALTER TABLE AOS_SYS_DIC_INDEX ADD CHECK (CATALOG_ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_DIC_INDEX ADD CHECK (CATALOG_CASCADE_ID_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_DIC_INDEX
-- ----------------------------
ALTER TABLE AOS_SYS_DIC_INDEX ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_SYS_ICON
-- ----------------------------
CREATE INDEX AOS_SYS_ICON_UKEY
ON AOS_SYS_ICON (NAME_ ASC, TYPE_ ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_SYS_ICON
-- ----------------------------
ALTER TABLE AOS_SYS_ICON ADD CHECK (ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_ICON ADD CHECK (NAME_ IS NOT NULL);
ALTER TABLE AOS_SYS_ICON ADD CHECK (TYPE_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_ICON
-- ----------------------------
ALTER TABLE AOS_SYS_ICON ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_SYS_MODULE
-- ----------------------------

-- ----------------------------
-- Checks structure for table AOS_SYS_MODULE
-- ----------------------------
ALTER TABLE AOS_SYS_MODULE ADD CHECK (ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_MODULE ADD CHECK (CASCADE_ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_MODULE ADD CHECK (NAME_ IS NOT NULL);
ALTER TABLE AOS_SYS_MODULE ADD CHECK (PARENT_ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_MODULE ADD CHECK (IS_LEAF_ IS NOT NULL);
ALTER TABLE AOS_SYS_MODULE ADD CHECK (IS_AUTO_EXPAND_ IS NOT NULL);
ALTER TABLE AOS_SYS_MODULE ADD CHECK (STATUS_ IS NOT NULL);
ALTER TABLE AOS_SYS_MODULE ADD CHECK (PARENT_NAME_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_MODULE
-- ----------------------------
ALTER TABLE AOS_SYS_MODULE ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_SYS_MODULE_POST
-- ----------------------------
CREATE INDEX AOS_SYS_MODULE_POST_UKEY
ON AOS_SYS_MODULE_POST (POST_ID_ ASC, MODULE_ID_ ASC, GRANT_TYPE_ ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_SYS_MODULE_POST
-- ----------------------------
ALTER TABLE AOS_SYS_MODULE_POST ADD CHECK (ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_MODULE_POST ADD CHECK (POST_ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_MODULE_POST ADD CHECK (MODULE_ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_MODULE_POST ADD CHECK (GRANT_TYPE_ IS NOT NULL);
ALTER TABLE AOS_SYS_MODULE_POST ADD CHECK (OPERATE_TIME_ IS NOT NULL);
ALTER TABLE AOS_SYS_MODULE_POST ADD CHECK (OPERATOR_ID_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_MODULE_POST
-- ----------------------------
ALTER TABLE AOS_SYS_MODULE_POST ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_SYS_MODULE_ROLE
-- ----------------------------
CREATE INDEX AOS_SYS_MOOLE_ROLE_UKEY
ON AOS_SYS_MODULE_ROLE (ROLE_ID_ ASC, MODULE_ID_ ASC, GRANT_TYPE_ ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_SYS_MODULE_ROLE
-- ----------------------------
ALTER TABLE AOS_SYS_MODULE_ROLE ADD CHECK (ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_MODULE_ROLE ADD CHECK (ROLE_ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_MODULE_ROLE ADD CHECK (MODULE_ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_MODULE_ROLE ADD CHECK (GRANT_TYPE_ IS NOT NULL);
ALTER TABLE AOS_SYS_MODULE_ROLE ADD CHECK (OPERATE_TIME_ IS NOT NULL);
ALTER TABLE AOS_SYS_MODULE_ROLE ADD CHECK (OPERATOR_ID_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_MODULE_ROLE
-- ----------------------------
ALTER TABLE AOS_SYS_MODULE_ROLE ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_SYS_MODULE_USER
-- ----------------------------
CREATE INDEX AOS_SYS_MODULE_USER_UKEY
ON AOS_SYS_MODULE_USER (USER_ID_ ASC, MODULE_ID_ ASC, GRANT_TYPE_ ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_SYS_MODULE_USER
-- ----------------------------
ALTER TABLE AOS_SYS_MODULE_USER ADD CHECK (ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_MODULE_USER ADD CHECK (USER_ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_MODULE_USER ADD CHECK (MODULE_ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_MODULE_USER ADD CHECK (GRANT_TYPE_ IS NOT NULL);
ALTER TABLE AOS_SYS_MODULE_USER ADD CHECK (OPERATE_TIME_ IS NOT NULL);
ALTER TABLE AOS_SYS_MODULE_USER ADD CHECK (OPERATOR_ID_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_MODULE_USER
-- ----------------------------
ALTER TABLE AOS_SYS_MODULE_USER ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_SYS_MODULE_USER_NAV
-- ----------------------------
CREATE INDEX AOS_SYS_MODULE_USER_NAV_UKEY
ON AOS_SYS_MODULE_USER_NAV (MODULE_ID_ ASC, USER_ID_ ASC, TYPE_ ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_SYS_MODULE_USER_NAV
-- ----------------------------
ALTER TABLE AOS_SYS_MODULE_USER_NAV ADD CHECK (ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_MODULE_USER_NAV ADD CHECK (MODULE_ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_MODULE_USER_NAV ADD CHECK (USER_ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_MODULE_USER_NAV ADD CHECK (TYPE_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_MODULE_USER_NAV
-- ----------------------------
ALTER TABLE AOS_SYS_MODULE_USER_NAV ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_SYS_ORG
-- ----------------------------

-- ----------------------------
-- Checks structure for table AOS_SYS_ORG
-- ----------------------------
ALTER TABLE AOS_SYS_ORG ADD CHECK (ID_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_ORG
-- ----------------------------
ALTER TABLE AOS_SYS_ORG ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_SYS_PAGE
-- ----------------------------

-- ----------------------------
-- Checks structure for table AOS_SYS_PAGE
-- ----------------------------
ALTER TABLE AOS_SYS_PAGE ADD CHECK (ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_PAGE ADD CHECK (MODULE_ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_PAGE ADD CHECK (TYPE_ IS NOT NULL);
ALTER TABLE AOS_SYS_PAGE ADD CHECK (ENABLED_ IS NOT NULL);
ALTER TABLE AOS_SYS_PAGE ADD CHECK (IS_DEFAULT_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_PAGE
-- ----------------------------
ALTER TABLE AOS_SYS_PAGE ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_SYS_PAGE_EL
-- ----------------------------
CREATE INDEX AOS_SYS_PAGE_EL_UKEY
ON AOS_SYS_PAGE_EL (DOM_ID_ ASC, MODULE_ID_ ASC, PAGE_ID_ ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_SYS_PAGE_EL
-- ----------------------------
ALTER TABLE AOS_SYS_PAGE_EL ADD CHECK (ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_PAGE_EL ADD CHECK (DOM_ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_PAGE_EL ADD CHECK (NAME_ IS NOT NULL);
ALTER TABLE AOS_SYS_PAGE_EL ADD CHECK (TYPE_ IS NOT NULL);
ALTER TABLE AOS_SYS_PAGE_EL ADD CHECK (MODULE_ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_PAGE_EL ADD CHECK (PAGE_ID_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_PAGE_EL
-- ----------------------------
ALTER TABLE AOS_SYS_PAGE_EL ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_SYS_PAGE_EL_GRANT
-- ----------------------------

-- ----------------------------
-- Checks structure for table AOS_SYS_PAGE_EL_GRANT
-- ----------------------------
ALTER TABLE AOS_SYS_PAGE_EL_GRANT ADD CHECK (ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_PAGE_EL_GRANT ADD CHECK (EL_ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_PAGE_EL_GRANT ADD CHECK (GRANT_TYPE_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_PAGE_EL_GRANT
-- ----------------------------
ALTER TABLE AOS_SYS_PAGE_EL_GRANT ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_SYS_PARAM
-- ----------------------------
CREATE UNIQUE INDEX AOS_SYS_PARAM_UKEY
ON AOS_SYS_PARAM (KEY_ ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_SYS_PARAM
-- ----------------------------
ALTER TABLE AOS_SYS_PARAM ADD CHECK (ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_PARAM ADD CHECK (KEY_ IS NOT NULL);
ALTER TABLE AOS_SYS_PARAM ADD CHECK (CATALOG_ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_PARAM ADD CHECK (CATALOG_CASCADE_ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_PARAM ADD CHECK (NAME_ IS NOT NULL);
ALTER TABLE AOS_SYS_PARAM ADD CHECK (IS_OVERWRITE_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_PARAM
-- ----------------------------
ALTER TABLE AOS_SYS_PARAM ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_SYS_POST
-- ----------------------------

-- ----------------------------
-- Checks structure for table AOS_SYS_POST
-- ----------------------------
ALTER TABLE AOS_SYS_POST ADD CHECK (ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_POST ADD CHECK (NAME_ IS NOT NULL);
ALTER TABLE AOS_SYS_POST ADD CHECK (STATUS_ IS NOT NULL);
ALTER TABLE AOS_SYS_POST ADD CHECK (TYPE_ IS NOT NULL);
ALTER TABLE AOS_SYS_POST ADD CHECK (ORG_ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_POST ADD CHECK (CREATE_TIME_ IS NOT NULL);
ALTER TABLE AOS_SYS_POST ADD CHECK (CREATER_ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_POST ADD CHECK (ORG_CASCADE_ID_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_POST
-- ----------------------------
ALTER TABLE AOS_SYS_POST ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_SYS_ROLE
-- ----------------------------

-- ----------------------------
-- Checks structure for table AOS_SYS_ROLE
-- ----------------------------
ALTER TABLE AOS_SYS_ROLE ADD CHECK (ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_ROLE ADD CHECK (NAME_ IS NOT NULL);
ALTER TABLE AOS_SYS_ROLE ADD CHECK (STATUS_ IS NOT NULL);
ALTER TABLE AOS_SYS_ROLE ADD CHECK (TYPE_ IS NOT NULL);
ALTER TABLE AOS_SYS_ROLE ADD CHECK (CREATE_TIME_ IS NOT NULL);
ALTER TABLE AOS_SYS_ROLE ADD CHECK (CREATER_ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_ROLE ADD CHECK (CREATER_ORG_ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_ROLE ADD CHECK (CREATER_ORG_CASCADE_ID_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_ROLE
-- ----------------------------
ALTER TABLE AOS_SYS_ROLE ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_SYS_SEQUENCE
-- ----------------------------
CREATE UNIQUE INDEX AOS_SYS_SEQUENCE_UKEY
ON AOS_SYS_SEQUENCE (NAME_ ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_SYS_SEQUENCE
-- ----------------------------
ALTER TABLE AOS_SYS_SEQUENCE ADD CHECK (ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_SEQUENCE ADD CHECK (NAME_ IS NOT NULL);
ALTER TABLE AOS_SYS_SEQUENCE ADD CHECK (STATUS_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_SEQUENCE
-- ----------------------------
ALTER TABLE AOS_SYS_SEQUENCE ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_SYS_USER
-- ----------------------------

-- ----------------------------
-- Checks structure for table AOS_SYS_USER
-- ----------------------------
ALTER TABLE AOS_SYS_USER ADD CHECK (ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_USER ADD CHECK (ACCOUNT_ IS NOT NULL);
ALTER TABLE AOS_SYS_USER ADD CHECK (PASSWORD_ IS NOT NULL);
ALTER TABLE AOS_SYS_USER ADD CHECK (NAME_ IS NOT NULL);
ALTER TABLE AOS_SYS_USER ADD CHECK (SEX_ IS NOT NULL);
ALTER TABLE AOS_SYS_USER ADD CHECK (ORG_ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_USER ADD CHECK (STATUS_ IS NOT NULL);
ALTER TABLE AOS_SYS_USER ADD CHECK (TYPE_ IS NOT NULL);
ALTER TABLE AOS_SYS_USER ADD CHECK (CREATE_TIME_ IS NOT NULL);
ALTER TABLE AOS_SYS_USER ADD CHECK (CREATER_ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_USER ADD CHECK (ORG_CASCADE_ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_USER ADD CHECK (DELETE_FLAG_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_USER
-- ----------------------------
ALTER TABLE AOS_SYS_USER ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_SYS_USER_CFG
-- ----------------------------

-- ----------------------------
-- Checks structure for table AOS_SYS_USER_CFG
-- ----------------------------
ALTER TABLE AOS_SYS_USER_CFG ADD CHECK (ID_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_USER_CFG
-- ----------------------------
ALTER TABLE AOS_SYS_USER_CFG ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_SYS_USER_EXT
-- ----------------------------

-- ----------------------------
-- Checks structure for table AOS_SYS_USER_EXT
-- ----------------------------
ALTER TABLE AOS_SYS_USER_EXT ADD CHECK (ID_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_USER_EXT
-- ----------------------------
ALTER TABLE AOS_SYS_USER_EXT ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_SYS_USER_POST
-- ----------------------------
CREATE INDEX AOS_SYS_USER_POST_UKEY
ON AOS_SYS_USER_POST (USER_ID_ ASC, POST_ID_ ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_SYS_USER_POST
-- ----------------------------
ALTER TABLE AOS_SYS_USER_POST ADD CHECK (ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_USER_POST ADD CHECK (USER_ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_USER_POST ADD CHECK (POST_ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_USER_POST ADD CHECK (OPERATE_TIME_ IS NOT NULL);
ALTER TABLE AOS_SYS_USER_POST ADD CHECK (OPERATOR_ID_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_USER_POST
-- ----------------------------
ALTER TABLE AOS_SYS_USER_POST ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_SYS_USER_ROLE
-- ----------------------------
CREATE INDEX AOS_SYS_USER_ROLE_UKEY
ON AOS_SYS_USER_ROLE (USER_ID_ ASC, ROLE_ID_ ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_SYS_USER_ROLE
-- ----------------------------
ALTER TABLE AOS_SYS_USER_ROLE ADD CHECK (ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_USER_ROLE ADD CHECK (USER_ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_USER_ROLE ADD CHECK (ROLE_ID_ IS NOT NULL);
ALTER TABLE AOS_SYS_USER_ROLE ADD CHECK (OPERATE_TIME_ IS NOT NULL);
ALTER TABLE AOS_SYS_USER_ROLE ADD CHECK (OPERATOR_ID_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_SYS_USER_ROLE
-- ----------------------------
ALTER TABLE AOS_SYS_USER_ROLE ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_WF_EVT_LOG
-- ----------------------------

-- ----------------------------
-- Checks structure for table AOS_WF_EVT_LOG
-- ----------------------------
ALTER TABLE AOS_WF_EVT_LOG ADD CHECK (LOG_NR_ IS NOT NULL);
ALTER TABLE AOS_WF_EVT_LOG ADD CHECK (TIME_STAMP_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_WF_EVT_LOG
-- ----------------------------
ALTER TABLE AOS_WF_EVT_LOG ADD PRIMARY KEY (LOG_NR_);

-- ----------------------------
-- Indexes structure for table AOS_WF_GE_BYTEARRAY
-- ----------------------------
CREATE INDEX ACT_IDX_BYTEAR_DEPL
ON AOS_WF_GE_BYTEARRAY (DEPLOYMENT_ID_ ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_WF_GE_BYTEARRAY
-- ----------------------------
ALTER TABLE AOS_WF_GE_BYTEARRAY ADD CHECK (ID_ IS NOT NULL);
ALTER TABLE AOS_WF_GE_BYTEARRAY ADD CHECK (GENERATED_ IN (1,0));

-- ----------------------------
-- Primary Key structure for table AOS_WF_GE_BYTEARRAY
-- ----------------------------
ALTER TABLE AOS_WF_GE_BYTEARRAY ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_WF_GE_PROPERTY
-- ----------------------------

-- ----------------------------
-- Checks structure for table AOS_WF_GE_PROPERTY
-- ----------------------------
ALTER TABLE AOS_WF_GE_PROPERTY ADD CHECK (NAME_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_WF_GE_PROPERTY
-- ----------------------------
ALTER TABLE AOS_WF_GE_PROPERTY ADD PRIMARY KEY (NAME_);

-- ----------------------------
-- Indexes structure for table AOS_WF_HI_ACTINST
-- ----------------------------
CREATE INDEX ACT_IDX_HI_ACT_INST_END
ON AOS_WF_HI_ACTINST (END_TIME_ ASC)
LOGGING;
CREATE INDEX ACT_IDX_HI_ACT_INST_EXEC
ON AOS_WF_HI_ACTINST (EXECUTION_ID_ ASC, ACT_ID_ ASC)
LOGGING;
CREATE INDEX ACT_IDX_HI_ACT_INST_PROCINST
ON AOS_WF_HI_ACTINST (PROC_INST_ID_ ASC, ACT_ID_ ASC)
LOGGING;
CREATE INDEX ACT_IDX_HI_ACT_INST_START
ON AOS_WF_HI_ACTINST (START_TIME_ ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_WF_HI_ACTINST
-- ----------------------------
ALTER TABLE AOS_WF_HI_ACTINST ADD CHECK (ID_ IS NOT NULL);
ALTER TABLE AOS_WF_HI_ACTINST ADD CHECK (PROC_DEF_ID_ IS NOT NULL);
ALTER TABLE AOS_WF_HI_ACTINST ADD CHECK (PROC_INST_ID_ IS NOT NULL);
ALTER TABLE AOS_WF_HI_ACTINST ADD CHECK (EXECUTION_ID_ IS NOT NULL);
ALTER TABLE AOS_WF_HI_ACTINST ADD CHECK (ACT_ID_ IS NOT NULL);
ALTER TABLE AOS_WF_HI_ACTINST ADD CHECK (ACT_TYPE_ IS NOT NULL);
ALTER TABLE AOS_WF_HI_ACTINST ADD CHECK (START_TIME_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_WF_HI_ACTINST
-- ----------------------------
ALTER TABLE AOS_WF_HI_ACTINST ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_WF_HI_ATTACHMENT
-- ----------------------------

-- ----------------------------
-- Checks structure for table AOS_WF_HI_ATTACHMENT
-- ----------------------------
ALTER TABLE AOS_WF_HI_ATTACHMENT ADD CHECK (ID_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_WF_HI_ATTACHMENT
-- ----------------------------
ALTER TABLE AOS_WF_HI_ATTACHMENT ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_WF_HI_COMMENT
-- ----------------------------

-- ----------------------------
-- Checks structure for table AOS_WF_HI_COMMENT
-- ----------------------------
ALTER TABLE AOS_WF_HI_COMMENT ADD CHECK (ID_ IS NOT NULL);
ALTER TABLE AOS_WF_HI_COMMENT ADD CHECK (TIME_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_WF_HI_COMMENT
-- ----------------------------
ALTER TABLE AOS_WF_HI_COMMENT ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_WF_HI_DETAIL
-- ----------------------------
CREATE INDEX ACT_IDX_HI_DETAIL_ACT_INST
ON AOS_WF_HI_DETAIL (ACT_INST_ID_ ASC)
LOGGING;
CREATE INDEX ACT_IDX_HI_DETAIL_NAME
ON AOS_WF_HI_DETAIL (NAME_ ASC)
LOGGING;
CREATE INDEX ACT_IDX_HI_DETAIL_PROC_INST
ON AOS_WF_HI_DETAIL (PROC_INST_ID_ ASC)
LOGGING;
CREATE INDEX ACT_IDX_HI_DETAIL_TASK_ID
ON AOS_WF_HI_DETAIL (TASK_ID_ ASC)
LOGGING;
CREATE INDEX ACT_IDX_HI_DETAIL_TIME
ON AOS_WF_HI_DETAIL (TIME_ ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_WF_HI_DETAIL
-- ----------------------------
ALTER TABLE AOS_WF_HI_DETAIL ADD CHECK (ID_ IS NOT NULL);
ALTER TABLE AOS_WF_HI_DETAIL ADD CHECK (TYPE_ IS NOT NULL);
ALTER TABLE AOS_WF_HI_DETAIL ADD CHECK (NAME_ IS NOT NULL);
ALTER TABLE AOS_WF_HI_DETAIL ADD CHECK (TIME_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_WF_HI_DETAIL
-- ----------------------------
ALTER TABLE AOS_WF_HI_DETAIL ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_WF_HI_IDENTITYLINK
-- ----------------------------
CREATE INDEX ACT_IDX_HI_IDENT_LNK_PROCINST
ON AOS_WF_HI_IDENTITYLINK (PROC_INST_ID_ ASC)
LOGGING;
CREATE INDEX ACT_IDX_HI_IDENT_LNK_TASK
ON AOS_WF_HI_IDENTITYLINK (TASK_ID_ ASC)
LOGGING;
CREATE INDEX ACT_IDX_HI_IDENT_LNK_USER
ON AOS_WF_HI_IDENTITYLINK (USER_ID_ ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_WF_HI_IDENTITYLINK
-- ----------------------------
ALTER TABLE AOS_WF_HI_IDENTITYLINK ADD CHECK (ID_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_WF_HI_IDENTITYLINK
-- ----------------------------
ALTER TABLE AOS_WF_HI_IDENTITYLINK ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_WF_HI_PROCINST
-- ----------------------------
CREATE INDEX ACT_IDX_HI_PRO_INST_END
ON AOS_WF_HI_PROCINST (END_TIME_ ASC)
LOGGING;
CREATE INDEX ACT_IDX_HI_PRO_I_BUSKEY
ON AOS_WF_HI_PROCINST (BUSINESS_KEY_ ASC)
LOGGING;

-- ----------------------------
-- Uniques structure for table AOS_WF_HI_PROCINST
-- ----------------------------
ALTER TABLE AOS_WF_HI_PROCINST ADD UNIQUE (PROC_INST_ID_);

-- ----------------------------
-- Checks structure for table AOS_WF_HI_PROCINST
-- ----------------------------
ALTER TABLE AOS_WF_HI_PROCINST ADD CHECK (ID_ IS NOT NULL);
ALTER TABLE AOS_WF_HI_PROCINST ADD CHECK (PROC_INST_ID_ IS NOT NULL);
ALTER TABLE AOS_WF_HI_PROCINST ADD CHECK (PROC_DEF_ID_ IS NOT NULL);
ALTER TABLE AOS_WF_HI_PROCINST ADD CHECK (START_TIME_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_WF_HI_PROCINST
-- ----------------------------
ALTER TABLE AOS_WF_HI_PROCINST ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_WF_HI_TASKINST
-- ----------------------------
CREATE INDEX ACT_IDX_HI_TASK_INST_PROCINST
ON AOS_WF_HI_TASKINST (PROC_INST_ID_ ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_WF_HI_TASKINST
-- ----------------------------
ALTER TABLE AOS_WF_HI_TASKINST ADD CHECK (ID_ IS NOT NULL);
ALTER TABLE AOS_WF_HI_TASKINST ADD CHECK (START_TIME_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_WF_HI_TASKINST
-- ----------------------------
ALTER TABLE AOS_WF_HI_TASKINST ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_WF_HI_VARINST
-- ----------------------------
CREATE INDEX ACT_IDX_HI_PROCVAR_NAME_TYPE
ON AOS_WF_HI_VARINST (NAME_ ASC, VAR_TYPE_ ASC)
LOGGING;
CREATE INDEX ACT_IDX_HI_PROCVAR_PROC_INST
ON AOS_WF_HI_VARINST (PROC_INST_ID_ ASC)
LOGGING;
CREATE INDEX ACT_IDX_HI_PROCVAR_TASK_ID
ON AOS_WF_HI_VARINST (TASK_ID_ ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_WF_HI_VARINST
-- ----------------------------
ALTER TABLE AOS_WF_HI_VARINST ADD CHECK (ID_ IS NOT NULL);
ALTER TABLE AOS_WF_HI_VARINST ADD CHECK (NAME_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_WF_HI_VARINST
-- ----------------------------
ALTER TABLE AOS_WF_HI_VARINST ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_WF_ID_GROUP
-- ----------------------------

-- ----------------------------
-- Checks structure for table AOS_WF_ID_GROUP
-- ----------------------------
ALTER TABLE AOS_WF_ID_GROUP ADD CHECK (ID_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_WF_ID_GROUP
-- ----------------------------
ALTER TABLE AOS_WF_ID_GROUP ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_WF_ID_INFO
-- ----------------------------

-- ----------------------------
-- Checks structure for table AOS_WF_ID_INFO
-- ----------------------------
ALTER TABLE AOS_WF_ID_INFO ADD CHECK (ID_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_WF_ID_INFO
-- ----------------------------
ALTER TABLE AOS_WF_ID_INFO ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_WF_ID_MEMBERSHIP
-- ----------------------------
CREATE INDEX ACT_IDX_MEMB_GROUP
ON AOS_WF_ID_MEMBERSHIP (GROUP_ID_ ASC)
LOGGING;
CREATE INDEX ACT_IDX_MEMB_USER
ON AOS_WF_ID_MEMBERSHIP (USER_ID_ ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_WF_ID_MEMBERSHIP
-- ----------------------------
ALTER TABLE AOS_WF_ID_MEMBERSHIP ADD CHECK (USER_ID_ IS NOT NULL);
ALTER TABLE AOS_WF_ID_MEMBERSHIP ADD CHECK (GROUP_ID_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_WF_ID_MEMBERSHIP
-- ----------------------------
ALTER TABLE AOS_WF_ID_MEMBERSHIP ADD PRIMARY KEY (USER_ID_, GROUP_ID_);

-- ----------------------------
-- Indexes structure for table AOS_WF_ID_USER
-- ----------------------------

-- ----------------------------
-- Checks structure for table AOS_WF_ID_USER
-- ----------------------------
ALTER TABLE AOS_WF_ID_USER ADD CHECK (ID_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_WF_ID_USER
-- ----------------------------
ALTER TABLE AOS_WF_ID_USER ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_WF_RE_DEPLOYMENT
-- ----------------------------

-- ----------------------------
-- Checks structure for table AOS_WF_RE_DEPLOYMENT
-- ----------------------------
ALTER TABLE AOS_WF_RE_DEPLOYMENT ADD CHECK (ID_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_WF_RE_DEPLOYMENT
-- ----------------------------
ALTER TABLE AOS_WF_RE_DEPLOYMENT ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_WF_RE_MODEL
-- ----------------------------
CREATE INDEX ACT_IDX_MODEL_DEPLOYMENT
ON AOS_WF_RE_MODEL (DEPLOYMENT_ID_ ASC)
LOGGING;
CREATE INDEX ACT_IDX_MODEL_SOURCE
ON AOS_WF_RE_MODEL (EDITOR_SOURCE_VALUE_ID_ ASC)
LOGGING;
CREATE INDEX ACT_IDX_MODEL_SOURCE_EXTRA
ON AOS_WF_RE_MODEL (EDITOR_SOURCE_EXTRA_VALUE_ID_ ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_WF_RE_MODEL
-- ----------------------------
ALTER TABLE AOS_WF_RE_MODEL ADD CHECK (ID_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_WF_RE_MODEL
-- ----------------------------
ALTER TABLE AOS_WF_RE_MODEL ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_WF_RE_PROCDEF
-- ----------------------------

-- ----------------------------
-- Uniques structure for table AOS_WF_RE_PROCDEF
-- ----------------------------
ALTER TABLE AOS_WF_RE_PROCDEF ADD UNIQUE (KEY_, VERSION_, TENANT_ID_);

-- ----------------------------
-- Checks structure for table AOS_WF_RE_PROCDEF
-- ----------------------------
ALTER TABLE AOS_WF_RE_PROCDEF ADD CHECK (ID_ IS NOT NULL);
ALTER TABLE AOS_WF_RE_PROCDEF ADD CHECK (KEY_ IS NOT NULL);
ALTER TABLE AOS_WF_RE_PROCDEF ADD CHECK (VERSION_ IS NOT NULL);
ALTER TABLE AOS_WF_RE_PROCDEF ADD CHECK (HAS_START_FORM_KEY_ IN (1,0));
ALTER TABLE AOS_WF_RE_PROCDEF ADD CHECK (HAS_GRAPHICAL_NOTATION_ IN (1,0));

-- ----------------------------
-- Primary Key structure for table AOS_WF_RE_PROCDEF
-- ----------------------------
ALTER TABLE AOS_WF_RE_PROCDEF ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_WF_RU_EVENT_SUBSCR
-- ----------------------------
CREATE INDEX ACT_IDX_EVENT_SUBSCR
ON AOS_WF_RU_EVENT_SUBSCR (EXECUTION_ID_ ASC)
LOGGING;
CREATE INDEX ACT_IDX_EVENT_SUBSCR_CONFIG_
ON AOS_WF_RU_EVENT_SUBSCR (CONFIGURATION_ ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_WF_RU_EVENT_SUBSCR
-- ----------------------------
ALTER TABLE AOS_WF_RU_EVENT_SUBSCR ADD CHECK (ID_ IS NOT NULL);
ALTER TABLE AOS_WF_RU_EVENT_SUBSCR ADD CHECK (EVENT_TYPE_ IS NOT NULL);
ALTER TABLE AOS_WF_RU_EVENT_SUBSCR ADD CHECK (CREATED_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_WF_RU_EVENT_SUBSCR
-- ----------------------------
ALTER TABLE AOS_WF_RU_EVENT_SUBSCR ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_WF_RU_EXECUTION
-- ----------------------------
CREATE INDEX ACT_IDX_EXEC_BUSKEY
ON AOS_WF_RU_EXECUTION (BUSINESS_KEY_ ASC)
LOGGING;
CREATE INDEX ACT_IDX_EXE_PARENT
ON AOS_WF_RU_EXECUTION (PARENT_ID_ ASC)
LOGGING;
CREATE INDEX ACT_IDX_EXE_PROCDEF
ON AOS_WF_RU_EXECUTION (PROC_DEF_ID_ ASC)
LOGGING;
CREATE INDEX ACT_IDX_EXE_PROCINST
ON AOS_WF_RU_EXECUTION (PROC_INST_ID_ ASC)
LOGGING;
CREATE INDEX ACT_IDX_EXE_SUPER
ON AOS_WF_RU_EXECUTION (SUPER_EXEC_ ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_WF_RU_EXECUTION
-- ----------------------------
ALTER TABLE AOS_WF_RU_EXECUTION ADD CHECK (ID_ IS NOT NULL);
ALTER TABLE AOS_WF_RU_EXECUTION ADD CHECK (IS_ACTIVE_ IN (1,0));
ALTER TABLE AOS_WF_RU_EXECUTION ADD CHECK (IS_CONCURRENT_ IN (1,0));
ALTER TABLE AOS_WF_RU_EXECUTION ADD CHECK (IS_SCOPE_ IN (1,0));
ALTER TABLE AOS_WF_RU_EXECUTION ADD CHECK (IS_EVENT_SCOPE_ IN (1,0));

-- ----------------------------
-- Primary Key structure for table AOS_WF_RU_EXECUTION
-- ----------------------------
ALTER TABLE AOS_WF_RU_EXECUTION ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_WF_RU_IDENTITYLINK
-- ----------------------------
CREATE INDEX ACT_IDX_ATHRZ_PROCEDEF
ON AOS_WF_RU_IDENTITYLINK (PROC_DEF_ID_ ASC)
LOGGING;
CREATE INDEX ACT_IDX_IDENT_LNK_GROUP
ON AOS_WF_RU_IDENTITYLINK (GROUP_ID_ ASC)
LOGGING;
CREATE INDEX ACT_IDX_IDENT_LNK_USER
ON AOS_WF_RU_IDENTITYLINK (USER_ID_ ASC)
LOGGING;
CREATE INDEX ACT_IDX_IDL_PROCINST
ON AOS_WF_RU_IDENTITYLINK (PROC_INST_ID_ ASC)
LOGGING;
CREATE INDEX ACT_IDX_TSKASS_TASK
ON AOS_WF_RU_IDENTITYLINK (TASK_ID_ ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_WF_RU_IDENTITYLINK
-- ----------------------------
ALTER TABLE AOS_WF_RU_IDENTITYLINK ADD CHECK (ID_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_WF_RU_IDENTITYLINK
-- ----------------------------
ALTER TABLE AOS_WF_RU_IDENTITYLINK ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_WF_RU_JOB
-- ----------------------------
CREATE INDEX ACT_IDX_JOB_EXCEPTION
ON AOS_WF_RU_JOB (EXCEPTION_STACK_ID_ ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_WF_RU_JOB
-- ----------------------------
ALTER TABLE AOS_WF_RU_JOB ADD CHECK (ID_ IS NOT NULL);
ALTER TABLE AOS_WF_RU_JOB ADD CHECK (TYPE_ IS NOT NULL);
ALTER TABLE AOS_WF_RU_JOB ADD CHECK (EXCLUSIVE_ IN (1,0));

-- ----------------------------
-- Primary Key structure for table AOS_WF_RU_JOB
-- ----------------------------
ALTER TABLE AOS_WF_RU_JOB ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_WF_RU_TASK
-- ----------------------------
CREATE INDEX ACT_IDX_TASK_CREATE
ON AOS_WF_RU_TASK (CREATE_TIME_ ASC)
LOGGING;
CREATE INDEX ACT_IDX_TASK_EXEC
ON AOS_WF_RU_TASK (EXECUTION_ID_ ASC)
LOGGING;
CREATE INDEX ACT_IDX_TASK_PROCDEF
ON AOS_WF_RU_TASK (PROC_DEF_ID_ ASC)
LOGGING;
CREATE INDEX ACT_IDX_TASK_PROCINST
ON AOS_WF_RU_TASK (PROC_INST_ID_ ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_WF_RU_TASK
-- ----------------------------
ALTER TABLE AOS_WF_RU_TASK ADD CHECK (ID_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_WF_RU_TASK
-- ----------------------------
ALTER TABLE AOS_WF_RU_TASK ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table AOS_WF_RU_VARIABLE
-- ----------------------------
CREATE INDEX ACT_IDX_VARIABLE_TASK_ID
ON AOS_WF_RU_VARIABLE (TASK_ID_ ASC)
LOGGING;
CREATE INDEX ACT_IDX_VAR_BYTEARRAY
ON AOS_WF_RU_VARIABLE (BYTEARRAY_ID_ ASC)
LOGGING;
CREATE INDEX ACT_IDX_VAR_EXE
ON AOS_WF_RU_VARIABLE (EXECUTION_ID_ ASC)
LOGGING;
CREATE INDEX ACT_IDX_VAR_PROCINST
ON AOS_WF_RU_VARIABLE (PROC_INST_ID_ ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AOS_WF_RU_VARIABLE
-- ----------------------------
ALTER TABLE AOS_WF_RU_VARIABLE ADD CHECK (ID_ IS NOT NULL);
ALTER TABLE AOS_WF_RU_VARIABLE ADD CHECK (TYPE_ IS NOT NULL);
ALTER TABLE AOS_WF_RU_VARIABLE ADD CHECK (NAME_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AOS_WF_RU_VARIABLE
-- ----------------------------
ALTER TABLE AOS_WF_RU_VARIABLE ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table DEMO_ACCOUNT
-- ----------------------------

-- ----------------------------
-- Checks structure for table DEMO_ACCOUNT
-- ----------------------------
ALTER TABLE DEMO_ACCOUNT ADD CHECK (ID_ IS NOT NULL);
ALTER TABLE DEMO_ACCOUNT ADD CHECK (NAME_ IS NOT NULL);
ALTER TABLE DEMO_ACCOUNT ADD CHECK (CARD_ID_ IS NOT NULL);
ALTER TABLE DEMO_ACCOUNT ADD CHECK (CARD_TYPE_ IS NOT NULL);
ALTER TABLE DEMO_ACCOUNT ADD CHECK (CREATE_TIME_ IS NOT NULL);
ALTER TABLE DEMO_ACCOUNT ADD CHECK (CREATE_USER_ID_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table DEMO_ACCOUNT
-- ----------------------------
ALTER TABLE DEMO_ACCOUNT ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Indexes structure for table DEMO_ORG
-- ----------------------------

-- ----------------------------
-- Checks structure for table DEMO_ORG
-- ----------------------------
ALTER TABLE DEMO_ORG ADD CHECK (ID_ IS NOT NULL);
ALTER TABLE DEMO_ORG ADD CHECK (PARENT_ID_ IS NOT NULL);
ALTER TABLE DEMO_ORG ADD CHECK (IS_LEAF_ IS NOT NULL);
ALTER TABLE DEMO_ORG ADD CHECK (CREATE_TIME_ IS NOT NULL);
ALTER TABLE DEMO_ORG ADD CHECK (CREATE_USER_ID_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table DEMO_ORG
-- ----------------------------
ALTER TABLE DEMO_ORG ADD PRIMARY KEY (ID_);

-- ----------------------------
-- Foreign Key structure for table AOS_WF_GE_BYTEARRAY
-- ----------------------------
ALTER TABLE AOS_WF_GE_BYTEARRAY ADD FOREIGN KEY (DEPLOYMENT_ID_) REFERENCES AOS_WF_RE_DEPLOYMENT (ID_);

-- ----------------------------
-- Foreign Key structure for table AOS_WF_ID_MEMBERSHIP
-- ----------------------------
ALTER TABLE AOS_WF_ID_MEMBERSHIP ADD FOREIGN KEY (GROUP_ID_) REFERENCES AOS_WF_ID_GROUP (ID_);
ALTER TABLE AOS_WF_ID_MEMBERSHIP ADD FOREIGN KEY (USER_ID_) REFERENCES AOS_WF_ID_USER (ID_);

-- ----------------------------
-- Foreign Key structure for table AOS_WF_RE_MODEL
-- ----------------------------
ALTER TABLE AOS_WF_RE_MODEL ADD FOREIGN KEY (DEPLOYMENT_ID_) REFERENCES AOS_WF_RE_DEPLOYMENT (ID_);
ALTER TABLE AOS_WF_RE_MODEL ADD FOREIGN KEY (EDITOR_SOURCE_VALUE_ID_) REFERENCES AOS_WF_GE_BYTEARRAY (ID_);
ALTER TABLE AOS_WF_RE_MODEL ADD FOREIGN KEY (EDITOR_SOURCE_EXTRA_VALUE_ID_) REFERENCES AOS_WF_GE_BYTEARRAY (ID_);

-- ----------------------------
-- Foreign Key structure for table AOS_WF_RU_EVENT_SUBSCR
-- ----------------------------
ALTER TABLE AOS_WF_RU_EVENT_SUBSCR ADD FOREIGN KEY (EXECUTION_ID_) REFERENCES AOS_WF_RU_EXECUTION (ID_);

-- ----------------------------
-- Foreign Key structure for table AOS_WF_RU_EXECUTION
-- ----------------------------
ALTER TABLE AOS_WF_RU_EXECUTION ADD FOREIGN KEY (PARENT_ID_) REFERENCES AOS_WF_RU_EXECUTION (ID_);
ALTER TABLE AOS_WF_RU_EXECUTION ADD FOREIGN KEY (PROC_DEF_ID_) REFERENCES AOS_WF_RE_PROCDEF (ID_);
ALTER TABLE AOS_WF_RU_EXECUTION ADD FOREIGN KEY (PROC_INST_ID_) REFERENCES AOS_WF_RU_EXECUTION (ID_);
ALTER TABLE AOS_WF_RU_EXECUTION ADD FOREIGN KEY (SUPER_EXEC_) REFERENCES AOS_WF_RU_EXECUTION (ID_);

-- ----------------------------
-- Foreign Key structure for table AOS_WF_RU_IDENTITYLINK
-- ----------------------------
ALTER TABLE AOS_WF_RU_IDENTITYLINK ADD FOREIGN KEY (PROC_DEF_ID_) REFERENCES AOS_WF_RE_PROCDEF (ID_);
ALTER TABLE AOS_WF_RU_IDENTITYLINK ADD FOREIGN KEY (PROC_INST_ID_) REFERENCES AOS_WF_RU_EXECUTION (ID_);
ALTER TABLE AOS_WF_RU_IDENTITYLINK ADD FOREIGN KEY (TASK_ID_) REFERENCES AOS_WF_RU_TASK (ID_);

-- ----------------------------
-- Foreign Key structure for table AOS_WF_RU_JOB
-- ----------------------------
ALTER TABLE AOS_WF_RU_JOB ADD FOREIGN KEY (EXCEPTION_STACK_ID_) REFERENCES AOS_WF_GE_BYTEARRAY (ID_);

-- ----------------------------
-- Foreign Key structure for table AOS_WF_RU_TASK
-- ----------------------------
ALTER TABLE AOS_WF_RU_TASK ADD FOREIGN KEY (EXECUTION_ID_) REFERENCES AOS_WF_RU_EXECUTION (ID_);
ALTER TABLE AOS_WF_RU_TASK ADD FOREIGN KEY (PROC_DEF_ID_) REFERENCES AOS_WF_RE_PROCDEF (ID_);
ALTER TABLE AOS_WF_RU_TASK ADD FOREIGN KEY (PROC_INST_ID_) REFERENCES AOS_WF_RU_EXECUTION (ID_);

-- ----------------------------
-- Foreign Key structure for table AOS_WF_RU_VARIABLE
-- ----------------------------
ALTER TABLE AOS_WF_RU_VARIABLE ADD FOREIGN KEY (BYTEARRAY_ID_) REFERENCES AOS_WF_GE_BYTEARRAY (ID_);
ALTER TABLE AOS_WF_RU_VARIABLE ADD FOREIGN KEY (EXECUTION_ID_) REFERENCES AOS_WF_RU_EXECUTION (ID_);
ALTER TABLE AOS_WF_RU_VARIABLE ADD FOREIGN KEY (PROC_INST_ID_) REFERENCES AOS_WF_RU_EXECUTION (ID_);
