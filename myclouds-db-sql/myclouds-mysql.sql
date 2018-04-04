/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50628
Source Host           : 127.0.0.1:3306
Source Database       : myclouds

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2018-04-04 21:44:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for my_enum
-- ----------------------------
DROP TABLE IF EXISTS `my_enum`;
CREATE TABLE `my_enum` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `enum_key` varchar(50) NOT NULL COMMENT '枚举类型KEY',
  `enum_name` varchar(255) NOT NULL COMMENT '枚举类型名称',
  `element_key` varchar(50) NOT NULL COMMENT '枚举元素KEY',
  `element_value` varchar(255) NOT NULL COMMENT '枚举元素值',
  `is_enable` varchar(2) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `type` varchar(2) NOT NULL COMMENT '所属分类',
  `sort_no` int(4) DEFAULT NULL COMMENT '排序号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ukey1` (`enum_key`,`element_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='枚举类型参数表';

-- ----------------------------
-- Records of my_enum
-- ----------------------------
INSERT INTO `my_enum` VALUES ('1', 'sex', '性别', '1', '男', '1', '1', '1', '2018-02-05 11:35:51', null);
INSERT INTO `my_enum` VALUES ('2', 'sex', '性别', '2', '女', '1', '1', '2', '2018-02-05 11:36:15', null);
INSERT INTO `my_enum` VALUES ('3', 'sex', '性别', '3', '未知', '0', '1', '3', '2018-02-05 11:38:51', null);
INSERT INTO `my_enum` VALUES ('4', 'is', '全局通用是否', '1', '是', '1', '1', '1', '2018-02-05 11:39:29', null);
INSERT INTO `my_enum` VALUES ('5', 'is', '全局通用是否', '0', '否', '1', '1', '2', '2018-02-05 11:39:57', null);

