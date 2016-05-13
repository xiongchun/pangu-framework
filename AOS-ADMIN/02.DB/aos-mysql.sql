/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50625
Source Host           : 127.0.0.1:3306
Source Database       : aos

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2016-05-08 16:26:57
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
  `ip_address_` varchar(255) DEFAULT NULL COMMENT '客户端IP地址',
  `client_type_` varchar(255) DEFAULT NULL COMMENT '客户端类型',
  `owner_` varchar(255) DEFAULT NULL COMMENT '宿主',
  `create_time_` datetime NOT NULL COMMENT '登录时间',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会话日志信息表';

-- ----------------------------
-- Records of aos_log_session
-- ----------------------------
INSERT INTO `aos_log_session` VALUES ('3q2odgynfqdtqvzn1g5pwhio', 'fa04db9dd2f54d61b0c8202a25de2dc6', 'root', '超级用户', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.155 Safari/537.36', 'PC1024500:10010', '2016-05-07 22:16:28');

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
  `hotkey_` varchar(255) DEFAULT NULL COMMENT '热键',
  `parent_id_` varchar(64) NOT NULL COMMENT '父节点流水号',
  `is_leaf_` varchar(255) NOT NULL DEFAULT '1' COMMENT '是否叶子节点',
  `is_auto_expand_` varchar(255) NOT NULL DEFAULT '0' COMMENT '是否自动展开',
  `icon_name_` varchar(255) DEFAULT NULL COMMENT '图标文件名称',
  `sort_no_` int(10) DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `aos_sys_catalog_ukey` (`cascade_id_`) USING BTREE
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
  `hotkey_` varchar(255) DEFAULT NULL COMMENT ' 热键',
  `status_` varchar(255) NOT NULL DEFAULT '1' COMMENT '当前状态',
  `dic_index_id_` varchar(64) NOT NULL COMMENT '所属字典流水号',
  `remark_` varchar(4000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id_`)
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
  `hotkey_` varchar(255) DEFAULT NULL COMMENT '热键',
  `catalog_id_` varchar(64) NOT NULL COMMENT '所属分类流水号',
  `catalog_cascade_id_` varchar(255) NOT NULL COMMENT '所属分类流节点语义ID',
  `remark_` varchar(4000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `aos_sys_dic_index_ukey` (`key_`) USING BTREE
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
  PRIMARY KEY (`id_`),
  UNIQUE KEY `aos_sys_icon_ukey` (`name_`,`type_`) USING BTREE
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
INSERT INTO `aos_sys_icon` VALUES ('25108abb6e734cfe9af974c5dc40f5e2', 'add.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('4960df5e6b7f420fa88df573e23d47eb', 'add2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('4914a176e99b4dde8d4e42b34e7d52c0', 'against.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('2d156d2bde114f55ac8ff5b3a0436dbd', 'agree.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('a88b89d37629474aab08ccdedfab86d2', 'app_columns.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('e726e35e6750424a815df031ad0644fa', 'app_list.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8e076a983908415da05538daf97d8e82', 'bars.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('9e5e17e7ed7443b38045a7a4f7791c5c', 'basket.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('5c047570b7f64ce0895c47b11dca6e81', 'book.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('4a238489a6cd452b967b8896388eecbf', 'book_user.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('def3d983a0cd4787b4877466701d4214', 'bug.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('20446fb926fb4cc2ab9daeeac37c7984', 'bullet_black.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('1e657a99f5344401ad26c55715520cc5', 'bullet_blue.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('166f426e35c34e318f59879704fbf207', 'bullet_green.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('7a41173f5f934055871956f66932944f', 'bullet_group.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('e76b14527d0446e7893a0691d851ab5a', 'bullet_group2.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('bf3262602df1473b89a7ddb92304cc1e', 'bullet_group3.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('d99b4713dc534797859e484d8832f0d4', 'bullet_group4.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('872ef86b8cf843578bf9ee48c06f6ba9', 'bullet_purple.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('5c2e7c0910b240be8349a807c7ddc32a', 'bullet_red.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('223d8143779f480fb14e01555c00d3e3', 'bullet_yellow.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('ea92806185c84cf3be52d01c75b206f2', 'chart_curve.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('308304ece8934ae18657a78c992bb73c', 'chart_flipped.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('c90940d49fc1455bbbfdc67b551f7131', 'chart_line.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('bd9cde7da21a4661a63f56f2e9d70b9e', 'chart_pie.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('5a8e4815b3144a73bfb822c26cda9ac9', 'close.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('45cfb0060bfe4da3a5d2bac66da18255', 'close2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('fd451e7df9984d6ca5452a2da4ad0f7f', 'config.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('43a7586a5eba45659cb261f3e109c568', 'config1.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('2556e3a496d140e2a54c416794e4238d', 'config3.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('047f898dfb904919ba1f817e18613151', 'connect.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8203944c9014420ab24423da18584f56', 'copy.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('c6936b9e013149f8b260f2fe6af55082', 'cut.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('de387797fc7b4a25a658e4700e0a0132', 'cv.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('2e48a135e5cf4fc196efedef52fca447', 'c_key.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('58bec3b3e40449e5b19dc8266687f194', 'database.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('b2825a176941457b9cd6483beda555da', 'database_add.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8d23bcd74ea1446fa3ebf3b269ca638a', 'del.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('fd123729c00d43a88ec8b3b8267c377c', 'del1.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('1ab69b40188a4aeca3ae461aeae9a7b6', 'del2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('204b3f94ae9b4461b99e45d9b8486fce', 'del_folder.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('151a2a438dd149159acfa83c99abb086', 'del_page.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('c76537a3c6854f30a6ccfe2403b9dd38', 'detail.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('c4aa77d65f7a4ed3b6c932bc7bf4bfda', 'disconnect.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('afd75d2b110c4f0f91046d78adb5d3ab', 'doc_ok.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('0e4040e071684e3e8545582cde162336', 'down.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('91a1db0d7044496a82d29d9c79da680d', 'down_left.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('2444eb2ddecd48909ba31e6689301b7a', 'down_right.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('498239527c9a45d58322ad290908a233', 'edit.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('12f0994d2d15465d83da56844f0ddc9f', 'edit2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9a55475ef7ff406ba34682f2ef1eae3b', 'email.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('bcf69eed5d3348ce88fac540f303f3dc', 'email2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('11a10e50b4574c6c9836fc703c5a1281', 'email3.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('55e5d794206b433ab861b4d3f102cee0', 'email_go.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('3234441b64b1460cbe41695d1cfb5db9', 'email_open.png', '1');
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
INSERT INTO `aos_sys_icon` VALUES ('1baf9b4c23594aff9d889c3a37ceacb6', 'filter.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('1c0c430bb2f44b52bebc808afad3a822', 'folder1.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('73442b4d747a44c9b9767410423d8b52', 'folder10.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('da27c91d3b264f7eb2aef9e35836db48', 'folder11.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('1a604dddd5ae448d9b9463131c1517db', 'folder12.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('4e281f7e04a645b08959560c18f63e62', 'folder13.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('143fb3019ba0402ca149d4a7fc41be0a', 'folder14.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('14750b70b3d3459e95c0a247488c5543', 'folder15.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('0a071424dfa8483ea012c5393e31e28a', 'folder16.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('5ac66ccd98584c2d8e70541aa4bf1f46', 'folder17.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('14b88ceea5e8466b9f413c9100f46541', 'folder18.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('61c1c37a55cb40c1993c683c5c9ae0d6', 'folder19.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('a344208821f648fe8ee41f7749aee0db', 'folder2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('f14ec93420404bdf846ce7198a0182b6', 'folder20.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('b0f5eba0882a45079a0f3966dc53df9f', 'folder21.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('e1aa1ef518cb4702bac82220449abbcc', 'folder22.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('1c5eac8e5c30456782d3465977e7f086', 'folder23.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('2c39e332a2b844208ffec44fbebebfa5', 'folder24.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9b5df6eb66a1427988f0dcb4471a1d45', 'folder25.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('4bf6b2303a304f63ab6639e721545356', 'folder26.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('fbea8ce436874bdbba82d129c350c14b', 'folder27.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('5f6b1dbe61084f2b8fe61536fc6e1226', 'folder28.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('473b7e69ded841fb83b823b9d0123a85', 'folder4.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('c3607c02487442ef8ca8812becc92530', 'folder5.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('d2244b2bd3ca49f6b8243c2c9b542173', 'folder6.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('5222f432c54041a79b0787d1648597f6', 'folder7.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('70d6d73569244e5caf981c2f756d0de6', 'folder8.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('87d116725d7c4f5f9abea8dce4c8be84', 'folder9.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('35e04100ff4a4e9d96c441566b0b317e', 'forward.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('2f37e28c3c6b4827b6033717dbbbc5df', 'freelance.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('6e1a289c8aa347d28f0e8a531415c11d', 'go.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('55714690e924408195fe1cd0025bb713', 'go.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('e8ba480842c443008b5b22bc7a445617', 'go1.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('c572057a98eb4eda83d63c18ed8e1440', 'go1.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('18db08f42d7348b8a48602c7e4a70582', 'help.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('792ea9660aec4810b8766311e2a26f8a', 'home.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('6d98bcd139bc4f549e6d902269abb679', 'home.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('144ba848466c422aaa8ed3c3cf20f8c4', 'icon134.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('426562bb142848f199fbdc9996283e85', 'icon137.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('2f761bc057e64ba4909e3377e05533cf', 'icon140.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('7c2f282864c24744810769a5db59fb92', 'icon141.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('ab8f7baaa32b466b9003b6e8e7d0d51a', 'icon146.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('d015c6483d88419581556af2728d8551', 'icon15.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('3a6931e78c3846d3a75c786872204015', 'icon150.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('fcec578afbdd4429a39e9d96eaf09be3', 'icon152.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9013ce3344dc4bfe98d441ab4ea10ab6', 'icon153.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('960c1fb7025e4f57a742ccc8c53c4002', 'icon154.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8eda0bb5c0a84b16931180062e34ca73', 'icon17.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('a197df64a56d41858da7a870ca26a487', 'icon25.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('ebe8caeaf77a48ff887e1122908396d8', 'icon26.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('f654403de45340608e729e78ca82c03a', 'icon31.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('337c00d310d240c9b9e65f47df3c72bb', 'icon32.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('6e48d223c61f46daad7e6479432cd763', 'icon34.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('2415f0d36cab4253a6e54dd4e275325a', 'icon35.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('b86d4a786afb42af8df8d2236cd1a0a1', 'icon36.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('8c58e9688a284fe4b5f4c9c1ed551c5e', 'icon37.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('0cf6eefdec56478389d557477af18cb2', 'icon38.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('7f796cc3059248699cc32f2e62bab3b1', 'icon39.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('9f0408c42a0440aca0937c788447d54f', 'icon41.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('2bd6656f53e7498b92fb09716528394b', 'icon42.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('5e14135349a24e1894200cb606edeba8', 'icon5.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('7dabf30aa90d49d192b7a9380e612816', 'icon56.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('03dc1ea6a1c642408c831627202a638d', 'icon59.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9171ea0f076a46b7acf257f2f090de44', 'icon63.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('d2b7d9bfaf1444c1bdb7c6f8cdf365a8', 'icon65.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('967a235786d94b6eb60e0f177c4354cf', 'icon66.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('ce1feb874bcf4c088acfda24b2c440b2', 'icon67.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8bcbcd182251455f8246e51b3fffee6b', 'icon68.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('6323d288e66d4e93bd585343d16f040d', 'icon7.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('c56bba79e8774ca98fcc1ce6f9e6d386', 'icon70.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('256b5aeed9f74faa8985e9e3dbed727c', 'icon71.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('803d5c7fc27d4f32a0c1b2f42c5cc1d8', 'icon72.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('da185cdc84914df7b73e0683eb15f05c', 'icon75.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('6acf334502a54e71a5c9fe1f3ed54da9', 'icon76.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('e8640cbe85754f7e8301c96f5d7a3900', 'icon77.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('a969728cb76f4d3ba5f5dd72159920c5', 'icon78.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('a48e0e2c021945ac9a5a11471ffbb7a5', 'icon79.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8de7136a667b4285b69f19c057862421', 'icon8.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('81e10b6b52844b23a8bce2018be6c267', 'icon80.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('20cef761c78e47d3b6425ad2f0c4edb1', 'icon82.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('3afde4cf4c8b40deb600149d1dcfd66b', 'icon85.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('d0b1b4b7becb41fda3ac54a263d70c8d', 'icon86.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('07c575e9489e4680926335572b608f57', 'icon88.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('007a9fbf420248399f534b4e2cf0e1c0', 'icon9.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('bec8245f30b743c1b3ee0310b478c806', 'icon96.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('782523736f5a42fba167086e92893c0f', 'icon_19.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('3efbbf1c76fa406581e4243a6eadbb15', 'icq.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('f6237be28aef4daa963bf5ebe643b3ed', 'id.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('b9e936bf4b9a4824a7ad4870b3ea5bbd', 'ins.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('c649f90455504312b885216633f5a1d1', 'jar.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('05e6218477e34ec390a40f617c6700bf', 'key.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('62f6ecaa086049069ebb7db38faa6776', 'layout.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('812717901c8242489bd617dc330b26ad', 'layout2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('e258914fb691499f8f5d50b440435d67', 'left.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('349c1847f7584499b683a6e94b08a4d3', 'lightbulb.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('907561e28ec24355b44296288bf11d73', 'lock.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('3c66e7d0900140808ce4b80b0ce09fff', 'lock3.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('41a1a152f2da4624bf877651b5eb29e0', 'modules_wizard.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('e70d207843094c09a7e090c8814a9980', 'monitor.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('511ec93ed9af434282ad9d5539ccd9da', 'node.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('92c656594abe4787b58321dc8fedc0a1', 'ok.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('064f6505037e42dbadb98e27aa7db4d9', 'ok1.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('df27ffb5896e454f88a4a1d3391779a3', 'ok3.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('23e42a38f85e400ebc762060f7011253', 'ok4.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('c110aad7e7a046f2bb4976841372f607', 'ok5.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('6e990812617948fe931a86e519357fe8', 'org.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('2e53344d6b9b4fb1adaffec632e74897', 'org2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('35b49190c48d4af584b4dda07c253a5c', 'outs.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('3008f35f33cb4a98a0388dc41b2e5373', 'own.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('de42451d28fa4126a076ba8b4f09d2f5', 'page.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('4121fc743815424f8f3f940af69df79a', 'page2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('4ad28f42a70e446eab1c14db3fa5e70a', 'page3.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('698f281e799f40f4ab3498ed08be39a4', 'page_code.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('c8e5d3e8c7c1473db27c08e2e611711b', 'page_font.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('22198523572f41ebb2381e4a183d877f', 'page_next.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('62cf2ed24e4e461c94abb5a9abe5e683', 'page_office.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('b7ad2e3a35724e5a8b6f01716766db4a', 'page_paint.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('809975321e1647458e0db7d3d49ebed6', 'page_picture.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('133803dde52749a6b656d9e1003540c1', 'page_vector.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('711e604ce8034001b03262527d500e23', 'paint2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('bfd235f00b2f48e4abeb24a1ca5afca5', 'paste.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('ccaf6bdcdeb44ab0a7368c147fab8e65', 'picture.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('5f07f0c5143b46fd83ef711f1d50e715', 'pictures.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('5603760c8a0246ae8d1bdcff31fadd81', 'picture_empty.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('1b16a0ad1b9641ddb3b8050c47149976', 'plugin.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('53d33394cae242f489bea0c50d726293', 'plugin2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('3e0179bbe4e64618ab8365694834fe71', 'printer.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('2d0cc988b207437bae92815d8d98d4f9', 'query.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('e00df6459c55499dbc6cb67f54021e3e', 'redo.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('5a21811d4df54f7983e8c418b9c5c1a3', 'refresh.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('c56e21c9947f40fb84a610839b9cf00b', 'refresh2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('1a4e7c58e2d54119af7c2aea637e2310', 'right.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('d77fcdacfb08437695a7e04d47243ccf', 'save.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('f12935b448314700b181620d0922db67', 'save_all.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('1d49a2905c8540309cf1a46a0721060e', 'search.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('c3bafe3755fc400db05fb6d93a6d5f59', 'security.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('f11ff9d66cf64ec6b037e228c95bda93', 'send_receive.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('ded21d3dda51487c997434ea65da381b', 'shape_align_bottom.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('ac0aa7a5768b4862a4abe99fb428f3a0', 'shape_align_center.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('101f39ec7029453aad7aa81e2ca11042', 'shape_align_middle.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('c2383a3c9d6945d0bd01562801677b34', 'shape_group.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('a01994ff9f794a9391159ea56efe62a9', 'shape_handles.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('11a3ad97dc284b85825af63167542040', 'shape_move_back.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8c111d8f7b404ae28dc34ea9441b9a6f', 'share.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('e5acb5b077f04900b0bc57e9386b54f4', 'sitemap.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('f5df6b88023d4ea796193a3130e3dcbb', 'sql.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('a0a5b4218dd240a98cd911e024c6db6c', 'sql2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('c59e996331fe4d9d8aa26747632dd8bc', 'sql3.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('b9e2a7879c894245838fe7dad1bed189', 'stop.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('7d074e97cdf64a62818d1948b9b512ea', 'stop2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('0672b133e51a44cdbc7199cab8bca7fb', 'stop3.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8c2c52aecbf14cb697e95fa458100014', 'system.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('3df55e796fcb4e1f984b3716ad7d76f7', 'table.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('7118be6210a64c4c8612759f22fa95bc', 'table2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('4cab8a14ef9e476c8da1b73eb524c923', 'tables.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('bbece7c0b0744f3a9f3d432f0cdd04df', 'tables_relation.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('b8ae6dfbab194316bfdfc4e7dbe42964', 'table_edit.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('320fb6a3064446daa198e22769ce2b15', 'tag.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('6b8405eecb164071abf1cd6c8eb0c657', 'task.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('aec9b1c3c79e41199cd93134a04eaa8d', 'task1.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('aef0a104574d42dea37debcd245ecf39', 'task_finish.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('e80bed5a53604e6d99f9df711fafe0a7', 'task_list.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('41597de05a574eec816c013502f89eeb', 'terminal.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('7f1adfc9ab57443f96f6b0e98096a56e', 'textfield.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('c375cc1467724f129abf014a953ae370', 'text_cap.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('b6197f73a2514ee7904643c77c7731c2', 'text_col.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('0b7986a188ee497fb94f6fdae045cfb0', 'text_list.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('31410057b57f40a0aed63eba8d4cd6ef', 'text_upper.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('6e117bfb64194214ac8f4f5da1829e93', 'theme.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('92b2b1c9ef2f43fa9e46875d41e9d081', 'time.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('1079777d6a3d47108d711a933b21e851', 'timeline.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('d367385d456043a1abe1c675825d4c38', 'undo.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('2d911cdcaf4a4c2ba018f20576dd206c', 'up.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('5079472358c549019841ddcf016ad2cd', 'up2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('1ea8a628bd7c4447aa9e4f870e404f67', 'up_left.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('f4ff7dcb2d0f4a0b8afaa7be470cd06d', 'up_right.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('03e7724a9631410e9e4e9eec7203855f', 'user1.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('af34719b66f74fe484633e949a8543b4', 'user2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('44407cdd2c574172be9877fccd42d3aa', 'user20.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('f4596067c6744c858e93c778a0ed64f0', 'user3.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('af9452de30334069abefe0fa28c60425', 'user6.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('b083c35f6d6e413a9c5ec8dbe0b7e135', 'user8.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('5f6bf977cd5e430a9bf4f717b3b3c634', 'vcard.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('63ff261e677d4174b871a3b9bbba99b2', 'vector.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('c660e3d08f364af6aea803f409c5b8d6', 'wand.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('baf06321b8604c669768877c5159efd7', 'webcam.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('a8fa66e08c6542f181f85fc69ebf4ecc', 'zoom_in.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('4b4f9f23b6ba4ba0baadd59c2fc5683d', 'zoom_out.png', '1');

-- ----------------------------
-- Table structure for aos_sys_module
-- ----------------------------
DROP TABLE IF EXISTS `aos_sys_module`;
CREATE TABLE `aos_sys_module` (
  `id_` varchar(64) NOT NULL COMMENT '功能模块流水号',
  `cascade_id_` varchar(255) NOT NULL COMMENT '节点语义ID',
  `name_` varchar(255) NOT NULL COMMENT '功能模块名称',
  `url_` varchar(255) DEFAULT NULL COMMENT '主页面URL',
  `hotkey_` varchar(255) DEFAULT NULL COMMENT '热键',
  `parent_id_` varchar(64) NOT NULL COMMENT '父节点流水号',
  `is_leaf_` varchar(255) NOT NULL DEFAULT '1' COMMENT '是否叶子节点',
  `is_auto_expand_` varchar(255) NOT NULL DEFAULT '0' COMMENT '是否自动展开',
  `icon_name_` varchar(255) DEFAULT NULL COMMENT '节点图标文件名称',
  `status_` varchar(255) NOT NULL DEFAULT '1' COMMENT '当前状态',
  `parent_name_` varchar(255) NOT NULL COMMENT '父节点名称',
  `vector_` varchar(255) DEFAULT NULL COMMENT '矢量图标',
  `sort_no_` int(10) DEFAULT '0' COMMENT '排序号',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能模块表';

-- ----------------------------
-- Records of aos_sys_module
-- ----------------------------
INSERT INTO `aos_sys_module` VALUES ('078df89c7b5b478cb38fd607805c6155', '0.004.002.001.007', '常用表单元素API', 'demo/initFormApi.jhtml', null, 'f73a952eefa2406c9327da6252c4ca79', '1', '0', null, '1', '表单', null, '20');
INSERT INTO `aos_sys_module` VALUES ('09b24aac059f4ba58bfb30652636b543', '0.004.003.001', '综合实例①', 'demo/misc/initMisc1.jhtml', '', '33baf8c9948b47cfa54cd8d7a5e1753d', '1', '0', '', '1', '综合实例', '', '10');
INSERT INTO `aos_sys_module` VALUES ('0b99e9d118b54ee084d9e74bd72cdd1c', '0.001.002', '资源管理', null, null, '7a6d3674e5204937951d01544e18e3aa', '0', '1', 'folder14.png', '1', '系统管理', null, '20');
INSERT INTO `aos_sys_module` VALUES ('1886bf699ec74f79959bdc8ca8e5371a', '0.001.006.004', '在线用户', 'system/sessionLog/init.jhtml', '', '5b9a439743f141729f46a07e8e222a47', '1', '0', 'user2.png', '1', '监控与审计', '', '10');
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
INSERT INTO `aos_sys_module` VALUES ('7e6951e668be44b39fb9f9fd20b21315', '0.004.003.002', '综合实例②', 'demo/misc/initMisc2.jhtml', '', '33baf8c9948b47cfa54cd8d7a5e1753d', '1', '0', '', '1', '综合实例', '', '20');
INSERT INTO `aos_sys_module` VALUES ('81fc0e05049e467d976ec523182421f2', '0.001.002.004', '序列号', 'system/idMgr/init.jhtml', null, '0b99e9d118b54ee084d9e74bd72cdd1c', '1', '0', 'id.png', '1', '资源管理', null, '30');
INSERT INTO `aos_sys_module` VALUES ('870c482cdb2e4c8aa373dcf447964284', '0.004.002.003.003', '可编辑表格', 'demo/grid/initEditGrid.jhtml', null, 'dbf75990cf784e79920caf7eb47856f6', '1', '0', null, '1', '表格', null, '30');
INSERT INTO `aos_sys_module` VALUES ('88bc371429ce4243a49c5893ae036f6a', '0.004.002.004', '报表', '', '', '6cab8b013c314b37aec7c4567d859fc8', '0', '0', '', '1', 'AOS UI组件库', '', '40');
INSERT INTO `aos_sys_module` VALUES ('97c8a95d0aa84d7cba2a8b536ba5326a', '0.004.002.001.002', '表单布局②', 'demo/initForm2.jhtml', null, 'f73a952eefa2406c9327da6252c4ca79', '1', '0', null, '1', '表单', null, '2');
INSERT INTO `aos_sys_module` VALUES ('9a8e5cedcd514af2b37cf5828f509f94', '0.001.001.003', '分类科目', 'system/catalog/init.jhtml', null, '5fb994e71cb14a77891670990d7f554d', '1', '0', 'icon146.png', '1', '基础数据', null, '20');
INSERT INTO `aos_sys_module` VALUES ('9e4cf77815dd49fbac4158c62af3197a', '0.001.001.001', '键值参数', 'system/param/init.jhtml', null, '5fb994e71cb14a77891670990d7f554d', '1', '0', 'icon79.png', '1', '基础数据', null, '1');
INSERT INTO `aos_sys_module` VALUES ('a21b52d911bb44c2978e52bbc523de51', '0.001.004.002', '流程部署', 'workflow/procDeploy/init.jhtml', null, 'cfc4e4bd367047a29e0d72e688f860a2', '1', '0', 'modules_wizard.gif', '1', '业务流程管理', null, '10');
INSERT INTO `aos_sys_module` VALUES ('a27532c1cc8948e5b9bd7d8ac2e30a42', '0.004.002.006.001', '布局①', '', '', 'f84a495bca10403ebe8351d4737dfc72', '1', '0', '', '1', '容器布局', '', '1');
INSERT INTO `aos_sys_module` VALUES ('a4d2ef333e35476680786df9a89e200b', '0.004.002.004.001', '报表①', 'demo/report/initReport1.jhtml', null, '88bc371429ce4243a49c5893ae036f6a', '1', '0', null, '1', '报表', null, '1');
INSERT INTO `aos_sys_module` VALUES ('b4485f8151ae4a7db09ee6cd70c5e24f', '0.004.003.003', '综合实例③', 'demo/misc/initMisc3.jhtml', null, '33baf8c9948b47cfa54cd8d7a5e1753d', '1', '0', null, '1', '综合实例', null, '30');
INSERT INTO `aos_sys_module` VALUES ('b656d6afbbe844d0a6626d0eb590643f', '0.001.003', '组织与权限', null, null, '7a6d3674e5204937951d01544e18e3aa', '0', '1', 'folder23.png', '1', '系统管理', null, '30');
INSERT INTO `aos_sys_module` VALUES ('ba90369eb83540bab4d9492bc17f0937', '0.001.004.005', '流程实例', 'workflow/procInst/init.jhtml', null, 'cfc4e4bd367047a29e0d72e688f860a2', '1', '0', 'icon5.png', '1', '业务流程管理', null, '30');
INSERT INTO `aos_sys_module` VALUES ('bc3c9877c598404da7e31355a4deebad', '0.001.008.002', 'WebSQL', 'system/webSql/init.jhtml', null, '524e5f5c3e5b4cdb90611cd8b15ca684', '1', '0', 'sql.png', '1', '开发工具箱', null, '10');
INSERT INTO `aos_sys_module` VALUES ('bf530e26480d43b08dd20e31e31274af', '0.001.003.006', '角色与授权', 'system/role/init.jhtml', null, 'b656d6afbbe844d0a6626d0eb590643f', '1', '0', 'icon134.png', '1', '组织与权限', null, '5');
INSERT INTO `aos_sys_module` VALUES ('ce516df0e9ae4cecab146ddd0fb56a75', '0.004.003.004', '综合实例④', 'demo/misc/initMisc4.jhtml', '', '33baf8c9948b47cfa54cd8d7a5e1753d', '1', '0', '', '1', '综合实例', '', '40');
INSERT INTO `aos_sys_module` VALUES ('cfc4e4bd367047a29e0d72e688f860a2', '0.001.004', '业务流程管理', null, null, '7a6d3674e5204937951d01544e18e3aa', '0', '1', 'folder24.png', '1', '系统管理', null, '40');
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
  PRIMARY KEY (`id_`),
  UNIQUE KEY `aos_sys_module_post_ukey` (`post_id_`,`module_id_`,`grant_type_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能模块-岗位关联表';

-- ----------------------------
-- Records of aos_sys_module_post
-- ----------------------------

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
  PRIMARY KEY (`id_`),
  UNIQUE KEY `aos_sys_module_role_ukey` (`role_id_`,`module_id_`,`grant_type_`) USING BTREE
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
  PRIMARY KEY (`id_`),
  UNIQUE KEY `aos_sys_module_user_ukey` (`user_id_`,`module_id_`,`grant_type_`) USING BTREE
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
  `nav_icon_` varchar(255) DEFAULT NULL COMMENT '浮动导航图标文件',
  `type_` varchar(255) NOT NULL COMMENT '导航类型',
  `sort_no_` int(10) DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `aos_sys_module_user_nav_ukey` (`module_id_`,`user_id_`,`type_`) USING BTREE
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
  `hotkey_` varchar(255) DEFAULT NULL COMMENT '热键',
  `parent_id_` varchar(64) NOT NULL COMMENT '父节点流水号',
  `pareant_name_` varchar(255) DEFAULT NULL COMMENT '父节点名称',
  `is_leaf_` varchar(255) NOT NULL DEFAULT '1' COMMENT '是否叶子节点',
  `is_auto_expand_` varchar(255) NOT NULL DEFAULT '0' COMMENT '是否自动展开',
  `icon_name_` varchar(255) DEFAULT NULL COMMENT '节点图标文件名称',
  `status_` varchar(255) NOT NULL DEFAULT '1' COMMENT '当前状态',
  `type_` varchar(255) NOT NULL COMMENT '组织类型',
  `biz_code_` varchar(255) DEFAULT NULL COMMENT '业务对照码',
  `custom_code_` varchar(4000) DEFAULT NULL COMMENT '自定义扩展码',
  `create_time_` varchar(255) NOT NULL COMMENT '创建时间',
  `creater_id_` varchar(64) DEFAULT NULL COMMENT '创建人ID',
  `sort_no_` int(10) DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`id_`)
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
  `name_` varchar(255) DEFAULT NULL COMMENT '名称',
  `url_` varchar(255) DEFAULT NULL COMMENT '页面URL',
  `type_` varchar(255) NOT NULL COMMENT '类型',
  `enabled_` varchar(255) NOT NULL COMMENT '使能状态',
  `is_default_` varchar(255) NOT NULL DEFAULT '0' COMMENT '是否缺省子页面',
  `icon_` varchar(255) DEFAULT NULL COMMENT '小图标',
  `icon_big_` varchar(255) DEFAULT NULL COMMENT '大图标',
  `vector_` varchar(255) DEFAULT NULL COMMENT '矢量图标',
  `sort_no_` int(10) DEFAULT '0' COMMENT '排序号',
  PRIMARY KEY (`id_`)
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
  `remark_` varchar(4000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `aos_sys_page_el_ukey` (`dom_id_`,`module_id_`,`page_id_`) USING BTREE
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
  `user_id_` varchar(64) DEFAULT NULL COMMENT '用户流水号',
  `role_id_` varchar(64) DEFAULT NULL COMMENT '角色流水号',
  `post_id_` varchar(64) DEFAULT NULL COMMENT '岗位流水号',
  `grant_type_` varchar(255) NOT NULL COMMENT '权限类型',
  PRIMARY KEY (`id_`)
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
  `value_` varchar(255) DEFAULT NULL COMMENT '参数值',
  `catalog_id_` varchar(64) NOT NULL COMMENT '所属分类流水号',
  `catalog_cascade_id_` varchar(255) NOT NULL COMMENT '所属分类节点语义ID',
  `name_` varchar(255) NOT NULL COMMENT '参数名称',
  `is_overwrite_` varchar(255) NOT NULL COMMENT '是否可覆盖',
  `overwrite_field_` varchar(255) DEFAULT NULL COMMENT '覆盖来源字段',
  `remark_` varchar(4000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `aos_sys_param_ukey` (`key_`) USING BTREE
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
  `status_` varchar(255) NOT NULL DEFAULT '1' COMMENT '当前状态',
  `type_` varchar(255) NOT NULL COMMENT '岗位类型',
  `org_id_` varchar(64) NOT NULL COMMENT '所属部门流水号',
  `create_time_` varchar(255) NOT NULL COMMENT '创建时间',
  `creater_id_` varchar(64) NOT NULL COMMENT '创建人ID',
  `org_cascade_id_` varchar(255) NOT NULL COMMENT '所属部门节点语义ID',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='岗位表';

-- ----------------------------
-- Records of aos_sys_post
-- ----------------------------

-- ----------------------------
-- Table structure for aos_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `aos_sys_role`;
CREATE TABLE `aos_sys_role` (
  `id_` varchar(64) NOT NULL COMMENT ' 流水号',
  `name_` varchar(255) NOT NULL COMMENT '角色名称',
  `status_` varchar(255) NOT NULL DEFAULT '1' COMMENT '当前状态',
  `type_` varchar(255) NOT NULL COMMENT '角色类型',
  `create_time_` varchar(255) NOT NULL COMMENT '创建时间',
  `creater_id_` varchar(64) NOT NULL COMMENT '创建人ID',
  `creater_org_id_` varchar(64) NOT NULL COMMENT '创建人所属部门流水号',
  `creater_org_cascade_id_` varchar(255) NOT NULL COMMENT '创建人所属部门节点语义ID',
  PRIMARY KEY (`id_`)
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
  `type_` varchar(255) DEFAULT NULL COMMENT '类型',
  `prefix_` varchar(255) DEFAULT NULL COMMENT '前缀',
  `start_` varchar(255) DEFAULT '1' COMMENT '起始值',
  `step_` varchar(255) DEFAULT '1' COMMENT '递增步长',
  `cur_value_` varchar(255) DEFAULT '0' COMMENT '当前值',
  `status_` varchar(255) NOT NULL DEFAULT '1' COMMENT '当前状态',
  `connector_` varchar(255) DEFAULT NULL COMMENT '连接符',
  `suffix_` varchar(255) DEFAULT NULL COMMENT '后缀',
  `db_seq_name_` varchar(255) DEFAULT NULL COMMENT 'DBSequence名称',
  `max_value_` varchar(255) DEFAULT '9223372036854775807' COMMENT '最大值',
  `is_circul_` varchar(255) DEFAULT '0' COMMENT '是否循环',
  `min_value_` varchar(255) DEFAULT '1' COMMENT '最小值',
  `is_leftpad_` varchar(255) DEFAULT '0' COMMENT '是否左补足',
  `format_value_` varchar(255) DEFAULT NULL COMMENT '当前格式化值',
  `remark_` varchar(4000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `aos_sys_sequence_name_ukey` (`name_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ID配置表';

-- ----------------------------
-- Records of aos_sys_sequence
-- ----------------------------
INSERT INTO `aos_sys_sequence` VALUES ('2abfc360e8a74e21bcda37113269fca0', 'DEMOID', '1', null, '1', '1', '7644', '1', null, null, null, '9223372036854775807', '0', '1', '0', '7644', '演示模块相关功能使用的ID发生器');
INSERT INTO `aos_sys_sequence` VALUES ('40b37118cebf431283415862d355c72c', 'CARDID', '1', '', '1', '1', '10005012', '1', '', '', null, '99999999', '0', '10000000', '0', '10005012', '范例系统卡号');
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
  `sex_` varchar(255) NOT NULL DEFAULT '0' COMMENT '性别',
  `org_id_` varchar(64) NOT NULL COMMENT '所属主部门流水号',
  `status_` varchar(255) NOT NULL COMMENT '用户状态',
  `type_` varchar(255) NOT NULL COMMENT '用户类型',
  `biz_code_` varchar(255) DEFAULT NULL COMMENT '业务对照码',
  `create_time_` varchar(255) NOT NULL COMMENT ' 经办时间',
  `creater_id_` varchar(64) NOT NULL COMMENT '经办人流水号',
  `org_cascade_id_` varchar(255) NOT NULL COMMENT '所属部门节点语义ID',
  `delete_flag_` varchar(255) NOT NULL COMMENT '逻辑删除标识',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户基本信息表';

-- ----------------------------
-- Records of aos_sys_user
-- ----------------------------
INSERT INTO `aos_sys_user` VALUES ('fa04db9dd2f54d61b0c8202a25de2dc6', 'root', 'gnRD3IiRP6s=', '超级用户', '1', '63cf387a243d4d9799367d773b853346', '1', '2', '', '2014-09-27 22:12:56', 'fa04db9dd2f54d61b0c8202a25de2dc6', '0', '0');
INSERT INTO `aos_sys_user` VALUES ('fe24c4ac34444902a2129ec1debf9ed4', 'caocao', 'gnRD3IiRP6s=', '曹操', '3', 'b2fa97f8bed34eee86201f01fa786ed4', '1', '1', '', '2016-02-02 21:55:57', 'fa04db9dd2f54d61b0c8202a25de2dc6', '0.001', '0');

-- ----------------------------
-- Table structure for aos_sys_user_cfg
-- ----------------------------
DROP TABLE IF EXISTS `aos_sys_user_cfg`;
CREATE TABLE `aos_sys_user_cfg` (
  `id_` varchar(64) NOT NULL COMMENT '用户ID',
  `theme_` varchar(255) DEFAULT NULL COMMENT '用户界面主题',
  `skin_` varchar(255) DEFAULT NULL COMMENT '用户界面皮肤',
  `is_show_top_nav_` varchar(255) DEFAULT NULL COMMENT '是否显示水平导航条',
  `navbar_btn_style_` varchar(255) DEFAULT NULL COMMENT '导航条按钮风格',
  `tab_focus_color_` varchar(255) DEFAULT NULL COMMENT 'Tab高亮颜色',
  `nav_tab_index_` varchar(255) DEFAULT NULL COMMENT '导航缺省活动页',
  PRIMARY KEY (`id_`)
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
  `email_` varchar(255) DEFAULT NULL COMMENT '电子邮件',
  `fixed_phone_` varchar(255) DEFAULT NULL COMMENT '固定电话',
  `mobile_phone_` varchar(255) DEFAULT NULL COMMENT '移动电话',
  `address_` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `zip_` varchar(255) DEFAULT NULL COMMENT '邮编',
  `birthday_` varchar(255) DEFAULT NULL COMMENT '生日',
  `idno_` varchar(255) DEFAULT NULL COMMENT '身份证号',
  `qq_` varchar(255) DEFAULT NULL COMMENT 'QQ',
  `dynamic_field_` varchar(4000) DEFAULT NULL COMMENT '动态扩展字段',
  `remark_` varchar(4000) DEFAULT NULL COMMENT '备注',
  `filed1_` varchar(255) DEFAULT NULL COMMENT '静态扩展字段1',
  `filed2_` varchar(255) DEFAULT NULL COMMENT '静态扩展字段2',
  `filed3_` varchar(255) DEFAULT NULL COMMENT '静态扩展字段3',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户扩展信息表';

-- ----------------------------
-- Records of aos_sys_user_ext
-- ----------------------------
INSERT INTO `aos_sys_user_ext` VALUES ('fa04db9dd2f54d61b0c8202a25de2dc6', '307916217@qq.com', '', '186188188188', '', '', '', '', '307916217', '', '超级用户拥有系统最高权限。', '', '', null);
INSERT INTO `aos_sys_user_ext` VALUES ('fe24c4ac34444902a2129ec1debf9ed4', '', '', '', '', '', '', '', '', '', '', '', '', null);

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
  PRIMARY KEY (`id_`),
  UNIQUE KEY `aos_sys_user_post_ukey` (`user_id_`,`post_id_`) USING BTREE
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
  PRIMARY KEY (`id_`),
  UNIQUE KEY `aos_sys_user_role_ukey` (`user_id_`,`role_id_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-角色关联表';

-- ----------------------------
-- Records of aos_sys_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_evt_log
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_evt_log`;
CREATE TABLE `aos_wf_evt_log` (
  `log_nr_` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `proc_def_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `proc_inst_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `execution_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `task_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `time_stamp_` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `data_` longblob,
  `lock_owner_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `lock_time_` timestamp NULL DEFAULT NULL,
  `is_processed_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`log_nr_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_evt_log
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_ge_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_ge_bytearray`;
CREATE TABLE `aos_wf_ge_bytearray` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `rev_` int(11) DEFAULT NULL,
  `name_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `deployment_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `bytes_` longblob,
  `generated_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_`),
  KEY `aos_fk_bytearr_depl` (`deployment_id_`) USING BTREE,
  CONSTRAINT `aos_wf_ge_bytearray_ibfk_1` FOREIGN KEY (`deployment_id_`) REFERENCES `aos_wf_re_deployment` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='InnoDB free: 132096 kB; (`deployment_id_`) REFER `aos/aos_wf_re_deployment`(`id_';

-- ----------------------------
-- Records of aos_wf_ge_bytearray
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_ge_property
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_ge_property`;
CREATE TABLE `aos_wf_ge_property` (
  `name_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `value_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `rev_` int(11) DEFAULT NULL,
  PRIMARY KEY (`name_`)
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
  `id_` varchar(64) COLLATE utf8_bin NOT NULL,
  `proc_def_id_` varchar(64) COLLATE utf8_bin NOT NULL,
  `proc_inst_id_` varchar(64) COLLATE utf8_bin NOT NULL,
  `execution_id_` varchar(64) COLLATE utf8_bin NOT NULL,
  `aos_id_` varchar(255) COLLATE utf8_bin NOT NULL,
  `task_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `call_proc_inst_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `aos_name_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `aos_type_` varchar(255) COLLATE utf8_bin NOT NULL,
  `assignee_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `start_time_` datetime NOT NULL,
  `end_time_` datetime DEFAULT NULL,
  `duration_` bigint(20) DEFAULT NULL,
  `tenant_id_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`id_`),
  KEY `aos_idx_hi_act_inst_start` (`start_time_`) USING BTREE,
  KEY `aos_idx_hi_act_inst_end` (`end_time_`) USING BTREE,
  KEY `aos_idx_hi_act_inst_procinst` (`proc_inst_id_`,`aos_id_`) USING BTREE,
  KEY `aos_idx_hi_act_inst_exec` (`execution_id_`,`aos_id_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_hi_actinst
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_hi_attachment
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_hi_attachment`;
CREATE TABLE `aos_wf_hi_attachment` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL,
  `rev_` int(11) DEFAULT NULL,
  `user_id_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `type_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `task_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `proc_inst_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `url_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `content_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `time_` datetime DEFAULT NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_hi_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_hi_comment
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_hi_comment`;
CREATE TABLE `aos_wf_hi_comment` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL,
  `type_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `time_` datetime NOT NULL,
  `user_id_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `task_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `proc_inst_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `action_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `message_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `full_msg_` longblob,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_hi_comment
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_hi_detail
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_hi_detail`;
CREATE TABLE `aos_wf_hi_detail` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL,
  `type_` varchar(255) COLLATE utf8_bin NOT NULL,
  `proc_inst_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `execution_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `task_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `act_inst_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `name_` varchar(255) COLLATE utf8_bin NOT NULL,
  `var_type_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `rev_` int(11) DEFAULT NULL,
  `time_` datetime NOT NULL,
  `bytearray_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `double_` double DEFAULT NULL,
  `long_` bigint(20) DEFAULT NULL,
  `text_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `text2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id_`),
  KEY `aos_idx_hi_detail_proc_inst` (`proc_inst_id_`) USING BTREE,
  KEY `aos_idx_hi_detail_act_inst` (`act_inst_id_`) USING BTREE,
  KEY `aos_idx_hi_detail_time` (`time_`) USING BTREE,
  KEY `aos_idx_hi_detail_name` (`name_`) USING BTREE,
  KEY `aos_idx_hi_detail_task_id` (`task_id_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_hi_detail
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_hi_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_hi_identitylink`;
CREATE TABLE `aos_wf_hi_identitylink` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_id_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `type_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user_id_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `task_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `proc_inst_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id_`),
  KEY `aos_idx_hi_ident_lnk_user` (`user_id_`) USING BTREE,
  KEY `aos_idx_hi_ident_lnk_task` (`task_id_`) USING BTREE,
  KEY `aos_idx_hi_ident_lnk_procinst` (`proc_inst_id_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_hi_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_hi_procinst
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_hi_procinst`;
CREATE TABLE `aos_wf_hi_procinst` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL,
  `proc_inst_id_` varchar(64) COLLATE utf8_bin NOT NULL,
  `business_key_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `proc_def_id_` varchar(64) COLLATE utf8_bin NOT NULL,
  `start_time_` datetime NOT NULL,
  `end_time_` datetime DEFAULT NULL,
  `duration_` bigint(20) DEFAULT NULL,
  `start_user_id_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `start_act_id_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `end_act_id_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `super_process_instance_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `delete_reason_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `name_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id_`),
  UNIQUE KEY `proc_inst_id_` (`proc_inst_id_`) USING BTREE,
  KEY `aos_idx_hi_pro_inst_end` (`end_time_`) USING BTREE,
  KEY `aos_idx_hi_pro_i_buskey` (`business_key_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_hi_procinst
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_hi_taskinst
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_hi_taskinst`;
CREATE TABLE `aos_wf_hi_taskinst` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL,
  `proc_def_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `task_def_key_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `proc_inst_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `execution_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `name_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `parent_task_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `description_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `owner_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `assignee_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `start_time_` datetime NOT NULL,
  `claim_time_` datetime DEFAULT NULL,
  `end_time_` datetime DEFAULT NULL,
  `duration_` bigint(20) DEFAULT NULL,
  `delete_reason_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `priority_` int(11) DEFAULT NULL,
  `due_date_` datetime DEFAULT NULL,
  `form_key_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `category_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`id_`),
  KEY `aos_idx_hi_task_inst_procinst` (`proc_inst_id_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_hi_taskinst
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_hi_varinst
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_hi_varinst`;
CREATE TABLE `aos_wf_hi_varinst` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL,
  `proc_inst_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `execution_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `task_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `name_` varchar(255) COLLATE utf8_bin NOT NULL,
  `var_type_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `rev_` int(11) DEFAULT NULL,
  `bytearray_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `double_` double DEFAULT NULL,
  `long_` bigint(20) DEFAULT NULL,
  `text_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `text2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `create_time_` datetime DEFAULT NULL,
  `last_updated_time_` datetime DEFAULT NULL,
  PRIMARY KEY (`id_`),
  KEY `aos_idx_hi_procvar_proc_inst` (`proc_inst_id_`) USING BTREE,
  KEY `aos_idx_hi_procvar_name_type` (`name_`,`var_type_`) USING BTREE,
  KEY `aos_idx_hi_procvar_task_id` (`task_id_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_hi_varinst
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_id_group
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_id_group`;
CREATE TABLE `aos_wf_id_group` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `rev_` int(11) DEFAULT NULL,
  `name_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `type_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_id_group
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_id_info
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_id_info`;
CREATE TABLE `aos_wf_id_info` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `rev_` int(11) DEFAULT NULL,
  `user_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `type_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `key_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `value_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `password_` longblob,
  `parent_id_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_id_info
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_id_membership
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_id_membership`;
CREATE TABLE `aos_wf_id_membership` (
  `user_id_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_id_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id_`,`group_id_`),
  KEY `aos_fk_memb_group` (`group_id_`) USING BTREE,
  CONSTRAINT `aos_wf_id_membership_ibfk_1` FOREIGN KEY (`group_id_`) REFERENCES `aos_wf_id_group` (`id_`),
  CONSTRAINT `aos_wf_id_membership_ibfk_2` FOREIGN KEY (`user_id_`) REFERENCES `aos_wf_id_user` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='InnoDB free: 132096 kB; (`group_id_`) REFER `aos/aos_wf_id_group`(`id_`); (`user';

-- ----------------------------
-- Records of aos_wf_id_membership
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_id_user
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_id_user`;
CREATE TABLE `aos_wf_id_user` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `rev_` int(11) DEFAULT NULL,
  `first_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `last_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pwd_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `picture_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_id_user
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_re_deployment
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_re_deployment`;
CREATE TABLE `aos_wf_re_deployment` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `name_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `category_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `deploy_time_` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_re_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_re_model
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_re_model`;
CREATE TABLE `aos_wf_re_model` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL,
  `rev_` int(11) DEFAULT NULL,
  `name_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `key_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `category_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `create_time_` timestamp NULL DEFAULT NULL,
  `last_update_time_` timestamp NULL DEFAULT NULL,
  `version_` int(11) DEFAULT NULL,
  `meta_info_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `deployment_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `editor_source_value_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `editor_source_extra_value_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`id_`),
  KEY `aos_fk_model_source` (`editor_source_value_id_`) USING BTREE,
  KEY `aos_fk_model_source_extra` (`editor_source_extra_value_id_`) USING BTREE,
  KEY `aos_fk_model_deployment` (`deployment_id_`) USING BTREE,
  CONSTRAINT `aos_wf_re_model_ibfk_1` FOREIGN KEY (`deployment_id_`) REFERENCES `aos_wf_re_deployment` (`id_`),
  CONSTRAINT `aos_wf_re_model_ibfk_2` FOREIGN KEY (`editor_source_value_id_`) REFERENCES `aos_wf_ge_bytearray` (`id_`),
  CONSTRAINT `aos_wf_re_model_ibfk_3` FOREIGN KEY (`editor_source_extra_value_id_`) REFERENCES `aos_wf_ge_bytearray` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='InnoDB free: 132096 kB; (`deployment_id_`) REFER `aos/aos_wf_re_deployment`(`id_';

-- ----------------------------
-- Records of aos_wf_re_model
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_re_procdef
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_re_procdef`;
CREATE TABLE `aos_wf_re_procdef` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL,
  `rev_` int(11) DEFAULT NULL,
  `category_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `key_` varchar(255) COLLATE utf8_bin NOT NULL,
  `version_` int(11) NOT NULL,
  `deployment_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `resource_name_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `dgrm_resource_name_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `description_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `has_start_form_key_` tinyint(4) DEFAULT NULL,
  `has_graphical_notation_` tinyint(4) DEFAULT NULL,
  `suspension_state_` int(11) DEFAULT NULL,
  `tenant_id_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `aos_uniq_procdef` (`key_`,`version_`,`tenant_id_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_wf_re_procdef
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_ru_event_subscr
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_ru_event_subscr`;
CREATE TABLE `aos_wf_ru_event_subscr` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL,
  `rev_` int(11) DEFAULT NULL,
  `event_type_` varchar(255) COLLATE utf8_bin NOT NULL,
  `event_name_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `execution_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `proc_inst_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `activity_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `configuration_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created_` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `proc_def_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`id_`),
  KEY `aos_idx_event_subscr_config_` (`configuration_`) USING BTREE,
  KEY `aos_fk_event_exec` (`execution_id_`) USING BTREE,
  CONSTRAINT `aos_wf_ru_event_subscr_ibfk_1` FOREIGN KEY (`execution_id_`) REFERENCES `aos_wf_ru_execution` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='InnoDB free: 132096 kB; (`execution_id_`) REFER `aos/aos_wf_ru_execution`(`id_`)';

-- ----------------------------
-- Records of aos_wf_ru_event_subscr
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_ru_execution
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_ru_execution`;
CREATE TABLE `aos_wf_ru_execution` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `rev_` int(11) DEFAULT NULL,
  `proc_inst_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `business_key_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `parent_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `proc_def_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `super_exec_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `aos_id_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `is_active_` tinyint(4) DEFAULT NULL,
  `is_concurrent_` tinyint(4) DEFAULT NULL,
  `is_scope_` tinyint(4) DEFAULT NULL,
  `is_event_scope_` tinyint(4) DEFAULT NULL,
  `suspension_state_` int(11) DEFAULT NULL,
  `cached_ent_state_` int(11) DEFAULT NULL,
  `tenant_id_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `name_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `lock_time_` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_`),
  KEY `aos_idx_exec_buskey` (`business_key_`) USING BTREE,
  KEY `aos_fk_exe_procinst` (`proc_inst_id_`) USING BTREE,
  KEY `aos_fk_exe_parent` (`parent_id_`) USING BTREE,
  KEY `aos_fk_exe_super` (`super_exec_`) USING BTREE,
  KEY `aos_fk_exe_procdef` (`proc_def_id_`) USING BTREE,
  CONSTRAINT `aos_wf_ru_execution_ibfk_1` FOREIGN KEY (`parent_id_`) REFERENCES `aos_wf_ru_execution` (`id_`),
  CONSTRAINT `aos_wf_ru_execution_ibfk_2` FOREIGN KEY (`proc_def_id_`) REFERENCES `aos_wf_re_procdef` (`id_`),
  CONSTRAINT `aos_wf_ru_execution_ibfk_3` FOREIGN KEY (`proc_inst_id_`) REFERENCES `aos_wf_ru_execution` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `aos_wf_ru_execution_ibfk_4` FOREIGN KEY (`super_exec_`) REFERENCES `aos_wf_ru_execution` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='InnoDB free: 132096 kB; (`parent_id_`) REFER `aos/aos_wf_ru_execution`(`id_`); (';

-- ----------------------------
-- Records of aos_wf_ru_execution
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_ru_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_ru_identitylink`;
CREATE TABLE `aos_wf_ru_identitylink` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `rev_` int(11) DEFAULT NULL,
  `group_id_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `type_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user_id_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `task_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `proc_inst_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `proc_def_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id_`),
  KEY `aos_idx_ident_lnk_user` (`user_id_`) USING BTREE,
  KEY `aos_idx_ident_lnk_group` (`group_id_`) USING BTREE,
  KEY `aos_idx_athrz_procedef` (`proc_def_id_`) USING BTREE,
  KEY `aos_fk_tskass_task` (`task_id_`) USING BTREE,
  KEY `aos_fk_idl_procinst` (`proc_inst_id_`) USING BTREE,
  CONSTRAINT `aos_wf_ru_identitylink_ibfk_1` FOREIGN KEY (`proc_def_id_`) REFERENCES `aos_wf_re_procdef` (`id_`),
  CONSTRAINT `aos_wf_ru_identitylink_ibfk_2` FOREIGN KEY (`proc_inst_id_`) REFERENCES `aos_wf_ru_execution` (`id_`),
  CONSTRAINT `aos_wf_ru_identitylink_ibfk_3` FOREIGN KEY (`task_id_`) REFERENCES `aos_wf_ru_task` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='InnoDB free: 132096 kB; (`proc_def_id_`) REFER `aos/aos_wf_re_procdef`(`id_`); (';

-- ----------------------------
-- Records of aos_wf_ru_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_ru_job
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_ru_job`;
CREATE TABLE `aos_wf_ru_job` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL,
  `rev_` int(11) DEFAULT NULL,
  `type_` varchar(255) COLLATE utf8_bin NOT NULL,
  `lock_exp_time_` timestamp NULL DEFAULT NULL,
  `lock_owner_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `exclusive_` tinyint(1) DEFAULT NULL,
  `execution_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `process_instance_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `proc_def_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `retries_` int(11) DEFAULT NULL,
  `exception_stack_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `exception_msg_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `duedate_` timestamp NULL DEFAULT NULL,
  `repeat_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `handler_type_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `handler_cfg_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`id_`),
  KEY `aos_fk_job_exception` (`exception_stack_id_`) USING BTREE,
  CONSTRAINT `aos_wf_ru_job_ibfk_1` FOREIGN KEY (`exception_stack_id_`) REFERENCES `aos_wf_ge_bytearray` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='InnoDB free: 132096 kB; (`exception_stack_id_`) REFER `aos/aos_wf_ge_bytearray`(';

-- ----------------------------
-- Records of aos_wf_ru_job
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_ru_task
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_ru_task`;
CREATE TABLE `aos_wf_ru_task` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `rev_` int(11) DEFAULT NULL,
  `execution_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `proc_inst_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `proc_def_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `name_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `parent_task_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `description_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `task_def_key_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `owner_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `assignee_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `delegation_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `priority_` int(11) DEFAULT NULL,
  `create_time_` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `due_date_` datetime DEFAULT NULL,
  `category_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `suspension_state_` int(11) DEFAULT NULL,
  `tenant_id_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `form_key_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id_`),
  KEY `aos_idx_task_create` (`create_time_`) USING BTREE,
  KEY `aos_fk_task_exe` (`execution_id_`) USING BTREE,
  KEY `aos_fk_task_procinst` (`proc_inst_id_`) USING BTREE,
  KEY `aos_fk_task_procdef` (`proc_def_id_`) USING BTREE,
  CONSTRAINT `aos_wf_ru_task_ibfk_1` FOREIGN KEY (`execution_id_`) REFERENCES `aos_wf_ru_execution` (`id_`),
  CONSTRAINT `aos_wf_ru_task_ibfk_2` FOREIGN KEY (`proc_def_id_`) REFERENCES `aos_wf_re_procdef` (`id_`),
  CONSTRAINT `aos_wf_ru_task_ibfk_3` FOREIGN KEY (`proc_inst_id_`) REFERENCES `aos_wf_ru_execution` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='InnoDB free: 132096 kB; (`execution_id_`) REFER `aos/aos_wf_ru_execution`(`id_`)';

-- ----------------------------
-- Records of aos_wf_ru_task
-- ----------------------------

-- ----------------------------
-- Table structure for aos_wf_ru_variable
-- ----------------------------
DROP TABLE IF EXISTS `aos_wf_ru_variable`;
CREATE TABLE `aos_wf_ru_variable` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL,
  `rev_` int(11) DEFAULT NULL,
  `type_` varchar(255) COLLATE utf8_bin NOT NULL,
  `name_` varchar(255) COLLATE utf8_bin NOT NULL,
  `execution_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `proc_inst_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `task_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `bytearray_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `double_` double DEFAULT NULL,
  `long_` bigint(20) DEFAULT NULL,
  `text_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `text2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id_`),
  KEY `aos_idx_variable_task_id` (`task_id_`) USING BTREE,
  KEY `aos_fk_var_exe` (`execution_id_`) USING BTREE,
  KEY `aos_fk_var_procinst` (`proc_inst_id_`) USING BTREE,
  KEY `aos_fk_var_bytearray` (`bytearray_id_`) USING BTREE,
  CONSTRAINT `aos_wf_ru_variable_ibfk_1` FOREIGN KEY (`bytearray_id_`) REFERENCES `aos_wf_ge_bytearray` (`id_`),
  CONSTRAINT `aos_wf_ru_variable_ibfk_2` FOREIGN KEY (`execution_id_`) REFERENCES `aos_wf_ru_execution` (`id_`),
  CONSTRAINT `aos_wf_ru_variable_ibfk_3` FOREIGN KEY (`proc_inst_id_`) REFERENCES `aos_wf_ru_execution` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='InnoDB free: 132096 kB; (`bytearray_id_`) REFER `aos/aos_wf_ge_bytearray`(`id_`)';

-- ----------------------------
-- Records of aos_wf_ru_variable
-- ----------------------------

-- ----------------------------
-- Table structure for demo_account
-- ----------------------------
DROP TABLE IF EXISTS `demo_account`;
CREATE TABLE `demo_account` (
  `id_` varchar(64) NOT NULL COMMENT '流水号',
  `name_` varchar(255) NOT NULL COMMENT '姓名',
  `card_id_` varchar(255) NOT NULL COMMENT '卡号',
  `card_type_` varchar(6) NOT NULL COMMENT '卡类型',
  `balance_` double(10,3) DEFAULT NULL COMMENT '可用余额',
  `credit_line_` double(10,3) DEFAULT NULL COMMENT '信用额度',
  `org_id_` varchar(64) DEFAULT NULL COMMENT '所属银行机构ID',
  `id_no_` varchar(255) DEFAULT NULL COMMENT '身份证号',
  `sex_` varchar(6) DEFAULT NULL COMMENT '性别',
  `birthday_` date DEFAULT NULL COMMENT '生日',
  `age_` int(255) DEFAULT NULL COMMENT '年龄',
  `address_` varchar(255) DEFAULT NULL COMMENT '地址',
  `create_time_` datetime NOT NULL COMMENT '创建时间',
  `create_user_id_` varchar(64) NOT NULL COMMENT '创建人ID',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='银行信用卡账户表';

-- ----------------------------
-- Records of demo_account
-- ----------------------------
INSERT INTO `demo_account` VALUES ('6638', '毛均放', '10004006', '2', '43564.470', '80000.000', '000', '2925196912171318', '3', '2016-04-24', '88', '上海霞飞路580号', '2016-04-24 21:50:49', '1');
INSERT INTO `demo_account` VALUES ('6639', '刘贴劫', '10004007', '2', '10006.180', '80000.000', '000', '2925195111227810', '1', '2016-04-24', '42', '上海霞飞路8号', '2016-04-24 21:50:50', '1');
INSERT INTO `demo_account` VALUES ('6640', '郤芹', '10004008', '1', '49670.470', '80000.000', '000', '2925196111177374', '3', '2016-04-24', '98', '上海霞飞路27号', '2016-04-24 21:50:50', '1');
INSERT INTO `demo_account` VALUES ('6641', '毛秦烟', '10004009', '2', '12499.930', '80000.000', '000', '2925198111134596', '1', '2016-04-24', '37', '上海霞飞路640号', '2016-04-24 21:50:50', '1');
INSERT INTO `demo_account` VALUES ('6642', '熊移', '10004010', '2', '50077.320', '80000.000', '000', '2925195912163086', '2', '2016-04-24', '60', '上海霞飞路15号', '2016-04-24 21:50:50', '1');
INSERT INTO `demo_account` VALUES ('6643', '张腿', '10004011', '2', '28854.480', '80000.000', '000', '2925196611112784', '3', '2016-04-24', '18', '上海霞飞路986号', '2016-04-24 21:50:50', '1');
INSERT INTO `demo_account` VALUES ('6644', '毛祥', '10004012', '1', '49407.700', '80000.000', '000', '2925195711286290', '2', '2016-04-24', '68', '上海霞飞路937号', '2016-04-24 21:50:50', '1');
INSERT INTO `demo_account` VALUES ('6645', '黄航涛', '10004013', '1', '19418.720', '80000.000', '000', '2925195212268890', '2', '2016-04-24', '25', '上海霞飞路408号', '2016-04-24 21:50:50', '1');
INSERT INTO `demo_account` VALUES ('6646', '周碉', '10004014', '2', '58464.670', '80000.000', '000', '2925193611239845', '1', '2016-04-24', '92', '上海霞飞路926号', '2016-04-24 21:50:50', '1');
INSERT INTO `demo_account` VALUES ('6647', '郤僚镭', '10004015', '2', '51873.590', '80000.000', '000', '2925194212153394', '2', '2016-04-24', '59', '上海霞飞路54号', '2016-04-24 21:50:50', '1');
INSERT INTO `demo_account` VALUES ('6648', '郤很宇', '10004016', '2', '52692.540', '80000.000', '000', '2925193710241751', '2', '2016-04-24', '84', '上海霞飞路676号', '2016-04-24 21:50:51', '1');
INSERT INTO `demo_account` VALUES ('6649', '段妨', '10004017', '2', '61325.340', '80000.000', '000', '2925200511114199', '2', '2016-04-24', '59', '上海霞飞路31号', '2016-04-24 21:50:51', '1');
INSERT INTO `demo_account` VALUES ('6650', '刘舷杠', '10004018', '2', '53578.490', '80000.000', '000', '2925198211115151', '3', '2016-04-24', '87', '上海霞飞路930号', '2016-04-24 21:50:51', '1');
INSERT INTO `demo_account` VALUES ('6651', '张铁', '10004019', '1', '25743.540', '80000.000', '000', '2925201411278792', '1', '2016-04-24', '47', '上海霞飞路58号', '2016-04-24 21:50:51', '1');
INSERT INTO `demo_account` VALUES ('6652', '熊邻吕', '10004020', '1', '15899.500', '80000.000', '000', '2925195511232654', '2', '2016-04-24', '25', '上海霞飞路75号', '2016-04-24 21:50:51', '1');
INSERT INTO `demo_account` VALUES ('6653', '熊米', '10004021', '1', '63871.300', '80000.000', '000', '2925194211289125', '2', '2016-04-24', '48', '上海霞飞路682号', '2016-04-24 21:50:51', '1');
INSERT INTO `demo_account` VALUES ('6654', '段堵澜', '10004022', '2', '36218.550', '80000.000', '000', '2925196012107590', '1', '2016-04-24', '66', '上海霞飞路555号', '2016-04-24 21:50:51', '1');
INSERT INTO `demo_account` VALUES ('6655', '刘焰说', '10004023', '1', '55271.680', '80000.000', '000', '2925196310105481', '1', '2016-04-24', '34', '上海霞飞路397号', '2016-04-24 21:50:51', '1');
INSERT INTO `demo_account` VALUES ('6656', '毛辨央', '10004024', '2', '10514.390', '80000.000', '000', '2925197211107129', '2', '2016-04-24', '56', '上海霞飞路102号', '2016-04-24 21:50:51', '1');
INSERT INTO `demo_account` VALUES ('6657', '赵染吁', '10004025', '2', '28650.640', '80000.000', '000', '2925198412281876', '1', '2016-04-24', '35', '上海霞飞路263号', '2016-04-24 21:50:52', '1');
INSERT INTO `demo_account` VALUES ('6658', '张吨镭', '10004026', '1', '33356.620', '80000.000', '000', '2925192110288400', '2', '2016-04-24', '92', '上海霞飞路951号', '2016-04-24 21:50:52', '1');
INSERT INTO `demo_account` VALUES ('6659', '周咎', '10004027', '2', '67105.650', '80000.000', '000', '2925192512253754', '2', '2016-04-24', '40', '上海霞飞路858号', '2016-04-24 21:50:52', '1');
INSERT INTO `demo_account` VALUES ('6660', '熊忍', '10004028', '2', '37519.170', '80000.000', '000', '2925193510207026', '2', '2016-04-24', '48', '上海霞飞路549号', '2016-04-24 21:50:52', '1');
INSERT INTO `demo_account` VALUES ('6661', '郤嫁', '10004029', '2', '51449.990', '80000.000', '000', '2925194110115019', '2', '2016-04-24', '55', '上海霞飞路656号', '2016-04-24 21:50:52', '1');
INSERT INTO `demo_account` VALUES ('6662', '黄厘', '10004030', '1', '77427.800', '80000.000', '000', '2925192411295712', '3', '2016-04-24', '77', '上海霞飞路439号', '2016-04-24 21:50:52', '1');
INSERT INTO `demo_account` VALUES ('6663', '熊派晌', '10004031', '1', '25261.390', '80000.000', '000', '2925192812297659', '1', '2016-04-24', '44', '上海霞飞路169号', '2016-04-24 21:50:52', '1');
INSERT INTO `demo_account` VALUES ('6664', '段沦', '10004032', '1', '14346.550', '80000.000', '000', '2925199711205804', '1', '2016-04-24', '94', '上海霞飞路307号', '2016-04-24 21:50:52', '1');
INSERT INTO `demo_account` VALUES ('6665', '段衫', '10004033', '1', '59805.360', '80000.000', '000', '2925196610162522', '2', '2016-04-24', '93', '上海霞飞路443号', '2016-04-24 21:50:52', '1');
INSERT INTO `demo_account` VALUES ('6666', '毛俭实', '10004034', '1', '43696.350', '80000.000', '000', '2925198811174956', '2', '2016-04-24', '86', '上海霞飞路390号', '2016-04-24 21:50:52', '1');
INSERT INTO `demo_account` VALUES ('6667', '赵秤企', '10004035', '2', '69474.600', '80000.000', '000', '2925192811183980', '1', '2016-04-24', '62', '上海霞飞路755号', '2016-04-24 21:50:53', '1');
INSERT INTO `demo_account` VALUES ('6668', '张宴糖', '10004036', '2', '45404.810', '80000.000', '000', '2925200412209317', '1', '2016-04-24', '93', '上海霞飞路723号', '2016-04-24 21:50:53', '1');
INSERT INTO `demo_account` VALUES ('6669', '周奎务', '10004037', '2', '46898.160', '80000.000', '000', '2925196211218551', '2', '2016-04-24', '98', '上海霞飞路583号', '2016-04-24 21:50:53', '1');
INSERT INTO `demo_account` VALUES ('6670', '周麻棺', '10004038', '2', '48689.750', '80000.000', '000', '2925194710117895', '3', '2016-04-24', '29', '上海霞飞路932号', '2016-04-24 21:50:53', '1');
INSERT INTO `demo_account` VALUES ('6671', '李权', '10004039', '2', '21372.250', '80000.000', '000', '2925192611231729', '3', '2016-04-24', '86', '上海霞飞路211号', '2016-04-24 21:50:53', '1');
INSERT INTO `demo_account` VALUES ('6672', '熊爸', '10004040', '1', '51168.690', '80000.000', '000', '2925197911202985', '1', '2016-04-24', '33', '上海霞飞路540号', '2016-04-24 21:50:53', '1');
INSERT INTO `demo_account` VALUES ('6673', '李选', '10004041', '2', '24751.100', '80000.000', '000', '2925200812184547', '2', '2016-04-24', '92', '上海霞飞路540号', '2016-04-24 21:50:53', '1');
INSERT INTO `demo_account` VALUES ('6674', '毛鹊', '10004042', '2', '40699.370', '80000.000', '000', '2925199710243822', '2', '2016-04-24', '94', '上海霞飞路999号', '2016-04-24 21:50:53', '1');
INSERT INTO `demo_account` VALUES ('6675', '赵膜', '10004043', '2', '71460.490', '80000.000', '000', '2925200812199675', '2', '2016-04-24', '23', '上海霞飞路963号', '2016-04-24 21:50:53', '1');
INSERT INTO `demo_account` VALUES ('6676', '赵匈痕', '10004044', '1', '50846.200', '80000.000', '000', '2925196910119868', '1', '2016-04-24', '76', '上海霞飞路918号', '2016-04-24 21:50:54', '1');
INSERT INTO `demo_account` VALUES ('6677', '郤鸡', '10004045', '1', '29761.720', '80000.000', '000', '2925201010141060', '3', '2016-04-24', '87', '上海霞飞路373号', '2016-04-24 21:50:54', '1');
INSERT INTO `demo_account` VALUES ('6678', '熊犊', '10004046', '2', '25364.120', '80000.000', '000', '2925200410203377', '2', '2016-04-24', '81', '上海霞飞路199号', '2016-04-24 21:50:54', '1');
INSERT INTO `demo_account` VALUES ('6679', '郤畜', '10004047', '2', '19939.620', '80000.000', '000', '2925198810181381', '2', '2016-04-24', '78', '上海霞飞路659号', '2016-04-24 21:50:54', '1');
INSERT INTO `demo_account` VALUES ('6680', '刘虚让', '10004048', '2', '25616.170', '80000.000', '000', '2925194511119133', '3', '2016-04-24', '26', '上海霞飞路37号', '2016-04-24 21:50:54', '1');
INSERT INTO `demo_account` VALUES ('6681', '段烫', '10004049', '1', '69541.800', '80000.000', '000', '2925198110113870', '2', '2016-04-24', '20', '上海霞飞路280号', '2016-04-24 21:50:54', '1');
INSERT INTO `demo_account` VALUES ('6682', '李田擂', '10004050', '2', '75306.880', '80000.000', '000', '2925199110122537', '2', '2016-04-24', '48', '上海霞飞路21号', '2016-04-24 21:50:54', '1');
INSERT INTO `demo_account` VALUES ('6683', '李攫', '10004051', '2', '68330.520', '80000.000', '000', '2925193111297255', '1', '2016-04-24', '61', '上海霞飞路744号', '2016-04-24 21:50:54', '1');
INSERT INTO `demo_account` VALUES ('6684', '刘仟辜', '10004052', '2', '65430.280', '80000.000', '000', '2925199710167414', '1', '2016-04-24', '83', '上海霞飞路776号', '2016-04-24 21:50:54', '1');
INSERT INTO `demo_account` VALUES ('6685', '张新', '10004053', '1', '48089.780', '80000.000', '000', '2925194112115860', '3', '2016-04-24', '67', '上海霞飞路102号', '2016-04-24 21:50:54', '1');
INSERT INTO `demo_account` VALUES ('6686', '郤驼横', '10004054', '2', '12852.970', '80000.000', '000', '2925194311137227', '1', '2016-04-24', '21', '上海霞飞路877号', '2016-04-24 21:50:55', '1');
INSERT INTO `demo_account` VALUES ('6687', '黄欠宴', '10004055', '1', '16932.700', '80000.000', '000', '2925198511275139', '1', '2016-04-24', '45', '上海霞飞路765号', '2016-04-24 21:50:55', '1');
INSERT INTO `demo_account` VALUES ('6688', '张姐鳖', '10004056', '1', '22389.860', '80000.000', '000', '2925194012206564', '1', '2016-04-24', '67', '上海霞飞路992号', '2016-04-24 21:50:55', '1');
INSERT INTO `demo_account` VALUES ('6689', '李芬记', '10004057', '2', '76274.250', '80000.000', '000', '2925196210179172', '2', '2016-04-24', '75', '上海霞飞路282号', '2016-04-24 21:50:55', '1');
INSERT INTO `demo_account` VALUES ('6690', '刘饺剃', '10004058', '1', '60817.200', '80000.000', '000', '2925194410156086', '2', '2016-04-24', '32', '上海霞飞路474号', '2016-04-24 21:50:55', '1');
INSERT INTO `demo_account` VALUES ('6691', '段陀', '10004059', '1', '13092.300', '80000.000', '000', '2925195912289899', '2', '2016-04-24', '33', '上海霞飞路861号', '2016-04-24 21:50:55', '1');
INSERT INTO `demo_account` VALUES ('6692', '郤慢', '10004060', '2', '39688.140', '80000.000', '000', '2925196011167306', '1', '2016-04-24', '21', '上海霞飞路860号', '2016-04-24 21:50:55', '1');
INSERT INTO `demo_account` VALUES ('6693', '赵莆', '10004061', '2', '20646.480', '80000.000', '000', '2925192512231123', '2', '2016-04-24', '29', '上海霞飞路780号', '2016-04-24 21:50:55', '1');
INSERT INTO `demo_account` VALUES ('6694', '段绑艺', '10004062', '2', '56360.700', '80000.000', '000', '2925200712223879', '1', '2016-04-24', '47', '上海霞飞路9号', '2016-04-24 21:50:55', '1');
INSERT INTO `demo_account` VALUES ('6695', '李地村', '10004063', '2', '75295.100', '80000.000', '000', '2925192112266546', '2', '2016-04-24', '72', '上海霞飞路978号', '2016-04-24 21:50:56', '1');
INSERT INTO `demo_account` VALUES ('6696', '李唁', '10004064', '2', '69137.250', '80000.000', '000', '2925200610268280', '2', '2016-04-24', '19', '上海霞飞路807号', '2016-04-24 21:50:56', '1');
INSERT INTO `demo_account` VALUES ('6697', '刘床寄', '10004065', '1', '29559.860', '80000.000', '000', '2925199812175394', '2', '2016-04-24', '40', '上海霞飞路452号', '2016-04-24 21:50:56', '1');
INSERT INTO `demo_account` VALUES ('6698', '段汕蕾', '10004066', '1', '76914.610', '80000.000', '000', '2925195611183048', '1', '2016-04-24', '51', '上海霞飞路709号', '2016-04-24 21:50:56', '1');
INSERT INTO `demo_account` VALUES ('6699', '毛涕', '10004067', '1', '58080.760', '80000.000', '000', '2925196812231371', '1', '2016-04-24', '25', '上海霞飞路280号', '2016-04-24 21:50:56', '1');
INSERT INTO `demo_account` VALUES ('6700', '刘真臆', '10004068', '2', '42240.710', '80000.000', '000', '2925194910294976', '2', '2016-04-24', '33', '上海霞飞路523号', '2016-04-24 21:50:56', '1');
INSERT INTO `demo_account` VALUES ('6701', '李孟哗', '10004069', '2', '75623.700', '80000.000', '000', '2925197212155995', '1', '2016-04-24', '68', '上海霞飞路370号', '2016-04-24 21:50:56', '1');
INSERT INTO `demo_account` VALUES ('6702', '段天', '10004070', '1', '73177.280', '80000.000', '000', '2925195012269911', '1', '2016-04-24', '21', '上海霞飞路200号', '2016-04-24 21:50:56', '1');
INSERT INTO `demo_account` VALUES ('6703', '黄议仙', '10004071', '1', '20773.660', '80000.000', '000', '2925197210206598', '1', '2016-04-24', '44', '上海霞飞路269号', '2016-04-24 21:50:56', '1');
INSERT INTO `demo_account` VALUES ('6704', '黄蒂企', '10004072', '2', '65862.710', '80000.000', '000', '2925199311192070', '2', '2016-04-24', '82', '上海霞飞路560号', '2016-04-24 21:50:57', '1');
INSERT INTO `demo_account` VALUES ('6705', '段才羞', '10004073', '2', '31471.690', '80000.000', '000', '2925197611279486', '3', '2016-04-24', '61', '上海霞飞路621号', '2016-04-24 21:50:57', '1');
INSERT INTO `demo_account` VALUES ('6706', '张剑铸', '10004074', '2', '26183.530', '80000.000', '000', '2925200610127006', '2', '2016-04-24', '68', '上海霞飞路199号', '2016-04-24 21:50:57', '1');
INSERT INTO `demo_account` VALUES ('6707', '郤痔丁', '10004075', '1', '75039.450', '80000.000', '000', '2925192411248070', '2', '2016-04-24', '47', '上海霞飞路120号', '2016-04-24 21:50:57', '1');
INSERT INTO `demo_account` VALUES ('6708', '李尽', '10004076', '2', '13445.730', '80000.000', '000', '2925196010207653', '3', '2016-04-24', '26', '上海霞飞路7号', '2016-04-24 21:50:57', '1');
INSERT INTO `demo_account` VALUES ('6709', '赵枫', '10004077', '1', '19846.270', '80000.000', '000', '2925196211146979', '3', '2016-04-24', '72', '上海霞飞路43号', '2016-04-24 21:50:57', '1');
INSERT INTO `demo_account` VALUES ('6710', '郤场梳', '10004078', '2', '73440.410', '80000.000', '000', '2925198711224076', '2', '2016-04-24', '45', '上海霞飞路50号', '2016-04-24 21:50:57', '1');
INSERT INTO `demo_account` VALUES ('6711', '李聂逐', '10004079', '1', '44256.200', '80000.000', '000', '2925197210251433', '1', '2016-04-24', '49', '上海霞飞路707号', '2016-04-24 21:50:57', '1');
INSERT INTO `demo_account` VALUES ('6712', '熊紧', '10004080', '2', '28814.110', '80000.000', '000', '2925196710164850', '2', '2016-04-24', '45', '上海霞飞路747号', '2016-04-24 21:50:57', '1');
INSERT INTO `demo_account` VALUES ('6713', '黄愧阁', '10004081', '1', '39012.830', '80000.000', '000', '2925199711202405', '2', '2016-04-24', '61', '上海霞飞路432号', '2016-04-24 21:50:57', '1');
INSERT INTO `demo_account` VALUES ('6714', '熊燕', '10004082', '2', '49134.870', '80000.000', '000', '2925200312251203', '2', '2016-04-24', '65', '上海霞飞路584号', '2016-04-24 21:50:58', '1');
INSERT INTO `demo_account` VALUES ('6715', '张骨拜', '10004083', '2', '7708.560', '80000.000', '000', '2925200312202355', '2', '2016-04-24', '85', '上海霞飞路857号', '2016-04-24 21:50:58', '1');
INSERT INTO `demo_account` VALUES ('6716', '李卿谷', '10004084', '1', '55542.890', '80000.000', '000', '2925197711124337', '1', '2016-04-24', '40', '上海霞飞路805号', '2016-04-24 21:50:58', '1');
INSERT INTO `demo_account` VALUES ('6717', '段汞', '10004085', '1', '10482.900', '80000.000', '000', '2925198711293550', '1', '2016-04-24', '81', '上海霞飞路699号', '2016-04-24 21:50:58', '1');
INSERT INTO `demo_account` VALUES ('6718', '黄尚骆', '10004086', '1', '29411.160', '80000.000', '000', '2925195612263580', '2', '2016-04-24', '80', '上海霞飞路818号', '2016-04-24 21:50:58', '1');
INSERT INTO `demo_account` VALUES ('6719', '熊看', '10004087', '1', '64602.150', '80000.000', '000', '2925197410268263', '1', '2016-04-24', '73', '上海霞飞路290号', '2016-04-24 21:50:58', '1');
INSERT INTO `demo_account` VALUES ('6720', '周琴', '10004088', '2', '56887.610', '80000.000', '000', '2925197712122255', '2', '2016-04-24', '34', '上海霞飞路265号', '2016-04-24 21:50:58', '1');
INSERT INTO `demo_account` VALUES ('6721', '熊怔', '10004089', '1', '64068.300', '80000.000', '000', '2925192411217364', '1', '2016-04-24', '70', '上海霞飞路484号', '2016-04-24 21:50:58', '1');
INSERT INTO `demo_account` VALUES ('6722', '黄护', '10004090', '1', '69723.710', '80000.000', '000', '2925196411122441', '2', '2016-04-24', '37', '上海霞飞路974号', '2016-04-24 21:50:58', '1');
INSERT INTO `demo_account` VALUES ('6723', '段俩', '10004091', '1', '20901.330', '80000.000', '000', '2925197211116094', '3', '2016-04-24', '93', '上海霞飞路779号', '2016-04-24 21:50:59', '1');
INSERT INTO `demo_account` VALUES ('6724', '熊噎', '10004092', '1', '75302.340', '80000.000', '000', '2925198610261012', '2', '2016-04-24', '70', '上海霞飞路274号', '2016-04-24 21:50:59', '1');
INSERT INTO `demo_account` VALUES ('6725', '张搐姚', '10004093', '2', '61251.720', '80000.000', '000', '2925194911102036', '2', '2016-04-24', '19', '上海霞飞路731号', '2016-04-24 21:50:59', '1');
INSERT INTO `demo_account` VALUES ('6726', '熊抨褐', '10004094', '1', '59247.390', '80000.000', '000', '2925193512177615', '3', '2016-04-24', '79', '上海霞飞路348号', '2016-04-24 21:50:59', '1');
INSERT INTO `demo_account` VALUES ('6727', '熊冗绍', '10004095', '2', '71979.500', '80000.000', '000', '2925197611263569', '3', '2016-04-24', '38', '上海霞飞路18号', '2016-04-24 21:50:59', '1');
INSERT INTO `demo_account` VALUES ('6728', '赵哲', '10004096', '1', '20514.730', '80000.000', '000', '2925193311227484', '1', '2016-04-24', '54', '上海霞飞路639号', '2016-04-24 21:50:59', '1');
INSERT INTO `demo_account` VALUES ('6729', '周给凸', '10004097', '2', '21869.600', '80000.000', '000', '2925198611118335', '2', '2016-04-24', '86', '上海霞飞路718号', '2016-04-24 21:50:59', '1');
INSERT INTO `demo_account` VALUES ('6730', '段吁蛮', '10004098', '1', '25374.110', '80000.000', '000', '2925192711121245', '2', '2016-04-24', '95', '上海霞飞路489号', '2016-04-24 21:50:59', '1');
INSERT INTO `demo_account` VALUES ('6731', '段抉唬', '10004099', '2', '76097.100', '80000.000', '000', '2925192511267485', '3', '2016-04-24', '81', '上海霞飞路683号', '2016-04-24 21:50:59', '1');
INSERT INTO `demo_account` VALUES ('6732', '黄示', '10004100', '1', '37172.310', '80000.000', '000', '2925192211204113', '3', '2016-04-24', '65', '上海霞飞路485号', '2016-04-24 21:51:00', '1');
INSERT INTO `demo_account` VALUES ('6733', '段伐', '10004101', '1', '11132.500', '80000.000', '000', '2925194810152737', '2', '2016-04-24', '95', '上海霞飞路42号', '2016-04-24 21:51:00', '1');
INSERT INTO `demo_account` VALUES ('6734', '郤蔷惕', '10004102', '2', '37270.680', '80000.000', '000', '2925193112266137', '2', '2016-04-24', '52', '上海霞飞路234号', '2016-04-24 21:51:00', '1');
INSERT INTO `demo_account` VALUES ('6735', '李号', '10004103', '1', '45697.410', '80000.000', '000', '2925195411187529', '2', '2016-04-24', '30', '上海霞飞路222号', '2016-04-24 21:51:00', '1');
INSERT INTO `demo_account` VALUES ('6736', '张衅对', '10004104', '1', '9067.690', '80000.000', '000', '2925199712275390', '2', '2016-04-24', '44', '上海霞飞路515号', '2016-04-24 21:51:00', '1');
INSERT INTO `demo_account` VALUES ('6737', '毛戊找', '10004105', '2', '41948.510', '80000.000', '000', '2925199411155793', '2', '2016-04-24', '41', '上海霞飞路60号', '2016-04-24 21:51:00', '1');
INSERT INTO `demo_account` VALUES ('6738', '段话噶', '10004106', '2', '41501.290', '80000.000', '000', '2925198310113262', '2', '2016-04-24', '88', '上海霞飞路53号', '2016-04-24 21:51:00', '1');
INSERT INTO `demo_account` VALUES ('6739', '黄署虽', '10004107', '1', '43519.810', '80000.000', '000', '2925199712126111', '2', '2016-04-24', '66', '上海霞飞路829号', '2016-04-24 21:51:00', '1');
INSERT INTO `demo_account` VALUES ('6740', '赵酉', '10004108', '2', '12921.140', '80000.000', '000', '2925201211226247', '1', '2016-04-24', '32', '上海霞飞路338号', '2016-04-24 21:51:01', '1');
INSERT INTO `demo_account` VALUES ('6741', '赵比', '10004109', '2', '29576.380', '80000.000', '000', '2925193111177301', '2', '2016-04-24', '79', '上海霞飞路300号', '2016-04-24 21:51:01', '1');
INSERT INTO `demo_account` VALUES ('6742', '段叫', '10004110', '1', '36739.100', '80000.000', '000', '2925196910288897', '2', '2016-04-24', '73', '上海霞飞路244号', '2016-04-24 21:51:01', '1');
INSERT INTO `demo_account` VALUES ('6743', '熊尚', '10004111', '1', '38538.810', '80000.000', '000', '2925192610238710', '2', '2016-04-24', '49', '上海霞飞路144号', '2016-04-24 21:51:01', '1');
INSERT INTO `demo_account` VALUES ('6744', '毛网寸', '10004112', '2', '56749.960', '80000.000', '000', '2925193910236826', '3', '2016-04-24', '29', '上海霞飞路387号', '2016-04-24 21:51:01', '1');
INSERT INTO `demo_account` VALUES ('6745', '郤桓携', '10004113', '1', '57599.760', '80000.000', '000', '2925199810192717', '1', '2016-04-24', '27', '上海霞飞路306号', '2016-04-24 21:51:01', '1');
INSERT INTO `demo_account` VALUES ('6746', '黄似掷', '10004114', '1', '32527.100', '80000.000', '000', '2925195411269918', '2', '2016-04-24', '77', '上海霞飞路446号', '2016-04-24 21:51:01', '1');
INSERT INTO `demo_account` VALUES ('6747', '郤沽俱', '10004115', '1', '54719.810', '80000.000', '000', '2925201212196254', '1', '2016-04-24', '38', '上海霞飞路145号', '2016-04-24 21:51:01', '1');
INSERT INTO `demo_account` VALUES ('6748', '黄璃', '10004116', '1', '27788.380', '80000.000', '000', '2925200910181160', '3', '2016-04-24', '80', '上海霞飞路915号', '2016-04-24 21:51:02', '1');
INSERT INTO `demo_account` VALUES ('6749', '毛馒', '10004117', '2', '30213.500', '80000.000', '000', '2925193610271353', '2', '2016-04-24', '80', '上海霞飞路464号', '2016-04-24 21:51:02', '1');
INSERT INTO `demo_account` VALUES ('6750', '赵悸', '10004118', '1', '51123.800', '80000.000', '000', '2925192312244725', '1', '2016-04-24', '63', '上海霞飞路993号', '2016-04-24 21:51:02', '1');
INSERT INTO `demo_account` VALUES ('6751', '刘员颁', '10004119', '1', '57596.360', '80000.000', '000', '2925193410128001', '1', '2016-04-24', '32', '上海霞飞路758号', '2016-04-24 21:51:02', '1');
INSERT INTO `demo_account` VALUES ('6752', '熊描', '10004120', '1', '34995.100', '80000.000', '000', '2925195011176234', '3', '2016-04-24', '54', '上海霞飞路580号', '2016-04-24 21:51:02', '1');
INSERT INTO `demo_account` VALUES ('6753', '黄勾', '10004121', '2', '79839.180', '80000.000', '000', '2925192311201838', '1', '2016-04-24', '57', '上海霞飞路267号', '2016-04-24 21:51:02', '1');
INSERT INTO `demo_account` VALUES ('6754', '张虎', '10004122', '2', '61408.180', '80000.000', '000', '2925194611151326', '1', '2016-04-24', '81', '上海霞飞路597号', '2016-04-24 21:51:02', '1');
INSERT INTO `demo_account` VALUES ('6755', '熊夷躁', '10004123', '1', '59665.870', '80000.000', '000', '2925199911193457', '3', '2016-04-24', '32', '上海霞飞路672号', '2016-04-24 21:51:02', '1');
INSERT INTO `demo_account` VALUES ('6756', '周因胆', '10004124', '1', '73125.340', '80000.000', '000', '2925196611149952', '1', '2016-04-24', '73', '上海霞飞路96号', '2016-04-24 21:51:02', '1');
INSERT INTO `demo_account` VALUES ('6757', '张帐诧', '10004125', '1', '65058.840', '80000.000', '000', '2925197812292356', '2', '2016-04-24', '22', '上海霞飞路545号', '2016-04-24 21:51:02', '1');
INSERT INTO `demo_account` VALUES ('6758', '郤旅捞', '10004126', '1', '29870.190', '80000.000', '000', '2925194411234053', '3', '2016-04-24', '85', '上海霞飞路861号', '2016-04-24 21:51:03', '1');
INSERT INTO `demo_account` VALUES ('6759', '黄膜', '10004127', '1', '37608.350', '80000.000', '000', '2925196612301802', '3', '2016-04-24', '54', '上海霞飞路853号', '2016-04-24 21:51:03', '1');
INSERT INTO `demo_account` VALUES ('6760', '张向铭', '10004128', '1', '7366.770', '80000.000', '000', '2925195412284491', '1', '2016-04-24', '50', '上海霞飞路487号', '2016-04-24 21:51:03', '1');
INSERT INTO `demo_account` VALUES ('6761', '赵媳效', '10004129', '2', '45862.590', '80000.000', '000', '2925199412215141', '2', '2016-04-24', '90', '上海霞飞路154号', '2016-04-24 21:51:03', '1');
INSERT INTO `demo_account` VALUES ('6762', '黄厂', '10004130', '2', '51653.760', '80000.000', '000', '2925198011212434', '3', '2016-04-24', '98', '上海霞飞路130号', '2016-04-24 21:51:03', '1');
INSERT INTO `demo_account` VALUES ('6763', '郤抗裔', '10004131', '1', '68322.520', '80000.000', '000', '2925198511219336', '2', '2016-04-24', '56', '上海霞飞路276号', '2016-04-24 21:51:03', '1');
INSERT INTO `demo_account` VALUES ('6764', '毛竖蔫', '10004132', '1', '63551.690', '80000.000', '000', '2925198912131551', '3', '2016-04-24', '42', '上海霞飞路408号', '2016-04-24 21:51:03', '1');
INSERT INTO `demo_account` VALUES ('6765', '刘塘狸', '10004133', '2', '71226.290', '80000.000', '000', '2925196011271751', '2', '2016-04-24', '52', '上海霞飞路616号', '2016-04-24 21:51:03', '1');
INSERT INTO `demo_account` VALUES ('6766', '毛橡', '10004134', '2', '6681.490', '80000.000', '000', '2925195511122700', '3', '2016-04-24', '80', '上海霞飞路165号', '2016-04-24 21:51:03', '1');
INSERT INTO `demo_account` VALUES ('6767', '刘闷', '10004135', '1', '54786.140', '80000.000', '000', '2925199111133458', '2', '2016-04-24', '62', '上海霞飞路357号', '2016-04-24 21:51:04', '1');
INSERT INTO `demo_account` VALUES ('6768', '周厚叙', '10004136', '1', '10943.150', '80000.000', '000', '2925199411287001', '3', '2016-04-24', '49', '上海霞飞路52号', '2016-04-24 21:51:04', '1');
INSERT INTO `demo_account` VALUES ('6769', '段僻', '10004137', '1', '56003.600', '80000.000', '000', '2925194310286610', '2', '2016-04-24', '74', '上海霞飞路221号', '2016-04-24 21:51:04', '1');
INSERT INTO `demo_account` VALUES ('6770', '毛橙庶', '10004138', '1', '35847.910', '80000.000', '000', '2925192711247440', '2', '2016-04-24', '58', '上海霞飞路158号', '2016-04-24 21:51:04', '1');
INSERT INTO `demo_account` VALUES ('6771', '赵及', '10004139', '2', '40734.520', '80000.000', '000', '2925198810216641', '3', '2016-04-24', '38', '上海霞飞路592号', '2016-04-24 21:51:04', '1');
INSERT INTO `demo_account` VALUES ('6772', '李轿盛', '10004140', '1', '34588.450', '80000.000', '000', '2925201511114421', '2', '2016-04-24', '42', '上海霞飞路140号', '2016-04-24 21:51:04', '1');
INSERT INTO `demo_account` VALUES ('6773', '毛哇仙', '10004141', '2', '6137.300', '80000.000', '000', '2925198811198319', '2', '2016-04-24', '60', '上海霞飞路84号', '2016-04-24 21:51:04', '1');
INSERT INTO `demo_account` VALUES ('6774', '赵硒洪', '10004142', '1', '24279.300', '80000.000', '000', '2925193311291903', '3', '2016-04-24', '43', '上海霞飞路575号', '2016-04-24 21:51:04', '1');
INSERT INTO `demo_account` VALUES ('6775', '周邻阔', '10004143', '2', '41156.350', '80000.000', '000', '2925201510233950', '2', '2016-04-24', '41', '上海霞飞路911号', '2016-04-24 21:51:04', '1');
INSERT INTO `demo_account` VALUES ('6776', '赵喝', '10004144', '1', '78231.430', '80000.000', '000', '2925196912216035', '2', '2016-04-24', '99', '上海霞飞路497号', '2016-04-24 21:51:05', '1');
INSERT INTO `demo_account` VALUES ('6777', '赵闭破', '10004145', '1', '37194.790', '80000.000', '000', '2925195611115232', '1', '2016-04-24', '96', '上海霞飞路654号', '2016-04-24 21:51:05', '1');
INSERT INTO `demo_account` VALUES ('6778', '段借漾', '10004146', '2', '52671.320', '80000.000', '000', '2925194812165439', '2', '2016-04-24', '46', '上海霞飞路332号', '2016-04-24 21:51:05', '1');
INSERT INTO `demo_account` VALUES ('6779', '毛白搏', '10004147', '1', '17615.710', '80000.000', '000', '2925195211265564', '2', '2016-04-24', '42', '上海霞飞路230号', '2016-04-24 21:51:05', '1');
INSERT INTO `demo_account` VALUES ('6780', '周咕魁', '10004148', '1', '62817.180', '80000.000', '000', '2925199211224540', '2', '2016-04-24', '34', '上海霞飞路700号', '2016-04-24 21:51:05', '1');
INSERT INTO `demo_account` VALUES ('6781', '郤砂焊', '10004149', '2', '75223.130', '80000.000', '000', '2925195011303811', '3', '2016-04-24', '45', '上海霞飞路196号', '2016-04-24 21:51:05', '1');
INSERT INTO `demo_account` VALUES ('6782', '李华', '10004150', '1', '77685.400', '80000.000', '000', '2925193011253594', '1', '2016-04-24', '48', '上海霞飞路797号', '2016-04-24 21:51:05', '1');
INSERT INTO `demo_account` VALUES ('6783', '刘如', '10004151', '1', '35387.300', '80000.000', '000', '2925197511286826', '2', '2016-04-24', '28', '上海霞飞路707号', '2016-04-24 21:51:05', '1');
INSERT INTO `demo_account` VALUES ('6784', '张著必', '10004152', '1', '55547.630', '80000.000', '000', '2925197511281329', '2', '2016-04-24', '28', '上海霞飞路318号', '2016-04-24 21:51:05', '1');
INSERT INTO `demo_account` VALUES ('6785', '段昆埔', '10004153', '2', '16924.430', '80000.000', '000', '2925192612192241', '3', '2016-04-24', '60', '上海霞飞路709号', '2016-04-24 21:51:05', '1');
INSERT INTO `demo_account` VALUES ('6786', '熊够辱', '10004154', '1', '62424.870', '80000.000', '000', '2925199810258333', '1', '2016-04-24', '56', '上海霞飞路137号', '2016-04-24 21:51:06', '1');
INSERT INTO `demo_account` VALUES ('6787', '刘试尼', '10004155', '2', '47424.100', '80000.000', '000', '2925198011153307', '1', '2016-04-24', '93', '上海霞飞路225号', '2016-04-24 21:51:06', '1');
INSERT INTO `demo_account` VALUES ('6788', '周铃', '10004156', '2', '56518.430', '80000.000', '000', '2925199010207610', '2', '2016-04-24', '26', '上海霞飞路224号', '2016-04-24 21:51:06', '1');
INSERT INTO `demo_account` VALUES ('6789', '段珐纷', '10004157', '2', '16145.390', '80000.000', '000', '2925197311128819', '1', '2016-04-24', '86', '上海霞飞路815号', '2016-04-24 21:51:06', '1');
INSERT INTO `demo_account` VALUES ('6790', '黄间', '10004158', '2', '75981.100', '80000.000', '000', '2925193010247932', '3', '2016-04-24', '49', '上海霞飞路482号', '2016-04-24 21:51:06', '1');
INSERT INTO `demo_account` VALUES ('6791', '周甫', '10004159', '2', '8129.590', '80000.000', '000', '2925194510152392', '1', '2016-04-24', '77', '上海霞飞路553号', '2016-04-24 21:51:06', '1');
INSERT INTO `demo_account` VALUES ('6792', '郤栅沙', '10004160', '1', '31922.740', '80000.000', '000', '2925199511174921', '3', '2016-04-24', '48', '上海霞飞路503号', '2016-04-24 21:51:06', '1');
INSERT INTO `demo_account` VALUES ('6793', '毛炎衍', '10004161', '1', '45697.460', '80000.000', '000', '2925197611289616', '2', '2016-04-24', '35', '上海霞飞路103号', '2016-04-24 21:51:06', '1');
INSERT INTO `demo_account` VALUES ('6794', '黄冯同', '10004162', '1', '29046.530', '80000.000', '000', '2925193811198986', '2', '2016-04-24', '83', '上海霞飞路434号', '2016-04-24 21:51:07', '1');
INSERT INTO `demo_account` VALUES ('6795', '毛钩', '10004163', '2', '57958.710', '80000.000', '000', '2925193210128887', '2', '2016-04-24', '19', '上海霞飞路741号', '2016-04-24 21:51:07', '1');
INSERT INTO `demo_account` VALUES ('6796', '李维脯', '10004164', '2', '8822.410', '80000.000', '000', '2925195311214532', '1', '2016-04-24', '80', '上海霞飞路429号', '2016-04-24 21:51:07', '1');
INSERT INTO `demo_account` VALUES ('6797', '周耗逃', '10004165', '1', '29492.450', '80000.000', '000', '2925195211136902', '2', '2016-04-24', '92', '上海霞飞路423号', '2016-04-24 21:51:07', '1');
INSERT INTO `demo_account` VALUES ('6798', '刘胺猪', '10004166', '1', '44592.170', '80000.000', '000', '2925200811134086', '1', '2016-04-24', '34', '上海霞飞路401号', '2016-04-24 21:51:07', '1');
INSERT INTO `demo_account` VALUES ('6799', '段韩', '10004167', '2', '75843.100', '80000.000', '000', '2925197512147144', '2', '2016-04-24', '68', '上海霞飞路206号', '2016-04-24 21:51:07', '1');
INSERT INTO `demo_account` VALUES ('6800', '刘尿', '10004168', '1', '46496.950', '80000.000', '000', '2925199710183250', '1', '2016-04-24', '72', '上海霞飞路30号', '2016-04-24 21:51:07', '1');
INSERT INTO `demo_account` VALUES ('6801', '张誊奸', '10004169', '1', '63993.990', '80000.000', '000', '2925194912196841', '1', '2016-04-24', '59', '上海霞飞路651号', '2016-04-24 21:51:07', '1');
INSERT INTO `demo_account` VALUES ('6802', '刘癣腐', '10004170', '2', '20634.470', '80000.000', '000', '2925194012214625', '1', '2016-04-24', '85', '上海霞飞路261号', '2016-04-24 21:51:07', '1');
INSERT INTO `demo_account` VALUES ('6803', '郤航诧', '10004171', '1', '42430.500', '80000.000', '000', '2925199412157204', '2', '2016-04-24', '60', '上海霞飞路26号', '2016-04-24 21:51:08', '1');
INSERT INTO `demo_account` VALUES ('6804', '周盔霜', '10004172', '2', '47352.950', '80000.000', '000', '2925195311102116', '1', '2016-04-24', '82', '上海霞飞路731号', '2016-04-24 21:51:08', '1');
INSERT INTO `demo_account` VALUES ('6805', '黄吊耿', '10004173', '1', '25996.130', '80000.000', '000', '2925196011265961', '2', '2016-04-24', '62', '上海霞飞路394号', '2016-04-24 21:51:08', '1');
INSERT INTO `demo_account` VALUES ('6806', '段昼', '10004174', '1', '50049.230', '80000.000', '000', '2925194910218258', '1', '2016-04-24', '28', '上海霞飞路866号', '2016-04-24 21:51:08', '1');
INSERT INTO `demo_account` VALUES ('6807', '熊沁', '10004175', '1', '67139.900', '80000.000', '000', '2925196611226462', '2', '2016-04-24', '37', '上海霞飞路949号', '2016-04-24 21:51:08', '1');
INSERT INTO `demo_account` VALUES ('6808', '段努', '10004176', '2', '36413.290', '80000.000', '000', '2925196412252492', '2', '2016-04-24', '34', '上海霞飞路588号', '2016-04-24 21:51:08', '1');
INSERT INTO `demo_account` VALUES ('6809', '郤缝', '10004177', '2', '9724.710', '80000.000', '000', '2925197211277889', '2', '2016-04-24', '39', '上海霞飞路164号', '2016-04-24 21:51:08', '1');
INSERT INTO `demo_account` VALUES ('6810', '周尤', '10004178', '1', '32473.430', '80000.000', '000', '2925197710204501', '1', '2016-04-24', '40', '上海霞飞路872号', '2016-04-24 21:51:08', '1');
INSERT INTO `demo_account` VALUES ('6811', '黄歧府', '10004179', '1', '42052.940', '80000.000', '000', '2925194312266348', '2', '2016-04-24', '96', '上海霞飞路605号', '2016-04-24 21:51:08', '1');
INSERT INTO `demo_account` VALUES ('6812', '李尹', '10004180', '2', '58373.720', '80000.000', '000', '2925199011152053', '1', '2016-04-24', '37', '上海霞飞路594号', '2016-04-24 21:51:09', '1');
INSERT INTO `demo_account` VALUES ('6813', '黄镍陛', '10004181', '1', '76242.300', '80000.000', '000', '2925192511272859', '2', '2016-04-24', '36', '上海霞飞路504号', '2016-04-24 21:51:09', '1');
INSERT INTO `demo_account` VALUES ('6814', '毛赁势', '10004182', '1', '69266.380', '80000.000', '000', '2925193511294973', '3', '2016-04-24', '40', '上海霞飞路403号', '2016-04-24 21:51:09', '1');
INSERT INTO `demo_account` VALUES ('6815', '张较', '10004183', '1', '69607.650', '80000.000', '000', '2925193910247536', '2', '2016-04-24', '33', '上海霞飞路418号', '2016-04-24 21:51:09', '1');
INSERT INTO `demo_account` VALUES ('6816', '周览', '10004184', '1', '25220.390', '80000.000', '000', '2925194012194159', '2', '2016-04-24', '66', '上海霞飞路571号', '2016-04-24 21:51:09', '1');
INSERT INTO `demo_account` VALUES ('6817', '张墨', '10004185', '1', '18196.120', '80000.000', '000', '2925200410214482', '2', '2016-04-24', '84', '上海霞飞路576号', '2016-04-24 21:51:09', '1');
INSERT INTO `demo_account` VALUES ('6818', '郤孽', '10004186', '2', '50548.380', '80000.000', '000', '2925199811203790', '2', '2016-04-24', '22', '上海霞飞路44号', '2016-04-24 21:51:09', '1');
INSERT INTO `demo_account` VALUES ('6819', '毛富', '10004187', '2', '73126.600', '80000.000', '000', '2925195311236161', '2', '2016-04-24', '46', '上海霞飞路741号', '2016-04-24 21:51:09', '1');
INSERT INTO `demo_account` VALUES ('6820', '熊权鳖', '10004188', '1', '69437.620', '80000.000', '000', '2925200611259134', '2', '2016-04-24', '47', '上海霞飞路146号', '2016-04-24 21:51:09', '1');
INSERT INTO `demo_account` VALUES ('6821', '周痘船', '10004189', '2', '64871.390', '80000.000', '000', '2925198610114298', '2', '2016-04-24', '73', '上海霞飞路697号', '2016-04-24 21:51:09', '1');
INSERT INTO `demo_account` VALUES ('6822', '毛践', '10004190', '1', '25306.580', '80000.000', '000', '2925192310227598', '3', '2016-04-24', '30', '上海霞飞路670号', '2016-04-24 21:51:10', '1');
INSERT INTO `demo_account` VALUES ('6823', '熊腰', '10004191', '1', '33153.360', '80000.000', '000', '2925195410154563', '2', '2016-04-24', '74', '上海霞飞路678号', '2016-04-24 21:51:10', '1');
INSERT INTO `demo_account` VALUES ('6824', '刘祷馈', '10004192', '2', '33762.610', '80000.000', '000', '2925201311219936', '1', '2016-04-24', '36', '上海霞飞路304号', '2016-04-24 21:51:10', '1');
INSERT INTO `demo_account` VALUES ('6825', '李剖泻', '10004193', '1', '48567.960', '80000.000', '000', '2925196510261584', '2', '2016-04-24', '34', '上海霞飞路344号', '2016-04-24 21:51:10', '1');
INSERT INTO `demo_account` VALUES ('6826', '熊黎员', '10004194', '1', '59570.400', '80000.000', '000', '2925193711184752', '1', '2016-04-24', '56', '上海霞飞路609号', '2016-04-24 21:51:10', '1');
INSERT INTO `demo_account` VALUES ('6827', '郤乓', '10004195', '2', '72620.110', '80000.000', '000', '2925200212195049', '2', '2016-04-24', '41', '上海霞飞路134号', '2016-04-24 21:51:10', '1');
INSERT INTO `demo_account` VALUES ('6828', '黄奠', '10004196', '1', '58530.510', '80000.000', '000', '2925192511305716', '3', '2016-04-24', '67', '上海霞飞路31号', '2016-04-24 21:51:10', '1');
INSERT INTO `demo_account` VALUES ('6829', '郤驼', '10004197', '2', '29297.200', '80000.000', '000', '2925193611254942', '3', '2016-04-24', '78', '上海霞飞路102号', '2016-04-24 21:51:10', '1');
INSERT INTO `demo_account` VALUES ('6830', '郤梯赫', '10004198', '2', '63659.700', '80000.000', '000', '2925199612154135', '2', '2016-04-24', '60', '上海霞飞路629号', '2016-04-24 21:51:11', '1');
INSERT INTO `demo_account` VALUES ('6831', '黄沧', '10004199', '2', '57830.190', '80000.000', '000', '2925195511219175', '1', '2016-04-24', '44', '上海霞飞路551号', '2016-04-24 21:51:11', '1');
INSERT INTO `demo_account` VALUES ('6832', '赵泪', '10004200', '1', '9577.310', '80000.000', '000', '2925193511241781', '2', '2016-04-24', '94', '上海霞飞路528号', '2016-04-24 21:51:11', '1');
INSERT INTO `demo_account` VALUES ('6833', '周窗魔', '10004201', '2', '46805.400', '80000.000', '000', '2925199911171153', '2', '2016-04-24', '89', '上海霞飞路83号', '2016-04-24 21:51:11', '1');
INSERT INTO `demo_account` VALUES ('6834', '刘摄', '10004202', '2', '69498.780', '80000.000', '000', '2925193411244132', '2', '2016-04-24', '77', '上海霞飞路263号', '2016-04-24 21:51:11', '1');
INSERT INTO `demo_account` VALUES ('6835', '赵屑', '10004203', '1', '10257.350', '80000.000', '000', '2925196712129045', '1', '2016-04-24', '47', '上海霞飞路872号', '2016-04-24 21:51:11', '1');
INSERT INTO `demo_account` VALUES ('6836', '李鲜碌', '10004204', '2', '77719.160', '80000.000', '000', '2925199912119439', '2', '2016-04-24', '92', '上海霞飞路520号', '2016-04-24 21:51:11', '1');
INSERT INTO `demo_account` VALUES ('6837', '黄喝', '10004205', '1', '72907.530', '80000.000', '000', '2925200311123795', '3', '2016-04-24', '64', '上海霞飞路292号', '2016-04-24 21:51:11', '1');
INSERT INTO `demo_account` VALUES ('6838', '周癣', '10004206', '2', '33008.500', '80000.000', '000', '2925198411264239', '2', '2016-04-24', '50', '上海霞飞路965号', '2016-04-24 21:51:11', '1');
INSERT INTO `demo_account` VALUES ('6839', '毛掸', '10004207', '1', '34176.650', '80000.000', '000', '2925192311272133', '2', '2016-04-24', '21', '上海霞飞路194号', '2016-04-24 21:51:12', '1');
INSERT INTO `demo_account` VALUES ('6840', '熊沼纬', '10004208', '1', '70797.450', '80000.000', '000', '2925200510165257', '2', '2016-04-24', '91', '上海霞飞路135号', '2016-04-24 21:51:12', '1');
INSERT INTO `demo_account` VALUES ('6841', '段弥贝', '10004209', '1', '53147.110', '80000.000', '000', '2925198712216140', '2', '2016-04-24', '43', '上海霞飞路456号', '2016-04-24 21:51:12', '1');
INSERT INTO `demo_account` VALUES ('6842', '郤挂沧', '10004210', '2', '12560.450', '80000.000', '000', '2925201110309819', '3', '2016-04-24', '63', '上海霞飞路600号', '2016-04-24 21:51:12', '1');
INSERT INTO `demo_account` VALUES ('6843', '毛惋', '10004211', '1', '19099.430', '80000.000', '000', '2925193311297119', '2', '2016-04-24', '75', '上海霞飞路636号', '2016-04-24 21:51:12', '1');
INSERT INTO `demo_account` VALUES ('6844', '张押', '10004212', '1', '25297.400', '80000.000', '000', '2925194712157194', '3', '2016-04-24', '37', '上海霞飞路872号', '2016-04-24 21:51:12', '1');
INSERT INTO `demo_account` VALUES ('6845', '段肃隶', '10004213', '1', '74778.130', '80000.000', '000', '2925196311114816', '2', '2016-04-24', '22', '上海霞飞路805号', '2016-04-24 21:51:12', '1');
INSERT INTO `demo_account` VALUES ('6846', '周耿', '10004214', '2', '20505.780', '80000.000', '000', '2925196012177507', '2', '2016-04-24', '58', '上海霞飞路761号', '2016-04-24 21:51:12', '1');
INSERT INTO `demo_account` VALUES ('6847', '赵茎乞', '10004215', '1', '42046.250', '80000.000', '000', '2925196210264256', '3', '2016-04-24', '50', '上海霞飞路921号', '2016-04-24 21:51:12', '1');
INSERT INTO `demo_account` VALUES ('6848', '李轴体', '10004216', '1', '28539.380', '80000.000', '000', '2925197911252139', '3', '2016-04-24', '82', '上海霞飞路153号', '2016-04-24 21:51:12', '1');
INSERT INTO `demo_account` VALUES ('6849', '黄烹', '10004217', '1', '32060.120', '80000.000', '000', '2925194510298736', '2', '2016-04-24', '36', '上海霞飞路316号', '2016-04-24 21:51:13', '1');
INSERT INTO `demo_account` VALUES ('6850', '郤肌振', '10004218', '1', '28772.560', '80000.000', '000', '2925196712195750', '2', '2016-04-24', '38', '上海霞飞路421号', '2016-04-24 21:51:13', '1');
INSERT INTO `demo_account` VALUES ('6851', '黄输', '10004219', '1', '26626.370', '80000.000', '000', '2925195312252740', '1', '2016-04-24', '91', '上海霞飞路149号', '2016-04-24 21:51:13', '1');
INSERT INTO `demo_account` VALUES ('6852', '毛堤贪', '10004220', '2', '28433.640', '80000.000', '000', '2925200810278343', '2', '2016-04-24', '42', '上海霞飞路941号', '2016-04-24 21:51:13', '1');
INSERT INTO `demo_account` VALUES ('6853', '黄偶擎', '10004221', '1', '9881.280', '80000.000', '000', '2925196910181803', '2', '2016-04-24', '60', '上海霞飞路906号', '2016-04-24 21:51:13', '1');
INSERT INTO `demo_account` VALUES ('6854', '周烛', '10004222', '2', '17538.810', '80000.000', '000', '2925199211171005', '1', '2016-04-24', '78', '上海霞飞路416号', '2016-04-24 21:51:13', '1');
INSERT INTO `demo_account` VALUES ('6855', '毛隋犹', '10004223', '1', '27945.120', '80000.000', '000', '2925192912225614', '3', '2016-04-24', '22', '上海霞飞路290号', '2016-04-24 21:51:13', '1');
INSERT INTO `demo_account` VALUES ('6856', '李税若', '10004224', '1', '37807.940', '80000.000', '000', '2925200111277243', '1', '2016-04-24', '29', '上海霞飞路972号', '2016-04-24 21:51:13', '1');
INSERT INTO `demo_account` VALUES ('6857', '刘贡', '10004225', '2', '16698.730', '80000.000', '000', '2925197611287874', '2', '2016-04-24', '81', '上海霞飞路92号', '2016-04-24 21:51:13', '1');
INSERT INTO `demo_account` VALUES ('6858', '刘妮匿', '10004226', '1', '29963.390', '80000.000', '000', '2925195011229064', '3', '2016-04-24', '87', '上海霞飞路265号', '2016-04-24 21:51:14', '1');
INSERT INTO `demo_account` VALUES ('6859', '赵使辩', '10004227', '2', '70327.870', '80000.000', '000', '2925193311172686', '2', '2016-04-24', '27', '上海霞飞路879号', '2016-04-24 21:51:14', '1');
INSERT INTO `demo_account` VALUES ('6860', '黄践舰', '10004228', '1', '30311.500', '80000.000', '000', '2925194212191184', '3', '2016-04-24', '71', '上海霞飞路31号', '2016-04-24 21:51:14', '1');
INSERT INTO `demo_account` VALUES ('6861', '李皑愁', '10004229', '1', '65793.940', '80000.000', '000', '2925199011101510', '2', '2016-04-24', '68', '上海霞飞路599号', '2016-04-24 21:51:14', '1');
INSERT INTO `demo_account` VALUES ('6862', '郤漳', '10004230', '1', '48005.450', '80000.000', '000', '2925193711124046', '3', '2016-04-24', '28', '上海霞飞路814号', '2016-04-24 21:51:14', '1');
INSERT INTO `demo_account` VALUES ('6863', '黄帆', '10004231', '1', '18864.930', '80000.000', '000', '2925194311264962', '1', '2016-04-24', '59', '上海霞飞路421号', '2016-04-24 21:51:14', '1');
INSERT INTO `demo_account` VALUES ('6864', '郤殴拘', '10004232', '2', '8883.780', '80000.000', '000', '2925193612233529', '3', '2016-04-24', '22', '上海霞飞路838号', '2016-04-24 21:51:14', '1');
INSERT INTO `demo_account` VALUES ('6865', '刘酥', '10004233', '2', '49861.000', '80000.000', '000', '2925194911171975', '1', '2016-04-24', '31', '上海霞飞路431号', '2016-04-24 21:51:14', '1');
INSERT INTO `demo_account` VALUES ('6866', '段乓', '10004234', '1', '22294.500', '80000.000', '000', '2925192212233509', '1', '2016-04-24', '64', '上海霞飞路219号', '2016-04-24 21:51:14', '1');
INSERT INTO `demo_account` VALUES ('6867', '刘农膀', '10004235', '1', '39778.890', '80000.000', '000', '2925200710158107', '1', '2016-04-24', '53', '上海霞飞路995号', '2016-04-24 21:51:14', '1');
INSERT INTO `demo_account` VALUES ('6868', '黄任', '10004236', '1', '61787.760', '80000.000', '000', '2925194411141671', '2', '2016-04-24', '92', '上海霞飞路6号', '2016-04-24 21:51:14', '1');
INSERT INTO `demo_account` VALUES ('6869', '郤痢隆', '10004237', '2', '37904.300', '80000.000', '000', '2925193711174024', '2', '2016-04-24', '61', '上海霞飞路896号', '2016-04-24 21:51:15', '1');
INSERT INTO `demo_account` VALUES ('6870', '毛溅', '10004238', '2', '19085.570', '80000.000', '000', '2925199811167225', '3', '2016-04-24', '84', '上海霞飞路752号', '2016-04-24 21:51:15', '1');
INSERT INTO `demo_account` VALUES ('6871', '周梆睫', '10004239', '2', '58612.800', '80000.000', '000', '2925197111296424', '2', '2016-04-24', '23', '上海霞飞路577号', '2016-04-24 21:51:15', '1');
INSERT INTO `demo_account` VALUES ('6872', '黄爱仅', '10004240', '1', '73227.890', '80000.000', '000', '2925197111225435', '1', '2016-04-24', '21', '上海霞飞路578号', '2016-04-24 21:51:15', '1');
INSERT INTO `demo_account` VALUES ('6873', '刘招', '10004241', '1', '69456.370', '80000.000', '000', '2925197110161948', '2', '2016-04-24', '52', '上海霞飞路89号', '2016-04-24 21:51:15', '1');
INSERT INTO `demo_account` VALUES ('6874', '张椿', '10004242', '2', '77280.700', '80000.000', '000', '2925200412201095', '2', '2016-04-24', '63', '上海霞飞路953号', '2016-04-24 21:51:15', '1');
INSERT INTO `demo_account` VALUES ('6875', '刘焰', '10004243', '1', '29230.370', '80000.000', '000', '2925199611307840', '2', '2016-04-24', '56', '上海霞飞路562号', '2016-04-24 21:51:15', '1');
INSERT INTO `demo_account` VALUES ('6876', '周土', '10004244', '1', '13526.590', '80000.000', '000', '2925196910195378', '2', '2016-04-24', '38', '上海霞飞路652号', '2016-04-24 21:51:15', '1');
INSERT INTO `demo_account` VALUES ('6877', '段顽胁', '10004245', '2', '75125.500', '80000.000', '000', '2925199910183391', '1', '2016-04-24', '51', '上海霞飞路329号', '2016-04-24 21:51:15', '1');
INSERT INTO `demo_account` VALUES ('6878', '周梧丘', '10004246', '2', '34512.590', '80000.000', '000', '2925199312153698', '1', '2016-04-24', '52', '上海霞飞路601号', '2016-04-24 21:51:15', '1');
INSERT INTO `demo_account` VALUES ('6879', '毛掩', '10004247', '2', '14651.700', '80000.000', '000', '2925200711269433', '2', '2016-04-24', '28', '上海霞飞路992号', '2016-04-24 21:51:15', '1');
INSERT INTO `demo_account` VALUES ('6880', '郤龄滨', '10004248', '2', '31874.460', '80000.000', '000', '2925200112217478', '3', '2016-04-24', '35', '上海霞飞路585号', '2016-04-24 21:51:15', '1');
INSERT INTO `demo_account` VALUES ('6881', '毛集', '10004249', '1', '34454.880', '80000.000', '000', '2925193010281440', '2', '2016-04-24', '55', '上海霞飞路64号', '2016-04-24 21:51:16', '1');
INSERT INTO `demo_account` VALUES ('6882', '段咆疽', '10004250', '1', '25314.550', '80000.000', '000', '2925198110207002', '1', '2016-04-24', '87', '上海霞飞路24号', '2016-04-24 21:51:16', '1');
INSERT INTO `demo_account` VALUES ('6883', '周郑', '10004251', '1', '42691.280', '80000.000', '000', '2925192710239962', '2', '2016-04-24', '38', '上海霞飞路998号', '2016-04-24 21:51:16', '1');
INSERT INTO `demo_account` VALUES ('6884', '熊贼泡', '10004252', '1', '18653.960', '80000.000', '000', '2925193912244724', '1', '2016-04-24', '41', '上海霞飞路281号', '2016-04-24 21:51:16', '1');
INSERT INTO `demo_account` VALUES ('6885', '周辆', '10004253', '2', '38102.960', '80000.000', '000', '2925196211208482', '1', '2016-04-24', '19', '上海霞飞路715号', '2016-04-24 21:51:16', '1');
INSERT INTO `demo_account` VALUES ('6886', '李伦', '10004254', '1', '60342.730', '80000.000', '000', '2925196411274708', '2', '2016-04-24', '71', '上海霞飞路236号', '2016-04-24 21:51:16', '1');
INSERT INTO `demo_account` VALUES ('6887', '周辖', '10004255', '1', '69431.210', '80000.000', '000', '2925198610249919', '3', '2016-04-24', '70', '上海霞飞路945号', '2016-04-24 21:51:16', '1');
INSERT INTO `demo_account` VALUES ('6888', '李缩咒', '10004256', '2', '6327.920', '80000.000', '000', '2925198511177093', '1', '2016-04-24', '68', '上海霞飞路57号', '2016-04-24 21:51:16', '1');
INSERT INTO `demo_account` VALUES ('6889', '段劳', '10004257', '1', '69348.690', '80000.000', '000', '2925200811183334', '2', '2016-04-24', '50', '上海霞飞路996号', '2016-04-24 21:51:16', '1');
INSERT INTO `demo_account` VALUES ('6890', '熊墨', '10004258', '2', '55683.570', '80000.000', '000', '2925197812144737', '1', '2016-04-24', '60', '上海霞飞路415号', '2016-04-24 21:51:16', '1');
INSERT INTO `demo_account` VALUES ('6891', '周闰', '10004259', '2', '13509.970', '80000.000', '000', '2925201010143610', '2', '2016-04-24', '46', '上海霞飞路778号', '2016-04-24 21:51:16', '1');
INSERT INTO `demo_account` VALUES ('6892', '黄血', '10004260', '1', '39901.370', '80000.000', '000', '2925196911258432', '3', '2016-04-24', '98', '上海霞飞路593号', '2016-04-24 21:51:16', '1');
INSERT INTO `demo_account` VALUES ('6893', '李盘爆', '10004261', '2', '59917.270', '80000.000', '000', '2925197312283131', '1', '2016-04-24', '75', '上海霞飞路174号', '2016-04-24 21:51:17', '1');
INSERT INTO `demo_account` VALUES ('6894', '刘膝', '10004262', '1', '53225.520', '80000.000', '000', '2925196011133371', '2', '2016-04-24', '28', '上海霞飞路201号', '2016-04-24 21:51:17', '1');
INSERT INTO `demo_account` VALUES ('6895', '熊俯存', '10004263', '1', '46223.480', '80000.000', '000', '2925201412143740', '3', '2016-04-24', '88', '上海霞飞路90号', '2016-04-24 21:51:17', '1');
INSERT INTO `demo_account` VALUES ('6896', '段庭度', '10004264', '2', '71956.290', '80000.000', '000', '2925194811262725', '2', '2016-04-24', '96', '上海霞飞路470号', '2016-04-24 21:51:17', '1');
INSERT INTO `demo_account` VALUES ('6897', '熊槛', '10004265', '2', '35117.730', '80000.000', '000', '2925199211263500', '1', '2016-04-24', '25', '上海霞飞路798号', '2016-04-24 21:51:17', '1');
INSERT INTO `demo_account` VALUES ('6898', '李淘', '10004266', '1', '77097.200', '80000.000', '000', '2925192311216531', '3', '2016-04-24', '37', '上海霞飞路337号', '2016-04-24 21:51:17', '1');
INSERT INTO `demo_account` VALUES ('6899', '黄愚狠', '10004267', '2', '64461.660', '80000.000', '000', '2925197311194036', '3', '2016-04-24', '33', '上海霞飞路380号', '2016-04-24 21:51:17', '1');
INSERT INTO `demo_account` VALUES ('6900', '李弛助', '10004268', '1', '67252.730', '80000.000', '000', '2925195611299255', '1', '2016-04-24', '96', '上海霞飞路780号', '2016-04-24 21:51:17', '1');
INSERT INTO `demo_account` VALUES ('6901', '刘羚', '10004269', '1', '15306.360', '80000.000', '000', '2925200111127492', '1', '2016-04-24', '62', '上海霞飞路385号', '2016-04-24 21:51:17', '1');
INSERT INTO `demo_account` VALUES ('6902', '黄聋', '10004270', '2', '33182.570', '80000.000', '000', '2925194311293703', '2', '2016-04-24', '54', '上海霞飞路133号', '2016-04-24 21:51:17', '1');
INSERT INTO `demo_account` VALUES ('6903', '毛夯摈', '10004271', '1', '11451.760', '80000.000', '000', '2925194710271372', '2', '2016-04-24', '45', '上海霞飞路33号', '2016-04-24 21:51:17', '1');
INSERT INTO `demo_account` VALUES ('6904', '段均讫', '10004272', '2', '57896.720', '80000.000', '000', '2925201312183172', '2', '2016-04-24', '55', '上海霞飞路323号', '2016-04-24 21:51:17', '1');
INSERT INTO `demo_account` VALUES ('6905', '张箔照', '10004273', '1', '6677.730', '80000.000', '000', '2925192912173790', '2', '2016-04-24', '95', '上海霞飞路551号', '2016-04-24 21:51:17', '1');
INSERT INTO `demo_account` VALUES ('6906', '张讳', '10004274', '1', '58702.470', '80000.000', '000', '2925198212117004', '3', '2016-04-24', '91', '上海霞飞路270号', '2016-04-24 21:51:17', '1');
INSERT INTO `demo_account` VALUES ('6907', '毛钓滚', '10004275', '1', '46329.200', '80000.000', '000', '2925194211259923', '3', '2016-04-24', '78', '上海霞飞路492号', '2016-04-24 21:51:18', '1');
INSERT INTO `demo_account` VALUES ('6908', '刘鸵', '10004276', '2', '38090.640', '80000.000', '000', '2925195110127937', '1', '2016-04-24', '24', '上海霞飞路888号', '2016-04-24 21:51:18', '1');
INSERT INTO `demo_account` VALUES ('6909', '张牙', '10004277', '1', '44361.120', '80000.000', '000', '2925198512256677', '1', '2016-04-24', '81', '上海霞飞路112号', '2016-04-24 21:51:18', '1');
INSERT INTO `demo_account` VALUES ('6910', '李丁', '10004278', '2', '26869.580', '80000.000', '000', '2925199611306901', '2', '2016-04-24', '63', '上海霞飞路430号', '2016-04-24 21:51:18', '1');
INSERT INTO `demo_account` VALUES ('6911', '赵炬强', '10004279', '2', '7529.200', '80000.000', '000', '2925195111168843', '3', '2016-04-24', '29', '上海霞飞路155号', '2016-04-24 21:51:18', '1');
INSERT INTO `demo_account` VALUES ('6912', '李钟札', '10004280', '2', '31440.340', '80000.000', '000', '2925197111253179', '2', '2016-04-24', '99', '上海霞飞路113号', '2016-04-24 21:51:18', '1');
INSERT INTO `demo_account` VALUES ('6913', '李冲夷', '10004281', '2', '28849.450', '80000.000', '000', '2925195310239290', '3', '2016-04-24', '97', '上海霞飞路637号', '2016-04-24 21:51:18', '1');
INSERT INTO `demo_account` VALUES ('6914', '毛渗', '10004282', '1', '19609.790', '80000.000', '000', '2925197610212065', '2', '2016-04-24', '66', '上海霞飞路262号', '2016-04-24 21:51:18', '1');
INSERT INTO `demo_account` VALUES ('6915', '刘船', '10004283', '2', '56992.160', '80000.000', '000', '2925200810197947', '2', '2016-04-24', '45', '上海霞飞路462号', '2016-04-24 21:51:18', '1');
INSERT INTO `demo_account` VALUES ('6916', '周伍', '10004284', '1', '71842.760', '80000.000', '000', '2925198011123434', '1', '2016-04-24', '26', '上海霞飞路426号', '2016-04-24 21:51:18', '1');
INSERT INTO `demo_account` VALUES ('6917', '黄伴统', '10004285', '1', '58742.760', '80000.000', '000', '2925200411237624', '3', '2016-04-24', '58', '上海霞飞路959号', '2016-04-24 21:51:18', '1');
INSERT INTO `demo_account` VALUES ('6918', '黄造径', '10004286', '1', '29354.550', '80000.000', '000', '2925198711268874', '3', '2016-04-24', '40', '上海霞飞路177号', '2016-04-24 21:51:18', '1');
INSERT INTO `demo_account` VALUES ('6919', '毛淌', '10004287', '1', '26195.830', '80000.000', '000', '2925194611251928', '2', '2016-04-24', '49', '上海霞飞路697号', '2016-04-24 21:51:18', '1');
INSERT INTO `demo_account` VALUES ('6920', '郤氯', '10004288', '2', '60936.300', '80000.000', '000', '2925192911136281', '1', '2016-04-24', '59', '上海霞飞路571号', '2016-04-24 21:51:19', '1');
INSERT INTO `demo_account` VALUES ('6921', '黄喇躯', '10004289', '1', '38811.120', '80000.000', '000', '2925194911199820', '2', '2016-04-24', '24', '上海霞飞路139号', '2016-04-24 21:51:19', '1');
INSERT INTO `demo_account` VALUES ('6922', '刘陕尾', '10004290', '1', '36910.400', '80000.000', '000', '2925195611271066', '1', '2016-04-24', '90', '上海霞飞路475号', '2016-04-24 21:51:19', '1');
INSERT INTO `demo_account` VALUES ('6923', '郤艾筋', '10004291', '1', '17004.100', '80000.000', '000', '2925192710136584', '3', '2016-04-24', '82', '上海霞飞路1号', '2016-04-24 21:51:19', '1');
INSERT INTO `demo_account` VALUES ('6924', '赵咆蚊', '10004292', '2', '57128.560', '80000.000', '000', '2925199112123381', '2', '2016-04-24', '84', '上海霞飞路219号', '2016-04-24 21:51:19', '1');
INSERT INTO `demo_account` VALUES ('6925', '刘咙', '10004293', '1', '6386.960', '80000.000', '000', '2925200310118220', '1', '2016-04-24', '66', '上海霞飞路392号', '2016-04-24 21:51:19', '1');
INSERT INTO `demo_account` VALUES ('6926', '刘神', '10004294', '1', '58387.360', '80000.000', '000', '2925192410199021', '2', '2016-04-24', '35', '上海霞飞路310号', '2016-04-24 21:51:19', '1');
INSERT INTO `demo_account` VALUES ('6927', '郤熔', '10004295', '1', '74342.620', '80000.000', '000', '2925192411201572', '1', '2016-04-24', '95', '上海霞飞路81号', '2016-04-24 21:51:19', '1');
INSERT INTO `demo_account` VALUES ('6928', '赵离', '10004296', '2', '71186.900', '80000.000', '000', '2925193011124895', '3', '2016-04-24', '73', '上海霞飞路149号', '2016-04-24 21:51:19', '1');
INSERT INTO `demo_account` VALUES ('6929', '熊钱', '10004297', '1', '29060.170', '80000.000', '000', '2925199711238682', '2', '2016-04-24', '71', '上海霞飞路470号', '2016-04-24 21:51:19', '1');
INSERT INTO `demo_account` VALUES ('6930', '毛豆漠', '10004298', '1', '50204.550', '80000.000', '000', '2925195712275211', '2', '2016-04-24', '31', '上海霞飞路977号', '2016-04-24 21:51:19', '1');
INSERT INTO `demo_account` VALUES ('6931', '黄葡编', '10004299', '1', '77682.120', '80000.000', '000', '2925196812289173', '2', '2016-04-24', '80', '上海霞飞路135号', '2016-04-24 21:51:19', '1');
INSERT INTO `demo_account` VALUES ('6932', '周召砷', '10004300', '1', '71405.230', '80000.000', '000', '2925201211139811', '3', '2016-04-24', '36', '上海霞飞路523号', '2016-04-24 21:51:19', '1');
INSERT INTO `demo_account` VALUES ('6933', '周仑姻', '10004301', '2', '6715.210', '80000.000', '000', '2925200712144678', '2', '2016-04-24', '90', '上海霞飞路997号', '2016-04-24 21:51:19', '1');
INSERT INTO `demo_account` VALUES ('6934', '赵香没', '10004302', '2', '79168.460', '80000.000', '000', '2925195111123266', '2', '2016-04-24', '82', '上海霞飞路43号', '2016-04-24 21:51:20', '1');
INSERT INTO `demo_account` VALUES ('6935', '周伎', '10004303', '2', '36355.500', '80000.000', '000', '2925200910267587', '3', '2016-04-24', '55', '上海霞飞路485号', '2016-04-24 21:51:20', '1');
INSERT INTO `demo_account` VALUES ('6936', '刘惺诈', '10004304', '1', '13341.130', '80000.000', '000', '2925198111227660', '2', '2016-04-24', '80', '上海霞飞路743号', '2016-04-24 21:51:20', '1');
INSERT INTO `demo_account` VALUES ('6937', '刘仙不', '10004305', '2', '6869.250', '80000.000', '000', '2925198810188654', '1', '2016-04-24', '44', '上海霞飞路269号', '2016-04-24 21:51:20', '1');
INSERT INTO `demo_account` VALUES ('6938', '刘氰', '10004306', '1', '54615.410', '80000.000', '000', '2925195311296211', '3', '2016-04-24', '55', '上海霞飞路794号', '2016-04-24 21:51:20', '1');
INSERT INTO `demo_account` VALUES ('6939', '刘擅', '10004307', '1', '11687.610', '80000.000', '000', '2925198710187233', '1', '2016-04-24', '53', '上海霞飞路408号', '2016-04-24 21:51:20', '1');
INSERT INTO `demo_account` VALUES ('6940', '赵泼沟', '10004308', '2', '79117.860', '80000.000', '000', '2925194711217123', '2', '2016-04-24', '32', '上海霞飞路380号', '2016-04-24 21:51:20', '1');
INSERT INTO `demo_account` VALUES ('6941', '周猿', '10004309', '1', '60345.330', '80000.000', '000', '2925198712151161', '1', '2016-04-24', '65', '上海霞飞路1号', '2016-04-24 21:51:20', '1');
INSERT INTO `demo_account` VALUES ('6942', '刘杖皖', '10004310', '2', '21626.910', '80000.000', '000', '2925198810116332', '2', '2016-04-24', '64', '上海霞飞路534号', '2016-04-24 21:51:20', '1');
INSERT INTO `demo_account` VALUES ('6943', '周嚣蜀', '10004311', '1', '72944.840', '80000.000', '000', '2925197111306585', '3', '2016-04-24', '63', '上海霞飞路680号', '2016-04-24 21:51:20', '1');
INSERT INTO `demo_account` VALUES ('6944', '毛婚隶', '10004312', '2', '53298.590', '80000.000', '000', '2925200712166038', '2', '2016-04-24', '83', '上海霞飞路692号', '2016-04-24 21:51:20', '1');
INSERT INTO `demo_account` VALUES ('6945', '黄诸雇', '10004313', '2', '46251.400', '80000.000', '000', '2925192111199249', '1', '2016-04-24', '22', '上海霞飞路540号', '2016-04-24 21:51:20', '1');
INSERT INTO `demo_account` VALUES ('6946', '毛辽戳', '10004314', '1', '16314.100', '80000.000', '000', '2925193910235188', '2', '2016-04-24', '43', '上海霞飞路200号', '2016-04-24 21:51:21', '1');
INSERT INTO `demo_account` VALUES ('6947', '黄倔', '10004315', '1', '28110.340', '80000.000', '000', '2925195411133016', '3', '2016-04-24', '40', '上海霞飞路332号', '2016-04-24 21:51:21', '1');
INSERT INTO `demo_account` VALUES ('6948', '刘娄', '10004316', '1', '18337.940', '80000.000', '000', '2925197511256297', '3', '2016-04-24', '99', '上海霞飞路227号', '2016-04-24 21:51:21', '1');
INSERT INTO `demo_account` VALUES ('6949', '周蔬幂', '10004317', '2', '73296.450', '80000.000', '000', '2925193711113651', '3', '2016-04-24', '96', '上海霞飞路31号', '2016-04-24 21:51:21', '1');
INSERT INTO `demo_account` VALUES ('6950', '黄譬涩', '10004318', '2', '38182.660', '80000.000', '000', '2925196712264275', '1', '2016-04-24', '93', '上海霞飞路812号', '2016-04-24 21:51:21', '1');
INSERT INTO `demo_account` VALUES ('6951', '段死', '10004319', '1', '76477.120', '80000.000', '000', '2925199610269163', '3', '2016-04-24', '46', '上海霞飞路98号', '2016-04-24 21:51:21', '1');
INSERT INTO `demo_account` VALUES ('6952', '郤耀毯', '10004320', '2', '38594.430', '80000.000', '000', '2925192912286145', '1', '2016-04-24', '98', '上海霞飞路997号', '2016-04-24 21:51:21', '1');
INSERT INTO `demo_account` VALUES ('6953', '周苯', '10004321', '1', '62412.560', '80000.000', '000', '2925195312296206', '2', '2016-04-24', '51', '上海霞飞路39号', '2016-04-24 21:51:21', '1');
INSERT INTO `demo_account` VALUES ('6954', '周路', '10004322', '1', '28543.910', '80000.000', '000', '2925194212136827', '1', '2016-04-24', '23', '上海霞飞路266号', '2016-04-24 21:51:21', '1');
INSERT INTO `demo_account` VALUES ('6955', '张拳', '10004323', '2', '52056.690', '80000.000', '000', '2925192512127322', '3', '2016-04-24', '37', '上海霞飞路90号', '2016-04-24 21:51:21', '1');
INSERT INTO `demo_account` VALUES ('6956', '毛鹤账', '10004324', '2', '53917.300', '80000.000', '000', '2925192311241364', '2', '2016-04-24', '68', '上海霞飞路752号', '2016-04-24 21:51:21', '1');
INSERT INTO `demo_account` VALUES ('6957', '黄迟嗜', '10004325', '2', '47702.300', '80000.000', '000', '2925197611247080', '2', '2016-04-24', '41', '上海霞飞路132号', '2016-04-24 21:51:21', '1');
INSERT INTO `demo_account` VALUES ('6958', '周秸蓬', '10004326', '1', '40026.980', '80000.000', '000', '2925199212238265', '2', '2016-04-24', '79', '上海霞飞路941号', '2016-04-24 21:51:22', '1');
INSERT INTO `demo_account` VALUES ('6959', '熊滴崇', '10004327', '2', '32814.770', '80000.000', '000', '2925196211128344', '2', '2016-04-24', '33', '上海霞飞路161号', '2016-04-24 21:51:22', '1');
INSERT INTO `demo_account` VALUES ('6960', '张丈匆', '10004328', '2', '19806.770', '80000.000', '000', '2925194711138855', '2', '2016-04-24', '42', '上海霞飞路813号', '2016-04-24 21:51:22', '1');
INSERT INTO `demo_account` VALUES ('6961', '周辣', '10004329', '2', '48711.300', '80000.000', '000', '2925198211152240', '1', '2016-04-24', '31', '上海霞飞路915号', '2016-04-24 21:51:22', '1');
INSERT INTO `demo_account` VALUES ('6962', '熊疥洁', '10004330', '1', '42134.900', '80000.000', '000', '2925195612236788', '2', '2016-04-24', '39', '上海霞飞路656号', '2016-04-24 21:51:22', '1');
INSERT INTO `demo_account` VALUES ('6963', '熊理', '10004331', '2', '58726.260', '80000.000', '000', '2925194911133567', '3', '2016-04-24', '24', '上海霞飞路489号', '2016-04-24 21:51:22', '1');
INSERT INTO `demo_account` VALUES ('6964', '李绚辑', '10004332', '2', '35133.650', '80000.000', '000', '2925199310149122', '2', '2016-04-24', '85', '上海霞飞路8号', '2016-04-24 21:51:22', '1');
INSERT INTO `demo_account` VALUES ('6965', '段尚', '10004333', '1', '69015.190', '80000.000', '000', '2925199411292701', '1', '2016-04-24', '18', '上海霞飞路31号', '2016-04-24 21:51:22', '1');
INSERT INTO `demo_account` VALUES ('6966', '熊摇锑', '10004334', '2', '65887.310', '80000.000', '000', '2925196112172615', '3', '2016-04-24', '73', '上海霞飞路445号', '2016-04-24 21:51:22', '1');
INSERT INTO `demo_account` VALUES ('6967', '赵椰', '10004335', '2', '31645.460', '80000.000', '000', '2925197511203258', '3', '2016-04-24', '73', '上海霞飞路861号', '2016-04-24 21:51:22', '1');
INSERT INTO `demo_account` VALUES ('6968', '张尖', '10004336', '1', '50445.390', '80000.000', '000', '2925199810221137', '3', '2016-04-24', '53', '上海霞飞路178号', '2016-04-24 21:51:22', '1');
INSERT INTO `demo_account` VALUES ('6969', '段笋', '10004337', '2', '36124.750', '80000.000', '000', '2925192711152046', '1', '2016-04-24', '20', '上海霞飞路603号', '2016-04-24 21:51:22', '1');
INSERT INTO `demo_account` VALUES ('6970', '张糠', '10004338', '2', '58529.170', '80000.000', '000', '2925199911248358', '3', '2016-04-24', '50', '上海霞飞路672号', '2016-04-24 21:51:22', '1');
INSERT INTO `demo_account` VALUES ('6971', '熊抄', '10004339', '2', '56003.580', '80000.000', '000', '2925199310164082', '1', '2016-04-24', '99', '上海霞飞路164号', '2016-04-24 21:51:23', '1');
INSERT INTO `demo_account` VALUES ('6972', '毛捻', '10004340', '2', '7831.560', '80000.000', '000', '2925199010153108', '2', '2016-04-24', '79', '上海霞飞路766号', '2016-04-24 21:51:23', '1');
INSERT INTO `demo_account` VALUES ('6973', '黄骂', '10004341', '1', '15720.410', '80000.000', '000', '2925199510125710', '2', '2016-04-24', '31', '上海霞飞路653号', '2016-04-24 21:51:23', '1');
INSERT INTO `demo_account` VALUES ('6974', '赵姚观', '10004342', '1', '77305.190', '80000.000', '000', '2925196311113059', '1', '2016-04-24', '40', '上海霞飞路977号', '2016-04-24 21:51:23', '1');
INSERT INTO `demo_account` VALUES ('6975', '张美于', '10004343', '1', '73318.380', '80000.000', '000', '2925197410257082', '2', '2016-04-24', '87', '上海霞飞路586号', '2016-04-24 21:51:23', '1');
INSERT INTO `demo_account` VALUES ('6976', '刘蛤', '10004344', '1', '79356.600', '80000.000', '000', '2925200011133645', '2', '2016-04-24', '93', '上海霞飞路997号', '2016-04-24 21:51:23', '1');
INSERT INTO `demo_account` VALUES ('6977', '段琼', '10004345', '2', '71197.870', '80000.000', '000', '2925194111229541', '2', '2016-04-24', '81', '上海霞飞路958号', '2016-04-24 21:51:23', '1');
INSERT INTO `demo_account` VALUES ('6978', '段键', '10004346', '2', '45308.190', '80000.000', '000', '2925200511225353', '2', '2016-04-24', '84', '上海霞飞路552号', '2016-04-24 21:51:23', '1');
INSERT INTO `demo_account` VALUES ('6979', '郤抒个', '10004347', '2', '11535.200', '80000.000', '000', '2925199712259685', '2', '2016-04-24', '58', '上海霞飞路24号', '2016-04-24 21:51:23', '1');
INSERT INTO `demo_account` VALUES ('6980', '刘跃硷', '10004348', '1', '79074.150', '80000.000', '000', '2925200710172809', '2', '2016-04-24', '73', '上海霞飞路127号', '2016-04-24 21:51:23', '1');
INSERT INTO `demo_account` VALUES ('6981', '刘争', '10004349', '2', '27540.270', '80000.000', '000', '2925197811274124', '1', '2016-04-24', '22', '上海霞飞路881号', '2016-04-24 21:51:23', '1');
INSERT INTO `demo_account` VALUES ('6982', '周辕', '10004350', '1', '68401.570', '80000.000', '000', '2925194212179287', '1', '2016-04-24', '80', '上海霞飞路245号', '2016-04-24 21:51:23', '1');
INSERT INTO `demo_account` VALUES ('6983', '赵喧宿', '10004351', '2', '42176.200', '80000.000', '000', '2925193711273226', '2', '2016-04-24', '73', '上海霞飞路195号', '2016-04-24 21:51:23', '1');
INSERT INTO `demo_account` VALUES ('6984', '张绿邪', '10004352', '1', '9607.300', '80000.000', '000', '2925192211163569', '2', '2016-04-24', '64', '上海霞飞路281号', '2016-04-24 21:51:23', '1');
INSERT INTO `demo_account` VALUES ('6985', '赵短', '10004353', '2', '64508.930', '80000.000', '000', '2925197110209372', '1', '2016-04-24', '59', '上海霞飞路647号', '2016-04-24 21:51:24', '1');
INSERT INTO `demo_account` VALUES ('6986', '周沼', '10004354', '1', '18203.380', '80000.000', '000', '2925192412163280', '1', '2016-04-24', '100', '上海霞飞路11号', '2016-04-24 21:51:24', '1');
INSERT INTO `demo_account` VALUES ('6987', '黄妹', '10004355', '2', '20320.970', '80000.000', '000', '2925193711227488', '2', '2016-04-24', '60', '上海霞飞路960号', '2016-04-24 21:51:24', '1');
INSERT INTO `demo_account` VALUES ('6988', '赵图萝', '10004356', '1', '78291.160', '80000.000', '000', '2925198510163138', '3', '2016-04-24', '23', '上海霞飞路376号', '2016-04-24 21:51:24', '1');
INSERT INTO `demo_account` VALUES ('6989', '郤斑丸', '10004357', '2', '30149.610', '80000.000', '000', '2925195211278900', '3', '2016-04-24', '36', '上海霞飞路578号', '2016-04-24 21:51:24', '1');
INSERT INTO `demo_account` VALUES ('6990', '毛拳睡', '10004358', '2', '46150.300', '80000.000', '000', '2925195912124724', '2', '2016-04-24', '80', '上海霞飞路173号', '2016-04-24 21:51:24', '1');
INSERT INTO `demo_account` VALUES ('6991', '熊膳舀', '10004359', '2', '68392.950', '80000.000', '000', '2925200611292770', '1', '2016-04-24', '90', '上海霞飞路348号', '2016-04-24 21:51:24', '1');
INSERT INTO `demo_account` VALUES ('6992', '张录', '10004360', '1', '71896.310', '80000.000', '000', '2925197610126720', '3', '2016-04-24', '19', '上海霞飞路621号', '2016-04-24 21:51:24', '1');
INSERT INTO `demo_account` VALUES ('6993', '郤曙', '10004361', '1', '27626.200', '80000.000', '000', '2925192310224654', '2', '2016-04-24', '35', '上海霞飞路790号', '2016-04-24 21:51:24', '1');
INSERT INTO `demo_account` VALUES ('6994', '张浑甩', '10004362', '2', '67623.380', '80000.000', '000', '2925194810206736', '3', '2016-04-24', '18', '上海霞飞路40号', '2016-04-24 21:51:24', '1');
INSERT INTO `demo_account` VALUES ('6995', '郤墨', '10004363', '1', '46787.570', '80000.000', '000', '2925192411176959', '3', '2016-04-24', '79', '上海霞飞路795号', '2016-04-24 21:51:24', '1');
INSERT INTO `demo_account` VALUES ('6996', '张熬宦', '10004364', '2', '50918.610', '80000.000', '000', '2925196612265142', '2', '2016-04-24', '82', '上海霞飞路97号', '2016-04-24 21:51:24', '1');
INSERT INTO `demo_account` VALUES ('6997', '赵观淋', '10004365', '1', '18374.880', '80000.000', '000', '2925195411117315', '2', '2016-04-24', '64', '上海霞飞路843号', '2016-04-24 21:51:24', '1');
INSERT INTO `demo_account` VALUES ('6998', '周碾', '10004366', '1', '29151.850', '80000.000', '000', '2925199511263554', '2', '2016-04-24', '50', '上海霞飞路332号', '2016-04-24 21:51:24', '1');
INSERT INTO `demo_account` VALUES ('6999', '刘疑下', '10004367', '1', '20301.160', '80000.000', '000', '2925198111275147', '1', '2016-04-24', '87', '上海霞飞路82号', '2016-04-24 21:51:25', '1');
INSERT INTO `demo_account` VALUES ('7000', '张待', '10004368', '1', '32437.890', '80000.000', '000', '2925198410101879', '3', '2016-04-24', '80', '上海霞飞路928号', '2016-04-24 21:51:25', '1');
INSERT INTO `demo_account` VALUES ('7001', '郤桶', '10004369', '2', '32567.920', '80000.000', '000', '2925193711142977', '3', '2016-04-24', '65', '上海霞飞路848号', '2016-04-24 21:51:25', '1');
INSERT INTO `demo_account` VALUES ('7002', '毛尽痪', '10004370', '1', '33676.550', '80000.000', '000', '2925199512119068', '1', '2016-04-24', '29', '上海霞飞路955号', '2016-04-24 21:51:25', '1');
INSERT INTO `demo_account` VALUES ('7003', '李膊', '10004371', '1', '55386.300', '80000.000', '000', '2925194211306234', '1', '2016-04-24', '45', '上海霞飞路486号', '2016-04-24 21:51:25', '1');
INSERT INTO `demo_account` VALUES ('7004', '段洋', '10004372', '1', '30550.980', '80000.000', '000', '2925198912103980', '2', '2016-04-24', '74', '上海霞飞路525号', '2016-04-24 21:51:25', '1');
INSERT INTO `demo_account` VALUES ('7005', '段摊州', '10004373', '2', '61912.730', '80000.000', '000', '2925192312238585', '2', '2016-04-24', '83', '上海霞飞路534号', '2016-04-24 21:51:25', '1');
INSERT INTO `demo_account` VALUES ('7006', '刘聋芬', '10004374', '1', '64900.400', '80000.000', '000', '2925197311231010', '2', '2016-04-24', '70', '上海霞飞路603号', '2016-04-24 21:51:25', '1');
INSERT INTO `demo_account` VALUES ('7007', '刘眺努', '10004375', '2', '51233.290', '80000.000', '000', '2925197312176085', '2', '2016-04-24', '89', '上海霞飞路637号', '2016-04-24 21:51:25', '1');
INSERT INTO `demo_account` VALUES ('7008', '黄柄', '10004376', '2', '47366.630', '80000.000', '000', '2925199311178384', '3', '2016-04-24', '34', '上海霞飞路417号', '2016-04-24 21:51:25', '1');
INSERT INTO `demo_account` VALUES ('7009', '熊羽', '10004377', '2', '41759.610', '80000.000', '000', '2925193312204654', '3', '2016-04-24', '20', '上海霞飞路764号', '2016-04-24 21:51:25', '1');
INSERT INTO `demo_account` VALUES ('7010', '毛已凹', '10004378', '2', '13689.630', '80000.000', '000', '2925198111182275', '2', '2016-04-24', '94', '上海霞飞路688号', '2016-04-24 21:51:25', '1');
INSERT INTO `demo_account` VALUES ('7011', '黄痰洱', '10004379', '1', '11664.110', '80000.000', '000', '2925199111145678', '2', '2016-04-24', '69', '上海霞飞路577号', '2016-04-24 21:51:25', '1');
INSERT INTO `demo_account` VALUES ('7012', '郤拭', '10004380', '1', '51583.720', '80000.000', '000', '2925201112206133', '3', '2016-04-24', '44', '上海霞飞路159号', '2016-04-24 21:51:25', '1');
INSERT INTO `demo_account` VALUES ('7013', '张幽串', '10004381', '1', '33534.850', '80000.000', '000', '2925196111101743', '3', '2016-04-24', '30', '上海霞飞路26号', '2016-04-24 21:51:26', '1');
INSERT INTO `demo_account` VALUES ('7014', '赵疟', '10004382', '2', '43561.000', '80000.000', '000', '2925199211266897', '1', '2016-04-24', '92', '上海霞飞路107号', '2016-04-24 21:51:26', '1');
INSERT INTO `demo_account` VALUES ('7015', '刘腋蓑', '10004383', '1', '54852.400', '80000.000', '000', '2925193510237790', '3', '2016-04-24', '73', '上海霞飞路535号', '2016-04-24 21:51:26', '1');
INSERT INTO `demo_account` VALUES ('7016', '李话', '10004384', '2', '55628.460', '80000.000', '000', '2925197310248976', '2', '2016-04-24', '24', '上海霞飞路832号', '2016-04-24 21:51:26', '1');
INSERT INTO `demo_account` VALUES ('7017', '张零', '10004385', '1', '52494.430', '80000.000', '000', '2925193612222217', '2', '2016-04-24', '22', '上海霞飞路352号', '2016-04-24 21:51:26', '1');
INSERT INTO `demo_account` VALUES ('7018', '段堪', '10004386', '2', '74231.650', '80000.000', '000', '2925192211177164', '2', '2016-04-24', '49', '上海霞飞路335号', '2016-04-24 21:51:26', '1');
INSERT INTO `demo_account` VALUES ('7019', '张茄蒜', '10004387', '1', '49857.890', '80000.000', '000', '2925196711295696', '3', '2016-04-24', '50', '上海霞飞路899号', '2016-04-24 21:51:26', '1');
INSERT INTO `demo_account` VALUES ('7020', '黄吓粕', '10004388', '1', '32365.840', '80000.000', '000', '2925194311143876', '3', '2016-04-24', '21', '上海霞飞路616号', '2016-04-24 21:51:26', '1');
INSERT INTO `demo_account` VALUES ('7021', '刘偶', '10004389', '2', '21795.900', '80000.000', '000', '2925196110105758', '2', '2016-04-24', '39', '上海霞飞路228号', '2016-04-24 21:51:26', '1');
INSERT INTO `demo_account` VALUES ('7022', '黄萧奔', '10004390', '2', '48237.140', '80000.000', '000', '2925192411239377', '2', '2016-04-24', '90', '上海霞飞路363号', '2016-04-24 21:51:26', '1');
INSERT INTO `demo_account` VALUES ('7023', '周奄', '10004391', '1', '26985.860', '80000.000', '000', '2925199110234384', '2', '2016-04-24', '33', '上海霞飞路905号', '2016-04-24 21:51:26', '1');
INSERT INTO `demo_account` VALUES ('7024', '郤听届', '10004392', '2', '78382.100', '80000.000', '000', '2925200712221895', '2', '2016-04-24', '27', '上海霞飞路943号', '2016-04-24 21:51:26', '1');
INSERT INTO `demo_account` VALUES ('7025', '郤肿邑', '10004393', '1', '37891.980', '80000.000', '000', '2925194910139166', '2', '2016-04-24', '78', '上海霞飞路933号', '2016-04-24 21:51:26', '1');
INSERT INTO `demo_account` VALUES ('7026', '郤淋监', '10004394', '2', '55632.100', '80000.000', '000', '2925196810196758', '2', '2016-04-24', '48', '上海霞飞路950号', '2016-04-24 21:51:27', '1');
INSERT INTO `demo_account` VALUES ('7027', '熊寐', '10004395', '2', '66967.500', '80000.000', '000', '2925194910116797', '1', '2016-04-24', '33', '上海霞飞路526号', '2016-04-24 21:51:27', '1');
INSERT INTO `demo_account` VALUES ('7028', '黄娄', '10004396', '1', '46838.940', '80000.000', '000', '2925199911135993', '1', '2016-04-24', '31', '上海霞飞路744号', '2016-04-24 21:51:27', '1');
INSERT INTO `demo_account` VALUES ('7029', '毛雍', '10004397', '2', '22244.780', '80000.000', '000', '2925201411224915', '2', '2016-04-24', '47', '上海霞飞路851号', '2016-04-24 21:51:27', '1');
INSERT INTO `demo_account` VALUES ('7030', '黄保', '10004398', '1', '57742.500', '80000.000', '000', '2925197412263997', '2', '2016-04-24', '66', '上海霞飞路722号', '2016-04-24 21:51:27', '1');
INSERT INTO `demo_account` VALUES ('7031', '段开撒', '10004399', '2', '75957.550', '80000.000', '000', '2925201311145590', '2', '2016-04-24', '52', '上海霞飞路67号', '2016-04-24 21:51:27', '1');
INSERT INTO `demo_account` VALUES ('7032', '熊蓉贝', '10004400', '2', '18892.130', '80000.000', '000', '2925193910251212', '2', '2016-04-24', '92', '上海霞飞路267号', '2016-04-24 21:51:27', '1');
INSERT INTO `demo_account` VALUES ('7033', '赵旷正', '10004401', '1', '54357.270', '80000.000', '000', '2925195411219976', '2', '2016-04-24', '64', '上海霞飞路234号', '2016-04-24 21:51:27', '1');
INSERT INTO `demo_account` VALUES ('7034', '李搅晶', '10004402', '1', '61007.900', '80000.000', '000', '2925198411117947', '3', '2016-04-24', '51', '上海霞飞路595号', '2016-04-24 21:51:27', '1');
INSERT INTO `demo_account` VALUES ('7035', '熊瞅萨', '10004403', '1', '75351.240', '80000.000', '000', '2925193312152904', '1', '2016-04-24', '87', '上海霞飞路972号', '2016-04-24 21:51:27', '1');
INSERT INTO `demo_account` VALUES ('7036', '张襄', '10004404', '1', '22688.400', '80000.000', '000', '2925192612247748', '2', '2016-04-24', '67', '上海霞飞路978号', '2016-04-24 21:51:27', '1');
INSERT INTO `demo_account` VALUES ('7037', '赵偿摔', '10004405', '1', '17132.390', '80000.000', '000', '2925199111213433', '3', '2016-04-24', '75', '上海霞飞路919号', '2016-04-24 21:51:27', '1');
INSERT INTO `demo_account` VALUES ('7038', '段砰', '10004406', '2', '37873.940', '80000.000', '000', '2925194611266966', '3', '2016-04-24', '78', '上海霞飞路32号', '2016-04-24 21:51:27', '1');
INSERT INTO `demo_account` VALUES ('7039', '熊倪', '10004407', '1', '7427.170', '80000.000', '000', '2925199311288668', '1', '2016-04-24', '86', '上海霞飞路344号', '2016-04-24 21:51:28', '1');
INSERT INTO `demo_account` VALUES ('7040', '段棵', '10004408', '2', '72926.790', '80000.000', '000', '2925199310113434', '2', '2016-04-24', '25', '上海霞飞路56号', '2016-04-24 21:51:28', '1');
INSERT INTO `demo_account` VALUES ('7041', '刘战哭', '10004409', '1', '71540.900', '80000.000', '000', '2925192211192335', '2', '2016-04-24', '59', '上海霞飞路516号', '2016-04-24 21:51:28', '1');
INSERT INTO `demo_account` VALUES ('7042', '李检即', '10004410', '2', '75776.910', '80000.000', '000', '2925200912286396', '3', '2016-04-24', '63', '上海霞飞路632号', '2016-04-24 21:51:28', '1');
INSERT INTO `demo_account` VALUES ('7043', '刘瞎坊', '10004411', '1', '55803.420', '80000.000', '000', '2925198112183913', '2', '2016-04-24', '61', '上海霞飞路650号', '2016-04-24 21:51:28', '1');
INSERT INTO `demo_account` VALUES ('7044', '毛挥', '10004412', '2', '49990.730', '80000.000', '000', '2925197112248100', '2', '2016-04-24', '64', '上海霞飞路948号', '2016-04-24 21:51:28', '1');
INSERT INTO `demo_account` VALUES ('7045', '张氛遏', '10004413', '2', '73620.320', '80000.000', '000', '2925199911211346', '2', '2016-04-24', '41', '上海霞飞路533号', '2016-04-24 21:51:28', '1');
INSERT INTO `demo_account` VALUES ('7046', '张刹刽', '10004414', '2', '51179.770', '80000.000', '000', '2925195212177694', '2', '2016-04-24', '44', '上海霞飞路555号', '2016-04-24 21:51:28', '1');
INSERT INTO `demo_account` VALUES ('7047', '郤介', '10004415', '2', '37720.000', '80000.000', '000', '2925195912248606', '2', '2016-04-24', '78', '上海霞飞路159号', '2016-04-24 21:51:28', '1');
INSERT INTO `demo_account` VALUES ('7048', '毛轰', '10004416', '2', '47652.700', '80000.000', '000', '2925199511171342', '1', '2016-04-24', '76', '上海霞飞路532号', '2016-04-24 21:51:28', '1');
INSERT INTO `demo_account` VALUES ('7049', '毛饲', '10004417', '2', '42792.590', '80000.000', '000', '2925195210195647', '3', '2016-04-24', '40', '上海霞飞路973号', '2016-04-24 21:51:28', '1');
INSERT INTO `demo_account` VALUES ('7050', '赵表趣', '10004418', '1', '49688.950', '80000.000', '000', '2925198112127701', '1', '2016-04-24', '72', '上海霞飞路270号', '2016-04-24 21:51:28', '1');
INSERT INTO `demo_account` VALUES ('7051', '周潘弛', '10004419', '1', '51138.170', '80000.000', '000', '2925200011136509', '2', '2016-04-24', '73', '上海霞飞路566号', '2016-04-24 21:51:28', '1');
INSERT INTO `demo_account` VALUES ('7052', '黄印', '10004420', '1', '42352.420', '80000.000', '000', '2925196711232172', '2', '2016-04-24', '68', '上海霞飞路338号', '2016-04-24 21:51:28', '1');
INSERT INTO `demo_account` VALUES ('7053', '段毯', '10004421', '1', '16492.200', '80000.000', '000', '2925200510208618', '3', '2016-04-24', '75', '上海霞飞路886号', '2016-04-24 21:51:28', '1');
INSERT INTO `demo_account` VALUES ('7054', '刘必帛', '10004422', '1', '15236.250', '80000.000', '000', '2925200112284563', '3', '2016-04-24', '52', '上海霞飞路145号', '2016-04-24 21:51:29', '1');
INSERT INTO `demo_account` VALUES ('7055', '段莹', '10004423', '1', '45661.790', '80000.000', '000', '2925201011161552', '2', '2016-04-24', '26', '上海霞飞路344号', '2016-04-24 21:51:29', '1');
INSERT INTO `demo_account` VALUES ('7056', '熊墙', '10004424', '1', '31034.510', '80000.000', '000', '2925194411309079', '3', '2016-04-24', '93', '上海霞飞路369号', '2016-04-24 21:51:29', '1');
INSERT INTO `demo_account` VALUES ('7057', '黄炊', '10004425', '1', '68129.870', '80000.000', '000', '2925195710288784', '2', '2016-04-24', '93', '上海霞飞路369号', '2016-04-24 21:51:29', '1');
INSERT INTO `demo_account` VALUES ('7058', '刘脊炼', '10004426', '1', '71338.310', '80000.000', '000', '2925196011115790', '3', '2016-04-24', '87', '上海霞飞路362号', '2016-04-24 21:51:29', '1');
INSERT INTO `demo_account` VALUES ('7059', '周酬', '10004427', '2', '56275.190', '80000.000', '000', '2925194011153225', '2', '2016-04-24', '57', '上海霞飞路278号', '2016-04-24 21:51:29', '1');
INSERT INTO `demo_account` VALUES ('7060', '李氦', '10004428', '2', '8568.730', '80000.000', '000', '2925196610282968', '2', '2016-04-24', '93', '上海霞飞路994号', '2016-04-24 21:51:29', '1');
INSERT INTO `demo_account` VALUES ('7061', '段显', '10004429', '1', '7359.340', '80000.000', '000', '2925196311117529', '3', '2016-04-24', '49', '上海霞飞路532号', '2016-04-24 21:51:29', '1');
INSERT INTO `demo_account` VALUES ('7062', '毛免恩', '10004430', '2', '71416.310', '80000.000', '000', '2925200211146962', '1', '2016-04-24', '44', '上海霞飞路666号', '2016-04-24 21:51:29', '1');
INSERT INTO `demo_account` VALUES ('7063', '黄拷', '10004431', '2', '26911.910', '80000.000', '000', '2925199511138499', '3', '2016-04-24', '57', '上海霞飞路730号', '2016-04-24 21:51:29', '1');
INSERT INTO `demo_account` VALUES ('7064', '张贯', '10004432', '1', '43729.680', '80000.000', '000', '2925194411118502', '2', '2016-04-24', '84', '上海霞飞路428号', '2016-04-24 21:51:29', '1');
INSERT INTO `demo_account` VALUES ('7065', '刘消', '10004433', '2', '57685.900', '80000.000', '000', '2925194611131085', '3', '2016-04-24', '68', '上海霞飞路922号', '2016-04-24 21:51:29', '1');
INSERT INTO `demo_account` VALUES ('7066', '熊鼎扮', '10004434', '2', '43193.120', '80000.000', '000', '2925199110288582', '2', '2016-04-24', '30', '上海霞飞路449号', '2016-04-24 21:51:30', '1');
INSERT INTO `demo_account` VALUES ('7067', '李覆', '10004435', '1', '74824.110', '80000.000', '000', '2925199912122755', '2', '2016-04-24', '55', '上海霞飞路95号', '2016-04-24 21:51:30', '1');
INSERT INTO `demo_account` VALUES ('7068', '郤勋', '10004436', '2', '46757.990', '80000.000', '000', '2925194510172341', '2', '2016-04-24', '84', '上海霞飞路286号', '2016-04-24 21:51:30', '1');
INSERT INTO `demo_account` VALUES ('7069', '熊鄙玫', '10004437', '1', '32371.170', '80000.000', '000', '2925196010177286', '3', '2016-04-24', '99', '上海霞飞路895号', '2016-04-24 21:51:30', '1');
INSERT INTO `demo_account` VALUES ('7070', '周魂维', '10004438', '1', '10159.660', '80000.000', '000', '2925197012183569', '1', '2016-04-24', '87', '上海霞飞路662号', '2016-04-24 21:51:30', '1');
INSERT INTO `demo_account` VALUES ('7071', '李害', '10004439', '1', '48798.760', '80000.000', '000', '2925197910192232', '3', '2016-04-24', '43', '上海霞飞路967号', '2016-04-24 21:51:30', '1');
INSERT INTO `demo_account` VALUES ('7072', '熊宫', '10004440', '1', '79481.400', '80000.000', '000', '2925196712175767', '2', '2016-04-24', '66', '上海霞飞路734号', '2016-04-24 21:51:30', '1');
INSERT INTO `demo_account` VALUES ('7073', '李阔鸯', '10004441', '2', '79678.590', '80000.000', '000', '2925193811285597', '3', '2016-04-24', '73', '上海霞飞路454号', '2016-04-24 21:51:30', '1');
INSERT INTO `demo_account` VALUES ('7074', '黄请', '10004442', '1', '41109.910', '80000.000', '000', '2925200011112895', '1', '2016-04-24', '61', '上海霞飞路59号', '2016-04-24 21:51:30', '1');
INSERT INTO `demo_account` VALUES ('7075', '段讶笼', '10004443', '1', '46166.520', '80000.000', '000', '2925201311167510', '1', '2016-04-24', '44', '上海霞飞路526号', '2016-04-24 21:51:30', '1');
INSERT INTO `demo_account` VALUES ('7076', '毛忌', '10004444', '1', '61015.100', '80000.000', '000', '2925201112206213', '2', '2016-04-24', '57', '上海霞飞路709号', '2016-04-24 21:51:30', '1');
INSERT INTO `demo_account` VALUES ('7077', '周点付', '10004445', '1', '74425.210', '80000.000', '000', '2925201011141906', '2', '2016-04-24', '29', '上海霞飞路37号', '2016-04-24 21:51:30', '1');
INSERT INTO `demo_account` VALUES ('7078', '郤遥胡', '10004446', '1', '46746.930', '80000.000', '000', '2925197912124875', '2', '2016-04-24', '90', '上海霞飞路278号', '2016-04-24 21:51:30', '1');
INSERT INTO `demo_account` VALUES ('7079', '李城萨', '10004447', '2', '75654.440', '80000.000', '000', '2925196411217498', '2', '2016-04-24', '48', '上海霞飞路606号', '2016-04-24 21:51:30', '1');
INSERT INTO `demo_account` VALUES ('7080', '张井晕', '10004448', '1', '16024.880', '80000.000', '000', '2925193111149176', '2', '2016-04-24', '98', '上海霞飞路721号', '2016-04-24 21:51:31', '1');
INSERT INTO `demo_account` VALUES ('7081', '赵疆滇', '10004449', '2', '60862.250', '80000.000', '000', '2925201411116586', '1', '2016-04-24', '96', '上海霞飞路769号', '2016-04-24 21:51:31', '1');
INSERT INTO `demo_account` VALUES ('7082', '刘捶', '10004450', '1', '26358.570', '80000.000', '000', '2925198611302593', '1', '2016-04-24', '24', '上海霞飞路249号', '2016-04-24 21:51:31', '1');
INSERT INTO `demo_account` VALUES ('7083', '周拨', '10004451', '2', '13041.270', '80000.000', '000', '2925199610292442', '3', '2016-04-24', '26', '上海霞飞路993号', '2016-04-24 21:51:31', '1');
INSERT INTO `demo_account` VALUES ('7084', '黄罩非', '10004452', '2', '14560.720', '80000.000', '000', '2925196411189038', '2', '2016-04-24', '25', '上海霞飞路747号', '2016-04-24 21:51:31', '1');
INSERT INTO `demo_account` VALUES ('7085', '熊酸', '10004453', '2', '7874.150', '80000.000', '000', '2925196411132336', '2', '2016-04-24', '38', '上海霞飞路669号', '2016-04-24 21:51:31', '1');
INSERT INTO `demo_account` VALUES ('7086', '周夹赵', '10004454', '2', '61567.260', '80000.000', '000', '2925194010286972', '1', '2016-04-24', '44', '上海霞飞路433号', '2016-04-24 21:51:31', '1');
INSERT INTO `demo_account` VALUES ('7087', '张袖狙', '10004455', '2', '34646.670', '80000.000', '000', '2925193010255458', '1', '2016-04-24', '60', '上海霞飞路420号', '2016-04-24 21:51:31', '1');
INSERT INTO `demo_account` VALUES ('7088', '李违少', '10004456', '2', '62471.820', '80000.000', '000', '2925198710109268', '2', '2016-04-24', '91', '上海霞飞路702号', '2016-04-24 21:51:31', '1');
INSERT INTO `demo_account` VALUES ('7089', '黄克殷', '10004457', '2', '23492.130', '80000.000', '000', '2925199311185276', '1', '2016-04-24', '42', '上海霞飞路305号', '2016-04-24 21:51:31', '1');
INSERT INTO `demo_account` VALUES ('7090', '李绵您', '10004458', '2', '20144.420', '80000.000', '000', '2925196411168997', '2', '2016-04-24', '55', '上海霞飞路402号', '2016-04-24 21:51:31', '1');
INSERT INTO `demo_account` VALUES ('7091', '周央稠', '10004459', '1', '11629.990', '80000.000', '000', '2925195511219088', '1', '2016-04-24', '59', '上海霞飞路769号', '2016-04-24 21:51:31', '1');
INSERT INTO `demo_account` VALUES ('7092', '毛酶', '10004460', '1', '53376.250', '80000.000', '000', '2925193111126526', '3', '2016-04-24', '19', '上海霞飞路983号', '2016-04-24 21:51:31', '1');
INSERT INTO `demo_account` VALUES ('7093', '郤蜂', '10004461', '1', '29737.950', '80000.000', '000', '2925192010177828', '3', '2016-04-24', '84', '上海霞飞路422号', '2016-04-24 21:51:32', '1');
INSERT INTO `demo_account` VALUES ('7094', '赵跃', '10004462', '1', '42897.100', '80000.000', '000', '2925198410122576', '1', '2016-04-24', '22', '上海霞飞路239号', '2016-04-24 21:51:32', '1');
INSERT INTO `demo_account` VALUES ('7095', '刘塞都', '10004463', '1', '48114.940', '80000.000', '000', '2925198712242365', '3', '2016-04-24', '77', '上海霞飞路986号', '2016-04-24 21:51:32', '1');
INSERT INTO `demo_account` VALUES ('7096', '周布', '10004464', '2', '41214.250', '80000.000', '000', '2925197311196162', '2', '2016-04-24', '41', '上海霞飞路613号', '2016-04-24 21:51:32', '1');
INSERT INTO `demo_account` VALUES ('7097', '熊颅', '10004465', '1', '44777.510', '80000.000', '000', '2925200411285854', '2', '2016-04-24', '50', '上海霞飞路14号', '2016-04-24 21:51:32', '1');
INSERT INTO `demo_account` VALUES ('7098', '郤帐除', '10004466', '2', '74628.610', '80000.000', '000', '2925192511139542', '2', '2016-04-24', '69', '上海霞飞路277号', '2016-04-24 21:51:32', '1');
INSERT INTO `demo_account` VALUES ('7099', '张剃', '10004467', '2', '54135.880', '80000.000', '000', '2925200610246900', '1', '2016-04-24', '61', '上海霞飞路193号', '2016-04-24 21:51:32', '1');
INSERT INTO `demo_account` VALUES ('7100', '李怜仍', '10004468', '1', '56362.970', '80000.000', '000', '2925197412161605', '2', '2016-04-24', '44', '上海霞飞路450号', '2016-04-24 21:51:32', '1');
INSERT INTO `demo_account` VALUES ('7101', '赵绒俄', '10004469', '1', '73406.530', '80000.000', '000', '2925199111106567', '1', '2016-04-24', '78', '上海霞飞路356号', '2016-04-24 21:51:32', '1');
INSERT INTO `demo_account` VALUES ('7102', '周蛮大', '10004470', '1', '30164.760', '80000.000', '000', '2925200511213313', '2', '2016-04-24', '45', '上海霞飞路671号', '2016-04-24 21:51:32', '1');
INSERT INTO `demo_account` VALUES ('7103', '赵栽接', '10004471', '2', '18400.950', '80000.000', '000', '2925198411121501', '2', '2016-04-24', '38', '上海霞飞路513号', '2016-04-24 21:51:32', '1');
INSERT INTO `demo_account` VALUES ('7104', '赵烹', '10004472', '2', '20321.160', '80000.000', '000', '2925194110193150', '1', '2016-04-24', '42', '上海霞飞路991号', '2016-04-24 21:51:32', '1');
INSERT INTO `demo_account` VALUES ('7105', '李产', '10004473', '2', '12844.130', '80000.000', '000', '2925192610143716', '2', '2016-04-24', '87', '上海霞飞路503号', '2016-04-24 21:51:32', '1');
INSERT INTO `demo_account` VALUES ('7106', '黄寸', '10004474', '2', '40449.760', '80000.000', '000', '2925200812265678', '2', '2016-04-24', '82', '上海霞飞路299号', '2016-04-24 21:51:33', '1');
INSERT INTO `demo_account` VALUES ('7107', '刘难', '10004475', '1', '55874.790', '80000.000', '000', '2925194412259791', '1', '2016-04-24', '47', '上海霞飞路109号', '2016-04-24 21:51:33', '1');
INSERT INTO `demo_account` VALUES ('7108', '周亚逐', '10004476', '2', '17978.500', '80000.000', '000', '2925201311163640', '1', '2016-04-24', '67', '上海霞飞路248号', '2016-04-24 21:51:33', '1');
INSERT INTO `demo_account` VALUES ('7109', '李却', '10004477', '2', '54857.520', '80000.000', '000', '2925200311245536', '2', '2016-04-24', '27', '上海霞飞路727号', '2016-04-24 21:51:33', '1');
INSERT INTO `demo_account` VALUES ('7110', '熊慎蝗', '10004478', '1', '75721.640', '80000.000', '000', '2925198711111246', '3', '2016-04-24', '48', '上海霞飞路492号', '2016-04-24 21:51:33', '1');
INSERT INTO `demo_account` VALUES ('7111', '熊绚', '10004479', '1', '45186.230', '80000.000', '000', '2925199210194367', '1', '2016-04-24', '33', '上海霞飞路914号', '2016-04-24 21:51:33', '1');
INSERT INTO `demo_account` VALUES ('7112', '李厘姆', '10004480', '1', '76432.270', '80000.000', '000', '2925194910132541', '3', '2016-04-24', '76', '上海霞飞路210号', '2016-04-24 21:51:33', '1');
INSERT INTO `demo_account` VALUES ('7113', '张征', '10004481', '1', '67196.560', '80000.000', '000', '2925200511122968', '2', '2016-04-24', '53', '上海霞飞路429号', '2016-04-24 21:51:33', '1');
INSERT INTO `demo_account` VALUES ('7114', '毛搓府', '10004482', '1', '18744.820', '80000.000', '000', '2925194311167024', '2', '2016-04-24', '69', '上海霞飞路108号', '2016-04-24 21:51:33', '1');
INSERT INTO `demo_account` VALUES ('7115', '李谷慰', '10004483', '1', '76852.430', '80000.000', '000', '2925198712259957', '1', '2016-04-24', '53', '上海霞飞路582号', '2016-04-24 21:51:33', '1');
INSERT INTO `demo_account` VALUES ('7116', '李线', '10004484', '2', '79393.600', '80000.000', '000', '2925195611292906', '3', '2016-04-24', '97', '上海霞飞路393号', '2016-04-24 21:51:33', '1');
INSERT INTO `demo_account` VALUES ('7117', '赵贾林', '10004485', '2', '63358.420', '80000.000', '000', '2925197212218648', '2', '2016-04-24', '23', '上海霞飞路999号', '2016-04-24 21:51:33', '1');
INSERT INTO `demo_account` VALUES ('7118', '周韦', '10004486', '1', '77120.750', '80000.000', '000', '2925198212214655', '3', '2016-04-24', '32', '上海霞飞路419号', '2016-04-24 21:51:33', '1');
INSERT INTO `demo_account` VALUES ('7119', '熊永亥', '10004487', '1', '47325.700', '80000.000', '000', '2925196611145118', '3', '2016-04-24', '33', '上海霞飞路139号', '2016-04-24 21:51:33', '1');
INSERT INTO `demo_account` VALUES ('7120', '毛玲哺', '10004488', '2', '76154.310', '80000.000', '000', '2925196410123750', '2', '2016-04-24', '63', '上海霞飞路961号', '2016-04-24 21:51:34', '1');
INSERT INTO `demo_account` VALUES ('7121', '郤毡', '10004489', '1', '21668.700', '80000.000', '000', '2925196910239171', '2', '2016-04-24', '72', '上海霞飞路136号', '2016-04-24 21:51:34', '1');
INSERT INTO `demo_account` VALUES ('7122', '刘盔蛀', '10004490', '2', '17670.260', '80000.000', '000', '2925193410259780', '2', '2016-04-24', '78', '上海霞飞路353号', '2016-04-24 21:51:34', '1');
INSERT INTO `demo_account` VALUES ('7123', '黄寸瀑', '10004491', '2', '63855.960', '80000.000', '000', '2925200712274934', '3', '2016-04-24', '87', '上海霞飞路840号', '2016-04-24 21:51:34', '1');
INSERT INTO `demo_account` VALUES ('7124', '张场', '10004492', '2', '60127.200', '80000.000', '000', '2925195511161298', '2', '2016-04-24', '44', '上海霞飞路936号', '2016-04-24 21:51:34', '1');
INSERT INTO `demo_account` VALUES ('7125', '赵椅苑', '10004493', '2', '52678.950', '80000.000', '000', '2925195110256118', '2', '2016-04-24', '98', '上海霞飞路117号', '2016-04-24 21:51:34', '1');
INSERT INTO `demo_account` VALUES ('7126', '段冒厕', '10004494', '2', '71880.960', '80000.000', '000', '2925200810114070', '2', '2016-04-24', '68', '上海霞飞路546号', '2016-04-24 21:51:34', '1');
INSERT INTO `demo_account` VALUES ('7127', '赵渡', '10004495', '2', '69179.710', '80000.000', '000', '2925198910155248', '2', '2016-04-24', '54', '上海霞飞路745号', '2016-04-24 21:51:34', '1');
INSERT INTO `demo_account` VALUES ('7128', '刘眯', '10004496', '2', '67959.580', '80000.000', '000', '2925198512273646', '1', '2016-04-24', '97', '上海霞飞路989号', '2016-04-24 21:51:34', '1');
INSERT INTO `demo_account` VALUES ('7129', '周即扒', '10004497', '1', '63890.480', '80000.000', '000', '2925196811146350', '2', '2016-04-24', '72', '上海霞飞路539号', '2016-04-24 21:51:34', '1');
INSERT INTO `demo_account` VALUES ('7130', '郤丙福', '10004498', '2', '71426.350', '80000.000', '000', '2925196210214378', '3', '2016-04-24', '45', '上海霞飞路742号', '2016-04-24 21:51:34', '1');
INSERT INTO `demo_account` VALUES ('7131', '张番降', '10004499', '1', '55027.800', '80000.000', '000', '2925193812218906', '2', '2016-04-24', '95', '上海霞飞路482号', '2016-04-24 21:51:34', '1');
INSERT INTO `demo_account` VALUES ('7132', '黄据', '10004500', '1', '44204.490', '80000.000', '000', '2925201411109304', '2', '2016-04-24', '90', '上海霞飞路314号', '2016-04-24 21:51:35', '1');
INSERT INTO `demo_account` VALUES ('7133', '段苹', '10004501', '2', '68796.640', '80000.000', '000', '2925198110202085', '3', '2016-04-24', '92', '上海霞飞路7号', '2016-04-24 21:51:35', '1');
INSERT INTO `demo_account` VALUES ('7134', '赵态', '10004502', '1', '32761.900', '80000.000', '000', '2925197810203551', '3', '2016-04-24', '79', '上海霞飞路17号', '2016-04-24 21:51:35', '1');
INSERT INTO `demo_account` VALUES ('7135', '熊显挟', '10004503', '2', '13448.740', '80000.000', '000', '2925197810123527', '2', '2016-04-24', '95', '上海霞飞路733号', '2016-04-24 21:51:35', '1');
INSERT INTO `demo_account` VALUES ('7136', '熊蝇辫', '10004504', '2', '26581.810', '80000.000', '000', '2925200110258141', '2', '2016-04-24', '53', '上海霞飞路78号', '2016-04-24 21:51:35', '1');
INSERT INTO `demo_account` VALUES ('7137', '黄顿', '10004505', '2', '67242.470', '80000.000', '000', '2925193012278228', '3', '2016-04-24', '25', '上海霞飞路274号', '2016-04-24 21:51:35', '1');
INSERT INTO `demo_account` VALUES ('7138', '段益', '10004506', '1', '7777.890', '80000.000', '000', '2925195310303384', '2', '2016-04-24', '38', '上海霞飞路334号', '2016-04-24 21:51:35', '1');
INSERT INTO `demo_account` VALUES ('7139', '毛罢炔', '10004507', '2', '32958.620', '80000.000', '000', '2925201511213278', '2', '2016-04-24', '37', '上海霞飞路924号', '2016-04-24 21:51:35', '1');
INSERT INTO `demo_account` VALUES ('7140', '熊胚', '10004508', '1', '22791.110', '80000.000', '000', '2925200412189221', '1', '2016-04-24', '96', '上海霞飞路959号', '2016-04-24 21:51:35', '1');
INSERT INTO `demo_account` VALUES ('7141', '李甚', '10004509', '2', '52109.670', '80000.000', '000', '2925198211258486', '2', '2016-04-24', '38', '上海霞飞路355号', '2016-04-24 21:51:35', '1');
INSERT INTO `demo_account` VALUES ('7142', '段蹦', '10004510', '2', '51535.250', '80000.000', '000', '2925192911309213', '1', '2016-04-24', '55', '上海霞飞路941号', '2016-04-24 21:51:35', '1');
INSERT INTO `demo_account` VALUES ('7143', '郤晌', '10004511', '1', '58507.720', '80000.000', '000', '2925197811206189', '1', '2016-04-24', '94', '上海霞飞路616号', '2016-04-24 21:51:35', '1');
INSERT INTO `demo_account` VALUES ('7144', '刘循', '10004512', '2', '59910.180', '80000.000', '000', '2925196712261036', '3', '2016-04-24', '26', '上海霞飞路274号', '2016-04-24 21:51:35', '1');
INSERT INTO `demo_account` VALUES ('7145', '刘徒埔', '10004513', '2', '31317.200', '80000.000', '000', '2925198211153738', '2', '2016-04-24', '64', '上海霞飞路79号', '2016-04-24 21:51:36', '1');
INSERT INTO `demo_account` VALUES ('7146', '熊恿', '10004514', '2', '48069.700', '80000.000', '000', '2925198110118660', '2', '2016-04-24', '25', '上海霞飞路86号', '2016-04-24 21:51:36', '1');
INSERT INTO `demo_account` VALUES ('7147', '刘吕迟', '10004515', '2', '18267.620', '80000.000', '000', '2925198511256473', '1', '2016-04-24', '52', '上海霞飞路110号', '2016-04-24 21:51:36', '1');
INSERT INTO `demo_account` VALUES ('7148', '毛设莆', '10004516', '2', '73350.190', '80000.000', '000', '2925199012191625', '1', '2016-04-24', '96', '上海霞飞路162号', '2016-04-24 21:51:36', '1');
INSERT INTO `demo_account` VALUES ('7149', '赵拍挫', '10004517', '1', '28145.970', '80000.000', '000', '2925194711285185', '2', '2016-04-24', '75', '上海霞飞路613号', '2016-04-24 21:51:36', '1');
INSERT INTO `demo_account` VALUES ('7150', '李桶', '10004518', '2', '23256.200', '80000.000', '000', '2925200410132016', '1', '2016-04-24', '36', '上海霞飞路572号', '2016-04-24 21:51:36', '1');
INSERT INTO `demo_account` VALUES ('7151', '段浆', '10004519', '1', '58241.170', '80000.000', '000', '2925201111233369', '3', '2016-04-24', '76', '上海霞飞路751号', '2016-04-24 21:51:36', '1');
INSERT INTO `demo_account` VALUES ('7152', '黄诊', '10004520', '2', '42391.650', '80000.000', '000', '2925200010135106', '2', '2016-04-24', '57', '上海霞飞路382号', '2016-04-24 21:51:36', '1');
INSERT INTO `demo_account` VALUES ('7153', '张梢精', '10004521', '2', '22878.110', '80000.000', '000', '2925194512163766', '3', '2016-04-24', '30', '上海霞飞路437号', '2016-04-24 21:51:36', '1');
INSERT INTO `demo_account` VALUES ('7154', '熊栓盂', '10004522', '2', '19757.520', '80000.000', '000', '2925201511197768', '2', '2016-04-24', '78', '上海霞飞路648号', '2016-04-24 21:51:36', '1');
INSERT INTO `demo_account` VALUES ('7155', '张枉夫', '10004523', '1', '33688.130', '80000.000', '000', '2925196711222006', '3', '2016-04-24', '87', '上海霞飞路453号', '2016-04-24 21:51:36', '1');
INSERT INTO `demo_account` VALUES ('7156', '段肾咖', '10004524', '1', '39284.750', '80000.000', '000', '2925200310189082', '3', '2016-04-24', '76', '上海霞飞路171号', '2016-04-24 21:51:36', '1');
INSERT INTO `demo_account` VALUES ('7157', '赵隧', '10004525', '2', '20767.620', '80000.000', '000', '2925197412111342', '2', '2016-04-24', '51', '上海霞飞路271号', '2016-04-24 21:51:36', '1');
INSERT INTO `demo_account` VALUES ('7158', '周矫', '10004526', '1', '15032.230', '80000.000', '000', '2925196411292783', '3', '2016-04-24', '38', '上海霞飞路721号', '2016-04-24 21:51:36', '1');
INSERT INTO `demo_account` VALUES ('7159', '黄嘿焉', '10004527', '1', '70375.650', '80000.000', '000', '2925194211171786', '2', '2016-04-24', '65', '上海霞飞路914号', '2016-04-24 21:51:37', '1');
INSERT INTO `demo_account` VALUES ('7160', '黄驰陆', '10004528', '1', '6921.580', '80000.000', '000', '2925192611171455', '1', '2016-04-24', '43', '上海霞飞路691号', '2016-04-24 21:51:37', '1');
INSERT INTO `demo_account` VALUES ('7161', '周换没', '10004529', '1', '61315.760', '80000.000', '000', '2925199211209151', '3', '2016-04-24', '33', '上海霞飞路467号', '2016-04-24 21:51:37', '1');
INSERT INTO `demo_account` VALUES ('7162', '毛顾钮', '10004530', '2', '67421.820', '80000.000', '000', '2925197211128618', '3', '2016-04-24', '23', '上海霞飞路411号', '2016-04-24 21:51:37', '1');
INSERT INTO `demo_account` VALUES ('7163', '熊后', '10004531', '1', '12647.350', '80000.000', '000', '2925199812143787', '2', '2016-04-24', '24', '上海霞飞路50号', '2016-04-24 21:51:37', '1');
INSERT INTO `demo_account` VALUES ('7164', '周蛋孺', '10004532', '1', '42081.680', '80000.000', '000', '2925194110121125', '2', '2016-04-24', '93', '上海霞飞路561号', '2016-04-24 21:51:37', '1');
INSERT INTO `demo_account` VALUES ('7165', '李嫁惯', '10004533', '2', '57883.370', '80000.000', '000', '2925193812289036', '2', '2016-04-24', '51', '上海霞飞路360号', '2016-04-24 21:51:37', '1');
INSERT INTO `demo_account` VALUES ('7166', '赵秘', '10004534', '2', '61299.140', '80000.000', '000', '2925197711214491', '1', '2016-04-24', '81', '上海霞飞路431号', '2016-04-24 21:51:37', '1');
INSERT INTO `demo_account` VALUES ('7167', '黄魏癣', '10004535', '2', '15313.260', '80000.000', '000', '2925194511285684', '3', '2016-04-24', '23', '上海霞飞路129号', '2016-04-24 21:51:37', '1');
INSERT INTO `demo_account` VALUES ('7168', '郤命', '10004536', '1', '37241.500', '80000.000', '000', '2925200112204097', '1', '2016-04-24', '77', '上海霞飞路961号', '2016-04-24 21:51:37', '1');
INSERT INTO `demo_account` VALUES ('7169', '熊疫', '10004537', '2', '22609.210', '80000.000', '000', '2925200312167934', '2', '2016-04-24', '43', '上海霞飞路63号', '2016-04-24 21:51:37', '1');
INSERT INTO `demo_account` VALUES ('7170', '毛搁', '10004538', '2', '50295.500', '80000.000', '000', '2925199410224384', '3', '2016-04-24', '86', '上海霞飞路801号', '2016-04-24 21:51:37', '1');
INSERT INTO `demo_account` VALUES ('7171', '毛挟粉', '10004539', '2', '22356.390', '80000.000', '000', '2925198810196688', '3', '2016-04-24', '81', '上海霞飞路121号', '2016-04-24 21:51:38', '1');
INSERT INTO `demo_account` VALUES ('7172', '李冯', '10004540', '2', '49962.160', '80000.000', '000', '2925195912121466', '2', '2016-04-24', '97', '上海霞飞路834号', '2016-04-24 21:51:38', '1');
INSERT INTO `demo_account` VALUES ('7173', '郤又乓', '10004541', '2', '47658.540', '80000.000', '000', '2925194611261145', '1', '2016-04-24', '41', '上海霞飞路230号', '2016-04-24 21:51:38', '1');
INSERT INTO `demo_account` VALUES ('7174', '周橡臆', '10004542', '1', '51590.250', '80000.000', '000', '2925199012235797', '2', '2016-04-24', '74', '上海霞飞路897号', '2016-04-24 21:51:38', '1');
INSERT INTO `demo_account` VALUES ('7175', '熊萍', '10004543', '1', '19466.200', '80000.000', '000', '2925194110249013', '2', '2016-04-24', '56', '上海霞飞路743号', '2016-04-24 21:51:38', '1');
INSERT INTO `demo_account` VALUES ('7176', '李望音', '10004544', '2', '30838.160', '80000.000', '000', '2925193511221808', '1', '2016-04-24', '70', '上海霞飞路653号', '2016-04-24 21:51:38', '1');
INSERT INTO `demo_account` VALUES ('7177', '张蜂氰', '10004545', '1', '79785.400', '80000.000', '000', '2925198312251859', '2', '2016-04-24', '85', '上海霞飞路277号', '2016-04-24 21:51:38', '1');
INSERT INTO `demo_account` VALUES ('7178', '李粮吧', '10004546', '1', '68279.670', '80000.000', '000', '2925197511293650', '3', '2016-04-24', '99', '上海霞飞路827号', '2016-04-24 21:51:38', '1');
INSERT INTO `demo_account` VALUES ('7179', '熊恃糕', '10004547', '2', '61389.580', '80000.000', '000', '2925197611272351', '3', '2016-04-24', '83', '上海霞飞路722号', '2016-04-24 21:51:38', '1');
INSERT INTO `demo_account` VALUES ('7180', '熊翔', '10004548', '1', '57027.360', '80000.000', '000', '2925194210268463', '1', '2016-04-24', '97', '上海霞飞路283号', '2016-04-24 21:51:38', '1');
INSERT INTO `demo_account` VALUES ('7181', '毛胺', '10004549', '2', '43220.150', '80000.000', '000', '2925196611106463', '2', '2016-04-24', '31', '上海霞飞路554号', '2016-04-24 21:51:38', '1');
INSERT INTO `demo_account` VALUES ('7182', '赵筛', '10004550', '2', '6806.970', '80000.000', '000', '2925199511251818', '3', '2016-04-24', '45', '上海霞飞路641号', '2016-04-24 21:51:38', '1');
INSERT INTO `demo_account` VALUES ('7183', '张迟', '10004551', '2', '37094.800', '80000.000', '000', '2925192411237873', '2', '2016-04-24', '65', '上海霞飞路757号', '2016-04-24 21:51:38', '1');
INSERT INTO `demo_account` VALUES ('7184', '刘潮', '10004552', '1', '72338.900', '80000.000', '000', '2925194412241213', '3', '2016-04-24', '49', '上海霞飞路416号', '2016-04-24 21:51:39', '1');
INSERT INTO `demo_account` VALUES ('7185', '张茫斩', '10004553', '1', '51875.710', '80000.000', '000', '2925194110198115', '1', '2016-04-24', '32', '上海霞飞路972号', '2016-04-24 21:51:39', '1');
INSERT INTO `demo_account` VALUES ('7186', '段邦', '10004554', '1', '44467.700', '80000.000', '000', '2925197511288821', '3', '2016-04-24', '22', '上海霞飞路875号', '2016-04-24 21:51:39', '1');
INSERT INTO `demo_account` VALUES ('7187', '周磕', '10004555', '2', '23769.990', '80000.000', '000', '2925194410236251', '1', '2016-04-24', '65', '上海霞飞路692号', '2016-04-24 21:51:39', '1');
INSERT INTO `demo_account` VALUES ('7188', '毛俱榨', '10004556', '1', '58902.440', '80000.000', '000', '2925194311257845', '3', '2016-04-24', '98', '上海霞飞路96号', '2016-04-24 21:51:39', '1');
INSERT INTO `demo_account` VALUES ('7189', '段舵', '10004557', '2', '7870.170', '80000.000', '000', '2925195112169081', '2', '2016-04-24', '83', '上海霞飞路600号', '2016-04-24 21:51:39', '1');
INSERT INTO `demo_account` VALUES ('7190', '周稳', '10004558', '1', '77989.510', '80000.000', '000', '2925192510114159', '1', '2016-04-24', '66', '上海霞飞路924号', '2016-04-24 21:51:39', '1');
INSERT INTO `demo_account` VALUES ('7191', '郤迅恐', '10004559', '2', '8630.590', '80000.000', '000', '2925201510116194', '2', '2016-04-24', '70', '上海霞飞路397号', '2016-04-24 21:51:39', '1');
INSERT INTO `demo_account` VALUES ('7192', '郤普辊', '10004560', '1', '11404.230', '80000.000', '000', '2925201412219129', '1', '2016-04-24', '70', '上海霞飞路817号', '2016-04-24 21:51:39', '1');
INSERT INTO `demo_account` VALUES ('7193', '毛周', '10004561', '2', '29378.920', '80000.000', '000', '2925197711259348', '1', '2016-04-24', '84', '上海霞飞路700号', '2016-04-24 21:51:39', '1');
INSERT INTO `demo_account` VALUES ('7194', '周盖', '10004562', '2', '66168.600', '80000.000', '000', '2925199712115778', '2', '2016-04-24', '89', '上海霞飞路753号', '2016-04-24 21:51:39', '1');
INSERT INTO `demo_account` VALUES ('7195', '黄诈', '10004563', '1', '51553.240', '80000.000', '000', '2925193712216007', '2', '2016-04-24', '81', '上海霞飞路853号', '2016-04-24 21:51:39', '1');
INSERT INTO `demo_account` VALUES ('7196', '李黄', '10004564', '2', '46886.660', '80000.000', '000', '2925198811175670', '2', '2016-04-24', '65', '上海霞飞路715号', '2016-04-24 21:51:39', '1');
INSERT INTO `demo_account` VALUES ('7197', '赵缕馁', '10004565', '1', '42793.250', '80000.000', '000', '2925198611223007', '2', '2016-04-24', '24', '上海霞飞路740号', '2016-04-24 21:51:40', '1');
INSERT INTO `demo_account` VALUES ('7198', '李疯富', '10004566', '1', '45593.910', '80000.000', '000', '2925196210149199', '1', '2016-04-24', '38', '上海霞飞路427号', '2016-04-24 21:51:40', '1');
INSERT INTO `demo_account` VALUES ('7199', '刘腻乎', '10004567', '2', '37525.750', '80000.000', '000', '2925197611275673', '1', '2016-04-24', '70', '上海霞飞路946号', '2016-04-24 21:51:40', '1');
INSERT INTO `demo_account` VALUES ('7200', '毛妨铱', '10004568', '1', '21130.560', '80000.000', '000', '2925195110128163', '2', '2016-04-24', '63', '上海霞飞路328号', '2016-04-24 21:51:40', '1');
INSERT INTO `demo_account` VALUES ('7201', '李哨', '10004569', '2', '56215.460', '80000.000', '000', '2925201511114898', '1', '2016-04-24', '34', '上海霞飞路846号', '2016-04-24 21:51:40', '1');
INSERT INTO `demo_account` VALUES ('7202', '黄猾', '10004570', '2', '78426.220', '80000.000', '000', '2925196211199779', '1', '2016-04-24', '62', '上海霞飞路989号', '2016-04-24 21:51:40', '1');
INSERT INTO `demo_account` VALUES ('7203', '李塘竭', '10004571', '2', '17915.490', '80000.000', '000', '2925201111151946', '2', '2016-04-24', '22', '上海霞飞路469号', '2016-04-24 21:51:40', '1');
INSERT INTO `demo_account` VALUES ('7204', '张翱桔', '10004572', '1', '20596.900', '80000.000', '000', '2925199411229548', '3', '2016-04-24', '66', '上海霞飞路449号', '2016-04-24 21:51:40', '1');
INSERT INTO `demo_account` VALUES ('7205', '李锈鞠', '10004573', '2', '41261.450', '80000.000', '000', '2925198511174037', '2', '2016-04-24', '71', '上海霞飞路222号', '2016-04-24 21:51:40', '1');
INSERT INTO `demo_account` VALUES ('7206', '赵阁', '10004574', '2', '21257.300', '80000.000', '000', '2925201110234619', '2', '2016-04-24', '62', '上海霞飞路163号', '2016-04-24 21:51:40', '1');
INSERT INTO `demo_account` VALUES ('7207', '赵洪', '10004575', '1', '67571.780', '80000.000', '000', '2925198611276967', '2', '2016-04-24', '79', '上海霞飞路823号', '2016-04-24 21:51:40', '1');
INSERT INTO `demo_account` VALUES ('7208', '赵臃畔', '10004576', '1', '64943.370', '80000.000', '000', '2925193410276548', '2', '2016-04-24', '31', '上海霞飞路556号', '2016-04-24 21:51:41', '1');
INSERT INTO `demo_account` VALUES ('7209', '周力柠', '10004577', '2', '52189.830', '80000.000', '000', '2925193711251300', '3', '2016-04-24', '32', '上海霞飞路20号', '2016-04-24 21:51:41', '1');
INSERT INTO `demo_account` VALUES ('7210', '周轿', '10004578', '2', '40038.700', '80000.000', '000', '2925201312215619', '1', '2016-04-24', '72', '上海霞飞路379号', '2016-04-24 21:51:41', '1');
INSERT INTO `demo_account` VALUES ('7211', '李镁用', '10004579', '1', '64727.790', '80000.000', '000', '2925192611214908', '3', '2016-04-24', '41', '上海霞飞路940号', '2016-04-24 21:51:41', '1');
INSERT INTO `demo_account` VALUES ('7212', '赵烙', '10004580', '2', '19114.300', '80000.000', '000', '2925199612203111', '1', '2016-04-24', '29', '上海霞飞路327号', '2016-04-24 21:51:41', '1');
INSERT INTO `demo_account` VALUES ('7213', '段校肃', '10004581', '2', '27349.440', '80000.000', '000', '2925198511199885', '2', '2016-04-24', '90', '上海霞飞路174号', '2016-04-24 21:51:41', '1');
INSERT INTO `demo_account` VALUES ('7214', '黄坡业', '10004582', '2', '58073.370', '80000.000', '000', '2925195910115178', '2', '2016-04-24', '21', '上海霞飞路653号', '2016-04-24 21:51:41', '1');
INSERT INTO `demo_account` VALUES ('7215', '段男', '10004583', '2', '22743.410', '80000.000', '000', '2925200710154120', '2', '2016-04-24', '27', '上海霞飞路901号', '2016-04-24 21:51:41', '1');
INSERT INTO `demo_account` VALUES ('7216', '赵圃仟', '10004584', '2', '47994.470', '80000.000', '000', '2925194210259240', '2', '2016-04-24', '18', '上海霞飞路730号', '2016-04-24 21:51:41', '1');
INSERT INTO `demo_account` VALUES ('7217', '赵允', '10004585', '2', '49947.420', '80000.000', '000', '2925193911245040', '1', '2016-04-24', '54', '上海霞飞路688号', '2016-04-24 21:51:41', '1');
INSERT INTO `demo_account` VALUES ('7218', '张保', '10004586', '1', '24085.800', '80000.000', '000', '2925197111137033', '2', '2016-04-24', '81', '上海霞飞路775号', '2016-04-24 21:51:41', '1');
INSERT INTO `demo_account` VALUES ('7219', '赵荚', '10004587', '1', '48650.590', '80000.000', '000', '2925200311189315', '2', '2016-04-24', '89', '上海霞飞路762号', '2016-04-24 21:51:42', '1');
INSERT INTO `demo_account` VALUES ('7220', '周篙', '10004588', '2', '22634.240', '80000.000', '000', '2925192611143725', '2', '2016-04-24', '93', '上海霞飞路208号', '2016-04-24 21:51:42', '1');
INSERT INTO `demo_account` VALUES ('7221', '周樱', '10004589', '1', '69139.760', '80000.000', '000', '2925198010307557', '3', '2016-04-24', '20', '上海霞飞路878号', '2016-04-24 21:51:42', '1');
INSERT INTO `demo_account` VALUES ('7222', '刘腺寥', '10004590', '1', '75359.180', '80000.000', '000', '2925195511109749', '2', '2016-04-24', '73', '上海霞飞路348号', '2016-04-24 21:51:42', '1');
INSERT INTO `demo_account` VALUES ('7223', '李踏', '10004591', '2', '39531.720', '80000.000', '000', '2925193812258258', '2', '2016-04-24', '84', '上海霞飞路95号', '2016-04-24 21:51:42', '1');
INSERT INTO `demo_account` VALUES ('7224', '段念沁', '10004592', '2', '61055.590', '80000.000', '000', '2925197710139259', '3', '2016-04-24', '22', '上海霞飞路431号', '2016-04-24 21:51:42', '1');
INSERT INTO `demo_account` VALUES ('7225', '周文盲', '10004593', '2', '6436.380', '80000.000', '000', '2925195011298546', '1', '2016-04-24', '51', '上海霞飞路75号', '2016-04-24 21:51:42', '1');
INSERT INTO `demo_account` VALUES ('7226', '段颐屑', '10004594', '1', '40943.620', '80000.000', '000', '2925196211271351', '1', '2016-04-24', '23', '上海霞飞路142号', '2016-04-24 21:51:42', '1');
INSERT INTO `demo_account` VALUES ('7227', '毛每仕', '10004595', '2', '41711.490', '80000.000', '000', '2925200512244482', '2', '2016-04-24', '48', '上海霞飞路724号', '2016-04-24 21:51:42', '1');
INSERT INTO `demo_account` VALUES ('7228', '赵舶', '10004596', '2', '20608.500', '80000.000', '000', '2925198311265461', '1', '2016-04-24', '77', '上海霞飞路141号', '2016-04-24 21:51:42', '1');
INSERT INTO `demo_account` VALUES ('7229', '郤狼愈', '10004597', '1', '62434.520', '80000.000', '000', '2925198211119968', '2', '2016-04-24', '74', '上海霞飞路282号', '2016-04-24 21:51:42', '1');
INSERT INTO `demo_account` VALUES ('7230', '黄板', '10004598', '2', '23932.130', '80000.000', '000', '2925195911295597', '1', '2016-04-24', '28', '上海霞飞路296号', '2016-04-24 21:51:42', '1');
INSERT INTO `demo_account` VALUES ('7231', '熊铡', '10004599', '2', '51772.630', '80000.000', '000', '2925198810211522', '3', '2016-04-24', '24', '上海霞飞路182号', '2016-04-24 21:51:43', '1');
INSERT INTO `demo_account` VALUES ('7232', '张笺封', '10004600', '2', '50920.200', '80000.000', '000', '2925201311108283', '2', '2016-04-24', '87', '上海霞飞路576号', '2016-04-24 21:51:43', '1');
INSERT INTO `demo_account` VALUES ('7233', '毛弄占', '10004601', '1', '76864.910', '80000.000', '000', '2925193712235443', '3', '2016-04-24', '38', '上海霞飞路292号', '2016-04-24 21:51:43', '1');
INSERT INTO `demo_account` VALUES ('7234', '赵提', '10004602', '2', '27812.700', '80000.000', '000', '2925193111204404', '1', '2016-04-24', '44', '上海霞飞路841号', '2016-04-24 21:51:43', '1');
INSERT INTO `demo_account` VALUES ('7235', '赵瓤胖', '10004603', '1', '36389.350', '80000.000', '000', '2925194511246170', '3', '2016-04-24', '48', '上海霞飞路360号', '2016-04-24 21:51:43', '1');
INSERT INTO `demo_account` VALUES ('7236', '熊斯台', '10004604', '2', '24394.750', '80000.000', '000', '2925198710125316', '1', '2016-04-24', '32', '上海霞飞路972号', '2016-04-24 21:51:43', '1');
INSERT INTO `demo_account` VALUES ('7237', '黄娜', '10004605', '1', '50960.150', '80000.000', '000', '2925199411244825', '3', '2016-04-24', '51', '上海霞飞路760号', '2016-04-24 21:51:43', '1');
INSERT INTO `demo_account` VALUES ('7238', '段铀', '10004606', '1', '69880.230', '80000.000', '000', '2925197111171908', '2', '2016-04-24', '47', '上海霞飞路64号', '2016-04-24 21:51:43', '1');
INSERT INTO `demo_account` VALUES ('7239', '熊矽', '10004607', '2', '59985.510', '80000.000', '000', '2925192111211251', '1', '2016-04-24', '89', '上海霞飞路879号', '2016-04-24 21:51:43', '1');
INSERT INTO `demo_account` VALUES ('7240', '周焰', '10004608', '2', '27296.570', '80000.000', '000', '2925198110223491', '2', '2016-04-24', '88', '上海霞飞路654号', '2016-04-24 21:51:43', '1');
INSERT INTO `demo_account` VALUES ('7241', '张婉', '10004609', '1', '19155.750', '80000.000', '000', '2925194510118048', '2', '2016-04-24', '31', '上海霞飞路734号', '2016-04-24 21:51:44', '1');
INSERT INTO `demo_account` VALUES ('7242', '段川驳', '10004610', '1', '78734.720', '80000.000', '000', '2925193110119679', '3', '2016-04-24', '32', '上海霞飞路190号', '2016-04-24 21:51:44', '1');
INSERT INTO `demo_account` VALUES ('7243', '熊钥拧', '10004611', '1', '39203.520', '80000.000', '000', '2925196812149407', '2', '2016-04-24', '66', '上海霞飞路655号', '2016-04-24 21:51:44', '1');
INSERT INTO `demo_account` VALUES ('7244', '黄荣', '10004612', '1', '24399.210', '80000.000', '000', '2925197912264673', '3', '2016-04-24', '82', '上海霞飞路203号', '2016-04-24 21:51:44', '1');
INSERT INTO `demo_account` VALUES ('7245', '赵费眺', '10004613', '1', '47082.570', '80000.000', '000', '2925192911164743', '2', '2016-04-24', '75', '上海霞飞路137号', '2016-04-24 21:51:44', '1');
INSERT INTO `demo_account` VALUES ('7246', '周刊', '10004614', '1', '56830.600', '80000.000', '000', '2925201212152573', '2', '2016-04-24', '60', '上海霞飞路911号', '2016-04-24 21:51:44', '1');
INSERT INTO `demo_account` VALUES ('7247', '刘诽祸', '10004615', '2', '49206.900', '80000.000', '000', '2925195411139423', '1', '2016-04-24', '61', '上海霞飞路177号', '2016-04-24 21:51:44', '1');
INSERT INTO `demo_account` VALUES ('7248', '张拒貌', '10004616', '1', '66203.900', '80000.000', '000', '2925195812293652', '3', '2016-04-24', '36', '上海霞飞路207号', '2016-04-24 21:51:44', '1');
INSERT INTO `demo_account` VALUES ('7249', '李狭脆', '10004617', '2', '22914.830', '80000.000', '000', '2925197312164120', '3', '2016-04-24', '98', '上海霞飞路715号', '2016-04-24 21:51:44', '1');
INSERT INTO `demo_account` VALUES ('7250', '熊惹狱', '10004618', '1', '27113.700', '80000.000', '000', '2925196911252727', '2', '2016-04-24', '61', '上海霞飞路244号', '2016-04-24 21:51:44', '1');
INSERT INTO `demo_account` VALUES ('7251', '周潜瘤', '10004619', '2', '34790.430', '80000.000', '000', '2925197011246547', '2', '2016-04-24', '39', '上海霞飞路994号', '2016-04-24 21:51:44', '1');
INSERT INTO `demo_account` VALUES ('7252', '段砧文', '10004620', '1', '39728.570', '80000.000', '000', '2925200511304025', '2', '2016-04-24', '38', '上海霞飞路98号', '2016-04-24 21:51:44', '1');
INSERT INTO `demo_account` VALUES ('7253', '段平事', '10004621', '2', '19007.510', '80000.000', '000', '2925201411129624', '2', '2016-04-24', '30', '上海霞飞路940号', '2016-04-24 21:51:44', '1');
INSERT INTO `demo_account` VALUES ('7254', '赵礁', '10004622', '1', '22720.260', '80000.000', '000', '2925192212278211', '1', '2016-04-24', '94', '上海霞飞路209号', '2016-04-24 21:51:45', '1');
INSERT INTO `demo_account` VALUES ('7255', '赵眺糜', '10004623', '1', '73321.640', '80000.000', '000', '2925195412129345', '1', '2016-04-24', '85', '上海霞飞路906号', '2016-04-24 21:51:45', '1');
INSERT INTO `demo_account` VALUES ('7256', '黄锑', '10004624', '1', '35870.850', '80000.000', '000', '2925200511152474', '1', '2016-04-24', '63', '上海霞飞路563号', '2016-04-24 21:51:45', '1');
INSERT INTO `demo_account` VALUES ('7257', '段螺', '10004625', '1', '76880.330', '80000.000', '000', '2925196812225860', '2', '2016-04-24', '95', '上海霞飞路361号', '2016-04-24 21:51:45', '1');
INSERT INTO `demo_account` VALUES ('7258', '周蹭', '10004626', '1', '8742.620', '80000.000', '000', '2925196511164812', '1', '2016-04-24', '38', '上海霞飞路853号', '2016-04-24 21:51:45', '1');
INSERT INTO `demo_account` VALUES ('7259', '刘耪', '10004627', '1', '42493.330', '80000.000', '000', '2925200310287576', '1', '2016-04-24', '76', '上海霞飞路365号', '2016-04-24 21:51:45', '1');
INSERT INTO `demo_account` VALUES ('7260', '黄显肖', '10004628', '1', '38332.270', '80000.000', '000', '2925201311238941', '1', '2016-04-24', '92', '上海霞飞路46号', '2016-04-24 21:51:45', '1');
INSERT INTO `demo_account` VALUES ('7261', '郤脖', '10004629', '2', '44499.130', '80000.000', '000', '2925199212277282', '2', '2016-04-24', '93', '上海霞飞路925号', '2016-04-24 21:51:45', '1');
INSERT INTO `demo_account` VALUES ('7262', '毛讼', '10004630', '1', '69074.600', '80000.000', '000', '2925195912222462', '1', '2016-04-24', '62', '上海霞飞路106号', '2016-04-24 21:51:45', '1');
INSERT INTO `demo_account` VALUES ('7263', '周鉴', '10004631', '2', '61901.420', '80000.000', '000', '2925200110219579', '3', '2016-04-24', '29', '上海霞飞路574号', '2016-04-24 21:51:45', '1');
INSERT INTO `demo_account` VALUES ('7264', '毛她巢', '10004632', '1', '7128.460', '80000.000', '000', '2925193110268192', '2', '2016-04-24', '27', '上海霞飞路822号', '2016-04-24 21:51:45', '1');
INSERT INTO `demo_account` VALUES ('7265', '黄狠含', '10004633', '1', '20892.840', '80000.000', '000', '2925193911242160', '1', '2016-04-24', '80', '上海霞飞路746号', '2016-04-24 21:51:45', '1');
INSERT INTO `demo_account` VALUES ('7266', '黄阔佯', '10004634', '1', '7320.800', '80000.000', '000', '2925192912221822', '2', '2016-04-24', '35', '上海霞飞路953号', '2016-04-24 21:51:46', '1');
INSERT INTO `demo_account` VALUES ('7267', '赵醛清', '10004635', '2', '43443.340', '80000.000', '000', '2925194012188684', '2', '2016-04-24', '41', '上海霞飞路810号', '2016-04-24 21:51:46', '1');
INSERT INTO `demo_account` VALUES ('7268', '赵恬', '10004636', '1', '23651.860', '80000.000', '000', '2925195511222284', '2', '2016-04-24', '63', '上海霞飞路165号', '2016-04-24 21:51:46', '1');
INSERT INTO `demo_account` VALUES ('7269', '刘及', '10004637', '1', '39082.840', '80000.000', '000', '2925195812133311', '1', '2016-04-24', '45', '上海霞飞路834号', '2016-04-24 21:51:46', '1');
INSERT INTO `demo_account` VALUES ('7270', '刘比饱', '10004638', '2', '26773.200', '80000.000', '000', '2925198211143501', '2', '2016-04-24', '51', '上海霞飞路461号', '2016-04-24 21:51:46', '1');
INSERT INTO `demo_account` VALUES ('7271', '段予', '10004639', '2', '15533.260', '80000.000', '000', '2925192411169139', '3', '2016-04-24', '19', '上海霞飞路436号', '2016-04-24 21:51:46', '1');
INSERT INTO `demo_account` VALUES ('7272', '郤懂', '10004640', '1', '16314.100', '80000.000', '000', '2925194011243413', '3', '2016-04-24', '37', '上海霞飞路87号', '2016-04-24 21:51:46', '1');
INSERT INTO `demo_account` VALUES ('7273', '张爸浅', '10004641', '1', '60339.880', '80000.000', '000', '2925199611193101', '2', '2016-04-24', '90', '上海霞飞路285号', '2016-04-24 21:51:46', '1');
INSERT INTO `demo_account` VALUES ('7274', '赵掺', '10004642', '2', '10472.120', '80000.000', '000', '2925196911191422', '1', '2016-04-24', '50', '上海霞飞路114号', '2016-04-24 21:51:46', '1');
INSERT INTO `demo_account` VALUES ('7275', '段骄泪', '10004643', '2', '74143.750', '80000.000', '000', '2925192710268066', '1', '2016-04-24', '53', '上海霞飞路131号', '2016-04-24 21:51:46', '1');
INSERT INTO `demo_account` VALUES ('7276', '刘讲', '10004644', '1', '65762.730', '80000.000', '000', '2925192811228675', '3', '2016-04-24', '56', '上海霞飞路164号', '2016-04-24 21:51:46', '1');
INSERT INTO `demo_account` VALUES ('7277', '郤嫁讽', '10004645', '2', '20754.440', '80000.000', '000', '2925198112198215', '2', '2016-04-24', '90', '上海霞飞路415号', '2016-04-24 21:51:46', '1');
INSERT INTO `demo_account` VALUES ('7278', '毛滩', '10004646', '1', '28320.790', '80000.000', '000', '2925199911169831', '1', '2016-04-24', '65', '上海霞飞路2号', '2016-04-24 21:51:47', '1');
INSERT INTO `demo_account` VALUES ('7279', '郤掸驼', '10004647', '1', '71658.530', '80000.000', '000', '2925199710249921', '2', '2016-04-24', '91', '上海霞飞路824号', '2016-04-24 21:51:47', '1');
INSERT INTO `demo_account` VALUES ('7280', '郤倦翰', '10004648', '1', '68658.850', '80000.000', '000', '2925196712206206', '3', '2016-04-24', '96', '上海霞飞路946号', '2016-04-24 21:51:47', '1');
INSERT INTO `demo_account` VALUES ('7281', '张职', '10004649', '2', '41128.620', '80000.000', '000', '2925194211285701', '2', '2016-04-24', '28', '上海霞飞路371号', '2016-04-24 21:51:47', '1');
INSERT INTO `demo_account` VALUES ('7282', '李志深', '10004650', '1', '36277.430', '80000.000', '000', '2925194210232459', '1', '2016-04-24', '54', '上海霞飞路328号', '2016-04-24 21:51:47', '1');
INSERT INTO `demo_account` VALUES ('7283', '熊粮', '10004651', '1', '42556.570', '80000.000', '000', '2925200711265990', '3', '2016-04-24', '21', '上海霞飞路836号', '2016-04-24 21:51:47', '1');
INSERT INTO `demo_account` VALUES ('7284', '黄降叙', '10004652', '2', '55027.600', '80000.000', '000', '2925195012258220', '2', '2016-04-24', '72', '上海霞飞路447号', '2016-04-24 21:51:47', '1');
INSERT INTO `demo_account` VALUES ('7285', '郤捍', '10004653', '2', '23191.450', '80000.000', '000', '2925195212288779', '1', '2016-04-24', '49', '上海霞飞路679号', '2016-04-24 21:51:47', '1');
INSERT INTO `demo_account` VALUES ('7286', '毛橱', '10004654', '1', '62621.430', '80000.000', '000', '2925196911302311', '3', '2016-04-24', '33', '上海霞飞路753号', '2016-04-24 21:51:47', '1');
INSERT INTO `demo_account` VALUES ('7287', '黄蹲捧', '10004655', '1', '70904.310', '80000.000', '000', '2925196211134392', '1', '2016-04-24', '23', '上海霞飞路727号', '2016-04-24 21:51:47', '1');
INSERT INTO `demo_account` VALUES ('7288', '郤匹与', '10004656', '2', '12188.280', '80000.000', '000', '2925198911167450', '3', '2016-04-24', '92', '上海霞飞路212号', '2016-04-24 21:51:47', '1');
INSERT INTO `demo_account` VALUES ('7289', '赵醋诽', '10004657', '1', '75135.810', '80000.000', '000', '2925193012176919', '2', '2016-04-24', '51', '上海霞飞路266号', '2016-04-24 21:51:47', '1');
INSERT INTO `demo_account` VALUES ('7290', '刘晒店', '10004658', '2', '30283.700', '80000.000', '000', '2925198812172619', '2', '2016-04-24', '42', '上海霞飞路69号', '2016-04-24 21:51:48', '1');
INSERT INTO `demo_account` VALUES ('7291', '赵察嗓', '10004659', '1', '6681.280', '80000.000', '000', '2925194711237106', '2', '2016-04-24', '27', '上海霞飞路349号', '2016-04-24 21:51:48', '1');
INSERT INTO `demo_account` VALUES ('7292', '黄早', '10004660', '2', '66237.980', '80000.000', '000', '2925194710165469', '3', '2016-04-24', '51', '上海霞飞路476号', '2016-04-24 21:51:48', '1');
INSERT INTO `demo_account` VALUES ('7293', '段观女', '10004661', '1', '27463.680', '80000.000', '000', '2925200810254695', '2', '2016-04-24', '49', '上海霞飞路424号', '2016-04-24 21:51:48', '1');
INSERT INTO `demo_account` VALUES ('7294', '熊绅', '10004662', '1', '66249.390', '80000.000', '000', '2925192412282429', '3', '2016-04-24', '79', '上海霞飞路706号', '2016-04-24 21:51:48', '1');
INSERT INTO `demo_account` VALUES ('7295', '赵耿', '10004663', '2', '29916.750', '80000.000', '000', '2925195911221525', '3', '2016-04-24', '94', '上海霞飞路613号', '2016-04-24 21:51:48', '1');
INSERT INTO `demo_account` VALUES ('7296', '李惑蓬', '10004664', '2', '22120.230', '80000.000', '000', '2925198111119420', '3', '2016-04-24', '55', '上海霞飞路898号', '2016-04-24 21:51:48', '1');
INSERT INTO `demo_account` VALUES ('7297', '段扯', '10004665', '1', '74170.700', '80000.000', '000', '2925200812249898', '2', '2016-04-24', '85', '上海霞飞路243号', '2016-04-24 21:51:48', '1');
INSERT INTO `demo_account` VALUES ('7298', '刘庭', '10004666', '2', '77032.220', '80000.000', '000', '2925194410248330', '2', '2016-04-24', '35', '上海霞飞路575号', '2016-04-24 21:51:48', '1');
INSERT INTO `demo_account` VALUES ('7299', '周嫉辣', '10004667', '1', '27646.880', '80000.000', '000', '2925195411127009', '3', '2016-04-24', '66', '上海霞飞路454号', '2016-04-24 21:51:48', '1');
INSERT INTO `demo_account` VALUES ('7300', '张汾', '10004668', '1', '75259.900', '80000.000', '000', '2925196112131635', '2', '2016-04-24', '20', '上海霞飞路378号', '2016-04-24 21:51:48', '1');
INSERT INTO `demo_account` VALUES ('7301', '赵庶', '10004669', '1', '60234.170', '80000.000', '000', '2925195212252433', '3', '2016-04-24', '89', '上海霞飞路992号', '2016-04-24 21:51:48', '1');
INSERT INTO `demo_account` VALUES ('7302', '李饺灭', '10004670', '1', '33219.800', '80000.000', '000', '2925200711166840', '2', '2016-04-24', '84', '上海霞飞路737号', '2016-04-24 21:51:48', '1');
INSERT INTO `demo_account` VALUES ('7303', '李挥翘', '10004671', '1', '40696.810', '80000.000', '000', '2925197010209987', '2', '2016-04-24', '59', '上海霞飞路510号', '2016-04-24 21:51:49', '1');
INSERT INTO `demo_account` VALUES ('7304', '段惶', '10004672', '2', '67760.910', '80000.000', '000', '2925199211273638', '3', '2016-04-24', '28', '上海霞飞路457号', '2016-04-24 21:51:49', '1');
INSERT INTO `demo_account` VALUES ('7305', '黄壹万', '10004673', '2', '42434.320', '80000.000', '000', '2925197012165468', '2', '2016-04-24', '98', '上海霞飞路969号', '2016-04-24 21:51:49', '1');
INSERT INTO `demo_account` VALUES ('7306', '段刊', '10004674', '2', '38080.790', '80000.000', '000', '2925192211201919', '1', '2016-04-24', '95', '上海霞飞路406号', '2016-04-24 21:51:49', '1');
INSERT INTO `demo_account` VALUES ('7307', '张级', '10004675', '2', '41284.240', '80000.000', '000', '2925198711138049', '1', '2016-04-24', '57', '上海霞飞路3号', '2016-04-24 21:51:49', '1');
INSERT INTO `demo_account` VALUES ('7308', '李靖顷', '10004676', '1', '64184.300', '80000.000', '000', '2925200011195064', '2', '2016-04-24', '93', '上海霞飞路800号', '2016-04-24 21:51:49', '1');
INSERT INTO `demo_account` VALUES ('7309', '熊碱', '10004677', '2', '14480.160', '80000.000', '000', '2925201210172369', '1', '2016-04-24', '31', '上海霞飞路291号', '2016-04-24 21:51:49', '1');
INSERT INTO `demo_account` VALUES ('7310', '李博', '10004678', '1', '69259.950', '80000.000', '000', '2925197311225144', '2', '2016-04-24', '74', '上海霞飞路783号', '2016-04-24 21:51:49', '1');
INSERT INTO `demo_account` VALUES ('7311', '郤蝉认', '10004679', '2', '40434.900', '80000.000', '000', '2925195412245578', '1', '2016-04-24', '29', '上海霞飞路330号', '2016-04-24 21:51:49', '1');
INSERT INTO `demo_account` VALUES ('7312', '周耶', '10004680', '1', '63895.210', '80000.000', '000', '2925195411124955', '2', '2016-04-24', '37', '上海霞飞路261号', '2016-04-24 21:51:49', '1');
INSERT INTO `demo_account` VALUES ('7313', '段厢宇', '10004681', '2', '17476.520', '80000.000', '000', '2925199010259891', '3', '2016-04-24', '57', '上海霞飞路154号', '2016-04-24 21:51:49', '1');
INSERT INTO `demo_account` VALUES ('7314', '熊妖', '10004682', '1', '22521.900', '80000.000', '000', '2925196211181017', '2', '2016-04-24', '33', '上海霞飞路228号', '2016-04-24 21:51:49', '1');
INSERT INTO `demo_account` VALUES ('7315', '郤侥讥', '10004683', '1', '44223.530', '80000.000', '000', '2925194312191394', '2', '2016-04-24', '38', '上海霞飞路862号', '2016-04-24 21:51:49', '1');
INSERT INTO `demo_account` VALUES ('7316', '李优', '10004684', '1', '70972.560', '80000.000', '000', '2925200011237955', '1', '2016-04-24', '82', '上海霞飞路25号', '2016-04-24 21:51:50', '1');
INSERT INTO `demo_account` VALUES ('7317', '郤堕危', '10004685', '2', '6691.570', '80000.000', '000', '2925192611126153', '1', '2016-04-24', '29', '上海霞飞路49号', '2016-04-24 21:51:50', '1');
INSERT INTO `demo_account` VALUES ('7318', '毛摔', '10004686', '1', '20582.600', '80000.000', '000', '2925194912128917', '2', '2016-04-24', '70', '上海霞飞路256号', '2016-04-24 21:51:50', '1');
INSERT INTO `demo_account` VALUES ('7319', '毛及', '10004687', '2', '43839.600', '80000.000', '000', '2925199311158912', '3', '2016-04-24', '62', '上海霞飞路449号', '2016-04-24 21:51:50', '1');
INSERT INTO `demo_account` VALUES ('7320', '赵弥芭', '10004688', '2', '40695.260', '80000.000', '000', '2925199711106905', '3', '2016-04-24', '81', '上海霞飞路338号', '2016-04-24 21:51:50', '1');
INSERT INTO `demo_account` VALUES ('7321', '黄都', '10004689', '2', '29656.670', '80000.000', '000', '2925195311125866', '2', '2016-04-24', '85', '上海霞飞路430号', '2016-04-24 21:51:50', '1');
INSERT INTO `demo_account` VALUES ('7322', '周懒', '10004690', '2', '62003.200', '80000.000', '000', '2925199412163211', '2', '2016-04-24', '45', '上海霞飞路869号', '2016-04-24 21:51:50', '1');
INSERT INTO `demo_account` VALUES ('7323', '张扭赞', '10004691', '2', '76466.800', '80000.000', '000', '2925197311245337', '3', '2016-04-24', '49', '上海霞飞路126号', '2016-04-24 21:51:50', '1');
INSERT INTO `demo_account` VALUES ('7324', '周厉缺', '10004692', '2', '35599.660', '80000.000', '000', '2925201212151325', '3', '2016-04-24', '34', '上海霞飞路319号', '2016-04-24 21:51:50', '1');
INSERT INTO `demo_account` VALUES ('7325', '黄坚', '10004693', '1', '12583.520', '80000.000', '000', '2925194410238343', '1', '2016-04-24', '70', '上海霞飞路340号', '2016-04-24 21:51:50', '1');
INSERT INTO `demo_account` VALUES ('7326', '李逾鸿', '10004694', '1', '9155.260', '80000.000', '000', '2925197411261989', '3', '2016-04-24', '32', '上海霞飞路720号', '2016-04-24 21:51:50', '1');
INSERT INTO `demo_account` VALUES ('7327', '段次', '10004695', '1', '23980.420', '80000.000', '000', '2925200311193357', '2', '2016-04-24', '96', '上海霞飞路534号', '2016-04-24 21:51:50', '1');
INSERT INTO `demo_account` VALUES ('7328', '张撂知', '10004696', '1', '36104.260', '80000.000', '000', '2925192910172292', '1', '2016-04-24', '64', '上海霞飞路351号', '2016-04-24 21:51:51', '1');
INSERT INTO `demo_account` VALUES ('7329', '张柔', '10004697', '2', '6100.990', '80000.000', '000', '2925194511162773', '2', '2016-04-24', '46', '上海霞飞路499号', '2016-04-24 21:51:51', '1');
INSERT INTO `demo_account` VALUES ('7330', '赵万灶', '10004698', '2', '26255.270', '80000.000', '000', '2925201310234956', '3', '2016-04-24', '50', '上海霞飞路609号', '2016-04-24 21:51:51', '1');
INSERT INTO `demo_account` VALUES ('7331', '赵忌', '10004699', '1', '74478.410', '80000.000', '000', '2925194911176867', '3', '2016-04-24', '42', '上海霞飞路552号', '2016-04-24 21:51:51', '1');
INSERT INTO `demo_account` VALUES ('7332', '郤霓丛', '10004700', '1', '34705.200', '80000.000', '000', '2925192612251222', '1', '2016-04-24', '46', '上海霞飞路552号', '2016-04-24 21:51:51', '1');
INSERT INTO `demo_account` VALUES ('7333', '赵道', '10004701', '2', '39309.210', '80000.000', '000', '2925195211238267', '1', '2016-04-24', '28', '上海霞飞路343号', '2016-04-24 21:51:51', '1');
INSERT INTO `demo_account` VALUES ('7334', '熊骑', '10004702', '2', '24473.900', '80000.000', '000', '2925195210259973', '2', '2016-04-24', '68', '上海霞飞路809号', '2016-04-24 21:51:51', '1');
INSERT INTO `demo_account` VALUES ('7335', '毛态好', '10004703', '2', '33615.830', '80000.000', '000', '2925193211148219', '2', '2016-04-24', '79', '上海霞飞路618号', '2016-04-24 21:51:51', '1');
INSERT INTO `demo_account` VALUES ('7336', '李秉', '10004704', '1', '6742.550', '80000.000', '000', '2925197211226030', '1', '2016-04-24', '76', '上海霞飞路836号', '2016-04-24 21:51:51', '1');
INSERT INTO `demo_account` VALUES ('7337', '周净', '10004705', '2', '63162.420', '80000.000', '000', '2925201110269173', '2', '2016-04-24', '70', '上海霞飞路521号', '2016-04-24 21:51:51', '1');
INSERT INTO `demo_account` VALUES ('7338', '郤罕渔', '10004706', '2', '75107.330', '80000.000', '000', '2925199212234726', '2', '2016-04-24', '35', '上海霞飞路727号', '2016-04-24 21:51:51', '1');
INSERT INTO `demo_account` VALUES ('7339', '郤三街', '10004707', '2', '38768.500', '80000.000', '000', '2925192611234472', '2', '2016-04-24', '54', '上海霞飞路278号', '2016-04-24 21:51:51', '1');
INSERT INTO `demo_account` VALUES ('7340', '张袭缕', '10004708', '1', '16736.710', '80000.000', '000', '2925199111245201', '1', '2016-04-24', '26', '上海霞飞路48号', '2016-04-24 21:51:52', '1');
INSERT INTO `demo_account` VALUES ('7341', '刘元捧', '10004709', '1', '20162.100', '80000.000', '000', '2925195611126157', '1', '2016-04-24', '71', '上海霞飞路355号', '2016-04-24 21:51:52', '1');
INSERT INTO `demo_account` VALUES ('7342', '黄顾', '10004710', '1', '51831.400', '80000.000', '000', '2925200411181054', '1', '2016-04-24', '96', '上海霞飞路397号', '2016-04-24 21:51:52', '1');
INSERT INTO `demo_account` VALUES ('7343', '赵益蹈', '10004711', '1', '49024.740', '80000.000', '000', '2925198510241184', '3', '2016-04-24', '22', '上海霞飞路428号', '2016-04-24 21:51:52', '1');
INSERT INTO `demo_account` VALUES ('7344', '刘鸵务', '10004712', '2', '53297.940', '80000.000', '000', '2925200912108243', '3', '2016-04-24', '29', '上海霞飞路683号', '2016-04-24 21:51:52', '1');
INSERT INTO `demo_account` VALUES ('7345', '黄盔订', '10004713', '2', '77379.350', '80000.000', '000', '2925193712217560', '2', '2016-04-24', '99', '上海霞飞路749号', '2016-04-24 21:51:52', '1');
INSERT INTO `demo_account` VALUES ('7346', '毛渡隶', '10004714', '2', '19011.540', '80000.000', '000', '2925200910118416', '1', '2016-04-24', '95', '上海霞飞路300号', '2016-04-24 21:51:52', '1');
INSERT INTO `demo_account` VALUES ('7347', '黄蹋', '10004715', '2', '71974.350', '80000.000', '000', '2925194211298202', '2', '2016-04-24', '72', '上海霞飞路767号', '2016-04-24 21:51:52', '1');
INSERT INTO `demo_account` VALUES ('7348', '赵纷督', '10004716', '2', '73597.150', '80000.000', '000', '2925192011145041', '1', '2016-04-24', '37', '上海霞飞路694号', '2016-04-24 21:51:52', '1');
INSERT INTO `demo_account` VALUES ('7349', '段棚', '10004717', '1', '23790.810', '80000.000', '000', '2925192211281518', '2', '2016-04-24', '100', '上海霞飞路62号', '2016-04-24 21:51:52', '1');
INSERT INTO `demo_account` VALUES ('7350', '郤堂', '10004718', '2', '71093.140', '80000.000', '000', '2925199010185007', '2', '2016-04-24', '94', '上海霞飞路22号', '2016-04-24 21:51:52', '1');
INSERT INTO `demo_account` VALUES ('7351', '张苑堂', '10004719', '1', '54346.620', '80000.000', '000', '2925192412134996', '2', '2016-04-24', '86', '上海霞飞路962号', '2016-04-24 21:51:52', '1');
INSERT INTO `demo_account` VALUES ('7352', '周陶', '10004720', '2', '72423.250', '80000.000', '000', '2925198912181604', '1', '2016-04-24', '66', '上海霞飞路869号', '2016-04-24 21:51:52', '1');
INSERT INTO `demo_account` VALUES ('7353', '赵量烫', '10004721', '2', '14936.580', '80000.000', '000', '2925199911133355', '3', '2016-04-24', '42', '上海霞飞路427号', '2016-04-24 21:51:53', '1');
INSERT INTO `demo_account` VALUES ('7354', '周淌堰', '10004722', '1', '30060.290', '80000.000', '000', '2925192610211007', '3', '2016-04-24', '80', '上海霞飞路243号', '2016-04-24 21:51:53', '1');
INSERT INTO `demo_account` VALUES ('7355', '赵盛妨', '10004723', '2', '65445.750', '80000.000', '000', '2925195612295985', '1', '2016-04-24', '85', '上海霞飞路12号', '2016-04-24 21:51:53', '1');
INSERT INTO `demo_account` VALUES ('7356', '段瞥绑', '10004724', '2', '64791.260', '80000.000', '000', '2925193311161706', '2', '2016-04-24', '96', '上海霞飞路304号', '2016-04-24 21:51:53', '1');
INSERT INTO `demo_account` VALUES ('7357', '张哀', '10004725', '2', '37903.640', '80000.000', '000', '2925192211242750', '2', '2016-04-24', '30', '上海霞飞路45号', '2016-04-24 21:51:53', '1');
INSERT INTO `demo_account` VALUES ('7358', '段厨', '10004726', '1', '73963.160', '80000.000', '000', '2925200711199488', '3', '2016-04-24', '48', '上海霞飞路554号', '2016-04-24 21:51:53', '1');
INSERT INTO `demo_account` VALUES ('7359', '熊仁', '10004727', '2', '70415.340', '80000.000', '000', '2925200810115403', '2', '2016-04-24', '24', '上海霞飞路320号', '2016-04-24 21:51:53', '1');
INSERT INTO `demo_account` VALUES ('7360', '黄炕鞋', '10004728', '1', '19137.130', '80000.000', '000', '2925197511181924', '2', '2016-04-24', '76', '上海霞飞路444号', '2016-04-24 21:51:53', '1');
INSERT INTO `demo_account` VALUES ('7361', '段阜于', '10004729', '2', '57620.570', '80000.000', '000', '2925194210144160', '2', '2016-04-24', '21', '上海霞飞路918号', '2016-04-24 21:51:53', '1');
INSERT INTO `demo_account` VALUES ('7362', '毛锻柴', '10004730', '2', '39515.670', '80000.000', '000', '2925194111181460', '2', '2016-04-24', '83', '上海霞飞路611号', '2016-04-24 21:51:53', '1');
INSERT INTO `demo_account` VALUES ('7363', '郤倘', '10004731', '1', '70328.320', '80000.000', '000', '2925198212254181', '2', '2016-04-24', '73', '上海霞飞路982号', '2016-04-24 21:51:53', '1');
INSERT INTO `demo_account` VALUES ('7364', '周蚜蜕', '10004732', '2', '74072.970', '80000.000', '000', '2925200510154566', '1', '2016-04-24', '77', '上海霞飞路220号', '2016-04-24 21:51:53', '1');
INSERT INTO `demo_account` VALUES ('7365', '黄贯', '10004733', '2', '67480.510', '80000.000', '000', '2925192811253028', '3', '2016-04-24', '93', '上海霞飞路552号', '2016-04-24 21:51:53', '1');
INSERT INTO `demo_account` VALUES ('7366', '段瞬魂', '10004734', '2', '25762.770', '80000.000', '000', '2925195412202557', '2', '2016-04-24', '81', '上海霞飞路118号', '2016-04-24 21:51:53', '1');
INSERT INTO `demo_account` VALUES ('7367', '张沂', '10004735', '2', '54086.850', '80000.000', '000', '2925195612206337', '2', '2016-04-24', '42', '上海霞飞路773号', '2016-04-24 21:51:54', '1');
INSERT INTO `demo_account` VALUES ('7368', '黄悟', '10004736', '2', '39716.180', '80000.000', '000', '2925193911148001', '1', '2016-04-24', '58', '上海霞飞路759号', '2016-04-24 21:51:54', '1');
INSERT INTO `demo_account` VALUES ('7369', '黄事比', '10004737', '2', '7280.890', '80000.000', '000', '2925196612101253', '2', '2016-04-24', '68', '上海霞飞路107号', '2016-04-24 21:51:54', '1');
INSERT INTO `demo_account` VALUES ('7370', '周敲桅', '10004738', '2', '41822.300', '80000.000', '000', '2925193410142878', '2', '2016-04-24', '47', '上海霞飞路141号', '2016-04-24 21:51:54', '1');
INSERT INTO `demo_account` VALUES ('7371', '周酣', '10004739', '1', '21149.790', '80000.000', '000', '2925197711207401', '1', '2016-04-24', '97', '上海霞飞路338号', '2016-04-24 21:51:54', '1');
INSERT INTO `demo_account` VALUES ('7372', '刘碑', '10004740', '2', '70590.860', '80000.000', '000', '2925200610165871', '3', '2016-04-24', '33', '上海霞飞路178号', '2016-04-24 21:51:54', '1');
INSERT INTO `demo_account` VALUES ('7373', '张就买', '10004741', '2', '29481.470', '80000.000', '000', '2925200611193424', '3', '2016-04-24', '93', '上海霞飞路510号', '2016-04-24 21:51:54', '1');
INSERT INTO `demo_account` VALUES ('7374', '李沦拂', '10004742', '2', '67693.880', '80000.000', '000', '2925198411188460', '2', '2016-04-24', '29', '上海霞飞路261号', '2016-04-24 21:51:54', '1');
INSERT INTO `demo_account` VALUES ('7375', '张漳粉', '10004743', '2', '38078.800', '80000.000', '000', '2925193512246351', '3', '2016-04-24', '43', '上海霞飞路99号', '2016-04-24 21:51:54', '1');
INSERT INTO `demo_account` VALUES ('7376', '郤偏', '10004744', '2', '31092.210', '80000.000', '000', '2925194710138711', '2', '2016-04-24', '89', '上海霞飞路957号', '2016-04-24 21:51:54', '1');
INSERT INTO `demo_account` VALUES ('7377', '李拼举', '10004745', '2', '40789.960', '80000.000', '000', '2925194012247339', '3', '2016-04-24', '90', '上海霞飞路29号', '2016-04-24 21:51:54', '1');
INSERT INTO `demo_account` VALUES ('7378', '刘巾四', '10004746', '1', '47134.530', '80000.000', '000', '2925197311124911', '2', '2016-04-24', '52', '上海霞飞路50号', '2016-04-24 21:51:54', '1');
INSERT INTO `demo_account` VALUES ('7379', '周吧', '10004747', '1', '69902.590', '80000.000', '000', '2925193110289565', '1', '2016-04-24', '82', '上海霞飞路367号', '2016-04-24 21:51:54', '1');
INSERT INTO `demo_account` VALUES ('7380', '赵纫清', '10004748', '2', '32533.120', '80000.000', '000', '2925194812172459', '1', '2016-04-24', '65', '上海霞飞路407号', '2016-04-24 21:51:54', '1');
INSERT INTO `demo_account` VALUES ('7381', '毛腾', '10004749', '2', '36055.500', '80000.000', '000', '2925196811262279', '2', '2016-04-24', '77', '上海霞飞路789号', '2016-04-24 21:51:55', '1');
INSERT INTO `demo_account` VALUES ('7382', '黄己拧', '10004750', '2', '71615.350', '80000.000', '000', '2925192911178665', '3', '2016-04-24', '22', '上海霞飞路381号', '2016-04-24 21:51:55', '1');
INSERT INTO `demo_account` VALUES ('7383', '熊汁瘫', '10004751', '1', '67303.100', '80000.000', '000', '2925195610274308', '1', '2016-04-24', '33', '上海霞飞路154号', '2016-04-24 21:51:55', '1');
INSERT INTO `demo_account` VALUES ('7384', '熊靡粟', '10004752', '2', '32748.820', '80000.000', '000', '2925200410251351', '3', '2016-04-24', '73', '上海霞飞路700号', '2016-04-24 21:51:55', '1');
INSERT INTO `demo_account` VALUES ('7385', '毛建珊', '10004753', '2', '77497.200', '80000.000', '000', '2925196411306552', '2', '2016-04-24', '98', '上海霞飞路766号', '2016-04-24 21:51:55', '1');
INSERT INTO `demo_account` VALUES ('7386', '赵挥', '10004754', '1', '52335.770', '80000.000', '000', '2925199212273409', '3', '2016-04-24', '40', '上海霞飞路79号', '2016-04-24 21:51:55', '1');
INSERT INTO `demo_account` VALUES ('7387', '段箍础', '10004755', '2', '50624.560', '80000.000', '000', '2925198711225215', '2', '2016-04-24', '37', '上海霞飞路199号', '2016-04-24 21:51:55', '1');
INSERT INTO `demo_account` VALUES ('7388', '李樊', '10004756', '1', '15279.740', '80000.000', '000', '2925197910181729', '1', '2016-04-24', '26', '上海霞飞路998号', '2016-04-24 21:51:55', '1');
INSERT INTO `demo_account` VALUES ('7389', '赵票', '10004757', '1', '30246.750', '80000.000', '000', '2925199210114825', '3', '2016-04-24', '42', '上海霞飞路718号', '2016-04-24 21:51:55', '1');
INSERT INTO `demo_account` VALUES ('7390', '毛防鲸', '10004758', '2', '27316.400', '80000.000', '000', '2925198611299132', '2', '2016-04-24', '20', '上海霞飞路389号', '2016-04-24 21:51:55', '1');
INSERT INTO `demo_account` VALUES ('7391', '周膳渡', '10004759', '2', '79698.540', '80000.000', '000', '2925195212187317', '3', '2016-04-24', '58', '上海霞飞路700号', '2016-04-24 21:51:55', '1');
INSERT INTO `demo_account` VALUES ('7392', '周街', '10004760', '2', '45119.290', '80000.000', '000', '2925200111303227', '3', '2016-04-24', '78', '上海霞飞路156号', '2016-04-24 21:51:55', '1');
INSERT INTO `demo_account` VALUES ('7393', '熊舶', '10004761', '1', '53198.350', '80000.000', '000', '2925200712305697', '2', '2016-04-24', '50', '上海霞飞路586号', '2016-04-24 21:51:55', '1');
INSERT INTO `demo_account` VALUES ('7394', '黄朔叉', '10004762', '2', '30559.150', '80000.000', '000', '2925196412259330', '2', '2016-04-24', '61', '上海霞飞路790号', '2016-04-24 21:51:55', '1');
INSERT INTO `demo_account` VALUES ('7395', '李抽', '10004763', '2', '72490.400', '80000.000', '000', '2925192211273072', '3', '2016-04-24', '38', '上海霞飞路251号', '2016-04-24 21:51:55', '1');
INSERT INTO `demo_account` VALUES ('7396', '周螟啊', '10004764', '2', '16040.980', '80000.000', '000', '2925192211192860', '2', '2016-04-24', '83', '上海霞飞路505号', '2016-04-24 21:51:56', '1');
INSERT INTO `demo_account` VALUES ('7397', '赵牡宇', '10004765', '2', '32207.200', '80000.000', '000', '2925194312288066', '2', '2016-04-24', '75', '上海霞飞路847号', '2016-04-24 21:51:56', '1');
INSERT INTO `demo_account` VALUES ('7398', '郤因淘', '10004766', '2', '78282.600', '80000.000', '000', '2925200111181852', '2', '2016-04-24', '26', '上海霞飞路633号', '2016-04-24 21:51:56', '1');
INSERT INTO `demo_account` VALUES ('7399', '熊胁忻', '10004767', '1', '27567.290', '80000.000', '000', '2925198510154918', '3', '2016-04-24', '83', '上海霞飞路486号', '2016-04-24 21:51:56', '1');
INSERT INTO `demo_account` VALUES ('7400', '郤除', '10004768', '2', '14481.520', '80000.000', '000', '2925198611262504', '1', '2016-04-24', '43', '上海霞飞路229号', '2016-04-24 21:51:56', '1');
INSERT INTO `demo_account` VALUES ('7401', '周劈', '10004769', '1', '64580.760', '80000.000', '000', '2925194811246754', '1', '2016-04-24', '34', '上海霞飞路328号', '2016-04-24 21:51:56', '1');
INSERT INTO `demo_account` VALUES ('7402', '周铡剃', '10004770', '1', '13213.370', '80000.000', '000', '2925200711116891', '3', '2016-04-24', '46', '上海霞飞路113号', '2016-04-24 21:51:56', '1');
INSERT INTO `demo_account` VALUES ('7403', '郤赛趁', '10004771', '2', '21387.140', '80000.000', '000', '2925197111215852', '1', '2016-04-24', '76', '上海霞飞路933号', '2016-04-24 21:51:56', '1');
INSERT INTO `demo_account` VALUES ('7404', '刘血', '10004772', '1', '79009.500', '80000.000', '000', '2925198012287274', '3', '2016-04-24', '62', '上海霞飞路805号', '2016-04-24 21:51:56', '1');
INSERT INTO `demo_account` VALUES ('7405', '李遥', '10004773', '2', '33905.220', '80000.000', '000', '2925194711285899', '2', '2016-04-24', '94', '上海霞飞路966号', '2016-04-24 21:51:56', '1');
INSERT INTO `demo_account` VALUES ('7406', '段级民', '10004774', '2', '57970.260', '80000.000', '000', '2925192112109622', '1', '2016-04-24', '70', '上海霞飞路73号', '2016-04-24 21:51:56', '1');
INSERT INTO `demo_account` VALUES ('7407', '周盐烽', '10004775', '1', '17406.330', '80000.000', '000', '2925199310178520', '1', '2016-04-24', '53', '上海霞飞路572号', '2016-04-24 21:51:56', '1');
INSERT INTO `demo_account` VALUES ('7408', '郤礼油', '10004776', '1', '58353.470', '80000.000', '000', '2925197411291294', '2', '2016-04-24', '74', '上海霞飞路47号', '2016-04-24 21:51:56', '1');
INSERT INTO `demo_account` VALUES ('7409', '毛牧', '10004777', '2', '14192.310', '80000.000', '000', '2925192811288626', '2', '2016-04-24', '73', '上海霞飞路45号', '2016-04-24 21:51:56', '1');
INSERT INTO `demo_account` VALUES ('7410', '刘馁斡', '10004778', '1', '42497.880', '80000.000', '000', '2925193911203979', '2', '2016-04-24', '85', '上海霞飞路140号', '2016-04-24 21:51:57', '1');
INSERT INTO `demo_account` VALUES ('7411', '段绊', '10004779', '1', '42006.300', '80000.000', '000', '2925198011211331', '1', '2016-04-24', '89', '上海霞飞路600号', '2016-04-24 21:51:57', '1');
INSERT INTO `demo_account` VALUES ('7412', '周毒', '10004780', '2', '49006.100', '80000.000', '000', '2925193711214358', '2', '2016-04-24', '44', '上海霞飞路209号', '2016-04-24 21:51:57', '1');
INSERT INTO `demo_account` VALUES ('7413', '张食艳', '10004781', '1', '60334.800', '80000.000', '000', '2925194410245482', '1', '2016-04-24', '37', '上海霞飞路365号', '2016-04-24 21:51:57', '1');
INSERT INTO `demo_account` VALUES ('7414', '郤苔藐', '10004782', '1', '6580.300', '80000.000', '000', '2925197411277080', '1', '2016-04-24', '52', '上海霞飞路694号', '2016-04-24 21:51:57', '1');
INSERT INTO `demo_account` VALUES ('7415', '赵祥', '10004783', '2', '24243.960', '80000.000', '000', '2925194510263087', '2', '2016-04-24', '52', '上海霞飞路905号', '2016-04-24 21:51:57', '1');
INSERT INTO `demo_account` VALUES ('7416', '毛乡哨', '10004784', '2', '43395.660', '80000.000', '000', '2925197410266999', '2', '2016-04-24', '31', '上海霞飞路691号', '2016-04-24 21:51:57', '1');
INSERT INTO `demo_account` VALUES ('7417', '赵矫', '10004785', '2', '13898.290', '80000.000', '000', '2925196410182139', '1', '2016-04-24', '24', '上海霞飞路893号', '2016-04-24 21:51:57', '1');
INSERT INTO `demo_account` VALUES ('7418', '熊措当', '10004786', '2', '68427.240', '80000.000', '000', '2925200211143800', '3', '2016-04-24', '82', '上海霞飞路170号', '2016-04-24 21:51:57', '1');
INSERT INTO `demo_account` VALUES ('7419', '段呈', '10004787', '1', '76419.300', '80000.000', '000', '2925199211309644', '2', '2016-04-24', '90', '上海霞飞路749号', '2016-04-24 21:51:57', '1');
INSERT INTO `demo_account` VALUES ('7420', '毛吉', '10004788', '1', '9626.400', '80000.000', '000', '2925201411214432', '2', '2016-04-24', '76', '上海霞飞路814号', '2016-04-24 21:51:57', '1');
INSERT INTO `demo_account` VALUES ('7421', '熊鼻朝', '10004789', '1', '27220.250', '80000.000', '000', '2925193311129868', '2', '2016-04-24', '53', '上海霞飞路352号', '2016-04-24 21:51:57', '1');
INSERT INTO `demo_account` VALUES ('7422', '李彦咬', '10004790', '1', '40324.230', '80000.000', '000', '2925193510235981', '2', '2016-04-24', '19', '上海霞飞路186号', '2016-04-24 21:51:57', '1');
INSERT INTO `demo_account` VALUES ('7423', '周念', '10004791', '2', '68469.210', '80000.000', '000', '2925192511209074', '2', '2016-04-24', '83', '上海霞飞路151号', '2016-04-24 21:51:57', '1');
INSERT INTO `demo_account` VALUES ('7424', '刘哀', '10004792', '2', '69797.200', '80000.000', '000', '2925194212297908', '3', '2016-04-24', '24', '上海霞飞路182号', '2016-04-24 21:51:58', '1');
INSERT INTO `demo_account` VALUES ('7425', '段视', '10004793', '2', '66837.410', '80000.000', '000', '2925196312193288', '2', '2016-04-24', '77', '上海霞飞路275号', '2016-04-24 21:51:58', '1');
INSERT INTO `demo_account` VALUES ('7426', '毛峪', '10004794', '1', '12355.710', '80000.000', '000', '2925199112225790', '1', '2016-04-24', '74', '上海霞飞路10号', '2016-04-24 21:51:58', '1');
INSERT INTO `demo_account` VALUES ('7427', '张减', '10004795', '2', '13169.100', '80000.000', '000', '2925192212136862', '1', '2016-04-24', '78', '上海霞飞路480号', '2016-04-24 21:51:58', '1');
INSERT INTO `demo_account` VALUES ('7428', '段梯', '10004796', '2', '73881.830', '80000.000', '000', '2925192612131961', '2', '2016-04-24', '76', '上海霞飞路122号', '2016-04-24 21:51:58', '1');
INSERT INTO `demo_account` VALUES ('7429', '熊哪跑', '10004797', '1', '61229.160', '80000.000', '000', '2925195712282873', '2', '2016-04-24', '68', '上海霞飞路17号', '2016-04-24 21:51:58', '1');
INSERT INTO `demo_account` VALUES ('7430', '赵鉴尚', '10004798', '2', '17199.520', '80000.000', '000', '2925193011117727', '1', '2016-04-24', '45', '上海霞飞路855号', '2016-04-24 21:51:58', '1');
INSERT INTO `demo_account` VALUES ('7431', '李奉', '10004799', '1', '41172.450', '80000.000', '000', '2925195512112615', '2', '2016-04-24', '20', '上海霞飞路764号', '2016-04-24 21:51:58', '1');
INSERT INTO `demo_account` VALUES ('7432', '周个学', '10004800', '2', '12182.930', '80000.000', '000', '2925195510175036', '2', '2016-04-24', '45', '上海霞飞路712号', '2016-04-24 21:51:58', '1');
INSERT INTO `demo_account` VALUES ('7433', '郤尸锦', '10004801', '1', '63884.350', '80000.000', '000', '2925195710177739', '1', '2016-04-24', '38', '上海霞飞路221号', '2016-04-24 21:51:58', '1');
INSERT INTO `demo_account` VALUES ('7434', '周唁细', '10004802', '2', '70992.210', '80000.000', '000', '2925192712308766', '2', '2016-04-24', '88', '上海霞飞路513号', '2016-04-24 21:51:58', '1');
INSERT INTO `demo_account` VALUES ('7435', '李脑焰', '10004803', '1', '76851.320', '80000.000', '000', '2925200011183792', '3', '2016-04-24', '46', '上海霞飞路190号', '2016-04-24 21:51:58', '1');
INSERT INTO `demo_account` VALUES ('7436', '黄逃霓', '10004804', '1', '45355.310', '80000.000', '000', '2925196610264031', '2', '2016-04-24', '79', '上海霞飞路887号', '2016-04-24 21:51:58', '1');
INSERT INTO `demo_account` VALUES ('7437', '张娃渝', '10004805', '1', '24684.120', '80000.000', '000', '2925200710208198', '3', '2016-04-24', '28', '上海霞飞路244号', '2016-04-24 21:51:58', '1');
INSERT INTO `demo_account` VALUES ('7438', '李悲', '10004806', '2', '35261.840', '80000.000', '000', '2925193011143153', '1', '2016-04-24', '58', '上海霞飞路805号', '2016-04-24 21:51:58', '1');
INSERT INTO `demo_account` VALUES ('7439', '郤减陪', '10004807', '1', '65974.370', '80000.000', '000', '2925193210308956', '2', '2016-04-24', '83', '上海霞飞路322号', '2016-04-24 21:51:59', '1');
INSERT INTO `demo_account` VALUES ('7440', '黄锦毖', '10004808', '2', '41002.590', '80000.000', '000', '2925192610161216', '3', '2016-04-24', '95', '上海霞飞路129号', '2016-04-24 21:51:59', '1');
INSERT INTO `demo_account` VALUES ('7441', '刘弹跃', '10004809', '2', '20608.400', '80000.000', '000', '2925197911201578', '2', '2016-04-24', '34', '上海霞飞路36号', '2016-04-24 21:51:59', '1');
INSERT INTO `demo_account` VALUES ('7442', '李漏沉', '10004810', '1', '76929.380', '80000.000', '000', '2925199512267335', '1', '2016-04-24', '93', '上海霞飞路383号', '2016-04-24 21:51:59', '1');
INSERT INTO `demo_account` VALUES ('7443', '黄钡', '10004811', '1', '52194.300', '80000.000', '000', '2925192410191044', '3', '2016-04-24', '92', '上海霞飞路528号', '2016-04-24 21:51:59', '1');
INSERT INTO `demo_account` VALUES ('7444', '毛拜锨', '10004812', '1', '59840.560', '80000.000', '000', '2925193412237059', '2', '2016-04-24', '95', '上海霞飞路232号', '2016-04-24 21:51:59', '1');
INSERT INTO `demo_account` VALUES ('7445', '毛喜斗', '10004813', '2', '20763.680', '80000.000', '000', '2925196311306812', '3', '2016-04-24', '72', '上海霞飞路979号', '2016-04-24 21:51:59', '1');
INSERT INTO `demo_account` VALUES ('7446', '黄晒胯', '10004814', '1', '61391.160', '80000.000', '000', '2925194611121550', '2', '2016-04-24', '85', '上海霞飞路349号', '2016-04-24 21:51:59', '1');
INSERT INTO `demo_account` VALUES ('7447', '李兵钱', '10004815', '2', '65361.100', '80000.000', '000', '2925197310239148', '1', '2016-04-24', '99', '上海霞飞路101号', '2016-04-24 21:51:59', '1');
INSERT INTO `demo_account` VALUES ('7448', '熊恼', '10004816', '2', '52431.520', '80000.000', '000', '2925200811201443', '2', '2016-04-24', '99', '上海霞飞路666号', '2016-04-24 21:51:59', '1');
INSERT INTO `demo_account` VALUES ('7449', '黄临', '10004817', '1', '36727.500', '80000.000', '000', '2925195711191307', '1', '2016-04-24', '86', '上海霞飞路187号', '2016-04-24 21:51:59', '1');
INSERT INTO `demo_account` VALUES ('7450', '黄芭', '10004818', '2', '61657.200', '80000.000', '000', '2925193611278544', '3', '2016-04-24', '62', '上海霞飞路213号', '2016-04-24 21:51:59', '1');
INSERT INTO `demo_account` VALUES ('7451', '毛堰', '10004819', '1', '6652.930', '80000.000', '000', '2925192212249338', '3', '2016-04-24', '62', '上海霞飞路600号', '2016-04-24 21:51:59', '1');
INSERT INTO `demo_account` VALUES ('7452', '张号荤', '10004820', '2', '61491.300', '80000.000', '000', '2925197312142769', '2', '2016-04-24', '67', '上海霞飞路2号', '2016-04-24 21:51:59', '1');
INSERT INTO `demo_account` VALUES ('7453', '毛堕', '10004821', '1', '29216.220', '80000.000', '000', '2925192811189566', '3', '2016-04-24', '81', '上海霞飞路746号', '2016-04-24 21:52:00', '1');
INSERT INTO `demo_account` VALUES ('7454', '赵搂速', '10004822', '1', '22570.490', '80000.000', '000', '2925194411297950', '2', '2016-04-24', '43', '上海霞飞路683号', '2016-04-24 21:52:00', '1');
INSERT INTO `demo_account` VALUES ('7455', '段瘦肿', '10004823', '2', '11521.630', '80000.000', '000', '2925193311221978', '1', '2016-04-24', '94', '上海霞飞路896号', '2016-04-24 21:52:00', '1');
INSERT INTO `demo_account` VALUES ('7456', '毛诉', '10004824', '1', '78763.460', '80000.000', '000', '2925198511126468', '2', '2016-04-24', '79', '上海霞飞路933号', '2016-04-24 21:52:00', '1');
INSERT INTO `demo_account` VALUES ('7457', '熊榆', '10004825', '2', '52073.440', '80000.000', '000', '2925192810156096', '2', '2016-04-24', '28', '上海霞飞路440号', '2016-04-24 21:52:00', '1');
INSERT INTO `demo_account` VALUES ('7458', '毛岂', '10004826', '1', '23091.660', '80000.000', '000', '2925198111285793', '2', '2016-04-24', '51', '上海霞飞路784号', '2016-04-24 21:52:00', '1');
INSERT INTO `demo_account` VALUES ('7459', '赵井春', '10004827', '2', '69478.650', '80000.000', '000', '2925194811139075', '2', '2016-04-24', '29', '上海霞飞路418号', '2016-04-24 21:52:00', '1');
INSERT INTO `demo_account` VALUES ('7460', '段那', '10004828', '1', '37468.970', '80000.000', '000', '2925192711104399', '2', '2016-04-24', '21', '上海霞飞路375号', '2016-04-24 21:52:00', '1');
INSERT INTO `demo_account` VALUES ('7461', '张坯', '10004829', '2', '78573.780', '80000.000', '000', '2925192812186072', '1', '2016-04-24', '59', '上海霞飞路405号', '2016-04-24 21:52:00', '1');
INSERT INTO `demo_account` VALUES ('7462', '郤睫', '10004830', '1', '63653.140', '80000.000', '000', '2925199512122657', '1', '2016-04-24', '26', '上海霞飞路812号', '2016-04-24 21:52:00', '1');
INSERT INTO `demo_account` VALUES ('7463', '赵摘', '10004831', '2', '47673.500', '80000.000', '000', '2925197911215155', '1', '2016-04-24', '87', '上海霞飞路111号', '2016-04-24 21:52:00', '1');
INSERT INTO `demo_account` VALUES ('7464', '赵欠丁', '10004832', '1', '51312.350', '80000.000', '000', '2925200810208640', '2', '2016-04-24', '24', '上海霞飞路143号', '2016-04-24 21:52:00', '1');
INSERT INTO `demo_account` VALUES ('7465', '段脆', '10004833', '2', '65050.320', '80000.000', '000', '2925198011186282', '2', '2016-04-24', '31', '上海霞飞路257号', '2016-04-24 21:52:00', '1');
INSERT INTO `demo_account` VALUES ('7466', '段读馈', '10004834', '1', '7590.530', '80000.000', '000', '2925200710198982', '2', '2016-04-24', '48', '上海霞飞路614号', '2016-04-24 21:52:00', '1');
INSERT INTO `demo_account` VALUES ('7467', '周艰', '10004835', '2', '7316.850', '80000.000', '000', '2925194410182137', '1', '2016-04-24', '57', '上海霞飞路601号', '2016-04-24 21:52:01', '1');
INSERT INTO `demo_account` VALUES ('7468', '周隅标', '10004836', '2', '49084.150', '80000.000', '000', '2925194610113181', '1', '2016-04-24', '67', '上海霞飞路719号', '2016-04-24 21:52:01', '1');
INSERT INTO `demo_account` VALUES ('7469', '黄茂', '10004837', '2', '66849.240', '80000.000', '000', '2925201111295828', '2', '2016-04-24', '43', '上海霞飞路173号', '2016-04-24 21:52:01', '1');
INSERT INTO `demo_account` VALUES ('7470', '周涡', '10004838', '1', '9633.220', '80000.000', '000', '2925195511224021', '2', '2016-04-24', '49', '上海霞飞路713号', '2016-04-24 21:52:01', '1');
INSERT INTO `demo_account` VALUES ('7471', '黄拱刊', '10004839', '1', '35906.670', '80000.000', '000', '2925196712174750', '1', '2016-04-24', '72', '上海霞飞路72号', '2016-04-24 21:52:01', '1');
INSERT INTO `demo_account` VALUES ('7472', '周溉', '10004840', '1', '25803.730', '80000.000', '000', '2925193210268000', '2', '2016-04-24', '23', '上海霞飞路596号', '2016-04-24 21:52:01', '1');
INSERT INTO `demo_account` VALUES ('7473', '刘妒', '10004841', '1', '73588.310', '80000.000', '000', '2925193911193115', '3', '2016-04-24', '67', '上海霞飞路426号', '2016-04-24 21:52:01', '1');
INSERT INTO `demo_account` VALUES ('7474', '黄摇', '10004842', '1', '62477.580', '80000.000', '000', '2925194711114922', '2', '2016-04-24', '95', '上海霞飞路748号', '2016-04-24 21:52:01', '1');
INSERT INTO `demo_account` VALUES ('7475', '段宴碳', '10004843', '1', '76284.830', '80000.000', '000', '2925193110242954', '1', '2016-04-24', '68', '上海霞飞路333号', '2016-04-24 21:52:01', '1');
INSERT INTO `demo_account` VALUES ('7476', '毛铸', '10004844', '2', '59451.740', '80000.000', '000', '2925197811298049', '2', '2016-04-24', '90', '上海霞飞路703号', '2016-04-24 21:52:01', '1');
INSERT INTO `demo_account` VALUES ('7477', '郤弹影', '10004845', '1', '44755.540', '80000.000', '000', '2925199212179589', '2', '2016-04-24', '41', '上海霞飞路884号', '2016-04-24 21:52:02', '1');
INSERT INTO `demo_account` VALUES ('7478', '毛硫庇', '10004846', '1', '30420.410', '80000.000', '000', '2925194311267475', '2', '2016-04-24', '55', '上海霞飞路761号', '2016-04-24 21:52:02', '1');
INSERT INTO `demo_account` VALUES ('7479', '李颇么', '10004847', '1', '11509.720', '80000.000', '000', '2925197212225883', '1', '2016-04-24', '96', '上海霞飞路615号', '2016-04-24 21:52:02', '1');
INSERT INTO `demo_account` VALUES ('7480', '段养', '10004848', '1', '56270.280', '80000.000', '000', '2925200912113620', '2', '2016-04-24', '99', '上海霞飞路417号', '2016-04-24 21:52:02', '1');
INSERT INTO `demo_account` VALUES ('7481', '刘畦蒲', '10004849', '1', '34608.600', '80000.000', '000', '2925193212193762', '2', '2016-04-24', '62', '上海霞飞路958号', '2016-04-24 21:52:02', '1');
INSERT INTO `demo_account` VALUES ('7482', '赵骋', '10004850', '1', '59066.950', '80000.000', '000', '2925194212159988', '3', '2016-04-24', '20', '上海霞飞路807号', '2016-04-24 21:52:02', '1');
INSERT INTO `demo_account` VALUES ('7483', '黄洗', '10004851', '2', '42553.310', '80000.000', '000', '2925194112204816', '1', '2016-04-24', '56', '上海霞飞路557号', '2016-04-24 21:52:02', '1');
INSERT INTO `demo_account` VALUES ('7484', '郤瞬岳', '10004852', '2', '75628.600', '80000.000', '000', '2925195210256612', '2', '2016-04-24', '42', '上海霞飞路653号', '2016-04-24 21:52:02', '1');
INSERT INTO `demo_account` VALUES ('7485', '熊回', '10004853', '1', '73410.430', '80000.000', '000', '2925198511229992', '1', '2016-04-24', '61', '上海霞飞路510号', '2016-04-24 21:52:02', '1');
INSERT INTO `demo_account` VALUES ('7486', '刘阵坷', '10004854', '2', '66108.980', '80000.000', '000', '2925197611207814', '1', '2016-04-24', '21', '上海霞飞路400号', '2016-04-24 21:52:02', '1');
INSERT INTO `demo_account` VALUES ('7487', '段烁', '10004855', '1', '63810.240', '80000.000', '000', '2925199412274655', '2', '2016-04-24', '34', '上海霞飞路907号', '2016-04-24 21:52:02', '1');
INSERT INTO `demo_account` VALUES ('7488', '段渤疏', '10004856', '2', '13457.590', '80000.000', '000', '2925199112195198', '1', '2016-04-24', '46', '上海霞飞路536号', '2016-04-24 21:52:02', '1');
INSERT INTO `demo_account` VALUES ('7489', '毛堆柯', '10004857', '1', '63976.650', '80000.000', '000', '2925193111149549', '2', '2016-04-24', '61', '上海霞飞路224号', '2016-04-24 21:52:02', '1');
INSERT INTO `demo_account` VALUES ('7490', '毛倒', '10004858', '2', '52176.580', '80000.000', '000', '2925194612198024', '2', '2016-04-24', '87', '上海霞飞路286号', '2016-04-24 21:52:02', '1');
INSERT INTO `demo_account` VALUES ('7491', '刘动', '10004859', '1', '71436.410', '80000.000', '000', '2925196812162435', '3', '2016-04-24', '73', '上海霞飞路433号', '2016-04-24 21:52:03', '1');
INSERT INTO `demo_account` VALUES ('7492', '郤婪', '10004860', '1', '13264.630', '80000.000', '000', '2925197911239370', '2', '2016-04-24', '86', '上海霞飞路159号', '2016-04-24 21:52:03', '1');
INSERT INTO `demo_account` VALUES ('7493', '赵卑', '10004861', '2', '26545.190', '80000.000', '000', '2925199610303432', '2', '2016-04-24', '88', '上海霞飞路919号', '2016-04-24 21:52:03', '1');
INSERT INTO `demo_account` VALUES ('7494', '郤幸礼', '10004862', '2', '10750.000', '80000.000', '000', '2925192410295722', '2', '2016-04-24', '92', '上海霞飞路59号', '2016-04-24 21:52:03', '1');
INSERT INTO `demo_account` VALUES ('7495', '刘译', '10004863', '1', '13502.500', '80000.000', '000', '2925196911117340', '1', '2016-04-24', '40', '上海霞飞路527号', '2016-04-24 21:52:03', '1');
INSERT INTO `demo_account` VALUES ('7496', '熊家', '10004864', '1', '13708.320', '80000.000', '000', '2925195710271903', '3', '2016-04-24', '48', '上海霞飞路919号', '2016-04-24 21:52:03', '1');
INSERT INTO `demo_account` VALUES ('7497', '周丹巨', '10004865', '1', '62967.630', '80000.000', '000', '2925198410276468', '3', '2016-04-24', '91', '上海霞飞路342号', '2016-04-24 21:52:03', '1');
INSERT INTO `demo_account` VALUES ('7498', '毛浪', '10004866', '1', '66157.800', '80000.000', '000', '2925192612247501', '2', '2016-04-24', '30', '上海霞飞路94号', '2016-04-24 21:52:03', '1');
INSERT INTO `demo_account` VALUES ('7499', '周迸', '10004867', '2', '6969.300', '80000.000', '000', '2925194510217753', '1', '2016-04-24', '80', '上海霞飞路39号', '2016-04-24 21:52:03', '1');
INSERT INTO `demo_account` VALUES ('7500', '熊豁楔', '10004868', '1', '23748.550', '80000.000', '000', '2925192112166183', '2', '2016-04-24', '25', '上海霞飞路937号', '2016-04-24 21:52:03', '1');
INSERT INTO `demo_account` VALUES ('7501', '郤萌', '10004869', '2', '77216.810', '80000.000', '000', '2925194011234182', '1', '2016-04-24', '82', '上海霞飞路892号', '2016-04-24 21:52:03', '1');
INSERT INTO `demo_account` VALUES ('7502', '赵富寸', '10004870', '1', '62624.860', '80000.000', '000', '2925195411187553', '2', '2016-04-24', '73', '上海霞飞路328号', '2016-04-24 21:52:03', '1');
INSERT INTO `demo_account` VALUES ('7503', '刘么滨', '10004871', '1', '70485.370', '80000.000', '000', '2925199312286815', '2', '2016-04-24', '31', '上海霞飞路790号', '2016-04-24 21:52:03', '1');
INSERT INTO `demo_account` VALUES ('7504', '段菲场', '10004872', '1', '52366.450', '80000.000', '000', '2925194311205463', '2', '2016-04-24', '65', '上海霞飞路60号', '2016-04-24 21:52:04', '1');
INSERT INTO `demo_account` VALUES ('7505', '郤爱', '10004873', '1', '29220.180', '80000.000', '000', '2925199511122922', '2', '2016-04-24', '44', '上海霞飞路823号', '2016-04-24 21:52:04', '1');
INSERT INTO `demo_account` VALUES ('7506', '刘谩', '10004874', '2', '47412.820', '80000.000', '000', '2925198810231917', '3', '2016-04-24', '75', '上海霞飞路356号', '2016-04-24 21:52:04', '1');
INSERT INTO `demo_account` VALUES ('7507', '张储', '10004875', '2', '75999.300', '80000.000', '000', '2925193411275008', '3', '2016-04-24', '57', '上海霞飞路321号', '2016-04-24 21:52:04', '1');
INSERT INTO `demo_account` VALUES ('7508', '李倘豆', '10004876', '2', '25854.750', '80000.000', '000', '2925192211125985', '2', '2016-04-24', '61', '上海霞飞路938号', '2016-04-24 21:52:04', '1');
INSERT INTO `demo_account` VALUES ('7509', '黄聪', '10004877', '1', '19011.320', '80000.000', '000', '2925194610306772', '1', '2016-04-24', '64', '上海霞飞路390号', '2016-04-24 21:52:04', '1');
INSERT INTO `demo_account` VALUES ('7510', '张挖欣', '10004878', '1', '57011.100', '80000.000', '000', '2925196010279367', '2', '2016-04-24', '94', '上海霞飞路378号', '2016-04-24 21:52:04', '1');
INSERT INTO `demo_account` VALUES ('7511', '黄悦象', '10004879', '2', '30197.470', '80000.000', '000', '2925200312296254', '2', '2016-04-24', '100', '上海霞飞路324号', '2016-04-24 21:52:04', '1');
INSERT INTO `demo_account` VALUES ('7512', '刘馋慈', '10004880', '1', '25674.880', '80000.000', '000', '2925196511115514', '1', '2016-04-24', '80', '上海霞飞路702号', '2016-04-24 21:52:04', '1');
INSERT INTO `demo_account` VALUES ('7513', '张梭诞', '10004881', '2', '16198.340', '80000.000', '000', '2925200312126721', '2', '2016-04-24', '64', '上海霞飞路457号', '2016-04-24 21:52:04', '1');
INSERT INTO `demo_account` VALUES ('7514', '熊盖募', '10004882', '1', '57416.440', '80000.000', '000', '2925196112114458', '2', '2016-04-24', '99', '上海霞飞路457号', '2016-04-24 21:52:04', '1');
INSERT INTO `demo_account` VALUES ('7515', '郤冲', '10004883', '1', '56762.440', '80000.000', '000', '2925195611197041', '3', '2016-04-24', '50', '上海霞飞路299号', '2016-04-24 21:52:04', '1');
INSERT INTO `demo_account` VALUES ('7516', '段悬', '10004884', '2', '69888.590', '80000.000', '000', '2925193012276758', '1', '2016-04-24', '19', '上海霞飞路699号', '2016-04-24 21:52:04', '1');
INSERT INTO `demo_account` VALUES ('7517', '张冶', '10004885', '1', '11758.370', '80000.000', '000', '2925194211214609', '1', '2016-04-24', '81', '上海霞飞路64号', '2016-04-24 21:52:04', '1');
INSERT INTO `demo_account` VALUES ('7518', '段坊', '10004886', '1', '75462.290', '80000.000', '000', '2925196111271203', '3', '2016-04-24', '60', '上海霞飞路630号', '2016-04-24 21:52:05', '1');
INSERT INTO `demo_account` VALUES ('7519', '张歹', '10004887', '1', '42446.600', '80000.000', '000', '2925195311249059', '1', '2016-04-24', '42', '上海霞飞路902号', '2016-04-24 21:52:05', '1');
INSERT INTO `demo_account` VALUES ('7520', '熊皇', '10004888', '1', '67161.260', '80000.000', '000', '2925197612298186', '1', '2016-04-24', '22', '上海霞飞路832号', '2016-04-24 21:52:05', '1');
INSERT INTO `demo_account` VALUES ('7521', '黄驭', '10004889', '2', '37148.860', '80000.000', '000', '2925200810114337', '2', '2016-04-24', '69', '上海霞飞路449号', '2016-04-24 21:52:05', '1');
INSERT INTO `demo_account` VALUES ('7522', '郤岁', '10004890', '1', '40239.340', '80000.000', '000', '2925194811133900', '3', '2016-04-24', '30', '上海霞飞路335号', '2016-04-24 21:52:05', '1');
INSERT INTO `demo_account` VALUES ('7523', '周情秆', '10004891', '1', '19972.730', '80000.000', '000', '2925195011115862', '3', '2016-04-24', '84', '上海霞飞路515号', '2016-04-24 21:52:05', '1');
INSERT INTO `demo_account` VALUES ('7524', '刘诵靴', '10004892', '1', '54332.740', '80000.000', '000', '2925199212233743', '2', '2016-04-24', '65', '上海霞飞路961号', '2016-04-24 21:52:05', '1');
INSERT INTO `demo_account` VALUES ('7525', '毛霍', '10004893', '1', '13737.120', '80000.000', '000', '2925192011121853', '2', '2016-04-24', '89', '上海霞飞路24号', '2016-04-24 21:52:05', '1');
INSERT INTO `demo_account` VALUES ('7526', '熊狱', '10004894', '1', '37571.380', '80000.000', '000', '2925195710279609', '1', '2016-04-24', '32', '上海霞飞路678号', '2016-04-24 21:52:05', '1');
INSERT INTO `demo_account` VALUES ('7527', '黄更扳', '10004895', '2', '66747.390', '80000.000', '000', '2925192410252049', '2', '2016-04-24', '50', '上海霞飞路513号', '2016-04-24 21:52:05', '1');
INSERT INTO `demo_account` VALUES ('7528', '李逞靠', '10004896', '2', '14551.980', '80000.000', '000', '2925193712254951', '2', '2016-04-24', '49', '上海霞飞路908号', '2016-04-24 21:52:05', '1');
INSERT INTO `demo_account` VALUES ('7529', '张妒', '10004897', '2', '61559.580', '80000.000', '000', '2925192312235399', '3', '2016-04-24', '96', '上海霞飞路815号', '2016-04-24 21:52:05', '1');
INSERT INTO `demo_account` VALUES ('7530', '张挫', '10004898', '1', '52567.630', '80000.000', '000', '2925195712233765', '2', '2016-04-24', '34', '上海霞飞路31号', '2016-04-24 21:52:05', '1');
INSERT INTO `demo_account` VALUES ('7531', '张市', '10004899', '2', '52402.880', '80000.000', '000', '2925193411236458', '1', '2016-04-24', '84', '上海霞飞路739号', '2016-04-24 21:52:06', '1');
INSERT INTO `demo_account` VALUES ('7532', '李精', '10004900', '1', '52996.960', '80000.000', '000', '2925201010108914', '1', '2016-04-24', '52', '上海霞飞路522号', '2016-04-24 21:52:06', '1');
INSERT INTO `demo_account` VALUES ('7533', '熊亮', '10004901', '2', '46386.300', '80000.000', '000', '2925193910239539', '3', '2016-04-24', '35', '上海霞飞路852号', '2016-04-24 21:52:06', '1');
INSERT INTO `demo_account` VALUES ('7534', '赵乍袄', '10004902', '2', '51245.210', '80000.000', '000', '2925199710217434', '1', '2016-04-24', '45', '上海霞飞路458号', '2016-04-24 21:52:06', '1');
INSERT INTO `demo_account` VALUES ('7535', '段凋牡', '10004903', '2', '12153.210', '80000.000', '000', '2925196811233893', '2', '2016-04-24', '39', '上海霞飞路693号', '2016-04-24 21:52:06', '1');
INSERT INTO `demo_account` VALUES ('7536', '段吃特', '10004904', '2', '79150.620', '80000.000', '000', '2925192110116713', '2', '2016-04-24', '24', '上海霞飞路344号', '2016-04-24 21:52:06', '1');
INSERT INTO `demo_account` VALUES ('7537', '赵允愧', '10004905', '2', '30122.210', '80000.000', '000', '2925201011178444', '2', '2016-04-24', '24', '上海霞飞路20号', '2016-04-24 21:52:06', '1');
INSERT INTO `demo_account` VALUES ('7538', '张垃狭', '10004906', '1', '68223.270', '80000.000', '000', '2925193411249726', '2', '2016-04-24', '58', '上海霞飞路481号', '2016-04-24 21:52:06', '1');
INSERT INTO `demo_account` VALUES ('7539', '段郭', '10004907', '1', '72972.490', '80000.000', '000', '2925200711298855', '3', '2016-04-24', '75', '上海霞飞路917号', '2016-04-24 21:52:06', '1');
INSERT INTO `demo_account` VALUES ('7540', '郤存', '10004908', '2', '68658.200', '80000.000', '000', '2925199311169693', '3', '2016-04-24', '37', '上海霞飞路344号', '2016-04-24 21:52:06', '1');
INSERT INTO `demo_account` VALUES ('7541', '毛怀淹', '10004909', '2', '33513.590', '80000.000', '000', '2925197011187956', '2', '2016-04-24', '30', '上海霞飞路866号', '2016-04-24 21:52:06', '1');
INSERT INTO `demo_account` VALUES ('7542', '段丹蹭', '10004910', '2', '41480.190', '80000.000', '000', '2925198611245841', '2', '2016-04-24', '35', '上海霞飞路670号', '2016-04-24 21:52:06', '1');
INSERT INTO `demo_account` VALUES ('7543', '熊乾北', '10004911', '1', '43592.350', '80000.000', '000', '2925197410217804', '3', '2016-04-24', '52', '上海霞飞路101号', '2016-04-24 21:52:06', '1');
INSERT INTO `demo_account` VALUES ('7544', '李漓梦', '10004912', '2', '53746.420', '80000.000', '000', '2925194212198151', '2', '2016-04-24', '82', '上海霞飞路243号', '2016-04-24 21:52:07', '1');
INSERT INTO `demo_account` VALUES ('7545', '李伸', '10004913', '2', '36186.290', '80000.000', '000', '2925193610154916', '1', '2016-04-24', '44', '上海霞飞路864号', '2016-04-24 21:52:07', '1');
INSERT INTO `demo_account` VALUES ('7546', '刘小苗', '10004914', '2', '23191.420', '80000.000', '000', '2925201010161264', '2', '2016-04-24', '56', '上海霞飞路567号', '2016-04-24 21:52:07', '1');
INSERT INTO `demo_account` VALUES ('7547', '毛并设', '10004915', '2', '37326.860', '80000.000', '000', '2925199212261434', '2', '2016-04-24', '66', '上海霞飞路378号', '2016-04-24 21:52:07', '1');
INSERT INTO `demo_account` VALUES ('7548', '毛旋屠', '10004916', '2', '27216.810', '80000.000', '000', '2925195310181916', '2', '2016-04-24', '75', '上海霞飞路915号', '2016-04-24 21:52:07', '1');
INSERT INTO `demo_account` VALUES ('7549', '刘螟', '10004917', '1', '29001.200', '80000.000', '000', '2925194412161265', '1', '2016-04-24', '63', '上海霞飞路635号', '2016-04-24 21:52:07', '1');
INSERT INTO `demo_account` VALUES ('7550', '毛列灸', '10004918', '2', '63627.390', '80000.000', '000', '2925199010284601', '2', '2016-04-24', '30', '上海霞飞路448号', '2016-04-24 21:52:07', '1');
INSERT INTO `demo_account` VALUES ('7551', '张块', '10004919', '2', '18701.410', '80000.000', '000', '2925194911217468', '3', '2016-04-24', '38', '上海霞飞路346号', '2016-04-24 21:52:07', '1');
INSERT INTO `demo_account` VALUES ('7552', '段溃', '10004920', '1', '19006.130', '80000.000', '000', '2925201211238314', '3', '2016-04-24', '70', '上海霞飞路380号', '2016-04-24 21:52:07', '1');
INSERT INTO `demo_account` VALUES ('7553', '熊喝啮', '10004921', '2', '7724.430', '80000.000', '000', '2925201310223412', '3', '2016-04-24', '95', '上海霞飞路626号', '2016-04-24 21:52:07', '1');
INSERT INTO `demo_account` VALUES ('7554', '毛源', '10004922', '2', '27132.900', '80000.000', '000', '2925200710284568', '3', '2016-04-24', '60', '上海霞飞路408号', '2016-04-24 21:52:07', '1');
INSERT INTO `demo_account` VALUES ('7555', '段倡', '10004923', '1', '12923.700', '80000.000', '000', '2925195811241483', '2', '2016-04-24', '37', '上海霞飞路280号', '2016-04-24 21:52:07', '1');
INSERT INTO `demo_account` VALUES ('7556', '赵释妥', '10004924', '2', '12329.950', '80000.000', '000', '2925201311207051', '1', '2016-04-24', '36', '上海霞飞路860号', '2016-04-24 21:52:08', '1');
INSERT INTO `demo_account` VALUES ('7557', '周破辩', '10004925', '1', '19022.750', '80000.000', '000', '2925192711122375', '3', '2016-04-24', '49', '上海霞飞路744号', '2016-04-24 21:52:08', '1');
INSERT INTO `demo_account` VALUES ('7558', '毛豆', '10004926', '2', '43165.730', '80000.000', '000', '2925199610117615', '1', '2016-04-24', '35', '上海霞飞路284号', '2016-04-24 21:52:08', '1');
INSERT INTO `demo_account` VALUES ('7559', '熊欧计', '10004927', '1', '53155.980', '80000.000', '000', '2925192512257233', '1', '2016-04-24', '55', '上海霞飞路64号', '2016-04-24 21:52:08', '1');
INSERT INTO `demo_account` VALUES ('7560', '毛给矢', '10004928', '1', '32372.700', '80000.000', '000', '2925192511186461', '1', '2016-04-24', '69', '上海霞飞路439号', '2016-04-24 21:52:08', '1');
INSERT INTO `demo_account` VALUES ('7561', '段需磋', '10004929', '1', '73781.760', '80000.000', '000', '2925201411202185', '2', '2016-04-24', '51', '上海霞飞路452号', '2016-04-24 21:52:08', '1');
INSERT INTO `demo_account` VALUES ('7562', '段篷汗', '10004930', '1', '75413.300', '80000.000', '000', '2925192811105699', '2', '2016-04-24', '43', '上海霞飞路907号', '2016-04-24 21:52:08', '1');
INSERT INTO `demo_account` VALUES ('7563', '周述汞', '10004931', '2', '50617.220', '80000.000', '000', '2925200711128019', '1', '2016-04-24', '35', '上海霞飞路318号', '2016-04-24 21:52:08', '1');
INSERT INTO `demo_account` VALUES ('7564', '熊怠垂', '10004932', '2', '74571.340', '80000.000', '000', '2925197412141672', '2', '2016-04-24', '19', '上海霞飞路789号', '2016-04-24 21:52:08', '1');
INSERT INTO `demo_account` VALUES ('7565', '黄郝', '10004933', '2', '38740.330', '80000.000', '000', '2925193711232069', '2', '2016-04-24', '76', '上海霞飞路810号', '2016-04-24 21:52:08', '1');
INSERT INTO `demo_account` VALUES ('7566', '李胎择', '10004934', '2', '51976.560', '80000.000', '000', '2925198010204701', '1', '2016-04-24', '98', '上海霞飞路193号', '2016-04-24 21:52:08', '1');
INSERT INTO `demo_account` VALUES ('7567', '毛曲', '10004935', '1', '68508.570', '80000.000', '000', '2925200111147549', '2', '2016-04-24', '84', '上海霞飞路245号', '2016-04-24 21:52:08', '1');
INSERT INTO `demo_account` VALUES ('7568', '毛镍抚', '10004936', '2', '57456.470', '80000.000', '000', '2925193111249154', '2', '2016-04-24', '36', '上海霞飞路490号', '2016-04-24 21:52:09', '1');
INSERT INTO `demo_account` VALUES ('7569', '李橱', '10004937', '2', '61445.690', '80000.000', '000', '2925199510258891', '2', '2016-04-24', '93', '上海霞飞路992号', '2016-04-24 21:52:09', '1');
INSERT INTO `demo_account` VALUES ('7570', '李菠', '10004938', '2', '75622.820', '80000.000', '000', '2925198411229987', '2', '2016-04-24', '30', '上海霞飞路551号', '2016-04-24 21:52:09', '1');
INSERT INTO `demo_account` VALUES ('7571', '黄炎笺', '10004939', '2', '74744.970', '80000.000', '000', '2925199010201845', '1', '2016-04-24', '35', '上海霞飞路673号', '2016-04-24 21:52:09', '1');
INSERT INTO `demo_account` VALUES ('7572', '熊币宣', '10004940', '1', '59068.160', '80000.000', '000', '2925194310132168', '3', '2016-04-24', '44', '上海霞飞路418号', '2016-04-24 21:52:09', '1');
INSERT INTO `demo_account` VALUES ('7573', '李盂', '10004941', '2', '11527.870', '80000.000', '000', '2925196911223376', '1', '2016-04-24', '88', '上海霞飞路743号', '2016-04-24 21:52:09', '1');
INSERT INTO `demo_account` VALUES ('7574', '张腰积', '10004942', '2', '11111.330', '80000.000', '000', '2925200111109618', '2', '2016-04-24', '74', '上海霞飞路140号', '2016-04-24 21:52:09', '1');
INSERT INTO `demo_account` VALUES ('7575', '毛钙', '10004943', '2', '24522.730', '80000.000', '000', '2925192810191648', '2', '2016-04-24', '26', '上海霞飞路813号', '2016-04-24 21:52:09', '1');
INSERT INTO `demo_account` VALUES ('7576', '郤阜', '10004944', '1', '59940.400', '80000.000', '000', '2925199311173604', '1', '2016-04-24', '46', '上海霞飞路728号', '2016-04-24 21:52:09', '1');
INSERT INTO `demo_account` VALUES ('7577', '张瘴', '10004945', '2', '47297.830', '80000.000', '000', '2925200210128589', '2', '2016-04-24', '38', '上海霞飞路298号', '2016-04-24 21:52:09', '1');
INSERT INTO `demo_account` VALUES ('7578', '赵翰露', '10004946', '1', '40592.330', '80000.000', '000', '2925198811144693', '2', '2016-04-24', '79', '上海霞飞路448号', '2016-04-24 21:52:09', '1');
INSERT INTO `demo_account` VALUES ('7579', '黄覆', '10004947', '1', '13701.380', '80000.000', '000', '2925200412281858', '1', '2016-04-24', '79', '上海霞飞路217号', '2016-04-24 21:52:09', '1');
INSERT INTO `demo_account` VALUES ('7580', '熊狈监', '10004948', '1', '43654.700', '80000.000', '000', '2925194711197716', '2', '2016-04-24', '99', '上海霞飞路915号', '2016-04-24 21:52:09', '1');
INSERT INTO `demo_account` VALUES ('7581', '刘哲', '10004949', '2', '50664.780', '80000.000', '000', '2925196012294197', '2', '2016-04-24', '84', '上海霞飞路263号', '2016-04-24 21:52:09', '1');
INSERT INTO `demo_account` VALUES ('7582', '赵茵村', '10004950', '2', '78067.680', '80000.000', '000', '2925193111211352', '3', '2016-04-24', '61', '上海霞飞路707号', '2016-04-24 21:52:10', '1');
INSERT INTO `demo_account` VALUES ('7583', '张诚', '10004951', '1', '22002.480', '80000.000', '000', '2925194610271485', '3', '2016-04-24', '55', '上海霞飞路449号', '2016-04-24 21:52:10', '1');
INSERT INTO `demo_account` VALUES ('7584', '郤藤曰', '10004952', '2', '47967.740', '80000.000', '000', '2925194512255258', '1', '2016-04-24', '55', '上海霞飞路454号', '2016-04-24 21:52:10', '1');
INSERT INTO `demo_account` VALUES ('7585', '郤彤', '10004953', '1', '39373.300', '80000.000', '000', '2925199611255989', '3', '2016-04-24', '82', '上海霞飞路950号', '2016-04-24 21:52:10', '1');
INSERT INTO `demo_account` VALUES ('7586', '张斟湛', '10004954', '2', '77925.270', '80000.000', '000', '2925200511204907', '2', '2016-04-24', '32', '上海霞飞路634号', '2016-04-24 21:52:10', '1');
INSERT INTO `demo_account` VALUES ('7587', '黄唱鹿', '10004955', '2', '23034.870', '80000.000', '000', '2925196212226618', '3', '2016-04-24', '92', '上海霞飞路960号', '2016-04-24 21:52:10', '1');
INSERT INTO `demo_account` VALUES ('7588', '段孰滩', '10004956', '2', '55509.640', '80000.000', '000', '2925194912228499', '3', '2016-04-24', '33', '上海霞飞路522号', '2016-04-24 21:52:10', '1');
INSERT INTO `demo_account` VALUES ('7589', '熊瞄居', '10004957', '1', '39558.700', '80000.000', '000', '2925195512159175', '3', '2016-04-24', '94', '上海霞飞路666号', '2016-04-24 21:52:10', '1');
INSERT INTO `demo_account` VALUES ('7590', '赵趟都', '10004958', '2', '16553.630', '80000.000', '000', '2925198110212638', '1', '2016-04-24', '36', '上海霞飞路17号', '2016-04-24 21:52:10', '1');
INSERT INTO `demo_account` VALUES ('7591', '黄踩', '10004959', '2', '54133.980', '80000.000', '000', '2925194711282924', '2', '2016-04-24', '82', '上海霞飞路670号', '2016-04-24 21:52:10', '1');
INSERT INTO `demo_account` VALUES ('7592', '刘挣', '10004960', '1', '57044.920', '80000.000', '000', '2925193312248649', '2', '2016-04-24', '94', '上海霞飞路309号', '2016-04-24 21:52:10', '1');
INSERT INTO `demo_account` VALUES ('7593', '张批坪', '10004961', '2', '47624.110', '80000.000', '000', '2925198910256951', '2', '2016-04-24', '86', '上海霞飞路461号', '2016-04-24 21:52:10', '1');
INSERT INTO `demo_account` VALUES ('7594', '黄懒卷', '10004962', '1', '28008.110', '80000.000', '000', '2925198111162709', '2', '2016-04-24', '21', '上海霞飞路611号', '2016-04-24 21:52:10', '1');
INSERT INTO `demo_account` VALUES ('7595', '黄诣胚', '10004963', '2', '61024.570', '80000.000', '000', '2925195512121153', '1', '2016-04-24', '64', '上海霞飞路757号', '2016-04-24 21:52:10', '1');
INSERT INTO `demo_account` VALUES ('7596', '赵莹竿', '10004964', '2', '28312.700', '80000.000', '000', '2925197612235170', '2', '2016-04-24', '57', '上海霞飞路401号', '2016-04-24 21:52:11', '1');
INSERT INTO `demo_account` VALUES ('7597', '黄峭', '10004965', '2', '44445.730', '80000.000', '000', '2925192411307826', '2', '2016-04-24', '87', '上海霞飞路835号', '2016-04-24 21:52:11', '1');
INSERT INTO `demo_account` VALUES ('7598', '张挫空', '10004966', '2', '64766.140', '80000.000', '000', '2925200512187750', '2', '2016-04-24', '91', '上海霞飞路898号', '2016-04-24 21:52:11', '1');
INSERT INTO `demo_account` VALUES ('7599', '刘富', '10004967', '2', '72309.470', '80000.000', '000', '2925198111257173', '1', '2016-04-24', '60', '上海霞飞路157号', '2016-04-24 21:52:11', '1');
INSERT INTO `demo_account` VALUES ('7600', '毛夺', '10004968', '1', '79433.590', '80000.000', '000', '2925195410153483', '3', '2016-04-24', '84', '上海霞飞路755号', '2016-04-24 21:52:11', '1');
INSERT INTO `demo_account` VALUES ('7601', '段吐', '10004969', '1', '24876.960', '80000.000', '000', '2925192010132235', '3', '2016-04-24', '32', '上海霞飞路903号', '2016-04-24 21:52:11', '1');
INSERT INTO `demo_account` VALUES ('7602', '黄宴玲', '10004970', '2', '8539.210', '80000.000', '000', '2925196311188572', '1', '2016-04-24', '99', '上海霞飞路146号', '2016-04-24 21:52:11', '1');
INSERT INTO `demo_account` VALUES ('7603', '熊瓶锯', '10004971', '2', '74764.840', '80000.000', '000', '2925196212182023', '2', '2016-04-24', '77', '上海霞飞路259号', '2016-04-24 21:52:11', '1');
INSERT INTO `demo_account` VALUES ('7604', '李雾社', '10004972', '2', '73885.700', '80000.000', '000', '2925199711233573', '1', '2016-04-24', '21', '上海霞飞路748号', '2016-04-24 21:52:11', '1');
INSERT INTO `demo_account` VALUES ('7605', '张整', '10004973', '2', '79601.660', '80000.000', '000', '2925198612278903', '2', '2016-04-24', '74', '上海霞飞路510号', '2016-04-24 21:52:11', '1');
INSERT INTO `demo_account` VALUES ('7606', '李暑衍', '10004974', '1', '46161.820', '80000.000', '000', '2925197610292528', '3', '2016-04-24', '30', '上海霞飞路317号', '2016-04-24 21:52:11', '1');
INSERT INTO `demo_account` VALUES ('7607', '赵蒜课', '10004975', '2', '70470.380', '80000.000', '000', '2925194011128475', '1', '2016-04-24', '65', '上海霞飞路328号', '2016-04-24 21:52:11', '1');
INSERT INTO `demo_account` VALUES ('7608', '郤畦沧', '10004976', '2', '12051.100', '80000.000', '000', '2925197011161984', '3', '2016-04-24', '66', '上海霞飞路813号', '2016-04-24 21:52:12', '1');
INSERT INTO `demo_account` VALUES ('7609', '毛褂', '10004977', '2', '48284.180', '80000.000', '000', '2925193310137498', '3', '2016-04-24', '89', '上海霞飞路808号', '2016-04-24 21:52:12', '1');
INSERT INTO `demo_account` VALUES ('7610', '段暴', '10004978', '2', '15546.200', '80000.000', '000', '2925196811145020', '2', '2016-04-24', '51', '上海霞飞路313号', '2016-04-24 21:52:12', '1');
INSERT INTO `demo_account` VALUES ('7611', '李强', '10004979', '1', '56750.400', '80000.000', '000', '2925197211205633', '2', '2016-04-24', '25', '上海霞飞路113号', '2016-04-24 21:52:12', '1');
INSERT INTO `demo_account` VALUES ('7612', '郤链', '10004980', '1', '32338.130', '80000.000', '000', '2925200510142711', '3', '2016-04-24', '37', '上海霞飞路154号', '2016-04-24 21:52:12', '1');
INSERT INTO `demo_account` VALUES ('7613', '赵瞅', '10004981', '1', '39053.650', '80000.000', '000', '2925198312255031', '1', '2016-04-24', '55', '上海霞飞路795号', '2016-04-24 21:52:12', '1');
INSERT INTO `demo_account` VALUES ('7614', '李酿', '10004982', '2', '52719.970', '80000.000', '000', '2925200011274653', '3', '2016-04-24', '47', '上海霞飞路37号', '2016-04-24 21:52:12', '1');
INSERT INTO `demo_account` VALUES ('7615', '毛腰燕', '10004983', '1', '39937.750', '80000.000', '000', '2925192112172037', '1', '2016-04-24', '75', '上海霞飞路173号', '2016-04-24 21:52:12', '1');
INSERT INTO `demo_account` VALUES ('7616', '张啪', '10004984', '2', '66865.480', '80000.000', '000', '2925196211165486', '2', '2016-04-24', '52', '上海霞飞路45号', '2016-04-24 21:52:12', '1');
INSERT INTO `demo_account` VALUES ('7617', '黄络踏', '10004985', '1', '75297.960', '80000.000', '000', '2925201312176547', '1', '2016-04-24', '40', '上海霞飞路300号', '2016-04-24 21:52:12', '1');
INSERT INTO `demo_account` VALUES ('7618', '郤毁核', '10004986', '1', '60911.610', '80000.000', '000', '2925197012281529', '2', '2016-04-24', '45', '上海霞飞路797号', '2016-04-24 21:52:12', '1');
INSERT INTO `demo_account` VALUES ('7619', '熊别', '10004987', '2', '45959.590', '80000.000', '000', '2925193410121793', '2', '2016-04-24', '99', '上海霞飞路415号', '2016-04-24 21:52:12', '1');
INSERT INTO `demo_account` VALUES ('7620', '张俭', '10004988', '2', '76719.920', '80000.000', '000', '2925194110172960', '2', '2016-04-24', '47', '上海霞飞路208号', '2016-04-24 21:52:12', '1');
INSERT INTO `demo_account` VALUES ('7621', '熊苹儒', '10004989', '1', '16785.600', '80000.000', '000', '2925193610272573', '2', '2016-04-24', '77', '上海霞飞路931号', '2016-04-24 21:52:12', '1');
INSERT INTO `demo_account` VALUES ('7622', '刘瘟', '10004990', '2', '36727.840', '80000.000', '000', '2925198611167184', '3', '2016-04-24', '43', '上海霞飞路544号', '2016-04-24 21:52:13', '1');
INSERT INTO `demo_account` VALUES ('7623', '李躺', '10004991', '2', '16743.950', '80000.000', '000', '2925195510103222', '1', '2016-04-24', '87', '上海霞飞路324号', '2016-04-24 21:52:13', '1');
INSERT INTO `demo_account` VALUES ('7624', '赵戳', '10004992', '1', '15787.480', '80000.000', '000', '2925200512219277', '2', '2016-04-24', '57', '上海霞飞路780号', '2016-04-24 21:52:13', '1');
INSERT INTO `demo_account` VALUES ('7625', '张漆', '10004993', '1', '14111.850', '80000.000', '000', '2925193811244835', '3', '2016-04-24', '52', '上海霞飞路486号', '2016-04-24 21:52:13', '1');
INSERT INTO `demo_account` VALUES ('7626', '黄收', '10004994', '2', '32388.770', '80000.000', '000', '2925199812241682', '2', '2016-04-24', '78', '上海霞飞路432号', '2016-04-24 21:52:13', '1');
INSERT INTO `demo_account` VALUES ('7627', '李冗蜜', '10004995', '1', '73440.260', '80000.000', '000', '2925192411217527', '2', '2016-04-24', '56', '上海霞飞路415号', '2016-04-24 21:52:13', '1');
INSERT INTO `demo_account` VALUES ('7628', '周毡', '10004996', '1', '78155.300', '80000.000', '000', '2925201210267543', '3', '2016-04-24', '71', '上海霞飞路356号', '2016-04-24 21:52:13', '1');
INSERT INTO `demo_account` VALUES ('7629', '李迹', '10004997', '2', '53448.520', '80000.000', '000', '2925196211248755', '2', '2016-04-24', '66', '上海霞飞路305号', '2016-04-24 21:52:13', '1');
INSERT INTO `demo_account` VALUES ('7630', '赵蛰醇', '10004998', '2', '13039.100', '80000.000', '000', '2925200010285335', '1', '2016-04-24', '100', '上海霞飞路220号', '2016-04-24 21:52:13', '1');
INSERT INTO `demo_account` VALUES ('7631', '毛典', '10004999', '1', '73470.540', '80000.000', '000', '2925195011125983', '1', '2016-04-24', '96', '上海霞飞路385号', '2016-04-24 21:52:13', '1');
INSERT INTO `demo_account` VALUES ('7632', '毛畸干', '10005000', '2', '8075.890', '80000.000', '000', '2925198111299691', '2', '2016-04-24', '73', '上海霞飞路612号', '2016-04-24 21:52:13', '1');
INSERT INTO `demo_account` VALUES ('7633', '李滨绽', '10005001', '2', '34633.430', '80000.000', '000', '2925200110134208', '2', '2016-04-24', '60', '上海霞飞路99号', '2016-04-24 21:52:13', '1');
INSERT INTO `demo_account` VALUES ('7634', '段衫兼', '10005002', '2', '16127.900', '80000.000', '000', '2925198310228581', '2', '2016-04-24', '93', '上海霞飞路1000号', '2016-04-24 21:52:13', '1');
INSERT INTO `demo_account` VALUES ('7635', '赵况撑', '10005003', '1', '52390.670', '80000.000', '000', '2925195411124141', '3', '2016-04-24', '70', '上海霞飞路467号', '2016-04-24 21:52:14', '1');
INSERT INTO `demo_account` VALUES ('7636', '熊榆彬', '10005004', '1', '25505.810', '80000.000', '000', '2925199811158241', '2', '2016-04-24', '68', '上海霞飞路16号', '2016-04-24 21:52:14', '1');
INSERT INTO `demo_account` VALUES ('7637', '张糯', '10005005', '1', '49568.350', '80000.000', '000', '2925201110303048', '3', '2016-04-24', '84', '上海霞飞路716号', '2016-04-24 21:52:14', '1');
INSERT INTO `demo_account` VALUES ('7638', '刘鹰傣', '10005006', '2', '23818.870', '80000.000', '000', '2925193611308671', '1', '2016-04-24', '43', '上海霞飞路515号', '2016-04-24 21:58:05', '1');
INSERT INTO `demo_account` VALUES ('7639', '毛萎', '10005007', '1', '74167.810', '80000.000', '000', '2925196610128997', '1', '2016-04-24', '27', '上海霞飞路276号', '2016-04-24 21:58:48', '1');
INSERT INTO `demo_account` VALUES ('7640', '段桂', '10005008', '2', '20906.450', '80000.000', '000', '2925193412284598', '2', '2016-04-24', '28', '上海霞飞路962号', '2016-04-24 21:59:52', '1');
INSERT INTO `demo_account` VALUES ('7641', '郤雁', '10005009', '1', '23868.760', '80000.000', '000', '2925195210235716', '2', '2016-04-24', '59', '上海霞飞路137号', '2016-04-24 22:01:29', '1');
INSERT INTO `demo_account` VALUES ('7642', '黄述促', '10005010', '2', '58446.620', '80000.000', '000', '2925194310154057', '2', '2016-04-24', '52', '上海霞飞路740号', '2016-04-24 22:02:24', '1');
INSERT INTO `demo_account` VALUES ('7643', '周根', '10005011', '1', '59843.310', '80000.000', '000', '2925197112187201', '1', '2016-04-24', '78', '上海霞飞路780号', '2016-04-24 22:03:03', '1');
INSERT INTO `demo_account` VALUES ('7644', '熊戈嗽', '10005012', '2', '57582.360', '80000.000', '000', '2925192112295287', '2', '2016-04-24', '80', '上海霞飞路398号', '2016-04-24 22:03:18', '1');

-- ----------------------------
-- Table structure for demo_org
-- ----------------------------
DROP TABLE IF EXISTS `demo_org`;
CREATE TABLE `demo_org` (
  `id_` varchar(64) NOT NULL COMMENT '流水号',
  `cascade_id_` varchar(255) DEFAULT NULL COMMENT '节点语义ID',
  `name_` varchar(255) DEFAULT NULL COMMENT '组织名称',
  `hotkey_` varchar(255) DEFAULT NULL COMMENT '热键',
  `parent_id_` varchar(64) NOT NULL COMMENT '父节点流水号',
  `is_leaf_` varchar(6) NOT NULL COMMENT '是否叶子节点',
  `is_auto_expand_` varchar(6) DEFAULT NULL COMMENT '是否自动展开',
  `icon_name_` varchar(255) DEFAULT NULL COMMENT '节点图标文件名称',
  `address_` varchar(255) DEFAULT NULL COMMENT '地址',
  `create_time_` datetime NOT NULL COMMENT '创建时间',
  `create_user_id_` varchar(255) NOT NULL COMMENT '创建人ID',
  `sort_no_` int(255) DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='银行组织机构表';

-- ----------------------------
-- Records of demo_org
-- ----------------------------
INSERT INTO `demo_org` VALUES ('0', '0', '中国嘉靖银行', null, 'p', '0', '1', null, null, '2016-04-24 23:26:09', '1', null);
INSERT INTO `demo_org` VALUES ('1', '0.001', '中国嘉靖银行上海分行', null, '0', '1', '0', null, null, '2016-04-24 23:27:22', '1', null);
INSERT INTO `demo_org` VALUES ('2', '0.002', '中国嘉靖银行四川分行', null, '0', '1', '0', null, null, '2016-04-24 23:28:01', '1', null);
INSERT INTO `demo_org` VALUES ('3', '0.003', '中国嘉靖银行云南分行', null, '0', '0', '1', null, null, '2016-04-24 23:28:29', '1', null);
INSERT INTO `demo_org` VALUES ('4', '0.003.001', '云南分行昆明支行', null, '3', '1', '0', null, null, '2016-04-24 23:29:06', '1', null);
INSERT INTO `demo_org` VALUES ('5', '0.003.002', '云南分行大理支行', null, '3', '1', '0', null, null, '2016-04-24 23:29:21', '1', null);
