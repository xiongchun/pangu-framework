/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : aos

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2015-06-27 22:21:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for aos_act_evt_log
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_evt_log`;
CREATE TABLE `aos_act_evt_log` (
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
-- Records of aos_act_evt_log
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_ext_model
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_ext_model`;
CREATE TABLE `aos_act_ext_model` (
  `id_` varchar(64) NOT NULL COMMENT '流水号',
  `model_id_` varchar(64) NOT NULL COMMENT '模型id',
  `create_type_` varchar(255) NOT NULL COMMENT '模型创建方式',
  `name_` varchar(255) NOT NULL COMMENT '流程名称',
  `create_user_id_` varchar(64) NOT NULL COMMENT '创建人流水号',
  `create_user_` varchar(255) NOT NULL COMMENT '创建人',
  `create_time_` varchar(255) NOT NULL COMMENT '创建时间',
  `remark_` varchar(4000) default NULL COMMENT '备注\n',
  PRIMARY KEY  (`id_`),
  UNIQUE KEY `aos_bp_ext_model_ukey` (`model_id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程模型扩展表';

-- ----------------------------
-- Records of aos_act_ext_model
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_ext_procdef
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_ext_procdef`;
CREATE TABLE `aos_act_ext_procdef` (
  `id_` varchar(64) NOT NULL COMMENT '流水号',
  `model_id_` varchar(64) NOT NULL COMMENT '模型id',
  `proc_def_id_` varchar(64) NOT NULL COMMENT '流程定义id',
  `deploy_user_id_` varchar(64) NOT NULL COMMENT ' 部署人流水号',
  `deploy_user_` varchar(255) NOT NULL COMMENT '部署人',
  `deploy_time_` varchar(255) NOT NULL COMMENT '部署时间',
  PRIMARY KEY  (`id_`),
  UNIQUE KEY `aos_bp_ext_procdef_ukey` (`proc_def_id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程定义扩展表';

-- ----------------------------
-- Records of aos_act_ext_procdef
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_ge_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_ge_bytearray`;
CREATE TABLE `aos_act_ge_bytearray` (
  `id_` varchar(64) collate utf8_bin NOT NULL default '',
  `rev_` int(11) default NULL,
  `name_` varchar(255) collate utf8_bin default NULL,
  `deployment_id_` varchar(64) collate utf8_bin default NULL,
  `bytes_` longblob,
  `generated_` tinyint(4) default NULL,
  PRIMARY KEY  (`id_`),
  KEY `aos_act_fk_bytearr_depl` (`deployment_id_`),
  CONSTRAINT `aos_act_fk_bytearr_depl` FOREIGN KEY (`deployment_id_`) REFERENCES `aos_act_re_deployment` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_ge_bytearray
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_ge_property
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_ge_property`;
CREATE TABLE `aos_act_ge_property` (
  `name_` varchar(64) collate utf8_bin NOT NULL default '',
  `value_` varchar(300) collate utf8_bin default NULL,
  `rev_` int(11) default NULL,
  PRIMARY KEY  (`name_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_ge_property
-- ----------------------------
INSERT INTO `aos_act_ge_property` VALUES ('next.dbid', '1', '1');
INSERT INTO `aos_act_ge_property` VALUES ('schema.history', 'create(5.17.0.2)', '1');
INSERT INTO `aos_act_ge_property` VALUES ('schema.version', '5.17.0.2', '1');

-- ----------------------------
-- Table structure for aos_act_hi_actinst
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_hi_actinst`;
CREATE TABLE `aos_act_hi_actinst` (
  `id_` varchar(64) collate utf8_bin NOT NULL,
  `proc_def_id_` varchar(64) collate utf8_bin NOT NULL,
  `proc_inst_id_` varchar(64) collate utf8_bin NOT NULL,
  `execution_id_` varchar(64) collate utf8_bin NOT NULL,
  `act_id_` varchar(255) collate utf8_bin NOT NULL,
  `task_id_` varchar(64) collate utf8_bin default NULL,
  `call_proc_inst_id_` varchar(64) collate utf8_bin default NULL,
  `act_name_` varchar(255) collate utf8_bin default NULL,
  `act_type_` varchar(255) collate utf8_bin NOT NULL,
  `assignee_` varchar(255) collate utf8_bin default NULL,
  `start_time_` datetime NOT NULL,
  `end_time_` datetime default NULL,
  `duration_` bigint(20) default NULL,
  `tenant_id_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`id_`),
  KEY `aos_act_idx_hi_act_inst_start` (`start_time_`),
  KEY `aos_act_idx_hi_act_inst_end` (`end_time_`),
  KEY `aos_act_idx_hi_act_inst_procinst` (`proc_inst_id_`,`act_id_`),
  KEY `aos_act_idx_hi_act_inst_exec` (`execution_id_`,`act_id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_hi_actinst
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_hi_attachment
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_hi_attachment`;
CREATE TABLE `aos_act_hi_attachment` (
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
-- Records of aos_act_hi_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_hi_comment
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_hi_comment`;
CREATE TABLE `aos_act_hi_comment` (
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
-- Records of aos_act_hi_comment
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_hi_detail
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_hi_detail`;
CREATE TABLE `aos_act_hi_detail` (
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
  KEY `aos_act_idx_hi_detail_proc_inst` (`proc_inst_id_`),
  KEY `aos_act_idx_hi_detail_act_inst` (`act_inst_id_`),
  KEY `aos_act_idx_hi_detail_time` (`time_`),
  KEY `aos_act_idx_hi_detail_name` (`name_`),
  KEY `aos_act_idx_hi_detail_task_id` (`task_id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_hi_detail
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_hi_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_hi_identitylink`;
CREATE TABLE `aos_act_hi_identitylink` (
  `id_` varchar(64) collate utf8_bin NOT NULL default '',
  `group_id_` varchar(255) collate utf8_bin default NULL,
  `type_` varchar(255) collate utf8_bin default NULL,
  `user_id_` varchar(255) collate utf8_bin default NULL,
  `task_id_` varchar(64) collate utf8_bin default NULL,
  `proc_inst_id_` varchar(64) collate utf8_bin default NULL,
  PRIMARY KEY  (`id_`),
  KEY `aos_act_idx_hi_ident_lnk_user` (`user_id_`),
  KEY `aos_act_idx_hi_ident_lnk_task` (`task_id_`),
  KEY `aos_act_idx_hi_ident_lnk_procinst` (`proc_inst_id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_hi_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_hi_procinst
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_hi_procinst`;
CREATE TABLE `aos_act_hi_procinst` (
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
  KEY `aos_act_idx_hi_pro_inst_end` (`end_time_`),
  KEY `aos_act_idx_hi_pro_i_buskey` (`business_key_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_hi_procinst
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_hi_taskinst
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_hi_taskinst`;
CREATE TABLE `aos_act_hi_taskinst` (
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
  PRIMARY KEY  (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_hi_taskinst
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_hi_varinst
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_hi_varinst`;
CREATE TABLE `aos_act_hi_varinst` (
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
  KEY `aos_act_idx_hi_procvar_proc_inst` (`proc_inst_id_`),
  KEY `aos_act_idx_hi_procvar_name_type` (`name_`,`var_type_`),
  KEY `aos_act_idx_hi_procvar_task_id` (`task_id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_hi_varinst
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_id_group
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_id_group`;
CREATE TABLE `aos_act_id_group` (
  `id_` varchar(64) collate utf8_bin NOT NULL default '',
  `rev_` int(11) default NULL,
  `name_` varchar(255) collate utf8_bin default NULL,
  `type_` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_id_group
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_id_info
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_id_info`;
CREATE TABLE `aos_act_id_info` (
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
-- Records of aos_act_id_info
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_id_membership
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_id_membership`;
CREATE TABLE `aos_act_id_membership` (
  `user_id_` varchar(64) collate utf8_bin NOT NULL default '',
  `group_id_` varchar(64) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`user_id_`,`group_id_`),
  KEY `aos_act_fk_memb_group` (`group_id_`),
  CONSTRAINT `aos_act_fk_memb_group` FOREIGN KEY (`group_id_`) REFERENCES `aos_act_id_group` (`id_`),
  CONSTRAINT `aos_act_fk_memb_user` FOREIGN KEY (`user_id_`) REFERENCES `aos_act_id_user` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_id_membership
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_id_user
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_id_user`;
CREATE TABLE `aos_act_id_user` (
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
-- Records of aos_act_id_user
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_re_deployment
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_re_deployment`;
CREATE TABLE `aos_act_re_deployment` (
  `id_` varchar(64) collate utf8_bin NOT NULL default '',
  `name_` varchar(255) collate utf8_bin default NULL,
  `category_` varchar(255) collate utf8_bin default NULL,
  `tenant_id_` varchar(255) collate utf8_bin default '',
  `deploy_time_` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_re_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_re_model
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_re_model`;
CREATE TABLE `aos_act_re_model` (
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
  KEY `aos_act_fk_model_source` (`editor_source_value_id_`),
  KEY `aos_act_fk_model_source_extra` (`editor_source_extra_value_id_`),
  KEY `aos_act_fk_model_deployment` (`deployment_id_`),
  CONSTRAINT `aos_act_fk_model_deployment` FOREIGN KEY (`deployment_id_`) REFERENCES `aos_act_re_deployment` (`id_`),
  CONSTRAINT `aos_act_fk_model_source` FOREIGN KEY (`editor_source_value_id_`) REFERENCES `aos_act_ge_bytearray` (`id_`),
  CONSTRAINT `aos_act_fk_model_source_extra` FOREIGN KEY (`editor_source_extra_value_id_`) REFERENCES `aos_act_ge_bytearray` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_re_model
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_re_procdef
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_re_procdef`;
CREATE TABLE `aos_act_re_procdef` (
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
  UNIQUE KEY `act_uniq_procdef` (`key_`,`version_`,`tenant_id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_re_procdef
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_ru_event_subscr
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_ru_event_subscr`;
CREATE TABLE `aos_act_ru_event_subscr` (
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
  KEY `aos_act_idx_event_subscr_config_` (`configuration_`),
  KEY `aos_act_fk_event_exec` (`execution_id_`),
  CONSTRAINT `aos_act_fk_event_exec` FOREIGN KEY (`execution_id_`) REFERENCES `aos_act_ru_execution` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_ru_event_subscr
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_ru_execution
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_ru_execution`;
CREATE TABLE `aos_act_ru_execution` (
  `id_` varchar(64) collate utf8_bin NOT NULL default '',
  `rev_` int(11) default NULL,
  `proc_inst_id_` varchar(64) collate utf8_bin default NULL,
  `business_key_` varchar(255) collate utf8_bin default NULL,
  `parent_id_` varchar(64) collate utf8_bin default NULL,
  `proc_def_id_` varchar(64) collate utf8_bin default NULL,
  `super_exec_` varchar(64) collate utf8_bin default NULL,
  `act_id_` varchar(255) collate utf8_bin default NULL,
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
  KEY `aos_act_idx_exec_buskey` (`business_key_`),
  KEY `aos_act_fk_exe_procinst` (`proc_inst_id_`),
  KEY `aos_act_fk_exe_parent` (`parent_id_`),
  KEY `aos_act_fk_exe_super` (`super_exec_`),
  KEY `aos_act_fk_exe_procdef` (`proc_def_id_`),
  CONSTRAINT `aos_act_fk_exe_parent` FOREIGN KEY (`parent_id_`) REFERENCES `aos_act_ru_execution` (`id_`),
  CONSTRAINT `aos_act_fk_exe_procdef` FOREIGN KEY (`proc_def_id_`) REFERENCES `aos_act_re_procdef` (`id_`),
  CONSTRAINT `aos_act_fk_exe_procinst` FOREIGN KEY (`proc_inst_id_`) REFERENCES `aos_act_ru_execution` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `aos_act_fk_exe_super` FOREIGN KEY (`super_exec_`) REFERENCES `aos_act_ru_execution` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_ru_execution
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_ru_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_ru_identitylink`;
CREATE TABLE `aos_act_ru_identitylink` (
  `id_` varchar(64) collate utf8_bin NOT NULL default '',
  `rev_` int(11) default NULL,
  `group_id_` varchar(255) collate utf8_bin default NULL,
  `type_` varchar(255) collate utf8_bin default NULL,
  `user_id_` varchar(255) collate utf8_bin default NULL,
  `task_id_` varchar(64) collate utf8_bin default NULL,
  `proc_inst_id_` varchar(64) collate utf8_bin default NULL,
  `proc_def_id_` varchar(64) collate utf8_bin default NULL,
  PRIMARY KEY  (`id_`),
  KEY `aos_act_idx_ident_lnk_user` (`user_id_`),
  KEY `aos_act_idx_ident_lnk_group` (`group_id_`),
  KEY `aos_act_idx_athrz_procedef` (`proc_def_id_`),
  KEY `aos_act_fk_tskass_task` (`task_id_`),
  KEY `aos_act_fk_idl_procinst` (`proc_inst_id_`),
  CONSTRAINT `aos_act_fk_athrz_procedef` FOREIGN KEY (`proc_def_id_`) REFERENCES `aos_act_re_procdef` (`id_`),
  CONSTRAINT `aos_act_fk_idl_procinst` FOREIGN KEY (`proc_inst_id_`) REFERENCES `aos_act_ru_execution` (`id_`),
  CONSTRAINT `aos_act_fk_tskass_task` FOREIGN KEY (`task_id_`) REFERENCES `aos_act_ru_task` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_ru_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_ru_job
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_ru_job`;
CREATE TABLE `aos_act_ru_job` (
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
  KEY `aos_act_fk_job_exception` (`exception_stack_id_`),
  CONSTRAINT `aos_act_fk_job_exception` FOREIGN KEY (`exception_stack_id_`) REFERENCES `aos_act_ge_bytearray` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_ru_job
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_ru_task
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_ru_task`;
CREATE TABLE `aos_act_ru_task` (
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
  KEY `aos_act_idx_task_create` (`create_time_`),
  KEY `aos_act_fk_task_exe` (`execution_id_`),
  KEY `aos_act_fk_task_procinst` (`proc_inst_id_`),
  KEY `aos_act_fk_task_procdef` (`proc_def_id_`),
  CONSTRAINT `aos_act_fk_task_exe` FOREIGN KEY (`execution_id_`) REFERENCES `aos_act_ru_execution` (`id_`),
  CONSTRAINT `aos_act_fk_task_procdef` FOREIGN KEY (`proc_def_id_`) REFERENCES `aos_act_re_procdef` (`id_`),
  CONSTRAINT `aos_act_fk_task_procinst` FOREIGN KEY (`proc_inst_id_`) REFERENCES `aos_act_ru_execution` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_ru_task
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_ru_variable
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_ru_variable`;
CREATE TABLE `aos_act_ru_variable` (
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
  KEY `aos_act_idx_variable_task_id` (`task_id_`),
  KEY `aos_act_fk_var_exe` (`execution_id_`),
  KEY `aos_act_fk_var_procinst` (`proc_inst_id_`),
  KEY `aos_act_fk_var_bytearray` (`bytearray_id_`),
  CONSTRAINT `aos_act_fk_var_bytearray` FOREIGN KEY (`bytearray_id_`) REFERENCES `aos_act_ge_bytearray` (`id_`),
  CONSTRAINT `aos_act_fk_var_exe` FOREIGN KEY (`execution_id_`) REFERENCES `aos_act_ru_execution` (`id_`),
  CONSTRAINT `aos_act_fk_var_procinst` FOREIGN KEY (`proc_inst_id_`) REFERENCES `aos_act_ru_execution` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_ru_variable
-- ----------------------------

-- ----------------------------
-- Table structure for aos_au_module
-- ----------------------------
DROP TABLE IF EXISTS `aos_au_module`;
CREATE TABLE `aos_au_module` (
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
-- Records of aos_au_module
-- ----------------------------
INSERT INTO `aos_au_module` VALUES ('0', '0', 'OSWorks-AOS应用基础平台', null, null, 'p', '0', '1', 'home.png', '1', 'root', null, '1');
INSERT INTO `aos_au_module` VALUES ('1680', '0.001.004.002', '流程建模', 'bpm/procModel/init.jhtml', null, '189', '1', '0', 'icon8.png', '1', '工作流', null, '10');
INSERT INTO `aos_au_module` VALUES ('1688', '0.001.004.003', '流程配置与管理', 'bpm/procDef/init.jhtml', null, '189', '1', '0', 'icon79.png', '1', '工作流', null, '20');
INSERT INTO `aos_au_module` VALUES ('1691', '0.001.004.006', '流程任务监管', 'bpm/procTask/init.jhtml', null, '189', '1', '0', 'task_list.png', '1', '工作流', null, '40');
INSERT INTO `aos_au_module` VALUES ('1710', '0.001.004.007', '流程历史数据查询', null, null, '189', '1', '0', 'icon71.png', '1', '工作流', null, '90');
INSERT INTO `aos_au_module` VALUES ('1711', '0.001.010', '数据集成', null, null, '183', '0', '0', 'folder10.png', '1', '控制台', null, '55');
INSERT INTO `aos_au_module` VALUES ('1712', '0.001.010.001', '数据管道', null, null, '1711', '1', '0', 'tables_relation.png', '1', '数据集成', null, '10');
INSERT INTO `aos_au_module` VALUES ('1713', '0.001.011', '复杂事件处理', null, null, '183', '0', '0', 'folder6.png', '1', '控制台', null, '58');
INSERT INTO `aos_au_module` VALUES ('1714', '0.001.011.001', '事件流定义', null, null, '1713', '1', '0', null, '1', '复杂事件处理', null, '10');
INSERT INTO `aos_au_module` VALUES ('183', '0.001', '控制台', null, null, '0', '0', '1', 'folder22.png', '1', 'OSWorks-AOS应用基础平台', 'fa-cogs', '10');
INSERT INTO `aos_au_module` VALUES ('184', '0.002', '工作台', null, null, '0', '0', '1', 'folder23.png', '1', 'OSWorks-AOS应用基础平台', 'fa-github-alt', '20');
INSERT INTO `aos_au_module` VALUES ('186', '0.001.001', '基础数据', null, null, '183', '0', '1', 'folder2.png', '1', '控制台', null, '10');
INSERT INTO `aos_au_module` VALUES ('187', '0.001.002', '资源', null, null, '183', '0', '1', 'folder14.png', '1', '控制台', null, '20');
INSERT INTO `aos_au_module` VALUES ('188', '0.001.003', '组织与权限', null, null, '183', '0', '1', 'folder5.png', '1', '控制台', null, '30');
INSERT INTO `aos_au_module` VALUES ('189', '0.001.004', '工作流', null, null, '183', '0', '1', 'folder24.png', '1', '控制台', null, '40');
INSERT INTO `aos_au_module` VALUES ('190', '0.001.005', '服务治理', null, null, '183', '0', '0', 'folder7.png', '1', '控制台', null, '50');
INSERT INTO `aos_au_module` VALUES ('191', '0.001.006', '监控与审计', null, null, '183', '0', '0', 'folder8.png', '1', '控制台', null, '60');
INSERT INTO `aos_au_module` VALUES ('192', '0.001.001.001', '参数表', 'system/param/init.jhtml', null, '186', '1', '0', 'icon79.png', '1', '基础数据', null, '1');
INSERT INTO `aos_au_module` VALUES ('193', '0.001.001.002', '数据字典', 'system/dictionary/init.jhtml', null, '186', '1', '0', 'icon154.png', '1', '基础数据', null, '10');
INSERT INTO `aos_au_module` VALUES ('194', '0.001.001.003', '分类科目', 'system/catalog/init.jhtml', null, '186', '1', '0', 'icon146.png', '1', '基础数据', null, '20');
INSERT INTO `aos_au_module` VALUES ('195', '0.001.002.004', '序列号', 'system/idMgr/init.jhtml', null, '187', '1', '0', 'id.png', '1', '资源', null, '30');
INSERT INTO `aos_au_module` VALUES ('197', '0.001.002.001', '功能模块', 'system/module/init.jhtml', null, '187', '1', '0', 'icon75.png', '1', '资源', null, '10');
INSERT INTO `aos_au_module` VALUES ('199', '0.001.003.001', '组织架构', 'system/org/init.jhtml', null, '188', '1', '0', 'icon56.png', '1', '组织与权限', null, '1');
INSERT INTO `aos_au_module` VALUES ('200', '0.001.003.002', '岗位与授权', 'system/post/init.jhtml', null, '188', '1', '0', 'icon137.png', '1', '组织与权限', null, '3');
INSERT INTO `aos_au_module` VALUES ('201', '0.001.003.003', '用户与授权', 'system/user/init.jhtml', null, '188', '1', '0', 'user6.png', '1', '组织与权限', null, '4');
INSERT INTO `aos_au_module` VALUES ('203', '0.001.005.001', '服务注册', null, null, '190', '1', '0', null, '1', '服务治理', null, '1');
INSERT INTO `aos_au_module` VALUES ('204', '0.001.006.001', '数据审计', null, null, '191', '1', '0', null, '1', '监控与审计', null, '1');
INSERT INTO `aos_au_module` VALUES ('205', '0.001.006.002', '业务经办日志', null, null, '191', '1', '0', null, '1', '监控与审计', null, '3');
INSERT INTO `aos_au_module` VALUES ('207', '0.002.001', '首选项', 'system/preference/init.jhtml', null, '184', '1', '0', 'config1.png', '1', '工作台', null, '10');
INSERT INTO `aos_au_module` VALUES ('212', '0.002.006', '我的流程', null, null, '184', '1', '1', 'icon8.png', '1', '工作台', null, '40');
INSERT INTO `aos_au_module` VALUES ('213', '0.002.007', '我的任务', 'bpm/mytask/init.jhtml', null, '184', '1', '1', 'task_list.png', '1', '工作台', null, '30');
INSERT INTO `aos_au_module` VALUES ('217', '0.001.008.006', 'DAO代码生成', null, null, '555', '1', '0', 'icon66.png', '1', '开发工具', null, '20');
INSERT INTO `aos_au_module` VALUES ('220', '0.001.008.003', '视图页面设计', null, null, '555', '1', '0', 'icon88.png', '1', '开发工具', null, '31');
INSERT INTO `aos_au_module` VALUES ('222', '0.001.008.004', '新增模块向导', null, null, '555', '1', '0', 'icon65.png', '1', '开发工具', null, '32');
INSERT INTO `aos_au_module` VALUES ('225', '0.001.008.002', 'WebSQL', null, null, '555', '1', '0', 'sql.png', '1', '开发工具', null, '11');
INSERT INTO `aos_au_module` VALUES ('227', '0.001.009.001', 'AOS开发指南', null, null, '576', '1', '0', 'lightbulb.png', '1', '帮助', null, '1');
INSERT INTO `aos_au_module` VALUES ('228', '0.001.009.002', 'AOS开发者社区', null, null, '576', '1', '0', 'icq.png', '1', '帮助', null, '2');
INSERT INTO `aos_au_module` VALUES ('236', '0.004', '演示', null, null, '0', '0', '1', 'folder27.png', '1', 'OSWorks-AOS应用基础平台', 'fa-coffee', '40');
INSERT INTO `aos_au_module` VALUES ('237', '0.004.001', '示例1', null, null, '236', '1', '0', null, '1', '演示', null, '1');
INSERT INTO `aos_au_module` VALUES ('242', '0.001.006.004', '系统管理日志', null, null, '191', '1', '0', null, '1', '监控与审计', null, '2');
INSERT INTO `aos_au_module` VALUES ('304', '0.001.003.006', '角色与授权', 'system/role/init.jhtml', null, '188', '1', '0', 'icon134.png', '1', '组织与权限', null, '5');
INSERT INTO `aos_au_module` VALUES ('393', '0.001.008.001', '图标大全', 'system/icon/init.jhtml', null, '555', '1', '0', 'page_picture.png', '1', '开发工具', null, '90');
INSERT INTO `aos_au_module` VALUES ('454', '0.001.002.003', '页面组件', 'system/page/init.jhtml', null, '187', '1', '0', 'icon59.png', '1', '资源', null, '20');
INSERT INTO `aos_au_module` VALUES ('486', '0.001.004.005', '流程实例监管', 'bpm/procInst/init.jhtml', null, '189', '1', '0', 'icon5.png', '1', '工作流', null, '30');
INSERT INTO `aos_au_module` VALUES ('489', '0.002.005', '我的消息', null, null, '184', '1', '0', 'email2.png', '1', '工作台', null, '20');
INSERT INTO `aos_au_module` VALUES ('530', '0.001.002.005', '数据源', null, null, '187', '1', '0', 'database_add.png', '1', '资源', null, '50');
INSERT INTO `aos_au_module` VALUES ('555', '0.001.008', '开发工具', null, null, '183', '0', '0', 'folder9.png', '1', '控制台', 'fa-bug', '70');
INSERT INTO `aos_au_module` VALUES ('576', '0.001.009', '帮助', null, null, '183', '0', '0', 'folder11.png', '1', '控制台', null, '80');
INSERT INTO `aos_au_module` VALUES ('615', '0.001.002.006', '流文件', 'system/byteObj/init.jhtml', null, '187', '1', '0', 'page_office.png', '1', '资源', null, '40');

-- ----------------------------
-- Table structure for aos_au_module_post
-- ----------------------------
DROP TABLE IF EXISTS `aos_au_module_post`;
CREATE TABLE `aos_au_module_post` (
  `id_` varchar(64) NOT NULL COMMENT '流水号',
  `post_id_` varchar(64) NOT NULL COMMENT '岗位流水号',
  `module_id_` varchar(64) NOT NULL COMMENT '功能模块流水号',
  `grant_type_` varchar(255) NOT NULL COMMENT '权限类型(岗位仅提供经办权限)',
  `operate_time_` varchar(255) NOT NULL COMMENT '授权时间',
  `operator_id_` varchar(64) NOT NULL COMMENT '授权人流水号',
  PRIMARY KEY  (`id_`),
  UNIQUE KEY `aos_au_module_post_ukey` (`post_id_`,`module_id_`,`grant_type_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能模块-岗位关联表';

-- ----------------------------
-- Records of aos_au_module_post
-- ----------------------------

-- ----------------------------
-- Table structure for aos_au_module_role
-- ----------------------------
DROP TABLE IF EXISTS `aos_au_module_role`;
CREATE TABLE `aos_au_module_role` (
  `id_` varchar(64) NOT NULL COMMENT '流水号',
  `role_id_` varchar(64) NOT NULL COMMENT ' 角色流水号',
  `module_id_` varchar(64) NOT NULL COMMENT '功能模块流水号',
  `grant_type_` varchar(255) NOT NULL COMMENT '权限类型',
  `operate_time_` varchar(255) NOT NULL COMMENT '授权时间',
  `operator_id_` varchar(64) NOT NULL COMMENT '授权人流水号',
  PRIMARY KEY  (`id_`),
  UNIQUE KEY `aos_au_module_role_ukey` (`role_id_`,`module_id_`,`grant_type_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能模块-角色关联表';

-- ----------------------------
-- Records of aos_au_module_role
-- ----------------------------

-- ----------------------------
-- Table structure for aos_au_module_user
-- ----------------------------
DROP TABLE IF EXISTS `aos_au_module_user`;
CREATE TABLE `aos_au_module_user` (
  `id_` varchar(64) NOT NULL COMMENT '流水号',
  `user_id_` varchar(64) NOT NULL COMMENT ' 用户流水号',
  `module_id_` varchar(64) NOT NULL COMMENT '功能模块流水号',
  `grant_type_` varchar(255) NOT NULL COMMENT '权限类型',
  `operate_time_` varchar(255) NOT NULL COMMENT '授权时间',
  `operator_id_` varchar(64) NOT NULL COMMENT '授权人',
  PRIMARY KEY  (`id_`),
  UNIQUE KEY `aos_au_module_user_ukey` (`user_id_`,`module_id_`,`grant_type_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能模块-用户关联表';

-- ----------------------------
-- Records of aos_au_module_user
-- ----------------------------

-- ----------------------------
-- Table structure for aos_au_module_user_nav
-- ----------------------------
DROP TABLE IF EXISTS `aos_au_module_user_nav`;
CREATE TABLE `aos_au_module_user_nav` (
  `id_` varchar(64) NOT NULL COMMENT '流水号',
  `module_id_` varchar(64) NOT NULL COMMENT '功能模块流水号',
  `user_id_` varchar(64) NOT NULL COMMENT '人员流水号',
  `nav_icon_` varchar(255) default NULL COMMENT '浮动导航图标文件',
  `type_` varchar(255) NOT NULL COMMENT '导航类型',
  `sort_no_` int(10) default NULL COMMENT '排序号',
  PRIMARY KEY  (`id_`),
  UNIQUE KEY `aos_au_module_user_nav_ukey` (`module_id_`,`user_id_`,`type_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能模块-用户关联表(浮动导航|快捷导航)';

-- ----------------------------
-- Records of aos_au_module_user_nav
-- ----------------------------
INSERT INTO `aos_au_module_user_nav` VALUES ('1', '192', '1', '25.png', '2', '0');
INSERT INTO `aos_au_module_user_nav` VALUES ('2', '193', '1', '11.png', '2', '0');
INSERT INTO `aos_au_module_user_nav` VALUES ('3', '200', '1', '30.png', '2', '0');
INSERT INTO `aos_au_module_user_nav` VALUES ('3401', '194', '1', '32.png', '2', '4');
INSERT INTO `aos_au_module_user_nav` VALUES ('3588', '0', '15', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('3589', '183', '15', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('3590', '186', '15', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('3591', '192', '15', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('3592', '193', '15', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('3593', '194', '15', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('3594', '187', '15', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('3595', '454', '15', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('3596', '195', '15', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('3597', '190', '15', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('3598', '203', '15', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('3599', '184', '15', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('3600', '207', '15', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('3601', '489', '15', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('3602', '213', '15', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('3603', '211', '15', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('3604', '495', '15', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('3605', '497', '15', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('3606', '192', '15', '28.png', '2', '1');
INSERT INTO `aos_au_module_user_nav` VALUES ('4', '201', '1', '41.png', '2', '0');
INSERT INTO `aos_au_module_user_nav` VALUES ('4177', '0', '1', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('4178', '183', '1', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('4179', '186', '1', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('4180', '192', '1', null, '1', '1');
INSERT INTO `aos_au_module_user_nav` VALUES ('4181', '193', '1', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('4182', '194', '1', null, '1', '3');
INSERT INTO `aos_au_module_user_nav` VALUES ('4183', '187', '1', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('4184', '197', '1', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('4185', '454', '1', null, '1', '4');
INSERT INTO `aos_au_module_user_nav` VALUES ('4186', '195', '1', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('4187', '615', '1', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('4188', '530', '1', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('4189', '188', '1', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('4190', '199', '1', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('4191', '200', '1', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('4192', '201', '1', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('4193', '304', '1', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('4194', '189', '1', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('4195', '533', '1', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('4196', '534', '1', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('4197', '202', '1', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('4198', '535', '1', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('4199', '486', '1', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('4200', '499', '1', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('4201', '500', '1', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('4202', '555', '1', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('4203', '393', '1', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('4204', '225', '1', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('4205', '217', '1', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('4206', '220', '1', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('4207', '222', '1', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('4208', '184', '1', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('4209', '207', '1', null, '1', '2');
INSERT INTO `aos_au_module_user_nav` VALUES ('4210', '489', '1', null, '1', null);
INSERT INTO `aos_au_module_user_nav` VALUES ('5', '304', '1', '28.png', '2', '0');
INSERT INTO `aos_au_module_user_nav` VALUES ('6', '199', '1', '7.png', '2', '0');
INSERT INTO `aos_au_module_user_nav` VALUES ('7', '197', '1', '51.png', '2', '0');
INSERT INTO `aos_au_module_user_nav` VALUES ('8', '217', '1', '56.png', '2', '0');
INSERT INTO `aos_au_module_user_nav` VALUES ('9', '222', '1', '22.png', '2', '0');

-- ----------------------------
-- Table structure for aos_au_org
-- ----------------------------
DROP TABLE IF EXISTS `aos_au_org`;
CREATE TABLE `aos_au_org` (
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
-- Records of aos_au_org
-- ----------------------------
INSERT INTO `aos_au_org` VALUES ('0', '0', 'OSWorks', null, 'p', 'root', '0', '1', 'home.png', '1', '1', null, null, '2012-01-01 12:12:12', '1', '0');
INSERT INTO `aos_au_org` VALUES ('284', '0.007', '项目部', null, '0', 'OSWorks', '1', '0', null, '1', '1', null, null, '2012-01-01 12:12:12', '1', '3');
INSERT INTO `aos_au_org` VALUES ('285', '0.003', '产品部', null, '0', 'OSWorks', '1', '0', null, '1', '1', null, null, '2012-01-01 12:12:12', '1', '2');
INSERT INTO `aos_au_org` VALUES ('286', '0.004', '软件过程支持部', null, '0', 'OSWorks', '1', '0', null, '1', '1', null, null, '2012-01-01 12:12:12', '1', '4');
INSERT INTO `aos_au_org` VALUES ('287', '0.005', '总务办', null, '0', 'OSWorks', '0', '1', null, '1', '1', null, null, '2012-01-01 12:12:12', '1', '5');
INSERT INTO `aos_au_org` VALUES ('288', '0.008', '市场部', null, '0', 'OSWorks', '1', '0', null, '1', '1', null, null, '2012-01-01 12:12:12', '1', '1');
INSERT INTO `aos_au_org` VALUES ('424', '0.005.001', '部门1', null, '287', '总务办', '0', '1', null, '1', '1', null, null, '2012-01-01 12:12:12', '1', '1');
INSERT INTO `aos_au_org` VALUES ('441', '0.005.001.001', '部门1-1', null, '424', '部门1', '1', '0', null, '1', '1', null, null, '2012-01-01 12:12:12', '4', '1');

-- ----------------------------
-- Table structure for aos_au_page
-- ----------------------------
DROP TABLE IF EXISTS `aos_au_page`;
CREATE TABLE `aos_au_page` (
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
-- Records of aos_au_page
-- ----------------------------
INSERT INTO `aos_au_page` VALUES ('1646', '207', '我的个人资料', 'initMyInfo.jhtml', '2', '1', '1', 'vcard.png', null, null, '1');
INSERT INTO `aos_au_page` VALUES ('1647', '207', '我的偏好设置', 'initMySettings.jhtml', '2', '1', '0', 'icon79.png', null, null, '2');
INSERT INTO `aos_au_page` VALUES ('1648', '207', '系统安全选项', 'initSecurityCfg.jhtml', '2', '1', '0', 'system.png', null, null, '3');
INSERT INTO `aos_au_page` VALUES ('1649', '207', '自定义菜单', 'initMyNav.jhtml', '2', '1', '0', 'icon_19.png', null, null, '4');
INSERT INTO `aos_au_page` VALUES ('1650', '207', '我的操作日志', null, '2', '1', '0', 'icon75.png', null, null, '6');
INSERT INTO `aos_au_page` VALUES ('1652', '207', '分割符', null, '4', '1', '0', null, null, null, '5');
INSERT INTO `aos_au_page` VALUES ('1677', '393', '小图标[16X16]', 'initIconList.jhtml?type_=1', '2', '1', '1', 'pictures.png', null, null, '1');
INSERT INTO `aos_au_page` VALUES ('1678', '393', '大图标[64X64]', 'initIconList.jhtml?type_=2', '2', '1', '0', 'picture.png', null, null, '2');
INSERT INTO `aos_au_page` VALUES ('1679', '393', '矢量图标', 'initIconList.jhtml?type_=3', '2', '1', '0', 'vector.png', null, null, '4');
INSERT INTO `aos_au_page` VALUES ('1701', '213', '待办任务', 'initDo.jhtml', '2', '1', '1', 'task_list.png', null, null, '10');
INSERT INTO `aos_au_page` VALUES ('1702', '213', '已办任务', 'initDone.jhtml', '2', '1', '0', 'task_finish.png', null, null, '20');
INSERT INTO `aos_au_page` VALUES ('1703', '393', '分隔符', null, '4', '1', '0', null, null, null, '3');

-- ----------------------------
-- Table structure for aos_au_page_el
-- ----------------------------
DROP TABLE IF EXISTS `aos_au_page_el`;
CREATE TABLE `aos_au_page_el` (
  `id_` varchar(64) NOT NULL COMMENT '流水号',
  `dom_id_` varchar(255) NOT NULL COMMENT 'DOM ID',
  `name_` varchar(255) NOT NULL COMMENT '名称',
  `type_` varchar(255) NOT NULL COMMENT '类型',
  `module_id_` varchar(64) NOT NULL COMMENT '所属功能模块流水号',
  `page_id_` varchar(64) NOT NULL COMMENT '页面ID',
  `remark_` varchar(4000) default NULL COMMENT '备注',
  PRIMARY KEY  (`id_`),
  UNIQUE KEY `aos_au_page_el_ukey` (`dom_id_`,`module_id_`,`page_id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='页面元素表';

-- ----------------------------
-- Records of aos_au_page_el
-- ----------------------------
INSERT INTO `aos_au_page_el` VALUES ('1666', '_btn_demo', '文本按钮', '1', '207', '207', '演示页面元素授权');
INSERT INTO `aos_au_page_el` VALUES ('1667', '_btn_save_demo', '个人信息保存按钮', '1', '207', '1646', '演示页面元素授权');
INSERT INTO `aos_au_page_el` VALUES ('477', '_btn_add_demo', '弹出新增参数窗口按钮', '1', '192', '192', null);

-- ----------------------------
-- Table structure for aos_au_page_el_grant
-- ----------------------------
DROP TABLE IF EXISTS `aos_au_page_el_grant`;
CREATE TABLE `aos_au_page_el_grant` (
  `id_` varchar(64) NOT NULL COMMENT '流水号',
  `el_id_` varchar(64) NOT NULL COMMENT '页面元素流水号',
  `user_id_` varchar(64) default NULL COMMENT '用户流水号',
  `role_id_` varchar(64) default NULL COMMENT '角色流水号',
  `post_id_` varchar(64) default NULL COMMENT '岗位流水号',
  `grant_type_` varchar(255) NOT NULL COMMENT '权限类型',
  PRIMARY KEY  (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='页面元素授权表';

-- ----------------------------
-- Records of aos_au_page_el_grant
-- ----------------------------

-- ----------------------------
-- Table structure for aos_au_post
-- ----------------------------
DROP TABLE IF EXISTS `aos_au_post`;
CREATE TABLE `aos_au_post` (
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
-- Records of aos_au_post
-- ----------------------------
INSERT INTO `aos_au_post` VALUES ('538', '岗位1', '1', '1', '288', '2014-12-10 02:25:17', '1', '0.008');
INSERT INTO `aos_au_post` VALUES ('539', '岗位2', '1', '1', '285', '2014-12-10 02:25:24', '1', '0.003');
INSERT INTO `aos_au_post` VALUES ('540', '岗位3', '1', '1', '284', '2014-12-10 02:26:56', '1', '0.007');

-- ----------------------------
-- Table structure for aos_au_role
-- ----------------------------
DROP TABLE IF EXISTS `aos_au_role`;
CREATE TABLE `aos_au_role` (
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
-- Records of aos_au_role
-- ----------------------------
INSERT INTO `aos_au_role` VALUES ('449', '测试角色1', '1', '1', '2014-11-18 12:56:15', '4', '287', '0.005');
INSERT INTO `aos_au_role` VALUES ('455', '测试角色', '1', '1', '2014-11-23 19:58:19', '4', '288', '0.008');
INSERT INTO `aos_au_role` VALUES ('541', '角色1', '1', '1', '2014-12-10 02:28:26', '1', '0', '0');
INSERT INTO `aos_au_role` VALUES ('605', '角色2', '1', '1', '2015-01-22 00:48:47', '1', '0', '0');

-- ----------------------------
-- Table structure for aos_au_user
-- ----------------------------
DROP TABLE IF EXISTS `aos_au_user`;
CREATE TABLE `aos_au_user` (
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
  PRIMARY KEY  (`id_`),
  UNIQUE KEY `aos_au_user_ukey` (`account_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户基本信息表';

-- ----------------------------
-- Records of aos_au_user
-- ----------------------------
INSERT INTO `aos_au_user` VALUES ('1', 'root', 'Q31Ox+QY0vs=', '超级用户', '1', '0', '1', '2', '', '2014-09-27 22:12:56', '1', '0');
INSERT INTO `aos_au_user` VALUES ('14', 'test1', 'ByOPAM8ATmY=', '测试1', '0', '284', '1', '1', '', '2014-12-10 02:18:53', '1', '0.007');
INSERT INTO `aos_au_user` VALUES ('15', 'xxd', 'Q31Ox+QY0vs=', '熊小朵', '0', '441', '1', '1', '', '2014-12-10 02:19:12', '1', '0.005.001.001');
INSERT INTO `aos_au_user` VALUES ('19', 'xxx', 'ByOPAM8ATmY=', '熊小雄', '1', '285', '1', '1', '', '2015-01-25 16:20:54', '1', '0.003');
INSERT INTO `aos_au_user` VALUES ('20', 'xcc', '5SIDJ03AkJI=', '熊楚楚', '0', '0', '1', '1', '', '2015-02-01 22:19:03', '1', '0');

-- ----------------------------
-- Table structure for aos_au_user_cfg
-- ----------------------------
DROP TABLE IF EXISTS `aos_au_user_cfg`;
CREATE TABLE `aos_au_user_cfg` (
  `id_` varchar(64) NOT NULL COMMENT '用户ID',
  `theme_` varchar(255) default NULL COMMENT '用户界面主题',
  `skin_` varchar(255) default NULL COMMENT '用户界面皮肤',
  `layout_` varchar(255) default NULL COMMENT '系统业务经办区域布局风格',
  `nav_mode_` varchar(255) default NULL COMMENT '导航模式',
  `is_show_top_nav_` varchar(255) default NULL COMMENT '是否显示水平导航条',
  `navbar_btn_style_` varchar(255) default NULL COMMENT '导航条按钮风格',
  `tab_focus_color_` varchar(255) default NULL COMMENT 'Tab高亮颜色',
  `is_show_mac_nav_` varchar(255) default NULL COMMENT '欢迎页Mac导航显示开关',
  `nav_tab_index_` varchar(255) default NULL COMMENT '导航缺省活动页',
  `nav_quick_layout_` varchar(255) default NULL COMMENT '快捷菜单布局风格',
  PRIMARY KEY  (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户配置表';

-- ----------------------------
-- Records of aos_au_user_cfg
-- ----------------------------
INSERT INTO `aos_au_user_cfg` VALUES ('1', 'classic', 'blue', 'tab', '1', 'true', 'tight', '#0099FF', '1', '0', '1');
INSERT INTO `aos_au_user_cfg` VALUES ('14', 'classic', 'blue', 'tab', '1', 'true', 'tight', '#0099FF', '1', '1', null);
INSERT INTO `aos_au_user_cfg` VALUES ('15', 'classic', 'blue', 'tab', '1', 'true', 'tight', '#0099FF', '1', '1', '1');
INSERT INTO `aos_au_user_cfg` VALUES ('19', 'classic', 'neptune', 'tab', '1', 'true', 'tight', '#0099FF', '1', '1', null);
INSERT INTO `aos_au_user_cfg` VALUES ('20', 'classic', 'neptune', 'tab', '1', 'true', 'tight', '#0099FF', '1', '1', '1');

-- ----------------------------
-- Table structure for aos_au_user_ext
-- ----------------------------
DROP TABLE IF EXISTS `aos_au_user_ext`;
CREATE TABLE `aos_au_user_ext` (
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
  `bytearray_id_` varchar(64) default NULL COMMENT '用户头像流文件ID',
  `remark_` varchar(4000) default NULL COMMENT '备注',
  `filed1_` varchar(255) default NULL COMMENT '静态扩展字段1',
  `filed2_` varchar(255) default NULL COMMENT '静态扩展字段2',
  `filed3_` varchar(255) default NULL COMMENT '静态扩展字段3',
  PRIMARY KEY  (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户扩展信息表';

-- ----------------------------
-- Records of aos_au_user_ext
-- ----------------------------
INSERT INTO `aos_au_user_ext` VALUES ('1', '307916217@qq.com', '', '18616786188', '', '', '', '', '307916217', '', '1717', '超级用户拥有系统最高权限。', '', '', null);
INSERT INTO `aos_au_user_ext` VALUES ('14', null, null, null, null, null, null, null, null, null, '680', null, null, null, null);
INSERT INTO `aos_au_user_ext` VALUES ('15', null, null, null, null, null, '2015-02-01', null, null, null, '646', null, null, null, null);
INSERT INTO `aos_au_user_ext` VALUES ('19', 'xxx@qq.com', '0871-3131921', '18616786188', '云南大理', '53021890', '2015-01-30', '532925108211170651', '307916217', null, '644', '备注内容', '100', '100', '100');
INSERT INTO `aos_au_user_ext` VALUES ('20', null, null, null, null, null, null, null, null, null, null, null, '100', '100', null);

-- ----------------------------
-- Table structure for aos_au_user_post
-- ----------------------------
DROP TABLE IF EXISTS `aos_au_user_post`;
CREATE TABLE `aos_au_user_post` (
  `id_` varchar(64) NOT NULL COMMENT '流水号',
  `user_id_` varchar(64) NOT NULL COMMENT '用户流水号',
  `post_id_` varchar(64) NOT NULL COMMENT '岗位流水号',
  `operate_time_` varchar(255) NOT NULL COMMENT '授权时间',
  `operator_id_` varchar(64) NOT NULL COMMENT '授权人流水号',
  PRIMARY KEY  (`id_`),
  UNIQUE KEY `aos_au_user_post_ukey` (`user_id_`,`post_id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-岗位关联表';

-- ----------------------------
-- Records of aos_au_user_post
-- ----------------------------

-- ----------------------------
-- Table structure for aos_au_user_role
-- ----------------------------
DROP TABLE IF EXISTS `aos_au_user_role`;
CREATE TABLE `aos_au_user_role` (
  `id_` varchar(64) NOT NULL COMMENT '流水号',
  `user_id_` varchar(64) NOT NULL COMMENT '用户流水号',
  `role_id_` varchar(64) NOT NULL COMMENT '角色流水号',
  `operate_time_` varchar(255) NOT NULL COMMENT '授权时间',
  `operator_id_` varchar(64) NOT NULL COMMENT '授权人流水号',
  PRIMARY KEY  (`id_`),
  UNIQUE KEY `aos_au_user_role_ukey` (`user_id_`,`role_id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-角色关联表';

-- ----------------------------
-- Records of aos_au_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for aos_ge_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `aos_ge_bytearray`;
CREATE TABLE `aos_ge_bytearray` (
  `id_` varchar(64) NOT NULL COMMENT '流水号',
  `key_` varchar(255) NOT NULL COMMENT '标识键',
  `name_` varchar(255) NOT NULL COMMENT '名称',
  `catalog_id_` varchar(64) NOT NULL COMMENT '分类ID',
  `catalog_cascade_id_` varchar(64) NOT NULL COMMENT '分类级联ID',
  `content_type_` varchar(255) NOT NULL COMMENT '内容类型',
  `size_` bigint(20) NOT NULL COMMENT '大小',
  `bytes_` blob NOT NULL COMMENT '流文件',
  `create_time_` varchar(255) NOT NULL COMMENT '创建时间',
  `creater_id_` varchar(64) NOT NULL COMMENT '操作人ID',
  `title_` varchar(255) default NULL COMMENT '标题',
  `remark_` varchar(4000) default NULL COMMENT '备注',
  PRIMARY KEY  (`id_`),
  UNIQUE KEY `aos_ge_bytearray_ukey` (`key_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流文件表';

-- ----------------------------
-- Records of aos_ge_bytearray
-- ----------------------------
INSERT INTO `aos_ge_bytearray` VALUES ('1717', '7dbed4a3-426f-41da-8fa4-5b7d0869b4c9', '180.jpg', '613', '0.004.001', 'image/jpeg', '11', 0xFFD8FFE000104A46494600010101004800480000FFDB0043000302020302020303030304030304050805050404050A070706080C0A0C0C0B0A0B0B0D0E12100D0E110E0B0B1016101113141515150C0F171816141812141514FFDB00430103040405040509050509140D0B0D1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414FFC000110800B400B403012200021101031101FFC4001D000001040301010000000000000000000006040507080003090201FFC40045100002010204030505050505070501000001020304110005122106314107132251611432718191082342A1F01552B1C1D1092433728216436292D2E1F12634A2B2E263FFC4001B01000203010101000000000000000000000203010405000607FFC400271100020201040103050101000000000000000102110304122131410522511314326171A181FFDA000C03010002110311003F00E64E49C2F98711CEEB47049A145D9D8D9547A9C4BFC1BD9B575165F4AE29A4973124068C10CA14DFF15F6F3C49DD97F668CD9452C312044912F7D3CC72DF6FD5F135F0D76690E5E15E18839629AC74D20DDB90FC8632F2EA3C04915C33FECB33EE2F78F2B4AB9258610664894928243B1DC9DF61B61961FB3C6782BD95C34CD1817516B036E56C5F1E1EECFE9E9905A962EF1B9944B10A7A72F2B7E78278383292120A50C61A43B10BBB1B58B1BAF41B629FDDB8F082A39E0BF673CE3332583CA1C2F8A27DB4D8F3BFCAC30B6A7EC999D55D7D3C4875C6C13BD9D1C1115EC4DC6D7E6797963A389C114AC52314FA199095223B80176DCE9F51F1C78CE387F2BE16C9EAB32CC42C1494F19691C836F81B0C47DECEE91DB51CEFCC3ECAF95E4D9AFB3D767F56F02A06775A7B03B6FF00F6188C78AF81F21A2CC0C1955654D4C511656675B2EA1E43136F6BBDAD0E2DCDAA21CAA31050248EB1C91BB03229EBCBE588C28321A8CC251DD44ED7B786C49BFD3A63734F8B235BB2314DF8447F2F05B38B455326DBAA9175BFD70E395F0A4D0B2C9254481ADE336E63CB9E2C3F0AFD9F730CE341991E3BA8360A4DEFD397CF13070F7D95A902C6D552EB07A95FCF97CB0E792103B6CA451E7E1B5696EB2BA8B922C3AF5EB85D4393665465218F37AB6A6D771117D86FD05ED8BFE3EC859057C3B128FB9B88ED6B7CBA601F8C3EC3B5B0217C9AAF5B31D94A9FA116DAFCEF8159B14BB21C64BC90170CF63947DAB522D047C50D97661A959A8EA94E89ADC8DC1E9FCF063957F67C66E93CB527886289D7C74ED1231D2F7D8EFBEDE86F7B60733DE08E22ECCB3E5A5CEA9A6CAAB236FEEF56848573E6ADA7ADB962EBFD987B43A9ED2F85E7A2CE60EEF37CB88066E9531FEF8DB98E4714F54B2628FD4C6FDA4465CD48AA743FD9E39854BC0333E20454576320A7573E12D7B286E5D7E24E0AE2FECF5C860472DC439A4D50D60B3BAC6A63D245880073005B17C464009F73F2C79FD84A495D363E446319EAF2BF23E9228756FF0067F65528130E26CD5EA8B333B48919D45AFA8DF4DF7BE08B2AFB1A64B90E62D365D5F2D3C52527B3CD1BC08ED2EA5D2E49B5B704F4DAF8B9CDC3C01F747D309A7E1C50412A2E3A91D300F5396B964D22A32FD92E822C9572E8F37AC8E1086274582155914C81C1242062432A9B927963C673F65FA7ABCAA3A18AA6A56246054C44295F33BDF7EA7D716E4F0F0FDCFCB09EAF2510A01DDDDDC8551EBF4E985FDC64F9268E7F67FF006255CDD5678EBEAA1A83285919E34D2CBBDD858FA60638B3EC11984140B3E4F9D35456E8767A69C00091BA856D86FBF3C745DF86D63A58D4436014784EE47E581FCCB2D30EAD2A411F43F961D1D6655D30691C79E29ECA78AB84F353435794D6779A04834C65B637E76B8BEC7198EB14B430CEFA9A923246DBA83B7D3198BABD41D731236908F00CCA728CBE1D7153CD723483BEDE5BFE8E27FC83292F471F7A630E6CAAA002493CBAF5EB802E1CE1EA6A38B2F464B431FBC8C0EFB5C6F6F9E263E16A476FBCA8D44BAFDDAEFB8EA4ED6DF19D964984878CAB2454B33200791208DFF3FA61F28B288E597BE0A0DAEA09FCFAE1753C66258915353C842D8DF6006EDCBA0DB0FB05304555516036B6FF004E5F3C516DD8CF034C3962DAD6DAD6E5FF007C55AFB71F1FE61C25C3945C39045A23CD2EEF32B59B48E9EF62E32C17DCFF003DFF002C73EBFB4252793B67C969FC4215CA919156E45F5589B5B63FD71A3E9F8FEA6A1290B9BA455BA0A1F687D86F7B74D8FD795B168BB05ECCE8ABF205AA96156A93200A588B85B6DD7CF9E219E11E1F2D222B2127A8F17D397CF16A7B0ACA733A6954188B521D3A76604DFE5D71EC33710E0AF0FC898F857B3B828E911B42DEDCC81FD79E09A3E1C8E2604AA037E42DFD704F92C913D3AC7623D4EADBD797CB0AC8A2139124F1A5AE082F6D36E9CBE78C169B2D6EF032D065115940036B73B7CBAFD70F2F9444D4E56D7B11D77E7F1C6E8336C9E29B47B6C44EC09B9209FA75C3BBC946D0C6C1CBC6CCA6EA2F7F5E58169AF02DF2421DB5765F9471BE4D51419A5324B04C0E990A8D51BEF66537BED8867EC8D914FC21DACE75C295E74D5D240ECABA6C25416D320F15B7077F5C5C4E20872DABA768E69D295CDC032B69FE5888E9F867D9FB7AE10CDD591A47A7AACBE76881FBC5318746BDB7BE9270C772C528FE8535CA64BFFB354EDB0B6D7C7C6CB51B622E7D37C3FAD0A29274927CD8938D9DCF4B5B1E7DD968196A054214D8336CB7EB8D3539389A364703C42DB7FE704D3D2ACC8C8CBA95858EE46123C669EC8F774B6D275F9E0591D83D165DAE342C0072006037DFAF5C686CAD2699E525592205576E47F17F4FAE1FD694D3F7FDDF8B5B6B50790247F5C7B96211C600516D26E00E66DFCF00CE020E5D6A180FBDF76B763CCED814CF28142B9B0279DAD892AAE151000ABA45B61E580BCFE302360C7CF7C4A39913D5C863A991026CA6DEE9C661C731A75354C74A9FA6330F48819B22C961962854856863B1B6DE2F4E7893B218400A4851D2C2DFD7019C3C4A52466EDB006F66FAFF002C4879640DDD2A2DC16D8FBDB0EBF4C74BB25308F2E89242B28EEDB6B23586C3EBF5C3D400051B2DBE584343084895141082C00DFE9F3C3AC6B703DEF8EFF5C2A893D20DC0B83F4C520FB7A70C2CBDACF08662C6211D5E592440301BB2383E7E471799109E96B7437DBFF18AF9F6A2E1BC8BB40CF786328AACD2A329CE6804D2C750291E6834B817590AFBA0EC6FE98D2F4F7B750990E0E4A9152B84B87963CD6037511B586936BDBEBCF175F80321A5A0CA2254119D8127C209E9B6FF004C558CCBB38E2DE05E27A0A0CC333A4AF86A104B4F554B13E924117B5F9EC462D2F0E655C481285A1CEA95A33180F1B52BA3A91D036E36F863D1EA1A69533B1439761654C71A53331984208FF114AEDF9E182AFB31AFCC08969A9E78697C4CD515550ABAFA8F0DFF008E0AE9321ABCBA4827AEAD9D5D1EFA2AD43C0F7F3655FE38DBC49C3F37129A89E7CDAA1E96642A20A672225045830B0BDF1571B69F0C564FD1109C920CAFDA9E5A9A713C4E07B29914B4A0EC5940363891786AA2B2B326A734843241BB444ADC2D89BF3E5803E15FB3F52E4D987B552E635CD52B51DF4A6443DD0402CCBE836BEDD4E268E1CA03515D58CB1B265C6F15298CB78A365B6F7DF99270ECD28F8760C1CBE080B8A0C7DA0544473097D9E8E43AA39653A56C0D81163BEE37C12F665C0A385BB4BCB5E3CCD732A35A59240D4CE248AE57E37047F3C28AAECFE8E0C8EBB85AAE29E7A48CC91C52A0324B1C65AEA77DAF7241F961E7B1EECE69381A76FD9F555F1D1CB6411D4DCB46D6B1B7973031399C56169312A5272E513345224A8195838BDAF8F44ADB61B7AE13E5F97C949513CAD532CE25B00925ACB6F2B01858D723993F5C7939468BB668D201B6C6FD2F84D50D1A80599554D87888B5F0A8C6BAF5DBC56B5FADB1A27895221B0F09F0A9E57C051163634BDDC9B5CC4AFA0FA13FAFCF1F2B9FBB89594DBC405ED7E7B636CD4C5689A326EE6F76E576E77C37E6158D1650D56AA4950ACC97E7B8BDBD70144D9AABD7C04DC136E9E7808CFCDF5A8E639FF4FD79E0DAB25EFA2D40103A861620FAE02F3FDE27DAFF001C4A44323AAE898D4B5AFF00AF9E331EEB1034E4907E1B6330D48810E4955466976ABA4DD090DDEC76E5CF9E243C82BA8650920ADA2B3001419E31B7D7141A8F86A49E81908909752B6D4FB0B7C7F47116C7944C934914724E595B48BCB27C3F7BAE37F1FA5FD66D6FFF000B1ABC7F6A949F3675F68A4A72808A9A5237E53C7FD70EB4E15CE9431C8DFF000C8847D71C818B26CC1C86EFAA82FF00C3512F4FF561D60A3CF69D888ABF318EC7DD5AA985B6E5EFFCF0D7E853F13FF0CCFBB81D7786825655D71863E4A41188C38923FF0066FB46CE3359A8E39231960544915486B9B5BF2C73962ABE2988A08B3CCEA30A2DB57CE2FE47DFEB8B17F656E37ACAA5CCF84F896BEAEA6AE73DFE5F535B3C8C5C5FC518626FA81B5B070F4BC9A6B9B768B5A7D4E394B6B61BCD479AF1164397D667794459755C356D2C76500156FDD079022D891721AFF664A7B2AA9000B1D3FADBAE1671A709D665148B5AF5B34D4B2953ECF50CECF13DB701AFB8DB03B95CCC5D546BD88F78B6F7F9F5C4C9DAE0BEA9DD135E4B9CA4D44227546523DD60BF4F9E1C29E9E9E896F0C514409274A850093CCE03F212CD1AB0D5603CDBFAE0C32E91DE20190DF958927F9FCF15DAA2ACE34C60E201986754D253467D868C9D2EF6504AFEB9E1FB2096114FDCC081218620897B7216DBE3D708789A9EAABE9CC54CC51D2CE9AD982B3037009BF236C005771B71B5255C529C929465E80ABBC13B1706FB103AE0D437AA47526837AFC9C3712354C12FB34E2E7580A4329E60E35665433D14B04AF2C32461D19BBB50A49045BE9B5F08B83B3ECD78A1AAEB332A66CB4C727751D33AB2B3D86EDCF97961EAB7EF5E0462C55A54BDF57EF0F5EB819A695315C5860DB03716F4C6A6009E646F8DF26C4937B9C7864048C60B5C85C886B2092686548E56819D4A89500D486DB1008236C6A962121417D623F3239E17497504907095D3B9427AF336EA7007088C12246C0C8D231624122D61D06D860CFB2319A514CB35DFBA6EF61524801C0D8EDE47055A073BEF86FAE3DD4D1487DC274B8E9BF23FAF3C01C3556421A3D6F7D56E57C05E764D9BD05B0719808E35690B2DC2D8B13B587FE700B9DCF13D3B4824568D86A0C0EC41E58EA388FEAE5BCD77474623DD36B8FCF198F798291527E1EB8CC3482ACE55591469A0DBC434AA803CBE1F3C42B9AE711E5998D4A9DDBBC72365EA7E1D707B92E613EB84CEEA583FE0040D3AB6E6DCF96234E27532E7557BFF00BD61B5F6FF00E58F77A4752691ABEAD04F1459E871C4D1C80259403EF691D3AF2E987383B489948161FE5D23E97D3F3C0BAD2DD54826F71D4DCF97E2E58F4F4C483EF01CEE2FB8FF009BCF1AEA52A3C92845F8240CB7B56A50E3DA210795D8AADBF875C499C15C5990F11CD12C73470D62B6B8D8000AB0DAE0E9E9CB15ADA36B12DA95AFEB6FFEDD3A636515754D04AB2C5332329D8EFF00F572C16EF9065814B98F65F219D66198C5047599BD555454C75C51CB28207A72DEDCF05FC3D9DC550D030914A358DD74EFF975C55DECDFB5E15194BA57D42A3D3ADE495891E1F33E2C4DB95D4CF165D47570F8A9E589658D90923491D3C5F4C65EB71C69345CD04B2A728E476598C86556A746561CAF7B0B7C797CB0554932851B6F6E561FD310A7675C731CDA60924F18D8296FFF005CB128D267093A1D24836DCEFF00D7188E3E19AB25637717F1BE57C3F5025CE3304CBE810DDDCDBC7B721B75C47ABF682C8EB6A1A5C9E8E3AACBE91D754959284EF49E4C05B71F0C4819C64D96E681A4ADA586B2453A91A54D5A08EA3C5F4C0E4DDA03F0538861C8E9EB1AE16330C2ABA6FCAF727FF387C146AAAD9118F023C93B69ACE2FCEA457C8EAD29CB684A84A5D08B6F22C05C0F3183A1C451366B945302659259834823009083726D6EB6181C838CF33CC668679A06A9CE6AED4F4343AAC013CD8EF602DCFD307FD9E700CDC29493D5E693C55F9FD6316A8A88810B1AF48D2E7DD18565DA97542E6E9F01AD3CC2A812A0807717E7FC31F265EE1B493B73070AA913BB8B963ECF1865DEE46329C222EC6F3E3702FB73B79E34C8093CBF86366878CE963BFEBD71AE4371E56C509476B093B3C3591773A76F3C36E612FDC121431D4059BE3870A8D722811E926E2F7F2EBFCF0DD571F802B1D5E2079FAE10C91BF31FBC43E1046FCF0099D2B0570E140BD828C1A5655A24CD16B024BDB4DF7E5D3F5D301B9EC8A599350D6770A7991F5C71000661295A96B2123D05F198D95A3FBC35F738CC368E28F65B315747BADD6C41DBCFFCBF2C07E7B79F3AAAD48A09909E9B7FF1E987ECBF3254923048DDB617B0BFD79603B8933568B39AB0ADBEB36DF7B7FCDF5C7BCD27190D6F5477810A9697BD8ADA549046D6FF00F3D71E6A21B00C34DAF7BF2F9FBBF2C37D26652D4D4C31A2BDA460A5DBDD5079927561DE6A7A130D40FDB45AB10E98E04A62C921EA75EB002F963693478F69A1AEA42A21D6A145F6B91CF9DBDDE986A2B2545C2D39941DB61E7D2FA7AF3C483C2DC35495D431D45151D666998EB024AEAF1DD50D2F2F0EEFE33CEE77F8611E69952B55D4F7358B5315100D573411E88D5B96953AFE988A563233484F9FF0D4B90F02E488CAA6BB3FA90CA8A6FA90369FDD1F0C5FDE1CE1E58F84B2BA168D41A5A58E22763BAA8FF87A629C676D4B0D1766B9B4E9DEC14133098DFDD612EE0F8B95883F2F5C740720A38DE10F1309619007463C994EE0F3F5DF18DAE6EA3FF4BFA66B6B216CE69E7E1BAD69E05D201DD6F61F0F77AF3C1970876AF4F50562A8748E41CD988DFD7DDF960AB8A78421CC61616B820F2E63CFF1621DE21EC96AA59DE4A2AD5490724716DFE3AB9629C5466A9961C9A2CAE539950E614E1D678CED7B5C6F6FF4F4C7B95F25A5732CC94F2126C558063EA3DDF9E2AD5064BC7990C5DDD255C722A6ECAD26E074E6DF5C36D7717F13D5D7C343DF87A895F4B9BFB8A3DE37D5CC5BE9835839E182E689EF2AED1B258BB78AF4740B439764AA6078EC6CEEF691B973F75706D55F697E0CC9737A1CBAB6A9A866AB7D31BD40D086DCFC56B6DB7C6F8E7470176D55BC33DA6C3C459A4BFB4B2A791A92B210BB1849B123C5BD8693F1C592ED8B8426CE78363CEB86BD9788F862789648C6AD52C00D8837D5B7AF5DB07934B0524A4FB42633DFD178B2ECC52B69E3963DD1C061EA3A74C2D6F13003A6E71537EC7FDB9371370B47C319AD5B3E7395EA01677BCAD00365BDCF31FC316A296B5255075004FEBCF18B9B13C527161A767CAB849F1FE21FAF2C37BB6D6DC798FD0C3C38D68791F2386AAFA70C09B6C76363BFF1C50C91DCAD0484B6762583586DBDAF7C36E61A59806F16A905B4FF003C2D521DD15880A0FC01C24AD31D34CA1400ACD6B0E98CE610C99B2033A92078AEA4F5F31FAF5C07F1046A1C4E55B525C596E6E0FA75C19E75731EA5B120DF0219D38D05AFD2D6BF3C422488B8878A5693359A1104F205B0D51C5A872FF30C661EB31A347AA626189C9DEEC809C662C222CE7652554CE15A2049BD94104EA3FBA36E7838C9BB248AA0CB9867956296275124894C0075B8E6D24802A83E80E03B82668E8AAAA732AAAFA5A66A28D921A69D4397722E0817E786FA4A7ACE2B351984F2878AEC65AAAB70B1836BE9173F4031F47C18945594F59A9C99E5B13A419E630766B4354894F9867D9915369168EC63040FDF645BDBD061AF369387B348FD9B2D9B35A10843451D7104330DF482B7D3CBF3C30D1650B55077D2661965153A00C65A89D7979845259BE4306996F0D70CC9C1D559DA2D767D352A97D324CB491300C14F805DF6BDF76B90317BF56672E3915E699DCFC599453455D5D0F09F0E520117702332CD3BDB7091A8DC1F33B75E6709B29A7CBA8B83F8B29B2DCCA7AC898C554249E9CC4FE13BF86C790B8C47A8235CC97DA248E9D257D2AEA415173C892771E5896728CA725A1C9B38A3CBB388B36AD972D925A83130D02CB716009000B6FB937C4D24A8992AE4439649FB7BB3CCDF2B91D8CD97CA2B1145EFDD6CAC0787CC86C5C2FB2BF68CBC5BD9F5365557309337CAE258B5D89F68880B2B72E761638A5DD996631D2F19522CACA29EB50D1488FA6E55C0B03BF306C70E9C2FDA24FD8EF160956A5504151DCCA8B6BB0BD988B35ADE5D31535583EAC5C576B92D69F26C95783A3525492366BF98DEDF1E5D30D399D2A4C85BBA3AED6BA83B7A5F4FCF0C9C299B0E34C8E1CD32E6EF92450CE15948536E7B1E585D2CD511C64042081CCDB61F5E78C05169D1ABD8219EA55C9DEA6BB2DAD76BDEDF4EB804F6492968B882B29C78E0A09B54CC0D918AF31E1F96D891737CBEAEAA2790C6C577BD97F86FF4C17D1F6674F96F63BC45994D4EA6A65CB65A855280EEAA4DF9F92DAD8B0B24608464E8E6C65797489DED1924BA00E6C1ACA2C09B9D3C873C1E767DDAFE71D9127F739DEBB2FA87314D95C8AE54EDCEF6DB579E0669727AA6C9D78A5E1A4F60D68821AA9D636A84B6F650D722E48279611F155464ACDDC64D32D6CAC81A4EEF68D6FB95424DD88E573E58DB718C96D9197B9C65710CB8438C331A0E2ECC38F28E4929A4A39525F66A45BFDDB35886046EA0D94FC6F8BB5D8B7DA772EED1E90160B455F1BF773523B1D418741B6F6BDF145FB07CC68EBB3ECD327A84522BE9DA28A46D3A6E14EA5363E5BFC460732DA8938638A82AC8D14F4952D0B30214EA5BAEFBF306C709CDA68668F5D1D1CF253699D91CB33E8E7853C40EAB5AD7EBF2EB8709184E036A5EEC8DC5BA9EB8A29F654EDB64ADE29CE383F37A97FDA54075C6F3C819AA142A87037E60DEDE98B974F99830AE9370C3A1047F1C793D4E99E19D1A109EE567CCCDBD9263CD7C437DF975E986ACC6AD5DA32ADA8122DB1DF6F875C2CCE34E614B216001EB723FAFD703304A3BA8810069760C1AD7EBCB7FA63173E3DBEE1C98AA4AB02268DCF5D891810AC645865894DF41E64F9EFF00CF0F95D25AE76BF3DAC2F80ECDE72791376DAFBFD7E78AA8318EB7FF0070790F8E3308735AC78AAF4AC0D20B03753B6330D5106CE67A64326599654D666AF2455320BD3A36AD4DB805BF961CF29CB96B383AAF3469A7434B5222D0E488C922F651CEE2F7BE1B3B4188FED38628D9884885F51162C79FF4C3CF66150D4D946642745A8A20F2B98E501975884D8FCAE0E3EA5155D18D2E63B877E11E138B8D29AA638A568F39A78F5C519D5F7CBB9D37B75C39767B34F4E736CAE76B45246CECA4B5D81211AC2DCFFE9C0070F7154FC2B9E50E634CFE289C170BA4164BF880F53D3079C53C51951CFE933FCBC2C6F3B31A8A5054056E44FC0837F8E1E9F698A926BF8C64A2C8E59F308F229CFF0079338A40CDAADAEFA474E86DF5C10767197CD9171657E5D54AE934714B453533822C7DCB8F4DEF865E2ECC6923CD32CCF295EDDF77530BE9BABC6E091F2DAF8937B56A5832EA9C9F8BA8A05927ABA87F6B42401246E892203E5CCE0BF274BC90E4D704654934B96E694EEB74929A60C0B6AFC2C77E5F2C37F6979E0E20E31AFAB895A2A5918680355880373EE8E470CF9CE7F519BE6F515CD1C340649CCC6386DA10DEE79EE474F8E0B3B4CE08A6C93D8AA69EA4D424F23C3A99540040575FC9F7F86212B76588A507C871F66DFB4067BD94712D1519AC0DC3ED208A7866D6744676DB6E57DF963A3BC27C439671765C95F472475513F8B525CEDE7CBAF2C72E327E15A4E34E04A74A5115366F957B48774D03BD8B4F78A0902FA8956B13820EC37B7DE2CECA33B15F47A73FC8FBBD55540ECA1BBA16D457D6C4FD3195ABD27D45BE1D9770E78FE323A7D98B23A00CBA42836001F0FE5D3013DBC76B74BD9F7D9FB88A496655AFAD439651C373A9DE5522C05B90524FCB0D9C1DDB370C76AFC2A336E1AAD8A7B0B545248409E9DCFE1653BEDC89C53CFB62F69C331CFE8B86E064634419EA02943666B695F8D8DFE18C8C181E4C8A125D3E4B5964946C8D380681F8F788E5C925AFF6385291D696770F725545C5B9EFB9DB09F2ECA63E1ECF234AE8A680D0CDF7F12B31200BF98DC0BFCC1C31F0F1ABE1EAEA1CEA00A863904B13B01A59C10187A8DEDF3C4B5DA05364D9E765949C6996BC6D5A2A4535546A56F102A6D130EAC9B6FD430F2C7AA54B8660649352E3A00B84A6FD919B459AAF7A22A7AB4A82A85812818330161D402707DDBD70753E4DC5916694133BE5D9E47ED74F2E961AD85B55F6D89BA1FF005619ABB824641D96707E7C6323DBD1E1ABB95B6A379216FF005A9236E898315A51C71D8346E6D519A6485DE2BB292A907F88BF0685811E7DD7A639D249A7FA2B397BAC8DF85F88B31CB7B58CAF88282434F5F0552CAFB378C58778B6B6E6C2C0799C752780F8929F3EC8A8EB2964269EA2359231E2DAE2FA797CF1C89AA9D1EA8C8AE8095465375DAC058FC475C5EDFB2376953710F06D2D3D7C9119E31A4328517B5F5823A35F7F8118C9D76153C7B9768D2C73A922D3D4D54B06654B77634550A623753E1939A9E5F885C7D30D39C4325156C7280ED0B121F63E1F5E5D30BA568EBA85D7EEE46F7D6C40BB0DC1D8F98C78A9EEF31A1491C2A89101B787C26DC8FC3AE3CA4A2A5ED66A7F01EAF2DA0F33E966FA72F9E023899D8C64A3053BF31BDAF7DAF827AB65A70F0100E9F74F8775F23EB811CEE40AAE795C9DD40DCDBD0F2FEB8C7941E396D64F60D55D6C9DEEC4916DB19843574F2194016200B02073FA9C66188EA398F4955555F516632D4D4CA76562C59DADC86F897A932C9B873B3BAD86A62892AE3859CA2393DDBB9172EC4DB56916D22F88A780EA6AF2FCE5268E94CA248DD118A0217ADC1B6C45B9E1E38D7369731CE1A9CBB414510568A9C30D37650493B6E4E3E9F0BF263CE372AF025A3A193319A282F229726CC0313B0BE3CA6653CF00866623BB3A4D81B93B733F0DF1EF87AA4E555D0E6320D14D1318FBED20A0245BCB7230D3488B3ACB144DA959CE926C1AC4F23B73C3ABE4625D871C4D4429320E1C789A5124946AF39919BDF6FE1716C49AB9A9E20EC1240D339A8A4F636D4C5B50EED9E2637BF3DD70D3DBB6514D91E5B95474CB1843592D385017945122DF97537B61ABB3CAA153D9EF13D01911D5296565034DD482B20245BD3075F8B4567EF858347299335AA4820477A995BBB445D5E327F0FF003C499C7394D65576399754D45FDAE034B3C8ADAAEB71242C0FA92AA0FC3113D2E61265D514D531B0BC53C722952B716606DCB9ED7C4CBDB667F11A0ABA58210C7339E781ECC142049564040B6C4EA382E2E816E5B9240E761D9A7759D6614B2EAEEE58A39081ABC415C2BFD15D87C30C194D5370471B15962668A86B1E09A1F16968C36965E7D549C37F66F5AF4DC6B4E9FE199E19E13EE7BC6362B6DBD00C2AED4228E0E3AAF956FF00DE6386AC036BDDE3527A73B863F3C0F1D0D6BDEC7F8F38CEFB23ED367CFB87655A6352401E26686A227516D4B7B58EC6FE780AE271555D9E4B24D2CD3D65505A89A776725E46075B9DF986240F418F99D55D4665C3795CEF26B10B4D09F77700AB274F5B0C1BF1170F533F006559ED114241592A26F0DCA49B5ED6E48E194FA9185A8C53BF2C37924924C7FA0CB938ABB20A782911FDBA80962AA589EF916F220FF3C7661EAB6F5C02892A47006651C7317A3A9CE291742B3307658E42C79FF96F875ECBF884E4FC4C946CCAB0D66C031501255B98C9DBE20FA3619B2CA6973FE10CEB318D843976515123C30E951DEF792D9DB97301D2DE97C72AB1293E6C99780EB8F1CF61B9E70DB3B3D764C0CD009092445183347A77E62D3A0F436C22EC23883D8B886AF2B7859E9F338BDA2389751D72C035B46075D513483D761D7017D8D7164BC3BC5F2C7148A16BA1084809E2910EA5D88E45752FFA8E1B67CC7FD87E3467A46EEE7CAABC4F4E4A8D45124D519B5BA8B1F81C76DE250F9112872D210768193CBC35C639AE52A6F052D47F7792E4EB85ACD1F5FC4AC307BF673ED0EB783FB42A2A069255CB73393430D4D68E4B6CC37EBEEFD30CDDA8C74B96F6AB97D5E61069CAB3585CF7D508B1868E45D2ACB6BD80B295279601F3DA19787F354682A03BC522D4D34C856C6C6E09B0F97C70B9454A3B5F945A835499D73E1ACDDE68A3D570C362BE2DBCC73E9871A2ACD5535F45660D0B87504B1BAC8350F95EFF000C41FD91F68B4DC53C3D96E68A42C7530249A058E936DC72E871261CF699EA91D1D9F5218591501D44EE0F2EB66FAE3C7E6C7B6546B4656855C454ED514F7467591770DE2FCFF8623CCDF300149935155F7C69DC11CF9F96D829CDEBE65F02C64273D6C547CFE1D311471FE6672D49A692548E09236491540BF2F3B74C53CD837C78ED1C9D0AA6984AC1C1560C2E0DC6330CF1CD19A6A6BAACBF749E26F15F6F3BE33193436CE7CD4E733E4BC3494F0BCB130511C6DB8B5FDF6E7CC9C0BD29ABAD9189919B4DB53B13B7CEFF004C3B718F764D108E75234310BE5E23E2E584F92435B985054D153E83DDAF7A796A206D61B74C7D3A2FC196B8563B6615C9264B43935249DFB997BC7249F7CF21CF08F86A078F8AE872F9DF486AC89246D5F87BC5B9E7CF086843E5892CEC14CFBA22122E09E679619CD4B2D4190FF881F5EB1CEFE7EEE09CB6A0A31B4D1607B6FAE6A99B254247752475150ABA893E2948FDEF202D86EEC8E393FF0051298DBB97A4684B28246B78DF483BF5B622DCDF35A9CCE1CBE4A802E90684D24EC3513E5D09C1DF64D412D7E599A9D29244B3C4AF1348CBABEEE43B80BBF9E1B176922BBC6A10A06F593452089AECABEF0249F43CFCF131F6DEF35770FE5398BC0F4B33D7CA1F9DAED4F136DE2F4B8C411DD8EE65F0290548BA1E9BD8ECBD7134768D2E6757D98E4524E69D2233D33822FA989A34B9DD7A0186A7EEE44C924E234F6454F419A7169A7CD10E98E964AA82517063963B301CF9117BE1BBB55779B8AA6895CC8681051CB2213FEEC900F3EB718CECA5A65E378846901EF282B16D326A16EE893D3D2F8FBDAAA3D1F68B9F149A0612CCB38288029D68AD702DC8DFF2C477C1D5531972C0F53C313A2966921AE66005F60D1DEFEF74D06D8917B25AF8738CA2BF866AE3D511562A2E748865D2ADB6ADB4BE87F99F2C06D52E5C78229732CBAA85066F1454E2A6250196A18B480B1DB62BC88F5C6AE09CD06599E453F76B2EBA49A9DD1E51183AE3200BE9E7AAC47C300325CA1A3337A9CA2A6A20998FB55348D1B36F7043117F7BCC1BFC7073D8B5725465599F0ECC108AA135446B213E20502CCA05F985B3AFAA6238E2BCD4E6B9AE655A6211AD4CAD29DC1B92773EEF5BE366479F3F0FD7E5F98D33AAD451C892AF96C45D4F87716B83E8711277C218D7B475A85ACE1FCCDA32DA6B72F9832917235A1057F16E391C17F6973479C65393711D2C661351659E304DC0750C9D77B30917FCA07961B7B57A5812BE0CD6956310548F67750E09D6A015B8D3B5D197FE5C3653F12D3D5F6599B5056691534D3C6B4EEA7724BEB171A7958CABFEA181DD5C80A3BA98AB8F7339F3FECF3826AE59A492A72F5ABCB6479355C22B868CF3E401DBE581BCAEB129728CCDAADF5234082946A37D7AFF000EFCB6DC7AE30C90D57661592916AAA6CC145C1E48EBCC8B7421460496A248594DC064DD4100F5BDADA7E785C9F84588C78A65CFFB18F15CEDC0F5393D53C8B5196D5168D64B83DCCA3521B5FA90462DA65F9C11046E5D93BB7563CF6F10BDBC5D37B639CDF660E377A2E3AAACBE42AD2663134E661650CE9B816D36EA40F2C5D3CA788D25A668E460AC45AF71B1FF0097A6323550B97F4B50251CFAB2396090AC87529DC2DF636BDB9F2E4710876953CCB953B46E5FBB5D7AE4D46E3D45F7BE0F25E2C8A587458787622C2F7D88E9F3C463C75981AA86A5D2D1EA06C756FBF5F776C508C69D06CCCA789445411472C48EC80282CD636B72E78CC4615B9A1EFAC4EE0017DBFE9C6614F478A4EDA3AD94C32EA67CD6B61A75625DC8507C87D7961E66A87E11CC18D1D5EB981EEDD6DB32F5077C26E177829A99AAD278DD985B63BAAF5E9864CDB355ACCC65982E9463B0277B7D3AE3D26E545457295781EA92A4671984CD2CC298C81DB61B7C06F867918A486E6DD39FFDF1A22CC228A58DAF7B1B900FFDB1F2AEBE3967668D4AC64ECA79FC0ED8079135D8D51A63E56E6B155D065D1A028D045A189FC46FCF9FD7075D96675ECB479845DEE9D52892D7DDBEE9C7EF74E9889FDAF5273E67F5D3AE08786248DA0A991AE48D94AEC46C7D3A60E19009C16DA141AC6EEE4058022FC875FAE25CE2FCD1E4ECAF288D99D9156859758FFF008381D7D37C40E2B1E20C158816B58EFF00CBE7838E21E30AC9F8529A82A60F027B2E8951B621236B5C5BAEAC3D64E444B1DD0F7D94E6AD1F1E521B93AE96AE1B01FBD038FDEC7BED3EBC45C6B51217167A3A416B732204B9F7BD0E00787789EA72ECE20A9A3369E20E5188B81752093B791C27CF3309A7CD2792A267A8998282EFB9B05165E5D062165F28958AE5C84D5D388386A3B305153DD4D128F2BBEC77F302F84F90C90E61599652D5497826AA8E3945EC749700FE2E7FCB0C15F9887CBE8A104FDDA05B79F3F4EB8F39355A4598534925CA46E2436F31B83CBE581DFC86E094585FC73DCD0F13470C02F03D2C375E62FA083F8BC803F1C31C33B24254369651EF5B7F317DFEB8499F6788F9CBCF0162B1A24603F3F08B11CBCEFF004C2CE2055A3A8A58500F152A1631DAC5B70DC875B625643B6BA087B41CF0675065D54A5B5487BD72A2C199E24BF5E608230CB3199B858CAE35A3546F201CCDC6DCFA587D70A29AA466FC21253BFF008F48CCE8C17A017F2F22C3E4308F87AB92AE9AAB29985D25432C43F71C0F87C0FCB11BA884A90B3245357C2F9AA090AE82ACCA7937881039FA7E586535D491E4B2218C356BC97D647BAA2DD7579DFE58DD91D47DF56D1BF84CB114B5F62C011BEDE7BE19F2BA0AACEABE9E828A9A4A8AEA990470C496BB31F88C0CA56312E430ECBF379329ED2F87AB005894D46820722ACA479FC3174727E250D16966049DD49FAFEF7D714306735195F10514B534DECF36592AC46123C5198CD883B7306F8B119571EC335043501CBC72AEB0557637E63DDEB8A79BDD4D0D8F0C9C1F8C7BA8D6CD7079DB9FFF006E7860CE388FDA6070AD6B83B7E8FD31163F1C5E30DDE90C496171CF73BF2F9618F3BED6F2DC923792AAAE37B728D082C4F9016E98A955C8FF0001666B5D4CB55F7D5EB0395074311F5F7B198AAFC57DABD6E699E54CF4D4D0C5113602402463EB73FC06D8CC2F701405233C2CC8923AA8BEC0E366B6686E58DF198CC122446B2BAB5C31C7B35529FC676D86331980B649EE3AF99401707E3857499FD65237DD49A41E96C66330D4DD1148F3FB5AA2EE350E56E58C9F882BE7A7485EA19A3520807E83198CC7394BE41A46BA6CD2A61667490AB5B98C6C8734AA9AA54BCACDAB638CC663937C7215215B574ED33A190E95D80BE3CC5512F780895C6DD0FADB198CC36DD0037495334858B4AE773D70A5EB2A0450B77F21B5C01AB975FE27198CC22D92D0AA8737AD88C88953222B01700F3E63F99C2686BEA6398324F22B0D8107718CC6626DFC91485547573C956979E40CCDBB03BEF8C8EB2A575CAB5122CB1B6B475366520F307198CC1A6CEA3D452C95EB2CB348C6522E5C6C4FC70BF87F38CC23AE4A34AFA98E9EC4055908B6D7DB198CC29364D1AAA333ADA8D6B3564F2ADAF677BE1BE86923AD8DA79776560001603E98CC662172121AE520CAFE10373B01CB198CC661649FFFD9, '2015-06-26 13:52:16', '1', '用户头像_超级用户', null);

-- ----------------------------
-- Table structure for aos_ge_catalog
-- ----------------------------
DROP TABLE IF EXISTS `aos_ge_catalog`;
CREATE TABLE `aos_ge_catalog` (
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
  UNIQUE KEY `aos_ge_catalog_ukey` (`cascade_id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of aos_ge_catalog
-- ----------------------------
INSERT INTO `aos_ge_catalog` VALUES ('10', '0.001', 'PARAM_TYPE', '参数分类科目', '参数分类', null, '0', '0', '0', 'book.png', '1');
INSERT INTO `aos_ge_catalog` VALUES ('11', '0.001.001', 'PARAM_TYPE', '参数分类科目', '业务参数', null, '10', '1', '0', 'user20.png', '2');
INSERT INTO `aos_ge_catalog` VALUES ('12', '0.001.002', 'PARAM_TYPE', '参数分类科目', '系统参数', null, '10', '0', '1', 'folder22.png', '1');
INSERT INTO `aos_ge_catalog` VALUES ('1689', '0.005', 'WF_PROC_TYPE', '流程分类', '流程分类', null, '0', '0', '0', 'book.png', '50');
INSERT INTO `aos_ge_catalog` VALUES ('1690', '0.005.001', 'WF_PROC_TYPE', '流程分类', '默认分类', null, '1689', '1', '0', null, '10');
INSERT INTO `aos_ge_catalog` VALUES ('38', '0.002', 'DIC_TYPE', '词典分类科目', '数据字典分类', null, '0', '0', '0', 'book.png', '2');
INSERT INTO `aos_ge_catalog` VALUES ('39', '0.002.001', 'DIC_TYPE', '词典分类科目', '系统管理', null, '38', '0', '1', 'folder22.png', '2');
INSERT INTO `aos_ge_catalog` VALUES ('40', '0.002.002', 'DIC_TYPE', '词典分类科目', '全局通用', null, '38', '1', '0', 'folder24.png', '3');
INSERT INTO `aos_ge_catalog` VALUES ('410', '0.001.002.001', 'PARAM_TYPE', '参数分类科目', '验证码', null, '12', '1', '0', 'ok3.png', '2');
INSERT INTO `aos_ge_catalog` VALUES ('413', '0.001.002.002', 'PARAM_TYPE', '参数分类科目', '界面显示', null, '12', '1', '0', 'icon59.png', '1');
INSERT INTO `aos_ge_catalog` VALUES ('414', '0.001.002.003', 'PARAM_TYPE', '参数分类科目', '其它', null, '12', '1', '0', 'icon150.png', '9');
INSERT INTO `aos_ge_catalog` VALUES ('423', '0.001.002.004', 'PARAM_TYPE', '参数分类科目', '导航与菜单', null, '12', '1', '0', 'icon152.png', '3');
INSERT INTO `aos_ge_catalog` VALUES ('47', '0.001.004.001', 'PARAM_TYPE', '参数分类科目', 'XXA业务域', null, '46', '1', '0', null, '1');
INSERT INTO `aos_ge_catalog` VALUES ('48', '0.001.004.002', 'PARAM_TYPE', '参数分类科目', 'XXB业务域', null, '46', '1', '0', null, '2');
INSERT INTO `aos_ge_catalog` VALUES ('505', '0.003', 'WF_MODEL_TYPE', '流程模型分类', '流程模型分类', null, '0', '0', '0', 'book.png', '3');
INSERT INTO `aos_ge_catalog` VALUES ('506', '0.003.001', 'WF_PROCESS_TYPE', '流程分类', '默认分类', null, '505', '1', '0', null, '1');
INSERT INTO `aos_ge_catalog` VALUES ('542', '0.002.001.001', 'DIC_TYPE', '词典分类科目', '工作流', null, '39', '1', '0', 'folder6.png', '1');
INSERT INTO `aos_ge_catalog` VALUES ('611', '0.004', 'BYTE_FILE_TYPE', '流文件分类', '流文件分类', null, '0', '0', '0', 'book.png', '4');
INSERT INTO `aos_ge_catalog` VALUES ('613', '0.004.001', 'BYTE_FILE_TYPE', '流文件分类', '用户头像', null, '611', '1', '0', 'vcard.png', '1');
INSERT INTO `aos_ge_catalog` VALUES ('614', '0.004.002', 'BYTE_FILE_TYPE', '流文件分类', '报表模版', null, '611', '1', '0', 'page_paint.png', '2');
INSERT INTO `aos_ge_catalog` VALUES ('616', '0.004.003', 'BYTE_FILE_TYPE', '流文件分类', '序列化对象', null, '611', '1', '0', 'plugin.png', '3');
INSERT INTO `aos_ge_catalog` VALUES ('80', '0.002.006', 'DIC_TYPE', '词典分类科目', '平台配置', null, '38', '1', '0', 'folder2.png', '1');

-- ----------------------------
-- Table structure for aos_ge_dic
-- ----------------------------
DROP TABLE IF EXISTS `aos_ge_dic`;
CREATE TABLE `aos_ge_dic` (
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
-- Records of aos_ge_dic
-- ----------------------------
INSERT INTO `aos_ge_dic` VALUES ('123', '2', '表格列', null, '1', '122', null);
INSERT INTO `aos_ge_dic` VALUES ('124', '3', '表单元素(输入框|下拉框|选择框等)', null, '1', '122', null);
INSERT INTO `aos_ge_dic` VALUES ('125', '4', '容器组件(窗口|面板|树|表格|工具栏等)', null, '1', '122', null);
INSERT INTO `aos_ge_dic` VALUES ('1637', '1', '主页面', null, '1', '1636', '点击主导航菜单打开的页面');
INSERT INTO `aos_ge_dic` VALUES ('1638', '2', '子页面', null, '1', '1636', '在主页面上的子导航打开的页面(内嵌式的)');
INSERT INTO `aos_ge_dic` VALUES ('1640', '3', '关联页面', null, '1', '1636', '主页面上跳转出去的页面');
INSERT INTO `aos_ge_dic` VALUES ('1651', '4', '分割符', null, '1', '1636', '子页面生成的二级导航菜单的分割符标识');
INSERT INTO `aos_ge_dic` VALUES ('1671', '1', '平铺', null, '1', '1670', null);
INSERT INTO `aos_ge_dic` VALUES ('1672', '2', '树状', null, '1', '1670', null);
INSERT INTO `aos_ge_dic` VALUES ('1674', '0', '系统导航', null, '1', '1673', null);
INSERT INTO `aos_ge_dic` VALUES ('1675', '1', '快捷菜单', null, '1', '1673', null);
INSERT INTO `aos_ge_dic` VALUES ('1676', '2', '发现', null, '1', '1673', null);
INSERT INTO `aos_ge_dic` VALUES ('1681', '4', '导入离线文本', null, '1', '543', null);
INSERT INTO `aos_ge_dic` VALUES ('1686', '1', '激活', null, '1', '1685', null);
INSERT INTO `aos_ge_dic` VALUES ('1687', '2', '挂起', null, '1', '1685', null);
INSERT INTO `aos_ge_dic` VALUES ('1694', 'PENDING', '代理中', null, '1', '1693', null);
INSERT INTO `aos_ge_dic` VALUES ('1697', '9', '结束', null, '1', '1685', '引擎中并非有次状态，只为表格显示非空而增加。');
INSERT INTO `aos_ge_dic` VALUES ('1699', '1', '待办', null, '1', '1698', null);
INSERT INTO `aos_ge_dic` VALUES ('1700', '2', '办结', null, '1', '1698', null);
INSERT INTO `aos_ge_dic` VALUES ('1705', 'neptune', '#c0c0c0', null, '1', '1704', null);
INSERT INTO `aos_ge_dic` VALUES ('1706', 'blue', '#99bce8', null, '1', '1704', null);
INSERT INTO `aos_ge_dic` VALUES ('1707', 'aos', '#99bce8', null, '1', '1704', null);
INSERT INTO `aos_ge_dic` VALUES ('1708', 'gray', '#BCB0B0', null, '1', '1704', null);
INSERT INTO `aos_ge_dic` VALUES ('1709', '3', '待签收', null, '1', '1698', null);
INSERT INTO `aos_ge_dic` VALUES ('239', '1', '行政部门', null, '1', '238', null);
INSERT INTO `aos_ge_dic` VALUES ('240', '2', '项目组', null, '1', '238', null);
INSERT INTO `aos_ge_dic` VALUES ('241', '4', '其它', null, '1', '238', null);
INSERT INTO `aos_ge_dic` VALUES ('253', '3', '工作组', null, '1', '238', null);
INSERT INTO `aos_ge_dic` VALUES ('290', '1', '正常', null, '1', '289', null);
INSERT INTO `aos_ge_dic` VALUES ('291', '3', '管理员封锁', null, '1', '289', null);
INSERT INTO `aos_ge_dic` VALUES ('292', '2', '停用', null, '1', '289', null);
INSERT INTO `aos_ge_dic` VALUES ('294', '1', '缺省', null, '1', '293', null);
INSERT INTO `aos_ge_dic` VALUES ('307', '0', '未知', null, '1', '306', null);
INSERT INTO `aos_ge_dic` VALUES ('308', '1', '男', null, '1', '306', null);
INSERT INTO `aos_ge_dic` VALUES ('309', '2', '女', null, '1', '306', null);
INSERT INTO `aos_ge_dic` VALUES ('310', '2', '超级用户', null, '1', '293', null);
INSERT INTO `aos_ge_dic` VALUES ('311', '4', '系统封锁', null, '1', '289', null);
INSERT INTO `aos_ge_dic` VALUES ('312', '3', '注册用户', null, '1', '293', null);
INSERT INTO `aos_ge_dic` VALUES ('315', '1', '缺省', null, '1', '314', null);
INSERT INTO `aos_ge_dic` VALUES ('322', '1', '缺省', null, '1', '321', null);
INSERT INTO `aos_ge_dic` VALUES ('335', '1', '经办权限', null, '1', '334', null);
INSERT INTO `aos_ge_dic` VALUES ('336', '2', '管理权限', null, '1', '334', null);
INSERT INTO `aos_ge_dic` VALUES ('353', 'blue', 'blue.png', null, '1', '352', null);
INSERT INTO `aos_ge_dic` VALUES ('354', 'gray', 'gray.png', null, '1', '352', null);
INSERT INTO `aos_ge_dic` VALUES ('355', 'neptune', 'neptune.png', null, '1', '352', null);
INSERT INTO `aos_ge_dic` VALUES ('356', 'aos', 'aos.png', null, '1', '352', null);
INSERT INTO `aos_ge_dic` VALUES ('358', 'blue', '#DFE8F6', null, '1', '357', null);
INSERT INTO `aos_ge_dic` VALUES ('360', 'gray', '#F0F0F0', null, '1', '357', null);
INSERT INTO `aos_ge_dic` VALUES ('361', 'neptune', '#D0DDF2', null, '1', '357', null);
INSERT INTO `aos_ge_dic` VALUES ('362', 'aos', 'red', null, '1', '357', null);
INSERT INTO `aos_ge_dic` VALUES ('367', 'neptune', '#006699', null, '1', '365', null);
INSERT INTO `aos_ge_dic` VALUES ('368', 'blue', '#6699CC', null, '1', '365', null);
INSERT INTO `aos_ge_dic` VALUES ('369', 'gray', '#888888', null, '1', '365', null);
INSERT INTO `aos_ge_dic` VALUES ('370', 'aos', '#006699', null, '1', '365', null);
INSERT INTO `aos_ge_dic` VALUES ('372', 'neptune', '#FAFAFA', null, '1', '371', null);
INSERT INTO `aos_ge_dic` VALUES ('373', 'blue', '#3399FF', null, '1', '371', null);
INSERT INTO `aos_ge_dic` VALUES ('374', 'gray', '#555555', null, '1', '371', null);
INSERT INTO `aos_ge_dic` VALUES ('375', 'aos', '#FAFAFA', null, '1', '371', null);
INSERT INTO `aos_ge_dic` VALUES ('377', 'neptune', 'left-logo.png', null, '1', '376', null);
INSERT INTO `aos_ge_dic` VALUES ('378', 'blue', 'left-logo.png', null, '1', '376', null);
INSERT INTO `aos_ge_dic` VALUES ('379', 'gray', 'left-logo.png', null, '1', '376', null);
INSERT INTO `aos_ge_dic` VALUES ('380', 'aos', 'left-logo.png', null, '1', '376', null);
INSERT INTO `aos_ge_dic` VALUES ('405', '1', '小图标[16X16]', null, '1', '404', null);
INSERT INTO `aos_ge_dic` VALUES ('406', '2', '大图标[64X64]', null, '1', '404', null);
INSERT INTO `aos_ge_dic` VALUES ('407', '3', '矢量图标', null, '1', '404', null);
INSERT INTO `aos_ge_dic` VALUES ('456', '1', '按钮|菜单下拉项', null, '1', '122', null);
INSERT INTO `aos_ge_dic` VALUES ('463', '1', '未授权', null, '1', '462', null);
INSERT INTO `aos_ge_dic` VALUES ('464', '2', '显示', null, '1', '462', null);
INSERT INTO `aos_ge_dic` VALUES ('465', '3', '隐藏', null, '1', '462', null);
INSERT INTO `aos_ge_dic` VALUES ('466', '4', '只读', null, '1', '462', null);
INSERT INTO `aos_ge_dic` VALUES ('467', '5', '编辑', null, '1', '462', null);
INSERT INTO `aos_ge_dic` VALUES ('468', '6', '禁用', null, '1', '462', null);
INSERT INTO `aos_ge_dic` VALUES ('469', '7', '激活', null, '1', '462', null);
INSERT INTO `aos_ge_dic` VALUES ('472', '99', '撤消授权', null, '1', '462', null);
INSERT INTO `aos_ge_dic` VALUES ('544', '1', '在线设计', null, '1', '543', null);
INSERT INTO `aos_ge_dic` VALUES ('545', '2', '在线克隆', null, '1', '543', null);
INSERT INTO `aos_ge_dic` VALUES ('551', '3', '导入离线文件', null, '1', '543', null);
INSERT INTO `aos_ge_dic` VALUES ('553', '1', '运行中', null, '1', '552', null);
INSERT INTO `aos_ge_dic` VALUES ('554', '2', '已结束', null, '1', '552', null);
INSERT INTO `aos_ge_dic` VALUES ('648', 'classic', '经典主题', null, '1', '647', '上Banner-左导航-中经办。');
INSERT INTO `aos_ge_dic` VALUES ('650', 'blue', '天蓝', null, '1', '649', null);
INSERT INTO `aos_ge_dic` VALUES ('651', 'gray', '银灰', null, '1', '649', null);
INSERT INTO `aos_ge_dic` VALUES ('652', 'neptune', '海王星(水蓝)', null, '1', '649', null);
INSERT INTO `aos_ge_dic` VALUES ('653', 'aos', 'AOS', null, '1', '649', null);
INSERT INTO `aos_ge_dic` VALUES ('655', 'tab', 'Tab风格', null, '1', '654', '支持打开多个业务经办界面。');
INSERT INTO `aos_ge_dic` VALUES ('656', 'page', '单页风格', null, '1', '654', '只能打开一个功能页面');
INSERT INTO `aos_ge_dic` VALUES ('658', '1', '同级', null, '1', '657', '水平导航按钮和垂直导航的卡片属于统一层级。');
INSERT INTO `aos_ge_dic` VALUES ('659', '2', '级联', null, '1', '657', '水平导航按钮和垂直导航的卡片有上下级级联导航关系');
INSERT INTO `aos_ge_dic` VALUES ('661', 'true', '显示', null, '1', '660', null);
INSERT INTO `aos_ge_dic` VALUES ('662', 'false', '隐藏', null, '1', '660', null);
INSERT INTO `aos_ge_dic` VALUES ('664', 'tight', '组合按钮', null, '1', '663', null);
INSERT INTO `aos_ge_dic` VALUES ('665', 'standalone', '独立按钮', null, '1', '663', null);
INSERT INTO `aos_ge_dic` VALUES ('667', '1', '显示', null, '1', '666', null);
INSERT INTO `aos_ge_dic` VALUES ('668', '0', '隐藏', null, '1', '666', null);
INSERT INTO `aos_ge_dic` VALUES ('682', '1', '快捷菜单', null, '1', '681', null);
INSERT INTO `aos_ge_dic` VALUES ('683', '2', '浮动菜单', null, '1', '681', '欢迎页显示的Mac风格的浮动菜单');
INSERT INTO `aos_ge_dic` VALUES ('77', '1', '正常', null, '1', '76', null);
INSERT INTO `aos_ge_dic` VALUES ('78', '2', '挂失', null, '1', '76', null);
INSERT INTO `aos_ge_dic` VALUES ('79', '3', '注销', null, '1', '76', null);
INSERT INTO `aos_ge_dic` VALUES ('83', '1', '是', null, '1', '82', null);
INSERT INTO `aos_ge_dic` VALUES ('84', '0', '否', null, '1', '82', null);
INSERT INTO `aos_ge_dic` VALUES ('86', '0', '停用', null, '1', '85', null);
INSERT INTO `aos_ge_dic` VALUES ('87', '1', '启用', null, '1', '85', null);
INSERT INTO `aos_ge_dic` VALUES ('89', '1', 'APPID', null, '1', '88', null);
INSERT INTO `aos_ge_dic` VALUES ('90', '2', 'UUID', null, '1', '88', null);
INSERT INTO `aos_ge_dic` VALUES ('91', '3', 'DBSequence', null, '1', '88', null);

-- ----------------------------
-- Table structure for aos_ge_dic_index
-- ----------------------------
DROP TABLE IF EXISTS `aos_ge_dic_index`;
CREATE TABLE `aos_ge_dic_index` (
  `id_` varchar(64) NOT NULL COMMENT '流水号',
  `key_` varchar(255) NOT NULL COMMENT '字典标识',
  `name_` varchar(255) NOT NULL COMMENT '字典名称',
  `hotkey_` varchar(255) default NULL COMMENT '热键',
  `catalog_id_` varchar(64) NOT NULL COMMENT '所属分类流水号',
  `catalog_cascade_id_` varchar(255) NOT NULL COMMENT '所属分类流节点语义ID',
  `remark_` varchar(4000) default NULL COMMENT '备注',
  PRIMARY KEY  (`id_`),
  UNIQUE KEY `aos_ge_dic_index_ukey` (`key_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典索引表';

-- ----------------------------
-- Records of aos_ge_dic_index
-- ----------------------------
INSERT INTO `aos_ge_dic_index` VALUES ('122', 'page_el_type_', '页面元素类型', null, '39', '0.002.001', null);
INSERT INTO `aos_ge_dic_index` VALUES ('1636', 'page_type_', '页面类型', null, '39', '0.002.001', null);
INSERT INTO `aos_ge_dic_index` VALUES ('1670', 'nav_quick_layout_', '快捷菜单布局风格', null, '80', '0.002.006', '快捷菜单布局风格。');
INSERT INTO `aos_ge_dic_index` VALUES ('1673', 'nav_tab_index_', '导航缺省活动页', null, '80', '0.002.006', null);
INSERT INTO `aos_ge_dic_index` VALUES ('1685', 'suspension_state_', '实例/任务活动状态', null, '542', '0.002.001.001', null);
INSERT INTO `aos_ge_dic_index` VALUES ('1693', 'delegation_', '委派状态', null, '542', '0.002.001.001', '流程任务的委派代理状态');
INSERT INTO `aos_ge_dic_index` VALUES ('1698', 'proctask_status_', '任务状态', null, '542', '0.002.001.001', null);
INSERT INTO `aos_ge_dic_index` VALUES ('1704', 'cmp_border_color_', '组件边框颜色', null, '80', '0.002.006', null);
INSERT INTO `aos_ge_dic_index` VALUES ('238', 'org_type_', '组织类型', null, '39', '0.002.001', null);
INSERT INTO `aos_ge_dic_index` VALUES ('289', 'user_status_', '用户状态', null, '39', '0.002.001', null);
INSERT INTO `aos_ge_dic_index` VALUES ('293', 'user_type_', '用户类型', null, '39', '0.002.001', null);
INSERT INTO `aos_ge_dic_index` VALUES ('306', 'sex_', '性别', null, '40', '0.002.002', null);
INSERT INTO `aos_ge_dic_index` VALUES ('314', 'post_type_', '岗位类型', null, '39', '0.002.001', null);
INSERT INTO `aos_ge_dic_index` VALUES ('321', 'role_type_', '角色类型', null, '39', '0.002.001', null);
INSERT INTO `aos_ge_dic_index` VALUES ('334', 'grant_type_', '权限类型', null, '39', '0.002.001', null);
INSERT INTO `aos_ge_dic_index` VALUES ('352', 'north_back_img_', '主页面north区域背景图片', null, '80', '0.002.006', null);
INSERT INTO `aos_ge_dic_index` VALUES ('357', 'south_back_color_', '主页面south区域背景颜色', null, '80', '0.002.006', null);
INSERT INTO `aos_ge_dic_index` VALUES ('365', 'main_text_color_', '边界区域字体主颜色', null, '80', '0.002.006', null);
INSERT INTO `aos_ge_dic_index` VALUES ('371', 'nav_text_color_', '导航文字颜色', null, '80', '0.002.006', null);
INSERT INTO `aos_ge_dic_index` VALUES ('376', 'left_logo_', 'Banner左边logo图标', null, '80', '0.002.006', null);
INSERT INTO `aos_ge_dic_index` VALUES ('404', 'icon_type_', '图标类型', null, '39', '0.002.001', null);
INSERT INTO `aos_ge_dic_index` VALUES ('462', 'cmp_grant_type_', '界面元素授权类型', null, '39', '0.002.001', null);
INSERT INTO `aos_ge_dic_index` VALUES ('543', 'create_type_', '流程模型创建方式', null, '542', '0.002.001.001', '业务流程模型创建方式');
INSERT INTO `aos_ge_dic_index` VALUES ('552', 'procinst_status_', '流程实例状态', null, '542', '0.002.001.001', null);
INSERT INTO `aos_ge_dic_index` VALUES ('647', 'theme_', '系统主题', null, '80', '0.002.006', null);
INSERT INTO `aos_ge_dic_index` VALUES ('649', 'skin_', '界面皮肤', null, '80', '0.002.006', null);
INSERT INTO `aos_ge_dic_index` VALUES ('654', 'layout_', '业务经办区域布局风格', null, '80', '0.002.006', '系统业务经办区域(center)布局风格。可选值：tab|page。缺省值：tab。tab：支持同时打开多个功能模块界面；page：当前只能打开1个功能界面。');
INSERT INTO `aos_ge_dic_index` VALUES ('657', 'nav_mode_', '导航模式', null, '80', '0.002.006', '顶部导航条和左侧树状导航的关系');
INSERT INTO `aos_ge_dic_index` VALUES ('660', 'is_show_top_nav_', '是否显示顶部导航条', null, '80', '0.002.006', '是否显示水平导航条。(只有在导航模式为1的情况，此设置才有效,导航模式为2，则水平导航条不会消失)。可选值：true| false。');
INSERT INTO `aos_ge_dic_index` VALUES ('663', 'navbar_btn_style_', '顶部导航条按钮风格', null, '80', '0.002.006', null);
INSERT INTO `aos_ge_dic_index` VALUES ('666', 'is_show_mac_nav_', '是否显示Mac浮动导航', null, '80', '0.002.006', null);
INSERT INTO `aos_ge_dic_index` VALUES ('681', 'module_user_nav_type', '导航菜单类型', null, '39', '0.002.001', null);
INSERT INTO `aos_ge_dic_index` VALUES ('76', 'az01b2', '银行卡状态', null, '75', '0.002.005', null);
INSERT INTO `aos_ge_dic_index` VALUES ('82', 'bool_', '是否布尔值字典', null, '40', '0.002.002', null);
INSERT INTO `aos_ge_dic_index` VALUES ('85', 'enabled_', '使能状态', null, '40', '0.002.002', null);
INSERT INTO `aos_ge_dic_index` VALUES ('88', 'sequence_type_', 'ID类型', null, '39', '0.002.001', null);

-- ----------------------------
-- Table structure for aos_ge_icon
-- ----------------------------
DROP TABLE IF EXISTS `aos_ge_icon`;
CREATE TABLE `aos_ge_icon` (
  `id_` varchar(64) NOT NULL COMMENT '流水号',
  `name_` varchar(255) NOT NULL COMMENT '名称',
  `type_` varchar(255) NOT NULL COMMENT '类型',
  PRIMARY KEY  (`id_`),
  UNIQUE KEY `aos_ge_icon_ukey` (`name_`,`type_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图标大全';

-- ----------------------------
-- Records of aos_ge_icon
-- ----------------------------
INSERT INTO `aos_ge_icon` VALUES ('2904', '10.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2905', '11.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2906', '13.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2907', '14.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2908', '15.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2909', '17.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2910', '19.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2911', '2.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2912', '21.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2913', '22.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2914', '23.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2915', '24.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2916', '25.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2917', '26.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2918', '28.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2919', '3.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2920', '30.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2921', '32.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2922', '34.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2923', '35.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2924', '36.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2925', '37.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2926', '38.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2927', '39.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2928', '4.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2929', '40.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2930', '41.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2931', '42.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2932', '43.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2933', '44.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2934', '45.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2935', '46.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2936', '47.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2937', '48.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2938', '49.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2939', '5.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2940', '51.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2941', '52.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2942', '53.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2943', '54.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2944', '55.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2945', '56.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2946', '6.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2947', '7.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2948', '8.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('2949', '9.png', '2');
INSERT INTO `aos_ge_icon` VALUES ('6938', 'add.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6939', 'add2.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6940', 'against.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6941', 'agree.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6942', 'app_columns.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6943', 'app_list.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6944', 'arraw_return.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6945', 'arrow_branch.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6946', 'arrow_divide.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6947', 'arrow_down.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6948', 'arrow_left.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6949', 'arrow_merge.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6950', 'arrow_redo.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6951', 'arrow_right.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6952', 'arrow_switch.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6953', 'arrow_undo.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6954', 'arrow_up.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6955', 'basket.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6956', 'book.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6957', 'book_user.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6958', 'bug.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6959', 'bullet_blue.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6960', 'chart_curve.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6961', 'chart_flipped.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6962', 'chart_line.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6963', 'chart_pie.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6964', 'close.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6965', 'config.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6966', 'config1.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6967', 'config3.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6968', 'connect.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6969', 'copy.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6970', 'cut.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6971', 'cv.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6972', 'c_key.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6973', 'database.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6974', 'database_add.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6975', 'del.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6976', 'del1.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6977', 'del2.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6978', 'del3.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6979', 'del_folder.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6980', 'del_page.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6981', 'detail.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6982', 'disconnect.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6983', 'doc_ok.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6984', 'edit.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6985', 'edit2.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6986', 'email.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6987', 'email2.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6988', 'email3.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6989', 'email_go.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6990', 'email_open.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6991', 'exit.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6992', 'exit2.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('827', 'fa-adjust', '3');
INSERT INTO `aos_ge_icon` VALUES ('1096', 'fa-adn', '3');
INSERT INTO `aos_ge_icon` VALUES ('817', 'fa-align-center', '3');
INSERT INTO `aos_ge_icon` VALUES ('819', 'fa-align-justify', '3');
INSERT INTO `aos_ge_icon` VALUES ('816', 'fa-align-left', '3');
INSERT INTO `aos_ge_icon` VALUES ('818', 'fa-align-right', '3');
INSERT INTO `aos_ge_icon` VALUES ('987', 'fa-ambulance', '3');
INSERT INTO `aos_ge_icon` VALUES ('1049', 'fa-anchor', '3');
INSERT INTO `aos_ge_icon` VALUES ('1107', 'fa-android', '3');
INSERT INTO `aos_ge_icon` VALUES ('1240', 'fa-angellist', '3');
INSERT INTO `aos_ge_icon` VALUES ('996', 'fa-angle-double-down', '3');
INSERT INTO `aos_ge_icon` VALUES ('993', 'fa-angle-double-left', '3');
INSERT INTO `aos_ge_icon` VALUES ('994', 'fa-angle-double-right', '3');
INSERT INTO `aos_ge_icon` VALUES ('995', 'fa-angle-double-up', '3');
INSERT INTO `aos_ge_icon` VALUES ('1000', 'fa-angle-down', '3');
INSERT INTO `aos_ge_icon` VALUES ('997', 'fa-angle-left', '3');
INSERT INTO `aos_ge_icon` VALUES ('998', 'fa-angle-right', '3');
INSERT INTO `aos_ge_icon` VALUES ('999', 'fa-angle-up', '3');
INSERT INTO `aos_ge_icon` VALUES ('1105', 'fa-apple', '3');
INSERT INTO `aos_ge_icon` VALUES ('1118', 'fa-archive', '3');
INSERT INTO `aos_ge_icon` VALUES ('1230', 'fa-area-chart', '3');
INSERT INTO `aos_ge_icon` VALUES ('926', 'fa-arrow-circle-down', '3');
INSERT INTO `aos_ge_icon` VALUES ('923', 'fa-arrow-circle-left', '3');
INSERT INTO `aos_ge_icon` VALUES ('790', 'fa-arrow-circle-o-down', '3');
INSERT INTO `aos_ge_icon` VALUES ('1126', 'fa-arrow-circle-o-left', '3');
INSERT INTO `aos_ge_icon` VALUES ('1125', 'fa-arrow-circle-o-right', '3');
INSERT INTO `aos_ge_icon` VALUES ('791', 'fa-arrow-circle-o-up', '3');
INSERT INTO `aos_ge_icon` VALUES ('924', 'fa-arrow-circle-right', '3');
INSERT INTO `aos_ge_icon` VALUES ('925', 'fa-arrow-circle-up', '3');
INSERT INTO `aos_ge_icon` VALUES ('858', 'fa-arrow-down', '3');
INSERT INTO `aos_ge_icon` VALUES ('855', 'fa-arrow-left', '3');
INSERT INTO `aos_ge_icon` VALUES ('856', 'fa-arrow-right', '3');
INSERT INTO `aos_ge_icon` VALUES ('857', 'fa-arrow-up', '3');
INSERT INTO `aos_ge_icon` VALUES ('832', 'fa-arrows', '3');
INSERT INTO `aos_ge_icon` VALUES ('932', 'fa-arrows-alt', '3');
INSERT INTO `aos_ge_icon` VALUES ('884', 'fa-arrows-h', '3');
INSERT INTO `aos_ge_icon` VALUES ('883', 'fa-arrows-v', '3');
INSERT INTO `aos_ge_icon` VALUES ('864', 'fa-asterisk', '3');
INSERT INTO `aos_ge_icon` VALUES ('1226', 'fa-at', '3');
INSERT INTO `aos_ge_icon` VALUES ('835', 'fa-backward', '3');
INSERT INTO `aos_ge_icon` VALUES ('854', 'fa-ban', '3');
INSERT INTO `aos_ge_icon` VALUES ('885', 'fa-bar-chart', '3');
INSERT INTO `aos_ge_icon` VALUES ('804', 'fa-barcode', '3');
INSERT INTO `aos_ge_icon` VALUES ('942', 'fa-bars', '3');
INSERT INTO `aos_ge_icon` VALUES ('990', 'fa-beer', '3');
INSERT INTO `aos_ge_icon` VALUES ('1160', 'fa-behance', '3');
INSERT INTO `aos_ge_icon` VALUES ('1161', 'fa-behance-square', '3');
INSERT INTO `aos_ge_icon` VALUES ('917', 'fa-bell', '3');
INSERT INTO `aos_ge_icon` VALUES ('981', 'fa-bell-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('1222', 'fa-bell-slash', '3');
INSERT INTO `aos_ge_icon` VALUES ('1223', 'fa-bell-slash-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('1237', 'fa-bicycle', '3');
INSERT INTO `aos_ge_icon` VALUES ('1206', 'fa-binoculars', '3');
INSERT INTO `aos_ge_icon` VALUES ('1229', 'fa-birthday-cake', '3');
INSERT INTO `aos_ge_icon` VALUES ('1097', 'fa-bitbucket', '3');
INSERT INTO `aos_ge_icon` VALUES ('1098', 'fa-bitbucket-square', '3');
INSERT INTO `aos_ge_icon` VALUES ('812', 'fa-bold', '3');
INSERT INTO `aos_ge_icon` VALUES ('970', 'fa-bolt', '3');
INSERT INTO `aos_ge_icon` VALUES ('1203', 'fa-bomb', '3');
INSERT INTO `aos_ge_icon` VALUES ('807', 'fa-book', '3');
INSERT INTO `aos_ge_icon` VALUES ('808', 'fa-bookmark', '3');
INSERT INTO `aos_ge_icon` VALUES ('907', 'fa-bookmark-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('931', 'fa-briefcase', '3');
INSERT INTO `aos_ge_icon` VALUES ('1076', 'fa-btc', '3');
INSERT INTO `aos_ge_icon` VALUES ('1119', 'fa-bug', '3');
INSERT INTO `aos_ge_icon` VALUES ('1154', 'fa-building', '3');
INSERT INTO `aos_ge_icon` VALUES ('985', 'fa-building-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('916', 'fa-bullhorn', '3');
INSERT INTO `aos_ge_icon` VALUES ('1051', 'fa-bullseye', '3');
INSERT INTO `aos_ge_icon` VALUES ('1238', 'fa-bus', '3');
INSERT INTO `aos_ge_icon` VALUES ('1213', 'fa-calculator', '3');
INSERT INTO `aos_ge_icon` VALUES ('873', 'fa-calendar', '3');
INSERT INTO `aos_ge_icon` VALUES ('1039', 'fa-calendar-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('810', 'fa-camera', '3');
INSERT INTO `aos_ge_icon` VALUES ('888', 'fa-camera-retro', '3');
INSERT INTO `aos_ge_icon` VALUES ('1165', 'fa-car', '3');
INSERT INTO `aos_ge_icon` VALUES ('955', 'fa-caret-down', '3');
INSERT INTO `aos_ge_icon` VALUES ('957', 'fa-caret-left', '3');
INSERT INTO `aos_ge_icon` VALUES ('958', 'fa-caret-right', '3');
INSERT INTO `aos_ge_icon` VALUES ('1066', 'fa-caret-square-o-down', '3');
INSERT INTO `aos_ge_icon` VALUES ('1127', 'fa-caret-square-o-left', '3');
INSERT INTO `aos_ge_icon` VALUES ('1068', 'fa-caret-square-o-right', '3');
INSERT INTO `aos_ge_icon` VALUES ('1067', 'fa-caret-square-o-up', '3');
INSERT INTO `aos_ge_icon` VALUES ('956', 'fa-caret-up', '3');
INSERT INTO `aos_ge_icon` VALUES ('1241', 'fa-cc', '3');
INSERT INTO `aos_ge_icon` VALUES ('1219', 'fa-cc-amex', '3');
INSERT INTO `aos_ge_icon` VALUES ('1218', 'fa-cc-discover', '3');
INSERT INTO `aos_ge_icon` VALUES ('1217', 'fa-cc-mastercard', '3');
INSERT INTO `aos_ge_icon` VALUES ('1220', 'fa-cc-paypal', '3');
INSERT INTO `aos_ge_icon` VALUES ('1221', 'fa-cc-stripe', '3');
INSERT INTO `aos_ge_icon` VALUES ('1216', 'fa-cc-visa', '3');
INSERT INTO `aos_ge_icon` VALUES ('918', 'fa-certificate', '3');
INSERT INTO `aos_ge_icon` VALUES ('1028', 'fa-chain-broken', '3');
INSERT INTO `aos_ge_icon` VALUES ('777', 'fa-check', '3');
INSERT INTO `aos_ge_icon` VALUES ('848', 'fa-check-circle', '3');
INSERT INTO `aos_ge_icon` VALUES ('853', 'fa-check-circle-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('1061', 'fa-check-square', '3');
INSERT INTO `aos_ge_icon` VALUES ('831', 'fa-check-square-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('1046', 'fa-chevron-circle-down', '3');
INSERT INTO `aos_ge_icon` VALUES ('1043', 'fa-chevron-circle-left', '3');
INSERT INTO `aos_ge_icon` VALUES ('1044', 'fa-chevron-circle-right', '3');
INSERT INTO `aos_ge_icon` VALUES ('1045', 'fa-chevron-circle-up', '3');
INSERT INTO `aos_ge_icon` VALUES ('878', 'fa-chevron-down', '3');
INSERT INTO `aos_ge_icon` VALUES ('843', 'fa-chevron-left', '3');
INSERT INTO `aos_ge_icon` VALUES ('844', 'fa-chevron-right', '3');
INSERT INTO `aos_ge_icon` VALUES ('877', 'fa-chevron-up', '3');
INSERT INTO `aos_ge_icon` VALUES ('1155', 'fa-child', '3');
INSERT INTO `aos_ge_icon` VALUES ('1009', 'fa-circle', '3');
INSERT INTO `aos_ge_icon` VALUES ('1005', 'fa-circle-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('1185', 'fa-circle-o-notch', '3');
INSERT INTO `aos_ge_icon` VALUES ('1197', 'fa-circle-thin', '3');
INSERT INTO `aos_ge_icon` VALUES ('973', 'fa-clipboard', '3');
INSERT INTO `aos_ge_icon` VALUES ('787', 'fa-clock-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('935', 'fa-cloud', '3');
INSERT INTO `aos_ge_icon` VALUES ('976', 'fa-cloud-download', '3');
INSERT INTO `aos_ge_icon` VALUES ('977', 'fa-cloud-upload', '3');
INSERT INTO `aos_ge_icon` VALUES ('1022', 'fa-code', '3');
INSERT INTO `aos_ge_icon` VALUES ('1027', 'fa-code-fork', '3');
INSERT INTO `aos_ge_icon` VALUES ('1182', 'fa-codepen', '3');
INSERT INTO `aos_ge_icon` VALUES ('982', 'fa-coffee', '3');
INSERT INTO `aos_ge_icon` VALUES ('783', 'fa-cog', '3');
INSERT INTO `aos_ge_icon` VALUES ('890', 'fa-cogs', '3');
INSERT INTO `aos_ge_icon` VALUES ('959', 'fa-columns', '3');
INSERT INTO `aos_ge_icon` VALUES ('875', 'fa-comment', '3');
INSERT INTO `aos_ge_icon` VALUES ('968', 'fa-comment-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('891', 'fa-comments', '3');
INSERT INTO `aos_ge_icon` VALUES ('969', 'fa-comments-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('1065', 'fa-compass', '3');
INSERT INTO `aos_ge_icon` VALUES ('861', 'fa-compress', '3');
INSERT INTO `aos_ge_icon` VALUES ('1225', 'fa-copyright', '3');
INSERT INTO `aos_ge_icon` VALUES ('913', 'fa-credit-card', '3');
INSERT INTO `aos_ge_icon` VALUES ('1026', 'fa-crop', '3');
INSERT INTO `aos_ge_icon` VALUES ('851', 'fa-crosshairs', '3');
INSERT INTO `aos_ge_icon` VALUES ('1048', 'fa-css3', '3');
INSERT INTO `aos_ge_icon` VALUES ('1158', 'fa-cube', '3');
INSERT INTO `aos_ge_icon` VALUES ('1159', 'fa-cubes', '3');
INSERT INTO `aos_ge_icon` VALUES ('983', 'fa-cutlery', '3');
INSERT INTO `aos_ge_icon` VALUES ('1171', 'fa-database', '3');
INSERT INTO `aos_ge_icon` VALUES ('1146', 'fa-delicious', '3');
INSERT INTO `aos_ge_icon` VALUES ('1001', 'fa-desktop', '3');
INSERT INTO `aos_ge_icon` VALUES ('1169', 'fa-deviantart', '3');
INSERT INTO `aos_ge_icon` VALUES ('1147', 'fa-digg', '3');
INSERT INTO `aos_ge_icon` VALUES ('1128', 'fa-dot-circle-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('789', 'fa-download', '3');
INSERT INTO `aos_ge_icon` VALUES ('1109', 'fa-dribbble', '3');
INSERT INTO `aos_ge_icon` VALUES ('1092', 'fa-dropbox', '3');
INSERT INTO `aos_ge_icon` VALUES ('1150', 'fa-drupal', '3');
INSERT INTO `aos_ge_icon` VALUES ('842', 'fa-eject', '3');
INSERT INTO `aos_ge_icon` VALUES ('1052', 'fa-ellipsis-h', '3');
INSERT INTO `aos_ge_icon` VALUES ('1053', 'fa-ellipsis-v', '3');
INSERT INTO `aos_ge_icon` VALUES ('1187', 'fa-empire', '3');
INSERT INTO `aos_ge_icon` VALUES ('963', 'fa-envelope', '3');
INSERT INTO `aos_ge_icon` VALUES ('768', 'fa-envelope-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('1135', 'fa-envelope-square', '3');
INSERT INTO `aos_ge_icon` VALUES ('1034', 'fa-eraser', '3');
INSERT INTO `aos_ge_icon` VALUES ('1069', 'fa-eur', '3');
INSERT INTO `aos_ge_icon` VALUES ('975', 'fa-exchange', '3');
INSERT INTO `aos_ge_icon` VALUES ('1031', 'fa-exclamation', '3');
INSERT INTO `aos_ge_icon` VALUES ('865', 'fa-exclamation-circle', '3');
INSERT INTO `aos_ge_icon` VALUES ('871', 'fa-exclamation-triangle', '3');
INSERT INTO `aos_ge_icon` VALUES ('860', 'fa-expand', '3');
INSERT INTO `aos_ge_icon` VALUES ('899', 'fa-external-link', '3');
INSERT INTO `aos_ge_icon` VALUES ('1063', 'fa-external-link-square', '3');
INSERT INTO `aos_ge_icon` VALUES ('869', 'fa-eye', '3');
INSERT INTO `aos_ge_icon` VALUES ('870', 'fa-eye-slash', '3');
INSERT INTO `aos_ge_icon` VALUES ('1227', 'fa-eyedropper', '3');
INSERT INTO `aos_ge_icon` VALUES ('910', 'fa-facebook', '3');
INSERT INTO `aos_ge_icon` VALUES ('887', 'fa-facebook-square', '3');
INSERT INTO `aos_ge_icon` VALUES ('834', 'fa-fast-backward', '3');
INSERT INTO `aos_ge_icon` VALUES ('840', 'fa-fast-forward', '3');
INSERT INTO `aos_ge_icon` VALUES ('1153', 'fa-fax', '3');
INSERT INTO `aos_ge_icon` VALUES ('1113', 'fa-female', '3');
INSERT INTO `aos_ge_icon` VALUES ('989', 'fa-fighter-jet', '3');
INSERT INTO `aos_ge_icon` VALUES ('1077', 'fa-file', '3');
INSERT INTO `aos_ge_icon` VALUES ('1177', 'fa-file-archive-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('1178', 'fa-file-audio-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('1180', 'fa-file-code-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('1174', 'fa-file-excel-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('1176', 'fa-file-image-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('786', 'fa-file-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('1172', 'fa-file-pdf-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('1175', 'fa-file-powerpoint-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('1078', 'fa-file-text', '3');
INSERT INTO `aos_ge_icon` VALUES ('984', 'fa-file-text-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('1179', 'fa-file-video-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('1173', 'fa-file-word-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('938', 'fa-files-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('773', 'fa-film', '3');
INSERT INTO `aos_ge_icon` VALUES ('930', 'fa-filter', '3');
INSERT INTO `aos_ge_icon` VALUES ('868', 'fa-fire', '3');
INSERT INTO `aos_ge_icon` VALUES ('1040', 'fa-fire-extinguisher', '3');
INSERT INTO `aos_ge_icon` VALUES ('798', 'fa-flag', '3');
INSERT INTO `aos_ge_icon` VALUES ('1020', 'fa-flag-checkered', '3');
INSERT INTO `aos_ge_icon` VALUES ('1019', 'fa-flag-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('936', 'fa-flask', '3');
INSERT INTO `aos_ge_icon` VALUES ('1095', 'fa-flickr', '3');
INSERT INTO `aos_ge_icon` VALUES ('940', 'fa-floppy-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('881', 'fa-folder', '3');
INSERT INTO `aos_ge_icon` VALUES ('1012', 'fa-folder-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('882', 'fa-folder-open', '3');
INSERT INTO `aos_ge_icon` VALUES ('1013', 'fa-folder-open-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('811', 'fa-font', '3');
INSERT INTO `aos_ge_icon` VALUES ('839', 'fa-forward', '3');
INSERT INTO `aos_ge_icon` VALUES ('1111', 'fa-foursquare', '3');
INSERT INTO `aos_ge_icon` VALUES ('1015', 'fa-frown-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('1204', 'fa-futbol-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('1017', 'fa-gamepad', '3');
INSERT INTO `aos_ge_icon` VALUES ('966', 'fa-gavel', '3');
INSERT INTO `aos_ge_icon` VALUES ('1070', 'fa-gbp', '3');
INSERT INTO `aos_ge_icon` VALUES ('866', 'fa-gift', '3');
INSERT INTO `aos_ge_icon` VALUES ('1189', 'fa-git', '3');
INSERT INTO `aos_ge_icon` VALUES ('1188', 'fa-git-square', '3');
INSERT INTO `aos_ge_icon` VALUES ('911', 'fa-github', '3');
INSERT INTO `aos_ge_icon` VALUES ('1011', 'fa-github-alt', '3');
INSERT INTO `aos_ge_icon` VALUES ('902', 'fa-github-square', '3');
INSERT INTO `aos_ge_icon` VALUES ('1115', 'fa-gittip', '3');
INSERT INTO `aos_ge_icon` VALUES ('765', 'fa-glass', '3');
INSERT INTO `aos_ge_icon` VALUES ('927', 'fa-globe', '3');
INSERT INTO `aos_ge_icon` VALUES ('1141', 'fa-google', '3');
INSERT INTO `aos_ge_icon` VALUES ('953', 'fa-google-plus', '3');
INSERT INTO `aos_ge_icon` VALUES ('952', 'fa-google-plus-square', '3');
INSERT INTO `aos_ge_icon` VALUES ('1215', 'fa-google-wallet', '3');
INSERT INTO `aos_ge_icon` VALUES ('1139', 'fa-graduation-cap', '3');
INSERT INTO `aos_ge_icon` VALUES ('991', 'fa-h-square', '3');
INSERT INTO `aos_ge_icon` VALUES ('1190', 'fa-hacker-news', '3');
INSERT INTO `aos_ge_icon` VALUES ('922', 'fa-hand-o-down', '3');
INSERT INTO `aos_ge_icon` VALUES ('920', 'fa-hand-o-left', '3');
INSERT INTO `aos_ge_icon` VALUES ('919', 'fa-hand-o-right', '3');
INSERT INTO `aos_ge_icon` VALUES ('921', 'fa-hand-o-up', '3');
INSERT INTO `aos_ge_icon` VALUES ('915', 'fa-hdd-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('1198', 'fa-header', '3');
INSERT INTO `aos_ge_icon` VALUES ('799', 'fa-headphones', '3');
INSERT INTO `aos_ge_icon` VALUES ('769', 'fa-heart', '3');
INSERT INTO `aos_ge_icon` VALUES ('895', 'fa-heart-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('1196', 'fa-history', '3');
INSERT INTO `aos_ge_icon` VALUES ('785', 'fa-home', '3');
INSERT INTO `aos_ge_icon` VALUES ('986', 'fa-hospital-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('1047', 'fa-html5', '3');
INSERT INTO `aos_ge_icon` VALUES ('1242', 'fa-ils', '3');
INSERT INTO `aos_ge_icon` VALUES ('792', 'fa-inbox', '3');
INSERT INTO `aos_ge_icon` VALUES ('822', 'fa-indent', '3');
INSERT INTO `aos_ge_icon` VALUES ('1030', 'fa-info', '3');
INSERT INTO `aos_ge_icon` VALUES ('850', 'fa-info-circle', '3');
INSERT INTO `aos_ge_icon` VALUES ('1072', 'fa-inr', '3');
INSERT INTO `aos_ge_icon` VALUES ('1094', 'fa-instagram', '3');
INSERT INTO `aos_ge_icon` VALUES ('1239', 'fa-ioxhost', '3');
INSERT INTO `aos_ge_icon` VALUES ('813', 'fa-italic', '3');
INSERT INTO `aos_ge_icon` VALUES ('1151', 'fa-joomla', '3');
INSERT INTO `aos_ge_icon` VALUES ('1073', 'fa-jpy', '3');
INSERT INTO `aos_ge_icon` VALUES ('1183', 'fa-jsfiddle', '3');
INSERT INTO `aos_ge_icon` VALUES ('889', 'fa-key', '3');
INSERT INTO `aos_ge_icon` VALUES ('1018', 'fa-keyboard-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('1075', 'fa-krw', '3');
INSERT INTO `aos_ge_icon` VALUES ('1152', 'fa-language', '3');
INSERT INTO `aos_ge_icon` VALUES ('1002', 'fa-laptop', '3');
INSERT INTO `aos_ge_icon` VALUES ('1233', 'fa-lastfm', '3');
INSERT INTO `aos_ge_icon` VALUES ('1234', 'fa-lastfm-square', '3');
INSERT INTO `aos_ge_icon` VALUES ('867', 'fa-leaf', '3');
INSERT INTO `aos_ge_icon` VALUES ('904', 'fa-lemon-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('1060', 'fa-level-down', '3');
INSERT INTO `aos_ge_icon` VALUES ('1059', 'fa-level-up', '3');
INSERT INTO `aos_ge_icon` VALUES ('1184', 'fa-life-ring', '3');
INSERT INTO `aos_ge_icon` VALUES ('974', 'fa-lightbulb-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('1232', 'fa-line-chart', '3');
INSERT INTO `aos_ge_icon` VALUES ('934', 'fa-link', '3');
INSERT INTO `aos_ge_icon` VALUES ('964', 'fa-linkedin', '3');
INSERT INTO `aos_ge_icon` VALUES ('897', 'fa-linkedin-square', '3');
INSERT INTO `aos_ge_icon` VALUES ('1108', 'fa-linux', '3');
INSERT INTO `aos_ge_icon` VALUES ('820', 'fa-list', '3');
INSERT INTO `aos_ge_icon` VALUES ('796', 'fa-list-alt', '3');
INSERT INTO `aos_ge_icon` VALUES ('944', 'fa-list-ol', '3');
INSERT INTO `aos_ge_icon` VALUES ('943', 'fa-list-ul', '3');
INSERT INTO `aos_ge_icon` VALUES ('1025', 'fa-location-arrow', '3');
INSERT INTO `aos_ge_icon` VALUES ('797', 'fa-lock', '3');
INSERT INTO `aos_ge_icon` VALUES ('1101', 'fa-long-arrow-down', '3');
INSERT INTO `aos_ge_icon` VALUES ('1103', 'fa-long-arrow-left', '3');
INSERT INTO `aos_ge_icon` VALUES ('1104', 'fa-long-arrow-right', '3');
INSERT INTO `aos_ge_icon` VALUES ('1102', 'fa-long-arrow-up', '3');
INSERT INTO `aos_ge_icon` VALUES ('948', 'fa-magic', '3');
INSERT INTO `aos_ge_icon` VALUES ('876', 'fa-magnet', '3');
INSERT INTO `aos_ge_icon` VALUES ('1114', 'fa-male', '3');
INSERT INTO `aos_ge_icon` VALUES ('826', 'fa-map-marker', '3');
INSERT INTO `aos_ge_icon` VALUES ('1042', 'fa-maxcdn', '3');
INSERT INTO `aos_ge_icon` VALUES ('1243', 'fa-meanpath', '3');
INSERT INTO `aos_ge_icon` VALUES ('988', 'fa-medkit', '3');
INSERT INTO `aos_ge_icon` VALUES ('1016', 'fa-meh-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('1036', 'fa-microphone', '3');
INSERT INTO `aos_ge_icon` VALUES ('1037', 'fa-microphone-slash', '3');
INSERT INTO `aos_ge_icon` VALUES ('863', 'fa-minus', '3');
INSERT INTO `aos_ge_icon` VALUES ('846', 'fa-minus-circle', '3');
INSERT INTO `aos_ge_icon` VALUES ('1057', 'fa-minus-square', '3');
INSERT INTO `aos_ge_icon` VALUES ('1058', 'fa-minus-square-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('1004', 'fa-mobile', '3');
INSERT INTO `aos_ge_icon` VALUES ('954', 'fa-money', '3');
INSERT INTO `aos_ge_icon` VALUES ('1117', 'fa-moon-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('766', 'fa-music', '3');
INSERT INTO `aos_ge_icon` VALUES ('1211', 'fa-newspaper-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('1137', 'fa-openid', '3');
INSERT INTO `aos_ge_icon` VALUES ('821', 'fa-outdent', '3');
INSERT INTO `aos_ge_icon` VALUES ('1123', 'fa-pagelines', '3');
INSERT INTO `aos_ge_icon` VALUES ('1228', 'fa-paint-brush', '3');
INSERT INTO `aos_ge_icon` VALUES ('1194', 'fa-paper-plane', '3');
INSERT INTO `aos_ge_icon` VALUES ('1195', 'fa-paper-plane-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('939', 'fa-paperclip', '3');
INSERT INTO `aos_ge_icon` VALUES ('1199', 'fa-paragraph', '3');
INSERT INTO `aos_ge_icon` VALUES ('837', 'fa-pause', '3');
INSERT INTO `aos_ge_icon` VALUES ('1156', 'fa-paw', '3');
INSERT INTO `aos_ge_icon` VALUES ('1214', 'fa-paypal', '3');
INSERT INTO `aos_ge_icon` VALUES ('825', 'fa-pencil', '3');
INSERT INTO `aos_ge_icon` VALUES ('1062', 'fa-pencil-square', '3');
INSERT INTO `aos_ge_icon` VALUES ('829', 'fa-pencil-square-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('905', 'fa-phone', '3');
INSERT INTO `aos_ge_icon` VALUES ('908', 'fa-phone-square', '3');
INSERT INTO `aos_ge_icon` VALUES ('824', 'fa-picture-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('1231', 'fa-pie-chart', '3');
INSERT INTO `aos_ge_icon` VALUES ('1148', 'fa-pied-piper', '3');
INSERT INTO `aos_ge_icon` VALUES ('1149', 'fa-pied-piper-alt', '3');
INSERT INTO `aos_ge_icon` VALUES ('950', 'fa-pinterest', '3');
INSERT INTO `aos_ge_icon` VALUES ('951', 'fa-pinterest-square', '3');
INSERT INTO `aos_ge_icon` VALUES ('872', 'fa-plane', '3');
INSERT INTO `aos_ge_icon` VALUES ('836', 'fa-play', '3');
INSERT INTO `aos_ge_icon` VALUES ('1055', 'fa-play-circle', '3');
INSERT INTO `aos_ge_icon` VALUES ('793', 'fa-play-circle-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('1207', 'fa-plug', '3');
INSERT INTO `aos_ge_icon` VALUES ('862', 'fa-plus', '3');
INSERT INTO `aos_ge_icon` VALUES ('845', 'fa-plus-circle', '3');
INSERT INTO `aos_ge_icon` VALUES ('992', 'fa-plus-square', '3');
INSERT INTO `aos_ge_icon` VALUES ('1132', 'fa-plus-square-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('781', 'fa-power-off', '3');
INSERT INTO `aos_ge_icon` VALUES ('809', 'fa-print', '3');
INSERT INTO `aos_ge_icon` VALUES ('1035', 'fa-puzzle-piece', '3');
INSERT INTO `aos_ge_icon` VALUES ('1192', 'fa-qq', '3');
INSERT INTO `aos_ge_icon` VALUES ('803', 'fa-qrcode', '3');
INSERT INTO `aos_ge_icon` VALUES ('1029', 'fa-question', '3');
INSERT INTO `aos_ge_icon` VALUES ('849', 'fa-question-circle', '3');
INSERT INTO `aos_ge_icon` VALUES ('1006', 'fa-quote-left', '3');
INSERT INTO `aos_ge_icon` VALUES ('1007', 'fa-quote-right', '3');
INSERT INTO `aos_ge_icon` VALUES ('874', 'fa-random', '3');
INSERT INTO `aos_ge_icon` VALUES ('1186', 'fa-rebel', '3');
INSERT INTO `aos_ge_icon` VALUES ('1164', 'fa-recycle', '3');
INSERT INTO `aos_ge_icon` VALUES ('1142', 'fa-reddit', '3');
INSERT INTO `aos_ge_icon` VALUES ('1143', 'fa-reddit-square', '3');
INSERT INTO `aos_ge_icon` VALUES ('795', 'fa-refresh', '3');
INSERT INTO `aos_ge_icon` VALUES ('1122', 'fa-renren', '3');
INSERT INTO `aos_ge_icon` VALUES ('794', 'fa-repeat', '3');
INSERT INTO `aos_ge_icon` VALUES ('1010', 'fa-reply', '3');
INSERT INTO `aos_ge_icon` VALUES ('1023', 'fa-reply-all', '3');
INSERT INTO `aos_ge_icon` VALUES ('879', 'fa-retweet', '3');
INSERT INTO `aos_ge_icon` VALUES ('788', 'fa-road', '3');
INSERT INTO `aos_ge_icon` VALUES ('1041', 'fa-rocket', '3');
INSERT INTO `aos_ge_icon` VALUES ('914', 'fa-rss', '3');
INSERT INTO `aos_ge_icon` VALUES ('1054', 'fa-rss-square', '3');
INSERT INTO `aos_ge_icon` VALUES ('1074', 'fa-rub', '3');
INSERT INTO `aos_ge_icon` VALUES ('937', 'fa-scissors', '3');
INSERT INTO `aos_ge_icon` VALUES ('767', 'fa-search', '3');
INSERT INTO `aos_ge_icon` VALUES ('780', 'fa-search-minus', '3');
INSERT INTO `aos_ge_icon` VALUES ('779', 'fa-search-plus', '3');
INSERT INTO `aos_ge_icon` VALUES ('859', 'fa-share', '3');
INSERT INTO `aos_ge_icon` VALUES ('1201', 'fa-share-alt', '3');
INSERT INTO `aos_ge_icon` VALUES ('1202', 'fa-share-alt-square', '3');
INSERT INTO `aos_ge_icon` VALUES ('1064', 'fa-share-square', '3');
INSERT INTO `aos_ge_icon` VALUES ('830', 'fa-share-square-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('1038', 'fa-shield', '3');
INSERT INTO `aos_ge_icon` VALUES ('880', 'fa-shopping-cart', '3');
INSERT INTO `aos_ge_icon` VALUES ('900', 'fa-sign-in', '3');
INSERT INTO `aos_ge_icon` VALUES ('896', 'fa-sign-out', '3');
INSERT INTO `aos_ge_icon` VALUES ('782', 'fa-signal', '3');
INSERT INTO `aos_ge_icon` VALUES ('971', 'fa-sitemap', '3');
INSERT INTO `aos_ge_icon` VALUES ('1110', 'fa-skype', '3');
INSERT INTO `aos_ge_icon` VALUES ('1134', 'fa-slack', '3');
INSERT INTO `aos_ge_icon` VALUES ('1200', 'fa-sliders', '3');
INSERT INTO `aos_ge_icon` VALUES ('1208', 'fa-slideshare', '3');
INSERT INTO `aos_ge_icon` VALUES ('1014', 'fa-smile-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('960', 'fa-sort', '3');
INSERT INTO `aos_ge_icon` VALUES ('1079', 'fa-sort-alpha-asc', '3');
INSERT INTO `aos_ge_icon` VALUES ('1080', 'fa-sort-alpha-desc', '3');
INSERT INTO `aos_ge_icon` VALUES ('1081', 'fa-sort-amount-asc', '3');
INSERT INTO `aos_ge_icon` VALUES ('1082', 'fa-sort-amount-desc', '3');
INSERT INTO `aos_ge_icon` VALUES ('962', 'fa-sort-asc', '3');
INSERT INTO `aos_ge_icon` VALUES ('961', 'fa-sort-desc', '3');
INSERT INTO `aos_ge_icon` VALUES ('1083', 'fa-sort-numeric-asc', '3');
INSERT INTO `aos_ge_icon` VALUES ('1084', 'fa-sort-numeric-desc', '3');
INSERT INTO `aos_ge_icon` VALUES ('1170', 'fa-soundcloud', '3');
INSERT INTO `aos_ge_icon` VALUES ('1133', 'fa-space-shuttle', '3');
INSERT INTO `aos_ge_icon` VALUES ('1008', 'fa-spinner', '3');
INSERT INTO `aos_ge_icon` VALUES ('1157', 'fa-spoon', '3');
INSERT INTO `aos_ge_icon` VALUES ('1168', 'fa-spotify', '3');
INSERT INTO `aos_ge_icon` VALUES ('941', 'fa-square', '3');
INSERT INTO `aos_ge_icon` VALUES ('906', 'fa-square-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('1124', 'fa-stack-exchange', '3');
INSERT INTO `aos_ge_icon` VALUES ('1093', 'fa-stack-overflow', '3');
INSERT INTO `aos_ge_icon` VALUES ('770', 'fa-star', '3');
INSERT INTO `aos_ge_icon` VALUES ('894', 'fa-star-half', '3');
INSERT INTO `aos_ge_icon` VALUES ('1024', 'fa-star-half-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('771', 'fa-star-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('1162', 'fa-steam', '3');
INSERT INTO `aos_ge_icon` VALUES ('1163', 'fa-steam-square', '3');
INSERT INTO `aos_ge_icon` VALUES ('833', 'fa-step-backward', '3');
INSERT INTO `aos_ge_icon` VALUES ('841', 'fa-step-forward', '3');
INSERT INTO `aos_ge_icon` VALUES ('979', 'fa-stethoscope', '3');
INSERT INTO `aos_ge_icon` VALUES ('838', 'fa-stop', '3');
INSERT INTO `aos_ge_icon` VALUES ('945', 'fa-strikethrough', '3');
INSERT INTO `aos_ge_icon` VALUES ('1145', 'fa-stumbleupon', '3');
INSERT INTO `aos_ge_icon` VALUES ('1144', 'fa-stumbleupon-circle', '3');
INSERT INTO `aos_ge_icon` VALUES ('1033', 'fa-subscript', '3');
INSERT INTO `aos_ge_icon` VALUES ('980', 'fa-suitcase', '3');
INSERT INTO `aos_ge_icon` VALUES ('1116', 'fa-sun-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('1032', 'fa-superscript', '3');
INSERT INTO `aos_ge_icon` VALUES ('947', 'fa-table', '3');
INSERT INTO `aos_ge_icon` VALUES ('1003', 'fa-tablet', '3');
INSERT INTO `aos_ge_icon` VALUES ('967', 'fa-tachometer', '3');
INSERT INTO `aos_ge_icon` VALUES ('805', 'fa-tag', '3');
INSERT INTO `aos_ge_icon` VALUES ('806', 'fa-tags', '3');
INSERT INTO `aos_ge_icon` VALUES ('929', 'fa-tasks', '3');
INSERT INTO `aos_ge_icon` VALUES ('1166', 'fa-taxi', '3');
INSERT INTO `aos_ge_icon` VALUES ('1191', 'fa-tencent-weibo', '3');
INSERT INTO `aos_ge_icon` VALUES ('1021', 'fa-terminal', '3');
INSERT INTO `aos_ge_icon` VALUES ('814', 'fa-text-height', '3');
INSERT INTO `aos_ge_icon` VALUES ('815', 'fa-text-width', '3');
INSERT INTO `aos_ge_icon` VALUES ('775', 'fa-th', '3');
INSERT INTO `aos_ge_icon` VALUES ('774', 'fa-th-large', '3');
INSERT INTO `aos_ge_icon` VALUES ('776', 'fa-th-list', '3');
INSERT INTO `aos_ge_icon` VALUES ('898', 'fa-thumb-tack', '3');
INSERT INTO `aos_ge_icon` VALUES ('1086', 'fa-thumbs-down', '3');
INSERT INTO `aos_ge_icon` VALUES ('893', 'fa-thumbs-o-down', '3');
INSERT INTO `aos_ge_icon` VALUES ('892', 'fa-thumbs-o-up', '3');
INSERT INTO `aos_ge_icon` VALUES ('1085', 'fa-thumbs-up', '3');
INSERT INTO `aos_ge_icon` VALUES ('1056', 'fa-ticket', '3');
INSERT INTO `aos_ge_icon` VALUES ('778', 'fa-times', '3');
INSERT INTO `aos_ge_icon` VALUES ('847', 'fa-times-circle', '3');
INSERT INTO `aos_ge_icon` VALUES ('852', 'fa-times-circle-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('828', 'fa-tint', '3');
INSERT INTO `aos_ge_icon` VALUES ('1235', 'fa-toggle-off', '3');
INSERT INTO `aos_ge_icon` VALUES ('1236', 'fa-toggle-on', '3');
INSERT INTO `aos_ge_icon` VALUES ('1224', 'fa-trash', '3');
INSERT INTO `aos_ge_icon` VALUES ('784', 'fa-trash-o', '3');
INSERT INTO `aos_ge_icon` VALUES ('1167', 'fa-tree', '3');
INSERT INTO `aos_ge_icon` VALUES ('1112', 'fa-trello', '3');
INSERT INTO `aos_ge_icon` VALUES ('901', 'fa-trophy', '3');
INSERT INTO `aos_ge_icon` VALUES ('949', 'fa-truck', '3');
INSERT INTO `aos_ge_icon` VALUES ('1131', 'fa-try', '3');
INSERT INTO `aos_ge_icon` VALUES ('1205', 'fa-tty', '3');
INSERT INTO `aos_ge_icon` VALUES ('1099', 'fa-tumblr', '3');
INSERT INTO `aos_ge_icon` VALUES ('1100', 'fa-tumblr-square', '3');
INSERT INTO `aos_ge_icon` VALUES ('1209', 'fa-twitch', '3');
INSERT INTO `aos_ge_icon` VALUES ('909', 'fa-twitter', '3');
INSERT INTO `aos_ge_icon` VALUES ('886', 'fa-twitter-square', '3');
INSERT INTO `aos_ge_icon` VALUES ('972', 'fa-umbrella', '3');
INSERT INTO `aos_ge_icon` VALUES ('946', 'fa-underline', '3');
INSERT INTO `aos_ge_icon` VALUES ('965', 'fa-undo', '3');
INSERT INTO `aos_ge_icon` VALUES ('1138', 'fa-university', '3');
INSERT INTO `aos_ge_icon` VALUES ('912', 'fa-unlock', '3');
INSERT INTO `aos_ge_icon` VALUES ('1050', 'fa-unlock-alt', '3');
INSERT INTO `aos_ge_icon` VALUES ('903', 'fa-upload', '3');
INSERT INTO `aos_ge_icon` VALUES ('1071', 'fa-usd', '3');
INSERT INTO `aos_ge_icon` VALUES ('772', 'fa-user', '3');
INSERT INTO `aos_ge_icon` VALUES ('978', 'fa-user-md', '3');
INSERT INTO `aos_ge_icon` VALUES ('933', 'fa-users', '3');
INSERT INTO `aos_ge_icon` VALUES ('823', 'fa-video-camera', '3');
INSERT INTO `aos_ge_icon` VALUES ('1130', 'fa-vimeo-square', '3');
INSERT INTO `aos_ge_icon` VALUES ('1181', 'fa-vine', '3');
INSERT INTO `aos_ge_icon` VALUES ('1120', 'fa-vk', '3');
INSERT INTO `aos_ge_icon` VALUES ('801', 'fa-volume-down', '3');
INSERT INTO `aos_ge_icon` VALUES ('800', 'fa-volume-off', '3');
INSERT INTO `aos_ge_icon` VALUES ('802', 'fa-volume-up', '3');
INSERT INTO `aos_ge_icon` VALUES ('1121', 'fa-weibo', '3');
INSERT INTO `aos_ge_icon` VALUES ('1193', 'fa-weixin', '3');
INSERT INTO `aos_ge_icon` VALUES ('1129', 'fa-wheelchair', '3');
INSERT INTO `aos_ge_icon` VALUES ('1212', 'fa-wifi', '3');
INSERT INTO `aos_ge_icon` VALUES ('1106', 'fa-windows', '3');
INSERT INTO `aos_ge_icon` VALUES ('1136', 'fa-wordpress', '3');
INSERT INTO `aos_ge_icon` VALUES ('928', 'fa-wrench', '3');
INSERT INTO `aos_ge_icon` VALUES ('1089', 'fa-xing', '3');
INSERT INTO `aos_ge_icon` VALUES ('1090', 'fa-xing-square', '3');
INSERT INTO `aos_ge_icon` VALUES ('1140', 'fa-yahoo', '3');
INSERT INTO `aos_ge_icon` VALUES ('1210', 'fa-yelp', '3');
INSERT INTO `aos_ge_icon` VALUES ('1088', 'fa-youtube', '3');
INSERT INTO `aos_ge_icon` VALUES ('1091', 'fa-youtube-play', '3');
INSERT INTO `aos_ge_icon` VALUES ('1087', 'fa-youtube-square', '3');
INSERT INTO `aos_ge_icon` VALUES ('6993', 'folder1.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6994', 'folder10.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6995', 'folder11.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6996', 'folder12.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6997', 'folder13.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6998', 'folder14.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('6999', 'folder15.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7000', 'folder16.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7001', 'folder17.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7002', 'folder18.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7003', 'folder19.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7004', 'folder2.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7005', 'folder20.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7006', 'folder21.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7007', 'folder22.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7008', 'folder23.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7009', 'folder24.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7010', 'folder25.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7011', 'folder26.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7012', 'folder27.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7013', 'folder28.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7014', 'folder4.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7015', 'folder5.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7016', 'folder6.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7017', 'folder7.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7018', 'folder8.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7019', 'folder9.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7020', 'forward.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7021', 'freelance.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7022', 'go.gif', '1');
INSERT INTO `aos_ge_icon` VALUES ('7023', 'go.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7024', 'go1.gif', '1');
INSERT INTO `aos_ge_icon` VALUES ('7025', 'go1.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7026', 'help.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7027', 'home.gif', '1');
INSERT INTO `aos_ge_icon` VALUES ('7028', 'home.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7029', 'icon134.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7030', 'icon137.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7031', 'icon140.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7032', 'icon141.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7033', 'icon146.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7034', 'icon15.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7035', 'icon150.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7036', 'icon152.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7037', 'icon153.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7038', 'icon154.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7039', 'icon17.gif', '1');
INSERT INTO `aos_ge_icon` VALUES ('7040', 'icon25.gif', '1');
INSERT INTO `aos_ge_icon` VALUES ('7041', 'icon26.gif', '1');
INSERT INTO `aos_ge_icon` VALUES ('7042', 'icon28.gif', '1');
INSERT INTO `aos_ge_icon` VALUES ('7043', 'icon31.gif', '1');
INSERT INTO `aos_ge_icon` VALUES ('7044', 'icon32.gif', '1');
INSERT INTO `aos_ge_icon` VALUES ('7045', 'icon34.gif', '1');
INSERT INTO `aos_ge_icon` VALUES ('7046', 'icon35.gif', '1');
INSERT INTO `aos_ge_icon` VALUES ('7047', 'icon36.gif', '1');
INSERT INTO `aos_ge_icon` VALUES ('7048', 'icon37.gif', '1');
INSERT INTO `aos_ge_icon` VALUES ('7049', 'icon38.gif', '1');
INSERT INTO `aos_ge_icon` VALUES ('7050', 'icon39.gif', '1');
INSERT INTO `aos_ge_icon` VALUES ('7051', 'icon41.gif', '1');
INSERT INTO `aos_ge_icon` VALUES ('7052', 'icon42.gif', '1');
INSERT INTO `aos_ge_icon` VALUES ('7053', 'icon5.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7054', 'icon56.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7055', 'icon59.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7056', 'icon62.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7057', 'icon63.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7058', 'icon65.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7059', 'icon66.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7060', 'icon67.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7061', 'icon68.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7062', 'icon7.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7063', 'icon70.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7064', 'icon71.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7065', 'icon72.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7066', 'icon75.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7067', 'icon76.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7068', 'icon77.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7069', 'icon78.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7070', 'icon79.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7071', 'icon8.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7072', 'icon80.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7073', 'icon82.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7074', 'icon85.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7075', 'icon86.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7076', 'icon88.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7077', 'icon9.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7078', 'icon96.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7079', 'icon_19.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7080', 'icq.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7081', 'id.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7082', 'jar.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7083', 'key.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7084', 'layout.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7085', 'layout2.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7086', 'lightbulb.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7087', 'lock.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7088', 'lock3.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7089', 'monitor.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7090', 'node.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7091', 'ok.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7092', 'ok1.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7093', 'ok2.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7094', 'ok3.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7095', 'ok4.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7096', 'ok5.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7097', 'org.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7098', 'org2.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7099', 'own.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7100', 'pages.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7101', 'page_code.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7102', 'page_font.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7103', 'page_next.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7104', 'page_office.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7105', 'page_paint.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7106', 'page_picture.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7107', 'page_vector.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7108', 'paint2.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7109', 'paste.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7110', 'picture.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7111', 'pictures.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7112', 'picture_empty.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7113', 'plugin.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7114', 'plugin1.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7115', 'plugin2.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7116', 'printer.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7117', 'query.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7118', 'refresh.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7119', 'refresh1.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7120', 'save.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7121', 'save_all.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7122', 'search.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7123', 'security.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7124', 'send_receive.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7125', 'shape_align_bottom.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7126', 'shape_align_center.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7127', 'shape_align_middle.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7128', 'shape_group.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7129', 'shape_handles.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7130', 'shape_move_back.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7131', 'share.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7132', 'sitemap.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7133', 'sql.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7134', 'sql2.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7135', 'sql3.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7136', 'stop.gif', '1');
INSERT INTO `aos_ge_icon` VALUES ('7137', 'stop2.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7138', 'stop3.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7139', 'system.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7140', 'table.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7141', 'table2.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7142', 'tables.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7143', 'tables_relation.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7144', 'table_edit.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7145', 'tag.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7146', 'task.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7147', 'task1.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7148', 'task_finish.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7149', 'task_list.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7150', 'terminal.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7151', 'textfield.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7152', 'text_cap.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7153', 'text_col.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7154', 'text_list.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7155', 'text_upper.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7156', 'theme.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7157', 'time.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7158', 'timeline.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7159', 'user1.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7160', 'user20.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7161', 'user3.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7162', 'user6.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7163', 'user8.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7164', 'vcard.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7165', 'vector.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7166', 'wand.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7167', 'webcam.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7168', 'zoom_in.png', '1');
INSERT INTO `aos_ge_icon` VALUES ('7169', 'zoom_out.png', '1');

-- ----------------------------
-- Table structure for aos_ge_param
-- ----------------------------
DROP TABLE IF EXISTS `aos_ge_param`;
CREATE TABLE `aos_ge_param` (
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
  UNIQUE KEY `aos_ge_param_ukey` (`key_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='参数表';

-- ----------------------------
-- Records of aos_ge_param
-- ----------------------------
INSERT INTO `aos_ge_param` VALUES ('1668', 'nav_tab_index_', '1', '423', '0.001.002.004', '导航缺省活动页', '1', 'nav_tab_index_', '左侧布局的导航卡片缺省激活的卡片索引号');
INSERT INTO `aos_ge_param` VALUES ('1669', 'nav_quick_layout_', '1', '423', '0.001.002.004', '快捷菜单布局风格', '1', 'nav_quick_layout_', '快捷菜单布局风格。1:平铺。2：树状。');
INSERT INTO `aos_ge_param` VALUES ('302', 'theme_', 'classic', '413', '0.001.002.002', '系统主题风格', '1', 'theme_', '可选值：classic。缺省值：classic。');
INSERT INTO `aos_ge_param` VALUES ('303', 'layout_', 'tab', '413', '0.001.002.002', 'Center区域布局风格', '1', 'layout_', '系统业务经办区域(center)布局风格。可选值：tab|page。缺省值：tab。tab：支持同时打开多个功能模块界面；page：当前只能打开1个功能界面。');
INSERT INTO `aos_ge_param` VALUES ('35', 'skin_', 'blue', '413', '0.001.002.002', '系统缺省皮肤', '1', 'skin_', '可选值：blue|gray|neptune|aos。缺省值：blue。');
INSERT INTO `aos_ge_param` VALUES ('359', 'copyright_', '2008-2015 OSWorks', '413', '0.001.002.002', '版权信息', '0', null, '版权信息');
INSERT INTO `aos_ge_param` VALUES ('36', 'tab_focus_color_', '#0099FF', '413', '0.001.002.002', 'Tab高亮颜色', '1', 'tab_focus_color_', '缺省的当前Tab卡片高亮提示颜色');
INSERT INTO `aos_ge_param` VALUES ('363', 'app_title_', 'AOS应用基础平台', '413', '0.001.002.002', '首页浏览器标题内容', '0', null, '首页浏览器标题内容');
INSERT INTO `aos_ge_param` VALUES ('37', 'prevent_rightclick_', 'false', '414', '0.001.002.003', '全局右键', '0', null, '阻止浏览器缺省鼠标右键事件。可选值：true|false。缺省值：true。');
INSERT INTO `aos_ge_param` VALUES ('382', 'nav_mode_', '1', '423', '0.001.002.004', '导航模式', '1', 'nav_mode_', '可选值，1：水平导航按钮和垂直导航的卡片属于统一层级；2：水平导航按钮和垂直导航的卡片有上下级级联导航关系。(当前模式2未实现)');
INSERT INTO `aos_ge_param` VALUES ('389', 'is_show_top_nav_', 'true', '423', '0.001.002.004', '水平导航条', '1', 'is_show_top_nav_', '是否显示水平导航条。(只有在导航模式为1的情况，此设置才有效,导航模式为2，则水平导航条不会消失)。可选值：true| false。');
INSERT INTO `aos_ge_param` VALUES ('390', 'navbar_btn_style_', 'tight', '423', '0.001.002.004', '导航条按钮风格', '1', 'navbar_btn_style_', '顶部水平导航条的按钮样式风格。tight：组合按钮；standalone：独立按钮。');
INSERT INTO `aos_ge_param` VALUES ('408', 'login_page_', 'login-ext.jsp', '414', '0.001.002.003', '登录页面', '0', null, 'Ext原生风格的登录界面');
INSERT INTO `aos_ge_param` VALUES ('409', 'vercode_show_', '1', '410', '0.001.002.001', '验证码开关', '0', null, '是否在登录页面显示验证码及后台验证码验证。可选值：0(否) | 1(是)。');
INSERT INTO `aos_ge_param` VALUES ('411', 'vercode_length_', '4', '410', '0.001.002.001', '验证码长度', '0', null, '验证码长度');
INSERT INTO `aos_ge_param` VALUES ('412', 'vercode_characters_', 'abcdetx2345678', '410', '0.001.002.001', '验证码待选字符集', '0', null, '验证码待选字符集。');
INSERT INTO `aos_ge_param` VALUES ('415', 'login_back_img_', '-1', '413', '0.001.002.002', '登录页面的背景图片', '0', null, '登录页面的背景图片。可选的预设背景图片为：0.jpg、1.jpg、2.jpg、3.jpg。如果需要随机出现背景，则将其设置为-1。');
INSERT INTO `aos_ge_param` VALUES ('416', 'page_load_gif_', 'wheel.gif', '413', '0.001.002.002', '页面刷新动画文件', '0', null, '页面刷新动画文件。可选的预设动画文件：run.gif、wheel.gif。动画path：/static/image/gif/pageload。');
INSERT INTO `aos_ge_param` VALUES ('417', 'dev_account_', 'root', '414', '0.001.002.003', '开发者登录帐号', '0', null, '登录页面开发者按钮登录帐号。可以配置为任何一个存在的帐号。');
INSERT INTO `aos_ge_param` VALUES ('418', 'dev_account_login_', '1', '414', '0.001.002.003', '开发者登录帐号开关', '0', null, '是否启用开发者登录帐号功能,如启用则在登录界面会出现[开发者]按钮。可选值：1 | 0。提示：系统若在生产模式下运行，则此配置忽略，自动关闭开发者登录功能。');
INSERT INTO `aos_ge_param` VALUES ('419', 'welcome_page_title_', '欢迎', '413', '0.001.002.002', '欢迎页标题', '0', null, '系统登录后第一个缺省打开的Tab页面的标题。缺省：\"欢迎\"。');
INSERT INTO `aos_ge_param` VALUES ('420', 'is_show_mac_nav_', '1', '423', '0.001.002.004', 'Mac导航显示开关', '1', 'is_show_mac_nav_', '欢迎页Mac导航显示开关。可选值：0 | 1。缺省值：1。');
INSERT INTO `aos_ge_param` VALUES ('585', 'show_login_win_head_', 'true', '413', '0.001.002.002', '是否显示登录窗口标题栏', '0', null, '是否显示登录窗口标题栏(Ext登录风格)。缺省值：false。可选值：true|false。');
INSERT INTO `aos_ge_param` VALUES ('586', 'is_show_statusbar_', 'true', '413', '0.001.002.002', '是否显示主界面状态栏', '0', null, '是否显示主界面状态栏。可选值：true|false。');
INSERT INTO `aos_ge_param` VALUES ('607', 'role_grant_mode_', '1', '414', '0.001.002.003', '角色授权模式', '0', null, '角色授权模式(角色可见度)。可选值：1|2。1：可见当前管理员创建的角色和当前管理员所属组织的其他管理员创建的角色。2：可见当前管理员创建的角色和当前管理员所属组织及其下级子孙组织的其他管理员创建的角色。');
INSERT INTO `aos_ge_param` VALUES ('609', 'grid_column_algin_', 'left', '413', '0.001.002.002', '表格列内容对齐方式', '0', null, '表格列对齐模式。有效值：left|center|right。');
INSERT INTO `aos_ge_param` VALUES ('623', 'byteobj_maxsize_', '50', '414', '0.001.002.003', '流文件最大值(KB)', '0', '', '单位：KB');
INSERT INTO `aos_ge_param` VALUES ('637', 'user_head_catalog_id_', '613', '414', '0.001.002.003', '用户头像流文件分类ID', '0', null, '用户头像流文件分类ID，分类科目中的用户头像分类ID。用户上传文件时使用。');
INSERT INTO `aos_ge_param` VALUES ('74', 'app_name_', 'AOS应用基础平台', '413', '0.001.002.002', '应用系统名称', '0', '', '应用系统名称');

-- ----------------------------
-- Table structure for aos_ge_sequence
-- ----------------------------
DROP TABLE IF EXISTS `aos_ge_sequence`;
CREATE TABLE `aos_ge_sequence` (
  `id_` varchar(64) NOT NULL COMMENT '流水号',
  `name_` varchar(255) NOT NULL COMMENT '名称',
  `type_` varchar(255) default NULL COMMENT '类型',
  `prefix_` varchar(255) default NULL COMMENT '前缀\n',
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
  UNIQUE KEY `aos_ge_sequence_name_ukey` (`name_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ID配置表';

-- ----------------------------
-- Records of aos_ge_sequence
-- ----------------------------
INSERT INTO `aos_ge_sequence` VALUES ('1', 'GID', '1', null, '1', '1', '1717', '1', null, null, null, '9999999999', '0', '1', '0', '1717', '系统管理-实体表流水号。');
INSERT INTO `aos_ge_sequence` VALUES ('1635', 'ICONID', '1', null, '1', '1', '7169', '1', null, null, null, '9223372036854775807', '0', '1', '0', '7169', '图标ID');
INSERT INTO `aos_ge_sequence` VALUES ('2', 'GUUID', '2', null, '1', '1', 'bd749e4c-0512-4b01-9ef7-7f42af3812a0', '1', null, null, null, '9223372036854775807', '0', '1', '0', 'bd749e4c-0512-4b01-9ef7-7f42af3812a0', '通用UUID。');
INSERT INTO `aos_ge_sequence` VALUES ('3', 'TESTID', '1', null, '1', '1', '00000050', '1', null, null, null, '99999999', '1', '1', '1', '00000050', '测试用ID');
INSERT INTO `aos_ge_sequence` VALUES ('313', 'USERID', '1', null, '1', '1', '20', '1', null, null, null, '9223372036854775807', '0', '1', '0', '20', '用户ID');
INSERT INTO `aos_ge_sequence` VALUES ('337', 'RID', '1', null, '1', '1', '4214', '1', null, null, null, '9999999999', '0', '1', '0', '4214', '系统管理-关联表流水号。');
INSERT INTO `aos_ge_sequence` VALUES ('546', 'BPMID', '1', null, '1', '1', '118', '1', null, null, null, '9999999999', '0', '1', '0', '118', '流程引擎相关辅助表的流水号');
INSERT INTO `aos_ge_sequence` VALUES ('8', 'TESTID1', '1', 'TEST{yyyyMMdd}', '1', '1', '0059', '1', '-', '{HHmmss}', null, '9999', '1', '1', '1', 'TEST20150121-0059-005407', '测试ID，前缀后缀支持日期时间表达式。');
