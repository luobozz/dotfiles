/*
 Navicat Premium Data Transfer

 Source Server         : 122.112.142.111
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : 122.112.142.111:3306
 Source Schema         : Lic

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 08/02/2022 11:12:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_account
-- ----------------------------
DROP TABLE IF EXISTS `sys_account`;
CREATE TABLE `sys_account`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 主键',
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'UUID UUID',
  `account` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '账号',
  `tel` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '手机号',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '密码',
  `salt` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '盐',
  `image` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '头像',
  `status` char(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'NORMAL' COMMENT '账号状态 表达冻结等账号状态',
  `logic_status` char(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'none',
  `del_flag` smallint NOT NULL DEFAULT 0 COMMENT '删除标记 删除标记',
  `created_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人 创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间 创建时间',
  `updated_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '更新人 更新人',
  `updated_time` datetime NOT NULL COMMENT '更新时间 更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '账户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sys_account_logic_relationship
-- ----------------------------
DROP TABLE IF EXISTS `sys_account_logic_relationship`;
CREATE TABLE `sys_account_logic_relationship`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 主键',
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'UUID UUID',
  `acc_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '账户uuid',
  `logic_tag` char(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '逻辑标识',
  `res_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '逻辑标识uuid',
  `del_flag` smallint NOT NULL DEFAULT 0 COMMENT '删除标记 删除标记',
  `created_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人 创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间 创建时间',
  `updated_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '更新人 更新人',
  `updated_time` datetime NOT NULL COMMENT '更新时间 更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '账户逻辑关系' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sys_account_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_account_role`;
CREATE TABLE `sys_account_role`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 主键',
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'UUID UUID',
  `acc_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '账户UUID',
  `role_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色UUID',
  `del_flag` smallint NOT NULL DEFAULT 0 COMMENT '删除标记 删除标记',
  `created_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人 创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间 创建时间',
  `updated_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '更新人 更新人',
  `updated_time` datetime NOT NULL COMMENT '更新时间 更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '账户角色关系' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sys_message
-- ----------------------------
DROP TABLE IF EXISTS `sys_message`;
CREATE TABLE `sys_message`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 主键',
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'UUID UUID',
  `acc_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '登录用户uuid',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '内容',
  `read_status` smallint NOT NULL COMMENT '已读标识',
  `send_status` smallint NOT NULL COMMENT '发送状态',
  `del_flag` smallint NOT NULL DEFAULT 0 COMMENT '删除标记 删除标记',
  `created_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人 创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间 创建时间',
  `updated_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '更新人 更新人',
  `updated_time` datetime NOT NULL COMMENT '更新时间 更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '消息提示' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 主键',
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'UUID UUID',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '权限标题',
  `sign` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '权限标识',
  `content` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '权限描述内容',
  `del_flag` smallint NOT NULL DEFAULT 0 COMMENT '删除标记 删除标记',
  `created_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人 创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间 创建时间',
  `updated_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '更新人 更新人',
  `updated_time` datetime NOT NULL COMMENT '更新时间 更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '权限' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 主键',
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'UUID UUID',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  `sign` char(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'SYSTEM' COMMENT '角色逻辑标识 SYSTEM等',
  `manage_sign` char(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'DISABLED' COMMENT '角色可分配标识 全部、部分、禁止（ALL、SECTION、DISABLED）',
  `del_flag` smallint NOT NULL DEFAULT 0 COMMENT '删除标记 删除标记',
  `created_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人 创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间 创建时间',
  `updated_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '更新人 更新人',
  `updated_time` datetime NOT NULL COMMENT '更新时间 更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sys_role_manage
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_manage`;
CREATE TABLE `sys_role_manage`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 主键',
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'UUID UUID',
  `role_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色UUID',
  `manage_role_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '可分配角色UUID',
  `del_flag` smallint NOT NULL DEFAULT 0 COMMENT '删除标记 删除标记',
  `created_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人 创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间 创建时间',
  `updated_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '更新人 更新人',
  `updated_time` datetime NOT NULL COMMENT '更新时间 更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色分配管理表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sys_role_route
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_route`;
CREATE TABLE `sys_role_route`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 主键',
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'UUID UUID',
  `route_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '路由UUID',
  `role_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色UUID',
  `del_flag` smallint NOT NULL DEFAULT 0 COMMENT '删除标记 删除标记',
  `created_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人 创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间 创建时间',
  `updated_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '更新人 更新人',
  `updated_time` datetime NOT NULL COMMENT '更新时间 更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色路由关系' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sys_role_route_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_route_permission`;
CREATE TABLE `sys_role_route_permission`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 主键',
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'UUID UUID',
  `role_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '角色UUID',
  `rp_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '路由权限UUID',
  `del_flag` smallint NOT NULL DEFAULT 0 COMMENT '删除标记 删除标记',
  `created_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人 创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间 创建时间',
  `updated_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '更新人 更新人',
  `updated_time` datetime NOT NULL COMMENT '更新时间 更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色路由权限关系' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sys_route
-- ----------------------------
DROP TABLE IF EXISTS `sys_route`;
CREATE TABLE `sys_route`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 主键',
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'UUID UUID',
  `parent_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '父指针',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '路由标题',
  `sign` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '路由逻辑名称',
  `path` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '路由路径',
  `component` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '路由组件',
  `icon` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '路由图标',
  `del_flag` smallint NOT NULL DEFAULT 0 COMMENT '删除标记 删除标记',
  `created_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人 创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间 创建时间',
  `updated_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '更新人 更新人',
  `updated_time` datetime NOT NULL COMMENT '更新时间 更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '路由' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sys_route_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_route_permission`;
CREATE TABLE `sys_route_permission`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 主键',
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'UUID UUID',
  `route_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '路由UUID',
  `permission_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '权限UUID',
  `del_flag` smallint NOT NULL DEFAULT 0 COMMENT '删除标记 删除标记',
  `created_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人 创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间 创建时间',
  `updated_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '更新人 更新人',
  `updated_time` datetime NOT NULL COMMENT '更新时间 更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '路由权限' ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
