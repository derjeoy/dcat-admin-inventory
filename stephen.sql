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

 Date: 03/12/2021 17:27:26
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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_extension_histories
-- ----------------------------
INSERT INTO `admin_extension_histories` VALUES (1, 'de-memory.dcat-media-selector', 1, '1.0.0-beta', 'Initialize extension.', '2021-12-02 12:45:34', '2021-12-02 12:45:34');
INSERT INTO `admin_extension_histories` VALUES (2, 'dcat-admin.operation-log', 2, '1.0.0', 'create_opration_log_table.php', '2021-12-02 12:45:41', '2021-12-02 12:45:41');
INSERT INTO `admin_extension_histories` VALUES (3, 'dcat-admin.operation-log', 1, '1.0.0', 'Initialize extension.', '2021-12-02 12:45:41', '2021-12-02 12:45:41');
INSERT INTO `admin_extension_histories` VALUES (4, 'dcat-admin.form-step', 1, '1.0.0', 'Initialize extension.', '2021-12-02 12:45:42', '2021-12-02 12:45:42');

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_extensions
-- ----------------------------
INSERT INTO `admin_extensions` VALUES (1, 'de-memory.dcat-media-selector', '1.0.0-beta', 1, NULL, '2021-12-02 12:45:34', '2021-12-02 12:45:38');
INSERT INTO `admin_extensions` VALUES (2, 'dcat-admin.operation-log', '1.0.0', 1, NULL, '2021-12-02 12:45:41', '2021-12-02 12:45:46');
INSERT INTO `admin_extensions` VALUES (3, 'dcat-admin.form-step', '1.0.0', 1, NULL, '2021-12-02 12:45:42', '2021-12-02 12:45:48');

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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES (1, 0, 1, 'Index', 'feather icon-bar-chart-2', '/', '', 0, '2021-11-10 00:42:28', '2021-11-30 11:17:01');
INSERT INTO `admin_menu` VALUES (2, 0, 2, 'Admin', 'feather icon-settings', '', '', 1, '2021-11-10 00:42:28', NULL);
INSERT INTO `admin_menu` VALUES (3, 2, 3, 'Users', '', 'auth/users', '', 1, '2021-11-10 00:42:28', NULL);
INSERT INTO `admin_menu` VALUES (4, 2, 4, 'Roles', '', 'auth/roles', '', 1, '2021-11-10 00:42:28', NULL);
INSERT INTO `admin_menu` VALUES (5, 2, 5, 'Permission', '', 'auth/permissions', '', 1, '2021-11-10 00:42:28', NULL);
INSERT INTO `admin_menu` VALUES (6, 2, 6, 'Menu', '', 'auth/menu', '', 1, '2021-11-10 00:42:28', NULL);
INSERT INTO `admin_menu` VALUES (7, 2, 7, 'Extensions', '', 'auth/extensions', '', 1, '2021-11-10 00:42:28', NULL);
INSERT INTO `admin_menu` VALUES (8, 0, 8, 'Operation Log', '', 'auth/operation-logs', 'dcat-admin.operation-log', 1, '2021-12-02 12:45:40', '2021-12-02 12:45:40');

