/*
Navicat MySQL Data Transfer

Source Server         : mysql-local
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : aos

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2016-02-16 17:41:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for aos_log_session
-- ----------------------------
DROP TABLE IF EXISTS `aos_log_session`;
CREATE TABLE `aos_log_session` (
  `id_` varchar(64) NOT NULL COMMENT '会话ID',
  `user_id_` varchar(64) NOT NULL COMMENT '用户ID',
  `account_` varchar(255) NOT NULL COMMENT '登录账户',
  `user_name_` varchar(255) NOT NULL COMMENT '用户姓名',
  `ip_address_` varchar(255) default NULL COMMENT '客户端IP地址',
  `client_type_` varchar(255) default NULL COMMENT '客户端类型',
  `owner_` varchar(255) default NULL COMMENT '宿主',
  `create_time_` datetime NOT NULL COMMENT '登录时间',
  PRIMARY KEY  (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会话日志信息表';

-- ----------------------------
-- Records of aos_log_session
-- ----------------------------

-- ----------------------------
-- Table structure for aos_sys_catalog
-- ----------------------------
DROP TABLE IF EXISTS `aos_sys_catalog`;
CREATE TABLE `aos_sys_catalog` (
  `id_` varchar(64) NOT NULL COMMENT '流水号',
  `cascade_id_` varchar(255) NOT NULL COMMENT '节点语义ID',
  `root_key_` varchar(255) NOT NULL COMMENT '科目标识键',
  `root_name_` varchar(255) NOT NULL COMMENT '科目名称',
  `name_` varchar(255) NOT NULL COMMENT '分类名称',
  `hotkey_` varchar(255) default NULL COMMENT '热键',
  `parent_id_` varchar(64) NOT NULL COMMENT '父节点流水号',
  `is_leaf_` varchar(255) NOT NULL default '1' COMMENT '是否叶子节点',
  `is_auto_expand_` varchar(255) NOT NULL default '0' COMMENT '是否自动展开',
  `icon_name_` varchar(255) default NULL COMMENT '图标文件名称',
  `sort_no_` int(10) default NULL COMMENT '排序号',
  PRIMARY KEY  (`id_`),
  UNIQUE KEY `aos_sys_catalog_ukey` USING BTREE (`cascade_id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of aos_sys_catalog
-- ----------------------------
INSERT INTO `aos_sys_catalog` VALUES ('01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', 'PARAM_TYPE', '参数分类科目', '其它', null, '4018f65de18043c899b5e21ce7328df7', '1', '0', 'icon150.png', '9');
INSERT INTO `aos_sys_catalog` VALUES ('21d03054afdf43d69972cf6f7db6cfa3', '0.002', 'DIC_TYPE', '词典分类科目', '数据字典分类', null, '0', '0', '0', 'book.png', '2');
INSERT INTO `aos_sys_catalog` VALUES ('38368661c53c40b6824869a0ccffad05', '0.002.001.001', 'DIC_TYPE', '词典分类科目', '工作流', null, '4018a2217b0542059a26ecf3f605d60f', '1', '0', 'folder6.png', '1');
INSERT INTO `aos_sys_catalog` VALUES ('4018a2217b0542059a26ecf3f605d60f', '0.002.001', 'DIC_TYPE', '词典分类科目', '系统管理', null, '21d03054afdf43d69972cf6f7db6cfa3', '0', '1', 'folder22.png', '2');
INSERT INTO `aos_sys_catalog` VALUES ('4018f65de18043c899b5e21ce7328df7', '0.001.002', 'PARAM_TYPE', '参数分类科目', '系统参数', null, 'cd14928a239b448b867c2e45246cd038', '0', '1', 'folder22.png', '1');
INSERT INTO `aos_sys_catalog` VALUES ('4ee1d6e48b31487b849a72cd03d2512a', '0.001.001', 'PARAM_TYPE', '参数分类科目', '业务参数', null, 'cd14928a239b448b867c2e45246cd038', '1', '0', 'user20.png', '2');
INSERT INTO `aos_sys_catalog` VALUES ('6f94ef4ac17d4d098f91f0a4579f8591', '0.001.002.001', 'PARAM_TYPE', '参数分类科目', '验证码', null, '4018f65de18043c899b5e21ce7328df7', '1', '0', 'ok3.png', '2');
INSERT INTO `aos_sys_catalog` VALUES ('8d6c9869e8b2427cb16cf3f4777bf236', '0.002.007', 'DIC_TYPE', '词典分类科目', '范例', '', '21d03054afdf43d69972cf6f7db6cfa3', '1', '0', 'folder11.png', '10');
INSERT INTO `aos_sys_catalog` VALUES ('a072411787f545edb7e7c3c23fa6c0ff', '0.001.002.004', 'PARAM_TYPE', '参数分类科目', '导航与菜单', null, '4018f65de18043c899b5e21ce7328df7', '1', '0', 'icon152.png', '3');
INSERT INTO `aos_sys_catalog` VALUES ('aa3082ab67e24d8b884bc4504d3d9945', '0.002.002', 'DIC_TYPE', '词典分类科目', '全局通用', null, '21d03054afdf43d69972cf6f7db6cfa3', '1', '0', 'folder24.png', '3');
INSERT INTO `aos_sys_catalog` VALUES ('c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', 'DIC_TYPE', '词典分类科目', '平台配置', null, '21d03054afdf43d69972cf6f7db6cfa3', '1', '0', 'folder2.png', '1');
INSERT INTO `aos_sys_catalog` VALUES ('cd14928a239b448b867c2e45246cd038', '0.001', 'PARAM_TYPE', '参数分类科目', '参数分类', null, '0', '0', '0', 'book.png', '1');
INSERT INTO `aos_sys_catalog` VALUES ('f22f39171b484d81a604d3eb50b33584', '0.001.002.002', 'PARAM_TYPE', '参数分类科目', '界面显示', null, '4018f65de18043c899b5e21ce7328df7', '1', '0', 'icon59.png', '1');

-- ----------------------------
-- Table structure for aos_sys_dic
-- ----------------------------
DROP TABLE IF EXISTS `aos_sys_dic`;
CREATE TABLE `aos_sys_dic` (
  `id_` varchar(64) NOT NULL COMMENT '流水号',
  `code_` varchar(255) NOT NULL COMMENT '字典对照码',
  `desc_` varchar(255) NOT NULL COMMENT '字典对照值',
  `hotkey_` varchar(255) default NULL COMMENT ' 热键',
  `status_` varchar(255) NOT NULL default '1' COMMENT '当前状态',
  `dic_index_id_` varchar(64) NOT NULL COMMENT '所属字典流水号',
  `remark_` varchar(4000) default NULL COMMENT '备注',
  PRIMARY KEY  (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典明细表';

-- ----------------------------
-- Records of aos_sys_dic
-- ----------------------------
INSERT INTO `aos_sys_dic` VALUES ('040e1d4d8a914145884553f170e1bcfd', '1', '缺省', null, '1', 'cfcbc48fd8ad42678a52334bac8aa299', null);
INSERT INTO `aos_sys_dic` VALUES ('040fbde5cca746e7a90a9f888c033897', '4', '只读', null, '1', '2794338c8b4946b99c361dae80da71b1', null);
INSERT INTO `aos_sys_dic` VALUES ('045e7dce267b4ef3b098ca00030220bf', '2', '金卡', null, '1', '2724924f1cdd48d1aa1a84cb7dd9b3ee', null);
INSERT INTO `aos_sys_dic` VALUES ('074c63e541174ed0b7c71588936ae453', '1', '平铺', null, '1', 'ffc94f2b7ad14c78b14c46f8fab17543', null);
INSERT INTO `aos_sys_dic` VALUES ('075a268cd7e14a728ca841e769b9d5a6', '1', '缺省', null, '1', '79004d064e954e55b832a8a9a4332576', null);
INSERT INTO `aos_sys_dic` VALUES ('0825b66058c14bc5bfacdba1fd055af4', '2', '浮动菜单', null, '1', 'a9fd5aa3b7654326902a94e70bccedd8', '欢迎页显示的Mac风格的浮动菜单');
INSERT INTO `aos_sys_dic` VALUES ('0ccc4a6e3df246d8bbd3ccb1d29eb4c4', '0', '停用', null, '1', '10a113b1dd6d492dad27c8b0a0fb7efc', null);
INSERT INTO `aos_sys_dic` VALUES ('0ee3e8b931374725b213150b021507cc', 'catalog', 'aos', null, '1', '2d977e97aacf4781836bac9f5e88ad2b', '数据库名/实例名');
INSERT INTO `aos_sys_dic` VALUES ('15f728ef5143444f9bfafa1c5c8a6a3b', '3', '隐藏', null, '1', '2794338c8b4946b99c361dae80da71b1', null);
INSERT INTO `aos_sys_dic` VALUES ('1722aa532c4044ac8087579feac85f7f', 'neptune', 'neptune.png', null, '1', 'e9e9cfc195514b05890a2249b81dfe73', null);
INSERT INTO `aos_sys_dic` VALUES ('17b249a462e7409baa99f36057fa79e7', '1', '是', null, '1', '91bc8a695b744b27ba66a94561fd6dbc', '');
INSERT INTO `aos_sys_dic` VALUES ('1915d507f36d4ae688267ebca838d39f', 'blue', '#3399FF', null, '1', '61fd319a23b04bd1bdbce7037002976a', null);
INSERT INTO `aos_sys_dic` VALUES ('1bb70ce5d6e649fd9179f3a3d35367f9', 'blue', 'left-logo.png', null, '1', 'fa8097dd670643f9a03722c4074ecba5', null);
INSERT INTO `aos_sys_dic` VALUES ('1c2ebffd1b48420999ff57e2ec325270', '3', '未知', null, '1', 'f59d8693d8cf4f10850914e09ae9b93c', '');
INSERT INTO `aos_sys_dic` VALUES ('1deee1b367ae4ccb81226a86eb7d9675', '1', '普卡', null, '1', '2724924f1cdd48d1aa1a84cb7dd9b3ee', null);
INSERT INTO `aos_sys_dic` VALUES ('1fb134407f364baf8b857235c7828059', '2', '停用', null, '1', '0744eedeaaa143afa499254866aa75c9', null);
INSERT INTO `aos_sys_dic` VALUES ('226489afb7ab4cf69107a78c60ed2267', 'PENDING', '代理中', null, '1', 'c66f06c069224241a4785e77d1406f9c', null);
INSERT INTO `aos_sys_dic` VALUES ('23910ad1f9684644b214ff99209e94d4', '3', '关联页面', null, '1', '38841cd4f85f4ffb8c07c74650a130dc', '主页面上跳转出去的页面');
INSERT INTO `aos_sys_dic` VALUES ('23a410439cf7459799c286745b123293', '1', '激活', null, '1', '2c90ab6212f44b08a1d8ed527c72795f', null);
INSERT INTO `aos_sys_dic` VALUES ('24bca6d79bb14b5f97fbddbe5219705b', '1', '按钮|菜单下拉项', null, '1', '7d048854ccdc4eab996dcb703722065b', null);
INSERT INTO `aos_sys_dic` VALUES ('27689b76c3cf4168a7efb737806e9ed7', '2', '已结束', null, '1', 'a06eb2af650444db903c945030334b12', null);
INSERT INTO `aos_sys_dic` VALUES ('29462076b88f4facb86f7647c04119d0', '2', '子页面', null, '1', '38841cd4f85f4ffb8c07c74650a130dc', '在主页面上的子导航打开的页面(内嵌式的)');
INSERT INTO `aos_sys_dic` VALUES ('2a5d03f79fd64c2090c9847d1b1484f0', '3', '待签收', null, '1', '48062fd856f14794b03ceba2a1d6b60e', null);
INSERT INTO `aos_sys_dic` VALUES ('2bd5fc7756d74fe59f5b9372fd83d03c', '4', '分割符', null, '1', '38841cd4f85f4ffb8c07c74650a130dc', '子页面生成的二级导航菜单的分割符标识');
INSERT INTO `aos_sys_dic` VALUES ('2ce972620b1d484e880ae17113f4cf05', 'tight', '组合按钮', null, '1', 'a19ac2af964c4a6e8af9c6f1c0d2673f', null);
INSERT INTO `aos_sys_dic` VALUES ('2e2ef7ebcd5449a1a1b593f63ddb17ba', '3', '管理员封锁', null, '1', '0744eedeaaa143afa499254866aa75c9', null);
INSERT INTO `aos_sys_dic` VALUES ('2ef4d36610334dc6bc9bd153be594da2', '3', 'DBSequence', null, '1', '2a9ac1749d224bef924cd258bf35254a', null);
INSERT INTO `aos_sys_dic` VALUES ('2f9994a32b3e4afd96420c180155065a', '3', '矢量图标', null, '1', '21136c3dc660464d92fccd66408e149b', null);
INSERT INTO `aos_sys_dic` VALUES ('3058d4cd6c514d23a27eee77b140a349', 'aos', 'left-logo.png', null, '1', 'fa8097dd670643f9a03722c4074ecba5', null);
INSERT INTO `aos_sys_dic` VALUES ('338541a1b2094ea5a0e51ce81f9012de', 'port', '3306', null, '1', '2d977e97aacf4781836bac9f5e88ad2b', '数据库主机端口');
INSERT INTO `aos_sys_dic` VALUES ('37a243f7cb96413386c3ea781051244e', '3', '工作组', null, '1', '58b28eade8604dffa7c531b7b42af2fa', null);
INSERT INTO `aos_sys_dic` VALUES ('37d2d28ac8104f6481997b640c5d4fd0', '4', '其它', null, '1', '58b28eade8604dffa7c531b7b42af2fa', null);
INSERT INTO `aos_sys_dic` VALUES ('3a4466b864744a0da3b93eec3f24dfff', 'blue', '天蓝', null, '1', '3ba3a682c2ac4d52982411dd045fae32', null);
INSERT INTO `aos_sys_dic` VALUES ('3c56f07c48b746698591068c308064a7', 'gray', '银灰', null, '1', '3ba3a682c2ac4d52982411dd045fae32', null);
INSERT INTO `aos_sys_dic` VALUES ('3f1b50a0f5be46a69597fca95c1e82d7', '2', '大图标[64X64]', null, '1', '21136c3dc660464d92fccd66408e149b', null);
INSERT INTO `aos_sys_dic` VALUES ('4113d10127a34b4fa88b2d6b118accf0', '0', '否', null, '1', '91bc8a695b744b27ba66a94561fd6dbc', null);
INSERT INTO `aos_sys_dic` VALUES ('462d4322dd6c408c8d2dfa1241c209f6', '2', '挂起', null, '1', '2c90ab6212f44b08a1d8ed527c72795f', null);
INSERT INTO `aos_sys_dic` VALUES ('4ae7b6f7d54a4236ba9b18a9e05d7fb4', '4', '容器组件(窗口|面板|树|表格|工具栏等)', null, '1', '7d048854ccdc4eab996dcb703722065b', null);
INSERT INTO `aos_sys_dic` VALUES ('4af1d58e374149f38c5ae9f76674a79f', 'aos', '#FAFAFA', null, '1', '61fd319a23b04bd1bdbce7037002976a', null);
INSERT INTO `aos_sys_dic` VALUES ('4c5816e8db1c4f0995fbeb7a1b840685', '1', '主页面', null, '1', '38841cd4f85f4ffb8c07c74650a130dc', '点击主导航菜单打开的页面');
INSERT INTO `aos_sys_dic` VALUES ('569b3bab75734c628a9bb0b3fbcd8922', '2', '显示', null, '1', '2794338c8b4946b99c361dae80da71b1', null);
INSERT INTO `aos_sys_dic` VALUES ('58195ff7a3084df2a2dd5b401aa29a77', '0', '系统导航', null, '1', '4c2a12d3890a449fa91521a29a3c2436', null);
INSERT INTO `aos_sys_dic` VALUES ('58fc07abcfdc46478ad14fb9d95214f6', 'dataBaseType', 'mysql', null, '1', '2d977e97aacf4781836bac9f5e88ad2b', '可选值：mysql、oracle、microsoft sql server、postgresql。');
INSERT INTO `aos_sys_dic` VALUES ('5a53887315f7450e96816c1a46dc5b5e', '2', '项目组', null, '1', '58b28eade8604dffa7c531b7b42af2fa', null);
INSERT INTO `aos_sys_dic` VALUES ('5c4196e15f47466ea19137666e455504', 'neptune', 'left-logo.png', null, '1', 'fa8097dd670643f9a03722c4074ecba5', null);
INSERT INTO `aos_sys_dic` VALUES ('5dd1c5a1610544b490af86cc826e3663', '2', '表格列', null, '1', '7d048854ccdc4eab996dcb703722065b', null);
INSERT INTO `aos_sys_dic` VALUES ('5de14be720b546ebb9676db86cdc5f6c', '2', '女', null, '1', 'f59d8693d8cf4f10850914e09ae9b93c', null);
INSERT INTO `aos_sys_dic` VALUES ('5dfc1a71df524cd68311a95e7176cab7', 'gray', '#BCB0B0', null, '1', '1ec5d3c945de40469595c85955196e76', null);
INSERT INTO `aos_sys_dic` VALUES ('6a05b8c8ce244c3f9b4872f812c689ec', '1', '经办权限', null, '1', 'dd9f74d16be14db5b0f6d79720c8f177', null);
INSERT INTO `aos_sys_dic` VALUES ('6c575847953847ceb7d4675e94d78547', 'aos', '#99bce8', null, '1', '1ec5d3c945de40469595c85955196e76', null);
INSERT INTO `aos_sys_dic` VALUES ('6e018ced3ae046de93d74630a97361a1', 'aos', '#006699', null, '1', '54e48c66b3ef4d99823ca8217a2abf43', null);
INSERT INTO `aos_sys_dic` VALUES ('735edf2e8a1242078141405d344d3c84', '1', '未授权', null, '1', '2794338c8b4946b99c361dae80da71b1', null);
INSERT INTO `aos_sys_dic` VALUES ('786d09295c904608868807b9e08238ee', 'neptune', '#c0c0c0', null, '1', '1ec5d3c945de40469595c85955196e76', null);
INSERT INTO `aos_sys_dic` VALUES ('7b6226ba4b6b404bab3cc520d5c1e6b5', 'neptune', '海王星(水蓝)', null, '1', '3ba3a682c2ac4d52982411dd045fae32', null);
INSERT INTO `aos_sys_dic` VALUES ('84552cfdf36f4fee92d81a49340495ca', 'blue', '#DFE8F6', null, '1', '3146aefcb39344cebe6e0a9baa7a4a48', null);
INSERT INTO `aos_sys_dic` VALUES ('84ee7e35ab134ec1acd2cfd28d3915f6', 'standalone', '独立按钮', null, '1', 'a19ac2af964c4a6e8af9c6f1c0d2673f', null);
INSERT INTO `aos_sys_dic` VALUES ('85f5017c1860434eacfceb519b8ad8cd', 'blue', 'blue.png', null, '1', 'e9e9cfc195514b05890a2249b81dfe73', null);
INSERT INTO `aos_sys_dic` VALUES ('867c0aacba654feea60c22c5e4be9368', 'aos', 'red', null, '1', '3146aefcb39344cebe6e0a9baa7a4a48', null);
INSERT INTO `aos_sys_dic` VALUES ('871d7ac8ec704614a15d29f540b8b439', 'true', '显示', null, '1', '33a73af4b729448b91c13acf4d0a31e1', null);
INSERT INTO `aos_sys_dic` VALUES ('87923302cb424da9aa55b6a9ce77090b', '7', '激活', null, '1', '2794338c8b4946b99c361dae80da71b1', null);
INSERT INTO `aos_sys_dic` VALUES ('89f8ab9369a64de09a8207829f520297', 'gray', 'gray.png', null, '1', 'e9e9cfc195514b05890a2249b81dfe73', null);
INSERT INTO `aos_sys_dic` VALUES ('8b536d0c9a2e4e80b1edf91190b98253', '5', '编辑', null, '1', '2794338c8b4946b99c361dae80da71b1', null);
INSERT INTO `aos_sys_dic` VALUES ('8da661446e6d4e9cb49d2eb5ab225cd0', '2', '树状', null, '1', 'ffc94f2b7ad14c78b14c46f8fab17543', null);
INSERT INTO `aos_sys_dic` VALUES ('8e42e7df7bd044b89c7a5d5b59b44b18', '1', '男', null, '1', 'f59d8693d8cf4f10850914e09ae9b93c', null);
INSERT INTO `aos_sys_dic` VALUES ('92dfd82860a0474da735575e9b91f6de', 'classic', '经典主题', null, '1', 'a44dd9bbf55041368882e88821309355', '上Banner-左导航-中经办。');
INSERT INTO `aos_sys_dic` VALUES ('958235d21e2f4d44babd8ae7da7dd7f8', '99', '撤消授权', null, '1', '2794338c8b4946b99c361dae80da71b1', null);
INSERT INTO `aos_sys_dic` VALUES ('99419e3ea3d64507aa507854fd210a75', '3', '表单元素(输入框|下拉框|选择框等)', null, '1', '7d048854ccdc4eab996dcb703722065b', null);
INSERT INTO `aos_sys_dic` VALUES ('9d1c5da19d0b4ad9b97b570ed4481bf2', 'false', '隐藏', null, '1', '33a73af4b729448b91c13acf4d0a31e1', null);
INSERT INTO `aos_sys_dic` VALUES ('9eb462a5fd0547b9898540b6e5a4ca98', 'gray', 'left-logo.png', null, '1', 'fa8097dd670643f9a03722c4074ecba5', null);
INSERT INTO `aos_sys_dic` VALUES ('a603159d47b94145a32b51f659b47c09', '4', '系统封锁', null, '1', '0744eedeaaa143afa499254866aa75c9', null);
INSERT INTO `aos_sys_dic` VALUES ('a63ab46c45b048b1a0d727c5f0d69f58', '3', '导入离线文件', null, '1', '483fb2ff35e84a42974e914851fae01a', null);
INSERT INTO `aos_sys_dic` VALUES ('a871329cbeb343bea48a467e05e066f5', '2', '在线克隆', null, '1', '483fb2ff35e84a42974e914851fae01a', null);
INSERT INTO `aos_sys_dic` VALUES ('a97934b734a94d70a71353bc78e572df', 'neptune', '#FAFAFA', null, '1', '61fd319a23b04bd1bdbce7037002976a', null);
INSERT INTO `aos_sys_dic` VALUES ('a9bef6122ad7444999ce17b4ad5a0628', '2', '发现', null, '1', '4c2a12d3890a449fa91521a29a3c2436', null);
INSERT INTO `aos_sys_dic` VALUES ('ac8049fc0ded42b09a3654ef547ac772', '1', '小图标[16X16]', null, '1', '21136c3dc660464d92fccd66408e149b', null);
INSERT INTO `aos_sys_dic` VALUES ('b18435d1752a4a8c96628402298c0493', 'gray', '#555555', null, '1', '61fd319a23b04bd1bdbce7037002976a', null);
INSERT INTO `aos_sys_dic` VALUES ('b1d95ea28e084b64b0f6a473e65fe2fd', 'aos', 'AOS', null, '0', '3ba3a682c2ac4d52982411dd045fae32', '');
INSERT INTO `aos_sys_dic` VALUES ('b5bdcaeeccd44ad9aceae1968fbe0851', 'userName', 'root', null, '1', '2d977e97aacf4781836bac9f5e88ad2b', '数据库用户名');
INSERT INTO `aos_sys_dic` VALUES ('b85f79702d094f348e1c9e79e67d95b7', '1', '待办', null, '1', '48062fd856f14794b03ceba2a1d6b60e', null);
INSERT INTO `aos_sys_dic` VALUES ('ba5b0493f0544278a980e0f268baf83c', '1', '快捷菜单', null, '1', '4c2a12d3890a449fa91521a29a3c2436', null);
INSERT INTO `aos_sys_dic` VALUES ('bbef93ea807847029e98ed7023b47c6a', '1', '正常', null, '1', '0744eedeaaa143afa499254866aa75c9', null);
INSERT INTO `aos_sys_dic` VALUES ('bc17f4f03f0d415c97a026e8ec5a999d', 'blue', '#6699CC', null, '1', '54e48c66b3ef4d99823ca8217a2abf43', null);
INSERT INTO `aos_sys_dic` VALUES ('c172686bc21e40efacca63c5b7e1c9d3', 'blue', '#99bce8', null, '1', '1ec5d3c945de40469595c85955196e76', null);
INSERT INTO `aos_sys_dic` VALUES ('c1c92ade06b94969b2b066184845781c', '6', '禁用', null, '1', '2794338c8b4946b99c361dae80da71b1', null);
INSERT INTO `aos_sys_dic` VALUES ('c20e301598954f0ab33445680ca1db27', 'gray', '#F0F0F0', null, '1', '3146aefcb39344cebe6e0a9baa7a4a48', null);
INSERT INTO `aos_sys_dic` VALUES ('c38ebb4d102440babfde6f6f8fbf5d00', '2', '办结', null, '1', '48062fd856f14794b03ceba2a1d6b60e', null);
INSERT INTO `aos_sys_dic` VALUES ('c3e008a5ba864e21b5a66230e389926c', '1', '行政部门', null, '1', '58b28eade8604dffa7c531b7b42af2fa', null);
INSERT INTO `aos_sys_dic` VALUES ('cc53b6f6235f413db559f4a7e7ba88e6', '1', '运行中', null, '1', 'a06eb2af650444db903c945030334b12', null);
INSERT INTO `aos_sys_dic` VALUES ('cc8d6e844c3c46e0bfc973ef51dcb4a3', 'neptune', '#D0DDF2', null, '1', '3146aefcb39344cebe6e0a9baa7a4a48', null);
INSERT INTO `aos_sys_dic` VALUES ('cd08dff488454293bc8aa8224eb719cb', 'password', '111111', null, '1', '2d977e97aacf4781836bac9f5e88ad2b', '数据库用户密码');
INSERT INTO `aos_sys_dic` VALUES ('cde729266d09465ca624939dc05e6b4d', '2', 'UUID', null, '1', '2a9ac1749d224bef924cd258bf35254a', null);
INSERT INTO `aos_sys_dic` VALUES ('ce49529f302f446d8e6e4576578ad459', '3', '注册用户', null, '1', '0475e71c145f49acbe781b2e7310ab64', null);
INSERT INTO `aos_sys_dic` VALUES ('d93b044fec9941cd87ec8260fab2c9b9', 'gray', '#888888', null, '1', '54e48c66b3ef4d99823ca8217a2abf43', null);
INSERT INTO `aos_sys_dic` VALUES ('e81beb66246441228ba1bb17190db222', '2', '管理权限', null, '1', 'dd9f74d16be14db5b0f6d79720c8f177', null);
INSERT INTO `aos_sys_dic` VALUES ('ebe726f2cfa2434dbb7f943f6f42c3ad', '2', '超级用户', null, '1', '0475e71c145f49acbe781b2e7310ab64', null);
INSERT INTO `aos_sys_dic` VALUES ('f08565c1fd7444bcb24645e52335a1e1', '1', '快捷菜单', null, '1', 'a9fd5aa3b7654326902a94e70bccedd8', null);
INSERT INTO `aos_sys_dic` VALUES ('f1f754ae30d54e2895c32050ff4c1d3d', 'aos', 'aos.png', null, '1', 'e9e9cfc195514b05890a2249b81dfe73', null);
INSERT INTO `aos_sys_dic` VALUES ('f4108659f1f8461db381c2808b82e038', '1', '启用', null, '1', '10a113b1dd6d492dad27c8b0a0fb7efc', null);
INSERT INTO `aos_sys_dic` VALUES ('f5d18126770d42a4a6b922c3b67ed161', '1', '在线设计', null, '1', '483fb2ff35e84a42974e914851fae01a', null);
INSERT INTO `aos_sys_dic` VALUES ('f624177f00ba4f15a60a8188856b5425', '1', 'APPID', null, '1', '2a9ac1749d224bef924cd258bf35254a', null);
INSERT INTO `aos_sys_dic` VALUES ('f7b6f63fc5de469aaf90986188037516', 'neptune', '#006699', null, '1', '54e48c66b3ef4d99823ca8217a2abf43', null);
INSERT INTO `aos_sys_dic` VALUES ('f97e6ea7f6fe4f6e8b7fde75f0074e2c', '1', '缺省', null, '1', '0475e71c145f49acbe781b2e7310ab64', null);
INSERT INTO `aos_sys_dic` VALUES ('fac86f6625cb47fc8c1a4bab41dc1af4', 'ip', '127.0.0.1', null, '1', '2d977e97aacf4781836bac9f5e88ad2b', '数据库主机IP');
INSERT INTO `aos_sys_dic` VALUES ('fedcb0e622734060a19a3d9b98e96f71', '4', '导入离线文本', null, '1', '483fb2ff35e84a42974e914851fae01a', null);

-- ----------------------------
-- Table structure for aos_sys_dic_index
-- ----------------------------
DROP TABLE IF EXISTS `aos_sys_dic_index`;
CREATE TABLE `aos_sys_dic_index` (
  `id_` varchar(64) NOT NULL COMMENT '流水号',
  `key_` varchar(255) NOT NULL COMMENT '字典标识',
  `name_` varchar(255) NOT NULL COMMENT '字典名称',
  `hotkey_` varchar(255) default NULL COMMENT '热键',
  `catalog_id_` varchar(64) NOT NULL COMMENT '所属分类流水号',
  `catalog_cascade_id_` varchar(255) NOT NULL COMMENT '所属分类流节点语义ID',
  `remark_` varchar(4000) default NULL COMMENT '备注',
  PRIMARY KEY  (`id_`),
  UNIQUE KEY `aos_sys_dic_index_ukey` USING BTREE (`key_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典索引表';

-- ----------------------------
-- Records of aos_sys_dic_index
-- ----------------------------
INSERT INTO `aos_sys_dic_index` VALUES ('0475e71c145f49acbe781b2e7310ab64', 'user_type_', '用户类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
INSERT INTO `aos_sys_dic_index` VALUES ('0744eedeaaa143afa499254866aa75c9', 'user_status_', '用户状态', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
INSERT INTO `aos_sys_dic_index` VALUES ('10a113b1dd6d492dad27c8b0a0fb7efc', 'enabled_', '使能状态', null, 'aa3082ab67e24d8b884bc4504d3d9945', '0.002.002', '');
INSERT INTO `aos_sys_dic_index` VALUES ('1ec5d3c945de40469595c85955196e76', 'cmp_border_color_', '组件边框颜色', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
INSERT INTO `aos_sys_dic_index` VALUES ('21136c3dc660464d92fccd66408e149b', 'icon_type_', '图标类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
INSERT INTO `aos_sys_dic_index` VALUES ('2724924f1cdd48d1aa1a84cb7dd9b3ee', 'card_type_', '信用卡类型', null, '8d6c9869e8b2427cb16cf3f4777bf236', '0.002.007', null);
INSERT INTO `aos_sys_dic_index` VALUES ('2794338c8b4946b99c361dae80da71b1', 'cmp_grant_type_', '界面元素授权类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', '');
INSERT INTO `aos_sys_dic_index` VALUES ('2a9ac1749d224bef924cd258bf35254a', 'sequence_type_', 'ID类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', '');
INSERT INTO `aos_sys_dic_index` VALUES ('2c90ab6212f44b08a1d8ed527c72795f', 'procdef_suspension_state_', '流程定义活动状态', null, '38368661c53c40b6824869a0ccffad05', '0.002.001.001', '');
INSERT INTO `aos_sys_dic_index` VALUES ('2d977e97aacf4781836bac9f5e88ad2b', 'webide_jdbc', 'WebIDE模块使用的JDBC连接', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', 'WebIDE模块使用的JDBC连接。');
INSERT INTO `aos_sys_dic_index` VALUES ('3146aefcb39344cebe6e0a9baa7a4a48', 'south_back_color_', '主页面south区域背景颜色', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
INSERT INTO `aos_sys_dic_index` VALUES ('33a73af4b729448b91c13acf4d0a31e1', 'is_show_top_nav_', '是否显示顶部导航条', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', '是否显示水平导航条。(只有在导航模式为1的情况，此设置才有效,导航模式为2，则水平导航条不会消失)。可选值：true| false。');
INSERT INTO `aos_sys_dic_index` VALUES ('38841cd4f85f4ffb8c07c74650a130dc', 'page_type_', '页面类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
INSERT INTO `aos_sys_dic_index` VALUES ('3ba3a682c2ac4d52982411dd045fae32', 'skin_', '界面皮肤', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', '');
INSERT INTO `aos_sys_dic_index` VALUES ('48062fd856f14794b03ceba2a1d6b60e', 'proctask_status_', '任务状态', null, '38368661c53c40b6824869a0ccffad05', '0.002.001.001', null);
INSERT INTO `aos_sys_dic_index` VALUES ('483fb2ff35e84a42974e914851fae01a', 'create_type_', '流程模型创建方式', null, '38368661c53c40b6824869a0ccffad05', '0.002.001.001', '业务流程模型创建方式');
INSERT INTO `aos_sys_dic_index` VALUES ('4c2a12d3890a449fa91521a29a3c2436', 'nav_tab_index_', '导航缺省活动页', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
INSERT INTO `aos_sys_dic_index` VALUES ('54e48c66b3ef4d99823ca8217a2abf43', 'main_text_color_', '边界区域字体主颜色', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
INSERT INTO `aos_sys_dic_index` VALUES ('58b28eade8604dffa7c531b7b42af2fa', 'org_type_', '组织类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
INSERT INTO `aos_sys_dic_index` VALUES ('61fd319a23b04bd1bdbce7037002976a', 'nav_text_color_', '导航文字颜色', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
INSERT INTO `aos_sys_dic_index` VALUES ('79004d064e954e55b832a8a9a4332576', 'post_type_', '岗位类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
INSERT INTO `aos_sys_dic_index` VALUES ('7d048854ccdc4eab996dcb703722065b', 'page_el_type_', '页面元素类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
INSERT INTO `aos_sys_dic_index` VALUES ('91bc8a695b744b27ba66a94561fd6dbc', 'bool_', '是否布尔值字典', null, 'aa3082ab67e24d8b884bc4504d3d9945', '0.002.002', '');
INSERT INTO `aos_sys_dic_index` VALUES ('a06eb2af650444db903c945030334b12', 'procinst_status_', '流程实例状态', null, '38368661c53c40b6824869a0ccffad05', '0.002.001.001', null);
INSERT INTO `aos_sys_dic_index` VALUES ('a19ac2af964c4a6e8af9c6f1c0d2673f', 'navbar_btn_style_', '顶部导航条按钮风格', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
INSERT INTO `aos_sys_dic_index` VALUES ('a44dd9bbf55041368882e88821309355', 'theme_', '系统主题', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', '');
INSERT INTO `aos_sys_dic_index` VALUES ('a9fd5aa3b7654326902a94e70bccedd8', 'module_user_nav_type', '导航菜单类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', '');
INSERT INTO `aos_sys_dic_index` VALUES ('c66f06c069224241a4785e77d1406f9c', 'delegation_', '委派状态', null, '38368661c53c40b6824869a0ccffad05', '0.002.001.001', '流程任务的委派代理状态');
INSERT INTO `aos_sys_dic_index` VALUES ('cfcbc48fd8ad42678a52334bac8aa299', 'role_type_', '角色类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
INSERT INTO `aos_sys_dic_index` VALUES ('dd9f74d16be14db5b0f6d79720c8f177', 'grant_type_', '权限类型', null, '4018a2217b0542059a26ecf3f605d60f', '0.002.001', null);
INSERT INTO `aos_sys_dic_index` VALUES ('e9e9cfc195514b05890a2249b81dfe73', 'north_back_img_', '主页面north区域背景图片', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
INSERT INTO `aos_sys_dic_index` VALUES ('f59d8693d8cf4f10850914e09ae9b93c', 'sex_', '性别', null, 'aa3082ab67e24d8b884bc4504d3d9945', '0.002.002', null);
INSERT INTO `aos_sys_dic_index` VALUES ('fa8097dd670643f9a03722c4074ecba5', 'left_logo_', 'Banner左边logo图标', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', null);
INSERT INTO `aos_sys_dic_index` VALUES ('ffc94f2b7ad14c78b14c46f8fab17543', 'nav_quick_layout_', '快捷菜单布局风格', null, 'c0c43dea5ab6419dad37e459213d7bb5', '0.002.006', '快捷菜单布局风格。');

-- ----------------------------
-- Table structure for aos_sys_icon
-- ----------------------------
DROP TABLE IF EXISTS `aos_sys_icon`;
CREATE TABLE `aos_sys_icon` (
  `id_` varchar(64) NOT NULL COMMENT '流水号',
  `name_` varchar(255) NOT NULL COMMENT '名称',
  `type_` varchar(255) NOT NULL COMMENT '类型',
  PRIMARY KEY  (`id_`),
  UNIQUE KEY `aos_sys_icon_ukey` USING BTREE (`name_`,`type_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图标大全';

-- ----------------------------
-- Records of aos_sys_icon
-- ----------------------------
INSERT INTO `aos_sys_icon` VALUES ('2904', '10.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2905', '11.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2906', '13.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2907', '14.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2908', '15.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2909', '17.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2910', '19.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2911', '2.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2912', '21.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2913', '22.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2914', '23.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2915', '24.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2916', '25.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2917', '26.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2918', '28.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2919', '3.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2920', '30.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2921', '32.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2922', '34.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2923', '35.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2924', '36.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2925', '37.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2926', '38.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2927', '39.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2928', '4.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2929', '40.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2930', '41.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2931', '42.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2932', '43.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2933', '44.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2934', '45.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2935', '46.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2936', '47.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2937', '48.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2938', '49.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2939', '5.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2940', '51.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2941', '52.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2942', '53.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2943', '54.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2944', '55.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2945', '56.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2946', '6.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2947', '7.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2948', '8.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('2949', '9.png', '2');
INSERT INTO `aos_sys_icon` VALUES ('10047', 'add.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10048', 'add2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10049', 'against.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10050', 'agree.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10051', 'app_columns.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10052', 'app_list.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10053', 'bars.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('10054', 'basket.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10055', 'book.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10056', 'book_user.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10057', 'bug.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10058', 'bullet_black.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10059', 'bullet_blue.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10060', 'bullet_green.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10061', 'bullet_group.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('10062', 'bullet_group2.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('10063', 'bullet_group3.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('10064', 'bullet_group4.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('10065', 'bullet_purple.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10066', 'bullet_red.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10067', 'bullet_yellow.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10068', 'chart_curve.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10069', 'chart_flipped.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10070', 'chart_line.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10071', 'chart_pie.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10072', 'close.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10073', 'close2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10074', 'config.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10075', 'config1.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10076', 'config3.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10077', 'connect.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10078', 'copy.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10079', 'cut.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10080', 'cv.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10081', 'c_key.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10082', 'database.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10083', 'database_add.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10084', 'del.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10085', 'del1.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10086', 'del2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10087', 'del_folder.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10088', 'del_page.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10089', 'detail.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10090', 'disconnect.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10091', 'doc_ok.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10092', 'down.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10093', 'down_left.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10094', 'down_right.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10095', 'edit.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10096', 'edit2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10097', 'email.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10098', 'email2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10099', 'email3.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10100', 'email_go.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10101', 'email_open.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('827', 'fa-adjust', '3');
INSERT INTO `aos_sys_icon` VALUES ('1096', 'fa-adn', '3');
INSERT INTO `aos_sys_icon` VALUES ('817', 'fa-align-center', '3');
INSERT INTO `aos_sys_icon` VALUES ('819', 'fa-align-justify', '3');
INSERT INTO `aos_sys_icon` VALUES ('816', 'fa-align-left', '3');
INSERT INTO `aos_sys_icon` VALUES ('818', 'fa-align-right', '3');
INSERT INTO `aos_sys_icon` VALUES ('987', 'fa-ambulance', '3');
INSERT INTO `aos_sys_icon` VALUES ('1049', 'fa-anchor', '3');
INSERT INTO `aos_sys_icon` VALUES ('1107', 'fa-android', '3');
INSERT INTO `aos_sys_icon` VALUES ('1240', 'fa-angellist', '3');
INSERT INTO `aos_sys_icon` VALUES ('996', 'fa-angle-double-down', '3');
INSERT INTO `aos_sys_icon` VALUES ('993', 'fa-angle-double-left', '3');
INSERT INTO `aos_sys_icon` VALUES ('994', 'fa-angle-double-right', '3');
INSERT INTO `aos_sys_icon` VALUES ('995', 'fa-angle-double-up', '3');
INSERT INTO `aos_sys_icon` VALUES ('1000', 'fa-angle-down', '3');
INSERT INTO `aos_sys_icon` VALUES ('997', 'fa-angle-left', '3');
INSERT INTO `aos_sys_icon` VALUES ('998', 'fa-angle-right', '3');
INSERT INTO `aos_sys_icon` VALUES ('999', 'fa-angle-up', '3');
INSERT INTO `aos_sys_icon` VALUES ('1105', 'fa-apple', '3');
INSERT INTO `aos_sys_icon` VALUES ('1118', 'fa-archive', '3');
INSERT INTO `aos_sys_icon` VALUES ('1230', 'fa-area-chart', '3');
INSERT INTO `aos_sys_icon` VALUES ('926', 'fa-arrow-circle-down', '3');
INSERT INTO `aos_sys_icon` VALUES ('923', 'fa-arrow-circle-left', '3');
INSERT INTO `aos_sys_icon` VALUES ('790', 'fa-arrow-circle-o-down', '3');
INSERT INTO `aos_sys_icon` VALUES ('1126', 'fa-arrow-circle-o-left', '3');
INSERT INTO `aos_sys_icon` VALUES ('1125', 'fa-arrow-circle-o-right', '3');
INSERT INTO `aos_sys_icon` VALUES ('791', 'fa-arrow-circle-o-up', '3');
INSERT INTO `aos_sys_icon` VALUES ('924', 'fa-arrow-circle-right', '3');
INSERT INTO `aos_sys_icon` VALUES ('925', 'fa-arrow-circle-up', '3');
INSERT INTO `aos_sys_icon` VALUES ('858', 'fa-arrow-down', '3');
INSERT INTO `aos_sys_icon` VALUES ('855', 'fa-arrow-left', '3');
INSERT INTO `aos_sys_icon` VALUES ('856', 'fa-arrow-right', '3');
INSERT INTO `aos_sys_icon` VALUES ('857', 'fa-arrow-up', '3');
INSERT INTO `aos_sys_icon` VALUES ('832', 'fa-arrows', '3');
INSERT INTO `aos_sys_icon` VALUES ('932', 'fa-arrows-alt', '3');
INSERT INTO `aos_sys_icon` VALUES ('884', 'fa-arrows-h', '3');
INSERT INTO `aos_sys_icon` VALUES ('883', 'fa-arrows-v', '3');
INSERT INTO `aos_sys_icon` VALUES ('864', 'fa-asterisk', '3');
INSERT INTO `aos_sys_icon` VALUES ('1226', 'fa-at', '3');
INSERT INTO `aos_sys_icon` VALUES ('835', 'fa-backward', '3');
INSERT INTO `aos_sys_icon` VALUES ('854', 'fa-ban', '3');
INSERT INTO `aos_sys_icon` VALUES ('885', 'fa-bar-chart', '3');
INSERT INTO `aos_sys_icon` VALUES ('804', 'fa-barcode', '3');
INSERT INTO `aos_sys_icon` VALUES ('942', 'fa-bars', '3');
INSERT INTO `aos_sys_icon` VALUES ('990', 'fa-beer', '3');
INSERT INTO `aos_sys_icon` VALUES ('1160', 'fa-behance', '3');
INSERT INTO `aos_sys_icon` VALUES ('1161', 'fa-behance-square', '3');
INSERT INTO `aos_sys_icon` VALUES ('917', 'fa-bell', '3');
INSERT INTO `aos_sys_icon` VALUES ('981', 'fa-bell-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('1222', 'fa-bell-slash', '3');
INSERT INTO `aos_sys_icon` VALUES ('1223', 'fa-bell-slash-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('1237', 'fa-bicycle', '3');
INSERT INTO `aos_sys_icon` VALUES ('1206', 'fa-binoculars', '3');
INSERT INTO `aos_sys_icon` VALUES ('1229', 'fa-birthday-cake', '3');
INSERT INTO `aos_sys_icon` VALUES ('1097', 'fa-bitbucket', '3');
INSERT INTO `aos_sys_icon` VALUES ('1098', 'fa-bitbucket-square', '3');
INSERT INTO `aos_sys_icon` VALUES ('812', 'fa-bold', '3');
INSERT INTO `aos_sys_icon` VALUES ('970', 'fa-bolt', '3');
INSERT INTO `aos_sys_icon` VALUES ('1203', 'fa-bomb', '3');
INSERT INTO `aos_sys_icon` VALUES ('807', 'fa-book', '3');
INSERT INTO `aos_sys_icon` VALUES ('808', 'fa-bookmark', '3');
INSERT INTO `aos_sys_icon` VALUES ('907', 'fa-bookmark-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('931', 'fa-briefcase', '3');
INSERT INTO `aos_sys_icon` VALUES ('1076', 'fa-btc', '3');
INSERT INTO `aos_sys_icon` VALUES ('1119', 'fa-bug', '3');
INSERT INTO `aos_sys_icon` VALUES ('1154', 'fa-building', '3');
INSERT INTO `aos_sys_icon` VALUES ('985', 'fa-building-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('916', 'fa-bullhorn', '3');
INSERT INTO `aos_sys_icon` VALUES ('1051', 'fa-bullseye', '3');
INSERT INTO `aos_sys_icon` VALUES ('1238', 'fa-bus', '3');
INSERT INTO `aos_sys_icon` VALUES ('1213', 'fa-calculator', '3');
INSERT INTO `aos_sys_icon` VALUES ('873', 'fa-calendar', '3');
INSERT INTO `aos_sys_icon` VALUES ('1039', 'fa-calendar-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('810', 'fa-camera', '3');
INSERT INTO `aos_sys_icon` VALUES ('888', 'fa-camera-retro', '3');
INSERT INTO `aos_sys_icon` VALUES ('1165', 'fa-car', '3');
INSERT INTO `aos_sys_icon` VALUES ('955', 'fa-caret-down', '3');
INSERT INTO `aos_sys_icon` VALUES ('957', 'fa-caret-left', '3');
INSERT INTO `aos_sys_icon` VALUES ('958', 'fa-caret-right', '3');
INSERT INTO `aos_sys_icon` VALUES ('1066', 'fa-caret-square-o-down', '3');
INSERT INTO `aos_sys_icon` VALUES ('1127', 'fa-caret-square-o-left', '3');
INSERT INTO `aos_sys_icon` VALUES ('1068', 'fa-caret-square-o-right', '3');
INSERT INTO `aos_sys_icon` VALUES ('1067', 'fa-caret-square-o-up', '3');
INSERT INTO `aos_sys_icon` VALUES ('956', 'fa-caret-up', '3');
INSERT INTO `aos_sys_icon` VALUES ('1241', 'fa-cc', '3');
INSERT INTO `aos_sys_icon` VALUES ('1219', 'fa-cc-amex', '3');
INSERT INTO `aos_sys_icon` VALUES ('1218', 'fa-cc-discover', '3');
INSERT INTO `aos_sys_icon` VALUES ('1217', 'fa-cc-mastercard', '3');
INSERT INTO `aos_sys_icon` VALUES ('1220', 'fa-cc-paypal', '3');
INSERT INTO `aos_sys_icon` VALUES ('1221', 'fa-cc-stripe', '3');
INSERT INTO `aos_sys_icon` VALUES ('1216', 'fa-cc-visa', '3');
INSERT INTO `aos_sys_icon` VALUES ('918', 'fa-certificate', '3');
INSERT INTO `aos_sys_icon` VALUES ('1028', 'fa-chain-broken', '3');
INSERT INTO `aos_sys_icon` VALUES ('777', 'fa-check', '3');
INSERT INTO `aos_sys_icon` VALUES ('848', 'fa-check-circle', '3');
INSERT INTO `aos_sys_icon` VALUES ('853', 'fa-check-circle-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('1061', 'fa-check-square', '3');
INSERT INTO `aos_sys_icon` VALUES ('831', 'fa-check-square-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('1046', 'fa-chevron-circle-down', '3');
INSERT INTO `aos_sys_icon` VALUES ('1043', 'fa-chevron-circle-left', '3');
INSERT INTO `aos_sys_icon` VALUES ('1044', 'fa-chevron-circle-right', '3');
INSERT INTO `aos_sys_icon` VALUES ('1045', 'fa-chevron-circle-up', '3');
INSERT INTO `aos_sys_icon` VALUES ('878', 'fa-chevron-down', '3');
INSERT INTO `aos_sys_icon` VALUES ('843', 'fa-chevron-left', '3');
INSERT INTO `aos_sys_icon` VALUES ('844', 'fa-chevron-right', '3');
INSERT INTO `aos_sys_icon` VALUES ('877', 'fa-chevron-up', '3');
INSERT INTO `aos_sys_icon` VALUES ('1155', 'fa-child', '3');
INSERT INTO `aos_sys_icon` VALUES ('1009', 'fa-circle', '3');
INSERT INTO `aos_sys_icon` VALUES ('1005', 'fa-circle-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('1185', 'fa-circle-o-notch', '3');
INSERT INTO `aos_sys_icon` VALUES ('1197', 'fa-circle-thin', '3');
INSERT INTO `aos_sys_icon` VALUES ('973', 'fa-clipboard', '3');
INSERT INTO `aos_sys_icon` VALUES ('787', 'fa-clock-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('935', 'fa-cloud', '3');
INSERT INTO `aos_sys_icon` VALUES ('976', 'fa-cloud-download', '3');
INSERT INTO `aos_sys_icon` VALUES ('977', 'fa-cloud-upload', '3');
INSERT INTO `aos_sys_icon` VALUES ('1022', 'fa-code', '3');
INSERT INTO `aos_sys_icon` VALUES ('1027', 'fa-code-fork', '3');
INSERT INTO `aos_sys_icon` VALUES ('1182', 'fa-codepen', '3');
INSERT INTO `aos_sys_icon` VALUES ('982', 'fa-coffee', '3');
INSERT INTO `aos_sys_icon` VALUES ('783', 'fa-cog', '3');
INSERT INTO `aos_sys_icon` VALUES ('890', 'fa-cogs', '3');
INSERT INTO `aos_sys_icon` VALUES ('959', 'fa-columns', '3');
INSERT INTO `aos_sys_icon` VALUES ('875', 'fa-comment', '3');
INSERT INTO `aos_sys_icon` VALUES ('968', 'fa-comment-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('891', 'fa-comments', '3');
INSERT INTO `aos_sys_icon` VALUES ('969', 'fa-comments-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('1065', 'fa-compass', '3');
INSERT INTO `aos_sys_icon` VALUES ('861', 'fa-compress', '3');
INSERT INTO `aos_sys_icon` VALUES ('1225', 'fa-copyright', '3');
INSERT INTO `aos_sys_icon` VALUES ('913', 'fa-credit-card', '3');
INSERT INTO `aos_sys_icon` VALUES ('1026', 'fa-crop', '3');
INSERT INTO `aos_sys_icon` VALUES ('851', 'fa-crosshairs', '3');
INSERT INTO `aos_sys_icon` VALUES ('1048', 'fa-css3', '3');
INSERT INTO `aos_sys_icon` VALUES ('1158', 'fa-cube', '3');
INSERT INTO `aos_sys_icon` VALUES ('1159', 'fa-cubes', '3');
INSERT INTO `aos_sys_icon` VALUES ('983', 'fa-cutlery', '3');
INSERT INTO `aos_sys_icon` VALUES ('1171', 'fa-database', '3');
INSERT INTO `aos_sys_icon` VALUES ('1146', 'fa-delicious', '3');
INSERT INTO `aos_sys_icon` VALUES ('1001', 'fa-desktop', '3');
INSERT INTO `aos_sys_icon` VALUES ('1169', 'fa-deviantart', '3');
INSERT INTO `aos_sys_icon` VALUES ('1147', 'fa-digg', '3');
INSERT INTO `aos_sys_icon` VALUES ('1128', 'fa-dot-circle-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('789', 'fa-download', '3');
INSERT INTO `aos_sys_icon` VALUES ('1109', 'fa-dribbble', '3');
INSERT INTO `aos_sys_icon` VALUES ('1092', 'fa-dropbox', '3');
INSERT INTO `aos_sys_icon` VALUES ('1150', 'fa-drupal', '3');
INSERT INTO `aos_sys_icon` VALUES ('842', 'fa-eject', '3');
INSERT INTO `aos_sys_icon` VALUES ('1052', 'fa-ellipsis-h', '3');
INSERT INTO `aos_sys_icon` VALUES ('1053', 'fa-ellipsis-v', '3');
INSERT INTO `aos_sys_icon` VALUES ('1187', 'fa-empire', '3');
INSERT INTO `aos_sys_icon` VALUES ('963', 'fa-envelope', '3');
INSERT INTO `aos_sys_icon` VALUES ('768', 'fa-envelope-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('1135', 'fa-envelope-square', '3');
INSERT INTO `aos_sys_icon` VALUES ('1034', 'fa-eraser', '3');
INSERT INTO `aos_sys_icon` VALUES ('1069', 'fa-eur', '3');
INSERT INTO `aos_sys_icon` VALUES ('975', 'fa-exchange', '3');
INSERT INTO `aos_sys_icon` VALUES ('1031', 'fa-exclamation', '3');
INSERT INTO `aos_sys_icon` VALUES ('865', 'fa-exclamation-circle', '3');
INSERT INTO `aos_sys_icon` VALUES ('871', 'fa-exclamation-triangle', '3');
INSERT INTO `aos_sys_icon` VALUES ('860', 'fa-expand', '3');
INSERT INTO `aos_sys_icon` VALUES ('899', 'fa-external-link', '3');
INSERT INTO `aos_sys_icon` VALUES ('1063', 'fa-external-link-square', '3');
INSERT INTO `aos_sys_icon` VALUES ('869', 'fa-eye', '3');
INSERT INTO `aos_sys_icon` VALUES ('870', 'fa-eye-slash', '3');
INSERT INTO `aos_sys_icon` VALUES ('1227', 'fa-eyedropper', '3');
INSERT INTO `aos_sys_icon` VALUES ('910', 'fa-facebook', '3');
INSERT INTO `aos_sys_icon` VALUES ('887', 'fa-facebook-square', '3');
INSERT INTO `aos_sys_icon` VALUES ('834', 'fa-fast-backward', '3');
INSERT INTO `aos_sys_icon` VALUES ('840', 'fa-fast-forward', '3');
INSERT INTO `aos_sys_icon` VALUES ('1153', 'fa-fax', '3');
INSERT INTO `aos_sys_icon` VALUES ('1113', 'fa-female', '3');
INSERT INTO `aos_sys_icon` VALUES ('989', 'fa-fighter-jet', '3');
INSERT INTO `aos_sys_icon` VALUES ('1077', 'fa-file', '3');
INSERT INTO `aos_sys_icon` VALUES ('1177', 'fa-file-archive-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('1178', 'fa-file-audio-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('1180', 'fa-file-code-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('1174', 'fa-file-excel-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('1176', 'fa-file-image-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('786', 'fa-file-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('1172', 'fa-file-pdf-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('1175', 'fa-file-powerpoint-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('1078', 'fa-file-text', '3');
INSERT INTO `aos_sys_icon` VALUES ('984', 'fa-file-text-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('1179', 'fa-file-video-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('1173', 'fa-file-word-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('938', 'fa-files-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('773', 'fa-film', '3');
INSERT INTO `aos_sys_icon` VALUES ('930', 'fa-filter', '3');
INSERT INTO `aos_sys_icon` VALUES ('868', 'fa-fire', '3');
INSERT INTO `aos_sys_icon` VALUES ('1040', 'fa-fire-extinguisher', '3');
INSERT INTO `aos_sys_icon` VALUES ('798', 'fa-flag', '3');
INSERT INTO `aos_sys_icon` VALUES ('1020', 'fa-flag-checkered', '3');
INSERT INTO `aos_sys_icon` VALUES ('1019', 'fa-flag-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('936', 'fa-flask', '3');
INSERT INTO `aos_sys_icon` VALUES ('1095', 'fa-flickr', '3');
INSERT INTO `aos_sys_icon` VALUES ('940', 'fa-floppy-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('881', 'fa-folder', '3');
INSERT INTO `aos_sys_icon` VALUES ('1012', 'fa-folder-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('882', 'fa-folder-open', '3');
INSERT INTO `aos_sys_icon` VALUES ('1013', 'fa-folder-open-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('811', 'fa-font', '3');
INSERT INTO `aos_sys_icon` VALUES ('839', 'fa-forward', '3');
INSERT INTO `aos_sys_icon` VALUES ('1111', 'fa-foursquare', '3');
INSERT INTO `aos_sys_icon` VALUES ('1015', 'fa-frown-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('1204', 'fa-futbol-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('1017', 'fa-gamepad', '3');
INSERT INTO `aos_sys_icon` VALUES ('966', 'fa-gavel', '3');
INSERT INTO `aos_sys_icon` VALUES ('1070', 'fa-gbp', '3');
INSERT INTO `aos_sys_icon` VALUES ('866', 'fa-gift', '3');
INSERT INTO `aos_sys_icon` VALUES ('1189', 'fa-git', '3');
INSERT INTO `aos_sys_icon` VALUES ('1188', 'fa-git-square', '3');
INSERT INTO `aos_sys_icon` VALUES ('911', 'fa-github', '3');
INSERT INTO `aos_sys_icon` VALUES ('1011', 'fa-github-alt', '3');
INSERT INTO `aos_sys_icon` VALUES ('902', 'fa-github-square', '3');
INSERT INTO `aos_sys_icon` VALUES ('1115', 'fa-gittip', '3');
INSERT INTO `aos_sys_icon` VALUES ('765', 'fa-glass', '3');
INSERT INTO `aos_sys_icon` VALUES ('927', 'fa-globe', '3');
INSERT INTO `aos_sys_icon` VALUES ('1141', 'fa-google', '3');
INSERT INTO `aos_sys_icon` VALUES ('953', 'fa-google-plus', '3');
INSERT INTO `aos_sys_icon` VALUES ('952', 'fa-google-plus-square', '3');
INSERT INTO `aos_sys_icon` VALUES ('1215', 'fa-google-wallet', '3');
INSERT INTO `aos_sys_icon` VALUES ('1139', 'fa-graduation-cap', '3');
INSERT INTO `aos_sys_icon` VALUES ('991', 'fa-h-square', '3');
INSERT INTO `aos_sys_icon` VALUES ('1190', 'fa-hacker-news', '3');
INSERT INTO `aos_sys_icon` VALUES ('922', 'fa-hand-o-down', '3');
INSERT INTO `aos_sys_icon` VALUES ('920', 'fa-hand-o-left', '3');
INSERT INTO `aos_sys_icon` VALUES ('919', 'fa-hand-o-right', '3');
INSERT INTO `aos_sys_icon` VALUES ('921', 'fa-hand-o-up', '3');
INSERT INTO `aos_sys_icon` VALUES ('915', 'fa-hdd-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('1198', 'fa-header', '3');
INSERT INTO `aos_sys_icon` VALUES ('799', 'fa-headphones', '3');
INSERT INTO `aos_sys_icon` VALUES ('769', 'fa-heart', '3');
INSERT INTO `aos_sys_icon` VALUES ('895', 'fa-heart-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('1196', 'fa-history', '3');
INSERT INTO `aos_sys_icon` VALUES ('785', 'fa-home', '3');
INSERT INTO `aos_sys_icon` VALUES ('986', 'fa-hospital-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('1047', 'fa-html5', '3');
INSERT INTO `aos_sys_icon` VALUES ('1242', 'fa-ils', '3');
INSERT INTO `aos_sys_icon` VALUES ('792', 'fa-inbox', '3');
INSERT INTO `aos_sys_icon` VALUES ('822', 'fa-indent', '3');
INSERT INTO `aos_sys_icon` VALUES ('1030', 'fa-info', '3');
INSERT INTO `aos_sys_icon` VALUES ('850', 'fa-info-circle', '3');
INSERT INTO `aos_sys_icon` VALUES ('1072', 'fa-inr', '3');
INSERT INTO `aos_sys_icon` VALUES ('1094', 'fa-instagram', '3');
INSERT INTO `aos_sys_icon` VALUES ('1239', 'fa-ioxhost', '3');
INSERT INTO `aos_sys_icon` VALUES ('813', 'fa-italic', '3');
INSERT INTO `aos_sys_icon` VALUES ('1151', 'fa-joomla', '3');
INSERT INTO `aos_sys_icon` VALUES ('1073', 'fa-jpy', '3');
INSERT INTO `aos_sys_icon` VALUES ('1183', 'fa-jsfiddle', '3');
INSERT INTO `aos_sys_icon` VALUES ('889', 'fa-key', '3');
INSERT INTO `aos_sys_icon` VALUES ('1018', 'fa-keyboard-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('1075', 'fa-krw', '3');
INSERT INTO `aos_sys_icon` VALUES ('1152', 'fa-language', '3');
INSERT INTO `aos_sys_icon` VALUES ('1002', 'fa-laptop', '3');
INSERT INTO `aos_sys_icon` VALUES ('1233', 'fa-lastfm', '3');
INSERT INTO `aos_sys_icon` VALUES ('1234', 'fa-lastfm-square', '3');
INSERT INTO `aos_sys_icon` VALUES ('867', 'fa-leaf', '3');
INSERT INTO `aos_sys_icon` VALUES ('904', 'fa-lemon-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('1060', 'fa-level-down', '3');
INSERT INTO `aos_sys_icon` VALUES ('1059', 'fa-level-up', '3');
INSERT INTO `aos_sys_icon` VALUES ('1184', 'fa-life-ring', '3');
INSERT INTO `aos_sys_icon` VALUES ('974', 'fa-lightbulb-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('1232', 'fa-line-chart', '3');
INSERT INTO `aos_sys_icon` VALUES ('934', 'fa-link', '3');
INSERT INTO `aos_sys_icon` VALUES ('964', 'fa-linkedin', '3');
INSERT INTO `aos_sys_icon` VALUES ('897', 'fa-linkedin-square', '3');
INSERT INTO `aos_sys_icon` VALUES ('1108', 'fa-linux', '3');
INSERT INTO `aos_sys_icon` VALUES ('820', 'fa-list', '3');
INSERT INTO `aos_sys_icon` VALUES ('796', 'fa-list-alt', '3');
INSERT INTO `aos_sys_icon` VALUES ('944', 'fa-list-ol', '3');
INSERT INTO `aos_sys_icon` VALUES ('943', 'fa-list-ul', '3');
INSERT INTO `aos_sys_icon` VALUES ('1025', 'fa-location-arrow', '3');
INSERT INTO `aos_sys_icon` VALUES ('797', 'fa-lock', '3');
INSERT INTO `aos_sys_icon` VALUES ('1101', 'fa-long-arrow-down', '3');
INSERT INTO `aos_sys_icon` VALUES ('1103', 'fa-long-arrow-left', '3');
INSERT INTO `aos_sys_icon` VALUES ('1104', 'fa-long-arrow-right', '3');
INSERT INTO `aos_sys_icon` VALUES ('1102', 'fa-long-arrow-up', '3');
INSERT INTO `aos_sys_icon` VALUES ('948', 'fa-magic', '3');
INSERT INTO `aos_sys_icon` VALUES ('876', 'fa-magnet', '3');
INSERT INTO `aos_sys_icon` VALUES ('1114', 'fa-male', '3');
INSERT INTO `aos_sys_icon` VALUES ('826', 'fa-map-marker', '3');
INSERT INTO `aos_sys_icon` VALUES ('1042', 'fa-maxcdn', '3');
INSERT INTO `aos_sys_icon` VALUES ('1243', 'fa-meanpath', '3');
INSERT INTO `aos_sys_icon` VALUES ('988', 'fa-medkit', '3');
INSERT INTO `aos_sys_icon` VALUES ('1016', 'fa-meh-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('1036', 'fa-microphone', '3');
INSERT INTO `aos_sys_icon` VALUES ('1037', 'fa-microphone-slash', '3');
INSERT INTO `aos_sys_icon` VALUES ('863', 'fa-minus', '3');
INSERT INTO `aos_sys_icon` VALUES ('846', 'fa-minus-circle', '3');
INSERT INTO `aos_sys_icon` VALUES ('1057', 'fa-minus-square', '3');
INSERT INTO `aos_sys_icon` VALUES ('1058', 'fa-minus-square-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('1004', 'fa-mobile', '3');
INSERT INTO `aos_sys_icon` VALUES ('954', 'fa-money', '3');
INSERT INTO `aos_sys_icon` VALUES ('1117', 'fa-moon-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('766', 'fa-music', '3');
INSERT INTO `aos_sys_icon` VALUES ('1211', 'fa-newspaper-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('1137', 'fa-openid', '3');
INSERT INTO `aos_sys_icon` VALUES ('821', 'fa-outdent', '3');
INSERT INTO `aos_sys_icon` VALUES ('1123', 'fa-pagelines', '3');
INSERT INTO `aos_sys_icon` VALUES ('1228', 'fa-paint-brush', '3');
INSERT INTO `aos_sys_icon` VALUES ('1194', 'fa-paper-plane', '3');
INSERT INTO `aos_sys_icon` VALUES ('1195', 'fa-paper-plane-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('939', 'fa-paperclip', '3');
INSERT INTO `aos_sys_icon` VALUES ('1199', 'fa-paragraph', '3');
INSERT INTO `aos_sys_icon` VALUES ('837', 'fa-pause', '3');
INSERT INTO `aos_sys_icon` VALUES ('1156', 'fa-paw', '3');
INSERT INTO `aos_sys_icon` VALUES ('1214', 'fa-paypal', '3');
INSERT INTO `aos_sys_icon` VALUES ('825', 'fa-pencil', '3');
INSERT INTO `aos_sys_icon` VALUES ('1062', 'fa-pencil-square', '3');
INSERT INTO `aos_sys_icon` VALUES ('829', 'fa-pencil-square-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('905', 'fa-phone', '3');
INSERT INTO `aos_sys_icon` VALUES ('908', 'fa-phone-square', '3');
INSERT INTO `aos_sys_icon` VALUES ('824', 'fa-picture-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('1231', 'fa-pie-chart', '3');
INSERT INTO `aos_sys_icon` VALUES ('1148', 'fa-pied-piper', '3');
INSERT INTO `aos_sys_icon` VALUES ('1149', 'fa-pied-piper-alt', '3');
INSERT INTO `aos_sys_icon` VALUES ('950', 'fa-pinterest', '3');
INSERT INTO `aos_sys_icon` VALUES ('951', 'fa-pinterest-square', '3');
INSERT INTO `aos_sys_icon` VALUES ('872', 'fa-plane', '3');
INSERT INTO `aos_sys_icon` VALUES ('836', 'fa-play', '3');
INSERT INTO `aos_sys_icon` VALUES ('1055', 'fa-play-circle', '3');
INSERT INTO `aos_sys_icon` VALUES ('793', 'fa-play-circle-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('1207', 'fa-plug', '3');
INSERT INTO `aos_sys_icon` VALUES ('862', 'fa-plus', '3');
INSERT INTO `aos_sys_icon` VALUES ('845', 'fa-plus-circle', '3');
INSERT INTO `aos_sys_icon` VALUES ('992', 'fa-plus-square', '3');
INSERT INTO `aos_sys_icon` VALUES ('1132', 'fa-plus-square-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('781', 'fa-power-off', '3');
INSERT INTO `aos_sys_icon` VALUES ('809', 'fa-print', '3');
INSERT INTO `aos_sys_icon` VALUES ('1035', 'fa-puzzle-piece', '3');
INSERT INTO `aos_sys_icon` VALUES ('1192', 'fa-qq', '3');
INSERT INTO `aos_sys_icon` VALUES ('803', 'fa-qrcode', '3');
INSERT INTO `aos_sys_icon` VALUES ('1029', 'fa-question', '3');
INSERT INTO `aos_sys_icon` VALUES ('849', 'fa-question-circle', '3');
INSERT INTO `aos_sys_icon` VALUES ('1006', 'fa-quote-left', '3');
INSERT INTO `aos_sys_icon` VALUES ('1007', 'fa-quote-right', '3');
INSERT INTO `aos_sys_icon` VALUES ('874', 'fa-random', '3');
INSERT INTO `aos_sys_icon` VALUES ('1186', 'fa-rebel', '3');
INSERT INTO `aos_sys_icon` VALUES ('1164', 'fa-recycle', '3');
INSERT INTO `aos_sys_icon` VALUES ('1142', 'fa-reddit', '3');
INSERT INTO `aos_sys_icon` VALUES ('1143', 'fa-reddit-square', '3');
INSERT INTO `aos_sys_icon` VALUES ('795', 'fa-refresh', '3');
INSERT INTO `aos_sys_icon` VALUES ('1122', 'fa-renren', '3');
INSERT INTO `aos_sys_icon` VALUES ('794', 'fa-repeat', '3');
INSERT INTO `aos_sys_icon` VALUES ('1010', 'fa-reply', '3');
INSERT INTO `aos_sys_icon` VALUES ('1023', 'fa-reply-all', '3');
INSERT INTO `aos_sys_icon` VALUES ('879', 'fa-retweet', '3');
INSERT INTO `aos_sys_icon` VALUES ('788', 'fa-road', '3');
INSERT INTO `aos_sys_icon` VALUES ('1041', 'fa-rocket', '3');
INSERT INTO `aos_sys_icon` VALUES ('914', 'fa-rss', '3');
INSERT INTO `aos_sys_icon` VALUES ('1054', 'fa-rss-square', '3');
INSERT INTO `aos_sys_icon` VALUES ('1074', 'fa-rub', '3');
INSERT INTO `aos_sys_icon` VALUES ('937', 'fa-scissors', '3');
INSERT INTO `aos_sys_icon` VALUES ('767', 'fa-search', '3');
INSERT INTO `aos_sys_icon` VALUES ('780', 'fa-search-minus', '3');
INSERT INTO `aos_sys_icon` VALUES ('779', 'fa-search-plus', '3');
INSERT INTO `aos_sys_icon` VALUES ('859', 'fa-share', '3');
INSERT INTO `aos_sys_icon` VALUES ('1201', 'fa-share-alt', '3');
INSERT INTO `aos_sys_icon` VALUES ('1202', 'fa-share-alt-square', '3');
INSERT INTO `aos_sys_icon` VALUES ('1064', 'fa-share-square', '3');
INSERT INTO `aos_sys_icon` VALUES ('830', 'fa-share-square-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('1038', 'fa-shield', '3');
INSERT INTO `aos_sys_icon` VALUES ('880', 'fa-shopping-cart', '3');
INSERT INTO `aos_sys_icon` VALUES ('900', 'fa-sign-in', '3');
INSERT INTO `aos_sys_icon` VALUES ('896', 'fa-sign-out', '3');
INSERT INTO `aos_sys_icon` VALUES ('782', 'fa-signal', '3');
INSERT INTO `aos_sys_icon` VALUES ('971', 'fa-sitemap', '3');
INSERT INTO `aos_sys_icon` VALUES ('1110', 'fa-skype', '3');
INSERT INTO `aos_sys_icon` VALUES ('1134', 'fa-slack', '3');
INSERT INTO `aos_sys_icon` VALUES ('1200', 'fa-sliders', '3');
INSERT INTO `aos_sys_icon` VALUES ('1208', 'fa-slideshare', '3');
INSERT INTO `aos_sys_icon` VALUES ('1014', 'fa-smile-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('960', 'fa-sort', '3');
INSERT INTO `aos_sys_icon` VALUES ('1079', 'fa-sort-alpha-asc', '3');
INSERT INTO `aos_sys_icon` VALUES ('1080', 'fa-sort-alpha-desc', '3');
INSERT INTO `aos_sys_icon` VALUES ('1081', 'fa-sort-amount-asc', '3');
INSERT INTO `aos_sys_icon` VALUES ('1082', 'fa-sort-amount-desc', '3');
INSERT INTO `aos_sys_icon` VALUES ('962', 'fa-sort-asc', '3');
INSERT INTO `aos_sys_icon` VALUES ('961', 'fa-sort-desc', '3');
INSERT INTO `aos_sys_icon` VALUES ('1083', 'fa-sort-numeric-asc', '3');
INSERT INTO `aos_sys_icon` VALUES ('1084', 'fa-sort-numeric-desc', '3');
INSERT INTO `aos_sys_icon` VALUES ('1170', 'fa-soundcloud', '3');
INSERT INTO `aos_sys_icon` VALUES ('1133', 'fa-space-shuttle', '3');
INSERT INTO `aos_sys_icon` VALUES ('1008', 'fa-spinner', '3');
INSERT INTO `aos_sys_icon` VALUES ('1157', 'fa-spoon', '3');
INSERT INTO `aos_sys_icon` VALUES ('1168', 'fa-spotify', '3');
INSERT INTO `aos_sys_icon` VALUES ('941', 'fa-square', '3');
INSERT INTO `aos_sys_icon` VALUES ('906', 'fa-square-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('1124', 'fa-stack-exchange', '3');
INSERT INTO `aos_sys_icon` VALUES ('1093', 'fa-stack-overflow', '3');
INSERT INTO `aos_sys_icon` VALUES ('770', 'fa-star', '3');
INSERT INTO `aos_sys_icon` VALUES ('894', 'fa-star-half', '3');
INSERT INTO `aos_sys_icon` VALUES ('1024', 'fa-star-half-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('771', 'fa-star-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('1162', 'fa-steam', '3');
INSERT INTO `aos_sys_icon` VALUES ('1163', 'fa-steam-square', '3');
INSERT INTO `aos_sys_icon` VALUES ('833', 'fa-step-backward', '3');
INSERT INTO `aos_sys_icon` VALUES ('841', 'fa-step-forward', '3');
INSERT INTO `aos_sys_icon` VALUES ('979', 'fa-stethoscope', '3');
INSERT INTO `aos_sys_icon` VALUES ('838', 'fa-stop', '3');
INSERT INTO `aos_sys_icon` VALUES ('945', 'fa-strikethrough', '3');
INSERT INTO `aos_sys_icon` VALUES ('1145', 'fa-stumbleupon', '3');
INSERT INTO `aos_sys_icon` VALUES ('1144', 'fa-stumbleupon-circle', '3');
INSERT INTO `aos_sys_icon` VALUES ('1033', 'fa-subscript', '3');
INSERT INTO `aos_sys_icon` VALUES ('980', 'fa-suitcase', '3');
INSERT INTO `aos_sys_icon` VALUES ('1116', 'fa-sun-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('1032', 'fa-superscript', '3');
INSERT INTO `aos_sys_icon` VALUES ('947', 'fa-table', '3');
INSERT INTO `aos_sys_icon` VALUES ('1003', 'fa-tablet', '3');
INSERT INTO `aos_sys_icon` VALUES ('967', 'fa-tachometer', '3');
INSERT INTO `aos_sys_icon` VALUES ('805', 'fa-tag', '3');
INSERT INTO `aos_sys_icon` VALUES ('806', 'fa-tags', '3');
INSERT INTO `aos_sys_icon` VALUES ('929', 'fa-tasks', '3');
INSERT INTO `aos_sys_icon` VALUES ('1166', 'fa-taxi', '3');
INSERT INTO `aos_sys_icon` VALUES ('1191', 'fa-tencent-weibo', '3');
INSERT INTO `aos_sys_icon` VALUES ('1021', 'fa-terminal', '3');
INSERT INTO `aos_sys_icon` VALUES ('814', 'fa-text-height', '3');
INSERT INTO `aos_sys_icon` VALUES ('815', 'fa-text-width', '3');
INSERT INTO `aos_sys_icon` VALUES ('775', 'fa-th', '3');
INSERT INTO `aos_sys_icon` VALUES ('774', 'fa-th-large', '3');
INSERT INTO `aos_sys_icon` VALUES ('776', 'fa-th-list', '3');
INSERT INTO `aos_sys_icon` VALUES ('898', 'fa-thumb-tack', '3');
INSERT INTO `aos_sys_icon` VALUES ('1086', 'fa-thumbs-down', '3');
INSERT INTO `aos_sys_icon` VALUES ('893', 'fa-thumbs-o-down', '3');
INSERT INTO `aos_sys_icon` VALUES ('892', 'fa-thumbs-o-up', '3');
INSERT INTO `aos_sys_icon` VALUES ('1085', 'fa-thumbs-up', '3');
INSERT INTO `aos_sys_icon` VALUES ('1056', 'fa-ticket', '3');
INSERT INTO `aos_sys_icon` VALUES ('778', 'fa-times', '3');
INSERT INTO `aos_sys_icon` VALUES ('847', 'fa-times-circle', '3');
INSERT INTO `aos_sys_icon` VALUES ('852', 'fa-times-circle-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('828', 'fa-tint', '3');
INSERT INTO `aos_sys_icon` VALUES ('1235', 'fa-toggle-off', '3');
INSERT INTO `aos_sys_icon` VALUES ('1236', 'fa-toggle-on', '3');
INSERT INTO `aos_sys_icon` VALUES ('1224', 'fa-trash', '3');
INSERT INTO `aos_sys_icon` VALUES ('784', 'fa-trash-o', '3');
INSERT INTO `aos_sys_icon` VALUES ('1167', 'fa-tree', '3');
INSERT INTO `aos_sys_icon` VALUES ('1112', 'fa-trello', '3');
INSERT INTO `aos_sys_icon` VALUES ('901', 'fa-trophy', '3');
INSERT INTO `aos_sys_icon` VALUES ('949', 'fa-truck', '3');
INSERT INTO `aos_sys_icon` VALUES ('1131', 'fa-try', '3');
INSERT INTO `aos_sys_icon` VALUES ('1205', 'fa-tty', '3');
INSERT INTO `aos_sys_icon` VALUES ('1099', 'fa-tumblr', '3');
INSERT INTO `aos_sys_icon` VALUES ('1100', 'fa-tumblr-square', '3');
INSERT INTO `aos_sys_icon` VALUES ('1209', 'fa-twitch', '3');
INSERT INTO `aos_sys_icon` VALUES ('909', 'fa-twitter', '3');
INSERT INTO `aos_sys_icon` VALUES ('886', 'fa-twitter-square', '3');
INSERT INTO `aos_sys_icon` VALUES ('972', 'fa-umbrella', '3');
INSERT INTO `aos_sys_icon` VALUES ('946', 'fa-underline', '3');
INSERT INTO `aos_sys_icon` VALUES ('965', 'fa-undo', '3');
INSERT INTO `aos_sys_icon` VALUES ('1138', 'fa-university', '3');
INSERT INTO `aos_sys_icon` VALUES ('912', 'fa-unlock', '3');
INSERT INTO `aos_sys_icon` VALUES ('1050', 'fa-unlock-alt', '3');
INSERT INTO `aos_sys_icon` VALUES ('903', 'fa-upload', '3');
INSERT INTO `aos_sys_icon` VALUES ('1071', 'fa-usd', '3');
INSERT INTO `aos_sys_icon` VALUES ('772', 'fa-user', '3');
INSERT INTO `aos_sys_icon` VALUES ('978', 'fa-user-md', '3');
INSERT INTO `aos_sys_icon` VALUES ('933', 'fa-users', '3');
INSERT INTO `aos_sys_icon` VALUES ('823', 'fa-video-camera', '3');
INSERT INTO `aos_sys_icon` VALUES ('1130', 'fa-vimeo-square', '3');
INSERT INTO `aos_sys_icon` VALUES ('1181', 'fa-vine', '3');
INSERT INTO `aos_sys_icon` VALUES ('1120', 'fa-vk', '3');
INSERT INTO `aos_sys_icon` VALUES ('801', 'fa-volume-down', '3');
INSERT INTO `aos_sys_icon` VALUES ('800', 'fa-volume-off', '3');
INSERT INTO `aos_sys_icon` VALUES ('802', 'fa-volume-up', '3');
INSERT INTO `aos_sys_icon` VALUES ('1121', 'fa-weibo', '3');
INSERT INTO `aos_sys_icon` VALUES ('1193', 'fa-weixin', '3');
INSERT INTO `aos_sys_icon` VALUES ('1129', 'fa-wheelchair', '3');
INSERT INTO `aos_sys_icon` VALUES ('1212', 'fa-wifi', '3');
INSERT INTO `aos_sys_icon` VALUES ('1106', 'fa-windows', '3');
INSERT INTO `aos_sys_icon` VALUES ('1136', 'fa-wordpress', '3');
INSERT INTO `aos_sys_icon` VALUES ('928', 'fa-wrench', '3');
INSERT INTO `aos_sys_icon` VALUES ('1089', 'fa-xing', '3');
INSERT INTO `aos_sys_icon` VALUES ('1090', 'fa-xing-square', '3');
INSERT INTO `aos_sys_icon` VALUES ('1140', 'fa-yahoo', '3');
INSERT INTO `aos_sys_icon` VALUES ('1210', 'fa-yelp', '3');
INSERT INTO `aos_sys_icon` VALUES ('1088', 'fa-youtube', '3');
INSERT INTO `aos_sys_icon` VALUES ('1091', 'fa-youtube-play', '3');
INSERT INTO `aos_sys_icon` VALUES ('1087', 'fa-youtube-square', '3');
INSERT INTO `aos_sys_icon` VALUES ('10102', 'filter.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10103', 'folder1.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10104', 'folder10.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10105', 'folder11.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10106', 'folder12.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10107', 'folder13.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10108', 'folder14.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10109', 'folder15.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10110', 'folder16.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10111', 'folder17.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10112', 'folder18.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10113', 'folder19.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10114', 'folder2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10115', 'folder20.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10116', 'folder21.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10117', 'folder22.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10118', 'folder23.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10119', 'folder24.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10120', 'folder25.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10121', 'folder26.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10122', 'folder27.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10123', 'folder28.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10124', 'folder4.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10125', 'folder5.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10126', 'folder6.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10127', 'folder7.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10128', 'folder8.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10129', 'folder9.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10130', 'forward.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10131', 'freelance.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10132', 'go.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('10133', 'go.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10134', 'go1.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('10135', 'go1.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10136', 'help.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10137', 'home.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('10138', 'home.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10139', 'icon134.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10140', 'icon137.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10141', 'icon140.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10142', 'icon141.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10143', 'icon146.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10144', 'icon15.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10145', 'icon150.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10146', 'icon152.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10147', 'icon153.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10148', 'icon154.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10149', 'icon17.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('10150', 'icon25.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('10151', 'icon26.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('10152', 'icon31.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('10153', 'icon32.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('10154', 'icon34.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('10155', 'icon35.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('10156', 'icon36.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('10157', 'icon37.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('10158', 'icon38.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('10159', 'icon39.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('10160', 'icon41.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('10161', 'icon42.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('10162', 'icon5.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10163', 'icon56.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10164', 'icon59.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10165', 'icon63.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10166', 'icon65.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10167', 'icon66.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10168', 'icon67.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10169', 'icon68.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10170', 'icon7.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10171', 'icon70.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10172', 'icon71.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10173', 'icon72.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10174', 'icon75.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10175', 'icon76.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10176', 'icon77.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10177', 'icon78.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10178', 'icon79.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10179', 'icon8.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10180', 'icon80.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10181', 'icon82.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10182', 'icon85.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10183', 'icon86.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10184', 'icon88.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10185', 'icon9.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10186', 'icon96.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10187', 'icon_19.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10188', 'icq.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10189', 'id.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10190', 'ins.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10191', 'jar.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10192', 'key.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10193', 'layout.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10194', 'layout2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10195', 'left.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10196', 'lightbulb.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10197', 'lock.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10198', 'lock3.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10199', 'modules_wizard.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('10200', 'monitor.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10201', 'node.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10202', 'ok.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10203', 'ok1.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10204', 'ok3.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10205', 'ok4.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10206', 'ok5.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10207', 'org.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10208', 'org2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10209', 'outs.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10210', 'own.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10211', 'page.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10212', 'page2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10213', 'page3.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10214', 'page_code.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10215', 'page_font.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10216', 'page_next.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10217', 'page_office.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10218', 'page_paint.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10219', 'page_picture.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10220', 'page_vector.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10221', 'paint2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10222', 'paste.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10223', 'picture.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10224', 'pictures.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10225', 'picture_empty.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10226', 'plugin.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10227', 'plugin2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10228', 'printer.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10229', 'query.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10230', 'redo.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10231', 'refresh.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10232', 'refresh2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10233', 'right.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10234', 'save.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10235', 'save_all.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10236', 'search.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10237', 'security.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10238', 'send_receive.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10239', 'shape_align_bottom.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10240', 'shape_align_center.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10241', 'shape_align_middle.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10242', 'shape_group.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10243', 'shape_handles.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10244', 'shape_move_back.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10245', 'share.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10246', 'sitemap.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10247', 'sql.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10248', 'sql2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10249', 'sql3.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10250', 'stop.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('10251', 'stop2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10252', 'stop3.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10253', 'system.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10254', 'table.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10255', 'table2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10256', 'tables.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10257', 'tables_relation.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10258', 'table_edit.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10259', 'tag.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10260', 'task.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10261', 'task1.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10262', 'task_finish.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10263', 'task_list.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10264', 'terminal.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10265', 'textfield.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10266', 'text_cap.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10267', 'text_col.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10268', 'text_list.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10269', 'text_upper.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10270', 'theme.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10271', 'time.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10272', 'timeline.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10273', 'undo.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10274', 'up.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10275', 'up2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10276', 'up_left.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10277', 'up_right.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10278', 'user1.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10279', 'user20.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10280', 'user3.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10281', 'user6.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10282', 'user8.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10283', 'vcard.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10284', 'vector.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10285', 'wand.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10286', 'webcam.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10287', 'zoom_in.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('10288', 'zoom_out.png', '1');

-- ----------------------------
-- Table structure for aos_sys_module
-- ----------------------------
DROP TABLE IF EXISTS `aos_sys_module`;
CREATE TABLE `aos_sys_module` (
  `id_` varchar(64) NOT NULL COMMENT '功能模块流水号',
  `cascade_id_` varchar(255) NOT NULL COMMENT '节点语义ID',
  `name_` varchar(255) NOT NULL COMMENT '功能模块名称',
  `url_` varchar(255) default NULL COMMENT '主页面URL',
  `hotkey_` varchar(255) default NULL COMMENT '热键',
  `parent_id_` varchar(64) NOT NULL COMMENT '父节点流水号',
  `is_leaf_` varchar(255) NOT NULL default '1' COMMENT '是否叶子节点',
  `is_auto_expand_` varchar(255) NOT NULL default '0' COMMENT '是否自动展开',
  `icon_name_` varchar(255) default NULL COMMENT '节点图标文件名称',
  `status_` varchar(255) NOT NULL default '1' COMMENT '当前状态',
  `parent_name_` varchar(255) NOT NULL COMMENT '父节点名称',
  `vector_` varchar(255) default NULL COMMENT '矢量图标',
  `sort_no_` int(10) default '0' COMMENT '排序号',
  PRIMARY KEY  (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能模块表';

-- ----------------------------
-- Records of aos_sys_module
-- ----------------------------
INSERT INTO `aos_sys_module` VALUES ('078df89c7b5b478cb38fd607805c6155', '0.004.002.001.007', '常用表单元素API', 'demo/initFormApi.jhtml', null, 'f73a952eefa2406c9327da6252c4ca79', '1', '0', null, '1', '表单', null, '20');
INSERT INTO `aos_sys_module` VALUES ('09b24aac059f4ba58bfb30652636b543', '0.004.003.001', '综合实例①', 'demo/layout/initLayout1.jhtml', '', '33baf8c9948b47cfa54cd8d7a5e1753d', '1', '0', '', '1', '综合实例', '', '10');
INSERT INTO `aos_sys_module` VALUES ('0b99e9d118b54ee084d9e74bd72cdd1c', '0.001.002', '资源管理', null, null, '7a6d3674e5204937951d01544e18e3aa', '0', '1', 'folder14.png', '1', '系统管理', null, '20');
INSERT INTO `aos_sys_module` VALUES ('1886bf699ec74f79959bdc8ca8e5371a', '0.001.006.004', '会话监控', 'system/sessionLog/init.jhtml', null, '5b9a439743f141729f46a07e8e222a47', '1', '0', 'c_key.png', '1', '监控与审计', null, '10');
INSERT INTO `aos_sys_module` VALUES ('1906d5a892654e2bb882851e0ea7322f', '0.001.008.001', '图标', 'system/icon/init.jhtml', null, '524e5f5c3e5b4cdb90611cd8b15ca684', '1', '0', 'page_picture.png', '1', '开发工具箱', null, '60');
INSERT INTO `aos_sys_module` VALUES ('1cf1947152174cacaf226fa54ca51351', '0.004.002.001.009', '表单校验', 'demo/initFormValidate.jhtml', null, 'f73a952eefa2406c9327da6252c4ca79', '1', '0', null, '1', '表单', null, '8');
INSERT INTO `aos_sys_module` VALUES ('25406890354f4514909e2ad1c0fd678d', '0.004.002.003.001', '表格①', 'demo/grid/initGrid1.jhtml', null, 'dbf75990cf784e79920caf7eb47856f6', '1', '0', null, '1', '表格', null, '10');
INSERT INTO `aos_sys_module` VALUES ('266bbec9e0af4612afa5139aade0a511', '0.004.002.001.006', '组合选择框', 'demo/initFormComboBox.jhtml', null, 'f73a952eefa2406c9327da6252c4ca79', '1', '0', null, '1', '表单', null, '30');
INSERT INTO `aos_sys_module` VALUES ('2790bf6cc0b54c36b56c90429c112ab2', '0.001.008.005', 'WebIDE', 'system/coder/init.jhtml', null, '524e5f5c3e5b4cdb90611cd8b15ca684', '1', '0', 'icon15.png', '1', '开发工具箱', null, '5');
INSERT INTO `aos_sys_module` VALUES ('29873ca569fb46c3bbd951a8a1df2472', '0.002', '项目导航', null, null, '2a4c060f44d944ea926fe44522ce7b39', '0', '1', 'folder2.png', '1', 'AOS应用基础平台', 'fa-github-alt', '20');
INSERT INTO `aos_sys_module` VALUES ('2a4c060f44d944ea926fe44522ce7b39', '0', 'AOS应用基础平台', null, null, 'p', '0', '1', 'home.png', '1', 'root', null, '1');
INSERT INTO `aos_sys_module` VALUES ('327677ef8d2a4e5caf3c4cbc9b72d0b0', '0.004.002.003.004', '客户端分页表格', 'demo/grid/initGrid3.jhtml', null, 'dbf75990cf784e79920caf7eb47856f6', '1', '0', null, '1', '表格', null, '40');
INSERT INTO `aos_sys_module` VALUES ('33baf8c9948b47cfa54cd8d7a5e1753d', '0.004.003', '综合实例', '', '', '6e10c86d1885434e80e6dfa0953e307d', '0', '1', '', '1', '范例', '', '20');
INSERT INTO `aos_sys_module` VALUES ('38e28fce49414c4c9e95d032559d5bee', '0.004.002.002', '按钮', 'demo/initButton.jhtml', null, '6cab8b013c314b37aec7c4567d859fc8', '1', '0', null, '1', 'AOS UI组件库', null, '10');
INSERT INTO `aos_sys_module` VALUES ('3bb16fa3935c41bebe4d3fcf3c4ebd5c', '0.004.004', '杂项', '', '', '6e10c86d1885434e80e6dfa0953e307d', '0', '0', '', '1', '范例', '', '15');
INSERT INTO `aos_sys_module` VALUES ('4d3cfce7b9b146d2bc8482ec477517aa', '0.002.001', '首选项', 'system/preference/init.jhtml', null, '29873ca569fb46c3bbd951a8a1df2472', '1', '0', 'config1.png', '1', '项目导航', null, '10');
INSERT INTO `aos_sys_module` VALUES ('524e5f5c3e5b4cdb90611cd8b15ca684', '0.001.008', '开发工具箱', null, null, '7a6d3674e5204937951d01544e18e3aa', '0', '0', 'folder9.png', '1', '系统管理', 'fa-bug', '70');
INSERT INTO `aos_sys_module` VALUES ('591f2ffa62a1461887c1d6f02c60a1ff', '0.004.004.002', '消息通知窗口', 'demo/initNotification.jhtml', null, '3bb16fa3935c41bebe4d3fcf3c4ebd5c', '1', '0', null, '1', '杂项', null, '2');
INSERT INTO `aos_sys_module` VALUES ('5ae41d35d16247febabf631a81a0d70d', '0.004.002.001.008', '表单数据交互', 'demo/initFormData.jhtml', null, 'f73a952eefa2406c9327da6252c4ca79', '1', '0', null, '1', '表单', null, '40');
INSERT INTO `aos_sys_module` VALUES ('5b9a439743f141729f46a07e8e222a47', '0.001.006', '监控与审计', null, null, '7a6d3674e5204937951d01544e18e3aa', '0', '0', 'folder27.png', '1', '系统管理', null, '60');
INSERT INTO `aos_sys_module` VALUES ('5fb994e71cb14a77891670990d7f554d', '0.001.001', '基础数据', null, null, '7a6d3674e5204937951d01544e18e3aa', '0', '1', 'folder2.png', '1', '系统管理', null, '10');
INSERT INTO `aos_sys_module` VALUES ('619cb338b278406f8368471034d5946f', '0.001.004.006', '任务节点', 'workflow/procTask/init.jhtml', '', 'cfc4e4bd367047a29e0d72e688f860a2', '1', '0', 'task_list.png', '1', '业务流程管理', '', '40');
INSERT INTO `aos_sys_module` VALUES ('65320b914c18453f9ca0a84d3f8a0a7b', '0.001.003.001', '组织架构', 'system/org/init.jhtml', null, 'b656d6afbbe844d0a6626d0eb590643f', '1', '0', 'icon56.png', '1', '组织与权限', null, '1');
INSERT INTO `aos_sys_module` VALUES ('68822bfa39914373afe70dc343c84e94', '0.004.002.001.005', '常用表单元素', 'demo/initFormElements.jhtml', null, 'f73a952eefa2406c9327da6252c4ca79', '1', '0', null, '1', '表单', null, '10');
INSERT INTO `aos_sys_module` VALUES ('6cab8b013c314b37aec7c4567d859fc8', '0.004.002', 'AOS UI组件库', null, null, '6e10c86d1885434e80e6dfa0953e307d', '0', '1', null, '1', '范例', null, '10');
INSERT INTO `aos_sys_module` VALUES ('6e10c86d1885434e80e6dfa0953e307d', '0.004', '范例', null, null, '2a4c060f44d944ea926fe44522ce7b39', '0', '1', 'folder27.png', '1', 'AOS应用基础平台', 'fa-coffee', '40');
INSERT INTO `aos_sys_module` VALUES ('704d4e51ffcf473fa95ab9e680177d46', '0.004.002.003.002', '表格②', 'demo/grid/initGrid2.jhtml', null, 'dbf75990cf784e79920caf7eb47856f6', '1', '0', null, '1', '表格', null, '20');
INSERT INTO `aos_sys_module` VALUES ('715f6cf8d2ce4fa694baf2259327f6b1', '0.001.003.002', '岗位与授权', 'system/post/init.jhtml', null, 'b656d6afbbe844d0a6626d0eb590643f', '1', '0', 'icon137.png', '1', '组织与权限', null, '3');
INSERT INTO `aos_sys_module` VALUES ('73b69ca49e2240ba8717fc13acb884c2', '0.004.002.001.001', '表单布局①', 'demo/initForm1.jhtml', null, 'f73a952eefa2406c9327da6252c4ca79', '1', '0', null, '1', '表单', null, '1');
INSERT INTO `aos_sys_module` VALUES ('7a6d3674e5204937951d01544e18e3aa', '0.001', '系统管理', null, null, '2a4c060f44d944ea926fe44522ce7b39', '0', '1', 'folder22.png', '1', 'AOS应用基础平台', 'fa-cogs', '10');
INSERT INTO `aos_sys_module` VALUES ('81fc0e05049e467d976ec523182421f2', '0.001.002.004', '序列号', 'system/idMgr/init.jhtml', null, '0b99e9d118b54ee084d9e74bd72cdd1c', '1', '0', 'id.png', '1', '资源管理', null, '30');
INSERT INTO `aos_sys_module` VALUES ('870c482cdb2e4c8aa373dcf447964284', '0.004.002.003.003', '可编辑表格', 'demo/grid/initEditGrid.jhtml', null, 'dbf75990cf784e79920caf7eb47856f6', '1', '0', null, '1', '表格', null, '30');
INSERT INTO `aos_sys_module` VALUES ('88bc371429ce4243a49c5893ae036f6a', '0.004.002.004', '报表', '', '', '6cab8b013c314b37aec7c4567d859fc8', '0', '0', '', '1', 'AOS UI组件库', '', '40');
INSERT INTO `aos_sys_module` VALUES ('97c8a95d0aa84d7cba2a8b536ba5326a', '0.004.002.001.002', '表单布局②', 'demo/initForm2.jhtml', null, 'f73a952eefa2406c9327da6252c4ca79', '1', '0', null, '1', '表单', null, '2');
INSERT INTO `aos_sys_module` VALUES ('9a8e5cedcd514af2b37cf5828f509f94', '0.001.001.003', '分类科目', 'system/catalog/init.jhtml', null, '5fb994e71cb14a77891670990d7f554d', '1', '0', 'icon146.png', '1', '基础数据', null, '20');
INSERT INTO `aos_sys_module` VALUES ('9e4cf77815dd49fbac4158c62af3197a', '0.001.001.001', '键值参数', 'system/param/init.jhtml', null, '5fb994e71cb14a77891670990d7f554d', '1', '0', 'icon79.png', '1', '基础数据', null, '1');
INSERT INTO `aos_sys_module` VALUES ('a21b52d911bb44c2978e52bbc523de51', '0.001.004.002', '流程部署', 'workflow/procDeploy/init.jhtml', null, 'cfc4e4bd367047a29e0d72e688f860a2', '1', '0', 'modules_wizard.gif', '1', '业务流程管理', null, '10');
INSERT INTO `aos_sys_module` VALUES ('a27532c1cc8948e5b9bd7d8ac2e30a42', '0.004.002.006.001', '布局①', '', '', 'f84a495bca10403ebe8351d4737dfc72', '1', '0', '', '1', '容器布局', '', '1');
INSERT INTO `aos_sys_module` VALUES ('a4d2ef333e35476680786df9a89e200b', '0.004.002.004.001', '报表①', 'demo/report/initReport1.jhtml', null, '88bc371429ce4243a49c5893ae036f6a', '1', '0', null, '1', '报表', null, '1');
INSERT INTO `aos_sys_module` VALUES ('b656d6afbbe844d0a6626d0eb590643f', '0.001.003', '组织与权限', null, null, '7a6d3674e5204937951d01544e18e3aa', '0', '1', 'folder23.png', '1', '系统管理', null, '30');
INSERT INTO `aos_sys_module` VALUES ('ba90369eb83540bab4d9492bc17f0937', '0.001.004.005', '流程实例', 'workflow/procInst/init.jhtml', null, 'cfc4e4bd367047a29e0d72e688f860a2', '1', '0', 'icon5.png', '1', '业务流程管理', null, '30');
INSERT INTO `aos_sys_module` VALUES ('bc3c9877c598404da7e31355a4deebad', '0.001.008.002', 'WebSQL', 'system/webSql/init.jhtml', null, '524e5f5c3e5b4cdb90611cd8b15ca684', '1', '0', 'sql.png', '1', '开发工具箱', null, '10');
INSERT INTO `aos_sys_module` VALUES ('bf530e26480d43b08dd20e31e31274af', '0.001.003.006', '角色与授权', 'system/role/init.jhtml', null, 'b656d6afbbe844d0a6626d0eb590643f', '1', '0', 'icon134.png', '1', '组织与权限', null, '5');
INSERT INTO `aos_sys_module` VALUES ('cfc4e4bd367047a29e0d72e688f860a2', '0.001.004', '业务流程管理', null, null, '7a6d3674e5204937951d01544e18e3aa', '0', '1', 'folder24.png', '1', '系统管理', null, '40');
INSERT INTO `aos_sys_module` VALUES ('d452524058ff42cfb9e5146dacd0cd79', '0.001.006.002', '操作日志', null, null, '5b9a439743f141729f46a07e8e222a47', '1', '0', 'user20.png', '1', '监控与审计', null, '20');
INSERT INTO `aos_sys_module` VALUES ('dbf75990cf784e79920caf7eb47856f6', '0.004.002.003', '表格', null, null, '6cab8b013c314b37aec7c4567d859fc8', '0', '1', null, '1', 'AOS UI组件库', null, '30');
INSERT INTO `aos_sys_module` VALUES ('e3e403f7b94247c7827d8f280f06b64d', '0.004.002.001.003', '表单布局③', 'demo/initForm3.jhtml', null, 'f73a952eefa2406c9327da6252c4ca79', '1', '0', null, '1', '表单', null, '3');
INSERT INTO `aos_sys_module` VALUES ('e7bb35f24a634a759cef64d28411901f', '0.004.004.001', '存储过程调用', 'demo/procedure/init.jhtml', null, '3bb16fa3935c41bebe4d3fcf3c4ebd5c', '1', '0', null, '1', '杂项', null, '10');
INSERT INTO `aos_sys_module` VALUES ('e9de0eacf61a4aa6b1ed0c210fc209fe', '0.004.004.003', '页面组件复用', 'demo/initShare.jhtml', null, '3bb16fa3935c41bebe4d3fcf3c4ebd5c', '1', '0', null, '1', '杂项', null, '20');
INSERT INTO `aos_sys_module` VALUES ('f107450058a2438eb6ad9bf6a4d7e967', '0.001.001.002', '字典参数', 'system/dictionary/init.jhtml', null, '5fb994e71cb14a77891670990d7f554d', '1', '0', 'icon154.png', '1', '基础数据', null, '10');
INSERT INTO `aos_sys_module` VALUES ('f405a849f27d4ddebf7f8a2dfbf30bea', '0.001.002.001', '功能模块', 'system/module/init.jhtml', null, '0b99e9d118b54ee084d9e74bd72cdd1c', '1', '0', 'icon75.png', '1', '资源管理', null, '10');
INSERT INTO `aos_sys_module` VALUES ('f73a952eefa2406c9327da6252c4ca79', '0.004.002.001', '表单', '', '', '6cab8b013c314b37aec7c4567d859fc8', '0', '0', '', '1', 'AOS UI组件库', '', '20');
INSERT INTO `aos_sys_module` VALUES ('f81608054a714b60adb0b1ed574c6b6c', '0.001.003.003', '用户与授权', 'system/user/init.jhtml', null, 'b656d6afbbe844d0a6626d0eb590643f', '1', '0', 'user6.png', '1', '组织与权限', null, '4');
INSERT INTO `aos_sys_module` VALUES ('f84a495bca10403ebe8351d4737dfc72', '0.004.002.006', '容器布局', '', '', '6cab8b013c314b37aec7c4567d859fc8', '0', '0', '', '1', 'AOS UI组件库', '', '35');
INSERT INTO `aos_sys_module` VALUES ('fd88d0de59024e4db81ead8510b6bd98', '0.001.002.003', '页面组件', 'system/page/init.jhtml', null, '0b99e9d118b54ee084d9e74bd72cdd1c', '1', '0', 'icon59.png', '1', '资源管理', null, '20');

-- ----------------------------
-- Table structure for aos_sys_module_post
-- ----------------------------
DROP TABLE IF EXISTS `aos_sys_module_post`;
CREATE TABLE `aos_sys_module_post` (
  `id_` varchar(64) NOT NULL COMMENT '流水号',
  `post_id_` varchar(64) NOT NULL COMMENT '岗位流水号',
  `module_id_` varchar(64) NOT NULL COMMENT '功能模块流水号',
  `grant_type_` varchar(255) NOT NULL COMMENT '权限类型(岗位仅提供经办权限)',
  `operate_time_` varchar(255) NOT NULL COMMENT '授权时间',
  `operator_id_` varchar(64) NOT NULL COMMENT '授权人流水号',
  PRIMARY KEY  (`id_`),
  UNIQUE KEY `aos_sys_module_post_ukey` USING BTREE (`post_id_`,`module_id_`,`grant_type_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能模块-岗位关联表';

-- ----------------------------
-- Records of aos_sys_module_post
-- ----------------------------
INSERT INTO `aos_sys_module_post` VALUES ('01e6f6f7fe924b8d89a846c2dfc7a05f', '60cb0e6359ea46a19a841adc46cf66cf', '715f6cf8d2ce4fa694baf2259327f6b1', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_post` VALUES ('0e95a8527f37467fa0246abbc9de4d95', '60cb0e6359ea46a19a841adc46cf66cf', 'ba90369eb83540bab4d9492bc17f0937', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_post` VALUES ('30cea10ca6bb4628abc80116cf748be5', '60cb0e6359ea46a19a841adc46cf66cf', 'b656d6afbbe844d0a6626d0eb590643f', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_post` VALUES ('30f6dae98d964d3ca62017bf09d8bb40', '60cb0e6359ea46a19a841adc46cf66cf', 'bc3c9877c598404da7e31355a4deebad', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_post` VALUES ('324b0d0319084a6a9f9bc2c9c61d384e', '60cb0e6359ea46a19a841adc46cf66cf', '1906d5a892654e2bb882851e0ea7322f', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_post` VALUES ('51d9d42511274b7c995eaaf1705f9179', '60cb0e6359ea46a19a841adc46cf66cf', '5b9a439743f141729f46a07e8e222a47', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_post` VALUES ('5d2a3a46566f433f8ea44c6c795d162d', '60cb0e6359ea46a19a841adc46cf66cf', '81fc0e05049e467d976ec523182421f2', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_post` VALUES ('5d9616a615814d3fb4a07300bce4156a', '60cb0e6359ea46a19a841adc46cf66cf', 'fd88d0de59024e4db81ead8510b6bd98', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_post` VALUES ('65bf789caf3648d1a8653b142a9e130a', '60cb0e6359ea46a19a841adc46cf66cf', 'f405a849f27d4ddebf7f8a2dfbf30bea', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_post` VALUES ('69063560c4374ab483bbe9ced3229420', '60cb0e6359ea46a19a841adc46cf66cf', '9a8e5cedcd514af2b37cf5828f509f94', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_post` VALUES ('6c6f89adb49f4c7eacd83cf17196222f', '60cb0e6359ea46a19a841adc46cf66cf', 'f107450058a2438eb6ad9bf6a4d7e967', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_post` VALUES ('7e48d55cede7414fb68dd14490e9a46f', '60cb0e6359ea46a19a841adc46cf66cf', 'd452524058ff42cfb9e5146dacd0cd79', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_post` VALUES ('8c0b0aa02b14460b825b14b40cfe3ffc', '60cb0e6359ea46a19a841adc46cf66cf', '0b99e9d118b54ee084d9e74bd72cdd1c', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_post` VALUES ('90c0cc96bc7f4ba39b7fa3983b33e405', '60cb0e6359ea46a19a841adc46cf66cf', '1886bf699ec74f79959bdc8ca8e5371a', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_post` VALUES ('91003499b9f24bc58988395b591d7243', '60cb0e6359ea46a19a841adc46cf66cf', 'a21b52d911bb44c2978e52bbc523de51', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_post` VALUES ('a193381281004ea38a889c5c2eb5a0b8', '60cb0e6359ea46a19a841adc46cf66cf', '9e4cf77815dd49fbac4158c62af3197a', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_post` VALUES ('b9cb4fe117904e9b9619ab3cc539fb36', '60cb0e6359ea46a19a841adc46cf66cf', '65320b914c18453f9ca0a84d3f8a0a7b', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_post` VALUES ('bb44d1afa45c46ad8a8534594c759a46', '60cb0e6359ea46a19a841adc46cf66cf', '2a4c060f44d944ea926fe44522ce7b39', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_post` VALUES ('c3574201434947fe80c393907b96fd16', '60cb0e6359ea46a19a841adc46cf66cf', 'bf530e26480d43b08dd20e31e31274af', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_post` VALUES ('caa084c048fa4fecb581680c06879e58', '60cb0e6359ea46a19a841adc46cf66cf', '7a6d3674e5204937951d01544e18e3aa', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_post` VALUES ('d5e18c1411344768808c275c10b66e73', '60cb0e6359ea46a19a841adc46cf66cf', 'cfc4e4bd367047a29e0d72e688f860a2', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_post` VALUES ('dec716f33f094267801fefc5e183b57c', '60cb0e6359ea46a19a841adc46cf66cf', '5fb994e71cb14a77891670990d7f554d', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_post` VALUES ('eaf6119a463a47c3bd8343a99593f736', '60cb0e6359ea46a19a841adc46cf66cf', '524e5f5c3e5b4cdb90611cd8b15ca684', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_post` VALUES ('f39c2c58db8a40db9f330c8d5fac608a', '60cb0e6359ea46a19a841adc46cf66cf', 'f81608054a714b60adb0b1ed574c6b6c', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_post` VALUES ('f3e97c7d8a0f4cb29ba68fe5a6f00e09', '60cb0e6359ea46a19a841adc46cf66cf', '619cb338b278406f8368471034d5946f', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_post` VALUES ('f97e552d5e0c4fcc965d70866c259d50', '60cb0e6359ea46a19a841adc46cf66cf', '2790bf6cc0b54c36b56c90429c112ab2', '1', '2016-02-02 21:55:10', 'fa04db9dd2f54d61b0c8202a25de2dc6');

-- ----------------------------
-- Table structure for aos_sys_module_role
-- ----------------------------
DROP TABLE IF EXISTS `aos_sys_module_role`;
CREATE TABLE `aos_sys_module_role` (
  `id_` varchar(64) NOT NULL COMMENT '流水号',
  `role_id_` varchar(64) NOT NULL COMMENT ' 角色流水号',
  `module_id_` varchar(64) NOT NULL COMMENT '功能模块流水号',
  `grant_type_` varchar(255) NOT NULL COMMENT '权限类型',
  `operate_time_` varchar(255) NOT NULL COMMENT '授权时间',
  `operator_id_` varchar(64) NOT NULL COMMENT '授权人流水号',
  PRIMARY KEY  (`id_`),
  UNIQUE KEY `aos_sys_module_role_ukey` USING BTREE (`role_id_`,`module_id_`,`grant_type_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能模块-角色关联表';

-- ----------------------------
-- Records of aos_sys_module_role
-- ----------------------------
INSERT INTO `aos_sys_module_role` VALUES ('0b48f8f5677d4b4186e30d3434105847', '84f923b5e334498494eda38d8e86ef80', 'cfc4e4bd367047a29e0d72e688f860a2', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_role` VALUES ('1186e6575fac43fe98640eca6e3c03b6', '84f923b5e334498494eda38d8e86ef80', '5fb994e71cb14a77891670990d7f554d', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_role` VALUES ('1939747179be463fb49c9c94c15cb5ae', '84f923b5e334498494eda38d8e86ef80', 'bf530e26480d43b08dd20e31e31274af', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_role` VALUES ('3e5cbb7d49d94be7b6a2a37c5553a041', '84f923b5e334498494eda38d8e86ef80', 'fd88d0de59024e4db81ead8510b6bd98', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_role` VALUES ('4697b53bc7e04d7cb2267d44e4f9b438', '84f923b5e334498494eda38d8e86ef80', '0b99e9d118b54ee084d9e74bd72cdd1c', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_role` VALUES ('5785a83aea394a1b9d5a66c85a377f2f', '84f923b5e334498494eda38d8e86ef80', '1906d5a892654e2bb882851e0ea7322f', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_role` VALUES ('5b864436a0004966b711e75e05cabb47', '84f923b5e334498494eda38d8e86ef80', 'ba90369eb83540bab4d9492bc17f0937', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_role` VALUES ('682b98882cd6488287e6863caa31ade4', '84f923b5e334498494eda38d8e86ef80', 'f107450058a2438eb6ad9bf6a4d7e967', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_role` VALUES ('6f12960924884a56b49d3374fe1d0484', '84f923b5e334498494eda38d8e86ef80', '715f6cf8d2ce4fa694baf2259327f6b1', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_role` VALUES ('700d87c2b3fc4e668a90bff6534993c4', '84f923b5e334498494eda38d8e86ef80', '2a4c060f44d944ea926fe44522ce7b39', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_role` VALUES ('7c6fe595d4ba4bcb840952a6b8818e87', '84f923b5e334498494eda38d8e86ef80', '5b9a439743f141729f46a07e8e222a47', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_role` VALUES ('814a381cf6284a42a9ef6ba4c4cf5390', '84f923b5e334498494eda38d8e86ef80', '9e4cf77815dd49fbac4158c62af3197a', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_role` VALUES ('9fc58fccb59d4ef4add0bea95bde2f34', '84f923b5e334498494eda38d8e86ef80', 'f405a849f27d4ddebf7f8a2dfbf30bea', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_role` VALUES ('a6fd89e9cd1b425491fd905d1ffacac8', '84f923b5e334498494eda38d8e86ef80', 'd452524058ff42cfb9e5146dacd0cd79', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_role` VALUES ('a776b3fb9e944c0a89593a17cf9e8677', '84f923b5e334498494eda38d8e86ef80', '81fc0e05049e467d976ec523182421f2', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_role` VALUES ('a864a8846d35415cb881f1f466b51e8d', '84f923b5e334498494eda38d8e86ef80', 'bc3c9877c598404da7e31355a4deebad', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_role` VALUES ('b651fbaebbdf47ad9867aca4a39afb22', '84f923b5e334498494eda38d8e86ef80', '2790bf6cc0b54c36b56c90429c112ab2', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_role` VALUES ('bc209a1defea47778a271b50f5c326b1', '84f923b5e334498494eda38d8e86ef80', '65320b914c18453f9ca0a84d3f8a0a7b', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_role` VALUES ('bdf5f465e79a4dedb51fab2745c2ccc3', '84f923b5e334498494eda38d8e86ef80', 'a21b52d911bb44c2978e52bbc523de51', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_role` VALUES ('c797efc13e314e43b08837cfc268cea9', '84f923b5e334498494eda38d8e86ef80', 'f81608054a714b60adb0b1ed574c6b6c', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_role` VALUES ('c9407844cb9d4ec5b4df195cbee00ab0', '84f923b5e334498494eda38d8e86ef80', '7a6d3674e5204937951d01544e18e3aa', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_role` VALUES ('caf19432391e46c8894455b9bd908a11', '84f923b5e334498494eda38d8e86ef80', '1886bf699ec74f79959bdc8ca8e5371a', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_role` VALUES ('d22696d414434088bd8f6b47a9953f01', '84f923b5e334498494eda38d8e86ef80', '524e5f5c3e5b4cdb90611cd8b15ca684', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_role` VALUES ('e70d4684d4bd489a93e44a2505cfb15c', '84f923b5e334498494eda38d8e86ef80', 'b656d6afbbe844d0a6626d0eb590643f', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_role` VALUES ('e753111f16e443758e74637066dd845b', '84f923b5e334498494eda38d8e86ef80', '9a8e5cedcd514af2b37cf5828f509f94', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');
INSERT INTO `aos_sys_module_role` VALUES ('ecec404ec2a5449aafa701c3ca50cb2b', '84f923b5e334498494eda38d8e86ef80', '619cb338b278406f8368471034d5946f', '1', '2016-02-02 21:56:26', 'fa04db9dd2f54d61b0c8202a25de2dc6');

-- ----------------------------
-- Table structure for aos_sys_module_user
-- ----------------------------
DROP TABLE IF EXISTS `aos_sys_module_user`;
CREATE TABLE `aos_sys_module_user` (
  `id_` varchar(64) NOT NULL COMMENT '流水号',
  `user_id_` varchar(64) NOT NULL COMMENT ' 用户流水号',
  `module_id_` varchar(64) NOT NULL COMMENT '功能模块流水号',
  `grant_type_` varchar(255) NOT NULL COMMENT '权限类型',
  `operate_time_` varchar(255) NOT NULL COMMENT '授权时间',
  `operator_id_` varchar(64) NOT NULL COMMENT '授权人',
  PRIMARY KEY  (`id_`),
  UNIQUE KEY `aos_sys_module_user_ukey` USING BTREE (`user_id_`,`module_id_`,`grant_type_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能模块-用户关联表';

-- ----------------------------
-- Records of aos_sys_module_user
-- ----------------------------

-- ----------------------------
-- Table structure for aos_sys_module_user_nav
-- ----------------------------
DROP TABLE IF EXISTS `aos_sys_module_user_nav`;
CREATE TABLE `aos_sys_module_user_nav` (
  `id_` varchar(64) NOT NULL COMMENT '流水号',
  `module_id_` varchar(64) NOT NULL COMMENT '功能模块流水号',
  `user_id_` varchar(64) NOT NULL COMMENT '人员流水号',
  `nav_icon_` varchar(255) default NULL COMMENT '浮动导航图标文件',
  `type_` varchar(255) NOT NULL COMMENT '导航类型',
  `sort_no_` int(10) default NULL COMMENT '排序号',
  PRIMARY KEY  (`id_`),
  UNIQUE KEY `aos_sys_module_user_nav_ukey` USING BTREE (`module_id_`,`user_id_`,`type_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能模块-用户关联表(浮动导航|快捷导航)';

-- ----------------------------
-- Records of aos_sys_module_user_nav
-- ----------------------------
INSERT INTO `aos_sys_module_user_nav` VALUES ('0105d9c95caf420aa5bd544d83e87c77', '1886bf699ec74f79959bdc8ca8e5371a', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('0ce2d5658fb64a4797ff75d9f459ef32', '715f6cf8d2ce4fa694baf2259327f6b1', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('13e7e53c880a4eaebfdfc111ff0f234a', 'f405a849f27d4ddebf7f8a2dfbf30bea', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('1771642b67a24ebc8925d05f9d6f0a99', 'bf530e26480d43b08dd20e31e31274af', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('27496d1c07fb4de69e8ec80ca9d9b1b4', 'f81608054a714b60adb0b1ed574c6b6c', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('27a1acfe21c54302bacef830362e9201', '1906d5a892654e2bb882851e0ea7322f', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('3037dcb30d544c129c38c0ec0512f152', '65320b914c18453f9ca0a84d3f8a0a7b', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('35cdbcbf1d164430ae5f870d9ca9c798', '5fb994e71cb14a77891670990d7f554d', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('3e95a408ab4842a896fe28e22263770e', '2790bf6cc0b54c36b56c90429c112ab2', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('4f6389bf9bbc41a785bafd3167d1c83f', 'b656d6afbbe844d0a6626d0eb590643f', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('50f22340f1244e969e0150c5cb709d89', '9a8e5cedcd514af2b37cf5828f509f94', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('5205631b91ad4abb877f9bf376401137', '0b99e9d118b54ee084d9e74bd72cdd1c', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('6e2c4f1bbc794acbbbf30dd82b82e548', 'cfc4e4bd367047a29e0d72e688f860a2', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('7c34dd645a584cf7bc01f49c491e4a6d', '7a6d3674e5204937951d01544e18e3aa', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('87a378d1f1654e70a673e2492cf4b280', 'fd88d0de59024e4db81ead8510b6bd98', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('91fd66009c774778bb8fe43afff6fc1a', '619cb338b278406f8368471034d5946f', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('ab00d2b56d3c4e4a95c234b1624be55e', '81fc0e05049e467d976ec523182421f2', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('d70a61cc8117438b8fa1d04df9b69ed1', '524e5f5c3e5b4cdb90611cd8b15ca684', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('dcd3e9606ecb47d9970f6e25b538ca46', '9e4cf77815dd49fbac4158c62af3197a', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('e09214ed6b5a4d9ea822d22b8290d459', 'f107450058a2438eb6ad9bf6a4d7e967', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('e1620cfebcc54f9b964c4ce4faf51ea0', 'a21b52d911bb44c2978e52bbc523de51', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('e855c201b896442d8099d815b0ae15f4', 'd452524058ff42cfb9e5146dacd0cd79', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('f0072ce1b6884ae8af69d4b10c008e85', '5b9a439743f141729f46a07e8e222a47', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('f3f0dfc36d7d440385ed86e33ee40fd9', '2a4c060f44d944ea926fe44522ce7b39', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('f9651f4622c14612a9eb510eae8ef4e9', 'ba90369eb83540bab4d9492bc17f0937', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('fdbdb721c58740ecb54f7e047bdbacdc', 'bc3c9877c598404da7e31355a4deebad', 'fa04db9dd2f54d61b0c8202a25de2dc6', null, '1', null);

-- ----------------------------
-- Table structure for aos_sys_org
-- ----------------------------
DROP TABLE IF EXISTS `aos_sys_org`;
CREATE TABLE `aos_sys_org` (
  `id_` varchar(64) NOT NULL COMMENT '流水号',
  `cascade_id_` varchar(255) NOT NULL COMMENT '节点语义ID',
  `name_` varchar(255) NOT NULL COMMENT '组织名称',
  `hotkey_` varchar(255) default NULL COMMENT '热键',
  `parent_id_` varchar(64) NOT NULL COMMENT '父节点流水号',
  `pareant_name_` varchar(255) default NULL COMMENT '父节点名称',
  `is_leaf_` varchar(255) NOT NULL default '1' COMMENT '是否叶子节点',
  `is_auto_expand_` varchar(255) NOT NULL default '0' COMMENT '是否自动展开',
  `icon_name_` varchar(255) default NULL COMMENT '节点图标文件名称',
  `status_` varchar(255) NOT NULL default '1' COMMENT '当前状态',
  `type_` varchar(255) NOT NULL COMMENT '组织类型',
  `biz_code_` varchar(255) default NULL COMMENT '业务对照码',
  `custom_code_` varchar(4000) default NULL COMMENT '自定义扩展码',
  `create_time_` varchar(255) NOT NULL COMMENT '创建时间',
  `creater_id_` varchar(64) default NULL COMMENT '创建人ID',
  `sort_no_` int(10) default NULL COMMENT '排序号',
  PRIMARY KEY  (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织表';

-- ----------------------------
-- Records of aos_sys_org
-- ----------------------------
INSERT INTO `aos_sys_org` VALUES ('0965ef0ffd294a838f53012e3ef9bfd0', '0.006.001', '上海分行', null, 'bd48c11cfd6f48e196c5fa399c410329', '投资银行部', '1', '0', null, '1', '1', null, null, '2016-02-01 23:56:02', 'fa04db9dd2f54d61b0c8202a25de2dc6', '1');
INSERT INTO `aos_sys_org` VALUES ('1e1441c6be2b4ffdb3f73759cb1e207b', '0.002', '会计结算部', null, '63cf387a243d4d9799367d773b853346', '中国嘉靖银行', '1', '0', null, '1', '1', null, null, '2016-02-01 23:53:10', 'fa04db9dd2f54d61b0c8202a25de2dc6', '10');
INSERT INTO `aos_sys_org` VALUES ('4be918af97ee491aa71378d065a8c7f7', '0.006.002', '昆明分行', null, 'bd48c11cfd6f48e196c5fa399c410329', '投资银行部', '1', '0', null, '1', '1', null, null, '2016-02-01 23:56:15', 'fa04db9dd2f54d61b0c8202a25de2dc6', '10');
INSERT INTO `aos_sys_org` VALUES ('63cf387a243d4d9799367d773b853346', '0', '中国嘉靖银行', '', 'p', 'root', '0', '1', 'home.png', '1', '1', '', '', '2012-01-01 12:12:12', 'fa04db9dd2f54d61b0c8202a25de2dc6', '0');
INSERT INTO `aos_sys_org` VALUES ('b2fa97f8bed34eee86201f01fa786ed4', '0.001', '信息技术部', '', '63cf387a243d4d9799367d773b853346', '中国嘉靖银行', '1', '0', '', '1', '1', '', '', '2016-02-01 20:53:34', 'fa04db9dd2f54d61b0c8202a25de2dc6', '1');
INSERT INTO `aos_sys_org` VALUES ('bd48c11cfd6f48e196c5fa399c410329', '0.006', '投资银行部', '', '63cf387a243d4d9799367d773b853346', '中国嘉靖银行', '0', '1', '', '1', '1', '', '', '2016-02-01 23:55:46', 'fa04db9dd2f54d61b0c8202a25de2dc6', '50');
INSERT INTO `aos_sys_org` VALUES ('d4392c4faf024a7e8a2c2607d77ab2fa', '0.005', '合规管理部', null, '63cf387a243d4d9799367d773b853346', '中国嘉靖银行', '1', '0', null, '1', '1', null, null, '2016-02-01 23:54:44', 'fa04db9dd2f54d61b0c8202a25de2dc6', '40');
INSERT INTO `aos_sys_org` VALUES ('e8b6092436054f5893b49ade58635105', '0.004', '风险管理部', null, '63cf387a243d4d9799367d773b853346', '中国嘉靖银行', '1', '0', null, '1', '1', null, null, '2016-02-01 23:53:58', 'fa04db9dd2f54d61b0c8202a25de2dc6', '30');

-- ----------------------------
-- Table structure for aos_sys_page
-- ----------------------------
DROP TABLE IF EXISTS `aos_sys_page`;
CREATE TABLE `aos_sys_page` (
  `id_` varchar(64) NOT NULL COMMENT '流水号',
  `module_id_` varchar(64) NOT NULL COMMENT '功能模块ID',
  `name_` varchar(255) default NULL COMMENT '名称',
  `url_` varchar(255) default NULL COMMENT '页面URL',
  `type_` varchar(255) NOT NULL COMMENT '类型',
  `enabled_` varchar(255) NOT NULL COMMENT '使能状态',
  `is_default_` varchar(255) NOT NULL default '0' COMMENT '是否缺省子页面',
  `icon_` varchar(255) default NULL COMMENT '小图标',
  `icon_big_` varchar(255) default NULL COMMENT '大图标',
  `vector_` varchar(255) default NULL COMMENT '矢量图标',
  `sort_no_` int(10) default '0' COMMENT '排序号',
  PRIMARY KEY  (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模块页面表';

-- ----------------------------
-- Records of aos_sys_page
-- ----------------------------
INSERT INTO `aos_sys_page` VALUES ('19041a2cb7264838b48288ce9b0b8e80', '1906d5a892654e2bb882851e0ea7322f', '大图标[64X64]', 'initIconList.jhtml?type_=2', '2', '1', '0', 'picture.png', null, null, '2');
INSERT INTO `aos_sys_page` VALUES ('9e30077a6bb043cc8db8c8d4b5fa5c91', '1906d5a892654e2bb882851e0ea7322f', '小图标[16X16]', 'initIconList.jhtml?type_=1', '2', '1', '1', 'pictures.png', null, null, '1');
INSERT INTO `aos_sys_page` VALUES ('bcb82c68976d4527a8f1c8bdbb8b4a04', '1906d5a892654e2bb882851e0ea7322f', '矢量图标', 'initIconList.jhtml?type_=3', '2', '1', '0', 'vector.png', null, null, '4');
INSERT INTO `aos_sys_page` VALUES ('c47935773e9443dd9a6ceecb69982ac2', '4d3cfce7b9b146d2bc8482ec477517aa', '我的快捷菜单', 'initMyNav.jhtml', '2', '1', '0', 'org.png', '', '', '4');
INSERT INTO `aos_sys_page` VALUES ('c8548f73784d42989363712729a320e0', '1906d5a892654e2bb882851e0ea7322f', '分隔符', null, '4', '1', '0', null, null, null, '3');
INSERT INTO `aos_sys_page` VALUES ('cacc4fcdc5454f1ebab63b00e4bf56cc', '4d3cfce7b9b146d2bc8482ec477517aa', '我的个人设置', 'initMyInfo.jhtml', '2', '1', '1', 'icon_19.png', '', '', '1');
INSERT INTO `aos_sys_page` VALUES ('d45aefac856942d484441481cd142212', '4d3cfce7b9b146d2bc8482ec477517aa', '我的操作日志', '', '2', '1', '0', 'icon75.png', '', '', '6');
INSERT INTO `aos_sys_page` VALUES ('dd3d77605b824ca18357222128aebc5b', '4d3cfce7b9b146d2bc8482ec477517aa', '分割符', null, '4', '1', '0', null, null, null, '5');

-- ----------------------------
-- Table structure for aos_sys_page_el
-- ----------------------------
DROP TABLE IF EXISTS `aos_sys_page_el`;
CREATE TABLE `aos_sys_page_el` (
  `id_` varchar(64) NOT NULL COMMENT '流水号',
  `dom_id_` varchar(255) NOT NULL COMMENT 'DOM ID',
  `name_` varchar(255) NOT NULL COMMENT '名称',
  `type_` varchar(255) NOT NULL COMMENT '类型',
  `module_id_` varchar(64) NOT NULL COMMENT '所属功能模块流水号',
  `page_id_` varchar(64) NOT NULL COMMENT '页面ID',
  `remark_` varchar(4000) default NULL COMMENT '备注',
  PRIMARY KEY  (`id_`),
  UNIQUE KEY `aos_sys_page_el_ukey` USING BTREE (`dom_id_`,`module_id_`,`page_id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='页面元素表';

-- ----------------------------
-- Records of aos_sys_page_el
-- ----------------------------

-- ----------------------------
-- Table structure for aos_sys_page_el_grant
-- ----------------------------
DROP TABLE IF EXISTS `aos_sys_page_el_grant`;
CREATE TABLE `aos_sys_page_el_grant` (
  `id_` varchar(64) NOT NULL COMMENT '流水号',
  `el_id_` varchar(64) NOT NULL COMMENT '页面元素流水号',
  `user_id_` varchar(64) default NULL COMMENT '用户流水号',
  `role_id_` varchar(64) default NULL COMMENT '角色流水号',
  `post_id_` varchar(64) default NULL COMMENT '岗位流水号',
  `grant_type_` varchar(255) NOT NULL COMMENT '权限类型',
  PRIMARY KEY  (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='页面元素授权表';

-- ----------------------------
-- Records of aos_sys_page_el_grant
-- ----------------------------

-- ----------------------------
-- Table structure for aos_sys_param
-- ----------------------------
DROP TABLE IF EXISTS `aos_sys_param`;
CREATE TABLE `aos_sys_param` (
  `id_` varchar(64) NOT NULL COMMENT '流水号',
  `key_` varchar(255) NOT NULL COMMENT '参数键',
  `value_` varchar(255) default NULL COMMENT '参数值',
  `catalog_id_` varchar(64) NOT NULL COMMENT '所属分类流水号',
  `catalog_cascade_id_` varchar(255) NOT NULL COMMENT '所属分类节点语义ID',
  `name_` varchar(255) NOT NULL COMMENT '参数名称',
  `is_overwrite_` varchar(255) NOT NULL COMMENT '是否可覆盖',
  `overwrite_field_` varchar(255) default NULL COMMENT '覆盖来源字段',
  `remark_` varchar(4000) default NULL COMMENT '备注',
  PRIMARY KEY  (`id_`),
  UNIQUE KEY `aos_sys_param_ukey` USING BTREE (`key_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='参数表';

-- ----------------------------
-- Records of aos_sys_param
-- ----------------------------
INSERT INTO `aos_sys_param` VALUES ('0dabca413781404b9cbfaae3881fc5a6', 'app_ico', '/static/icon/ico/aos2.ico', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '应用系统小图标', '0', null, '浏览器标题栏左上角显示');
INSERT INTO `aos_sys_param` VALUES ('19ad8d57d72b4ecf98ad133ebb6492bd', 'page_load_gif_', 'wheel.gif', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '页面刷新动画文件', '0', '', '页面刷新动画文件。可选的预设动画文件：run.gif、wheel.gif。动画path：/static/image/gif/pageload。');
INSERT INTO `aos_sys_param` VALUES ('1bd1c0a5849d4a30b3f1eb2761b2865d', 'show_login_win_head_', 'true', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '是否显示登录窗口标题栏', '0', '', '是否显示登录窗口标题栏(Ext登录风格)。缺省值：false。可选值：true|false。');
INSERT INTO `aos_sys_param` VALUES ('1cc1a1bee27f44389e7e64a89d9ccc76', 'msgtarget_', 'qtip', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '表单校验消息提示方式', '0', null, '可选值必须是下列值之一 (1)、qtip 当用户鼠标悬停在该域之上时显示包含了消息的迅速提示。(2)、title 显示消息以浏览器默认的title属性弹出。 (3)、under 在域下方添加一块包含了错误消息的div。(4)、side 添加一个错误图标在域的右边，鼠标悬停上面时弹出显示消息。');
INSERT INTO `aos_sys_param` VALUES ('1f2adf3aa726447e9728a3f67b718b41', 'vercode_show_', '1', '6f94ef4ac17d4d098f91f0a4579f8591', '0.001.002.001', '验证码开关', '0', '', '是否在登录页面显示验证码及后台验证码验证。可选值：0(否) | 1(是)。');
INSERT INTO `aos_sys_param` VALUES ('2e45751d623f48389e12bfb7c3891597', 'treenode_cursor_', 'pointer', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '树节点鼠标光标样式', '0', '', '缺省值：pointer。可选值：任何符合Css的cursor属性定义的值。default | pointer | auto等。');
INSERT INTO `aos_sys_param` VALUES ('376a372433634af4b6d2d558f1959f5b', 'role_grant_mode_', '1', '01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', '角色授权模式', '0', null, '角色授权模式(角色可见度)。可选值：1|2。1：可见当前管理员创建的角色和当前管理员所属组织的其他管理员创建的角色。2：可见当前管理员创建的角色和当前管理员所属组织及其下级子孙组织的其他管理员创建的角色。');
INSERT INTO `aos_sys_param` VALUES ('3ff54d336e57461d8cd708a8bad8bc36', 'combobox_emptytext', '请选择...', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '下拉选择框的缺省提示信息', '0', null, null);
INSERT INTO `aos_sys_param` VALUES ('43fb125bed224cbbaf2390df1041c3b0', 'dev_account_', 'root', '01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', '开发者登录帐号', '0', '', '登录页面开发者按钮登录帐号。可以配置为任何一个存在的帐号。');
INSERT INTO `aos_sys_param` VALUES ('47bd798e93314882af7244ba1ae9fbc8', 'vercode_characters_', 'abcdetx2345678', '6f94ef4ac17d4d098f91f0a4579f8591', '0.001.002.001', '验证码待选字符集', '0', '', '验证码待选字符集。');
INSERT INTO `aos_sys_param` VALUES ('53267cbf8e9f4fc490798054fbe85c7e', 'copyright_', '2008-2015 OSWorks', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '版权信息', '0', null, '版权信息');
INSERT INTO `aos_sys_param` VALUES ('58099059c3004213ae0977d4ed5551f5', 'prevent_rightclick_', 'false', '01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', '全局右键', '0', null, '阻止浏览器缺省鼠标右键事件。可选值：true|false。缺省值：true。');
INSERT INTO `aos_sys_param` VALUES ('6032c7e953994a718f6072c956906538', 'app_title_', 'AOS : JavaEE应用基础平台', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '首页浏览器标题内容', '0', '', '首页浏览器标题内容');
INSERT INTO `aos_sys_param` VALUES ('714d370fa7f54b01ae9a006806c60135', 'is_show_top_nav_', 'true', 'a072411787f545edb7e7c3c23fa6c0ff', '0.001.002.004', '水平导航条', '1', 'is_show_top_nav_', '是否显示水平导航条。(只有在导航模式为1的情况，此设置才有效,导航模式为2，则水平导航条不会消失)。可选值：true| false。');
INSERT INTO `aos_sys_param` VALUES ('7290d8299cba41dc9e23323a0db22a95', 'json_format', '1', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', 'JSON输出模式', '0', '', ' json输出模式。0：格式化输出模式；1：压缩模式。');
INSERT INTO `aos_sys_param` VALUES ('74d65234606c4f448eb06d6a07a6c138', 'user_head_catalog_id_', '613', '01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', '用户头像流文件分类ID', '0', null, '用户头像流文件分类ID，分类科目中的用户头像分类ID。用户上传文件时使用。');
INSERT INTO `aos_sys_param` VALUES ('757f555c0d734539baa70e8a1788cc62', 'is_show_statusbar_', 'true', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '是否显示主界面状态栏', '0', '', '是否显示主界面状态栏。可选值：true|false。');
INSERT INTO `aos_sys_param` VALUES ('7882ac5560ef4a04993279dfc24b6f23', 'user_obj_del_mode_', 'update', '01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', '用户对象删除模式', '0', null, '物理删除：delete；逻辑删除：update。');
INSERT INTO `aos_sys_param` VALUES ('7bc3899d2fc24e4b804e6f763c3d6b36', 'dev_account_login_', '1', '01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', '开发者登录帐号开关', '0', null, '是否启用开发者登录帐号功能,如启用则在登录界面会出现[开发者]按钮。可选值：1 | 0。提示：系统若在生产模式下运行，则此配置忽略，自动关闭开发者登录功能。');
INSERT INTO `aos_sys_param` VALUES ('7e4d320f454843739f40476dcbcdc91a', 'run_mode_', '0', '01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', '运行模式', '0', '', '0：开发模式；1：生产模式；2：在线体验模式');
INSERT INTO `aos_sys_param` VALUES ('873c2cb1dde54b308211e8a2bc6edbb5', 'theme_', 'classic', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '系统主题风格', '1', 'theme_', '可选值：classic。缺省值：classic。');
INSERT INTO `aos_sys_param` VALUES ('9cb03933f61e4c68a58e50873ac38fbd', 'page_load_msg_', '正在拼命加载页面, 请稍等...', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '页面加载等待提示信息', '0', null, null);
INSERT INTO `aos_sys_param` VALUES ('a19b559ab8804f5887867df4151ad631', 'page_size_', '50', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '分页大小', '0', null, '缺省的分页大小。JSP页面的属性设置会覆盖这个配置。');
INSERT INTO `aos_sys_param` VALUES ('a1ad9c90f524467180bceecd1f02b8b8', 'nav_mode_', '1', 'a072411787f545edb7e7c3c23fa6c0ff', '0.001.002.004', '导航模式', '1', 'nav_mode_', '可选值，1：水平导航按钮和垂直导航的卡片属于统一层级；2：水平导航按钮和垂直导航的卡片有上下级级联导航关系。(当前模式2未实现)');
INSERT INTO `aos_sys_param` VALUES ('a843396066db4e77a7b9ed7ae4cdda37', 'login_page_', 'login.ext.jsp', '01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', '登录页面', '0', '', 'Ext原生风格的登录界面');
INSERT INTO `aos_sys_param` VALUES ('ad9cb685144c4e36b19b31e53190221a', 'skin_', 'blue', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '系统缺省皮肤', '1', 'skin_', '可选值：blue|gray|neptune|aos。缺省值：blue。');
INSERT INTO `aos_sys_param` VALUES ('b07b8e2cc1284d14b9e680a5cac0722a', 'app_name_', 'AOS : JavaEE应用基础平台', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '应用系统名称', '0', '', '应用系统名称');
INSERT INTO `aos_sys_param` VALUES ('be82f58309a24ee397d3a24631e48405', 'vercode_length_', '4', '6f94ef4ac17d4d098f91f0a4579f8591', '0.001.002.001', '验证码长度', '0', '', '验证码长度');
INSERT INTO `aos_sys_param` VALUES ('bf26e19236654718a6aa369f3e4b4bf7', 'coder_project_rootpath_', '0', '01afa7f4bb4d4189a4817ade7b5c1b8d', '0.001.002.003', '代码生成器使用的工程根目录', '0', null, '代码生成器的工程跟目录。如果为0则自动获取。');
INSERT INTO `aos_sys_param` VALUES ('c744b99660c74302b7a3ae5834a7b6eb', 'grid_column_algin_', 'left', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '表格列内容对齐方式', '0', '', '表格列对齐模式。有效值：left|center|right。');
INSERT INTO `aos_sys_param` VALUES ('d2a8d045aa7e44ef93f0735a4c486bc6', 'nav_tab_index_', '0', 'a072411787f545edb7e7c3c23fa6c0ff', '0.001.002.004', '导航缺省活动页', '1', 'nav_tab_index_', '左侧布局的导航卡片缺省激活的卡片索引号，索引下标从0开始。');
INSERT INTO `aos_sys_param` VALUES ('d3b33d5dee5b46738f9525b8977d7673', 'login_back_img_', '-1', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '登录页面的背景图片', '0', '', '登录页面的背景图片。可选的预设背景图片为：0.jpg、1.jpg、2.jpg。如果需要随机出现背景，则将其设置为-1。');
INSERT INTO `aos_sys_param` VALUES ('eeb66260a2c141b2a0bb06bb41d7803b', 'navbar_btn_style_', 'tight', 'a072411787f545edb7e7c3c23fa6c0ff', '0.001.002.004', '导航条按钮风格', '1', 'navbar_btn_style_', '顶部水平导航条的按钮样式风格。tight：组合按钮；standalone：独立按钮。');
INSERT INTO `aos_sys_param` VALUES ('f18649a182a946a693b36f817374cb1c', 'welcome_page_title_', '欢迎', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', '欢迎页标题', '0', null, '系统登录后第一个缺省打开的Tab页面的标题。缺省：\"欢迎\"。');
INSERT INTO `aos_sys_param` VALUES ('fcf73fa9129649a08ebb41e1ec8b5340', 'layout_', 'tab', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', 'Center区域布局风格', '1', 'layout_', '系统业务经办区域(center)布局风格。可选值：tab|page。缺省值：tab。tab：支持同时打开多个功能模块界面；page：当前只能打开1个功能界面。');
INSERT INTO `aos_sys_param` VALUES ('fdd95913b7e54e3ca6be9557484159f5', 'tab_focus_color_', '#0099FF', 'f22f39171b484d81a604d3eb50b33584', '0.001.002.002', 'Tab高亮颜色', '1', 'tab_focus_color_', '缺省的当前Tab卡片高亮提示颜色');

-- ----------------------------
-- Table structure for aos_sys_post
-- ----------------------------
DROP TABLE IF EXISTS `aos_sys_post`;
CREATE TABLE `aos_sys_post` (
  `id_` varchar(64) NOT NULL COMMENT ' 流水号',
  `name_` varchar(255) NOT NULL COMMENT '岗位名称',
  `status_` varchar(255) NOT NULL default '1' COMMENT '当前状态',
  `type_` varchar(255) NOT NULL COMMENT '岗位类型',
  `org_id_` varchar(64) NOT NULL COMMENT '所属部门流水号',
  `create_time_` varchar(255) NOT NULL COMMENT '创建时间',
  `creater_id_` varchar(64) NOT NULL COMMENT '创建人ID',
  `org_cascade_id_` varchar(255) NOT NULL COMMENT '所属部门节点语义ID',
  PRIMARY KEY  (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='岗位表';

-- ----------------------------
-- Records of aos_sys_post
-- ----------------------------
INSERT INTO `aos_sys_post` VALUES ('60cb0e6359ea46a19a841adc46cf66cf', '研发岗位', '1', '1', 'b2fa97f8bed34eee86201f01fa786ed4', '2016-02-02 21:54:59', 'fa04db9dd2f54d61b0c8202a25de2dc6', '0.001');

-- ----------------------------
-- Table structure for aos_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `aos_sys_role`;
CREATE TABLE `aos_sys_role` (
  `id_` varchar(64) NOT NULL COMMENT ' 流水号',
  `name_` varchar(255) NOT NULL COMMENT '角色名称',
  `status_` varchar(255) NOT NULL default '1' COMMENT '当前状态',
  `type_` varchar(255) NOT NULL COMMENT '角色类型',
  `create_time_` varchar(255) NOT NULL COMMENT '创建时间',
  `creater_id_` varchar(64) NOT NULL COMMENT '创建人ID',
  `creater_org_id_` varchar(64) NOT NULL COMMENT '创建人所属部门流水号',
  `creater_org_cascade_id_` varchar(255) NOT NULL COMMENT '创建人所属部门节点语义ID',
  PRIMARY KEY  (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of aos_sys_role
-- ----------------------------
INSERT INTO `aos_sys_role` VALUES ('84f923b5e334498494eda38d8e86ef80', '研发角色', '1', '1', '2016-02-02 21:56:20', 'fa04db9dd2f54d61b0c8202a25de2dc6', '63cf387a243d4d9799367d773b853346', '0');

-- ----------------------------
-- Table structure for aos_sys_sequence
-- ----------------------------
DROP TABLE IF EXISTS `aos_sys_sequence`;
CREATE TABLE `aos_sys_sequence` (
  `id_` varchar(64) NOT NULL COMMENT '流水号',
  `name_` varchar(255) NOT NULL COMMENT '名称',
  `type_` varchar(255) default NULL COMMENT '类型',
  `prefix_` varchar(255) default NULL COMMENT '前缀',
  `start_` varchar(255) default '1' COMMENT '起始值',
  `step_` varchar(255) default '1' COMMENT '递增步长',
  `cur_value_` varchar(255) default '0' COMMENT '当前值',
  `status_` varchar(255) NOT NULL default '1' COMMENT '当前状态',
  `connector_` varchar(255) default NULL COMMENT '连接符',
  `suffix_` varchar(255) default NULL COMMENT '后缀',
  `db_seq_name_` varchar(255) default NULL COMMENT 'DBSequence名称',
  `max_value_` varchar(255) default '9223372036854775807' COMMENT '最大值',
  `is_circul_` varchar(255) default '0' COMMENT '是否循环',
  `min_value_` varchar(255) default '1' COMMENT '最小值',
  `is_leftpad_` varchar(255) default '0' COMMENT '是否左补足',
  `format_value_` varchar(255) default NULL COMMENT '当前格式化值',
  `remark_` varchar(4000) default NULL COMMENT '备注',
  PRIMARY KEY  (`id_`),
  UNIQUE KEY `aos_sys_sequence_name_ukey` USING BTREE (`name_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ID配置表';

-- ----------------------------
-- Records of aos_sys_sequence
-- ----------------------------
INSERT INTO `aos_sys_sequence` VALUES ('2abfc360e8a74e21bcda37113269fca0', 'DEMOID', '1', null, '1', '1', '6637', '1', null, null, null, '9223372036854775807', '0', '1', '0', '6637', '演示模块相关功能使用的ID发生器');
INSERT INTO `aos_sys_sequence` VALUES ('40b37118cebf431283415862d355c72c', 'CARDID', '1', '', '1', '1', '10004005', '1', '', '', null, '99999999', '0', '10000000', '0', '10004005', '范例系统卡号');
INSERT INTO `aos_sys_sequence` VALUES ('7487db32b061465da1af721e84e9942a', 'GUUID', '2', null, '1', '1', 'd7123d2c8af04dafab5d37d6d03937bb', '1', null, null, null, '9223372036854775807', '0', '1', '0', 'd7123d2c8af04dafab5d37d6d03937bb', '通用UUID。');

-- ----------------------------
-- Table structure for aos_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `aos_sys_user`;
CREATE TABLE `aos_sys_user` (
  `id_` varchar(64) NOT NULL COMMENT '流水号',
  `account_` varchar(255) NOT NULL COMMENT '用户登录帐号',
  `password_` varchar(255) NOT NULL COMMENT '密码',
  `name_` varchar(255) NOT NULL COMMENT '用户姓名',
  `sex_` varchar(255) NOT NULL default '0' COMMENT '性别',
  `org_id_` varchar(64) NOT NULL COMMENT '所属主部门流水号',
  `status_` varchar(255) NOT NULL COMMENT '用户状态',
  `type_` varchar(255) NOT NULL COMMENT '用户类型',
  `biz_code_` varchar(255) default NULL COMMENT '业务对照码',
  `create_time_` varchar(255) NOT NULL COMMENT ' 经办时间',
  `creater_id_` varchar(64) NOT NULL COMMENT '经办人流水号',
  `org_cascade_id_` varchar(255) NOT NULL COMMENT '所属部门节点语义ID',
  `delete_flag_` varchar(255) NOT NULL COMMENT '逻辑删除标识',
  PRIMARY KEY  (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户基本信息表';

-- ----------------------------
-- Records of aos_sys_user
-- ----------------------------
INSERT INTO `aos_sys_user` VALUES ('fa04db9dd2f54d61b0c8202a25de2dc6', 'root', 'gnRD3IiRP6s=', '超级用户', '1', '63cf387a243d4d9799367d773b853346', '1', '2', '', '2014-09-27 22:12:56', 'fa04db9dd2f54d61b0c8202a25de2dc6', '0', '0');
INSERT INTO `aos_sys_user` VALUES ('fe24c4ac34444902a2129ec1debf9ed4', 'caocao', 'gnRD3IiRP6s=', '曹操', '3', 'b2fa97f8bed34eee86201f01fa786ed4', '1', '1', null, '2016-02-02 21:55:57', 'fa04db9dd2f54d61b0c8202a25de2dc6', '0.001', '0');

-- ----------------------------
-- Table structure for aos_sys_user_cfg
-- ----------------------------
DROP TABLE IF EXISTS `aos_sys_user_cfg`;
CREATE TABLE `aos_sys_user_cfg` (
  `id_` varchar(64) NOT NULL COMMENT '用户ID',
  `theme_` varchar(255) default NULL COMMENT '用户界面主题',
  `skin_` varchar(255) default NULL COMMENT '用户界面皮肤',
  `is_show_top_nav_` varchar(255) default NULL COMMENT '是否显示水平导航条',
  `navbar_btn_style_` varchar(255) default NULL COMMENT '导航条按钮风格',
  `tab_focus_color_` varchar(255) default NULL COMMENT 'Tab高亮颜色',
  `nav_tab_index_` varchar(255) default NULL COMMENT '导航缺省活动页',
  PRIMARY KEY  (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户配置表';

-- ----------------------------
-- Records of aos_sys_user_cfg
-- ----------------------------
INSERT INTO `aos_sys_user_cfg` VALUES ('fa04db9dd2f54d61b0c8202a25de2dc6', 'classic', 'blue', 'true', 'tight', '#0099FF', '0');
INSERT INTO `aos_sys_user_cfg` VALUES ('fe24c4ac34444902a2129ec1debf9ed4', 'classic', 'blue', 'true', 'tight', '#0099FF', '0');

-- ----------------------------
-- Table structure for aos_sys_user_ext
-- ----------------------------
DROP TABLE IF EXISTS `aos_sys_user_ext`;
CREATE TABLE `aos_sys_user_ext` (
  `id_` varchar(64) NOT NULL COMMENT '用户ID',
  `email_` varchar(255) default NULL COMMENT '电子邮件',
  `fixed_phone_` varchar(255) default NULL COMMENT '固定电话',
  `mobile_phone_` varchar(255) default NULL COMMENT '移动电话',
  `address_` varchar(255) default NULL COMMENT '联系地址',
  `zip_` varchar(255) default NULL COMMENT '邮编',
  `birthday_` varchar(255) default NULL COMMENT '生日',
  `idno_` varchar(255) default NULL COMMENT '身份证号',
  `qq_` varchar(255) default NULL COMMENT 'QQ',
  `dynamic_field_` varchar(4000) default NULL COMMENT '动态扩展字段',
  `remark_` varchar(4000) default NULL COMMENT '备注',
  `filed1_` varchar(255) default NULL COMMENT '静态扩展字段1',
  `filed2_` varchar(255) default NULL COMMENT '静态扩展字段2',
  `filed3_` varchar(255) default NULL COMMENT '静态扩展字段3',
  PRIMARY KEY  (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户扩展信息表';

-- ----------------------------
-- Records of aos_sys_user_ext
-- ----------------------------
INSERT INTO `aos_sys_user_ext` VALUES ('fa04db9dd2f54d61b0c8202a25de2dc6', '307916217@qq.com', '', '186188188188', '', '', '', '', '307916217', '', '超级用户拥有系统最高权限。', '', '', null);
INSERT INTO `aos_sys_user_ext` VALUES ('fe24c4ac34444902a2129ec1debf9ed4', null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for aos_sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `aos_sys_user_post`;
CREATE TABLE `aos_sys_user_post` (
  `id_` varchar(64) NOT NULL COMMENT '流水号',
  `user_id_` varchar(64) NOT NULL COMMENT '用户流水号',
  `post_id_` varchar(64) NOT NULL COMMENT '岗位流水号',
  `operate_time_` varchar(255) NOT NULL COMMENT '授权时间',
  `operator_id_` varchar(64) NOT NULL COMMENT '授权人流水号',
  PRIMARY KEY  (`id_`),
  UNIQUE KEY `aos_sys_user_post_ukey` USING BTREE (`user_id_`,`post_id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-岗位关联表';

-- ----------------------------
-- Records of aos_sys_user_post
-- ----------------------------

-- ----------------------------
-- Table structure for aos_sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `aos_sys_user_role`;
CREATE TABLE `aos_sys_user_role` (
  `id_` varchar(64) NOT NULL COMMENT '流水号',
  `user_id_` varchar(64) NOT NULL COMMENT '用户流水号',
  `role_id_` varchar(64) NOT NULL COMMENT '角色流水号',
  `operate_time_` varchar(255) NOT NULL COMMENT '授权时间',
  `operator_id_` varchar(64) NOT NULL COMMENT '授权人流水号',
  PRIMARY KEY  (`id_`),
  UNIQUE KEY `aos_sys_user_role_ukey` USING BTREE (`user_id_`,`role_id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-角色关联表';

-- ----------------------------
-- Records of aos_sys_user_role
-- ----------------------------
INSERT INTO `aos_sys_user_role` VALUES ('b3fea94f5f0d4065b26c1b2e28fe3a75', 'fe24c4ac34444902a2129ec1debf9ed4', '84f923b5e334498494eda38d8e86ef80', '2016-02-02 21:56:35', 'fa04db9dd2f54d61b0c8202a25de2dc6');

-- ----------------------------
-- Table structure for aos_wf_evt_log
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_evt_log`;
CREATE TABLE `aos_wf_evt_log` (
  `log_nr_` bigint(20) NOT NULL auto_increment,
  `type_` varchar(64) collate utf8_bin default NULL,
  `proc_def_id_` varchar(64) collate utf8_bin default NULL,
  `proc_inst_id_` varchar(64) collate utf8_bin default NULL,
  `execution_id_` varchar(64) collate utf8_bin default NULL,
  `task_id_` varchar(64) collate utf8_bin default NULL,
  `time_stamp_` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `user_id_` varchar(255) collate utf8_bin default NULL,
  `data_` longblob,
  `lock_owner_` varchar(255) collate utf8_bin default NULL,
  `lock_time_` timestamp NULL default NULL,
  `is_processed_` tinyint(4) default '0',
  PRIMARY KEY  (`log_nr_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_evt_log
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_ge_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_ge_bytearray`;
CREATE TABLE `aos_wf_ge_bytearray` (
  `id_` varchar(64) collate utf8_bin NOT NULL default '',
  `rev_` int(11) default NULL,
  `name_` varchar(255) collate utf8_bin default NULL,
  `deployment_id_` varchar(64) collate utf8_bin default NULL,
  `bytes_` longblob,
  `generated_` tinyint(4) default NULL,
  PRIMARY KEY  (`id_`),
  KEY `aos_fk_bytearr_depl` (`deployment_id_`),
  CONSTRAINT `aos_fk_bytearr_depl` FOREIGN KEY (`deployment_id_`) REFERENCES `aos_wf_re_deployment` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_ge_bytearray
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_ge_property
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_ge_property`;
CREATE TABLE `aos_wf_ge_property` (
  `name_` varchar(64) collate utf8_bin NOT NULL default '',
  `value_` varchar(300) collate utf8_bin default NULL,
  `rev_` int(11) default NULL,
  PRIMARY KEY  (`name_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_ge_property
-- ----------------------------
INSERT INTO `aos_wf_ge_property` VALUES ('next.dbid', '1', '1');
INSERT INTO `aos_wf_ge_property` VALUES ('schema.history', 'create(5.18.0.0)', '1');
INSERT INTO `aos_wf_ge_property` VALUES ('schema.version', '5.18.0.0', '1');

-- ----------------------------
-- Table structure for aos_wf_hi_actinst
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_hi_actinst`;
CREATE TABLE `aos_wf_hi_actinst` (
  `id_` varchar(64) collate utf8_bin NOT NULL,
  `proc_def_id_` varchar(64) collate utf8_bin NOT NULL,
  `proc_inst_id_` varchar(64) collate utf8_bin NOT NULL,
  `execution_id_` varchar(64) collate utf8_bin NOT NULL,
  `aos_id_` varchar(255) collate utf8_bin NOT NULL,
  `task_id_` varchar(64) collate utf8_bin default NULL,
  `call_proc_inst_id_` varchar(64) collate utf8_bin default NULL,
  `aos_name_` varchar(255) collate utf8_bin default NULL,
  `aos_type_` varchar(255) collate utf8_bin NOT NULL,
  `assignee_` varchar(255) collate utf8_bin default NULL,
  `start_time_` datetime NOT NULL,
  `end_time_` datetime default NULL,
  `duration_` bigint(20) default NULL,
  `tenant_id_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`id_`),
  KEY `aos_idx_hi_act_inst_start` (`start_time_`),
  KEY `aos_idx_hi_act_inst_end` (`end_time_`),
  KEY `aos_idx_hi_act_inst_procinst` (`proc_inst_id_`,`aos_id_`),
  KEY `aos_idx_hi_act_inst_exec` (`execution_id_`,`aos_id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_hi_actinst
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_hi_attachment
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_hi_attachment`;
CREATE TABLE `aos_wf_hi_attachment` (
  `id_` varchar(64) collate utf8_bin NOT NULL,
  `rev_` int(11) default NULL,
  `user_id_` varchar(255) collate utf8_bin default NULL,
  `name_` varchar(255) collate utf8_bin default NULL,
  `description_` varchar(4000) collate utf8_bin default NULL,
  `type_` varchar(255) collate utf8_bin default NULL,
  `task_id_` varchar(64) collate utf8_bin default NULL,
  `proc_inst_id_` varchar(64) collate utf8_bin default NULL,
  `url_` varchar(4000) collate utf8_bin default NULL,
  `content_id_` varchar(64) collate utf8_bin default NULL,
  `time_` datetime default NULL,
  PRIMARY KEY  (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_hi_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_hi_comment
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_hi_comment`;
CREATE TABLE `aos_wf_hi_comment` (
  `id_` varchar(64) collate utf8_bin NOT NULL,
  `type_` varchar(255) collate utf8_bin default NULL,
  `time_` datetime NOT NULL,
  `user_id_` varchar(255) collate utf8_bin default NULL,
  `task_id_` varchar(64) collate utf8_bin default NULL,
  `proc_inst_id_` varchar(64) collate utf8_bin default NULL,
  `action_` varchar(255) collate utf8_bin default NULL,
  `message_` varchar(4000) collate utf8_bin default NULL,
  `full_msg_` longblob,
  PRIMARY KEY  (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_hi_comment
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_hi_detail
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_hi_detail`;
CREATE TABLE `aos_wf_hi_detail` (
  `id_` varchar(64) collate utf8_bin NOT NULL,
  `type_` varchar(255) collate utf8_bin NOT NULL,
  `proc_inst_id_` varchar(64) collate utf8_bin default NULL,
  `execution_id_` varchar(64) collate utf8_bin default NULL,
  `task_id_` varchar(64) collate utf8_bin default NULL,
  `act_inst_id_` varchar(64) collate utf8_bin default NULL,
  `name_` varchar(255) collate utf8_bin NOT NULL,
  `var_type_` varchar(255) collate utf8_bin default NULL,
  `rev_` int(11) default NULL,
  `time_` datetime NOT NULL,
  `bytearray_id_` varchar(64) collate utf8_bin default NULL,
  `double_` double default NULL,
  `long_` bigint(20) default NULL,
  `text_` varchar(4000) collate utf8_bin default NULL,
  `text2_` varchar(4000) collate utf8_bin default NULL,
  PRIMARY KEY  (`id_`),
  KEY `aos_idx_hi_detail_proc_inst` (`proc_inst_id_`),
  KEY `aos_idx_hi_detail_act_inst` (`act_inst_id_`),
  KEY `aos_idx_hi_detail_time` (`time_`),
  KEY `aos_idx_hi_detail_name` (`name_`),
  KEY `aos_idx_hi_detail_task_id` (`task_id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_hi_detail
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_hi_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_hi_identitylink`;
CREATE TABLE `aos_wf_hi_identitylink` (
  `id_` varchar(64) collate utf8_bin NOT NULL default '',
  `group_id_` varchar(255) collate utf8_bin default NULL,
  `type_` varchar(255) collate utf8_bin default NULL,
  `user_id_` varchar(255) collate utf8_bin default NULL,
  `task_id_` varchar(64) collate utf8_bin default NULL,
  `proc_inst_id_` varchar(64) collate utf8_bin default NULL,
  PRIMARY KEY  (`id_`),
  KEY `aos_idx_hi_ident_lnk_user` (`user_id_`),
  KEY `aos_idx_hi_ident_lnk_task` (`task_id_`),
  KEY `aos_idx_hi_ident_lnk_procinst` (`proc_inst_id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_hi_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_hi_procinst
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_hi_procinst`;
CREATE TABLE `aos_wf_hi_procinst` (
  `id_` varchar(64) collate utf8_bin NOT NULL,
  `proc_inst_id_` varchar(64) collate utf8_bin NOT NULL,
  `business_key_` varchar(255) collate utf8_bin default NULL,
  `proc_def_id_` varchar(64) collate utf8_bin NOT NULL,
  `start_time_` datetime NOT NULL,
  `end_time_` datetime default NULL,
  `duration_` bigint(20) default NULL,
  `start_user_id_` varchar(255) collate utf8_bin default NULL,
  `start_act_id_` varchar(255) collate utf8_bin default NULL,
  `end_act_id_` varchar(255) collate utf8_bin default NULL,
  `super_process_instance_id_` varchar(64) collate utf8_bin default NULL,
  `delete_reason_` varchar(4000) collate utf8_bin default NULL,
  `tenant_id_` varchar(255) collate utf8_bin default '',
  `name_` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`id_`),
  UNIQUE KEY `proc_inst_id_` (`proc_inst_id_`),
  KEY `aos_idx_hi_pro_inst_end` (`end_time_`),
  KEY `aos_idx_hi_pro_i_buskey` (`business_key_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_hi_procinst
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_hi_taskinst
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_hi_taskinst`;
CREATE TABLE `aos_wf_hi_taskinst` (
  `id_` varchar(64) collate utf8_bin NOT NULL,
  `proc_def_id_` varchar(64) collate utf8_bin default NULL,
  `task_def_key_` varchar(255) collate utf8_bin default NULL,
  `proc_inst_id_` varchar(64) collate utf8_bin default NULL,
  `execution_id_` varchar(64) collate utf8_bin default NULL,
  `name_` varchar(255) collate utf8_bin default NULL,
  `parent_task_id_` varchar(64) collate utf8_bin default NULL,
  `description_` varchar(4000) collate utf8_bin default NULL,
  `owner_` varchar(255) collate utf8_bin default NULL,
  `assignee_` varchar(255) collate utf8_bin default NULL,
  `start_time_` datetime NOT NULL,
  `claim_time_` datetime default NULL,
  `end_time_` datetime default NULL,
  `duration_` bigint(20) default NULL,
  `delete_reason_` varchar(4000) collate utf8_bin default NULL,
  `priority_` int(11) default NULL,
  `due_date_` datetime default NULL,
  `form_key_` varchar(255) collate utf8_bin default NULL,
  `category_` varchar(255) collate utf8_bin default NULL,
  `tenant_id_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`id_`),
  KEY `aos_idx_hi_task_inst_procinst` (`proc_inst_id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_hi_taskinst
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_hi_varinst
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_hi_varinst`;
CREATE TABLE `aos_wf_hi_varinst` (
  `id_` varchar(64) collate utf8_bin NOT NULL,
  `proc_inst_id_` varchar(64) collate utf8_bin default NULL,
  `execution_id_` varchar(64) collate utf8_bin default NULL,
  `task_id_` varchar(64) collate utf8_bin default NULL,
  `name_` varchar(255) collate utf8_bin NOT NULL,
  `var_type_` varchar(100) collate utf8_bin default NULL,
  `rev_` int(11) default NULL,
  `bytearray_id_` varchar(64) collate utf8_bin default NULL,
  `double_` double default NULL,
  `long_` bigint(20) default NULL,
  `text_` varchar(4000) collate utf8_bin default NULL,
  `text2_` varchar(4000) collate utf8_bin default NULL,
  `create_time_` datetime default NULL,
  `last_updated_time_` datetime default NULL,
  PRIMARY KEY  (`id_`),
  KEY `aos_idx_hi_procvar_proc_inst` (`proc_inst_id_`),
  KEY `aos_idx_hi_procvar_name_type` (`name_`,`var_type_`),
  KEY `aos_idx_hi_procvar_task_id` (`task_id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_hi_varinst
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_id_group
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_id_group`;
CREATE TABLE `aos_wf_id_group` (
  `id_` varchar(64) collate utf8_bin NOT NULL default '',
  `rev_` int(11) default NULL,
  `name_` varchar(255) collate utf8_bin default NULL,
  `type_` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_id_group
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_id_info
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_id_info`;
CREATE TABLE `aos_wf_id_info` (
  `id_` varchar(64) collate utf8_bin NOT NULL default '',
  `rev_` int(11) default NULL,
  `user_id_` varchar(64) collate utf8_bin default NULL,
  `type_` varchar(64) collate utf8_bin default NULL,
  `key_` varchar(255) collate utf8_bin default NULL,
  `value_` varchar(255) collate utf8_bin default NULL,
  `password_` longblob,
  `parent_id_` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_id_info
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_id_membership
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_id_membership`;
CREATE TABLE `aos_wf_id_membership` (
  `user_id_` varchar(64) collate utf8_bin NOT NULL default '',
  `group_id_` varchar(64) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`user_id_`,`group_id_`),
  KEY `aos_fk_memb_group` (`group_id_`),
  CONSTRAINT `aos_fk_memb_group` FOREIGN KEY (`group_id_`) REFERENCES `aos_wf_id_group` (`id_`),
  CONSTRAINT `aos_fk_memb_user` FOREIGN KEY (`user_id_`) REFERENCES `aos_wf_id_user` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_id_membership
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_id_user
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_id_user`;
CREATE TABLE `aos_wf_id_user` (
  `id_` varchar(64) collate utf8_bin NOT NULL default '',
  `rev_` int(11) default NULL,
  `first_` varchar(255) collate utf8_bin default NULL,
  `last_` varchar(255) collate utf8_bin default NULL,
  `email_` varchar(255) collate utf8_bin default NULL,
  `pwd_` varchar(255) collate utf8_bin default NULL,
  `picture_id_` varchar(64) collate utf8_bin default NULL,
  PRIMARY KEY  (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_id_user
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_re_deployment
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_re_deployment`;
CREATE TABLE `aos_wf_re_deployment` (
  `id_` varchar(64) collate utf8_bin NOT NULL default '',
  `name_` varchar(255) collate utf8_bin default NULL,
  `category_` varchar(255) collate utf8_bin default NULL,
  `tenant_id_` varchar(255) collate utf8_bin default '',
  `deploy_time_` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_re_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_re_model
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_re_model`;
CREATE TABLE `aos_wf_re_model` (
  `id_` varchar(64) collate utf8_bin NOT NULL,
  `rev_` int(11) default NULL,
  `name_` varchar(255) collate utf8_bin default NULL,
  `key_` varchar(255) collate utf8_bin default NULL,
  `category_` varchar(255) collate utf8_bin default NULL,
  `create_time_` timestamp NULL default NULL,
  `last_update_time_` timestamp NULL default NULL,
  `version_` int(11) default NULL,
  `meta_info_` varchar(4000) collate utf8_bin default NULL,
  `deployment_id_` varchar(64) collate utf8_bin default NULL,
  `editor_source_value_id_` varchar(64) collate utf8_bin default NULL,
  `editor_source_extra_value_id_` varchar(64) collate utf8_bin default NULL,
  `tenant_id_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`id_`),
  KEY `aos_fk_model_source` (`editor_source_value_id_`),
  KEY `aos_fk_model_source_extra` (`editor_source_extra_value_id_`),
  KEY `aos_fk_model_deployment` (`deployment_id_`),
  CONSTRAINT `aos_fk_model_deployment` FOREIGN KEY (`deployment_id_`) REFERENCES `aos_wf_re_deployment` (`id_`),
  CONSTRAINT `aos_fk_model_source` FOREIGN KEY (`editor_source_value_id_`) REFERENCES `aos_wf_ge_bytearray` (`id_`),
  CONSTRAINT `aos_fk_model_source_extra` FOREIGN KEY (`editor_source_extra_value_id_`) REFERENCES `aos_wf_ge_bytearray` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_re_model
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_re_procdef
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_re_procdef`;
CREATE TABLE `aos_wf_re_procdef` (
  `id_` varchar(64) collate utf8_bin NOT NULL,
  `rev_` int(11) default NULL,
  `category_` varchar(255) collate utf8_bin default NULL,
  `name_` varchar(255) collate utf8_bin default NULL,
  `key_` varchar(255) collate utf8_bin NOT NULL,
  `version_` int(11) NOT NULL,
  `deployment_id_` varchar(64) collate utf8_bin default NULL,
  `resource_name_` varchar(4000) collate utf8_bin default NULL,
  `dgrm_resource_name_` varchar(4000) collate utf8_bin default NULL,
  `description_` varchar(4000) collate utf8_bin default NULL,
  `has_start_form_key_` tinyint(4) default NULL,
  `has_graphical_notation_` tinyint(4) default NULL,
  `suspension_state_` int(11) default NULL,
  `tenant_id_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`id_`),
  UNIQUE KEY `aos_uniq_procdef` (`key_`,`version_`,`tenant_id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_re_procdef
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_ru_event_subscr
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_ru_event_subscr`;
CREATE TABLE `aos_wf_ru_event_subscr` (
  `id_` varchar(64) collate utf8_bin NOT NULL,
  `rev_` int(11) default NULL,
  `event_type_` varchar(255) collate utf8_bin NOT NULL,
  `event_name_` varchar(255) collate utf8_bin default NULL,
  `execution_id_` varchar(64) collate utf8_bin default NULL,
  `proc_inst_id_` varchar(64) collate utf8_bin default NULL,
  `activity_id_` varchar(64) collate utf8_bin default NULL,
  `configuration_` varchar(255) collate utf8_bin default NULL,
  `created_` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `proc_def_id_` varchar(64) collate utf8_bin default NULL,
  `tenant_id_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`id_`),
  KEY `aos_idx_event_subscr_config_` (`configuration_`),
  KEY `aos_fk_event_exec` (`execution_id_`),
  CONSTRAINT `aos_fk_event_exec` FOREIGN KEY (`execution_id_`) REFERENCES `aos_wf_ru_execution` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_ru_event_subscr
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_ru_execution
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_ru_execution`;
CREATE TABLE `aos_wf_ru_execution` (
  `id_` varchar(64) collate utf8_bin NOT NULL default '',
  `rev_` int(11) default NULL,
  `proc_inst_id_` varchar(64) collate utf8_bin default NULL,
  `business_key_` varchar(255) collate utf8_bin default NULL,
  `parent_id_` varchar(64) collate utf8_bin default NULL,
  `proc_def_id_` varchar(64) collate utf8_bin default NULL,
  `super_exec_` varchar(64) collate utf8_bin default NULL,
  `aos_id_` varchar(255) collate utf8_bin default NULL,
  `is_active_` tinyint(4) default NULL,
  `is_concurrent_` tinyint(4) default NULL,
  `is_scope_` tinyint(4) default NULL,
  `is_event_scope_` tinyint(4) default NULL,
  `suspension_state_` int(11) default NULL,
  `cached_ent_state_` int(11) default NULL,
  `tenant_id_` varchar(255) collate utf8_bin default '',
  `name_` varchar(255) collate utf8_bin default NULL,
  `lock_time_` timestamp NULL default NULL,
  PRIMARY KEY  (`id_`),
  KEY `aos_idx_exec_buskey` (`business_key_`),
  KEY `aos_fk_exe_procinst` (`proc_inst_id_`),
  KEY `aos_fk_exe_parent` (`parent_id_`),
  KEY `aos_fk_exe_super` (`super_exec_`),
  KEY `aos_fk_exe_procdef` (`proc_def_id_`),
  CONSTRAINT `aos_fk_exe_parent` FOREIGN KEY (`parent_id_`) REFERENCES `aos_wf_ru_execution` (`id_`),
  CONSTRAINT `aos_fk_exe_procdef` FOREIGN KEY (`proc_def_id_`) REFERENCES `aos_wf_re_procdef` (`id_`),
  CONSTRAINT `aos_fk_exe_procinst` FOREIGN KEY (`proc_inst_id_`) REFERENCES `aos_wf_ru_execution` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `aos_fk_exe_super` FOREIGN KEY (`super_exec_`) REFERENCES `aos_wf_ru_execution` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_ru_execution
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_ru_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_ru_identitylink`;
CREATE TABLE `aos_wf_ru_identitylink` (
  `id_` varchar(64) collate utf8_bin NOT NULL default '',
  `rev_` int(11) default NULL,
  `group_id_` varchar(255) collate utf8_bin default NULL,
  `type_` varchar(255) collate utf8_bin default NULL,
  `user_id_` varchar(255) collate utf8_bin default NULL,
  `task_id_` varchar(64) collate utf8_bin default NULL,
  `proc_inst_id_` varchar(64) collate utf8_bin default NULL,
  `proc_def_id_` varchar(64) collate utf8_bin default NULL,
  PRIMARY KEY  (`id_`),
  KEY `aos_idx_ident_lnk_user` (`user_id_`),
  KEY `aos_idx_ident_lnk_group` (`group_id_`),
  KEY `aos_idx_athrz_procedef` (`proc_def_id_`),
  KEY `aos_fk_tskass_task` (`task_id_`),
  KEY `aos_fk_idl_procinst` (`proc_inst_id_`),
  CONSTRAINT `aos_fk_athrz_procedef` FOREIGN KEY (`proc_def_id_`) REFERENCES `aos_wf_re_procdef` (`id_`),
  CONSTRAINT `aos_fk_idl_procinst` FOREIGN KEY (`proc_inst_id_`) REFERENCES `aos_wf_ru_execution` (`id_`),
  CONSTRAINT `aos_fk_tskass_task` FOREIGN KEY (`task_id_`) REFERENCES `aos_wf_ru_task` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_ru_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_ru_job
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_ru_job`;
CREATE TABLE `aos_wf_ru_job` (
  `id_` varchar(64) collate utf8_bin NOT NULL,
  `rev_` int(11) default NULL,
  `type_` varchar(255) collate utf8_bin NOT NULL,
  `lock_exp_time_` timestamp NULL default NULL,
  `lock_owner_` varchar(255) collate utf8_bin default NULL,
  `exclusive_` tinyint(1) default NULL,
  `execution_id_` varchar(64) collate utf8_bin default NULL,
  `process_instance_id_` varchar(64) collate utf8_bin default NULL,
  `proc_def_id_` varchar(64) collate utf8_bin default NULL,
  `retries_` int(11) default NULL,
  `exception_stack_id_` varchar(64) collate utf8_bin default NULL,
  `exception_msg_` varchar(4000) collate utf8_bin default NULL,
  `duedate_` timestamp NULL default NULL,
  `repeat_` varchar(255) collate utf8_bin default NULL,
  `handler_type_` varchar(255) collate utf8_bin default NULL,
  `handler_cfg_` varchar(4000) collate utf8_bin default NULL,
  `tenant_id_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`id_`),
  KEY `aos_fk_job_exception` (`exception_stack_id_`),
  CONSTRAINT `aos_fk_job_exception` FOREIGN KEY (`exception_stack_id_`) REFERENCES `aos_wf_ge_bytearray` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_ru_job
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_ru_task
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_ru_task`;
CREATE TABLE `aos_wf_ru_task` (
  `id_` varchar(64) collate utf8_bin NOT NULL default '',
  `rev_` int(11) default NULL,
  `execution_id_` varchar(64) collate utf8_bin default NULL,
  `proc_inst_id_` varchar(64) collate utf8_bin default NULL,
  `proc_def_id_` varchar(64) collate utf8_bin default NULL,
  `name_` varchar(255) collate utf8_bin default NULL,
  `parent_task_id_` varchar(64) collate utf8_bin default NULL,
  `description_` varchar(4000) collate utf8_bin default NULL,
  `task_def_key_` varchar(255) collate utf8_bin default NULL,
  `owner_` varchar(255) collate utf8_bin default NULL,
  `assignee_` varchar(255) collate utf8_bin default NULL,
  `delegation_` varchar(64) collate utf8_bin default NULL,
  `priority_` int(11) default NULL,
  `create_time_` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `due_date_` datetime default NULL,
  `category_` varchar(255) collate utf8_bin default NULL,
  `suspension_state_` int(11) default NULL,
  `tenant_id_` varchar(255) collate utf8_bin default '',
  `form_key_` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`id_`),
  KEY `aos_idx_task_create` (`create_time_`),
  KEY `aos_fk_task_exe` (`execution_id_`),
  KEY `aos_fk_task_procinst` (`proc_inst_id_`),
  KEY `aos_fk_task_procdef` (`proc_def_id_`),
  CONSTRAINT `aos_fk_task_exe` FOREIGN KEY (`execution_id_`) REFERENCES `aos_wf_ru_execution` (`id_`),
  CONSTRAINT `aos_fk_task_procdef` FOREIGN KEY (`proc_def_id_`) REFERENCES `aos_wf_re_procdef` (`id_`),
  CONSTRAINT `aos_fk_task_procinst` FOREIGN KEY (`proc_inst_id_`) REFERENCES `aos_wf_ru_execution` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_ru_task
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_ru_variable
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_ru_variable`;
CREATE TABLE `aos_wf_ru_variable` (
  `id_` varchar(64) collate utf8_bin NOT NULL,
  `rev_` int(11) default NULL,
  `type_` varchar(255) collate utf8_bin NOT NULL,
  `name_` varchar(255) collate utf8_bin NOT NULL,
  `execution_id_` varchar(64) collate utf8_bin default NULL,
  `proc_inst_id_` varchar(64) collate utf8_bin default NULL,
  `task_id_` varchar(64) collate utf8_bin default NULL,
  `bytearray_id_` varchar(64) collate utf8_bin default NULL,
  `double_` double default NULL,
  `long_` bigint(20) default NULL,
  `text_` varchar(4000) collate utf8_bin default NULL,
  `text2_` varchar(4000) collate utf8_bin default NULL,
  PRIMARY KEY  (`id_`),
  KEY `aos_idx_variable_task_id` (`task_id_`),
  KEY `aos_fk_var_exe` (`execution_id_`),
  KEY `aos_fk_var_procinst` (`proc_inst_id_`),
  KEY `aos_fk_var_bytearray` (`bytearray_id_`),
  CONSTRAINT `aos_fk_var_bytearray` FOREIGN KEY (`bytearray_id_`) REFERENCES `aos_wf_ge_bytearray` (`id_`),
  CONSTRAINT `aos_fk_var_exe` FOREIGN KEY (`execution_id_`) REFERENCES `aos_wf_ru_execution` (`id_`),
  CONSTRAINT `aos_fk_var_procinst` FOREIGN KEY (`proc_inst_id_`) REFERENCES `aos_wf_ru_execution` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_ru_variable
-- ----------------------------
