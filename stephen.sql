/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : stephen

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 24/11/2021 15:21:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_extension_histories
-- ----------------------------
DROP TABLE IF EXISTS `admin_extension_histories`;
CREATE TABLE `admin_extension_histories`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 1,
  `version` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_extension_histories_name_index`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_extension_histories
-- ----------------------------

-- ----------------------------
-- Table structure for admin_extensions
-- ----------------------------
DROP TABLE IF EXISTS `admin_extensions`;
CREATE TABLE `admin_extensions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_enabled` tinyint(4) NOT NULL DEFAULT 0,
  `options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_extensions_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_extensions
-- ----------------------------

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `uri` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `extension` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `show` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES (1, 0, 1, 'Index', 'feather icon-bar-chart-2', '/', '', 1, '2021-11-10 00:42:28', NULL);
INSERT INTO `admin_menu` VALUES (2, 0, 2, 'Admin', 'feather icon-settings', '', '', 1, '2021-11-10 00:42:28', NULL);
INSERT INTO `admin_menu` VALUES (3, 2, 3, 'Users', '', 'auth/users', '', 1, '2021-11-10 00:42:28', NULL);
INSERT INTO `admin_menu` VALUES (4, 2, 4, 'Roles', '', 'auth/roles', '', 1, '2021-11-10 00:42:28', NULL);
INSERT INTO `admin_menu` VALUES (5, 2, 5, 'Permission', '', 'auth/permissions', '', 1, '2021-11-10 00:42:28', NULL);
INSERT INTO `admin_menu` VALUES (6, 2, 6, 'Menu', '', 'auth/menu', '', 1, '2021-11-10 00:42:28', NULL);
INSERT INTO `admin_menu` VALUES (7, 2, 7, 'Extensions', '', 'auth/extensions', '', 1, '2021-11-10 00:42:28', NULL);

