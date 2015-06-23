/*
Source Server         : PostgSQL
Source Server Version : 90304
Source Host           : localhost:5432
Source Database       : aos
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90304
File Encoding         : 65001

Date: 2015-06-24 01:43:22
*/


-- ----------------------------
-- Sequence structure for aos_bp_act_evt_log_log_nr__seq
-- ----------------------------
DROP SEQUENCE "public"."aos_bp_act_evt_log_log_nr__seq";
CREATE SEQUENCE "public"."aos_bp_act_evt_log_log_nr__seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Table structure for aos_au_module
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_au_module";
CREATE TABLE "public"."aos_au_module" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"cascade_id_" varchar(255) COLLATE "default" NOT NULL,
"name_" varchar(255) COLLATE "default" NOT NULL,
"url_" varchar(255) COLLATE "default",
"hotkey_" varchar(255) COLLATE "default",
"parent_id_" varchar(64) COLLATE "default" NOT NULL,
"is_leaf_" varchar(2) COLLATE "default" DEFAULT 1 NOT NULL,
"is_auto_expand_" varchar(2) COLLATE "default" DEFAULT 0 NOT NULL,
"icon_name_" varchar(255) COLLATE "default",
"sort_no_" int2 DEFAULT 0,
"status_" varchar(2) COLLATE "default" DEFAULT 1 NOT NULL,
"parent_name_" varchar(255) COLLATE "default" NOT NULL,
"vector_" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."aos_au_module" IS '功能模块表';
COMMENT ON COLUMN "public"."aos_au_module"."id_" IS '功能模块流水号';
COMMENT ON COLUMN "public"."aos_au_module"."cascade_id_" IS '节点语义ID';
COMMENT ON COLUMN "public"."aos_au_module"."name_" IS '功能模块名称';
COMMENT ON COLUMN "public"."aos_au_module"."url_" IS '主页面URL';
COMMENT ON COLUMN "public"."aos_au_module"."hotkey_" IS '热键';
COMMENT ON COLUMN "public"."aos_au_module"."parent_id_" IS '父节点流水号';
COMMENT ON COLUMN "public"."aos_au_module"."is_leaf_" IS '是否叶子节点';
COMMENT ON COLUMN "public"."aos_au_module"."is_auto_expand_" IS '是否自动展开';
COMMENT ON COLUMN "public"."aos_au_module"."icon_name_" IS '节点图标文件名称';
COMMENT ON COLUMN "public"."aos_au_module"."sort_no_" IS '排序号';
COMMENT ON COLUMN "public"."aos_au_module"."status_" IS '当前状态';
COMMENT ON COLUMN "public"."aos_au_module"."parent_name_" IS '父节点名称';
COMMENT ON COLUMN "public"."aos_au_module"."vector_" IS '矢量图标';

-- ----------------------------
-- Records of aos_au_module
-- ----------------------------
INSERT INTO "public"."aos_au_module" VALUES ('0', '0', 'OSWorks-AOS应用基础平台', '', '', 'p', '0', '1', 'home.png', '1', '1', 'root', '');
INSERT INTO "public"."aos_au_module" VALUES ('1680', '0.001.004.002', '流程建模', 'bpm/procModel/init.jhtml', '', '189', '1', '0', 'icon8.png', '10', '1', '工作流', '');
INSERT INTO "public"."aos_au_module" VALUES ('1688', '0.001.004.003', '流程配置与管理', 'bpm/procDef/init.jhtml', '', '189', '1', '0', 'icon79.png', '20', '1', '工作流', '');
INSERT INTO "public"."aos_au_module" VALUES ('1691', '0.001.004.006', '流程任务监管', 'bpm/procTask/init.jhtml', '', '189', '1', '0', 'task_list.png', '40', '1', '工作流', '');
INSERT INTO "public"."aos_au_module" VALUES ('1710', '0.001.004.007', '流程历史数据查询', '', '', '189', '1', '0', 'icon71.png', '90', '1', '工作流', '');
INSERT INTO "public"."aos_au_module" VALUES ('1711', '0.001.010', '数据集成', '', '', '183', '0', '0', 'folder10.png', '55', '1', '控制台', '');
INSERT INTO "public"."aos_au_module" VALUES ('1712', '0.001.010.001', '数据管道', '', '', '1711', '1', '0', 'tables_relation.png', '10', '1', '数据集成', '');
INSERT INTO "public"."aos_au_module" VALUES ('1713', '0.001.011', '复杂事件处理', '', '', '183', '0', '0', 'folder6.png', '58', '1', '控制台', '');
INSERT INTO "public"."aos_au_module" VALUES ('1714', '0.001.011.001', '事件流定义', null, null, '1713', '1', '0', null, '10', '1', '复杂事件处理', null);
INSERT INTO "public"."aos_au_module" VALUES ('183', '0.001', '控制台', '', '', '0', '0', '1', 'folder22.png', '10', '1', 'OSWorks-AOS应用基础平台', 'fa-cogs');
INSERT INTO "public"."aos_au_module" VALUES ('184', '0.002', '工作台', '', '', '0', '0', '1', 'folder23.png', '20', '1', 'OSWorks-AOS应用基础平台', 'fa-github-alt');
INSERT INTO "public"."aos_au_module" VALUES ('186', '0.001.001', '基础数据', '', '', '183', '0', '1', 'folder2.png', '10', '1', '控制台', '');
INSERT INTO "public"."aos_au_module" VALUES ('187', '0.001.002', '资源', '', '', '183', '0', '1', 'folder14.png', '20', '1', '控制台', '');
INSERT INTO "public"."aos_au_module" VALUES ('188', '0.001.003', '组织与权限', '', '', '183', '0', '1', 'folder5.png', '30', '1', '控制台', '');
INSERT INTO "public"."aos_au_module" VALUES ('189', '0.001.004', '工作流', '', '', '183', '0', '1', 'folder24.png', '40', '1', '控制台', '');
INSERT INTO "public"."aos_au_module" VALUES ('190', '0.001.005', '服务治理', '', '', '183', '0', '0', 'folder7.png', '50', '1', '控制台', '');
INSERT INTO "public"."aos_au_module" VALUES ('191', '0.001.006', '监控与审计', '', '', '183', '0', '0', 'folder8.png', '60', '1', '控制台', '');
INSERT INTO "public"."aos_au_module" VALUES ('192', '0.001.001.001', '参数表', 'system/param/init.jhtml', '', '186', '1', '0', 'icon79.png', '1', '1', '基础数据', '');
INSERT INTO "public"."aos_au_module" VALUES ('193', '0.001.001.002', '数据字典', 'system/dictionary/init.jhtml', '', '186', '1', '0', 'icon154.png', '10', '1', '基础数据', '');
INSERT INTO "public"."aos_au_module" VALUES ('194', '0.001.001.003', '分类科目', 'system/catalog/init.jhtml', '', '186', '1', '0', 'icon146.png', '20', '1', '基础数据', '');
INSERT INTO "public"."aos_au_module" VALUES ('195', '0.001.002.004', '序列号', 'system/idMgr/init.jhtml', '', '187', '1', '0', 'id.png', '30', '1', '资源', '');
INSERT INTO "public"."aos_au_module" VALUES ('197', '0.001.002.001', '功能模块', 'system/module/init.jhtml', '', '187', '1', '0', 'icon75.png', '10', '1', '资源', '');
INSERT INTO "public"."aos_au_module" VALUES ('199', '0.001.003.001', '组织架构', 'system/org/init.jhtml', '', '188', '1', '0', 'icon56.png', '1', '1', '组织与权限', '');
INSERT INTO "public"."aos_au_module" VALUES ('200', '0.001.003.002', '岗位与授权', 'system/post/init.jhtml', '', '188', '1', '0', 'icon137.png', '3', '1', '组织与权限', '');
INSERT INTO "public"."aos_au_module" VALUES ('201', '0.001.003.003', '用户与授权', 'system/user/init.jhtml', '', '188', '1', '0', 'user6.png', '4', '1', '组织与权限', '');
INSERT INTO "public"."aos_au_module" VALUES ('203', '0.001.005.001', '服务注册', '', '', '190', '1', '0', '', '1', '1', '服务治理', '');
INSERT INTO "public"."aos_au_module" VALUES ('204', '0.001.006.001', '数据审计', '', '', '191', '1', '0', '', '1', '1', '监控与审计', '');
INSERT INTO "public"."aos_au_module" VALUES ('205', '0.001.006.002', '业务经办日志', '', '', '191', '1', '0', '', '3', '1', '监控与审计', null);
INSERT INTO "public"."aos_au_module" VALUES ('207', '0.002.001', '首选项', 'system/preference/init.jhtml', '', '184', '1', '0', 'config1.png', '10', '1', '工作台', '');
INSERT INTO "public"."aos_au_module" VALUES ('212', '0.002.006', '我的流程', '', '', '184', '1', '1', 'icon8.png', '40', '1', '工作台', '');
INSERT INTO "public"."aos_au_module" VALUES ('213', '0.002.007', '我的任务', 'bpm/mytask/init.jhtml', '', '184', '1', '1', 'task_list.png', '30', '1', '工作台', '');
INSERT INTO "public"."aos_au_module" VALUES ('217', '0.001.008.006', 'DAO代码生成', 'system/daoCoder/init.jhtml', '', '555', '1', '0', 'icon66.png', '20', '1', '开发工具', '');
INSERT INTO "public"."aos_au_module" VALUES ('220', '0.001.008.003', '视图页面设计', '', '', '555', '1', '0', 'icon88.png', '31', '1', '开发工具', '');
INSERT INTO "public"."aos_au_module" VALUES ('222', '0.001.008.004', '新增模块向导', '', '', '555', '1', '0', 'icon65.png', '32', '1', '开发工具', '');
INSERT INTO "public"."aos_au_module" VALUES ('225', '0.001.008.002', 'WebSQL', 'system/webSql/init.jhtml', '', '555', '1', '0', 'sql.png', '11', '1', '开发工具', '');
INSERT INTO "public"."aos_au_module" VALUES ('227', '0.001.009.001', 'AOS开发指南', '', '', '576', '1', '0', 'lightbulb.png', '1', '1', '帮助', '');
INSERT INTO "public"."aos_au_module" VALUES ('228', '0.001.009.002', 'AOS开发者社区', '', '', '576', '1', '0', 'icq.png', '2', '1', '帮助', '');
INSERT INTO "public"."aos_au_module" VALUES ('236', '0.004', '演示', '', '', '0', '0', '1', 'folder27.png', '40', '1', 'OSWorks-AOS应用基础平台', 'fa-coffee');
INSERT INTO "public"."aos_au_module" VALUES ('237', '0.004.001', '示例1', null, null, '236', '1', '0', null, '1', '1', '演示', null);
INSERT INTO "public"."aos_au_module" VALUES ('242', '0.001.006.004', '系统管理日志', null, null, '191', '1', '0', null, '2', '1', '监控与审计', null);
INSERT INTO "public"."aos_au_module" VALUES ('304', '0.001.003.006', '角色与授权', 'system/role/init.jhtml', '', '188', '1', '0', 'icon134.png', '5', '1', '组织与权限', '');
INSERT INTO "public"."aos_au_module" VALUES ('393', '0.001.008.001', '图标大全', 'system/icon/init.jhtml', '', '555', '1', '0', 'page_picture.png', '90', '1', '开发工具', '');
INSERT INTO "public"."aos_au_module" VALUES ('454', '0.001.002.003', '页面组件', 'system/page/init.jhtml', '', '187', '1', '0', 'icon59.png', '20', '1', '资源', '');
INSERT INTO "public"."aos_au_module" VALUES ('486', '0.001.004.005', '流程实例监管', 'bpm/procInst/init.jhtml', '', '189', '1', '0', 'icon5.png', '30', '1', '工作流', '');
INSERT INTO "public"."aos_au_module" VALUES ('489', '0.002.005', '我的消息', '', '', '184', '1', '0', 'email2.png', '20', '1', '工作台', '');
INSERT INTO "public"."aos_au_module" VALUES ('530', '0.001.002.005', '数据源', '', '', '187', '1', '0', 'database_add.png', '50', '1', '资源', '');
INSERT INTO "public"."aos_au_module" VALUES ('555', '0.001.008', '开发工具', '', '', '183', '0', '0', 'folder9.png', '70', '1', '控制台', 'fa-bug');
INSERT INTO "public"."aos_au_module" VALUES ('576', '0.001.009', '帮助', '', '', '183', '0', '0', 'folder11.png', '80', '1', '控制台', '');
INSERT INTO "public"."aos_au_module" VALUES ('615', '0.001.002.006', '流文件', 'system/byteObj/init.jhtml', '', '187', '1', '0', 'page_office.png', '40', '1', '资源', '');

-- ----------------------------
-- Table structure for aos_au_module_post
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_au_module_post";
CREATE TABLE "public"."aos_au_module_post" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"post_id_" varchar(64) COLLATE "default" NOT NULL,
"module_id_" varchar(64) COLLATE "default" NOT NULL,
"grant_type_" varchar(2) COLLATE "default" NOT NULL,
"operate_time_" varchar(255) COLLATE "default" NOT NULL,
"operator_id_" varchar(64) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."aos_au_module_post" IS '功能模块-岗位关联表';
COMMENT ON COLUMN "public"."aos_au_module_post"."id_" IS '流水号';
COMMENT ON COLUMN "public"."aos_au_module_post"."post_id_" IS '岗位流水号';
COMMENT ON COLUMN "public"."aos_au_module_post"."module_id_" IS '功能模块流水号';
COMMENT ON COLUMN "public"."aos_au_module_post"."grant_type_" IS '权限类型(岗位仅提供经办权限)';
COMMENT ON COLUMN "public"."aos_au_module_post"."operate_time_" IS '授权时间';
COMMENT ON COLUMN "public"."aos_au_module_post"."operator_id_" IS '授权人流水号';

-- ----------------------------
-- Records of aos_au_module_post
-- ----------------------------
INSERT INTO "public"."aos_au_module_post" VALUES ('3197', '539', '0', '1', '2015-01-22 13:19:31', '1');
INSERT INTO "public"."aos_au_module_post" VALUES ('3198', '539', '183', '1', '2015-01-22 13:19:31', '1');
INSERT INTO "public"."aos_au_module_post" VALUES ('3199', '539', '186', '1', '2015-01-22 13:19:31', '1');
INSERT INTO "public"."aos_au_module_post" VALUES ('3200', '539', '193', '1', '2015-01-22 13:19:31', '1');
INSERT INTO "public"."aos_au_module_post" VALUES ('3201', '540', '0', '1', '2015-01-22 13:19:39', '1');
INSERT INTO "public"."aos_au_module_post" VALUES ('3202', '540', '183', '1', '2015-01-22 13:19:39', '1');
INSERT INTO "public"."aos_au_module_post" VALUES ('3203', '540', '186', '1', '2015-01-22 13:19:39', '1');
INSERT INTO "public"."aos_au_module_post" VALUES ('3204', '540', '192', '1', '2015-01-22 13:19:39', '1');
INSERT INTO "public"."aos_au_module_post" VALUES ('3205', '540', '193', '1', '2015-01-22 13:19:39', '1');
INSERT INTO "public"."aos_au_module_post" VALUES ('3206', '540', '194', '1', '2015-01-22 13:19:39', '1');
INSERT INTO "public"."aos_au_module_post" VALUES ('3207', '538', '0', '1', '2015-01-22 13:20:29', '1');
INSERT INTO "public"."aos_au_module_post" VALUES ('3208', '538', '183', '1', '2015-01-22 13:20:29', '1');
INSERT INTO "public"."aos_au_module_post" VALUES ('3209', '538', '186', '1', '2015-01-22 13:20:29', '1');
INSERT INTO "public"."aos_au_module_post" VALUES ('3210', '538', '192', '1', '2015-01-22 13:20:29', '1');
INSERT INTO "public"."aos_au_module_post" VALUES ('3211', '538', '193', '1', '2015-01-22 13:20:29', '1');
INSERT INTO "public"."aos_au_module_post" VALUES ('3212', '538', '194', '1', '2015-01-22 13:20:29', '1');

-- ----------------------------
-- Table structure for aos_au_module_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_au_module_role";
CREATE TABLE "public"."aos_au_module_role" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"role_id_" varchar(64) COLLATE "default" NOT NULL,
"module_id_" varchar(64) COLLATE "default" NOT NULL,
"grant_type_" varchar(2) COLLATE "default" NOT NULL,
"operate_time_" varchar(255) COLLATE "default" NOT NULL,
"operator_id_" varchar(64) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."aos_au_module_role" IS '功能模块-角色关联表';
COMMENT ON COLUMN "public"."aos_au_module_role"."id_" IS '流水号';
COMMENT ON COLUMN "public"."aos_au_module_role"."role_id_" IS '角色流水号';
COMMENT ON COLUMN "public"."aos_au_module_role"."module_id_" IS '功能模块流水号';
COMMENT ON COLUMN "public"."aos_au_module_role"."grant_type_" IS '权限类型';
COMMENT ON COLUMN "public"."aos_au_module_role"."operate_time_" IS '授权时间';
COMMENT ON COLUMN "public"."aos_au_module_role"."operator_id_" IS '授权人流水号';

-- ----------------------------
-- Records of aos_au_module_role
-- ----------------------------
INSERT INTO "public"."aos_au_module_role" VALUES ('3084', '541', '0', '1', '2015-01-22 09:30:02', '1');
INSERT INTO "public"."aos_au_module_role" VALUES ('3085', '541', '183', '1', '2015-01-22 09:30:02', '1');
INSERT INTO "public"."aos_au_module_role" VALUES ('3086', '541', '187', '1', '2015-01-22 09:30:02', '1');
INSERT INTO "public"."aos_au_module_role" VALUES ('3087', '541', '197', '1', '2015-01-22 09:30:02', '1');
INSERT INTO "public"."aos_au_module_role" VALUES ('3088', '541', '454', '1', '2015-01-22 09:30:02', '1');
INSERT INTO "public"."aos_au_module_role" VALUES ('3089', '541', '198', '1', '2015-01-22 09:30:02', '1');
INSERT INTO "public"."aos_au_module_role" VALUES ('3179', '605', '0', '1', '2015-01-22 13:11:10', '1');
INSERT INTO "public"."aos_au_module_role" VALUES ('3180', '605', '183', '1', '2015-01-22 13:11:10', '1');
INSERT INTO "public"."aos_au_module_role" VALUES ('3181', '605', '186', '1', '2015-01-22 13:11:10', '1');
INSERT INTO "public"."aos_au_module_role" VALUES ('3182', '605', '193', '1', '2015-01-22 13:11:10', '1');
INSERT INTO "public"."aos_au_module_role" VALUES ('3220', '605', '0', '2', '2015-02-02 15:32:07', '1');
INSERT INTO "public"."aos_au_module_role" VALUES ('3221', '605', '183', '2', '2015-02-02 15:32:07', '1');
INSERT INTO "public"."aos_au_module_role" VALUES ('3222', '605', '186', '2', '2015-02-02 15:32:07', '1');
INSERT INTO "public"."aos_au_module_role" VALUES ('3223', '605', '192', '2', '2015-02-02 15:32:07', '1');
INSERT INTO "public"."aos_au_module_role" VALUES ('3224', '605', '193', '2', '2015-02-02 15:32:07', '1');
INSERT INTO "public"."aos_au_module_role" VALUES ('3225', '605', '194', '2', '2015-02-02 15:32:07', '1');
INSERT INTO "public"."aos_au_module_role" VALUES ('3226', '605', '187', '2', '2015-02-02 15:32:07', '1');
INSERT INTO "public"."aos_au_module_role" VALUES ('3227', '605', '197', '2', '2015-02-02 15:32:07', '1');
INSERT INTO "public"."aos_au_module_role" VALUES ('3228', '605', '454', '2', '2015-02-02 15:32:07', '1');
INSERT INTO "public"."aos_au_module_role" VALUES ('3229', '605', '195', '2', '2015-02-02 15:32:07', '1');
INSERT INTO "public"."aos_au_module_role" VALUES ('3230', '605', '615', '2', '2015-02-02 15:32:07', '1');
INSERT INTO "public"."aos_au_module_role" VALUES ('3231', '605', '530', '2', '2015-02-02 15:32:07', '1');
INSERT INTO "public"."aos_au_module_role" VALUES ('3242', '541', '0', '2', '2015-02-02 15:35:11', '1');
INSERT INTO "public"."aos_au_module_role" VALUES ('3243', '541', '183', '2', '2015-02-02 15:35:11', '1');
INSERT INTO "public"."aos_au_module_role" VALUES ('3246', '541', '187', '2', '2015-02-02 15:35:11', '1');
INSERT INTO "public"."aos_au_module_role" VALUES ('3247', '541', '197', '2', '2015-02-02 15:35:11', '1');
INSERT INTO "public"."aos_au_module_role" VALUES ('3248', '541', '454', '2', '2015-02-02 15:35:11', '1');
INSERT INTO "public"."aos_au_module_role" VALUES ('3249', '541', '530', '2', '2015-02-02 15:35:11', '1');

-- ----------------------------
-- Table structure for aos_au_module_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_au_module_user";
CREATE TABLE "public"."aos_au_module_user" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"user_id_" varchar(64) COLLATE "default" NOT NULL,
"module_id_" varchar(64) COLLATE "default" NOT NULL,
"grant_type_" varchar(2) COLLATE "default" NOT NULL,
"operate_time_" varchar(255) COLLATE "default" NOT NULL,
"operator_id_" varchar(64) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."aos_au_module_user" IS '功能模块-用户关联表';
COMMENT ON COLUMN "public"."aos_au_module_user"."id_" IS '流水号';
COMMENT ON COLUMN "public"."aos_au_module_user"."user_id_" IS '用户流水号';
COMMENT ON COLUMN "public"."aos_au_module_user"."module_id_" IS '功能模块流水号';
COMMENT ON COLUMN "public"."aos_au_module_user"."grant_type_" IS '权限类型';
COMMENT ON COLUMN "public"."aos_au_module_user"."operate_time_" IS '授权时间';
COMMENT ON COLUMN "public"."aos_au_module_user"."operator_id_" IS '授权人';

