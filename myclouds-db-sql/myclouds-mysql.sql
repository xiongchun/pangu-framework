/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 80011
Source Host           : 127.0.0.1:3306
Source Database       : myclouds

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2018-06-29 16:19:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for my_enum
-- ----------------------------
DROP TABLE IF EXISTS `my_enum`;
CREATE TABLE `my_enum` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `enum_key` varchar(50) NOT NULL COMMENT '枚举类型KEY',
  `enum_name` varchar(50) NOT NULL COMMENT '枚举类型名称',
  `element_key` varchar(50) NOT NULL COMMENT '枚举元素KEY',
  `element_value` varchar(100) NOT NULL COMMENT '枚举元素值',
  `is_enable` varchar(2) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `type` varchar(2) NOT NULL COMMENT '所属分类',
  `sort_no` int(4) DEFAULT NULL COMMENT '排序号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ukey1` (`enum_key`,`element_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4  COMMENT='枚举类型参数表';

-- ----------------------------
-- Records of my_enum
-- ----------------------------
INSERT INTO `my_enum` VALUES ('1', 'sex', '性别', '1', '男', '1', '1', '1', '2018-02-05 11:35:51', null);
INSERT INTO `my_enum` VALUES ('2', 'sex', '性别', '2', '女', '1', '1', '2', '2018-02-05 11:36:15', null);
INSERT INTO `my_enum` VALUES ('3', 'sex', '性别', '3', '未知', '1', '1', '3', '2018-02-05 11:38:51', '');
INSERT INTO `my_enum` VALUES ('4', 'is', '全局通用是否', '1', '是', '1', '1', '1', '2018-02-05 11:39:29', null);
INSERT INTO `my_enum` VALUES ('5', 'is', '全局通用是否', '0', '否', '1', '1', '2', '2018-02-05 11:39:57', null);
INSERT INTO `my_enum` VALUES ('6', 'module_type', '资源类型', '1', '模块菜单', '1', '1', '1', '2018-04-16 17:22:07', '');
INSERT INTO `my_enum` VALUES ('7', 'module_type', '资源类型', '2', '请求事件', '1', '1', '2', '2018-04-16 17:22:35', '');

