/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 80011
Source Host           : 127.0.0.1:3306
Source Database       : myclouds-system

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2019-06-30 23:39:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for my_dict
-- ----------------------------
DROP TABLE IF EXISTS `my_dict`;
CREATE TABLE `my_dict` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `dict_type` varchar(50) NOT NULL COMMENT '分组标识',
  `dict_name` varchar(50) NOT NULL COMMENT '分组名称',
  `dict_key` varchar(50) NOT NULL COMMENT '字典KEY',
  `dict_value` varchar(100) NOT NULL COMMENT '字典值',
  `is_enable` varchar(2) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `sort_no` int(4) DEFAULT NULL COMMENT '排序号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ukey1` (`dict_type`,`dict_key`) USING BTREE,
  KEY `index1` (`dict_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4   COMMENT='数据字典表';

-- ----------------------------
-- Records of my_dict
-- ----------------------------
INSERT INTO `my_dict` VALUES ('1', 'sex', '性别', '1', '男', '1', '1', '2018-02-05 11:35:51', null);
INSERT INTO `my_dict` VALUES ('2', 'sex', '性别', '2', '女', '1', '2', '2018-02-05 11:36:15', null);
INSERT INTO `my_dict` VALUES ('3', 'sex', '性别', '3', '未知', '1', '3', '2018-02-05 11:38:51', '');
INSERT INTO `my_dict` VALUES ('4', 'is', '全局通用是否', '1', '是', '1', '1', '2018-02-05 11:39:29', null);
INSERT INTO `my_dict` VALUES ('5', 'is', '全局通用是否', '0', '否', '1', '2', '2018-02-05 11:39:57', null);
INSERT INTO `my_dict` VALUES ('50', 'role_module_type', '角色授权类型', '1', '业务经办权限', '1', '1', '2019-06-06 11:55:42', null);
INSERT INTO `my_dict` VALUES ('51', 'role_module_type', '角色授权类型', '2', '系统管理权限', '1', '2', '2019-06-06 11:55:56', null);
INSERT INTO `my_dict` VALUES ('52', 'user_status', '用户状态', '1', '激活', '1', '1', '2019-06-10 11:22:15', null);
INSERT INTO `my_dict` VALUES ('53', 'user_status', '用户状态', '2', '停用', '1', '2', '2019-06-10 11:22:37', null);
INSERT INTO `my_dict` VALUES ('54', 'user_status', '用户状态', '9', '注销', '1', '9', '2019-06-10 11:22:46', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4   COMMENT='资源模块事件注册表';

-- ----------------------------
-- Records of my_module
-- ----------------------------
INSERT INTO `my_module` VALUES ('1', '0', '欢迎页', 'views/home/welcome.html', '1', 'layui-icon layui-icon-home', '1', '10', null);
INSERT INTO `my_module` VALUES ('2', '0', '系统管理', '', '1', 'layui-icon layui-icon-component', '1', '20', null);
INSERT INTO `my_module` VALUES ('3', '0', '虚拟业务', '', '1', 'layui-icon layui-icon-app', '1', '30', null);
INSERT INTO `my_module` VALUES ('4', '2', '数据字典', 'views/system/dict.html', '1', '', '1', '3', null);
INSERT INTO `my_module` VALUES ('5', '2', '资源模块', 'views/system/module.html', '1', '', '1', '4', null);
INSERT INTO `my_module` VALUES ('6', '2', '组织机构', 'views/system/org.html', '1', '', '1', '5', null);
INSERT INTO `my_module` VALUES ('7', '2', '角色与授权', 'views/system/role.html', '1', '', '1', '6', null);
INSERT INTO `my_module` VALUES ('8', '2', '用户与授权', 'views/system/user.html', '1', '', '1', '20', null);
INSERT INTO `my_module` VALUES ('12', '3', '业务菜单1', 'views/home/404.html', '1', '', '1', '10', null);

-- ----------------------------
-- Table structure for my_org
-- ----------------------------
DROP TABLE IF EXISTS `my_org`;
CREATE TABLE `my_org` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `name` varchar(50) NOT NULL COMMENT '组织名称',
  `parent_id` int(10) NOT NULL COMMENT '父节点流水号',
  `type` varchar(2) NOT NULL DEFAULT '1' COMMENT '组织类型',
  `biz_code` varchar(50) DEFAULT NULL COMMENT '扩展码',
  `sort_no` int(10) DEFAULT NULL COMMENT '排序号',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展JSON',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by_id` int(10) NOT NULL COMMENT '创建人ID',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `key1` (`parent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4   COMMENT='组织机构表';

-- ----------------------------
-- Records of my_org
-- ----------------------------
INSERT INTO `my_org` VALUES ('1', 'MyClouds（根组织）', '0', '1', '', '1', '', '2018-03-13 09:27:13', '1', '超级用户', '');
INSERT INTO `my_org` VALUES ('2', '信息技术部', '1', '1', null, '10', null, '2018-03-13 09:28:00', '1', '超级用户', null);
INSERT INTO `my_org` VALUES ('3', '小微信贷事业部', '1', '1', '', '40', '', '2018-03-13 09:28:32', '1', '超级用户', '');
INSERT INTO `my_org` VALUES ('7', '全国信销网点', '3', '1', '', '30', '', '2018-03-23 10:52:53', '1', '超级用户', null);
INSERT INTO `my_org` VALUES ('8', '人力资源部', '1', '1', '', '20', '', '2018-03-27 13:36:58', '1', '超级用户', '');
INSERT INTO `my_org` VALUES ('9', '财务结算部', '3', '1', null, '20', null, '2018-03-27 13:57:43', '1', '超级用户', null);
INSERT INTO `my_org` VALUES ('10', '风险管理部', '3', '1', null, '10', null, '2018-03-27 13:58:45', '1', '超级用户', null);
INSERT INTO `my_org` VALUES ('11', '苏州营业部', '7', '1', null, '10', null, '2018-03-27 14:01:45', '1', '超级用户', null);
INSERT INTO `my_org` VALUES ('12', '无锡营业部', '7', '1', null, '20', null, '2018-03-27 14:02:27', '1', '超级用户', null);
INSERT INTO `my_org` VALUES ('17', '企业信贷事业部', '1', '1', '', '90', '', '2019-06-10 11:06:21', '1', '超级用户', null);
INSERT INTO `my_org` VALUES ('18', '风险管理部', '17', '1', null, '1', null, '2019-06-10 11:06:55', '1', '超级用户', null);

-- ----------------------------
-- Table structure for my_role
-- ----------------------------
DROP TABLE IF EXISTS `my_role`;
CREATE TABLE `my_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT ' 流水号',
  `name` varchar(50) NOT NULL COMMENT '角色名称',
  `is_enable` varchar(4) NOT NULL COMMENT '是否启用',
  `type` varchar(10) NOT NULL DEFAULT '1' COMMENT '角色类型',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展字段(JSON)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by_id` int(10) NOT NULL COMMENT '创建人ID',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4   COMMENT='角色表';

-- ----------------------------
-- Records of my_role
-- ----------------------------
INSERT INTO `my_role` VALUES ('1', '超级权限角色', '1', '1', '', '2018-03-07 13:09:05', '1', '超级用户');
INSERT INTO `my_role` VALUES ('2', '财务角色', '1', '1', '', '2018-03-14 17:26:36', '1', '超级用户');

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
) ENGINE=InnoDB AUTO_INCREMENT=1121 DEFAULT CHARSET=utf8mb4   COMMENT='功能模块-角色关联表';

-- ----------------------------
-- Records of my_role_module
-- ----------------------------
INSERT INTO `my_role_module` VALUES ('1088', '2', '3', '1', '2019-06-07 15:18:47', '1');
INSERT INTO `my_role_module` VALUES ('1089', '2', '12', '1', '2019-06-07 15:18:47', '1');
INSERT INTO `my_role_module` VALUES ('1112', '1', '1', '1', '2019-06-23 01:08:31', '1');
INSERT INTO `my_role_module` VALUES ('1113', '1', '2', '1', '2019-06-23 01:08:31', '1');
INSERT INTO `my_role_module` VALUES ('1114', '1', '4', '1', '2019-06-23 01:08:31', '1');
INSERT INTO `my_role_module` VALUES ('1115', '1', '5', '1', '2019-06-23 01:08:31', '1');
INSERT INTO `my_role_module` VALUES ('1116', '1', '6', '1', '2019-06-23 01:08:31', '1');
INSERT INTO `my_role_module` VALUES ('1117', '1', '7', '1', '2019-06-23 01:08:31', '1');
INSERT INTO `my_role_module` VALUES ('1118', '1', '8', '1', '2019-06-23 01:08:31', '1');
INSERT INTO `my_role_module` VALUES ('1119', '1', '3', '1', '2019-06-23 01:08:31', '1');
INSERT INTO `my_role_module` VALUES ('1120', '1', '12', '1', '2019-06-23 01:08:31', '1');

-- ----------------------------
-- Table structure for my_temp
-- ----------------------------
DROP TABLE IF EXISTS `my_temp`;
CREATE TABLE `my_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `device` varchar(255) DEFAULT NULL COMMENT '设备',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4   COMMENT='临时过度表：登陆信息';

-- ----------------------------
-- Table structure for my_user
-- ----------------------------
DROP TABLE IF EXISTS `my_user`;
CREATE TABLE `my_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `account` varchar(50) NOT NULL COMMENT '用户登录帐号',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `name` varchar(50) NOT NULL COMMENT '用户姓名',
  `status` varchar(2) NOT NULL COMMENT '用户状态',
  `type` varchar(2) NOT NULL DEFAULT '1' COMMENT '用户类型',
  `org_id` int(10) NOT NULL COMMENT '所属部门流水号',
  `biz_code` varchar(50) DEFAULT NULL COMMENT '扩展码',
  `ext` varchar(100) DEFAULT NULL COMMENT '扩展JSON',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by_id` int(10) NOT NULL COMMENT '创建人ID',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ukey1` (`account`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4   COMMENT='后台用户基本信息表';

-- ----------------------------
-- Records of my_user
-- ----------------------------
INSERT INTO `my_user` VALUES ('1', 'root', '4752fbbf95993f72c659296ac110f1b8', '超级用户', '1', '1', '1', '', '', '2018-03-02 17:02:05', '1', '超级用户');
INSERT INTO `my_user` VALUES ('4', 'dev', '4752fbbf95993f72c659296ac110f1b8', '开发者', '1', '1', '2', '', '', '2018-04-03 14:18:04', '1', '超级用户');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4   COMMENT='用户-角色关联表';

-- ----------------------------
-- Records of my_user_role
-- ----------------------------
INSERT INTO `my_user_role` VALUES ('1', '1', '1', '2018-03-07 13:16:37', '1', null);
INSERT INTO `my_user_role` VALUES ('9', '4', '1', '2019-06-30 21:25:34', '1', '超级用户');
INSERT INTO `my_user_role` VALUES ('10', '4', '2', '2019-06-30 21:25:38', '1', '超级用户');
