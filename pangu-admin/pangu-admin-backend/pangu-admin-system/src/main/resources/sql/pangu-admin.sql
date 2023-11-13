/*
 Navicat MySQL Data Transfer

 Source Server         : root@localhost
 Source Server Type    : MySQL
 Source Server Version : 50731 (5.7.31)
 Source Host           : 127.0.0.1:3306
 Source Schema         : pangu-admin

 Target Server Type    : MySQL
 Target Server Version : 50731 (5.7.31)
 File Encoding         : 65001
 Date: 11/12/2022 20:39:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `name` varchar(50) NOT NULL COMMENT '部门名称',
  `parent_id` bigint(20) NOT NULL COMMENT '上级部门ID',
  `status` varchar(4) NOT NULL COMMENT '部门状态',
  `type` varchar(10) NOT NULL COMMENT '部门类型',
  `biz_code` varchar(50) DEFAULT NULL COMMENT '业务扩展码',
  `sort_no` int(10) NOT NULL COMMENT '排序号',
  `gmt_created` datetime NOT NULL COMMENT '创建时间',
  `created_by` varchar(25) DEFAULT NULL COMMENT '创建人',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `modified_by` varchar(25) DEFAULT NULL COMMENT '修改人',
  `remark` varchar(250) DEFAULT NULL COMMENT '备注',
  `deleted` bigint(20) NOT NULL DEFAULT '0' COMMENT '逻辑删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COMMENT='部门表';

-- ----------------------------
-- Records of dept
-- ----------------------------
BEGIN;
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (1, '总行部室', 0, '1', '1', NULL, 1, '2022-08-01 22:00:00', NULL, '2022-11-12 22:19:15', NULL, '', 0);
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (2, '直属机构', 0, '1', '1', NULL, 2, '2022-08-01 22:00:00', NULL, '2022-10-20 00:07:09', NULL, NULL, 0);
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (4, '战略规划部', 1, '1', '1', NULL, 2, '2022-08-01 22:00:00', NULL, '2022-09-03 20:32:10', NULL, NULL, 0);
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (5, '总行营业部', 2, '1', '1', NULL, 1, '2022-08-01 22:00:00', NULL, '2022-09-03 20:39:23', NULL, NULL, 0);
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (7, '董事会办公室', 1, '1', '1', NULL, 1, '2022-08-21 23:12:20', NULL, '2022-10-13 15:26:33', NULL, '', 0);
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (8, '人力资源部', 1, '1', '1', '', 1, '2022-08-21 23:12:43', NULL, '2022-11-21 11:20:00', NULL, '含党委组织部', 0);
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (9, '政策研究室', 1, '1', '1', '', 1, '2022-08-21 23:13:38', NULL, '2022-09-03 20:31:40', NULL, '', 0);
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (11, '总行调查评估中心', 2, '1', '1', '', 1, '2022-08-21 23:53:41', NULL, '2022-09-03 20:39:37', NULL, '', 0);
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (13, '省级分行', 0, '1', '1', '', 3, '2022-08-22 00:03:23', NULL, '2022-09-03 20:28:46', NULL, '', 0);
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (14, '云南省分行', 13, '1', '1', '', 1, '2022-09-02 22:52:13', NULL, '2022-09-04 17:21:08', NULL, '', 0);
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (15, '昆明市分行', 14, '1', '1', '', 1, '2022-09-03 11:38:35', NULL, '2022-09-03 20:53:46', NULL, '', 0);
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (16, '信息科技部', 1, '1', '1', '', 1, '2022-09-03 20:32:45', NULL, '2022-09-03 20:38:43', NULL, '', 0);
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (17, '信贷管理部', 1, '1', '1', '', 1, '2022-09-03 20:33:15', NULL, '2022-09-13 19:29:55', NULL, '', 0);
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (18, '风险管理部', 1, '1', '1', '', 1, '2022-09-03 20:33:31', NULL, NULL, NULL, '', 0);
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (19, '审计部门', 1, '1', '1', '', 1, '2022-09-03 20:33:42', NULL, '2022-09-03 20:33:50', NULL, '', 0);
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (20, '财务会计部', 1, '1', '1', '', 1, '2022-09-03 20:34:06', NULL, NULL, NULL, '', 0);
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (21, '运营管理部', 1, '1', '1', '', 1, '2022-09-03 20:34:30', NULL, NULL, NULL, '', 0);
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (22, '行政服务部', 1, '1', '1', '', 1, '2022-09-03 20:34:51', NULL, NULL, NULL, '', 0);
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (23, '信用审批部', 1, '1', '1', '', 1, '2022-09-03 20:35:14', NULL, NULL, NULL, '', 0);
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (24, '内控合规部', 1, '1', '1', '', 1, '2022-09-03 20:36:07', NULL, NULL, NULL, '', 0);
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (25, '乡村振兴部', 1, '1', '1', '', 1, '2022-09-03 20:37:20', NULL, NULL, NULL, '', 0);
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (26, '企业文化部', 1, '1', '1', '', 1, '2022-09-03 20:37:48', NULL, NULL, NULL, '含党委宣传部', 0);
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (27, '业务处理中心', 2, '1', '1', '', 1, '2022-09-03 20:40:00', NULL, NULL, NULL, '', 0);
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (28, '软件开发中心', 2, '1', '1', '', 1, '2022-09-03 20:40:23', NULL, NULL, NULL, '', 0);
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (29, '运行维护中心', 2, '1', '1', '', 1, '2022-09-03 20:40:34', NULL, NULL, NULL, '', 0);
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (30, '总行党校', 2, '1', '1', '', 1, '2022-09-03 20:41:01', NULL, NULL, NULL, '', 0);
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (31, '金融科技中心', 2, '1', '1', '', 1, '2022-09-03 20:41:22', NULL, NULL, NULL, '', 0);
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (32, '曲靖市分行', 14, '1', '1', '', 1, '2022-09-03 20:54:00', NULL, '2022-09-04 17:21:17', NULL, '', 0);
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (33, '大理州分行', 14, '1', '1', '', 1, '2022-09-03 20:54:17', NULL, '2022-09-04 16:52:47', NULL, '', 0);
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (34, '北京市分行', 13, '1', '1', '', 1, '2022-09-03 20:54:34', NULL, NULL, NULL, '', 0);
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (35, '上海市分行', 13, '1', '1', '', 1, '2022-09-03 20:54:45', NULL, NULL, NULL, '', 0);
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (36, '江苏省分行', 13, '1', '1', '', 1, '2022-09-03 20:55:06', NULL, NULL, NULL, '', 0);
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (37, '浙江省分行', 13, '1', '1', '', 1, '2022-09-03 20:55:19', NULL, NULL, NULL, '', 0);
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (38, '四川省分行', 13, '1', '1', '', 1, '2022-09-03 20:55:31', NULL, NULL, NULL, '', 0);
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (39, '浦东新区分行', 35, '1', '1', '', 1, '2022-09-03 20:56:10', NULL, '2022-10-13 15:25:26', NULL, '', 0);
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (40, '黄浦区分行', 35, '1', '1', '', 1, '2022-09-03 20:56:29', NULL, NULL, NULL, '', 0);
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (41, '弥渡县支行', 33, '1', '1', '', 1, '2022-09-03 20:56:59', NULL, '2022-09-04 16:52:06', NULL, '', 0);
INSERT INTO `dept` (`id`, `name`, `parent_id`, `status`, `type`, `biz_code`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (42, '祥云县支行', 33, '1', '1', '', 1, '2022-09-03 20:57:23', NULL, NULL, NULL, '', 0);
COMMIT;

-- ----------------------------
-- Table structure for log_fail
-- ----------------------------
DROP TABLE IF EXISTS `log_fail`;
CREATE TABLE `log_fail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT ' 流水号',
  `appName` varchar(50) NOT NULL COMMENT '应用名称标识',
  `path` varchar(100) NOT NULL COMMENT '路径入口标识',
  `tag` varchar(50) NOT NULL COMMENT '标签标识',
  `time_elapsed` int(11) NOT NULL DEFAULT '0' COMMENT '业务耗时',
  `gmt_executed` datetime NOT NULL COMMENT '经办时间',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '经办人',
  `created_by_name` varchar(25) NOT NULL DEFAULT '' COMMENT '经办人姓名',
  `gmt_created` datetime NOT NULL COMMENT '创建时间',
  `input` varchar(250) NOT NULL DEFAULT '' COMMENT '输入',
  `output` varchar(250) NOT NULL DEFAULT '' COMMENT '输出',
  `deleted` bigint(20) NOT NULL DEFAULT '0' COMMENT '逻辑删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COMMENT='操作日志表(失败)';

-- ----------------------------
-- Records of log_fail
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for log_success
-- ----------------------------
DROP TABLE IF EXISTS `log_success`;
CREATE TABLE `log_success` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT ' 流水号',
  `appName` varchar(50) NOT NULL COMMENT '应用名称标识',
  `path` varchar(100) NOT NULL COMMENT '路径入口标识',
  `tag` varchar(50) NOT NULL COMMENT '标签标识',
  `time_elapsed` int(11) NOT NULL DEFAULT '0' COMMENT '业务耗时',
  `gmt_executed` datetime NOT NULL COMMENT '经办时间',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '经办人',
  `created_by_name` varchar(25) NOT NULL DEFAULT '' COMMENT '经办人姓名',
  `gmt_created` datetime NOT NULL COMMENT '创建时间',
  `input` varchar(250) NOT NULL DEFAULT '' COMMENT '输入',
  `output` varchar(250) NOT NULL DEFAULT '' COMMENT '输出',
  `deleted` bigint(20) NOT NULL DEFAULT '0' COMMENT '逻辑删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3930 DEFAULT CHARSET=utf8mb4 COMMENT='操作日志表(成功)';

-- ----------------------------
-- Records of log_success
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `parent_id` bigint(20) NOT NULL COMMENT '所属上级',
  `title` varchar(50) NOT NULL COMMENT '资源名称',
  `resource_key` varchar(50) NOT NULL DEFAULT '' COMMENT '资源标识',
  `type` varchar(10) NOT NULL COMMENT '类型',
  `path` varchar(100) DEFAULT '' COMMENT '菜单路由地址 | HTTP请求地址',
  `component` varchar(100) DEFAULT NULL COMMENT '视图组件位置',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `hidden` varchar(2) NOT NULL DEFAULT '0' COMMENT '是否隐藏菜单(详情页等)',
  `fullpage` varchar(2) NOT NULL DEFAULT '0' COMMENT '是否整页打开路由',
  `affix` varchar(2) NOT NULL DEFAULT '0' COMMENT '是否固定(标签卡片没有关闭按钮)',
  `sort_no` int(10) NOT NULL DEFAULT '1' COMMENT '排序号',
  `gmt_created` datetime NOT NULL COMMENT '创建时间',
  `created_by` varchar(25) DEFAULT NULL COMMENT '创建人',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `modified_by` varchar(25) DEFAULT NULL COMMENT '修改人',
  `deleted` bigint(20) NOT NULL DEFAULT '0' COMMENT '逻辑删除标志',
  `color` varchar(10) NOT NULL DEFAULT '' COMMENT '控制台快捷菜单的背景色',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UKEY-1` (`resource_key`,`deleted`),
  KEY `IDX-1` (`parent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COMMENT='资源表';

-- ----------------------------
-- Records of resource
-- ----------------------------
BEGIN;
INSERT INTO `resource` (`id`, `parent_id`, `title`, `resource_key`, `type`, `path`, `component`, `icon`, `hidden`, `fullpage`, `affix`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `deleted`, `color`) VALUES (1, 0, '首页', 'home', 'menu', '/home', '', 'el-icon-house', '0', '0', '0', 1, '2022-10-04 12:00:00', NULL, '2022-11-13 01:55:58', NULL, 0, '');
INSERT INTO `resource` (`id`, `parent_id`, `title`, `resource_key`, `type`, `path`, `component`, `icon`, `hidden`, `fullpage`, `affix`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `deleted`, `color`) VALUES (2, 1, '控制台', 'dashboard', 'menu', '/dashboard', 'home', 'el-icon-monitor', '0', '0', '1', 1, '2022-10-04 12:00:00', NULL, '2022-11-13 02:11:00', NULL, 0, '#67C23A');
INSERT INTO `resource` (`id`, `parent_id`, `title`, `resource_key`, `type`, `path`, `component`, `icon`, `hidden`, `fullpage`, `affix`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `deleted`, `color`) VALUES (3, 1, '首选项', 'userCenter', 'menu', '/usercenter', 'userCenter', 'el-icon-operation', '0', '0', '0', 2, '2022-10-04 12:00:00', NULL, '2022-11-13 02:09:59', NULL, 0, '#C71585');
INSERT INTO `resource` (`id`, `parent_id`, `title`, `resource_key`, `type`, `path`, `component`, `icon`, `hidden`, `fullpage`, `affix`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `deleted`, `color`) VALUES (4, 0, '系统维护', 'setting', 'menu', '/setting', '', 'el-icon-setting', '0', '0', '0', 2, '2022-10-04 12:00:00', NULL, '2022-11-13 01:57:52', NULL, 0, '');
INSERT INTO `resource` (`id`, `parent_id`, `title`, `resource_key`, `type`, `path`, `component`, `icon`, `hidden`, `fullpage`, `affix`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `deleted`, `color`) VALUES (5, 4, '部门管理', 'dept', 'menu', '/setting/dept', 'setting/dept', 'el-icon-set-up', '0', '0', '0', 1, '2022-10-04 12:00:00', NULL, '2022-11-12 22:08:04', NULL, 0, '#FF4500');
INSERT INTO `resource` (`id`, `parent_id`, `title`, `resource_key`, `type`, `path`, `component`, `icon`, `hidden`, `fullpage`, `affix`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `deleted`, `color`) VALUES (6, 4, '角色管理', 'role', 'menu', '/setting/role', 'setting/role', 'el-icon-position', '0', '0', '0', 2, '2022-10-04 12:00:00', NULL, '2022-10-20 21:41:38', NULL, 0, '#409EFF');
INSERT INTO `resource` (`id`, `parent_id`, `title`, `resource_key`, `type`, `path`, `component`, `icon`, `hidden`, `fullpage`, `affix`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `deleted`, `color`) VALUES (7, 4, '人员管理', 'user', 'menu', '/setting/user', 'setting/user', 'el-icon-user', '0', '0', '0', 3, '2022-10-04 12:00:00', NULL, '2022-11-25 10:49:26', NULL, 0, '#C71585');
INSERT INTO `resource` (`id`, `parent_id`, `title`, `resource_key`, `type`, `path`, `component`, `icon`, `hidden`, `fullpage`, `affix`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `deleted`, `color`) VALUES (8, 4, '资源管理', 'resource', 'menu', '/setting/resource', 'setting/resource', 'el-icon-copyDocument', '0', '0', '0', 4, '2022-10-04 12:00:00', NULL, '2022-10-20 21:41:59', NULL, 0, '#FF8C00');
INSERT INTO `resource` (`id`, `parent_id`, `title`, `resource_key`, `type`, `path`, `component`, `icon`, `hidden`, `fullpage`, `affix`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `deleted`, `color`) VALUES (51, 5, '新增', 'dept:new', 'button', '', NULL, NULL, '0', '0', '0', 99, '2022-10-15 11:37:40', NULL, '2022-10-15 11:38:54', NULL, 0, '');
INSERT INTO `resource` (`id`, `parent_id`, `title`, `resource_key`, `type`, `path`, `component`, `icon`, `hidden`, `fullpage`, `affix`, `sort_no`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `deleted`, `color`) VALUES (55, 0, '未命名_39791', '未命名_39791', 'menu', '', NULL, NULL, '0', '0', '0', 99, '2022-11-13 01:40:40', NULL, NULL, NULL, 55, '');
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT ' 流水号',
  `name` varchar(50) NOT NULL COMMENT '角色名称',
  `role_key` varchar(50) NOT NULL COMMENT '角色标识',
  `status` varchar(4) NOT NULL COMMENT '状态',
  `type` varchar(10) NOT NULL COMMENT '角色类型',
  `biz_code` varchar(50) DEFAULT NULL COMMENT '业务扩展码',
  `gmt_created` datetime NOT NULL COMMENT '创建时间',
  `created_by` varchar(25) DEFAULT NULL COMMENT '创建人',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `modified_by` varchar(25) DEFAULT NULL COMMENT '修改人',
  `remark` varchar(250) DEFAULT NULL COMMENT '备注',
  `deleted` bigint(20) NOT NULL DEFAULT '0' COMMENT '逻辑删除标志',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UKEY-1` (`role_key`,`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` (`id`, `name`, `role_key`, `status`, `type`, `biz_code`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (13, '测试0', 'TEST1', '1', '1', '1', '2022-09-09 11:25:58', NULL, '2022-09-10 20:30:22', NULL, '2', 0);
INSERT INTO `role` (`id`, `name`, `role_key`, `status`, `type`, `biz_code`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (14, '测试2', 'TEST2', '1', '1', '1', '2022-09-09 12:06:01', NULL, '2022-09-10 14:23:34', NULL, '212121', 14);
INSERT INTO `role` (`id`, `name`, `role_key`, `status`, `type`, `biz_code`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (17, '测试', 'TEST3', '1', '1', '1', '2022-09-09 23:38:34', NULL, '2022-09-10 23:01:20', NULL, '1', 17);
INSERT INTO `role` (`id`, `name`, `role_key`, `status`, `type`, `biz_code`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (18, '测试', 'TEST34', '9', '1', '1', '2022-09-09 23:39:40', NULL, '2022-09-10 22:58:59', NULL, '1', 18);
INSERT INTO `role` (`id`, `name`, `role_key`, `status`, `type`, `biz_code`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (19, '测试', 'TEST2', '1', '1', '', '2022-09-10 23:06:18', NULL, NULL, NULL, '', 0);
INSERT INTO `role` (`id`, `name`, `role_key`, `status`, `type`, `biz_code`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (20, '测试3', 'T3', '1', '1', '', '2022-09-10 23:07:12', NULL, NULL, NULL, '', 0);
INSERT INTO `role` (`id`, `name`, `role_key`, `status`, `type`, `biz_code`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (21, '测试4', 't4', '1', '1', '', '2022-09-10 23:07:19', NULL, NULL, NULL, '', 0);
INSERT INTO `role` (`id`, `name`, `role_key`, `status`, `type`, `biz_code`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (22, '测试5', 'T5', '1', '1', '', '2022-09-10 23:07:28', NULL, NULL, NULL, '', 0);
INSERT INTO `role` (`id`, `name`, `role_key`, `status`, `type`, `biz_code`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (23, '测试6', 'T6', '1', '1', '', '2022-09-10 23:07:37', NULL, NULL, NULL, '', 0);
INSERT INTO `role` (`id`, `name`, `role_key`, `status`, `type`, `biz_code`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (24, '测试7', 'T7', '1', '1', '', '2022-09-10 23:07:45', NULL, '2022-09-10 23:46:51', NULL, '', 24);
INSERT INTO `role` (`id`, `name`, `role_key`, `status`, `type`, `biz_code`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (25, '测试8', 'T8', '1', '1', '', '2022-09-10 23:07:54', NULL, NULL, NULL, '', 0);
INSERT INTO `role` (`id`, `name`, `role_key`, `status`, `type`, `biz_code`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (26, '测试9', 'T9', '1', '1', '', '2022-09-10 23:08:03', NULL, '2022-10-15 21:11:42', NULL, '', 0);
INSERT INTO `role` (`id`, `name`, `role_key`, `status`, `type`, `biz_code`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (27, '测试10', 'T10', '1', '1', '', '2022-09-10 23:08:11', NULL, '2022-11-21 12:26:47', NULL, '', 0);
INSERT INTO `role` (`id`, `name`, `role_key`, `status`, `type`, `biz_code`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (28, '开发角色', 'dev', '1', '1', '', '2022-09-10 23:08:23', NULL, '2022-11-15 16:00:38', NULL, '', 0);
INSERT INTO `role` (`id`, `name`, `role_key`, `status`, `type`, `biz_code`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`) VALUES (29, '管理员角色', 'super', '1', '1', '', '2022-10-21 16:59:32', NULL, '2022-11-21 20:24:13', NULL, '', 0);
COMMIT;

-- ----------------------------
-- Table structure for role_resource
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `resource_id` bigint(20) NOT NULL COMMENT '资源ID',
  `gmt_created` datetime NOT NULL COMMENT '创建时间',
  `created_by` varchar(25) DEFAULT NULL COMMENT '创建人',
  `deleted` bigint(20) NOT NULL DEFAULT '0' COMMENT '逻辑删除标志',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UKEY-1` (`role_id`,`resource_id`,`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8mb4 COMMENT='角色-资源表';

-- ----------------------------
-- Records of role_resource
-- ----------------------------
BEGIN;
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (1, 28, 2, '2022-10-18 17:06:15', NULL, 1);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (2, 28, 5, '2022-10-18 17:06:15', NULL, 2);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (3, 28, 51, '2022-10-18 17:06:15', NULL, 3);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (4, 28, 1, '2022-10-18 17:06:15', NULL, 4);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (5, 28, 4, '2022-10-18 17:06:15', NULL, 5);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (6, 28, 2, '2022-10-18 17:06:26', NULL, 6);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (7, 28, 5, '2022-10-18 17:06:26', NULL, 7);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (8, 28, 51, '2022-10-18 17:06:26', NULL, 8);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (9, 28, 1, '2022-10-18 17:06:26', NULL, 9);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (10, 28, 4, '2022-10-18 17:06:26', NULL, 10);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (11, 28, 2, '2022-10-18 17:06:27', NULL, 11);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (12, 28, 5, '2022-10-18 17:06:27', NULL, 12);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (13, 28, 51, '2022-10-18 17:06:27', NULL, 13);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (14, 28, 1, '2022-10-18 17:06:27', NULL, 14);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (15, 28, 4, '2022-10-18 17:06:27', NULL, 15);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (16, 28, 2, '2022-10-18 17:06:33', NULL, 16);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (17, 28, 5, '2022-10-18 17:06:33', NULL, 17);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (18, 28, 51, '2022-10-18 17:06:33', NULL, 18);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (19, 28, 1, '2022-10-18 17:06:33', NULL, 19);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (20, 28, 4, '2022-10-18 17:06:33', NULL, 20);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (21, 28, 2, '2022-10-18 17:06:34', NULL, 21);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (22, 28, 5, '2022-10-18 17:06:34', NULL, 22);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (23, 28, 51, '2022-10-18 17:06:34', NULL, 23);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (24, 28, 1, '2022-10-18 17:06:34', NULL, 24);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (25, 28, 4, '2022-10-18 17:06:34', NULL, 25);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (26, 28, 2, '2022-10-19 21:59:21', NULL, 26);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (27, 28, 5, '2022-10-19 21:59:21', NULL, 27);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (28, 28, 51, '2022-10-19 21:59:21', NULL, 28);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (29, 28, 1, '2022-10-19 21:59:21', NULL, 29);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (30, 28, 4, '2022-10-19 21:59:21', NULL, 30);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (31, 20, 2, '2022-10-19 22:00:00', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (32, 20, 5, '2022-10-19 22:00:00', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (33, 20, 51, '2022-10-19 22:00:00', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (34, 20, 1, '2022-10-19 22:00:00', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (35, 20, 4, '2022-10-19 22:00:00', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (36, 25, 2, '2022-10-19 22:02:40', NULL, 36);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (37, 25, 5, '2022-10-19 22:02:40', NULL, 37);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (38, 25, 51, '2022-10-19 22:02:40', NULL, 38);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (39, 25, 1, '2022-10-19 22:02:40', NULL, 39);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (40, 25, 4, '2022-10-19 22:02:40', NULL, 40);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (41, 25, 2, '2022-10-19 22:02:58', NULL, 41);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (42, 25, 5, '2022-10-19 22:02:58', NULL, 42);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (43, 25, 51, '2022-10-19 22:02:58', NULL, 43);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (44, 25, 6, '2022-10-19 22:02:58', NULL, 44);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (45, 25, 1, '2022-10-19 22:02:58', NULL, 45);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (46, 25, 4, '2022-10-19 22:02:58', NULL, 46);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (47, 28, 2, '2022-10-19 22:25:07', NULL, 47);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (48, 28, 5, '2022-10-19 22:25:07', NULL, 48);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (49, 28, 51, '2022-10-19 22:25:07', NULL, 49);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (50, 28, 1, '2022-10-19 22:25:07', NULL, 50);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (51, 28, 4, '2022-10-19 22:25:07', NULL, 51);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (52, 28, 2, '2022-10-19 22:25:12', NULL, 52);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (53, 28, 5, '2022-10-19 22:25:12', NULL, 53);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (54, 28, 51, '2022-10-19 22:25:12', NULL, 54);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (55, 28, 1, '2022-10-19 22:25:12', NULL, 55);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (56, 28, 4, '2022-10-19 22:25:12', NULL, 56);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (57, 28, 2, '2022-10-19 22:25:16', NULL, 57);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (58, 28, 5, '2022-10-19 22:25:16', NULL, 58);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (59, 28, 51, '2022-10-19 22:25:16', NULL, 59);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (60, 28, 1, '2022-10-19 22:25:16', NULL, 60);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (61, 28, 4, '2022-10-19 22:25:16', NULL, 61);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (62, 28, 2, '2022-10-19 22:27:14', NULL, 62);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (63, 28, 5, '2022-10-19 22:27:14', NULL, 63);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (64, 28, 51, '2022-10-19 22:27:14', NULL, 64);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (65, 28, 1, '2022-10-19 22:27:14', NULL, 65);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (66, 28, 4, '2022-10-19 22:27:14', NULL, 66);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (67, 27, 2, '2022-10-19 22:36:57', NULL, 67);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (68, 27, 5, '2022-10-19 22:36:57', NULL, 68);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (69, 27, 51, '2022-10-19 22:36:57', NULL, 69);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (70, 27, 1, '2022-10-19 22:36:57', NULL, 70);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (71, 27, 4, '2022-10-19 22:36:57', NULL, 71);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (72, 27, 2, '2022-10-19 22:37:04', NULL, 72);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (73, 27, 5, '2022-10-19 22:37:04', NULL, 73);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (74, 27, 51, '2022-10-19 22:37:04', NULL, 74);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (75, 27, 1, '2022-10-19 22:37:04', NULL, 75);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (76, 27, 4, '2022-10-19 22:37:04', NULL, 76);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (77, 27, 2, '2022-10-19 22:37:13', NULL, 77);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (78, 27, 5, '2022-10-19 22:37:13', NULL, 78);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (79, 27, 51, '2022-10-19 22:37:13', NULL, 79);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (80, 27, 1, '2022-10-19 22:37:13', NULL, 80);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (81, 27, 4, '2022-10-19 22:37:13', NULL, 81);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (82, 28, 2, '2022-10-19 22:38:11', NULL, 82);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (83, 28, 5, '2022-10-19 22:38:11', NULL, 83);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (84, 28, 51, '2022-10-19 22:38:11', NULL, 84);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (85, 28, 1, '2022-10-19 22:38:11', NULL, 85);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (86, 28, 4, '2022-10-19 22:38:11', NULL, 86);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (87, 27, 2, '2022-10-20 00:02:22', NULL, 87);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (88, 27, 5, '2022-10-20 00:02:22', NULL, 88);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (89, 27, 51, '2022-10-20 00:02:22', NULL, 89);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (90, 27, 6, '2022-10-20 00:02:22', NULL, 90);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (91, 27, 1, '2022-10-20 00:02:22', NULL, 91);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (92, 27, 4, '2022-10-20 00:02:22', NULL, 92);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (93, 27, 1, '2022-10-20 00:02:38', NULL, 93);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (94, 27, 2, '2022-10-20 00:02:38', NULL, 94);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (95, 27, 3, '2022-10-20 00:02:38', NULL, 95);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (96, 27, 4, '2022-10-20 00:02:38', NULL, 96);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (97, 27, 5, '2022-10-20 00:02:38', NULL, 97);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (98, 27, 51, '2022-10-20 00:02:38', NULL, 98);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (99, 27, 6, '2022-10-20 00:02:38', NULL, 99);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (100, 27, 7, '2022-10-20 00:02:38', NULL, 100);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (101, 27, 8, '2022-10-20 00:02:38', NULL, 101);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (102, 26, 8, '2022-10-20 00:03:00', NULL, 102);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (103, 26, 4, '2022-10-20 00:03:00', NULL, 103);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (104, 28, 1, '2022-10-20 00:04:47', NULL, 104);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (105, 28, 2, '2022-10-20 00:04:47', NULL, 105);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (106, 28, 3, '2022-10-20 00:04:47', NULL, 106);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (107, 27, 8, '2022-10-20 00:04:58', NULL, 107);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (108, 27, 4, '2022-10-20 00:04:58', NULL, 108);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (109, 27, 8, '2022-10-20 00:05:17', NULL, 109);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (110, 27, 4, '2022-10-20 00:05:17', NULL, 110);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (111, 28, 1, '2022-10-20 00:06:46', NULL, 111);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (112, 28, 2, '2022-10-20 00:06:46', NULL, 112);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (113, 28, 3, '2022-10-20 00:06:46', NULL, 113);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (114, 28, 5, '2022-10-20 00:06:46', NULL, 114);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (115, 28, 51, '2022-10-20 00:06:46', NULL, 115);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (116, 28, 4, '2022-10-20 00:06:46', NULL, 116);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (117, 26, 6, '2022-10-20 00:31:35', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (118, 26, 8, '2022-10-20 00:31:35', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (119, 26, 4, '2022-10-20 00:31:35', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (120, 28, 1, '2022-10-20 00:32:48', NULL, 120);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (121, 28, 2, '2022-10-20 00:32:48', NULL, 121);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (122, 28, 3, '2022-10-20 00:32:48', NULL, 122);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (123, 28, 5, '2022-10-20 00:32:48', NULL, 123);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (124, 28, 51, '2022-10-20 00:32:48', NULL, 124);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (125, 28, 4, '2022-10-20 00:32:48', NULL, 125);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (126, 28, 1, '2022-10-20 00:32:57', NULL, 126);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (127, 28, 2, '2022-10-20 00:32:57', NULL, 127);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (128, 28, 3, '2022-10-20 00:32:57', NULL, 128);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (129, 28, 5, '2022-10-20 00:32:57', NULL, 129);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (130, 28, 51, '2022-10-20 00:32:57', NULL, 130);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (131, 28, 4, '2022-10-20 00:32:57', NULL, 131);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (132, 28, 1, '2022-10-20 00:33:13', NULL, 132);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (133, 28, 2, '2022-10-20 00:33:13', NULL, 133);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (134, 28, 3, '2022-10-20 00:33:13', NULL, 134);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (135, 28, 5, '2022-10-20 00:33:13', NULL, 135);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (136, 28, 51, '2022-10-20 00:33:13', NULL, 136);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (137, 28, 4, '2022-10-20 00:33:13', NULL, 137);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (138, 28, 1, '2022-10-20 00:33:21', NULL, 138);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (139, 28, 2, '2022-10-20 00:33:21', NULL, 139);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (140, 28, 3, '2022-10-20 00:33:21', NULL, 140);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (141, 28, 5, '2022-10-20 00:33:21', NULL, 141);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (142, 28, 51, '2022-10-20 00:33:21', NULL, 142);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (143, 28, 4, '2022-10-20 00:33:21', NULL, 143);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (144, 25, 2, '2022-10-20 00:33:25', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (145, 25, 5, '2022-10-20 00:33:25', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (146, 25, 51, '2022-10-20 00:33:25', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (147, 25, 6, '2022-10-20 00:33:25', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (148, 25, 1, '2022-10-20 00:33:25', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (149, 25, 4, '2022-10-20 00:33:25', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (150, 23, 1, '2022-10-20 00:33:44', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (151, 23, 2, '2022-10-20 00:33:44', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (152, 23, 3, '2022-10-20 00:33:44', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (153, 13, 2, '2022-10-20 00:34:25', NULL, 153);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (154, 13, 1, '2022-10-20 00:34:25', NULL, 154);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (155, 13, 2, '2022-10-20 00:34:32', NULL, 155);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (156, 13, 7, '2022-10-20 00:34:32', NULL, 156);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (157, 13, 1, '2022-10-20 00:34:32', NULL, 157);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (158, 13, 4, '2022-10-20 00:34:32', NULL, 158);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (159, 13, 2, '2022-10-20 00:34:54', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (160, 13, 7, '2022-10-20 00:34:54', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (161, 13, 1, '2022-10-20 00:34:54', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (162, 13, 4, '2022-10-20 00:34:54', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (163, 28, 1, '2022-10-20 00:51:09', NULL, 163);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (164, 28, 2, '2022-10-20 00:51:09', NULL, 164);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (165, 28, 3, '2022-10-20 00:51:09', NULL, 165);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (166, 28, 5, '2022-10-20 00:51:09', NULL, 166);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (167, 28, 51, '2022-10-20 00:51:09', NULL, 167);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (168, 28, 4, '2022-10-20 00:51:09', NULL, 168);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (169, 27, 1, '2022-10-20 00:51:24', NULL, 169);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (170, 27, 2, '2022-10-20 00:51:24', NULL, 170);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (171, 27, 3, '2022-10-20 00:51:24', NULL, 171);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (172, 27, 8, '2022-10-20 00:51:24', NULL, 172);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (173, 27, 4, '2022-10-20 00:51:24', NULL, 173);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (174, 28, 1, '2022-10-20 00:51:50', NULL, 174);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (175, 28, 2, '2022-10-20 00:51:50', NULL, 175);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (176, 28, 3, '2022-10-20 00:51:50', NULL, 176);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (177, 28, 5, '2022-10-20 00:51:50', NULL, 177);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (178, 28, 51, '2022-10-20 00:51:50', NULL, 178);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (179, 28, 4, '2022-10-20 00:51:50', NULL, 179);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (180, 27, 1, '2022-10-20 00:52:12', NULL, 180);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (181, 27, 2, '2022-10-20 00:52:12', NULL, 181);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (182, 27, 3, '2022-10-20 00:52:12', NULL, 182);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (183, 27, 8, '2022-10-20 00:52:12', NULL, 183);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (184, 27, 4, '2022-10-20 00:52:12', NULL, 184);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (185, 28, 1, '2022-10-20 01:06:32', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (186, 28, 2, '2022-10-20 01:06:32', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (187, 28, 3, '2022-10-20 01:06:32', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (188, 28, 5, '2022-10-20 01:06:32', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (189, 28, 51, '2022-10-20 01:06:32', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (190, 28, 8, '2022-10-20 01:06:32', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (191, 28, 4, '2022-10-20 01:06:32', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (192, 29, 1, '2022-10-21 16:59:51', NULL, 192);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (193, 29, 2, '2022-10-21 16:59:51', NULL, 193);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (194, 29, 3, '2022-10-21 16:59:51', NULL, 194);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (195, 29, 4, '2022-10-21 16:59:51', NULL, 195);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (196, 29, 5, '2022-10-21 16:59:51', NULL, 196);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (197, 29, 51, '2022-10-21 16:59:51', NULL, 197);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (198, 29, 6, '2022-10-21 16:59:51', NULL, 198);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (199, 29, 7, '2022-10-21 16:59:51', NULL, 199);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (200, 29, 8, '2022-10-21 16:59:51', NULL, 200);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (201, 29, 1, '2022-10-21 19:55:17', NULL, 201);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (202, 29, 2, '2022-10-21 19:55:17', NULL, 202);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (203, 29, 3, '2022-10-21 19:55:17', NULL, 203);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (204, 29, 4, '2022-10-21 19:55:17', NULL, 204);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (205, 29, 5, '2022-10-21 19:55:17', NULL, 205);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (206, 29, 51, '2022-10-21 19:55:17', NULL, 206);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (207, 29, 6, '2022-10-21 19:55:17', NULL, 207);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (208, 29, 7, '2022-10-21 19:55:17', NULL, 208);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (209, 29, 8, '2022-10-21 19:55:17', NULL, 209);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (210, 29, 53, '2022-10-21 19:55:17', NULL, 210);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (211, 29, 3, '2022-11-11 14:04:46', NULL, 211);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (212, 29, 4, '2022-11-11 14:04:46', NULL, 212);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (213, 29, 5, '2022-11-11 14:04:46', NULL, 213);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (214, 29, 51, '2022-11-11 14:04:46', NULL, 214);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (215, 29, 6, '2022-11-11 14:04:46', NULL, 215);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (216, 29, 7, '2022-11-11 14:04:46', NULL, 216);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (217, 29, 8, '2022-11-11 14:04:46', NULL, 217);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (218, 29, 1, '2022-11-11 14:04:46', NULL, 218);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (219, 29, 2, '2022-11-11 14:04:46', NULL, 219);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (220, 29, 2, '2022-11-21 16:47:46', NULL, 220);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (221, 29, 2, '2022-11-21 16:48:19', NULL, 221);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (222, 29, 1, '2022-11-21 16:49:20', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (223, 29, 2, '2022-11-21 16:49:20', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (224, 29, 3, '2022-11-21 16:49:20', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (225, 29, 4, '2022-11-21 16:49:20', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (226, 29, 5, '2022-11-21 16:49:20', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (227, 29, 51, '2022-11-21 16:49:20', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (228, 29, 6, '2022-11-21 16:49:20', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (229, 29, 7, '2022-11-21 16:49:20', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (230, 29, 8, '2022-11-21 16:49:20', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (231, 27, 1, '2022-11-28 16:39:19', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (232, 27, 2, '2022-11-28 16:39:19', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (233, 27, 3, '2022-11-28 16:39:19', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (234, 27, 7, '2022-11-28 16:39:19', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (235, 27, 8, '2022-11-28 16:39:19', NULL, 0);
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`, `gmt_created`, `created_by`, `deleted`) VALUES (236, 27, 4, '2022-11-28 16:39:19', NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `user_name` varchar(50) NOT NULL COMMENT '登录帐号',
  `password` varchar(64) NOT NULL COMMENT '帐号密码',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `mail` varchar(50) DEFAULT NULL COMMENT '绑定邮箱',
  `sex` varchar(2) NOT NULL DEFAULT '0' COMMENT '性别',
  `status` varchar(2) NOT NULL COMMENT '用户状态',
  `type` varchar(2) NOT NULL COMMENT '用户类型',
  `dept_id` bigint(20) NOT NULL COMMENT '所属部门',
  `biz_code` varchar(50) DEFAULT NULL COMMENT '业务扩展码',
  `avatar` varchar(100) DEFAULT NULL COMMENT '头像URL',
  `gmt_created` datetime NOT NULL COMMENT '创建时间',
  `created_by` varchar(25) DEFAULT NULL COMMENT '创建人',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `modified_by` varchar(25) DEFAULT NULL COMMENT '修改人',
  `remark` varchar(250) DEFAULT NULL COMMENT '备注',
  `deleted` bigint(20) NOT NULL DEFAULT '0' COMMENT '逻辑删除标识',
  `mobile_number` varchar(20) DEFAULT NULL COMMENT '绑定手机',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UKEY-1` (`user_name`,`deleted`),
  UNIQUE KEY `UKEY-2` (`mail`,`deleted`),
  UNIQUE KEY `UKEY-3` (`mobile_number`,`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` (`id`, `user_name`, `password`, `name`, `mail`, `sex`, `status`, `type`, `dept_id`, `biz_code`, `avatar`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`, `mobile_number`) VALUES (1, 'admin', 'cdf4a007e2b02a0c49fc9b7ccfbb8a10c644f635e1765dcf2a7ab794ddc7edac', '管理员', NULL, '1', '1', '1', 28, '', 'avatar/avatar7.jpg', '2022-10-21 16:58:58', NULL, '2022-11-30 16:13:06', NULL, '测试一下', 0, '18616786111');
INSERT INTO `user` (`id`, `user_name`, `password`, `name`, `mail`, `sex`, `status`, `type`, `dept_id`, `biz_code`, `avatar`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`, `mobile_number`) VALUES (2, 'xiongda', 'cdf4a007e2b02a0c49fc9b7ccfbb8a10c644f635e1765dcf2a7ab794ddc7edac', '熊大', NULL, '0', '1', '1', 7, '1', 'avatar/avatar2.jpg', '2022-09-15 12:57:11', NULL, '2022-11-23 17:18:17', NULL, '2', 2, '18616786122');
INSERT INTO `user` (`id`, `user_name`, `password`, `name`, `mail`, `sex`, `status`, `type`, `dept_id`, `biz_code`, `avatar`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`, `mobile_number`) VALUES (3, 'xiongchun3', 'cdf4a007e2b02a0c49fc9b7ccfbb8a10c644f635e1765dcf2a7ab794ddc7edac', '章子怡', NULL, '0', '1', '1', 41, '1', 'avatar/avatar5.jpg', '2022-09-17 11:34:01', NULL, NULL, NULL, '2', 3, '18616786133');
INSERT INTO `user` (`id`, `user_name`, `password`, `name`, `mail`, `sex`, `status`, `type`, `dept_id`, `biz_code`, `avatar`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`, `mobile_number`) VALUES (4, 'xiongchun4', 'cdf4a007e2b02a0c49fc9b7ccfbb8a10c644f635e1765dcf2a7ab794ddc7edac', '古天乐', NULL, '0', '1', '1', 5, '', 'avatar/avatar4.jpg', '2022-09-17 11:46:00', NULL, '2022-09-26 20:45:44', NULL, '', 0, '18616786144');
INSERT INTO `user` (`id`, `user_name`, `password`, `name`, `mail`, `sex`, `status`, `type`, `dept_id`, `biz_code`, `avatar`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`, `mobile_number`) VALUES (5, 'xiongchun5', 'cdf4a007e2b02a0c49fc9b7ccfbb8a10c644f635e1765dcf2a7ab794ddc7edac', '张曼玉', NULL, '0', '1', '1', 9, '', 'avatar/avatar2.jpg', '2022-09-18 10:51:43', NULL, '2022-11-25 15:02:11', NULL, '这是一个临时的测试账号', 0, '18616786155');
INSERT INTO `user` (`id`, `user_name`, `password`, `name`, `mail`, `sex`, `status`, `type`, `dept_id`, `biz_code`, `avatar`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`, `mobile_number`) VALUES (6, 'huangyu', 'cdf4a007e2b02a0c49fc9b7ccfbb8a10c644f635e1765dcf2a7ab794ddc7edac', '大傻吊', NULL, '0', '1', '1', 14, '', 'avatar/avatar3.jpg', '2022-09-21 12:25:41', NULL, '2022-11-23 17:29:03', NULL, '', 0, '18616786166');
INSERT INTO `user` (`id`, `user_name`, `password`, `name`, `mail`, `sex`, `status`, `type`, `dept_id`, `biz_code`, `avatar`, `gmt_created`, `created_by`, `gmt_modified`, `modified_by`, `remark`, `deleted`, `mobile_number`) VALUES (7, 'xiongchun', 'd41d8cd98f00b204e9800998ecf8427e', 'xc', NULL, '0', '1', '1', 7, '1', 'avatar/avatar7.jpg', '2022-09-15 12:45:20', NULL, '2022-11-22 16:50:48', NULL, 'c', 0, '18616786199');
COMMIT;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `gmt_created` datetime NOT NULL COMMENT '创建时间',
  `created_by` varchar(25) DEFAULT NULL COMMENT '创建人',
  `deleted` bigint(20) NOT NULL DEFAULT '0' COMMENT '逻辑删除标志',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UKEY-1` (`user_id`,`role_id`,`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8mb4 COMMENT='用户-角色表';

-- ----------------------------
-- Records of user_role
-- ----------------------------
BEGIN;
INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `gmt_created`, `created_by`, `deleted`) VALUES (150, 1, 29, '2022-10-21 17:02:18', NULL, 0);
INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `gmt_created`, `created_by`, `deleted`) VALUES (151, 7, 25, '2022-10-30 00:06:42', NULL, 151);
INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `gmt_created`, `created_by`, `deleted`) VALUES (152, 2, 29, '2022-11-21 16:50:10', NULL, 152);
INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `gmt_created`, `created_by`, `deleted`) VALUES (153, 3, 29, '2022-11-21 16:50:17', NULL, 153);
INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `gmt_created`, `created_by`, `deleted`) VALUES (154, 5, 29, '2022-11-21 20:26:50', NULL, 154);
INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `gmt_created`, `created_by`, `deleted`) VALUES (155, 7, 29, '2022-11-22 12:34:03', NULL, 155);
INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `gmt_created`, `created_by`, `deleted`) VALUES (156, 7, 29, '2022-11-22 12:34:23', NULL, 156);
INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `gmt_created`, `created_by`, `deleted`) VALUES (157, 6, 29, '2022-11-22 12:34:23', NULL, 157);
INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `gmt_created`, `created_by`, `deleted`) VALUES (158, 5, 29, '2022-11-22 12:34:23', NULL, 158);
INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `gmt_created`, `created_by`, `deleted`) VALUES (159, 7, 29, '2022-11-22 12:34:43', NULL, 159);
INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `gmt_created`, `created_by`, `deleted`) VALUES (160, 6, 29, '2022-11-22 12:34:43', NULL, 160);
INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `gmt_created`, `created_by`, `deleted`) VALUES (161, 4, 29, '2022-11-22 12:34:43', NULL, 161);
INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `gmt_created`, `created_by`, `deleted`) VALUES (162, 7, 29, '2022-11-22 12:39:02', NULL, 162);
INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `gmt_created`, `created_by`, `deleted`) VALUES (163, 6, 29, '2022-11-22 12:39:02', NULL, 163);
INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `gmt_created`, `created_by`, `deleted`) VALUES (164, 5, 29, '2022-11-22 12:39:02', NULL, 164);
INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `gmt_created`, `created_by`, `deleted`) VALUES (165, 1, 28, '2022-11-22 16:20:12', NULL, 0);
INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `gmt_created`, `created_by`, `deleted`) VALUES (166, 7, 28, '2022-11-22 16:20:30', NULL, 166);
INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `gmt_created`, `created_by`, `deleted`) VALUES (167, 4, 28, '2022-11-22 16:21:34', NULL, 167);
INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `gmt_created`, `created_by`, `deleted`) VALUES (168, 5, 28, '2022-11-22 16:21:34', NULL, 168);
INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `gmt_created`, `created_by`, `deleted`) VALUES (169, 3, 28, '2022-11-22 16:21:48', NULL, 169);
INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `gmt_created`, `created_by`, `deleted`) VALUES (170, 4, 28, '2022-11-22 16:21:48', NULL, 0);
INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `gmt_created`, `created_by`, `deleted`) VALUES (171, 5, 28, '2022-11-22 16:21:48', NULL, 0);
INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `gmt_created`, `created_by`, `deleted`) VALUES (172, 6, 28, '2022-11-22 16:21:48', NULL, 0);
INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `gmt_created`, `created_by`, `deleted`) VALUES (173, 7, 28, '2022-11-22 16:21:48', NULL, 173);
INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `gmt_created`, `created_by`, `deleted`) VALUES (174, 4, 27, '2022-11-22 16:47:21', NULL, 0);
INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `gmt_created`, `created_by`, `deleted`) VALUES (175, 5, 27, '2022-11-22 16:47:21', NULL, 175);
INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `gmt_created`, `created_by`, `deleted`) VALUES (176, 7, 27, '2022-11-22 16:47:24', NULL, 176);
INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `gmt_created`, `created_by`, `deleted`) VALUES (177, 6, 27, '2022-11-22 16:47:32', NULL, 0);
INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `gmt_created`, `created_by`, `deleted`) VALUES (178, 7, 27, '2022-11-22 16:47:32', NULL, 178);
INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `gmt_created`, `created_by`, `deleted`) VALUES (179, 7, 29, '2022-11-23 21:09:04', NULL, 179);
INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `gmt_created`, `created_by`, `deleted`) VALUES (180, 6, 29, '2022-11-23 21:09:04', NULL, 180);
INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `gmt_created`, `created_by`, `deleted`) VALUES (181, 7, 19, '2022-11-25 20:13:15', NULL, 0);
INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `gmt_created`, `created_by`, `deleted`) VALUES (182, 7, 26, '2022-11-25 20:13:21', NULL, 182);
INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `gmt_created`, `created_by`, `deleted`) VALUES (183, 7, 23, '2022-11-25 20:13:21', NULL, 0);
INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `gmt_created`, `created_by`, `deleted`) VALUES (184, 7, 22, '2022-11-25 22:42:10', NULL, 0);
INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `gmt_created`, `created_by`, `deleted`) VALUES (185, 7, 27, '2022-11-25 22:44:58', NULL, 185);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
