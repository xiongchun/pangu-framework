/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50628
Source Host           : 127.0.0.1:3306
Source Database       : aos

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2016-10-23 01:42:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for aos_cmp
-- ----------------------------
DROP TABLE IF EXISTS `aos_cmp`;
CREATE TABLE `aos_cmp` (
  `id_` varchar(20) NOT NULL COMMENT '流水号',
  `name_` varchar(255) NOT NULL COMMENT '组件名称',
  `dom_id_` varchar(255) NOT NULL COMMENT '界面组件ID',
  `page_key_` varchar(255) NOT NULL COMMENT '所属页面标识',
  `page_name_` varchar(255) NOT NULL COMMENT '所属页面名称',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `ukey1` (`dom_id_`,`page_key_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='界面组件表';

-- ----------------------------
-- Records of aos_cmp
-- ----------------------------

-- ----------------------------
-- Table structure for aos_dic
-- ----------------------------
DROP TABLE IF EXISTS `aos_dic`;
CREATE TABLE `aos_dic` (
  `id_` varchar(20) NOT NULL COMMENT '流水号',
  `name_` varchar(255) NOT NULL COMMENT '字典名称',
  `key_` varchar(255) NOT NULL COMMENT '字典KEY',
  `code_` varchar(255) NOT NULL COMMENT '对照码',
  `desc_` varchar(255) NOT NULL COMMENT '对照值',
  `is_enable_` varchar(255) NOT NULL COMMENT '是否启用',
  `hotkey_` varchar(255) DEFAULT NULL COMMENT ' 热键',
  `group_` varchar(255) NOT NULL COMMENT '所属分组',
  `sort_no_` int(8) DEFAULT NULL COMMENT '排序号',
  `remark_` varchar(4000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `ukey1` (`code_`,`key_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典表';

-- ----------------------------
-- Records of aos_dic
-- ----------------------------
INSERT INTO `aos_dic` VALUES ('1608211848120001', '性别', 'sex_', '1', '男', '1', '', '1', '1', '');
INSERT INTO `aos_dic` VALUES ('1608211848120002', '性别', 'sex_', '2', '女', '1', null, '1', '2', null);
INSERT INTO `aos_dic` VALUES ('1608211848120003', '性别', 'sex_', '3', '未知', '1', null, '1', '3', null);
INSERT INTO `aos_dic` VALUES ('1608211848120004', '组件边框颜色', 'cmp_border_color_', 'blue', '#99BCE8', '1', null, '1', '1', null);
INSERT INTO `aos_dic` VALUES ('1608211848120005', '组件边框颜色', 'cmp_border_color_', 'gray', '#BCB0B0', '1', null, '1', '2', null);
INSERT INTO `aos_dic` VALUES ('1608211848120006', '主页面south区域背景颜色', 'south_back_color_', 'blue', '#DFE8F6', '1', null, '1', '1', null);
INSERT INTO `aos_dic` VALUES ('1608211848120007', '主页面south区域背景颜色', 'south_back_color_', 'gray', '#F0F0F0', '1', null, '1', '2', null);
INSERT INTO `aos_dic` VALUES ('1608211848120008', '文本主体色调', 'main_text_color_', 'blue', '#6699CC', '1', null, '1', '1', null);
INSERT INTO `aos_dic` VALUES ('1608211848120009', '文本主体色调', 'main_text_color_', 'gray', '#888888', '1', null, '1', '2', null);
INSERT INTO `aos_dic` VALUES ('1608211848120010', '导航文字颜色', 'nav_text_color_', 'blue', '#3399FF', '1', null, '1', '1', null);
INSERT INTO `aos_dic` VALUES ('1608211848120011', '导航文字颜色', 'nav_text_color_', 'gray', '#555555', '1', null, '1', '2', null);
INSERT INTO `aos_dic` VALUES ('1608211848120012', '用户类型', 'user_type_', '1', '缺省', '1', null, '1', '1', null);
INSERT INTO `aos_dic` VALUES ('1608211848120013', '用户状态', 'user_status_', '1', '正常', '1', null, '1', '1', null);
INSERT INTO `aos_dic` VALUES ('1608211848120014', '用户状态', 'user_status_', '2', '锁定', '1', null, '1', '2', null);
INSERT INTO `aos_dic` VALUES ('1608211848120015', '用户状态', 'user_status_', '3', '停用', '1', null, '1', '3', null);
INSERT INTO `aos_dic` VALUES ('1608211848120016', '是否开关', 'is_', '1', '是', '1', null, '1', '1', null);
INSERT INTO `aos_dic` VALUES ('1608211848120017', '是否开关', 'is_', '0', '否', '1', null, '1', '2', null);
INSERT INTO `aos_dic` VALUES ('1608211848120018', '组织类型', 'org_type_', '1', '缺省', '1', '', '1', '1', '');
INSERT INTO `aos_dic` VALUES ('1608211848120020', '角色授权类型', 'role_grant_type_', '1', '业务办理权限', '1', null, '1', '1', null);
INSERT INTO `aos_dic` VALUES ('1608211848120021', '角色授权类型', 'role_grant_type_', '2', '管理授权权限', '1', null, '1', '1', '');
INSERT INTO `aos_dic` VALUES ('1608211848120022', '参数分组', 'params_group_', '1', '系统缺省参数', '1', null, '1', '1', null);
INSERT INTO `aos_dic` VALUES ('1608211848120023', '参数分组', 'params_group_', '2', '产品业务参数', '1', null, '1', '2', null);
INSERT INTO `aos_dic` VALUES ('1608211848120024', '字典分组', 'dic_group_', '1', '系统缺省字典', '1', null, '1', '1', null);
INSERT INTO `aos_dic` VALUES ('1608211848120025', '字典分组', 'dic_group_', '2', '产品业务字典', '1', null, '1', '1', '');
INSERT INTO `aos_dic` VALUES ('1609082331410000', '界面皮肤', 'skin_', 'blue', '经典蓝', '1', null, '1', '1', null);
INSERT INTO `aos_dic` VALUES ('1609082333290001', '界面皮肤', 'skin_', 'gray', '魅力灰', '1', null, '1', '2', '');
INSERT INTO `aos_dic` VALUES ('1609112054530003', '角色类型', 'role_type_', '1', '缺省', '1', null, '1', '1', '');
INSERT INTO `aos_dic` VALUES ('1609281541100768', '图标类型', 'icon_type_', '1', '小图标', '1', null, '1', '1', null);
INSERT INTO `aos_dic` VALUES ('1609281541340769', '图标类型', 'icon_type_', '2', '大图标', '1', null, '2', '2', null);
INSERT INTO `aos_dic` VALUES ('1609281541530770', '图标类型', 'icon_type_', '3', '字体图标', '1', null, '2', '3', null);

-- ----------------------------
-- Table structure for aos_icon
-- ----------------------------
DROP TABLE IF EXISTS `aos_icon`;
CREATE TABLE `aos_icon` (
  `id_` varchar(64) NOT NULL COMMENT '流水号',
  `name_` varchar(255) NOT NULL COMMENT '名称',
  `type_` varchar(255) NOT NULL COMMENT '类型',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `ukey1` (`name_`,`type_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图标大全';

-- ----------------------------
-- Records of aos_icon
-- ----------------------------
INSERT INTO `aos_icon` VALUES ('1609281101540000', '10.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540001', '11.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540002', '13.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540003', '14.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540004', '15.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540005', '17.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540006', '19.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540007', '2.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540008', '21.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540009', '22.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540010', '23.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540011', '24.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540012', '25.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540013', '26.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540014', '28.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540015', '3.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540016', '30.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540017', '32.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540018', '34.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540019', '35.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540020', '36.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540021', '37.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540022', '38.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540023', '39.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540024', '4.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540025', '40.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540026', '41.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540027', '42.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540028', '43.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540029', '44.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540030', '45.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540031', '46.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540032', '47.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540033', '48.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540034', '49.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540035', '5.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540036', '51.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540037', '52.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540038', '53.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540039', '54.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540040', '55.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540041', '56.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540042', '6.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540043', '7.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540044', '8.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540045', '9.png', '2');
INSERT INTO `aos_icon` VALUES ('1609281101540046', 'add.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101540047', 'add2.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101540048', 'against.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101540049', 'agree.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101540050', 'app_columns.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101540051', 'app_list.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101540052', 'bars.gif', '1');
INSERT INTO `aos_icon` VALUES ('1609281101540053', 'basket.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101540054', 'book.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101540055', 'book_user.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101540056', 'bug.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550057', 'bullet_black.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550058', 'bullet_blue.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550059', 'bullet_green.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550060', 'bullet_group.gif', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550061', 'bullet_group2.gif', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550062', 'bullet_group3.gif', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550063', 'bullet_group4.gif', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550064', 'bullet_purple.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550065', 'bullet_red.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550066', 'bullet_yellow.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550067', 'chart_curve.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550068', 'chart_flipped.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550069', 'chart_line.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550070', 'chart_pie.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550071', 'close.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550072', 'close2.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550073', 'config.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550074', 'config1.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550075', 'config3.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550076', 'connect.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550077', 'copy.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550078', 'cut.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550079', 'cv.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550080', 'c_key.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550081', 'database.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550082', 'database_add.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550083', 'del.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550084', 'del1.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550085', 'del2.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550086', 'del_folder.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550087', 'del_page.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550088', 'detail.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550089', 'disconnect.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550090', 'doc_ok.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550091', 'down.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550092', 'down_left.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550093', 'down_right.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550094', 'edit.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550095', 'edit2.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550096', 'email.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550097', 'email2.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550098', 'email3.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550099', 'email_go.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550100', 'email_open.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101550101', 'fa-adjust', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550102', 'fa-adn', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550103', 'fa-align-center', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550104', 'fa-align-justify', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550105', 'fa-align-left', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550106', 'fa-align-right', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550107', 'fa-ambulance', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550108', 'fa-anchor', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550109', 'fa-android', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550110', 'fa-angellist', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550111', 'fa-angle-double-down', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550112', 'fa-angle-double-left', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550113', 'fa-angle-double-right', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550114', 'fa-angle-double-up', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550115', 'fa-angle-down', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550116', 'fa-angle-left', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550117', 'fa-angle-right', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550118', 'fa-angle-up', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550119', 'fa-apple', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550120', 'fa-archive', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550121', 'fa-area-chart', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550122', 'fa-arrow-circle-down', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550123', 'fa-arrow-circle-left', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550124', 'fa-arrow-circle-o-down', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550125', 'fa-arrow-circle-o-left', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550126', 'fa-arrow-circle-o-right', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550127', 'fa-arrow-circle-o-up', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550128', 'fa-arrow-circle-right', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550129', 'fa-arrow-circle-up', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550130', 'fa-arrow-down', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550131', 'fa-arrow-left', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550132', 'fa-arrow-right', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550133', 'fa-arrow-up', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550134', 'fa-arrows', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550135', 'fa-arrows-alt', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550136', 'fa-arrows-h', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550137', 'fa-arrows-v', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550138', 'fa-asterisk', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550139', 'fa-at', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550140', 'fa-backward', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550141', 'fa-ban', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550142', 'fa-bar-chart', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550143', 'fa-barcode', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550144', 'fa-bars', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550145', 'fa-beer', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550146', 'fa-behance', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550147', 'fa-behance-square', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550148', 'fa-bell', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550149', 'fa-bell-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550150', 'fa-bell-slash', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550151', 'fa-bell-slash-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550152', 'fa-bicycle', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550153', 'fa-binoculars', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550154', 'fa-birthday-cake', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550155', 'fa-bitbucket', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550156', 'fa-bitbucket-square', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550157', 'fa-bold', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550158', 'fa-bolt', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550159', 'fa-bomb', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550160', 'fa-book', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550161', 'fa-bookmark', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550162', 'fa-bookmark-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550163', 'fa-briefcase', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550164', 'fa-btc', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550165', 'fa-bug', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550166', 'fa-building', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550167', 'fa-building-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550168', 'fa-bullhorn', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550169', 'fa-bullseye', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550170', 'fa-bus', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550171', 'fa-calculator', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550172', 'fa-calendar', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550173', 'fa-calendar-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550174', 'fa-camera', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550175', 'fa-camera-retro', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550176', 'fa-car', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550177', 'fa-caret-down', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550178', 'fa-caret-left', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550179', 'fa-caret-right', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550180', 'fa-caret-square-o-down', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550181', 'fa-caret-square-o-left', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550182', 'fa-caret-square-o-right', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550183', 'fa-caret-square-o-up', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550184', 'fa-caret-up', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550185', 'fa-cc', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550186', 'fa-cc-amex', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550187', 'fa-cc-discover', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550188', 'fa-cc-mastercard', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550189', 'fa-cc-paypal', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550190', 'fa-cc-stripe', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550191', 'fa-cc-visa', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550192', 'fa-certificate', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550193', 'fa-chain-broken', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550194', 'fa-check', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550195', 'fa-check-circle', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550196', 'fa-check-circle-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550197', 'fa-check-square', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550198', 'fa-check-square-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550199', 'fa-chevron-circle-down', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550200', 'fa-chevron-circle-left', '3');
INSERT INTO `aos_icon` VALUES ('1609281101550201', 'fa-chevron-circle-right', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560202', 'fa-chevron-circle-up', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560203', 'fa-chevron-down', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560204', 'fa-chevron-left', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560205', 'fa-chevron-right', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560206', 'fa-chevron-up', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560207', 'fa-child', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560208', 'fa-circle', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560209', 'fa-circle-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560210', 'fa-circle-o-notch', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560211', 'fa-circle-thin', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560212', 'fa-clipboard', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560213', 'fa-clock-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560214', 'fa-cloud', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560215', 'fa-cloud-download', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560216', 'fa-cloud-upload', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560217', 'fa-code', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560218', 'fa-code-fork', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560219', 'fa-codepen', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560220', 'fa-coffee', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560221', 'fa-cog', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560222', 'fa-cogs', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560223', 'fa-columns', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560224', 'fa-comment', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560225', 'fa-comment-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560226', 'fa-comments', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560227', 'fa-comments-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560228', 'fa-compass', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560229', 'fa-compress', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560230', 'fa-copyright', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560231', 'fa-credit-card', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560232', 'fa-crop', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560233', 'fa-crosshairs', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560234', 'fa-css3', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560235', 'fa-cube', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560236', 'fa-cubes', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560237', 'fa-cutlery', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560238', 'fa-database', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560239', 'fa-delicious', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560240', 'fa-desktop', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560241', 'fa-deviantart', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560242', 'fa-digg', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560243', 'fa-dot-circle-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560244', 'fa-download', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560245', 'fa-dribbble', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560246', 'fa-dropbox', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560247', 'fa-drupal', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560248', 'fa-eject', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560249', 'fa-ellipsis-h', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560250', 'fa-ellipsis-v', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560251', 'fa-empire', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560252', 'fa-envelope', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560253', 'fa-envelope-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560254', 'fa-envelope-square', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560255', 'fa-eraser', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560256', 'fa-eur', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560257', 'fa-exchange', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560258', 'fa-exclamation', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560259', 'fa-exclamation-circle', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560260', 'fa-exclamation-triangle', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560261', 'fa-expand', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560262', 'fa-external-link', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560263', 'fa-external-link-square', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560264', 'fa-eye', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560265', 'fa-eye-slash', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560266', 'fa-eyedropper', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560267', 'fa-facebook', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560268', 'fa-facebook-square', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560269', 'fa-fast-backward', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560270', 'fa-fast-forward', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560271', 'fa-fax', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560272', 'fa-female', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560273', 'fa-fighter-jet', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560274', 'fa-file', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560275', 'fa-file-archive-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560276', 'fa-file-audio-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560277', 'fa-file-code-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560278', 'fa-file-excel-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560279', 'fa-file-image-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560280', 'fa-file-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560281', 'fa-file-pdf-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560282', 'fa-file-powerpoint-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560283', 'fa-file-text', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560284', 'fa-file-text-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560285', 'fa-file-video-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560286', 'fa-file-word-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560287', 'fa-files-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560288', 'fa-film', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560289', 'fa-filter', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560290', 'fa-fire', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560291', 'fa-fire-extinguisher', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560292', 'fa-flag', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560293', 'fa-flag-checkered', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560294', 'fa-flag-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560295', 'fa-flask', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560296', 'fa-flickr', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560297', 'fa-floppy-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560298', 'fa-folder', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560299', 'fa-folder-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560300', 'fa-folder-open', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560301', 'fa-folder-open-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560302', 'fa-font', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560303', 'fa-forward', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560304', 'fa-foursquare', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560305', 'fa-frown-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560306', 'fa-futbol-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560307', 'fa-gamepad', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560308', 'fa-gavel', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560309', 'fa-gbp', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560310', 'fa-gift', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560311', 'fa-git', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560312', 'fa-git-square', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560313', 'fa-github', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560314', 'fa-github-alt', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560315', 'fa-github-square', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560316', 'fa-gittip', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560317', 'fa-glass', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560318', 'fa-globe', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560319', 'fa-google', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560320', 'fa-google-plus', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560321', 'fa-google-plus-square', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560322', 'fa-google-wallet', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560323', 'fa-graduation-cap', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560324', 'fa-h-square', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560325', 'fa-hacker-news', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560326', 'fa-hand-o-down', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560327', 'fa-hand-o-left', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560328', 'fa-hand-o-right', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560329', 'fa-hand-o-up', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560330', 'fa-hdd-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560331', 'fa-header', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560332', 'fa-headphones', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560333', 'fa-heart', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560334', 'fa-heart-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560335', 'fa-history', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560336', 'fa-home', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560337', 'fa-hospital-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560338', 'fa-html5', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560339', 'fa-ils', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560340', 'fa-inbox', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560341', 'fa-indent', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560342', 'fa-info', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560343', 'fa-info-circle', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560344', 'fa-inr', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560345', 'fa-instagram', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560346', 'fa-ioxhost', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560347', 'fa-italic', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560348', 'fa-joomla', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560349', 'fa-jpy', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560350', 'fa-jsfiddle', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560351', 'fa-key', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560352', 'fa-keyboard-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101560353', 'fa-krw', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570354', 'fa-language', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570355', 'fa-laptop', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570356', 'fa-lastfm', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570357', 'fa-lastfm-square', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570358', 'fa-leaf', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570359', 'fa-lemon-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570360', 'fa-level-down', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570361', 'fa-level-up', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570362', 'fa-life-ring', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570363', 'fa-lightbulb-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570364', 'fa-line-chart', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570365', 'fa-link', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570366', 'fa-linkedin', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570367', 'fa-linkedin-square', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570368', 'fa-linux', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570369', 'fa-list', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570370', 'fa-list-alt', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570371', 'fa-list-ol', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570372', 'fa-list-ul', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570373', 'fa-location-arrow', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570374', 'fa-lock', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570375', 'fa-long-arrow-down', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570376', 'fa-long-arrow-left', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570377', 'fa-long-arrow-right', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570378', 'fa-long-arrow-up', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570379', 'fa-magic', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570380', 'fa-magnet', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570381', 'fa-male', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570382', 'fa-map-marker', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570383', 'fa-maxcdn', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570384', 'fa-meanpath', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570385', 'fa-medkit', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570386', 'fa-meh-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570387', 'fa-microphone', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570388', 'fa-microphone-slash', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570389', 'fa-minus', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570390', 'fa-minus-circle', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570391', 'fa-minus-square', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570392', 'fa-minus-square-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570393', 'fa-mobile', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570394', 'fa-money', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570395', 'fa-moon-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570396', 'fa-music', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570397', 'fa-newspaper-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570398', 'fa-openid', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570399', 'fa-outdent', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570400', 'fa-pagelines', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570401', 'fa-paint-brush', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570402', 'fa-paper-plane', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570403', 'fa-paper-plane-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570404', 'fa-paperclip', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570405', 'fa-paragraph', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570406', 'fa-pause', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570407', 'fa-paw', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570408', 'fa-paypal', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570409', 'fa-pencil', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570410', 'fa-pencil-square', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570411', 'fa-pencil-square-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570412', 'fa-phone', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570413', 'fa-phone-square', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570414', 'fa-picture-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570415', 'fa-pie-chart', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570416', 'fa-pied-piper', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570417', 'fa-pied-piper-alt', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570418', 'fa-pinterest', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570419', 'fa-pinterest-square', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570420', 'fa-plane', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570421', 'fa-play', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570422', 'fa-play-circle', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570423', 'fa-play-circle-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570424', 'fa-plug', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570425', 'fa-plus', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570426', 'fa-plus-circle', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570427', 'fa-plus-square', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570428', 'fa-plus-square-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570429', 'fa-power-off', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570430', 'fa-print', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570431', 'fa-puzzle-piece', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570432', 'fa-qq', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570433', 'fa-qrcode', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570434', 'fa-question', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570435', 'fa-question-circle', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570436', 'fa-quote-left', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570437', 'fa-quote-right', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570438', 'fa-random', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570439', 'fa-rebel', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570440', 'fa-recycle', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570441', 'fa-reddit', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570442', 'fa-reddit-square', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570443', 'fa-refresh', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570444', 'fa-renren', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570445', 'fa-repeat', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570446', 'fa-reply', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570447', 'fa-reply-all', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570448', 'fa-retweet', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570449', 'fa-road', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570450', 'fa-rocket', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570451', 'fa-rss', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570452', 'fa-rss-square', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570453', 'fa-rub', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570454', 'fa-scissors', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570455', 'fa-search', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570456', 'fa-search-minus', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570457', 'fa-search-plus', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570458', 'fa-share', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570459', 'fa-share-alt', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570460', 'fa-share-alt-square', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570461', 'fa-share-square', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570462', 'fa-share-square-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570463', 'fa-shield', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570464', 'fa-shopping-cart', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570465', 'fa-sign-in', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570466', 'fa-sign-out', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570467', 'fa-signal', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570468', 'fa-sitemap', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570469', 'fa-skype', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570470', 'fa-slack', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570471', 'fa-sliders', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570472', 'fa-slideshare', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570473', 'fa-smile-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570474', 'fa-sort', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570475', 'fa-sort-alpha-asc', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570476', 'fa-sort-alpha-desc', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570477', 'fa-sort-amount-asc', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570478', 'fa-sort-amount-desc', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570479', 'fa-sort-asc', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570480', 'fa-sort-desc', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570481', 'fa-sort-numeric-asc', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570482', 'fa-sort-numeric-desc', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570483', 'fa-soundcloud', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570484', 'fa-space-shuttle', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570485', 'fa-spinner', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570486', 'fa-spoon', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570487', 'fa-spotify', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570488', 'fa-square', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570489', 'fa-square-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570490', 'fa-stack-exchange', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570491', 'fa-stack-overflow', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570492', 'fa-star', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570493', 'fa-star-half', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570494', 'fa-star-half-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570495', 'fa-star-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570496', 'fa-steam', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570497', 'fa-steam-square', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570498', 'fa-step-backward', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570499', 'fa-step-forward', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570500', 'fa-stethoscope', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570501', 'fa-stop', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570502', 'fa-strikethrough', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570503', 'fa-stumbleupon', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570504', 'fa-stumbleupon-circle', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570505', 'fa-subscript', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570506', 'fa-suitcase', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570507', 'fa-sun-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570508', 'fa-superscript', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570509', 'fa-table', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570510', 'fa-tablet', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570511', 'fa-tachometer', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570512', 'fa-tag', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570513', 'fa-tags', '3');
INSERT INTO `aos_icon` VALUES ('1609281101570514', 'fa-tasks', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580515', 'fa-taxi', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580516', 'fa-tencent-weibo', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580517', 'fa-terminal', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580518', 'fa-text-height', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580519', 'fa-text-width', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580520', 'fa-th', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580521', 'fa-th-large', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580522', 'fa-th-list', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580523', 'fa-thumb-tack', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580524', 'fa-thumbs-down', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580525', 'fa-thumbs-o-down', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580526', 'fa-thumbs-o-up', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580527', 'fa-thumbs-up', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580528', 'fa-ticket', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580529', 'fa-times', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580530', 'fa-times-circle', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580531', 'fa-times-circle-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580532', 'fa-tint', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580533', 'fa-toggle-off', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580534', 'fa-toggle-on', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580535', 'fa-trash', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580536', 'fa-trash-o', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580537', 'fa-tree', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580538', 'fa-trello', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580539', 'fa-trophy', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580540', 'fa-truck', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580541', 'fa-try', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580542', 'fa-tty', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580543', 'fa-tumblr', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580544', 'fa-tumblr-square', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580545', 'fa-twitch', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580546', 'fa-twitter', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580547', 'fa-twitter-square', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580548', 'fa-umbrella', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580549', 'fa-underline', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580550', 'fa-undo', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580551', 'fa-university', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580552', 'fa-unlock', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580553', 'fa-unlock-alt', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580554', 'fa-upload', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580555', 'fa-usd', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580556', 'fa-user', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580557', 'fa-user-md', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580558', 'fa-users', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580559', 'fa-video-camera', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580560', 'fa-vimeo-square', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580561', 'fa-vine', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580562', 'fa-vk', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580563', 'fa-volume-down', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580564', 'fa-volume-off', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580565', 'fa-volume-up', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580566', 'fa-weibo', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580567', 'fa-weixin', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580568', 'fa-wheelchair', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580569', 'fa-wifi', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580570', 'fa-windows', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580571', 'fa-wordpress', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580572', 'fa-wrench', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580573', 'fa-xing', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580574', 'fa-xing-square', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580575', 'fa-yahoo', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580576', 'fa-yelp', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580577', 'fa-youtube', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580578', 'fa-youtube-play', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580579', 'fa-youtube-square', '3');
INSERT INTO `aos_icon` VALUES ('1609281101580580', 'filter.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580581', 'folder1.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580582', 'folder10.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580583', 'folder11.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580584', 'folder12.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580585', 'folder13.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580586', 'folder14.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580587', 'folder15.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580588', 'folder16.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580589', 'folder17.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580590', 'folder18.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580591', 'folder19.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580592', 'folder2.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580593', 'folder20.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580594', 'folder21.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580595', 'folder22.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580596', 'folder23.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580597', 'folder24.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580598', 'folder25.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580599', 'folder26.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580600', 'folder27.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580601', 'folder28.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580602', 'folder4.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580603', 'folder5.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580604', 'folder6.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580605', 'folder7.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580606', 'folder8.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580607', 'folder9.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580608', 'forward.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580609', 'freelance.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580610', 'go.gif', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580611', 'go.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580612', 'go1.gif', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580613', 'go1.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580614', 'help.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580615', 'home.gif', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580616', 'home.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580617', 'icon134.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580618', 'icon137.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580619', 'icon140.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580620', 'icon141.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580621', 'icon146.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580622', 'icon15.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580623', 'icon150.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580624', 'icon152.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580625', 'icon153.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580626', 'icon154.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580627', 'icon17.gif', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580628', 'icon25.gif', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580629', 'icon26.gif', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580630', 'icon31.gif', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580631', 'icon32.gif', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580632', 'icon34.gif', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580633', 'icon35.gif', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580634', 'icon36.gif', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580635', 'icon37.gif', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580636', 'icon38.gif', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580637', 'icon39.gif', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580638', 'icon41.gif', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580639', 'icon42.gif', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580640', 'icon5.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580641', 'icon56.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580642', 'icon59.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580643', 'icon63.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580644', 'icon65.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580645', 'icon66.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580646', 'icon67.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580647', 'icon68.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580648', 'icon7.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580649', 'icon70.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580650', 'icon71.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580651', 'icon72.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580652', 'icon75.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580653', 'icon76.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580654', 'icon77.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580655', 'icon78.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580656', 'icon79.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580657', 'icon8.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580658', 'icon80.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580659', 'icon82.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580660', 'icon85.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580661', 'icon86.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580662', 'icon88.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580663', 'icon9.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580664', 'icon96.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580665', 'icon_19.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580666', 'icq.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580667', 'id.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580668', 'ins.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580669', 'jar.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580670', 'key.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580671', 'layout.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101580672', 'layout2.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590673', 'left.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590674', 'lightbulb.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590675', 'lock.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590676', 'lock3.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590677', 'modules_wizard.gif', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590678', 'monitor.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590679', 'node.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590680', 'ok.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590681', 'ok1.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590682', 'ok3.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590683', 'ok4.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590684', 'ok5.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590685', 'org.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590686', 'org2.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590687', 'outs.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590688', 'own.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590689', 'page.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590690', 'page2.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590691', 'page3.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590692', 'page_code.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590693', 'page_font.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590694', 'page_next.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590695', 'page_office.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590696', 'page_paint.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590697', 'page_picture.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590698', 'page_vector.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590699', 'paint2.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590700', 'paste.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590701', 'picture.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590702', 'pictures.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590703', 'picture_empty.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590704', 'plugin.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590705', 'plugin2.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590706', 'printer.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590707', 'query.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590708', 'redo.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590709', 'refresh.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590710', 'refresh2.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590711', 'right.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590712', 'save.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590713', 'save_all.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590714', 'search.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590715', 'security.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590716', 'send_receive.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590717', 'shape_align_bottom.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590718', 'shape_align_center.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590719', 'shape_align_middle.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590720', 'shape_group.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590721', 'shape_handles.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590722', 'shape_move_back.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590723', 'share.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590724', 'sitemap.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590725', 'sql.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590726', 'sql2.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590727', 'sql3.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590728', 'stop.gif', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590729', 'stop2.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590730', 'stop3.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590731', 'system.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590732', 'table.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590733', 'table2.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590734', 'tables.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590735', 'tables_relation.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590736', 'table_edit.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590737', 'tag.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590738', 'task.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590739', 'task1.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590740', 'task_finish.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590741', 'task_list.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590742', 'terminal.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590743', 'textfield.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590744', 'text_cap.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590745', 'text_col.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590746', 'text_list.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590747', 'text_upper.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590748', 'theme.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590749', 'time.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590750', 'timeline.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590751', 'undo.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590752', 'up.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590753', 'up2.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590754', 'up_left.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590755', 'up_right.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590756', 'user1.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590757', 'user2.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590758', 'user20.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590759', 'user3.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590760', 'user6.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590761', 'user8.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590762', 'vcard.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590763', 'vector.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590764', 'wand.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590765', 'webcam.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590766', 'zoom_in.png', '1');
INSERT INTO `aos_icon` VALUES ('1609281101590767', 'zoom_out.png', '1');

-- ----------------------------
-- Table structure for aos_module
-- ----------------------------
DROP TABLE IF EXISTS `aos_module`;
CREATE TABLE `aos_module` (
  `id_` varchar(20) NOT NULL COMMENT '功能模块流水号',
  `cascade_id_` varchar(255) NOT NULL COMMENT '节点语义ID',
  `parent_id_` varchar(20) NOT NULL COMMENT '父节点流水号',
  `name_` varchar(255) NOT NULL COMMENT '功能模块名称',
  `url_` varchar(255) DEFAULT NULL COMMENT '主页面URL',
  `icon_name_` varchar(255) DEFAULT NULL COMMENT '节点图标文件名称',
  `is_leaf_` varchar(255) NOT NULL COMMENT '是否叶子节点',
  `is_auto_expand_` varchar(255) NOT NULL COMMENT '是否自动展开',
  `is_enable_` varchar(255) NOT NULL COMMENT '是否启用',
  `vector_` varchar(255) DEFAULT NULL COMMENT '矢量图标',
  `sort_no_` int(10) DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能模块表';

-- ----------------------------
-- Records of aos_module
-- ----------------------------
INSERT INTO `aos_module` VALUES ('1608211848140001', '0', '0', 'AOS开发套件', '', 'home.png', '0', '1', '1', '', '1');
INSERT INTO `aos_module` VALUES ('1608211848140002', '0.001', '1608211848140001', '系统管理', null, 'folder22.png', '0', '1', '1', 'fa-cogs', '10');
INSERT INTO `aos_module` VALUES ('1608211848140004', '0.002', '1608211848140001', '范例', '', 'folder9.png', '0', '1', '1', 'fa-bug', '20');
INSERT INTO `aos_module` VALUES ('1608211848140005', '0.002.001', '1608211848140004', '范例一', '', 'icon75.png', '1', '0', '1', '', '1');
INSERT INTO `aos_module` VALUES ('1609251712430092', '0.001.007', '1608211848140002', '资源', '', 'folder1.png', '0', '1', '1', '', '10');
INSERT INTO `aos_module` VALUES ('1609251713430093', '0.001.007.001', '1609251712430092', '键值参数', 'masterDataService.initParam', 'icon153.png', '1', '0', '1', '', '10');
INSERT INTO `aos_module` VALUES ('1609251714230094', '0.001.007.002', '1609251712430092', '数据字典', 'masterDataService.initDictionary', 'icon152.png', '1', '0', '1', '', '20');
INSERT INTO `aos_module` VALUES ('1609251714520095', '0.001.007.003', '1609251712430092', '功能模块', 'moduleService.init', 'icon154.png', '1', '0', '1', '', '30');
INSERT INTO `aos_module` VALUES ('1609251716000096', '0.001.008', '1608211848140002', '权限', '', 'folder1.png', '0', '1', '1', '', '20');
INSERT INTO `aos_module` VALUES ('1609251717240097', '0.001.008.001', '1609251716000096', '部门管理', 'orgService.init', 'org.png', '1', '0', '1', '', '10');
INSERT INTO `aos_module` VALUES ('1609251717510098', '0.001.008.002', '1609251716000096', '用户管理', 'userService.init', 'user6.png', '1', '0', '1', '', '20');
INSERT INTO `aos_module` VALUES ('1609251718170099', '0.001.008.003', '1609251716000096', '角色管理', 'roleService.init', 'own.png', '1', '0', '1', '', '30');
INSERT INTO `aos_module` VALUES ('1609251719000100', '0.001.009', '1608211848140002', '监控', '', 'folder1.png', '0', '1', '1', '', '30');
INSERT INTO `aos_module` VALUES ('1609251719200101', '0.001.009.001', '1609251719000100', '在线用户', 'onlineUserService.init', 'terminal.png', '1', '0', '1', '', '10');
INSERT INTO `aos_module` VALUES ('1609271530350000', '0.001.010', '1608211848140002', '工具', '', 'folder1.png', '0', '1', '1', '', '40');
INSERT INTO `aos_module` VALUES ('1609271607190016', '0.001.010.001', '1609271530350000', '图标', 'iconService.init', 'pictures.png', '1', '0', '1', '', '10');

-- ----------------------------
-- Table structure for aos_org
-- ----------------------------
DROP TABLE IF EXISTS `aos_org`;
CREATE TABLE `aos_org` (
  `id_` varchar(20) NOT NULL COMMENT '流水号',
  `cascade_id_` varchar(255) NOT NULL COMMENT '节点语义ID',
  `name_` varchar(255) NOT NULL COMMENT '组织名称',
  `hotkey_` varchar(255) DEFAULT NULL COMMENT '热键',
  `parent_id_` varchar(20) NOT NULL COMMENT '父节点流水号',
  `is_leaf_` varchar(255) NOT NULL COMMENT '是否叶子节点',
  `is_auto_expand_` varchar(255) NOT NULL COMMENT '是否自动展开',
  `icon_name_` varchar(255) DEFAULT NULL COMMENT '节点图标文件名称',
  `type_` varchar(255) NOT NULL COMMENT '组织类型',
  `biz_code_` varchar(255) DEFAULT NULL COMMENT '扩展码',
  `sort_no_` int(10) DEFAULT NULL COMMENT '排序号',
  `remark_` varchar(4000) DEFAULT NULL COMMENT '备注',
  `is_del_` varchar(255) NOT NULL COMMENT '是否已删除',
  `create_time_` datetime NOT NULL COMMENT '创建时间',
  `create_by_` varchar(20) NOT NULL COMMENT '创建人ID',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织表';

-- ----------------------------
-- Records of aos_org
-- ----------------------------
INSERT INTO `aos_org` VALUES ('1609052226010010', '0', '中国工商银行', '', '0', '0', '1', 'home.png', '1', '', '1', '', '0', '2016-08-12 17:38:32', '1609091343220003');
INSERT INTO `aos_org` VALUES ('1609052226010011', '0.001', '上海分行', '', '1609052226010010', '0', '1', '', '1', '', '1', null, '0', '2016-09-06 10:31:11', '1609091343220003');
INSERT INTO `aos_org` VALUES ('1609052226010012', '0.001.001', '杨浦支行', '', '1609052226010011', '1', '0', '', '1', '', '1', null, '0', '2016-09-06 10:33:05', '1609091343220003');
INSERT INTO `aos_org` VALUES ('1609062348520002', '0.002', '广东分行', '', '1609052226010010', '1', '0', '', '1', '', '2', '', '0', '2016-09-06 23:48:52', '1609091343220003');
INSERT INTO `aos_org` VALUES ('1609062349030003', '0.001.001.001', '二位', '', '1609052226010012', '0', '0', '', '1', '', '1', null, '1', '2016-09-06 23:49:03', '1609091343220003');
INSERT INTO `aos_org` VALUES ('1609062349090004', '0.001.002', '二位', null, '1609052226010011', '1', '0', null, '1', null, '1', null, '1', '2016-09-06 23:49:09', '1609091343220003');
INSERT INTO `aos_org` VALUES ('1609062349140005', '0.003', '云南分行', '', '1609052226010010', '1', '0', '', '1', '', '3', '', '0', '2016-09-06 23:49:14', '1609091343220003');
INSERT INTO `aos_org` VALUES ('1609131347030004', '0.004', '2121', null, '1609052226010010', '1', '0', '212', '1', '212', '1', '12121', '1', '2016-09-13 13:47:03', '1609091343220003');
INSERT INTO `aos_org` VALUES ('1609131347140005', '0.005', '2232', null, '1609052226010010', '1', '0', null, '1', null, '1', null, '1', '2016-09-13 13:47:14', '1609091343220003');
INSERT INTO `aos_org` VALUES ('1610221719210001', '0.006', 'eqwewqeqw', null, '1609052226010010', '1', '0', null, '1', null, '1', null, '1', '2016-10-22 17:19:21', '9999999999999999');

-- ----------------------------
-- Table structure for aos_params
-- ----------------------------
DROP TABLE IF EXISTS `aos_params`;
CREATE TABLE `aos_params` (
  `id_` varchar(20) NOT NULL COMMENT '流水号',
  `name_` varchar(255) NOT NULL COMMENT '参数名称',
  `key_` varchar(255) NOT NULL COMMENT '参数键',
  `value_` varchar(255) DEFAULT NULL COMMENT '参数值',
  `group_` varchar(255) DEFAULT NULL COMMENT '分组',
  `remark_` varchar(4000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `ukey1` (`key_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='参数表';

-- ----------------------------
-- Records of aos_params
-- ----------------------------
INSERT INTO `aos_params` VALUES ('1608211848140012', '登录请求等待信息', 'login_wait_msg_', '正在拼命带你飞, 请稍候...', '1', '');
INSERT INTO `aos_params` VALUES ('1608211848140013', '开发用户快捷登录账户', 'login_dev_account_', 'root', '1', '可设置为任意一个系统存在的账户。');
INSERT INTO `aos_params` VALUES ('1608211848140014', '开发用户快捷登录开关', 'login_dev_', '1', '1', '可选值：1 | 0。1：打开；0：关闭。');
INSERT INTO `aos_params` VALUES ('1608211848140016', '系统缺省皮肤', 'skin_', 'blue', '1', '可选值：blue|gray|aos。优先级低于用户自己的皮肤配置。');
INSERT INTO `aos_params` VALUES ('1608211848140017', '登录页面的背景图片', 'login_back_img_', '-1', '1', '登录页面的背景图片。可选的预设背景图片为：0.jpg、1.jpg、2.jpg。如果需要随机出现背景，则将其设置为-1。');
INSERT INTO `aos_params` VALUES ('1608211848140018', '是否显示验证码', 'is_show_vercode_', '1', '1', '是否在登录页面显示验证码及后台验证码验证。可选值：0(否) | 1(是)。');
INSERT INTO `aos_params` VALUES ('1608211848140019', '验证码长度', 'vercode_length_', '4', '1', null);
INSERT INTO `aos_params` VALUES ('1608211848140020', '验证码待选字符集', 'vercode_characters_', 'abcdetx2345678', '1', null);
INSERT INTO `aos_params` VALUES ('1608211848140022', 'Tab高亮颜色', 'tab_focus_color_', '#0099FF', '1', '缺省的当前Tab卡片高亮提示颜色');
INSERT INTO `aos_params` VALUES ('1608211848140023', '表格分页行数', 'page_size_', '50', '1', '缺省的分页大小。JSP页面的属性设置会覆盖这个配置。');
INSERT INTO `aos_params` VALUES ('1608211848140024', '表格列单元格内容对齐方式', 'grid_column_algin_', 'left', '1', '表格列对齐模式。有效值：left|center|right。');
INSERT INTO `aos_params` VALUES ('1608211848140025', '全局右键', 'prevent_rightclick_', 'false', '1', '阻止浏览器缺省鼠标右键事件。可选值：true|false。缺省值：true。');
INSERT INTO `aos_params` VALUES ('1608211848140026', '下拉选择框的缺省提示信息', 'combobox_emptytext_', '请选择...', '1', null);
INSERT INTO `aos_params` VALUES ('1608211848140028', '表单校验消息提示方式', 'msgtarget_', 'qtip', '1', '可选值必须是下列值之一 (1)、qtip 当用户鼠标悬停在该域之上时显示包含了消息的迅速提示。(2)、title 显示消息以浏览器默认的title属性弹出。 (3)、under 在域下方添加一块包含了错误消息的div。(4)、side 添加一个错误图标在域的右边，鼠标悬停上面时弹出显示消息。');
INSERT INTO `aos_params` VALUES ('1608211848140029', '水平导航条按钮风格', 'nav_button_style_', 'tight', '1', '顶部水平导航条的按钮样式风格。tight：组合按钮；standalone：独立按钮。');
INSERT INTO `aos_params` VALUES ('1608211848140030', '是否显示水平导航条', 'is_show_top_nav_', '1', '1', '是否显示水平导航条。可选值：1 | 0。');
INSERT INTO `aos_params` VALUES ('1608211848140031', '页面刷新动画文件', 'page_load_gif_', 'wheel.gif', '1', '页面刷新动画文件。可选的预设动画文件：run.gif、wheel.gif。动画path：/static/image/gif/pageload。');
INSERT INTO `aos_params` VALUES ('1608211848140032', '运行模式', 'run_mode_', '0', '1', '0：开发模式；1：生产模式；2：在线体验模式');
INSERT INTO `aos_params` VALUES ('1608211848140033', '功能模块页面加载等待提示信息', 'page_load_msg_', '正在拼命带你飞, 请稍候...', '1', '');
INSERT INTO `aos_params` VALUES ('1608211848140034', '欢迎页标题', 'welcome_page_title_', '欢迎', '1', '');
INSERT INTO `aos_params` VALUES ('1608211848140035', '版权信息', 'copyright_', '2008-2015 OSWorks', '1', null);
INSERT INTO `aos_params` VALUES ('1608211848140036', '用户会话Redis超时时间', 'user_login_timeout_', '18000', '1', '以秒(s)为单位。18000=5小时。');
INSERT INTO `aos_params` VALUES ('1608211848140037', '首页浏览器标题', 'app_title_', 'AOS : JavaEE应用基础平台', '1', '');
INSERT INTO `aos_params` VALUES ('1608211848140038', '加解密算法密钥', 'code_key_', 'HY&XC&MW', '1', '用户密码加解密算法密钥：密钥不能小于8位');
INSERT INTO `aos_params` VALUES ('1610221716240000', 'QQ群推广链接', 'qq_group_link_', 'http://jq.qq.com/?_wv=1027&k=40fPema', '2', '当系统处于在线演示模式时，登录系统后会弹出自动加QQ群提示。');

-- ----------------------------
-- Table structure for aos_role
-- ----------------------------
DROP TABLE IF EXISTS `aos_role`;
CREATE TABLE `aos_role` (
  `id_` varchar(20) NOT NULL COMMENT ' 流水号',
  `name_` varchar(255) NOT NULL COMMENT '角色名称',
  `is_enable_` varchar(255) NOT NULL COMMENT '是否启用',
  `type_` varchar(255) NOT NULL COMMENT '角色类型',
  `biz_code_` varchar(255) DEFAULT NULL COMMENT '扩展码',
  `remark_` varchar(4000) DEFAULT NULL COMMENT '备注',
  `create_time_` datetime NOT NULL COMMENT '创建时间',
  `create_by_` varchar(20) NOT NULL COMMENT '创建人ID',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of aos_role
-- ----------------------------
INSERT INTO `aos_role` VALUES ('1609151429140000', '测试角色', '1', '1', '', '', '2016-09-15 14:29:14', '1609091343220004');
INSERT INTO `aos_role` VALUES ('9999999999999999', '超级用户角色', '1', '1', '', '', '2016-08-14 14:18:28', '9999999999999999');

-- ----------------------------
-- Table structure for aos_role_module
-- ----------------------------
DROP TABLE IF EXISTS `aos_role_module`;
CREATE TABLE `aos_role_module` (
  `id_` varchar(20) NOT NULL COMMENT '流水号',
  `role_id_` varchar(20) NOT NULL COMMENT ' 角色流水号',
  `module_id_` varchar(20) NOT NULL COMMENT '功能模块流水号',
  `grant_type_` varchar(255) NOT NULL COMMENT '权限类型',
  `create_time_` datetime NOT NULL COMMENT '创建时间',
  `create_by_` varchar(20) NOT NULL COMMENT '创建人ID',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `aos_sys_module_role_ukey` (`role_id_`,`module_id_`,`grant_type_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能模块-角色关联表';

-- ----------------------------
-- Records of aos_role_module
-- ----------------------------
INSERT INTO `aos_role_module` VALUES ('1609251725510118', '1609151429140000', '1608211848140001', '1', '2016-09-25 17:25:51', '9999999999999999');
INSERT INTO `aos_role_module` VALUES ('1609251725510119', '1609151429140000', '1608211848140002', '1', '2016-09-25 17:25:51', '9999999999999999');
INSERT INTO `aos_role_module` VALUES ('1609251725510120', '1609151429140000', '1609251712430092', '1', '2016-09-25 17:25:51', '9999999999999999');
INSERT INTO `aos_role_module` VALUES ('1609251725510121', '1609151429140000', '1609251713430093', '1', '2016-09-25 17:25:51', '9999999999999999');
INSERT INTO `aos_role_module` VALUES ('1609271607550017', '9999999999999999', '1608211848140001', '1', '2016-09-27 16:07:55', '9999999999999999');
INSERT INTO `aos_role_module` VALUES ('1609271607550018', '9999999999999999', '1608211848140002', '1', '2016-09-27 16:07:55', '9999999999999999');
INSERT INTO `aos_role_module` VALUES ('1609271607550019', '9999999999999999', '1609251712430092', '1', '2016-09-27 16:07:55', '9999999999999999');
INSERT INTO `aos_role_module` VALUES ('1609271607550020', '9999999999999999', '1609251713430093', '1', '2016-09-27 16:07:55', '9999999999999999');
INSERT INTO `aos_role_module` VALUES ('1609271607550021', '9999999999999999', '1609251714230094', '1', '2016-09-27 16:07:55', '9999999999999999');
INSERT INTO `aos_role_module` VALUES ('1609271607550022', '9999999999999999', '1609251714520095', '1', '2016-09-27 16:07:55', '9999999999999999');
INSERT INTO `aos_role_module` VALUES ('1609271607550023', '9999999999999999', '1609251716000096', '1', '2016-09-27 16:07:55', '9999999999999999');
INSERT INTO `aos_role_module` VALUES ('1609271607550024', '9999999999999999', '1609251717240097', '1', '2016-09-27 16:07:55', '9999999999999999');
INSERT INTO `aos_role_module` VALUES ('1609271607550025', '9999999999999999', '1609251717510098', '1', '2016-09-27 16:07:55', '9999999999999999');
INSERT INTO `aos_role_module` VALUES ('1609271607550026', '9999999999999999', '1609251718170099', '1', '2016-09-27 16:07:55', '9999999999999999');
INSERT INTO `aos_role_module` VALUES ('1609271607550027', '9999999999999999', '1609251719000100', '1', '2016-09-27 16:07:55', '9999999999999999');
INSERT INTO `aos_role_module` VALUES ('1609271607550028', '9999999999999999', '1609251719200101', '1', '2016-09-27 16:07:55', '9999999999999999');
INSERT INTO `aos_role_module` VALUES ('1609271607550029', '9999999999999999', '1609271530350000', '1', '2016-09-27 16:07:55', '9999999999999999');
INSERT INTO `aos_role_module` VALUES ('1609271607550030', '9999999999999999', '1609271607190016', '1', '2016-09-27 16:07:55', '9999999999999999');
INSERT INTO `aos_role_module` VALUES ('1609271607550031', '9999999999999999', '1608211848140004', '1', '2016-09-27 16:07:55', '9999999999999999');
INSERT INTO `aos_role_module` VALUES ('1609271607550032', '9999999999999999', '1608211848140005', '1', '2016-09-27 16:07:55', '9999999999999999');

-- ----------------------------
-- Table structure for aos_sequence
-- ----------------------------
DROP TABLE IF EXISTS `aos_sequence`;
CREATE TABLE `aos_sequence` (
  `name_` varchar(50) NOT NULL COMMENT '序列号名称',
  `current_value_` bigint(20) NOT NULL COMMENT '当前值',
  `increment_` int(3) NOT NULL DEFAULT '1' COMMENT '增长步长',
  PRIMARY KEY (`name_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='序列表';

-- ----------------------------
-- Records of aos_sequence
-- ----------------------------
INSERT INTO `aos_sequence` VALUES ('seq_test', '1085', '1');

-- ----------------------------
-- Table structure for aos_user
-- ----------------------------
DROP TABLE IF EXISTS `aos_user`;
CREATE TABLE `aos_user` (
  `id_` varchar(20) NOT NULL COMMENT '流水号',
  `account_` varchar(255) NOT NULL COMMENT '用户登录帐号',
  `password_` varchar(255) NOT NULL COMMENT '密码',
  `name_` varchar(255) NOT NULL COMMENT '用户姓名',
  `sex_` varchar(255) NOT NULL COMMENT '性别',
  `status_` varchar(255) NOT NULL COMMENT '用户状态',
  `type_` varchar(255) NOT NULL COMMENT '用户类型',
  `org_id_` varchar(20) NOT NULL COMMENT '所属部门流水号',
  `email_` varchar(255) DEFAULT NULL COMMENT '电子邮件',
  `mobile_` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `idno_` varchar(255) DEFAULT NULL COMMENT '身份证号',
  `skin_` varchar(255) NOT NULL COMMENT '用户界面皮肤',
  `biz_code_` varchar(255) DEFAULT NULL COMMENT '业务对照码',
  `address_` varchar(500) DEFAULT NULL COMMENT '联系地址',
  `remark_` varchar(4000) DEFAULT NULL COMMENT '备注',
  `is_del_` varchar(255) NOT NULL COMMENT '是否已删除',
  `create_time_` datetime NOT NULL COMMENT ' 创建时间',
  `create_by_` varchar(20) NOT NULL COMMENT '创建人ID',
  `test` varchar(500) DEFAULT NULL,
  `address1_` varchar(500) DEFAULT NULL COMMENT '序列号名称',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户基本信息表';

-- ----------------------------
-- Records of aos_user
-- ----------------------------
INSERT INTO `aos_user` VALUES ('1609091343220004', 'mowen', 'a2c292420f2af5038fefd1bb63eeb736', '莫雯', '3', '1', '1', '1609062349140005', '', '', '', 'blue', '', null, '', '0', '2016-09-09 13:43:22', '9999999999999999', null, null);
INSERT INTO `aos_user` VALUES ('1609091506420005', 'huangyu', 'a2c292420f2af5038fefd1bb63eeb736', '黄玉', '3', '1', '1', '1609062349140005', null, null, null, 'blue', null, null, null, '0', '2016-09-09 15:06:42', '9999999999999999', null, null);
INSERT INTO `aos_user` VALUES ('1609131347400006', '3232', 'b06e3b3a5c8e32927979fd0a304779a2', '23232', '3', '1', '1', '1609052226010010', '', '', '', 'blue', '3232323', null, '323223232', '1', '2016-09-13 13:47:40', '9999999999999999', null, null);
INSERT INTO `aos_user` VALUES ('9999999999999999', 'root', 'a2c292420f2af5038fefd1bb63eeb736', '超级用户', '1', '1', '1', '1609052226010010', '', '', '', 'blue', '', '', '', '0', '2016-08-12 17:38:19', '9999999999999999', null, null);

-- ----------------------------
-- Table structure for aos_user_role
-- ----------------------------
DROP TABLE IF EXISTS `aos_user_role`;
CREATE TABLE `aos_user_role` (
  `id_` varchar(20) NOT NULL COMMENT '流水号',
  `user_id_` varchar(20) NOT NULL COMMENT '用户流水号',
  `role_id_` varchar(20) NOT NULL COMMENT '角色流水号',
  `create_time_` datetime NOT NULL COMMENT '创建时间',
  `create_by_` varchar(20) NOT NULL COMMENT '创建人ID',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `aos_sys_user_role_ukey` (`user_id_`,`role_id_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-角色关联表';

-- ----------------------------
-- Records of aos_user_role
-- ----------------------------
INSERT INTO `aos_user_role` VALUES ('1609222346390116', '9999999999999999', '9999999999999999', '2016-09-22 23:46:39', '9999999999999999');
INSERT INTO `aos_user_role` VALUES ('1609232200410011', '1609091343220004', '1609151429140000', '2016-09-23 22:00:41', '9999999999999999');
INSERT INTO `aos_user_role` VALUES ('1609232201120012', '1609091506420005', '1609151429140000', '2016-09-23 22:01:12', '9999999999999999');

-- ----------------------------
-- Function structure for currval
-- ----------------------------
DROP FUNCTION IF EXISTS `currval`;
DELIMITER ;;
CREATE FUNCTION `currval`(seq_name_ VARCHAR(50)) RETURNS bigint(20)
    READS SQL DATA
    DETERMINISTIC
BEGIN  
  
DECLARE out_current_value_ INTEGER;  
  
SET out_current_value_ = 0;  
  
SELECT current_value_ INTO out_current_value_ FROM aos_sequence WHERE name_ = seq_name_;  
  
RETURN out_current_value_;  
  
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for nextval
-- ----------------------------
DROP FUNCTION IF EXISTS `nextval`;
DELIMITER ;;
CREATE FUNCTION `nextval`(seq_name_ VARCHAR(50)) RETURNS bigint(20)
    DETERMINISTIC
BEGIN
  
UPDATE aos_sequence SET current_value_ = current_value_ + increment_ WHERE name_ = seq_name_;

RETURN currval(seq_name_);
  
END
;;
DELIMITER ;
