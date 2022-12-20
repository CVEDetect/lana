/*
 Navicat Premium Data Transfer

 Source Server         : baidu6m
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : 120.48.84.246:8090
 Source Schema         : lana-boot

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 20/12/2022 10:11:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bus_binding
-- ----------------------------
DROP TABLE IF EXISTS `bus_binding`;
CREATE TABLE `bus_binding` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `paln_item_id` bigint DEFAULT NULL COMMENT '任务名称',
  `step_id` bigint DEFAULT NULL COMMENT '流程名称',
  `paln_item_name` varchar(255) DEFAULT NULL COMMENT '任务名称',
  `paln_name` varchar(255) DEFAULT NULL COMMENT '计划名称',
  `create_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务—流程绑定';

-- ----------------------------
-- Records of bus_binding
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for paln_item
-- ----------------------------
DROP TABLE IF EXISTS `paln_item`;
CREATE TABLE `paln_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT ' 任务名称',
  `plan_cont` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '计划内容描述',
  `plan_status` int DEFAULT NULL COMMENT '0:未分配（新建），1:进行中，2:完成，3:驳回，4:已分配',
  `plan_deman_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '关联计划名称',
  `plan_deman_end_time` date DEFAULT NULL COMMENT '计划完成日期',
  `plan_deman_id` bigint DEFAULT NULL COMMENT '关联的计划id',
  `create_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务信息表';

-- ----------------------------
-- Records of paln_item
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha` (
  `uuid` char(36) NOT NULL COMMENT 'uuid',
  `code` varchar(6) NOT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统验证码';

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_deman
-- ----------------------------
DROP TABLE IF EXISTS `sys_deman`;
CREATE TABLE `sys_deman` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `deman_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '任务名称',
  `deman_num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '任务编号，日期+时间戳',
  `deman_disclose` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '交底文件地址（任务说明）',
  `deman_diso_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '交底文件名称',
  `deman_consci` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '需求负责人id，由创建需求的时候指定',
  `deman_consci_acoun` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '负责人名字账号',
  `deman_deadline` datetime DEFAULT NULL COMMENT '任务截止时间',
  `deman_status` int DEFAULT '1' COMMENT '0”>删除/舍弃\n1">新建\n2">已分配\n3">开发中\n4">开发完成\n5">待测试\n6">测试中\n7">测试完成\n8">产品代验收\n9">验收检查\n10">验收完成\n11">待实施\n12">实施中\n13">实施完成\n',
  `deman_change` int DEFAULT '0' COMMENT '变更次数',
  `deman_project` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '关联项目id',
  `deman_project_nam` varchar(255) DEFAULT NULL COMMENT '项目名称',
  `create_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='计划需求表';

-- ----------------------------
-- Records of sys_deman
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_deman_histroy
-- ----------------------------
DROP TABLE IF EXISTS `sys_deman_histroy`;
CREATE TABLE `sys_deman_histroy` (
  `keyid` bigint NOT NULL AUTO_INCREMENT,
  `id` bigint DEFAULT NULL COMMENT '需求id',
  `deman_name` varchar(255) DEFAULT NULL COMMENT '任务名称',
  `deman_num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '任务编号，日期+时间戳',
  `deman_disclose` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '交底文件地址（任务说明）',
  `deman_diso_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '交底文件名称',
  `deman_consci` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '需求负责人，由创建需求的时候指定',
  `deman_consci_acoun` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '需求负责人账号',
  `deman_deadline` datetime DEFAULT NULL COMMENT '任务截止时间',
  `deman_status` int DEFAULT NULL COMMENT '0”>删除/舍弃\n1">新建\n2">已分配\n3">开发中\n4">开发完成\n5">待测试\n6">测试中\n7">测试完成\n8">产品代验收\n9">验收检查\n10">验收完成\n11">待实施\n12">实施中\n13">实施完成\n\n',
  `deman_change` int DEFAULT '0' COMMENT '变更次数',
  `deman_project` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '所属项目编码',
  `deman_project_nam` varchar(255) DEFAULT NULL COMMENT '项目名称',
  `create_user` varchar(255) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`keyid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='计划需求变更历史表';

-- ----------------------------
-- Records of sys_deman_histroy
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_deman_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_deman_user`;
CREATE TABLE `sys_deman_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `paln_item_id` bigint DEFAULT NULL COMMENT '任务id（对应的任务id，因为要满足不同的任务的绑定）',
  `paln_item_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '任务名称，用于展示',
  `paln_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '计划名称',
  `step_id` bigint DEFAULT NULL COMMENT '过程id',
  `node_id` bigint DEFAULT NULL COMMENT '节点id',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名称',
  `user_opinion` int DEFAULT '0' COMMENT '自己任务状态1:进行中，2:驳回，3应做，0待办（刚分配），4完成',
  `data_type` int DEFAULT NULL COMMENT '整体数据状态。1:任务被驳回，2:任务完成，3:进行中中',
  `user_remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '提交内容/驳回意见',
  `over_time` datetime DEFAULT NULL COMMENT '完成/驳回时间',
  `stert_time` datetime DEFAULT NULL COMMENT '创建时间',
  `end_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updata_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='计划需求任务-用户关联表';

-- ----------------------------
-- Records of sys_deman_user
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_depart
-- ----------------------------
DROP TABLE IF EXISTS `sys_depart`;
CREATE TABLE `sys_depart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint DEFAULT NULL COMMENT '父机构ID',
  `depart_name` varchar(255) CHARACTER SET utf8mb3 NOT NULL COMMENT '机构/部门名称',
  `depart_code` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL COMMENT '机构编码',
  `depart_status` int DEFAULT NULL COMMENT '状态（1启用，0不启用）',
  `create_user` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='组织机构表';

-- ----------------------------
-- Records of sys_depart
-- ----------------------------
BEGIN;
INSERT INTO `sys_depart` (`id`, `parent_id`, `depart_name`, `depart_code`, `depart_status`, `create_user`, `create_time`) VALUES (16, NULL, 'company', 'companys', NULL, 'admin', '2022-12-19 10:21:02');
INSERT INTO `sys_depart` (`id`, `parent_id`, `depart_name`, `depart_code`, `depart_status`, `create_user`, `create_time`) VALUES (17, 16, '研发小组', 'yanfa', NULL, 'admin', '2022-12-19 10:36:23');
INSERT INTO `sys_depart` (`id`, `parent_id`, `depart_name`, `depart_code`, `depart_status`, `create_user`, `create_time`) VALUES (18, 16, '实施运维小组', 'shishiyunwei', NULL, 'admin', '2022-12-19 11:03:11');
INSERT INTO `sys_depart` (`id`, `parent_id`, `depart_name`, `depart_code`, `depart_status`, `create_user`, `create_time`) VALUES (19, 16, '产品设计小组', 'sheji', NULL, 'admin', '2022-12-19 11:03:31');
INSERT INTO `sys_depart` (`id`, `parent_id`, `depart_name`, `depart_code`, `depart_status`, `create_user`, `create_time`) VALUES (21, 16, '测试小组', 'ceshixiaozu', NULL, 'admin', '2022-12-19 14:04:51');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint DEFAULT NULL COMMENT '父菜单ID，第一版没有子菜单，该功能先空置',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '按钮权限',
  `type` int DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (1, NULL, '组织角色管理', '/orgRoleList', NULL, 0, 'system', 6);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (2, NULL, '协作流程管理', '/versioniteraList', NULL, 1, 'admin', 5);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (3, NULL, '计划控制管理', '/demandList', NULL, 1, 'role', 4);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (4, NULL, '项目管理', '/projectList', NULL, 1, 'menu', 1);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (7, NULL, '任务管理', '/taskmanagement', NULL, 1, 'zonghe', 2);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (8, NULL, '统计信息', '/deviceList', NULL, 1, 'zonghe', 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_project
-- ----------------------------
DROP TABLE IF EXISTS `sys_project`;
CREATE TABLE `sys_project` (
  `project_id` bigint NOT NULL AUTO_INCREMENT,
  `project_name` varchar(255) DEFAULT NULL COMMENT '项目名称',
  `project_num` varchar(255) DEFAULT NULL COMMENT '项目编号',
  `project_duty_user` varchar(50) DEFAULT NULL COMMENT '项目负责人姓名',
  `project_duty_acco` varchar(50) DEFAULT NULL COMMENT '项目负责人账号',
  `project_constitution` varchar(500) DEFAULT NULL COMMENT '章程文件链接',
  `project_status` int DEFAULT NULL COMMENT '项目状态',
  `project_makr` varchar(255) DEFAULT NULL COMMENT '项目备注',
  `create_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='项目表';

-- ----------------------------
-- Records of sys_project
-- ----------------------------
BEGIN;
INSERT INTO `sys_project` (`project_id`, `project_name`, `project_num`, `project_duty_user`, `project_duty_acco`, `project_constitution`, `project_status`, `project_makr`, `create_user`, `create_time`) VALUES (1, 'test项目', '1', '1', '1', '1', 1, '1', NULL, '2022-10-06 12:07:11');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  `create_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` (`role_id`, `role_name`, `remark`, `create_user`, `create_time`) VALUES (1, '超级管理员', '超级管理员', 'admin', '2022-09-05 14:44:08');
INSERT INTO `sys_role` (`role_id`, `role_name`, `remark`, `create_user`, `create_time`) VALUES (2, '测试', '测试', '1', '2022-09-05 14:44:08');
INSERT INTO `sys_role` (`role_id`, `role_name`, `remark`, `create_user`, `create_time`) VALUES (3, '开发', '开发', '1', '2022-09-05 14:44:08');
INSERT INTO `sys_role` (`role_id`, `role_name`, `remark`, `create_user`, `create_time`) VALUES (4, '运维实施', '运维实施', 'admin', '2022-12-19 10:43:45');
INSERT INTO `sys_role` (`role_id`, `role_name`, `remark`, `create_user`, `create_time`) VALUES (5, '产品', '产品', '1', '2022-09-05 14:44:08');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (174, 1, 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (175, 1, 3);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (176, 1, 4);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (177, 1, 7);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (178, 1, 8);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (179, 1, 2);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (181, 3, 7);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (182, 3, 4);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (183, 3, 8);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (184, 2, 7);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (185, 2, 8);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (191, 4, 4);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (192, 4, 7);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (193, 4, 8);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (197, 5, 8);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (198, 5, 7);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (199, 5, 4);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (200, 5, 3);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (201, 5, 2);
COMMIT;

-- ----------------------------
-- Table structure for sys_step
-- ----------------------------
DROP TABLE IF EXISTS `sys_step`;
CREATE TABLE `sys_step` (
  `step_id` bigint NOT NULL AUTO_INCREMENT COMMENT '过程id',
  `step_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '过程名称',
  `step_num` varchar(50) DEFAULT NULL COMMENT '步骤节点数',
  `create_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`step_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='过程表';

-- ----------------------------
-- Records of sys_step
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_step_node
-- ----------------------------
DROP TABLE IF EXISTS `sys_step_node`;
CREATE TABLE `sys_step_node` (
  `node_id` bigint NOT NULL AUTO_INCREMENT,
  `step_id` bigint DEFAULT NULL COMMENT '过程id',
  `step_node_label` varchar(255) DEFAULT NULL COMMENT '过程节点名称',
  `step_node_value` bigint DEFAULT NULL COMMENT '过程节点id',
  PRIMARY KEY (`node_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='过程节点表';

-- ----------------------------
-- Records of sys_step_node
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_step_node_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_step_node_user`;
CREATE TABLE `sys_step_node_user` (
  `nod_user_id` bigint NOT NULL AUTO_INCREMENT,
  `step_id` bigint DEFAULT NULL COMMENT '过程id',
  `node_id` bigint DEFAULT NULL COMMENT '节点id',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`nod_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='过程节点人员表';

-- ----------------------------
-- Records of sys_step_node_user
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `fullname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '姓名',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '手机号',
  `status` tinyint DEFAULT NULL COMMENT '状态  0：禁用   1：正常       2:新注册',
  `depart_ids` bigint DEFAULT NULL COMMENT '负责部门',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `mobile` (`mobile`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` (`user_id`, `fullname`, `username`, `password`, `salt`, `email`, `mobile`, `status`, `depart_ids`, `create_user`, `create_time`) VALUES (1, '管理员', 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', '1234@lana1234.com', '13612345678', 1, NULL, 'admin', '2022-11-11 11:11:11');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_depart
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_depart`;
CREATE TABLE `sys_user_depart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `depart_id` bigint DEFAULT NULL COMMENT '组织机构id',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户-机构关联表';

-- ----------------------------
-- Records of sys_user_depart
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_depart` (`id`, `depart_id`, `user_id`) VALUES (12, 12, 1);
INSERT INTO `sys_user_depart` (`id`, `depart_id`, `user_id`) VALUES (13, 11, 2);
INSERT INTO `sys_user_depart` (`id`, `depart_id`, `user_id`) VALUES (14, 11, 3);
INSERT INTO `sys_user_depart` (`id`, `depart_id`, `user_id`) VALUES (15, 11, 4);
INSERT INTO `sys_user_depart` (`id`, `depart_id`, `user_id`) VALUES (16, 11, 5);
INSERT INTO `sys_user_depart` (`id`, `depart_id`, `user_id`) VALUES (17, 13, 15);
INSERT INTO `sys_user_depart` (`id`, `depart_id`, `user_id`) VALUES (18, 9, 17);
INSERT INTO `sys_user_depart` (`id`, `depart_id`, `user_id`) VALUES (19, 9, 55);
INSERT INTO `sys_user_depart` (`id`, `depart_id`, `user_id`) VALUES (20, 13, 69);
INSERT INTO `sys_user_depart` (`id`, `depart_id`, `user_id`) VALUES (21, 13, 70);
INSERT INTO `sys_user_depart` (`id`, `depart_id`, `user_id`) VALUES (22, 9, 71);
INSERT INTO `sys_user_depart` (`id`, `depart_id`, `user_id`) VALUES (23, 9, 115);
INSERT INTO `sys_user_depart` (`id`, `depart_id`, `user_id`) VALUES (24, 9, 123);
INSERT INTO `sys_user_depart` (`id`, `depart_id`, `user_id`) VALUES (25, 9, 124);
INSERT INTO `sys_user_depart` (`id`, `depart_id`, `user_id`) VALUES (26, 17, 124);
INSERT INTO `sys_user_depart` (`id`, `depart_id`, `user_id`) VALUES (27, 17, 123);
INSERT INTO `sys_user_depart` (`id`, `depart_id`, `user_id`) VALUES (28, 17, 127);
INSERT INTO `sys_user_depart` (`id`, `depart_id`, `user_id`) VALUES (29, 20, 128);
INSERT INTO `sys_user_depart` (`id`, `depart_id`, `user_id`) VALUES (30, 20, 130);
INSERT INTO `sys_user_depart` (`id`, `depart_id`, `user_id`) VALUES (31, 17, 131);
INSERT INTO `sys_user_depart` (`id`, `depart_id`, `user_id`) VALUES (33, 17, 132);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`) VALUES (4, 2, 3);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`) VALUES (5, 3, 4);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`) VALUES (7, 5, 4);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`) VALUES (8, 15, 1);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`) VALUES (9, 17, 1);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`) VALUES (10, 4, 4);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`) VALUES (11, 55, 1);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`) VALUES (12, 69, 15);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`) VALUES (13, 70, 4);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`) VALUES (15, 123, 3);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`) VALUES (16, 124, 1);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`) VALUES (17, 1, 1);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`) VALUES (18, 127, 3);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`) VALUES (19, 128, 3);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`) VALUES (20, 130, 3);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`) VALUES (21, 131, 3);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`) VALUES (22, 115, 1);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`) VALUES (23, 132, 3);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统用户Token（不支持多地登录）';

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_token` (`user_id`, `token`, `expire_time`, `update_time`) VALUES (1, 'cc4a0a2aa2c34a05666de4876dfdf80e', '2022-12-20 10:20:30', '2022-12-19 22:20:30');
INSERT INTO `sys_user_token` (`user_id`, `token`, `expire_time`, `update_time`) VALUES (2, '07c71fcf0ffd5f09eb5dfcec05c4b4c5', '2022-10-06 12:00:50', '2022-10-06 00:00:50');
INSERT INTO `sys_user_token` (`user_id`, `token`, `expire_time`, `update_time`) VALUES (3, '23cdc9ed6536bdc9dee6a5da10a3b512', '2022-10-05 23:51:15', '2022-10-05 11:51:15');
INSERT INTO `sys_user_token` (`user_id`, `token`, `expire_time`, `update_time`) VALUES (5, 'f187c26233e88982435f54cc6d78e453', '2022-10-09 00:52:00', '2022-10-08 12:52:00');
INSERT INTO `sys_user_token` (`user_id`, `token`, `expire_time`, `update_time`) VALUES (11, '67be8c2e902a770164e4c04ffcaf5aa3', '2022-10-01 01:40:00', '2022-09-30 13:40:00');
INSERT INTO `sys_user_token` (`user_id`, `token`, `expire_time`, `update_time`) VALUES (15, '82c4a53ac4aa043785e27f61101a534d', '2022-10-12 20:38:36', '2022-10-12 08:38:36');
INSERT INTO `sys_user_token` (`user_id`, `token`, `expire_time`, `update_time`) VALUES (55, 'd50d5fa3bb338ab9d67ee4ed9cdfba1e', '2022-10-10 01:48:37', '2022-10-09 13:48:37');
INSERT INTO `sys_user_token` (`user_id`, `token`, `expire_time`, `update_time`) VALUES (70, '1c29a92e18e9af60e4e87d826340531c', '2022-10-12 05:27:16', '2022-10-11 17:27:16');
INSERT INTO `sys_user_token` (`user_id`, `token`, `expire_time`, `update_time`) VALUES (102, 'bc230d3648f1caf1709ec73027106188', '2022-10-12 21:36:06', '2022-10-12 09:36:06');
INSERT INTO `sys_user_token` (`user_id`, `token`, `expire_time`, `update_time`) VALUES (104, '54dcae79092d1307722bb5a881f27734', '2022-10-12 21:52:26', '2022-10-12 09:52:26');
INSERT INTO `sys_user_token` (`user_id`, `token`, `expire_time`, `update_time`) VALUES (106, '0a7145643614089bb101224094dbe9ed', '2022-10-12 22:52:09', '2022-10-12 10:52:09');
INSERT INTO `sys_user_token` (`user_id`, `token`, `expire_time`, `update_time`) VALUES (112, 'af815983e12ccdcf74d127d847fececd', '2022-10-12 23:04:06', '2022-10-12 11:04:06');
INSERT INTO `sys_user_token` (`user_id`, `token`, `expire_time`, `update_time`) VALUES (115, '003445c5b691a2fabdf261fcb7fa4ccf', '2022-10-13 21:36:08', '2022-10-13 09:36:08');
INSERT INTO `sys_user_token` (`user_id`, `token`, `expire_time`, `update_time`) VALUES (116, 'ccb2a7ee8c42b4a511bcf5aa26c4eb5c', '2022-10-13 01:08:57', '2022-10-12 13:08:57');
INSERT INTO `sys_user_token` (`user_id`, `token`, `expire_time`, `update_time`) VALUES (117, '033093b7423070c7687d1995f800a0b9', '2022-10-13 01:10:22', '2022-10-12 13:10:22');
INSERT INTO `sys_user_token` (`user_id`, `token`, `expire_time`, `update_time`) VALUES (121, '7a92f402dbaba503e168b7a51a988aee', '2022-10-13 01:24:25', '2022-10-12 13:24:25');
INSERT INTO `sys_user_token` (`user_id`, `token`, `expire_time`, `update_time`) VALUES (122, 'e0fade8f2bd60a5525fd6e8afc05c150', '2022-10-13 01:37:28', '2022-10-12 13:37:28');
INSERT INTO `sys_user_token` (`user_id`, `token`, `expire_time`, `update_time`) VALUES (123, 'ee6d2b1c3be1a3429e9af422d105380e', '2022-12-10 05:50:57', '2022-12-09 17:50:57');
INSERT INTO `sys_user_token` (`user_id`, `token`, `expire_time`, `update_time`) VALUES (124, '9e78a7cdc23c96749e21c74f848c4601', '2022-12-19 11:01:04', '2022-12-18 23:01:04');
COMMIT;

-- ----------------------------
-- View structure for sys_user_depart_role
-- ----------------------------
DROP VIEW IF EXISTS `sys_user_depart_role`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `sys_user_depart_role` AS select `a`.`user_id` AS `user_id`,`a`.`fullname` AS `fullname`,`a`.`email` AS `email`,`a`.`username` AS `username`,`a`.`mobile` AS `mobile`,`a`.`status` AS `status`,`a`.`duty_ids` AS `duty_ids`,`a`.`create_user` AS `create_user`,`a`.`create_timer` AS `create_timer`,`a`.`depart_name` AS `depart_name`,`a`.`depart_id` AS `depart_id`,`a`.`roleId` AS `roleId`,`r`.`role_name` AS `role_name`,`nd`.`depart_name` AS `duty_name` from (((select `u`.`user_id` AS `user_id`,`u`.`fullname` AS `fullname`,`u`.`email` AS `email`,`u`.`username` AS `username`,`u`.`mobile` AS `mobile`,`u`.`status` AS `status`,`u`.`depart_ids` AS `duty_ids`,`u`.`create_user` AS `create_user`,`u`.`create_time` AS `create_timer`,`d`.`depart_name` AS `depart_name`,`d`.`id` AS `depart_id`,`ur`.`role_id` AS `roleId` from (((`sys_user` `u` left join `sys_user_depart` `ud` on((`u`.`user_id` = `ud`.`user_id`))) left join `sys_user_role` `ur` on((`u`.`user_id` = `ur`.`user_id`))) left join `sys_depart` `d` on((`d`.`id` = `ud`.`depart_id`)))) `a` left join `sys_role` `r` on((`r`.`role_id` = `a`.`roleId`))) left join `sys_depart` `nd` on((`nd`.`id` = `a`.`duty_ids`)));

SET FOREIGN_KEY_CHECKS = 1;
