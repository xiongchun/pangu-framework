/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : aos

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2015-06-26 16:24:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for act_id_info
-- ----------------------------
DROP TABLE IF EXISTS `act_id_info`;
CREATE TABLE `act_id_info` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `USER_ID_` varchar(64) collate utf8_bin default NULL,
  `TYPE_` varchar(64) collate utf8_bin default NULL,
  `KEY_` varchar(255) collate utf8_bin default NULL,
  `VALUE_` varchar(255) collate utf8_bin default NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_info
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_user
-- ----------------------------
DROP TABLE IF EXISTS `act_id_user`;
CREATE TABLE `act_id_user` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `FIRST_` varchar(255) collate utf8_bin default NULL,
  `LAST_` varchar(255) collate utf8_bin default NULL,
  `EMAIL_` varchar(255) collate utf8_bin default NULL,
  `PWD_` varchar(255) collate utf8_bin default NULL,
  `PICTURE_ID_` varchar(64) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_user
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_evt_log
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_evt_log`;
CREATE TABLE `aos_act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL auto_increment,
  `TYPE_` varchar(64) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `TIME_STAMP_` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `USER_ID_` varchar(255) collate utf8_bin default NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) collate utf8_bin default NULL,
  `LOCK_TIME_` timestamp NULL default NULL,
  `IS_PROCESSED_` tinyint(4) default '0',
  PRIMARY KEY  (`LOG_NR_`)
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
  `model_id_` varchar(64) NOT NULL COMMENT '模型ID',
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
  `model_id_` varchar(64) NOT NULL COMMENT '模型ID',
  `proc_def_id_` varchar(64) NOT NULL COMMENT '流程定义ID',
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
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `DEPLOYMENT_ID_` varchar(64) collate utf8_bin default NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `AOS_ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `AOS_ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `aos_act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_ge_bytearray
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_ge_property
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_ge_property`;
CREATE TABLE `aos_act_ge_property` (
  `NAME_` varchar(64) collate utf8_bin NOT NULL default '',
  `VALUE_` varchar(300) collate utf8_bin default NULL,
  `REV_` int(11) default NULL,
  PRIMARY KEY  (`NAME_`)
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
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) collate utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `CALL_PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `ACT_NAME_` varchar(255) collate utf8_bin default NULL,
  `ACT_TYPE_` varchar(255) collate utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) collate utf8_bin default NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime default NULL,
  `DURATION_` bigint(20) default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`ID_`),
  KEY `AOS_ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `AOS_ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `AOS_ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `AOS_ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_hi_actinst
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_hi_attachment
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_hi_attachment`;
CREATE TABLE `aos_act_hi_attachment` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `USER_ID_` varchar(255) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `DESCRIPTION_` varchar(4000) collate utf8_bin default NULL,
  `TYPE_` varchar(255) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `URL_` varchar(4000) collate utf8_bin default NULL,
  `CONTENT_ID_` varchar(64) collate utf8_bin default NULL,
  `TIME_` datetime default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_hi_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_hi_comment
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_hi_comment`;
CREATE TABLE `aos_act_hi_comment` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `TYPE_` varchar(255) collate utf8_bin default NULL,
  `TIME_` datetime NOT NULL,
  `USER_ID_` varchar(255) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `ACTION_` varchar(255) collate utf8_bin default NULL,
  `MESSAGE_` varchar(4000) collate utf8_bin default NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_hi_comment
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_hi_detail
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_hi_detail`;
CREATE TABLE `aos_act_hi_detail` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `TYPE_` varchar(255) collate utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `ACT_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) collate utf8_bin default NULL,
  `REV_` int(11) default NULL,
  `TIME_` datetime NOT NULL,
  `BYTEARRAY_ID_` varchar(64) collate utf8_bin default NULL,
  `DOUBLE_` double default NULL,
  `LONG_` bigint(20) default NULL,
  `TEXT_` varchar(4000) collate utf8_bin default NULL,
  `TEXT2_` varchar(4000) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `AOS_ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `AOS_ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `AOS_ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `AOS_ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `AOS_ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_hi_detail
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_hi_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_hi_identitylink`;
CREATE TABLE `aos_act_hi_identitylink` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `GROUP_ID_` varchar(255) collate utf8_bin default NULL,
  `TYPE_` varchar(255) collate utf8_bin default NULL,
  `USER_ID_` varchar(255) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `AOS_ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `AOS_ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `AOS_ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_hi_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_hi_procinst
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_hi_procinst`;
CREATE TABLE `aos_act_hi_procinst` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin NOT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime default NULL,
  `DURATION_` bigint(20) default NULL,
  `START_USER_ID_` varchar(255) collate utf8_bin default NULL,
  `START_ACT_ID_` varchar(255) collate utf8_bin default NULL,
  `END_ACT_ID_` varchar(255) collate utf8_bin default NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) collate utf8_bin default NULL,
  `DELETE_REASON_` varchar(4000) collate utf8_bin default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  `NAME_` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `AOS_ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `AOS_ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_hi_procinst
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_hi_taskinst
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_hi_taskinst`;
CREATE TABLE `aos_act_hi_taskinst` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  `TASK_DEF_KEY_` varchar(255) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `PARENT_TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `DESCRIPTION_` varchar(4000) collate utf8_bin default NULL,
  `OWNER_` varchar(255) collate utf8_bin default NULL,
  `ASSIGNEE_` varchar(255) collate utf8_bin default NULL,
  `START_TIME_` datetime NOT NULL,
  `CLAIM_TIME_` datetime default NULL,
  `END_TIME_` datetime default NULL,
  `DURATION_` bigint(20) default NULL,
  `DELETE_REASON_` varchar(4000) collate utf8_bin default NULL,
  `PRIORITY_` int(11) default NULL,
  `DUE_DATE_` datetime default NULL,
  `FORM_KEY_` varchar(255) collate utf8_bin default NULL,
  `CATEGORY_` varchar(255) collate utf8_bin default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_hi_taskinst
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_hi_varinst
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_hi_varinst`;
CREATE TABLE `aos_act_hi_varinst` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) collate utf8_bin default NULL,
  `REV_` int(11) default NULL,
  `BYTEARRAY_ID_` varchar(64) collate utf8_bin default NULL,
  `DOUBLE_` double default NULL,
  `LONG_` bigint(20) default NULL,
  `TEXT_` varchar(4000) collate utf8_bin default NULL,
  `TEXT2_` varchar(4000) collate utf8_bin default NULL,
  `CREATE_TIME_` datetime default NULL,
  `LAST_UPDATED_TIME_` datetime default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `AOS_ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `AOS_ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `AOS_ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_hi_varinst
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_id_group
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_id_group`;
CREATE TABLE `aos_act_id_group` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `TYPE_` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_id_group
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_id_membership
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_id_membership`;
CREATE TABLE `aos_act_id_membership` (
  `USER_ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `GROUP_ID_` varchar(64) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`USER_ID_`,`GROUP_ID_`),
  KEY `AOS_ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `AOS_ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`),
  CONSTRAINT `AOS_ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `aos_act_id_group` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_id_membership
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_re_deployment
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_re_deployment`;
CREATE TABLE `aos_act_re_deployment` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `CATEGORY_` varchar(255) collate utf8_bin default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  `DEPLOY_TIME_` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_re_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_re_model
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_re_model`;
CREATE TABLE `aos_act_re_model` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `KEY_` varchar(255) collate utf8_bin default NULL,
  `CATEGORY_` varchar(255) collate utf8_bin default NULL,
  `CREATE_TIME_` timestamp NULL default NULL,
  `LAST_UPDATE_TIME_` timestamp NULL default NULL,
  `VERSION_` int(11) default NULL,
  `META_INFO_` varchar(4000) collate utf8_bin default NULL,
  `DEPLOYMENT_ID_` varchar(64) collate utf8_bin default NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) collate utf8_bin default NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) collate utf8_bin default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`ID_`),
  KEY `AOS_ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `AOS_ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `AOS_ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `AOS_ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `aos_act_re_deployment` (`ID_`),
  CONSTRAINT `AOS_ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `aos_act_ge_bytearray` (`ID_`),
  CONSTRAINT `AOS_ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `aos_act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_re_model
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_re_procdef
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_re_procdef`;
CREATE TABLE `aos_act_re_procdef` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `CATEGORY_` varchar(255) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `KEY_` varchar(255) collate utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) collate utf8_bin default NULL,
  `RESOURCE_NAME_` varchar(4000) collate utf8_bin default NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) collate utf8_bin default NULL,
  `DESCRIPTION_` varchar(4000) collate utf8_bin default NULL,
  `HAS_START_FORM_KEY_` tinyint(4) default NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) default NULL,
  `SUSPENSION_STATE_` int(11) default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_re_procdef
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_ru_event_subscr
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_ru_event_subscr`;
CREATE TABLE `aos_act_ru_event_subscr` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `EVENT_TYPE_` varchar(255) collate utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) collate utf8_bin default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `ACTIVITY_ID_` varchar(64) collate utf8_bin default NULL,
  `CONFIGURATION_` varchar(255) collate utf8_bin default NULL,
  `CREATED_` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`ID_`),
  KEY `AOS_ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `AOS_ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `AOS_ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `aos_act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_ru_event_subscr
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_ru_execution
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_ru_execution`;
CREATE TABLE `aos_act_ru_execution` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `BUSINESS_KEY_` varchar(255) collate utf8_bin default NULL,
  `PARENT_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  `SUPER_EXEC_` varchar(64) collate utf8_bin default NULL,
  `ACT_ID_` varchar(255) collate utf8_bin default NULL,
  `IS_ACTIVE_` tinyint(4) default NULL,
  `IS_CONCURRENT_` tinyint(4) default NULL,
  `IS_SCOPE_` tinyint(4) default NULL,
  `IS_EVENT_SCOPE_` tinyint(4) default NULL,
  `SUSPENSION_STATE_` int(11) default NULL,
  `CACHED_ENT_STATE_` int(11) default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `LOCK_TIME_` timestamp NULL default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `AOS_ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `AOS_ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `AOS_ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `AOS_ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `AOS_ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `AOS_ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `aos_act_re_procdef` (`ID_`),
  CONSTRAINT `AOS_ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `aos_act_ru_execution` (`ID_`),
  CONSTRAINT `AOS_ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `aos_act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AOS_ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `aos_act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_ru_execution
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_ru_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_ru_identitylink`;
CREATE TABLE `aos_act_ru_identitylink` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `GROUP_ID_` varchar(255) collate utf8_bin default NULL,
  `TYPE_` varchar(255) collate utf8_bin default NULL,
  `USER_ID_` varchar(255) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `AOS_ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `AOS_ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `AOS_ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `AOS_ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `AOS_ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `AOS_ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `aos_act_ru_execution` (`ID_`),
  CONSTRAINT `AOS_ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `aos_act_re_procdef` (`ID_`),
  CONSTRAINT `AOS_ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `aos_act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_ru_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_ru_job
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_ru_job`;
CREATE TABLE `aos_act_ru_job` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `TYPE_` varchar(255) collate utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL default NULL,
  `LOCK_OWNER_` varchar(255) collate utf8_bin default NULL,
  `EXCLUSIVE_` tinyint(1) default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  `RETRIES_` int(11) default NULL,
  `EXCEPTION_STACK_ID_` varchar(64) collate utf8_bin default NULL,
  `EXCEPTION_MSG_` varchar(4000) collate utf8_bin default NULL,
  `DUEDATE_` timestamp NULL default NULL,
  `REPEAT_` varchar(255) collate utf8_bin default NULL,
  `HANDLER_TYPE_` varchar(255) collate utf8_bin default NULL,
  `HANDLER_CFG_` varchar(4000) collate utf8_bin default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`ID_`),
  KEY `AOS_ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `AOS_ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `aos_act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_ru_job
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_ru_task
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_ru_task`;
CREATE TABLE `aos_act_ru_task` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `PARENT_TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `DESCRIPTION_` varchar(4000) collate utf8_bin default NULL,
  `TASK_DEF_KEY_` varchar(255) collate utf8_bin default NULL,
  `OWNER_` varchar(255) collate utf8_bin default NULL,
  `ASSIGNEE_` varchar(255) collate utf8_bin default NULL,
  `DELEGATION_` varchar(64) collate utf8_bin default NULL,
  `PRIORITY_` int(11) default NULL,
  `CREATE_TIME_` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `DUE_DATE_` datetime default NULL,
  `CATEGORY_` varchar(255) collate utf8_bin default NULL,
  `SUSPENSION_STATE_` int(11) default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  `FORM_KEY_` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `AOS_ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `AOS_ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `AOS_ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `AOS_ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `AOS_ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `aos_act_re_procdef` (`ID_`),
  CONSTRAINT `AOS_ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `aos_act_ru_execution` (`ID_`),
  CONSTRAINT `AOS_ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `aos_act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aos_act_ru_task
-- ----------------------------

-- ----------------------------
-- Table structure for aos_act_ru_variable
-- ----------------------------
DROP TABLE IF EXISTS `aos_act_ru_variable`;
CREATE TABLE `aos_act_ru_variable` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `TYPE_` varchar(255) collate utf8_bin NOT NULL,
  `NAME_` varchar(255) collate utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `BYTEARRAY_ID_` varchar(64) collate utf8_bin default NULL,
  `DOUBLE_` double default NULL,
  `LONG_` bigint(20) default NULL,
  `TEXT_` varchar(4000) collate utf8_bin default NULL,
  `TEXT2_` varchar(4000) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `AOS_ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `AOS_ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `AOS_ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `AOS_ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `AOS_ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `aos_act_ge_bytearray` (`ID_`),
  CONSTRAINT `AOS_ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `aos_act_ru_execution` (`ID_`),
  CONSTRAINT `AOS_ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `aos_act_ru_execution` (`ID_`)
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
INSERT INTO `aos_au_module` VALUES ('225', '0.001.008.002', 'WebSQL', 'system/webSql/init.jhtml', null, '555', '1', '0', 'sql.png', '1', '开发工具', null, '11');
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
INSERT INTO `aos_ge_param` VALUES ('74', 'app_name_', 'AOS应用基础平台', '413', '0.001.002.002', '应用系统名称', '0', null, '应用系统名称');

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