-- ----------------------------
-- Records of aos_au_module_user
-- ----------------------------
INSERT INTO "public"."aos_au_module_user" VALUES ('3033', '14', '0', '1', '2015-01-21 16:58:53', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3034', '14', '183', '1', '2015-01-21 16:58:53', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3035', '14', '186', '1', '2015-01-21 16:58:53', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3036', '14', '192', '1', '2015-01-21 16:58:53', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3175', '15', '0', '2', '2015-01-22 13:10:31', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3176', '15', '183', '2', '2015-01-22 13:10:31', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3177', '15', '187', '2', '2015-01-22 13:10:31', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3178', '15', '197', '2', '2015-01-22 13:10:31', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3260', '14', '0', '2', '2015-02-02 15:42:49', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3261', '14', '183', '2', '2015-02-02 15:42:49', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3262', '14', '186', '2', '2015-02-02 15:42:49', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3263', '14', '192', '2', '2015-02-02 15:42:49', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3264', '14', '187', '2', '2015-02-02 15:42:49', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3265', '14', '197', '2', '2015-02-02 15:42:49', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3271', '19', '0', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3272', '19', '183', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3273', '19', '186', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3274', '19', '192', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3275', '19', '193', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3276', '19', '194', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3277', '19', '187', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3278', '19', '197', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3279', '19', '454', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3280', '19', '195', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3281', '19', '615', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3282', '19', '530', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3283', '19', '188', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3284', '19', '199', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3285', '19', '200', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3286', '19', '201', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3287', '19', '304', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3288', '19', '189', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3289', '19', '533', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3290', '19', '534', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3291', '19', '485', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3292', '19', '487', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3293', '19', '507', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3294', '19', '202', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3295', '19', '535', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3296', '19', '486', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3297', '19', '499', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3298', '19', '500', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3299', '19', '501', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3300', '19', '502', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3301', '19', '503', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3302', '19', '504', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3303', '19', '190', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3304', '19', '203', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3305', '19', '191', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3306', '19', '204', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3307', '19', '242', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3308', '19', '205', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3309', '19', '555', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3310', '19', '393', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3311', '19', '225', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3312', '19', '217', '1', '2015-02-11 21:17:40', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3313', '19', '220', '1', '2015-02-11 21:17:41', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3314', '19', '222', '1', '2015-02-11 21:17:41', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3315', '19', '576', '1', '2015-02-11 21:17:41', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3316', '19', '227', '1', '2015-02-11 21:17:41', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3317', '19', '228', '1', '2015-02-11 21:17:41', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3318', '19', '184', '1', '2015-02-11 21:17:41', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3319', '19', '207', '1', '2015-02-11 21:17:41', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3320', '19', '489', '1', '2015-02-11 21:17:41', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3321', '19', '213', '1', '2015-02-11 21:17:41', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3322', '19', '211', '1', '2015-02-11 21:17:41', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3323', '19', '496', '1', '2015-02-11 21:17:41', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3324', '19', '495', '1', '2015-02-11 21:17:41', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3325', '19', '497', '1', '2015-02-11 21:17:41', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3326', '19', '212', '1', '2015-02-11 21:17:41', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3327', '19', '488', '1', '2015-02-11 21:17:41', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3328', '19', '491', '1', '2015-02-11 21:17:41', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3329', '19', '492', '1', '2015-02-11 21:17:41', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3330', '19', '493', '1', '2015-02-11 21:17:41', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3331', '19', '494', '1', '2015-02-11 21:17:41', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3332', '19', '236', '1', '2015-02-11 21:17:41', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3333', '19', '237', '1', '2015-02-11 21:17:41', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3530', '15', '0', '1', '2015-02-21 21:52:48', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3531', '15', '183', '1', '2015-02-21 21:52:48', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3532', '15', '186', '1', '2015-02-21 21:52:48', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3533', '15', '192', '1', '2015-02-21 21:52:48', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3534', '15', '187', '1', '2015-02-21 21:52:48', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3535', '15', '454', '1', '2015-02-21 21:52:48', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3536', '15', '195', '1', '2015-02-21 21:52:49', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3537', '15', '190', '1', '2015-02-21 21:52:49', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3538', '15', '203', '1', '2015-02-21 21:52:49', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3539', '15', '184', '1', '2015-02-21 21:52:49', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3540', '15', '207', '1', '2015-02-21 21:52:49', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3541', '15', '489', '1', '2015-02-21 21:52:49', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3542', '15', '213', '1', '2015-02-21 21:52:49', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3543', '15', '211', '1', '2015-02-21 21:52:49', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3544', '15', '496', '1', '2015-02-21 21:52:49', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3545', '15', '495', '1', '2015-02-21 21:52:49', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3546', '15', '497', '1', '2015-02-21 21:52:49', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3631', '20', '0', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3632', '20', '183', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3633', '20', '186', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3634', '20', '192', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3635', '20', '193', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3636', '20', '194', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3637', '20', '188', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3638', '20', '199', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3639', '20', '200', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3640', '20', '201', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3641', '20', '304', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3642', '20', '189', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3643', '20', '533', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3644', '20', '534', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3645', '20', '485', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3646', '20', '487', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3647', '20', '507', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3648', '20', '202', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3649', '20', '535', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3650', '20', '486', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3651', '20', '499', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3652', '20', '500', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3653', '20', '501', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3654', '20', '502', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3655', '20', '503', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3656', '20', '504', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3657', '20', '190', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3658', '20', '203', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3659', '20', '191', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3660', '20', '204', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3661', '20', '242', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3662', '20', '205', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3663', '20', '555', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3664', '20', '393', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3665', '20', '225', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3666', '20', '217', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3667', '20', '220', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3668', '20', '222', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3669', '20', '576', '1', '2015-02-21 23:32:42', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3670', '20', '227', '1', '2015-02-21 23:32:43', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3671', '20', '228', '1', '2015-02-21 23:32:43', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3672', '20', '184', '1', '2015-02-21 23:32:43', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3673', '20', '207', '1', '2015-02-21 23:32:43', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3674', '20', '489', '1', '2015-02-21 23:32:43', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3675', '20', '213', '1', '2015-02-21 23:32:43', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3676', '20', '211', '1', '2015-02-21 23:32:43', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3677', '20', '496', '1', '2015-02-21 23:32:43', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3678', '20', '495', '1', '2015-02-21 23:32:43', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3679', '20', '497', '1', '2015-02-21 23:32:43', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3680', '20', '212', '1', '2015-02-21 23:32:43', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3681', '20', '488', '1', '2015-02-21 23:32:43', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3682', '20', '491', '1', '2015-02-21 23:32:43', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3683', '20', '492', '1', '2015-02-21 23:32:43', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3684', '20', '493', '1', '2015-02-21 23:32:43', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3685', '20', '494', '1', '2015-02-21 23:32:43', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3686', '20', '236', '1', '2015-02-21 23:32:43', '1');
INSERT INTO "public"."aos_au_module_user" VALUES ('3687', '20', '237', '1', '2015-02-21 23:32:43', '1');

-- ----------------------------
-- Table structure for aos_au_module_user_nav
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_au_module_user_nav";
CREATE TABLE "public"."aos_au_module_user_nav" (
"id_" varchar(64) COLLATE "default" DEFAULT 0 NOT NULL,
"module_id_" varchar(64) COLLATE "default" NOT NULL,
"user_id_" varchar(64) COLLATE "default" NOT NULL,
"nav_icon_" varchar(255) COLLATE "default",
"type_" varchar(2) COLLATE "default" NOT NULL,
"sort_no_" int2
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."aos_au_module_user_nav" IS '功能模块-用户关联表(浮动导航|快捷导航)';
COMMENT ON COLUMN "public"."aos_au_module_user_nav"."id_" IS '流水号';
COMMENT ON COLUMN "public"."aos_au_module_user_nav"."module_id_" IS '功能模块流水号';
COMMENT ON COLUMN "public"."aos_au_module_user_nav"."user_id_" IS '人员流水号';
COMMENT ON COLUMN "public"."aos_au_module_user_nav"."nav_icon_" IS '浮动导航图标文件';
COMMENT ON COLUMN "public"."aos_au_module_user_nav"."type_" IS '导航类型';
COMMENT ON COLUMN "public"."aos_au_module_user_nav"."sort_no_" IS '排序号';

-- ----------------------------
-- Records of aos_au_module_user_nav
-- ----------------------------
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('1', '192', '1', '25.png', '2', '0');
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('2', '193', '1', '11.png', '2', '0');
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('3', '200', '1', '30.png', '2', '0');
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('3401', '194', '1', '32.png', '2', '4');
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('3588', '0', '15', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('3589', '183', '15', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('3590', '186', '15', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('3591', '192', '15', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('3592', '193', '15', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('3593', '194', '15', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('3594', '187', '15', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('3595', '454', '15', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('3596', '195', '15', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('3597', '190', '15', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('3598', '203', '15', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('3599', '184', '15', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('3600', '207', '15', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('3601', '489', '15', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('3602', '213', '15', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('3603', '211', '15', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('3604', '495', '15', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('3605', '497', '15', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('3606', '192', '15', '28.png', '2', '1');
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('4', '201', '1', '41.png', '2', '0');
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('4177', '0', '1', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('4178', '183', '1', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('4179', '186', '1', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('4180', '192', '1', null, '1', '1');
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('4181', '193', '1', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('4182', '194', '1', null, '1', '3');
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('4183', '187', '1', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('4184', '197', '1', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('4185', '454', '1', null, '1', '4');
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('4186', '195', '1', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('4187', '615', '1', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('4188', '530', '1', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('4189', '188', '1', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('4190', '199', '1', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('4191', '200', '1', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('4192', '201', '1', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('4193', '304', '1', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('4194', '189', '1', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('4195', '533', '1', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('4196', '534', '1', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('4197', '202', '1', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('4198', '535', '1', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('4199', '486', '1', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('4200', '499', '1', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('4201', '500', '1', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('4202', '555', '1', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('4203', '393', '1', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('4204', '225', '1', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('4205', '217', '1', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('4206', '220', '1', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('4207', '222', '1', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('4208', '184', '1', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('4209', '207', '1', null, '1', '2');
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('4210', '489', '1', null, '1', null);
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('5', '304', '1', '28.png', '2', '0');
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('6', '199', '1', '7.png', '2', '0');
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('7', '197', '1', '51.png', '2', '0');
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('8', '217', '1', '56.png', '2', '0');
INSERT INTO "public"."aos_au_module_user_nav" VALUES ('9', '222', '1', '22.png', '2', '0');

-- ----------------------------
-- Table structure for aos_au_org
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_au_org";
CREATE TABLE "public"."aos_au_org" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"cascade_id_" varchar(255) COLLATE "default" NOT NULL,
"name_" varchar(255) COLLATE "default" NOT NULL,
"hotkey_" varchar(255) COLLATE "default",
"parent_id_" varchar(64) COLLATE "default" NOT NULL,
"pareant_name_" varchar(255) COLLATE "default",
"is_leaf_" varchar(2) COLLATE "default" DEFAULT 1 NOT NULL,
"is_auto_expand_" varchar(2) COLLATE "default" DEFAULT 0 NOT NULL,
"icon_name_" varchar(255) COLLATE "default",
"sort_no_" int2 DEFAULT 0,
"status_" varchar(2) COLLATE "default" DEFAULT 1 NOT NULL,
"type_" varchar(2) COLLATE "default" NOT NULL,
"biz_code_" varchar(255) COLLATE "default",
"custom_code_" varchar(4000) COLLATE "default",
"create_time_" varchar(255) COLLATE "default" NOT NULL,
"creater_id_" varchar(64) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."aos_au_org" IS '组织表';
COMMENT ON COLUMN "public"."aos_au_org"."id_" IS '流水号';
COMMENT ON COLUMN "public"."aos_au_org"."cascade_id_" IS '节点语义ID';
COMMENT ON COLUMN "public"."aos_au_org"."name_" IS '组织名称';
COMMENT ON COLUMN "public"."aos_au_org"."hotkey_" IS '热键';
COMMENT ON COLUMN "public"."aos_au_org"."parent_id_" IS '父节点流水号';
COMMENT ON COLUMN "public"."aos_au_org"."pareant_name_" IS '父节点名称';
COMMENT ON COLUMN "public"."aos_au_org"."is_leaf_" IS '是否叶子节点';
COMMENT ON COLUMN "public"."aos_au_org"."is_auto_expand_" IS '是否自动展开';
COMMENT ON COLUMN "public"."aos_au_org"."icon_name_" IS '节点图标文件名称';
COMMENT ON COLUMN "public"."aos_au_org"."sort_no_" IS '排序号';
COMMENT ON COLUMN "public"."aos_au_org"."status_" IS '当前状态';
COMMENT ON COLUMN "public"."aos_au_org"."type_" IS '组织类型';
COMMENT ON COLUMN "public"."aos_au_org"."biz_code_" IS '业务对照码';
COMMENT ON COLUMN "public"."aos_au_org"."custom_code_" IS '自定义扩展码';
COMMENT ON COLUMN "public"."aos_au_org"."create_time_" IS '创建时间';
COMMENT ON COLUMN "public"."aos_au_org"."creater_id_" IS '创建人ID';

-- ----------------------------
-- Records of aos_au_org
-- ----------------------------
INSERT INTO "public"."aos_au_org" VALUES ('0', '0', 'OSWorks', '', 'p', 'root', '0', '1', 'home.png', '0', '1', '1', '', '', '2012-01-01 12:12:12', '1');
INSERT INTO "public"."aos_au_org" VALUES ('284', '0.007', '项目部', '', '0', 'OSWorks', '1', '0', '', '3', '1', '1', '', '', '2012-01-01 12:12:12', '1');
INSERT INTO "public"."aos_au_org" VALUES ('285', '0.003', '产品部', '', '0', 'OSWorks', '1', '0', '', '2', '1', '1', '', '', '2012-01-01 12:12:12', '1');
INSERT INTO "public"."aos_au_org" VALUES ('286', '0.004', '软件过程支持部', '', '0', 'OSWorks', '1', '0', '', '4', '1', '1', '', '', '2012-01-01 12:12:12', '1');
INSERT INTO "public"."aos_au_org" VALUES ('287', '0.005', '总务办', '', '0', 'OSWorks', '0', '1', '', '5', '1', '1', '', '', '2012-01-01 12:12:12', '1');
INSERT INTO "public"."aos_au_org" VALUES ('288', '0.008', '市场部', '', '0', 'OSWorks', '1', '0', '', '1', '1', '1', '', '', '2012-01-01 12:12:12', '1');
INSERT INTO "public"."aos_au_org" VALUES ('424', '0.005.001', '部门1', '', '287', '总务办', '0', '1', '', '1', '1', '1', '', '', '2012-01-01 12:12:12', '1');
INSERT INTO "public"."aos_au_org" VALUES ('441', '0.005.001.001', '部门1-1', '', '424', '部门1', '1', '0', '', '1', '1', '1', '', '', '2012-01-01 12:12:12', '4');

-- ----------------------------
-- Table structure for aos_au_page
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_au_page";
CREATE TABLE "public"."aos_au_page" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"module_id_" varchar(64) COLLATE "default" NOT NULL,
"name_" varchar(255) COLLATE "default",
"url_" varchar(255) COLLATE "default",
"type_" varchar(2) COLLATE "default" NOT NULL,
"enabled_" varchar(2) COLLATE "default" NOT NULL,
"sort_no_" int2 DEFAULT 0,
"is_default_" varchar(2) COLLATE "default" DEFAULT 0 NOT NULL,
"icon_" varchar(255) COLLATE "default",
"icon_big_" varchar(255) COLLATE "default",
"vector_" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."aos_au_page" IS '模块页面表';
COMMENT ON COLUMN "public"."aos_au_page"."id_" IS '流水号';
COMMENT ON COLUMN "public"."aos_au_page"."module_id_" IS '功能模块ID';
COMMENT ON COLUMN "public"."aos_au_page"."name_" IS '名称';
COMMENT ON COLUMN "public"."aos_au_page"."url_" IS '页面URL';
COMMENT ON COLUMN "public"."aos_au_page"."type_" IS '类型';
COMMENT ON COLUMN "public"."aos_au_page"."enabled_" IS '使能状态';
COMMENT ON COLUMN "public"."aos_au_page"."sort_no_" IS '排序号';
COMMENT ON COLUMN "public"."aos_au_page"."is_default_" IS '是否缺省子页面';
COMMENT ON COLUMN "public"."aos_au_page"."icon_" IS '小图标';
COMMENT ON COLUMN "public"."aos_au_page"."icon_big_" IS '大图标';
COMMENT ON COLUMN "public"."aos_au_page"."vector_" IS '矢量图标';

-- ----------------------------
-- Records of aos_au_page
-- ----------------------------
INSERT INTO "public"."aos_au_page" VALUES ('1646', '207', '我的个人资料', 'initMyInfo.jhtml', '2', '1', '1', '1', 'vcard.png', '', '');
INSERT INTO "public"."aos_au_page" VALUES ('1647', '207', '我的偏好设置', 'initMySettings.jhtml', '2', '1', '2', '0', 'icon79.png', '', '');
INSERT INTO "public"."aos_au_page" VALUES ('1648', '207', '系统安全选项', 'initSecurityCfg.jhtml', '2', '1', '3', '0', 'system.png', '', '');
INSERT INTO "public"."aos_au_page" VALUES ('1649', '207', '自定义菜单', 'initMyNav.jhtml', '2', '1', '4', '0', 'icon_19.png', '', '');
INSERT INTO "public"."aos_au_page" VALUES ('1650', '207', '我的操作日志', '', '2', '1', '6', '0', 'icon75.png', null, null);
INSERT INTO "public"."aos_au_page" VALUES ('1652', '207', '分割符', '', '4', '1', '5', '0', null, null, null);
INSERT INTO "public"."aos_au_page" VALUES ('1677', '393', '小图标[16X16]', 'initIconList.jhtml?type_=1', '2', '1', '1', '1', 'pictures.png', null, null);
INSERT INTO "public"."aos_au_page" VALUES ('1678', '393', '大图标[64X64]', 'initIconList.jhtml?type_=2', '2', '1', '2', '0', 'picture.png', '', '');
INSERT INTO "public"."aos_au_page" VALUES ('1679', '393', '矢量图标', 'initIconList.jhtml?type_=3', '2', '1', '4', '0', 'vector.png', '', '');
INSERT INTO "public"."aos_au_page" VALUES ('1701', '213', '待办任务', 'initDo.jhtml', '2', '1', '10', '1', 'task_list.png', '', '');
INSERT INTO "public"."aos_au_page" VALUES ('1702', '213', '已办任务', 'initDone.jhtml', '2', '1', '20', '0', 'task_finish.png', '', '');
INSERT INTO "public"."aos_au_page" VALUES ('1703', '393', '分隔符', null, '4', '1', '3', '0', null, null, null);

-- ----------------------------
-- Table structure for aos_au_page_el
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_au_page_el";
CREATE TABLE "public"."aos_au_page_el" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"dom_id_" varchar(255) COLLATE "default" NOT NULL,
"name_" varchar(255) COLLATE "default" NOT NULL,
"type_" varchar(2) COLLATE "default" NOT NULL,
"module_id_" varchar(64) COLLATE "default" NOT NULL,
"remark_" varchar(4000) COLLATE "default",
"page_id_" varchar(64) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."aos_au_page_el" IS '页面元素表';
COMMENT ON COLUMN "public"."aos_au_page_el"."id_" IS '流水号';
COMMENT ON COLUMN "public"."aos_au_page_el"."dom_id_" IS 'DOM ID';
COMMENT ON COLUMN "public"."aos_au_page_el"."name_" IS '名称';
COMMENT ON COLUMN "public"."aos_au_page_el"."type_" IS '类型';
COMMENT ON COLUMN "public"."aos_au_page_el"."module_id_" IS '所属功能模块流水号';
COMMENT ON COLUMN "public"."aos_au_page_el"."remark_" IS '备注';
COMMENT ON COLUMN "public"."aos_au_page_el"."page_id_" IS '页面ID';

-- ----------------------------
-- Records of aos_au_page_el
-- ----------------------------
INSERT INTO "public"."aos_au_page_el" VALUES ('1666', '_btn_demo', '文本按钮', '1', '207', '演示页面元素授权', '207');
INSERT INTO "public"."aos_au_page_el" VALUES ('1667', '_btn_save_demo', '个人信息保存按钮', '1', '207', '演示页面元素授权', '1646');
INSERT INTO "public"."aos_au_page_el" VALUES ('477', '_btn_add_demo', '弹出新增参数窗口按钮', '1', '192', '', '192');

-- ----------------------------
-- Table structure for aos_au_page_el_grant
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_au_page_el_grant";
CREATE TABLE "public"."aos_au_page_el_grant" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"el_id_" varchar(64) COLLATE "default" NOT NULL,
"user_id_" varchar(64) COLLATE "default",
"role_id_" varchar(64) COLLATE "default",
"post_id_" varchar(64) COLLATE "default",
"grant_type_" varchar(2) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."aos_au_page_el_grant" IS '页面元素授权表';
COMMENT ON COLUMN "public"."aos_au_page_el_grant"."id_" IS '流水号';
COMMENT ON COLUMN "public"."aos_au_page_el_grant"."el_id_" IS '页面元素流水号';
COMMENT ON COLUMN "public"."aos_au_page_el_grant"."user_id_" IS '用户流水号';
COMMENT ON COLUMN "public"."aos_au_page_el_grant"."role_id_" IS '角色流水号';
COMMENT ON COLUMN "public"."aos_au_page_el_grant"."post_id_" IS '岗位流水号';
COMMENT ON COLUMN "public"."aos_au_page_el_grant"."grant_type_" IS '权限类型';

-- ----------------------------
-- Records of aos_au_page_el_grant
-- ----------------------------
INSERT INTO "public"."aos_au_page_el_grant" VALUES ('3214', '477', '15', null, null, '6');
INSERT INTO "public"."aos_au_page_el_grant" VALUES ('3793', '1666', '15', null, null, '3');
INSERT INTO "public"."aos_au_page_el_grant" VALUES ('3794', '1667', '15', null, null, '6');

-- ----------------------------
-- Table structure for aos_au_post
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_au_post";
CREATE TABLE "public"."aos_au_post" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"name_" varchar(255) COLLATE "default" NOT NULL,
"status_" varchar(2) COLLATE "default" DEFAULT '1'::character varying NOT NULL,
"type_" varchar(2) COLLATE "default" NOT NULL,
"org_id_" varchar(64) COLLATE "default" NOT NULL,
"create_time_" varchar(255) COLLATE "default" NOT NULL,
"creater_id_" varchar(64) COLLATE "default" NOT NULL,
"org_cascade_id_" varchar(255) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."aos_au_post" IS '岗位表';
COMMENT ON COLUMN "public"."aos_au_post"."id_" IS '流水号';
COMMENT ON COLUMN "public"."aos_au_post"."name_" IS '岗位名称';
COMMENT ON COLUMN "public"."aos_au_post"."status_" IS '当前状态';
COMMENT ON COLUMN "public"."aos_au_post"."type_" IS '岗位类型';
COMMENT ON COLUMN "public"."aos_au_post"."org_id_" IS '所属部门流水号';
COMMENT ON COLUMN "public"."aos_au_post"."create_time_" IS '创建时间';
COMMENT ON COLUMN "public"."aos_au_post"."creater_id_" IS '创建人ID';
COMMENT ON COLUMN "public"."aos_au_post"."org_cascade_id_" IS '所属部门节点语义ID';

-- ----------------------------
-- Records of aos_au_post
-- ----------------------------
INSERT INTO "public"."aos_au_post" VALUES ('538', '岗位1', '1', '1', '288', '2014-12-10 02:25:17', '1', '0.008');
INSERT INTO "public"."aos_au_post" VALUES ('539', '岗位2', '1', '1', '285', '2014-12-10 02:25:24', '1', '0.003');
INSERT INTO "public"."aos_au_post" VALUES ('540', '岗位3', '1', '1', '284', '2014-12-10 02:26:56', '1', '0.007');

-- ----------------------------
-- Table structure for aos_au_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_au_role";
CREATE TABLE "public"."aos_au_role" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"name_" varchar(255) COLLATE "default" NOT NULL,
"status_" varchar(2) COLLATE "default" DEFAULT '1'::character varying NOT NULL,
"type_" varchar(2) COLLATE "default" NOT NULL,
"create_time_" varchar(255) COLLATE "default" NOT NULL,
"creater_id_" varchar(64) COLLATE "default" NOT NULL,
"creater_org_id_" varchar(64) COLLATE "default" NOT NULL,
"creater_org_cascade_id_" varchar(255) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."aos_au_role" IS '角色表';
COMMENT ON COLUMN "public"."aos_au_role"."id_" IS '流水号';
COMMENT ON COLUMN "public"."aos_au_role"."name_" IS '角色名称';
COMMENT ON COLUMN "public"."aos_au_role"."status_" IS '当前状态';
COMMENT ON COLUMN "public"."aos_au_role"."type_" IS '角色类型';
COMMENT ON COLUMN "public"."aos_au_role"."create_time_" IS '创建时间';
COMMENT ON COLUMN "public"."aos_au_role"."creater_id_" IS '创建人流水号';
COMMENT ON COLUMN "public"."aos_au_role"."creater_org_id_" IS '创建人所属部门流水号';
COMMENT ON COLUMN "public"."aos_au_role"."creater_org_cascade_id_" IS '创建人所属部门节点语义ID';

-- ----------------------------
-- Records of aos_au_role
-- ----------------------------
INSERT INTO "public"."aos_au_role" VALUES ('449', '测试角色1', '1', '1', '2014-11-18 12:56:15', '4', '287', '0.005');
INSERT INTO "public"."aos_au_role" VALUES ('455', '测试角色', '1', '1', '2014-11-23 19:58:19', '4', '288', '0.008');
INSERT INTO "public"."aos_au_role" VALUES ('541', '角色1', '1', '1', '2014-12-10 02:28:26', '1', '0', '0');
INSERT INTO "public"."aos_au_role" VALUES ('605', '角色2', '1', '1', '2015-01-22 00:48:47', '1', '0', '0');

-- ----------------------------
-- Table structure for aos_au_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_au_user";
CREATE TABLE "public"."aos_au_user" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"account_" varchar(255) COLLATE "default" NOT NULL,
"password_" varchar(255) COLLATE "default" NOT NULL,
"name_" varchar(255) COLLATE "default" NOT NULL,
"sex_" varchar(2) COLLATE "default" DEFAULT 0 NOT NULL,
"org_id_" varchar(64) COLLATE "default" NOT NULL,
"status_" varchar(2) COLLATE "default" NOT NULL,
"type_" varchar(2) COLLATE "default" NOT NULL,
"biz_code_" varchar(255) COLLATE "default",
"create_time_" varchar(255) COLLATE "default" NOT NULL,
"creater_id_" varchar(64) COLLATE "default" NOT NULL,
"org_cascade_id_" varchar(255) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."aos_au_user" IS '用户基本信息表';
COMMENT ON COLUMN "public"."aos_au_user"."id_" IS '流水号';
COMMENT ON COLUMN "public"."aos_au_user"."account_" IS '用户登录帐号';
COMMENT ON COLUMN "public"."aos_au_user"."password_" IS '密码';
COMMENT ON COLUMN "public"."aos_au_user"."name_" IS '用户姓名';
COMMENT ON COLUMN "public"."aos_au_user"."sex_" IS '性别';
COMMENT ON COLUMN "public"."aos_au_user"."org_id_" IS '所属主部门流水号';
COMMENT ON COLUMN "public"."aos_au_user"."status_" IS '用户状态';
COMMENT ON COLUMN "public"."aos_au_user"."type_" IS '用户类型';
COMMENT ON COLUMN "public"."aos_au_user"."biz_code_" IS '业务对照码';
COMMENT ON COLUMN "public"."aos_au_user"."create_time_" IS '经办时间';
COMMENT ON COLUMN "public"."aos_au_user"."creater_id_" IS '经办人流水号';
COMMENT ON COLUMN "public"."aos_au_user"."org_cascade_id_" IS '所属部门节点语义ID';

-- ----------------------------
-- Records of aos_au_user
-- ----------------------------
INSERT INTO "public"."aos_au_user" VALUES ('1', 'root', 'Q31Ox+QY0vs=', '超级用户', '1', '0', '1', '2', '', '2014-09-27 22:12:56', '1', '0');
INSERT INTO "public"."aos_au_user" VALUES ('14', 'test1', 'ByOPAM8ATmY=', '测试1', '0', '284', '1', '1', '', '2014-12-10 02:18:53', '1', '0.007');
INSERT INTO "public"."aos_au_user" VALUES ('15', 'xxd', 'Q31Ox+QY0vs=', '熊小朵', '0', '441', '1', '1', '', '2014-12-10 02:19:12', '1', '0.005.001.001');
INSERT INTO "public"."aos_au_user" VALUES ('19', 'xxx', 'ByOPAM8ATmY=', '熊小雄', '1', '285', '1', '1', '', '2015-01-25 16:20:54', '1', '0.003');
INSERT INTO "public"."aos_au_user" VALUES ('20', 'xcc', '5SIDJ03AkJI=', '熊楚楚', '0', '0', '1', '1', '', '2015-02-01 22:19:03', '1', '0');

-- ----------------------------
-- Table structure for aos_au_user_cfg
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_au_user_cfg";
CREATE TABLE "public"."aos_au_user_cfg" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"theme_" varchar(255) COLLATE "default",
"skin_" varchar(255) COLLATE "default",
"layout_" varchar(255) COLLATE "default",
"nav_mode_" varchar(2) COLLATE "default",
"is_show_top_nav_" varchar(255) COLLATE "default",
"navbar_btn_style_" varchar(255) COLLATE "default",
"tab_focus_color_" varchar(255) COLLATE "default",
"is_show_mac_nav_" varchar(2) COLLATE "default",
"nav_tab_index_" varchar(255) COLLATE "default",
"nav_quick_layout_" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."aos_au_user_cfg" IS '用户配置表';
COMMENT ON COLUMN "public"."aos_au_user_cfg"."id_" IS '用户ID';
COMMENT ON COLUMN "public"."aos_au_user_cfg"."theme_" IS '用户界面主题';
COMMENT ON COLUMN "public"."aos_au_user_cfg"."skin_" IS '用户界面皮肤';
COMMENT ON COLUMN "public"."aos_au_user_cfg"."layout_" IS '系统业务经办区域布局风格';
COMMENT ON COLUMN "public"."aos_au_user_cfg"."nav_mode_" IS '导航模式';
COMMENT ON COLUMN "public"."aos_au_user_cfg"."is_show_top_nav_" IS '是否显示水平导航条';
COMMENT ON COLUMN "public"."aos_au_user_cfg"."navbar_btn_style_" IS '导航条按钮风格';
COMMENT ON COLUMN "public"."aos_au_user_cfg"."tab_focus_color_" IS 'Tab高亮颜色';
COMMENT ON COLUMN "public"."aos_au_user_cfg"."is_show_mac_nav_" IS '欢迎页Mac导航显示开关';
COMMENT ON COLUMN "public"."aos_au_user_cfg"."nav_tab_index_" IS '导航缺省活动页';
COMMENT ON COLUMN "public"."aos_au_user_cfg"."nav_quick_layout_" IS '快捷菜单布局风格';

-- ----------------------------
-- Records of aos_au_user_cfg
-- ----------------------------
INSERT INTO "public"."aos_au_user_cfg" VALUES ('1', 'classic', 'blue', 'tab', '1', 'true', 'tight', '#0099FF', '1', '0', '1');
INSERT INTO "public"."aos_au_user_cfg" VALUES ('14', 'classic', 'blue', 'tab', '1', 'true', 'tight', '#0099FF', '1', '1', null);
INSERT INTO "public"."aos_au_user_cfg" VALUES ('15', 'classic', 'blue', 'tab', '1', 'true', 'tight', '#0099FF', '1', '1', '1');
INSERT INTO "public"."aos_au_user_cfg" VALUES ('19', 'classic', 'neptune', 'tab', '1', 'true', 'tight', '#0099FF', '1', '1', null);
INSERT INTO "public"."aos_au_user_cfg" VALUES ('20', 'classic', 'neptune', 'tab', '1', 'true', 'tight', '#0099FF', '1', '1', '1');

-- ----------------------------
-- Table structure for aos_au_user_ext
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_au_user_ext";
CREATE TABLE "public"."aos_au_user_ext" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"email_" varchar(255) COLLATE "default",
"fixed_phone_" varchar(255) COLLATE "default",
"mobile_phone_" varchar(255) COLLATE "default",
"address_" varchar(255) COLLATE "default",
"zip_" varchar(255) COLLATE "default",
"birthday_" varchar(255) COLLATE "default",
"idno_" varchar(255) COLLATE "default",
"qq_" varchar(255) COLLATE "default",
"filed1_" varchar(255) COLLATE "default",
"filed2_" varchar(255) COLLATE "default",
"filed3_" varchar(255) COLLATE "default",
"dynamic_field_" varchar(4000) COLLATE "default",
"bytearray_id_" varchar(64) COLLATE "default",
"remark_" varchar(4000) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."aos_au_user_ext" IS '用户扩展信息表';
COMMENT ON COLUMN "public"."aos_au_user_ext"."id_" IS '用户ID';
COMMENT ON COLUMN "public"."aos_au_user_ext"."email_" IS '电子邮件';
COMMENT ON COLUMN "public"."aos_au_user_ext"."fixed_phone_" IS '固定电话';
COMMENT ON COLUMN "public"."aos_au_user_ext"."mobile_phone_" IS '移动电话';
COMMENT ON COLUMN "public"."aos_au_user_ext"."address_" IS '联系地址';
COMMENT ON COLUMN "public"."aos_au_user_ext"."zip_" IS '邮编';
COMMENT ON COLUMN "public"."aos_au_user_ext"."birthday_" IS '生日';
COMMENT ON COLUMN "public"."aos_au_user_ext"."idno_" IS '身份证号';
COMMENT ON COLUMN "public"."aos_au_user_ext"."qq_" IS 'QQ';
COMMENT ON COLUMN "public"."aos_au_user_ext"."filed1_" IS '静态扩展字段1';
COMMENT ON COLUMN "public"."aos_au_user_ext"."filed2_" IS '静态扩展字段2';
COMMENT ON COLUMN "public"."aos_au_user_ext"."filed3_" IS '静态扩展字段3';
COMMENT ON COLUMN "public"."aos_au_user_ext"."dynamic_field_" IS '动态扩展字段(JSON)';
COMMENT ON COLUMN "public"."aos_au_user_ext"."bytearray_id_" IS '用户头像流文件ID';
COMMENT ON COLUMN "public"."aos_au_user_ext"."remark_" IS '备注';

-- ----------------------------
-- Records of aos_au_user_ext
-- ----------------------------
INSERT INTO "public"."aos_au_user_ext" VALUES ('1', '307916217@qq.com', '', '18616786188', '', '', '', '', '307916217', '', '', null, '', '678', '超级用户拥有系统最高权限。');
INSERT INTO "public"."aos_au_user_ext" VALUES ('14', '', '', '', '', '', '', '', '', '', '', '', '', '680', '');
INSERT INTO "public"."aos_au_user_ext" VALUES ('15', '', '', '', '', '', '2015-02-01', '', '', '', '', '', '', '646', '');
INSERT INTO "public"."aos_au_user_ext" VALUES ('19', 'xxx@qq.com', '0871-3131921', '18616786188', '云南大理', '53021890', '2015-01-30', '532925108211170651', '307916217', '100', '100', '100', '', '644', '备注内容');
INSERT INTO "public"."aos_au_user_ext" VALUES ('20', '', '', '', '', '', '', '', '', '100', '100', null, '', '', '');

-- ----------------------------
-- Table structure for aos_au_user_post
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_au_user_post";
CREATE TABLE "public"."aos_au_user_post" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"user_id_" varchar(64) COLLATE "default" NOT NULL,
"post_id_" varchar(64) COLLATE "default" NOT NULL,
"operate_time_" varchar(255) COLLATE "default" NOT NULL,
"operator_id_" varchar(64) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."aos_au_user_post" IS '用户-岗位关联表';
COMMENT ON COLUMN "public"."aos_au_user_post"."id_" IS '流水号';
COMMENT ON COLUMN "public"."aos_au_user_post"."user_id_" IS '用户流水号';
COMMENT ON COLUMN "public"."aos_au_user_post"."post_id_" IS '岗位流水号';
COMMENT ON COLUMN "public"."aos_au_user_post"."operate_time_" IS '授权时间';
COMMENT ON COLUMN "public"."aos_au_user_post"."operator_id_" IS '授权人流水号';

-- ----------------------------
-- Records of aos_au_user_post
-- ----------------------------
INSERT INTO "public"."aos_au_user_post" VALUES ('3169', '15', '538', '2015-01-22 13:03:44', '1');

-- ----------------------------
-- Table structure for aos_au_user_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_au_user_role";
CREATE TABLE "public"."aos_au_user_role" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"user_id_" varchar(64) COLLATE "default" NOT NULL,
"role_id_" varchar(64) COLLATE "default" NOT NULL,
"operate_time_" varchar(255) COLLATE "default" NOT NULL,
"operator_id_" varchar(64) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."aos_au_user_role" IS '用户-角色关联表';
COMMENT ON COLUMN "public"."aos_au_user_role"."id_" IS '流水号';
COMMENT ON COLUMN "public"."aos_au_user_role"."user_id_" IS '用户流水号';
COMMENT ON COLUMN "public"."aos_au_user_role"."role_id_" IS '角色流水号';
COMMENT ON COLUMN "public"."aos_au_user_role"."operate_time_" IS '授权时间';
COMMENT ON COLUMN "public"."aos_au_user_role"."operator_id_" IS '授权人流水号';

-- ----------------------------
-- Records of aos_au_user_role
-- ----------------------------
INSERT INTO "public"."aos_au_user_role" VALUES ('3164', '15', '605', '2015-01-22 11:02:35', '1');
INSERT INTO "public"."aos_au_user_role" VALUES ('3266', '14', '541', '2015-02-02 15:45:27', '1');
INSERT INTO "public"."aos_au_user_role" VALUES ('3267', '14', '605', '2015-02-02 15:45:27', '1');

-- ----------------------------
-- Table structure for aos_bp_act_evt_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_bp_act_evt_log";
CREATE TABLE "public"."aos_bp_act_evt_log" (
"log_nr_" int4 DEFAULT nextval('aos_bp_act_evt_log_log_nr__seq'::regclass) NOT NULL,
"type_" varchar(64) COLLATE "default",
"proc_def_id_" varchar(64) COLLATE "default",
"proc_inst_id_" varchar(64) COLLATE "default",
"execution_id_" varchar(64) COLLATE "default",
"task_id_" varchar(64) COLLATE "default",
"time_stamp_" timestamp(6) NOT NULL,
"user_id_" varchar(255) COLLATE "default",
"data_" bytea,
"lock_owner_" varchar(255) COLLATE "default",
"lock_time_" timestamp(6),
"is_processed_" int2 DEFAULT 0
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of aos_bp_act_evt_log
-- ----------------------------

-- ----------------------------
-- Table structure for aos_bp_act_ge_bytearray
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_bp_act_ge_bytearray";
CREATE TABLE "public"."aos_bp_act_ge_bytearray" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"rev_" int4,
"name_" varchar(255) COLLATE "default",
"deployment_id_" varchar(64) COLLATE "default",
"bytes_" bytea,
"generated_" bool
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of aos_bp_act_ge_bytearray
-- ----------------------------

-- ----------------------------
-- Table structure for aos_bp_act_ge_property
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_bp_act_ge_property";
CREATE TABLE "public"."aos_bp_act_ge_property" (
"name_" varchar(64) COLLATE "default" NOT NULL,
"value_" varchar(300) COLLATE "default",
"rev_" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of aos_bp_act_ge_property
-- ----------------------------
INSERT INTO "public"."aos_bp_act_ge_property" VALUES ('next.dbid', '1', '1');
INSERT INTO "public"."aos_bp_act_ge_property" VALUES ('schema.history', 'create(5.17.0.2)', '1');
INSERT INTO "public"."aos_bp_act_ge_property" VALUES ('schema.version', '5.17.0.2', '1');

-- ----------------------------
-- Table structure for aos_bp_act_hi_actinst
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_bp_act_hi_actinst";
CREATE TABLE "public"."aos_bp_act_hi_actinst" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"proc_def_id_" varchar(64) COLLATE "default" NOT NULL,
"proc_inst_id_" varchar(64) COLLATE "default" NOT NULL,
"execution_id_" varchar(64) COLLATE "default" NOT NULL,
"act_id_" varchar(255) COLLATE "default" NOT NULL,
"task_id_" varchar(64) COLLATE "default",
"call_proc_inst_id_" varchar(64) COLLATE "default",
"act_name_" varchar(255) COLLATE "default",
"act_type_" varchar(255) COLLATE "default" NOT NULL,
"assignee_" varchar(255) COLLATE "default",
"start_time_" timestamp(6) NOT NULL,
"end_time_" timestamp(6),
"duration_" int8,
"tenant_id_" varchar(255) COLLATE "default" DEFAULT ''::character varying
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of aos_bp_act_hi_actinst
-- ----------------------------

-- ----------------------------
-- Table structure for aos_bp_act_hi_attachment
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_bp_act_hi_attachment";
CREATE TABLE "public"."aos_bp_act_hi_attachment" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"rev_" int4,
"user_id_" varchar(255) COLLATE "default",
"name_" varchar(255) COLLATE "default",
"description_" varchar(4000) COLLATE "default",
"type_" varchar(255) COLLATE "default",
"task_id_" varchar(64) COLLATE "default",
"proc_inst_id_" varchar(64) COLLATE "default",
"url_" varchar(4000) COLLATE "default",
"content_id_" varchar(64) COLLATE "default",
"time_" timestamp(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of aos_bp_act_hi_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for aos_bp_act_hi_comment
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_bp_act_hi_comment";
CREATE TABLE "public"."aos_bp_act_hi_comment" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"type_" varchar(255) COLLATE "default",
"time_" timestamp(6) NOT NULL,
"user_id_" varchar(255) COLLATE "default",
"task_id_" varchar(64) COLLATE "default",
"proc_inst_id_" varchar(64) COLLATE "default",
"action_" varchar(255) COLLATE "default",
"message_" varchar(4000) COLLATE "default",
"full_msg_" bytea
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of aos_bp_act_hi_comment
-- ----------------------------

-- ----------------------------
-- Table structure for aos_bp_act_hi_detail
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_bp_act_hi_detail";
CREATE TABLE "public"."aos_bp_act_hi_detail" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"type_" varchar(255) COLLATE "default" NOT NULL,
"proc_inst_id_" varchar(64) COLLATE "default",
"execution_id_" varchar(64) COLLATE "default",
"task_id_" varchar(64) COLLATE "default",
"act_inst_id_" varchar(64) COLLATE "default",
"name_" varchar(255) COLLATE "default" NOT NULL,
"var_type_" varchar(64) COLLATE "default",
"rev_" int4,
"time_" timestamp(6) NOT NULL,
"bytearray_id_" varchar(64) COLLATE "default",
"double_" float8,
"long_" int8,
"text_" varchar(4000) COLLATE "default",
"text2_" varchar(4000) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of aos_bp_act_hi_detail
-- ----------------------------

-- ----------------------------
-- Table structure for aos_bp_act_hi_identitylink
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_bp_act_hi_identitylink";
CREATE TABLE "public"."aos_bp_act_hi_identitylink" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"group_id_" varchar(255) COLLATE "default",
"type_" varchar(255) COLLATE "default",
"user_id_" varchar(255) COLLATE "default",
"task_id_" varchar(64) COLLATE "default",
"proc_inst_id_" varchar(64) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of aos_bp_act_hi_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for aos_bp_act_hi_procinst
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_bp_act_hi_procinst";
CREATE TABLE "public"."aos_bp_act_hi_procinst" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"proc_inst_id_" varchar(64) COLLATE "default" NOT NULL,
"business_key_" varchar(255) COLLATE "default",
"proc_def_id_" varchar(64) COLLATE "default" NOT NULL,
"start_time_" timestamp(6) NOT NULL,
"end_time_" timestamp(6),
"duration_" int8,
"start_user_id_" varchar(255) COLLATE "default",
"start_act_id_" varchar(255) COLLATE "default",
"end_act_id_" varchar(255) COLLATE "default",
"super_process_instance_id_" varchar(64) COLLATE "default",
"delete_reason_" varchar(4000) COLLATE "default",
"tenant_id_" varchar(255) COLLATE "default" DEFAULT ''::character varying,
"name_" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of aos_bp_act_hi_procinst
-- ----------------------------

-- ----------------------------
-- Table structure for aos_bp_act_hi_taskinst
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_bp_act_hi_taskinst";
CREATE TABLE "public"."aos_bp_act_hi_taskinst" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"proc_def_id_" varchar(64) COLLATE "default",
"task_def_key_" varchar(255) COLLATE "default",
"proc_inst_id_" varchar(64) COLLATE "default",
"execution_id_" varchar(64) COLLATE "default",
"name_" varchar(255) COLLATE "default",
"parent_task_id_" varchar(64) COLLATE "default",
"description_" varchar(4000) COLLATE "default",
"owner_" varchar(255) COLLATE "default",
"assignee_" varchar(255) COLLATE "default",
"start_time_" timestamp(6) NOT NULL,
"claim_time_" timestamp(6),
"end_time_" timestamp(6),
"duration_" int8,
"delete_reason_" varchar(4000) COLLATE "default",
"priority_" int4,
"due_date_" timestamp(6),
"form_key_" varchar(255) COLLATE "default",
"category_" varchar(255) COLLATE "default",
"tenant_id_" varchar(255) COLLATE "default" DEFAULT ''::character varying
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of aos_bp_act_hi_taskinst
-- ----------------------------

-- ----------------------------
-- Table structure for aos_bp_act_hi_varinst
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_bp_act_hi_varinst";
CREATE TABLE "public"."aos_bp_act_hi_varinst" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"proc_inst_id_" varchar(64) COLLATE "default",
"execution_id_" varchar(64) COLLATE "default",
"task_id_" varchar(64) COLLATE "default",
"name_" varchar(255) COLLATE "default" NOT NULL,
"var_type_" varchar(100) COLLATE "default",
"rev_" int4,
"bytearray_id_" varchar(64) COLLATE "default",
"double_" float8,
"long_" int8,
"text_" varchar(4000) COLLATE "default",
"text2_" varchar(4000) COLLATE "default",
"create_time_" timestamp(6),
"last_updated_time_" timestamp(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of aos_bp_act_hi_varinst
-- ----------------------------

-- ----------------------------
-- Table structure for aos_bp_act_id_group
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_bp_act_id_group";
CREATE TABLE "public"."aos_bp_act_id_group" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"rev_" int4,
"name_" varchar(255) COLLATE "default",
"type_" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of aos_bp_act_id_group
-- ----------------------------

-- ----------------------------
-- Table structure for aos_bp_act_id_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_bp_act_id_info";
CREATE TABLE "public"."aos_bp_act_id_info" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"rev_" int4,
"user_id_" varchar(64) COLLATE "default",
"type_" varchar(64) COLLATE "default",
"key_" varchar(255) COLLATE "default",
"value_" varchar(255) COLLATE "default",
"password_" bytea,
"parent_id_" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of aos_bp_act_id_info
-- ----------------------------

-- ----------------------------
-- Table structure for aos_bp_act_id_membership
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_bp_act_id_membership";
CREATE TABLE "public"."aos_bp_act_id_membership" (
"user_id_" varchar(64) COLLATE "default" NOT NULL,
"group_id_" varchar(64) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."aos_bp_act_id_membership" IS '把自己的角色/岗位-人员关联表当这个表使用';

-- ----------------------------
-- Records of aos_bp_act_id_membership
-- ----------------------------

-- ----------------------------
-- Table structure for aos_bp_act_id_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_bp_act_id_user";
CREATE TABLE "public"."aos_bp_act_id_user" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"rev_" int4,
"first_" varchar(255) COLLATE "default",
"last_" varchar(255) COLLATE "default",
"email_" varchar(255) COLLATE "default",
"pwd_" varchar(255) COLLATE "default",
"picture_id_" varchar(64) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of aos_bp_act_id_user
-- ----------------------------

-- ----------------------------
-- Table structure for aos_bp_act_re_deployment
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_bp_act_re_deployment";
CREATE TABLE "public"."aos_bp_act_re_deployment" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"name_" varchar(255) COLLATE "default",
"category_" varchar(255) COLLATE "default",
"tenant_id_" varchar(255) COLLATE "default" DEFAULT ''::character varying,
"deploy_time_" timestamp(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of aos_bp_act_re_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for aos_bp_act_re_model
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_bp_act_re_model";
CREATE TABLE "public"."aos_bp_act_re_model" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"rev_" int4,
"name_" varchar(255) COLLATE "default",
"key_" varchar(255) COLLATE "default",
"category_" varchar(255) COLLATE "default",
"create_time_" timestamp(6),
"last_update_time_" timestamp(6),
"version_" int4,
"meta_info_" varchar(4000) COLLATE "default",
"deployment_id_" varchar(64) COLLATE "default",
"editor_source_value_id_" varchar(64) COLLATE "default",
"editor_source_extra_value_id_" varchar(64) COLLATE "default",
"tenant_id_" varchar(255) COLLATE "default" DEFAULT ''::character varying
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of aos_bp_act_re_model
-- ----------------------------

-- ----------------------------
-- Table structure for aos_bp_act_re_procdef
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_bp_act_re_procdef";
CREATE TABLE "public"."aos_bp_act_re_procdef" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"rev_" int4,
"category_" varchar(255) COLLATE "default",
"name_" varchar(255) COLLATE "default",
"key_" varchar(255) COLLATE "default" NOT NULL,
"version_" int4 NOT NULL,
"deployment_id_" varchar(64) COLLATE "default",
"resource_name_" varchar(4000) COLLATE "default",
"dgrm_resource_name_" varchar(4000) COLLATE "default",
"description_" varchar(4000) COLLATE "default",
"has_start_form_key_" bool,
"has_graphical_notation_" bool,
"suspension_state_" int4,
"tenant_id_" varchar(255) COLLATE "default" DEFAULT ''::character varying
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of aos_bp_act_re_procdef
-- ----------------------------

-- ----------------------------
-- Table structure for aos_bp_act_ru_event_subscr
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_bp_act_ru_event_subscr";
CREATE TABLE "public"."aos_bp_act_ru_event_subscr" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"rev_" int4,
"event_type_" varchar(255) COLLATE "default" NOT NULL,
"event_name_" varchar(255) COLLATE "default",
"execution_id_" varchar(64) COLLATE "default",
"proc_inst_id_" varchar(64) COLLATE "default",
"activity_id_" varchar(64) COLLATE "default",
"configuration_" varchar(255) COLLATE "default",
"created_" timestamp(6) NOT NULL,
"proc_def_id_" varchar(64) COLLATE "default",
"tenant_id_" varchar(255) COLLATE "default" DEFAULT ''::character varying
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of aos_bp_act_ru_event_subscr
-- ----------------------------

-- ----------------------------
-- Table structure for aos_bp_act_ru_execution
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_bp_act_ru_execution";
CREATE TABLE "public"."aos_bp_act_ru_execution" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"rev_" int4,
"proc_inst_id_" varchar(64) COLLATE "default",
"business_key_" varchar(255) COLLATE "default",
"parent_id_" varchar(64) COLLATE "default",
"proc_def_id_" varchar(64) COLLATE "default",
"super_exec_" varchar(64) COLLATE "default",
"act_id_" varchar(255) COLLATE "default",
"is_active_" bool,
"is_concurrent_" bool,
"is_scope_" bool,
"is_event_scope_" bool,
"suspension_state_" int4,
"cached_ent_state_" int4,
"tenant_id_" varchar(255) COLLATE "default" DEFAULT ''::character varying,
"name_" varchar(255) COLLATE "default",
"lock_time_" timestamp(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of aos_bp_act_ru_execution
-- ----------------------------

-- ----------------------------
-- Table structure for aos_bp_act_ru_identitylink
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_bp_act_ru_identitylink";
CREATE TABLE "public"."aos_bp_act_ru_identitylink" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"rev_" int4,
"group_id_" varchar(255) COLLATE "default",
"type_" varchar(255) COLLATE "default",
"user_id_" varchar(255) COLLATE "default",
"task_id_" varchar(64) COLLATE "default",
"proc_inst_id_" varchar(64) COLLATE "default",
"proc_def_id_" varchar(64) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of aos_bp_act_ru_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for aos_bp_act_ru_job
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_bp_act_ru_job";
CREATE TABLE "public"."aos_bp_act_ru_job" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"rev_" int4,
"type_" varchar(255) COLLATE "default" NOT NULL,
"lock_exp_time_" timestamp(6),
"lock_owner_" varchar(255) COLLATE "default",
"exclusive_" bool,
"execution_id_" varchar(64) COLLATE "default",
"process_instance_id_" varchar(64) COLLATE "default",
"proc_def_id_" varchar(64) COLLATE "default",
"retries_" int4,
"exception_stack_id_" varchar(64) COLLATE "default",
"exception_msg_" varchar(4000) COLLATE "default",
"duedate_" timestamp(6),
"repeat_" varchar(255) COLLATE "default",
"handler_type_" varchar(255) COLLATE "default",
"handler_cfg_" varchar(4000) COLLATE "default",
"tenant_id_" varchar(255) COLLATE "default" DEFAULT ''::character varying
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of aos_bp_act_ru_job
-- ----------------------------

-- ----------------------------
-- Table structure for aos_bp_act_ru_task
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_bp_act_ru_task";
CREATE TABLE "public"."aos_bp_act_ru_task" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"rev_" int4,
"execution_id_" varchar(64) COLLATE "default",
"proc_inst_id_" varchar(64) COLLATE "default",
"proc_def_id_" varchar(64) COLLATE "default",
"name_" varchar(255) COLLATE "default",
"parent_task_id_" varchar(64) COLLATE "default",
"description_" varchar(4000) COLLATE "default",
"task_def_key_" varchar(255) COLLATE "default",
"owner_" varchar(255) COLLATE "default",
"assignee_" varchar(255) COLLATE "default",
"delegation_" varchar(64) COLLATE "default",
"priority_" int4,
"create_time_" timestamp(6),
"due_date_" timestamp(6),
"category_" varchar(255) COLLATE "default",
"suspension_state_" int4,
"tenant_id_" varchar(255) COLLATE "default" DEFAULT ''::character varying,
"form_key_" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of aos_bp_act_ru_task
-- ----------------------------

-- ----------------------------
-- Table structure for aos_bp_act_ru_variable
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_bp_act_ru_variable";
CREATE TABLE "public"."aos_bp_act_ru_variable" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"rev_" int4,
"type_" varchar(255) COLLATE "default" NOT NULL,
"name_" varchar(255) COLLATE "default" NOT NULL,
"execution_id_" varchar(64) COLLATE "default",
"proc_inst_id_" varchar(64) COLLATE "default",
"task_id_" varchar(64) COLLATE "default",
"bytearray_id_" varchar(64) COLLATE "default",
"double_" float8,
"long_" int8,
"text_" varchar(4000) COLLATE "default",
"text2_" varchar(4000) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of aos_bp_act_ru_variable
-- ----------------------------

-- ----------------------------
-- Table structure for aos_bp_ext_model
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_bp_ext_model";
CREATE TABLE "public"."aos_bp_ext_model" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"model_id_" varchar(64) COLLATE "default" NOT NULL,
"create_type_" varchar(2) COLLATE "default" NOT NULL,
"name_" varchar(255) COLLATE "default" NOT NULL,
"create_user_id_" varchar(64) COLLATE "default" NOT NULL,
"create_user_" varchar(255) COLLATE "default" NOT NULL,
"create_time_" varchar(20) COLLATE "default" NOT NULL,
"remark_" varchar(4000) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."aos_bp_ext_model" IS '流程模型扩展表';
COMMENT ON COLUMN "public"."aos_bp_ext_model"."id_" IS '流水号';
COMMENT ON COLUMN "public"."aos_bp_ext_model"."model_id_" IS '模型ID';
COMMENT ON COLUMN "public"."aos_bp_ext_model"."create_type_" IS '模型创建方式';
COMMENT ON COLUMN "public"."aos_bp_ext_model"."name_" IS '流程名称';
COMMENT ON COLUMN "public"."aos_bp_ext_model"."create_user_id_" IS '创建人流水号';
COMMENT ON COLUMN "public"."aos_bp_ext_model"."create_user_" IS '创建人';
COMMENT ON COLUMN "public"."aos_bp_ext_model"."create_time_" IS '创建时间';
COMMENT ON COLUMN "public"."aos_bp_ext_model"."remark_" IS '备注';

-- ----------------------------
-- Records of aos_bp_ext_model
-- ----------------------------

-- ----------------------------
-- Table structure for aos_bp_ext_procdef
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_bp_ext_procdef";
CREATE TABLE "public"."aos_bp_ext_procdef" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"model_id_" varchar(64) COLLATE "default" NOT NULL,
"proc_def_id_" varchar(64) COLLATE "default" NOT NULL,
"deploy_user_id_" varchar(64) COLLATE "default" NOT NULL,
"deploy_user_" varchar(255) COLLATE "default" NOT NULL,
"deploy_time_" varchar(20) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."aos_bp_ext_procdef" IS '流程定义扩展表';
COMMENT ON COLUMN "public"."aos_bp_ext_procdef"."id_" IS '流水号';
COMMENT ON COLUMN "public"."aos_bp_ext_procdef"."model_id_" IS '模型ID';
COMMENT ON COLUMN "public"."aos_bp_ext_procdef"."proc_def_id_" IS '流程定义ID';
COMMENT ON COLUMN "public"."aos_bp_ext_procdef"."deploy_user_id_" IS '部署人流水号';
COMMENT ON COLUMN "public"."aos_bp_ext_procdef"."deploy_user_" IS '部署人';
COMMENT ON COLUMN "public"."aos_bp_ext_procdef"."deploy_time_" IS '部署时间';

-- ----------------------------
-- Records of aos_bp_ext_procdef
-- ----------------------------

-- ----------------------------
-- Table structure for aos_ge_bytearray
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_ge_bytearray";
CREATE TABLE "public"."aos_ge_bytearray" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"key_" varchar(255) COLLATE "default" NOT NULL,
"name_" varchar(255) COLLATE "default" NOT NULL,
"catalog_id_" varchar(64) COLLATE "default" NOT NULL,
"catalog_cascade_id_" varchar(255) COLLATE "default" NOT NULL,
"content_type_" varchar(255) COLLATE "default" NOT NULL,
"size_" int8 NOT NULL,
"bytes_" bytea NOT NULL,
"remark_" varchar(4000) COLLATE "default",
"create_time_" varchar(255) COLLATE "default" NOT NULL,
"creater_id_" varchar(255) COLLATE "default" NOT NULL,
"title_" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."aos_ge_bytearray" IS '流文件表';
COMMENT ON COLUMN "public"."aos_ge_bytearray"."id_" IS '流水号';
COMMENT ON COLUMN "public"."aos_ge_bytearray"."key_" IS '标识键';
COMMENT ON COLUMN "public"."aos_ge_bytearray"."name_" IS '名称';
COMMENT ON COLUMN "public"."aos_ge_bytearray"."catalog_id_" IS '分类ID';
COMMENT ON COLUMN "public"."aos_ge_bytearray"."catalog_cascade_id_" IS '分类级联ID';
COMMENT ON COLUMN "public"."aos_ge_bytearray"."content_type_" IS '内容类型';
COMMENT ON COLUMN "public"."aos_ge_bytearray"."size_" IS '大小';
COMMENT ON COLUMN "public"."aos_ge_bytearray"."bytes_" IS '流文件';
COMMENT ON COLUMN "public"."aos_ge_bytearray"."remark_" IS '备注';
COMMENT ON COLUMN "public"."aos_ge_bytearray"."create_time_" IS '创建时间';
COMMENT ON COLUMN "public"."aos_ge_bytearray"."creater_id_" IS '操作人ID';
COMMENT ON COLUMN "public"."aos_ge_bytearray"."title_" IS '标题';

-- ----------------------------
-- Records of aos_ge_bytearray
-- ----------------------------

-- ----------------------------
-- Table structure for aos_ge_catalog
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_ge_catalog";
CREATE TABLE "public"."aos_ge_catalog" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"root_key_" varchar(255) COLLATE "default" NOT NULL,
"root_name_" varchar(255) COLLATE "default" NOT NULL,
"name_" varchar(255) COLLATE "default" NOT NULL,
"hotkey_" varchar(255) COLLATE "default",
"parent_id_" varchar(64) COLLATE "default" NOT NULL,
"is_leaf_" varchar(2) COLLATE "default" DEFAULT 1 NOT NULL,
"is_auto_expand_" varchar(2) COLLATE "default" DEFAULT 0 NOT NULL,
"icon_name_" varchar(255) COLLATE "default",
"sort_no_" int2 DEFAULT 0,
"cascade_id_" varchar(255) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."aos_ge_catalog" IS '分类表';
COMMENT ON COLUMN "public"."aos_ge_catalog"."id_" IS 'ID';
COMMENT ON COLUMN "public"."aos_ge_catalog"."root_key_" IS '科目标识键';
COMMENT ON COLUMN "public"."aos_ge_catalog"."root_name_" IS '科目名称';
COMMENT ON COLUMN "public"."aos_ge_catalog"."name_" IS '分类名称';
COMMENT ON COLUMN "public"."aos_ge_catalog"."hotkey_" IS '热键';
COMMENT ON COLUMN "public"."aos_ge_catalog"."parent_id_" IS '父节点流水号';
COMMENT ON COLUMN "public"."aos_ge_catalog"."is_leaf_" IS '是否叶子节点';
COMMENT ON COLUMN "public"."aos_ge_catalog"."is_auto_expand_" IS '是否自动展开';
COMMENT ON COLUMN "public"."aos_ge_catalog"."icon_name_" IS '图标文件名称';
COMMENT ON COLUMN "public"."aos_ge_catalog"."sort_no_" IS '排序号';
COMMENT ON COLUMN "public"."aos_ge_catalog"."cascade_id_" IS '节点语义ID';

-- ----------------------------
-- Records of aos_ge_catalog
-- ----------------------------
INSERT INTO "public"."aos_ge_catalog" VALUES ('10', 'PARAM_TYPE', '参数分类科目', '参数分类', '', '0', '0', '0', 'book.png', '1', '0.001');
INSERT INTO "public"."aos_ge_catalog" VALUES ('11', 'PARAM_TYPE', '参数分类科目', '业务参数', '', '10', '1', '0', 'user20.png', '2', '0.001.001');
INSERT INTO "public"."aos_ge_catalog" VALUES ('12', 'PARAM_TYPE', '参数分类科目', '系统参数', '', '10', '0', '1', 'folder22.png', '1', '0.001.002');
INSERT INTO "public"."aos_ge_catalog" VALUES ('1689', 'WF_PROC_TYPE', '流程分类', '流程分类', null, '0', '0', '0', 'book.png', '50', '0.005');
INSERT INTO "public"."aos_ge_catalog" VALUES ('1690', 'WF_PROC_TYPE', '流程分类', '默认分类', null, '1689', '1', '0', null, '10', '0.005.001');
INSERT INTO "public"."aos_ge_catalog" VALUES ('38', 'DIC_TYPE', '词典分类科目', '数据字典分类', '', '0', '0', '0', 'book.png', '2', '0.002');
INSERT INTO "public"."aos_ge_catalog" VALUES ('39', 'DIC_TYPE', '词典分类科目', '系统管理', '', '38', '0', '1', 'folder22.png', '2', '0.002.001');
INSERT INTO "public"."aos_ge_catalog" VALUES ('40', 'DIC_TYPE', '词典分类科目', '全局通用', '', '38', '1', '0', 'folder24.png', '3', '0.002.002');
INSERT INTO "public"."aos_ge_catalog" VALUES ('410', 'PARAM_TYPE', '参数分类科目', '验证码', '', '12', '1', '0', 'ok3.png', '2', '0.001.002.001');
INSERT INTO "public"."aos_ge_catalog" VALUES ('413', 'PARAM_TYPE', '参数分类科目', '界面显示', '', '12', '1', '0', 'icon59.png', '1', '0.001.002.002');
INSERT INTO "public"."aos_ge_catalog" VALUES ('414', 'PARAM_TYPE', '参数分类科目', '其它', '', '12', '1', '0', 'icon150.png', '9', '0.001.002.003');
INSERT INTO "public"."aos_ge_catalog" VALUES ('423', 'PARAM_TYPE', '参数分类科目', '导航与菜单', '', '12', '1', '0', 'icon152.png', '3', '0.001.002.004');
INSERT INTO "public"."aos_ge_catalog" VALUES ('47', 'PARAM_TYPE', '参数分类科目', 'XXA业务域', null, '46', '1', '0', null, '1', '0.001.004.001');
INSERT INTO "public"."aos_ge_catalog" VALUES ('48', 'PARAM_TYPE', '参数分类科目', 'XXB业务域', null, '46', '1', '0', null, '2', '0.001.004.002');
INSERT INTO "public"."aos_ge_catalog" VALUES ('505', 'WF_MODEL_TYPE', '流程模型分类', '流程模型分类', '', '0', '0', '0', 'book.png', '3', '0.003');
INSERT INTO "public"."aos_ge_catalog" VALUES ('506', 'WF_PROCESS_TYPE', '流程分类', '默认分类', '', '505', '1', '0', '', '1', '0.003.001');
INSERT INTO "public"."aos_ge_catalog" VALUES ('542', 'DIC_TYPE', '词典分类科目', '工作流', '', '39', '1', '0', 'folder6.png', '1', '0.002.001.001');
INSERT INTO "public"."aos_ge_catalog" VALUES ('611', 'BYTE_FILE_TYPE', '流文件分类', '流文件分类', '', '0', '0', '0', 'book.png', '4', '0.004');
INSERT INTO "public"."aos_ge_catalog" VALUES ('613', 'BYTE_FILE_TYPE', '流文件分类', '用户头像', '', '611', '1', '0', 'vcard.png', '1', '0.004.001');
INSERT INTO "public"."aos_ge_catalog" VALUES ('614', 'BYTE_FILE_TYPE', '流文件分类', '报表模版', '', '611', '1', '0', 'page_paint.png', '2', '0.004.002');
INSERT INTO "public"."aos_ge_catalog" VALUES ('616', 'BYTE_FILE_TYPE', '流文件分类', '序列化对象', '', '611', '1', '0', 'plugin.png', '3', '0.004.003');
INSERT INTO "public"."aos_ge_catalog" VALUES ('80', 'DIC_TYPE', '词典分类科目', '平台配置', '', '38', '1', '0', 'folder2.png', '1', '0.002.006');

-- ----------------------------
-- Table structure for aos_ge_dic
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_ge_dic";
CREATE TABLE "public"."aos_ge_dic" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"code_" varchar(255) COLLATE "default" NOT NULL,
"desc_" varchar(255) COLLATE "default" NOT NULL,
"hotkey_" varchar(255) COLLATE "default",
"status_" varchar(2) COLLATE "default" DEFAULT 1 NOT NULL,
"dic_index_id_" varchar(64) COLLATE "default" NOT NULL,
"remark_" varchar(4000) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."aos_ge_dic" IS '数据字典明细表';
COMMENT ON COLUMN "public"."aos_ge_dic"."id_" IS '流水号';
COMMENT ON COLUMN "public"."aos_ge_dic"."code_" IS '字典对照码';
COMMENT ON COLUMN "public"."aos_ge_dic"."desc_" IS '字典对照值';
COMMENT ON COLUMN "public"."aos_ge_dic"."hotkey_" IS '热键';
COMMENT ON COLUMN "public"."aos_ge_dic"."status_" IS '当前状态';
COMMENT ON COLUMN "public"."aos_ge_dic"."dic_index_id_" IS '所属字典流水号';
COMMENT ON COLUMN "public"."aos_ge_dic"."remark_" IS '备注';

-- ----------------------------
-- Records of aos_ge_dic
-- ----------------------------
INSERT INTO "public"."aos_ge_dic" VALUES ('123', '2', '表格列', null, '1', '122', '');
INSERT INTO "public"."aos_ge_dic" VALUES ('124', '3', '表单元素(输入框|下拉框|选择框等)', null, '1', '122', '');
INSERT INTO "public"."aos_ge_dic" VALUES ('125', '4', '容器组件(窗口|面板|树|表格|工具栏等)', null, '1', '122', '');
INSERT INTO "public"."aos_ge_dic" VALUES ('1637', '1', '主页面', null, '1', '1636', '点击主导航菜单打开的页面');
INSERT INTO "public"."aos_ge_dic" VALUES ('1638', '2', '子页面', null, '1', '1636', '在主页面上的子导航打开的页面(内嵌式的)');
INSERT INTO "public"."aos_ge_dic" VALUES ('1640', '3', '关联页面', null, '1', '1636', '主页面上跳转出去的页面');
INSERT INTO "public"."aos_ge_dic" VALUES ('1651', '4', '分割符', null, '1', '1636', '子页面生成的二级导航菜单的分割符标识');
INSERT INTO "public"."aos_ge_dic" VALUES ('1671', '1', '平铺', null, '1', '1670', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('1672', '2', '树状', null, '1', '1670', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('1674', '0', '系统导航', null, '1', '1673', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('1675', '1', '快捷菜单', null, '1', '1673', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('1676', '2', '发现', null, '1', '1673', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('1681', '4', '导入离线文本', null, '1', '543', '');
INSERT INTO "public"."aos_ge_dic" VALUES ('1686', '1', '激活', null, '1', '1685', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('1687', '2', '挂起', null, '1', '1685', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('1694', 'PENDING', '代理中', null, '1', '1693', '');
INSERT INTO "public"."aos_ge_dic" VALUES ('1697', '9', '结束', null, '1', '1685', '引擎中并非有次状态，只为表格显示非空而增加。');
INSERT INTO "public"."aos_ge_dic" VALUES ('1699', '1', '待办', null, '1', '1698', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('1700', '2', '办结', null, '1', '1698', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('1705', 'neptune', '#c0c0c0', null, '1', '1704', '');
INSERT INTO "public"."aos_ge_dic" VALUES ('1706', 'blue', '#99bce8', null, '1', '1704', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('1707', 'aos', '#99bce8', null, '1', '1704', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('1708', 'gray', '#BCB0B0', null, '1', '1704', '');
INSERT INTO "public"."aos_ge_dic" VALUES ('1709', '3', '待签收', null, '1', '1698', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('239', '1', '行政部门', null, '1', '238', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('240', '2', '项目组', null, '1', '238', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('241', '4', '其它', null, '1', '238', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('253', '3', '工作组', null, '1', '238', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('290', '1', '正常', null, '1', '289', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('291', '3', '管理员封锁', null, '1', '289', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('292', '2', '停用', null, '1', '289', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('294', '1', '缺省', null, '1', '293', '');
INSERT INTO "public"."aos_ge_dic" VALUES ('307', '0', '未知', null, '1', '306', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('308', '1', '男', null, '1', '306', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('309', '2', '女', null, '1', '306', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('310', '2', '超级用户', null, '1', '293', '');
INSERT INTO "public"."aos_ge_dic" VALUES ('311', '4', '系统封锁', null, '1', '289', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('312', '3', '注册用户', null, '1', '293', '');
INSERT INTO "public"."aos_ge_dic" VALUES ('315', '1', '缺省', null, '1', '314', '');
INSERT INTO "public"."aos_ge_dic" VALUES ('322', '1', '缺省', null, '1', '321', '');
INSERT INTO "public"."aos_ge_dic" VALUES ('335', '1', '经办权限', null, '1', '334', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('336', '2', '管理权限', null, '1', '334', '');
INSERT INTO "public"."aos_ge_dic" VALUES ('353', 'blue', 'blue.png', null, '1', '352', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('354', 'gray', 'gray.png', null, '1', '352', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('355', 'neptune', 'neptune.png', null, '1', '352', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('356', 'aos', 'aos.png', null, '1', '352', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('358', 'blue', '#DFE8F6', null, '1', '357', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('360', 'gray', '#F0F0F0', null, '1', '357', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('361', 'neptune', '#D0DDF2', null, '1', '357', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('362', 'aos', 'red', null, '1', '357', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('367', 'neptune', '#006699', null, '1', '365', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('368', 'blue', '#6699CC', null, '1', '365', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('369', 'gray', '#888888', null, '1', '365', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('370', 'aos', '#006699', null, '1', '365', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('372', 'neptune', '#FAFAFA', null, '1', '371', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('373', 'blue', '#3399FF', null, '1', '371', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('374', 'gray', '#555555', null, '1', '371', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('375', 'aos', '#FAFAFA', null, '1', '371', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('377', 'neptune', 'left-logo.png', null, '1', '376', '');
INSERT INTO "public"."aos_ge_dic" VALUES ('378', 'blue', 'left-logo.png', null, '1', '376', '');
INSERT INTO "public"."aos_ge_dic" VALUES ('379', 'gray', 'left-logo.png', null, '1', '376', '');
INSERT INTO "public"."aos_ge_dic" VALUES ('380', 'aos', 'left-logo.png', null, '1', '376', '');
INSERT INTO "public"."aos_ge_dic" VALUES ('405', '1', '小图标[16X16]', null, '1', '404', '');
INSERT INTO "public"."aos_ge_dic" VALUES ('406', '2', '大图标[64X64]', null, '1', '404', '');
INSERT INTO "public"."aos_ge_dic" VALUES ('407', '3', '矢量图标', null, '1', '404', '');
INSERT INTO "public"."aos_ge_dic" VALUES ('456', '1', '按钮|菜单下拉项', null, '1', '122', '');
INSERT INTO "public"."aos_ge_dic" VALUES ('463', '1', '未授权', null, '1', '462', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('464', '2', '显示', null, '1', '462', '');
INSERT INTO "public"."aos_ge_dic" VALUES ('465', '3', '隐藏', null, '1', '462', '');
INSERT INTO "public"."aos_ge_dic" VALUES ('466', '4', '只读', null, '1', '462', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('467', '5', '编辑', null, '1', '462', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('468', '6', '禁用', null, '1', '462', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('469', '7', '激活', null, '1', '462', '');
INSERT INTO "public"."aos_ge_dic" VALUES ('472', '99', '撤消授权', null, '1', '462', '');
INSERT INTO "public"."aos_ge_dic" VALUES ('544', '1', '在线设计', null, '1', '543', '');
INSERT INTO "public"."aos_ge_dic" VALUES ('545', '2', '在线克隆', null, '1', '543', '');
INSERT INTO "public"."aos_ge_dic" VALUES ('551', '3', '导入离线文件', null, '1', '543', '');
INSERT INTO "public"."aos_ge_dic" VALUES ('553', '1', '运行中', null, '1', '552', '');
INSERT INTO "public"."aos_ge_dic" VALUES ('554', '2', '已结束', null, '1', '552', '');
INSERT INTO "public"."aos_ge_dic" VALUES ('648', 'classic', '经典主题', null, '1', '647', '上Banner-左导航-中经办。');
INSERT INTO "public"."aos_ge_dic" VALUES ('650', 'blue', '天蓝', null, '1', '649', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('651', 'gray', '银灰', null, '1', '649', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('652', 'neptune', '海王星(水蓝)', null, '1', '649', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('653', 'aos', 'AOS', null, '1', '649', '');
INSERT INTO "public"."aos_ge_dic" VALUES ('655', 'tab', 'Tab风格', null, '1', '654', '支持打开多个业务经办界面。');
INSERT INTO "public"."aos_ge_dic" VALUES ('656', 'page', '单页风格', null, '1', '654', '只能打开一个功能页面');
INSERT INTO "public"."aos_ge_dic" VALUES ('658', '1', '同级', null, '1', '657', '水平导航按钮和垂直导航的卡片属于统一层级。');
INSERT INTO "public"."aos_ge_dic" VALUES ('659', '2', '级联', null, '1', '657', '水平导航按钮和垂直导航的卡片有上下级级联导航关系');
INSERT INTO "public"."aos_ge_dic" VALUES ('661', 'true', '显示', null, '1', '660', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('662', 'false', '隐藏', null, '1', '660', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('664', 'tight', '组合按钮', null, '1', '663', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('665', 'standalone', '独立按钮', null, '1', '663', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('667', '1', '显示', null, '1', '666', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('668', '0', '隐藏', null, '1', '666', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('682', '1', '快捷菜单', null, '1', '681', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('683', '2', '浮动菜单', null, '1', '681', '欢迎页显示的Mac风格的浮动菜单');
INSERT INTO "public"."aos_ge_dic" VALUES ('77', '1', '正常', null, '1', '76', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('78', '2', '挂失', null, '1', '76', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('79', '3', '注销', null, '1', '76', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('83', '1', '是', null, '1', '82', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('84', '0', '否', null, '1', '82', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('86', '0', '停用', null, '1', '85', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('87', '1', '启用', null, '1', '85', null);
INSERT INTO "public"."aos_ge_dic" VALUES ('89', '1', 'APPID', null, '1', '88', '');
INSERT INTO "public"."aos_ge_dic" VALUES ('90', '2', 'UUID', null, '1', '88', '');
INSERT INTO "public"."aos_ge_dic" VALUES ('91', '3', 'DBSequence', null, '1', '88', '');

-- ----------------------------
-- Table structure for aos_ge_dic_index
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_ge_dic_index";
CREATE TABLE "public"."aos_ge_dic_index" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"key_" varchar(255) COLLATE "default" NOT NULL,
"name_" varchar(255) COLLATE "default" NOT NULL,
"hotkey_" varchar(255) COLLATE "default",
"catalog_id_" varchar(64) COLLATE "default" NOT NULL,
"catalog_cascade_id_" varchar(255) COLLATE "default" NOT NULL,
"remark_" varchar(4000) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."aos_ge_dic_index" IS '数据字典索引表';
COMMENT ON COLUMN "public"."aos_ge_dic_index"."id_" IS '流水号';
COMMENT ON COLUMN "public"."aos_ge_dic_index"."key_" IS '字典标识';
COMMENT ON COLUMN "public"."aos_ge_dic_index"."name_" IS '字典名称';
COMMENT ON COLUMN "public"."aos_ge_dic_index"."hotkey_" IS '热键';
COMMENT ON COLUMN "public"."aos_ge_dic_index"."catalog_id_" IS '所属分类流水号';
COMMENT ON COLUMN "public"."aos_ge_dic_index"."catalog_cascade_id_" IS '所属分类流节点语义ID';
COMMENT ON COLUMN "public"."aos_ge_dic_index"."remark_" IS '备注';

-- ----------------------------
-- Records of aos_ge_dic_index
-- ----------------------------
INSERT INTO "public"."aos_ge_dic_index" VALUES ('122', 'page_el_type_', '页面元素类型', null, '39', '0.002.001', '');
INSERT INTO "public"."aos_ge_dic_index" VALUES ('1636', 'page_type_', '页面类型', null, '39', '0.002.001', '');
INSERT INTO "public"."aos_ge_dic_index" VALUES ('1670', 'nav_quick_layout_', '快捷菜单布局风格', null, '80', '0.002.006', '快捷菜单布局风格。');
INSERT INTO "public"."aos_ge_dic_index" VALUES ('1673', 'nav_tab_index_', '导航缺省活动页', null, '80', '0.002.006', '');
INSERT INTO "public"."aos_ge_dic_index" VALUES ('1685', 'suspension_state_', '实例/任务活动状态', null, '542', '0.002.001.001', '');
INSERT INTO "public"."aos_ge_dic_index" VALUES ('1693', 'delegation_', '委派状态', null, '542', '0.002.001.001', '流程任务的委派代理状态');
INSERT INTO "public"."aos_ge_dic_index" VALUES ('1698', 'proctask_status_', '任务状态', null, '542', '0.002.001.001', '');
INSERT INTO "public"."aos_ge_dic_index" VALUES ('1704', 'cmp_border_color_', '组件边框颜色', null, '80', '0.002.006', null);
INSERT INTO "public"."aos_ge_dic_index" VALUES ('238', 'org_type_', '组织类型', null, '39', '0.002.001', '');
INSERT INTO "public"."aos_ge_dic_index" VALUES ('289', 'user_status_', '用户状态', null, '39', '0.002.001', '');
INSERT INTO "public"."aos_ge_dic_index" VALUES ('293', 'user_type_', '用户类型', null, '39', '0.002.001', '');
INSERT INTO "public"."aos_ge_dic_index" VALUES ('306', 'sex_', '性别', null, '40', '0.002.002', '');
INSERT INTO "public"."aos_ge_dic_index" VALUES ('314', 'post_type_', '岗位类型', null, '39', '0.002.001', '');
INSERT INTO "public"."aos_ge_dic_index" VALUES ('321', 'role_type_', '角色类型', null, '39', '0.002.001', '');
INSERT INTO "public"."aos_ge_dic_index" VALUES ('334', 'grant_type_', '权限类型', null, '39', '0.002.001', '');
INSERT INTO "public"."aos_ge_dic_index" VALUES ('352', 'north_back_img_', '主页面north区域背景图片', null, '80', '0.002.006', '');
INSERT INTO "public"."aos_ge_dic_index" VALUES ('357', 'south_back_color_', '主页面south区域背景颜色', null, '80', '0.002.006', '');
INSERT INTO "public"."aos_ge_dic_index" VALUES ('365', 'main_text_color_', '边界区域字体主颜色', null, '80', '0.002.006', '');
INSERT INTO "public"."aos_ge_dic_index" VALUES ('371', 'nav_text_color_', '导航文字颜色', null, '80', '0.002.006', '');
INSERT INTO "public"."aos_ge_dic_index" VALUES ('376', 'left_logo_', 'Banner左边logo图标', null, '80', '0.002.006', '');
INSERT INTO "public"."aos_ge_dic_index" VALUES ('404', 'icon_type_', '图标类型', null, '39', '0.002.001', '');
INSERT INTO "public"."aos_ge_dic_index" VALUES ('462', 'cmp_grant_type_', '界面元素授权类型', null, '39', '0.002.001', '');
INSERT INTO "public"."aos_ge_dic_index" VALUES ('543', 'create_type_', '流程模型创建方式', null, '542', '0.002.001.001', '业务流程模型创建方式');
INSERT INTO "public"."aos_ge_dic_index" VALUES ('552', 'procinst_status_', '流程实例状态', null, '542', '0.002.001.001', null);
INSERT INTO "public"."aos_ge_dic_index" VALUES ('647', 'theme_', '系统主题', null, '80', '0.002.006', null);
INSERT INTO "public"."aos_ge_dic_index" VALUES ('649', 'skin_', '界面皮肤', null, '80', '0.002.006', null);
INSERT INTO "public"."aos_ge_dic_index" VALUES ('654', 'layout_', '业务经办区域布局风格', null, '80', '0.002.006', '系统业务经办区域(center)布局风格。可选值：tab|page。缺省值：tab。tab：支持同时打开多个功能模块界面；page：当前只能打开1个功能界面。');
INSERT INTO "public"."aos_ge_dic_index" VALUES ('657', 'nav_mode_', '导航模式', null, '80', '0.002.006', '顶部导航条和左侧树状导航的关系');
INSERT INTO "public"."aos_ge_dic_index" VALUES ('660', 'is_show_top_nav_', '是否显示顶部导航条', null, '80', '0.002.006', '是否显示水平导航条。(只有在导航模式为1的情况，此设置才有效,导航模式为2，则水平导航条不会消失)。可选值：true| false。');
INSERT INTO "public"."aos_ge_dic_index" VALUES ('663', 'navbar_btn_style_', '顶部导航条按钮风格', null, '80', '0.002.006', null);
INSERT INTO "public"."aos_ge_dic_index" VALUES ('666', 'is_show_mac_nav_', '是否显示Mac浮动导航', null, '80', '0.002.006', null);
INSERT INTO "public"."aos_ge_dic_index" VALUES ('681', 'module_user_nav_type', '导航菜单类型', null, '39', '0.002.001', null);
INSERT INTO "public"."aos_ge_dic_index" VALUES ('76', 'az01b2', '银行卡状态', null, '75', '0.002.005', null);
INSERT INTO "public"."aos_ge_dic_index" VALUES ('82', 'bool_', '是否布尔值字典', null, '40', '0.002.002', '');
INSERT INTO "public"."aos_ge_dic_index" VALUES ('85', 'enabled_', '使能状态', null, '40', '0.002.002', '');
INSERT INTO "public"."aos_ge_dic_index" VALUES ('88', 'sequence_type_', 'ID类型', null, '39', '0.002.001', '');

-- ----------------------------
-- Table structure for aos_ge_icon
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_ge_icon";
CREATE TABLE "public"."aos_ge_icon" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"name_" varchar(255) COLLATE "default" NOT NULL,
"type_" varchar(2) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."aos_ge_icon" IS '图标大全';
COMMENT ON COLUMN "public"."aos_ge_icon"."id_" IS '流水号';
COMMENT ON COLUMN "public"."aos_ge_icon"."name_" IS '名称';
COMMENT ON COLUMN "public"."aos_ge_icon"."type_" IS '类型';

-- ----------------------------
-- Records of aos_ge_icon
-- ----------------------------
INSERT INTO "public"."aos_ge_icon" VALUES ('1000', 'fa-angle-down', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1001', 'fa-desktop', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1002', 'fa-laptop', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1003', 'fa-tablet', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1004', 'fa-mobile', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1005', 'fa-circle-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1006', 'fa-quote-left', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1007', 'fa-quote-right', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1008', 'fa-spinner', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1009', 'fa-circle', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1010', 'fa-reply', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1011', 'fa-github-alt', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1012', 'fa-folder-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1013', 'fa-folder-open-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1014', 'fa-smile-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1015', 'fa-frown-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1016', 'fa-meh-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1017', 'fa-gamepad', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1018', 'fa-keyboard-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1019', 'fa-flag-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1020', 'fa-flag-checkered', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1021', 'fa-terminal', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1022', 'fa-code', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1023', 'fa-reply-all', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1024', 'fa-star-half-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1025', 'fa-location-arrow', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1026', 'fa-crop', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1027', 'fa-code-fork', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1028', 'fa-chain-broken', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1029', 'fa-question', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1030', 'fa-info', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1031', 'fa-exclamation', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1032', 'fa-superscript', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1033', 'fa-subscript', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1034', 'fa-eraser', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1035', 'fa-puzzle-piece', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1036', 'fa-microphone', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1037', 'fa-microphone-slash', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1038', 'fa-shield', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1039', 'fa-calendar-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1040', 'fa-fire-extinguisher', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1041', 'fa-rocket', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1042', 'fa-maxcdn', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1043', 'fa-chevron-circle-left', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1044', 'fa-chevron-circle-right', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1045', 'fa-chevron-circle-up', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1046', 'fa-chevron-circle-down', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1047', 'fa-html5', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1048', 'fa-css3', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1049', 'fa-anchor', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1050', 'fa-unlock-alt', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1051', 'fa-bullseye', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1052', 'fa-ellipsis-h', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1053', 'fa-ellipsis-v', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1054', 'fa-rss-square', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1055', 'fa-play-circle', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1056', 'fa-ticket', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1057', 'fa-minus-square', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1058', 'fa-minus-square-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1059', 'fa-level-up', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1060', 'fa-level-down', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1061', 'fa-check-square', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1062', 'fa-pencil-square', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1063', 'fa-external-link-square', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1064', 'fa-share-square', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1065', 'fa-compass', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1066', 'fa-caret-square-o-down', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1067', 'fa-caret-square-o-up', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1068', 'fa-caret-square-o-right', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1069', 'fa-eur', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1070', 'fa-gbp', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1071', 'fa-usd', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1072', 'fa-inr', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1073', 'fa-jpy', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1074', 'fa-rub', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1075', 'fa-krw', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1076', 'fa-btc', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1077', 'fa-file', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1078', 'fa-file-text', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1079', 'fa-sort-alpha-asc', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1080', 'fa-sort-alpha-desc', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1081', 'fa-sort-amount-asc', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1082', 'fa-sort-amount-desc', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1083', 'fa-sort-numeric-asc', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1084', 'fa-sort-numeric-desc', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1085', 'fa-thumbs-up', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1086', 'fa-thumbs-down', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1087', 'fa-youtube-square', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1088', 'fa-youtube', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1089', 'fa-xing', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1090', 'fa-xing-square', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1091', 'fa-youtube-play', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1092', 'fa-dropbox', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1093', 'fa-stack-overflow', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1094', 'fa-instagram', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1095', 'fa-flickr', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1096', 'fa-adn', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1097', 'fa-bitbucket', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1098', 'fa-bitbucket-square', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1099', 'fa-tumblr', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1100', 'fa-tumblr-square', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1101', 'fa-long-arrow-down', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1102', 'fa-long-arrow-up', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1103', 'fa-long-arrow-left', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1104', 'fa-long-arrow-right', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1105', 'fa-apple', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1106', 'fa-windows', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1107', 'fa-android', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1108', 'fa-linux', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1109', 'fa-dribbble', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1110', 'fa-skype', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1111', 'fa-foursquare', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1112', 'fa-trello', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1113', 'fa-female', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1114', 'fa-male', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1115', 'fa-gittip', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1116', 'fa-sun-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1117', 'fa-moon-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1118', 'fa-archive', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1119', 'fa-bug', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1120', 'fa-vk', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1121', 'fa-weibo', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1122', 'fa-renren', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1123', 'fa-pagelines', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1124', 'fa-stack-exchange', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1125', 'fa-arrow-circle-o-right', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1126', 'fa-arrow-circle-o-left', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1127', 'fa-caret-square-o-left', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1128', 'fa-dot-circle-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1129', 'fa-wheelchair', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1130', 'fa-vimeo-square', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1131', 'fa-try', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1132', 'fa-plus-square-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1133', 'fa-space-shuttle', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1134', 'fa-slack', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1135', 'fa-envelope-square', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1136', 'fa-wordpress', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1137', 'fa-openid', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1138', 'fa-university', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1139', 'fa-graduation-cap', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1140', 'fa-yahoo', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1141', 'fa-google', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1142', 'fa-reddit', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1143', 'fa-reddit-square', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1144', 'fa-stumbleupon-circle', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1145', 'fa-stumbleupon', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1146', 'fa-delicious', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1147', 'fa-digg', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1148', 'fa-pied-piper', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1149', 'fa-pied-piper-alt', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1150', 'fa-drupal', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1151', 'fa-joomla', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1152', 'fa-language', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1153', 'fa-fax', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1154', 'fa-building', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1155', 'fa-child', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1156', 'fa-paw', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1157', 'fa-spoon', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1158', 'fa-cube', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1159', 'fa-cubes', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1160', 'fa-behance', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1161', 'fa-behance-square', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1162', 'fa-steam', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1163', 'fa-steam-square', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1164', 'fa-recycle', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1165', 'fa-car', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1166', 'fa-taxi', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1167', 'fa-tree', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1168', 'fa-spotify', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1169', 'fa-deviantart', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1170', 'fa-soundcloud', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1171', 'fa-database', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1172', 'fa-file-pdf-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1173', 'fa-file-word-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1174', 'fa-file-excel-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1175', 'fa-file-powerpoint-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1176', 'fa-file-image-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1177', 'fa-file-archive-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1178', 'fa-file-audio-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1179', 'fa-file-video-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1180', 'fa-file-code-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1181', 'fa-vine', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1182', 'fa-codepen', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1183', 'fa-jsfiddle', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1184', 'fa-life-ring', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1185', 'fa-circle-o-notch', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1186', 'fa-rebel', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1187', 'fa-empire', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1188', 'fa-git-square', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1189', 'fa-git', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1190', 'fa-hacker-news', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1191', 'fa-tencent-weibo', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1192', 'fa-qq', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1193', 'fa-weixin', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1194', 'fa-paper-plane', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1195', 'fa-paper-plane-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1196', 'fa-history', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1197', 'fa-circle-thin', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1198', 'fa-header', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1199', 'fa-paragraph', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1200', 'fa-sliders', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1201', 'fa-share-alt', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1202', 'fa-share-alt-square', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1203', 'fa-bomb', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1204', 'fa-futbol-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1205', 'fa-tty', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1206', 'fa-binoculars', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1207', 'fa-plug', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1208', 'fa-slideshare', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1209', 'fa-twitch', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1210', 'fa-yelp', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1211', 'fa-newspaper-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1212', 'fa-wifi', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1213', 'fa-calculator', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1214', 'fa-paypal', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1215', 'fa-google-wallet', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1216', 'fa-cc-visa', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1217', 'fa-cc-mastercard', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1218', 'fa-cc-discover', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1219', 'fa-cc-amex', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1220', 'fa-cc-paypal', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1221', 'fa-cc-stripe', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1222', 'fa-bell-slash', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1223', 'fa-bell-slash-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1224', 'fa-trash', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1225', 'fa-copyright', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1226', 'fa-at', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1227', 'fa-eyedropper', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1228', 'fa-paint-brush', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1229', 'fa-birthday-cake', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1230', 'fa-area-chart', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1231', 'fa-pie-chart', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1232', 'fa-line-chart', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1233', 'fa-lastfm', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1234', 'fa-lastfm-square', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1235', 'fa-toggle-off', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1236', 'fa-toggle-on', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1237', 'fa-bicycle', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1238', 'fa-bus', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1239', 'fa-ioxhost', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1240', 'fa-angellist', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1241', 'fa-cc', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1242', 'fa-ils', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('1243', 'fa-meanpath', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('2904', '10.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2905', '11.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2906', '13.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2907', '14.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2908', '15.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2909', '17.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2910', '19.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2911', '2.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2912', '21.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2913', '22.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2914', '23.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2915', '24.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2916', '25.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2917', '26.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2918', '28.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2919', '3.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2920', '30.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2921', '32.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2922', '34.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2923', '35.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2924', '36.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2925', '37.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2926', '38.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2927', '39.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2928', '4.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2929', '40.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2930', '41.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2931', '42.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2932', '43.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2933', '44.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2934', '45.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2935', '46.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2936', '47.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2937', '48.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2938', '49.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2939', '5.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2940', '51.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2941', '52.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2942', '53.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2943', '54.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2944', '55.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2945', '56.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2946', '6.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2947', '7.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2948', '8.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('2949', '9.png', '2');
INSERT INTO "public"."aos_ge_icon" VALUES ('6938', 'add.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6939', 'add2.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6940', 'against.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6941', 'agree.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6942', 'app_columns.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6943', 'app_list.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6944', 'arraw_return.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6945', 'arrow_branch.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6946', 'arrow_divide.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6947', 'arrow_down.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6948', 'arrow_left.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6949', 'arrow_merge.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6950', 'arrow_redo.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6951', 'arrow_right.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6952', 'arrow_switch.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6953', 'arrow_undo.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6954', 'arrow_up.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6955', 'basket.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6956', 'book.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6957', 'book_user.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6958', 'bug.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6959', 'bullet_blue.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6960', 'chart_curve.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6961', 'chart_flipped.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6962', 'chart_line.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6963', 'chart_pie.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6964', 'close.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6965', 'config.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6966', 'config1.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6967', 'config3.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6968', 'connect.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6969', 'copy.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6970', 'cut.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6971', 'cv.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6972', 'c_key.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6973', 'database.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6974', 'database_add.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6975', 'del.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6976', 'del1.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6977', 'del2.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6978', 'del3.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6979', 'del_folder.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6980', 'del_page.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6981', 'detail.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6982', 'disconnect.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6983', 'doc_ok.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6984', 'edit.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6985', 'edit2.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6986', 'email.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6987', 'email2.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6988', 'email3.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6989', 'email_go.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6990', 'email_open.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6991', 'exit.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6992', 'exit2.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6993', 'folder1.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6994', 'folder10.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6995', 'folder11.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6996', 'folder12.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6997', 'folder13.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6998', 'folder14.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('6999', 'folder15.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7000', 'folder16.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7001', 'folder17.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7002', 'folder18.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7003', 'folder19.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7004', 'folder2.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7005', 'folder20.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7006', 'folder21.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7007', 'folder22.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7008', 'folder23.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7009', 'folder24.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7010', 'folder25.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7011', 'folder26.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7012', 'folder27.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7013', 'folder28.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7014', 'folder4.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7015', 'folder5.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7016', 'folder6.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7017', 'folder7.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7018', 'folder8.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7019', 'folder9.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7020', 'forward.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7021', 'freelance.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7022', 'go.gif', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7023', 'go.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7024', 'go1.gif', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7025', 'go1.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7026', 'help.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7027', 'home.gif', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7028', 'home.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7029', 'icon134.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7030', 'icon137.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7031', 'icon140.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7032', 'icon141.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7033', 'icon146.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7034', 'icon15.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7035', 'icon150.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7036', 'icon152.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7037', 'icon153.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7038', 'icon154.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7039', 'icon17.gif', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7040', 'icon25.gif', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7041', 'icon26.gif', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7042', 'icon28.gif', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7043', 'icon31.gif', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7044', 'icon32.gif', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7045', 'icon34.gif', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7046', 'icon35.gif', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7047', 'icon36.gif', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7048', 'icon37.gif', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7049', 'icon38.gif', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7050', 'icon39.gif', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7051', 'icon41.gif', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7052', 'icon42.gif', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7053', 'icon5.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7054', 'icon56.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7055', 'icon59.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7056', 'icon62.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7057', 'icon63.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7058', 'icon65.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7059', 'icon66.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7060', 'icon67.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7061', 'icon68.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7062', 'icon7.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7063', 'icon70.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7064', 'icon71.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7065', 'icon72.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7066', 'icon75.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7067', 'icon76.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7068', 'icon77.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7069', 'icon78.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7070', 'icon79.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7071', 'icon8.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7072', 'icon80.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7073', 'icon82.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7074', 'icon85.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7075', 'icon86.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7076', 'icon88.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7077', 'icon9.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7078', 'icon96.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7079', 'icon_19.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7080', 'icq.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7081', 'id.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7082', 'jar.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7083', 'key.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7084', 'layout.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7085', 'layout2.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7086', 'lightbulb.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7087', 'lock.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7088', 'lock3.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7089', 'monitor.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7090', 'node.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7091', 'ok.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7092', 'ok1.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7093', 'ok2.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7094', 'ok3.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7095', 'ok4.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7096', 'ok5.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7097', 'org.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7098', 'org2.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7099', 'own.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7100', 'pages.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7101', 'page_code.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7102', 'page_font.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7103', 'page_next.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7104', 'page_office.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7105', 'page_paint.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7106', 'page_picture.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7107', 'page_vector.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7108', 'paint2.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7109', 'paste.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7110', 'picture.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7111', 'pictures.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7112', 'picture_empty.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7113', 'plugin.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7114', 'plugin1.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7115', 'plugin2.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7116', 'printer.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7117', 'query.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7118', 'refresh.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7119', 'refresh1.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7120', 'save.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7121', 'save_all.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7122', 'search.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7123', 'security.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7124', 'send_receive.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7125', 'shape_align_bottom.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7126', 'shape_align_center.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7127', 'shape_align_middle.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7128', 'shape_group.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7129', 'shape_handles.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7130', 'shape_move_back.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7131', 'share.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7132', 'sitemap.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7133', 'sql.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7134', 'sql2.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7135', 'sql3.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7136', 'stop.gif', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7137', 'stop2.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7138', 'stop3.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7139', 'system.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7140', 'table.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7141', 'table2.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7142', 'tables.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7143', 'tables_relation.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7144', 'table_edit.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7145', 'tag.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7146', 'task.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7147', 'task1.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7148', 'task_finish.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7149', 'task_list.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7150', 'terminal.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7151', 'textfield.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7152', 'text_cap.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7153', 'text_col.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7154', 'text_list.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7155', 'text_upper.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7156', 'theme.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7157', 'time.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7158', 'timeline.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7159', 'user1.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7160', 'user20.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7161', 'user3.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7162', 'user6.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7163', 'user8.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7164', 'vcard.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7165', 'vector.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7166', 'wand.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7167', 'webcam.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7168', 'zoom_in.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('7169', 'zoom_out.png', '1');
INSERT INTO "public"."aos_ge_icon" VALUES ('765', 'fa-glass', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('766', 'fa-music', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('767', 'fa-search', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('768', 'fa-envelope-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('769', 'fa-heart', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('770', 'fa-star', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('771', 'fa-star-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('772', 'fa-user', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('773', 'fa-film', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('774', 'fa-th-large', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('775', 'fa-th', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('776', 'fa-th-list', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('777', 'fa-check', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('778', 'fa-times', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('779', 'fa-search-plus', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('780', 'fa-search-minus', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('781', 'fa-power-off', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('782', 'fa-signal', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('783', 'fa-cog', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('784', 'fa-trash-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('785', 'fa-home', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('786', 'fa-file-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('787', 'fa-clock-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('788', 'fa-road', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('789', 'fa-download', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('790', 'fa-arrow-circle-o-down', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('791', 'fa-arrow-circle-o-up', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('792', 'fa-inbox', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('793', 'fa-play-circle-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('794', 'fa-repeat', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('795', 'fa-refresh', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('796', 'fa-list-alt', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('797', 'fa-lock', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('798', 'fa-flag', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('799', 'fa-headphones', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('800', 'fa-volume-off', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('801', 'fa-volume-down', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('802', 'fa-volume-up', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('803', 'fa-qrcode', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('804', 'fa-barcode', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('805', 'fa-tag', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('806', 'fa-tags', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('807', 'fa-book', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('808', 'fa-bookmark', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('809', 'fa-print', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('810', 'fa-camera', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('811', 'fa-font', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('812', 'fa-bold', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('813', 'fa-italic', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('814', 'fa-text-height', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('815', 'fa-text-width', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('816', 'fa-align-left', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('817', 'fa-align-center', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('818', 'fa-align-right', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('819', 'fa-align-justify', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('820', 'fa-list', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('821', 'fa-outdent', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('822', 'fa-indent', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('823', 'fa-video-camera', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('824', 'fa-picture-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('825', 'fa-pencil', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('826', 'fa-map-marker', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('827', 'fa-adjust', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('828', 'fa-tint', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('829', 'fa-pencil-square-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('830', 'fa-share-square-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('831', 'fa-check-square-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('832', 'fa-arrows', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('833', 'fa-step-backward', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('834', 'fa-fast-backward', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('835', 'fa-backward', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('836', 'fa-play', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('837', 'fa-pause', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('838', 'fa-stop', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('839', 'fa-forward', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('840', 'fa-fast-forward', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('841', 'fa-step-forward', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('842', 'fa-eject', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('843', 'fa-chevron-left', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('844', 'fa-chevron-right', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('845', 'fa-plus-circle', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('846', 'fa-minus-circle', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('847', 'fa-times-circle', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('848', 'fa-check-circle', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('849', 'fa-question-circle', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('850', 'fa-info-circle', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('851', 'fa-crosshairs', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('852', 'fa-times-circle-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('853', 'fa-check-circle-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('854', 'fa-ban', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('855', 'fa-arrow-left', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('856', 'fa-arrow-right', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('857', 'fa-arrow-up', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('858', 'fa-arrow-down', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('859', 'fa-share', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('860', 'fa-expand', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('861', 'fa-compress', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('862', 'fa-plus', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('863', 'fa-minus', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('864', 'fa-asterisk', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('865', 'fa-exclamation-circle', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('866', 'fa-gift', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('867', 'fa-leaf', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('868', 'fa-fire', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('869', 'fa-eye', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('870', 'fa-eye-slash', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('871', 'fa-exclamation-triangle', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('872', 'fa-plane', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('873', 'fa-calendar', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('874', 'fa-random', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('875', 'fa-comment', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('876', 'fa-magnet', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('877', 'fa-chevron-up', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('878', 'fa-chevron-down', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('879', 'fa-retweet', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('880', 'fa-shopping-cart', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('881', 'fa-folder', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('882', 'fa-folder-open', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('883', 'fa-arrows-v', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('884', 'fa-arrows-h', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('885', 'fa-bar-chart', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('886', 'fa-twitter-square', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('887', 'fa-facebook-square', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('888', 'fa-camera-retro', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('889', 'fa-key', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('890', 'fa-cogs', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('891', 'fa-comments', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('892', 'fa-thumbs-o-up', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('893', 'fa-thumbs-o-down', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('894', 'fa-star-half', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('895', 'fa-heart-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('896', 'fa-sign-out', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('897', 'fa-linkedin-square', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('898', 'fa-thumb-tack', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('899', 'fa-external-link', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('900', 'fa-sign-in', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('901', 'fa-trophy', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('902', 'fa-github-square', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('903', 'fa-upload', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('904', 'fa-lemon-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('905', 'fa-phone', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('906', 'fa-square-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('907', 'fa-bookmark-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('908', 'fa-phone-square', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('909', 'fa-twitter', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('910', 'fa-facebook', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('911', 'fa-github', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('912', 'fa-unlock', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('913', 'fa-credit-card', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('914', 'fa-rss', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('915', 'fa-hdd-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('916', 'fa-bullhorn', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('917', 'fa-bell', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('918', 'fa-certificate', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('919', 'fa-hand-o-right', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('920', 'fa-hand-o-left', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('921', 'fa-hand-o-up', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('922', 'fa-hand-o-down', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('923', 'fa-arrow-circle-left', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('924', 'fa-arrow-circle-right', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('925', 'fa-arrow-circle-up', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('926', 'fa-arrow-circle-down', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('927', 'fa-globe', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('928', 'fa-wrench', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('929', 'fa-tasks', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('930', 'fa-filter', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('931', 'fa-briefcase', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('932', 'fa-arrows-alt', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('933', 'fa-users', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('934', 'fa-link', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('935', 'fa-cloud', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('936', 'fa-flask', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('937', 'fa-scissors', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('938', 'fa-files-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('939', 'fa-paperclip', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('940', 'fa-floppy-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('941', 'fa-square', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('942', 'fa-bars', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('943', 'fa-list-ul', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('944', 'fa-list-ol', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('945', 'fa-strikethrough', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('946', 'fa-underline', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('947', 'fa-table', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('948', 'fa-magic', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('949', 'fa-truck', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('950', 'fa-pinterest', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('951', 'fa-pinterest-square', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('952', 'fa-google-plus-square', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('953', 'fa-google-plus', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('954', 'fa-money', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('955', 'fa-caret-down', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('956', 'fa-caret-up', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('957', 'fa-caret-left', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('958', 'fa-caret-right', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('959', 'fa-columns', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('960', 'fa-sort', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('961', 'fa-sort-desc', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('962', 'fa-sort-asc', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('963', 'fa-envelope', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('964', 'fa-linkedin', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('965', 'fa-undo', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('966', 'fa-gavel', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('967', 'fa-tachometer', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('968', 'fa-comment-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('969', 'fa-comments-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('970', 'fa-bolt', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('971', 'fa-sitemap', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('972', 'fa-umbrella', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('973', 'fa-clipboard', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('974', 'fa-lightbulb-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('975', 'fa-exchange', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('976', 'fa-cloud-download', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('977', 'fa-cloud-upload', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('978', 'fa-user-md', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('979', 'fa-stethoscope', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('980', 'fa-suitcase', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('981', 'fa-bell-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('982', 'fa-coffee', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('983', 'fa-cutlery', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('984', 'fa-file-text-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('985', 'fa-building-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('986', 'fa-hospital-o', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('987', 'fa-ambulance', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('988', 'fa-medkit', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('989', 'fa-fighter-jet', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('990', 'fa-beer', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('991', 'fa-h-square', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('992', 'fa-plus-square', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('993', 'fa-angle-double-left', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('994', 'fa-angle-double-right', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('995', 'fa-angle-double-up', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('996', 'fa-angle-double-down', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('997', 'fa-angle-left', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('998', 'fa-angle-right', '3');
INSERT INTO "public"."aos_ge_icon" VALUES ('999', 'fa-angle-up', '3');

-- ----------------------------
-- Table structure for aos_ge_param
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_ge_param";
CREATE TABLE "public"."aos_ge_param" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"key_" varchar(255) COLLATE "default" NOT NULL,
"value_" varchar(255) COLLATE "default",
"catalog_id_" varchar(64) COLLATE "default" NOT NULL,
"remark_" varchar(4000) COLLATE "default",
"catalog_cascade_id_" varchar(255) COLLATE "default" NOT NULL,
"name_" varchar(255) COLLATE "default" NOT NULL,
"is_overwrite_" varchar(2) COLLATE "default" NOT NULL,
"overwrite_field_" varchar(20) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."aos_ge_param" IS '参数表';
COMMENT ON COLUMN "public"."aos_ge_param"."id_" IS 'ID';
COMMENT ON COLUMN "public"."aos_ge_param"."key_" IS '参数键';
COMMENT ON COLUMN "public"."aos_ge_param"."value_" IS '参数值';
COMMENT ON COLUMN "public"."aos_ge_param"."catalog_id_" IS '所属分类流水号';
COMMENT ON COLUMN "public"."aos_ge_param"."remark_" IS '备注';
COMMENT ON COLUMN "public"."aos_ge_param"."catalog_cascade_id_" IS '所属分类节点语义ID';
COMMENT ON COLUMN "public"."aos_ge_param"."name_" IS '参数名称';
COMMENT ON COLUMN "public"."aos_ge_param"."is_overwrite_" IS '是否可覆盖';
COMMENT ON COLUMN "public"."aos_ge_param"."overwrite_field_" IS '覆盖来源字段';

-- ----------------------------
-- Records of aos_ge_param
-- ----------------------------
INSERT INTO "public"."aos_ge_param" VALUES ('1668', 'nav_tab_index_', '1', '423', '左侧布局的导航卡片缺省激活的卡片索引号', '0.001.002.004', '导航缺省活动页', '1', 'nav_tab_index_');
INSERT INTO "public"."aos_ge_param" VALUES ('1669', 'nav_quick_layout_', '1', '423', '快捷菜单布局风格。1:平铺。2：树状。', '0.001.002.004', '快捷菜单布局风格', '1', 'nav_quick_layout_');
INSERT INTO "public"."aos_ge_param" VALUES ('302', 'theme_', 'classic', '413', '可选值：classic。缺省值：classic。', '0.001.002.002', '系统主题风格', '1', 'theme_');
INSERT INTO "public"."aos_ge_param" VALUES ('303', 'layout_', 'tab', '413', '系统业务经办区域(center)布局风格。可选值：tab|page。缺省值：tab。tab：支持同时打开多个功能模块界面；page：当前只能打开1个功能界面。', '0.001.002.002', 'Center区域布局风格', '1', 'layout_');
INSERT INTO "public"."aos_ge_param" VALUES ('35', 'skin_', 'blue', '413', '可选值：blue|gray|neptune|aos。缺省值：blue。', '0.001.002.002', '系统缺省皮肤', '1', 'skin_');
INSERT INTO "public"."aos_ge_param" VALUES ('359', 'copyright_', '2008-2015 OSWorks', '413', '版权信息', '0.001.002.002', '版权信息', '0', '');
INSERT INTO "public"."aos_ge_param" VALUES ('36', 'tab_focus_color_', '#0099FF', '413', '缺省的当前Tab卡片高亮提示颜色', '0.001.002.002', 'Tab高亮颜色', '1', 'tab_focus_color_');
INSERT INTO "public"."aos_ge_param" VALUES ('363', 'app_title_', 'AOS应用基础平台', '413', '首页浏览器标题内容', '0.001.002.002', '首页浏览器标题内容', '0', '');
INSERT INTO "public"."aos_ge_param" VALUES ('37', 'prevent_rightclick_', 'false', '414', '阻止浏览器缺省鼠标右键事件。可选值：true|false。缺省值：true。', '0.001.002.003', '全局右键', '0', '');
INSERT INTO "public"."aos_ge_param" VALUES ('382', 'nav_mode_', '1', '423', '可选值，1：水平导航按钮和垂直导航的卡片属于统一层级；2：水平导航按钮和垂直导航的卡片有上下级级联导航关系。(当前模式2未实现)', '0.001.002.004', '导航模式', '1', 'nav_mode_');
INSERT INTO "public"."aos_ge_param" VALUES ('389', 'is_show_top_nav_', 'true', '423', '是否显示水平导航条。(只有在导航模式为1的情况，此设置才有效,导航模式为2，则水平导航条不会消失)。可选值：true| false。', '0.001.002.004', '水平导航条', '1', 'is_show_top_nav_');
INSERT INTO "public"."aos_ge_param" VALUES ('390', 'navbar_btn_style_', 'tight', '423', '顶部水平导航条的按钮样式风格。tight：组合按钮；standalone：独立按钮。', '0.001.002.004', '导航条按钮风格', '1', 'navbar_btn_style_');
INSERT INTO "public"."aos_ge_param" VALUES ('408', 'login_page_', 'login-ext.jsp', '414', 'Ext原生风格的登录界面', '0.001.002.003', '登录页面', '0', '');
INSERT INTO "public"."aos_ge_param" VALUES ('409', 'vercode_show_', '1', '410', '是否在登录页面显示验证码及后台验证码验证。可选值：0(否) | 1(是)。', '0.001.002.001', '验证码开关', '0', '');
INSERT INTO "public"."aos_ge_param" VALUES ('411', 'vercode_length_', '4', '410', '验证码长度', '0.001.002.001', '验证码长度', '0', '');
INSERT INTO "public"."aos_ge_param" VALUES ('412', 'vercode_characters_', 'abcdetx2345678', '410', '验证码待选字符集。', '0.001.002.001', '验证码待选字符集', '0', '');
INSERT INTO "public"."aos_ge_param" VALUES ('415', 'login_back_img_', '-1', '413', '登录页面的背景图片。可选的预设背景图片为：0.jpg、1.jpg、2.jpg、3.jpg。如果需要随机出现背景，则将其设置为-1。', '0.001.002.002', '登录页面的背景图片', '0', '');
INSERT INTO "public"."aos_ge_param" VALUES ('416', 'page_load_gif_', 'wheel.gif', '413', '页面刷新动画文件。可选的预设动画文件：run.gif、wheel.gif。动画path：/static/image/gif/pageload。', '0.001.002.002', '页面刷新动画文件', '0', '');
INSERT INTO "public"."aos_ge_param" VALUES ('417', 'dev_account_', 'root', '414', '登录页面开发者按钮登录帐号。可以配置为任何一个存在的帐号。', '0.001.002.003', '开发者登录帐号', '0', '');
INSERT INTO "public"."aos_ge_param" VALUES ('418', 'dev_account_login_', '1', '414', '是否启用开发者登录帐号功能,如启用则在登录界面会出现[开发者]按钮。可选值：1 | 0。提示：系统若在生产模式下运行，则此配置忽略，自动关闭开发者登录功能。', '0.001.002.003', '开发者登录帐号开关', '0', '');
INSERT INTO "public"."aos_ge_param" VALUES ('419', 'welcome_page_title_', '欢迎', '413', '系统登录后第一个缺省打开的Tab页面的标题。缺省："欢迎"。', '0.001.002.002', '欢迎页标题', '0', '');
INSERT INTO "public"."aos_ge_param" VALUES ('420', 'is_show_mac_nav_', '1', '423', '欢迎页Mac导航显示开关。可选值：0 | 1。缺省值：1。', '0.001.002.004', 'Mac导航显示开关', '1', 'is_show_mac_nav_');
INSERT INTO "public"."aos_ge_param" VALUES ('585', 'show_login_win_head_', 'true', '413', '是否显示登录窗口标题栏(Ext登录风格)。缺省值：false。可选值：true|false。', '0.001.002.002', '是否显示登录窗口标题栏', '0', '');
INSERT INTO "public"."aos_ge_param" VALUES ('586', 'is_show_statusbar_', 'true', '413', '是否显示主界面状态栏。可选值：true|false。', '0.001.002.002', '是否显示主界面状态栏', '0', '');
INSERT INTO "public"."aos_ge_param" VALUES ('607', 'role_grant_mode_', '1', '414', '角色授权模式(角色可见度)。可选值：1|2。1：可见当前管理员创建的角色和当前管理员所属组织的其他管理员创建的角色。2：可见当前管理员创建的角色和当前管理员所属组织及其下级子孙组织的其他管理员创建的角色。', '0.001.002.003', '角色授权模式', '0', '');
INSERT INTO "public"."aos_ge_param" VALUES ('609', 'grid_column_algin_', 'left', '413', '表格列对齐模式。有效值：left|center|right。', '0.001.002.002', '表格列内容对齐方式', '0', '');
INSERT INTO "public"."aos_ge_param" VALUES ('623', 'byteobj_maxsize_', '1024', '414', '单位：KB', '0.001.002.003', '流文件最大值(KB)', '0', '');
INSERT INTO "public"."aos_ge_param" VALUES ('637', 'user_head_catalog_id_', '613', '414', '用户头像流文件分类ID，分类科目中的用户头像分类ID。用户上传文件时使用。', '0.001.002.003', '用户头像流文件分类ID', '0', '');
INSERT INTO "public"."aos_ge_param" VALUES ('74', 'app_name_', 'AOS应用基础平台', '413', '应用系统名称', '0.001.002.002', '应用系统名称', '0', '');

-- ----------------------------
-- Table structure for aos_ge_sequence
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_ge_sequence";
CREATE TABLE "public"."aos_ge_sequence" (
"id_" varchar(64) COLLATE "default" NOT NULL,
"name_" varchar(255) COLLATE "default" NOT NULL,
"type_" varchar(2) COLLATE "default" NOT NULL,
"prefix_" varchar(50) COLLATE "default",
"start_" varchar(19) COLLATE "default" DEFAULT 1,
"step_" varchar(4) COLLATE "default" DEFAULT 1,
"cur_value_" varchar(36) COLLATE "default" DEFAULT 0,
"status_" varchar(2) COLLATE "default" DEFAULT 1 NOT NULL,
"connector_" varchar(2) COLLATE "default",
"suffix_" varchar(50) COLLATE "default",
"db_seq_name_" varchar(255) COLLATE "default",
"max_value_" varchar(19) COLLATE "default" DEFAULT 9223372036854775807::bigint,
"remark_" varchar(4000) COLLATE "default",
"is_circul_" varchar(2) COLLATE "default" DEFAULT 0,
"min_value_" varchar(19) COLLATE "default" DEFAULT 1,
"is_leftpad_" varchar(2) COLLATE "default" DEFAULT 0,
"format_value_" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."aos_ge_sequence" IS 'ID配置表';
COMMENT ON COLUMN "public"."aos_ge_sequence"."id_" IS '流水号';
COMMENT ON COLUMN "public"."aos_ge_sequence"."name_" IS '名称';
COMMENT ON COLUMN "public"."aos_ge_sequence"."type_" IS '类型';
COMMENT ON COLUMN "public"."aos_ge_sequence"."prefix_" IS '前缀';
COMMENT ON COLUMN "public"."aos_ge_sequence"."start_" IS '起始值';
COMMENT ON COLUMN "public"."aos_ge_sequence"."step_" IS '递增步长';
COMMENT ON COLUMN "public"."aos_ge_sequence"."cur_value_" IS '当前值';
COMMENT ON COLUMN "public"."aos_ge_sequence"."status_" IS '当前状态';
COMMENT ON COLUMN "public"."aos_ge_sequence"."connector_" IS '连接符';
COMMENT ON COLUMN "public"."aos_ge_sequence"."suffix_" IS '后缀';
COMMENT ON COLUMN "public"."aos_ge_sequence"."db_seq_name_" IS 'DBSequence名称';
COMMENT ON COLUMN "public"."aos_ge_sequence"."max_value_" IS '最大值';
COMMENT ON COLUMN "public"."aos_ge_sequence"."remark_" IS '备注';
COMMENT ON COLUMN "public"."aos_ge_sequence"."is_circul_" IS '是否循环';
COMMENT ON COLUMN "public"."aos_ge_sequence"."min_value_" IS '最小值';
COMMENT ON COLUMN "public"."aos_ge_sequence"."is_leftpad_" IS '是否左补足';
COMMENT ON COLUMN "public"."aos_ge_sequence"."format_value_" IS '当前格式化值';

-- ----------------------------
-- Records of aos_ge_sequence
-- ----------------------------
INSERT INTO "public"."aos_ge_sequence" VALUES ('1', 'GID', '1', '', '1', '1', '1714', '1', '', '', null, '9999999999', '系统管理-实体表流水号。', '0', '1', '0', '1714');
INSERT INTO "public"."aos_ge_sequence" VALUES ('1635', 'ICONID', '1', '', '1', '1', '7169', '1', '', '', null, '9223372036854775807', '图标ID', '0', '1', '0', '7169');
INSERT INTO "public"."aos_ge_sequence" VALUES ('2', 'GUUID', '2', '', '1', '1', 'bd749e4c-0512-4b01-9ef7-7f42af3812a0', '1', '', '', null, '9223372036854775807', '通用UUID。', '0', '1', '0', 'bd749e4c-0512-4b01-9ef7-7f42af3812a0');
INSERT INTO "public"."aos_ge_sequence" VALUES ('3', 'TESTID', '1', '', '1', '1', '00000050', '1', '', '', null, '99999999', '测试用ID', '1', '1', '1', '00000050');
INSERT INTO "public"."aos_ge_sequence" VALUES ('313', 'USERID', '1', '', '1', '1', '20', '1', '', '', null, '9223372036854775807', '用户ID', '0', '1', '0', '20');
INSERT INTO "public"."aos_ge_sequence" VALUES ('337', 'RID', '1', '', '1', '1', '4210', '1', '', '', null, '9999999999', '系统管理-关联表流水号。', '0', '1', '0', '4210');
INSERT INTO "public"."aos_ge_sequence" VALUES ('546', 'BPMID', '1', '', '1', '1', '113', '1', '', '', null, '9999999999', '流程引擎相关辅助表的流水号', '0', '1', '0', '113');
INSERT INTO "public"."aos_ge_sequence" VALUES ('8', 'TESTID1', '1', 'TEST{yyyyMMdd}', '1', '1', '0059', '1', '-', '{HHmmss}', null, '9999', '测试ID，前缀后缀支持日期时间表达式。', '1', '1', '1', 'TEST20150121-0059-005407');

-- ----------------------------
-- Table structure for aos_sh_az01
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_sh_az01";
CREATE TABLE "public"."aos_sh_az01" (
"az01a0" varchar(36) COLLATE "default" NOT NULL,
"az01a1" varchar(6) COLLATE "default" NOT NULL,
"az01a2" varchar(50) COLLATE "default",
"az01a3" varchar(2) COLLATE "default",
"az01a4" date,
"az01a5" varchar(50) COLLATE "default",
"az01a6" varchar(18) COLLATE "default",
"az01a7" varchar(200) COLLATE "default",
"az01a8" varchar(50) COLLATE "default",
"az01a9" varchar(20) COLLATE "default",
"az01b1" date,
"az01b2" varchar(2) COLLATE "default",
"az01b3" numeric(10),
"az01b4" numeric(10),
"az01b5" varchar(200) COLLATE "default",
"az01b6" varchar(36) COLLATE "default",
"az01b7" timestamp(6),
"az01b8" varchar(50) COLLATE "default",
"az01b9" varchar(200) COLLATE "default",
"az01z9" int2 DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."aos_sh_az01" IS '银行信用卡账户信息表(测试表)';
COMMENT ON COLUMN "public"."aos_sh_az01"."az01a0" IS '流水号';
COMMENT ON COLUMN "public"."aos_sh_az01"."az01a1" IS '卡号';
COMMENT ON COLUMN "public"."aos_sh_az01"."az01a2" IS '姓名';
COMMENT ON COLUMN "public"."aos_sh_az01"."az01a3" IS '性别';
COMMENT ON COLUMN "public"."aos_sh_az01"."az01a4" IS '出生日期';
COMMENT ON COLUMN "public"."aos_sh_az01"."az01a5" IS '电子邮件';
COMMENT ON COLUMN "public"."aos_sh_az01"."az01a6" IS '身份证号';
COMMENT ON COLUMN "public"."aos_sh_az01"."az01a7" IS '籍贯';
COMMENT ON COLUMN "public"."aos_sh_az01"."az01a8" IS '固定联系电话';
COMMENT ON COLUMN "public"."aos_sh_az01"."az01a9" IS '手机';
COMMENT ON COLUMN "public"."aos_sh_az01"."az01b1" IS '帐单日';
COMMENT ON COLUMN "public"."aos_sh_az01"."az01b2" IS '卡状态';
COMMENT ON COLUMN "public"."aos_sh_az01"."az01b3" IS '卡余额';
COMMENT ON COLUMN "public"."aos_sh_az01"."az01b4" IS '可用透支余额';
COMMENT ON COLUMN "public"."aos_sh_az01"."az01b5" IS '所属银行名称';
COMMENT ON COLUMN "public"."aos_sh_az01"."az01b6" IS '所属银行流水号';
COMMENT ON COLUMN "public"."aos_sh_az01"."az01b7" IS '办卡时间';
COMMENT ON COLUMN "public"."aos_sh_az01"."az01b8" IS '经办人';
COMMENT ON COLUMN "public"."aos_sh_az01"."az01b9" IS '头像照片存储路径';
COMMENT ON COLUMN "public"."aos_sh_az01"."az01z9" IS '是否删除';

-- ----------------------------
-- Records of aos_sh_az01
-- ----------------------------

-- ----------------------------
-- Table structure for aos_sh_az02
-- ----------------------------
DROP TABLE IF EXISTS "public"."aos_sh_az02";
CREATE TABLE "public"."aos_sh_az02" (
"az02a0" varchar(36) COLLATE "default" NOT NULL,
"az02a1" varchar(6) COLLATE "default" NOT NULL,
"az02a2" varchar(100) COLLATE "default" NOT NULL,
"az02a3" varchar(36) COLLATE "default" NOT NULL,
"az02a4" varchar(200) COLLATE "default",
"az02a5" varchar(50) COLLATE "default",
"az02z9" int2 DEFAULT 0,
"az02a6" int2 DEFAULT 1
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."aos_sh_az02" IS '银行机构信息表(测试表)';
COMMENT ON COLUMN "public"."aos_sh_az02"."az02a0" IS '流水号';
COMMENT ON COLUMN "public"."aos_sh_az02"."az02a1" IS '银行机构编码';
COMMENT ON COLUMN "public"."aos_sh_az02"."az02a2" IS '银行机构名称';
COMMENT ON COLUMN "public"."aos_sh_az02"."az02a3" IS '上级银行流水号';
COMMENT ON COLUMN "public"."aos_sh_az02"."az02a4" IS '地址';
COMMENT ON COLUMN "public"."aos_sh_az02"."az02a5" IS '联系电话';
COMMENT ON COLUMN "public"."aos_sh_az02"."az02z9" IS '删除标志';
COMMENT ON COLUMN "public"."aos_sh_az02"."az02a6" IS '是否叶子节点';

-- ----------------------------
-- Records of aos_sh_az02
-- ----------------------------

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------
ALTER SEQUENCE "public"."aos_bp_act_evt_log_log_nr__seq" OWNED BY "aos_bp_act_evt_log"."log_nr_";

-- ----------------------------
-- Primary Key structure for table aos_au_module
-- ----------------------------
ALTER TABLE "public"."aos_au_module" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Indexes structure for table aos_au_module_post
-- ----------------------------
CREATE UNIQUE INDEX "aos_au_module_post_ukey" ON "public"."aos_au_module_post" USING btree (post_id_, module_id_, grant_type_);

-- ----------------------------
-- Primary Key structure for table aos_au_module_post
-- ----------------------------
ALTER TABLE "public"."aos_au_module_post" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Indexes structure for table aos_au_module_role
-- ----------------------------
CREATE UNIQUE INDEX "aos_au_module_role_ukey1" ON "public"."aos_au_module_role" USING btree (role_id_, module_id_, grant_type_);

-- ----------------------------
-- Primary Key structure for table aos_au_module_role
-- ----------------------------
ALTER TABLE "public"."aos_au_module_role" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Indexes structure for table aos_au_module_user
-- ----------------------------
CREATE UNIQUE INDEX "aos_au_module_user_ukey1" ON "public"."aos_au_module_user" USING btree (user_id_, module_id_, grant_type_);

-- ----------------------------
-- Primary Key structure for table aos_au_module_user
-- ----------------------------
ALTER TABLE "public"."aos_au_module_user" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Indexes structure for table aos_au_module_user_nav
-- ----------------------------
CREATE UNIQUE INDEX "aos_au_module_user_nav_ukey1" ON "public"."aos_au_module_user_nav" USING btree (module_id_, user_id_, type_);

-- ----------------------------
-- Primary Key structure for table aos_au_module_user_nav
-- ----------------------------
ALTER TABLE "public"."aos_au_module_user_nav" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Primary Key structure for table aos_au_org
-- ----------------------------
ALTER TABLE "public"."aos_au_org" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Primary Key structure for table aos_au_page
-- ----------------------------
ALTER TABLE "public"."aos_au_page" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Indexes structure for table aos_au_page_el
-- ----------------------------
CREATE UNIQUE INDEX "aos_au_page_el_ukey" ON "public"."aos_au_page_el" USING btree (dom_id_, module_id_, page_id_);

-- ----------------------------
-- Primary Key structure for table aos_au_page_el
-- ----------------------------
ALTER TABLE "public"."aos_au_page_el" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Primary Key structure for table aos_au_page_el_grant
-- ----------------------------
ALTER TABLE "public"."aos_au_page_el_grant" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Primary Key structure for table aos_au_post
-- ----------------------------
ALTER TABLE "public"."aos_au_post" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Primary Key structure for table aos_au_role
-- ----------------------------
ALTER TABLE "public"."aos_au_role" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Indexes structure for table aos_au_user
-- ----------------------------
CREATE UNIQUE INDEX " aos_au_user_ukey1" ON "public"."aos_au_user" USING btree (account_);

-- ----------------------------
-- Primary Key structure for table aos_au_user
-- ----------------------------
ALTER TABLE "public"."aos_au_user" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Primary Key structure for table aos_au_user_cfg
-- ----------------------------
ALTER TABLE "public"."aos_au_user_cfg" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Primary Key structure for table aos_au_user_ext
-- ----------------------------
ALTER TABLE "public"."aos_au_user_ext" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Indexes structure for table aos_au_user_post
-- ----------------------------
CREATE UNIQUE INDEX "aos_au_user_post_ukey1" ON "public"."aos_au_user_post" USING btree (user_id_, post_id_);

-- ----------------------------
-- Primary Key structure for table aos_au_user_post
-- ----------------------------
ALTER TABLE "public"."aos_au_user_post" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Indexes structure for table aos_au_user_role
-- ----------------------------
CREATE UNIQUE INDEX "aos_au_user_role_ukey1" ON "public"."aos_au_user_role" USING btree (user_id_, role_id_);

-- ----------------------------
-- Primary Key structure for table aos_au_user_role
-- ----------------------------
ALTER TABLE "public"."aos_au_user_role" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Primary Key structure for table aos_bp_act_evt_log
-- ----------------------------
ALTER TABLE "public"."aos_bp_act_evt_log" ADD PRIMARY KEY ("log_nr_");

-- ----------------------------
-- Indexes structure for table aos_bp_act_ge_bytearray
-- ----------------------------
CREATE INDEX "act_idx_bytear_depl" ON "public"."aos_bp_act_ge_bytearray" USING btree (deployment_id_);

-- ----------------------------
-- Primary Key structure for table aos_bp_act_ge_bytearray
-- ----------------------------
ALTER TABLE "public"."aos_bp_act_ge_bytearray" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Primary Key structure for table aos_bp_act_ge_property
-- ----------------------------
ALTER TABLE "public"."aos_bp_act_ge_property" ADD PRIMARY KEY ("name_");

-- ----------------------------
-- Indexes structure for table aos_bp_act_hi_actinst
-- ----------------------------
CREATE INDEX "act_idx_hi_act_inst_end" ON "public"."aos_bp_act_hi_actinst" USING btree (end_time_);
CREATE INDEX "act_idx_hi_act_inst_exec" ON "public"."aos_bp_act_hi_actinst" USING btree (execution_id_, act_id_);
CREATE INDEX "act_idx_hi_act_inst_procinst" ON "public"."aos_bp_act_hi_actinst" USING btree (proc_inst_id_, act_id_);
CREATE INDEX "act_idx_hi_act_inst_start" ON "public"."aos_bp_act_hi_actinst" USING btree (start_time_);

-- ----------------------------
-- Primary Key structure for table aos_bp_act_hi_actinst
-- ----------------------------
ALTER TABLE "public"."aos_bp_act_hi_actinst" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Primary Key structure for table aos_bp_act_hi_attachment
-- ----------------------------
ALTER TABLE "public"."aos_bp_act_hi_attachment" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Primary Key structure for table aos_bp_act_hi_comment
-- ----------------------------
ALTER TABLE "public"."aos_bp_act_hi_comment" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Indexes structure for table aos_bp_act_hi_detail
-- ----------------------------
CREATE INDEX "act_idx_hi_detail_act_inst" ON "public"."aos_bp_act_hi_detail" USING btree (act_inst_id_);
CREATE INDEX "act_idx_hi_detail_name" ON "public"."aos_bp_act_hi_detail" USING btree (name_);
CREATE INDEX "act_idx_hi_detail_proc_inst" ON "public"."aos_bp_act_hi_detail" USING btree (proc_inst_id_);
CREATE INDEX "act_idx_hi_detail_task_id" ON "public"."aos_bp_act_hi_detail" USING btree (task_id_);
CREATE INDEX "act_idx_hi_detail_time" ON "public"."aos_bp_act_hi_detail" USING btree (time_);

-- ----------------------------
-- Primary Key structure for table aos_bp_act_hi_detail
-- ----------------------------
ALTER TABLE "public"."aos_bp_act_hi_detail" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Indexes structure for table aos_bp_act_hi_identitylink
-- ----------------------------
CREATE INDEX "act_idx_hi_ident_lnk_procinst" ON "public"."aos_bp_act_hi_identitylink" USING btree (proc_inst_id_);
CREATE INDEX "act_idx_hi_ident_lnk_task" ON "public"."aos_bp_act_hi_identitylink" USING btree (task_id_);
CREATE INDEX "act_idx_hi_ident_lnk_user" ON "public"."aos_bp_act_hi_identitylink" USING btree (user_id_);

-- ----------------------------
-- Primary Key structure for table aos_bp_act_hi_identitylink
-- ----------------------------
ALTER TABLE "public"."aos_bp_act_hi_identitylink" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Indexes structure for table aos_bp_act_hi_procinst
-- ----------------------------
CREATE INDEX "act_idx_hi_pro_i_buskey" ON "public"."aos_bp_act_hi_procinst" USING btree (business_key_);
CREATE INDEX "act_idx_hi_pro_inst_end" ON "public"."aos_bp_act_hi_procinst" USING btree (end_time_);

-- ----------------------------
-- Uniques structure for table aos_bp_act_hi_procinst
-- ----------------------------
ALTER TABLE "public"."aos_bp_act_hi_procinst" ADD UNIQUE ("proc_inst_id_");

-- ----------------------------
-- Primary Key structure for table aos_bp_act_hi_procinst
-- ----------------------------
ALTER TABLE "public"."aos_bp_act_hi_procinst" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Primary Key structure for table aos_bp_act_hi_taskinst
-- ----------------------------
ALTER TABLE "public"."aos_bp_act_hi_taskinst" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Indexes structure for table aos_bp_act_hi_varinst
-- ----------------------------
CREATE INDEX "act_idx_hi_procvar_name_type" ON "public"."aos_bp_act_hi_varinst" USING btree (name_, var_type_);
CREATE INDEX "act_idx_hi_procvar_proc_inst" ON "public"."aos_bp_act_hi_varinst" USING btree (proc_inst_id_);
CREATE INDEX "act_idx_hi_procvar_task_id" ON "public"."aos_bp_act_hi_varinst" USING btree (task_id_);

-- ----------------------------
-- Primary Key structure for table aos_bp_act_hi_varinst
-- ----------------------------
ALTER TABLE "public"."aos_bp_act_hi_varinst" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Primary Key structure for table aos_bp_act_id_group
-- ----------------------------
ALTER TABLE "public"."aos_bp_act_id_group" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Primary Key structure for table aos_bp_act_id_info
-- ----------------------------
ALTER TABLE "public"."aos_bp_act_id_info" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Indexes structure for table aos_bp_act_id_membership
-- ----------------------------
CREATE INDEX "act_idx_memb_group" ON "public"."aos_bp_act_id_membership" USING btree (group_id_);
CREATE INDEX "act_idx_memb_user" ON "public"."aos_bp_act_id_membership" USING btree (user_id_);

-- ----------------------------
-- Primary Key structure for table aos_bp_act_id_membership
-- ----------------------------
ALTER TABLE "public"."aos_bp_act_id_membership" ADD PRIMARY KEY ("user_id_", "group_id_");

-- ----------------------------
-- Primary Key structure for table aos_bp_act_id_user
-- ----------------------------
ALTER TABLE "public"."aos_bp_act_id_user" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Primary Key structure for table aos_bp_act_re_deployment
-- ----------------------------
ALTER TABLE "public"."aos_bp_act_re_deployment" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Indexes structure for table aos_bp_act_re_model
-- ----------------------------
CREATE INDEX "act_idx_model_deployment" ON "public"."aos_bp_act_re_model" USING btree (deployment_id_);
CREATE INDEX "act_idx_model_source" ON "public"."aos_bp_act_re_model" USING btree (editor_source_value_id_);
CREATE INDEX "act_idx_model_source_extra" ON "public"."aos_bp_act_re_model" USING btree (editor_source_extra_value_id_);

-- ----------------------------
-- Primary Key structure for table aos_bp_act_re_model
-- ----------------------------
ALTER TABLE "public"."aos_bp_act_re_model" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Uniques structure for table aos_bp_act_re_procdef
-- ----------------------------
ALTER TABLE "public"."aos_bp_act_re_procdef" ADD UNIQUE ("key_", "version_", "tenant_id_");

-- ----------------------------
-- Primary Key structure for table aos_bp_act_re_procdef
-- ----------------------------
ALTER TABLE "public"."aos_bp_act_re_procdef" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Indexes structure for table aos_bp_act_ru_event_subscr
-- ----------------------------
CREATE INDEX "act_idx_event_subscr" ON "public"."aos_bp_act_ru_event_subscr" USING btree (execution_id_);
CREATE INDEX "act_idx_event_subscr_config_" ON "public"."aos_bp_act_ru_event_subscr" USING btree (configuration_);

-- ----------------------------
-- Primary Key structure for table aos_bp_act_ru_event_subscr
-- ----------------------------
ALTER TABLE "public"."aos_bp_act_ru_event_subscr" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Indexes structure for table aos_bp_act_ru_execution
-- ----------------------------
CREATE INDEX "act_idx_exe_parent" ON "public"."aos_bp_act_ru_execution" USING btree (parent_id_);
CREATE INDEX "act_idx_exe_procdef" ON "public"."aos_bp_act_ru_execution" USING btree (proc_def_id_);
CREATE INDEX "act_idx_exe_procinst" ON "public"."aos_bp_act_ru_execution" USING btree (proc_inst_id_);
CREATE INDEX "act_idx_exe_super" ON "public"."aos_bp_act_ru_execution" USING btree (super_exec_);
CREATE INDEX "act_idx_exec_buskey" ON "public"."aos_bp_act_ru_execution" USING btree (business_key_);

-- ----------------------------
-- Primary Key structure for table aos_bp_act_ru_execution
-- ----------------------------
ALTER TABLE "public"."aos_bp_act_ru_execution" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Indexes structure for table aos_bp_act_ru_identitylink
-- ----------------------------
CREATE INDEX "act_idx_athrz_procedef" ON "public"."aos_bp_act_ru_identitylink" USING btree (proc_def_id_);
CREATE INDEX "act_idx_ident_lnk_group" ON "public"."aos_bp_act_ru_identitylink" USING btree (group_id_);
CREATE INDEX "act_idx_ident_lnk_user" ON "public"."aos_bp_act_ru_identitylink" USING btree (user_id_);
CREATE INDEX "act_idx_idl_procinst" ON "public"."aos_bp_act_ru_identitylink" USING btree (proc_inst_id_);
CREATE INDEX "act_idx_tskass_task" ON "public"."aos_bp_act_ru_identitylink" USING btree (task_id_);

-- ----------------------------
-- Primary Key structure for table aos_bp_act_ru_identitylink
-- ----------------------------
ALTER TABLE "public"."aos_bp_act_ru_identitylink" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Indexes structure for table aos_bp_act_ru_job
-- ----------------------------
CREATE INDEX "act_idx_job_exception" ON "public"."aos_bp_act_ru_job" USING btree (exception_stack_id_);

-- ----------------------------
-- Primary Key structure for table aos_bp_act_ru_job
-- ----------------------------
ALTER TABLE "public"."aos_bp_act_ru_job" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Indexes structure for table aos_bp_act_ru_task
-- ----------------------------
CREATE INDEX "act_idx_task_create" ON "public"."aos_bp_act_ru_task" USING btree (create_time_);
CREATE INDEX "act_idx_task_exec" ON "public"."aos_bp_act_ru_task" USING btree (execution_id_);
CREATE INDEX "act_idx_task_procdef" ON "public"."aos_bp_act_ru_task" USING btree (proc_def_id_);
CREATE INDEX "act_idx_task_procinst" ON "public"."aos_bp_act_ru_task" USING btree (proc_inst_id_);

-- ----------------------------
-- Primary Key structure for table aos_bp_act_ru_task
-- ----------------------------
ALTER TABLE "public"."aos_bp_act_ru_task" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Indexes structure for table aos_bp_act_ru_variable
-- ----------------------------
CREATE INDEX "act_idx_var_bytearray" ON "public"."aos_bp_act_ru_variable" USING btree (bytearray_id_);
CREATE INDEX "act_idx_var_exe" ON "public"."aos_bp_act_ru_variable" USING btree (execution_id_);
CREATE INDEX "act_idx_var_procinst" ON "public"."aos_bp_act_ru_variable" USING btree (proc_inst_id_);
CREATE INDEX "act_idx_variable_task_id" ON "public"."aos_bp_act_ru_variable" USING btree (task_id_);

-- ----------------------------
-- Primary Key structure for table aos_bp_act_ru_variable
-- ----------------------------
ALTER TABLE "public"."aos_bp_act_ru_variable" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Indexes structure for table aos_bp_ext_model
-- ----------------------------
CREATE UNIQUE INDEX "aos_bp_ext_model_ukey1" ON "public"."aos_bp_ext_model" USING btree (model_id_);

-- ----------------------------
-- Primary Key structure for table aos_bp_ext_model
-- ----------------------------
ALTER TABLE "public"."aos_bp_ext_model" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Indexes structure for table aos_bp_ext_procdef
-- ----------------------------
CREATE UNIQUE INDEX "aos_bp_ext_procdef_ukey1" ON "public"."aos_bp_ext_procdef" USING btree (proc_def_id_);

-- ----------------------------
-- Primary Key structure for table aos_bp_ext_procdef
-- ----------------------------
ALTER TABLE "public"."aos_bp_ext_procdef" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Uniques structure for table aos_ge_bytearray
-- ----------------------------
ALTER TABLE "public"."aos_ge_bytearray" ADD UNIQUE ("key_");

-- ----------------------------
-- Primary Key structure for table aos_ge_bytearray
-- ----------------------------
ALTER TABLE "public"."aos_ge_bytearray" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Indexes structure for table aos_ge_catalog
-- ----------------------------
CREATE UNIQUE INDEX "aos_ge_catalog_ukey1_" ON "public"."aos_ge_catalog" USING btree (cascade_id_);

-- ----------------------------
-- Primary Key structure for table aos_ge_catalog
-- ----------------------------
ALTER TABLE "public"."aos_ge_catalog" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Primary Key structure for table aos_ge_dic
-- ----------------------------
ALTER TABLE "public"."aos_ge_dic" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Indexes structure for table aos_ge_dic_index
-- ----------------------------
CREATE UNIQUE INDEX "aos_ge_dic_index_ukey1" ON "public"."aos_ge_dic_index" USING btree (key_);

-- ----------------------------
-- Primary Key structure for table aos_ge_dic_index
-- ----------------------------
ALTER TABLE "public"."aos_ge_dic_index" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Indexes structure for table aos_ge_icon
-- ----------------------------
CREATE UNIQUE INDEX "aos_ge_icon_ukey1" ON "public"."aos_ge_icon" USING btree (name_, type_);

-- ----------------------------
-- Primary Key structure for table aos_ge_icon
-- ----------------------------
ALTER TABLE "public"."aos_ge_icon" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Indexes structure for table aos_ge_param
-- ----------------------------
CREATE UNIQUE INDEX "aos_ge_param_ukey" ON "public"."aos_ge_param" USING btree (key_);

-- ----------------------------
-- Primary Key structure for table aos_ge_param
-- ----------------------------
ALTER TABLE "public"."aos_ge_param" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Uniques structure for table aos_ge_sequence
-- ----------------------------
ALTER TABLE "public"."aos_ge_sequence" ADD UNIQUE ("name_");

-- ----------------------------
-- Primary Key structure for table aos_ge_sequence
-- ----------------------------
ALTER TABLE "public"."aos_ge_sequence" ADD PRIMARY KEY ("id_");

-- ----------------------------
-- Primary Key structure for table aos_sh_az01
-- ----------------------------
ALTER TABLE "public"."aos_sh_az01" ADD PRIMARY KEY ("az01a0");

-- ----------------------------
-- Primary Key structure for table aos_sh_az02
-- ----------------------------
ALTER TABLE "public"."aos_sh_az02" ADD PRIMARY KEY ("az02a0");

-- ----------------------------
-- Foreign Key structure for table "public"."aos_bp_act_ge_bytearray"
-- ----------------------------
ALTER TABLE "public"."aos_bp_act_ge_bytearray" ADD FOREIGN KEY ("deployment_id_") REFERENCES "public"."aos_bp_act_re_deployment" ("id_") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."aos_bp_act_id_membership"
-- ----------------------------
ALTER TABLE "public"."aos_bp_act_id_membership" ADD FOREIGN KEY ("group_id_") REFERENCES "public"."aos_bp_act_id_group" ("id_") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."aos_bp_act_id_membership" ADD FOREIGN KEY ("user_id_") REFERENCES "public"."aos_bp_act_id_user" ("id_") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."aos_bp_act_re_model"
-- ----------------------------
ALTER TABLE "public"."aos_bp_act_re_model" ADD FOREIGN KEY ("deployment_id_") REFERENCES "public"."aos_bp_act_re_deployment" ("id_") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."aos_bp_act_re_model" ADD FOREIGN KEY ("editor_source_value_id_") REFERENCES "public"."aos_bp_act_ge_bytearray" ("id_") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."aos_bp_act_re_model" ADD FOREIGN KEY ("editor_source_extra_value_id_") REFERENCES "public"."aos_bp_act_ge_bytearray" ("id_") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."aos_bp_act_ru_event_subscr"
-- ----------------------------
ALTER TABLE "public"."aos_bp_act_ru_event_subscr" ADD FOREIGN KEY ("execution_id_") REFERENCES "public"."aos_bp_act_ru_execution" ("id_") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."aos_bp_act_ru_execution"
-- ----------------------------
ALTER TABLE "public"."aos_bp_act_ru_execution" ADD FOREIGN KEY ("super_exec_") REFERENCES "public"."aos_bp_act_ru_execution" ("id_") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."aos_bp_act_ru_execution" ADD FOREIGN KEY ("parent_id_") REFERENCES "public"."aos_bp_act_ru_execution" ("id_") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."aos_bp_act_ru_execution" ADD FOREIGN KEY ("proc_inst_id_") REFERENCES "public"."aos_bp_act_ru_execution" ("id_") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."aos_bp_act_ru_execution" ADD FOREIGN KEY ("proc_def_id_") REFERENCES "public"."aos_bp_act_re_procdef" ("id_") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."aos_bp_act_ru_identitylink"
-- ----------------------------
ALTER TABLE "public"."aos_bp_act_ru_identitylink" ADD FOREIGN KEY ("task_id_") REFERENCES "public"."aos_bp_act_ru_task" ("id_") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."aos_bp_act_ru_identitylink" ADD FOREIGN KEY ("proc_def_id_") REFERENCES "public"."aos_bp_act_re_procdef" ("id_") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."aos_bp_act_ru_identitylink" ADD FOREIGN KEY ("proc_inst_id_") REFERENCES "public"."aos_bp_act_ru_execution" ("id_") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."aos_bp_act_ru_job"
-- ----------------------------
ALTER TABLE "public"."aos_bp_act_ru_job" ADD FOREIGN KEY ("exception_stack_id_") REFERENCES "public"."aos_bp_act_ge_bytearray" ("id_") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."aos_bp_act_ru_task"
-- ----------------------------
ALTER TABLE "public"."aos_bp_act_ru_task" ADD FOREIGN KEY ("proc_def_id_") REFERENCES "public"."aos_bp_act_re_procdef" ("id_") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."aos_bp_act_ru_task" ADD FOREIGN KEY ("execution_id_") REFERENCES "public"."aos_bp_act_ru_execution" ("id_") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."aos_bp_act_ru_task" ADD FOREIGN KEY ("proc_inst_id_") REFERENCES "public"."aos_bp_act_ru_execution" ("id_") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."aos_bp_act_ru_variable"
-- ----------------------------
ALTER TABLE "public"."aos_bp_act_ru_variable" ADD FOREIGN KEY ("proc_inst_id_") REFERENCES "public"."aos_bp_act_ru_execution" ("id_") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."aos_bp_act_ru_variable" ADD FOREIGN KEY ("execution_id_") REFERENCES "public"."aos_bp_act_ru_execution" ("id_") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."aos_bp_act_ru_variable" ADD FOREIGN KEY ("bytearray_id_") REFERENCES "public"."aos_bp_act_ge_bytearray" ("id_") ON DELETE NO ACTION ON UPDATE NO ACTION;
