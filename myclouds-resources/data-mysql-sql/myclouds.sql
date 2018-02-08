/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50628
Source Host           : 127.0.0.1:3306
Source Database       : myclouds

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2018-02-08 10:33:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for my_enum
-- ----------------------------
DROP TABLE IF EXISTS `my_enum`;
CREATE TABLE `my_enum` (
  `id` int(10) NOT NULL COMMENT '流水号',
  `enum_key` varchar(50) NOT NULL COMMENT '枚举类型KEY',
  `enum_name` varchar(255) NOT NULL COMMENT '枚举类型名称',
  `element_key` varchar(50) NOT NULL COMMENT '枚举元素KEY',
  `element_value` varchar(255) NOT NULL COMMENT '枚举元素值',
  `is_enable` varchar(255) NOT NULL COMMENT '是否启用',
  `sys_key` varchar(255) NOT NULL COMMENT '所属系统识别码',
  `sort_no` int(4) DEFAULT NULL COMMENT '排序号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ukey1` (`enum_key`,`element_key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='枚举类型参数表';

-- ----------------------------
-- Records of my_enum
-- ----------------------------
INSERT INTO `my_enum` VALUES ('1', 'sex', '性别', '1', '男', '1', '0', '1', '2018-02-05 11:35:51', null);
INSERT INTO `my_enum` VALUES ('2', 'sex', '性别', '2', '女', '1', '0', '2', '2018-02-05 11:36:15', null);
INSERT INTO `my_enum` VALUES ('3', 'sex', '性别', '3', '未知', '1', '0', '3', '2018-02-05 11:38:51', null);
INSERT INTO `my_enum` VALUES ('4', 'is', '全局通用是否', '1', '是', '1', '0', '1', '2018-02-05 11:39:29', null);
INSERT INTO `my_enum` VALUES ('5', 'is', '全局通用是否', '0', '否', '1', '0', '2', '2018-02-05 11:39:57', null);

-- ----------------------------
-- Table structure for my_param
-- ----------------------------
DROP TABLE IF EXISTS `my_param`;
CREATE TABLE `my_param` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `name` varchar(50) NOT NULL COMMENT '参数名称',
  `param_key` varchar(50) NOT NULL COMMENT '参数键',
  `value` varchar(200) DEFAULT NULL COMMENT '参数值',
  `sys_key` varchar(2) DEFAULT NULL COMMENT '所属系统识别码',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ukey1` (`param_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='键值参数表';

-- ----------------------------
-- Records of my_param
-- ----------------------------
INSERT INTO `my_param` VALUES ('1', '缺省系统主题', 'default_theme', 'classic', '0', '2018-02-05 11:20:05', null);
INSERT INTO `my_param` VALUES ('2', '缺省系统皮肤', 'default_skin', 'blue', '0', '2018-02-05 11:20:34', null);
