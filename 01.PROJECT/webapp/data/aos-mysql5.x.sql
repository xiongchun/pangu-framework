/*
Navicat MySQL Data Transfer

Source Server         : mysql-local
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : aos

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2015-10-07 21:12:02
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='InnoDB free: 9216 kB; (`deployment_id_`) REFER `aos/aos_act';

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
INSERT INTO `aos_act_ge_property` VALUES ('next.dbid', '2501', '2');
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
-- Table structure for aos_sys_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `aos_sys_bytearray`;
CREATE TABLE `aos_sys_bytearray` (
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
  UNIQUE KEY `aos_sys_bytearray_ukey` USING BTREE (`key_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流文件表';

-- ----------------------------
-- Records of aos_sys_bytearray
-- ----------------------------
INSERT INTO `aos_sys_bytearray` VALUES ('1717', '7dbed4a3-426f-41da-8fa4-5b7d0869b4c9', 'avatar.jpg', '613', '0.004.001', 'image/jpeg', '20', 0xFFD8FFE000104A46494600010101000100010000FFDB00430006040506050406060506070706080A100A0A09090A140E0F0C1017141818171416161A1D251F1A1B231C1616202C20232627292A29191F2D302D283025282928FFDB0043010707070A080A130A0A13281A161A2828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828FFC0001108015F015F03012200021101031101FFC4001F0000010501010101010100000000000000000102030405060708090A0BFFC400B5100002010303020403050504040000017D01020300041105122131410613516107227114328191A1082342B1C11552D1F02433627282090A161718191A25262728292A3435363738393A434445464748494A535455565758595A636465666768696A737475767778797A838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F0100030101010101010101010000000000000102030405060708090A0BFFC400B51100020102040403040705040400010277000102031104052131061241510761711322328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728292A35363738393A434445464748494A535455565758595A636465666768696A737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FA4714A38A414A0F5A48029692969805252D2500145145002514A2A39655894963C5201FD3AD559678D6E103362B2B51D642F16F873D0F38C560BBC93BB49248C09E7682702A5B2A28E9751D622B657018798067158136BB76EC7628C1FCEA91407E662589F5E69878CFB56526CD63144CFABEA4C98F3147BD579756D4F6FCB2A647B714D6C542FDEB26D9AC628B0FE23D4C26D11AE7DCD45178975381879AAB22E7B75154DB926A2908ED47333554E2FA1D0DB78E951956F2DA48B9C16C647E75D3E9DAE58DF90B05C2331ED9E6BCC1829520818F4F5AA6D1341325CD9B08674E43283827DEA9546B7265878BD8F6F1C8E2910715E7BE1FF1E246EB6FADA88189DA2519DA4FA935DDD95DC1749BA0951C119F94E78ADA324CE59C1C3465803AD28EB42F4A5AA20074A423914E14DEAF4C48534E1D29A7EF53A8003D0D45FF002DDBD940A94D429F7E43FED62982245E86B175B7C46E075C63F3ADAE895CDEBAF90DCE09207EBFFD6A4CBA6B519E1F005D5D4ADD238D5474E3A93FD2B8BB3F166B526E9D2EE231BB12B1C900202E4E39041E98AE9A7B9FB078375BBDDC776C90A9E9C81B47EB5E6D60BE4D94108382A801EFC81CD4C9D91D9469A9B6D9DCDBF8D3504CFDA2CED6603BC72143F91C8FD6AE8F18D9CC9B6FB4AB800F5E1241F9673FA5702253B09C12063033FE7DA90C855F27827A8079352A6CD1E1E1D0EEC3783AF725ED6081FD4C0D0B03F500528F0DE817609B0D4E788B7FCF2BBDFF00A366B868AFC09591B3F2F396CF4AD18DE0B942648E3651C7DDEF4D34F7279271F864CE867F045CE09B4D6377A79F003FAA91FCAA8DC78575E887C8B637007F7646427F0208FD6B362956142D6D35C458381E5C8C00FC01AD0835AD46200A6A12B01FC322AB67DA9DA2C6AAD68F533AE74BD56056171A25D119FBD084907E873FA5655C0B68772DC5B4B07AFDA2DDA339FAB002BB4B7F14EA4A3F791DB4A000718646CFA7715722F176EE2E6C0EDE87CB70DFA1C52F668A58CA8B789E5DA74F6D2A86596266662D8575CE49E3F415D1786264FEDDB77565382C383D3E535D64FA8F86EFBFE3FF004D527FE9A5AEEC7E201AA234FF0009C5702E7485B78AFD39448DD909CF07E4CF3C13DA854F509E354A0E2D1E934A290528AD0F285F5A293D697B508028A28F5A2E003A514948C7009A00491C2292C702B99D62F5A593CB89C633CE2ACEAD7C58B44AADC70594D63AAE0E40FAD22921BB001EBEF4C0BB54E3BF5A94F14C20F273C54B2D10B0C0E07150BFB0AB050B1E0E39ABB6F65D09C0AC99A44C628EC0E13FFAF5048AE382A6BA816AB9271FFD7A85ECD5B20AE4566689A39366E7A7B608C1A85D863D3DEBA2BAD3863EE86FC2B3E5D39771C12A4FE46A2E6F1B190C7209069A791C0C55EB8D2490CD1641EBC74359B7115CDB72F1974E84AF51F85173443658D6552AEA1B8F4A8B4CBCB9D02F3ED1A7B130F56879DBFE4D3E39525C943D3B74228209AA40E29AB33D4FC37E22B3D6ED164B77C49FC48782A7E95B62BC1E0B89745D49350B38C305FF005B18382C3D47BFD6BD9B41D520D56C22B9B77055D41C77AE884AFA33CFAD4B91DD1A62917EF1A51447DEB430147DEA5A45E4D3A9A013B8A8A2FF00579F524FEB4F90E118FA0A6A0C228F4028042BF095CA6AEE0C8339EEDF9575174DB6363E82B8ED58EE91C77DA147D49A4CD6919FE3891AD7E1E2C608DF73246BF9B6E3FA035C35BA9696E0C872C002369E3EF0FF001AECBE2C3ECD3B48B5519C4BE611FEE8C0FE75C759124DE7CB8C00307EA2B39EE7A3845EEDFB9341A5C535B68CCB3CF1CD79230760E48E1589C03C76AD03E1726FD6396FE7922DA64D84005B19E091DBA74AABA73336A5E178B3D1669307FDD38FE75D64D93AA28C8F96139E3D7DE81CE4D3B231E5F0ED9DBCE4C50942460AAB9C1ACD93CF825984706F8F7151F3F3F4E7DFDEBB5B98F0CA73D477AE7DD0932F5C6EE001D79A6D58CA32BEE637DA1C38DD04AB81C9C647E63B5386A310FBCE32063078C9AD27B763B839CF39E9D6A236F14921665070327239FF0039C545CA6C805DAB67690C71C0EE695246037B2A8C703B9140D3213BCBA0054F6E0814E3A5308808E59377A039EFD79AB4CCDD85370189233803938239E9DA934F90FDBA35040E4923F03FFD6A81ACAE630479C0E3AEF5ED5168C09BD8DF78E7390075E0F35517A98CD5933DD294520A05339070EF4520EF453016928A2800F5AAD7D27976EE7D0559FCEB1F5E94AC4141EBC503461E33B99B24B1C9A0F434E030314841238148A430F349B3AD4A1081483D3150CA4496D08DDD39F5AD2550A302AADAFF009C55B04566CD10A0707AD1E5E476A54392453D6A52B81134008E6ABC9648C3A0CD68F6E9498CF4AAE440A4D18B25A85523154AE2D91836466B7E71C1E2B3A4232702B1946C6F0936719AAE8AC19A5B5F9255E78E87F0AC88AE77318A61B251D41EFEE2BD11D171F77A561EB7A347771965003AF391D454A76378CAFB9CDBAE4631906A7F0BEA93F87F588E38E50DA7DCB73139C056F5535497CCB6945BDDF53F71FB37B1F7A7DD5B2CC8474EE0FA1F5AD53EA394549599EDF677097108910F0466A64FBA6BCBBE1E7886482EDB4BBF0738CC72AFDD3EC47507F9D7A8A1FDDD7445DD1E6548383B0AB4EA45E94B568CC8A7FF0056C3D4814E1D45364E4A0F56CD397AD0056BF6C42D5CA9025D42241C97997F21CFF4AE97536C262B9FD1C79DAAC471C2AB3FE3D07F3A9EA6D0D22D9C8FC4FBB49B5C4B540ED2402327683800924F3D3B0AC5D3E25DD7D8181B0100FD7FC6BA3D57C2B3EB3A96ADA88D425B69A594AC081415C20DA0B7720E0F031D6B8B792F6D2E67B29EC0BDD46CB1168B74A19987CA4364773D0E2B3528CA4D23BE8D4518A4741A35986D77C30E1CEE166D95C0EEA79AEB5E1035760467F726BCEF4ED52EB4D956445569ED37411C971956519DA54A7438C7622B45FC6D7B6976B797D6A9B0008E16265CAFAA92793ED9AD12D4CA4DB77477D7B03080381DBD2B9D68D3963CB67D3AE7F5A826F88F6624314DA7DD9876821D530C01EE51B071F4CD58B1952F6DC4D1B87B794654E39A524453BF511ADF0080CA3D31DC9EF4B15B6D9643CE5B8F6079CF3E99ABCCAB95C03C607F3FD29EB8561F22E4F049E7E95162DB330DA64B2B727392D4B1DA7CE0F985947407D73FE7F3ADA684119C0EC462989085624211CFEBD2A944CF98E7F565F2AD98280777078359DA6A04BA45CFDD047E40D6B6BAC0CF1443A8E4E067E954AD233F69DD8EE7F955C51127A1EC54520A5A11CA2D14514C028A28A01087A572FAB48D2DE9563F2A8CF07AD74B70710B9F6AE447CD248C41059BBF2681A17B53803D7A5017A9A7018152D968423D7BD2639E82A50A4F34E099350D9690E8062AD0FAD431A600A9874AC99690E43C9A956A15C64F6352A1C53889A251D3DE909DA09A453CFAD23E01EF5A124537CC84D664AB86FF003CD6A311B4E0D51940CE3B565515CDA995581E3814C2323F9D4CCBCE3A5478EB58EC6C8C1D6B498EE636F906D23F23EB5CBC464B6B97B3BA3975E51FFBEBEBF51DEBD0C8E30D5CEF8A34833DB79D6B817309DE9EE4751F8D34EC691974673176B2472A5D5BB159E12194AF04F3D0D7B3785F548F56D1E1B88DB248C32F42A47504578CFDA04D6E92A70CDC6DEE0FBFE35E83E00492D646429B1251B8800E370EA6B7A6F531C44538DCEF474A5F5A051D8D7423CF236FF58A3D169CBD0D347FAC7F6005387DC3480C9D61B08DEC2B3B45DB135E5C3602451819FA649FE956F586CE47A9C5626B73FD83C0BAE5CA70ED1BAA1F73F20FD692DCDE2B4B1E6FA66A3A8BD8BC8758B98A39B74C632CBC6E627827903A743F4ADBF8736C5B58D467064369046AEBB9895323672FCF7C2F5F73582F6FFF0012F8628E431C89B029DBB80DB8232BDC640CD512249F5760B3981EEAE15655859E25D8C79000E08EA3EA6A62A3BADCEB9C34B2275D6E2BB4B88FCA8D8C92B9F364076E589232718048E715565B46974B64F2D846F31858A11B91BB1C039E319E95AFE27D2EE34D82EA3D2A278BC3C2789A68F78255B206467E6DB9C1359BA0E997DABEA79D2625B76B75617171212559CE48E3B9E47D2A9CF975642DB426D435ABFD623B65D461B55B8D34E24B8898F98C3054FCA40E09C1C7B0E6AE69FAFCF63A6C56B696E2458971E6C87049EA4E2B9D786EA1BEBC5D4A141716E44731690A9C81905597208231D476E6ADDA03340B1C8C4C8D215C7A0CF3DBD3DA87AABA2A9257B16EFF0054D41A51706FDD1A32998D0054E79607F035E85672ACD0452C12A4911180CA4107DF35E65753791692CB19DCFB1E4507B93C0FE62BD1FC39656FA5F872CE05762D1C2B96E9BDF193807DF351635AD64958D8850AA1C92727201C71523E0266B9CBAF16E996DACA69535CAC3336CDC5BA26EE99FC3FA57517D66E6D9E4D3A417181CC7B813F81F5F635691C2DD9D99C7EA970167BAB86E918C1EFD39C550D2AFCCD308A488A393D4118C62A3D42413DB08CEEF325970E8E30CB839208F5E95169507937D0856CAE58F2738183C7D285A335E44E0DB3DC6969051DE99C42D2D25140585E949DA96AB5ECBE5C471D4F4A012B8DBB955A3745C9622B994531931C80AB2FEBEF57D7733EEDC739A4D46112461BA30F4A9B9AF259140BE09EE2A687E7E955B663208CA9FF003C54B6A4C72A83F74F43431234A288014FF2C7269C9D29C78ACD9688C81834838E9DE9E6986B3650B9E6947D6A32E17A8A58DD5BA1EB4263B13A9F7A19B83EB420A564C8E2B45724AD29183559BE9566504039AAAC48CD65266B01879A6629E4F6A613C541A2184719AAF2856520F22A5663D0FE7556E18824718A0B48E175783FB3F5E2822DF0CCC2555E01CF46033C7BE2BD67C30B1BDA46F186191C86EB9AF38F19DBC73DAC12C8A7E47DB90D8233D0E7B7201AEEFE1D5CCF73A2AFDB1584F19D8DB970723D47BF07F1AD696F632C42F76E75A28340A0D749C0469CEF3EA7FF00AD4E6E12922FF563DF9A26388CFB0A40606A6D971E8326A2BE8F4D1E1D86D75A50D6B38019181209FBDDB9F7A2F033B381D48DA3F1355BC5D1F98F650850C230CC72338EC3FAD42959366E95DA4623F857C29739165A94D6AC71F2C7787FF416C8FD2B03C53E12834E823116AF78F1CCDF2B0B65902B0C63E652B83C6456BCF65137DE1D7A8AE72FE3114FCC61C29C855E0641EF53ED34D8E98C25D24626A9A534B1B5E3EB3A56A2D28DAA5A69565079C2B28C91D3BFE351F876FF0054D26D67362D6F68E0626F93CC59801C375FBC071C01F4AD6918AA996258D589E4ED07154DAFA4170AB765DAD8A9DDB13773D3B738FC2A5CB996A3716914B4DB4BAB8F3259EDBED1249233CCD76B82D21EF8F4E31538B7FECE2F3492828A840403A10B8CFE944F7368F13C364D7A1400DB11195D867A2923F9D352FBCDDF1258DC441372FEF581DBD41C1CE7A753473BD918A938BBA08FC9B99AD170E524B98E32AA39645EBF877AF4AF10C735869D02A41733A646E6B78CB3211D0E0738FA57985C5F6007D2CCA9776EE1D5A2C6548383D4E186335E9FE0AF1A2788753B9B26B25B3F2630C19E605A4E70781C0E99C64F515A41DF7156ACE671BA3EABA6DC78BDA396C079F3C837CCF1FCFB40EAC48E146D1F9D77F040B15F09ACEF40B3FBE3CAF9CE7B827D3F3AE924B58A6077AAB0231F30078AC9B9F0BE9F2063143F6773CEEB76311FFC778FD2B5B187394FC49A2D9EB43CC32FD96FE15CA5CC7C8C7A38EE3A707F035E7BE1AD452F664DA23721DE3DF164A395C8DCA4F63835B9A9F80E6B4FED1B8B7BA9A7FB694F359DB2F81C7071E95158F80E0F0E2DBC96F77A84A90E711BB47B06411CF19C73DBDA85B9A42A72C5C59EC14B494A3A5230168A4A5A002B2F536CB6DCFBD6A76ACC9D43CEC7D3149970DC8ADE2C47F375351CABFBB6E7B525C4BD42F18E2A2889F2DF7127EB53735F3290504119E69CD01311C64FB53E25C923B55E0802F1C54DC948AF652488A166E47F0B7AFD6AE9E47154E60CC004038EAA7BD3A2976E14E467A67AD4B6522C81C547274A76EE2ABBBE78A9292295DB4AB9DB83F4AA62774E55883DC62B498139AA773009072086F5F5A9358A5D496DF5ADA3128E47A7A5685B6A904EA3CB9064F63D6B989A1922CE3247D3A5411A6C240C819071DB3EDE94D4DA2FD8A7B1D8C92060791555B06B0ADEEA54C8DC586075E6B46DAE4C8BCE3349BB82A7CA5A38F6A8D87048EF4FC8614800C9C54D848ACF8C100F5AA529C120E6B465048ACFB8EA73D8D4B348B3275D8C49A6CE1B07182013C1AECBE1F2AFFC2396AC39250618F52BDB3EF8E3F0AE4B5203FB3E704632B8E2BAAF86AAA3C2969B723EF647A1C9CFE19C9FC6B6A3B98E27E13AAA6C8708DF4A70A64BD00F5205741C02A8C002A3BA388DAA51D6ABDE9C2527B02DCC758CC97718EC5C7E9FFEAA875952F7AE7190AA1455CD3FE6BCE9F754B7E759F3DF42F34A77FF00111C8FC2B25651D4DA37E630EE9410D8CE403D3AD71B74C8D7731621D54805B1D7EBE8462BB0D56476B7736C8B2C9D949C0AE32E2292D7E5916488939CE47393F8D652DF43BA99030DE1990A1527236E71E955A64531BB39248195C1C9CFA7EB4B6B3B35E4F180DE59CB83B0820E7183DB9183C525C00932B3B854CE3A72473D2B548A91496EFCA90C5180D373962D851EB8EE71547536596158F92E5B0514150D9F7E9FAD4D3C8A6FCB0578E250576BB67E6F503A74CD50BB9D525256012C8EFE58F9C0193D0F5F6A691CD243E3B657E19BCD99709C904A8E4F3EA7AFBD6878512F27BD9D2D6095624CB334A3F7723018E0F5CF1DB353F837C2B737B72F79AA412C166631E5C4ADB3793DC81DABD222B3860895638C2AA8DAA00E82B48C0C599766D71E5ABC33DCDBFA83210148EDE957E1D53568795BE2E3B6F40D5334002F07029AF10D981D4F3D3AD6C9116278BC4BA9C6712456F28EF9CA1FEB4EB8F107DBEDDE096CFCB90E30E0E40C1CF71FE7354BC90B9C6E1D067FA54690F9609C631DFF004A7625A47A952FAD2528AC890ED4B483A1A074A000FDD359CE7E66C7535A27A567CA992DDB0739A4CB814D6256277669B3C62353824E477AB537116EC0C8AACE77E2B36697196E9C648AB3DA9AA3038A5F5150D8D109E09EF4F1B194ACAA307A363A5238C1A23F9862A53D46D5C6C988F0091BBB67BFD2A1F394B630C4FA6391F875A9AE8CBE4911796580E038C835492DE79ADB02458A51E832BD7A75271F8D3B0E3E63FED96EB9CE7F014F1796A532E4A7FBCA40FCEB97D4E1D4ED95BCD812687073E59DA7F03D3F315CBF99223BAE9D7D7514E7A4134855BE801CAB7E049FA54A7637504CF44BA58A45DD132B0EC54E6B35D7E639E0D73367A8DD2216986C973867418E7D1D7A56C5B5D99D72D807BE0E47D6A1BB9BC63645A68BE53B7A54962087383C0F5A8E163838C7E15615B68395C7F5A22535D0BC9281CB54A92061C75ACC55D992080283388D0907247B55A33703519B23DEB3EF463E602B31F5B1193953EF8E6A7B7D422BD87744C0F6C7BD26AE2507129EAA48B197D48C7E26BB2F876A4784AC18F25D377E7FE715E79E2A9658F4E78E3C9965223403AEE2703F5C57ABE8166B63A3DA5B20DAB146AB8F4AD692D4C314FDD48D014C6E5D07E34FED4CFF0096BF45AD8E11EBDEA8EA0F856F615787426B23547F9587B8149EC5456A45A7B6D5BB9881F2803F4CD637943CB1B97071CD6ADB71A44ADFF3D1C8FC338FE42A94C3AE2B39C7446F4F7666496E3712A315937FA48BA81E26728ED8FDE2E3239CFE55D015FA9A6140A189E839FA54281BA93479AEA76F71A5DE4B15D3A9888F3125381F2F420F6C83581A9CB23DB7CB0BAC9246CF123FCACD181CBA827923AE335D66B4F77A8EB76DF66B58EE23322F9218929852D92C7EA2ADEABE06BDD5CA4F75A942B75181E5A2DB031200738C1E7AF7AA4BB16E7A6A723A669775AFC91B25A4E9A793CCCC80171DF00F6EBCE3E95D669BE0ED274CD561BFB38EE22F2411E4336E8F2460B007BE31D0F6AEF2D2129046AEA81C28DDB3EEE7BE3DAA55841072011F4AD16873395CC8FB5DBA705D53FDEE2A55922936ED74E79E0D5B9ECADCA9F3235E7BE2A97F66C0B20CE7D063F4AB52B136448631DBF1A431E318E9EE6A07D3CA925667518F539A6ADB5DC6B8139720F714D4D136243175E060F3504E85636381C7E7567CABA5ECAC31CE3AD45705FC97568C81C73F8D5A9264B5A1E8029690528ACCCC5A05149400B5525F96520F7AB5514F08953AE18743E949951766576C6C3541B01B8ED53CB0DD203B82151DC37F4A83DF1D6B2933543C1E0E2903E7A5341C66901E7D3359365A43DC64714C8F084E69F8E4D33904F4C76A10D12489BB906A375C2700F15329C2D2E40EB556123266B95C32B73D8D72FAD6956F7459BCB041E083E9FD47B1AEB2FADE39412BF2BF622B1278674242806B37A1D54AC60C96E12DC47E579CA06172C4301E81BA8FA1C8F6A8B4F2EAEC916F6C758E51875FA7661F4ADA169772B058E103FDA3D2B46D349645DD28064F6ED424D9A3946255B08F780410D9EE3BD68DC44618771E3BD43359B42867B5212618254FDD7E7A11EBEF563C413A8D38BAF071D3DE9A5A3239EED58E7E6BC2642B1E7238A6A3B3A93B491EB83543CDF22377D9E63202C57A715561F17DBC6E52E2DE58D5480586085E9D7B8EBDE9A46FB176EEDDB1B91463D3DEB223768E77788B249C6E423F5AEAADEEEDEF620D0307561918EA47AFBD646B1088A292541965071EE79C50857367C1F603C417115ECE330DA4DF2FFB4C31838FC4FE55E9AA30315CFF0081F48FEC6D060B63FEB08DCE7D49EB5D08E95D10564793567CD2629E86A35FF5921F7029E6A38BEE93EA49FD6ACC9121E16B0355931C9ED935B929DB19FA5735A8B6F9447FDEC2F1EE7148D29974C6534EB68FB8009FF3F8D674ABD6B72751C0EC17159B2479DC68922E12B1925D94904633DFA8ACDD75DA4B78AD90B2B4EDF31071F28EBF9F02B7E711C30B3C9C28AE375C7BA6965BC58D9D63421635FE15EFF8F4ACDAB23783B9A5E19B329757924800C6D5451CE3D4FE35D185E3A735C6780AE9E7BEB912AEC768C31049CB73C1C7AD768FF2827A538EC44F71C8BF37D29E070454313B1900C100FB55903B535A99B2A98F7B1DC7A1A7B44A54F03D6A4239E16924388DB23B5315CCF9E6585588C10077E959B69AC4370CCB206041247CA7040FE9C1A359134B04A96E0B4ACB855071F5ACF86D26820025B3980518FB991E9DB35CF526E2F43A6942324EE74D6B3C533958E40FEA076A6EAC8069F29FA7F3154BC3885EE6E24DA42AAAA0C8C7D6B47581FF0012D9BF0FFD0856F49DD26CE7AB1516D23A914B4D14B56602D277A51DE90D201693B525413DCC5029323014005EB6DB7623D2B2C646067B53A6D456EB31C438F534C38CF079AC6A3D4DA9AD05C601A5038A1471471591AA1D9C9C5464F269C71DF8A89CF1D698D22D46432F14D7207155D64DA3A9A49250C2AAE3E51245CE48A876739239A1E523BF1509BD55CE4363DBFC2A346CD1265D44C2FCBC1A49AE16D616924200F53D29B0DD46C061873EA3151EA2D1CA9B000D9ED57B1166DD999915F2DD5C112FFAA0467183CF6C9FC6A86BB6A90C6CF6D23AC79E46FF0097EB83FD08AD9B3D315237790003B0AC0F126FF21A089C9CE070707F0F7A936824DE863B5A477912B4E6471B70BB24299CE30415E33C7704564DC7875204471753AC9D773A0900C1E39C67F4AE96CEC992DC6DC97620B0E073F41DE9E6265C8232A7F84F34EE6C95CE57EC571612412E9A5668F39952390673FDE02BA41776CF73A5AEA73240B2CEAADBF8C919207B0240A8EF6C2DAE63198B61EA187047D0FF008557D6B42D4A6F0726AD1C2BA9A46C649ACA45F99A207868CF50E0007DF27BF5695D99D4959599ED280050074C538579D781BC6F0CDA5442F431B44DA82E94EEF2C1FBBE60EA07FB5C8F522BD1457423CC945C5EA0C70093D00CD322188941F414971FEA9FDC629E3B7B53208AF1B1137BD73A079DAAC0BD71264FE00D6EEA0DB631F5AC5D1C6FD459FB2464FE2C7FFAC69A348E88D2BA900DD59D3DE410A1F3E58A3EFF0033006AA6A4D7245CBC5264943E5A7FB5CE2BCADA46D5167BA79C9B9C052CE98119E7231EA0E6A673E52E9C398EDBC5BAA288F4D456CC523B485C74F94647F3CFE158875682F6096689D4C51F0EDD31EA2B9EB147B57513482E63552C164639241EABE98F6A8DEFDF50D52D6CD13644EA26C26D2A50824107B8CE7F1AC1CAFA9D31B4558D1D2B5F0BA8CCB38FB35C292D036D2372F61E841EF5DA5DEB7E75959CD6D2229940621B8C7B7D6B82F1DADBC5A169D72E8CCF1CEA37A75652181FF1C7B55BBAB6B4D4B47B781A6F30C054ABA9C1F72454F35911269EA7A07876FD753B313477111753B6546E0A91D8FE86B6D637032C573EAA722BC9ED2D5351B5BB86CE08A3BC421DB24ED9863039EDF423BD771F0F6DEE6DF47912F99B9998468CDB8A28E00CD694E7CDA184AEB53A554CA83505DA610E2ACCD736F6E104B2220638504F5FA555BCB984C6C51C10056AC84CE4354964FED1096F2B46506E2CBD727A0C7E06B4ADB55BC8E200BC6E7B961DBF0AC28A5135D5CCBCEE67E38EC381FC89FC6AF9E2023F8CF007D4E2BCF9B6E47A91A5150573A8D2A57BAB349DD4297CF4E846699AD2E34C9FFE03FF00A10ABD651A456F142BFC0A0556D7801A54FF00F01FFD0857A105648F2E6EEDD8DFED451453205148DD28AA9AA5D0B5B577279C71F5A0655D535316F98E3C190FE95CFB4AF2B33CA431F53D0547E612CD24A4EE6ED51B16914E7E55F4A872EC6B1817F4D390EF9CF38ABD919E955AD23F2AD9540C71526EC1AE66EE6A91690FCB464D3236E3D29DEA295C76109EBC544EDD6A4EFED5048282A244F263FF00AD513DC003AF3EE696452738355A443DF3BA95CDA2911CB3B1C8E45476EAD24DB4E707AD59B7B2691897E9ED4CBD9069F282726338F7C50A2DEACBBAD9179E358D3E41CFB73535AC39E5D79AAF63A95B5CAE62752470474C56844EA5861855A48C5DD6836F18470E062B91BE9337209E466BA4D4DFCC0C0118F6AE74C25EE0FD69B2E92D352F411E63CAFB738A6CB02904B75AB16F1F96A07A532524AB03C1A45DECCC8BD88ADBBAC6497701107B9E07EA457A46976EB6BA741028C2C68140FA5715A35B9BCD6E38DC622B702539FE262703F913F9577523EC4E393D856D4D595CE4C4CEEEC79EF89F42B7D2750BAD4348824DF32012DB5BA120B93F7801C60F70463BF1C9AF43B12ED670991423941B947201EF51D95AAC46490E4C921CB1356EAD2B1CD295D588E6E762FAB0FD39FE9520EF513F33C63D013FD3FAD4A3A1AA20CCD65F6C58F6ACCD29FCAB5BFB83C000203F41FF00D7AB9ABFEF1D97D17354AD131A2AA12434AE58F7FE2E3FA5389A74B199717A92DAA4D68C5F638ED8C91D4572BAB786B52FED196FB4BB11A8E9F724C92451ED4747EE7048C8AEA2EEDA78BE70D09B707EE84C11F43D3F4ADAF0F2FF00C4BF85C12E4E79EB5128A93B32D4B955D1E43AA473DB8C5DE93A8C49BB761E070A31CF5008EFF4EB59B6C6DAEC3149E2B75849C2FDDF94F241FD715F42E580E188F4E78AAD75636B78A45DDA5B5C2FA4B12B547B2ECC3DB77478ADFCED7D1C10929B20712294C9CE011D7AF7AA42096190CB1B045E7728CF23B646304FFF005ABD76E7C13E1B9D999F45B48DB39DD083137D72B8AA2FF0F344F9BECEDA8DB93FF3CEE4B63E9BB352E93B14AAA38BF3D6C2CA79A00301770C281B8E3815E97A444D6FA55BC4E72EB1AEEE31CE39AE76F3C136B6EB6823D4AE5984EADB275044801C95C00076CD75570DE5A7B0157469B8DEE2A935249239DF10E27D4A088F3E5A6EC76E4FFF0058D4F1912426357DDEAB9ED58D23CD73ACDC4DCB20DA9853CF43FA8CE6B554AA3471C03E58D76F7273C77ACDD4BC9A2D42C919A2C52DAE18C61883C9CB647D2AED8C1E75EDB4607F16F208F4FF00EBD3A15334928DDF285C9FAE7157FC37017B99E7200DAA231F5EA7FA565087354474CAA72D366C223A1C800FE35575D63FD9538391F77FF4215A6463AD676BB86D267C1C8F97FF004215E8A8D8F29BB9BD4520A63920FCA40FAD64324AE6BC4B2EF9A287385EA6BA30C0AF5AE535C205C3C87B600A1E911C75651254025BF0A75A2F9F3640F917F9D41144F7921519110EA7D7D856CDA44B182AAA028E2B99C8E95A136D013150B8C678AB2DF76A090020F7AC8A43E06183CD4C79154E26DAD8AB4A78EF4D31D809A89EA4273514846D3CD034567CE48A859B0719A59E408A4E4E4D66BEAB6D1B88E57C13DC8A573649B36639084E0F3505EA8963CB8247D296D6E6DA48C62743F8E0D591E415C34E983EF5B475276773025B48D7F7D18DB281C32F19F6A9EC35359232A6401D7820F5156353892250F110C0F52A722B12FAD629A12C170FFDE53861F8D26AC6CBDE5A9A97776B1C658B0C1EF5059CBE71CE063D4560C36E236CBBBB91D371C9AD9B2012204022915CA92348CA1578AA73CC02B33B6140C93E98A6C9202739355EDE03AAEA9158264A310F37A0407A1FA9E3F3A6B5D09768ABB3A7F0469FFE8D2DF4E9F35C905430E883EEFF0053F8D74F1C68A0E140A4890471045180062A41F76BA52B2B1E54E5CCDB156969074A0D3208C7370E7D140FE75276A8E2E5A53EAD8FCA9EE70A68198323EFD5E5477501970ABDDB1D7F0AB1770FEE155005DA31815CBB5CB378822995BE679CC409E4018200FCEBB468C94E719EF4D1535CA7946B5AB4F617199646687785913046DE7FC9AF40F0C7CD62C474DDFD3835CEF8E3404BA865628C5255F2CE3B13D0FF009F5AD0F8713493F876217194B88FF7522B9C36E5E0923F0FD6B185D49A66F3B3A69A3ABE7B6477A4C7E3DE8D8DD76E7BF1FF00D6A439079078FE55B1CD60C75E3F4A69C7249A7751FF00D6AABA83CC90916F0B4CC782AAC0103D79A011C5EA7E3FB58756B9B2834D9EE9ADE411B3EEF2C648CE46474EA339ACB93C43AF4E92B18AD7CA2C76A904305CF1920E09C6338AE9F55F0AE95ADC7FF130D3DB7763CABAFD1979FD6A927816D6152B6F777623200F2E4959C0E7A8EF9E3BE6883EE76D29D18AF791C54506A736A134DA65D4D6534F879619143C65870594F38E9D2BB2B68A78ED4BCCEAF7657923805BD6B421F095AC0FBAD9E58CF7DAF9FCB3447A548A4F9A5DC83805C30E3D7826B19524AED04AB45BB2D8A166AD6B64D1BB8329E58D6FF86A48469ABFBE8CC8E4B30DC3239E38FA62A84F60B1C726E32B8C7DD5C73F98AD65B0D3EEE01BACE2718C7CC809FA51429B8BBB231152328D9097B7B1C6E559C7D2B32FAE51B4F9D10E43638F43B81FF1AA3A969F1E9B7A65B0B7D9BA33B864853CF007500F5A9FC957D16699A2547046D6D982464576D972DCF3AFEF58ED5B8538AAE81A490F381561FEE9A86DFEF35458AB9284DA3AD731AE425D6403FBE2BA93589AB460163EE2B3A8BDD65D37A952C6158E2E0002AC28DA0D3547EEF8A55E98AE1675217AE41EF50C9C66A524018A8E51B8641E454968AEC7078A991CEDF7A81F34D8DF1C524596F71F51C547236734C57CE724D2F73FD698D22092DFCCEA78AAB79A4DB4F160A00DEA3835A5BB039A4DC2848B4D9C7DDE8B3ED3F6670197DF19FA8E95976F3BDACE6DAFDA68E43C02573FFEB1F4AEDAE146E2C09154EE962B88BCABA892651C0DCB9AD23637526CC4B7BE11EE224FBBF7B0320FD475A920D461B872B1491B30EAA09047E14CB8D06344636572D12FFCF36F9D4567369E063CFF002D9FA0641835562B43598062768E3D2AF44C550026A8E990F96BF331607D7B55C73B47AE2A77D09124608B93C8AE83C1F0AD92CD2CAA1A69DB73B0EABD80FA01FD6B06DA2125D41BF952D9C7AF5AE921033B93E5C7422BAE952D2ECE3C454BAE5474E1832E54820D3BB5705E2D8759B8F0E49378735196CEFADC9936A8044CA3AA6083827B103AFD6BCD343F88BE2B478DA2D4AD2FE263811DDC5C9EBFC4A10E0E3AE0D392B1CB18396C7D1428AE1BC17F1174FD7AE974EBF85B4CD60F4B695815971D4C6FD1BE9807DABB795B6C6E7D066910D34ECC6DBFFAB07FBC73FAD47A8CA21B39A4271B549A9A25DB1AAFA002B23C572F97A4CAA0E0BFCBF9F1FD690E2AECE2F95166E73959564FCB9AF4ADBC579F24425B9B68FAEE9157AFE15E9636E3918A7045D7DD19B736C97304913FDD718FFEBD67E9F697304456500484E5994655CFAFAFA5742550FA5355060E3A6689413D4CE33715632240E8A49D80FF00BA454515C36FC09E323B8DF83FAD6E98E98D02B7DE553F5153ECDAEA52A8BAA2809B046F3D7A1201CFE22A050EF33BED1D78AD2FB34614811800FA714D5882670A47D79A693EA4B92E844B9DB4C7193CD59C0A615C924559172BF9605285FCAA6DBD6902D21DC88292D4E0B81802A455EB4638A681B2AC91E49E062A86BCA17469C7A6DFFD0856BE2B33C423FE24F71FF01FFD0855264D8D727E5A8B1B58B0EF52292C2A3906DF534C438382323FFD55535487CD81B68E7AD4CF848CB5491912C00FA8A1ABAB0D330E3195C0A7A8C0352CD19865231F2377F7A61045704A1CAEC74C25718D8A8C9C54C7A1A81C632474AC99AA644E3AD567E39156B7026A0994F257914AC6886C4E1B83D6A55154198A9C8FCAA586E03038CE7F950516FF000A8A4F95B9C8A7ACC0AE7068F316418239A686999972FF003704F359F24EC848D84E7F0AD7B88918FCA05509A300F4E86AA3A1B45954B0914F041E0E2A24806EC91C0ED569542F41F95216DB92781D2B45AE8539587C6140CFA0E94FB7B76B97CB64463F5A863496466014AAA91D40C11D315B7649B6050BF9D7552A16D59C952B74443E504BB88A801456A20F2E0200E9D2ABECCC838ABDB37003A82735D4724992D826D879EFCD78B7C40D167F0DF88AE25D37ECE2C6F41BA58A56DA11C9C49B4E318CE091DB713D01C7B7C43082B9DF88DE196F137878C36E42DFDB389ED989E370E0A9F62091F956725744D39F2C8F168E1B6D52C95E412236EC86DC37C4EA7AAB0CF208E08FE55EC7F0BBC573EBFA35C586A8E1F57D3D92299F18F3E36FB92E3DC0391EA0D787410DCD9EB12DA5CDB3DBCA72B342CD9270382475DDD3E603E61EE0D751E12BDFEC7F1C6897C5CAC37120B2B855E46D9384CFAE24DBCFFB46B0B1D338A92BA3E8915CDF8BD8BADBC43BBE4FE15D20E86B9BD6FF007B7D83D117F99A0C29EE65E8D0F9BAED9A95FBAC64FC81FEA4577B5CBF87201FDAD249FF003CE1C7E24FFF005ABA815515642AAEF20ED42F0292460A849200F7A504638AAB990B9346E34945201DBA8C8F4A6D1400BF2FA534C687B0A5A4A0069857B1229BE47A35494668022F2980EC69A5180E86A7CF5AA1A96B361A66C17F751405FEE876C13F4140244A4633906B2FC478FEC7B8C7FB3FFA10AB36DE22D1EE5B6C1A8DA3B7A09467F2CD45E249619343B931B2B1F97A1FF685082CD1A0BC53661952453BA5079156415CF2845259360B21FA8A5E8C45577630CC18F4CD21A2DDC44B2290DD0F1598E8D136C93F06EC6B63865C8EF504F0ACB1B238ACE70E645C656329F807935096E483D2A5951E290C7273FDD6F51FE3503AF515C4D5B73AA124C63A03D0E0FB5412165FC39C8A9492322A173C739350CD515E5749060F5F5154A4055B746F861EB5725DADD541FC2AA48AA09EBF9D49A446AEA0A8089FE43EB9E0D585B8E3E56041EE0D645C84C10416CD67C56D23DCA2DABBC3CE58A1E31F4E9FA55475762ED6573A6F319B3BBA5579586D38C738AAF2C572A06C718F75E6952CE79B024976803D2B78D16C8F689114D308F92738ED4EB1B69AEDB7B02911EE78E3DAAEDAE970C1D54CAF9CEE7E9F80AD58D3839E6BB295151D598D4AD7D1159A30836A0C28C67DEADD98C44054730C0E7A54F60BBE2CF3CD743D8E7B93C6016AB238FCAA3488A9CF514F9182BC6BFDEE2A486C9D0E0AAF7C55A8812C4F6155AD532CD21EE78AB8BC0029193388F891E0F8BC476A27B32906B56E336F3F40F839F2DF1FC24FE59FAE7C56EE59AE34AB99638DE1BA809CC6C30D14D190769ED90C87A57D317CB8B676FE25E47F5AF9FF00E28C0BA5F8EA7788110DEDBC579220048DE090E78E9958F24E0F7CF5CD44969737C3CF5E567D0FA25FC7AA68B63A842731DD40932FD1941FEB59D3C5E6CF23F5C9C7E55CEFC17BEF3BC011DAB3967D3A696CCE7A8556CAFF00E3A56BAB817319C8E49AC92D47F0B64FA1DA881666E77391927E95A82A1B31FBACE31924FEB5355993776739E3D94AE84614FBD712A47F86727F406B854492D8916F7375063A7973B01F96715DCF8AC79F73690E7840D21FAF41FCCD619B2519EA456524DB3AE8D947533A3D6357807EEB549881DA5457FE99FD6AF5BF8AB594E5CD94EA0E0E5190FE84FF002A8A5B4439E0E7DBAFE7550DBFCC769EBD8FF2A9F791AF2425D0E82DBC6571BC2DC69671FDE8A607F438AD6B7F125BCA3E782E63FAA03FC8D72705B84C1CE4F4E2B4A05DA06F51ED5516DEE632A51E874A9AD58B75B809FEF82BFCEAD457504A018A68DC1FEEB035CA6F527057DB9A8A4B782404BC684FD2AEE65EC91DAE7DC52E6B8BB54DA998A49933FDD908FD2ADACF789CC777263D1803FD28B92E9B47507A1AF23D56EFFB435ED4AE5886224304241CE1538FD4E4D76973A96A0B03A2C911723018C64119EFD715CEDB696B1DAAA08F007058F53EA7FAD4CB5D11A528F2EE7393DB433B1DF146E47F79051616B6F05EC6608FCB209185E0743D40E2B75F4C524F18EFC81501B0114AB28C71DFF3152A2D334934E2CF4D1D69E298B4F02B738110CCB839A8A540EB56994329AAE3E5254D301F64DFBBDA7AAF152B8CF4EB55A26D92FB1E2AB6A3A9346C60B550D2F763D1690CB57112CD195619FE9598626576490823B1C5533757D6F32CA6632AFF0014640008F6F7AD95315EC02488F5FCC1F43594E0A48B8B7132678C807A1AA52F19C8AD2BB5311C4985F424F06B324963CE37A9FA1C9AE29AB1D70915A4E7AE455590373C63B9AD1589E4FBA001505D5BEC4CB498C7B7153C8D9A46A231E44C92403C77ABBA6C1B57CCC105B8150C2BF699760FBAA7E6ED8AD04B88C3F9719DCC38C01C7E75B5186B7654E7A591288828DCE2B32FCBBDCDB46ACCAA5C703FAD69485C29671C9E2A846BBF53872780735DF0473A3655724D4C838E3A53221C54A17038AD519B21BA5FDC9C55AD2D7FD154F1CD4174BFE8CD57ACD36DAA0F4147425BD0B0838A82542D7A9E8A9C7D49FF00EB5594EA0523AAAC8CEC71818A4677268F0ABD801503DCCAEFB6D973EAC69A6392E08DC4A423F84704FD6A556C662B6038EADE9410C63F9923A44DF3123E73D85790FC67F0E5F4FAEC7AC43025D5845024332282648541625C0EACB8639C723DC66BD963D910207CCDDCD66EB798A34B943D0807E94AD7D0719723E63CD3E0A6AA8350D7EC124DD1DCC515EC5CE7246637E7A764FCEBD6E2188877C0CD78C4FA72F853E3368D25B01169BAD452AAA018549187CEA3D8B2C6C07AB1AF695059100E3240FC33CD636B33A1BE6D51A96EBB2145F45029F42FA50DF2824D331391D6272FAC5D1182B12AA7F327F9D4313EF5CE302A9FDA83C93CC49FDECACDD33C6703F4C546D759622323038CD6773B631D2C683B286C119A8648502B6CDB827381553CD2382EC78F5E69DE7383C118A9BDCA499600190BB4640E7DA9779042A8381D2AB995B764743FAD09392C0018FA1A684CB79C73E9DF146EC67AFA9AAFE6051C9FCFAD29906CDD9C77229925846381D003DEAC03FDDE9543CDC202A4649E2A5B699DDD83103A6050989A2D16CE7A531C64738A551F2F279A6B1C8F7AA208CE3BAF1D7E9556FB1F677206738FCB356D81C11D063AD50BEE200338000C81DE9A13D8EDA23902A4155E03C5581568E543BB543347B94E3AD4BDA8A1019A5CAB6D618AA72438919D3072735AB7310619150DBD97CDBA6391D96A25251D58D19DF6796E0158D3FE04DC0157AC34F167B9E59CB31EBD855E7198CAA36CF422B3DE0941E53CC3FDECE6B9A551BD81B65B0619785D8D8F6CD3BCB503803F2A8006B6872B197627902AC67233D3DAB927AB1ABD8825B589C7CF146FF5506B1F50D0E09F25249A06ED86DE9F91FE98ADEA43820EECFD475A8D7A329368E36F6D25D32C98C8A0A9EB34632A47BF715169F02AAEF0410DCE4739AEC2588AF400AB7E4C2B06F74EFB2E67B053E50E5E0F4F75FF000ADE957E5972CCD233BE8CA937287EA2ABD9479BE2C4741DAADAED9602E878CE696D23C33B631C62BD383B977D0B712E17E952C6BB8D463B28EB576DD30B5A19B643711EE8B18EB571136C407B52326E2A3DEA57C608F6A0CEE22FDE5C542D20F3A5F3082A080ABEBC7F8D3B7ED7524E171CFE151E91241791B5D44321D8F27D8E29D886CB2A8F22E643B13FBA29E8001B54003B0A91D940F98D08C1B257902A49B82C63077006A9DEA24C7ECA79DDC9F6ABCCC15493DAABAAFDF95BFD630C0F6A02E79BFC735487C3169AB418375A25EC3769EBB778561F43907F0AF49D3A413B5AB21CAB2F999F6C71FCEBCF7E21D9CB71A36AF62C3725C594C413EA1491F9102B5FE08EA8359F01E8F74CC0BC36CB6EFF00EF212A73F8283F8D672DCDE3F09E8918F98D53D72E7EC9A55DCC481E5C4CDF8E38A82E358B482528B219645EAB18DDF9F6AC3F145FC9AAE972DA59C0E8CEC99693006D0413DFDB150E49151836CE604E228235DFC81D7D7D78AAFE6818656E4F26AA6A30EA16D19696C5A445EA61218E3D71D7F4AE6AE3C5B616F20867965497A61A26073E98C5617B9DC958ED05CED04B36EC743D314BF6C3B0E0FCFF00DDF5F7AE4AD75DB3BC05ADA713927EEE7907DEAFC1767772E7A771FD7FFAF4AE3D0E885E2B2E1880DD4FB52ACCBB49E9BAB096F555B0080C3A6066A66BA0DEC7F2A69916358DC023A9C631EFF5A23B85FBA0003B9DDDEB18C8172170727270718F7A62CCA0B0EAC0F34D485637FCDCAFCA70477CE6A68EE0A77E9E9815831CE40E0657A1153453755CEEF5CD1703A1B7BCDCB80A411D727A7BD4AD37192735CF4574A25072720631EB533DC09222092A0FAFD6AD48CDC75363CF04127BF61515D38303E39E9FCEB1D2E151B80738CE3B54D1CBE6863DC8E954A5A9325A1E85170715694E6AAAF53CD4A878AD11C64E3A1A5A8D4F14F06872495C046C0FAD309A0F2693D7B579D3A8E4EE5586CEC82361290A878249C5402558ADF16E0C8147073C7E75678E94A00239C9FC2A371A4568CDC3A862D1A03DB6927F9D488BB7396249A94954C2E40278155EF8CB6FB71B769EF8CD2946CAE34AEEC4B4A8371C74ACEF3E6FEF21FAAFFF005E956FF61FDF2EDFF694E47F8D611AAAFA96E9B2FB00BB909CA9FD3DEAAC80A3E4739E0FBD4A8E245DC8C181EE39A24195A537CC45AC63CD66B14AE63E23979C0EC6A1953CB880E8588AD5237C6E87B722B2AE3F7975B7A85E3F3AF5305539A367D07726B35DC726AFA0AAB1958805CE4D3FED03D7F0AED224CB6B81C93D29BBB3939CD5196E828C1214FBF14CFB461323A1A64DC92F00645463F2BE54FE208A9F44102E9D1BDAB2985C6E523A1CD606B7AA7D9ADDA4C64A7CFD7D0E4FE94BE13B848748912366689A579A3201202C8C5C0CFB6EAAB6849D16E334BB474156C008802F18AA5A7C88D19746073DE9F3DC28CE71B4753485724CEF2493F20EDEB59BA95C4B93B380295AEF39F980EC141E6A1B9BE2A984837B9F51C54B6A3AB1C62E5B1977F31BEB478278D8C899D920F7E083EC6B17C03E1B93C2DA149A4A5ECB35BBCA667E3692C4018C8EDC0A83C59A4F89EF668EE341B95B7DC70F14AA36FD411FCBF5AEA74AB5BA1044B700075501B9CE4F735CB3A9CCF43BE9D3505A966DD51176228503B01565541A431AC40F1C9EB9A82DE4C48C01047D79158BDCDAD7267837672B5CFEBFE13D3B588985CDB216ECC14020FD6BAB846E1CF229CD10A2C4DEC7CE7E2AF03DDE84C6E2D61696D81FE1CB103BF1D47E1599A4EB9736B32AC12497310C6FB798FCF8E99527D3D09AFA52E6D92456565C8EE0F4AF36F197812DEF5FCFB3CC370324321231F95527DC37D8C2D2757B4D401103309072F1B70C3AF515A073839C81D876FF003CD79C5FC37BA56A2B15FE2DAF23E60BB5042C801FBAC2BADD0B534BFB59370D97B1FCB2C4C470DD88F63EB435D814BA335B018EE20A9E9F29FE54C4774DE24C15233C75A523CD6CEF283A1068110656C3F19EA0FD724D4D8771D1CAEAB942429E08CF3D3AD4C9712EFF00E165C63DEABAC6000031EBD71D29ACC90E76B9DC4066EDC67AE7F3A62B97D6E1CB10CE00C71CF7A57B92080CE42FB7009CFF009FCEB28F981B746711B0E724020F38E6ACFCA220D211C77F5E7D7D3FC2819716666230C47E1CD6969F36F7550F9FC2B01834928208D8A0E7D4FD7F0AD4D2769BA5605B3C8E4119EB570DC89FC2CF5E64EA452A9A746714A57D2BA0E1114E322A4CF005423A8ED52135CD889595822890AFCBD6A9CD7023385196F4A7CACC711C67E66E94D8F4C93ABCEBCF5C2D71B8CE7F02358A5D4AAEEEFF0079C8CF65E29A3233B59C1F6635A71E9C8A49676627E829C34E80750E7EAC692C2547ADCBE78A336D50CB769924E39249AD9B8816788A36403E9490DB450926240A6A6AEDA347D9C796444A57774524D32DC7DE0EFF005634E7B6B4B78D9DE28D51464B11FCEB91F167886FA2D53ECBA69C476DB649B6F0D2739D80F6C8CFE62BA0D0FC47A76AE4436D2B8B909B9E19636475EC7208F5EE334E31A69D9207CD6B91DD4296B8B9B3C1B76C6F41D3EA2A75219323A54B6FA6456EB72AA64612927E790B019F407A0F6154EC41588A1FE038AE2C4D2519732EA1BA1071703D0F155BECB034EC23B891266E4A95C8CFB7FF00AEA790FF00A427D455AB541BDDB68DD9C669E09DA7644328DB6967713732EEF40A300D694304518C471818A971F8D4B0E0213DEBD4BB21913C2AEA7CC081075245644CFA123B23B46EC3AAA9AC8F89F773AD8D9E9F04A61174C4CAEADB4EC5E4807DF35C1D9D91BE9FECFA55BA10BF7E790E42FF0089A5CEA26D4E873C7999E942C7C357CC8C5623CFDD73F29FA8E95D34291AC4042A8500006DE98AF293E0ED4635CD9DEA0638254C7F2FE5525A4FE20D0AE55A4B7630EE01BC962E807A91D40A7CE989D2B6C7A65D58C538240D921180E9C1FF003F5AC8BBB154502E2E951072405C138FC6B5F48BF8B51B24B88F8CF0CBE87BD67F89176FD98900A3498DDE87048FCE87271466A1CCECCC74733104E16253F2A85C7154AFAF24B7BB859232D6D9C3B7A7A11F8F1F8D53F14EB31E90908998059490BEE476AD2F0EEA369ABD90B8B7757543B4807EE915CADB93B9E9420A0AF62F697A825FDAC9240AEBE4C8627475C1047F9FD6AECC40F9A2AAEB12A4D24918C190E5BD33EB5346723068BE9625DB7472FE2BBED5A1B569B48B017722FDE8F7E18FD07FF5EB0FE1EF8BEDBC497571673433586AB6ADFBEB699707AF51ED5E86B07CE081DEB2FC43A0ADD4D6D7F64122D46D9C3AC9B465D7A1527D0827F4A948AE7FB26B0CC4D83D0D48CF819A565DD1A3118E39150B9C2E3BF4AB335A8AC41EB54EF230E84FA549249B5738F602ABB4C0A7CC416F43FCE958A48E17C69A3D95E5A48B736E666663B00E0E0F5FF1AF1E582F744D6638A3389635CC4661812C79E5491DC57BE6B85222CCE03B303B5719E00FF3F98AF2CF17E9BF69B09272EA9750A99A36C608233F2FB8AA884D697211E25B919F3F4A948048260995CFE47152278AB4E48DD2E62BDB524E7F7901C1E78008C8FD6B26CA659608E74182EA032F421BBFEB435CF99CA2EDC1E4B1E73EC2AB9118F3B46DDBF883489B012FEDB6F65925DA73EA41E79E6B544D6D72AC41466C632A41E3B73E95C35CDDD92304BA96D578181315191F426AA2DB68F33958BEC85CF398D8039FF809A3910FDA1E98CD19DA08383D7B523B24C8544458671923A62BCEE38DE2CFD9AFAFE2503276DCB30FC8E69D06A1ADC6C16DF5672A49DAB716EADEF8278A5C81ED0F45842B0242F4C725AAEE88C0DCA86520F419EA7835E6B1EB9E2284AC99B09F819508C80E3BE413CF15D0F833C4F797BAF5AD95E6951C5E76F2278E60C06D52790403DB1F8D0A2D3139AB1F46671FFD6A7A3FAD376D30A9C9C56E7312919E452120649A8E2F30921791DC9A590FC86B8716C7143ACF03CC998138E06064FE557D4EE8F70E3238CD664368B756B1E64990AB06FDDC85738EC7D47B541E2EB9BDB1D0E49B4EC074C6F3B37909DC81EA0735B52F769DCA6B5B18F2F8B2F2D3539D2EEDEDDACA297CA63193BD07186F42391C6057651B2BA06439561915E4FA0AE9773A8B5BEA53DD4DF6819876336256392C495EFF005E2BD56DA3115BC68B9C28C0CF5A28C9C936C7349684B49DEA296464E234DEFE99C7EB4E8DB7A02CA54F707B56C41C4F8C74CD3ED85D5CDC5BEA4D753731CB682461B80C0042F1E9D451F0F749BD59A4D535389A1778D628A361820752C47624F6F615DC83504B72A876E093ED51C8AF72949DB95139E6B1F6EC9A6C74DD9AD38A412264023EB59D74C15DFDEB0C5AF744B4D0ABF7AE57EBFE357ACFA313EB5420E6466FEE8ABB11D91815960E3EF362916C629338DDE9555E70AA483D39AAF6D7A25865766076919C0E80D7A0DD84A2DAB9C87C6382F24B7D1E5D3E169A4695EDC2A0EEEA76E7DBE5E6B4FC27A0C7A1E911A4C43CE5774921EEDDFF000ADD72D2C6A5119C29CF0335E57F13BC5D756F245A65BB3D9AC99325C48A57807955CF7E9594F7B9D345DD729E91657C2E2E5921198C77F5ABAECA1806039E2B85F8452EA573A75DCFAA9720C81216750AC63038240FA9ADBD6359B783C4161A7BBE25901931EC303FAD67B23471BCAC8DED3F65A5E10802C731C301D33D8D5DD66D7ED9A64F10FBFB72847661C83F98154EE141886780475FEB5A36373E64655F0255C6EF7F715AC5DD599CD25677479A6B0B2DE5BC52C70A4DB461E365C907B8C7AD602093C3970FA869B6EF1DBCB8FB55A9C8C7FB69EE3B8AF5BD4F484BA9C4D1308A43F7D80FBC3DC5559B48B1442B710ADD8C73E68DD9FC3A567ECD9BAC524B52A69D379D6E8F9C823357A2C649ED491D85B3C60DBC2F6A00046C1C7E5D2A374B8B740C504D175DF1751F55EBFCE8E5B046A465B170803A50E7239AAF0DC24881A36069AD32E7939A5B149131638233C557939CE3AF4A0CC315034A07423F3E682D44A572F23310A400A7A9F53E959934C0484CF2380A3276B1FD455BD4EE163030093D80EBEFF8D729AC3CB2A4824B70898FBA589CFD714CD523235FF104F77733259288AD130AD7123851F4C9EF5CC41389639BCDB832820E42C8AE0000F03AF5A76B76E2EE689AE165B978DB29199162850FB291926B3AF637854AA59DBDA48C0052C1F0EA07F78617F022AA28C6A33361558F5392C496D8CD91BC6D2148C93CFB8357A4B40D2B18E18FCBCE3764E783D871EBFA0AA36EA92F8AAC55E432E464E482380DF281E9DEBACBB8638A39248EDE3DE016C74CFB7E94395999C637449F0BB49D2A4B3BDB5BDD36C25B98A721A59210CD2237209CE7DFF2AECE5F02786AEB72FF0061D8B027F8615047E205705F0F75C8A6F164704F1794B736C4E4313F323720FBE0D7B85A6F78C7948238BB13D4FBD4EB73396879A6A3F09BC3F2A936B657166E392F6F3B2E3F0C91FA573B7FF0B6FADC31D2F5AB903B477708901FAB0C1FD2BDC2581CAE1A6E6A8DC830C6646B8458D06E25CE063B9A77645CF05BCD03C5564A14D8D8DEAF1C5B4DB1B1FEEB8FEB4CF87F713C9E39B6B7B9B37B7960DFB9642B9198DF0322B57C6DF10AE35279B4DF0CCC3ECE32B35F84C8CF3958FD4FBD617C33B44B7F185882C5A6CCAE496DDD636CE4F73D2B48DFA899F5B814633C7AD349C0A63CA2389E4278515A19A16691554AE7007A7AD448E258C9539CD645CDDB3B10B9C7AD269D70619CA39F91CF15CB888F34742D23A0D29BF74C87AAB55DC8C107A564DB3F9379FEC49C7E357EE19C2FC99E7B819A787973406D6A456DA5E9D6B3BCF6D656D14CDF79E38C027F1C55C2793552DD64DFB897DBFED1EB56AB64AC268C0D6FC57A5E93218A595A7BAFF9E102EF7FC7B01EE715CF378FAF1DD7ECFA2831B3AAFCF71F37240E8AA477F5AA9E23D1D34BD6E69CA136B76DBC7A2C9D083F5EBF9D45A7C46F355B4B384676BAC926070AAA7233F5200FCEB9A5527CDCA8EFA58683A7CECF4E89B7C6AC460919C546D6E8CC4E5867A806A551B540F418A1982AE49AEAD8E0BD88DCAC309C702B12EA6CE6ACDF5D6E381D2B314F9B2FFB2BD6BCEAF539E5CA83CCBB68A4A018F99B934FBB9BC98CB1381D39ED4D425016238F6A86EEED1E26468728DC11EA2BBA853E485884D5C8E791CA16882B8AB1A5D8470C4FB49C4832437358F086DEA96FBD7BFCC7200FE75347E24B1B5B8FB25CDC24738E002783F43D2B0C429E9636766BDD3A1D3ADFCB95F07E53DAA7BDD36D6FA3F2EEE08A643FC322861F91A5D398491798B9C1E9574574524D415CC3A9852E922D216FECE50A3AF97D07E1E95E33E20D1FC4975E2D835E8B4E78D6DE7507CC703E50483C7A106BE82C75AA97B6697313A3719E78E2A9C1335856940E7A469A4D3CBC4374A40013BE6AC6982665569A3759C70011FA54F69617305D967951A2030005C1AD98DF6801873EB4942C53AA9E80B1EE5F9C502D57CCDC79F41DAA65704714F06AAC6046B122924281519B64DFB97E5FA74AB1487A5161A332F347B5B92CDB4C721FE38CE0FE3EBF8D73DA9E93A959A192D08BB8C1C95C057C7B763FA5768178A4DBD6A5C133485494763CD1B533191F6A4920278C4A853F5A49EF97CA0DE62853D181EA7D8D7A2CB6D1B8F9E346FA8CD606A3E16B4B991E583FD1E563B980E5189F55E9F9547B2B6C754312BED238E9E73B0ED2A5FAE79E9EA49AC4D52E7620C20393CB01EC7A9FCABA2D4B4D92CDA4374AAA1304F3918F5FA5799F88B5A8E75C42DBE366D8A80F2E475E7D052B6B6377256BA20B8D6624F33ECB6E6F2553F30450064E46327AFEB598DA8DFDD2967B786D621C71133019E849E17BD2A5D18A30251B54E15553824F603DAA0D7351DBA3ED99C48D8DAB18E4B1C6012C7EBFA555AC617BEA62627BAD56E5AC1CCB2DAA79A9238C12548C71E9D462BB5D3AE62D42C0DD4630AE0828E395604820D627C3AD37ED1657B7D2AE05D481223CF0A0751EC49352E9A8745F114D672305B7BA62501C7C920F43FED0FD45672628688A96529D2BE22E913B0511CD2189F23392E3AFE6057D0904ED2A8DD9031C006BE7FF0016C1E4CD657400DD0DCC641E9C075EFEBC57AF6BBE26D3BC31A2FDB750970A061231CBCADD801D7346E6535A9B7A9DDDBD9594D75792243042BBDDDDB0001EB5F3E78CFC5573E35BE305BBBD9F87636CEDE43DD72793DF1C74CFD6B3BC55AF6A5E2FBB6B8D58FD9B4E4F9A2B18CF1DB05CE7258E7BD55CBFD9D5E47489400768C6547039CFB7FF00AFD748C6DAB33245223B6863B6CA4711DAA9B00519FC739FF1AD8F87A58F8DB4BD9945C49E6248304B796F8C71D3F1FF00EBF276F7A3CE243472153CA6D1939EA41F5E2BA1F869205F1E69AA4E4C9E6E4F7FF56C7FC9F6AD047D657372B10EB54B519C9B08957FE5A37E9D6B3A5769C924939E9E95A8F6ED3D8C007057F4A4DDC12B199D073D4FA54C21671D0E2B461B458D4F1CF7A242B1A92074A7CA2E7EC2444F95B1F391D1BD2B5ACAE3CC8F6B9F9D783EFEF5976E4B2F23AD3B1F37C84835CEE9BA6F9A3B0297466E5256425E4B1F0D938F5E6A65BF3E83F2A3DBC7A8CB9736F0DD40D0DCC492C4DC1571906A0D3F4CB2D3830B2B68E1DDD4A8E4FE350B6A079C6055796FCE3E67C0A978986E5272B58D596E1231D41359775785F23200F4ACDB8D401244609CFB541099A672241B533C60727EB5CF3AF2A9A2051259A4323109D338CD586B075D3E4977142841DBEC3AE6AE6976B12A06201901C73DBE95A1B4379884655B8AE8A18751F7A4652974462C17916DF9991C76E69B35CDB93850379E0007935CC45A2BD96BB776B24A45910248028CB7CC482BF4047EA3D2BA9D1B44B7B0769B2CF3377739C0F415DDA1926C3ECCD0DACD34985908C01E95C8587851AF357B796F240C9E7098A01D71D327EB8AEA3C53A8C76D1AAB3850BF337D2AD78362925B437B700869B9407B2F6FF1FC6B37ABB1D31BC6173A2850468157802A414D14F1EF4CC85A6FAD3BB526280B0C2A08A6818EDC54B4DC5021A063A53D1BD6916948A064B40A841201C1A7A367EB40D0FA29334C320CE3A9A0639D954658803DEB364D4233BD8305897AB1E2AEB8F33EF76AAB79A743710491B0C07183EF4581357D4F2DF11EB37D79AB5CC764B1CDE571F666FF0096F11190C873F787391EE2BCFBC61A4DAE93A7C1A968E40844C82747CE1379C647F74E4F4AF4ED63478B4ED4126BD791D95B7447844E3B96FA0AF20F186BD67A85DAE95A3CA2E2DD6E1AEEFA78D7F7724D9CAA839E40FE82B1B3B9EA7343D9E8521242207600B8276E7B9F5007040ACAFB2C9E24D5D34ED358E238A4B8BA971F2C51AAF4CF6C9007E3534B25E6A97B1E99A2C466D4266E4EDF96204F2CD8F4AF62D0FC0D0F82BC09E28B8676B8D42EAD9D1E77182C48C0C0EC327A7BD6B6D2E7039EB63034B48E0D3ADA08D3CB8C2050BE83181593E2FD38EA1A599617F2EEA02B96524118390DF856C4F19431E0118F9723A71D3FCFBD636BDAE26930B62DCCF3CC19238BFBDF5F615CAB5D8E9D12395D5F525D53428E390F977ECC2331F2C16453F31F5C743F88AA3A84979AC6A725FEAF2A4D2265523427CB857D141FFF005D43689B433CA85EEA4F9A468D40503232B9EB56BCA22250102EE6C9DDC920679C56F18D8E793B95C5B1F370ACAD86DDC1E83A60FF009F5A66A1878880A558A6D3B463767DFA7AE7E9562525E45418C9C02ADD71DCF4F4FE954F508196E36094C63258E3E6C0279EBED8C73EB5641CACD1BC122B3A8593770470A48E4F5FC735D87C279DE7F1EE952390C4ACA8485007FAB73DBE83D6B0DF26EFCB98A98CC83B67230DDBD7815B9F09D53FE160D8B42DFBADD2ED5C63FE593E0D24267D6F05A246DCF5ABF1AE632A3F0AE7E49E66276C9CFB56A59DDEE8475CE2B1C454708E8249F51F7123459C0CF6AA37726E518EFCE2AD4C1A53B7A0EB59EFFF001FB1C59E83269E15CE51BC84EC8D2846D8C7AE2947C8A7279CD35796F402A19A4C0233F8D7490849660A7923AE2AFF00D89594323BAE467AE45605CBFEED8E4F4AE92C886B5888FEE8AC6708BDCD625196D5D3B923D7159B2191DF115B8603AB3B607E55D29C1041158E840775E786359C70F093D4DE924DEA5296C6692205AE7CA6CF2B12638FAF5A82CAC8DA5EF982577DDF2B6E24E7F3AD566C8AACE5448464E6BA551845688DD2D1A2FC6E6360C38C119F715A791907359207CB56ED64250AB1CE3A1A84704D0CB8813EDFE6103715183E9560761E94C9C8DD1B1F5C52B090A1789C06CF423835663639BD5F416D6359B77924616E8C0C89D9C0E47EB5DA448B1A05400281802A18010B97C6EEF8A9D291776D5992AD385314D3C50085A28A281898A43D69D48682445EA69D4D4EF4EA006918E94629D48050333EE2E6E12531040AA7A3FAD3A2121EA4E6ADC8808E69982B5572751514FA9A940E3D6988D4FCFA521A39FF001BF866D7C53E1EBDD2AF41115C2150EBC32376607D41AF9661F0A789A1D4C7874D94B6D2412F952DDC71E2229D9C1F5239AFB14826A94D6305C4D9741BC8E1875A5EA3526B44717F0E7C03A4F86ACA36B684BDC3005E690E598FA9AB7F15275B7F045EAF43712C50AFE322E7F406BB048C471ED518C715E5BF1C6F4F99A1694A48DEF2DDBF38E11768FD5C7E54A4F465538FBC8E1AFEEE3B3B2B99EE2E1841102CDB87381E9F97EB5E796BF69D467B8D4A5DD1C92655549CF969D76F3D09E6AF78AE66BDBF4B112B9B787F7B32B7739E07F9350420476E6404B16E7273F373D4FBFF009E6B2A71B1D337D0622000C52FCC8DDB70381D075EFC7AD2DADB08E4728305FF008BAF1EBE9F873D69F1FEF254F3067B1CF3C0C600FD6ABDE08D639227DC2375D831E9D2B4321B193F687F9F3E5E002BE878FAFF003ED556F3FE3E48519FE06C82476FF1A702B6CA6250523076F27B038E71D7D3F2A8EE1D61954B800B01229EBC1C0E78F51EF408A32460DC8908D88CB91DF247518EB8E4D6BFC2B8560F883611AE7FE5A673D8F96F595280DB5483E667A600E481E95ADF0C9D9FE2369FB7181E706E739C46C3D3DE84267FFFD9, '2015-06-26 13:52:16', '1', '用户头像_超级用户', null);

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
INSERT INTO `aos_sys_catalog` VALUES ('10', '0.001', 'PARAM_TYPE', '参数分类科目', '参数分类', null, '0', '0', '0', 'book.png', '1');
INSERT INTO `aos_sys_catalog` VALUES ('11', '0.001.001', 'PARAM_TYPE', '参数分类科目', '业务参数', null, '10', '1', '0', 'user20.png', '2');
INSERT INTO `aos_sys_catalog` VALUES ('12', '0.001.002', 'PARAM_TYPE', '参数分类科目', '系统参数', null, '10', '0', '1', 'folder22.png', '1');
INSERT INTO `aos_sys_catalog` VALUES ('1689', '0.005', 'WF_PROC_TYPE', '流程分类', '流程分类', null, '0', '0', '0', 'book.png', '50');
INSERT INTO `aos_sys_catalog` VALUES ('1690', '0.005.001', 'WF_PROC_TYPE', '流程分类', '默认分类', null, '1689', '1', '0', null, '10');
INSERT INTO `aos_sys_catalog` VALUES ('1732', '0.002.007', 'DIC_TYPE', '词典分类科目', '范例', '', '38', '1', '0', 'folder11.png', '10');
INSERT INTO `aos_sys_catalog` VALUES ('38', '0.002', 'DIC_TYPE', '词典分类科目', '数据字典分类', null, '0', '0', '0', 'book.png', '2');
INSERT INTO `aos_sys_catalog` VALUES ('39', '0.002.001', 'DIC_TYPE', '词典分类科目', '系统管理', null, '38', '0', '1', 'folder22.png', '2');
INSERT INTO `aos_sys_catalog` VALUES ('40', '0.002.002', 'DIC_TYPE', '词典分类科目', '全局通用', null, '38', '1', '0', 'folder24.png', '3');
INSERT INTO `aos_sys_catalog` VALUES ('410', '0.001.002.001', 'PARAM_TYPE', '参数分类科目', '验证码', null, '12', '1', '0', 'ok3.png', '2');
INSERT INTO `aos_sys_catalog` VALUES ('413', '0.001.002.002', 'PARAM_TYPE', '参数分类科目', '界面显示', null, '12', '1', '0', 'icon59.png', '1');
INSERT INTO `aos_sys_catalog` VALUES ('414', '0.001.002.003', 'PARAM_TYPE', '参数分类科目', '其它', null, '12', '1', '0', 'icon150.png', '9');
INSERT INTO `aos_sys_catalog` VALUES ('423', '0.001.002.004', 'PARAM_TYPE', '参数分类科目', '导航与菜单', null, '12', '1', '0', 'icon152.png', '3');
INSERT INTO `aos_sys_catalog` VALUES ('47', '0.001.004.001', 'PARAM_TYPE', '参数分类科目', 'XXA业务域', null, '46', '1', '0', null, '1');
INSERT INTO `aos_sys_catalog` VALUES ('48', '0.001.004.002', 'PARAM_TYPE', '参数分类科目', 'XXB业务域', null, '46', '1', '0', null, '2');
INSERT INTO `aos_sys_catalog` VALUES ('505', '0.003', 'WF_MODEL_TYPE', '流程模型分类', '流程模型分类', null, '0', '0', '0', 'book.png', '3');
INSERT INTO `aos_sys_catalog` VALUES ('506', '0.003.001', 'WF_PROCESS_TYPE', '流程分类', '默认分类', null, '505', '1', '0', null, '1');
INSERT INTO `aos_sys_catalog` VALUES ('542', '0.002.001.001', 'DIC_TYPE', '词典分类科目', '工作流', null, '39', '1', '0', 'folder6.png', '1');
INSERT INTO `aos_sys_catalog` VALUES ('611', '0.004', 'BYTE_FILE_TYPE', '流文件分类', '流文件分类', null, '0', '0', '0', 'book.png', '4');
INSERT INTO `aos_sys_catalog` VALUES ('613', '0.004.001', 'BYTE_FILE_TYPE', '流文件分类', '用户头像', null, '611', '1', '0', 'vcard.png', '1');
INSERT INTO `aos_sys_catalog` VALUES ('614', '0.004.002', 'BYTE_FILE_TYPE', '流文件分类', '报表模版', null, '611', '1', '0', 'page_paint.png', '2');
INSERT INTO `aos_sys_catalog` VALUES ('616', '0.004.003', 'BYTE_FILE_TYPE', '流文件分类', '序列化对象', null, '611', '1', '0', 'plugin.png', '3');
INSERT INTO `aos_sys_catalog` VALUES ('80', '0.002.006', 'DIC_TYPE', '词典分类科目', '平台配置', null, '38', '1', '0', 'folder2.png', '1');

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
INSERT INTO `aos_sys_dic` VALUES ('123', '2', '表格列', null, '1', '122', null);
INSERT INTO `aos_sys_dic` VALUES ('124', '3', '表单元素(输入框|下拉框|选择框等)', null, '1', '122', null);
INSERT INTO `aos_sys_dic` VALUES ('125', '4', '容器组件(窗口|面板|树|表格|工具栏等)', null, '1', '122', null);
INSERT INTO `aos_sys_dic` VALUES ('1637', '1', '主页面', null, '1', '1636', '点击主导航菜单打开的页面');
INSERT INTO `aos_sys_dic` VALUES ('1638', '2', '子页面', null, '1', '1636', '在主页面上的子导航打开的页面(内嵌式的)');
INSERT INTO `aos_sys_dic` VALUES ('1640', '3', '关联页面', null, '1', '1636', '主页面上跳转出去的页面');
INSERT INTO `aos_sys_dic` VALUES ('1651', '4', '分割符', null, '1', '1636', '子页面生成的二级导航菜单的分割符标识');
INSERT INTO `aos_sys_dic` VALUES ('1671', '1', '平铺', null, '1', '1670', null);
INSERT INTO `aos_sys_dic` VALUES ('1672', '2', '树状', null, '1', '1670', null);
INSERT INTO `aos_sys_dic` VALUES ('1674', '0', '系统导航', null, '1', '1673', null);
INSERT INTO `aos_sys_dic` VALUES ('1675', '1', '快捷菜单', null, '1', '1673', null);
INSERT INTO `aos_sys_dic` VALUES ('1676', '2', '发现', null, '1', '1673', null);
INSERT INTO `aos_sys_dic` VALUES ('1681', '4', '导入离线文本', null, '1', '543', null);
INSERT INTO `aos_sys_dic` VALUES ('1686', '1', '激活', null, '1', '1685', null);
INSERT INTO `aos_sys_dic` VALUES ('1687', '2', '挂起', null, '1', '1685', null);
INSERT INTO `aos_sys_dic` VALUES ('1694', 'PENDING', '代理中', null, '1', '1693', null);
INSERT INTO `aos_sys_dic` VALUES ('1697', '9', '结束', null, '1', '1685', '引擎中并非有次状态，只为表格显示非空而增加。');
INSERT INTO `aos_sys_dic` VALUES ('1699', '1', '待办', null, '1', '1698', null);
INSERT INTO `aos_sys_dic` VALUES ('1700', '2', '办结', null, '1', '1698', null);
INSERT INTO `aos_sys_dic` VALUES ('1705', 'neptune', '#c0c0c0', null, '1', '1704', null);
INSERT INTO `aos_sys_dic` VALUES ('1706', 'blue', '#99bce8', null, '1', '1704', null);
INSERT INTO `aos_sys_dic` VALUES ('1707', 'aos', '#99bce8', null, '1', '1704', null);
INSERT INTO `aos_sys_dic` VALUES ('1708', 'gray', '#BCB0B0', null, '1', '1704', null);
INSERT INTO `aos_sys_dic` VALUES ('1709', '3', '待签收', null, '1', '1698', null);
INSERT INTO `aos_sys_dic` VALUES ('1734', '1', '普卡', null, '1', '1733', null);
INSERT INTO `aos_sys_dic` VALUES ('1735', '2', '金卡', null, '1', '1733', null);
INSERT INTO `aos_sys_dic` VALUES ('1753', 'dataBaseType', 'mysql', null, '1', '1752', '可选值：mysql、oracle、microsoft sql server、postgresql。');
INSERT INTO `aos_sys_dic` VALUES ('1754', 'ip', '127.0.0.1', null, '1', '1752', '数据库主机IP');
INSERT INTO `aos_sys_dic` VALUES ('1755', 'port', '3306', null, '1', '1752', '数据库主机端口');
INSERT INTO `aos_sys_dic` VALUES ('1756', 'catalog', 'aos', null, '1', '1752', '数据库名/实例名');
INSERT INTO `aos_sys_dic` VALUES ('1757', 'userName', 'root', null, '1', '1752', '数据库用户名');
INSERT INTO `aos_sys_dic` VALUES ('1758', 'password', '111111', null, '1', '1752', '数据库用户密码');
INSERT INTO `aos_sys_dic` VALUES ('239', '1', '行政部门', null, '1', '238', null);
INSERT INTO `aos_sys_dic` VALUES ('240', '2', '项目组', null, '1', '238', null);
INSERT INTO `aos_sys_dic` VALUES ('241', '4', '其它', null, '1', '238', null);
INSERT INTO `aos_sys_dic` VALUES ('253', '3', '工作组', null, '1', '238', null);
INSERT INTO `aos_sys_dic` VALUES ('290', '1', '正常', null, '1', '289', null);
INSERT INTO `aos_sys_dic` VALUES ('291', '3', '管理员封锁', null, '1', '289', null);
INSERT INTO `aos_sys_dic` VALUES ('292', '2', '停用', null, '1', '289', null);
INSERT INTO `aos_sys_dic` VALUES ('294', '1', '缺省', null, '1', '293', null);
INSERT INTO `aos_sys_dic` VALUES ('307', '3', '未知', null, '1', '306', '');
INSERT INTO `aos_sys_dic` VALUES ('308', '1', '男', null, '1', '306', null);
INSERT INTO `aos_sys_dic` VALUES ('309', '2', '女', null, '1', '306', null);
INSERT INTO `aos_sys_dic` VALUES ('310', '2', '超级用户', null, '1', '293', null);
INSERT INTO `aos_sys_dic` VALUES ('311', '4', '系统封锁', null, '1', '289', null);
INSERT INTO `aos_sys_dic` VALUES ('312', '3', '注册用户', null, '1', '293', null);
INSERT INTO `aos_sys_dic` VALUES ('315', '1', '缺省', null, '1', '314', null);
INSERT INTO `aos_sys_dic` VALUES ('322', '1', '缺省', null, '1', '321', null);
INSERT INTO `aos_sys_dic` VALUES ('335', '1', '经办权限', null, '1', '334', null);
INSERT INTO `aos_sys_dic` VALUES ('336', '2', '管理权限', null, '1', '334', null);
INSERT INTO `aos_sys_dic` VALUES ('353', 'blue', 'blue.png', null, '1', '352', null);
INSERT INTO `aos_sys_dic` VALUES ('354', 'gray', 'gray.png', null, '1', '352', null);
INSERT INTO `aos_sys_dic` VALUES ('355', 'neptune', 'neptune.png', null, '1', '352', null);
INSERT INTO `aos_sys_dic` VALUES ('356', 'aos', 'aos.png', null, '1', '352', null);
INSERT INTO `aos_sys_dic` VALUES ('358', 'blue', '#DFE8F6', null, '1', '357', null);
INSERT INTO `aos_sys_dic` VALUES ('360', 'gray', '#F0F0F0', null, '1', '357', null);
INSERT INTO `aos_sys_dic` VALUES ('361', 'neptune', '#D0DDF2', null, '1', '357', null);
INSERT INTO `aos_sys_dic` VALUES ('362', 'aos', 'red', null, '1', '357', null);
INSERT INTO `aos_sys_dic` VALUES ('367', 'neptune', '#006699', null, '1', '365', null);
INSERT INTO `aos_sys_dic` VALUES ('368', 'blue', '#6699CC', null, '1', '365', null);
INSERT INTO `aos_sys_dic` VALUES ('369', 'gray', '#888888', null, '1', '365', null);
INSERT INTO `aos_sys_dic` VALUES ('370', 'aos', '#006699', null, '1', '365', null);
INSERT INTO `aos_sys_dic` VALUES ('372', 'neptune', '#FAFAFA', null, '1', '371', null);
INSERT INTO `aos_sys_dic` VALUES ('373', 'blue', '#3399FF', null, '1', '371', null);
INSERT INTO `aos_sys_dic` VALUES ('374', 'gray', '#555555', null, '1', '371', null);
INSERT INTO `aos_sys_dic` VALUES ('375', 'aos', '#FAFAFA', null, '1', '371', null);
INSERT INTO `aos_sys_dic` VALUES ('377', 'neptune', 'left-logo.png', null, '1', '376', null);
INSERT INTO `aos_sys_dic` VALUES ('378', 'blue', 'left-logo.png', null, '1', '376', null);
INSERT INTO `aos_sys_dic` VALUES ('379', 'gray', 'left-logo.png', null, '1', '376', null);
INSERT INTO `aos_sys_dic` VALUES ('380', 'aos', 'left-logo.png', null, '1', '376', null);
INSERT INTO `aos_sys_dic` VALUES ('405', '1', '小图标[16X16]', null, '1', '404', null);
INSERT INTO `aos_sys_dic` VALUES ('406', '2', '大图标[64X64]', null, '1', '404', null);
INSERT INTO `aos_sys_dic` VALUES ('407', '3', '矢量图标', null, '1', '404', null);
INSERT INTO `aos_sys_dic` VALUES ('456', '1', '按钮|菜单下拉项', null, '1', '122', null);
INSERT INTO `aos_sys_dic` VALUES ('463', '1', '未授权', null, '1', '462', null);
INSERT INTO `aos_sys_dic` VALUES ('464', '2', '显示', null, '1', '462', null);
INSERT INTO `aos_sys_dic` VALUES ('465', '3', '隐藏', null, '1', '462', null);
INSERT INTO `aos_sys_dic` VALUES ('466', '4', '只读', null, '1', '462', null);
INSERT INTO `aos_sys_dic` VALUES ('467', '5', '编辑', null, '1', '462', null);
INSERT INTO `aos_sys_dic` VALUES ('468', '6', '禁用', null, '1', '462', null);
INSERT INTO `aos_sys_dic` VALUES ('469', '7', '激活', null, '1', '462', null);
INSERT INTO `aos_sys_dic` VALUES ('472', '99', '撤消授权', null, '1', '462', null);
INSERT INTO `aos_sys_dic` VALUES ('544', '1', '在线设计', null, '1', '543', null);
INSERT INTO `aos_sys_dic` VALUES ('545', '2', '在线克隆', null, '1', '543', null);
INSERT INTO `aos_sys_dic` VALUES ('551', '3', '导入离线文件', null, '1', '543', null);
INSERT INTO `aos_sys_dic` VALUES ('553', '1', '运行中', null, '1', '552', null);
INSERT INTO `aos_sys_dic` VALUES ('554', '2', '已结束', null, '1', '552', null);
INSERT INTO `aos_sys_dic` VALUES ('648', 'classic', '经典主题', null, '1', '647', '上Banner-左导航-中经办。');
INSERT INTO `aos_sys_dic` VALUES ('650', 'blue', '天蓝', null, '1', '649', null);
INSERT INTO `aos_sys_dic` VALUES ('651', 'gray', '银灰', null, '1', '649', null);
INSERT INTO `aos_sys_dic` VALUES ('652', 'neptune', '海王星(水蓝)', null, '1', '649', null);
INSERT INTO `aos_sys_dic` VALUES ('653', 'aos', 'AOS', null, '0', '649', '');
INSERT INTO `aos_sys_dic` VALUES ('655', 'tab', 'Tab风格', null, '1', '654', '支持打开多个业务经办界面。');
INSERT INTO `aos_sys_dic` VALUES ('656', 'page', '单页风格', null, '0', '654', '只能打开一个功能页面');
INSERT INTO `aos_sys_dic` VALUES ('658', '1', '同级', null, '1', '657', '水平导航按钮和垂直导航的卡片属于统一层级。');
INSERT INTO `aos_sys_dic` VALUES ('659', '2', '级联', null, '0', '657', '水平导航按钮和垂直导航的卡片有上下级级联导航关系');
INSERT INTO `aos_sys_dic` VALUES ('661', 'true', '显示', null, '1', '660', null);
INSERT INTO `aos_sys_dic` VALUES ('662', 'false', '隐藏', null, '1', '660', null);
INSERT INTO `aos_sys_dic` VALUES ('664', 'tight', '组合按钮', null, '1', '663', null);
INSERT INTO `aos_sys_dic` VALUES ('665', 'standalone', '独立按钮', null, '1', '663', null);
INSERT INTO `aos_sys_dic` VALUES ('667', '1', '显示', null, '1', '666', null);
INSERT INTO `aos_sys_dic` VALUES ('668', '0', '隐藏', null, '1', '666', null);
INSERT INTO `aos_sys_dic` VALUES ('682', '1', '快捷菜单', null, '1', '681', null);
INSERT INTO `aos_sys_dic` VALUES ('683', '2', '浮动菜单', null, '1', '681', '欢迎页显示的Mac风格的浮动菜单');
INSERT INTO `aos_sys_dic` VALUES ('83', '1', '是', null, '1', '82', '');
INSERT INTO `aos_sys_dic` VALUES ('84', '0', '否', null, '1', '82', null);
INSERT INTO `aos_sys_dic` VALUES ('86', '0', '停用', null, '1', '85', null);
INSERT INTO `aos_sys_dic` VALUES ('87', '1', '启用', null, '1', '85', null);
INSERT INTO `aos_sys_dic` VALUES ('89', '1', 'APPID', null, '1', '88', null);
INSERT INTO `aos_sys_dic` VALUES ('90', '2', 'UUID', null, '1', '88', null);
INSERT INTO `aos_sys_dic` VALUES ('91', '3', 'DBSequence', null, '1', '88', null);

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
INSERT INTO `aos_sys_dic_index` VALUES ('122', 'page_el_type_', '页面元素类型', null, '39', '0.002.001', null);
INSERT INTO `aos_sys_dic_index` VALUES ('1636', 'page_type_', '页面类型', null, '39', '0.002.001', null);
INSERT INTO `aos_sys_dic_index` VALUES ('1670', 'nav_quick_layout_', '快捷菜单布局风格', null, '80', '0.002.006', '快捷菜单布局风格。');
INSERT INTO `aos_sys_dic_index` VALUES ('1673', 'nav_tab_index_', '导航缺省活动页', null, '80', '0.002.006', null);
INSERT INTO `aos_sys_dic_index` VALUES ('1685', 'suspension_state_', '实例/任务活动状态', null, '542', '0.002.001.001', null);
INSERT INTO `aos_sys_dic_index` VALUES ('1693', 'delegation_', '委派状态', null, '542', '0.002.001.001', '流程任务的委派代理状态');
INSERT INTO `aos_sys_dic_index` VALUES ('1698', 'proctask_status_', '任务状态', null, '542', '0.002.001.001', null);
INSERT INTO `aos_sys_dic_index` VALUES ('1704', 'cmp_border_color_', '组件边框颜色', null, '80', '0.002.006', null);
INSERT INTO `aos_sys_dic_index` VALUES ('1733', 'card_type_', '信用卡类型', null, '1732', '0.002.007', null);
INSERT INTO `aos_sys_dic_index` VALUES ('1752', 'webide_jdbc', 'WebIDE模块使用的JDBC连接', null, '80', '0.002.006', 'WebIDE模块使用的JDBC连接。');
INSERT INTO `aos_sys_dic_index` VALUES ('238', 'org_type_', '组织类型', null, '39', '0.002.001', null);
INSERT INTO `aos_sys_dic_index` VALUES ('289', 'user_status_', '用户状态', null, '39', '0.002.001', null);
INSERT INTO `aos_sys_dic_index` VALUES ('293', 'user_type_', '用户类型', null, '39', '0.002.001', null);
INSERT INTO `aos_sys_dic_index` VALUES ('306', 'sex_', '性别', null, '40', '0.002.002', null);
INSERT INTO `aos_sys_dic_index` VALUES ('314', 'post_type_', '岗位类型', null, '39', '0.002.001', null);
INSERT INTO `aos_sys_dic_index` VALUES ('321', 'role_type_', '角色类型', null, '39', '0.002.001', null);
INSERT INTO `aos_sys_dic_index` VALUES ('334', 'grant_type_', '权限类型', null, '39', '0.002.001', null);
INSERT INTO `aos_sys_dic_index` VALUES ('352', 'north_back_img_', '主页面north区域背景图片', null, '80', '0.002.006', null);
INSERT INTO `aos_sys_dic_index` VALUES ('357', 'south_back_color_', '主页面south区域背景颜色', null, '80', '0.002.006', null);
INSERT INTO `aos_sys_dic_index` VALUES ('365', 'main_text_color_', '边界区域字体主颜色', null, '80', '0.002.006', null);
INSERT INTO `aos_sys_dic_index` VALUES ('371', 'nav_text_color_', '导航文字颜色', null, '80', '0.002.006', null);
INSERT INTO `aos_sys_dic_index` VALUES ('376', 'left_logo_', 'Banner左边logo图标', null, '80', '0.002.006', null);
INSERT INTO `aos_sys_dic_index` VALUES ('404', 'icon_type_', '图标类型', null, '39', '0.002.001', null);
INSERT INTO `aos_sys_dic_index` VALUES ('462', 'cmp_grant_type_', '界面元素授权类型', null, '39', '0.002.001', '');
INSERT INTO `aos_sys_dic_index` VALUES ('543', 'create_type_', '流程模型创建方式', null, '542', '0.002.001.001', '业务流程模型创建方式');
INSERT INTO `aos_sys_dic_index` VALUES ('552', 'procinst_status_', '流程实例状态', null, '542', '0.002.001.001', null);
INSERT INTO `aos_sys_dic_index` VALUES ('647', 'theme_', '系统主题', null, '80', '0.002.006', '');
INSERT INTO `aos_sys_dic_index` VALUES ('649', 'skin_', '界面皮肤', null, '80', '0.002.006', '');
INSERT INTO `aos_sys_dic_index` VALUES ('654', 'layout_', '业务经办区域布局风格', null, '80', '0.002.006', '系统业务经办区域(center)布局风格。可选值：tab|page。缺省值：tab。tab：支持同时打开多个功能模块界面；page：当前只能打开1个功能界面。');
INSERT INTO `aos_sys_dic_index` VALUES ('657', 'nav_mode_', '导航模式', null, '80', '0.002.006', '顶部导航条和左侧树状导航的关系');
INSERT INTO `aos_sys_dic_index` VALUES ('660', 'is_show_top_nav_', '是否显示顶部导航条', null, '80', '0.002.006', '是否显示水平导航条。(只有在导航模式为1的情况，此设置才有效,导航模式为2，则水平导航条不会消失)。可选值：true| false。');
INSERT INTO `aos_sys_dic_index` VALUES ('663', 'navbar_btn_style_', '顶部导航条按钮风格', null, '80', '0.002.006', null);
INSERT INTO `aos_sys_dic_index` VALUES ('666', 'is_show_mac_nav_', '是否显示Mac浮动导航', null, '80', '0.002.006', null);
INSERT INTO `aos_sys_dic_index` VALUES ('681', 'module_user_nav_type', '导航菜单类型', null, '39', '0.002.001', '');
INSERT INTO `aos_sys_dic_index` VALUES ('82', 'bool_', '是否布尔值字典', null, '40', '0.002.002', '');
INSERT INTO `aos_sys_dic_index` VALUES ('85', 'enabled_', '使能状态', null, '40', '0.002.002', '');
INSERT INTO `aos_sys_dic_index` VALUES ('88', 'sequence_type_', 'ID类型', null, '39', '0.002.001', '');

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
INSERT INTO `aos_sys_icon` VALUES ('8836', 'add2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8837', 'against.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8838', 'agree.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8839', 'app_columns.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8840', 'app_list.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8841', 'bars.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('8842', 'basket.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8843', 'book.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8844', 'book_user.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8845', 'bug.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8846', 'bullet_black.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8847', 'bullet_blue.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8848', 'bullet_green.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8849', 'bullet_group.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('8850', 'bullet_group2.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('8851', 'bullet_group3.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('8852', 'bullet_group4.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('8853', 'bullet_purple.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8854', 'bullet_red.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8855', 'bullet_yellow.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8856', 'chart_curve.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8857', 'chart_flipped.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8858', 'chart_line.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8859', 'chart_pie.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8860', 'close.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8861', 'config.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8862', 'config1.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8863', 'config3.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8864', 'connect.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8865', 'copy.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8866', 'cut.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8867', 'cv.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8868', 'c_key.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8869', 'database.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8870', 'database_add.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8871', 'del.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8872', 'del1.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8873', 'del2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8874', 'del3.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8875', 'del_folder.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8876', 'del_page.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8877', 'detail.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8878', 'disconnect.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8879', 'doc_ok.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8880', 'down.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8881', 'edit.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8882', 'edit2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8883', 'email.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8884', 'email2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8885', 'email3.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8886', 'email_go.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8887', 'email_open.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8888', 'exit.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8889', 'exit2.png', '1');
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
INSERT INTO `aos_sys_icon` VALUES ('8890', 'filter.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8891', 'folder1.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8892', 'folder10.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8893', 'folder11.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8894', 'folder12.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8895', 'folder13.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8896', 'folder14.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8897', 'folder15.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8898', 'folder16.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8899', 'folder17.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8900', 'folder18.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8901', 'folder19.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8902', 'folder2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8903', 'folder20.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8904', 'folder21.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8905', 'folder22.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8906', 'folder23.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8907', 'folder24.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8908', 'folder25.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8909', 'folder26.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8910', 'folder27.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8911', 'folder28.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8912', 'folder4.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8913', 'folder5.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8914', 'folder6.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8915', 'folder7.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8916', 'folder8.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8917', 'folder9.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8918', 'forward.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8919', 'freelance.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8920', 'go.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('8921', 'go.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8922', 'go1.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('8923', 'go1.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8924', 'help.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8925', 'home.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('8926', 'home.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8927', 'icon134.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8928', 'icon137.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8929', 'icon140.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8930', 'icon141.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8931', 'icon146.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8932', 'icon15.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8933', 'icon150.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8934', 'icon152.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8935', 'icon153.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8936', 'icon154.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8937', 'icon17.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('8938', 'icon25.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('8939', 'icon26.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('8940', 'icon31.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('8941', 'icon32.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('8942', 'icon34.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('8943', 'icon35.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('8944', 'icon36.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('8945', 'icon37.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('8946', 'icon38.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('8947', 'icon39.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('8948', 'icon41.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('8949', 'icon42.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('8950', 'icon5.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8951', 'icon56.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8952', 'icon59.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8953', 'icon63.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8954', 'icon65.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8955', 'icon66.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8956', 'icon67.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8957', 'icon68.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8958', 'icon7.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8959', 'icon70.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8960', 'icon71.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8961', 'icon72.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8962', 'icon75.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8963', 'icon76.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8964', 'icon77.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8965', 'icon78.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8966', 'icon79.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8967', 'icon8.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8968', 'icon80.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8969', 'icon82.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8970', 'icon85.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8971', 'icon86.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8972', 'icon88.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8973', 'icon9.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8974', 'icon96.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8975', 'icon_19.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8976', 'icq.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8977', 'id.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8978', 'jar.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8979', 'key.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8980', 'layout.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8981', 'layout2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8982', 'left.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8983', 'lightbulb.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8984', 'lock.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8985', 'lock3.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8986', 'modules_wizard.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('8987', 'monitor.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8988', 'node.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8989', 'ok.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8990', 'ok1.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8991', 'ok2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8992', 'ok3.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8993', 'ok4.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8994', 'ok5.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8995', 'org.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8996', 'org2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8997', 'own.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8998', 'page.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('8999', 'page2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9000', 'page3.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9001', 'page_code.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9002', 'page_font.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9003', 'page_next.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9004', 'page_office.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9005', 'page_paint.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9006', 'page_picture.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9007', 'page_vector.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9008', 'paint2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9009', 'paste.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9010', 'picture.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9011', 'pictures.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9012', 'picture_empty.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9013', 'plugin.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9014', 'plugin1.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9015', 'plugin2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9016', 'printer.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9017', 'query.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9018', 'refresh.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9019', 'refresh1.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9020', 'refresh2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9021', 'refresh3.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9022', 'right.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9023', 'save.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9024', 'save_all.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9025', 'search.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9026', 'security.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9027', 'send_receive.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9028', 'shape_align_bottom.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9029', 'shape_align_center.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9030', 'shape_align_middle.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9031', 'shape_group.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9032', 'shape_handles.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9033', 'shape_move_back.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9034', 'share.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9035', 'sitemap.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9036', 'sql.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9037', 'sql2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9038', 'sql3.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9039', 'stop.gif', '1');
INSERT INTO `aos_sys_icon` VALUES ('9040', 'stop2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9041', 'stop3.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9042', 'system.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9043', 'table.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9044', 'table2.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9045', 'tables.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9046', 'tables_relation.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9047', 'table_edit.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9048', 'tag.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9049', 'task.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9050', 'task1.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9051', 'task_finish.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9052', 'task_list.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9053', 'terminal.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9054', 'textfield.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9055', 'text_cap.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9056', 'text_col.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9057', 'text_list.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9058', 'text_upper.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9059', 'theme.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9060', 'time.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9061', 'timeline.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9062', 'up.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9063', 'user1.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9064', 'user20.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9065', 'user3.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9066', 'user6.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9067', 'user8.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9068', 'vcard.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9069', 'vector.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9070', 'wand.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9071', 'webcam.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9072', 'zoom_in.png', '1');
INSERT INTO `aos_sys_icon` VALUES ('9073', 'zoom_out.png', '1');

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
INSERT INTO `aos_sys_module` VALUES ('0', '0', 'AOS应用基础平台', '', '', 'p', '0', '1', 'home.png', '1', 'root', '', '1');
INSERT INTO `aos_sys_module` VALUES ('1680', '0.001.004.002', '流程建模', 'bpm/procModel/init.jhtml', null, '189', '1', '0', 'icon8.png', '1', '工作流', null, '10');
INSERT INTO `aos_sys_module` VALUES ('1688', '0.001.004.003', '流程配置与管理', 'bpm/procDef/init.jhtml', null, '189', '1', '0', 'icon79.png', '1', '工作流', null, '20');
INSERT INTO `aos_sys_module` VALUES ('1691', '0.001.004.006', '流程任务监管', 'bpm/procTask/init.jhtml', null, '189', '1', '0', 'task_list.png', '1', '工作流', null, '40');
INSERT INTO `aos_sys_module` VALUES ('1710', '0.001.004.007', '流程历史数据查询', null, null, '189', '1', '0', 'icon71.png', '1', '工作流', null, '90');
INSERT INTO `aos_sys_module` VALUES ('1711', '0.001.010', '数据集成', null, null, '183', '0', '0', 'folder10.png', '1', '控制台', null, '55');
INSERT INTO `aos_sys_module` VALUES ('1712', '0.001.010.001', '数据管道', null, null, '1711', '1', '0', 'tables_relation.png', '1', '数据集成', null, '10');
INSERT INTO `aos_sys_module` VALUES ('1713', '0.001.011', '复杂事件处理', null, null, '183', '0', '0', 'folder6.png', '1', '控制台', null, '58');
INSERT INTO `aos_sys_module` VALUES ('1714', '0.001.011.001', '事件流定义', null, null, '1713', '1', '0', null, '1', '复杂事件处理', null, '10');
INSERT INTO `aos_sys_module` VALUES ('1722', '0.004.002.001.001', '表单布局①', 'demo/ui/initForm1.jhtml', '', '237', '1', '0', '', '1', '表单', '', '1');
INSERT INTO `aos_sys_module` VALUES ('1723', '0.004.002', 'AOS UI组件库', '', '', '236', '0', '1', '', '1', '范例', '', '10');
INSERT INTO `aos_sys_module` VALUES ('1724', '0.004.002.002', '按钮', 'demo/ui/initButton.jhtml', '', '1723', '1', '0', '', '1', 'AOS UI组件库', '', '10');
INSERT INTO `aos_sys_module` VALUES ('1725', '0.004.002.003', '表格', '', '', '1723', '0', '1', '', '1', 'AOS UI组件库', '', '30');
INSERT INTO `aos_sys_module` VALUES ('1726', '0.004.002.003.001', '表格①', 'demo/ui/grid/initGrid1.jhtml', '', '1725', '1', '0', '', '1', '表格', '', '10');
INSERT INTO `aos_sys_module` VALUES ('1727', '0.004.002.004', '报表', '', '', '1723', '0', '1', '', '1', 'AOS UI组件库', '', '40');
INSERT INTO `aos_sys_module` VALUES ('1728', '0.004.002.005', '图表', null, null, '1723', '1', '0', null, '1', 'AOS UI组件库', null, '50');
INSERT INTO `aos_sys_module` VALUES ('1736', '0.004.002.004.001', '报表①', 'demo/ui/report/initReport1.jhtml', '', '1727', '1', '0', '', '1', '报表', '', '1');
INSERT INTO `aos_sys_module` VALUES ('1737', '0.004.002.003.002', '表格②', 'demo/ui/grid/initGrid2.jhtml', null, '1725', '1', '0', null, '1', '表格', null, '20');
INSERT INTO `aos_sys_module` VALUES ('1738', '0.004.002.003.003', '可编辑表格', 'demo/ui/grid/initEditGrid.jhtml', '', '1725', '1', '0', '', '1', '表格', '', '30');
INSERT INTO `aos_sys_module` VALUES ('1739', '0.004.002.003.004', '客户端分页表格', 'demo/ui/grid/initGrid3.jhtml', null, '1725', '1', '0', null, '1', '表格', null, '40');
INSERT INTO `aos_sys_module` VALUES ('1743', '0.004.003', '综合', null, null, '236', '0', '0', null, '1', '范例', null, '20');
INSERT INTO `aos_sys_module` VALUES ('1744', '0.004.004', '杂项', '', '', '236', '0', '1', '', '1', '范例', '', '30');
INSERT INTO `aos_sys_module` VALUES ('1745', '0.004.003.001', '综合1', null, null, '1743', '1', '0', null, '1', '综合', null, '10');
INSERT INTO `aos_sys_module` VALUES ('1746', '0.004.004.001', '存储过程调用', 'demo/misc/procedure/init.jhtml', '', '1744', '1', '0', '', '1', '杂项', '', '10');
INSERT INTO `aos_sys_module` VALUES ('1747', '0.001.012', '作业调度', '', '', '183', '0', '0', 'folder8.png', '1', '控制台', '', '59');
INSERT INTO `aos_sys_module` VALUES ('1748', '0.001.012.001', '作业管理', null, null, '1747', '1', '0', null, '1', '作业调度', null, '10');
INSERT INTO `aos_sys_module` VALUES ('1750', '0.001.008.005', 'WebIDE集成开发', 'system/coder/init.jhtml', '', '555', '1', '0', 'terminal.png', '1', '开发工具箱', '', '5');
INSERT INTO `aos_sys_module` VALUES ('1762', '0.004.002.001.002', '表单布局②', 'demo/ui/initForm2.jhtml', '', '237', '1', '0', '', '1', '表单', '', '2');
INSERT INTO `aos_sys_module` VALUES ('1763', '0.004.004.002', '消息通知窗口', 'demo/ui/notificationInit.jhtml', '', '1744', '1', '0', '', '1', '杂项', '', '2');
INSERT INTO `aos_sys_module` VALUES ('1764', '0.004.002.001.003', '表单布局③', 'demo/ui/initForm3.jhtml', '', '237', '1', '0', '', '1', '表单', '', '3');
INSERT INTO `aos_sys_module` VALUES ('1765', '0.004.002.001.004', '表单布局④', 'demo/ui/initForm4.jhtml', '', '237', '1', '0', '', '1', '表单', '', '4');
INSERT INTO `aos_sys_module` VALUES ('1766', '0.004.002.001.005', '常用表单元素', 'demo/ui/initFormElements.jhtml', '', '237', '1', '0', '', '1', '表单', '', '10');
INSERT INTO `aos_sys_module` VALUES ('1767', '0.004.002.001.006', '组合选择框', 'demo/ui/initFormComboBox.jhtml', '', '237', '1', '0', '', '1', '表单', '', '20');
INSERT INTO `aos_sys_module` VALUES ('183', '0.001', '控制台', null, null, '0', '0', '1', 'folder22.png', '1', 'AOS应用基础平台', 'fa-cogs', '10');
INSERT INTO `aos_sys_module` VALUES ('184', '0.002', '工作台', null, null, '0', '0', '1', 'folder23.png', '1', 'AOS应用基础平台', 'fa-github-alt', '20');
INSERT INTO `aos_sys_module` VALUES ('186', '0.001.001', '基础数据', null, null, '183', '0', '1', 'folder2.png', '1', '控制台', null, '10');
INSERT INTO `aos_sys_module` VALUES ('187', '0.001.002', '资源', null, null, '183', '0', '1', 'folder14.png', '1', '控制台', null, '20');
INSERT INTO `aos_sys_module` VALUES ('188', '0.001.003', '组织与权限', null, null, '183', '0', '1', 'folder5.png', '1', '控制台', null, '30');
INSERT INTO `aos_sys_module` VALUES ('189', '0.001.004', '工作流', null, null, '183', '0', '1', 'folder24.png', '1', '控制台', null, '40');
INSERT INTO `aos_sys_module` VALUES ('190', '0.001.005', '服务治理', null, null, '183', '0', '0', 'folder7.png', '1', '控制台', null, '50');
INSERT INTO `aos_sys_module` VALUES ('191', '0.001.006', '监控与审计', '', '', '183', '0', '0', 'folder27.png', '1', '控制台', '', '60');
INSERT INTO `aos_sys_module` VALUES ('192', '0.001.001.001', '键值参数', 'system/param/init.jhtml', '', '186', '1', '0', 'icon79.png', '1', '基础数据', '', '1');
INSERT INTO `aos_sys_module` VALUES ('193', '0.001.001.002', '字典参数', 'system/dictionary/init.jhtml', '', '186', '1', '0', 'icon154.png', '1', '基础数据', '', '10');
INSERT INTO `aos_sys_module` VALUES ('194', '0.001.001.003', '分类科目', 'system/catalog/init.jhtml', null, '186', '1', '0', 'icon146.png', '1', '基础数据', null, '20');
INSERT INTO `aos_sys_module` VALUES ('195', '0.001.002.004', '序列号', 'system/idMgr/init.jhtml', null, '187', '1', '0', 'id.png', '1', '资源', null, '30');
INSERT INTO `aos_sys_module` VALUES ('197', '0.001.002.001', '功能模块', 'system/module/init.jhtml', '', '187', '1', '0', 'icon75.png', '1', '资源', '', '10');
INSERT INTO `aos_sys_module` VALUES ('199', '0.001.003.001', '组织架构', 'system/org/init.jhtml', null, '188', '1', '0', 'icon56.png', '1', '组织与权限', null, '1');
INSERT INTO `aos_sys_module` VALUES ('200', '0.001.003.002', '岗位与授权', 'system/post/init.jhtml', null, '188', '1', '0', 'icon137.png', '1', '组织与权限', null, '3');
INSERT INTO `aos_sys_module` VALUES ('201', '0.001.003.003', '用户与授权', 'system/user/init.jhtml', null, '188', '1', '0', 'user6.png', '1', '组织与权限', null, '4');
INSERT INTO `aos_sys_module` VALUES ('203', '0.001.005.001', '服务注册', null, null, '190', '1', '0', null, '1', '服务治理', null, '1');
INSERT INTO `aos_sys_module` VALUES ('204', '0.001.006.001', '数据审计', null, null, '191', '1', '0', null, '1', '监控与审计', null, '1');
INSERT INTO `aos_sys_module` VALUES ('205', '0.001.006.002', '业务经办日志', null, null, '191', '1', '0', null, '1', '监控与审计', null, '3');
INSERT INTO `aos_sys_module` VALUES ('207', '0.002.001', '首选项', 'system/preference/init.jhtml', null, '184', '1', '0', 'config1.png', '1', '工作台', null, '10');
INSERT INTO `aos_sys_module` VALUES ('212', '0.002.006', '我的流程', null, null, '184', '1', '1', 'icon8.png', '1', '工作台', null, '40');
INSERT INTO `aos_sys_module` VALUES ('213', '0.002.007', '我的任务', 'bpm/mytask/init.jhtml', null, '184', '1', '1', 'task_list.png', '1', '工作台', null, '30');
INSERT INTO `aos_sys_module` VALUES ('225', '0.001.008.002', 'WebSQL视窗管理', 'system/webSql/init.jhtml', '', '555', '1', '0', 'sql.png', '1', '开发工具箱', '', '10');
INSERT INTO `aos_sys_module` VALUES ('227', '0.001.008.003', 'AOS开发指南', '', '', '555', '1', '0', 'lightbulb.png', '1', '开发工具箱', '', '90');
INSERT INTO `aos_sys_module` VALUES ('228', '0.001.008.004', 'AOS开发者社区', '', '', '555', '1', '0', 'icq.png', '1', '开发工具箱', '', '91');
INSERT INTO `aos_sys_module` VALUES ('236', '0.004', '范例', '', '', '0', '0', '1', 'folder27.png', '1', 'AOS应用基础平台', 'fa-coffee', '40');
INSERT INTO `aos_sys_module` VALUES ('237', '0.004.002.001', '表单', '', '', '1723', '0', '1', '', '1', 'AOS UI组件库', '', '20');
INSERT INTO `aos_sys_module` VALUES ('242', '0.001.006.004', '系统管理日志', null, null, '191', '1', '0', null, '1', '监控与审计', null, '2');
INSERT INTO `aos_sys_module` VALUES ('304', '0.001.003.006', '角色与授权', 'system/role/init.jhtml', '', '188', '1', '0', 'icon134.png', '1', '组织与权限', '', '5');
INSERT INTO `aos_sys_module` VALUES ('393', '0.001.008.001', '图标大全', 'system/icon/init.jhtml', '', '555', '1', '0', 'page_picture.png', '1', '开发工具箱', '', '60');
INSERT INTO `aos_sys_module` VALUES ('454', '0.001.002.003', '页面组件', 'system/page/init.jhtml', null, '187', '1', '0', 'icon59.png', '1', '资源', null, '20');
INSERT INTO `aos_sys_module` VALUES ('486', '0.001.004.005', '流程实例监管', 'bpm/procInst/init.jhtml', null, '189', '1', '0', 'icon5.png', '1', '工作流', null, '30');
INSERT INTO `aos_sys_module` VALUES ('489', '0.002.005', '我的消息', null, null, '184', '1', '0', 'email2.png', '1', '工作台', null, '20');
INSERT INTO `aos_sys_module` VALUES ('555', '0.001.008', '开发工具箱', '', '', '183', '0', '0', 'folder9.png', '1', '控制台', 'fa-bug', '70');
INSERT INTO `aos_sys_module` VALUES ('615', '0.001.002.006', '流文件', 'system/byteObj/init.jhtml', null, '187', '1', '0', 'page_office.png', '1', '资源', null, '40');

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
INSERT INTO `aos_sys_module_role` VALUES ('4277', '541', '0', '1', '2015-07-07 19:58:29', '1');
INSERT INTO `aos_sys_module_role` VALUES ('4278', '541', '184', '1', '2015-07-07 19:58:29', '1');
INSERT INTO `aos_sys_module_role` VALUES ('4279', '541', '207', '1', '2015-07-07 19:58:29', '1');
INSERT INTO `aos_sys_module_role` VALUES ('4280', '541', '489', '1', '2015-07-07 19:58:29', '1');
INSERT INTO `aos_sys_module_role` VALUES ('4281', '541', '213', '1', '2015-07-07 19:58:29', '1');

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
INSERT INTO `aos_sys_module_user` VALUES ('4308', '21', '0', '1', '2015-07-08 21:55:28', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4309', '21', '183', '1', '2015-07-08 21:55:28', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4310', '21', '186', '1', '2015-07-08 21:55:28', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4311', '21', '192', '1', '2015-07-08 21:55:28', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4312', '21', '193', '1', '2015-07-08 21:55:28', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4313', '21', '194', '1', '2015-07-08 21:55:28', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4314', '21', '187', '1', '2015-07-08 21:55:28', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4315', '21', '197', '1', '2015-07-08 21:55:28', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4316', '21', '454', '1', '2015-07-08 21:55:28', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4317', '21', '195', '1', '2015-07-08 21:55:28', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4318', '21', '615', '1', '2015-07-08 21:55:28', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4320', '21', '188', '1', '2015-07-08 21:55:28', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4321', '21', '199', '1', '2015-07-08 21:55:28', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4322', '21', '200', '1', '2015-07-08 21:55:28', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4323', '21', '201', '1', '2015-07-08 21:55:28', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4324', '21', '304', '1', '2015-07-08 21:55:28', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4325', '21', '0', '2', '2015-07-08 21:56:33', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4326', '21', '183', '2', '2015-07-08 21:56:33', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4327', '21', '186', '2', '2015-07-08 21:56:33', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4328', '21', '192', '2', '2015-07-08 21:56:33', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4329', '21', '193', '2', '2015-07-08 21:56:33', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4330', '21', '194', '2', '2015-07-08 21:56:33', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4331', '21', '187', '2', '2015-07-08 21:56:33', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4332', '21', '197', '2', '2015-07-08 21:56:34', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4333', '21', '454', '2', '2015-07-08 21:56:34', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4334', '21', '195', '2', '2015-07-08 21:56:34', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4335', '21', '615', '2', '2015-07-08 21:56:34', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4355', '20', '0', '1', '2015-07-24 21:29:31', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4356', '20', '183', '1', '2015-07-24 21:29:31', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4357', '20', '186', '1', '2015-07-24 21:29:31', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4358', '20', '192', '1', '2015-07-24 21:29:31', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4359', '20', '193', '1', '2015-07-24 21:29:31', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4360', '20', '194', '1', '2015-07-24 21:29:31', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4361', '20', '236', '1', '2015-07-24 21:29:31', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4362', '20', '1723', '1', '2015-07-24 21:29:31', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4363', '20', '1724', '1', '2015-07-24 21:29:31', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4364', '20', '237', '1', '2015-07-24 21:29:31', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4365', '20', '1722', '1', '2015-07-24 21:29:31', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4366', '20', '1725', '1', '2015-07-24 21:29:31', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4367', '20', '1726', '1', '2015-07-24 21:29:32', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4368', '20', '1737', '1', '2015-07-24 21:29:32', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4369', '20', '1738', '1', '2015-07-24 21:29:32', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4370', '20', '1739', '1', '2015-07-24 21:29:32', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4371', '20', '1727', '1', '2015-07-24 21:29:32', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4372', '20', '1736', '1', '2015-07-24 21:29:32', '1');
INSERT INTO `aos_sys_module_user` VALUES ('4373', '20', '1728', '1', '2015-07-24 21:29:32', '1');

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
INSERT INTO `aos_sys_module_user_nav` VALUES ('1', '192', '1', '25.png', '2', '0');
INSERT INTO `aos_sys_module_user_nav` VALUES ('2', '193', '1', '11.png', '2', '0');
INSERT INTO `aos_sys_module_user_nav` VALUES ('3', '200', '1', '30.png', '2', '0');
INSERT INTO `aos_sys_module_user_nav` VALUES ('3401', '194', '1', '32.png', '2', '4');
INSERT INTO `aos_sys_module_user_nav` VALUES ('3588', '0', '15', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('3589', '183', '15', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('3590', '186', '15', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('3591', '192', '15', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('3592', '193', '15', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('3593', '194', '15', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('3594', '187', '15', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('3595', '454', '15', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('3596', '195', '15', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('3597', '190', '15', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('3598', '203', '15', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('3599', '184', '15', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('3600', '207', '15', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('3601', '489', '15', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('3602', '213', '15', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('3603', '211', '15', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('3604', '495', '15', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('3605', '497', '15', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('3606', '192', '15', '28.png', '2', '1');
INSERT INTO `aos_sys_module_user_nav` VALUES ('4', '201', '1', '41.png', '2', '0');
INSERT INTO `aos_sys_module_user_nav` VALUES ('4177', '0', '1', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('4178', '183', '1', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('4179', '186', '1', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('4180', '192', '1', null, '1', '1');
INSERT INTO `aos_sys_module_user_nav` VALUES ('4181', '193', '1', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('4182', '194', '1', null, '1', '3');
INSERT INTO `aos_sys_module_user_nav` VALUES ('4183', '187', '1', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('4184', '197', '1', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('4185', '454', '1', null, '1', '4');
INSERT INTO `aos_sys_module_user_nav` VALUES ('4186', '195', '1', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('4187', '615', '1', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('4189', '188', '1', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('4190', '199', '1', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('4191', '200', '1', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('4192', '201', '1', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('4193', '304', '1', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('4194', '189', '1', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('4195', '533', '1', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('4196', '534', '1', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('4197', '202', '1', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('4198', '535', '1', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('4199', '486', '1', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('4200', '499', '1', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('4201', '500', '1', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('4202', '555', '1', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('4203', '393', '1', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('4204', '225', '1', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('4205', '217', '1', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('4206', '220', '1', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('4207', '222', '1', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('4208', '184', '1', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('4209', '207', '1', null, '1', '2');
INSERT INTO `aos_sys_module_user_nav` VALUES ('4210', '489', '1', null, '1', null);
INSERT INTO `aos_sys_module_user_nav` VALUES ('5', '304', '1', '28.png', '2', '0');
INSERT INTO `aos_sys_module_user_nav` VALUES ('6', '199', '1', '7.png', '2', '0');
INSERT INTO `aos_sys_module_user_nav` VALUES ('7', '197', '1', '51.png', '2', '0');

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
INSERT INTO `aos_sys_org` VALUES ('0', '0', '中国嘉靖银行', '', 'p', 'root', '0', '1', 'home.png', '1', '1', '', '', '2012-01-01 12:12:12', '1', '0');
INSERT INTO `aos_sys_org` VALUES ('284', '0.007', '项目部', null, '0', '中国嘉靖银行', '1', '0', null, '1', '1', null, null, '2012-01-01 12:12:12', '1', '3');
INSERT INTO `aos_sys_org` VALUES ('285', '0.003', '产品部', null, '0', '中国嘉靖银行', '1', '0', null, '1', '1', null, null, '2012-01-01 12:12:12', '1', '2');
INSERT INTO `aos_sys_org` VALUES ('286', '0.004', '软件过程支持部', null, '0', '中国嘉靖银行', '1', '0', null, '1', '1', null, null, '2012-01-01 12:12:12', '1', '4');
INSERT INTO `aos_sys_org` VALUES ('287', '0.005', '总务办', null, '0', '中国嘉靖银行', '0', '1', null, '1', '1', null, null, '2012-01-01 12:12:12', '1', '5');
INSERT INTO `aos_sys_org` VALUES ('288', '0.008', '市场部', null, '0', '中国嘉靖银行', '1', '0', null, '1', '1', null, null, '2012-01-01 12:12:12', '1', '1');
INSERT INTO `aos_sys_org` VALUES ('424', '0.005.001', '部门1', null, '287', '总务办', '0', '1', null, '1', '1', null, null, '2012-01-01 12:12:12', '1', '1');
INSERT INTO `aos_sys_org` VALUES ('441', '0.005.001.001', '部门1-1', null, '424', '部门1', '1', '0', null, '1', '1', null, null, '2012-01-01 12:12:12', '4', '1');

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
INSERT INTO `aos_sys_page` VALUES ('1646', '207', '我的个人资料', 'initMyInfo.jhtml', '2', '1', '1', 'vcard.png', null, null, '1');
INSERT INTO `aos_sys_page` VALUES ('1647', '207', '我的偏好设置', 'initMySettings.jhtml', '2', '1', '0', 'icon79.png', null, null, '2');
INSERT INTO `aos_sys_page` VALUES ('1648', '207', '系统安全选项', 'initSecurityCfg.jhtml', '2', '1', '0', 'system.png', null, null, '3');
INSERT INTO `aos_sys_page` VALUES ('1649', '207', '自定义菜单', 'initMyNav.jhtml', '2', '1', '0', 'icon_19.png', null, null, '4');
INSERT INTO `aos_sys_page` VALUES ('1650', '207', '我的操作日志', null, '2', '1', '0', 'icon75.png', null, null, '6');
INSERT INTO `aos_sys_page` VALUES ('1652', '207', '分割符', null, '4', '1', '0', null, null, null, '5');
INSERT INTO `aos_sys_page` VALUES ('1677', '393', '小图标[16X16]', 'initIconList.jhtml?type_=1', '2', '1', '1', 'pictures.png', null, null, '1');
INSERT INTO `aos_sys_page` VALUES ('1678', '393', '大图标[64X64]', 'initIconList.jhtml?type_=2', '2', '1', '0', 'picture.png', null, null, '2');
INSERT INTO `aos_sys_page` VALUES ('1679', '393', '矢量图标', 'initIconList.jhtml?type_=3', '2', '1', '0', 'vector.png', null, null, '4');
INSERT INTO `aos_sys_page` VALUES ('1701', '213', '待办任务', 'initDo.jhtml', '2', '1', '1', 'task_list.png', null, null, '10');
INSERT INTO `aos_sys_page` VALUES ('1702', '213', '已办任务', 'initDone.jhtml', '2', '1', '0', 'task_finish.png', null, null, '20');
INSERT INTO `aos_sys_page` VALUES ('1703', '393', '分隔符', null, '4', '1', '0', null, null, null, '3');

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
INSERT INTO `aos_sys_page_el` VALUES ('1666', '_btn_demo', '文本按钮', '1', '207', '207', '演示页面元素授权');
INSERT INTO `aos_sys_page_el` VALUES ('1667', '_btn_save_demo', '个人信息保存按钮', '1', '207', '1646', '演示页面元素授权');
INSERT INTO `aos_sys_page_el` VALUES ('477', '_btn_add_demo', '弹出新增参数窗口按钮', '1', '192', '192', null);

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
INSERT INTO `aos_sys_param` VALUES ('1668', 'nav_tab_index_', '0', '423', '0.001.002.004', '导航缺省活动页', '1', 'nav_tab_index_', '左侧布局的导航卡片缺省激活的卡片索引号，索引下标从0开始。');
INSERT INTO `aos_sys_param` VALUES ('1669', 'nav_quick_layout_', '1', '423', '0.001.002.004', '快捷菜单布局风格', '1', 'nav_quick_layout_', '快捷菜单布局风格。1:平铺。2：树状。');
INSERT INTO `aos_sys_param` VALUES ('1740', 'app_ico', '/static/icon/ico/aos2.ico', '413', '0.001.002.002', '应用系统小图标', '0', null, '浏览器标题栏左上角显示');
INSERT INTO `aos_sys_param` VALUES ('1741', 'json_format', '1', '413', '0.001.002.002', 'JSON输出模式', '0', '', ' json输出模式。0：格式化输出模式；1：压缩模式。');
INSERT INTO `aos_sys_param` VALUES ('1742', 'run_mode_', '0', '414', '0.001.002.003', '运行模式', '0', '', '0：开发模式；1：生产模式；2：在线体验模式');
INSERT INTO `aos_sys_param` VALUES ('1749', 'page_load_msg_', '正在拼命加载页面, 请稍等...', '413', '0.001.002.002', '页面加载等待提示信息', '0', null, null);
INSERT INTO `aos_sys_param` VALUES ('1751', 'coder_project_rootpath_', '0', '414', '0.001.002.003', '代码生成器使用的工程根目录', '0', null, '代码生成器的工程跟目录。如果为0则自动获取。');
INSERT INTO `aos_sys_param` VALUES ('1761', 'treenode_cursor_', 'pointer', '413', '0.001.002.002', '树节点鼠标光标样式', '0', '', '缺省值：pointer。可选值：任何符合Css的cursor属性定义的值。default | pointer | auto等。');
INSERT INTO `aos_sys_param` VALUES ('1768', 'combobox_emptytext', '请选择...', '413', '0.001.002.002', '下拉选择框的缺省提示信息', '0', null, null);
INSERT INTO `aos_sys_param` VALUES ('302', 'theme_', 'classic', '413', '0.001.002.002', '系统主题风格', '1', 'theme_', '可选值：classic。缺省值：classic。');
INSERT INTO `aos_sys_param` VALUES ('303', 'layout_', 'tab', '413', '0.001.002.002', 'Center区域布局风格', '1', 'layout_', '系统业务经办区域(center)布局风格。可选值：tab|page。缺省值：tab。tab：支持同时打开多个功能模块界面；page：当前只能打开1个功能界面。');
INSERT INTO `aos_sys_param` VALUES ('35', 'skin_', 'blue', '413', '0.001.002.002', '系统缺省皮肤', '1', 'skin_', '可选值：blue|gray|neptune|aos。缺省值：blue。');
INSERT INTO `aos_sys_param` VALUES ('359', 'copyright_', '2008-2015 OSWorks', '413', '0.001.002.002', '版权信息', '0', null, '版权信息');
INSERT INTO `aos_sys_param` VALUES ('36', 'tab_focus_color_', '#0099FF', '413', '0.001.002.002', 'Tab高亮颜色', '1', 'tab_focus_color_', '缺省的当前Tab卡片高亮提示颜色');
INSERT INTO `aos_sys_param` VALUES ('363', 'app_title_', 'AOS : JavaEE应用基础平台', '413', '0.001.002.002', '首页浏览器标题内容', '0', '', '首页浏览器标题内容');
INSERT INTO `aos_sys_param` VALUES ('37', 'prevent_rightclick_', 'false', '414', '0.001.002.003', '全局右键', '0', null, '阻止浏览器缺省鼠标右键事件。可选值：true|false。缺省值：true。');
INSERT INTO `aos_sys_param` VALUES ('382', 'nav_mode_', '1', '423', '0.001.002.004', '导航模式', '1', 'nav_mode_', '可选值，1：水平导航按钮和垂直导航的卡片属于统一层级；2：水平导航按钮和垂直导航的卡片有上下级级联导航关系。(当前模式2未实现)');
INSERT INTO `aos_sys_param` VALUES ('389', 'is_show_top_nav_', 'true', '423', '0.001.002.004', '水平导航条', '1', 'is_show_top_nav_', '是否显示水平导航条。(只有在导航模式为1的情况，此设置才有效,导航模式为2，则水平导航条不会消失)。可选值：true| false。');
INSERT INTO `aos_sys_param` VALUES ('390', 'navbar_btn_style_', 'tight', '423', '0.001.002.004', '导航条按钮风格', '1', 'navbar_btn_style_', '顶部水平导航条的按钮样式风格。tight：组合按钮；standalone：独立按钮。');
INSERT INTO `aos_sys_param` VALUES ('408', 'login_page_', 'login.ext.jsp', '414', '0.001.002.003', '登录页面', '0', null, 'Ext原生风格的登录界面');
INSERT INTO `aos_sys_param` VALUES ('409', 'vercode_show_', '1', '410', '0.001.002.001', '验证码开关', '0', '', '是否在登录页面显示验证码及后台验证码验证。可选值：0(否) | 1(是)。');
INSERT INTO `aos_sys_param` VALUES ('411', 'vercode_length_', '4', '410', '0.001.002.001', '验证码长度', '0', null, '验证码长度');
INSERT INTO `aos_sys_param` VALUES ('412', 'vercode_characters_', 'abcdetx2345678', '410', '0.001.002.001', '验证码待选字符集', '0', '', '验证码待选字符集。');
INSERT INTO `aos_sys_param` VALUES ('415', 'login_back_img_', '-1', '413', '0.001.002.002', '登录页面的背景图片', '0', null, '登录页面的背景图片。可选的预设背景图片为：0.jpg、1.jpg、2.jpg、3.jpg。如果需要随机出现背景，则将其设置为-1。');
INSERT INTO `aos_sys_param` VALUES ('416', 'page_load_gif_', 'wheel.gif', '413', '0.001.002.002', '页面刷新动画文件', '0', '', '页面刷新动画文件。可选的预设动画文件：run.gif、wheel.gif。动画path：/static/image/gif/pageload。');
INSERT INTO `aos_sys_param` VALUES ('417', 'dev_account_', 'root', '414', '0.001.002.003', '开发者登录帐号', '0', null, '登录页面开发者按钮登录帐号。可以配置为任何一个存在的帐号。');
INSERT INTO `aos_sys_param` VALUES ('418', 'dev_account_login_', '1', '414', '0.001.002.003', '开发者登录帐号开关', '0', null, '是否启用开发者登录帐号功能,如启用则在登录界面会出现[开发者]按钮。可选值：1 | 0。提示：系统若在生产模式下运行，则此配置忽略，自动关闭开发者登录功能。');
INSERT INTO `aos_sys_param` VALUES ('419', 'welcome_page_title_', '欢迎', '413', '0.001.002.002', '欢迎页标题', '0', null, '系统登录后第一个缺省打开的Tab页面的标题。缺省：\"欢迎\"。');
INSERT INTO `aos_sys_param` VALUES ('420', 'is_show_mac_nav_', '1', '423', '0.001.002.004', 'Mac导航显示开关', '1', 'is_show_mac_nav_', '欢迎页Mac导航显示开关。可选值：0 | 1。缺省值：1。');
INSERT INTO `aos_sys_param` VALUES ('585', 'show_login_win_head_', 'true', '413', '0.001.002.002', '是否显示登录窗口标题栏', '0', '', '是否显示登录窗口标题栏(Ext登录风格)。缺省值：false。可选值：true|false。');
INSERT INTO `aos_sys_param` VALUES ('586', 'is_show_statusbar_', 'true', '413', '0.001.002.002', '是否显示主界面状态栏', '0', null, '是否显示主界面状态栏。可选值：true|false。');
INSERT INTO `aos_sys_param` VALUES ('607', 'role_grant_mode_', '1', '414', '0.001.002.003', '角色授权模式', '0', null, '角色授权模式(角色可见度)。可选值：1|2。1：可见当前管理员创建的角色和当前管理员所属组织的其他管理员创建的角色。2：可见当前管理员创建的角色和当前管理员所属组织及其下级子孙组织的其他管理员创建的角色。');
INSERT INTO `aos_sys_param` VALUES ('609', 'grid_column_algin_', 'left', '413', '0.001.002.002', '表格列内容对齐方式', '0', '', '表格列对齐模式。有效值：left|center|right。');
INSERT INTO `aos_sys_param` VALUES ('623', 'byteobj_maxsize_', '50', '414', '0.001.002.003', '流文件最大值(KB)', '0', '', '单位：KB');
INSERT INTO `aos_sys_param` VALUES ('637', 'user_head_catalog_id_', '613', '414', '0.001.002.003', '用户头像流文件分类ID', '0', null, '用户头像流文件分类ID，分类科目中的用户头像分类ID。用户上传文件时使用。');
INSERT INTO `aos_sys_param` VALUES ('74', 'app_name_', 'AOS : JavaEE应用基础平台', '413', '0.001.002.002', '应用系统名称', '0', '', '应用系统名称');

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
INSERT INTO `aos_sys_post` VALUES ('538', '岗位1', '1', '1', '288', '2014-12-10 02:25:17', '1', '0.008');
INSERT INTO `aos_sys_post` VALUES ('539', '岗位2', '1', '1', '285', '2014-12-10 02:25:24', '1', '0.003');
INSERT INTO `aos_sys_post` VALUES ('540', '岗位3', '1', '1', '284', '2014-12-10 02:26:56', '1', '0.007');

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
INSERT INTO `aos_sys_role` VALUES ('449', '测试角色1', '1', '1', '2014-11-18 12:56:15', '4', '287', '0.005');
INSERT INTO `aos_sys_role` VALUES ('455', '测试角色', '1', '1', '2014-11-23 19:58:19', '4', '288', '0.008');
INSERT INTO `aos_sys_role` VALUES ('541', '角色1', '1', '1', '2014-12-10 02:28:26', '1', '0', '0');
INSERT INTO `aos_sys_role` VALUES ('605', '角色2', '1', '1', '2015-01-22 00:48:47', '1', '0', '0');

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
INSERT INTO `aos_sys_sequence` VALUES ('1', 'GID', '1', null, '1', '1', '1768', '1', null, null, null, '9999999999', '0', '1', '0', '1768', '系统管理-实体表流水号。');
INSERT INTO `aos_sys_sequence` VALUES ('1635', 'ICONID', '1', null, '1', '1', '9073', '1', null, null, null, '9223372036854775807', '0', '1', '0', '9073', '图标ID');
INSERT INTO `aos_sys_sequence` VALUES ('1729', 'DEMOID', '1', null, '1', '1', '6637', '1', null, null, null, '9223372036854775807', '0', '1', '0', '6637', '演示模块相关功能使用的ID发生器');
INSERT INTO `aos_sys_sequence` VALUES ('1730', 'CARDID', '1', '', '1', '1', '10004005', '1', '', '', null, '99999999', '0', '10000000', '0', '10004005', '范例系统卡号');
INSERT INTO `aos_sys_sequence` VALUES ('2', 'GUUID', '2', null, '1', '1', 'bd749e4c-0512-4b01-9ef7-7f42af3812a0', '1', null, null, null, '9223372036854775807', '0', '1', '0', 'bd749e4c-0512-4b01-9ef7-7f42af3812a0', '通用UUID。');
INSERT INTO `aos_sys_sequence` VALUES ('3', 'TESTID', '1', null, '1', '1', '00000050', '1', null, null, null, '99999999', '1', '1', '1', '00000050', '测试用ID');
INSERT INTO `aos_sys_sequence` VALUES ('313', 'USERID', '1', null, '1', '1', '21', '1', null, null, null, '9223372036854775807', '0', '1', '0', '21', '用户ID');
INSERT INTO `aos_sys_sequence` VALUES ('337', 'RID', '1', null, '1', '1', '4373', '1', null, null, null, '9999999999', '0', '1', '0', '4373', '系统管理-关联表流水号。');
INSERT INTO `aos_sys_sequence` VALUES ('546', 'BPMID', '1', null, '1', '1', '119', '1', null, null, null, '9999999999', '0', '1', '0', '119', '流程引擎相关辅助表的流水号');

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
  PRIMARY KEY  (`id_`),
  UNIQUE KEY `aos_sys_user_ukey` USING BTREE (`account_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户基本信息表';

-- ----------------------------
-- Records of aos_sys_user
-- ----------------------------
INSERT INTO `aos_sys_user` VALUES ('1', 'root', 'gnRD3IiRP6s=', '超级用户', '1', '0', '1', '2', '', '2014-09-27 22:12:56', '1', '0');
INSERT INTO `aos_sys_user` VALUES ('15', 'xxd', 'gnRD3IiRP6s=', '熊小朵', '0', '441', '1', '1', '', '2014-12-10 02:19:12', '1', '0.005.001.001');
INSERT INTO `aos_sys_user` VALUES ('19', 'xxx', 'gnRD3IiRP6s=', '熊小雄', '1', '285', '1', '1', '', '2015-01-25 16:20:54', '1', '0.003');
INSERT INTO `aos_sys_user` VALUES ('20', 'xcc', 'gnRD3IiRP6s=', '熊楚楚', '0', '0', '1', '1', '', '2015-02-01 22:19:03', '1', '0');
INSERT INTO `aos_sys_user` VALUES ('21', 'admin', 'gnRD3IiRP6s=', 'admin', '0', '0', '1', '1', null, '2015-07-08 21:55:10', '1', '0');

-- ----------------------------
-- Table structure for aos_sys_user_cfg
-- ----------------------------
DROP TABLE IF EXISTS `aos_sys_user_cfg`;
CREATE TABLE `aos_sys_user_cfg` (
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
-- Records of aos_sys_user_cfg
-- ----------------------------
INSERT INTO `aos_sys_user_cfg` VALUES ('1', 'classic', 'blue', 'tab', '1', 'true', 'tight', '#0099FF', '1', '0', '1');
INSERT INTO `aos_sys_user_cfg` VALUES ('15', 'classic', 'blue', 'tab', '1', 'true', 'tight', '#0099FF', '1', '1', '1');
INSERT INTO `aos_sys_user_cfg` VALUES ('19', 'classic', 'neptune', 'tab', '1', 'true', 'tight', '#0099FF', '1', '1', null);
INSERT INTO `aos_sys_user_cfg` VALUES ('20', 'classic', 'blue', 'tab', '1', 'true', 'tight', '#0099FF', '1', '1', '1');
INSERT INTO `aos_sys_user_cfg` VALUES ('21', 'classic', 'blue', 'tab', '1', 'true', 'tight', '#0099FF', '1', '1', '1');

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
  `bytearray_id_` varchar(64) default NULL COMMENT '用户头像流文件ID',
  `remark_` varchar(4000) default NULL COMMENT '备注',
  `filed1_` varchar(255) default NULL COMMENT '静态扩展字段1',
  `filed2_` varchar(255) default NULL COMMENT '静态扩展字段2',
  `filed3_` varchar(255) default NULL COMMENT '静态扩展字段3',
  PRIMARY KEY  (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户扩展信息表';

-- ----------------------------
-- Records of aos_sys_user_ext
-- ----------------------------
INSERT INTO `aos_sys_user_ext` VALUES ('1', '307916217@qq.com', '', '18616786188', '', '', '', '', '307916217', '', '1717', '超级用户拥有系统最高权限。', '', '', null);
INSERT INTO `aos_sys_user_ext` VALUES ('15', null, null, null, null, null, '2015-02-01', null, null, null, '646', null, null, null, null);
INSERT INTO `aos_sys_user_ext` VALUES ('19', 'xxx@qq.com', '0871-3131921', '18616786188', '云南大理', '53021890', '2015-01-30', '532925108211170651', '307916217', null, '644', '备注内容', '100', '100', '100');
INSERT INTO `aos_sys_user_ext` VALUES ('20', null, null, null, null, null, null, null, null, null, null, null, '100', '100', null);
INSERT INTO `aos_sys_user_ext` VALUES ('21', null, null, null, null, null, null, null, null, null, null, null, null, null, null);

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

-- ----------------------------
-- Table structure for aos_sys_wf_model
-- ----------------------------
DROP TABLE IF EXISTS `aos_sys_wf_model`;
CREATE TABLE `aos_sys_wf_model` (
  `id_` varchar(64) NOT NULL COMMENT '流水号',
  `model_id_` varchar(64) NOT NULL COMMENT '模型id',
  `create_type_` varchar(255) NOT NULL COMMENT '模型创建方式',
  `name_` varchar(255) NOT NULL COMMENT '流程名称',
  `create_user_id_` varchar(64) NOT NULL COMMENT '创建人流水号',
  `create_user_` varchar(255) NOT NULL COMMENT '创建人',
  `create_time_` varchar(255) NOT NULL COMMENT '创建时间',
  `remark_` varchar(4000) default NULL COMMENT '备注',
  PRIMARY KEY  (`id_`),
  UNIQUE KEY `aos_sys_wf_model_ukey` USING BTREE (`model_id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程模型扩展表';

-- ----------------------------
-- Records of aos_sys_wf_model
-- ----------------------------

-- ----------------------------
-- Table structure for aos_sys_wf_procdef
-- ----------------------------
DROP TABLE IF EXISTS `aos_sys_wf_procdef`;
CREATE TABLE `aos_sys_wf_procdef` (
  `id_` varchar(64) NOT NULL COMMENT '流水号',
  `model_id_` varchar(64) NOT NULL COMMENT '模型id',
  `proc_def_id_` varchar(64) NOT NULL COMMENT '流程定义id',
  `deploy_user_id_` varchar(64) NOT NULL COMMENT ' 部署人流水号',
  `deploy_user_` varchar(255) NOT NULL COMMENT '部署人',
  `deploy_time_` varchar(255) NOT NULL COMMENT '部署时间',
  PRIMARY KEY  (`id_`),
  UNIQUE KEY `aos_sys_wf_procdef_ukey` USING BTREE (`proc_def_id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程定义扩展表';

-- ----------------------------
-- Records of aos_sys_wf_procdef
-- ----------------------------