-- ----------------------------
-- Table structure for admin_permission_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_permission_menu`;
CREATE TABLE `admin_permission_menu`  (
  `permission_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE INDEX `admin_permission_menu_permission_id_menu_id_unique`(`permission_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_permission_menu
-- ----------------------------

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `http_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `parent_id` bigint(20) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_permissions_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES (1, 'Auth management', 'auth-management', '', '', 1, 0, '2021-11-10 00:42:28', NULL);
INSERT INTO `admin_permissions` VALUES (2, 'Users', 'users', '', '/auth/users*', 2, 1, '2021-11-10 00:42:28', NULL);
INSERT INTO `admin_permissions` VALUES (3, 'Roles', 'roles', '', '/auth/roles*', 3, 1, '2021-11-10 00:42:28', NULL);
INSERT INTO `admin_permissions` VALUES (4, 'Permissions', 'permissions', '', '/auth/permissions*', 4, 1, '2021-11-10 00:42:28', NULL);
INSERT INTO `admin_permissions` VALUES (5, 'Menu', 'menu', '', '/auth/menu*', 5, 1, '2021-11-10 00:42:28', NULL);
INSERT INTO `admin_permissions` VALUES (6, 'Extension', 'extension', '', '/auth/extensions*', 6, 1, '2021-11-10 00:42:28', NULL);

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu`  (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE INDEX `admin_role_menu_role_id_menu_id_unique`(`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions`  (
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE INDEX `admin_role_permissions_role_id_permission_id_unique`(`role_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users`  (
  `role_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE INDEX `admin_role_users_role_id_user_id_unique`(`role_id`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES (1, 1, '2021-11-10 00:42:29', '2021-11-10 00:42:29');

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_roles_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES (1, 'Administrator', 'administrator', '2021-11-10 00:42:28', '2021-11-10 00:42:29');

-- ----------------------------
-- Table structure for admin_settings
-- ----------------------------
DROP TABLE IF EXISTS `admin_settings`;
CREATE TABLE `admin_settings`  (
  `slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`slug`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_settings
-- ----------------------------

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_users_username_unique`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES (1, 'admin', '$2y$10$GALeuGVEQZBdwxgGPy2pC.5Ay8HWuKjSPx5fgut7DMuwkETM2l3Z.', 'Administrator', NULL, 'xYg0IHH19dUhk2nUELCohwkBzAcuIZ91EMQD69ajTBulTjK972m7V4pGzDWB', '2021-11-10 00:42:28', '2021-11-10 00:42:29');

-- ----------------------------
-- Table structure for f_c_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `f_c_warehouse`;
CREATE TABLE `f_c_warehouse`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `COUNTRY` enum('USA','CA','JP','UK','ES','DE','FR','IT','AU') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'USA' COMMENT '国家',
  `COMPANY_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '收货人公司名',
  `FC` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'FBA仓库代码',
  `POSTAL_CODE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '邮编',
  `STATES` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '州',
  `CITY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '城市',
  `ADDRESS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '地址',
  `TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '仓库类型',
  `POD` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '对应港口',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 337 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of f_c_warehouse
-- ----------------------------
INSERT INTO `f_c_warehouse` VALUES (155, 'USA', 'GOLDEN STATE FC LLC', 'ONT8', '92551', 'CA', 'MORENO VALLEY', '24300 NANDINA AVE', 'Sort', 'USLAX', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (156, 'USA', 'GOLDEN STATE FC LLC', 'LGB8', '92376', 'CA', 'RIALTO', '1568 NORTH LINDEN AVENUE', 'Sort', 'USLAX', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (157, 'USA', 'AMAZON.COM.INDC LLC', 'IND2', '46168', 'IN', 'PLAINFIELD', '715 AIRTECH PKWY', 'Non-sort', 'USCHI', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (158, 'USA', 'AMAZON.COM INDC LLC', 'IND5', '46168', 'IN', 'PLAINFIELD', '800 PERRY ROAD', 'Non-sort', 'USCHI', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (159, 'USA', 'AMAZON.COM.DEDC LLC', 'MDW6', '60446', 'IL', 'ROMEOVILLE', '1125 W REMINGTON BLVD', 'Non-sort', 'USCHI', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (160, 'USA', 'AMAZON.COM.DEDC LLC', 'MDW8', '60085', 'IL', 'WAUKEGAN', '1750 BRIDGE DRIVE', 'HB', 'USCHI', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (161, 'USA', 'AMAZON.COM.DEDC LLC', 'MDW9', '60502', 'IL', 'AURORA', '2865 DUKE PARKWAY', 'Non-sort', 'USCHI', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (162, 'USA', 'AMAZON.COM.KSDC LLC', 'MKC4', '66021', 'KS', 'EDGERTON', '19645 WAVERLY RD', 'Non-sort', 'USMKC', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (163, 'USA', 'AMAZON.COM.DEDC LLC', 'STL4', '62025', 'IL', 'EDWARDSVILLE', '3050 GATEWAY COMMERCE CENTER DR S', 'Non-sort', 'USSTL', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (164, 'USA', 'AMAZON.COM.KYDC LLC', 'HOU3', '77423', 'TX', 'BROOKSHIRE', '31555 HIGHWAY 90 E', 'Non-sort', 'USHOU', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (165, 'USA', 'AMAZON.COM.KYDC LLC', 'DFW6', '75019', 'TX', 'COPPELL', '940 W BETHEL ROAD', 'Non-sort', 'USDFW', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (166, 'USA', 'AMAZON.COM.DEDC LLC', 'ABE3', '18031', 'PA', 'Breinigsville', '650 Boulder Drive', 'Shoes', 'USNYC', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (167, 'USA', 'AMAZON.COM.INDC LLC', 'SDF8', '47130', 'IN', 'JEFFERSONVILLE', '900 PATROL RD', NULL, 'USCHI', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (168, 'USA', 'AMAZON.COM.DEDC, INC', 'ABE2', '18031', 'PA', 'BREINIGSVILLE', '705 BOULDER DRIVE', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (169, 'USA', 'AMAZON.COM.DEDC LLC', 'MDT2', '21901', 'MD', 'NORTH EAST', '600 PRINCIPIO PARKWAY WEST', 'Shoes', 'USNYC', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (170, 'USA', 'AMAZON.COM.DEDC LLC', 'BFI7', '98390', 'WA', 'SUMNER', '1901 140TH AVE E', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (171, 'USA', 'AMAZON.COM.KYDC LLC', 'FTW2', '75019', 'TX', 'COPPELL', '2701 WEST BETHEL ROAD', 'HB', 'USDFW', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (172, 'USA', 'AMAZON.COM.DEDC LLC', 'ATL8', '30122', 'GA', 'LITHIA SPRINGS', '2201 THORNTON ROAD', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (173, 'USA', 'GOLDEN STATE FC LLC', 'LGB6', '92518', 'CA', 'RIVERSIDE', '20901 KRAMERIA AVE', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (174, 'USA', 'GOLDEN STATE FC LLC', 'ONT9', '92374', 'CA', 'REDLANDS', '2125 WEST SAN BERNARDINO AVE', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (175, 'USA', 'GOLDEN STATE FC LLC', 'SNA4', '92376', 'CA', 'RIALTO', '2496 W WALNUT AVE', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (176, 'USA', 'GOLDEN STATE FC LLC', 'LAX9', '92337', 'CA', 'FONTANA', '11263 OLEANDER AVE', 'Sort', 'USLAX', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (177, 'USA', 'AMAZON.COM.INDC LLC', 'IND4', '46231', 'IN', 'INDIANAPOLIS', '710 SOUTH GIRLS SCHOOL ROAD', 'Shoes', 'USCHI', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (178, 'USA', 'GOLDEN STATE FC LLC', 'ONT2', '92408', 'CA', 'SAN BERNARDINO', '1910 E CENTRAL AVE', 'Shoes', 'USLAX', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (179, 'USA', 'AMAZON.COM.DEDC LLC', 'FTW9', '75019', 'TX', 'COPPELL', '944 WEST SANDY LAKE ROAD', 'Shoes', 'USDFW', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (180, 'USA', 'GOLDEN STATE FC LLC', 'ONT6', '92551', 'CA', 'MORENO VALLEY', '24208 SAN MICHELE RD', 'Shoes', 'USLAX', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (181, 'USA', 'GOLDEN STATE FC LLC', 'XIX6', '92337', 'CA', 'FONTANA', '10681 PRODUCTION AVE', 'Non-sort', 'USLAX', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (182, 'USA', 'AMAZON.COM.AZDC INC', 'PHX3', '85043', 'AZ', 'PHOENIX', '6835 WEST BUCKEYE ROAD', 'Shoes', 'USLAX', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (183, 'USA', 'GOLDEN STATE FC LLC', 'SMF3', '95206', 'CA', 'STOCKTON', '3923 S B STREET', 'Sort', 'USOAK', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (184, 'USA', 'GOLDEN STATE FC LLC', 'GSP1 ', '29303', 'SC', 'SPARTANBURG', '402 JOHN DODD RD', 'Non-sort', 'USSAV', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (185, 'USA', 'GOLDEN STATE FC LLC', 'CLT3', '28027', 'NC', 'CONCORD', '6500 DAVIDSON HWY', 'Non-sort', 'USSAV', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (186, 'USA', 'AMAZON.COM.DEDC LLC', 'MGE3', '30549', 'GA', 'JEFFERSON', '808 HOG MOUNTAIN ROAD', 'Non-sort', 'USSAV', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (187, 'USA', 'AMAZON.COM.DEDC LLC', 'MDT1', '17015', 'PA', 'CARLISLE', '2 AMES DRIVE', 'Non-sort', 'USBWI', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (188, 'USA', 'AMAZON.COM.DEDC LLC', 'BWI4', '22624', 'VA', 'CLEAR BROOK', '165 BUSINESS BLVD', 'Non-sort', 'USBWI', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (189, 'USA', 'GOLDEN STATE FC LLC', 'ABE8', '8518', 'NJ', 'Florence', '309 Cedar Lane', 'Sort', 'USNYC', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (190, 'USA', 'GOLDEN STATE FC LLC', 'AVP1', '18202', 'PA', 'Hazleton', '550 Oak Ridge Rd', 'Sort', 'USNYC', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (191, 'USA', 'GOLDEN STATE FC LLC', 'IND9', '46143', 'IN', 'Greenwood', '1151 South Graham Road', 'Sort', 'USCHI', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (192, 'USA', 'GOLDEN STATE FC LLC', 'MDW2', '60433', 'IL', 'Joliet', '250 Emerald Drive', 'Sort', 'USCHI', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (193, 'USA', 'AMAZON.COM.DEDC LLC', 'PDX7', '97317', 'OR', 'SALEM', '4775 DEPOT CT SE', 'Non-sort', 'USSEA', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (194, 'USA', 'AMAZON.COM.DEDC LLC', 'ABE4', '18045', 'PA', 'EASTON', '1610 VAN BUREN ROAD', 'Non-sort', 'USNYC', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (195, 'USA', 'GOLDEN STATE FC LLC', 'SBD3', '92407', 'CA', 'SAN BERNARDINO', '5990 N Cajon Blvd', 'Non-sort', 'USLAX', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (196, 'USA', 'GOLDEN STATE FC LLC', 'LAS1', '89044', 'NV', 'Henderson', '12300 Bermuda Road,', 'Sort', 'USLAX', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (197, 'USA', 'GOLDEN STATE FC LLC', 'PHX8', '85043', 'AZ', 'Phoenix', '800 North 75th Ave', 'Sort', 'USLAX', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (198, 'USA', 'GOLDEN STATE FC LLC', 'LGB9', '92571', 'CA', 'Perris', '4375 North Perris Boulevard', 'HB', 'USLAX', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (199, 'USA', 'GOLDEN STATE FC LLC', 'CLT2', '28214', 'NC', 'Charlotte', '10240 Old Dowd Road', 'Sort', 'USSAV', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (200, 'USA', 'GOLDEN STATE FC LLC', 'TEB9', '8873', 'NJ', 'Somerset', '601 Randolph Road', 'Sort', 'USNYC', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (201, 'USA', 'AMAZON.COM.KYDC LLC', 'FTW1', '75241', 'TX', 'Dallas', '33333 LBJ Freeway', 'Sort', 'USDAL', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (202, 'USA', 'GOLDEN STATE FC LLC', 'LGB4', '92374', 'CA', 'Redlands', '27517 Pioneer Avenue', 'Non-sort', 'USLAX', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (203, 'USA', 'GOLDEN STATE FC LLC', 'SBD2', '92408', 'CA', 'San Bernardino', '1494 South Waterman Avenue', 'Non-sort', 'USLAX', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (204, 'USA', 'GOLDEN STATE FC LLC', 'TEB3', '8873', 'NJ', 'Logan', '2651 Oldmans Creek Road', 'Non-sort', 'USNYC', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (205, 'USA', 'GOLDEN STATE FC LLC', 'TEB6', '8512', 'NJ', 'Cranbury Township', '22 Highstown-Cranbury Station Road', 'Non-sort', 'USNYC', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (206, 'USA', 'GOLDEN STATE FC LLC', 'SJC7', '95377', 'CA', 'Tracy', '188 S Mountain House Parkway', 'Non-sort', 'USOAK', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (207, 'USA', 'GOLDEN STATE FC LLC', 'SCK1', '95215', 'CA', 'Stockton', '4532 Newcastle Road', 'Non-sort', 'USOAK', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (208, 'USA', 'AMAZON.COM.DEDC LLC', 'JVL1', '53511', 'WI', 'Beloit', '1255 Gateway Boulevard', 'Non-sort', 'USCHI', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (209, 'USA', 'AMAZON.COM.DEDC LLC', 'ORD2', '60410', 'IL', 'Channahon', '23714 West Amoco Road', 'Non-sort', 'USCHI', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (210, 'USA', 'AMAZON.COM.DEDC LLC', 'RIC1', '23803', 'VA', 'Petersburg', '5000 Commerce Way', 'Non-sort', 'USORF', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (211, 'USA', 'AMAZON.COM.DEDC LLC', 'DCA6', '21219', 'MD', 'Baltimore', '6001 Bethlehem Boulevard', 'Non-sort', 'USBWI', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (212, 'USA', 'GOLDEN STATE FC LLC', 'JAX3', '32221', 'FL', 'Jacksonville', '13333 103rd Street', 'Non-sort', 'USJAX', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (213, 'USA', 'GOLDEN STATE FC LLC', 'MCO2', '32725', 'FL', 'Deltona', '2600 North Normandy Boulevard', 'Non-sort', 'USJAX', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (214, 'USA', 'AMAZON.COM.DEDC LLC', 'AVP3', '18424', 'PA', 'Gouldsboro', '298 First Avenue', 'HB', 'USNYC', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (215, 'USA', 'AMAZON.COM.DEDC LLC', 'STL6', '62025', 'IL', 'Edwardsville', '3931 Lakeview Corporate Drive', 'HB', 'USSTL', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (216, 'USA', 'GOLDEN STATE FC LLC', 'TTN2', '8512', 'NJ', 'Cranbury', '343 Half Acre Road', 'HB', 'USNYC', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (217, 'USA', 'AMAZON.COM.KYDC LLC', 'FTW3', '76244', 'TX', 'Fort Worth', '15201 Heritage Parkway', 'Shoes', 'USDAL', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (218, 'USA', 'AMAZON.COM.KYDC LLC', 'DAL2', '75261', 'TX', 'Dallas', '2601 South Airfield Drive', 'Shoes', 'USDAL', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (219, 'USA', 'AMAZON.COM.DEDC LLC', 'RDG1', '19526', 'PA', 'Hamburg', '3563 Mountain Road', 'Shoes', 'USNYC', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (220, 'USA', 'GOLDEN STATE FC LLC', 'XLX2', '92571', 'CA', 'PERRIS', '657 WEST NANCE STEET', 'HB', NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (221, 'USA', 'GOLDEN STATE FC LLC', 'ACY2', '8016', 'NJ', NULL, '1101 EAST PEARL STREET,BURLINGTON,NJ', 'Non-sort', NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (222, 'USA', 'Amazon.com Services LLC', 'OLM1', '98516', 'WA', 'OLYMPIA', '3300 Hogum Bay Road NE', 'Non-sort', 'USSEA', NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (223, 'USA', NULL, 'PHX5', '85338', 'AZ', 'Goodyear', '16920 W Commerce Drive', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (224, 'USA', NULL, 'PHX6', '85043', 'AZ', 'Phoenix', '4750 West Mohave St', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (225, 'USA', NULL, 'PHX7', '85043', 'AZ', 'Phoenix', '800 N 75th Ave', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (226, 'USA', NULL, 'OAK4', '95376', 'CA', 'Tracy', '1555 N. Chrisman Rd', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (227, 'USA', NULL, 'OAK3', '95363', 'CA', 'Patterson', '255 Park Center Drive', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (228, 'USA', NULL, 'XUSD', '95206', 'CA', 'Stockton', '1909 Zephyr St', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (229, 'USA', NULL, 'LGB3', '91752', 'CA', 'Eastvale', '4950 Goodman Way', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (230, 'USA', NULL, 'SMF1', '95837', 'CA', 'Sacramento', '4900 W Elkhorn Blvd', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (231, 'USA', NULL, 'BDL1', '6095', 'CT', 'Windsor', '801 Day Hill Rd.', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (232, 'USA', NULL, 'PHL1', '19720', 'DE', 'New Castle', '1 Centerpoint Blvd.', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (233, 'USA', NULL, 'PHL3', '19720', 'DE', 'New Castle', '1600 Johnson Way', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (234, 'USA', NULL, 'PHL7', '19709', 'DE', 'Middletown', '560 Merrimac Ave', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (235, 'USA', NULL, 'PHL8', '19709', 'DE', 'Middletown', '727 N Broad St', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (236, 'USA', NULL, 'TPA1', '33570', 'FL', 'Ruskin', '3350 Laurel Ridge Ave.', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (237, 'USA', NULL, 'TPA2', '33811', 'FL', 'Lakeland', '1760 County Line Rd', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (238, 'USA', NULL, 'MIA1', '33182', 'FL', 'Miami', '1900 NW 132nd Place Doral', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (239, 'USA', NULL, 'XUSE', '46075', 'IN', 'Whitestown', '5100 S Indianapolis Rd', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (240, 'USA', NULL, 'IND1', '46075', 'IN', 'Whitestown', '4255 Anson Blvd', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (241, 'USA', NULL, 'IND3', '46168', 'IN', 'Plainfield', '715 Airtech Pkwy Suite 195', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (242, 'USA', NULL, 'IND6', '47130', 'IN', 'Jeffersonville', '1453 E 10th St', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (243, 'USA', NULL, 'TUL1', '67337', 'KS', 'Coffeyville', '2654 North Highway 169', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (244, 'USA', NULL, 'MCI1', '66219', 'KS', 'Lenexa', '113th St & Renner Blvd.', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (245, 'USA', NULL, 'MKC6', '66102', 'KX', 'Kansas Qty', '6925 Riverview Avenue', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (246, 'USA', NULL, 'LEX1', '40511', 'KY', 'Lexington', '1850 Mercer RD', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (247, 'USA', NULL, 'LEX2', '40511', 'KY', 'Lexington', '172 Trade St.', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (248, 'USA', NULL, 'SDF1', '42718', 'KY', 'Campbellsville', '1050 South Columbia', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (249, 'USA', NULL, 'SDF2', '40218', 'KY', 'Watterson Park', '4360 Robards Ln', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (250, 'USA', NULL, 'SDF4', '40165', 'KY', 'Shepherdsville', '376 Zappos.com Blvd', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (251, 'USA', NULL, 'SDF6', '40165', 'KY', 'Shepherdsville', '271 Omega Pkwy', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (252, 'USA', NULL, 'CVG1', '41048', 'KY', 'Hebron', '1155 Worldwide Blvd', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (253, 'USA', NULL, 'CVG2', '41048', 'KY', 'Hebron', '1600 Worldwide Blvd', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (254, 'USA', NULL, 'CVG3', '41048', 'KY', 'Hebron', '3680 Langley Dr.', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (255, 'USA', NULL, 'CVG5', '41048', 'KY', 'Hebron', '2285 Litton Lane', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (256, 'USA', NULL, 'SDF7', '40165', 'KY', 'Shepherdsville', '300 Omicron Court', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (257, 'USA', NULL, 'SDF9', '40165', 'KY', 'Shepherdsville', '100 W. Thomas P. Echols Lane', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (258, 'USA', NULL, 'EWR4', '8691', 'NJ', 'Robbinsville', '50 New Canton Way', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (259, 'USA', NULL, 'EWR5', '7001', 'NJ', 'Avenel', '301 Blair Rd.', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (260, 'USA', NULL, 'EWR7', '7001', 'NJ', 'Avenel', '301 Blair Rd.', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (261, 'USA', NULL, 'EWR9', '7008', 'NJ', 'Carteret', '8003 Industrial Parkway', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (262, 'USA', NULL, 'ABE8-401', '8518', 'NJ', 'Florence', '401 Independence Road', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (263, 'USA', NULL, 'ABE8-309', '08518-2802', 'NJ', 'Florence', '309 Cedar Lane', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (264, 'USA', NULL, 'RNO1', '89408', 'NV', 'Fernley', '1600 East Newlands RD', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (265, 'USA', NULL, 'LAS2', '89030', 'NV', 'Las Vegas', '3837 Bay Lake Trail, Suite 111 North', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (266, 'USA', NULL, 'RNO2', '85906', 'NV', 'Reno', '8000 North Virginia Street', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (267, 'USA', NULL, 'RNO4', '89506', 'NV', 'Reno', 'Amazon.com.NVDC Inc. 8000 North Virginia Street', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (268, 'USA', NULL, 'BOS1', '3063', 'NH', 'Nashua', '10 State St.', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (269, 'USA', NULL, 'BWI1', '21224', 'MD', 'Baltimore', '2010 Broening Highway', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (270, 'USA', NULL, 'BWI2', '21224', 'MD', 'Baltimore', '5001 Holbird Ave.', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (271, 'USA', NULL, 'CMH2', '43125-9016', 'OH', 'COLUMBUS', '6050 Gateway Court Groveport', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (272, 'USA', NULL, 'CMH1', '43062-7793', 'OH', 'Etna', '11903 National Road SW', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (273, 'USA', NULL, 'PHL4', '17015', 'PA', 'Carlisle', '21 Roadway Dr', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (274, 'USA', NULL, 'PHL5', '17339', 'PA', 'Lewisberry', '500 McCarthy Dr', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (275, 'USA', NULL, 'PHL6', '17015', 'PA', 'Carlisle', '675 Allen Rd.', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (276, 'USA', NULL, 'ABE5', '17112', 'PA', 'Harrisburg', '6455 Allentown Boulevard', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (277, 'USA', NULL, 'PIT1', '15205', 'PA', 'Pittsburgh', '2250 Roswell Drive', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (278, 'USA', NULL, 'VUBA', '18512', 'PA', 'Scranton', '1000 Keystone Industrial Park', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (279, 'USA', NULL, 'VUGA', '18643', 'PA', 'Pittston', '508 Delaware Avenue West', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (280, 'USA', NULL, 'XUSC', '17013', 'PA', 'Carlisle', '40 Logistics Drive', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (281, 'USA', NULL, 'CAE1', '29172', 'SC', 'West Columbia', '4400 12 Street Extension', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (282, 'USA', NULL, 'GSP1', '29303', 'SC', 'Spartanburg', '402 John Dodd Rd', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (283, 'USA', NULL, 'CHA1', '37416', 'TN', 'Chattanooga', '7200 Discovery Drive', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (284, 'USA', NULL, 'CHA2', '37310', 'TN', 'Charleston', '225 Infinity Dr NW', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (285, 'USA', NULL, 'BNA1', '37090', 'TN', 'Lebanon', '14840 Central Pike Suite 190', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (286, 'USA', NULL, 'BNA2', '37067', 'TN', 'Franklin', '500 Duke DR', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (287, 'USA', NULL, 'BNA3', '37127', 'TN', 'Murfreesboro', 'Joe B Jackson Pkwy', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (288, 'USA', NULL, 'BNA4', '37217', 'TN', 'Nashville', '50 airways Blvd', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (289, 'USA', NULL, 'SAT1', '78154-1461', 'TX', 'Schertz', '6000 Enterprise Avenue', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (290, 'USA', NULL, 'DFW7', '76177', 'TX', 'Haslet', '700 Westport Parkway', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (291, 'USA', NULL, 'DFW8', '75261', 'TX', 'DFW Airport', '2700 Regent Blvd', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (292, 'USA', NULL, 'HOU1', '77338', 'TX', 'Humble', '8120 Humble Westfield Rd', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (293, 'USA', NULL, 'HOU2', '77038-2324', 'TX', 'Houston', '10550 Ella Blvd.', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (294, 'USA', NULL, 'XUSB', '76155', 'TX', 'Fort Worth', '14900 Frye Rd.', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (295, 'USA', NULL, 'RIC2', '23836', 'VA', 'Chester', '1901 Meadowville Technology Pkwy', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (296, 'USA', NULL, 'RIC3', '23836', 'VA', 'Chester', 'across the street fm 1901 Meadowville Technology Parkway', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (297, 'USA', NULL, 'BFI1', '98390', 'WA', 'Sumner', '1800 140th Avenue E.', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (298, 'USA', NULL, 'BFI3', '98327-9607', 'WA', 'Dupont', '2700 Center Drive', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (299, 'USA', NULL, 'BFI4', '98032', 'WA', 'Kent', '20529 59th Place South,Kent,WA 98032 United States', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (300, 'USA', NULL, 'BFI5', '98032', 'WA', 'King County', '20526 59th Place South.Kent', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (301, 'USA', NULL, 'SEA6', '98144', 'WA', 'South Seattle', '2646 Rainier Ave.', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (302, 'USA', NULL, 'SEA8', '98005', 'WA', 'Northeast Bellevue', '1475 124th Avenue', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (303, 'USA', NULL, 'MKE1', '53144', 'Wl', 'Kenosha', '3501 120th Ave,Kenosha,Wl 53144', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (304, 'USA', NULL, 'ATL6', '30344', 'GA', 'East Point', '4200 North Commerce', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (305, 'USA', NULL, 'MDW7', '60449', 'IL', 'Monee', '6605 Monee Manhattan Road', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (306, 'USA', NULL, 'ORD6', '60191', 'IL', 'Wood Dale', '1250 N Mittel Blvd', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (307, 'USA', NULL, 'BOS2', '2072', 'MA', 'Drive Stoughton', '1000 Tech Centre', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (308, 'USA', NULL, 'BOS7', '2720', 'MA', 'Fall River', '1180 Innovation Way', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (309, 'USA', NULL, 'MSP1', '55379', 'MN', 'Shakopee', '2601 4th Avenue East', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (310, 'USA', NULL, 'IVSA', '41018', 'KY', 'Erlanger', '4620 Olympic Blvd', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (311, 'USA', NULL, 'IVSB', '41048', 'KY', 'HEBRON', '3521 POINT PLEASANT RD', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (312, 'USA', NULL, 'BDL2', '06095-2144', 'CT', 'Windsor', '200 Old Iron Ore Rd', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (313, 'USA', NULL, 'DET1', '48150', 'Ml', 'Livonia', '39000 Amrhein Road', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (314, 'UK', NULL, 'EDI4', 'KY11 8ST', 'Fife', 'Dunfermline', 'Amazon.co.uk Amazon Way Dunfermline KY11 8ST', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (315, 'UK', NULL, 'LTN2', 'HP 27LF', 'Hertfordshire', 'Hemel Hempstead', 'amazon.co.uk Hemel Hempstead Hertfordshire HP 27LF', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (316, 'UK', NULL, 'LTN1', 'MK43 OZA', 'Bedfordshire', 'Ridgmont', 'amazon.co.uk Ridgmont Bedfordshire MK43 OZA', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (317, 'UK', NULL, 'CWL1', 'SA1 8QX', 'South Wales', 'Swansea', 'Ffordd Amazon Crymlyn Burrows Swansea SA1 8QX', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (318, 'UK', NULL, 'GLA1', 'PA191BQ', 'Inverclyde', 'Gourock', 'Amazon.co.uk 2 Cloch Road Faulds Park Gourock Inverclyde PA19 1BQ', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (320, 'UK', NULL, 'EUK5', 'PE2 9EN', 'Cambridgeshire', 'Peterborough', 'Amazon.co.uk Phase Two, Kingston Park Flaxley Road Peterborough PE2 9EN', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (321, 'UK', NULL, 'LBA1', 'DN4 5JS', 'South Yorkshire', 'Doncaster', 'Amazon.co.uk Firstpoint Business Park Ba I by Carr Bank Doncaster DN4 5JS', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (322, 'UK', NULL, 'BHX1', 'WS15 1LX', 'Staffordshire', 'Rugeley', 'Power Station Road RUGELEY WS15 1LX', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (323, 'UK', NULL, 'LTN4', 'LU54FE', 'East England', 'Dunstable', 'Amazon EU SARL Unit DC1 (Prologis) Dunstable, East England LU54FE GB', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (324, 'UK', NULL, 'BHX2', 'LE67 1GQ', 'England', 'COALVILLE', 'Amazon EU SARL Robson Way Leicestershire COALVILLE LE67 1GQ England', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (325, 'UK', NULL, 'MAN1', 'M90 5AA', 'Manchester', 'Manchester', 'Amazon EU SARL 6 Sunbank Lane Airport City Altrincham MANCHESTER M90 5AA England', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (326, 'UK', NULL, 'XUKD', 'NN11 8LR', 'DAVENTRY', 'DAVENTRY', 'XPO Logistics.Unit A Daventry Distribution Centre, Royal Oak Way North,Unit A Daventry Distribution Centre, Daventry NN11 8LR England', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (327, 'UK', NULL, 'EUKA', 'PE2 6UG', 'England', 'SOUTHGATE', 'UNO UK, Units 9-10 Manasty Rd, ORTON SOUTHGATE PE2 6UG England', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (328, 'UK', NULL, 'LBA2', 'DN11 OBG', 'Yorkshire and the Humber', 'Doncaster', 'Unit 1 (IP1= Amazon) Iport Avenue Doncaster, Yorkshire and the Humber DN11 OBG GB', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (329, 'UK', NULL, 'MAN2', 'WAS 3XA', 'North West England', 'Warrington', 'Omega Plot 7c Orion Boulevard Warrington, North West England WAS 3XA GB', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (330, 'UK', NULL, 'LCY2', 'RM18 7AN', 'Tilbury', 'Tilbury', 'Amazon Distribution Depot Un代 2, London Distribution Park Tilbury,RM18 7AN United Kingdom', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (331, 'CA', NULL, 'YVR1', 'V3M 5Y9', 'British Columbia', 'Vancouver', '450 Derwent PL Delta, British Columbia V3M 5Y9', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (332, 'CA', NULL, 'YYZ1', 'L5N 1L8', 'Ontario', 'Toronto', '6363 Millcreek Drive Mississauga, Ontario L5N 1L8', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (333, 'CA', NULL, 'YYZ2', 'L9T 6Y9', 'Ontario', 'Toronto', '2750 Peddie Rd. Milton, Ontario L9T 6Y9', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (334, 'CA', NULL, 'YYZ3', 'L6Y 0B2', 'Ontario', 'Toronto', '7995 Winston Churchill Blvd. Brampton, Ontario L6Y 0B2', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (335, 'CA', NULL, 'YYZ4/YYZ6?', 'L6Y 0C9', 'Ontario', 'Brampton', '8050 Heritage Road,Brampton, ON L6Y 0C9', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');
INSERT INTO `f_c_warehouse` VALUES (336, 'CA', NULL, 'YVR3', 'V3L5H4', 'British Columbia', 'New Westminster', '109 Braid Street New Westminster.BC V3L5H4', NULL, NULL, NULL, '2021-11-24 05:56:45', '2021-11-24 05:56:45');

-- ----------------------------
-- Table structure for inventory_out
-- ----------------------------
DROP TABLE IF EXISTS `inventory_out`;
CREATE TABLE `inventory_out`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `listing_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '评论数目',
  `irobot_shipment_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `fbaid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '发货Shipment ID',
  `fba_reference_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'FBA参考ID',
  `send_number` int(11) NULL DEFAULT NULL COMMENT '发货数目',
  `from_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '发货地址',
  `to_country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '目的国家',
  `fba_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'FBA仓库代码',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'FBA仓库代码详细地址',
  `postcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '目的仓库邮编',
  `date_create_ship` date NOT NULL COMMENT '提交发货计划日期',
  `carrier_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '承运商',
  `send_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '发货方式',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '出库单状态',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '备注',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tracking_num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '物流跟踪号',
  `hope_arrive_date` date NULL DEFAULT NULL COMMENT '期望到达日期，追踪日期',
  `actural_arrive_date` date NULL DEFAULT NULL COMMENT '实际到达日期，实际上架日期',
  `transportation_fee` float NULL DEFAULT NULL COMMENT '头程运费',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of inventory_out
-- ----------------------------
INSERT INTO `inventory_out` VALUES (1, '1', 'FBA123456', 'FBA123456', 'DJNFHKFE', 100, 'ADAD', 'US', 'ADAD', 'ddd', 'ddd', '2021-11-18', 'UPS', '2', '2', '1118 目的港塞港', '2021-11-17 08:53:33', '2021-11-19 07:11:26', '1ZJHD121231894289', '2021-12-04', '2021-12-05', NULL);

-- ----------------------------
-- Table structure for inventory_overseas
-- ----------------------------
DROP TABLE IF EXISTS `inventory_overseas`;
CREATE TABLE `inventory_overseas`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `irobot_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '赛盒SKU',
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '仓库国家',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '仓库地址',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of inventory_overseas
-- ----------------------------

-- ----------------------------
-- Table structure for inventory_purchase
-- ----------------------------
DROP TABLE IF EXISTS `inventory_purchase`;
CREATE TABLE `inventory_purchase`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) NOT NULL COMMENT 'listing ID',
  `date` datetime NOT NULL COMMENT '采购日期',
  `units_number` int(11) NOT NULL COMMENT '采购数目',
  `unit_price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '采购单价',
  `already_send` int(11) NOT NULL COMMENT '已发货数目',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '订单状态',
  `备注` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of inventory_purchase
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2016_01_04_173148_create_admin_tables', 1);
INSERT INTO `migrations` VALUES (4, '2019_04_23_154507_create_posts_table', 1);
INSERT INTO `migrations` VALUES (5, '2020_09_07_090635_create_admin_settings_table', 1);
INSERT INTO `migrations` VALUES (6, '2020_09_22_015815_create_admin_extensions_table', 1);
INSERT INTO `migrations` VALUES (7, '2020_11_01_083237_update_admin_menu_table', 1);
INSERT INTO `migrations` VALUES (8, '2021_11_09_012338_create_products_table', 1);
INSERT INTO `migrations` VALUES (9, '2021_11_09_132926_create_table_listings_table', 1);
INSERT INTO `migrations` VALUES (10, '2021_11_10_023506_create_table_review_table', 2);
INSERT INTO `migrations` VALUES (11, '2021_11_10_024505_create_inventory_overseas_table', 3);
INSERT INTO `migrations` VALUES (12, '2021_11_10_025658_create_inventory_out_table', 4);
INSERT INTO `migrations` VALUES (13, '2021_11_10_030218_create_inventory_purchase_table', 5);
INSERT INTO `migrations` VALUES (14, '2021_11_10_030548_create_exchange_rate_table', 6);
INSERT INTO `migrations` VALUES (15, '2021_11_19_075248_create_f_c_warehouse_table', 7);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of posts
-- ----------------------------

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name_chinese` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '中文产品名称',
  `name_english` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '英文产品名称',
  `asin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '亚马逊ASIN',
  `upc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `irobot_sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `addbyuser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '添加产品用户',
  `unit_size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '产品尺寸',
  `unit_weight` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '产品重量',
  `box_size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '装箱尺寸',
  `box_weight` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '装箱重量',
  `numberperbox` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '装箱个数',
  `amz_listing` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '参考亚马逊链接',
  `purchasemethod` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '采购链接',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image_column` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '产品图片',
  `purchase_cost` float(10, 2) NULL DEFAULT NULL COMMENT '产品采购成本',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, '望远镜', 'Binoculars', 'B07VZZ1M6N', NULL, '1191445', 'Stephen Excel', '', '', '', '', '', '', '', '2021-11-19 23:12:51', '2021-11-19 23:12:51', NULL, 65.99);
INSERT INTO `products` VALUES (2, '登山杖', 'Trekking', 'B07MLWHQJG', NULL, '1193539', 'Stephen Excel', '', '', '', '', '', '', '', '2021-11-19 23:12:51', '2021-11-19 23:12:51', NULL, 23.99);
INSERT INTO `products` VALUES (3, '吸奶器', 'Breast Pump', 'B07WNQ9HCK', NULL, '1235329', 'Stephen Excel', '', '', '', '', '', '', '', '2021-11-19 23:12:51', '2021-11-19 23:12:51', NULL, 23.56);
INSERT INTO `products` VALUES (4, '闹钟', 'Clock', 'B07MDW457N', NULL, '1198311', 'Stephen Excel', '', '', '', '', '', '', '', '2021-11-19 23:12:51', '2021-11-19 23:12:51', NULL, 85.65);
INSERT INTO `products` VALUES (5, '戴森吸尘器两层简易款', 'dyson easy', 'B08YQKXHGT', NULL, '1630970', 'Stephen Excel', '', '', '', '', '', '', '', '2021-11-19 23:12:51', '2021-11-19 23:12:51', NULL, 1.00);
INSERT INTO `products` VALUES (6, 'V11轮子', 'lunzi', 'B08JTZK7ZV', NULL, '1624900', 'Stephen Excel', '', '', '', '', '', '', '', '2021-11-19 23:12:51', '2021-11-19 23:12:51', NULL, 2.00);
INSERT INTO `products` VALUES (7, 'V10', 'V10', 'B07YQLF9XW', NULL, '1396484', 'Stephen Excel', '', '', '', '', '', '', '', '2021-11-19 23:12:51', '2021-11-19 23:12:51', NULL, 3.00);
INSERT INTO `products` VALUES (8, 'V11铁板', 'tieban', 'B083M8RRN3', NULL, '1415432', 'Stephen Excel', '', '', '', '', '', '', '', '2021-11-19 23:12:51', '2021-11-19 23:12:51', NULL, 4.00);
INSERT INTO `products` VALUES (9, 'A款', 'A', 'B082T1NFVM', NULL, '1447512', 'Stephen Excel', '', '', '', '', '', '', '', '2021-11-19 23:12:51', '2021-11-19 23:12:51', NULL, 5.00);
INSERT INTO `products` VALUES (10, '挂墙板', 'wallmounted', 'B08JLTS5LT', NULL, '1624913', 'Stephen Excel', '', '', '', '', '', '', '', '2021-11-19 23:12:51', '2021-11-19 23:12:51', NULL, 6.00);
INSERT INTO `products` VALUES (11, '卷发器支架', 'airwrap', 'B08HQKFRNM', NULL, '1618347', 'Stephen Excel', '', '', '', '', '', '', '', '2021-11-19 23:12:51', '2021-11-19 23:12:51', NULL, 7.00);
INSERT INTO `products` VALUES (12, 'B款', 'B', 'B08NK2JC3K', NULL, '1631129', 'Stephen Excel', '', '', '', '', '', '', '', '2021-11-19 23:12:51', '2021-11-19 23:12:51', NULL, 8.00);
INSERT INTO `products` VALUES (13, '吸尘器支架无螺丝款', 'noscrew', 'B08MZV69MG', NULL, '1682600', 'Stephen Excel', '', '', '', '', '', '', '', '2021-11-19 23:12:51', '2021-11-19 23:12:51', NULL, 9.00);
INSERT INTO `products` VALUES (14, '黑色飞机款', 'plane', 'B08PZ3H1XS', NULL, '1709876', 'Stephen Excel', '', '', '', '', '', '', '', '2021-11-19 23:12:51', '2021-11-19 23:12:51', NULL, 9.00);
INSERT INTO `products` VALUES (15, '黑色三角款', 'triggle', 'B08PZ2RVTX', NULL, '1709875', 'Stephen Excel', '', '', '', '', '', '', '', '2021-11-19 23:12:51', '2021-11-19 23:12:51', NULL, 80.00);
INSERT INTO `products` VALUES (16, '循环扇', 'air circulator fan', 'B08G8FRHKD', NULL, '1610774', 'Stephen Excel', '', '', '', '', '', '', '', '2021-11-19 23:12:51', '2021-11-19 23:12:51', NULL, 76.00);

-- ----------------------------
-- Table structure for table_listings
-- ----------------------------
DROP TABLE IF EXISTS `table_listings`;
CREATE TABLE `table_listings`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `amz_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '亚马逊账号名称',
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '国家',
  `amz_sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '亚马逊SKU',
  `asin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '亚马逊ASIN',
  `fnsku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'FNSKU',
  `local_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '本土语言产品名称',
  `upc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `irobot_sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '赛盒SKU',
  `saler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '所属销售',
  `price` float NULL DEFAULT NULL COMMENT '产品售价',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `fba_fee` float NULL DEFAULT NULL COMMENT 'FBA费用',
  `amz_sale_commssion` float NULL DEFAULT NULL COMMENT 'FBA佣金',
  `fba_current_inventory` int(11) NULL DEFAULT NULL COMMENT 'FBA库存，不包含转运中',
  `fba_current_transfer` int(11) NULL DEFAULT NULL COMMENT 'FBA转运中库存',
  `latest_transportation_unitfee` float NULL DEFAULT NULL COMMENT '最新的单个产品头程运费 RMB',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of table_listings
-- ----------------------------
INSERT INTO `table_listings` VALUES (1, 'EEEEE', 'FR', 'sasff', 'B07VZZ1M6N', 'B07VZZ1M6N', 'sdasafsa', 'B07VZZ1M6N', '1624900', 'csf', 12.99, NULL, '2021-11-18 16:26:34', 4.36, 3, 15, 20, 20.05);
INSERT INTO `table_listings` VALUES (2, 'FFFF', 'US', 'fsdfsdf', 'B08JTZK7ZV', 'B08JTZK7ZV', 'B08JTZK7ZV', 'B08JTZK7ZV', '1624900', 'wx', 39.99, NULL, NULL, 3.99, 2.66, 0, 0, 23.99);
INSERT INTO `table_listings` VALUES (3, 'FGRGRG', 'CA', 'lvmf', 'B083M8RRN3', 'B083M8RRN3', 'B083M8RRN3', 'B083M8RRN3', '1415432', 'csfs', 49.99, NULL, NULL, 1.99, 2.99, 12, 4, 15.99);
INSERT INTO `table_listings` VALUES (4, '1', 'US', '1', 'B07VZZ1M6N', 'B07VZZ1M6N', '望远镜', '1235423535', '1624900', 'csf Excel', 36.99, '2021-11-20 14:10:15', '2021-11-20 14:10:15', 5.67, 4.65, 453, 123, 34);
INSERT INTO `table_listings` VALUES (5, '2', 'ES', '1', 'B07VZZ1M6N', 'B07VZZ1M6N', '望远镜', '1235423536', '1624900', 'csf Excel', 37.99, '2021-11-20 14:10:15', '2021-11-20 14:10:15', 5.67, 5.65, 454, 124, 34);
INSERT INTO `table_listings` VALUES (6, '3', 'CA', '1', 'B07VZZ1M6N', 'B07VZZ1M6N', '望远镜', '1235423537', '1624900', 'csf Excel', 38.99, '2021-11-20 14:10:15', '2021-11-20 14:10:15', 5.67, 6.65, 455, 125, 34);
INSERT INTO `table_listings` VALUES (7, '4', 'DE', '2', 'B07VZZ1M6N', 'B07VZZ1M6N', '望远镜', '1235423538', '1624900', 'csf Excel', 39.99, '2021-11-20 14:10:15', '2021-11-20 14:10:15', 5.67, 7.65, 456, 126, 34);
INSERT INTO `table_listings` VALUES (8, '5', 'US', '3', 'B07VZZ1M6N', 'B07VZZ1M6N', '望远镜', '1235423539', '1624900', 'csf Excel', 40.99, '2021-11-20 14:10:15', '2021-11-20 14:10:15', 5.67, 8.65, 457, 127, 34);
INSERT INTO `table_listings` VALUES (9, '6', 'CA', '4', 'B07VZZ1M6N', 'B07VZZ1M6N', '望远镜', '1235423540', '1624900', 'csf Excel', 41.99, '2021-11-20 14:10:15', '2021-11-20 14:10:15', 5.67, 9.65, 458, 128, 34);

-- ----------------------------
-- Table structure for table_review
-- ----------------------------
DROP TABLE IF EXISTS `table_review`;
CREATE TABLE `table_review`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) NOT NULL COMMENT 'listing ID',
  `rew_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '评论数目',
  `rew_rate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '评论星级',
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '评论统计日期',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注:记录意外状况等',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of table_review
-- ----------------------------
INSERT INTO `table_review` VALUES (1, 1, '123', '4.0', '2021-10-12', NULL, '2021-11-16 10:51:19', '2021-11-16 10:51:29');
INSERT INTO `table_review` VALUES (2, 1, '234', '3.8', '2021-11-24', NULL, '2021-11-24 10:51:25', '2021-11-24 10:51:33');
INSERT INTO `table_review` VALUES (3, 2, '34', '4.3', '2021-09-10', NULL, NULL, NULL);
INSERT INTO `table_review` VALUES (4, 1, '124', '4.2', '2021-11-25', NULL, NULL, NULL);
INSERT INTO `table_review` VALUES (5, 3, '1', '4.4', '2021-10-34', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