-- ----------------------------
-- Table structure for my_module
-- ----------------------------
DROP TABLE IF EXISTS `my_module`;
CREATE TABLE `my_module` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `parent_id` int(10) NOT NULL COMMENT '所属上级',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `url` varchar(100) DEFAULT NULL COMMENT 'URL',
  `type` varchar(2) NOT NULL COMMENT '类型',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `is_enable` varchar(2) NOT NULL COMMENT '是否启用',
  `sort_no` int(10) DEFAULT NULL COMMENT '排序号',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `key1` (`parent_id`,`is_enable`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4  COMMENT='资源模块事件注册表';

-- ----------------------------
-- Records of my_module
-- ----------------------------
INSERT INTO `my_module` VALUES ('1', '0', '上海嘉靖银行', '', '1', '', '1', '1', '');
INSERT INTO `my_module` VALUES ('2', '1', '首页', '/', '1', 'glyphicon glyphicon-home', '1', '1', null);
INSERT INTO `my_module` VALUES ('3', '1', '系统管理', null, '1', 'glyphicons glyphicons-settings', '1', '2', null);
INSERT INTO `my_module` VALUES ('4', '3', '键值参数管理', 'sys/param/init', '1', 'glyphicons glyphicons-share_alt', '1', '1', null);
INSERT INTO `my_module` VALUES ('5', '3', '枚举类型管理', 'sys/enums/init', '1', 'glyphicons glyphicons-list', '1', '2', '');
INSERT INTO `my_module` VALUES ('6', '3', '资源模块管理', 'sys/module/init', '1', 'glyphicons glyphicons-snowflake', '1', '3', '');
INSERT INTO `my_module` VALUES ('7', '3', '组织机构管理', 'sys/org/init', '1', 'glyphicons glyphicons-building', '1', '4', '');
INSERT INTO `my_module` VALUES ('8', '3', '用户与授权管理', 'sys/user/init', '1', 'glyphicons glyphicons-user', '1', '5', null);
INSERT INTO `my_module` VALUES ('9', '3', '角色与授权管理', 'sys/role/init', '1', 'glyphicons glyphicons-direction', '1', '6', '');
INSERT INTO `my_module` VALUES ('50', '1', '参考范例', '', '1', 'glyphicons glyphicons-more_windows', '1', '20', '');
INSERT INTO `my_module` VALUES ('51', '50', '表单输入', '', '1', 'glyphicons glyphicons-chevron-right', '1', '1', '');
INSERT INTO `my_module` VALUES ('52', '4', '新增', 'sys/param/save', '2', '', '1', '1', '');
INSERT INTO `my_module` VALUES ('53', '4', '修改', 'sys/param/update', '2', '', '1', '1', '');
INSERT INTO `my_module` VALUES ('54', '4', '删除', 'sys/param/delete', '2', '', '1', '3', '');
INSERT INTO `my_module` VALUES ('55', '4', '查询列表', 'sys/param/list', '2', '', '1', '4', '');
INSERT INTO `my_module` VALUES ('56', '4', '查询对象', 'sys/param/get', '2', '', '1', '5', '');
INSERT INTO `my_module` VALUES ('57', '5', '新增', 'sys/enums/save', '2', null, '1', '1', null);
INSERT INTO `my_module` VALUES ('58', '5', '修改', 'sys/enums/update', '2', '', '1', '1', '');
INSERT INTO `my_module` VALUES ('59', '5', '删除', 'sys/enums/delete', '2', null, '1', '1', null);
INSERT INTO `my_module` VALUES ('60', '5', '查询列表', 'sys/enums/list', '2', null, '1', '1', null);
INSERT INTO `my_module` VALUES ('61', '5', '查询对象', 'sys/enums/get', '2', null, '1', '1', null);
INSERT INTO `my_module` VALUES ('62', '6', '新增', 'sys/module/save', '2', null, '1', '1', null);
INSERT INTO `my_module` VALUES ('63', '6', '修改', 'sys/module/update', '2', null, '1', '1', null);
INSERT INTO `my_module` VALUES ('64', '6', '删除', 'sys/module/delete', '2', null, '1', '1', null);
INSERT INTO `my_module` VALUES ('65', '6', '查询列表', 'sys/module/list', '2', null, '1', '1', null);
INSERT INTO `my_module` VALUES ('66', '6', '查询对象', 'sys/module/get', '2', '', '1', '1', '');
INSERT INTO `my_module` VALUES ('67', '6', '查询模块导航树', 'sys/module/listModuleTree', '2', null, '1', '1', null);
INSERT INTO `my_module` VALUES ('68', '7', '新增', 'sys/org/save', '2', null, '1', '1', null);
INSERT INTO `my_module` VALUES ('69', '7', '修改', 'sys/org/update', '2', '', '1', '1', '');
INSERT INTO `my_module` VALUES ('70', '7', '删除', 'sys/org/delete', '2', null, '1', '1', null);
INSERT INTO `my_module` VALUES ('71', '7', '查询列表', 'sys/org/list', '2', null, '1', '1', null);
INSERT INTO `my_module` VALUES ('72', '7', '查询对象', 'sys/org/get', '2', '', '1', '1', '');
INSERT INTO `my_module` VALUES ('73', '7', '查询组织机构部门导航树', 'sys/org/listOrgTree', '2', null, '1', '1', null);
INSERT INTO `my_module` VALUES ('74', '8', '新增', 'sys/user/save', '2', null, '1', '1', null);
INSERT INTO `my_module` VALUES ('75', '8', '修改', 'sys/user/update', '2', null, '1', '1', null);
INSERT INTO `my_module` VALUES ('76', '8', '删除', 'sys/user/delete', '2', '', '1', '1', '');
INSERT INTO `my_module` VALUES ('77', '8', '查询列表', 'sys/user/list', '2', null, '1', '1', null);
INSERT INTO `my_module` VALUES ('78', '8', '查询对象', 'sys/user/get', '2', null, '1', '1', null);
INSERT INTO `my_module` VALUES ('79', '8', '查询组织机构部门导航树', 'sys/org/listOrgTree', '2', null, '1', '1', null);
INSERT INTO `my_module` VALUES ('80', '8', '查询授权角色列表', 'sys/user/listRoleGrantInfo', '2', null, '1', '1', null);
INSERT INTO `my_module` VALUES ('81', '8', '授权', 'sys/user/grant', '2', null, '1', '1', null);
INSERT INTO `my_module` VALUES ('82', '8', '重置密码', 'sys/user/resetPwd', '2', null, '1', '1', null);
INSERT INTO `my_module` VALUES ('83', '9', '新增', 'sys/role/save', '2', null, '1', '1', null);
INSERT INTO `my_module` VALUES ('84', '9', '修改', 'sys/role/update', '2', null, '1', '1', null);
INSERT INTO `my_module` VALUES ('85', '9', '删除', 'sys/role/delete', '2', null, '1', '1', null);
INSERT INTO `my_module` VALUES ('86', '9', '查询列表', 'sys/role/list', '2', null, '1', '1', null);
INSERT INTO `my_module` VALUES ('87', '9', '查询对象', 'sys/role/get', '2', null, '1', '1', null);
INSERT INTO `my_module` VALUES ('88', '9', '查询授权资源树', 'sys/role/listGrantTree', '2', null, '1', '1', null);
INSERT INTO `my_module` VALUES ('89', '9', '授权', 'sys/role/grant', '2', null, '1', '1', null);
INSERT INTO `my_module` VALUES ('90', '2', '修改密码', 'sys/user/updatePwd', '2', null, '1', '1', null);
INSERT INTO `my_module` VALUES ('91', '2', '安全退出', 'logout', '2', null, '1', '1', null);
INSERT INTO `my_module` VALUES ('93', '9', '同步缓存', 'sys/cache/cacheRolesAuth', '2', null, '1', '1', null);
INSERT INTO `my_module` VALUES ('94', '6', '同步缓存', 'sys/cache/cacheModules', '2', null, '1', '1', null);
INSERT INTO `my_module` VALUES ('95', '5', '同步缓存', 'sys/cache/syncCfgCache', '2', null, '1', '1', null);
INSERT INTO `my_module` VALUES ('96', '4', '同步缓存', 'sys/cache/syncCfgCache', '2', null, '1', '1', null);

-- ----------------------------
-- Table structure for my_org
-- ----------------------------
DROP TABLE IF EXISTS `my_org`;
CREATE TABLE `my_org` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `name` varchar(50) NOT NULL COMMENT '组织名称',
  `parent_id` int(10) NOT NULL COMMENT '父节点流水号',
  `is_expanded` varchar(2) DEFAULT NULL COMMENT '是否自动展开',
  `icon` varchar(50) DEFAULT NULL COMMENT '节点图标',
  `type` varchar(2) NOT NULL COMMENT '组织类型',
  `biz_code` varchar(50) DEFAULT NULL COMMENT '扩展码',
  `sort_no` int(10) DEFAULT NULL COMMENT '排序号',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展JSON',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by_id` int(10) NOT NULL COMMENT '创建人ID',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `key1` (`parent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4  COMMENT='组织机构表';

-- ----------------------------
-- Records of my_org
-- ----------------------------
INSERT INTO `my_org` VALUES ('1', '上海嘉靖银行', '0', '1', null, '1', '', '1', '', '2018-03-13 09:27:13', '1', '超级用户', '');
INSERT INTO `my_org` VALUES ('2', '信息技术部', '1', null, null, '1', null, '10', null, '2018-03-13 09:28:00', '1', '超级用户', null);
INSERT INTO `my_org` VALUES ('3', '小微信贷事业部', '1', '1', null, '1', '', '40', '', '2018-03-13 09:28:32', '1', '超级用户', '');
INSERT INTO `my_org` VALUES ('4', '公司金融事业部', '1', '1', null, '1', '', '50', '', '2018-03-13 23:24:53', '1', '超级用户', '');
INSERT INTO `my_org` VALUES ('5', '昆明盘龙区支行', '4', '1', null, '1', '', '10', '', '2018-03-13 09:29:41', '1', '超级用户', '');
INSERT INTO `my_org` VALUES ('6', '大理古城支行', '4', null, null, '1', null, '20', null, '2018-03-13 09:30:09', '1', '超级用户', null);
INSERT INTO `my_org` VALUES ('7', '全国信销网点', '3', null, '', '1', null, '30', null, '2018-03-23 10:52:53', '1', '超级用户', null);
INSERT INTO `my_org` VALUES ('8', '人力资源部', '1', '1', '', '1', '', '20', '', '2018-03-27 13:36:58', '1', '超级用户', '');
INSERT INTO `my_org` VALUES ('9', '财务结算部', '3', null, '', '1', null, '20', null, '2018-03-27 13:57:43', '1', '超级用户', null);
INSERT INTO `my_org` VALUES ('10', '风险管理部', '3', null, '', '1', null, '10', null, '2018-03-27 13:58:45', '1', '超级用户', null);
INSERT INTO `my_org` VALUES ('11', '苏州营业部', '7', null, '', '1', null, '10', null, '2018-03-27 14:01:45', '1', '超级用户', null);
INSERT INTO `my_org` VALUES ('12', '无锡营业部', '7', null, '', '1', null, '20', null, '2018-03-27 14:02:27', '1', '超级用户', null);

-- ----------------------------
-- Table structure for my_param
-- ----------------------------
DROP TABLE IF EXISTS `my_param`;
CREATE TABLE `my_param` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `name` varchar(50) NOT NULL COMMENT '参数名称',
  `param_key` varchar(50) NOT NULL COMMENT '参数键',
  `value` varchar(100) DEFAULT NULL COMMENT '参数值',
  `type` varchar(2) DEFAULT NULL COMMENT '所属分类',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ukey1` (`param_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4  COMMENT='键值参数表';

-- ----------------------------
-- Records of my_param
-- ----------------------------
INSERT INTO `my_param` VALUES ('1', '系统名称', 'sys_logo_name', '嘉靖银行', '0', '2018-03-29 10:24:40', '左上角作为logo显示');
INSERT INTO `my_param` VALUES ('2', '系统标题', 'sys_title', 'MyClouds：轻量级微服务治理及快速开发平台', '0', '2018-02-22 12:01:58', '浏览器标题栏');
INSERT INTO `my_param` VALUES ('3', '系统主题', 'default_theme', 'classic', '0', '2018-02-05 11:20:05', '');
INSERT INTO `my_param` VALUES ('4', '系统皮肤', 'default_skin', 'blue', '0', '2018-02-05 11:20:34', '');
INSERT INTO `my_param` VALUES ('5', '是否启用授权过滤器', 'authfilter_is_enable', '1', '0', '2018-06-29 13:55:16', '为保证最高性价比，此参数需要重启admin-server方能生效。可选值：1-启用；0-停用。');
INSERT INTO `my_param` VALUES ('6', '授权过滤器排除项', 'authfilter_exclude_keys', '/theme/,/js/,/css/,/img/,/login', '0', '2018-06-29 13:56:30', '为保证最高性价比，此参数需要重启admin-server方能生效。');

-- ----------------------------
-- Table structure for my_role
-- ----------------------------
DROP TABLE IF EXISTS `my_role`;
CREATE TABLE `my_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT ' 流水号',
  `name` varchar(50) NOT NULL COMMENT '角色名称',
  `is_enable` varchar(2) NOT NULL COMMENT '是否启用',
  `type` varchar(2) NOT NULL COMMENT '角色类型',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展字段(JSON)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by_id` int(10) NOT NULL COMMENT '创建人ID',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4  COMMENT='角色表';

-- ----------------------------
-- Records of my_role
-- ----------------------------
INSERT INTO `my_role` VALUES ('1', '超级权限角色', '1', '1', '', '', '2018-03-07 13:09:05', '1', '超级用户');
INSERT INTO `my_role` VALUES ('2', '财务角色', '1', '1', '', '', '2018-03-14 17:26:36', '1', '超级用户');

-- ----------------------------
-- Table structure for my_role_module
-- ----------------------------
DROP TABLE IF EXISTS `my_role_module`;
CREATE TABLE `my_role_module` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `role_id` int(10) NOT NULL COMMENT ' 角色流水号',
  `module_id` int(10) NOT NULL COMMENT '功能模块流水号',
  `grant_type` varchar(2) NOT NULL COMMENT '权限类型',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` int(10) NOT NULL COMMENT '创建人ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ukey1` (`role_id`,`module_id`,`grant_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=467 DEFAULT CHARSET=utf8mb4  COMMENT='功能模块-角色关联表';

-- ----------------------------
-- Records of my_role_module
-- ----------------------------
INSERT INTO `my_role_module` VALUES ('412', '1', '1', '1', '2018-06-29 00:39:16', '1');
INSERT INTO `my_role_module` VALUES ('413', '1', '2', '1', '2018-06-29 00:39:17', '1');
INSERT INTO `my_role_module` VALUES ('414', '1', '90', '1', '2018-06-29 00:39:17', '1');
INSERT INTO `my_role_module` VALUES ('415', '1', '91', '1', '2018-06-29 00:39:17', '1');
INSERT INTO `my_role_module` VALUES ('416', '1', '3', '1', '2018-06-29 00:39:17', '1');
INSERT INTO `my_role_module` VALUES ('417', '1', '4', '1', '2018-06-29 00:39:17', '1');
INSERT INTO `my_role_module` VALUES ('418', '1', '52', '1', '2018-06-29 00:39:17', '1');
INSERT INTO `my_role_module` VALUES ('419', '1', '53', '1', '2018-06-29 00:39:17', '1');
INSERT INTO `my_role_module` VALUES ('420', '1', '54', '1', '2018-06-29 00:39:17', '1');
INSERT INTO `my_role_module` VALUES ('421', '1', '55', '1', '2018-06-29 00:39:17', '1');
INSERT INTO `my_role_module` VALUES ('422', '1', '56', '1', '2018-06-29 00:39:17', '1');
INSERT INTO `my_role_module` VALUES ('423', '1', '96', '1', '2018-06-29 00:39:17', '1');
INSERT INTO `my_role_module` VALUES ('424', '1', '5', '1', '2018-06-29 00:39:17', '1');
INSERT INTO `my_role_module` VALUES ('425', '1', '57', '1', '2018-06-29 00:39:17', '1');
INSERT INTO `my_role_module` VALUES ('426', '1', '58', '1', '2018-06-29 00:39:17', '1');
INSERT INTO `my_role_module` VALUES ('427', '1', '59', '1', '2018-06-29 00:39:17', '1');
INSERT INTO `my_role_module` VALUES ('428', '1', '60', '1', '2018-06-29 00:39:17', '1');
INSERT INTO `my_role_module` VALUES ('429', '1', '61', '1', '2018-06-29 00:39:17', '1');
INSERT INTO `my_role_module` VALUES ('430', '1', '95', '1', '2018-06-29 00:39:17', '1');
INSERT INTO `my_role_module` VALUES ('431', '1', '6', '1', '2018-06-29 00:39:17', '1');
INSERT INTO `my_role_module` VALUES ('432', '1', '62', '1', '2018-06-29 00:39:18', '1');
INSERT INTO `my_role_module` VALUES ('433', '1', '63', '1', '2018-06-29 00:39:18', '1');
INSERT INTO `my_role_module` VALUES ('434', '1', '64', '1', '2018-06-29 00:39:18', '1');
INSERT INTO `my_role_module` VALUES ('435', '1', '65', '1', '2018-06-29 00:39:18', '1');
INSERT INTO `my_role_module` VALUES ('436', '1', '66', '1', '2018-06-29 00:39:18', '1');
INSERT INTO `my_role_module` VALUES ('437', '1', '67', '1', '2018-06-29 00:39:18', '1');
INSERT INTO `my_role_module` VALUES ('438', '1', '94', '1', '2018-06-29 00:39:18', '1');
INSERT INTO `my_role_module` VALUES ('439', '1', '7', '1', '2018-06-29 00:39:18', '1');
INSERT INTO `my_role_module` VALUES ('440', '1', '68', '1', '2018-06-29 00:39:18', '1');
INSERT INTO `my_role_module` VALUES ('441', '1', '69', '1', '2018-06-29 00:39:18', '1');
INSERT INTO `my_role_module` VALUES ('442', '1', '70', '1', '2018-06-29 00:39:18', '1');
INSERT INTO `my_role_module` VALUES ('443', '1', '71', '1', '2018-06-29 00:39:18', '1');
INSERT INTO `my_role_module` VALUES ('444', '1', '72', '1', '2018-06-29 00:39:18', '1');
INSERT INTO `my_role_module` VALUES ('445', '1', '73', '1', '2018-06-29 00:39:18', '1');
INSERT INTO `my_role_module` VALUES ('446', '1', '8', '1', '2018-06-29 00:39:18', '1');
INSERT INTO `my_role_module` VALUES ('447', '1', '74', '1', '2018-06-29 00:39:18', '1');
INSERT INTO `my_role_module` VALUES ('448', '1', '75', '1', '2018-06-29 00:39:18', '1');
INSERT INTO `my_role_module` VALUES ('449', '1', '76', '1', '2018-06-29 00:39:18', '1');
INSERT INTO `my_role_module` VALUES ('450', '1', '77', '1', '2018-06-29 00:39:18', '1');
INSERT INTO `my_role_module` VALUES ('451', '1', '78', '1', '2018-06-29 00:39:19', '1');
INSERT INTO `my_role_module` VALUES ('452', '1', '79', '1', '2018-06-29 00:39:19', '1');
INSERT INTO `my_role_module` VALUES ('453', '1', '80', '1', '2018-06-29 00:39:19', '1');
INSERT INTO `my_role_module` VALUES ('454', '1', '81', '1', '2018-06-29 00:39:19', '1');
INSERT INTO `my_role_module` VALUES ('455', '1', '82', '1', '2018-06-29 00:39:19', '1');
INSERT INTO `my_role_module` VALUES ('456', '1', '9', '1', '2018-06-29 00:39:19', '1');
INSERT INTO `my_role_module` VALUES ('457', '1', '83', '1', '2018-06-29 00:39:19', '1');
INSERT INTO `my_role_module` VALUES ('458', '1', '84', '1', '2018-06-29 00:39:19', '1');
INSERT INTO `my_role_module` VALUES ('459', '1', '85', '1', '2018-06-29 00:39:19', '1');
INSERT INTO `my_role_module` VALUES ('460', '1', '86', '1', '2018-06-29 00:39:19', '1');
INSERT INTO `my_role_module` VALUES ('461', '1', '87', '1', '2018-06-29 00:39:19', '1');
INSERT INTO `my_role_module` VALUES ('462', '1', '88', '1', '2018-06-29 00:39:19', '1');
INSERT INTO `my_role_module` VALUES ('463', '1', '89', '1', '2018-06-29 00:39:19', '1');
INSERT INTO `my_role_module` VALUES ('464', '1', '93', '1', '2018-06-29 00:39:19', '1');
INSERT INTO `my_role_module` VALUES ('465', '1', '50', '1', '2018-06-29 00:39:19', '1');
INSERT INTO `my_role_module` VALUES ('466', '1', '51', '1', '2018-06-29 00:39:19', '1');

-- ----------------------------
-- Table structure for my_user
-- ----------------------------
DROP TABLE IF EXISTS `my_user`;
CREATE TABLE `my_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `account` varchar(50) NOT NULL COMMENT '用户登录帐号',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `name` varchar(50) NOT NULL COMMENT '用户姓名',
  `sex` varchar(2) DEFAULT NULL COMMENT '性别',
  `status` varchar(2) NOT NULL COMMENT '用户状态',
  `type` varchar(2) NOT NULL COMMENT '用户类型',
  `org_id` int(10) NOT NULL COMMENT '所属部门流水号',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮件',
  `mobile` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `idno` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `biz_code` varchar(50) DEFAULT NULL COMMENT '扩展码',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展JSON',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by_id` int(10) NOT NULL COMMENT '创建人ID',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ukey1` (`account`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4  COMMENT='后台用户基本信息表';

-- ----------------------------
-- Records of my_user
-- ----------------------------
INSERT INTO `my_user` VALUES ('1', 'root', 'e191b3d853e8f7a9e638d6082915c1fd', '超级用户', '1', '1', '1', '1', '', '', null, '', '', '2018-03-02 17:02:05', '1', '超级用户', '');
INSERT INTO `my_user` VALUES ('4', 'dev', 'e191b3d853e8f7a9e638d6082915c1fd', '开发者', '3', '1', '1', '2', null, null, null, null, null, '2018-04-03 14:18:04', '1', '超级用户', null);

-- ----------------------------
-- Table structure for my_user_role
-- ----------------------------
DROP TABLE IF EXISTS `my_user_role`;
CREATE TABLE `my_user_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `user_id` int(10) NOT NULL COMMENT '用户流水号',
  `role_id` int(10) NOT NULL COMMENT '角色流水号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by_id` int(10) NOT NULL COMMENT '创建人ID',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ukey1` (`user_id`,`role_id`) USING BTREE,
  KEY `key1` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4  COMMENT='用户-角色关联表';

-- ----------------------------
-- Records of my_user_role
-- ----------------------------
INSERT INTO `my_user_role` VALUES ('1', '1', '1', '2018-03-07 13:16:37', '1', null);