-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_operation_log_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 336 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
INSERT INTO `admin_operation_log` VALUES (1, 1, 'admin/auth/extensions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 12:45:47', '2021-12-02 12:45:47');
INSERT INTO `admin_operation_log` VALUES (2, 1, 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"_action\":\"Dcat_Admin_Http_Actions_Extensions_Enable\",\"_key\":\"dcat-admin.form-step\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\"}', '2021-12-02 12:45:48', '2021-12-02 12:45:48');
INSERT INTO `admin_operation_log` VALUES (3, 1, 'admin/auth/extensions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 12:45:49', '2021-12-02 12:45:49');
INSERT INTO `admin_operation_log` VALUES (4, 1, 'admin/auth/extensions', 'GET', '127.0.0.1', '[]', '2021-12-02 12:46:22', '2021-12-02 12:46:22');
INSERT INTO `admin_operation_log` VALUES (5, 1, 'admin/shipments', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 12:46:35', '2021-12-02 12:46:35');
INSERT INTO `admin_operation_log` VALUES (6, 1, 'admin/shipments/create', 'GET', '127.0.0.1', '[]', '2021-12-02 12:46:37', '2021-12-02 12:46:37');
INSERT INTO `admin_operation_log` VALUES (7, 1, 'admin/api/product', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2021-12-02 12:46:39', '2021-12-02 12:46:39');
INSERT INTO `admin_operation_log` VALUES (8, 1, 'admin/shipments/create', 'GET', '127.0.0.1', '[]', '2021-12-02 12:46:49', '2021-12-02 12:46:49');
INSERT INTO `admin_operation_log` VALUES (9, 1, 'admin/api/product', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2021-12-02 12:46:52', '2021-12-02 12:46:52');
INSERT INTO `admin_operation_log` VALUES (10, 1, 'admin/media-selector/media-upload', 'POST', '127.0.0.1', '{\"type\":\"blend\",\"move\":\"{\\\"dir\\\":\\\"upload_files\\\",\\\"fileNameIsEncrypt\\\":true}\",\"media_group_id\":\"0\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\"}', '2021-12-02 12:47:03', '2021-12-02 12:47:03');
INSERT INTO `admin_operation_log` VALUES (11, 1, 'admin/media-selector/media-list', 'GET', '127.0.0.1', '{\"page\":\"1\",\"limit\":\"20\",\"order\":\"desc\",\"keyword\":null,\"type\":null,\"group_id\":\"0\",\"_\":\"1638420409852\"}', '2021-12-02 12:47:06', '2021-12-02 12:47:06');
INSERT INTO `admin_operation_log` VALUES (12, 1, 'admin/media-selector/media-list', 'GET', '127.0.0.1', '{\"page\":\"1\",\"limit\":\"20\",\"order\":\"desc\",\"keyword\":null,\"type\":null,\"group_id\":\"0\",\"_\":\"1638420409853\"}', '2021-12-02 12:47:19', '2021-12-02 12:47:19');
INSERT INTO `admin_operation_log` VALUES (13, 1, 'admin/shipments', 'POST', '127.0.0.1', '{\"listing_id\":\"1\",\"irobot_shipment_id\":null,\"fbaid\":null,\"fba_reference_id\":null,\"send_number\":null,\"from_address\":null,\"to_country\":null,\"fba_code\":null,\"address\":null,\"postcode\":null,\"date_create_ship\":null,\"carrier_name\":null,\"tracking_num\":null,\"send_method\":null,\"status\":null,\"note\":null,\"carrier_file\":null,\"_file_\":null,\"carrier_pdf\":null,\"avatar1\":\"upload_files\\/d1094e16d493e4134cfe8600c2e95970.jpg\",\"field_avatar1name\":null,\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\"}', '2021-12-02 12:47:34', '2021-12-02 12:47:34');
INSERT INTO `admin_operation_log` VALUES (14, 1, 'admin/shipments/create', 'GET', '127.0.0.1', '[]', '2021-12-02 12:50:13', '2021-12-02 12:50:13');
INSERT INTO `admin_operation_log` VALUES (15, 1, 'admin/api/product', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2021-12-02 12:50:16', '2021-12-02 12:50:16');
INSERT INTO `admin_operation_log` VALUES (16, 1, 'admin/shipments', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 12:50:18', '2021-12-02 12:50:18');
INSERT INTO `admin_operation_log` VALUES (17, 1, 'admin/shipments', 'GET', '127.0.0.1', '[]', '2021-12-02 12:50:19', '2021-12-02 12:50:19');
INSERT INTO `admin_operation_log` VALUES (18, 1, 'admin/media-selector/media-list', 'GET', '127.0.0.1', '{\"page\":\"1\",\"limit\":\"20\",\"order\":\"desc\",\"keyword\":null,\"type\":null,\"group_id\":\"0\",\"_\":\"1638420621728\"}', '2021-12-02 13:42:57', '2021-12-02 13:42:57');
INSERT INTO `admin_operation_log` VALUES (19, 1, 'admin/media-selector/media-upload', 'POST', '127.0.0.1', '{\"media_group_id\":\"0\",\"type\":\"blend\",\"move\":\"{\\\"dir\\\":\\\"upload_files\\\",\\\"fileNameIsEncrypt\\\":true}\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\"}', '2021-12-02 13:43:28', '2021-12-02 13:43:28');
INSERT INTO `admin_operation_log` VALUES (20, 1, 'admin/media-selector/media-upload', 'POST', '127.0.0.1', '{\"media_group_id\":\"0\",\"type\":\"blend\",\"move\":\"{\\\"dir\\\":\\\"upload_files\\\",\\\"fileNameIsEncrypt\\\":true}\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\"}', '2021-12-02 13:43:28', '2021-12-02 13:43:28');
INSERT INTO `admin_operation_log` VALUES (21, 1, 'admin/media-selector/media-upload', 'POST', '127.0.0.1', '{\"type\":\"blend\",\"move\":\"{\\\"dir\\\":\\\"upload_files\\\",\\\"fileNameIsEncrypt\\\":true}\",\"media_group_id\":\"0\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\"}', '2021-12-02 13:43:29', '2021-12-02 13:43:29');
INSERT INTO `admin_operation_log` VALUES (22, 1, 'admin/media-selector/media-upload', 'POST', '127.0.0.1', '{\"media_group_id\":\"0\",\"type\":\"blend\",\"move\":\"{\\\"dir\\\":\\\"upload_files\\\",\\\"fileNameIsEncrypt\\\":true}\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\"}', '2021-12-02 13:43:29', '2021-12-02 13:43:29');
INSERT INTO `admin_operation_log` VALUES (23, 1, 'admin/media-selector/media-upload', 'POST', '127.0.0.1', '{\"media_group_id\":\"0\",\"type\":\"blend\",\"move\":\"{\\\"dir\\\":\\\"upload_files\\\",\\\"fileNameIsEncrypt\\\":true}\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\"}', '2021-12-02 13:43:30', '2021-12-02 13:43:30');
INSERT INTO `admin_operation_log` VALUES (24, 1, 'admin/media-selector/media-upload', 'POST', '127.0.0.1', '{\"media_group_id\":\"0\",\"type\":\"blend\",\"move\":\"{\\\"dir\\\":\\\"upload_files\\\",\\\"fileNameIsEncrypt\\\":true}\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\"}', '2021-12-02 13:43:30', '2021-12-02 13:43:30');
INSERT INTO `admin_operation_log` VALUES (25, 1, 'admin/auth/extensions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 13:43:43', '2021-12-02 13:43:43');
INSERT INTO `admin_operation_log` VALUES (26, 1, 'admin/shipments', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 13:43:48', '2021-12-02 13:43:48');
INSERT INTO `admin_operation_log` VALUES (27, 1, 'admin/shipments', 'GET', '127.0.0.1', '[]', '2021-12-02 13:43:48', '2021-12-02 13:43:48');
INSERT INTO `admin_operation_log` VALUES (28, 1, 'admin/auth/extensions', 'GET', '127.0.0.1', '[]', '2021-12-02 13:46:04', '2021-12-02 13:46:04');
INSERT INTO `admin_operation_log` VALUES (29, 1, 'admin/shipments', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 13:46:08', '2021-12-02 13:46:08');
INSERT INTO `admin_operation_log` VALUES (30, 1, 'admin/shipments/create', 'GET', '127.0.0.1', '[]', '2021-12-02 13:46:14', '2021-12-02 13:46:14');
INSERT INTO `admin_operation_log` VALUES (31, 1, 'admin/api/product', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2021-12-02 13:46:17', '2021-12-02 13:46:17');
INSERT INTO `admin_operation_log` VALUES (32, 1, 'admin/shipments', 'POST', '127.0.0.1', '{\"_id\":\"NSr7I2IdebtA0mFu\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\",\"upload_column\":\"carrier_file\",\"primary_key\":\"null\",\"id\":\"WU_FILE_0\",\"name\":\"风扇B08G8FRHKD Shipstation New order.xlsx\",\"type\":\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"lastModifiedDate\":\"Wed Dec 01 2021 16:59:10 GMT+0800 (中国标准时间)\",\"size\":\"13251\"}', '2021-12-02 13:46:40', '2021-12-02 13:46:40');
INSERT INTO `admin_operation_log` VALUES (33, 1, 'admin/shipments', 'POST', '127.0.0.1', '{\"_id\":\"3AZrKiecrfmzZlgE\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\",\"upload_column\":\"carrier_pdf\",\"primary_key\":\"null\",\"id\":\"WU_FILE_2\",\"name\":\"Checking_206617391.pdf\",\"type\":\"application\\/pdf\",\"lastModifiedDate\":\"Wed Nov 03 2021 19:49:08 GMT+0800 (中国标准时间)\",\"size\":\"199522\"}', '2021-12-02 13:46:56', '2021-12-02 13:46:56');
INSERT INTO `admin_operation_log` VALUES (34, 1, 'admin/shipments', 'POST', '127.0.0.1', '{\"listing_id\":\"1\",\"irobot_shipment_id\":\"FBA12345678\",\"fbaid\":\"FBA1234567811111\",\"fba_reference_id\":\"FBA12345678\",\"send_number\":\"FBA12345678\",\"from_address\":\"FBA12345678\",\"to_country\":\"FBA12345678\",\"fba_code\":\"FBA12345678\",\"address\":\"FBA12345678\",\"postcode\":\"FBA12345678\",\"date_create_ship\":\"2021-12-02\",\"carrier_name\":\"FBA12345678\",\"tracking_num\":\"FBA12345678\",\"send_method\":\"1\",\"status\":\"2\",\"note\":null,\"carrier_file\":\"files\\/风扇B08G8FRHKD Shipstation New order.xlsx\",\"_file_\":null,\"carrier_pdf\":\"files\\/Checking_206617391.pdf\",\"avatar1\":null,\"field_avatar1name\":null,\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/shipments\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\"}', '2021-12-02 13:47:01', '2021-12-02 13:47:01');
INSERT INTO `admin_operation_log` VALUES (35, 1, 'admin/shipments/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 13:47:23', '2021-12-02 13:47:23');
INSERT INTO `admin_operation_log` VALUES (36, 1, 'admin/api/product', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2021-12-02 13:47:26', '2021-12-02 13:47:26');
INSERT INTO `admin_operation_log` VALUES (37, 1, 'admin/api/product', 'GET', '127.0.0.1', '{\"q\":\"3\"}', '2021-12-02 13:47:28', '2021-12-02 13:47:28');
INSERT INTO `admin_operation_log` VALUES (38, 1, 'admin/shipments', 'POST', '127.0.0.1', '{\"_id\":\"bNT7WYxwtBdg4gMX\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\",\"upload_column\":\"carrier_file\",\"primary_key\":\"null\",\"id\":\"WU_FILE_0\",\"name\":\"风扇B08G8FRHKD Shipstation New order.xlsx\",\"type\":\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"lastModifiedDate\":\"Wed Dec 01 2021 16:59:10 GMT+0800 (中国标准时间)\",\"size\":\"13251\"}', '2021-12-02 13:47:45', '2021-12-02 13:47:45');
INSERT INTO `admin_operation_log` VALUES (39, 1, 'admin/shipments', 'POST', '127.0.0.1', '{\"_id\":\"BSFrnm0HBC9mkXoV\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\",\"upload_column\":\"carrier_pdf\",\"primary_key\":\"null\",\"id\":\"WU_FILE_1\",\"name\":\"Checking_206617391.pdf\",\"type\":\"application\\/pdf\",\"lastModifiedDate\":\"Wed Nov 03 2021 19:49:08 GMT+0800 (中国标准时间)\",\"size\":\"199522\"}', '2021-12-02 13:47:54', '2021-12-02 13:47:54');
INSERT INTO `admin_operation_log` VALUES (40, 1, 'admin/shipments', 'POST', '127.0.0.1', '{\"listing_id\":\"3\",\"irobot_shipment_id\":\"FBA12345678\",\"fbaid\":\"FBA12345678\",\"fba_reference_id\":\"FBA12345678\",\"send_number\":\"FBA12345678\",\"from_address\":\"FBA12345678\",\"to_country\":\"FBA12345678\",\"fba_code\":\"FBA12345678\",\"address\":\"FBA12345678\",\"postcode\":\"FBA12345678\",\"date_create_ship\":\"2021-11-30\",\"carrier_name\":\"FBA12345678\",\"tracking_num\":\"FBA12345678\",\"send_method\":\"2\",\"status\":\"3\",\"note\":\"FBA12345678\",\"carrier_file\":\"files\\/风扇B08G8FRHKD Shipstation New order.xlsx\",\"_file_\":null,\"carrier_pdf\":\"files\\/Checking_206617391.pdf\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\"}', '2021-12-02 13:47:56', '2021-12-02 13:47:56');
INSERT INTO `admin_operation_log` VALUES (41, 1, 'admin/shipments', 'POST', '127.0.0.1', '{\"listing_id\":\"3\",\"irobot_shipment_id\":\"FBA12345678\",\"fbaid\":\"FBA12345678\",\"fba_reference_id\":\"FBA12345678\",\"send_number\":\"100\",\"from_address\":\"FBA12345678\",\"to_country\":\"FBA12345678\",\"fba_code\":\"FBA12345678\",\"address\":\"FBA12345678\",\"postcode\":\"FBA12345678\",\"date_create_ship\":\"2021-11-30\",\"carrier_name\":\"FBA12345678\",\"tracking_num\":\"FBA12345678\",\"send_method\":\"2\",\"status\":\"3\",\"note\":\"FBA12345678\",\"carrier_file\":\"files\\/风扇B08G8FRHKD Shipstation New order.xlsx\",\"_file_\":null,\"carrier_pdf\":\"files\\/Checking_206617391.pdf\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\"}', '2021-12-02 13:48:13', '2021-12-02 13:48:13');
INSERT INTO `admin_operation_log` VALUES (42, 1, 'admin/shipments', 'POST', '127.0.0.1', '{\"listing_id\":\"3\",\"irobot_shipment_id\":\"FBA12345678\",\"fbaid\":\"FBA12345678\",\"fba_reference_id\":\"FBA12345678\",\"send_number\":\"100\",\"from_address\":\"FBA12345678\",\"to_country\":\"FBA12345678\",\"fba_code\":\"FBA12345678\",\"address\":\"FBA12345678\",\"postcode\":\"FBA12345678\",\"date_create_ship\":\"2021-11-30\",\"carrier_name\":\"FBA12345678\",\"tracking_num\":\"FBA12345678\",\"send_method\":\"2\",\"status\":\"3\",\"note\":\"FBA12345678\",\"carrier_file\":\"files\\/风扇B08G8FRHKD Shipstation New order.xlsx\",\"_file_\":null,\"carrier_pdf\":\"files\\/Checking_206617391.pdf\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\"}', '2021-12-02 13:49:05', '2021-12-02 13:49:05');
INSERT INTO `admin_operation_log` VALUES (43, 1, 'admin/shipments', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 13:49:05', '2021-12-02 13:49:05');
INSERT INTO `admin_operation_log` VALUES (44, 1, 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"fbaid\":\"FBA12345678\",\"carrier_file\":\"files\\/风扇B08G8FRHKD Shipstation New order.xlsx\",\"carrier_pdf\":\"files\\/Checking_206617391.pdf\",\"to_country\":\"FBA12345678\",\"model\":\"App\\\\Models\\\\InventoryOut\",\"_action\":\"App_Admin_RowActions_DownloadCarrierExcel\",\"_key\":\"1\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\"}', '2021-12-02 14:47:47', '2021-12-02 14:47:47');
INSERT INTO `admin_operation_log` VALUES (45, 1, 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"fbaid\":\"FBA12345678\",\"carrier_file\":\"files\\/风扇B08G8FRHKD Shipstation New order.xlsx\",\"carrier_pdf\":\"files\\/Checking_206617391.pdf\",\"to_country\":\"FBA12345678\",\"model\":\"App\\\\Models\\\\InventoryOut\",\"_action\":\"App_Admin_RowActions_DownloadCarrierPDF\",\"_key\":\"1\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\"}', '2021-12-02 14:47:52', '2021-12-02 14:47:52');
INSERT INTO `admin_operation_log` VALUES (46, 1, 'admin/auth/operation-logs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 14:48:43', '2021-12-02 14:48:43');
INSERT INTO `admin_operation_log` VALUES (47, 1, 'admin/auth/operation-logs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 14:49:11', '2021-12-02 14:49:11');
INSERT INTO `admin_operation_log` VALUES (48, 1, 'admin/auth/operation-logs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 14:49:15', '2021-12-02 14:49:15');
INSERT INTO `admin_operation_log` VALUES (49, 1, 'admin/layout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 14:49:19', '2021-12-02 14:49:19');
INSERT INTO `admin_operation_log` VALUES (50, 1, 'admin/auth/extensions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 14:49:21', '2021-12-02 14:49:21');
INSERT INTO `admin_operation_log` VALUES (51, 1, 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"_current_\":\"http:\\/\\/localhost:8000\\/admin\\/auth\\/extensions?\",\"_extension_\":\"dcat-admin.operation-log\",\"renderable\":\"Dcat_Admin_OperationLog_Setting\",\"_trans_\":\"extension\"}', '2021-12-02 14:49:27', '2021-12-02 14:49:27');
INSERT INTO `admin_operation_log` VALUES (52, 1, 'admin/auth/extensions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 14:49:58', '2021-12-02 14:49:58');
INSERT INTO `admin_operation_log` VALUES (53, 1, 'admin/helpers/icons', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 14:50:02', '2021-12-02 14:50:02');
INSERT INTO `admin_operation_log` VALUES (54, 1, 'admin/auth/extensions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 14:50:04', '2021-12-02 14:50:04');
INSERT INTO `admin_operation_log` VALUES (55, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 14:50:49', '2021-12-02 14:50:49');
INSERT INTO `admin_operation_log` VALUES (56, 1, 'admin/products/3/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2021-12-02 14:50:55', '2021-12-02 14:50:55');
INSERT INTO `admin_operation_log` VALUES (57, 1, 'admin/products/3', 'PUT', '127.0.0.1', '{\"_id\":\"boLXa7UIdykDbiSY\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\",\"upload_column\":\"image_column\",\"primary_key\":\"null\",\"_method\":\"PUT\",\"id\":\"WU_FILE_2\",\"name\":\"601be2b07c7f41612440240.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Thu Nov 25 2021 15:52:45 GMT+0800 (中国标准时间)\",\"size\":\"213561\"}', '2021-12-02 14:51:04', '2021-12-02 14:51:04');
INSERT INTO `admin_operation_log` VALUES (58, 1, 'admin/products/3', 'PUT', '127.0.0.1', '{\"_id\":\"boLXa7UIdykDbiSY\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\",\"primary_key\":null,\"_method\":\"PUT\",\"image_column\":\"images\\/Breast Pump.png\"}', '2021-12-02 14:51:05', '2021-12-02 14:51:05');
INSERT INTO `admin_operation_log` VALUES (59, 1, 'admin/products/3', 'PUT', '127.0.0.1', '{\"image_column\":\"images\\/Breast Pump.png\",\"_file_\":null,\"name_chinese\":\"吸奶器\",\"name_english\":\"Breast Pump\",\"asin\":\"B07WNQ9HCK\",\"upc\":null,\"irobot_sku\":\"1235329\",\"addbyuser\":\"Stephen Excel\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/products\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\"}', '2021-12-02 14:51:05', '2021-12-02 14:51:05');
INSERT INTO `admin_operation_log` VALUES (60, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 14:51:06', '2021-12-02 14:51:06');
INSERT INTO `admin_operation_log` VALUES (61, 1, 'admin/products/1', 'GET', '127.0.0.1', '[]', '2021-12-02 14:51:17', '2021-12-02 14:51:17');
INSERT INTO `admin_operation_log` VALUES (62, 1, 'admin/listings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 14:51:21', '2021-12-02 14:51:21');
INSERT INTO `admin_operation_log` VALUES (63, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 14:51:22', '2021-12-02 14:51:22');
INSERT INTO `admin_operation_log` VALUES (64, 1, 'admin/listings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 14:51:23', '2021-12-02 14:51:23');
INSERT INTO `admin_operation_log` VALUES (65, 1, 'admin/fbawarehouse', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 14:52:03', '2021-12-02 14:52:03');
INSERT INTO `admin_operation_log` VALUES (66, 1, 'admin/shipments', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 14:52:05', '2021-12-02 14:52:05');
INSERT INTO `admin_operation_log` VALUES (67, 1, 'admin/shipments', 'GET', '127.0.0.1', '[]', '2021-12-02 15:11:01', '2021-12-02 15:11:01');
INSERT INTO `admin_operation_log` VALUES (68, 1, 'admin/layout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 15:11:21', '2021-12-02 15:11:21');
INSERT INTO `admin_operation_log` VALUES (69, 1, 'admin/helpers/icons', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 15:11:23', '2021-12-02 15:11:23');
INSERT INTO `admin_operation_log` VALUES (70, 1, 'admin/helpers/icons', 'GET', '127.0.0.1', '[]', '2021-12-02 15:13:06', '2021-12-02 15:13:06');
INSERT INTO `admin_operation_log` VALUES (71, 1, 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"_current_\":\"http:\\/\\/localhost:8000\\/admin\\/helpers\\/icons?\",\"renderable\":\"App_Admin_Forms_AdminSetting\",\"_trans_\":\"icon\"}', '2021-12-02 15:13:47', '2021-12-02 15:13:47');
INSERT INTO `admin_operation_log` VALUES (72, 1, 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"name\":\"超凡ERP\",\"logo\":\"<img src=\\\"\\/vendor\\/dcat-admin\\/images\\/logo.png\\\" width=\\\"35\\\"> &nbsp;超凡ERP\",\"logo-mini\":\"<img src=\\\"\\/vendor\\/dcat-admin\\/images\\/logo.png\\\">\",\"lang\":\"zh_CN\",\"layout\":{\"color\":\"blue\",\"sidebar_style\":\"light\",\"body_class\":[null]},\"helpers\":{\"enable\":\"1\"},\"_form_\":\"App\\\\Admin\\\\Forms\\\\AdminSetting\",\"_current_\":\"http:\\/\\/localhost:8000\\/admin\\/helpers\\/icons?\",\"_payload_\":\"{\\\"_current_\\\":\\\"http:\\\\\\/\\\\\\/localhost:8000\\\\\\/admin\\\\\\/helpers\\\\\\/icons?\\\",\\\"renderable\\\":\\\"App_Admin_Forms_AdminSetting\\\",\\\"_trans_\\\":\\\"icon\\\"}\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\"}', '2021-12-02 15:13:50', '2021-12-02 15:13:50');
INSERT INTO `admin_operation_log` VALUES (73, 1, 'admin/helpers/icons', 'GET', '127.0.0.1', '[]', '2021-12-02 15:13:51', '2021-12-02 15:13:51');
INSERT INTO `admin_operation_log` VALUES (74, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 15:13:56', '2021-12-02 15:13:56');
INSERT INTO `admin_operation_log` VALUES (75, 1, 'admin/helpers/scaffold/table', 'POST', '127.0.0.1', '{\"db\":\"stephen\",\"tb\":\"products\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\"}', '2021-12-02 15:14:05', '2021-12-02 15:14:05');
INSERT INTO `admin_operation_log` VALUES (76, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"products\"}', '2021-12-02 15:14:06', '2021-12-02 15:14:06');
INSERT INTO `admin_operation_log` VALUES (77, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2021-12-02 15:15:46', '2021-12-02 15:15:46');
INSERT INTO `admin_operation_log` VALUES (78, 1, 'admin/helpers/scaffold/table', 'POST', '127.0.0.1', '{\"db\":\"stephen\",\"tb\":\"products\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\"}', '2021-12-02 15:21:09', '2021-12-02 15:21:09');
INSERT INTO `admin_operation_log` VALUES (79, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"products\"}', '2021-12-02 15:21:09', '2021-12-02 15:21:09');
INSERT INTO `admin_operation_log` VALUES (80, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"productspromotion\"}', '2021-12-02 15:21:16', '2021-12-02 15:21:16');
INSERT INTO `admin_operation_log` VALUES (81, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"products_promotion\"}', '2021-12-02 15:21:24', '2021-12-02 15:21:24');
INSERT INTO `admin_operation_log` VALUES (82, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"Promotion\"}', '2021-12-02 15:21:34', '2021-12-02 15:21:34');
INSERT INTO `admin_operation_log` VALUES (83, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"promotion\"}', '2021-12-02 15:21:36', '2021-12-02 15:21:36');
INSERT INTO `admin_operation_log` VALUES (84, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"promotion_products\"}', '2021-12-02 15:21:38', '2021-12-02 15:21:38');
INSERT INTO `admin_operation_log` VALUES (85, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"promotion_products\",\"exist-table\":\"stephen|products\",\"model_name\":\"App\\\\Models\\\\PromotionProduct\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\PromotionProductController\",\"repository_name\":\"App\\\\Admin\\\\Repositories\\\\PromotionProduct\",\"create\":[\"migration\",\"model\",\"repository\",\"controller\",\"migrate\",\"lang\"],\"fields\":{\"0\":{\"name\":\"listing_id\",\"translation\":\"亚马逊ASIN\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"产品listing\"},\"13\":{\"name\":\"brand\",\"translation\":\"品牌\",\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null},\"14\":{\"name\":\"keyword_location\",\"translation\":\"关键词位置\",\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"关键词位置\"},\"11\":{\"name\":\"agent_contact\",\"translation\":\"中介联系方式\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"中介联系方式\",\"nullable\":\"on\"},\"12\":{\"name\":\"store_name\",\"translation\":\"店铺\",\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null},\"6\":{\"name\":\"asin\",\"translation\":\"ASIN\",\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"ASIN\"},\"7\":{\"name\":\"name_chinese\",\"translation\":\"中文产品名称\",\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"中文产品名称\"},\"8\":{\"name\":\"name_english\",\"translation\":\"英文产品名称\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"英文产品名称\"},\"10\":{\"name\":\"note\",\"translation\":\"下单备注\",\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"下单备注\"}},\"translate_title\":null,\"primary_key\":\"id\",\"timestamps\":\"1\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\"}', '2021-12-02 15:28:07', '2021-12-02 15:28:07');
INSERT INTO `admin_operation_log` VALUES (86, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2021-12-02 15:28:08', '2021-12-02 15:28:08');
INSERT INTO `admin_operation_log` VALUES (87, 1, 'admin/helpers/scaffold/table', 'POST', '127.0.0.1', '{\"db\":\"stephen\",\"tb\":\"purchase_order\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\"}', '2021-12-02 15:29:29', '2021-12-02 15:29:29');
INSERT INTO `admin_operation_log` VALUES (88, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"purchase_order\"}', '2021-12-02 15:29:30', '2021-12-02 15:29:30');
INSERT INTO `admin_operation_log` VALUES (89, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"promotion_order\"}', '2021-12-02 15:29:39', '2021-12-02 15:29:39');
INSERT INTO `admin_operation_log` VALUES (90, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"promotion_order\",\"exist-table\":\"stephen|purchase_order\",\"model_name\":\"App\\\\Models\\\\PromotionOrder\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\PromotionOrderController\",\"repository_name\":\"App\\\\Admin\\\\Repositories\\\\PromotionOrder\",\"create\":[\"migration\",\"model\",\"repository\",\"controller\",\"migrate\",\"lang\"],\"fields\":{\"0\":{\"name\":\"promotion_product_id\",\"translation\":\"推广产品ID\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"推广产品ID\"},\"11\":{\"name\":\"promotion_type\",\"translation\":\"订单类型\",\"type\":\"enum\",\"key\":null,\"default\":null,\"comment\":\"订单类型\"},\"13\":{\"name\":\"refund_method\",\"translation\":\"返款方式(RMBorPP)\",\"type\":\"enum\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"返款方式\"},\"3\":{\"name\":\"order_number\",\"translation\":\"订单编号\",\"type\":\"integer\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"订单编号\"},\"4\":{\"name\":\"order_price\",\"translation\":\"订单价格\",\"type\":\"float\",\"key\":null,\"default\":null,\"comment\":\"订单价格\"},\"5\":{\"name\":\"order_screenshot\",\"translation\":\"订单截图\",\"type\":\"date\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"订单截图\"},\"6\":{\"name\":\"review_screenshot\",\"translation\":\"评论截图\",\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"评论截图\"},\"7\":{\"name\":\"review_link\",\"translation\":\"评论链接\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"评论链接\"},\"8\":{\"name\":\"review_submit_date\",\"translation\":\"评论提交日期\",\"type\":\"date\",\"key\":null,\"default\":null,\"comment\":\"评论提交日期\"},\"10\":{\"name\":\"refund_date\",\"translation\":\"返款日期\",\"type\":\"date\",\"key\":null,\"default\":null,\"comment\":\"返款日期\",\"nullable\":\"on\"},\"12\":{\"name\":\"refund_money\",\"translation\":\"返款金额\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"返款金额\"},\"14\":{\"name\":\"note\",\"translation\":\"备注要求\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"备注要求\"}},\"translate_title\":null,\"primary_key\":\"id\",\"timestamps\":\"1\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\"}', '2021-12-02 15:38:53', '2021-12-02 15:38:53');
INSERT INTO `admin_operation_log` VALUES (91, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2021-12-02 15:56:26', '2021-12-02 15:56:26');
INSERT INTO `admin_operation_log` VALUES (92, 1, 'admin/helpers/scaffold/table', 'POST', '127.0.0.1', '{\"db\":\"stephen\",\"tb\":\"promotion_products\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\"}', '2021-12-02 15:56:33', '2021-12-02 15:56:33');
INSERT INTO `admin_operation_log` VALUES (93, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"promotion_products\"}', '2021-12-02 15:56:33', '2021-12-02 15:56:33');
INSERT INTO `admin_operation_log` VALUES (94, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"promotion_order\"}', '2021-12-02 15:56:36', '2021-12-02 15:56:36');
INSERT INTO `admin_operation_log` VALUES (95, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"promotion_order\"}', '2021-12-02 15:56:40', '2021-12-02 15:56:40');
INSERT INTO `admin_operation_log` VALUES (96, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"promotion_orders\"}', '2021-12-02 15:56:45', '2021-12-02 15:56:45');
INSERT INTO `admin_operation_log` VALUES (97, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2021-12-02 15:59:54', '2021-12-02 15:59:54');
INSERT INTO `admin_operation_log` VALUES (98, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"promotion_orders\",\"exist-table\":\"stephen|promotion_products\",\"model_name\":\"App\\\\Models\\\\PromotionOrder\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\PromotionOrderController\",\"repository_name\":\"App\\\\Admin\\\\Repositories\\\\PromotionOrder\",\"create\":[\"migration\",\"model\",\"repository\",\"controller\",\"migrate\",\"lang\"],\"fields\":[{\"name\":\"promotion_product_id\",\"translation\":\"推广产品ID\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"推广产品ID\"},{\"name\":\"promotion_type\",\"translation\":\"订单类型\",\"type\":\"enum\",\"key\":null,\"default\":null,\"comment\":\"订单类型\"},{\"name\":\"refund_method\",\"translation\":\"返款方式(RMBorPP)\",\"type\":\"enum\",\"key\":null,\"default\":null,\"comment\":\"返款方式(RMBorPP)\"},{\"name\":\"order_number\",\"translation\":\"订单编号\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"订单编号\"},{\"name\":\"order_price\",\"translation\":\"订单价格\",\"type\":\"float\",\"key\":null,\"default\":null,\"comment\":\"订单价格\"},{\"name\":\"order_screenshot\",\"translation\":\"订单截图\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"订单截图\"},{\"name\":\"review_screenshot\",\"translation\":\"评论截图\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"评论截图\"},{\"name\":\"review_link\",\"translation\":\"评论链接\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"评论链接\"},{\"name\":\"review_submit_date\",\"translation\":\"评论提交日期\",\"type\":\"date\",\"key\":null,\"default\":null,\"comment\":\"评论提交日期\"},{\"name\":\"review_show_date\",\"translation\":\"评论显示日期\",\"type\":\"date\",\"key\":null,\"default\":null,\"comment\":\"评论显示日期\"},{\"name\":\"review_type\",\"translation\":\"评论类型\",\"type\":\"enum\",\"key\":null,\"default\":null,\"comment\":\"评论类型\"},{\"name\":\"refund_status\",\"translation\":\"返款状态\",\"type\":\"enum\",\"key\":null,\"default\":null,\"comment\":\"返款状态\"},{\"name\":\"refund_date\",\"translation\":\"返款日期\",\"type\":\"date\",\"key\":null,\"default\":null,\"comment\":\"返款日期\"},{\"name\":\"refund_money\",\"translation\":\"返款金额\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"返款金额\"},{\"name\":\"note\",\"translation\":\"备注要求\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"备注要求\"}],\"translate_title\":null,\"primary_key\":\"id\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\"}', '2021-12-02 16:02:30', '2021-12-02 16:02:30');
INSERT INTO `admin_operation_log` VALUES (99, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2021-12-02 16:09:48', '2021-12-02 16:09:48');
INSERT INTO `admin_operation_log` VALUES (100, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2021-12-02 16:13:41', '2021-12-02 16:13:41');
INSERT INTO `admin_operation_log` VALUES (101, 1, 'admin/promotionproducts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 16:13:45', '2021-12-02 16:13:45');
INSERT INTO `admin_operation_log` VALUES (102, 1, 'admin/promotionorders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 16:13:47', '2021-12-02 16:13:47');
INSERT INTO `admin_operation_log` VALUES (103, 1, 'admin/promotionorders', 'GET', '127.0.0.1', '[]', '2021-12-02 16:16:01', '2021-12-02 16:16:01');
INSERT INTO `admin_operation_log` VALUES (104, 1, 'admin/promotionorders/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 16:16:04', '2021-12-02 16:16:04');
INSERT INTO `admin_operation_log` VALUES (105, 1, 'admin/promotionorders', 'POST', '127.0.0.1', '{\"promotion_product_id\":\"1\",\"promotion_type\":\"免评\",\"refund_method\":\"微信\",\"order_number\":\"111-7117542-7675444\",\"order_price\":\"29.99\",\"order_screenshot\":\"1\",\"review_screenshot\":\"1\",\"review_link\":\"1\",\"review_submit_date\":\"2021-02-12\",\"review_show_date\":\"2021-02-12\",\"review_type\":\"文字\",\"refund_status\":\"已返款\",\"refund_date\":\"2021-10-12\",\"refund_money\":\"542\",\"note\":null,\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/promotionorders\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\"}', '2021-12-02 16:17:40', '2021-12-02 16:17:40');
INSERT INTO `admin_operation_log` VALUES (106, 1, 'admin/promotionorders', 'POST', '127.0.0.1', '{\"promotion_product_id\":\"1\",\"promotion_type\":\"免评\",\"refund_method\":\"微信\",\"order_number\":\"111-7117542-7675444\",\"order_price\":\"29.99\",\"order_screenshot\":\"1\",\"review_screenshot\":\"1\",\"review_link\":\"1\",\"review_submit_date\":\"2021-02-12\",\"review_show_date\":\"2021-02-12\",\"review_type\":\"文字\",\"refund_status\":\"已返款\",\"refund_date\":\"2021-10-12\",\"refund_money\":\"542\",\"note\":\"需要文字\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/promotionorders\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\"}', '2021-12-02 16:17:49', '2021-12-02 16:17:49');
INSERT INTO `admin_operation_log` VALUES (107, 1, 'admin/promotionorders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 16:17:49', '2021-12-02 16:17:49');
INSERT INTO `admin_operation_log` VALUES (108, 1, 'admin/shipments', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 16:18:18', '2021-12-02 16:18:18');
INSERT INTO `admin_operation_log` VALUES (109, 1, 'admin/listings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 16:18:19', '2021-12-02 16:18:19');
INSERT INTO `admin_operation_log` VALUES (110, 1, 'admin/listings/create', 'GET', '127.0.0.1', '[]', '2021-12-02 16:18:22', '2021-12-02 16:18:22');
INSERT INTO `admin_operation_log` VALUES (111, 1, 'admin/listings', 'GET', '127.0.0.1', '[]', '2021-12-02 16:18:28', '2021-12-02 16:18:28');
INSERT INTO `admin_operation_log` VALUES (112, 1, 'admin/listings/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 16:18:35', '2021-12-02 16:18:35');
INSERT INTO `admin_operation_log` VALUES (113, 1, 'admin/listings/create', 'GET', '127.0.0.1', '[]', '2021-12-02 16:18:36', '2021-12-02 16:18:36');
INSERT INTO `admin_operation_log` VALUES (114, 1, 'admin/listings/create', 'GET', '127.0.0.1', '[]', '2021-12-02 16:20:25', '2021-12-02 16:20:25');
INSERT INTO `admin_operation_log` VALUES (115, 1, 'admin/listings/create', 'GET', '127.0.0.1', '[]', '2021-12-02 16:28:36', '2021-12-02 16:28:36');
INSERT INTO `admin_operation_log` VALUES (116, 1, 'admin/listings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 16:28:43', '2021-12-02 16:28:43');
INSERT INTO `admin_operation_log` VALUES (117, 1, 'admin/listings/create', 'GET', '127.0.0.1', '[]', '2021-12-02 16:28:45', '2021-12-02 16:28:45');
INSERT INTO `admin_operation_log` VALUES (118, 1, 'admin/listings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 16:28:51', '2021-12-02 16:28:51');
INSERT INTO `admin_operation_log` VALUES (119, 1, 'admin/shipments', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 16:35:46', '2021-12-02 16:35:46');
INSERT INTO `admin_operation_log` VALUES (120, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 16:37:02', '2021-12-02 16:37:02');
INSERT INTO `admin_operation_log` VALUES (121, 1, 'admin/helpers/scaffold/table', 'POST', '127.0.0.1', '{\"db\":\"stephen\",\"tb\":\"products\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\"}', '2021-12-02 16:37:14', '2021-12-02 16:37:14');
INSERT INTO `admin_operation_log` VALUES (122, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"products\"}', '2021-12-02 16:37:17', '2021-12-02 16:37:17');
INSERT INTO `admin_operation_log` VALUES (123, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"sale\"}', '2021-12-02 16:37:21', '2021-12-02 16:37:21');
INSERT INTO `admin_operation_log` VALUES (124, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"sale\"}', '2021-12-02 16:37:22', '2021-12-02 16:37:22');
INSERT INTO `admin_operation_log` VALUES (125, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"sale_summer\"}', '2021-12-02 16:37:27', '2021-12-02 16:37:27');
INSERT INTO `admin_operation_log` VALUES (126, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"sale_summery\"}', '2021-12-02 16:37:27', '2021-12-02 16:37:27');
INSERT INTO `admin_operation_log` VALUES (127, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"sales_summery\"}', '2021-12-02 16:37:31', '2021-12-02 16:37:31');
INSERT INTO `admin_operation_log` VALUES (128, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"sales_summery\",\"exist-table\":\"stephen|products\",\"model_name\":\"App\\\\Models\\\\SalesSummery\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\SalesSummeryController\",\"repository_name\":\"App\\\\Admin\\\\Repositories\\\\SalesSummery\",\"create\":[\"migration\",\"model\",\"repository\",\"controller\",\"migrate\",\"lang\"],\"fields\":{\"0\":{\"name\":\"picture\",\"translation\":\"商品图片\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"商品图片\"},\"1\":{\"name\":\"asin\",\"translation\":\"ASIN\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"ASIN\"},\"2\":{\"name\":\"name_local\",\"translation\":\"商品名称\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"商品名称\"},\"3\":{\"name\":\"sku\",\"translation\":\"SKU\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"SKU\"},\"4\":{\"name\":\"taday_order_number\",\"translation\":\"今日销量\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"今日销量\"},\"5\":{\"name\":\"taday_order_ammount\",\"translation\":\"今日销售额\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"今日销售额\"},\"6\":{\"name\":\"today_average_price\",\"translation\":\"今日单价\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"今日单价\"},\"7\":{\"name\":\"yesterday_order_number\",\"translation\":\"昨日销量\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"昨日销量\"},\"8\":{\"name\":\"yesterday_order_ammount\",\"translation\":\"昨日销售额\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"昨日销售额\"},\"9\":{\"name\":\"yesterday_order_price\",\"translation\":\"昨日单价\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"昨日单价\"},\"10\":{\"name\":\"lastweekday_order_number\",\"translation\":\"昨日销售额销量\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"昨日销售额销量\"},\"11\":{\"name\":\"lastweekday_order_ammount\",\"translation\":\"昨日销售额销售额\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"昨日销售额销售额\"},\"12\":{\"name\":\"lastweekday_order_price\",\"translation\":\"昨日销售额单价\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"昨日销售额单价\"},\"13\":{\"name\":\"inventory_salable\",\"translation\":\"可售库存\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"可售库存\"},\"15\":{\"name\":\"inventory_receivable\",\"translation\":\"待收货库存\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"待收货库存\"},\"16\":{\"name\":\"inventory_movable\",\"translation\":\"转库中库存\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"转库中库存\"},\"17\":{\"name\":\"note\",\"translation\":\"备注\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"备注\"}},\"translate_title\":null,\"primary_key\":\"id\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\"}', '2021-12-02 16:47:32', '2021-12-02 16:47:32');
INSERT INTO `admin_operation_log` VALUES (129, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2021-12-02 16:47:32', '2021-12-02 16:47:32');
INSERT INTO `admin_operation_log` VALUES (130, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2021-12-02 16:48:12', '2021-12-02 16:48:12');
INSERT INTO `admin_operation_log` VALUES (131, 1, 'admin/salesummery', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 16:48:37', '2021-12-02 16:48:37');
INSERT INTO `admin_operation_log` VALUES (132, 1, 'admin/salesummery/create', 'GET', '127.0.0.1', '[]', '2021-12-02 16:52:45', '2021-12-02 16:52:45');
INSERT INTO `admin_operation_log` VALUES (133, 1, 'admin/salesummery', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 16:52:50', '2021-12-02 16:52:50');
INSERT INTO `admin_operation_log` VALUES (134, 1, 'admin/salesummery', 'GET', '127.0.0.1', '[]', '2021-12-02 16:54:33', '2021-12-02 16:54:33');
INSERT INTO `admin_operation_log` VALUES (135, 1, 'admin/salesummery', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 16:55:16', '2021-12-02 16:55:16');
INSERT INTO `admin_operation_log` VALUES (136, 1, 'admin/promotionproducts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 16:56:34', '2021-12-02 16:56:34');
INSERT INTO `admin_operation_log` VALUES (137, 1, 'admin/promotionorders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 16:56:36', '2021-12-02 16:56:36');
INSERT INTO `admin_operation_log` VALUES (138, 1, 'admin/listings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 16:58:15', '2021-12-02 16:58:15');
INSERT INTO `admin_operation_log` VALUES (139, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 16:58:18', '2021-12-02 16:58:18');
INSERT INTO `admin_operation_log` VALUES (140, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2021-12-02 16:58:20', '2021-12-02 16:58:20');
INSERT INTO `admin_operation_log` VALUES (141, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_id\":\"kwkctLfTWbWp2bLp\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\",\"upload_column\":\"image_column\",\"primary_key\":\"null\",\"id\":\"WU_FILE_0\",\"name\":\"image.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Thu Dec 02 2021 16:58:31 GMT+0800 (中国标准时间)\",\"size\":\"11280\"}', '2021-12-02 16:58:31', '2021-12-02 16:58:31');
INSERT INTO `admin_operation_log` VALUES (142, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_file_del_\":null,\"primary_key\":null,\"key\":\"images\\/.png\",\"_column\":\"image_column\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\"}', '2021-12-02 16:59:01', '2021-12-02 16:59:01');
INSERT INTO `admin_operation_log` VALUES (143, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 16:59:04', '2021-12-02 16:59:04');
INSERT INTO `admin_operation_log` VALUES (144, 1, 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"_current_\":\"http:\\/\\/localhost:8000\\/admin\\/products?\",\"renderable\":\"App_Admin_Forms_AdminSetting\",\"_trans_\":\"product\"}', '2021-12-02 17:10:54', '2021-12-02 17:10:54');
INSERT INTO `admin_operation_log` VALUES (145, 1, 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"name\":\"超凡ERP\",\"logo\":\"<img src=\\\"\\/vendor\\/dcat-admin\\/images\\/logo.png\\\" width=\\\"35\\\"> &nbsp;超凡ERP\",\"logo-mini\":\"<img src=\\\"\\/vendor\\/dcat-admin\\/images\\/logo.png\\\">\",\"lang\":\"zh_CN\",\"layout\":{\"color\":\"blue\",\"sidebar_style\":\"primary\",\"body_class\":[null]},\"helpers\":{\"enable\":\"1\"},\"_form_\":\"App\\\\Admin\\\\Forms\\\\AdminSetting\",\"_current_\":\"http:\\/\\/localhost:8000\\/admin\\/products?\",\"_payload_\":\"{\\\"_current_\\\":\\\"http:\\\\\\/\\\\\\/localhost:8000\\\\\\/admin\\\\\\/products?\\\",\\\"renderable\\\":\\\"App_Admin_Forms_AdminSetting\\\",\\\"_trans_\\\":\\\"product\\\"}\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\"}', '2021-12-02 17:10:59', '2021-12-02 17:10:59');
INSERT INTO `admin_operation_log` VALUES (146, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2021-12-02 17:11:01', '2021-12-02 17:11:01');
INSERT INTO `admin_operation_log` VALUES (147, 1, 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"_current_\":\"http:\\/\\/localhost:8000\\/admin\\/products?\",\"renderable\":\"App_Admin_Forms_AdminSetting\",\"_trans_\":\"product\"}', '2021-12-02 17:11:06', '2021-12-02 17:11:06');
INSERT INTO `admin_operation_log` VALUES (148, 1, 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"name\":\"超凡ERP\",\"logo\":\"<img src=\\\"\\/vendor\\/dcat-admin\\/images\\/logo.png\\\" width=\\\"35\\\"> &nbsp;超凡ERP\",\"logo-mini\":\"<img src=\\\"\\/vendor\\/dcat-admin\\/images\\/logo.png\\\">\",\"lang\":\"zh_CN\",\"layout\":{\"color\":\"blue\",\"sidebar_style\":\"light\",\"body_class\":[\"horizontal_menu\",null]},\"helpers\":{\"enable\":\"1\"},\"_form_\":\"App\\\\Admin\\\\Forms\\\\AdminSetting\",\"_current_\":\"http:\\/\\/localhost:8000\\/admin\\/products?\",\"_payload_\":\"{\\\"_current_\\\":\\\"http:\\\\\\/\\\\\\/localhost:8000\\\\\\/admin\\\\\\/products?\\\",\\\"renderable\\\":\\\"App_Admin_Forms_AdminSetting\\\",\\\"_trans_\\\":\\\"product\\\"}\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\"}', '2021-12-02 17:11:10', '2021-12-02 17:11:10');
INSERT INTO `admin_operation_log` VALUES (149, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2021-12-02 17:11:11', '2021-12-02 17:11:11');
INSERT INTO `admin_operation_log` VALUES (150, 1, 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"_current_\":\"http:\\/\\/localhost:8000\\/admin\\/products?\",\"renderable\":\"App_Admin_Forms_AdminSetting\",\"_trans_\":\"product\"}', '2021-12-02 17:11:24', '2021-12-02 17:11:24');
INSERT INTO `admin_operation_log` VALUES (151, 1, 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"name\":\"超凡ERP\",\"logo\":\"<img src=\\\"\\/vendor\\/dcat-admin\\/images\\/logo.png\\\" width=\\\"35\\\"> &nbsp;超凡ERP\",\"logo-mini\":\"<img src=\\\"\\/vendor\\/dcat-admin\\/images\\/logo.png\\\">\",\"lang\":\"zh_CN\",\"layout\":{\"color\":\"blue\",\"sidebar_style\":\"light\",\"body_class\":[\"sidebar-separate\",null]},\"helpers\":{\"enable\":\"1\"},\"_form_\":\"App\\\\Admin\\\\Forms\\\\AdminSetting\",\"_current_\":\"http:\\/\\/localhost:8000\\/admin\\/products?\",\"_payload_\":\"{\\\"_current_\\\":\\\"http:\\\\\\/\\\\\\/localhost:8000\\\\\\/admin\\\\\\/products?\\\",\\\"renderable\\\":\\\"App_Admin_Forms_AdminSetting\\\",\\\"_trans_\\\":\\\"product\\\"}\",\"_token\":\"K4VSmypg2bPPLY0enZXDrXFy17sprAn0PW2Sv17p\"}', '2021-12-02 17:11:34', '2021-12-02 17:11:34');
INSERT INTO `admin_operation_log` VALUES (152, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2021-12-02 17:11:36', '2021-12-02 17:11:36');
INSERT INTO `admin_operation_log` VALUES (153, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2021-12-03 08:34:06', '2021-12-03 08:34:06');
INSERT INTO `admin_operation_log` VALUES (154, 1, 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"_current_\":\"http:\\/\\/localhost:8000\\/admin\\/products?\",\"renderable\":\"App_Admin_Forms_AdminSetting\",\"_trans_\":\"product\"}', '2021-12-03 08:34:11', '2021-12-03 08:34:11');
INSERT INTO `admin_operation_log` VALUES (155, 1, 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"name\":\"超凡ERP\",\"logo\":\"<img src=\\\"\\/vendor\\/dcat-admin\\/images\\/logo.png\\\" width=\\\"35\\\"> &nbsp;超凡ERP\",\"logo-mini\":\"<img src=\\\"\\/vendor\\/dcat-admin\\/images\\/logo.png\\\">\",\"lang\":\"zh_CN\",\"layout\":{\"color\":\"blue\",\"sidebar_style\":\"light\",\"body_class\":[null]},\"helpers\":{\"enable\":\"1\"},\"_form_\":\"App\\\\Admin\\\\Forms\\\\AdminSetting\",\"_current_\":\"http:\\/\\/localhost:8000\\/admin\\/products?\",\"_payload_\":\"{\\\"_current_\\\":\\\"http:\\\\\\/\\\\\\/localhost:8000\\\\\\/admin\\\\\\/products?\\\",\\\"renderable\\\":\\\"App_Admin_Forms_AdminSetting\\\",\\\"_trans_\\\":\\\"product\\\"}\",\"_token\":\"dnyogJeDw0K9a6X6tuX01GF7ul1k3n6tnnCUONAq\"}', '2021-12-03 08:34:15', '2021-12-03 08:34:15');
INSERT INTO `admin_operation_log` VALUES (156, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2021-12-03 08:34:16', '2021-12-03 08:34:16');
INSERT INTO `admin_operation_log` VALUES (157, 1, 'admin/promotionorders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 08:34:23', '2021-12-03 08:34:23');
INSERT INTO `admin_operation_log` VALUES (158, 1, 'admin/promotionproducts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 08:34:25', '2021-12-03 08:34:25');
INSERT INTO `admin_operation_log` VALUES (159, 1, 'admin/salesummery', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 08:34:27', '2021-12-03 08:34:27');
INSERT INTO `admin_operation_log` VALUES (160, 1, 'admin/demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 08:34:28', '2021-12-03 08:34:28');
INSERT INTO `admin_operation_log` VALUES (161, 1, 'admin/demands/create', 'GET', '127.0.0.1', '[]', '2021-12-03 08:34:31', '2021-12-03 08:34:31');
INSERT INTO `admin_operation_log` VALUES (162, 1, 'admin/dcat-api/editor-md/upload', 'POST', '127.0.0.1', '{\"_token\":\"dnyogJeDw0K9a6X6tuX01GF7ul1k3n6tnnCUONAq\",\"dir\":\"markdown\\/images\",\"guid\":\"1638491684622\"}', '2021-12-03 08:34:50', '2021-12-03 08:34:50');
INSERT INTO `admin_operation_log` VALUES (163, 1, 'admin/demands', 'POST', '127.0.0.1', '{\"title\":\"产品列表问题\",\"content\":\"in111111111111![](http:\\/\\/localhost:8000\\/uploads\\/markdown\\/images\\/fffb5a7b54ac537fbce8309e869bd72461a9662ade940.jpg)\",\"_9766a134b276468-html-code\":\"<p>in111111111111<img src=\\\"http:\\/\\/localhost:8000\\/uploads\\/markdown\\/images\\/fffb5a7b54ac537fbce8309e869bd72461a9662ade940.jpg\\\" alt=\\\"\\\"><\\/p>\",\"type\":\"2\",\"reply\":null,\"_a797a5533b5465-html-code\":null,\"status\":\"0\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/demands\",\"_token\":\"dnyogJeDw0K9a6X6tuX01GF7ul1k3n6tnnCUONAq\"}', '2021-12-03 08:35:21', '2021-12-03 08:35:21');
INSERT INTO `admin_operation_log` VALUES (164, 1, 'admin/demands', 'POST', '127.0.0.1', '{\"title\":\"产品列表问题\",\"content\":\"in111111111111![](http:\\/\\/localhost:8000\\/uploads\\/markdown\\/images\\/fffb5a7b54ac537fbce8309e869bd72461a9662ade940.jpg)\",\"_9766a134b276468-html-code\":\"<p>in111111111111<img src=\\\"http:\\/\\/localhost:8000\\/uploads\\/markdown\\/images\\/fffb5a7b54ac537fbce8309e869bd72461a9662ade940.jpg\\\" alt=\\\"\\\"><\\/p>\",\"type\":\"2\",\"reply\":null,\"_a797a5533b5465-html-code\":null,\"status\":\"0\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/demands\",\"_token\":\"dnyogJeDw0K9a6X6tuX01GF7ul1k3n6tnnCUONAq\"}', '2021-12-03 08:36:58', '2021-12-03 08:36:58');
INSERT INTO `admin_operation_log` VALUES (165, 1, 'admin/demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 08:36:58', '2021-12-03 08:36:58');
INSERT INTO `admin_operation_log` VALUES (166, 1, 'admin/auth/operation-logs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 08:42:49', '2021-12-03 08:42:49');
INSERT INTO `admin_operation_log` VALUES (167, 1, 'admin/auth/operation-logs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 08:43:13', '2021-12-03 08:43:13');
INSERT INTO `admin_operation_log` VALUES (168, 1, 'admin/demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 08:43:16', '2021-12-03 08:43:16');
INSERT INTO `admin_operation_log` VALUES (169, 1, 'admin/fbawarehouse', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 08:44:54', '2021-12-03 08:44:54');
INSERT INTO `admin_operation_log` VALUES (170, 1, 'admin/currency', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 08:44:58', '2021-12-03 08:44:58');
INSERT INTO `admin_operation_log` VALUES (171, 1, 'admin/salesummery', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 08:45:03', '2021-12-03 08:45:03');
INSERT INTO `admin_operation_log` VALUES (172, 1, 'admin/promotionproducts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 08:45:12', '2021-12-03 08:45:12');
INSERT INTO `admin_operation_log` VALUES (173, 1, 'admin/salesummery', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 08:45:15', '2021-12-03 08:45:15');
INSERT INTO `admin_operation_log` VALUES (174, 1, 'admin/promotionproducts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 08:45:17', '2021-12-03 08:45:17');
INSERT INTO `admin_operation_log` VALUES (175, 1, 'admin/salesummery', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 08:45:23', '2021-12-03 08:45:23');
INSERT INTO `admin_operation_log` VALUES (176, 1, 'admin/reports', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 08:45:35', '2021-12-03 08:45:35');
INSERT INTO `admin_operation_log` VALUES (177, 1, 'admin/reports/preview', 'GET', '127.0.0.1', '[]', '2021-12-03 08:45:39', '2021-12-03 08:45:39');
INSERT INTO `admin_operation_log` VALUES (178, 1, 'admin/reports/preview', 'GET', '127.0.0.1', '[]', '2021-12-03 08:48:25', '2021-12-03 08:48:25');
INSERT INTO `admin_operation_log` VALUES (179, 1, 'admin/salesummery', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 08:49:32', '2021-12-03 08:49:32');
INSERT INTO `admin_operation_log` VALUES (180, 1, 'admin/salesummery', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"taday_order_number\",\"type\":\"desc\"}}', '2021-12-03 08:49:36', '2021-12-03 08:49:36');
INSERT INTO `admin_operation_log` VALUES (181, 1, 'admin/salesummery', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"taday_order_number\",\"type\":\"asc\"}}', '2021-12-03 08:49:39', '2021-12-03 08:49:39');
INSERT INTO `admin_operation_log` VALUES (182, 1, 'admin/salesummery', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"taday_order_number\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-12-03 08:51:14', '2021-12-03 08:51:14');
INSERT INTO `admin_operation_log` VALUES (183, 1, 'admin/salesummery', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"taday_order_number\",\"type\":\"asc\"}}', '2021-12-03 08:51:15', '2021-12-03 08:51:15');
INSERT INTO `admin_operation_log` VALUES (184, 1, 'admin/salesummery', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"taday_order_number\",\"type\":\"asc\"}}', '2021-12-03 08:51:52', '2021-12-03 08:51:52');
INSERT INTO `admin_operation_log` VALUES (185, 1, 'admin/salesummery', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"taday_order_number\",\"type\":\"asc\"}}', '2021-12-03 08:51:56', '2021-12-03 08:51:56');
INSERT INTO `admin_operation_log` VALUES (186, 1, 'admin/salesummery', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"taday_order_number\",\"type\":\"asc\"}}', '2021-12-03 08:52:47', '2021-12-03 08:52:47');
INSERT INTO `admin_operation_log` VALUES (187, 1, 'admin/salesummery', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"taday_order_number\",\"type\":\"asc\"}}', '2021-12-03 08:53:07', '2021-12-03 08:53:07');
INSERT INTO `admin_operation_log` VALUES (188, 1, 'admin/salesummery', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"taday_order_ammount\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-12-03 08:53:16', '2021-12-03 08:53:16');
INSERT INTO `admin_operation_log` VALUES (189, 1, 'admin/salesummery', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"taday_order_ammount\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-12-03 08:53:18', '2021-12-03 08:53:18');
INSERT INTO `admin_operation_log` VALUES (190, 1, 'admin/salesummery', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"taday_order_number\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-12-03 08:53:21', '2021-12-03 08:53:21');
INSERT INTO `admin_operation_log` VALUES (191, 1, 'admin/salesummery', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"taday_order_number\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-12-03 08:54:27', '2021-12-03 08:54:27');
INSERT INTO `admin_operation_log` VALUES (192, 1, 'admin/salesummery', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"taday_order_number\",\"type\":\"desc\"}}', '2021-12-03 08:55:25', '2021-12-03 08:55:25');
INSERT INTO `admin_operation_log` VALUES (193, 1, 'admin/helpers/icons', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 08:55:47', '2021-12-03 08:55:47');
INSERT INTO `admin_operation_log` VALUES (194, 1, 'admin/salesummery', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 08:56:06', '2021-12-03 08:56:06');
INSERT INTO `admin_operation_log` VALUES (195, 1, 'admin/salesummery', 'GET', '127.0.0.1', '[]', '2021-12-03 09:28:37', '2021-12-03 09:28:37');
INSERT INTO `admin_operation_log` VALUES (196, 1, 'admin/salesummery', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 09:29:04', '2021-12-03 09:29:04');
INSERT INTO `admin_operation_log` VALUES (197, 1, 'admin/salesummery', 'GET', '127.0.0.1', '[]', '2021-12-03 09:29:04', '2021-12-03 09:29:04');
INSERT INTO `admin_operation_log` VALUES (198, 1, 'admin/salesummery', 'GET', '127.0.0.1', '[]', '2021-12-03 09:30:30', '2021-12-03 09:30:30');
INSERT INTO `admin_operation_log` VALUES (199, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-12-03 09:31:46', '2021-12-03 09:31:46');
INSERT INTO `admin_operation_log` VALUES (200, 1, 'admin/shipments', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 09:31:51', '2021-12-03 09:31:51');
INSERT INTO `admin_operation_log` VALUES (201, 1, 'admin/overseasinvnetory', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 09:31:52', '2021-12-03 09:31:52');
INSERT INTO `admin_operation_log` VALUES (202, 1, 'admin/purchaseorders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 09:31:53', '2021-12-03 09:31:53');
INSERT INTO `admin_operation_log` VALUES (203, 1, 'admin/fbawarehouse', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 09:31:54', '2021-12-03 09:31:54');
INSERT INTO `admin_operation_log` VALUES (204, 1, 'admin/salesummery', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 09:32:30', '2021-12-03 09:32:30');
INSERT INTO `admin_operation_log` VALUES (205, 1, 'admin/salesummery', 'GET', '127.0.0.1', '[]', '2021-12-03 09:34:37', '2021-12-03 09:34:37');
INSERT INTO `admin_operation_log` VALUES (206, 1, 'admin/salesummery', 'GET', '127.0.0.1', '[]', '2021-12-03 09:35:40', '2021-12-03 09:35:40');
INSERT INTO `admin_operation_log` VALUES (207, 1, 'admin/salesummery', 'GET', '127.0.0.1', '[]', '2021-12-03 09:36:51', '2021-12-03 09:36:51');
INSERT INTO `admin_operation_log` VALUES (208, 1, 'admin/salesummery', 'GET', '127.0.0.1', '[]', '2021-12-03 09:37:58', '2021-12-03 09:37:58');
INSERT INTO `admin_operation_log` VALUES (209, 1, 'admin/salesummery', 'GET', '127.0.0.1', '[]', '2021-12-03 09:38:11', '2021-12-03 09:38:11');
INSERT INTO `admin_operation_log` VALUES (210, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2021-12-03 10:12:55', '2021-12-03 10:12:55');
INSERT INTO `admin_operation_log` VALUES (211, 1, 'admin/demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 10:12:58', '2021-12-03 10:12:58');
INSERT INTO `admin_operation_log` VALUES (212, 1, 'admin/salesummery', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 10:13:01', '2021-12-03 10:13:01');
INSERT INTO `admin_operation_log` VALUES (213, 1, 'admin/purchaseorders', 'GET', '127.0.0.1', '[]', '2021-12-03 11:31:28', '2021-12-03 11:31:28');
INSERT INTO `admin_operation_log` VALUES (214, 1, 'admin/fbawarehouse', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 11:31:42', '2021-12-03 11:31:42');
INSERT INTO `admin_operation_log` VALUES (215, 1, 'admin/fbawarehouse', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"FC\":null,\"COUNTRY\":\"UK\"}', '2021-12-03 11:31:45', '2021-12-03 11:31:45');
INSERT INTO `admin_operation_log` VALUES (216, 1, 'admin/fbawarehouse/1019', 'GET', '127.0.0.1', '[]', '2021-12-03 12:15:09', '2021-12-03 12:15:09');
INSERT INTO `admin_operation_log` VALUES (217, 1, 'admin/fbawarehouse', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 12:15:15', '2021-12-03 12:15:15');
INSERT INTO `admin_operation_log` VALUES (218, 1, 'admin/fbawarehouse', 'GET', '127.0.0.1', '[]', '2021-12-03 14:36:59', '2021-12-03 14:36:59');
INSERT INTO `admin_operation_log` VALUES (219, 1, 'admin/fbawarehouse', 'GET', '127.0.0.1', '[]', '2021-12-03 14:37:05', '2021-12-03 14:37:05');
INSERT INTO `admin_operation_log` VALUES (220, 1, 'admin/fbawarehouse', 'GET', '127.0.0.1', '[]', '2021-12-03 14:37:06', '2021-12-03 14:37:06');
INSERT INTO `admin_operation_log` VALUES (221, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 14:37:13', '2021-12-03 14:37:13');
INSERT INTO `admin_operation_log` VALUES (222, 1, 'admin/helpers/scaffold/table', 'POST', '127.0.0.1', '{\"db\":\"stephen\",\"tb\":\"purchase_order\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\"}', '2021-12-03 14:37:26', '2021-12-03 14:37:26');
INSERT INTO `admin_operation_log` VALUES (223, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"purchase_order\"}', '2021-12-03 14:37:26', '2021-12-03 14:37:26');
INSERT INTO `admin_operation_log` VALUES (224, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"cot\"}', '2021-12-03 14:40:30', '2021-12-03 14:40:30');
INSERT INTO `admin_operation_log` VALUES (225, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"c\"}', '2021-12-03 14:40:32', '2021-12-03 14:40:32');
INSERT INTO `admin_operation_log` VALUES (226, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":null}', '2021-12-03 14:40:33', '2021-12-03 14:40:33');
INSERT INTO `admin_operation_log` VALUES (227, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":null}', '2021-12-03 14:40:34', '2021-12-03 14:40:34');
INSERT INTO `admin_operation_log` VALUES (228, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"Prod\"}', '2021-12-03 14:40:40', '2021-12-03 14:40:40');
INSERT INTO `admin_operation_log` VALUES (229, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"Pro\"}', '2021-12-03 14:40:40', '2021-12-03 14:40:40');
INSERT INTO `admin_operation_log` VALUES (230, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"Product\"}', '2021-12-03 14:40:42', '2021-12-03 14:40:42');
INSERT INTO `admin_operation_log` VALUES (231, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"Product\"}', '2021-12-03 14:40:42', '2021-12-03 14:40:42');
INSERT INTO `admin_operation_log` VALUES (232, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":null}', '2021-12-03 14:40:45', '2021-12-03 14:40:45');
INSERT INTO `admin_operation_log` VALUES (233, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"product_in\"}', '2021-12-03 14:40:50', '2021-12-03 14:40:50');
INSERT INTO `admin_operation_log` VALUES (234, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"product_interest\"}', '2021-12-03 14:40:52', '2021-12-03 14:40:52');
INSERT INTO `admin_operation_log` VALUES (235, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"product_interest\",\"exist-table\":\"stephen|purchase_order\",\"model_name\":\"App\\\\Models\\\\ProductInterest\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\ProductInterestController\",\"repository_name\":\"App\\\\Admin\\\\Repositories\\\\ProductInterest\",\"create\":[\"migration\",\"model\",\"repository\",\"controller\",\"migrate\",\"lang\"],\"fields\":[{\"name\":\"image\",\"translation\":\"产品主图\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"产品主图\"},{\"name\":\"asin\",\"translation\":\"产品SKU\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"产品SKU\"},{\"name\":\"store\",\"translation\":\"店铺\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"店铺\"},{\"name\":\"bs_category\",\"translation\":\"类目\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"类目\"},{\"name\":\"amz_price\",\"translation\":\"产品售价\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"产品售价\"}],\"translate_title\":null,\"primary_key\":\"id\",\"timestamps\":\"1\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\"}', '2021-12-03 14:40:58', '2021-12-03 14:40:58');
INSERT INTO `admin_operation_log` VALUES (236, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2021-12-03 14:41:04', '2021-12-03 14:41:04');
INSERT INTO `admin_operation_log` VALUES (237, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2021-12-03 14:44:22', '2021-12-03 14:44:22');
INSERT INTO `admin_operation_log` VALUES (238, 1, 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"_current_\":\"http:\\/\\/localhost:8000\\/admin\\/helpers\\/scaffold?\",\"renderable\":\"App_Admin_Forms_AdminSetting\",\"_trans_\":\"scaffold\"}', '2021-12-03 14:44:25', '2021-12-03 14:44:25');
INSERT INTO `admin_operation_log` VALUES (239, 1, 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"name\":\"超凡ERP\",\"logo\":\"<img src=\\\"\\/vendor\\/dcat-admin\\/images\\/logo.png\\\" width=\\\"35\\\"> &nbsp;超凡ERP\",\"logo-mini\":\"<img src=\\\"\\/vendor\\/dcat-admin\\/images\\/logo.png\\\">\",\"lang\":\"zh_CN\",\"layout\":{\"color\":\"blue\",\"sidebar_style\":\"light\",\"body_class\":[null]},\"helpers\":{\"enable\":\"1\"},\"_form_\":\"App\\\\Admin\\\\Forms\\\\AdminSetting\",\"_current_\":\"http:\\/\\/localhost:8000\\/admin\\/helpers\\/scaffold?\",\"_payload_\":\"{\\\"_current_\\\":\\\"http:\\\\\\/\\\\\\/localhost:8000\\\\\\/admin\\\\\\/helpers\\\\\\/scaffold?\\\",\\\"renderable\\\":\\\"App_Admin_Forms_AdminSetting\\\",\\\"_trans_\\\":\\\"scaffold\\\"}\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\"}', '2021-12-03 14:44:28', '2021-12-03 14:44:28');
INSERT INTO `admin_operation_log` VALUES (240, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2021-12-03 14:44:30', '2021-12-03 14:44:30');
INSERT INTO `admin_operation_log` VALUES (241, 1, 'admin/productinterest', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 14:44:35', '2021-12-03 14:44:35');
INSERT INTO `admin_operation_log` VALUES (242, 1, 'admin/productinterest/create', 'GET', '127.0.0.1', '[]', '2021-12-03 14:44:38', '2021-12-03 14:44:38');
INSERT INTO `admin_operation_log` VALUES (243, 1, 'admin/productinterest/create', 'GET', '127.0.0.1', '[]', '2021-12-03 14:49:57', '2021-12-03 14:49:57');
INSERT INTO `admin_operation_log` VALUES (244, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"_id\":\"9nm3cnLJCAB0n07p\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\",\"upload_column\":\"image\",\"primary_key\":\"null\",\"id\":\"WU_FILE_0\",\"name\":\"image.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Fri Dec 03 2021 14:50:15 GMT+0800 (中国标准时间)\",\"size\":\"316430\"}', '2021-12-03 14:50:16', '2021-12-03 14:50:16');
INSERT INTO `admin_operation_log` VALUES (245, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"image\":\"images\\/image.png\",\"_file_\":null,\"country\":\"CA\",\"keyword\":\"Christmas Gift Storm Glass\",\"name\":\"Christmas Gift Storm Glass\",\"asin\":\"B09CTQMRSD\",\"store\":\"https:\\/\\/www.amazon.ca\\/s?k=christmas+decorations&crid=3TGBKGUEWD962&sprefix=christmas%2Caps%2C198&ref=nb_sb_noss_1\",\"bs_category\":null,\"amz_price\":\"40.99\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\"}', '2021-12-03 14:51:09', '2021-12-03 14:51:09');
INSERT INTO `admin_operation_log` VALUES (246, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"image\":\"images\\/image.png\",\"_file_\":null,\"country\":\"CA\",\"keyword\":\"Christmas Gift Storm Glass\",\"name\":\"Christmas Gift Storm Glass\",\"asin\":\"B09CTQMRSD\",\"store\":\"https:\\/\\/www.amazon.ca\\/s?k=christmas+decorations&crid=3TGBKGUEWD962&sprefix=christmas%2Caps%2C198&ref=nb_sb_noss_1\",\"bs_category\":null,\"amz_price\":\"40.99\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\"}', '2021-12-03 14:51:34', '2021-12-03 14:51:34');
INSERT INTO `admin_operation_log` VALUES (247, 1, 'admin/productinterest', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 14:51:35', '2021-12-03 14:51:35');
INSERT INTO `admin_operation_log` VALUES (248, 1, 'admin/productinterest/create', 'GET', '127.0.0.1', '[]', '2021-12-03 14:51:57', '2021-12-03 14:51:57');
INSERT INTO `admin_operation_log` VALUES (249, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"_id\":\"oTBAZgU9lhyuE70k\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\",\"upload_column\":\"image\",\"primary_key\":\"null\",\"id\":\"WU_FILE_0\",\"name\":\"image.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Fri Dec 03 2021 14:54:38 GMT+0800 (中国标准时间)\",\"size\":\"74057\"}', '2021-12-03 14:54:38', '2021-12-03 14:54:38');
INSERT INTO `admin_operation_log` VALUES (250, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"image\":\"images\\/925bdb1d6047ec97d80b12c4c03f4d16.png\",\"_file_\":null,\"country\":\"CA\",\"keyword\":\"AKETCH Garden Gnome Riding Motorcycle\",\"name\":null,\"asin\":\"B08NHBQDWN\",\"store\":\"https:\\/\\/www.amazon.ca\\/s?me=A1YL20KCNGOUAK&marketplaceID=A2EUQ1WTGCTBG2\",\"bs_category\":null,\"amz_price\":null,\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/productinterest\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\"}', '2021-12-03 14:54:49', '2021-12-03 14:54:49');
INSERT INTO `admin_operation_log` VALUES (251, 1, 'admin/productinterest', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 14:54:50', '2021-12-03 14:54:50');
INSERT INTO `admin_operation_log` VALUES (252, 1, 'admin/productinterest/create', 'GET', '127.0.0.1', '[]', '2021-12-03 14:55:30', '2021-12-03 14:55:30');
INSERT INTO `admin_operation_log` VALUES (253, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"_id\":\"z7Fau0qttUzhBXU9\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\",\"upload_column\":\"image\",\"primary_key\":\"null\",\"id\":\"WU_FILE_0\",\"name\":\"image.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Fri Dec 03 2021 14:55:34 GMT+0800 (中国标准时间)\",\"size\":\"103414\"}', '2021-12-03 14:55:34', '2021-12-03 14:55:34');
INSERT INTO `admin_operation_log` VALUES (254, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"image\":\"images\\/99f73d1651196bad9453562b39aa3fc7.png\",\"_file_\":null,\"country\":\"CA\",\"keyword\":null,\"name\":\"6pcs Fairies Miniature Figurines Accessories for Garden Decor, Fairy Garden Ornament\",\"asin\":\"B08J7P4MJ1\",\"store\":\"https:\\/\\/www.amazon.ca\\/s?me=A1YL20KCNGOUAK&marketplaceID=A2EUQ1WTGCTBG2\",\"bs_category\":null,\"amz_price\":null,\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/productinterest\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\"}', '2021-12-03 14:56:07', '2021-12-03 14:56:07');
INSERT INTO `admin_operation_log` VALUES (255, 1, 'admin/productinterest', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 14:56:08', '2021-12-03 14:56:08');
INSERT INTO `admin_operation_log` VALUES (256, 1, 'admin/productinterest/create', 'GET', '127.0.0.1', '[]', '2021-12-03 14:56:14', '2021-12-03 14:56:14');
INSERT INTO `admin_operation_log` VALUES (257, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"_id\":\"GP0unNjpXx3F0PkL\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\",\"upload_column\":\"image\",\"primary_key\":\"null\",\"id\":\"WU_FILE_0\",\"name\":\"image.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Fri Dec 03 2021 14:56:43 GMT+0800 (中国标准时间)\",\"size\":\"127356\"}', '2021-12-03 14:56:43', '2021-12-03 14:56:43');
INSERT INTO `admin_operation_log` VALUES (258, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"image\":\"images\\/dba90b9c756b5d64929bea2b9050b7b7.png\",\"_file_\":null,\"country\":\"CA\",\"keyword\":null,\"name\":\"Climbing Ladder Santa\",\"asin\":\"B09J195W5G\",\"store\":\"https:\\/\\/www.amazon.ca\\/s?me=A1YL20KCNGOUAK&marketplaceID=A2EUQ1WTGCTBG2\",\"bs_category\":null,\"amz_price\":\"18.99\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/productinterest\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\"}', '2021-12-03 14:57:22', '2021-12-03 14:57:22');
INSERT INTO `admin_operation_log` VALUES (259, 1, 'admin/productinterest', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 14:57:22', '2021-12-03 14:57:22');
INSERT INTO `admin_operation_log` VALUES (260, 1, 'admin/productinterest/create', 'GET', '127.0.0.1', '[]', '2021-12-03 14:57:25', '2021-12-03 14:57:25');
INSERT INTO `admin_operation_log` VALUES (261, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"_id\":\"tXIQul1y54F25vkD\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\",\"upload_column\":\"image\",\"primary_key\":\"null\",\"id\":\"WU_FILE_0\",\"name\":\"image.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Fri Dec 03 2021 14:58:40 GMT+0800 (中国标准时间)\",\"size\":\"127366\"}', '2021-12-03 14:58:40', '2021-12-03 14:58:40');
INSERT INTO `admin_operation_log` VALUES (262, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"image\":\"images\\/0bc95067fd6614194a25422d9bd8ec4f.png\",\"_file_\":null,\"country\":\"CA\",\"keyword\":null,\"name\":\"Merry Christmas Banner with 6 Swirl Decorations\",\"asin\":\"B08M9VQ8CM\",\"store\":\"https:\\/\\/www.amazon.ca\\/s?me=A3CIGUHU4OW0FZ&marketplaceID=A2EUQ1WTGCTBG2\",\"bs_category\":null,\"amz_price\":\"14.99\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/productinterest\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\"}', '2021-12-03 14:58:41', '2021-12-03 14:58:41');
INSERT INTO `admin_operation_log` VALUES (263, 1, 'admin/productinterest', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 14:58:42', '2021-12-03 14:58:42');
INSERT INTO `admin_operation_log` VALUES (264, 1, 'admin/productinterest/create', 'GET', '127.0.0.1', '[]', '2021-12-03 14:58:59', '2021-12-03 14:58:59');
INSERT INTO `admin_operation_log` VALUES (265, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"_id\":\"WQugCxOgw8HzE9g0\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\",\"upload_column\":\"image\",\"primary_key\":\"null\",\"id\":\"WU_FILE_0\",\"name\":\"image.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Fri Dec 03 2021 14:59:15 GMT+0800 (中国标准时间)\",\"size\":\"159484\"}', '2021-12-03 14:59:15', '2021-12-03 14:59:15');
INSERT INTO `admin_operation_log` VALUES (266, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"image\":\"images\\/63cba2a805eb83fb5a7d54d2b8171149.png\",\"_file_\":null,\"country\":\"CA\",\"keyword\":null,\"name\":\"ALINK Set of 4 Christmas Decorations 18 x 18 Inches Pillow Covers for Sofa Couch, Cushion Cover Case-Winter Deer, Christmas Tree, Wreath(Insert are not Included)\",\"asin\":\"B08MJ1S5BN\",\"store\":\"https:\\/\\/www.amazon.ca\\/s?me=A3JGBXS50GJKCE&marketplaceID=A2EUQ1WTGCTBG2\",\"bs_category\":null,\"amz_price\":null,\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/productinterest\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\"}', '2021-12-03 15:00:17', '2021-12-03 15:00:17');
INSERT INTO `admin_operation_log` VALUES (267, 1, 'admin/productinterest', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 15:00:17', '2021-12-03 15:00:17');
INSERT INTO `admin_operation_log` VALUES (268, 1, 'admin/productinterest/create', 'GET', '127.0.0.1', '[]', '2021-12-03 15:00:19', '2021-12-03 15:00:19');
INSERT INTO `admin_operation_log` VALUES (269, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"_id\":\"UQwYxOPKbpxx5JSf\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\",\"upload_column\":\"image\",\"primary_key\":\"null\",\"id\":\"WU_FILE_0\",\"name\":\"image.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Fri Dec 03 2021 15:01:05 GMT+0800 (中国标准时间)\",\"size\":\"156196\"}', '2021-12-03 15:01:05', '2021-12-03 15:01:05');
INSERT INTO `admin_operation_log` VALUES (270, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"image\":\"images\\/b9e9eea66159b71e78f5c14550cae10d.png\",\"_file_\":null,\"country\":\"CA\",\"keyword\":null,\"name\":\"LED Curtain Lights\",\"asin\":\"B09F5Y7PWP\",\"store\":\"https:\\/\\/www.amazon.ca\\/s?me=AFMZ6MX8X96XS&marketplaceID=A2EUQ1WTGCTBG2\",\"bs_category\":null,\"amz_price\":\"21.99\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/productinterest\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\"}', '2021-12-03 15:01:08', '2021-12-03 15:01:08');
INSERT INTO `admin_operation_log` VALUES (271, 1, 'admin/productinterest', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 15:01:08', '2021-12-03 15:01:08');
INSERT INTO `admin_operation_log` VALUES (272, 1, 'admin/productinterest/create', 'GET', '127.0.0.1', '[]', '2021-12-03 15:03:40', '2021-12-03 15:03:40');
INSERT INTO `admin_operation_log` VALUES (273, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"_id\":\"j9NtItENLxzrJz6j\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\",\"upload_column\":\"image\",\"primary_key\":\"null\",\"id\":\"WU_FILE_0\",\"name\":\"image.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Fri Dec 03 2021 15:03:43 GMT+0800 (中国标准时间)\",\"size\":\"104479\"}', '2021-12-03 15:03:43', '2021-12-03 15:03:43');
INSERT INTO `admin_operation_log` VALUES (274, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"image\":\"images\\/88f49b7c494b1f1093a80ba4c10d0965.png\",\"_file_\":null,\"country\":\"CA\",\"keyword\":null,\"name\":\"2021 Christmas Ceramic Ornaments, Two-Side Printed Cute Light String Christmas Hat Christmas Tree Hanging Ornament for Quarantine Gifts Presents, Christmas Tree Home Decorations\",\"asin\":\"B09GB9GX8V\",\"store\":\"https:\\/\\/www.amazon.ca\\/s?me=A24O83M48SXMJR&marketplaceID=A2EUQ1WTGCTBG2\",\"bs_category\":\"Party Garlands\",\"amz_price\":\"12.99\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/productinterest\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\"}', '2021-12-03 15:04:59', '2021-12-03 15:04:59');
INSERT INTO `admin_operation_log` VALUES (275, 1, 'admin/productinterest', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 15:04:59', '2021-12-03 15:04:59');
INSERT INTO `admin_operation_log` VALUES (276, 1, 'admin/productinterest/create', 'GET', '127.0.0.1', '[]', '2021-12-03 15:05:23', '2021-12-03 15:05:23');
INSERT INTO `admin_operation_log` VALUES (277, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"_id\":\"FMpOr2kppUGvrDNk\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\",\"upload_column\":\"image\",\"primary_key\":\"null\",\"id\":\"WU_FILE_0\",\"name\":\"image.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Fri Dec 03 2021 15:06:07 GMT+0800 (中国标准时间)\",\"size\":\"771667\"}', '2021-12-03 15:06:07', '2021-12-03 15:06:07');
INSERT INTO `admin_operation_log` VALUES (278, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"image\":\"images\\/ea3c30734fa772f54dd317ba71aff778.png\",\"_file_\":null,\"country\":\"CA\",\"keyword\":null,\"name\":null,\"asin\":\"B08HS1GTZQ\",\"store\":\"https:\\/\\/www.amazon.ca\\/s?me=A2DR8GYXFB3Y2X&marketplaceID=A2EUQ1WTGCTBG2\",\"bs_category\":null,\"amz_price\":\"37.99\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/productinterest\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\"}', '2021-12-03 15:06:36', '2021-12-03 15:06:36');
INSERT INTO `admin_operation_log` VALUES (279, 1, 'admin/productinterest', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 15:06:37', '2021-12-03 15:06:37');
INSERT INTO `admin_operation_log` VALUES (280, 1, 'admin/productinterest/create', 'GET', '127.0.0.1', '[]', '2021-12-03 15:07:06', '2021-12-03 15:07:06');
INSERT INTO `admin_operation_log` VALUES (281, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"_id\":\"AZtVD7v8pWx3fxt7\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\",\"upload_column\":\"image\",\"primary_key\":\"null\",\"id\":\"WU_FILE_0\",\"name\":\"image.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Fri Dec 03 2021 15:07:10 GMT+0800 (中国标准时间)\",\"size\":\"136644\"}', '2021-12-03 15:07:10', '2021-12-03 15:07:10');
INSERT INTO `admin_operation_log` VALUES (282, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"image\":\"images\\/10362cb0fa25887b5bbcddf68d2e42c4.png\",\"_file_\":null,\"country\":null,\"keyword\":null,\"name\":\"Gnome Christmas Ornaments Set of 3,Hanging Glowing Gnomes with Light for Christmas Tree,Swedish Gnome Plush Santa Xmas Decorations for Home Holiday Decor(3PCS)\",\"asin\":\"B09LS4H3YZ\",\"store\":\"https:\\/\\/www.amazon.ca\\/s?me=A6LQF31K94WX8&marketplaceID=A2EUQ1WTGCTBG2\",\"bs_category\":null,\"amz_price\":\"27.99\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/productinterest\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\"}', '2021-12-03 15:07:29', '2021-12-03 15:07:29');
INSERT INTO `admin_operation_log` VALUES (283, 1, 'admin/productinterest', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 15:07:29', '2021-12-03 15:07:29');
INSERT INTO `admin_operation_log` VALUES (284, 1, 'admin/productinterest/create', 'GET', '127.0.0.1', '[]', '2021-12-03 15:12:58', '2021-12-03 15:12:58');
INSERT INTO `admin_operation_log` VALUES (285, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"_id\":\"5pPV1a40NMKvZ5xO\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\",\"upload_column\":\"image\",\"primary_key\":\"null\",\"id\":\"WU_FILE_0\",\"name\":\"image.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Fri Dec 03 2021 15:13:11 GMT+0800 (中国标准时间)\",\"size\":\"524315\"}', '2021-12-03 15:13:11', '2021-12-03 15:13:11');
INSERT INTO `admin_operation_log` VALUES (286, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"image\":\"images\\/96a1ad07bcefa31135e2a78d88acbf7f.png\",\"_file_\":null,\"country\":null,\"keyword\":null,\"name\":\"Naler 10m Christmas Ornaments Beads, Christmas Tree Beads Strands for Christmas Decoration and DIY Craft Jewelry Making, Bridal Bouquet, Party Decor, Table Decoration - Shiny Beads Chain, Gold\",\"asin\":\"https:\\/\\/www.amazon.ca\\/Naler-Christmas-Ornaments-Strands-Decoration\\/dp\\/B08D5QLYJB\\/ref=zg_bs_13848651011_3\\/138-0052100-3973557?pd_rd_i=B08JGPNDNR&psc=1\",\"store\":null,\"bs_category\":null,\"amz_price\":\"14.99\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/productinterest\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\"}', '2021-12-03 15:13:27', '2021-12-03 15:13:27');
INSERT INTO `admin_operation_log` VALUES (287, 1, 'admin/productinterest', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 15:13:27', '2021-12-03 15:13:27');
INSERT INTO `admin_operation_log` VALUES (288, 1, 'admin/productinterest/create', 'GET', '127.0.0.1', '[]', '2021-12-03 15:15:09', '2021-12-03 15:15:09');
INSERT INTO `admin_operation_log` VALUES (289, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"_id\":\"duP5gPjs703SAAO9\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\",\"upload_column\":\"image\",\"primary_key\":\"null\",\"id\":\"WU_FILE_0\",\"name\":\"image.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Fri Dec 03 2021 15:15:22 GMT+0800 (中国标准时间)\",\"size\":\"956242\"}', '2021-12-03 15:15:22', '2021-12-03 15:15:22');
INSERT INTO `admin_operation_log` VALUES (290, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"image\":\"images\\/1b0481eab5814d1fd3608342fe75b0a5.png\",\"_file_\":null,\"country\":null,\"keyword\":null,\"name\":null,\"asin\":\"https:\\/\\/www.amazon.ca\\/Pre-Lit-Christmas-Decoration-Reindeer-Outdoor\\/dp\\/B09MCJMBNR\\/ref=zg_bs_13848651011_11\\/138-0052100-3973557?pd_rd_i=B09MCJMBNR&psc=1\",\"store\":null,\"bs_category\":null,\"amz_price\":\"66.49\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/productinterest\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\"}', '2021-12-03 15:15:29', '2021-12-03 15:15:29');
INSERT INTO `admin_operation_log` VALUES (291, 1, 'admin/productinterest', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 15:15:29', '2021-12-03 15:15:29');
INSERT INTO `admin_operation_log` VALUES (292, 1, 'admin/productinterest/create', 'GET', '127.0.0.1', '[]', '2021-12-03 15:15:50', '2021-12-03 15:15:50');
INSERT INTO `admin_operation_log` VALUES (293, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"_id\":\"MJhuqzM1hulkqOHt\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\",\"upload_column\":\"image\",\"primary_key\":\"null\",\"id\":\"WU_FILE_0\",\"name\":\"image.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Fri Dec 03 2021 15:16:03 GMT+0800 (中国标准时间)\",\"size\":\"394477\"}', '2021-12-03 15:16:03', '2021-12-03 15:16:03');
INSERT INTO `admin_operation_log` VALUES (294, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"image\":\"images\\/fdb4569c93c604ee7486e2ce4132bf37.png\",\"_file_\":null,\"country\":\"CA\",\"keyword\":null,\"name\":null,\"asin\":\"https:\\/\\/www.amazon.ca\\/TRRAPLE-Inflatables-Decorations-Inflatable-Decoration\\/dp\\/B08FQL7K6L\\/ref=zg_bs_13848651011_13\\/138-0052100-3973557?pd_rd_i=B08FQL7K6L&psc=1\",\"store\":null,\"bs_category\":null,\"amz_price\":null,\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/productinterest\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\"}', '2021-12-03 15:16:06', '2021-12-03 15:16:06');
INSERT INTO `admin_operation_log` VALUES (295, 1, 'admin/productinterest', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 15:16:06', '2021-12-03 15:16:06');
INSERT INTO `admin_operation_log` VALUES (296, 1, 'admin/productinterest/create', 'GET', '127.0.0.1', '[]', '2021-12-03 15:16:13', '2021-12-03 15:16:13');
INSERT INTO `admin_operation_log` VALUES (297, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"_id\":\"BominesspNaH8FWQ\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\",\"upload_column\":\"image\",\"primary_key\":\"null\",\"id\":\"WU_FILE_0\",\"name\":\"image.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Fri Dec 03 2021 15:16:25 GMT+0800 (中国标准时间)\",\"size\":\"842986\"}', '2021-12-03 15:16:25', '2021-12-03 15:16:25');
INSERT INTO `admin_operation_log` VALUES (298, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"image\":\"images\\/8a942d710de4186e31c3f006275c6e0f.png\",\"_file_\":null,\"country\":\"CA\",\"keyword\":null,\"name\":\"Christmas Lighted Gift Boxes Set of 3, 48 LED Lighted Gift Boxes for Indoor & Outdoor Christmas Decor, Collapsible Decorations with Timer Outdoor Lighted Christmas Decorations\",\"asin\":\"https:\\/\\/www.amazon.ca\\/Christmas-Lighted-Gift-Collapsible-Decorations\\/dp\\/B09FKDNQ91\\/ref=zg_bs_13848651011_16\\/138-0052100-3973557?pd_rd_i=B09M8CT3WZ&psc=1\",\"store\":null,\"bs_category\":null,\"amz_price\":null,\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/productinterest\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\"}', '2021-12-03 15:16:43', '2021-12-03 15:16:43');
INSERT INTO `admin_operation_log` VALUES (299, 1, 'admin/productinterest', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 15:16:43', '2021-12-03 15:16:43');
INSERT INTO `admin_operation_log` VALUES (300, 1, 'admin/productinterest/create', 'GET', '127.0.0.1', '[]', '2021-12-03 15:17:20', '2021-12-03 15:17:20');
INSERT INTO `admin_operation_log` VALUES (301, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"_id\":\"bcn0eiXZMb7wAmBY\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\",\"upload_column\":\"image\",\"primary_key\":\"null\",\"id\":\"WU_FILE_0\",\"name\":\"image.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Fri Dec 03 2021 15:17:38 GMT+0800 (中国标准时间)\",\"size\":\"334964\"}', '2021-12-03 15:17:39', '2021-12-03 15:17:39');
INSERT INTO `admin_operation_log` VALUES (302, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"image\":\"images\\/c0bd423e832640a57916512a10436624.png\",\"_file_\":null,\"country\":\"CA\",\"keyword\":null,\"name\":\"Sopcone 16Pcs Snowman Decorating Kit, Large Snowman Making Kit Snowman Dressing Up Kit Winter Outdoor Kids Fun Toys Christmas Includes Hat Scarf Nose Pipe Eyes Mouth and Buttons\",\"asin\":\"https:\\/\\/www.amazon.ca\\/Sopcone-Snowman-Decorating-Dressing-Christmas\\/dp\\/B08PBP41WG\\/ref=zg_bs_13848651011_17\\/138-0052100-3973557?pd_rd_i=B08PBP41WG&psc=1\",\"store\":null,\"bs_category\":null,\"amz_price\":null,\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/productinterest\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\"}', '2021-12-03 15:17:46', '2021-12-03 15:17:46');
INSERT INTO `admin_operation_log` VALUES (303, 1, 'admin/productinterest', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 15:17:46', '2021-12-03 15:17:46');
INSERT INTO `admin_operation_log` VALUES (304, 1, 'admin/productinterest/create', 'GET', '127.0.0.1', '[]', '2021-12-03 15:18:59', '2021-12-03 15:18:59');
INSERT INTO `admin_operation_log` VALUES (305, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"_id\":\"l5dWWPmy3AFbRTt3\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\",\"upload_column\":\"image\",\"primary_key\":\"null\",\"id\":\"WU_FILE_0\",\"name\":\"image.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Fri Dec 03 2021 15:19:12 GMT+0800 (中国标准时间)\",\"size\":\"498627\"}', '2021-12-03 15:19:12', '2021-12-03 15:19:12');
INSERT INTO `admin_operation_log` VALUES (306, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"image\":\"images\\/baeb724fdaf38982ee0d2f02b12f0269.png\",\"_file_\":null,\"country\":\"CA\",\"keyword\":null,\"name\":\"Quntis Star Curtain Lights, Connectable 180 LEDs Christmas Curtain Lights with 8 Flashing Modes, Waterproof Christmas Star Fairy Lights, Indoor Outdoor Curtain Fairy Lights Plug in for Window Bedroom Wall Wedding Christmas Decorations, Colorful\",\"asin\":\"https:\\/\\/www.amazon.ca\\/Quntis-Connectable-Waterproof-Christmas-Decorations\\/dp\\/B08ZYCMSBQ\\/ref=zg_bs_3130336011_5\\/138-0052100-3973557?pd_rd_i=B09KRSQQL4&psc=1\",\"store\":null,\"bs_category\":null,\"amz_price\":null,\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/productinterest\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\"}', '2021-12-03 15:19:21', '2021-12-03 15:19:21');
INSERT INTO `admin_operation_log` VALUES (307, 1, 'admin/productinterest', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 15:19:22', '2021-12-03 15:19:22');
INSERT INTO `admin_operation_log` VALUES (308, 1, 'admin/productinterest/create', 'GET', '127.0.0.1', '[]', '2021-12-03 15:23:03', '2021-12-03 15:23:03');
INSERT INTO `admin_operation_log` VALUES (309, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"_id\":\"FLuONau1jkyaJ2OX\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\",\"upload_column\":\"image\",\"primary_key\":\"null\",\"id\":\"WU_FILE_0\",\"name\":\"image.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Fri Dec 03 2021 15:23:15 GMT+0800 (中国标准时间)\",\"size\":\"274968\"}', '2021-12-03 15:23:15', '2021-12-03 15:23:15');
INSERT INTO `admin_operation_log` VALUES (310, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"image\":\"images\\/6c9350c4847d117f62989ec0a817194b.png\",\"_file_\":null,\"country\":null,\"keyword\":null,\"name\":null,\"asin\":\"https:\\/\\/www.amazon.ca\\/Hallmark-Nightmare-Christmas-Ornament-0002HCM9586\\/dp\\/B0921MFMKP\\/ref=zg_bs_6647208011_1\\/138-0052100-3973557?pd_rd_i=B0921MFMKP&psc=1\",\"store\":null,\"bs_category\":null,\"amz_price\":\"8.89\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/productinterest\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\"}', '2021-12-03 15:23:21', '2021-12-03 15:23:21');
INSERT INTO `admin_operation_log` VALUES (311, 1, 'admin/productinterest', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 15:23:21', '2021-12-03 15:23:21');
INSERT INTO `admin_operation_log` VALUES (312, 1, 'admin/productinterest/create', 'GET', '127.0.0.1', '[]', '2021-12-03 15:23:34', '2021-12-03 15:23:34');
INSERT INTO `admin_operation_log` VALUES (313, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"_id\":\"cJs4he01wdnHJ5NX\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\",\"upload_column\":\"image\",\"primary_key\":\"null\",\"id\":\"WU_FILE_0\",\"name\":\"image.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Fri Dec 03 2021 15:23:36 GMT+0800 (中国标准时间)\",\"size\":\"697657\"}', '2021-12-03 15:23:36', '2021-12-03 15:23:36');
INSERT INTO `admin_operation_log` VALUES (314, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"image\":\"images\\/91e7eb4c18a2577b91a6c64832ad512c.png\",\"_file_\":null,\"country\":\"CA\",\"keyword\":null,\"name\":\"2021 Christmas Ornaments Merch Gifts for Women Men Merchandise Kids Stocking Stuffers Xmas Tree Decor Clearance Keepsake Hanging Decorations\",\"asin\":\"https:\\/\\/www.amazon.ca\\/Christmas-Ornaments-Merchandise-Clearance-Decorations\\/dp\\/B09KH85DD2\\/ref=zg_bs_6647208011_5\\/138-0052100-3973557?pd_rd_i=B09KH58JYN&psc=1\",\"store\":null,\"bs_category\":null,\"amz_price\":null,\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/productinterest\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\"}', '2021-12-03 15:24:33', '2021-12-03 15:24:33');
INSERT INTO `admin_operation_log` VALUES (315, 1, 'admin/productinterest', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 15:24:33', '2021-12-03 15:24:33');
INSERT INTO `admin_operation_log` VALUES (316, 1, 'admin/productinterest/create', 'GET', '127.0.0.1', '[]', '2021-12-03 15:24:37', '2021-12-03 15:24:37');
INSERT INTO `admin_operation_log` VALUES (317, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"_id\":\"UoNG1jRAFpNg2VsU\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\",\"upload_column\":\"image\",\"primary_key\":\"null\",\"id\":\"WU_FILE_0\",\"name\":\"image.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Fri Dec 03 2021 15:24:48 GMT+0800 (中国标准时间)\",\"size\":\"268203\"}', '2021-12-03 15:24:48', '2021-12-03 15:24:48');
INSERT INTO `admin_operation_log` VALUES (318, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"image\":\"images\\/e4e018ec4a7eefbfd7d9a55e395462e8.png\",\"_file_\":null,\"country\":null,\"keyword\":null,\"name\":null,\"asin\":\"https:\\/\\/www.amazon.ca\\/Hallmark-Keepsake-Christmas-Year-Dated-Porcelain\\/dp\\/B08K3MXJ67\\/ref=zg_bs_6647208011_7\\/138-0052100-3973557?pd_rd_i=B08K3MXJ67&psc=1\",\"store\":null,\"bs_category\":null,\"amz_price\":null,\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/productinterest\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\"}', '2021-12-03 15:24:53', '2021-12-03 15:24:53');
INSERT INTO `admin_operation_log` VALUES (319, 1, 'admin/productinterest', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 15:24:54', '2021-12-03 15:24:54');
INSERT INTO `admin_operation_log` VALUES (320, 1, 'admin/productinterest/create', 'GET', '127.0.0.1', '[]', '2021-12-03 15:25:03', '2021-12-03 15:25:03');
INSERT INTO `admin_operation_log` VALUES (321, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"_id\":\"SDCXISsIMT0PKDcc\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\",\"upload_column\":\"image\",\"primary_key\":\"null\",\"id\":\"WU_FILE_0\",\"name\":\"image.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Fri Dec 03 2021 15:25:05 GMT+0800 (中国标准时间)\",\"size\":\"530297\"}', '2021-12-03 15:25:05', '2021-12-03 15:25:05');
INSERT INTO `admin_operation_log` VALUES (322, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"image\":\"images\\/5e67ed23fed37ed36aef4c31d4646912.png\",\"_file_\":null,\"country\":\"CA\",\"keyword\":null,\"name\":null,\"asin\":\"https:\\/\\/www.amazon.ca\\/Christmas-Ceramic-Ornament-Berries-Decorations\\/dp\\/B09GB8X7DZ\\/ref=zg_bs_6647208011_8\\/138-0052100-3973557?pd_rd_i=B09GBCS1KH&psc=1\",\"store\":null,\"bs_category\":null,\"amz_price\":null,\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/productinterest\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\"}', '2021-12-03 15:25:23', '2021-12-03 15:25:23');
INSERT INTO `admin_operation_log` VALUES (323, 1, 'admin/productinterest', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 15:25:24', '2021-12-03 15:25:24');
INSERT INTO `admin_operation_log` VALUES (324, 1, 'admin/productinterest/create', 'GET', '127.0.0.1', '[]', '2021-12-03 15:27:14', '2021-12-03 15:27:14');
INSERT INTO `admin_operation_log` VALUES (325, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"_id\":\"NBoxvOjUoJh6tSrx\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\",\"upload_column\":\"image\",\"primary_key\":\"null\",\"id\":\"WU_FILE_0\",\"name\":\"image.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Fri Dec 03 2021 15:27:25 GMT+0800 (中国标准时间)\",\"size\":\"378374\"}', '2021-12-03 15:27:25', '2021-12-03 15:27:25');
INSERT INTO `admin_operation_log` VALUES (326, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"image\":\"images\\/a0e4ed79082c2cf395e8ef223623fd26.png\",\"_file_\":null,\"country\":null,\"keyword\":null,\"name\":\"Personalized Engraved Customized Snowbaby with Snowflake Ornament 2021 Baby\'s First Christmas for Christmas Tree Holiday Family Party Decoration\",\"asin\":\"https:\\/\\/www.amazon.ca\\/Personalized-Customized-Snowflake-Christmas-Decoration\\/dp\\/B09LQ7GR83\\/ref=zg_bs_6647208011_10\\/138-0052100-3973557?pd_rd_i=B09LQ7GR83&psc=1\",\"store\":null,\"bs_category\":null,\"amz_price\":\"21\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/productinterest\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\"}', '2021-12-03 15:27:38', '2021-12-03 15:27:38');
INSERT INTO `admin_operation_log` VALUES (327, 1, 'admin/productinterest', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 15:27:38', '2021-12-03 15:27:38');
INSERT INTO `admin_operation_log` VALUES (328, 1, 'admin/productinterest/create', 'GET', '127.0.0.1', '[]', '2021-12-03 15:28:02', '2021-12-03 15:28:02');
INSERT INTO `admin_operation_log` VALUES (329, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"_id\":\"kN0zkY9WAYZ8gFln\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\",\"upload_column\":\"image\",\"primary_key\":\"null\",\"id\":\"WU_FILE_0\",\"name\":\"image.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Fri Dec 03 2021 15:28:16 GMT+0800 (中国标准时间)\",\"size\":\"292514\"}', '2021-12-03 15:28:16', '2021-12-03 15:28:16');
INSERT INTO `admin_operation_log` VALUES (330, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"image\":\"images\\/748fe20d7edc5ecbfdf23426ae5c2158.png\",\"_file_\":null,\"country\":\"CA\",\"keyword\":null,\"name\":\"Hallmark Keepsake Christmas Ornament 2021, I Want a Hippopotamus for Christmas, Musical Multi-Color 1999QGO2142\",\"asin\":null,\"store\":null,\"bs_category\":null,\"amz_price\":\"22\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/productinterest\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\"}', '2021-12-03 15:28:25', '2021-12-03 15:28:25');
INSERT INTO `admin_operation_log` VALUES (331, 1, 'admin/productinterest', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 15:28:26', '2021-12-03 15:28:26');
INSERT INTO `admin_operation_log` VALUES (332, 1, 'admin/productinterest/create', 'GET', '127.0.0.1', '[]', '2021-12-03 15:30:29', '2021-12-03 15:30:29');
INSERT INTO `admin_operation_log` VALUES (333, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"_id\":\"IjxPrbhOPOwEPd0l\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\",\"upload_column\":\"image\",\"primary_key\":\"null\",\"id\":\"WU_FILE_0\",\"name\":\"image.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Fri Dec 03 2021 15:37:54 GMT+0800 (中国标准时间)\",\"size\":\"537220\"}', '2021-12-03 15:37:55', '2021-12-03 15:37:55');
INSERT INTO `admin_operation_log` VALUES (334, 1, 'admin/productinterest', 'POST', '127.0.0.1', '{\"image\":\"images\\/07ebef66cf6feae589510d6587d49cf0.png\",\"_file_\":null,\"country\":\"CA\",\"keyword\":null,\"name\":null,\"asin\":\"https:\\/\\/www.amazon.ca\\/Stickers-Waterproof-Skateboard-Aesthetic-Journaling\\/dp\\/B0953KN6V7\\/ref=zg_bs_13848625011_2\\/138-0052100-3973557?pd_rd_i=B09C5D4CZK&psc=1\",\"store\":null,\"bs_category\":null,\"amz_price\":null,\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/productinterest\",\"_token\":\"Rl5O1B2rGiFCf5EPwcYYqxTHSVNVoHDK9AUislOy\"}', '2021-12-03 15:53:02', '2021-12-03 15:53:02');
INSERT INTO `admin_operation_log` VALUES (335, 1, 'admin/productinterest', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 15:53:02', '2021-12-03 15:53:02');

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
-- Table structure for currency
-- ----------------------------
DROP TABLE IF EXISTS `currency`;
CREATE TABLE `currency`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '币种',
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '兑换人民币汇率',
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of currency
-- ----------------------------
INSERT INTO `currency` VALUES (1, 'US', '6.3', '');
INSERT INTO `currency` VALUES (2, 'DE', '7.3', '');
INSERT INTO `currency` VALUES (3, 'FR', '7.3', '');
INSERT INTO `currency` VALUES (4, 'AU', '5.0', '');
INSERT INTO `currency` VALUES (5, 'CA', '5.1', '');
INSERT INTO `currency` VALUES (6, 'JP', '0.056', '');
INSERT INTO `currency` VALUES (8, 'UK', '9.0', '');

-- ----------------------------
-- Table structure for demand
-- ----------------------------
DROP TABLE IF EXISTS `demand`;
CREATE TABLE `demand`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '需求标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '需求描述',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '需求类型',
  `status` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '状态',
  `reply` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '开发回复',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of demand
-- ----------------------------
INSERT INTO `demand` VALUES (1, '产品列表问题', 'in111111111111![](http://localhost:8000/uploads/markdown/images/fffb5a7b54ac537fbce8309e869bd72461a9662ade940.jpg)', 2, 0, NULL, '2021-12-03 08:36:58', '2021-12-03 08:36:58');

-- ----------------------------
-- Table structure for f_c_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `f_c_warehouse`;
CREATE TABLE `f_c_warehouse`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `COUNTRY` enum('USA','CA','JP','UK','ES','DE','FR','IT','AU','JK','IN','SG') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'USA' COMMENT '国家',
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
) ENGINE = InnoDB AUTO_INCREMENT = 1383 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of f_c_warehouse
-- ----------------------------
INSERT INTO `f_c_warehouse` VALUES (860, 'USA', 'GOLDEN STATE FC LLC', 'ONT8', '92551', 'CA', 'MORENO VALLEY', '24300 NANDINA AVE', 'Sort', 'USLAX', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (861, 'USA', 'GOLDEN STATE FC LLC', 'LGB8', '92376', 'CA', 'RIALTO', '1568 NORTH LINDEN AVENUE', 'Sort', 'USLAX', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (862, 'USA', 'AMAZON.COM.INDC LLC', 'IND2', '46168', 'IN', 'PLAINFIELD', '715 AIRTECH PKWY', 'Non-sort', 'USCHI', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (863, 'USA', 'AMAZON.COM INDC LLC', 'IND5', '46168', 'IN', 'PLAINFIELD', '800 PERRY ROAD', 'Non-sort', 'USCHI', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (864, 'USA', 'AMAZON.COM.DEDC LLC', 'MDW6', '60446', 'IL', 'ROMEOVILLE', '1125 W REMINGTON BLVD', 'Non-sort', 'USCHI', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (865, 'USA', 'AMAZON.COM.DEDC LLC', 'MDW8', '60085', 'IL', 'WAUKEGAN', '1750 BRIDGE DRIVE', 'HB', 'USCHI', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (866, 'USA', 'AMAZON.COM.DEDC LLC', 'MDW9', '60502', 'IL', 'AURORA', '2865 DUKE PARKWAY', 'Non-sort', 'USCHI', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (867, 'USA', 'AMAZON.COM.KSDC LLC', 'MKC4', '66021', 'KS', 'EDGERTON', '19645 WAVERLY RD', 'Non-sort', 'USMKC', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (868, 'USA', 'AMAZON.COM.DEDC LLC', 'STL4', '62025', 'IL', 'EDWARDSVILLE', '3050 GATEWAY COMMERCE CENTER DR S', 'Non-sort', 'USSTL', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (869, 'USA', 'AMAZON.COM.KYDC LLC', 'HOU3', '77423', 'TX', 'BROOKSHIRE', '31555 HIGHWAY 90 E', 'Non-sort', 'USHOU', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (870, 'USA', 'AMAZON.COM.KYDC LLC', 'DFW6', '75019', 'TX', 'COPPELL', '940 W BETHEL ROAD', 'Non-sort', 'USDFW', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (871, 'USA', 'AMAZON.COM.DEDC LLC', 'ABE3', '18031', 'PA', 'Breinigsville', '650 Boulder Drive', 'Shoes', 'USNYC', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (872, 'USA', 'AMAZON.COM.INDC LLC', 'SDF8', '47130', 'IN', 'JEFFERSONVILLE', '900 PATROL RD', NULL, 'USCHI', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (873, 'USA', 'AMAZON.COM.DEDC, INC', 'ABE2', '18031', 'PA', 'BREINIGSVILLE', '705 BOULDER DRIVE', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (874, 'USA', 'AMAZON.COM.DEDC LLC', 'MDT2', '21901', 'MD', 'NORTH EAST', '600 PRINCIPIO PARKWAY WEST', 'Shoes', 'USNYC', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (875, 'USA', 'AMAZON.COM.DEDC LLC', 'BFI7', '98390', 'WA', 'SUMNER', '1901 140TH AVE E', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (876, 'USA', 'AMAZON.COM.KYDC LLC', 'FTW2', '75019', 'TX', 'COPPELL', '2701 WEST BETHEL ROAD', 'HB', 'USDFW', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (877, 'USA', 'AMAZON.COM.DEDC LLC', 'ATL8', '30122', 'GA', 'LITHIA SPRINGS', '2201 THORNTON ROAD', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (878, 'USA', 'GOLDEN STATE FC LLC', 'LGB6', '92518', 'CA', 'RIVERSIDE', '20901 KRAMERIA AVE', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (879, 'USA', 'GOLDEN STATE FC LLC', 'ONT9', '92374', 'CA', 'REDLANDS', '2125 WEST SAN BERNARDINO AVE', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (880, 'USA', 'GOLDEN STATE FC LLC', 'SNA4', '92376', 'CA', 'RIALTO', '2496 W WALNUT AVE', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (881, 'USA', 'GOLDEN STATE FC LLC', 'LAX9', '92337', 'CA', 'FONTANA', '11263 OLEANDER AVE', 'Sort', 'USLAX', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (882, 'USA', 'AMAZON.COM.INDC LLC', 'IND4', '46231', 'IN', 'INDIANAPOLIS', '710 SOUTH GIRLS SCHOOL ROAD', 'Shoes', 'USCHI', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (883, 'USA', 'GOLDEN STATE FC LLC', 'ONT2', '92408', 'CA', 'SAN BERNARDINO', '1910 E CENTRAL AVE', 'Shoes', 'USLAX', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (884, 'USA', 'AMAZON.COM.DEDC LLC', 'FTW9', '75019', 'TX', 'COPPELL', '944 WEST SANDY LAKE ROAD', 'Shoes', 'USDFW', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (885, 'USA', 'GOLDEN STATE FC LLC', 'ONT6', '92551', 'CA', 'MORENO VALLEY', '24208 SAN MICHELE RD', 'Shoes', 'USLAX', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (886, 'USA', 'GOLDEN STATE FC LLC', 'XIX6', '92337', 'CA', 'FONTANA', '10681 PRODUCTION AVE', 'Non-sort', 'USLAX', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (887, 'USA', 'AMAZON.COM.AZDC INC', 'PHX3', '85043', 'AZ', 'PHOENIX', '6835 WEST BUCKEYE ROAD', 'Shoes', 'USLAX', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (888, 'USA', 'GOLDEN STATE FC LLC', 'SMF3', '95206', 'CA', 'STOCKTON', '3923 S B STREET', 'Sort', 'USOAK', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (889, 'USA', 'GOLDEN STATE FC LLC', 'GSP1 ', '29303', 'SC', 'SPARTANBURG', '402 JOHN DODD RD', 'Non-sort', 'USSAV', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (890, 'USA', 'GOLDEN STATE FC LLC', 'CLT3', '28027', 'NC', 'CONCORD', '6500 DAVIDSON HWY', 'Non-sort', 'USSAV', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (891, 'USA', 'AMAZON.COM.DEDC LLC', 'MGE3', '30549', 'GA', 'JEFFERSON', '808 HOG MOUNTAIN ROAD', 'Non-sort', 'USSAV', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (892, 'USA', 'AMAZON.COM.DEDC LLC', 'MDT1', '17015', 'PA', 'CARLISLE', '2 AMES DRIVE', 'Non-sort', 'USBWI', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (893, 'USA', 'AMAZON.COM.DEDC LLC', 'BWI4', '22624', 'VA', 'CLEAR BROOK', '165 BUSINESS BLVD', 'Non-sort', 'USBWI', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (894, 'USA', 'GOLDEN STATE FC LLC', 'ABE8', '8518', 'NJ', 'Florence', '309 Cedar Lane', 'Sort', 'USNYC', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (895, 'USA', 'GOLDEN STATE FC LLC', 'AVP1', '18202', 'PA', 'Hazleton', '550 Oak Ridge Rd', 'Sort', 'USNYC', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (896, 'USA', 'GOLDEN STATE FC LLC', 'IND9', '46143', 'IN', 'Greenwood', '1151 South Graham Road', 'Sort', 'USCHI', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (897, 'USA', 'GOLDEN STATE FC LLC', 'MDW2', '60433', 'IL', 'Joliet', '250 Emerald Drive', 'Sort', 'USCHI', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (898, 'USA', 'AMAZON.COM.DEDC LLC', 'PDX7', '97317', 'OR', 'SALEM', '4775 DEPOT CT SE', 'Non-sort', 'USSEA', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (899, 'USA', 'AMAZON.COM.DEDC LLC', 'ABE4', '18045', 'PA', 'EASTON', '1610 VAN BUREN ROAD', 'Non-sort', 'USNYC', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (900, 'USA', 'GOLDEN STATE FC LLC', 'SBD3', '92407', 'CA', 'SAN BERNARDINO', '5990 N Cajon Blvd', 'Non-sort', 'USLAX', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (901, 'USA', 'GOLDEN STATE FC LLC', 'LAS1', '89044', 'NV', 'Henderson', '12300 Bermuda Road,', 'Sort', 'USLAX', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (902, 'USA', 'GOLDEN STATE FC LLC', 'PHX8', '85043', 'AZ', 'Phoenix', '800 North 75th Ave', 'Sort', 'USLAX', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (903, 'USA', 'GOLDEN STATE FC LLC', 'LGB9', '92571', 'CA', 'Perris', '4375 North Perris Boulevard', 'HB', 'USLAX', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (904, 'USA', 'GOLDEN STATE FC LLC', 'CLT2', '28214', 'NC', 'Charlotte', '10240 Old Dowd Road', 'Sort', 'USSAV', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (905, 'USA', 'GOLDEN STATE FC LLC', 'TEB9', '8873', 'NJ', 'Somerset', '601 Randolph Road', 'Sort', 'USNYC', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (906, 'USA', 'AMAZON.COM.KYDC LLC', 'FTW1', '75241', 'TX', 'Dallas', '33333 LBJ Freeway', 'Sort', 'USDAL', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (907, 'USA', 'GOLDEN STATE FC LLC', 'LGB4', '92374', 'CA', 'Redlands', '27517 Pioneer Avenue', 'Non-sort', 'USLAX', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (908, 'USA', 'GOLDEN STATE FC LLC', 'SBD2', '92408', 'CA', 'San Bernardino', '1494 South Waterman Avenue', 'Non-sort', 'USLAX', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (909, 'USA', 'GOLDEN STATE FC LLC', 'TEB3', '8873', 'NJ', 'Logan', '2651 Oldmans Creek Road', 'Non-sort', 'USNYC', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (910, 'USA', 'GOLDEN STATE FC LLC', 'TEB6', '8512', 'NJ', 'Cranbury Township', '22 Highstown-Cranbury Station Road', 'Non-sort', 'USNYC', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (911, 'USA', 'GOLDEN STATE FC LLC', 'SJC7', '95377', 'CA', 'Tracy', '188 S Mountain House Parkway', 'Non-sort', 'USOAK', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (912, 'USA', 'GOLDEN STATE FC LLC', 'SCK1', '95215', 'CA', 'Stockton', '4532 Newcastle Road', 'Non-sort', 'USOAK', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (913, 'USA', 'AMAZON.COM.DEDC LLC', 'JVL1', '53511', 'WI', 'Beloit', '1255 Gateway Boulevard', 'Non-sort', 'USCHI', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (914, 'USA', 'AMAZON.COM.DEDC LLC', 'ORD2', '60410', 'IL', 'Channahon', '23714 West Amoco Road', 'Non-sort', 'USCHI', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (915, 'USA', 'AMAZON.COM.DEDC LLC', 'RIC1', '23803', 'VA', 'Petersburg', '5000 Commerce Way', 'Non-sort', 'USORF', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (916, 'USA', 'AMAZON.COM.DEDC LLC', 'DCA6', '21219', 'MD', 'Baltimore', '6001 Bethlehem Boulevard', 'Non-sort', 'USBWI', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (917, 'USA', 'GOLDEN STATE FC LLC', 'JAX3', '32221', 'FL', 'Jacksonville', '13333 103rd Street', 'Non-sort', 'USJAX', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (918, 'USA', 'GOLDEN STATE FC LLC', 'MCO2', '32725', 'FL', 'Deltona', '2600 North Normandy Boulevard', 'Non-sort', 'USJAX', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (919, 'USA', 'AMAZON.COM.DEDC LLC', 'AVP3', '18424', 'PA', 'Gouldsboro', '298 First Avenue', 'HB', 'USNYC', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (920, 'USA', 'AMAZON.COM.DEDC LLC', 'STL6', '62025', 'IL', 'Edwardsville', '3931 Lakeview Corporate Drive', 'HB', 'USSTL', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (921, 'USA', 'GOLDEN STATE FC LLC', 'TTN2', '8512', 'NJ', 'Cranbury', '343 Half Acre Road', 'HB', 'USNYC', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (922, 'USA', 'AMAZON.COM.KYDC LLC', 'FTW3', '76244', 'TX', 'Fort Worth', '15201 Heritage Parkway', 'Shoes', 'USDAL', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (923, 'USA', 'AMAZON.COM.KYDC LLC', 'DAL2', '75261', 'TX', 'Dallas', '2601 South Airfield Drive', 'Shoes', 'USDAL', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (924, 'USA', 'AMAZON.COM.DEDC LLC', 'RDG1', '19526', 'PA', 'Hamburg', '3563 Mountain Road', 'Shoes', 'USNYC', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (925, 'USA', 'GOLDEN STATE FC LLC', 'XLX2', '92571', 'CA', 'PERRIS', '657 WEST NANCE STEET', 'HB', NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (926, 'USA', 'GOLDEN STATE FC LLC', 'ACY2', '8016', 'NJ', NULL, '1101 EAST PEARL STREET,BURLINGTON,NJ', 'Non-sort', NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (927, 'USA', 'Amazon.com Services LLC', 'OLM1', '98516', 'WA', 'OLYMPIA', '3300 Hogum Bay Road NE', 'Non-sort', 'USSEA', NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (928, 'USA', NULL, 'PHX5', '85338', 'AZ', 'Goodyear', '16920 W Commerce Drive', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (929, 'USA', NULL, 'PHX6', '85043', 'AZ', 'Phoenix', '4750 West Mohave St', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (930, 'USA', NULL, 'PHX7', '85043', 'AZ', 'Phoenix', '800 N 75th Ave', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (931, 'USA', NULL, 'OAK4', '95376', 'CA', 'Tracy', '1555 N. Chrisman Rd', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (932, 'USA', NULL, 'OAK3', '95363', 'CA', 'Patterson', '255 Park Center Drive', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (933, 'USA', NULL, 'XUSD', '95206', 'CA', 'Stockton', '1909 Zephyr St', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (934, 'USA', NULL, 'LGB3', '91752', 'CA', 'Eastvale', '4950 Goodman Way', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (935, 'USA', NULL, 'SMF1', '95837', 'CA', 'Sacramento', '4900 W Elkhorn Blvd', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (936, 'USA', NULL, 'BDL1', '6095', 'CT', 'Windsor', '801 Day Hill Rd.', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (937, 'USA', NULL, 'PHL1', '19720', 'DE', 'New Castle', '1 Centerpoint Blvd.', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (938, 'USA', NULL, 'PHL3', '19720', 'DE', 'New Castle', '1600 Johnson Way', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (939, 'USA', NULL, 'PHL7', '19709', 'DE', 'Middletown', '560 Merrimac Ave', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (940, 'USA', NULL, 'PHL8', '19709', 'DE', 'Middletown', '727 N Broad St', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (941, 'USA', NULL, 'TPA1', '33570', 'FL', 'Ruskin', '3350 Laurel Ridge Ave.', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (942, 'USA', NULL, 'TPA2', '33811', 'FL', 'Lakeland', '1760 County Line Rd', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (943, 'USA', NULL, 'MIA1', '33182', 'FL', 'Miami', '1900 NW 132nd Place Doral', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (944, 'USA', NULL, 'XUSE', '46075', 'IN', 'Whitestown', '5100 S Indianapolis Rd', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (945, 'USA', NULL, 'IND1', '46075', 'IN', 'Whitestown', '4255 Anson Blvd', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (946, 'USA', NULL, 'IND3', '46168', 'IN', 'Plainfield', '715 Airtech Pkwy Suite 195', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (947, 'USA', NULL, 'IND6', '47130', 'IN', 'Jeffersonville', '1453 E 10th St', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (948, 'USA', NULL, 'TUL1', '67337', 'KS', 'Coffeyville', '2654 North Highway 169', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (949, 'USA', NULL, 'MCI1', '66219', 'KS', 'Lenexa', '113th St & Renner Blvd.', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (950, 'USA', NULL, 'MKC6', '66102', 'KX', 'Kansas Qty', '6925 Riverview Avenue', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (951, 'USA', NULL, 'LEX1', '40511', 'KY', 'Lexington', '1850 Mercer RD', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (952, 'USA', NULL, 'LEX2', '40511', 'KY', 'Lexington', '172 Trade St.', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (953, 'USA', NULL, 'SDF1', '42718', 'KY', 'Campbellsville', '1050 South Columbia', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (954, 'USA', NULL, 'SDF2', '40218', 'KY', 'Watterson Park', '4360 Robards Ln', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (955, 'USA', NULL, 'SDF4', '40165', 'KY', 'Shepherdsville', '376 Zappos.com Blvd', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (956, 'USA', NULL, 'SDF6', '40165', 'KY', 'Shepherdsville', '271 Omega Pkwy', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (957, 'USA', NULL, 'CVG1', '41048', 'KY', 'Hebron', '1155 Worldwide Blvd', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (958, 'USA', NULL, 'CVG2', '41048', 'KY', 'Hebron', '1600 Worldwide Blvd', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (959, 'USA', NULL, 'CVG3', '41048', 'KY', 'Hebron', '3680 Langley Dr.', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (960, 'USA', NULL, 'CVG5', '41048', 'KY', 'Hebron', '2285 Litton Lane', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (961, 'USA', NULL, 'SDF7', '40165', 'KY', 'Shepherdsville', '300 Omicron Court', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (962, 'USA', NULL, 'SDF9', '40165', 'KY', 'Shepherdsville', '100 W. Thomas P. Echols Lane', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (963, 'USA', NULL, 'EWR4', '8691', 'NJ', 'Robbinsville', '50 New Canton Way', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (964, 'USA', NULL, 'EWR5', '7001', 'NJ', 'Avenel', '301 Blair Rd.', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (965, 'USA', NULL, 'EWR7', '7001', 'NJ', 'Avenel', '301 Blair Rd.', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (966, 'USA', NULL, 'EWR9', '7008', 'NJ', 'Carteret', '8003 Industrial Parkway', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (967, 'USA', NULL, 'ABE8-401', '8518', 'NJ', 'Florence', '401 Independence Road', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (968, 'USA', NULL, 'ABE8-309', '08518-2802', 'NJ', 'Florence', '309 Cedar Lane', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (969, 'USA', NULL, 'RNO1', '89408', 'NV', 'Fernley', '1600 East Newlands RD', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (970, 'USA', NULL, 'LAS2', '89030', 'NV', 'Las Vegas', '3837 Bay Lake Trail, Suite 111 North', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (971, 'USA', NULL, 'RNO2', '85906', 'NV', 'Reno', '8000 North Virginia Street', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (972, 'USA', NULL, 'RNO4', '89506', 'NV', 'Reno', 'Amazon.com.NVDC Inc. 8000 North Virginia Street', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (973, 'USA', NULL, 'BOS1', '3063', 'NH', 'Nashua', '10 State St.', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (974, 'USA', NULL, 'BWI1', '21224', 'MD', 'Baltimore', '2010 Broening Highway', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (975, 'USA', NULL, 'BWI2', '21224', 'MD', 'Baltimore', '5001 Holbird Ave.', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (976, 'USA', NULL, 'CMH2', '43125-9016', 'OH', 'COLUMBUS', '6050 Gateway Court Groveport', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (977, 'USA', NULL, 'CMH1', '43062-7793', 'OH', 'Etna', '11903 National Road SW', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (978, 'USA', NULL, 'PHL4', '17015', 'PA', 'Carlisle', '21 Roadway Dr', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (979, 'USA', NULL, 'PHL5', '17339', 'PA', 'Lewisberry', '500 McCarthy Dr', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (980, 'USA', NULL, 'PHL6', '17015', 'PA', 'Carlisle', '675 Allen Rd.', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (981, 'USA', NULL, 'ABE5', '17112', 'PA', 'Harrisburg', '6455 Allentown Boulevard', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (982, 'USA', NULL, 'PIT1', '15205', 'PA', 'Pittsburgh', '2250 Roswell Drive', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (983, 'USA', NULL, 'VUBA', '18512', 'PA', 'Scranton', '1000 Keystone Industrial Park', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (984, 'USA', NULL, 'VUGA', '18643', 'PA', 'Pittston', '508 Delaware Avenue West', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (985, 'USA', NULL, 'XUSC', '17013', 'PA', 'Carlisle', '40 Logistics Drive', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (986, 'USA', NULL, 'CAE1', '29172', 'SC', 'West Columbia', '4400 12 Street Extension', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (987, 'USA', NULL, 'GSP1', '29303', 'SC', 'Spartanburg', '402 John Dodd Rd', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (988, 'USA', NULL, 'CHA1', '37416', 'TN', 'Chattanooga', '7200 Discovery Drive', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (989, 'USA', NULL, 'CHA2', '37310', 'TN', 'Charleston', '225 Infinity Dr NW', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (990, 'USA', NULL, 'BNA1', '37090', 'TN', 'Lebanon', '14840 Central Pike Suite 190', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (991, 'USA', NULL, 'BNA2', '37067', 'TN', 'Franklin', '500 Duke DR', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (992, 'USA', NULL, 'BNA3', '37127', 'TN', 'Murfreesboro', 'Joe B Jackson Pkwy', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (993, 'USA', NULL, 'BNA4', '37217', 'TN', 'Nashville', '50 airways Blvd', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (994, 'USA', NULL, 'SAT1', '78154-1461', 'TX', 'Schertz', '6000 Enterprise Avenue', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (995, 'USA', NULL, 'DFW7', '76177', 'TX', 'Haslet', '700 Westport Parkway', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (996, 'USA', NULL, 'DFW8', '75261', 'TX', 'DFW Airport', '2700 Regent Blvd', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (997, 'USA', NULL, 'HOU1', '77338', 'TX', 'Humble', '8120 Humble Westfield Rd', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (998, 'USA', NULL, 'HOU2', '77038-2324', 'TX', 'Houston', '10550 Ella Blvd.', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (999, 'USA', NULL, 'XUSB', '76155', 'TX', 'Fort Worth', '14900 Frye Rd.', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1000, 'USA', NULL, 'RIC2', '23836', 'VA', 'Chester', '1901 Meadowville Technology Pkwy', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1001, 'USA', NULL, 'RIC3', '23836', 'VA', 'Chester', 'across the street fm 1901 Meadowville Technology Parkway', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1002, 'USA', NULL, 'BFI1', '98390', 'WA', 'Sumner', '1800 140th Avenue E.', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1003, 'USA', NULL, 'BFI3', '98327-9607', 'WA', 'Dupont', '2700 Center Drive', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1004, 'USA', NULL, 'BFI4', '98032', 'WA', 'Kent', '20529 59th Place South,Kent,WA 98032 United States', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1005, 'USA', NULL, 'BFI5', '98032', 'WA', 'King County', '20526 59th Place South.Kent', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1006, 'USA', NULL, 'SEA6', '98144', 'WA', 'South Seattle', '2646 Rainier Ave.', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1007, 'USA', NULL, 'SEA8', '98005', 'WA', 'Northeast Bellevue', '1475 124th Avenue', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1008, 'USA', NULL, 'MKE1', '53144', 'Wl', 'Kenosha', '3501 120th Ave,Kenosha,Wl 53144', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1009, 'USA', NULL, 'ATL6', '30344', 'GA', 'East Point', '4200 North Commerce', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1010, 'USA', NULL, 'MDW7', '60449', 'IL', 'Monee', '6605 Monee Manhattan Road', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1011, 'USA', NULL, 'ORD6', '60191', 'IL', 'Wood Dale', '1250 N Mittel Blvd', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1012, 'USA', NULL, 'BOS2', '2072', 'MA', 'Drive Stoughton', '1000 Tech Centre', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1013, 'USA', NULL, 'BOS7', '2720', 'MA', 'Fall River', '1180 Innovation Way', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1014, 'USA', NULL, 'MSP1', '55379', 'MN', 'Shakopee', '2601 4th Avenue East', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1015, 'USA', NULL, 'IVSA', '41018', 'KY', 'Erlanger', '4620 Olympic Blvd', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1016, 'USA', NULL, 'IVSB', '41048', 'KY', 'HEBRON', '3521 POINT PLEASANT RD', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1017, 'USA', NULL, 'BDL2', '06095-2144', 'CT', 'Windsor', '200 Old Iron Ore Rd', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1018, 'USA', NULL, 'DET1', '48150', 'Ml', 'Livonia', '39000 Amrhein Road', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1019, 'UK', NULL, 'EDI4', 'KY11 8ST', 'Fife', 'Dunfermline', 'Amazon.co.uk Amazon Way Dunfermline KY11 8ST', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1020, 'UK', NULL, 'LTN2', 'HP 27LF', 'Hertfordshire', 'Hemel Hempstead', 'amazon.co.uk Hemel Hempstead Hertfordshire HP 27LF', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1021, 'UK', NULL, 'LTN1', 'MK43 OZA', 'Bedfordshire', 'Ridgmont', 'amazon.co.uk Ridgmont Bedfordshire MK43 OZA', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1022, 'UK', NULL, 'CWL1', 'SA1 8QX', 'South Wales', 'Swansea', 'Ffordd Amazon Crymlyn Burrows Swansea SA1 8QX', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1023, 'UK', NULL, 'GLA1', 'PA191BQ', 'Inverclyde', 'Gourock', 'Amazon.co.uk 2 Cloch Road Faulds Park Gourock Inverclyde PA19 1BQ', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1024, 'UK', NULL, 'EUK5', 'PE2 9EN', 'Cambridgeshire', 'Peterborough', 'Amazon.co.uk Phase Two, Kingston Park Flaxley Road Peterborough PE2 9EN', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1025, 'UK', NULL, 'LBA1', 'DN4 5JS', 'South Yorkshire', 'Doncaster', 'Amazon.co.uk Firstpoint Business Park Ba I by Carr Bank Doncaster DN4 5JS', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1026, 'UK', NULL, 'BHX1', 'WS15 1LX', 'Staffordshire', 'Rugeley', 'Power Station Road RUGELEY WS15 1LX', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1027, 'UK', NULL, 'LTN4', 'LU54FE', 'East England', 'Dunstable', 'Amazon EU SARL Unit DC1 (Prologis) Dunstable, East England LU54FE GB', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1028, 'UK', NULL, 'BHX2', 'LE67 1GQ', 'England', 'COALVILLE', 'Amazon EU SARL Robson Way Leicestershire COALVILLE LE67 1GQ England', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1029, 'UK', NULL, 'MAN1', 'M90 5AA', 'Manchester', 'Manchester', 'Amazon EU SARL 6 Sunbank Lane Airport City Altrincham MANCHESTER M90 5AA England', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1030, 'UK', NULL, 'XUKD', 'NN11 8LR', 'DAVENTRY', 'DAVENTRY', 'XPO Logistics.Unit A Daventry Distribution Centre, Royal Oak Way North,Unit A Daventry Distribution Centre, Daventry NN11 8LR England', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1031, 'UK', NULL, 'EUKA', 'PE2 6UG', 'England', 'SOUTHGATE', 'UNO UK, Units 9-10 Manasty Rd, ORTON SOUTHGATE PE2 6UG England', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1032, 'UK', NULL, 'LBA2', 'DN11 OBG', 'Yorkshire and the Humber', 'Doncaster', 'Unit 1 (IP1= Amazon) Iport Avenue Doncaster, Yorkshire and the Humber DN11 OBG GB', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1033, 'UK', NULL, 'MAN2', 'WAS 3XA', 'North West England', 'Warrington', 'Omega Plot 7c Orion Boulevard Warrington, North West England WAS 3XA GB', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1034, 'UK', NULL, 'LCY2', 'RM18 7AN', 'Tilbury', 'Tilbury', 'Amazon Distribution Depot Un代 2, London Distribution Park Tilbury,RM18 7AN United Kingdom', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1035, 'CA', NULL, 'YVR1', 'V3M 5Y9', 'British Columbia', 'Vancouver', '450 Derwent PL Delta, British Columbia V3M 5Y9', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1036, 'CA', NULL, 'YYZ1', 'L5N 1L8', 'Ontario', 'Toronto', '6363 Millcreek Drive Mississauga, Ontario L5N 1L8', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1037, 'CA', NULL, 'YYZ2', 'L9T 6Y9', 'Ontario', 'Toronto', '2750 Peddie Rd. Milton, Ontario L9T 6Y9', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1038, 'CA', NULL, 'YYZ3', 'L6Y 0B2', 'Ontario', 'Toronto', '7995 Winston Churchill Blvd. Brampton, Ontario L6Y 0B2', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1039, 'CA', NULL, 'YYZ4/YYZ6?', 'L6Y 0C9', 'Ontario', 'Brampton', '8050 Heritage Road,Brampton, ON L6Y 0C9', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1040, 'CA', NULL, 'YVR3', 'V3L5H4', 'British Columbia', 'New Westminster', '109 Braid Street New Westminster.BC V3L5H4', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1041, 'DE', NULL, 'LEJ1', '04347', 'Saxony', 'Leipzig', 'Amazonstrasse 1', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1042, 'DE', NULL, 'FRA3', '36251', 'Bad Hersfeld', 'Obere Kühnbach', 'Amazonstrasse 1 ', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1043, 'DE', NULL, 'EDE5', '59368', 'North Rhine-Westphalia', 'Werne', 'Wahrbrink 23', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1044, 'DE', NULL, 'EDE4', '59368', 'Werne', 'Werne', 'Wahrbrink 25', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1045, 'DE', NULL, 'EDEA', '44145', 'North Rhine Westphalia', 'Dortmund', 'Warmbreitbandstr. 3 ', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1046, 'DE', NULL, 'MUC3', '86836', 'Graben', 'Graben', 'Amazonstrasse1', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1047, 'DE', NULL, 'DUS2', '47495', 'Rheinberg', 'Rheinberg', 'Amazonstrasse 1', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1048, 'DE', NULL, 'DUS4', '41179', 'Monchengladbach ', 'Rheindahlen', 'Hamburgring 10', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1049, 'DE', NULL, 'FRA1', '36251', 'Bad Herfeld', 'Bad Herfeld', 'Am Schloß Eichhof 1', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1050, 'DE', NULL, 'BER3', '14656', 'Brieselang', 'Brieselang', 'Havellandstrasse 5', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1051, 'DE', NULL, 'WRO2', '90451', 'Nürnberg', 'Nürnberg ', 'Rheinstrasse 40', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1052, 'DE', NULL, 'WRO1', '90451', 'Bavaria', 'Nuernberg', 'Hamburger Str. 99 ', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1053, 'DE', NULL, 'KTW1', '90451', 'Bavaria', 'Nuernberg', 'Hamburger Str. 99', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1054, 'DE', NULL, 'STR1', '75177', 'Baden-Wurttemberg', 'Pforzheim', ' Amazonstrasse 1 ', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1055, 'DE', NULL, 'HAM2', '21423', 'Lower Saxony', 'Winsen (Luhe)', 'Borgwardstrasse 10', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1056, 'DE', NULL, 'DTM2', '44145', 'Westphalia ', 'Westphalia ', 'Kaltbandstrasse 4 ', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1057, 'DE', NULL, 'DTM2-', '44145', 'Westphalia', 'Westphalia', 'Kaltbandstrasse 4 Dortmund, North Rhine-', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1058, 'DE', NULL, 'FRA7', '67227', ' Frankenthal', ' Frankenthal', 'Am Römig 5 ', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1059, 'DE', NULL, 'HAM8', '25462', 'Rellingen', 'Rellingen', 'Halstenbeker Weg 98C ', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1060, 'DE', NULL, 'LCJ2', '90451', 'Bavaria', 'Nuernberg', 'Hamburger Str. 99', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1061, 'DE', NULL, 'POZ1', '90451', 'Bavaria', 'Nuernberg', 'Hamburger Str. 99', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1062, 'DE', NULL, 'DE01', '20539', 'Hamburg', 'Hamburg', 'Gustav-kunst-str.2-16', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1063, 'DE', NULL, 'PAD1', '59302', 'Westfalen', 'Nordrhein-', 'Aurea 10', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1064, 'DE', NULL, 'XFR1', '63546', 'Hesse ', 'Hammersbach', 'Zum Haarstrauch 9-15', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1065, 'DE', NULL, 'LEJ3', '39171', 'Deutschland', 'Sulzetal', 'Bielefelder Str. 9 ', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1066, 'DE', NULL, 'LCJ4', '90451', 'Bavaria ', 'Nuernberg', 'Hamburger Str. 99 ', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1067, 'DE', NULL, 'XWR1', '90451', 'Bavaria', 'Nürnberg', 'Hamburger Str. 99', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1068, 'DE', NULL, 'XDU1', '34323', 'Hesse ', 'Malsfeld', ' Bornwiese 1', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1069, 'DE', NULL, 'XSC1', '67661', 'Bundesland ', 'Kaiserslautern', 'Hans-Geiger-Strasse 7', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1070, 'DE', NULL, 'XDU2', '46147', 'Rhine Westphalia', 'Oberhausen', 'Im Lekkerland 2', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1071, 'DE', NULL, 'XXXY', '81373', 'Bayern', 'Munich', 'Bodenehrstrasse 6', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1072, 'DE', NULL, 'XHA1', '21629', 'Harburg', 'Wulmstorf', 'Am Holz 3', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1073, 'DE', NULL, 'WRO5', '6126', 'Saale', 'Halle', 'Schieferstraße 16', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1074, 'DE', NULL, 'DTM3', '44145', 'North Rhine-Westphalia', 'Dortmund ', 'Warmbreitbandstraße 3', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1075, 'DE', NULL, 'XFR2', '56477', 'Koblenz', 'Rennerod', 'Industriegebiet Alsberg Zehnhausen', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1076, 'DE', NULL, 'BRE4', '28832', 'Niedersachsen', 'Achim', 'Max-Naumann-Strasse 1', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1077, 'DE', NULL, 'XWR3', '90451', 'Bavaria', 'Nuernberg', 'Hamburger Str. 99', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1078, 'DE', NULL, 'LEJ5', '7554', 'TH', 'GERA', 'Am Steingarten2', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1079, 'DE', NULL, 'STR2', '89522', 'Baden Wurttemberg', 'Heindenheim an der Brenz', 'Oggenhauser Hauptstrasse 151', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1080, 'DE', NULL, 'XPO1', '90451', 'Bavaria', 'Nuernberg', 'Hamburger Str. 99', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1081, 'DE', NULL, 'DTM2-New', '44145', 'North Rhine-Westphalia', 'Dortmund', 'Kaltbandstrasse 4', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1082, 'JK', NULL, 'PRG2', '25261', NULL, 'Dobroviz', 'Amazon Logistic Prague s.r.o. K Amazonu 235 25261 Dobroviz', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1083, 'UK', NULL, 'BHX3', 'NN11 8QL', 'Northamptonshire ', 'Northamptonshire ', '4 Royal Oak Way North Daventry', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1084, 'UK', NULL, 'BHX4', 'CV5 9FA', 'West Midlands', 'Coventry', 'Plot 1, Lyons Park,Coundon Wedge Drive', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1085, 'UK', NULL, 'BHX4-（CV5 9DQ）', 'CV5 9DQ', 'West Midlands', 'Coventry', 'Plot 1, Lyons Park,Coundon Wedge Drive', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1086, 'UK', NULL, 'BHX5', 'CV23 0XF', 'West Midlands', 'West Midlands', 'Unit 3 Rugby', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1087, 'UK', NULL, 'BRS1', 'BS35 4DJ', 'Bristol', 'Bristol', 'Goldcrest Way Bristol, South West', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1088, 'UK', NULL, 'CWL1-1', 'SA1 8QX', ' Wales', 'Swansea', 'Ffordd AmazonSwansea，Wales', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1089, 'UK', NULL, 'EMA1 ', 'DE74 2BB', 'England', 'England', ' Unit 1, Wilders Way, England DERBY  ', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1090, 'UK', NULL, 'EUKB', 'PE2 6TE', 'Peterborough', 'Peterborough', 'Unit 12, Overton Park, Holkham Road', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1091, 'UK', NULL, 'EUKC', 'DN4 5JS', 'Doncaster', 'Doncaster', 'Unit 1, Balby Carr bank', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1092, 'UK', NULL, 'MAN4 ', 'S43 4PZ', 'Derbyshire', 'Derbyshire', '29 Gander LaneCHESTERFIELD', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1093, 'UK', NULL, 'SUUK', 'EC2A 2BA', 'London', 'London', '115 Worship Street', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1094, 'UK', NULL, 'MPCH', 'L208EJ', 'Merseyside', 'Bootle', 'Bankfield Enterprise Hub,Ground Floor ,32 Bankfield Street ,Bootle Merseyside L208EJ United Kingdom', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1095, 'UK', NULL, 'XBH1', 'NN11 8QL', 'Leicestershire', 'Daventry', 'Unit A Daventry Distribution Centre，Royal Oak Way North.', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1096, 'UK', NULL, 'DPD', 'B66 1BY', 'West Midlands', 'Smethwick', 'Roebuck Lane', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1097, 'UK', NULL, 'MAN3', 'BL5 1EE', 'North West', 'Manchester', '360 Logistics North, Over Hulton Bolton', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1098, 'UK', NULL, 'EUKD', 'WA8 8WJ', 'Widnes', 'Foundry Lane', 'Foundry Point, Halebank Industrial Estate', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1099, 'UK', NULL, 'MME1', 'DL1 4BF', 'England', 'Darlington', 'Building Oneton', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1100, 'UK', NULL, 'LTN9', 'LU5 4FE', 'DUNSTABLE', 'DUNSTABLE ', 'UNITS DC1 AND DC2 PROLOGIS BOSCOMBE ROAD', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1101, 'UK', NULL, 'MME2', 'DH6 5NP', 'North East', 'BOWBURN', 'PEAT EDGE FARM TURSDALE ROAD', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1102, 'UK', NULL, 'XBH2', 'CV23 0WB', 'Warwickshire ', 'RUGBY', 'DC1 Pro Logis, Central Park ', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1103, 'UK', NULL, 'EMA1', 'CV23 0WB', 'RUGBY ', 'Warwickshire ', ' DC1 Pro Logis, Central Park', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1104, 'UK', NULL, 'EMA2', 'NG17 4PA', 'Mansfield', 'SOUTH SUTTONIN ASHFIELD', 'SUMMIT PARK SHERWOOD WAY', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1105, 'UK', NULL, 'XUKA', 'WA7 3BN', 'Cheshire', 'Runcorn', 'Whitehouse Industrial Estate, Aston Lane North Preston Brook', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1106, 'UK', NULL, 'XLT2', 'PE2 6TE', 'Cambridgeshire', 'PETERBOROUGH', 'Unit 12, Holkham Road, Overton Park', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1107, 'UK', NULL, 'LTN7', 'MK43 9JH', 'BEDFORD', 'Bedfordshire', 'Bedford 405, BedfordCommercial Park', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1108, 'UK', NULL, 'XLT1', 'PE2 6UG', 'PETERBOROUGH', 'PETERBOROUGH', 'Units 9 and 10 Manasty Rd', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1109, 'UK', NULL, 'LBA4', 'DN11 0BF', 'DONCASTER', 'New Rossington', 'Unit IP9 Toronto Way', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1110, 'UK', NULL, 'XPL1', 'WA8 8YN', 'Cheshire', 'WIDNES', 'Foundry Point, Halebank Industrial Estate Foundry Lane', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1111, 'UK', NULL, 'BHX7', 'LE10 3FF', 'Leicestershire', 'Leicestershire', 'Unit 2, Hinckley Park', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1112, 'UK', NULL, 'BHX3 New', 'NN11 8PQ', 'Northamptonshire', 'Northamptonshire', '4 Royal Oak Way North Daventry', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1113, 'UK', NULL, 'XDS1', 'DN3 3FX', 'Yorkshire', 'DONCASTER', 'Gateway 4 Jackson Lane Dale View DONCASTER, Yorkshire DN3 3FX GB', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1114, 'UK', NULL, 'XBH5', 'LE17 4XY', 'East Midlands', 'LUTTERWORTH', 'Building MPS1 Hudson Way Magna Park South', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1115, 'CA', NULL, 'YYZ4', 'L6Y 0C9', 'ON', 'Brampton', '8050 Heritage Road', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1116, 'CA', NULL, 'YYZ6', 'L6Y 0C9', 'ON', 'Brampton', '8050 Heritage Road', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1117, 'CA', NULL, 'YVR2', 'V3M 5Y9', 'BC', 'Derwent PL Delta', '450 Derwent PL Delta, British Columbia ', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1118, 'CA', NULL, 'YVR4', 'V4M 0B9', 'BC', 'Tsawwassen', '4189 Salish Sea Way', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1119, 'CA', NULL, 'YYC1-0E0', 'T0M 0E0', 'AB', 'Calgary', 'Col Robertson Wy and Crossiron Blvd', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1120, 'CA', NULL, 'YYC1', 'T4A 1C6', 'AB', 'ROCKY VIEW COUNTY', '293069 Colonel Robertson Way and Crossiron Blvd ', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1121, 'CA', NULL, 'YOW1', 'K4B 0L3 ', 'ON', 'Navan', '5225 Boundary Road', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1122, 'CA', NULL, 'YYZ7', 'L7E 4L8', 'ON', 'Bolton', '12724 Coleraine Drive Bolton ON L7E 4L8', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1123, 'CA', NULL, 'YYZ9', 'M1X 1N5', 'ON', 'Scarborough', '6351 Steeles Ave E', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1124, 'CA', NULL, 'YEG1', 'T9E 0B4', 'AB', 'Nisku', '1440 39 AVE', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1125, 'CA', NULL, 'YXX2', 'V6W 0A3', 'BC', 'Richmond', 'ULC 16131 Blundell Road', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1126, 'CA', NULL, 'YHM1', 'L0R 1W0', 'ON', 'Hamilton', 'ULC 110 Aeropark Blvd.', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1127, 'CA', NULL, 'YOW3', 'K2J', 'ON', 'Ottawa', 'ULC 222 Citigate Drive (Block 13, Citigate)', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1128, 'CA', NULL, 'YOO1', 'L1Z 0J2', 'ON', 'ON', '789 Salem Rd NAjax', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1129, 'JP', NULL, 'NRT5', '〒350-1182', '埼玉県\nSaitama', '川越\nKawagoe', 'Amazon　川越FC 埼玉県川越市南台1-10-15\n1-10-15 Minamidai', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1130, 'JP', NULL, 'HND3', '〒350-0195', '比企郡\nHikigun', '比企郡\nHikigun', 'Amazon　川島FC 埼玉県比企郡川島町かわじま2-1-1 2F\n2-1-1 2F Kawajima', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1131, 'JP', NULL, 'KIX1', '〒590-8589', '大阪府\nSakai Osaka', '堺市\nSakai-ku', 'Amazon　堺FC 大阪府堺市堺区築港八幡町138-7\n138-7 Yawatacho,Chikko', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1132, 'JP', NULL, 'KIX2', '〒574-8531', '大阪府\nOsaka', '大東市\nDaito', 'Amazon　大東FC 大阪府大東市緑が丘2-1-1\n2-1-1 Midorigaoka', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1133, 'JP', NULL, 'KIX3', '567-8507', '大阪府', '茨木市', '松下町2-1 茨木市, 大阪府 567-8507 JP (2-1, Matsushitacho, Ibaraki-shi, Osaka, 567-8507, Japan)', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1134, 'JP', NULL, 'HSG1', '〒841-8505', '佐賀県\nSaga', '鳥栖市\nTosu', 'Amazon　鳥栖FC 佐賀県鳥栖市弥生が丘3-1-3\n3-1-3 Yayoigaoka', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1135, 'JP', NULL, 'FSZ1', '〒250-8560', '神奈川県\nKanagawa', '小田原市\nOdawara', 'Amazon小田原FC 神奈川県小田原市扇町4-5-1\n4-5-1 Ogicho', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1136, 'JP', NULL, 'NRT1', '〒272-0193', '千葉県\nChiba', '市川市\nIchikawa', 'Amazon　市川FC 千葉県市川市塩浜2-13-1\n2-13-1 Shiohama', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1137, 'JP', NULL, 'NRT2', '〒276-8525', '千葉県\nChiba', '八千代市\nYachiyo', 'Amazon　八千代FC 千葉県八千代市上高野2036\n2036 Kamitakano', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1138, 'JP', NULL, 'NGO2', '〒507-8585', '岐阜県\nGifu', '岐阜県\nTajimi ', 'Amazon　多治見FC 岐阜県多治見市旭ヶ丘10-6\n10-6 Asahigaoka', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1139, 'JP', NULL, 'KIX4', '〒583-8533', 'Osaka', 'Fujiidera-shi', 'FBA入庫係, 津堂4-435, 藤井寺市, 大阪府', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1140, 'JP', NULL, 'HND8', '192-8560', '東京都', '八王子市', 'Amazon.co.jp FBA入庫係 石川町2970-3 八王子市, 東京都', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1141, 'JP', NULL, 'HND9', '213-8517', '神奈川県', '川崎市', '高津区北見方3-14-1 川崎市, 神奈川県 213-8517 JP (3-14-1, Kitamikata, Takatsu-ku Kawasaki-shi, Kanagawa, 213-8517, Japan )', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1142, 'JP', NULL, 'VJUN', '〒355-0157', '埼玉県', '吉見町', '西吉見480 GLP吉見 比企郡吉見町, 埼玉県 355-0157', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1143, 'JP', NULL, 'TPF3', '569-8570', '大阪府', '高槻市', 'FBA入庫係 芝生町1-52-2 高槻市, 大阪府 569-0823（1-52-2 Shibocho', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1144, 'JP', NULL, 'TPF6', '270-1389', '千葉県', '印西市', 'TPF6 FBA入庫係 松崎台2-4-1 印西市, 千葉県 270-1389 JP', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1145, 'JP', NULL, 'TYO1', '332-8503', '埼玉県', '川口市', '領家5-14-35', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1146, 'JP', NULL, 'KIX5', '610-0397', '京田辺市', '京都府', '松井宮田1（1 Amazon KIX5 Matsuimiyata Kyotanabe-shi，Kyoto，610-0397）', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1147, 'JP', NULL, 'VJU1', '259-1116', '伊勢原市', '伊勢原市', '石田100 MFLP厚木Ⅱ', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1148, 'JP', NULL, 'TPF4', '492-8224', '愛知県', '稲沢市', '奥田大沢町2-1', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1149, 'JP', NULL, 'TPF2', '355-0157', '埼玉県', '比企郡', '吉見町西吉見480', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1150, 'JP', NULL, 'VJNA', '277-0931', '千葉県', '柏市', '藤ケ谷1823', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1151, 'JP', NULL, 'TPFB', '259-1116', '神奈川県', '伊勢原市', '石田100', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1152, 'JP', NULL, 'TPFA', '270-0237', '千葉県', '野田市', '中里字光淨寺3078番2', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1153, 'JP', NULL, 'TPF9', '275-0024', '千葉県', '習志野市', '茜浜3丁目7-2 ランドポート習志野 2階 習志野市, 千葉県', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1154, 'JP', NULL, 'TYO2', '346-8511', '埼玉県', '久喜市', '上清久字桟敷1000番1', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1155, 'JP', NULL, 'TPFC', '335-0026', '埼玉県', '戸田市', '新曽南4丁目3 ESR戸田', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1156, 'JP', NULL, 'TYO6', '350-0282', '埼玉県', '坂戸市', '西インター1丁目2-1', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1157, 'JP', NULL, 'VJND', '190-0015', '東京都', '立川市', '泉 935', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1158, 'JP', NULL, 'TYO3', '183-8570', '東京都', '府中市', '四谷5丁目23-62', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1159, 'JP', NULL, 'TYO7', '362-8508', '埼玉県', '上尾市', '堤崎大字中新井字前５３３(MUCD上尾)', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1160, 'JP', NULL, 'VJNC ', '571-0034', '大阪府', '門真市', '入庫係 東田町5-18 1 F', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1161, 'JP', NULL, 'XHD2', '332-0004', '埼玉県', '川口市', '領家4丁目9番37号 MFLP川口Ⅰ 1F', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1162, 'JP', NULL, 'XHD1', '259-1116', '神奈川県', '伊勢原市', '石田100 MFLP AtsugiⅡ 1F', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1163, 'JP', NULL, 'XKX1', '567-0084', '大阪府', '茨木市', '彩都あかね1番地 三井不動産ロジスティクスパーク（MFLP）茨木２F ', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1164, 'JP', NULL, 'HND6', '213-8516', '神奈川县', '川崎市', '213-8516 Kanagawa, 川崎市 高津区 北見方3-14-1 HND6 Amazon Japan G.K.', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1165, 'JP', NULL, 'OKJ1', '719-1196', 'Okayama', '総社市', '長良4-1', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1166, 'JP', NULL, 'NRT3', '507-8585', '岐阜県', '多治见市', '多治见FC 岐阜県多治见市旭ヶ丘10-6', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1167, 'JP', NULL, 'TPFD', '614-8302', '京都府', '八幡市', '八幡カイトリ1-1 AZ-COM京都', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1168, 'JP', NULL, 'VJNE', '254-0012', '神奈川県', '平塚市', '大神455番1，Dプロジェクト平塚', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1169, 'JP', NULL, 'QCB1', '〒270-0196', '千葉県', '流山市', '西深井字早稲田1603番地1', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1170, 'JP', NULL, 'TPX2', '〒270-1389', '千葉県', '印西市', '松崎台2-4-3', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1171, 'JP', NULL, 'TYO4', '198-8501', '東京都', '青梅市', '末広町2-9-14', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1172, 'ES', NULL, 'MAD4', '28830', 'Madrid', 'Madrid', 'Avenida de la Astronomia, 24 San Fernando de Henar', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1173, 'ES', NULL, 'XESB', '19208', 'Alovera', 'Alovera', 'ES FBA FLEX Avenida Rio Henares, 16 Alovera', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1174, 'ES', NULL, 'XESA', '19208', 'Alovera', 'Alovera', 'ES Norbert NS 3PL,Avenida Rio Henares, 16 ND Logistics ', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1175, 'ES', NULL, 'BCN1', '8820', 'Barcelona', 'Barcelona', 'Amazon Fulfillment Center Av. de les Garrigues num', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1176, 'ES', NULL, 'BCN2', '8107', 'MARTORELLES', 'MARTORELLES', 'Carrer de la VERNEDA 22 ', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1177, 'ES', NULL, 'MAD6', '45200', 'Castile-La Mancha', ' illescas Toledo', ' Avenida de la Logistica poligono industrial veredilla III', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1178, 'ES', NULL, 'SVQ1', '41703', 'Andalusia ', 'Dos Hermanas Seville', 'Bulevar Agustín Nuñez Llanos s/n Poligono La Isla', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1179, 'ES', NULL, 'MAD9', '28804', 'Madrid', 'Alcala de Henares', 'Camino de los Afligidos', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1180, 'IT', NULL, 'MXP5', '29015', 'Castel San Giovanni', 'Castel San Giovanni', 'Strada Dogana Po,2U', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1181, 'IT', NULL, 'FCO1', '2032', 'Passo Corese RI', 'Passo Corese RI', 'Amazon Fulfillment Center Via della Meccanica snc', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1182, 'IT', NULL, 'MXP3', '13100', 'Piedmont', 'Piedmont', 'Via Rita Levi Montalcini, 2 Vercelli', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1183, 'IT', NULL, 'XITC', '20080', 'Francolino di Carpiano', 'Francolino di Carpiano', 'Via Aldo Moro 4', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1184, 'IT', NULL, 'TRN1', '10037', 'Piemonte', 'Torrazza', 'Strada Provinciale per Rondissone 90 ', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1185, 'IT', NULL, 'XMP2', '20080', 'Carpiano ', 'Francolino di Carpiano', 'Via Aldo Moro 4 ', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1186, 'IT', NULL, 'XMP1', '45031', 'Rovigo ', 'Rovigo ', 'Via Maestri Del Lavoro, 990 Arqua Polesine', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1187, 'IT', NULL, 'BLQ1', '45020', '(Rovigo)', 'San Bellino', 'Via Ipazia D’Alessandria 946', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1188, 'IT', NULL, 'FCO2', '34', 'Italy', 'Rome', 'Via Palianese Colleferro', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1189, 'IT', NULL, 'MXP6', '28100', 'NOVARA', 'AGOGNATE', 'Strada Provinciale 299 snc AGOGNATE', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1190, 'IT', NULL, 'BGY1', '24050', 'BERGAMO', 'BERGAMO', 'Via delle Motte no10 Cividate al Piano', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1191, 'FR', NULL, 'ORY1', '45772', 'SARAN', 'SARAN', 'Pole 45 1401 Rue Du Champ Rouge 45772 SARAN CEDEX', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1192, 'FR', NULL, 'MRS1', '26200', 'Provence', 'Provence', 'building 2,ZAC Les Portes de Provence,F-26200,Mont', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1193, 'FR', NULL, 'MRS1-26132', '26132', 'Provence', 'Provence', 'Building II ZAC Ies Portes de Provence MONTELIMAR', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1194, 'FR', NULL, 'LYS1', '71100', 'Burgundy', 'Burgundy', 'Distripole Chalon ZAC Parc Activite, du Val de Bou', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1195, 'FR', NULL, 'LYS1（71311）', '71311', 'SEVREY CEDEX ', 'Bourgogne', 'Distripôle Chalons ZACVal de', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1196, 'FR', NULL, 'LIL1', '59553', 'Nord', 'Lauwin-Planque', 'Rue de la Plaine,59553,Lauwin-Planque,Nord-Pas-de-Calais,France', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1197, 'FR', NULL, 'LIL1-1', '59553', 'CEDEX', 'Lauwin-Planque', '1,Rue Amazon', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1198, 'FR', NULL, 'XFRG', '45410', 'Artenay', 'Artenay', 'XPO Artenay NS 3PL ZAC du Moulin Artenay', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1199, 'FR', NULL, 'BVA1', '80337', 'Boves', 'AMIENS CEDEX', '1 avenue du SUPERBE ORENOQUE', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1200, 'FR', NULL, 'ORY1-770', '45770', 'SARAN', 'SARAN', '1401 Rue Du Champ Rouge ', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1201, 'FR', NULL, 'CDFR', '33610', 'CANEJAN', 'CANEJAN', '5 avenue de Guitayne,Zone Industrielle du Courneau CANEJAN France 33610', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1202, 'FR', NULL, 'XOR1', '91090', 'Ile-de-France', 'Lisses', 'succursale francaise Pièce de la Remise 146, route de Corbeil', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1203, 'FR', NULL, 'VESK', '77176', 'Ile de', 'Savigny le Temple', '7 rue du Chrome', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1204, 'FR', NULL, 'ORY4', '91225', 'Bretigny sur Orge', 'Bretigny sur Orge', 'Avenue du Centred Essais en Vol', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1205, 'FR', NULL, 'XOS1', '62117', 'Hauts-de-France', 'Brebieres', 'Rue de CorbehemBrebieres，Hauts-de-France', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1206, 'FR', NULL, 'XOR2', '38290', 'Rhone-Alpes', 'Satolas-et-Bonce', 'Satolas,Parc des Chenes Nord Rue du Brisson, Batiment IDC9', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1207, 'FR', NULL, 'ETZ2', '57685', 'France', 'Augny', '1, rue de la Croix de Lorraine', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1208, 'AU', NULL, 'MEL1', '3175', 'VTC', 'Dandenong South', '29 National Drive', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1209, 'AU', NULL, 'BWU1', '2170', 'NSW', 'Moorebank', '23 Centenary Ave', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1210, 'AU', NULL, 'PER2', '6105', 'WA', 'Perth Airport', '60 Paltridge Road', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1211, 'AU', NULL, 'BNE1', '4178', 'QLD', 'LYTTON', '42-52 EXPORT STREET', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1212, 'AU', NULL, 'XAU1', '3043', 'Victoria', 'Tullamarine', 'Warehouse B, 25-29 Jets Court', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1213, 'AU', NULL, 'MEL5', '3023', 'VIC', 'RAVENHALL', '103 Palm Springs Road', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1214, 'AU', NULL, 'PER3', '6105', 'WA', 'PERTH AIRPORT', 'AFTX FC (Perth, AU) 60 Paltridge Road', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1215, 'IN', NULL, 'SAMB', '382220', 'Gujarat', 'Gujarat', 'Crystal Indus Logistics Park , National Highway 8th, Bhayla village, Survey No-78/79, Bawla Taluka, District Ahmedabad, Gujarat, Pincode-382220', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1216, 'IN', NULL, 'SAMC', '382220', 'Gujarat', 'Gujarat', 'Plot No.22,Swastik Industrial Estate,Survey No.242,Village Sari,Taluka Sanand District,Ahmedabad,Gujarat, 382220', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1217, 'IN', NULL, 'AMD1', '382220', 'Gujarat', 'Gujarat', 'Crystal Indus Logistics Park ,Unit No.10, National Highway 8th, Bhayla village,Block No.70P, Resurvey No-923, Bawla Taluka, District Ahmedabad, Gujarat, Pincode-382220 ', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1218, 'IN', NULL, 'DEL3', '131021', 'Haryana', 'Haryana', 'Agson Global Logistics Park,Village Kishora, Main G.T.Road, Sonipat,Haryana-131021', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1219, 'IN', NULL, 'SDEC', '122505 ', 'Haryana', 'Haryana', 'Transport Corporation of India,Khasara No. 4/21 MIN, 22 MIN, 8/1,2,3, MIN, 4 MIN, 5, MIN, 8 MIN, 9/1 MIN, 10/1, 12/2, 13/1, 9/5, 6/1/1, Pataudi Road, Jhund Sarai,Farukhnagar,Gurgaon - 122505 ', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1220, 'IN', NULL, 'DEL4', '122503', 'Haryana ', 'Haryana ', 'KH No 18//21,19//25,34//5,6,7/1 min,14/2/2 min,15/1 min,27,35//1,7,8,9/1,9/2,10/1,10/2,11 min,12,13,14 of village Jamalpur,Dist Gurgaon,Haryana 122503', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1221, 'IN', NULL, 'DEL2', '122105 ', 'Haryana', 'Haryana', 'Unit No.1, Khewat/Khata No. 373/400, Mustatil No. 31, Kila No 14/2, Village Tauru, Mewat, Haryana, Pin code-122105 ', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1222, 'IN', NULL, 'SDEG', '122413', 'Haryana', 'Haryana', 'Khasra No.58//12/2/2/2 min,19 min,20/2,21/1,21/2,21/3,57//23/2,24,25,63//3/1/1,4/1,5/1,Village Bilaspur,District Gurgaon-Pincode-122413', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1223, 'IN', NULL, 'SDEB', '124108', 'Haryana', 'Haryana', 'Kuehne Nagel Pvt. Ltd, Building No. 2B, M/s. Indospace FWS Industrial Parks Pvt. Ltd., Pataudi-Kulana Road, VPO Luhari, MDR-132, Tehsil Jhajjar, City: Jhajjar, Haryana- 124108', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1224, 'IN', NULL, 'BLR5', '560067', 'Karnataka', 'Karnataka', '38 & 39, Soukya Road,Kacherakanahalli, Hoskote Taluka, Bangalore Rural District; Karnataka – 560067', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1225, 'IN', NULL, 'SBLB', '562114', 'Karnataka', 'Karnataka', '#200, CHICKHULLUR JANGAMAKOTE ROAD, DASARAHALLI POST, HOSKOTE TALUKA, BANGALORE RURAL DISTRICT; PIN – 562114', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1226, 'IN', NULL, 'SBLC', '560067', 'Karnataka', 'Karnataka', 'Sai Dhara Complex, Warehouse No I-1, Next to Shangrila Resort, TCI supply chain solution ltd, No.92 Anugondanagalli Village & Hobli Hoskote Taluk, Bangalore Rural, Bangalore 560067.', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1227, 'IN', NULL, 'SBOB', '421302', 'Maharashtra ', 'Maharashtra ', 'Shree Sai Dhara Complex, W/N. I-2, Opp RK petrol pump, Nr. Shagrila resorts, Mumbai Nasik highway, Kuksa (Borivali), Bhiwandi, Maharashtra - 421302', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1228, 'IN', NULL, 'SBOE', '421302', 'Maharashtra', 'Maharashtra', 'Sai Dhara Complex, Warehouse No I-1, Next to Shangrila Resort, Mumbai Nashik Highway, NH#3, Kukse-Borivalli Village, District Thane. Bhiwandi 421302', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1229, 'IN', NULL, 'BOM4', '421302', 'Maharashtra', 'Maharashtra', 'WB 10/11, Renaissance Industrial Park, Village Vashere, Post Amane, Taluka Bhiwandi, Dist. Thane, PinCode 421302 ', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1230, 'IN', NULL, 'SPNA', '410501', 'Maharashtra', 'Maharashtra', 'IndoSpace AS Industrial Park Pvt Ltd, Gat 339, 341, Behind Hotel Marriott, Off MIDC Road, Village Mahalunge Ingle, Landmark - Near Harman Industries, Taluka Khed, Dist Pune – 410501', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1231, 'IN', NULL, 'NAG1', '441108', 'Maharashtra', 'Maharashtra', 'TCI Supply Chain Solutions, Plot no. 3, Khasra No. 104 (Part), 111 (Part), Hingna P.S., Khapri Post Office, Nagpur District, Maharashtra 441108', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1232, 'IN', NULL, 'BOM1', '421302', 'Maharashtra', 'Maharashtra', 'Building A, F & H, Prathamesh Complex, Saravali Village, Opp. Hotel Vatika, Near Kalyan Bhiwandi Junction, Bhiwandi Pin code - 421302', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1233, 'IN', NULL, 'SBOA', '421101', 'Maharashtra', 'Bhiwandi', 'DHL Supply Chain India Pvt. Ltd., K-Square, Kurund Village, Opp. Oye Punjabi Restaurant, Bhiwandi, Maharashtra 421101 IN', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1234, 'IN', NULL, 'BOM3', '421302', 'Maharashtra', 'Maharashtra', 'K-Square Industrial and Logistics Park, WH 5/2, Village Kurund, Taluka Bhiwandi, Thane i, Thane421302, Maharashtra. ', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1235, 'IN', NULL, 'BOM6', '400101', 'Maharashtra', 'Maharashtra', 'Building 1, SR.NO. 4(PART), SR.NO.5 (PART), SR.NO.6 (PART), SR.NO.20A (PART) CTS NO. 131, VILLAGE WADHWAN, KANDIVALI (EAST), TALUKA BORIVALI, Maharashtra – 400101', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1236, 'IN', NULL, 'SDEA', '110044', 'New Delhi', 'New Delhi', 'A-43, Ground Floor, Mohan Cooperative Industrial Estate, Main Mathura Road, Badarpur, South Delhi, New Delhi, Pin code – 110044 ', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1237, 'IN', NULL, 'SDEF', '110044', 'New Delhi', 'New Delhi', 'No. A-33,Mohan Cooperative Industrial Estate,New Delhi 110044', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1238, 'IN', NULL, 'SDED', '110044', 'New Delhi', 'New Delhi', 'J-4, block B-1, Mohan Co-operative Industrial estate, Mathura road., New Delhi - 110044', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1239, 'IN', NULL, 'SDEE', '110044', 'New Delhi', 'New Delhi', 'Plot No. A-28(Lower Ground floor), Mohan Co-operative Industrial Estate, Mathura Road, New Delhi – 110044', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1240, 'IN', NULL, 'SBOC', '421101', 'Maharashtra', 'Maharashtra', 'ADANI LOGISTICS LTD, Antariksh Logidrome ,Warehouse A4, Village :Sape- Aamne,Padgha- Kalyan Road, Post- Padgha,Bhiwandi, Maharashtra 421101', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1241, 'IN', NULL, 'SATA', '141113', 'Punjab', 'Punjab', 'M/s Nahar Logistics Park Pvt. Ltd, Khewat No. 79/80 & 39/59, Khasra No. 306,348/305, 48 & 56, Near Katana Sahib Gurudwara, Dist. Ludhiana, Punjab - 141113', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1242, 'IN', NULL, 'SATB', '141113', 'Punjab', 'Punjab', 'H.B.No 212,situated in village katani kalan,sub ditrict sahnewal, Dist. Ludhiana, Punjab 141113', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1243, 'IN', NULL, 'SJAB', '302016 ', 'Rajasthan', 'Rajasthan', 'Plot No. 128 Jhotwara Industrial Area Jaipur Rajasthan 302016 ', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1244, 'IN', NULL, 'MAA5', '600092', 'TamilNadu', 'TamilNadu', 'Central Warehouse, 1, Arcot Road, Virugambakkam, Chennai - 600092', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1245, 'IN', NULL, 'SCJA', '641044 ', 'TamilNadu', 'TamilNadu', 'Central Warehouse No.2, Chinnasamynaidu Road, Siddhapudur,Coimbatore –Tamil Nadu – Pin 641044 ', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1246, 'IN', NULL, 'MAA4', '601 206', 'TamilNadu', 'TamilNadu', 'Indo Space AS Industrial Park Private Limited, Survey No.139-157/2, Durainallur Village, Puduvoyal Post, Ponneri Taluk, Thiruvallur District Tamil Nadu – Pin 601 206  ', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1247, 'IN', NULL, 'SMAB', '602103', 'TamilNadu', 'TamilNadu', 'Shed No.k3, Survey Nos.402/1C2,402/1E2,402/1F2B,402/1G,402/1H,Village Kuthambakkam,Taluka,Poonamalle,District Thiruvallur,Chennai 602103', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1248, 'IN', NULL, 'HYD8', '500409', 'Telangana', 'Telangana', 'Survey no.99/1,Mamidipally Village,Shamshabad,Hyderabad-500409', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1249, 'IN', NULL, 'SHYA', '500008', 'Telangana', 'Telangana', 'First and second Floors building bearing H.No.8-1-366/1,Tolichowki,Hyderabad-500008 ', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1250, 'IN', NULL, 'SCCA', '712203', 'West Bengal', 'West Bengal', 'Kuehne Nagel Pvt. Ltd., Dag No. 8-31, Dag No. 414-425 L R, Khatian No. 871, 798, Mouza-Simla & Pandit Satghara, JL No. 17-18, Shimla, Sreerampore, Hooghly, West Bengal, Pin Code: 712203', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1251, 'IN', NULL, 'SCCB', '700124', 'WB', 'WB', 'Taki road, Pirgacha Dist 24 Pgns(North),P.S.Duttapukur,Kolkata-700124', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1252, 'IN', NULL, 'SIDA', '453771', 'Madhya Pradesh', 'Madhya Pradesh', 'Yusen Logistics (India) Pvt at Survey Number 2/4/1, 2/2/2, 2/2/2, 2/1/2, 2/2/3, 2/3/2, Village Pipliya Kumhar, MR-11; Behind METRO Cash n Carry Store, Tehsil and District Indore, Madhya Pradesh - 453 771', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1253, 'IN', NULL, 'SLKA', '226008', 'UP', 'UP', 'c/o Kuehne Nagel Pvt Limited Bijanaur Peppersand road, Khasara no 543, 544, 537, 540, 541, Near CRPF Camp, Lucknow 226008.', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1254, 'IN', NULL, 'SDEH', '245301', 'UP', 'UP', 'Khasra Nos.103,106,110 to 155,Village Galand,Pargana Dasana,Tehsil Dhaulana,District Hapur,National Highway-245301', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1255, 'IN', NULL, 'SVGA', '521104', 'Andra Pradesh', 'Andra Pradesh', 'C/o. Yusen Logistics Pvt. Ltd. Survey Number 36/6 & 36/4B, Done Atkuru Village, Nidamanuru, Vijayawada - 521104.', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1256, 'IN', NULL, 'HYD7', '509228', NULL, 'Telangana', 'SY. NOs 241-244, 275-284, Penjerla (V), Kottur (M), Mahabubnagar dist., Hyderabad, Telangana -509228', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1257, 'IN', NULL, 'BOM5', '421302', 'Maharashtra', 'Thane', 'Renaissance industrial smart city, Kalyan Sape roadVashere village, Amane post,Thane, Maharashtra 421302IN', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1258, 'SG', NULL, 'SIN8', '608829', 'Singapore', 'Singapore', '5B Toh Guan Road EastLevel 3 Units 1/2/3Singapore,608829', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1259, 'USA', NULL, 'SLC1', '84116', 'UT', 'Salt Lake聽', '777 N 5600 W聽', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1260, 'USA', NULL, 'SLC3', '84116-4413', 'UT', 'SALT LAKE CITY', '355 N JOHN GLENN RD', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1261, 'USA', NULL, 'LGB7', '92376-2427', 'CA', 'Avenue Rialto', '1660 N. Linden', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1262, 'USA', NULL, 'MIA1-33054', '33054', 'FL', 'Opa-Locka', '14000 NW 37th Avenue', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1263, 'USA', NULL, 'ONT7', '92374', 'CA', 'Redlands', '2125 W. San Bernandino Ave.Redlands, CA 92374锛', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1264, 'USA', NULL, 'LAL1', '33811', 'FL', 'Lakeland', '1760 County Line Rd.Lakeland, Florida 33811锛', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1265, 'USA', NULL, 'MDW2-250', '60433', 'IL', 'Joliet', '250 Emerald Drive聽', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1266, 'USA', NULL, 'SAT2', '78666', 'TX', 'San Marcos', '1401 E McCarty Lane San Marcos TX 78666-8969 Unite', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1267, 'USA', NULL, 'LAS6', '89115', 'NV', 'Las Vegas', '4550 Nexus Way Las Vegas NV 89115,United States', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1268, 'USA', NULL, 'LAS7', '89115-1935', 'NV', 'Las Vegas', '6001 East Tropical Parkway', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1269, 'USA', NULL, 'MDW4', '60433-3281', 'IL', 'Joliet', '201 EMERALD DR', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1270, 'USA', NULL, 'DEN2', '80019', 'CO', 'Aurora', '22205 East 19th Ave', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1271, 'USA', NULL, 'DEN3', '80023', 'CO', 'Thornton', '14601 Grant Street', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1272, 'USA', NULL, 'MDW2-402', '60433', 'IL', 'Joliet', '402 Emerald Drive', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1273, 'USA', NULL, 'FTW6', '75261', 'TX', 'Dallas', '2601 W Bethel Road Dallas, TX 75261 United States', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1274, 'USA', NULL, 'JAX2', '32218', 'FL', 'Jacksonville', '12900 Pecan Park Road Jacksonville, FL 32218 Unite', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1275, 'USA', NULL, 'IVSC', '8066', 'NJ', 'West Deptford', 'Uno - West Deptford 1225 Forest Parkway West Deptf', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1276, 'USA', NULL, 'IVSD', '8085', 'NJ', 'Swedesboro', 'UNO - Swedesboro NJ 800 Arlington Blvd Swedesboro,', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1277, 'USA', NULL, 'IVSE', '89115', 'NV', 'LAS VEGAS', '2951 MARION DR UNIT 101 LAS VEGAS, NV 89115-3467 United States', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1278, 'USA', NULL, 'IVSF', '89115', 'NV', 'LAS VEGAS', '2821 MARION DR STE 109', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1279, 'USA', NULL, 'ITX1', '77064', 'TX', 'Houston', '9851 Fallbrook Pines Drive Suite 100', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1280, 'USA', NULL, 'ITX2', '77040', 'TX', 'Houston', '6911 FAIRBANKS N HOUSTON RD SUITE 160', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1281, 'USA', NULL, 'DTW1', '48174', 'MI', 'Romulus', '32801 Ecorse Road,', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1282, 'USA', NULL, 'CMH1-11999', '43062-7793', 'OH', 'Etna', '11999 National Road SW聽', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1283, 'USA', NULL, 'CMH3', '45050-1848', 'OH', 'Monroe', '700 GATEWAY BLVD', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1284, 'USA', NULL, 'CMH6', '43137-9670', 'OH', 'LOCKBOURNE', '3538 TRADEPORT CT', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1285, 'USA', NULL, 'FAT1', '93725', 'CA', 'Fresno', '3575 S. Orange Ave.', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1286, 'USA', NULL, 'PDX9', '97060', 'OR', 'Troutdale', '1250 NW Swigert Way Troutdale, OR 97060 United States', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1287, 'USA', NULL, 'PDX6', '97203-6814', 'OR', 'Portland', '15000 N. Lombard St', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1288, 'USA', NULL, 'ACY1', '8066', 'NJ', 'West Deptford', '240 Mantua Grove Road', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1289, 'USA', NULL, 'JFK8', '10314', 'NY', 'Staten Island', '546 Gulf Avenue', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1290, 'USA', NULL, 'LGA9', '8817', 'NJ', 'Edison', '2170 Route 27', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1291, 'USA', NULL, 'MCO1', '32824', 'FL', 'Orlando', '12340 Boggy Creek Rd', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1292, 'USA', NULL, 'MEM1', '38118', 'TN', 'Memphis', '3292 E Holmes Rd', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1293, 'USA', NULL, 'DCA1', '21219', 'MD', 'Sparrows Point', '1700 Sparrows Point Boulevard', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1294, 'USA', NULL, 'SJC8', '94538', 'CA', 'Fremont聽', '46724 Lakeview Blvd', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1295, 'USA', NULL, 'DET2', '48317-1318', 'MI', 'Shelby Township', '50500 M ound Rd', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1296, 'USA', NULL, 'OKC1', '73159-0003', 'OK', 'OKLAHOMA CITY', '9201 S Portland Avenue', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1297, 'USA', NULL, 'SAV3', '31216-6427', 'GA', 'Macon', '7001 Skipper Rd,聽', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1298, 'USA', NULL, 'BDL3', '06473-1307', 'CT', 'North Haven', '409 Washington Avenue', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1299, 'USA', NULL, 'CMH4', '43162-9747', 'OH', 'WEST JEFFERSON', '1550 W. Main Street', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1300, 'USA', NULL, 'CLE2', '44128', 'OH', 'North Randall', '21500 Emery Rd', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1301, 'USA', NULL, 'CLE3', '44132-2703', 'OH', 'Euclid', '1155 Babbitt Road聽', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1302, 'USA', NULL, 'KRB1', '92408', 'CA', 'SAN BERNARDINO', '555 E ORANGE SHOW RD', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1303, 'USA', NULL, 'GRR1', '49316-9141', 'Michigan(MI)', 'CALEDONIA', '4500 68th Street SE', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1304, 'USA', NULL, 'ALB1', '12033-9634', 'NY', 'Castleton', '1835 US Route 9', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1305, 'USA', NULL, 'ATL2', '30087-3506', 'GA聽', 'STONE MOUNTAIN', '2255 W PARK PLACE BLVD', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1306, 'USA', NULL, 'ATL7', '30291-2091', 'GA', 'UNION CITY', '6855 SHANNON PKWY', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1307, 'USA', NULL, 'AZA4', '85043-7904', 'AZ', 'PHOENIX', '3333 S 59TH AVE', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1308, 'USA', NULL, 'BDL6', '6416', 'CT', 'CROMWELL', '120 County Line Drive', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1309, 'USA', NULL, 'BFL1', '93308-9755', 'CA', 'BAKERSFIELD', '1601 Petrol Road', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1310, 'USA', NULL, 'BHM1', '35022-5497', 'AL', 'BESSEMER', '975 Powder Plant Rd', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1311, 'USA', NULL, 'CLT4', '28214-2633', 'NC', 'CHARLOTTE', '8000 TUCKASEEGEE RD', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1312, 'USA', NULL, 'CSG1', '30259-2867', 'GA聽', 'Moreland', '280 BRIDGEPORT BLVD', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1313, 'USA', NULL, 'DAL3', '75211', 'TX', 'DALLAS', '1301 Chalk Hill Road', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1314, 'USA', NULL, 'DEN7', '80019-3609', 'CO', 'AURORA', '22300 E 26th Avenue', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1315, 'USA', NULL, 'DSM5', '50035-1447', 'IA', 'BONDURANT', '500 32nd Street SW', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1316, 'USA', NULL, 'EL96', '8810', 'NJ', 'Dayton', '10 sigle lane, unit b , Dayton , NJ, 08810 United States', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1317, 'USA', NULL, 'GGE1', '2035', 'MA', 'Foxborough', 'Muse Paintbar 217 Patriot Place Foxborough MA 02035 United States', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1318, 'USA', NULL, 'GGE2', '11777', 'NY', 'Jefferson', 'Muse Paintbar 134 Main Street Port Jefferson NY 11777 United States', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1319, 'USA', NULL, 'GGE3', '6854', 'CT', 'Norwalk', 'Muse Paintbar 55 N. Main Street Norwalk CT 06854 United States', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1320, 'USA', NULL, 'GGE4', '11021', 'NY', 'Great Neck', 'Muse Paintbar 34 Middle Neck Road,Great Neck,NY,11021 United States', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1321, 'USA', NULL, 'GGE5', '11530', 'NY', 'Garden City', 'Muse Paintbar 837 Franklin Avenue Garden City NY 11530 United States', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1322, 'USA', NULL, 'GGE6', '10710', 'NY', 'Yonker', 'Muse Paintbar 265 Market Street #2040,Yonkers,NY,10710, United States', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1323, 'USA', NULL, 'GGE7', '10013', 'NY', 'New York', 'Muse Paintbar 329 Greenwich Street,New York,NY,10013 United States', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1324, 'USA', NULL, 'GGE8', '22031', 'VA', 'Fairfax', 'Muse Paintbar 2920 District Ave #100 Fairfax VA ,22031 United States', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1325, 'USA', NULL, 'GSO1', '27284-6855', 'NC', 'KERNERSVILLE', '1656 OLD GREENSBORO RD', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1326, 'USA', NULL, 'GYR1', '85338', 'AZ', 'GOODYEAR', '605 S BULLARD AVE', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1327, 'USA', NULL, 'GYR3', '85043-2356', 'AZ', 'PHOENIX', '8181 W ROOSEVELT ST', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1328, 'USA', NULL, 'HOU7', '77064-1111', 'TX', 'AHOUSTON', '16225 TOMBALL PKWYBLDG聽', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1329, 'USA', NULL, 'KRB2', '23875-3041', 'VA', 'PRINCE GEORGE', '7000 HARDWARE DR', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1330, 'USA', NULL, 'LFSI', '19406', 'PA', 'King of Prussia', '761 Fifth Ave. King of Prussia, PA 19406 United States', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1331, 'USA', NULL, 'MEM2', '38611-2306', 'MS', 'BYHALIA', '191 NORFOLK SOUTHERN WAY', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1332, 'USA', NULL, 'MEM4', '38128-2718', 'TN', 'MEMPHIS', '4055 NEW ALLEN RD', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1333, 'USA', NULL, 'MEM6', '38654-2510', 'MS', 'OLIVE BRANCH', '11505 Progress Way', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1334, 'USA', NULL, 'MGE1', '30517-3002', 'GA', 'Braselton', '650 Broadway Avenue', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1335, 'USA', NULL, 'MKE2', '53154-4925', 'WI', 'OAK CREEK', '9700 S 13th Street聽', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1336, 'USA', NULL, 'MQJ1', '46140-7099', 'IN', 'GREENFIELD', '4412 W 300 N', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1337, 'USA', NULL, 'MQJ2', '46184-9108', 'IN', 'WHITELAND', '19 BOB GLIDDEN BLVD', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1338, 'USA', NULL, 'PCA1', '85043-2101', 'AZ', 'PHOENIX', '7700 W Fillmore', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1339, 'USA', NULL, 'PCW1', '43460-1706', 'OH', 'ROSSFORD', '27400 Crossroads Parkway', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1340, 'USA', NULL, 'PIT2', '15126-1002', 'PA', 'IMPERIAL', '1200 Westport Rd聽', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1341, 'USA', NULL, 'RDU1', '27529-9438', 'NC', 'GARNER', '4851 Jones Sausage Rd', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1342, 'USA', NULL, 'SCK3', '95336-8696', 'CA', 'MANTECA', '3565 N AIRPORT WAY', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1343, 'USA', NULL, 'SLA5', '91752-5088', 'CA', 'Eastvale', '5250 Goodman Way', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1344, 'USA', NULL, 'SLC2', '84081', 'UT', 'West Jordan', '7148 W. Old Bingham Hwy', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1345, 'USA', NULL, 'STL8', '63376-3447', 'MO', 'SAINT PETERS', '4000 Premier Parkway', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1346, 'USA', NULL, 'TPA3', '33823-9429', 'FL', 'Auburndale', '676 C Fred Jones Blvd', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1347, 'USA', NULL, 'TPA6', '34475-4625', 'FL', 'OCALA', '3400 NW 35th Avenue Road', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1348, 'USA', NULL, 'TUS2', '85756-9271', 'AZ', 'TUCSON', '6701 S KOLB RD', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1349, 'USA', NULL, 'XEW2', '30291-2009', 'GA', 'UNION CITY', '6855 SHANNON PKWY', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1350, 'USA', NULL, 'XIX7', '92408', 'CA', 'SAN BERNARDINO', '555E ORANGE SHOW RD', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1351, 'USA', NULL, 'RIC3-', '23234-2207', 'VA', 'RICHMOND', '4949 Commerce Rd', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1352, 'USA', NULL, 'KRB4', '92571-9722', 'CA', 'PERRIS', '4501 PATTERSON AVE', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1353, 'USA', NULL, 'AKC1', '44320-3827', 'OH', 'AKRON', '2450 ROMIG RD', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1354, 'USA', NULL, 'SMI1', '48030-1263', 'MI', 'HAZEL PARK', '1400 E 10 MILE RD', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1355, 'USA', NULL, 'IGQ2', '60484-3271', 'IL', 'University Park', '23257 S. Central Avenue', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1356, 'USA', NULL, 'STL3', '65738-2779', 'MO', 'REPUBLIC', '3200 E SAWYER RD', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1357, 'USA', NULL, 'FTW5', '75126-3566', 'TX', 'FORNEY', '1475 AKRON WAY', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1358, 'USA', NULL, 'SMF6', '95837-9109', 'CA', 'ALLBAUGH DR SACRAMENTO', '4930 ALLBAUGH DR SACRAMENTO, CA', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1359, 'USA', NULL, 'HOU8', '77545-1129', 'TX', 'FRESNO', '2303 Hurricane Lane', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1360, 'USA', NULL, 'TEB4', '08069-2957', 'NJ', 'PENNS GROVE', '747 COURSES LANDING RD', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1361, 'USA', NULL, 'FAT2', '93291-1882', 'CA', 'VISALIA', '3315 N KELSEY ST', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1362, 'USA', NULL, 'ICT2', '67219-1410', 'KS', 'AVEPARK CITY', '7130 N BROADWAY', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1363, 'USA', NULL, 'OKC2', '73159-0003', 'OK', 'OKLAHOMA', '8991 S Portland Avenue', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1364, 'USA', NULL, 'SBD1', '92316-3819', 'CA', 'BLOOMINGTON', '3388 S Cactus Ave', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1365, 'USA', NULL, 'SMF7', '95688-9626', 'CA', 'VACAVILLE', '4800 MIDDAY ROAD', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1366, 'USA', NULL, 'MSP6', '55044-5076', 'MN', 'LAKEVILLE', '9800 217TH ST W', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1367, 'USA', NULL, 'LIT2', '72117-5026', 'AR', 'NORTH LITTLE ROCK', '13001 HIGHWAY 70', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1368, 'USA', NULL, 'GEG2', '99216-6102', 'WA', 'SPOKANE', '18007 E Garland Ave', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1369, 'USA', NULL, 'SWF1', '12575-5150', 'NY', 'ROCK TAVERN', '635 INTERNATIONAL BLVD', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1370, 'USA', NULL, 'DTW3', '48174-9760', 'MI', 'ROMULUS', '33701 PRESCOTT ST', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1371, 'USA', NULL, 'SAT4', '78245-9512', 'TX', 'SAN ANTONIO', '10384 W US HIGHWAY 90', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1372, 'USA', NULL, 'HGR2', '21740-8126', 'MD', 'HAGERSTOWN', '1115 WESEL BLVD', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1373, 'USA', NULL, 'GYR2', '85395-7672', 'AZ', 'GOODYEAR', '17341 W MINNEZONA AVE', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1374, 'USA', NULL, 'TUL2', '74116-2102', 'OK', 'TULSA', '4040 North 125th East Avenue', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1375, 'USA', NULL, 'BOI2', '83687-5548', 'ID', 'NAMPA', '5295 E. Franklin Road', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1376, 'USA', NULL, 'FOE1', '66109-3665', 'KS', 'KANSAS CITY', '9400 LEAVENWORTH RD', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1377, 'USA', NULL, 'ILG1', '19720-4610', 'DE', 'NEW CASTLE', '780 S. DuPont Highway', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1378, 'USA', NULL, 'LFT1', '70520-5976', 'LA', 'CARENCRO', '3550 NE EVANGELINE TRWY', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1379, 'USA', NULL, 'HSV1', '35756-4403', 'AL', 'MADISON', '7817 Greenbrier Road', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1380, 'USA', NULL, 'AFW1', '76131-1694', 'TX', 'FORT WORTH', '1851 NE LOOP 820', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1381, 'USA', NULL, 'FAR1', '58102-7400', 'ND', 'FARGO', '3701 40TH AVE N', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');
INSERT INTO `f_c_warehouse` VALUES (1382, 'USA', NULL, 'SCK4', '95215-8354', 'CA', 'STOCKTON', '6001 S AUSTIN RD', NULL, NULL, NULL, '2021-12-01 08:39:17', '2021-12-01 08:39:17');

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
  `from_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '发货地址',
  `to_country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '目的国家',
  `fba_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'FBA仓库代码',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'FBA仓库代码详细地址',
  `postcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '目的仓库邮编',
  `date_create_ship` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '提交发货计划日期',
  `hope_arrive_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '期望到达日期，追踪日期',
  `actural_arrive_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '实际到达日期，实际上架日期',
  `carrier_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '承运商',
  `tracking_num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '跟踪号',
  `send_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '发货方式',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '出库单状态',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `carrier_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '物流形式发票',
  `carrier_pdf` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '箱麦',
  `send_number` int(11) NOT NULL COMMENT '发货数目',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inventory_out
-- ----------------------------
INSERT INTO `inventory_out` VALUES (1, '3', 'FBA12345678', 'FBA12345678', 'FBA12345678', 'FBA12345678', 'FBA12345678', 'FBA12345678', 'FBA12345678', 'FBA12345678', '2021-11-30', '', '', 'FBA12345678', 'FBA12345678', '2', '3', 'FBA12345678', '2021-12-02 13:49:05', '2021-12-02 13:49:05', 'files/风扇B08G8FRHKD Shipstation New order.xlsx', 'files/Checking_206617391.pdf', 100);

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
-- Table structure for media
-- ----------------------------
DROP TABLE IF EXISTS `media`;
CREATE TABLE `media`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL COMMENT '创建管理员id',
  `media_group_id` int(11) NULL DEFAULT 0 COMMENT '媒体分组id',
  `type` enum('image','video','audio','powerpoint','code','zip','text','other') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类型',
  `disk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '磁盘',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件路径',
  `size` int(11) NOT NULL COMMENT '文件大小(K)',
  `file_ext` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件后缀',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件名称',
  `meta` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '属性',
  `created_at` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `media_admin_id_media_group_id_type_index`(`admin_id`, `media_group_id`, `type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '媒体' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of media
-- ----------------------------
INSERT INTO `media` VALUES (1, 1, 0, 'image', 'admin', 'upload_files/d1094e16d493e4134cfe8600c2e95970.jpg', 34402, 'jpg', 'd1094e16d493e4134cfe8600c2e95970.jpg', '{\"format\":\"jpeg\",\"suffix\":\"jpg\",\"size\":34402,\"width\":1000,\"height\":424}', 1638420423, NULL);
INSERT INTO `media` VALUES (2, 1, 0, 'image', 'admin', 'upload_files/4a57db12b7435aeee64cd08c90b0f8c0.jpg', 34402, 'jpg', '4a57db12b7435aeee64cd08c90b0f8c0.jpg', '{\"format\":\"jpeg\",\"suffix\":\"jpg\",\"size\":34402,\"width\":1000,\"height\":424}', 1638423808, NULL);
INSERT INTO `media` VALUES (3, 1, 0, 'image', 'admin', 'upload_files/e1afe0a6c72947fc3b8a0120240bb525.png', 13420, 'png', 'e1afe0a6c72947fc3b8a0120240bb525.png', '{\"format\":\"png\",\"suffix\":\"png\",\"size\":13420,\"width\":128,\"height\":128}', 1638423808, NULL);
INSERT INTO `media` VALUES (4, 1, 0, 'image', 'admin', 'upload_files/26befb0d6e357c69762812d4f90fa033.jpg', 45757, 'jpg', '26befb0d6e357c69762812d4f90fa033.jpg', '{\"format\":\"jpeg\",\"suffix\":\"jpg\",\"size\":45757,\"width\":1080,\"height\":462}', 1638423809, NULL);
INSERT INTO `media` VALUES (5, 1, 0, 'image', 'admin', 'upload_files/88deae5683ba4a336b359485f1a19721.jpg', 53224, 'jpg', '88deae5683ba4a336b359485f1a19721.jpg', '{\"format\":\"jpeg\",\"suffix\":\"jpg\",\"size\":53224,\"width\":566,\"height\":1500}', 1638423809, NULL);
INSERT INTO `media` VALUES (6, 1, 0, 'image', 'admin', 'upload_files/7dc4d37cd201191106f9411f62d89d57.jpg', 83016, 'jpg', '7dc4d37cd201191106f9411f62d89d57.jpg', '{\"format\":\"jpeg\",\"suffix\":\"jpg\",\"size\":83016,\"width\":1472,\"height\":1238}', 1638423810, NULL);
INSERT INTO `media` VALUES (7, 1, 0, 'image', 'admin', 'upload_files/a8173369bdc587a38fee00d507071140.png', 213561, 'png', 'a8173369bdc587a38fee00d507071140.png', '{\"format\":\"png\",\"suffix\":\"png\",\"size\":213561,\"width\":780,\"height\":646}', 1638423810, NULL);

-- ----------------------------
-- Table structure for media_group
-- ----------------------------
DROP TABLE IF EXISTS `media_group`;
CREATE TABLE `media_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL COMMENT '创建管理员id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分组名称',
  `created_at` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `media_group_admin_id_index`(`admin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '媒体分组' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of media_group
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
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `migrations` VALUES (13, '2021_11_10_030218_create_inventory_purchase_table', 5);
INSERT INTO `migrations` VALUES (14, '2021_11_10_030548_create_exchange_rate_table', 6);
INSERT INTO `migrations` VALUES (15, '2021_11_19_075248_create_f_c_warehouse_table', 7);
INSERT INTO `migrations` VALUES (17, '2021_11_25_063410_create_currency_table', 8);
INSERT INTO `migrations` VALUES (18, '2021_11_28_110435_create_purchase_order_table', 9);
INSERT INTO `migrations` VALUES (19, '2021_08_19_133221_create_media_group_table', 10);
INSERT INTO `migrations` VALUES (20, '2021_08_19_133235_create_media_table', 10);
INSERT INTO `migrations` VALUES (21, '2021_11_10_025658_create_inventory_out_table', 11);
INSERT INTO `migrations` VALUES (22, '2021_12_02_152807_create_promotion_products_table', 12);
INSERT INTO `migrations` VALUES (23, '2021_12_02_160230_create_promotion_orders_table', 13);
INSERT INTO `migrations` VALUES (24, '2021_12_02_164732_create_sales_summery_table', 14);
INSERT INTO `migrations` VALUES (25, '2021_12_02_222942_create_demand_table', 15);
INSERT INTO `migrations` VALUES (27, '2021_12_03_144058_create_product_interest_table', 16);

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
-- Table structure for product_interest
-- ----------------------------
DROP TABLE IF EXISTS `product_interest`;
CREATE TABLE `product_interest`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '产品主图',
  `asin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '产品SKU',
  `store` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '店铺',
  `bs_category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '类目',
  `amz_price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '产品售价',
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '国家',
  `keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '关键词',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '名字',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_interest
-- ----------------------------
INSERT INTO `product_interest` VALUES (1, 'images/image.png', 'B09CTQMRSD', 'https://www.amazon.ca/s?k=christmas+decorations&crid=3TGBKGUEWD962&sprefix=christmas%2Caps%2C198&ref=nb_sb_noss_1', NULL, '40.99', 'CA', 'Christmas Gift Storm Glass', 'Christmas Gift Storm Glass', '2021-12-03 14:51:34', '2021-12-03 14:51:34');
INSERT INTO `product_interest` VALUES (2, 'images/925bdb1d6047ec97d80b12c4c03f4d16.png', 'B08NHBQDWN', 'https://www.amazon.ca/s?me=A1YL20KCNGOUAK&marketplaceID=A2EUQ1WTGCTBG2', NULL, NULL, 'CA', 'AKETCH Garden Gnome Riding Motorcycle', NULL, '2021-12-03 14:54:49', '2021-12-03 14:54:49');
INSERT INTO `product_interest` VALUES (3, 'images/99f73d1651196bad9453562b39aa3fc7.png', 'B08J7P4MJ1', 'https://www.amazon.ca/s?me=A1YL20KCNGOUAK&marketplaceID=A2EUQ1WTGCTBG2', NULL, NULL, 'CA', NULL, '6pcs Fairies Miniature Figurines Accessories for Garden Decor, Fairy Garden Ornament', '2021-12-03 14:56:07', '2021-12-03 14:56:07');
INSERT INTO `product_interest` VALUES (4, 'images/dba90b9c756b5d64929bea2b9050b7b7.png', 'B09J195W5G', 'https://www.amazon.ca/s?me=A1YL20KCNGOUAK&marketplaceID=A2EUQ1WTGCTBG2', NULL, '18.99', 'CA', NULL, 'Climbing Ladder Santa', '2021-12-03 14:57:22', '2021-12-03 14:57:22');
INSERT INTO `product_interest` VALUES (5, 'images/0bc95067fd6614194a25422d9bd8ec4f.png', 'B08M9VQ8CM', 'https://www.amazon.ca/s?me=A3CIGUHU4OW0FZ&marketplaceID=A2EUQ1WTGCTBG2', NULL, '14.99', 'CA', NULL, 'Merry Christmas Banner with 6 Swirl Decorations', '2021-12-03 14:58:41', '2021-12-03 14:58:41');
INSERT INTO `product_interest` VALUES (6, 'images/63cba2a805eb83fb5a7d54d2b8171149.png', 'B08MJ1S5BN', 'https://www.amazon.ca/s?me=A3JGBXS50GJKCE&marketplaceID=A2EUQ1WTGCTBG2', NULL, NULL, 'CA', NULL, 'ALINK Set of 4 Christmas Decorations 18 x 18 Inches Pillow Covers for Sofa Couch, Cushion Cover Case-Winter Deer, Christmas Tree, Wreath(Insert are not Included)', '2021-12-03 15:00:17', '2021-12-03 15:00:17');
INSERT INTO `product_interest` VALUES (7, 'images/b9e9eea66159b71e78f5c14550cae10d.png', 'B09F5Y7PWP', 'https://www.amazon.ca/s?me=AFMZ6MX8X96XS&marketplaceID=A2EUQ1WTGCTBG2', NULL, '21.99', 'CA', NULL, 'LED Curtain Lights', '2021-12-03 15:01:08', '2021-12-03 15:01:08');
INSERT INTO `product_interest` VALUES (8, 'images/88f49b7c494b1f1093a80ba4c10d0965.png', 'B09GB9GX8V', 'https://www.amazon.ca/s?me=A24O83M48SXMJR&marketplaceID=A2EUQ1WTGCTBG2', 'Party Garlands', '12.99', 'CA', NULL, '2021 Christmas Ceramic Ornaments, Two-Side Printed Cute Light String Christmas Hat Christmas Tree Hanging Ornament for Quarantine Gifts Presents, Christmas Tree Home Decorations', '2021-12-03 15:04:59', '2021-12-03 15:04:59');
INSERT INTO `product_interest` VALUES (9, 'images/ea3c30734fa772f54dd317ba71aff778.png', 'B08HS1GTZQ', 'https://www.amazon.ca/s?me=A2DR8GYXFB3Y2X&marketplaceID=A2EUQ1WTGCTBG2', NULL, '37.99', 'CA', NULL, NULL, '2021-12-03 15:06:36', '2021-12-03 15:06:36');
INSERT INTO `product_interest` VALUES (10, 'images/10362cb0fa25887b5bbcddf68d2e42c4.png', 'B09LS4H3YZ', 'https://www.amazon.ca/s?me=A6LQF31K94WX8&marketplaceID=A2EUQ1WTGCTBG2', NULL, '27.99', NULL, NULL, 'Gnome Christmas Ornaments Set of 3,Hanging Glowing Gnomes with Light for Christmas Tree,Swedish Gnome Plush Santa Xmas Decorations for Home Holiday Decor(3PCS)', '2021-12-03 15:07:29', '2021-12-03 15:07:29');
INSERT INTO `product_interest` VALUES (11, 'images/96a1ad07bcefa31135e2a78d88acbf7f.png', 'https://www.amazon.ca/Naler-Christmas-Ornaments-Strands-Decoration/dp/B08D5QLYJB/ref=zg_bs_13848651011_3/138-0052100-3973557?pd_rd_i=B08JGPNDNR&psc=1', NULL, NULL, '14.99', NULL, NULL, 'Naler 10m Christmas Ornaments Beads, Christmas Tree Beads Strands for Christmas Decoration and DIY Craft Jewelry Making, Bridal Bouquet, Party Decor, Table Decoration - Shiny Beads Chain, Gold', '2021-12-03 15:13:27', '2021-12-03 15:13:27');
INSERT INTO `product_interest` VALUES (12, 'images/1b0481eab5814d1fd3608342fe75b0a5.png', 'https://www.amazon.ca/Pre-Lit-Christmas-Decoration-Reindeer-Outdoor/dp/B09MCJMBNR/ref=zg_bs_13848651011_11/138-0052100-3973557?pd_rd_i=B09MCJMBNR&psc=1', NULL, NULL, '66.49', NULL, NULL, NULL, '2021-12-03 15:15:29', '2021-12-03 15:15:29');
INSERT INTO `product_interest` VALUES (13, 'images/fdb4569c93c604ee7486e2ce4132bf37.png', 'https://www.amazon.ca/TRRAPLE-Inflatables-Decorations-Inflatable-Decoration/dp/B08FQL7K6L/ref=zg_bs_13848651011_13/138-0052100-3973557?pd_rd_i=B08FQL7K6L&psc=1', NULL, NULL, NULL, 'CA', NULL, NULL, '2021-12-03 15:16:06', '2021-12-03 15:16:06');
INSERT INTO `product_interest` VALUES (14, 'images/8a942d710de4186e31c3f006275c6e0f.png', 'https://www.amazon.ca/Christmas-Lighted-Gift-Collapsible-Decorations/dp/B09FKDNQ91/ref=zg_bs_13848651011_16/138-0052100-3973557?pd_rd_i=B09M8CT3WZ&psc=1', NULL, NULL, NULL, 'CA', NULL, 'Christmas Lighted Gift Boxes Set of 3, 48 LED Lighted Gift Boxes for Indoor & Outdoor Christmas Decor, Collapsible Decorations with Timer Outdoor Lighted Christmas Decorations', '2021-12-03 15:16:43', '2021-12-03 15:16:43');
INSERT INTO `product_interest` VALUES (15, 'images/c0bd423e832640a57916512a10436624.png', 'https://www.amazon.ca/Sopcone-Snowman-Decorating-Dressing-Christmas/dp/B08PBP41WG/ref=zg_bs_13848651011_17/138-0052100-3973557?pd_rd_i=B08PBP41WG&psc=1', NULL, NULL, NULL, 'CA', NULL, 'Sopcone 16Pcs Snowman Decorating Kit, Large Snowman Making Kit Snowman Dressing Up Kit Winter Outdoor Kids Fun Toys Christmas Includes Hat Scarf Nose Pipe Eyes Mouth and Buttons', '2021-12-03 15:17:46', '2021-12-03 15:17:46');
INSERT INTO `product_interest` VALUES (16, 'images/baeb724fdaf38982ee0d2f02b12f0269.png', 'https://www.amazon.ca/Quntis-Connectable-Waterproof-Christmas-Decorations/dp/B08ZYCMSBQ/ref=zg_bs_3130336011_5/138-0052100-3973557?pd_rd_i=B09KRSQQL4&psc=1', NULL, NULL, NULL, 'CA', NULL, 'Quntis Star Curtain Lights, Connectable 180 LEDs Christmas Curtain Lights with 8 Flashing Modes, Waterproof Christmas Star Fairy Lights, Indoor Outdoor Curtain Fairy Lights Plug in for Window Bedroom Wall Wedding Christmas Decorations, Colorful', '2021-12-03 15:19:21', '2021-12-03 15:19:21');
INSERT INTO `product_interest` VALUES (17, 'images/6c9350c4847d117f62989ec0a817194b.png', 'https://www.amazon.ca/Hallmark-Nightmare-Christmas-Ornament-0002HCM9586/dp/B0921MFMKP/ref=zg_bs_6647208011_1/138-0052100-3973557?pd_rd_i=B0921MFMKP&psc=1', NULL, NULL, '8.89', NULL, NULL, NULL, '2021-12-03 15:23:21', '2021-12-03 15:23:21');
INSERT INTO `product_interest` VALUES (18, 'images/91e7eb4c18a2577b91a6c64832ad512c.png', 'https://www.amazon.ca/Christmas-Ornaments-Merchandise-Clearance-Decorations/dp/B09KH85DD2/ref=zg_bs_6647208011_5/138-0052100-3973557?pd_rd_i=B09KH58JYN&psc=1', NULL, NULL, NULL, 'CA', NULL, '2021 Christmas Ornaments Merch Gifts for Women Men Merchandise Kids Stocking Stuffers Xmas Tree Decor Clearance Keepsake Hanging Decorations', '2021-12-03 15:24:33', '2021-12-03 15:24:33');
INSERT INTO `product_interest` VALUES (19, 'images/e4e018ec4a7eefbfd7d9a55e395462e8.png', 'https://www.amazon.ca/Hallmark-Keepsake-Christmas-Year-Dated-Porcelain/dp/B08K3MXJ67/ref=zg_bs_6647208011_7/138-0052100-3973557?pd_rd_i=B08K3MXJ67&psc=1', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-03 15:24:53', '2021-12-03 15:24:53');
INSERT INTO `product_interest` VALUES (20, 'images/5e67ed23fed37ed36aef4c31d4646912.png', 'https://www.amazon.ca/Christmas-Ceramic-Ornament-Berries-Decorations/dp/B09GB8X7DZ/ref=zg_bs_6647208011_8/138-0052100-3973557?pd_rd_i=B09GBCS1KH&psc=1', NULL, NULL, NULL, 'CA', NULL, NULL, '2021-12-03 15:25:23', '2021-12-03 15:25:23');
INSERT INTO `product_interest` VALUES (21, 'images/a0e4ed79082c2cf395e8ef223623fd26.png', 'https://www.amazon.ca/Personalized-Customized-Snowflake-Christmas-Decoration/dp/B09LQ7GR83/ref=zg_bs_6647208011_10/138-0052100-3973557?pd_rd_i=B09LQ7GR83&psc=1', NULL, NULL, '21', NULL, NULL, 'Personalized Engraved Customized Snowbaby with Snowflake Ornament 2021 Baby\'s First Christmas for Christmas Tree Holiday Family Party Decoration', '2021-12-03 15:27:38', '2021-12-03 15:27:38');
INSERT INTO `product_interest` VALUES (22, 'images/748fe20d7edc5ecbfdf23426ae5c2158.png', NULL, NULL, NULL, '22', 'CA', NULL, 'Hallmark Keepsake Christmas Ornament 2021, I Want a Hippopotamus for Christmas, Musical Multi-Color 1999QGO2142', '2021-12-03 15:28:25', '2021-12-03 15:28:25');
INSERT INTO `product_interest` VALUES (23, 'images/07ebef66cf6feae589510d6587d49cf0.png', 'https://www.amazon.ca/Stickers-Waterproof-Skateboard-Aesthetic-Journaling/dp/B0953KN6V7/ref=zg_bs_13848625011_2/138-0052100-3973557?pd_rd_i=B09C5D4CZK&psc=1', NULL, NULL, NULL, 'CA', NULL, NULL, '2021-12-03 15:53:02', '2021-12-03 15:53:02');

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
INSERT INTO `products` VALUES (1, '望远镜', 'Binoculars', 'B07VZZ1M6N', NULL, '1191445', 'Stephen Excel', '', '', '', '', '', '', '', '2021-11-19 23:12:51', '2021-11-30 09:04:47', 'images/Binoculars.jpg', 65.99);
INSERT INTO `products` VALUES (2, '登山杖', 'Trekking', 'B07MLWHQJG', NULL, '1193539', 'Stephen Excel', '', '', '', '', '', '', '', '2021-11-19 23:12:51', '2021-11-30 11:49:37', 'images/Trekking.png', 23.99);
INSERT INTO `products` VALUES (3, '吸奶器', 'Breast Pump', 'B07WNQ9HCK', NULL, '1235329', 'Stephen Excel', '', '', '', '', '', '', '', '2021-11-19 23:12:51', '2021-12-02 14:51:05', 'images/Breast Pump.png', 23.56);
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
-- Table structure for promotion_orders
-- ----------------------------
DROP TABLE IF EXISTS `promotion_orders`;
CREATE TABLE `promotion_orders`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `promotion_product_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '推广产品ID',
  `promotion_type` enum('免评','留评','Feedback','Rating','Video') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单类型',
  `refund_method` enum('支付宝','微信','PP') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '返款方式(RMBorPP)',
  `order_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '订单编号',
  `order_price` double(8, 2) NOT NULL COMMENT '订单价格',
  `order_screenshot` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '订单截图',
  `review_screenshot` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '评论截图',
  `review_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '评论链接',
  `review_submit_date` date NOT NULL COMMENT '评论提交日期',
  `review_show_date` date NOT NULL COMMENT '评论显示日期',
  `review_type` enum('文字','图片','视频') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '评论类型',
  `refund_status` enum('已返款','已下单','未返款') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '返款状态',
  `refund_date` date NOT NULL COMMENT '返款日期',
  `refund_money` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '返款金额',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注要求',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of promotion_orders
-- ----------------------------
INSERT INTO `promotion_orders` VALUES (1, '1', '免评', '微信', '111-7117542-7675444', 29.99, '1', '1', '1', '2021-02-12', '2021-02-12', '文字', '已返款', '2021-10-12', '542', '需要文字');

-- ----------------------------
-- Table structure for promotion_products
-- ----------------------------
DROP TABLE IF EXISTS `promotion_products`;
CREATE TABLE `promotion_products`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `listing_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '产品listing',
  `brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `keyword_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '关键词位置',
  `agent_contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '中介联系方式',
  `store_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `asin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ASIN',
  `name_chinese` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '中文产品名称',
  `name_english` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '英文产品名称',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '下单备注',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of promotion_products
-- ----------------------------

-- ----------------------------
-- Table structure for purchase_order
-- ----------------------------
DROP TABLE IF EXISTS `purchase_order`;
CREATE TABLE `purchase_order`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `irobot_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '产品SKU',
  `number` int(11) NULL DEFAULT NULL COMMENT '采购数目',
  `date` date NULL DEFAULT NULL COMMENT '采购单日期',
  `person` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '采购人员',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '采购备注',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of purchase_order
-- ----------------------------

-- ----------------------------
-- Table structure for sales_summery
-- ----------------------------
DROP TABLE IF EXISTS `sales_summery`;
CREATE TABLE `sales_summery`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品图片',
  `asin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ASIN',
  `name_local` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'SKU',
  `taday_order_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '今日销量',
  `taday_order_ammount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '今日销售额',
  `today_average_price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '今日单价',
  `yesterday_order_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昨日销量',
  `yesterday_order_ammount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昨日销售额',
  `yesterday_order_price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昨日单价',
  `lastweekday_order_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昨日销售额销量',
  `lastweekday_order_ammount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昨日销售额销售额',
  `lastweekday_order_price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昨日销售额单价',
  `inventory_salable` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '可售库存',
  `inventory_receivable` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '待收货库存',
  `inventory_movable` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '转库中库存',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sales_summery
-- ----------------------------
INSERT INTO `sales_summery` VALUES (1, 'images/Binoculars.jpg', 'B123442323', 'Binoculars', 'ddwf', '321', '15268', '39.99', '215', '9586', '39.99', '125', '6845', '42.99', '123', '25', '12', '');

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