-- ----------------------------
-- Table structure for my_module
-- ----------------------------
DROP TABLE IF EXISTS `my_module`;
CREATE TABLE `my_module` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '功能模块流水号',
  `parent_id` int(10) NOT NULL COMMENT '父节点流水号',
  `name` varchar(50) NOT NULL COMMENT '功能模块名称',
  `url` varchar(100) DEFAULT NULL COMMENT '主页面URL',
  `is_folder` varchar(2) DEFAULT NULL COMMENT '是否为树枝节点（停用，维护成本高）',
  `is_expanded` varchar(2) DEFAULT NULL COMMENT '是否自动展开',
  `icon` varchar(50) DEFAULT NULL COMMENT '节点图标',
  `is_enable` varchar(2) NOT NULL COMMENT '是否启用',
  `sort_no` int(10) DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`id`),
  KEY `key1` (`parent_id`,`is_enable`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COMMENT='功能模块表';

-- ----------------------------
-- Records of my_module
-- ----------------------------
INSERT INTO `my_module` VALUES ('1', '0', '功能模块', null, null, null, null, '1', '1');
INSERT INTO `my_module` VALUES ('2', '1', '首页', '/', null, null, 'glyphicons glyphicons-home', '1', '1');
INSERT INTO `my_module` VALUES ('3', '1', '系统管理', null, null, null, 'glyphicons glyphicons-settings', '1', '2');
INSERT INTO `my_module` VALUES ('4', '3', '键值参数管理', 'sys/param/init', null, null, 'glyphicons glyphicons-share_alt', '1', '1');
INSERT INTO `my_module` VALUES ('5', '3', '枚举类型管理', 'sys/enums/init', null, null, 'glyphicons glyphicons-list', '1', '2');
INSERT INTO `my_module` VALUES ('6', '3', '资源模块管理', 'sys/module/init', null, null, 'glyphicons glyphicons-snowflake', '1', '3');
INSERT INTO `my_module` VALUES ('7', '3', '组织机构管理', 'sys/org/init', null, null, 'glyphicons glyphicons-building', '1', '4');
INSERT INTO `my_module` VALUES ('8', '3', '用户与授权管理', 'sys/user/init', null, null, 'glyphicons glyphicons-user', '1', '5');
INSERT INTO `my_module` VALUES ('9', '3', '角色与授权管理', 'sys/role/init', null, null, 'glyphicons glyphicons-direction', '1', '6');
INSERT INTO `my_module` VALUES ('50', '1', '参考范例', null, null, null, 'glyphicons glyphicons-more_windows', '1', '20');
INSERT INTO `my_module` VALUES ('51', '50', '表单输入', null, null, null, 'glyphicons glyphicons-chevron-right', '1', '1');

-- ----------------------------
-- Table structure for my_org
-- ----------------------------
DROP TABLE IF EXISTS `my_org`;
CREATE TABLE `my_org` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `name` varchar(50) NOT NULL COMMENT '组织名称',
  `parent_id` int(10) NOT NULL COMMENT '父节点流水号',
  `is_folder` varchar(2) DEFAULT NULL COMMENT '是否为树枝节点（停用，维护成本高）',
  `is_expanded` varchar(2) DEFAULT NULL COMMENT '是否自动展开',
  `icon` varchar(100) DEFAULT '' COMMENT '节点图标',
  `type` varchar(2) NOT NULL COMMENT '组织类型',
  `biz_code` varchar(50) DEFAULT NULL COMMENT '扩展码',
  `sort_no` int(10) DEFAULT NULL COMMENT '排序号',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `ext` varchar(500) DEFAULT NULL COMMENT '扩展JSON',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by_id` int(10) NOT NULL COMMENT '创建人ID',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`),
  KEY `key1` (`parent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='组织机构表';

-- ----------------------------
-- Records of my_org
-- ----------------------------
INSERT INTO `my_org` VALUES ('1', '上海嘉靖银行', '0', null, null, null, '1', null, '1', null, '', '2018-03-13 09:27:13', '1', '超级用户');
INSERT INTO `my_org` VALUES ('2', '信息技术部', '1', null, null, null, '1', null, '10', null, null, '2018-03-13 09:28:00', '1', '超级用户');
INSERT INTO `my_org` VALUES ('3', '小微信贷事业部', '1', null, null, null, '1', null, '40', null, null, '2018-03-13 09:28:32', '1', '超级用户');
INSERT INTO `my_org` VALUES ('4', '公司金融事业部', '1', null, null, null, '1', null, '50', null, null, '2018-03-13 23:24:53', '1', '超级用户');
INSERT INTO `my_org` VALUES ('5', '昆明盘龙区支行', '4', null, '1', null, '1', '', '10', '', '', '2018-03-13 09:29:41', '1', '超级用户');
INSERT INTO `my_org` VALUES ('6', '大理古城支行', '4', null, null, null, '1', null, '20', null, null, '2018-03-13 09:30:09', '1', '超级用户');
INSERT INTO `my_org` VALUES ('7', '全国信销网点', '3', null, null, '', '1', null, '30', null, null, '2018-03-23 10:52:53', '1', '超级用户');
INSERT INTO `my_org` VALUES ('8', '人力资源部', '1', null, null, '', '1', null, '20', null, null, '2018-03-27 13:36:58', '1', '超级用户');
INSERT INTO `my_org` VALUES ('9', '财务结算部', '3', null, null, '', '1', null, '20', null, null, '2018-03-27 13:57:43', '1', '超级用户');
INSERT INTO `my_org` VALUES ('10', '风险管理部', '3', null, null, '', '1', null, '10', null, null, '2018-03-27 13:58:45', '1', '超级用户');
INSERT INTO `my_org` VALUES ('11', '苏州营业部', '7', null, null, '', '1', null, '10', null, null, '2018-03-27 14:01:45', '1', '超级用户');
INSERT INTO `my_org` VALUES ('12', '无锡营业部', '7', null, null, '', '1', null, '20', null, null, '2018-03-27 14:02:27', '1', '超级用户');

-- ----------------------------
-- Table structure for my_param
-- ----------------------------
DROP TABLE IF EXISTS `my_param`;
CREATE TABLE `my_param` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `name` varchar(50) NOT NULL COMMENT '参数名称',
  `param_key` varchar(50) NOT NULL COMMENT '参数键',
  `value` varchar(200) DEFAULT NULL COMMENT '参数值',
  `type` varchar(2) DEFAULT NULL COMMENT '所属分类',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ukey1` (`param_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='键值参数表';

-- ----------------------------
-- Records of my_param
-- ----------------------------
INSERT INTO `my_param` VALUES ('1', '系统名称', 'sys_logo_name', '嘉靖银行', '0', '2018-03-29 10:24:40', '左上角作为logo显示');
INSERT INTO `my_param` VALUES ('2', '系统标题', 'sys_title', 'MyClouds：轻量级微服务治理及快速开发平台', '0', '2018-02-22 12:01:58', '浏览器标题栏');
INSERT INTO `my_param` VALUES ('3', '系统主题', 'default_theme', 'classic', '0', '2018-02-05 11:20:05', '');
INSERT INTO `my_param` VALUES ('4', '系统皮肤', 'default_skin', 'blue', '0', '2018-02-05 11:20:34', null);

-- ----------------------------
-- Table structure for my_role
-- ----------------------------
DROP TABLE IF EXISTS `my_role`;
CREATE TABLE `my_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT ' 流水号',
  `name` varchar(50) NOT NULL COMMENT '角色名称',
  `is_enable` varchar(2) NOT NULL COMMENT '是否启用',
  `type` varchar(2) NOT NULL COMMENT '角色类型',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `ext` varchar(500) DEFAULT NULL COMMENT '扩展字段(JSON)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by_id` int(10) NOT NULL COMMENT '创建人ID',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

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
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4 COMMENT='功能模块-角色关联表';

-- ----------------------------
-- Records of my_role_module
-- ----------------------------
INSERT INTO `my_role_module` VALUES ('167', '1', '1', '1', '2018-04-02 13:25:08', '1');
INSERT INTO `my_role_module` VALUES ('168', '1', '2', '1', '2018-04-02 13:25:08', '1');
INSERT INTO `my_role_module` VALUES ('169', '1', '3', '1', '2018-04-02 13:25:08', '1');
INSERT INTO `my_role_module` VALUES ('170', '1', '4', '1', '2018-04-02 13:25:08', '1');
INSERT INTO `my_role_module` VALUES ('171', '1', '5', '1', '2018-04-02 13:25:08', '1');
INSERT INTO `my_role_module` VALUES ('172', '1', '6', '1', '2018-04-02 13:25:08', '1');
INSERT INTO `my_role_module` VALUES ('173', '1', '7', '1', '2018-04-02 13:25:08', '1');
INSERT INTO `my_role_module` VALUES ('174', '1', '8', '1', '2018-04-02 13:25:08', '1');
INSERT INTO `my_role_module` VALUES ('175', '1', '9', '1', '2018-04-02 13:25:08', '1');
INSERT INTO `my_role_module` VALUES ('176', '1', '50', '1', '2018-04-02 13:25:08', '1');
INSERT INTO `my_role_module` VALUES ('177', '1', '51', '1', '2018-04-02 13:25:08', '1');

-- ----------------------------
-- Table structure for my_user
-- ----------------------------
DROP TABLE IF EXISTS `my_user`;
CREATE TABLE `my_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `account` varchar(50) NOT NULL COMMENT '用户登录帐号',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `name` varchar(50) NOT NULL COMMENT '用户姓名',
  `sex` varchar(2) DEFAULT NULL COMMENT '性别',
  `status` varchar(2) NOT NULL COMMENT '用户状态',
  `type` varchar(2) NOT NULL COMMENT '用户类型',
  `org_id` int(10) NOT NULL COMMENT '所属部门流水号',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮件',
  `mobile` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `idno` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `address` varchar(100) DEFAULT NULL COMMENT '联系地址(停用)',
  `biz_code` varchar(50) DEFAULT NULL COMMENT '扩展码',
  `ext` varchar(500) DEFAULT NULL COMMENT '扩展JSON',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by_id` int(10) NOT NULL COMMENT '创建人ID',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ukey1` (`account`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='后台用户基本信息表';

-- ----------------------------
-- Records of my_user
-- ----------------------------
INSERT INTO `my_user` VALUES ('1', 'root', 'e191b3d853e8f7a9e638d6082915c1fd', '超级用户', '1', '1', '1', '1', '', '', null, null, '', '', '2018-03-02 17:02:05', '1', '超级用户', '');
INSERT INTO `my_user` VALUES ('4', 'dev', 'e191b3d853e8f7a9e638d6082915c1fd', '开发者', '3', '1', '1', '2', null, null, null, null, null, null, '2018-04-03 14:18:04', '1', '超级用户', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户-角色关联表';

-- ----------------------------
-- Records of my_user_role
-- ----------------------------
INSERT INTO `my_user_role` VALUES ('1', '1', '1', '2018-03-07 13:16:37', '1', null);
