-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.28-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table gp247.admin_menu
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE IF NOT EXISTS `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table gp247.admin_menu: ~35 rows (approximately)
DELETE FROM `admin_menu`;
/*!40000 ALTER TABLE `admin_menu` DISABLE KEYS */;
INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `created_at`, `updated_at`) VALUES
	(1, 0, 1, 'Index', 'fa-bar-chart', '/', NULL, NULL),
	(2, 0, 2, 'Admin', 'fa-tasks', '', NULL, NULL),
	(3, 2, 3, 'Users', 'fa-users', 'auth/users', NULL, NULL),
	(4, 2, 4, 'Roles', 'fa-user', 'auth/roles', NULL, NULL),
	(5, 2, 5, 'Permission', 'fa-ban', 'auth/permissions', NULL, NULL),
	(6, 2, 6, 'Menu', 'fa-bars', 'auth/menu', NULL, NULL),
	(7, 2, 7, 'Operation log', 'fa-history', 'auth/logs', NULL, NULL),
	(8, 31, 27, 'Khách hàng', 'fa-user-md', 'shop_customer', '2018-01-13 15:27:55', '2018-05-08 13:27:40'),
	(9, 25, 20, 'Đơn hàng', 'fa-shopping-cart', 'shop_order', '2018-01-13 15:33:55', '2018-05-07 13:45:27'),
	(10, 15, 16, 'Quản lý sản phảm', 'fa-file-photo-o', 'shop_product', '2018-01-13 15:44:02', '2018-02-11 15:03:44'),
	(11, 15, 18, 'Nhãn hiệu', 'fa-bank', 'shop_brand', '2018-01-13 15:47:15', '2018-02-11 15:03:44'),
	(12, 15, 17, 'Thuộc tính', 'fa-indent', 'shop_option', '2018-01-13 15:51:13', '2018-03-31 06:59:43'),
	(13, 15, 14, 'Danh mục sản phẩm', 'fa-folder-open-o', 'shop_category', '2018-01-13 15:52:17', '2018-02-11 15:03:44'),
	(14, 15, 15, 'Giá khuyến mãi', 'fa-paw', 'shop_special_price', '2018-02-06 18:07:21', '2018-02-11 15:03:44'),
	(15, 0, 13, 'Danh mục và sản phẩm', 'fa-folder-open', NULL, '2018-02-09 06:04:43', '2018-05-06 15:13:13'),
	(16, 23, 57, 'Bật/Tắt chức năng', 'fa-cog', 'config_mode', '2018-02-09 06:12:57', '2018-05-09 14:45:59'),
	(17, 0, 8, 'Quản lý nội dung CMS', 'fa-coffee', NULL, '2018-02-10 09:06:05', '2018-05-07 13:42:32'),
	(18, 23, 56, 'Cấu hình thông tin', 'fa-cog', 'config_info', '2018-02-10 09:07:45', '2018-05-09 14:45:59'),
	(19, 17, 9, 'Chủ đề', 'fa-folder-open-o', 'cms_category', '2018-02-10 09:09:03', '2018-02-11 15:03:44'),
	(20, 17, 10, 'Bài viết thuộc chủ đề', 'fa-file-text', 'cms_content', '2018-02-10 09:11:58', '2018-02-11 15:03:44'),
	(21, 17, 11, 'Blog & Tin tức', 'fa-file-powerpoint-o', 'cms_news', '2018-02-10 09:13:01', '2018-02-11 15:03:44'),
	(22, 17, 12, 'Trang viết', 'fa-clone', 'cms_page', '2018-02-10 09:19:50', '2018-02-11 15:03:44'),
	(23, 0, 55, 'Cấu hình website', 'fa-cogs', NULL, '2018-02-11 15:01:24', '2018-05-09 14:45:59'),
	(24, 0, 58, 'Banner & Hình ảnh', 'fa-picture-o', 'banner', '2018-03-13 20:10:22', '2018-05-09 14:45:59'),
	(25, 0, 19, 'Quản lý đơn hàng', 'fa-cart-arrow-down', NULL, '2018-05-06 14:59:14', '2018-05-07 13:41:52'),
	(26, 25, 21, 'Order status', 'fa-asterisk', 'shop_order_status', '2018-05-06 15:56:14', '2018-05-07 13:45:27'),
	(27, 25, 22, 'Payment Status', 'fa-recycle', 'shop_payment_status', '2018-05-06 15:57:12', '2018-05-07 13:45:27'),
	(28, 25, 23, 'Shipping status', 'fa-ambulance', 'shop_shipping_status', '2018-05-06 23:46:53', '2018-05-07 13:45:27'),
	(30, 0, 30, 'Marketing', 'fa-star-half-empty', NULL, '2018-05-07 13:47:33', '2018-05-09 14:38:40'),
	(31, 0, 26, 'Khách hàng, nhà cung cấp', 'fa-group', NULL, '2018-05-07 13:52:20', '2018-05-07 23:41:43'),
	(41, 30, 32, 'Coupon & khuyến mãi', 'fa-rocket', 'shop_promotion', '2018-05-07 23:54:45', '2018-05-20 08:54:31'),
	(42, 0, 33, 'Thanh toán trực tuyến', 'fa-cc-paypal', NULL, '2018-05-07 23:55:33', '2018-05-09 14:38:40'),
	(43, 0, 36, 'Quản lý vận chuyển', 'fa-ambulance', NULL, '2018-05-07 23:56:13', '2018-05-09 14:38:40'),
	(49, 42, 35, 'Transaction log', 'fa-file-text-o', 'shop_order?action=paypal', '2018-05-09 14:32:55', '2018-06-05 22:49:43'),
	(50, 43, 37, 'Cấu hình', 'fa-cog', 'shop_shipping', '2018-05-09 14:33:24', '2018-05-20 06:32:13');
/*!40000 ALTER TABLE `admin_menu` ENABLE KEYS */;

-- Dumping structure for table gp247.admin_operation_log
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE IF NOT EXISTS `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table gp247.admin_operation_log: ~0 rows (approximately)
DELETE FROM `admin_operation_log`;
/*!40000 ALTER TABLE `admin_operation_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_operation_log` ENABLE KEYS */;

-- Dumping structure for table gp247.admin_permissions
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE IF NOT EXISTS `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table gp247.admin_permissions: ~9 rows (approximately)
DELETE FROM `admin_permissions`;
/*!40000 ALTER TABLE `admin_permissions` DISABLE KEYS */;
INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`) VALUES
	(1, 'All permission', '*', '', '*', NULL, '2018-07-26 14:29:38'),
	(2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL),
	(3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL),
	(4, 'User setting', 'auth.setting', 'GET,PUT,DELETE', '/auth/setting', NULL, '2018-08-25 11:19:26'),
	(5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL),
	(6, 'Admin CMS', 'admin_cms', '', '/cms_news\r\n/cms_news/*\r\n/cms_page\r\n/cms_page/*', '2018-03-23 15:18:05', '2018-03-23 16:20:58'),
	(7, 'Admin Shop', 'admin_shop', '', '/shop_*\r\n/getInfoProduct\r\n/shop_order_edit\r\n/shop_order_update', '2018-03-23 15:21:36', '2018-03-25 09:27:28'),
	(8, 'Admin Config', 'admin_confi', '', '/config_*', '2018-03-23 15:25:02', '2018-03-23 15:25:02'),
	(9, 'Manager Banner', 'banner', '', '/banner\r\n/banner/*', '2018-03-23 15:25:47', '2018-03-23 16:21:45');
/*!40000 ALTER TABLE `admin_permissions` ENABLE KEYS */;

-- Dumping structure for table gp247.admin_roles
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE IF NOT EXISTS `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table gp247.admin_roles: ~4 rows (approximately)
DELETE FROM `admin_roles`;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;
INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(1, 'Administrator', 'administrator', '2018-01-12 17:27:40', '2018-01-12 17:27:40'),
	(2, 'Admin', 'admin', '2018-01-12 18:02:33', '2018-01-12 18:02:33'),
	(3, 'User', 'user', '2018-01-12 18:03:14', '2018-01-12 18:03:14'),
	(4, 'Content', 'content', '2018-01-13 08:27:11', '2018-01-13 08:27:11');
/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;

-- Dumping structure for table gp247.admin_role_menu
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE IF NOT EXISTS `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table gp247.admin_role_menu: ~6 rows (approximately)
DELETE FROM `admin_role_menu`;
/*!40000 ALTER TABLE `admin_role_menu` DISABLE KEYS */;
INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
	(1, 2, NULL, NULL),
	(1, 15, NULL, NULL),
	(2, 15, NULL, NULL),
	(1, 19, NULL, NULL),
	(1, 20, NULL, NULL),
	(1, 12, NULL, NULL);
/*!40000 ALTER TABLE `admin_role_menu` ENABLE KEYS */;

-- Dumping structure for table gp247.admin_role_permissions
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE IF NOT EXISTS `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table gp247.admin_role_permissions: ~12 rows (approximately)
DELETE FROM `admin_role_permissions`;
/*!40000 ALTER TABLE `admin_role_permissions` DISABLE KEYS */;
INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
	(1, 1, NULL, NULL),
	(3, 3, NULL, NULL),
	(3, 4, NULL, NULL),
	(2, 2, NULL, NULL),
	(2, 3, NULL, NULL),
	(2, 4, NULL, NULL),
	(4, 3, NULL, NULL),
	(4, 4, NULL, NULL),
	(2, 6, NULL, NULL),
	(2, 7, NULL, NULL),
	(2, 8, NULL, NULL),
	(2, 9, NULL, NULL);
/*!40000 ALTER TABLE `admin_role_permissions` ENABLE KEYS */;

-- Dumping structure for table gp247.admin_role_users
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE IF NOT EXISTS `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table gp247.admin_role_users: ~2 rows (approximately)
DELETE FROM `admin_role_users`;
/*!40000 ALTER TABLE `admin_role_users` DISABLE KEYS */;
INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 1, NULL, NULL),
	(3, 3, NULL, NULL);
/*!40000 ALTER TABLE `admin_role_users` ENABLE KEYS */;

-- Dumping structure for table gp247.admin_users
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE IF NOT EXISTS `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table gp247.admin_users: ~2 rows (approximately)
DELETE FROM `admin_users`;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'admin', '$2y$10$KZD7OLW2TVusUIpyj/gXw.EHJY1XqM7oLsD5TsRGsZDn4bF7X8fpS', 'Administrator', NULL, '6kMBW6SIFxIUdlnSrhCvERPmIV2F9FTW7voLbDpNVFV76v9KfbuF2By2F0qd', '2018-01-12 17:27:40', '2018-09-03 17:18:02'),
	(3, 'user', '$2y$10$5XHIa1PBq5y5XYqaE1Va.ulyxN8QFaFXyTqTcotp4uZj.kjsYTKKO', 'User', NULL, NULL, '2018-01-12 18:05:28', '2018-01-12 18:05:28');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;

-- Dumping structure for table gp247.admin_user_permissions
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE IF NOT EXISTS `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table gp247.admin_user_permissions: ~0 rows (approximately)
DELETE FROM `admin_user_permissions`;
/*!40000 ALTER TABLE `admin_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_user_permissions` ENABLE KEYS */;

-- Dumping structure for table gp247.banner
DROP TABLE IF EXISTS `banner`;
CREATE TABLE IF NOT EXISTS `banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `html` text COLLATE utf8_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `sort` tinyint(4) NOT NULL DEFAULT '0',
  `click` tinyint(4) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table gp247.banner: ~5 rows (approximately)
DELETE FROM `banner`;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
INSERT INTO `banner` (`id`, `image`, `url`, `html`, `status`, `sort`, `click`, `type`, `created_at`, `updated_at`) VALUES
	(7, 'banner/938ac0ae30abf957f28209dbe03c7aa1.png', NULL, NULL, 1, 0, 0, 2, '2018-06-26 15:52:05', '2018-09-06 06:28:16'),
	(8, 'banner/8ff9c30c8af834d3be759fe71a26e7db.png', NULL, '<div class=\'tp-caption LargeTitle sft  tp-resizeme\' data-x=\'250\'  data-y=\'110\'  data-endspeed=\'500\'  data-speed=\'500\' data-start=\'1300\' data-easing=\'Linear.easeNone\' data-splitin=\'none\' data-splitout=\'none\' data-elementdelay=\'0.1\' data-endelementdelay=\'0.1\' style=\'z-index:3; white-space:nowrap;\'>You Are My Everything.</div>\r\n                          <div class=\'tp-caption ExtraLargeTitle sft  tp-resizeme\' data-x=\'200\'  data-y=\'160\'  data-endspeed=\'500\'  data-speed=\'500\' data-start=\'1100\' data-easing=\'Linear.easeNone\' data-splitin=\'none\' data-splitout=\'none\' data-elementdelay=\'0.1\' data-endelementdelay=\'0.1\' style=\'z-index:2; white-space:nowrap; color:#fff; text-shadow:none;\'>AloChip.com</div>\r\n                          <div class=\'tp-caption\' data-x=\'310\'  data-y=\'230\'  data-endspeed=\'500\'  data-speed=\'500\' data-start=\'1100\' data-easing=\'Linear.easeNone\' data-splitin=\'none\' data-splitout=\'none\' data-elementdelay=\'0.1\' data-endelementdelay=\'0.1\' style=\'z-index:2; white-space:nowrap;color:#fff;text-shadow: none;\'>Phục Vụ Bạn Mọi Lúc Mọi Nơi.</div>\r\n                          <div class=\'tp-caption sfb  tp-resizeme \' data-x=\'370\'  data-y=\'280\'  data-endspeed=\'500\'  data-speed=\'500\' data-start=\'1500\' data-easing=\'Linear.easeNone\' data-splitin=\'none\' data-splitout=\'none\' data-elementdelay=\'0.1\' data-endelementdelay=\'0.1\' style=\'z-index:4; white-space:nowrap;\'><a href=\'#\' class="buy-btn">Get Started</a> </div>', 1, 0, 0, 1, '2018-08-02 16:23:32', '2018-09-06 06:36:09'),
	(16, 'banner/090309168aa9742bdcc04401252da078.png', NULL, '<h5>free <br>  shipping</h5>\r\n                  <p>on orders over $99</p>', 1, 0, 0, 1, '2018-08-21 15:09:08', '2018-09-06 06:36:46'),
	(17, 'banner/0e34016e40b7ba61aa6ddb2d92af3c4b.png', NULL, NULL, 1, 0, 0, 0, '2018-09-03 16:51:56', '2018-09-06 06:26:31');
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;

-- Dumping structure for table gp247.cms_category
DROP TABLE IF EXISTS `cms_category`;
CREATE TABLE IF NOT EXISTS `cms_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent` tinyint(4) NOT NULL DEFAULT '0',
  `keyword` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uniquekey` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sort` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniquekey` (`uniquekey`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table gp247.cms_category: ~3 rows (approximately)
DELETE FROM `cms_category`;
/*!40000 ALTER TABLE `cms_category` DISABLE KEYS */;
INSERT INTO `cms_category` (`id`, `title`, `image`, `parent`, `keyword`, `description`, `uniquekey`, `sort`, `status`) VALUES
	(1, 'Thời trang', 'cms_category/2ae26b97a9ae04d209acd33d2cf4b4fc.jpg', 0, 'chu-de-so-1', 'chu-de-so-1', 'chu-de-so-1', 0, 0),
	(2, 'Giải trí', 'cms_category/a81accefc6a4f9417d8bd6742140a866.jpg', 0, 'Invoice,Template', 'chu-de-so-2', 'chu-de-so-2', 0, 1),
	(3, 'Ẩm thực', 'cms_category/fd6fa3099b4e77989afd5cc99e637d67.jpg', 0, 'noi-dung-con', 'noi-dung-con', 'noi-dung-con', 0, 1);
/*!40000 ALTER TABLE `cms_category` ENABLE KEYS */;

-- Dumping structure for table gp247.cms_conten
DROP TABLE IF EXISTS `cms_conten`;
CREATE TABLE IF NOT EXISTS `cms_conten` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `sort` tinyint(4) unsigned DEFAULT '0',
  `status` tinyint(4) unsigned DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table gp247.cms_conten: ~0 rows (approximately)
DELETE FROM `cms_conten`;
/*!40000 ALTER TABLE `cms_conten` DISABLE KEYS */;
INSERT INTO `cms_conten` (`id`, `category_id`, `title`, `image`, `keyword`, `description`, `content`, `sort`, `status`, `created_at`, `updated_at`) VALUES
	(3, 3, 'Giải trí', 'cms_content/6d92081ab17e3c11eb416005124a4a92.jpg', 'Invoice,Template', 'fdgdfg', '<p>fdgdfgdfgdfgdfgdfg fgfdg</p>\r\n\r\n<p>fghfgh</p>', 0, 1, '2018-02-10 03:22:10', '2018-09-01 21:25:51');
/*!40000 ALTER TABLE `cms_conten` ENABLE KEYS */;

-- Dumping structure for table gp247.cms_image
DROP TABLE IF EXISTS `cms_image`;
CREATE TABLE IF NOT EXISTS `cms_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) unsigned NOT NULL DEFAULT '0',
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table gp247.cms_image: ~2 rows (approximately)
DELETE FROM `cms_image`;
/*!40000 ALTER TABLE `cms_image` DISABLE KEYS */;
INSERT INTO `cms_image` (`id`, `content_id`, `image`, `sort`, `status`) VALUES
	(1, 3, 'images/1f5eb6db2404b38b86e4246a792f3fac.png', 0, 0),
	(2, 3, 'images/75be44c336696094632625d2d85159b1.jpg', 0, 0);
/*!40000 ALTER TABLE `cms_image` ENABLE KEYS */;

-- Dumping structure for table gp247.cms_news
DROP TABLE IF EXISTS `cms_news`;
CREATE TABLE IF NOT EXISTS `cms_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `keyword` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table gp247.cms_news: ~7 rows (approximately)
DELETE FROM `cms_news`;
/*!40000 ALTER TABLE `cms_news` DISABLE KEYS */;
INSERT INTO `cms_news` (`id`, `title`, `content`, `keyword`, `description`, `image`, `sort`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'Hướng dẫn up load dữ liệu cho quạt đồng hồ CLOCKFAN1', '<p><span style="font-size:24px;">Hướng dẫn sử dụng app c&agrave;i tr&ecirc;n điện thoại để tải dữ liệu v&agrave;o quạt</span><br />\r\n<span style="font-size:18px;"><br />\r\n<strong>B1: Tải app bằng qu&eacute;t m&atilde; QR</strong></span></p>\r\n\r\n<p><img alt="" src="/share/files/HTB1hXUUiNSYBuNjSsphq6zGvVXay%201.jpg" style="width: 700px; height: 429px;" /></p>\r\n\r\n<p><strong><span style="font-size:18px;">B2: Bật Bluetooth v&agrave; mở app.</span></strong></p>\r\n\r\n<p><img alt="" src="/share/files/hqdefault.jpg" style="width: 700px; height: 391px;" /></p>\r\n\r\n<p><strong><span style="font-size:18px;">B3: Tạo Hiệu Ứng v&agrave; lưu lại.</span></strong></p>\r\n\r\n<p><img alt="" src="/share/files/286da9d3-a85a-437e-9fa8-a0523fc572ee.jpg" style="width: 700px; height: 700px;" /></p>\r\n\r\n<p><img alt="" src="/share/files/79510d31-bad4-4436-8bdc-7702f898db71.jpg" style="width: 700px; height: 700px;" /></p>\r\n\r\n<p><strong><span style="font-size:18px;">B4: Kết nối Bluetooth với Quạt v&agrave; gửi dữ liệu xuống.B5: Đợi ho&agrave;n th&agrave;nh v&agrave; Thưởng thức th&agrave;nh quả.</span></strong></p>\r\n\r\n<p><img alt="" src="/share/files/54fea63a-8b28-4792-bd7b-2faabe06e221.jpg" style="width: 700px; height: 493px;" /></p>', 'blog,keyword', 'Hướng dẫn sử dụng app cài trên điện thoại để tải dữ liệu vào quạt', 'cms_content/37491954bca0df42a149e536847c8023.png', 0, 1, '2018-02-10 03:35:13', '2018-09-06 06:25:35'),
	(2, 'THIẾT LẬP FUSE BIT CHO VI ĐIỀU KHIỂN AVR', '<p class="ddictsentence" style="margin-right: 0cm; margin-left: 0cm; text-align: center;"><span style="font-size:28px;"><span style="color:#27ae60;"><strong>HƯỚNG DẪN&nbsp;THIẾT LẬP FUSE BIT CHO VI ĐIỀU KHIỂN AVR</strong></span></span></p>\r\n\r\n<p class="ddictsentence" style="margin-right: 0cm; margin-left: 0cm;"><span style="font-size:16px;"><span new="" roman="" times=""><span style="color:#0f2149">Ch&agrave;o c&aacute;c bạn h&ocirc;m nay ch&uacute;ng ta sẽ t&igrave;m hiểu về c&aacute;ch thiết lập fuse bits cho vi điều khiển AVR. Trong AVR được thiết kế sẵn một số mạch điện v&agrave; c&aacute;c thiết bị hỗ trợ b&ecirc;n trong, ch&uacute;ng c&oacute; t&aacute;c &nbsp;dụng điều khiển, debug, cấp xung clock, lưu trữ.... Để điều khiển c&aacute;c mạch điện n&agrave;y khi nạp chip ch&uacute;ng ta phải cấu h&igrave;nh Fuse bit cho ch&uacute;ng, hiểu n&ocirc;m na l&agrave; đ&oacute;ng cầu dao điện hoặc mở cầu dao điện. VD như ta thiết lập nguồn xung clock cho AVR: V&igrave; trong AVR c&oacute; t&iacute;ch hợp một mạch điện tạo dao động cho chip l&ecirc;n đến 8Mhz khi sử dụng mạch n&agrave;y c&aacute;c bạn kh&ocirc;ng cần phải mắc thạch anh cho chip.</span></span></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-variant-numeric:inherit"><span style="font-variant-east-asian:inherit"><span style="font-stretch:inherit"><span style="max-height:none !important"><span style="min-height:0px !important"><span style="orphans:2"><span style="widows:2"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><span style="word-spacing:0px"><span new="" roman="" times=""><span style="color:#0f2149">Mỗi loại chip avr đều c&oacute; một cấu h&igrave;nh fuse kh&aacute;c nhau, ở đ&acirc;y ta sẽ lấy v&iacute; dụ cho một số chip hay d&ugrave;ng:&nbsp;ATmega8, ATmega16, ATmega32, .... Phần mềm nạp Progisp:</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><img alt="" src="/share/files/m8_zps543cfd49.jpg" style="width: 800px; height: 472px;" /></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><img alt="" src="/share/files/m32_zpsf575638c.jpg" style="width: 800px; height: 475px;" /></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-variant-numeric:inherit"><span style="font-variant-east-asian:inherit"><span style="font-stretch:inherit"><span style="max-height:none !important"><span style="min-height:0px !important"><span style="orphans:2"><span style="widows:2"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><span style="word-spacing:0px"><span new="" roman="" times=""><span style="color:#0f2149">Ch&uacute; &yacute;: Khi cấu h&igrave;nh Fuse bit l&agrave; bit 0 sẽ l&agrave; k&iacute;ch hoạt, &nbsp;c&ograve;n 1 l&agrave; kh&ocirc;ng k&iacute;ch hoạt</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-variant-numeric:inherit"><span style="font-variant-east-asian:inherit"><span style="font-stretch:inherit"><span style="max-height:none !important"><span style="min-height:0px !important"><span style="orphans:2"><span style="widows:2"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><span style="word-spacing:0px"><span new="" roman="" times=""><span style="color:#0f2149">Ta sẽ set một số Fuse của c&aacute;c chip tr&ecirc;n:</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-variant-numeric:inherit"><span style="font-variant-east-asian:inherit"><span style="font-stretch:inherit"><span style="max-height:none !important"><span style="min-height:0px !important"><span style="orphans:2"><span style="widows:2"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><span style="word-spacing:0px"><span new="" roman="" times=""><span style="color:#0f2149">1. BODLEVER&nbsp;l&agrave; bit chọn mức điện &aacute;p tham chiếu sụt &aacute;p nguồn, khi ta cấu h&igrave;nh k&iacute;ch hoạt&nbsp;BODEN.BODLEVER=0&nbsp;tức chọn mức điện &aacute;p 4.0V, c&ograve;n nếu&nbsp;BODLEVER=1&nbsp;l&agrave; chọn mức điện &aacute;p 2.7V</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-variant-numeric:inherit"><span style="font-variant-east-asian:inherit"><span style="font-stretch:inherit"><span style="max-height:none !important"><span style="min-height:0px !important"><span style="orphans:2"><span style="widows:2"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><span style="word-spacing:0px"><span new="" roman="" times=""><span style="color:#0f2149">Khi điện &aacute;p nguồn VCC m&agrave; bị sụt xuống mức giới hạn tr&ecirc;n CHIP sẽ tự động được RESET kh&ocirc;ng như 8051 treo lu&ocirc;n :)</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-variant-numeric:inherit"><span style="font-variant-east-asian:inherit"><span style="font-stretch:inherit"><span style="max-height:none !important"><span style="min-height:0px !important"><span style="orphans:2"><span style="widows:2"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><span style="word-spacing:0px"><span new="" roman="" times=""><span style="color:#0f2149">2. BODEN&nbsp;l&agrave; bit cho ph&eacute;p mạch ph&aacute;t hiện sụt &aacute;p nguồn hoạt động.</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-variant-numeric:inherit"><span style="font-variant-east-asian:inherit"><span style="font-stretch:inherit"><span style="max-height:none !important"><span style="min-height:0px !important"><span style="orphans:2"><span style="widows:2"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><span style="word-spacing:0px"><span new="" roman="" times=""><span style="color:#0f2149">3. JTAGEN&nbsp;l&agrave; bit cho ph&eacute;p module JTAG hoạt động, c&oacute; t&aacute;c dụng kiểm tra hoạt động tr&ecirc;n chip v&agrave; gỡ lỗi...</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-variant-numeric:inherit"><span style="font-variant-east-asian:inherit"><span style="font-stretch:inherit"><span style="max-height:none !important"><span style="min-height:0px !important"><span style="orphans:2"><span style="widows:2"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><span style="word-spacing:0px"><span new="" roman="" times=""><span style="color:#0f2149">Lưu &yacute; fuse n&agrave;y với chip ATmega32 khi mới mua về c&aacute;c PIN:&nbsp;TCK, TMS, TDO v&agrave; TDI lần lượt&nbsp;PC2, PC3, PC4 v&agrave; PC5 kh&ocirc;ng thể sử dụng được, nếu ta kh&ocirc;ng c&oacute; việc g&igrave; cần đến c&aacute;i n&agrave;y th&igrave; h&atilde;y v&ocirc; hiệu h&oacute;a bằng c&aacute;ch set&nbsp;JTAGEN=1&nbsp;để c&oacute; thể sử dụng c&aacute;c ch&acirc;n tr&ecirc;n như c&aacute;c PIN kh&aacute;c v&igrave; nếu ta để cấu h&igrave;nhJTAGEN=0&nbsp;sẽ kh&ocirc;ng sử dụng được c&aacute;c ch&acirc;n tr&ecirc;n.</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-variant-numeric:inherit"><span style="font-variant-east-asian:inherit"><span style="font-stretch:inherit"><span style="max-height:none !important"><span style="min-height:0px !important"><span style="orphans:2"><span style="widows:2"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><span style="word-spacing:0px"><span new="" roman="" times=""><span style="color:#0f2149">4. OCDEN&nbsp;l&agrave; bit cho ph&eacute;p Debug, nếu ta kh&ocirc;ng khai b&aacute;o fuse n&agrave;y th&igrave;&nbsp;JTAGEN&nbsp;v&ocirc; nghĩa khi&nbsp;JTAGEN=0. Kh&ocirc;ng d&ugrave;ng Debug th&igrave; ta set&nbsp;OCDEN=1, nếu set&nbsp;OCDEN=0&nbsp;th&igrave; chip sẽ chạy ở chế độ sleep mode (ngủ đ&ocirc;ng) v&agrave; qu&aacute; tr&igrave;nh debug bắt đầu, ta kh&ocirc;ng thể l&agrave;m g&igrave; với chip</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-variant-numeric:inherit"><span style="font-variant-east-asian:inherit"><span style="font-stretch:inherit"><span style="max-height:none !important"><span style="min-height:0px !important"><span style="orphans:2"><span style="widows:2"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><span style="word-spacing:0px"><span new="" roman="" times=""><span style="color:#0f2149">Tốt nhất ko sờ v&agrave;o c&aacute;i n&agrave;y kh&ocirc;ng lại cứ tưởng con chip của m&igrave;nh vừa mới mua về sao đ&atilde; t&egrave;o rồi th&igrave; mệt.</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-variant-numeric:inherit"><span style="font-variant-east-asian:inherit"><span style="font-stretch:inherit"><span style="max-height:none !important"><span style="min-height:0px !important"><span style="orphans:2"><span style="widows:2"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><span style="word-spacing:0px"><span new="" roman="" times=""><span style="color:#0f2149">5. EESAVE&nbsp;l&agrave; bit cho ph&eacute;p để lại (lưu lại) dữ liệu EEPROM trong mỗi lần nạp lại chip hay kh&ocirc;ng, nếu&nbsp;EESAVE=0&nbsp;th&igrave; to&agrave;n bộ dữ liệu trong EEPROM sẽ kh&ocirc;ng bị x&oacute;a khi nap chip hoặc ngược lại.</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-variant-numeric:inherit"><span style="font-variant-east-asian:inherit"><span style="font-stretch:inherit"><span style="max-height:none !important"><span style="min-height:0px !important"><span style="orphans:2"><span style="widows:2"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><span style="word-spacing:0px"><span new="" roman="" times=""><span style="color:#0f2149">6. BOOT LOADER&nbsp;l&agrave; chương tr&igrave;nh cho ph&eacute;p nạp chip kh&ocirc;ng cần mạch nạp, VD như nạp qua UART.... cho ph&eacute;p kh&aacute;ch h&agrave;ng của m&igrave;nh c&oacute; thể tự cập nhật phần mềm. Để l&agrave;m được việc n&agrave;y ta phải cấu h&igrave;nh fuse cho 3 bit sau:</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-variant-numeric:inherit"><span style="font-variant-east-asian:inherit"><span style="font-stretch:inherit"><span style="max-height:none !important"><span style="min-height:0px !important"><span style="orphans:2"><span style="widows:2"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><span style="word-spacing:0px"><span new="" roman="" times=""><span style="color:#0f2149">- BOOTRST&nbsp;l&agrave; fuse cho ph&eacute;p chạy chương tr&igrave;nh bootloader trong v&ugrave;ng lưu trữ&nbsp;bootloader.&nbsp;BOOTRST=1th&igrave; địa chỉ của chương tr&igrave;nh sẽ bắt đầu từ địa chỉ 0x0000, c&ograve;n&nbsp;BOOTRST=0&nbsp;th&igrave; &ocirc; nhớ bắt đầu l&agrave; vị tr&iacute; đầu ti&ecirc;n của bootloader tức ctr bootloader được thực thi.</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-variant-numeric:inherit"><span style="font-variant-east-asian:inherit"><span style="font-stretch:inherit"><span style="max-height:none !important"><span style="min-height:0px !important"><span style="orphans:2"><span style="widows:2"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><span style="word-spacing:0px"><span new="" roman="" times=""><span style="color:#0f2149">- BOOTSZ1 v&agrave;&nbsp;BOOTSZ0&nbsp;l&agrave; 2 bit chọn ph&acirc;n v&ugrave;ng bộ nhớ cho&nbsp;bootloader ta xem bảng sau:</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><img alt="" src="/share/files/2018-08-03_074542.png" style="width: 700px; height: 195px;" /><span style="color: rgb(15, 33, 73); font-size: 16px;"><br />\r\nBOOTSZ1 BOOTSZ0 Boot Size (words) Page Địa chỉ</span>&nbsp;</p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-variant-numeric:inherit"><span style="font-variant-east-asian:inherit"><span style="font-stretch:inherit"><span style="max-height:none !important"><span style="min-height:0px !important"><span style="orphans:2"><span style="widows:2"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><span style="word-spacing:0px"><span new="" roman="" times=""><span style="color:#0f2149">1 1 256 4 0x3F00&nbsp;- 0x3FFF</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-variant-numeric:inherit"><span style="font-variant-east-asian:inherit"><span style="font-stretch:inherit"><span style="max-height:none !important"><span style="min-height:0px !important"><span style="orphans:2"><span style="widows:2"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><span style="word-spacing:0px"><span new="" roman="" times=""><span style="color:#0f2149">1 0 512 8 0x3E00&nbsp;- 0x3FFF</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-variant-numeric:inherit"><span style="font-variant-east-asian:inherit"><span style="font-stretch:inherit"><span style="max-height:none !important"><span style="min-height:0px !important"><span style="orphans:2"><span style="widows:2"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><span style="word-spacing:0px"><span new="" roman="" times=""><span style="color:#0f2149">0 1 1024 16 0x3C00&nbsp;-&nbsp;0x3FFF</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-variant-numeric:inherit"><span style="font-variant-east-asian:inherit"><span style="font-stretch:inherit"><span style="max-height:none !important"><span style="min-height:0px !important"><span style="orphans:2"><span style="widows:2"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><span style="word-spacing:0px"><span new="" roman="" times=""><span style="color:#0f2149">0 0 2048 32 0x3800 -&nbsp;0x3FFF</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-variant-numeric:inherit"><span style="font-variant-east-asian:inherit"><span style="font-stretch:inherit"><span style="max-height:none !important"><span style="min-height:0px !important"><span style="orphans:2"><span style="widows:2"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><span style="word-spacing:0px"><span new="" roman="" times=""><span style="color:#0f2149">Trong c&aacute;c ứng dụng kh&ocirc;ng đ&ograve;i hỏi phải cập nhật phần mềm th&igrave; ta để mặc định, để d&agrave;nh bộ nhớ cho code.</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-variant-numeric:inherit"><span style="font-variant-east-asian:inherit"><span style="font-stretch:inherit"><span style="max-height:none !important"><span style="min-height:0px !important"><span style="orphans:2"><span style="widows:2"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><span style="word-spacing:0px"><span new="" roman="" times=""><span style="color:#0f2149">7. RSTDISBL&nbsp;l&agrave; bit cho ph&eacute;p sử dụng ch&acirc;n reset hay kh&ocirc;ng tr&ecirc;n một số chip như ATmega8 c&oacute; t&iacute;ch hợp chung với PINC.6. Để sử dụng ch&acirc;n n&agrave;y l&agrave;m ch&acirc;n RESET ta thiết lập fuse&nbsp;RSTDISBL=1&nbsp;v&agrave; ngược lại nếu ta muốn sử dụng ch&acirc;n n&agrave;y l&agrave;m port xuất nhập.</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-variant-numeric:inherit"><span style="font-variant-east-asian:inherit"><span style="font-stretch:inherit"><span style="max-height:none !important"><span style="min-height:0px !important"><span style="orphans:2"><span style="widows:2"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><span style="word-spacing:0px"><span new="" roman="" times=""><span style="color:#0f2149">8. WTDON&nbsp;cho ph&eacute;p WTD</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-variant-numeric:inherit"><span style="font-variant-east-asian:inherit"><span style="font-stretch:inherit"><span style="max-height:none !important"><span style="min-height:0px !important"><span style="orphans:2"><span style="widows:2"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><span style="word-spacing:0px"><span new="" roman="" times=""><span style="color:#0f2149">9. SPIEN&nbsp;cho ph&eacute;p giao tiếp SPI</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-variant-numeric:inherit"><span style="font-variant-east-asian:inherit"><span style="font-stretch:inherit"><span style="max-height:none !important"><span style="min-height:0px !important"><span style="orphans:2"><span style="widows:2"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><span style="word-spacing:0px"><span new="" roman="" times=""><span style="color:#0f2149">10. Set xung nhip cho chip, gồm 7 fuse:&nbsp;CKSEL3:0 (chọn xung nhịp), CKOPT (chọn chế độ khu&ecirc;ch đại) v&agrave;&nbsp;SUT1:0 (thời gian khởi động- ko d&ugrave;ng, mặc định như n&agrave;o để đ&oacute; SUT1:0=10 )</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p><img alt="" src="/share/files/2018-08-03_074626.png" style="width: 700px; height: 445px;" /></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-variant-numeric:inherit"><span style="font-variant-east-asian:inherit"><span style="font-stretch:inherit"><span style="max-height:none !important"><span style="min-height:0px !important"><span style="orphans:2"><span style="widows:2"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><span style="word-spacing:0px"><span new="" roman="" times=""><span style="color:#0f2149">CKSEL3:0 Xung nhịp Nguồn xung nhịp CKOPT</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-variant-numeric:inherit"><span style="font-variant-east-asian:inherit"><span style="font-stretch:inherit"><span style="max-height:none !important"><span style="min-height:0px !important"><span style="orphans:2"><span style="widows:2"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><span style="word-spacing:0px"><span new="" roman="" times=""><span style="color:#0f2149">0001 1Mhz Onchip</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-variant-numeric:inherit"><span style="font-variant-east-asian:inherit"><span style="font-stretch:inherit"><span style="max-height:none !important"><span style="min-height:0px !important"><span style="orphans:2"><span style="widows:2"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><span style="word-spacing:0px"><span new="" roman="" times=""><span style="color:#0f2149">0010 2Mhz Onchip</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-variant-numeric:inherit"><span style="font-variant-east-asian:inherit"><span style="font-stretch:inherit"><span style="max-height:none !important"><span style="min-height:0px !important"><span style="orphans:2"><span style="widows:2"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><span style="word-spacing:0px"><span new="" roman="" times=""><span style="color:#0f2149">0011 4Mhz Onchip</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-variant-numeric:inherit"><span style="font-variant-east-asian:inherit"><span style="font-stretch:inherit"><span style="max-height:none !important"><span style="min-height:0px !important"><span style="orphans:2"><span style="widows:2"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><span style="word-spacing:0px"><span new="" roman="" times=""><span style="color:#0f2149">0100 8Mhz Onchip</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-variant-numeric:inherit"><span style="font-variant-east-asian:inherit"><span style="font-stretch:inherit"><span style="max-height:none !important"><span style="min-height:0px !important"><span style="orphans:2"><span style="widows:2"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><span style="word-spacing:0px"><span new="" roman="" times=""><span style="color:#0f2149">1010 1-16Mhz Thạch anh ngo&agrave;i 0</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-variant-numeric:inherit"><span style="font-variant-east-asian:inherit"><span style="font-stretch:inherit"><span style="max-height:none !important"><span style="min-height:0px !important"><span style="orphans:2"><span style="widows:2"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><span style="word-spacing:0px"><span new="" roman="" times=""><span style="color:#0f2149">1111 1-16Mhz Thạch anh ngo&agrave;i 0</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-variant-numeric:inherit"><span style="font-variant-east-asian:inherit"><span style="font-stretch:inherit"><span style="max-height:none !important"><span style="min-height:0px !important"><span style="orphans:2"><span style="widows:2"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><span style="word-spacing:0px"><span new="" roman="" times=""><span style="color:#0f2149">1010 1-8Mhz Thạch anh ngo&agrave;i 1</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-variant-numeric:inherit"><span style="font-variant-east-asian:inherit"><span style="font-stretch:inherit"><span style="max-height:none !important"><span style="min-height:0px !important"><span style="orphans:2"><span style="widows:2"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><span style="word-spacing:0px"><span new="" roman="" times=""><span style="color:#0f2149">1111 1-8Mhz Thạch anh ngo&agrave;i 1</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-variant-numeric:inherit"><span style="font-variant-east-asian:inherit"><span style="font-stretch:inherit"><span style="max-height:none !important"><span style="min-height:0px !important"><span style="orphans:2"><span style="widows:2"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><span style="word-spacing:0px"><span new="" roman="" times=""><span style="color:#0f2149">Hướng dẫn set fuse d&ugrave;ng xung nhịp RC onchip v&agrave; thạch anh ngo&agrave;i:<br />\r\n<img alt="" src="/share/files/m32_clk8m_zpse27317d2.jpg" style="width: 800px; height: 472px;" /></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><img alt="" src="/share/files/m32_cry_zpsf0ebfb2e.jpg" style="width: 800px; height: 474px;" /></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-variant-numeric:inherit"><span style="font-variant-east-asian:inherit"><span style="font-stretch:inherit"><span style="max-height:none !important"><span style="min-height:0px !important"><span style="orphans:2"><span style="widows:2"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><span style="word-spacing:0px"><span new="" roman="" times=""><span style="color:#0f2149">Cuối c&ugrave;ng sau khi cấu h&igrave;nh xong nhớ nhấn n&uacute;t Write để ghi cấu h&igrave;nh v&agrave;o chip nha!</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-variant-numeric:inherit"><span style="font-variant-east-asian:inherit"><span style="font-stretch:inherit"><span style="max-height:none !important"><span style="min-height:0px !important"><span style="orphans:2"><span style="widows:2"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><span style="word-spacing:0px"><span new="" roman="" times=""><span style="color:#0f2149">Qua b&agrave;i viết n&agrave;y c&aacute;c bạn c&oacute; thể y&ecirc;n t&acirc;m khi nạp chương tr&igrave;nh cho AVR kh&ocirc;ng sợ bị set nhầm fuse.</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p class="ddictsentence" style="-webkit-text-stroke-width: 0px; margin-right: 0cm; margin-left: 0cm; max-width: none !important; min-width: 0px !important;"><span style="font-size:16px;">[ST].</span></p>', 'fuse bit avr', 'Chào các bạn hôm nay chúng ta sẽ tìm hiểu về cách thiết lập fuse bits cho vi điều khiển AVR. Trong AVR được thiết kế sẵn một số mạch điện và các thiết bị hỗ trợ bên trong, chúng có tác  dụng điều khiển, debug, cấp xung clock, lưu trữ....', 'cms_content/be10a7c0f8fbd4abcc5bc1e70bc31590.png', 0, 1, '2018-08-02 17:10:19', '2018-09-06 06:25:26'),
	(3, 'RGB LED Globe 40x200', '<p style="text-align: center;"><span style="font-size:22px;"><span style="color:#27ae60;"><strong>HƯỚNG DẪN X&Acirc;Y DỰNG RGB LED GLOBE PROJECT</strong></span></span></p>\r\n\r\n<div class="separator" style="clear: both; text-align: center;"><br />\r\n<iframe allowfullscreen="" class="YOUTUBE-iframe-video" data-thumbnail-src="https://i.ytimg.com/vi/Q0m3c_nqX98/0.jpg" frameborder="0" height="600" scrolling="no" src="https://www.youtube.com/embed/qUxk6U6cjho?feature=player_embedded" width="800"></iframe></div>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style="font-size:16px;"></span><span style="font-size:16px;">X&acirc;y</span><span style="font-size:16px;"> dựng m&ocirc; h&igrave;nh cơ kh&iacute;;</span><span style="font-size:16px;"><br />\r\n<span style="display: none;">&nbsp;</span><img alt="Mô Hình Cơ Khí 1" src="/share/files/led-globe-pov-9-638.jpg" style="width: 800px; height: 567px;" /></span></p>\r\n\r\n<p><img alt="Mô Hình Cơ Khí 2" src="/share/files/Untitled%20(2).png" style="width: 800px; height: 633px;" /></p>\r\n\r\n<p><span style="font-size:16px;">X&acirc;y dựng m&ocirc; h&igrave;nh Điện điều khiển:</span></p>\r\n\r\n<p><img alt="" src="/share/files/GlobeLEDlayout%20(1).png" style="width: 800px; height: 1035px;" /></p>\r\n\r\n<p><img alt="" src="/share/files/Untitled%201.png" style="width: 800px; height: 313px;" /><img alt="" src="/share/files/Untitled%201(1).png" style="width: 800px; height: 313px;" /></p>\r\n\r\n<p><span style="font-size:14px;">Link hướng dẫn dự &aacute;n;</span></p>\r\n\r\n<p><span style="font-size:28px;"><a href="https://youtu.be/qUxk6U6cjho">https://youtu.be/qUxk6U6cjho</a></span></p>', 'led globe', 'RGB LED Globe - ROTATING SPHERE', 'cms_content/03fe23df7b25e67bab978e05d8c9fe76.png', 0, 1, '2018-08-02 17:16:49', '2018-09-06 06:25:17'),
	(4, 'Tự làm mạch LED nháy theo nhạc VU 40 LED', '<p>&nbsp;</p>\r\n\r\n<div class="separator" style="clear: both; text-align: center;"><br />\r\n<iframe allowfullscreen="" class="YOUTUBE-iframe-video" data-thumbnail-="" frameborder="0" height="600" scrolling="no" src="https://www.youtube.com/embed/SXDEdgPsKNA?feature=player_embedded" width="800">src=&quot;https://www.youtube.com/embed/SXDEdgPsKNA?feature=player_embedded&quot;<br />\r\nwidth=&quot;800&quot;&gt;</iframe></div>\r\n\r\n<p>&nbsp;</p>', 'vu led,led nháy theo nhạc', NULL, 'cms_content/dc3e4419930cfc5b1a15479dd7c6539b.png', 0, 1, '2018-08-02 17:59:52', '2018-09-06 06:25:06'),
	(5, 'Chuẩn kết nối không dây chung cho Internet of Things', '<p align="center" style="margin-bottom:.0001pt; text-align:center; margin:0cm 0cm 10pt"><span style="font-size:36px;"><span style="line-height:normal"><span style="font-family:Calibri,sans-serif"><b><span noto="" serif=""><span style="color:#00b050">Chuẩn kết nối kh&ocirc;ng d&acirc;y chung cho Internet of Things</span></span></b></span></span></span><span style="font-size:20px;"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif">&nbsp;</span></span></span></p>\r\n\r\n<p align="center" style="margin-bottom:.0001pt; text-align:center; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:normal"><span style="font-family:Calibri,sans-serif"><span style="background:#f0f7fc"><span noto="" serif=""><span style="color:#141414"><img height="800" src="/share/files/image-20180809204340-1.jpeg" width="1240" /></span></span></span><span noto="" serif=""><span style="color:#141414">​</span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:12.0pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:normal"><span style="font-family:Calibri,sans-serif"><span noto="" serif=""><span style="color:#141414">Hiện tại số lượng thiết bị kết nối mạng đang nhiều gấp đ&ocirc;i so với lượng người tr&ecirc;n Tr&aacute;i Đất. Từ những bộ điều khiển nhiệt độ, cửa, TV cho đến c&aacute;c m&aacute;y bơm nước, c&aacute;c hệ thống cảm biến, robot, điện thoại, TV, tất cả đều được gọi chung l&agrave;&nbsp;</span></span><a href="https://tinhte.vn/tags/internet-of-things/"><span noto="" serif=""><span style="color:#176093"><span style="text-decoration:none">Internet of Things</span></span></span></a><span noto="" serif=""><span style="color:#141414">&nbsp;(</span></span><a href="https://tinhte.vn/tags/iot/"><span noto="" serif=""><span style="color:#176093"><span style="text-decoration:none">IoT</span></span></span></a><span noto="" serif=""><span style="color:#141414">). Nhưng vấn đề nằm ở chỗ ch&uacute;ng kh&ocirc;ng hề n&oacute;i một &quot;ng&ocirc;n ngữ&quot; chung n&agrave;o cả, việc giao tiếp giữa c&aacute;c thiết bị IoT vẫn c&ograve;n l&agrave; một vấn đề nan giải. C&aacute;i th&igrave; d&ugrave;ng&nbsp;</span></span><a href="https://tinhte.vn/tags/wi-fi/"><span noto="" serif=""><span style="color:#176093"><span style="text-decoration:none">Wi-Fi</span></span></span></a><span noto="" serif=""><span style="color:#141414">, c&aacute;i th&igrave; x&agrave;i&nbsp;</span></span><a href="https://tinhte.vn/tags/bluetooth/"><span noto="" serif=""><span style="color:#176093"><span style="text-decoration:none">Bluetooth</span></span></span></a><span noto="" serif=""><span style="color:#141414">, một số kh&aacute;c th&igrave; d&ograve;ng s&oacute;ng radio hay c&aacute;c loại kết nối tầm gần. Vậy l&agrave;m sao một thiết bị c&oacute; Wi-Fi kết nối được với thiết bị chỉ c&oacute; Bluetooth? Gần như kh&ocirc;ng thể n&agrave;o. Ch&iacute;nh v&igrave; vậy, kh&ocirc;ng sai khi n&oacute;i rằng thế giới IoT đang bị thiếu đi một th&agrave;nh phần quan trọng: một giao thức kết nối kh&ocirc;ng d&acirc;y chung.<br />\r\n<br />\r\n<b>Hiện nay c&aacute;c thiết bị IoT thường d&ugrave;ng kết nối g&igrave;?</b><br />\r\n<br />\r\nCh&uacute;ng ta đ&atilde; kh&aacute; quen thuộc với Wi-Fi v&agrave; Bluetooth v&igrave; ch&uacute;ng xuất hiện đầy xung quanh m&igrave;nh. Hiện tại rất nhiều thiết bị đ&atilde; d&ugrave;ng một trong hai hoặc cả hai kết nối n&agrave;y, từ smartphone, tablet, TV, tủ lạnh, l&ograve; vi s&oacute;ng cho đến c&aacute;c b&oacute;ng đ&egrave;n th&ocirc;ng minh. B&ecirc;n cạnh đ&oacute;, những thiết bị mang t&iacute;nh c&ocirc;ng nghiệp hơn, chẳng hạn như m&aacute;y bơm, van &aacute;p suất, robot... th&igrave; hoặc d&ugrave;ng Wi-Fi, hoặc d&ugrave;ng&nbsp;</span></span><a href="https://tinhte.vn/tags/zigbee/"><span noto="" serif=""><span style="color:#176093"><span style="text-decoration:none">ZigBee</span></span></span></a><span noto="" serif=""><span style="color:#141414">. ZigBee c&ograve;n được gọi l&agrave; chuẩn 802.15.4, n&oacute; l&agrave; một giao tiếp tầm gần được kỳ vọng sẽ tăng trưởng mạnh trong v&ograve;ng 5 năm tới, từ con số 425 triệu thiết bị ở hiện tại l&ecirc;n th&agrave;nh 2,1 tỉ v&agrave;o năm 2019 theo số liệu từ ABI Research. Hiện cũng đ&atilde; c&oacute; b&oacute;ng đ&egrave;n Philips Hue l&agrave; d&ugrave;ng ZigBee.</span></span></span></span></span></p>\r\n\r\n<p align="center" style="margin-bottom:.0001pt; text-align:center; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:normal"><span style="font-family:Calibri,sans-serif"><span style="background:#f0f7fc"><span noto="" serif=""><span style="color:#141414"><img height="316" src="/share/files/image-20180809204340-2.jpeg" width="520" /></span></span></span><span noto="" serif=""><span style="color:#141414">&nbsp;​</span></span></span></span></span></p>\r\n\r\n<p style="margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span noto="" serif=""><br />\r\nAndrew Zignani, một nh&agrave; ph&acirc;n t&iacute;ch của ABI, cho hay: &quot;Khả năng ti&ecirc;u thụ điện thấp, gi&aacute; rẻ v&agrave; kết nối ngang h&agrave;ng giữa nhiều thiết bị của ZigBee sẽ khiến cho ch&uacute;ng trở th&agrave;nh c&ocirc;ng nghệ kết nối kh&ocirc;ng d&acirc;y được chọn d&ugrave;ng cho nhiều loại sản phẩm, từ nh&agrave; cửa, tự động h&oacute;a trong c&ocirc;ng nghiệp, đo lường th&ocirc;ng minh cho đến giải tr&iacute; tại gia.&quot;<br />\r\n<br />\r\nNhưng kh&ocirc;ng dừng lại ở đ&acirc;y, thị trường IoT c&ograve;n c&oacute; một v&agrave;i kế hoạch kh&aacute;c.<br />\r\n<br />\r\n<b>Bluetooth, Wi-Fi, mạng di động hay s&oacute;ng radio?</b><br />\r\n<br />\r\nPhil Williams, kiến tr&uacute;c sư trưởng của Rackspace, một c&ocirc;ng ty chuy&ecirc;n về điện to&aacute;n đ&aacute;m m&acirc;y, b&igrave;nh luận: &quot;C&aacute;c chuẩn chung trong lĩnh vực IoT vẫn c&ograve;n rất lung tung, nhưng c&aacute; nh&acirc;n t&ocirc;i th&igrave; chọn Wi-Fi bởi v&igrave; sự phổ biến của n&oacute; trong c&aacute;c hộ gia đ&igrave;nh, ngo&agrave;i ra Bluetooth LE cũng c&oacute; thể được sử dụng để gh&eacute;p nối thiết bị IoT với điện thoại di động.&quot; &Ocirc;ng c&ograve;n nghĩ đến việc tận dụng hệ thống điện trong nh&agrave; để kết nối nhanh thiết bị IoT với nhau.<br />\r\n<br />\r\nC&ograve;n mạng di động th&igrave; c&oacute; thể được d&ugrave;ng để theo d&otilde;i xem những t&agrave;i sản, g&oacute;i h&agrave;ng đang lu&acirc;n chuyển đến đ&acirc;u, hoặc để gi&aacute;m s&aacute;t c&aacute;c phương tiện giao th&ocirc;ng c&ocirc;ng cộng. V&iacute; dụ, nh&agrave; mạng AT&amp;T ở Mỹ đ&atilde; cung cấp một dịch vụ sử dụng thẻ SIM để theo d&otilde;i c&aacute;c t&aacute;c phẩm nghệ thuật khi ch&uacute;ng được chuyển giữa c&aacute;c cuộc triển l&atilde;m, hoặc khi đ&oacute;ng th&ugrave;ng để chuyển đi những nơi xa hơn.<br />\r\n<br />\r\nMartin Poppelaars, ph&oacute; chủ tịch mảng b&aacute;n h&agrave;ng của c&ocirc;ng ty c&ocirc;ng nghệ Lantronix, n&oacute;i th&ecirc;m: &quot;Về cơ bản th&igrave; những kết nối n&oacute;i tr&ecirc;n kh&ocirc;ng được xem như một giao thức, ch&uacute;ng chỉ l&agrave; c&aacute;c đường ống để nối những thiết bị lại với nhau&quot;. V&agrave; thế giới đang cần một &quot;giao thức thứ tư&quot;.<br />\r\n<br />\r\n<b>V&igrave; sao Wi-Fi, ZigBee kh&ocirc;ng phải l&agrave; lựa chọn tốt nhất?</b><br />\r\n<br />\r\nR&otilde; r&agrave;ng Wi-Fi v&agrave; ZigBee kh&ocirc;ng thể phủ s&oacute;ng đi xa. Nếu chỉ d&ugrave;ng trong nh&agrave; th&igrave; ổn, nhưng khi đưa v&agrave;o c&aacute;c xưởng sản xuất, c&aacute;c c&aacute;nh đồng năng lượng gi&aacute;, hệ phức hợp khai th&aacute;c dầu mở, đ&egrave;n đường v&agrave; n&ocirc;ng trại th&igrave; Wi-Fi kh&ocirc;ng c&ograve;n l&agrave; lựa chọn tốt. N&oacute;i c&aacute;ch kh&aacute;c, với những m&oacute;n đồ IoT ti&ecirc;u d&ugrave;ng như b&oacute;ng đ&egrave;n, l&ograve; vi s&oacute;ng, cảm biến gắn trong vườn th&igrave; c&oacute; thể x&agrave;i Wi-Fi hoặc ZigBee, nhưng c&ograve;n c&aacute;c sản phẩm c&ocirc;ng nghiệp th&igrave; kh&ocirc;ng.<br />\r\n<br />\r\nV&agrave; mảng c&ocirc;ng nghiệp mới thật sự lại mảnh đất m&agrave;u mỡ cho ứng dụng IoT. Đ&acirc;y cũng l&agrave; nơi m&agrave; c&aacute;c tập đo&agrave;n lớn như Siemens, GE, Rockwell lẫn c&aacute;c c&ocirc;ng ty c&ocirc;ng nghệ như Cisco, Intel, Oracle, Qualcomm nhắm tới. Thị trường thiết bị c&ocirc;ng nghiệp thường đặt h&agrave;ng với số lượng lớn, mức độ t&aacute;i sử dụng cao, lại c&ograve;n c&oacute; thể thu được nhiều tiền bảo tr&igrave; trong nhiều năm sau khi b&aacute;n sản phẩm n&ecirc;n kh&ocirc;ng lạ khi m&agrave; c&aacute;c tập đo&agrave;n lớn đều muốn khai th&aacute;c n&oacute;.<br />\r\n<br />\r\nOlivier Hersent, CEO, CTO ki&ecirc;m nh&agrave; s&aacute;ng lập của Actility - c&ocirc;ng ty giải ph&aacute;p mạng cho thiết bị IoT - n&oacute;i th&ecirc;m rằng IoT hiện tại sẽ tiếp tục d&ugrave;ng Wi-Fi v&agrave; ZigBee, nhưng v&igrave; c&aacute;c hạn chế về thời lượng pin, độ bao phủ v&agrave; mạng LAN kh&oacute; quản l&yacute; n&ecirc;n đ&acirc;y kh&ocirc;ng phải l&agrave; những lựa chọn tốt.<br />\r\n<br />\r\n<span style="background:#f0f7fc"><img height="666" src="/share/files/image-20180809204341-3.jpeg" width="1200" /></span><br />\r\n<br />\r\n<b>Kết nối mới sẽ l&agrave; g&igrave;?</b><br />\r\n<br />\r\nCuộc chiến đ&atilde; bắt đầu rồi. Việc sử dụng một loại s&oacute;ng radio điện năng thấp n&agrave;o đ&oacute; ch&iacute;nh l&agrave; thứ c&ograve;n thiếu trong lĩnh vực IoT. Hiện tại hai c&ocirc;ng ty Sigfox v&agrave; Actility đang x&acirc;y dựng những c&ocirc;ng nghệ băng th&ocirc;ng hẹp cho ph&eacute;p thiết bị IoT gửi dữ liệu về một trạm trung t&acirc;m với khoảng c&aacute;ch l&ecirc;n đến cả trăm kilomet. C&ocirc;ng nghệ n&agrave;y ti&ecirc;u thụ &iacute;t đến mức c&oacute; thể d&ugrave;ng năng lượng mặt trời thay thế cho pin truyền thống, v&igrave; thế mang lợi nhiều lợi &iacute;ch về mặt kinh tế v&agrave; thời gian vận h&agrave;nh.<br />\r\n<br />\r\nGiải ph&aacute;p của Actility kh&ocirc;ng chỉ l&agrave; về kết nối, n&oacute; c&ograve;n bao gồm cả một &quot;nền tảng&quot; để IoT c&oacute; thể n&oacute;i chuyện với nhau. Hiện c&oacute; một số c&ocirc;ng ty kh&aacute;c cũng đang ph&aacute;t triển một số chuẩn d&ugrave;ng cho IoT, v&iacute; dụ như GE với Predix Cloud, Samsung v&agrave; Intel cũng đang c&oacute; ước muốn tương tự. Tuy nhi&ecirc;n, để ch&uacute;ng trở th&agrave;nh một chuẩn được chấp nhận bởi cả thế giới th&igrave; c&ograve;n rất nhiều việc phải l&agrave;m.<br />\r\n<br />\r\nN&oacute;i th&ecirc;m về Predix Cloud, nền tảng n&agrave;y được GE ph&aacute;t triển nhắm đến lĩnh vực h&agrave;ng kh&ocirc;ng, năng lượng, chăm s&oacute;c sức khỏe v&agrave; vận tải. N&oacute; m&ocirc; tả chi tiết c&aacute;ch thức m&agrave; dữ liệu c&oacute; thể được chuyển từ thiết bị IoT hoặc cảm biến về một trạm trung t&acirc;m, sau đ&oacute; đem đi ph&acirc;n t&iacute;ch để dự b&aacute;o rủi ro hoặc hỏng h&oacute;c trước khi ch&uacute;ng xảy ra, cũng như tối ưu h&oacute;a chuỗi cung ứng để giảm chi ph&iacute; v&agrave; tăng thời gian sử dụng m&aacute;y m&oacute;c. Nền tảng n&agrave;y c&oacute; thể được d&ugrave;ng bởi nhiều thiết bị, nhiều nh&agrave; sản xuất kh&aacute;c nhau.<br />\r\n<br />\r\nNhiều hiệp hội cũng đ&atilde; được lập ra, chẳng hạn như li&ecirc;n minh Allseen Alliance, li&ecirc;n minh Industrial Internet Consortium, IPSO Alliance, Open Interconnect Consortium, thậm ch&iacute; cả tổ chức IEEE cũng nhảy v&agrave;o ph&aacute;t triển c&aacute;c giao thức v&agrave; kết nối d&agrave;nh cho IoT. Đ&acirc;y l&agrave; một chiến lớn m&agrave; ai cũng muốn gi&agrave;nh phần thắng, bởi một khi đ&atilde; thắng th&igrave; tiềm năng kinh tế l&agrave; v&ocirc; c&ugrave;ng rộng lớn.<br />\r\n<br />\r\nNhưng cũng cần ghi nhớ rằng hiện tại tr&ecirc;n 95% hệ thống m&aacute;y m&oacute;c v&agrave; tự động h&oacute;a c&ocirc;ng nghiệp đều đang d&ugrave;ng kết n&oacute;i kh&ocirc;ng d&acirc;y, tức l&agrave; chỉ một phần nhỏ sử dụng kh&ocirc;ng d&acirc;y m&agrave; th&ocirc;i.</span></span></span></span></p>\r\n\r\n<p align="right" style="margin-bottom:5.0pt; text-align:right; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:normal"><span style="font-family:Calibri,sans-serif"><b><i><span noto="" serif=""><span style="color:#141414">Nguồn:&nbsp;</span></span></i></b><a href="http://www.techradar.com/news/world-of-tech/the-search-for-the-fourth-protocol-the-missing-link-of-the-iot-1301721?src=rss&amp;attr=all" target="_blank"><b><i><span noto="" serif=""><span style="color:#176093"><span style="text-decoration:none">TechRadar</span></span></span></i></b></a><span noto="" serif=""><span style="color:#141414">​</span></span></span></span></span></p>', 'giao tiếp,iot,Internet of Things,công nghiệp 4.0', 'Hiện tại số lượng thiết bị kết nối mạng đang nhiều gấp đôi so với lượng người trên Trái Đất. Từ những bộ điều khiển nhiệt độ, cửa, TV cho đến các máy bơm nước, các hệ thống cảm biến, robot, điện thoại, TV, tất cả đều được gọi chung là Internet of Things (IoT).', 'cms_content/ada03d03cceec88766ce3f95147a927a.png', 0, 1, '2018-08-09 13:44:08', '2018-09-06 06:24:55'),
	(6, 'Một số chuẩn giao tiếp trong IoT (Internet of Things)', '<p align="center" style="margin-bottom:.0001pt; text-align:center; margin:0cm 0cm 10pt"><span style="font-size:36px;"><span style="vertical-align:baseline"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><b><span noto="" serif=""><span style="color:#00b050">Một số chuẩn giao tiếp trong IoT (Internet of Things)</span></span></b></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:.0001pt; margin:0cm 0cm 10pt"><span style="font-size:28px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><b><span noto="" serif=""><span style="color:#666666">1. Bluetooth</span></span></b><span noto="" serif=""><span style="color:#666666"></span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif=""><span style="color:#666666">Một c&ocirc;ng nghệ giao tiếp truyền th&ocirc;ng trong khoảng c&aacute;ch ngắn v&ocirc; c&ugrave;ng quan trọng, đ&oacute; l&agrave; Bluetooth. Hiện nay, bluetooth xuất hiện hầu hết ở c&aacute;c thiết bị như m&aacute;y t&iacute;nh, điện thoại/ smartphone,&hellip;.v&agrave; n&oacute; được dự kiến l&agrave; ch&igrave;a kh&oacute;a cho c&aacute;c sản phẩm IoT đặc biệt, cho ph&eacute;p giao tiếp thiết bị với c&aacute;c smartphone &ndash; một &ldquo;thế lực h&ugrave;ng hậu&rdquo; hiện nay.</span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif=""><span style="color:#666666">Hiện nay, BLE &ndash; Bluetooth Low Energy &ndash; hoặc Bluethooth Smart l&agrave; một giao thức được sử dụng đ&aacute;ng kể cho c&aacute;c ứng dụng IoT. Quan trọng hơn, c&ugrave;ng với một khoảng c&aacute;ch truyền tương tự như Bluetooth, BLE được thiết kế để ti&ecirc;u thụ c&ocirc;ng suất &iacute;t hơn rất nhiều. Thật tuyệt phải kh&ocirc;ng c&aacute;c bạn?</span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif=""><span style="color:#666666"><img alt="http://bkaii.com.vn/images/bluetooth.png" src="http://bkaii.com.vn/images/bluetooth.png" style="width: 500px; height: 187px;" /></span></span><span noto="" serif=""><span style="color:#666666"></span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif=""><span style="color:#666666">Tuy nhi&ecirc;n, BLE &nbsp;kh&ocirc;ng thực sự được thiết kế cho c&aacute;c ứng dụng d&ugrave;ng để truyền file v&agrave; sẽ ph&ugrave; hợp hơn cho khối dữ liệu nhỏ. N&oacute; c&oacute; một lợi thế v&ocirc; c&ugrave;ng lớn trong bối cảnh hiện nay, smartphone đang l&agrave; thiết bị kh&ocirc;ng thể thiếu được của mỗi người. Theo Bluetooth SIG, hiện c&oacute; hơn 90% điện thoại smartphone được nh&uacute;ng Bluetooth, bao gồm c&aacute;c hệ điều h&agrave;nh IOS, Android v&agrave; Window, v&agrave; dự kiến đến năm 2018 sẽ l&agrave; &rdquo; Smart Ready&rdquo;.</span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif=""><span style="color:#666666">Một số th&ocirc;ng tin kỹ thuật về Bluetooth 4.2:</span></span></span></span></span></span></p>\r\n\r\n<ul style="list-style-type:square">\r\n	<li style="margin:0cm; margin-bottom:.0001pt"><span style="font-size:20px;"><span style="line-height:normal"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span style="font-family:Wingdings"></span><span noto="" serif=""><span style="color:#666666">Tần số: 2.4 GHz</span></span></span></span></span></span></li>\r\n	<li style="margin:0cm; margin-bottom:.0001pt"><span style="font-size:20px;"><span style="line-height:normal"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span style="font-family:Wingdings"></span><span noto="" serif=""><span style="color:#666666">Phạm vi: 50-150m ( Smart / BLE)</span></span></span></span></span></span></li>\r\n	<li style="margin:0cm; margin-bottom:.0001pt"><span style="font-size:20px;"><span style="line-height:normal"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span style="font-family:Wingdings"></span><span noto="" serif=""><span style="color:#666666">Dữ liệu truyền được: 1Mbps</span></span></span></span></span></span></li>\r\n</ul>\r\n\r\n<p style="margin-bottom:.0001pt; margin:0cm 0cm 10pt"><span style="font-size:28px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><b><span noto="" serif=""><span style="color:#666666">2. &nbsp;Zigbee&nbsp;</span></span></b><span noto="" serif=""><span style="color:#666666"></span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif=""><span style="color:#666666"><img alt="http://bkaii.com.vn/images/img13.jpg" src="http://bkaii.com.vn/images/img13.jpg" style="width: 500px; height: 140px;" /></span></span><span noto="" serif=""><span style="color:#666666"></span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif=""><span style="color:#666666">Zigbee, giống như Bluetooth, l&agrave; một loại truyền th&ocirc;ng trong khoảng c&aacute;ch ngắn, hiện được sử dụng với số lượng lớn v&agrave; thường được sử dụng trong c&ocirc;ng nghiệp. Điển h&igrave;nh, Zigbee Pro v&agrave; Zigbee remote control (RF4CE) được thiết kế tr&ecirc;n nền tảng giao thức IEEE802.15.4 &ndash; l&agrave; một chuẩn giao thức truyền th&ocirc;ng vật l&yacute; trong c&ocirc;ng nghiệp hoạt động ở 2.4Ghz thường được sử dụng trong c&aacute;c ứng dụng khoảng c&aacute;ch ngắn v&agrave; dữ liệu truyền tin &iacute;t nhưng thường xuy&ecirc;n, được đ&aacute;nh gi&aacute; ph&ugrave; hợp với c&aacute;c ứng dụng trong smarthome hoặc trong một khu vực đ&ocirc; thị/khu chung cư.</span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif=""><span style="color:#666666">Zigbee / RF4CE c&oacute; một lợi thế đ&aacute;ng kể trong c&aacute;c hệ thống phức tạp cần c&aacute;c điều kiện: ti&ecirc;u thụ c&ocirc;ng suất thấp, t&iacute;nh bảo mật cao, khả năng mở rộng số lượng c&aacute;c node cao&hellip;v&iacute; dụ như y&ecirc;u cầu của c&aacute;c ứng dụng M2M v&agrave; IoT l&agrave; điển h&igrave;nh. Phi&ecirc;n bản mới nhất của Zigbee l&agrave; 3.0, trong đ&oacute; điểm nổi bật l&agrave; sự hợp nhất của c&aacute;c ti&ecirc;u chuẩn Zigbee kh&aacute;c nhau th&agrave;nh một ti&ecirc;u chuẩn duy nhất. V&iacute; dụ, sản phẩm v&agrave; kit ph&aacute;t triển của Zigbee của TI l&agrave; CC2538SF53RTQT Zigbee System-On-Chip T v&agrave; CC2538 Zigbee Development Kit.</span></span></span></span></span></span></p>\r\n\r\n<ul style="list-style-type:square">\r\n	<li style="margin:0cm; margin-bottom:.0001pt"><span style="font-size:20px;"><span style="line-height:normal"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span style="font-family:Wingdings"></span><span noto="" serif=""><span style="color:#666666">Standard: ZigBee 3.0 based on IEEE802.15.4</span></span></span></span></span></span></li>\r\n	<li style="margin:0cm; margin-bottom:.0001pt"><span style="font-size:20px;"><span style="line-height:normal"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span style="font-family:Wingdings"></span><span noto="" serif=""><span style="color:#666666">Frequency: 2.4GHz</span></span></span></span></span></span></li>\r\n	<li style="margin:0cm; margin-bottom:.0001pt"><span style="font-size:20px;"><span style="line-height:normal"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span style="font-family:Wingdings"></span><span noto="" serif=""><span style="color:#666666">Range: 10-100m</span></span></span></span></span></span></li>\r\n	<li style="margin:0cm; margin-bottom:.0001pt"><span style="font-size:20px;"><span style="line-height:normal"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span style="font-family:Wingdings"></span><span noto="" serif=""><span style="color:#666666">Data Rates: 250kbps</span></span></span></span></span></span></li>\r\n</ul>\r\n\r\n<p style="margin-bottom:.0001pt; margin:0cm 0cm 10pt"><span style="font-size:28px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><b><span noto="" serif=""><span style="color:#666666">3. Z-wave</span></span></b><span noto="" serif=""><span style="color:#666666"></span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:.0001pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif=""><span style="color:#666666">Tương tự Zigbee,&nbsp;<b>Z-Wave</b>&nbsp;l&agrave; chuẩn truyền th&ocirc;ng kh&ocirc;ng d&acirc;y trong khoảng c&aacute;ch ngắn v&agrave; ti&ecirc;u thụ rất &iacute;t năng lượng. Dung lượng truyền tải với tốc độ 100kbit/s, qu&aacute; đủ cho nhu cầu giao tiếp giữa c&aacute;c thiết bị trong c&aacute;c hệ thống IoT, M2M. Chuẩn kết nối Z-Wave v&agrave; Zigbee c&ugrave;ng hoạt động với tần số 2.4GHz, v&agrave; c&ugrave;ng được thiết kế với mức ti&ecirc;u thụ năng lượng rất &iacute;t n&ecirc;n c&oacute; thể sử dụng với c&aacute;c loại PIN di động.Zwave hoạt động ở tần số thấp hơn so với Zigbee/wifi, dao động trong c&aacute;c dải tần của 900Mhz, t&ugrave;y theo quy định ở từng khu vực kh&aacute;c nhau.</span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif=""><span style="color:#666666"><img alt="http://bkaii.com.vn/images/smartphone_zwave-3.jpg" src="http://bkaii.com.vn/images/smartphone_zwave-3.jpg" style="width: 1000px; height: 678px;" /></span></span><span noto="" serif=""><span style="color:#666666"></span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif=""><span style="color:#666666">Ưu điểm của Z-Wave l&agrave; ti&ecirc;u thụ năng lượng cực &iacute;t v&agrave; độ mở ( open platform) cực cao. Hiện nay, Z-Wave được ứng dụng chủ yếu trong ứng dụng smarthome. Đặc biệt, mỗi thiết bị Z-Wave trong hệ thống l&agrave; một thiết bị c&oacute; thể vừa thu v&agrave; vừa ph&aacute;t s&oacute;ng n&ecirc;n t&iacute;nh ổn định hệ thống được n&acirc;ng cao.</span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif=""><span style="color:#666666">Đặc biệt, Z-Wave đ&atilde; được nhiều nh&agrave; sản xuất thiết bị t&iacute;ch hợp v&agrave;o, đ&acirc;y l&agrave; một c&ocirc;ng nghệ đang được ch&uacute; &yacute; v&agrave; c&aacute;c nh&agrave; sản xuất đang tập trung nhiều hơn v&agrave;o n&oacute;.</span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif=""><span style="color:#666666">Th&ocirc;ng số kỹ thuật cơ bản:</span></span></span></span></span></span></p>\r\n\r\n<ul style="list-style-type:square">\r\n	<li style="margin:0cm; margin-bottom:.0001pt"><span style="font-size:20px;"><span style="line-height:normal"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span style="font-family:Wingdings"></span><span noto="" serif=""><span style="color:#666666">Standard: Z-Wave Alliance ZAD12837 / ITU-T G.9959</span></span></span></span></span></span></li>\r\n	<li style="margin:0cm; margin-bottom:.0001pt"><span style="font-size:20px;"><span style="line-height:normal"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span style="font-family:Wingdings"></span><span noto="" serif=""><span style="color:#666666">Frequency: 900MHz (ISM)</span></span></span></span></span></span></li>\r\n	<li style="margin:0cm; margin-bottom:.0001pt"><span style="font-size:20px;"><span style="line-height:normal"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span style="font-family:Wingdings"></span><span noto="" serif=""><span style="color:#666666">Range: 30m</span></span></span></span></span></span></li>\r\n	<li style="margin:0cm; margin-bottom:.0001pt"><span style="font-size:20px;"><span style="line-height:normal"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span style="font-family:Wingdings"></span><span noto="" serif=""><span style="color:#666666">Data Rates: 9.6/40/100kbit/s</span></span></span></span></span></span></li>\r\n</ul>\r\n\r\n<p style="margin-bottom:.0001pt; margin:0cm 0cm 10pt"><span style="font-size:28px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><b><span noto="" serif=""><span style="color:#666666">4.&nbsp;6LoWPAN</span></span></b><span noto="" serif=""><span style="color:#666666"></span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:.0001pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><b><span noto="" serif=""><span style="color:#666666">6LoWPAN</span></span></b><span noto="" serif=""><span style="color:#666666">&nbsp;l&agrave; t&ecirc;n viết tắt của IPv6 protocol over low-power wireless PANs ( tức l&agrave;: sử dụng giao thức IPv6 trong c&aacute;c mạng PAN kh&ocirc;ng d&acirc;y c&ocirc;ng suất thấp). 6LoWPAN được ph&aacute;t triển bởi hiệp hội đặc tr&aacute;ch kỹ thuật Internet IETF ( Internet Engineering Task Foce), cho ph&eacute;p truyền dữ liệu qua c&aacute;c giao thức IPv6 v&agrave; IPv4 trong c&aacute;c mạng kh&ocirc;ng d&acirc;y c&ocirc;ng suất thấp với c&aacute;c cấu tr&uacute;c mạng điểm &ndash; điểm ( P2P: point to point ) v&agrave; dạng lưới ( mesh). Ti&ecirc;u chuẩn được đặt ra để quy định c&aacute;c đặc điểm của 6LoWPAN &ndash; cho ph&eacute;p sử dụng rộng r&atilde;i trong c&aacute;c ứng dụng IoT.</span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif=""><span style="color:#666666"><img alt="http://bkaii.com.vn/images/6LowPAN.jpg" src="http://bkaii.com.vn/images/6LowPAN.jpg" style="width: 500px; height: 303px;" /></span></span><span noto="" serif=""><span style="color:#666666"></span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif=""><span style="color:#666666">Điểm kh&aacute;c của 6LoWPAN so với Zigbee, Bluetooth l&agrave;: Zigbee hay bluetooth l&agrave; c&aacute;c giao thức ứng dụng, c&ograve;n 6LoWPAN l&agrave; giao thức mạng, cho ph&eacute;p quy định cơ chế đ&oacute;ng g&oacute;i bản tin v&agrave; n&eacute;n header. Đặc biệt, IPv6 l&agrave; sự kế thừa của IPv4 v&agrave; cung cấp khoảng 5 x&nbsp;1028&nbsp;địa chỉ cho tất cả mọi đối tượng tr&ecirc;n thế giới, cho ph&eacute;p mỗi đối tượng l&agrave; một địa chỉ IP x&aacute;c định để kết nối với Internet.</span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif=""><span style="color:#666666">Được thiết kế để gửi c&aacute;c bản tin IPv6 qua mạng IEEE802.15.4 v&agrave; c&aacute;c ti&ecirc;u chuẩn IP mở rộng như: TCP, UDP, HTTP, COAP, MQTT v&agrave; Websocket, l&agrave; c&aacute;c ti&ecirc;u chuẩn cung cấp nodes end-to-end, cho ph&eacute;p c&aacute;c router kết nối mạng tới c&aacute;c IP.</span></span></span></span></span></span></p>\r\n\r\n<ul style="list-style-type:square">\r\n	<li style="margin:0cm; margin-bottom:.0001pt"><span style="font-size:20px;"><span style="line-height:normal"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span style="font-family:Wingdings"></span><span noto="" serif=""><span style="color:#666666">Standard: RFC6282.</span></span></span></span></span></span></li>\r\n	<li style="margin:0cm; margin-bottom:.0001pt"><span style="font-size:20px;"><span style="line-height:normal"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span style="font-family:Wingdings"></span><span noto="" serif=""><span style="color:#666666">Frequency: (adapted and used over a variety of other networking media including Bluetooth Smart (2.4GHz) or ZigBee or low-power RF (sub-1GHz).</span></span></span></span></span></span></li>\r\n	<li style="margin:0cm; margin-bottom:.0001pt"><span style="font-size:20px;"><span style="line-height:normal"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span style="font-family:Wingdings"></span><span noto="" serif=""><span style="color:#666666">Range: N/A.</span></span></span></span></span></span></li>\r\n	<li style="margin:0cm; margin-bottom:.0001pt"><span style="font-size:20px;"><span style="line-height:normal"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span style="font-family:Wingdings"></span><span noto="" serif=""><span style="color:#666666">Data Rates: N/A</span></span></span></span></span></span></li>\r\n</ul>\r\n\r\n<p style="margin-bottom:.0001pt; margin:0cm 0cm 10pt"><span style="font-size:28px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><b><span noto="" serif=""><span style="color:#666666">5.&nbsp;Thread</span></span></b><span noto="" serif=""><span style="color:#666666"></span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:.0001pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><b><span noto="" serif=""><span style="color:#666666">Thread&nbsp;</span></span></b><span noto="" serif=""><span style="color:#666666">l&agrave; một giao thức IP mới, dựa tr&ecirc;n nền tảng mạng IPv6 được thiết kế ri&ecirc;ng cho mảng tự động h&oacute;a trong c&aacute;c t&ograve;a nh&agrave; v&agrave; nh&agrave;. N&oacute; kh&ocirc;ng phải l&agrave; một giao thức được y&ecirc;u th&iacute;ch để ứng dụng trong c&aacute;c b&agrave;i to&aacute;n IoT như Zigbee hay Bluetooth.</span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif=""><span style="color:#666666"><img alt="http://bkaii.com.vn/images/Theard.jpg" src="http://bkaii.com.vn/images/Theard.jpg" style="width: 200px; height: 200px;" /></span></span><span noto="" serif=""><span style="color:#666666"></span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:.0001pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif=""><span style="color:#666666">Được ra mắt v&agrave;o giữa năm 2014 bởi Theard Group, giao thức Thread dựa tr&ecirc;n c&aacute;c ti&ecirc;u chuẩn kh&aacute;c nhau, bao gồm IEEE802.15.4, IPv6 v&agrave; 6LoWPAN, v&agrave; cung cấp một giải ph&aacute;p dựa tr&ecirc;n nền tảng IP cho c&aacute;c ứng dụng IoT. Được thiết kế để l&agrave;m việc với c&aacute;c sản phẩm chip của Freescale v&agrave; Silicon Labs ( vốn hỗ trợ chuẩn IE&Ecirc;802.15.4), đặc biệt c&oacute; khả năng xử l&yacute; l&ecirc;n đến 250 n&uacute;t với độ x&aacute;c thực v&agrave; t&iacute;nh m&atilde; h&oacute;a cao. Với một bản phần mềm upgrade đơn giản, cho ph&eacute;p người d&ugrave;ng c&oacute; thể chạy&nbsp;<b>Theard&nbsp;</b>tr&ecirc;n c&aacute;c thiết bị hỗ trợ IEEE802.15.4 hiện nay.</span></span></span></span></span></span></p>\r\n\r\n<ul style="list-style-type:square">\r\n	<li style="margin:0cm; margin-bottom:.0001pt"><span style="font-size:20px;"><span style="line-height:normal"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span style="font-family:Wingdings"></span><span noto="" serif=""><span style="color:#666666">Ti&ecirc;u chuẩn: Theard, dựa tr&ecirc;n IEEE802.15.4 v&agrave; 6LowPAN.</span></span></span></span></span></span></li>\r\n	<li style="margin:0cm; margin-bottom:.0001pt"><span style="font-size:20px;"><span style="line-height:normal"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span style="font-family:Wingdings"></span><span noto="" serif=""><span style="color:#666666">Tần số: 2.4GHz (ISM).</span></span></span></span></span></span></li>\r\n	<li style="margin:0cm; margin-bottom:.0001pt"><span style="font-size:20px;"><span style="line-height:normal"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span style="font-family:Wingdings"></span><span noto="" serif=""><span style="color:#666666">Phạm vi: N / A</span></span></span></span></span></span></li>\r\n</ul>\r\n\r\n<p style="margin-bottom:.0001pt; margin:0cm 0cm 10pt"><span style="font-size:28px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><b><span noto="" serif=""><span style="color:#666666">6.&nbsp;Wifi.</span></span></b><span noto="" serif=""><span style="color:#666666"></span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:.0001pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:16.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif=""><span style="color:#222222"><img alt="http://bkaii.com.vn/images/bkaii_WiFi_Logo.svg---Copy.png" src="http://bkaii.com.vn/images/bkaii_WiFi_Logo.svg---Copy.png" style="width: 300px; height: 178px;" /></span></span><span noto="" serif=""><span style="color:#222222"></span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif=""><span style="color:#666666">Wifi &nbsp;(l&agrave; viết tắt từ Wireless Fidelity hay mạng 802.11) l&agrave; hệ thống mạng kh&ocirc;ng d&acirc;y sử dụng s&oacute;ng v&ocirc; tuyến, cũng giống như điện thoại di đ&ocirc;ng, truyền h&igrave;nh v&agrave; radio.&nbsp;Kết n&ocirc;i Wifi thường l&agrave; sự lựa chọn h&agrave;ng đầu của rất nhiều kỹ sư giải ph&aacute;p bởi t&iacute;nh th&ocirc;ng dụng v&agrave; kinh tế của hệ thống wifi v&agrave; mạng LAN với m&ocirc; h&igrave;nh kết nối trong một phạm vi địa l&yacute; c&oacute; giới hạn.</span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif=""><span style="color:#666666">C&aacute;c s&oacute;ng v&ocirc; tuyến sử dụng cho WiFi gần giống với c&aacute;c s&oacute;ng v&ocirc; tuyến sử dụng cho thiết bị cầm tay, điện thoại di động v&agrave; c&aacute;c thiết bị kh&aacute;c. N&oacute; c&oacute; thể chuyển v&agrave; nhận s&oacute;ng v&ocirc; tuyến, chuyển đổi c&aacute;c m&atilde; nhị ph&acirc;n 1 v&agrave; 0 sang s&oacute;ng v&ocirc; tuyến v&agrave; ngược lại.&nbsp;Tuy nhi&ecirc;n, s&oacute;ng WiFi c&oacute; một số kh&aacute;c biệt so với c&aacute;c s&oacute;ng v&ocirc; tuyến kh&aacute;c ở chỗ:&nbsp;Ch&uacute;ng truyền v&agrave; ph&aacute;t t&iacute;n hiệu ở&nbsp;tần số&nbsp;2.4&nbsp;GHz hoặc 5&nbsp;GHz. Tần số n&agrave;y cao hơn so với c&aacute;c tần số sử dụng cho điện thoại di động, c&aacute;c thiết bị cầm tay v&agrave; truyền h&igrave;nh. Tần số cao hơn cho ph&eacute;p t&iacute;n hiệu mang theo nhiều dữ liệu hơn.</span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif=""><span style="color:#666666">Hiện nay, đa số c&aacute;c thiết bị wifi đều tu&acirc;n theo chuẩn 802.11n, được ph&aacute;t ở tần số 2.4Ghz v&agrave; đạt tốc độ xử l&yacute; tối đa 300Megabit/gi&acirc;y</span></span></span></span></span></span></p>\r\n\r\n<ul style="list-style-type:square">\r\n	<li style="margin:0cm; margin-bottom:.0001pt"><span style="font-size:20px;"><span style="line-height:normal"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span style="font-family:Wingdings"></span><span noto="" serif=""><span style="color:#666666">Standard: Based on 802.11n&nbsp;(most common usage in homes today)</span></span></span></span></span></span></li>\r\n	<li style="margin:0cm; margin-bottom:.0001pt"><span style="font-size:20px;"><span style="line-height:normal"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span style="font-family:Wingdings"></span><span noto="" serif=""><span style="color:#666666">Frequencies: 2.4GHz and 5GHz bands</span></span></span></span></span></span></li>\r\n	<li style="margin:0cm; margin-bottom:.0001pt"><span style="font-size:20px;"><span style="line-height:normal"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span style="font-family:Wingdings"></span><span noto="" serif=""><span style="color:#666666">Range: Approximately 50m</span></span></span></span></span></span></li>\r\n	<li style="margin:0cm; margin-bottom:.0001pt"><span style="font-size:20px;"><span style="line-height:normal"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span style="font-family:Wingdings"></span><span noto="" serif=""><span style="color:#666666">Data Rates: 600 Mbps maximum, but 150-200Mbps is more typical, depending on channel frequency used and number of antennas (latest 802.11-ac standard should offer 500Mbps to 1Gbps)</span></span></span></span></span></span><b style="font-family: Calibri, sans-serif; font-size: 20px;"><span noto="" serif=""><span style="color:#666666"></span></span></b></li>\r\n</ul>\r\n\r\n<p style="margin:0cm; margin-bottom:.0001pt"><span style="font-size:28px;"><strong>7.Neul</strong></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif=""><span style="color:#666666"><img alt="http://bkaii.com.vn/images/san-pham/neul-logo-RGB-1600px1.jpg" src="http://bkaii.com.vn/images/san-pham/neul-logo-RGB-1600px1.jpg" style="width: 300px; height: 212px;" /></span></span><span noto="" serif=""><span style="color:#666666"></span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:.0001pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif=""><span style="color:#666666">Tương tự Sigfox v&agrave; hoạt động ở băng tần 1Ghz, với mục ti&ecirc;u cung cấp một mạng kh&ocirc;ng d&acirc;y c&oacute; chi ph&iacute; thấp với c&aacute;c đặc trưng ti&ecirc;u biểu: độ mở rộng cao, phủ s&oacute;ng cao v&agrave; ti&ecirc;u thụ năng lượng cực thấp.&nbsp;<b>Neul</b>&nbsp;sử dụng chip Iceni, m&agrave; trong truyền th&ocirc;ng sử dụng &ldquo;the white space radio&rdquo; để truy cập v&agrave;o băng tần UHF chất lượng cao hiện đang c&oacute; sẵn do sự chuyển đổi từ kỹ thuật ti vi tương tự sang kỹ thuật số. C&ocirc;ng nghệ truyền th&ocirc;ng được gọi l&agrave; &ldquo;Weightless&rdquo;, tức l&agrave; một c&ocirc;ng nghệ mạng kh&ocirc;ng d&acirc;y phủ tr&ecirc;n diện rộng, được thiết kế cho c&aacute;c ứng dụng Iot, cạnh tranh trực tiếp với c&aacute;c giải ph&aacute;p đang c&oacute; sẵn như GPRS, 3G, CDMA v&agrave; LTE WAN. Tốc độ truyền dữ liệu c&oacute; thể dao động từ v&agrave;i bits tr&ecirc;n gi&acirc;y tới 100kbps tr&ecirc;n c&ugrave;ng một li&ecirc;n kết, v&agrave; đặc biệt l&agrave; với c&ocirc;ng nghệ n&agrave;y, thiết bị c&oacute; thể ti&ecirc;u thụ c&ocirc;ng suất rất nhỏ, từ 20 tới 30mA từ pin 2x&Acirc;, tức l&agrave; c&oacute; thể sử dụng đươc từ 10 đến 15 năm với cục pin.</span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:.0001pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><b><span noto="" serif=""><span style="color:#666666">Th&ocirc;ng số kỹ thuật</span></span></b><span noto="" serif=""><span style="color:#666666"></span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif=""><span style="color:#666666">Ti&ecirc;u chuẩn: Neul</span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif=""><span style="color:#666666">Dải tần:&nbsp;900MHz (ISM), 458MHz (UK), 470-790MHz (White Space)</span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif=""><span style="color:#666666">Khoảng c&aacute;ch: 10Km</span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:.0001pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif=""><span style="color:#666666">Tốc độ truyền: từ v&agrave;i bps tới 100kbps</span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:.0001pt; margin:0cm 0cm 10pt"><span style="font-size:28px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><b><span noto="" serif=""><span style="color:#666666">8. LIFI</span></span></b><span noto="" serif=""><span style="color:#666666"></span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:.0001pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><b><span noto="" serif="" style="font-family:"><span style="color:#666666">LIFI</span></span></b><span noto="" serif="" style="font-family:"><span style="color:#666666">&nbsp;l&agrave; một c&ocirc;ng nghệ kh&ocirc;ng d&acirc;y sử dụng c&aacute;c b&oacute;ng đ&egrave;n LED để truyền dữ liệu với tốc độ &nbsp;nhanh hơn Wifi tới 100 lần. Như vậy, với b&oacute;ng đ&egrave;n LED với chức năng thắp s&aacute;ng, giờ c&oacute; th&ecirc;m chức năng truyền dữ liệu tốc độ cao.&nbsp;C&ocirc;ng ty Velmenni đ&atilde; c&oacute; v&agrave;i dự &aacute;n th&iacute; điểm, trong đ&oacute; c&oacute; tạo một kh&ocirc;ng gian mạng ko d&acirc;y trong văn ph&ograve;ng, sử dụng &aacute;nh s&aacute;ng đ&egrave;n LED thay v&igrave; d&ugrave;ng s&oacute;ng radio để truyền dữ liệu như của Wi-Fi. CEO của Velmenni, Deepak Solanki, hồi giữa năm 2015 cho rằng c&ocirc;ng ty hy vọng sẽ mang sản phẩm n&agrave;y đến được với nhiều người sử dụng trong v&ograve;ng 3-4 năm tới. C&ocirc;ng nghệ đột ph&aacute; n&agrave;y được c&ocirc;ng ty đặt cho c&aacute;i t&ecirc;n l&agrave; Li-Fi, lần đầu được một gi&aacute;o sư đại học Edinburgh, gi&aacute;o sư Harald Haas, giới thiệu c&aacute;ch nay 4 năm.</span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif="" style="font-family:"><span style="color:#666666"><img alt="http://bkaii.com.vn/images/lifi.jpg" src="http://bkaii.com.vn/images/lifi.jpg" style="width:567px; height:366px" /></span></span><span noto="" serif="" style="font-family:"><span style="color:#666666"></span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif">&nbsp;</span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif="" style="font-family:"><span style="color:#666666">Li-Fi sử dụng dải tần &aacute;nh s&aacute;ng m&agrave; mắt người nh&igrave;n thấy được để l&agrave;m phương tiện truyền dữ liệu. Tuy vậy, người d&ugrave;ng kh&ocirc;ng thể sử dụng bất kỳ nguồn &aacute;nh s&aacute;ng đ&egrave;n điện n&agrave;o m&agrave; phải cần một&nbsp;nguồn s&aacute;ng&nbsp;ri&ecirc;ng để điều biến t&iacute;n hiệu, tạo th&agrave;nh luồng dữ liệu. Hiện thời, t&iacute;nh năng n&agrave;y chỉ thực hiện được với c&aacute;c b&oacute;ng đ&egrave;n&nbsp;LED&nbsp;đạt chuẩn, c&oacute; t&iacute;ch hợp một chip đặc biệt v&agrave; c&oacute; th&ecirc;m một bộ nhận t&iacute;n hiệu &aacute;nh s&aacute;ng đặc biệt để c&oacute; thể giải m&atilde; được t&iacute;n hiệu &aacute;nh s&aacute;ng truyền đi từ đ&egrave;n LED.</span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif="" style="font-family:"><span style="color:#666666"><img alt="http://bkaii.com.vn/images/Giai-phap/lifi-1.jpg" src="http://bkaii.com.vn/images/Giai-phap/lifi-1.jpg" style="width: 1000px; height: 686px;" /></span></span><span noto="" serif="" style="font-family:"><span style="color:#666666"></span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif="" style="font-family:"><span style="color:#666666">Kỹ thuật điều biến &aacute;nh s&aacute;ng kh&ocirc;ng ảnh hưởng g&igrave; đến sức khỏe con người, nhất l&agrave; về mắt. Gi&aacute;o sư Haas giới thiệu c&ocirc;ng nghệ n&agrave;y tại diễn đ&agrave;n TED Global hồi năm 2011, cho rằng ch&uacute;ng ta thậm ch&iacute; c&oacute; thể giảm độ s&aacute;ng của đ&egrave;n thật thấp đến mức gần như l&agrave; tắt, nhưng t&iacute;n hiệu truyền dữ liệu vẫn hoạt động như thường.</span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif="" style="font-family:"><span style="color:#666666">Năm 2011, Haas đ&atilde; tr&igrave;nh diễn mẫu thiết bị của &ocirc;ng tr&ecirc;n bục diễn thuyết&nbsp;của TED. Từ đ&oacute;, &ocirc;ng đồng s&aacute;ng lập ra c&ocirc;ng ty khởi nghiệp pureLiFi v&agrave; sản xuất được hai sản phẩm truyền dữ liệu bằng &aacute;nh s&aacute;ng. Nếu Li-Fi được ứng dụng rộng r&atilde;i, c&ocirc;ng nghệ n&agrave;y c&oacute; thể giải quyết được một số rắc rối m&agrave; Wi-Fi gặp phải hiện nay. Ngo&agrave;i tốc độ kết nối, s&oacute;ng radio phải c&oacute; đủ dải tần để nhiều thiết bị c&ugrave;ng kết nối một l&uacute;c. Với Li-Fi th&igrave; kh&ocirc;ng gặp kh&oacute; khăn n&agrave;y v&igrave; dải tần &aacute;nh s&aacute;ng lớn hơn gấp 10.000 lần so với dải tần radio.</span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:.0001pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif="" style="font-family:"><span style="color:#666666">Trong khi Li-Fi tỏ ra đầy tiềm năng nhưng n&oacute; cũng c&oacute; những hạn chế nhất định, quan trọng nhất l&agrave; &aacute;nh s&aacute;ng kh&ocirc;ng thể đi xuy&ecirc;n tường được như s&oacute;ng radio, nghĩa l&agrave; thiết bị phải ở đ&acirc;u nh&igrave;n thấy được. Hơn nữa, để chắn s&oacute;ng Li-Fi, người d&ugrave;ng đơn giản chỉ cần bịt b&oacute;ng đ&egrave;n lại l&agrave; dữ liệu gặp rắc rối ngay lập tức. Li-Fi cũng kh&ocirc;ng hoạt động được ngo&agrave;i trời nắng v&igrave; &aacute;nh s&aacute;ng đ&egrave;n LED kh&ocirc;ng thể s&aacute;ng hơn được &aacute;nh mặt trời.</span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:.0001pt; margin:0cm 0cm 10pt"><span style="font-size:28px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><b><span noto="" serif=""><span style="color:#666666">9. LoRa</span></span></b><span noto="" serif=""><span style="color:#666666"></span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:.0001pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><b><span noto="" serif="" style="font-family:"><span style="color:#666666">LoRa</span></span></b><span noto="" serif="" style="font-family:"><span style="color:#666666">&nbsp;l&agrave; viết tắt của Long Range Radio được nghi&ecirc;n cứu v&agrave; ph&aacute;t triển bởi Cycleo v&agrave; sau n&agrave;y được mua lại bởi c&ocirc;ng ty Semtech năm 2012. Với c&ocirc;ng nghệ n&agrave;y, ch&uacute;ng ta c&oacute; thể truyền dữ liệu với khoảng c&aacute;ch l&ecirc;n h&agrave;ng km m&agrave; kh&ocirc;ng cần c&aacute;c mạch khuếch đại c&ocirc;ng suất; từ đ&oacute; gi&uacute;p tiết kiệm năng lượng ti&ecirc;u thụ khi truyền/nhận dữ liệu. Do đ&oacute;, LoRa c&oacute; thể được &aacute;p dụng rộng r&atilde;i trong c&aacute;c ứng dụng thu thập dữ liệu như sensor network trong đ&oacute; c&aacute;c sensor node c&oacute; thể gửi gi&aacute; trị đo đạc về trung t&acirc;m c&aacute;ch xa h&agrave;ng km v&agrave; c&oacute; thể hoạt động với battery trong thời gian d&agrave;i trước khi cần thay pin.</span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif="" style="font-family:"><span style="color:#666666"><img alt="http://bkaii.com.vn/images/com_hikashop/LoRa_bkaii.jpg" src="http://bkaii.com.vn/images/com_hikashop/LoRa_bkaii.jpg" style="width: 800px; height: 1067px;" /></span></span><span noto="" serif="" style="font-family:"><span style="color:#666666"></span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:.0001pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><b><span noto="" serif="" style="font-family:"><span style="color:#666666">Nguy&ecirc;n l&yacute; hoạt động của LoRa ra sao?</span></span></b><span noto="" serif="" style="font-family:"><span style="color:#666666"></span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif="" style="font-family:"><span style="color:#666666">LoRa sử dụng kỹ thuật điều chế gọi l&agrave; Chirp Spread Spectrum. C&oacute; thể hiểu n&ocirc;m na nguy&ecirc;n l&yacute; n&agrave;y l&agrave; dữ liệu sẽ được băm bằng c&aacute;c xung cao tần để tạo ra t&iacute;n hiệu c&oacute; d&atilde;y tần số cao hơn tần số của dữ liệu gốc (c&aacute;i n&agrave;y gọi l&agrave; chipped); sau đ&oacute; t&iacute;n hiệu cao tần n&agrave;y tiếp tục được m&atilde; ho&aacute; theo c&aacute;c chuỗi chirp signal (l&agrave; c&aacute;c t&iacute;n hiệu h&igrave;nh sin c&oacute; tần số thay đổi theo thời gian; c&oacute; 2 loại chirp signal l&agrave; up-chirp c&oacute; tần số tăng theo thời gian v&agrave; down-chirp c&oacute; tần số giảm theo thời gian; v&agrave; việc m&atilde; ho&aacute; theo nguy&ecirc;n tắc bit 1 sẽ sử dụng up-chirp, v&agrave; bit 0 sẽ sử dụng down-chirp) trước khi truyền&nbsp;ra anten để gửi đi.</span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif="" style="font-family:"><span style="color:#666666">Theo Semtech c&ocirc;ng bố th&igrave; nguy&ecirc;n l&yacute; n&agrave;y gi&uacute;p giảm độ phức tạp v&agrave; độ ch&iacute;nh x&aacute;c cần thiết của mạch nhận để c&oacute; thể giải m&atilde; v&agrave; điều chế lại dữ liệu; hơn nữa LoRa kh&ocirc;ng cần c&ocirc;ng suất ph&aacute;t lớn m&agrave; vẫn c&oacute; thể truyền xa v&igrave; t&iacute;n hiệu Lora c&oacute; thể được nhận ở khoảng c&aacute;ch xa ngay cả độ mạnh t&iacute;n hiệu thấp hơn cả nhiễu m&ocirc;i trường xung quanh.</span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif="" style="font-family:"><span style="color:#666666">Băng tần l&agrave;m việc của LoRa từ 430MHz đến 915MHz cho từng khu vực kh&aacute;c nhau tr&ecirc;n thế giới:</span></span></span></span></span></span></p>\r\n\r\n<ul style="list-style-type:square">\r\n	<li style="margin:0cm; margin-bottom:.0001pt"><span style="font-size:20px;"><span style="line-height:normal"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span style="font-family:Wingdings"></span><span noto="" serif="" style="font-family:"><span style="color:#666666">430MHz cho ch&acirc;u &Aacute;</span></span></span></span></span></span></li>\r\n	<li style="margin:0cm; margin-bottom:.0001pt"><span style="font-size:20px;"><span style="line-height:normal"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span style="font-family:Wingdings"></span><span noto="" serif="" style="font-family:"><span style="color:#666666">780MHz cho Trung Quốc</span></span></span></span></span></span></li>\r\n	<li style="margin:0cm; margin-bottom:.0001pt"><span style="font-size:20px;"><span style="line-height:normal"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span style="font-family:Wingdings"></span><span noto="" serif="" style="font-family:"><span style="color:#666666">433MHz hoặc 866MHz cho ch&acirc;u &Acirc;u</span></span></span></span></span></span></li>\r\n	<li style="margin:0cm; margin-bottom:.0001pt"><span style="font-size:20px;"><span style="line-height:normal"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span style="font-family:Wingdings"></span><span noto="" serif="" style="font-family:"><span style="color:#666666">915MHz cho USA</span></span></span></span></span></span></li>\r\n</ul>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif="" style="font-family:"><span style="color:#666666">Nhờ sử dụng chirp signal m&agrave; c&aacute;c t&iacute;n hiệu LoRa với c&aacute;c chirp rate kh&aacute;c nhau c&oacute; thể hoạt động trong c&ugrave;ng 1 khu vực m&agrave; kh&ocirc;ng g&acirc;y nhiễu cho nhau. Điều n&agrave;y cho ph&eacute;p nhiều thiết bị LoRa c&oacute; thể trao đổi dữ liệu tr&ecirc;n nhiều k&ecirc;nh đồng thời (mỗi k&ecirc;nh cho 1 chirprate)</span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif="" style="font-family:"><span style="color:#666666">Radio packet của LoRa như h&igrave;nh sau:</span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif="" style="font-family:"><span style="color:#666666"><img src="/share/files/image-20180809204915-4.png" style="width: 1000px; height: 299px;" /></span></span><span noto="" serif="" style="font-family:"><span style="color:#666666"></span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif="" style="font-family:"><span style="color:#666666">C&aacute;c kh&aacute;i niệm SpreadingFactor, CodingRate sẽ được giới thiệu ở phần tiếp theo. Ở đ&acirc;y ch&uacute;ng ta chỉ tập trung v&agrave;o c&aacute;c dữ liệu trong 1 radio packet của LoRa, bao gồm:</span></span></span></span></span></span></p>\r\n\r\n<ul style="list-style-type:square">\r\n	<li style="margin:0cm; margin-bottom:.0001pt"><span style="font-size:20px;"><span style="line-height:normal"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span style="font-family:Wingdings"></span><span noto="" serif="" style="font-family:"><span style="color:#666666">Preamble: L&agrave; chuỗi binary để bộ nhận detect được t&iacute;n hiệu của LoRa packet trong kh&ocirc;ng kh&iacute;</span></span></span></span></span></span></li>\r\n	<li style="margin:0cm; margin-bottom:.0001pt"><span style="font-size:20px;"><span style="line-height:normal"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span style="font-family:Wingdings"></span><span noto="" serif="" style="font-family:"><span style="color:#666666">Header: chứa th&ocirc;ng tin về size của Payload cũng như c&oacute; PayloadCRC &nbsp;hay kh&ocirc;ng. Gi&aacute; trị của Header cũng được check CRC k&egrave;m theo</span></span></span></span></span></span></li>\r\n	<li style="margin:0cm; margin-bottom:.0001pt"><span style="font-size:20px;"><span style="line-height:normal"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span style="font-family:Wingdings"></span><span noto="" serif="" style="font-family:"><span style="color:#666666">Payload: l&agrave; dữ liệu ứng dụng truyền qua LoRa</span></span></span></span></span></span></li>\r\n	<li style="margin:0cm; margin-bottom:.0001pt"><span style="font-size:20px;"><span style="line-height:normal"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span style="font-family:Wingdings"></span><span noto="" serif="" style="font-family:"><span style="color:#666666">Payload: gi&aacute; trị CRC của Payload. Nếu c&oacute; PayloadCRC, LoRa chip sẽ tự kiểm tra dữ liệu trong Payload v&agrave; b&aacute;o l&ecirc;n nếu CRC OK hay kh&ocirc;ng</span></span></span></span></span></span></li>\r\n</ul>\r\n\r\n<p style="margin-bottom:.0001pt; margin:0cm 0cm 10pt"><span style="font-size:28px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><b><span noto="" serif=""><span style="color:#666666">10. PLC</span></span></b><span noto="" serif=""><span style="color:#666666"></span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:.0001pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif="" style="font-family:"><span style="color:#666666">C&ocirc;ng nghệ&nbsp;<b>PLC</b>&nbsp;(Power Line Communication &ndash; truyền th&ocirc;ng qua đường d&acirc;y điện) l&agrave; c&ocirc;ng nghệ sử dụng đường d&acirc;y điện như một đường d&acirc;y truyền th&ocirc;ng dựa v&agrave;o nguy&ecirc;n l&yacute; chồng lấn những t&iacute;n hiệu truyền th&ocirc;ng cao tần với s&oacute;ng c&oacute; tần số thấp sẵn c&oacute; tr&ecirc;n đường d&acirc;y diện. Hiện nay c&ugrave;ng với sự ph&aacute;t triển mạnh mẽ trong ng&agrave;nh c&ocirc;ng nghiệp phần cứng , đ&atilde; c&oacute; những thiết bị PLC hỗ trợ tốc độ l&ecirc;n đến 1200Mbps.</span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif="" style="font-family:"><span style="color:#666666"><img src="/share/files/image-20180809204915-5.jpeg" style="width: 1000px; height: 621px;" /></span></span><span noto="" serif="" style="font-family:"><span style="color:#666666"></span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:.0001pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:16.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif="" style="font-family:"><span style="color:#222222">Ưu điểm của c&ocirc;ng nghệ PLC</span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif="" style="font-family:"><span style="color:#666666">Ưu điểm nổi bật của PLC l&agrave; t&iacute;nh kinh tế do sử dụng mạng lưới điện sẵn c&oacute; l&agrave;m d&acirc;y truyền th&ocirc;ng. C&aacute;c modem PLC cho ph&eacute;p nhận v&agrave; gởi th&ocirc;ng tin tại c&aacute;c ổ cắm điện tr&ecirc;n tường nh&agrave; ,như vậy to&agrave;n bộ mạng điện sẽ trong to&agrave;n nh&agrave; sẽ trở th&agrave;nh một mạng Lan nội bộ.Chỉ cần một đường truyền internet băng th&ocirc;ng rộng nối tới trạm biến &aacute;p th&igrave; cả một khu vực d&acirc;n cư lớn sẽ c&oacute; khả năng truy cập Internet tốc độ cao m&agrave; kh&ocirc;ng cần phải lắp đặt hệ thống c&aacute;p internet đến từng gia đ&igrave;nh.</span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:.0001pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:16.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif="" style="font-family:"><span style="color:#222222">Nguy&ecirc;n l&yacute; của PLC</span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif="" style="font-family:"><span style="color:#666666">PLC sử dụng chung đường d&acirc;y điện để truyền tải điện năng v&agrave; truyền th&ocirc;ng. Điện năng xoay chiều l&agrave; c&aacute;c s&oacute;ng sin tuần ho&agrave;n c&oacute; tần số 50/60Hz, tr&ecirc;n c&aacute;c s&oacute;ng n&agrave;y ch&uacute;ng ta sẽ tiến h&agrave;nh chồng lấn l&ecirc;n những s&oacute;ng mang t&iacute;n hiệu dữ liệu ở tần số cao từ 2-30MHz, thực thi việc truyền nhận những t&iacute;n hiệu dữ liệu ở tốc độ cao.&nbsp;<img src="/share/files/image-20180809204915-6.jpeg" style="width: 1000px; height: 480px;" /></span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:.0001pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><i><span noto="" serif="" style="font-family:"><span style="color:#666666">Sơ đồ nguy&ecirc;n l&yacute; hoạt động PLC</span></span></i><span noto="" serif="" style="font-family:"><span style="color:#666666"></span></span></span></span></span></span></p>\r\n\r\n<p style="margin-bottom:7.5pt; margin:0cm 0cm 10pt"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif="" style="font-family:"><span style="color:#666666">Theo như sơ đồ ở tr&ecirc;n , những t&iacute;n hiệu dữ liệu tần số cao tr&ecirc;n đường c&aacute;p quang sẽ được tiến h&agrave;nh chồng lấn với s&oacute;ng sin điện năng xoay chiều tr&ecirc;n c&ugrave;ng một đường d&acirc;y điện nối từ trạm biến &aacute;p.T&iacute;n hiệu sau khi được chồng lấn n&agrave;y sẽ theo hệ thống ph&acirc;n phối điện đi đến khắp c&aacute;c ổ cắm điện trong nh&agrave;.T&iacute;n hiệu n&agrave;y sẽ được giải m&atilde; bằng c&aacute;c PLC modem, th&ocirc;ng qua bộ lọc c&aacute;c t&iacute;n hiệu ,dữ liệu sẽ được lấy ra theo một đường ri&ecirc;ng biệt v&agrave; kết nối đến c&aacute;c thiết bị trong nh&agrave;.</span></span></span></span></span></span></p>\r\n\r\n<p style="margin: 0cm 0cm 10pt; text-align: right;"><span style="font-size:20px;"><span style="line-height:12.0pt"><span style="vertical-align:baseline"><span style="font-family:Calibri,sans-serif"><span noto="" serif="" style="font-family:"><span style="color:#666666">Nguồn: http://tapit.vn/mot-chuan-giao-tiep-trong-iot-internet-things/</span></span></span></span></span></span></p>', 'giao tiếp,iot,Internet of Things,công nghiệp 4.0', 'LoRa là viết tắt của Long Range Radio được nghiên cứu và phát triển bởi Cycleo và sau này được mua lại bởi công ty Semtech năm 2012. Với công nghệ này, chúng ta có thể truyền dữ liệu với khoảng cách lên hàng km mà không cần các mạch khuếch đại công suất', 'cms_content/8897eee9cbdb5c39a14a1048c5941197.png', 0, 1, '2018-08-09 13:50:36', '2018-09-06 06:24:44'),
	(7, '9 Loại Công Nghệ In 3D Cơ Bản', '<p style="text-align: center;"><span style="font-size:20px;"></span><span style="font-size:36px;"><span style="color:#27ae60;"><strong>T&igrave;m hiểu c&ocirc;ng nghệ in 3D: 9 loại c&ocirc;ng nghệ in 3D cơ bản</strong></span></span><span style="font-size:20px;"></span></p>\r\n\r\n<p><span style="font-size:20px;">&nbsp;Dưới đ&acirc;y l&agrave; 9 C&ocirc;ng nghệ in 3D đang được &aacute;p dụng tr&ecirc;n thế giới: </span></p>\r\n\r\n<p><span style="font-size:20px;"></span><span style="font-size:28px;"><strong><span style="color:#f39c12;">1. C&ocirc;ng nghệ FDM&nbsp; (Fused Deposition Modeling):</span></strong></span><span style="font-size:20px;"></span></p>\r\n\r\n<p><span style="font-size:20px;"> M&aacute;y in 3D d&ugrave;ng c&ocirc;ng nghệ FDM x&acirc;y dựng mẫu bằng c&aacute;ch đ&ugrave;n nhựa n&oacute;ng chảy rồi ho&aacute; rắn từng lớp tạo n&ecirc;n cấu tr&uacute;c chi tiết dạng khối. c&ocirc;ng nghệ n&agrave;y được sản xuất để thương mại h&oacute;a từ năm 1991. Với gi&aacute; th&agrave;nh m&aacute;y, vật liệu in 3D rẻ n&ecirc;n c&ocirc;ng nghệ n&agrave;y đang l&agrave; c&ocirc;ng nghệ in 3D ph&aacute;t triển mạnh nhất v&agrave; số lượng thiết bị chiếm nhiều nhất ở Việt Nam. </span></p>\r\n\r\n<p style="text-align: center;"><img alt="" src="/share/files/FG5HHUYIJ37445G_LARGE.jpg" style="width: 800px; height: 800px;" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style="text-align: center;"><img alt="" src="/share/files/SCHEMATIC-OF-FDM-PROCESS.png" style="width: 800px; height: 696px;" /></p>\r\n\r\n<p style="text-align: center;">&nbsp;</p>\r\n\r\n<p style="text-align: center;">&nbsp;</p>\r\n\r\n<p style="text-align: center;"><iframe frameborder="0" height="450" scrolling="no" src="https://www.youtube.com/embed/cyXHHEfOAaA?feature=player_embedded" width="800"></iframe></p>\r\n\r\n<p style="text-align: center;">&nbsp;</p>\r\n\r\n<p><span style="font-size:28px;"><strong><span style="color:#f39c12;">2. C&ocirc;ng nghệ SLA (Stereolithography): </span></strong></span><span style="font-size:20px;"></span></p>\r\n\r\n<p><span style="font-size:20px;">Được ph&aacute;t triển bởi Chuck Hull đầu ti&ecirc;n v&agrave;o năm 1983, c&ocirc;ng nghệ SLA thực tế l&agrave; l&agrave; kỹ thuật d&ugrave;ng tia UV l&agrave;m cứng từng lớp vật liệu in 3D l&agrave; nhựa dạng lỏng, nhiều rất nhiều lớp như vậy sẽ tạo n&ecirc;n vật thể in 3D SLA. Lớp in SLA c&oacute; thể đạt từ 0.06, 0.08, 0.1,&hellip; mm. </span></p>\r\n\r\n<p><span style="font-size:20px;">Về c&aacute;c c&ocirc;ng nghệ in 3D sử dụng vật liệu nhựa, th&igrave; đ&acirc;y l&agrave; c&ocirc;ng nghệ tạo ra sản phẩm in 3D l&agrave; nhựa tốt nhất, c&oacute; thể sử dụng ngay, độ ph&acirc;n giải, độ mịn cao, c&oacute; thể n&oacute;i l&agrave; cao nhất hiện nay. </span></p>\r\n\r\n<p><span style="font-size:20px;">SLA đang được sử dụng nhiều trong c&aacute;c nh&agrave; m&aacute;y sản xuất gi&agrave;y d&eacute;p cho c&aacute;c h&atilde;ng lớn như Nike, Adidas,&hellip;để thực hiện c&ocirc;ng đoạn in 3D khu&ocirc;n gi&agrave;y v&agrave; tạo mẫu đế gi&agrave;y nhanh. </span></p>\r\n\r\n<p style="text-align: center;"><iframe frameborder="0" height="450" scrolling="no" src="https://www.youtube.com/embed/yW4EbCWaJHE?feature=player_embedded" width="800"></iframe></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style="font-size:28px;"><strong><span style="color:#f39c12;">3. C&ocirc;ng nghệ DLP (Digital Light Processing):</span></strong></span><span style="font-size:20px;"> </span></p>\r\n\r\n<p><span style="font-size:20px;"><span style="display: none;">&nbsp;</span>C&ocirc;ng nghệ DLP được ph&aacute;t minh v&agrave;o năm 1987 bởi Larry Hornbeck v&agrave; trở n&ecirc;n cực kỳ phổ biến trong m&aacute;y chiếu.&nbsp;DLP sử dụng một mạng lưới m&aacute;y t&iacute;nh điều khiển, vi-gương, đặt ra tr&ecirc;n một chip b&aacute;n dẫn.&nbsp;Những gương nhỏ nghi&ecirc;ng qua lại.&nbsp;Khi một gương nghi&ecirc;ng, n&oacute; phản xạ &aacute;nh s&aacute;ng, tạo một pixel s&aacute;ng.&nbsp;Khi gương nghi&ecirc;ng theo c&aacute;ch kh&aacute;c, c&aacute;c điểm ảnh tối.&nbsp;C&ocirc;ng nghệ n&agrave;y được sử dụng trong m&aacute;y chiếu phim, điện thoại di động, v&agrave; cũng cho in ấn 3D.&nbsp;Một trong những lợi &iacute;ch cho in ấn 3D l&agrave; tốc độ của n&oacute;: Bạn c&oacute; thể in c&aacute;c lớp trong t&iacute;ch tắc với loại m&aacute;y in 3D. </span></p>\r\n\r\n<p><span style="font-size:20px;">M&aacute;y in 3D DLP chủ yếu được sử dụng trong m&ocirc;i trường chuy&ecirc;n nghiệp.&nbsp;Đ&acirc;y l&agrave; loại m&aacute;y in 3D tốc đọ cao với độ ph&acirc;n giải tuyệt vời. </span></p>\r\n\r\n<p style="text-align: center;"><iframe frameborder="0" height="450" scrolling="no" src="https://www.youtube.com/embed/9nb8mM3uEIc?feature=player_embedded" width="800"></iframe></p>\r\n\r\n<p><span style="font-size:28px;"><strong><span style="color:#f39c12;">4. C&ocirc;ng nghệ SLS (Selective Laser Sintering):</span></strong></span><span style="font-size:20px;"></span></p>\r\n\r\n<p><span style="font-size:20px;"> C&ocirc;ng nghệ SLS vận h&agrave;nh tương tự SLA nhưng vật liệu ở dạng bột, thủy tinh,&hellip;c&oacute; thể tạo lớp bằng vật liệu phụ trợ l&agrave; keo chuy&ecirc;n dụng (c&oacute; khi k&egrave;m m&agrave;u sắc CMYK, RGB nếu in 3D đa sắc m&agrave;u), hoặc tia laser, tia UV,&hellip;. </span></p>\r\n\r\n<p><span style="font-size:20px;">Đ&acirc;y l&agrave; loại m&aacute;y in 3D đ&ograve;i hỏi việc sử dụng laser c&ocirc;ng suất lớn đắt tiền, tuy nhi&ecirc;n, trong gi&aacute; của n&oacute; kh&aacute; cao với của người ti&ecirc;u d&ugrave;ng phổ th&ocirc;ng.</span></p>\r\n\r\n<p style="text-align: center;"><iframe frameborder="0" height="450" scrolling="no" src="https://www.youtube.com/embed/wdRswasftfI?feature=player_embedded" width="800"></iframe></p>\r\n\r\n<p><span style="font-size:20px;"> </span><span style="font-size:28px;"><strong><span style="color:#f39c12;">5. C&ocirc;ng nghệ SLM (Selective Laser Melting):<span style="display: none;">&nbsp;</span> </span></strong></span><span style="font-size:20px;"></span></p>\r\n\r\n<p><span style="font-size:20px;">Đ&acirc;y l&agrave; c&ocirc;ng nghệ in 3D kim loại, sử dụng vật liệu dạng bột titan, bột nh&ocirc;m, bột đồng, bột th&eacute;p để l&agrave;m vật liệu in 3D. C&ocirc;ng nghệ SLM vận h&agrave;nh tương tự SLA, SLS nhưng sử dụng tia UV, tia laser cường độ lớn. </span></p>\r\n\r\n<p><span style="font-size:20px;">Vật liệu điển h&igrave;nh được sử dụng l&agrave; th&eacute;p kh&ocirc;ng gỉ, nh&ocirc;m, titan, v&agrave; cobalt chrome.&nbsp;Đối với c&aacute;c ứng dụng trong h&agrave;ng kh&ocirc;ng vũ trụ hoặc chỉnh h&igrave;nh y tế ng&agrave;nh c&ocirc;ng nghiệp, SLM được sử dụng để tạo c&aacute;c bộ phận với h&igrave;nh học phức tạp v&agrave; cấu tr&uacute;c th&agrave;nh m&otilde;ng, với c&aacute;c k&ecirc;nh ẩn hoặc khoảng trống.&nbsp;Ở những nơi kh&aacute;c, như trong đoạn video tr&ecirc;n, n&oacute; được sử dụng để chế tạo tuabin kh&iacute; cho ng&agrave;nh c&ocirc;ng nghiệp năng lượng. </span></p>\r\n\r\n<p><span style="font-size:20px;">V&igrave; gi&aacute; th&agrave;nh thiết bị (m&aacute;y in 3d kim loại) v&agrave; vật liệu đắt đỏ n&ecirc;n c&ocirc;ng nghệ n&agrave;y chưa thực sự ph&aacute;t triển tại VN. C&aacute;c nước c&oacute; sản xuất m&aacute;y v&agrave; sử dụng c&ocirc;ng nghệ n&agrave;y nhiều nhất đ&oacute; l&agrave;: Trung Quốc, Mỹ, Đức, &Yacute;,&hellip; </span></p>\r\n\r\n<p><span style="font-size:20px;">Ở VN một số đơn vị nha khoa sử dụng m&aacute;y in 3D kim loại để sản xuất răng. Gi&aacute; m&aacute;y in 3D kim loại &gt;= $200.000. </span></p>\r\n\r\n<p style="text-align: center;"><iframe frameborder="0" height="450" scrolling="no" src="https://www.youtube.com/embed/CW3-1Qapp_s?feature=player_embedded" width="800"></iframe></p>\r\n\r\n<p><span style="font-size:28px;"><strong><span style="color:#f39c12;">6. C&ocirc;ng nghệ EBM (Electron Beam Melting): </span></strong></span></p>\r\n\r\n<p><span style="font-size:20px;">Ngược lại với SLM, kỹ thuật EBM sử dụng một ch&ugrave;m tia điện tử m&aacute;y t&iacute;nh điều khiển dưới ch&acirc;n kh&ocirc;ng để l&agrave;m tan chảy ho&agrave;n to&agrave;n bột kim loại ở nhiệt độ cao l&ecirc;n đến 1000 &deg; C. </span></p>\r\n\r\n<p><span style="font-size:20px;">Đ&acirc;y l&agrave; loại m&aacute;y in 3D c&oacute; thể sử dụng kim loại như titan tinh khiết, Inconel718, v&agrave; Inconel625 để chế tạo phụ t&ugrave;ng h&agrave;ng kh&ocirc;ng vũ trụ v&agrave; cấy gh&eacute;p y tế.&nbsp;Nhưng trong khi c&aacute;c c&ocirc;ng nghệ in 3D hiện nay n&oacute; rất chậm v&agrave; rất tốn k&eacute;m. </span></p>\r\n\r\n<p><img alt="" src="http://in3dcongnghiep.com/wp-content/uploads/2017/04/cong-nghe-in-3d-ebm.jpg" style="width: 800px; height: 534px;" /></p>\r\n\r\n<p><span style="font-size:28px;"><strong><span style="color:#f39c12;">7. C&ocirc;ng nghệ LOM (Laminated Object Manufacturing): </span></strong></span><span style="font-size:20px;"></span></p>\r\n\r\n<p><span style="font-size:20px;">LOM sử dụng lớp giấy, nhựa hoặc kim loại c&aacute;n mỏng d&iacute;nh bọc, được hợp nhất dưới nhiệt v&agrave; &aacute;p suất v&agrave; định h&igrave;nh bằng c&aacute;ch cắt bằng tia laser m&aacute;y t&iacute;nh kiểm so&aacute;t hoặc dao.&nbsp;Điều n&agrave;y đ&ocirc;i khi sau đ&oacute; gia c&ocirc;ng v&agrave; khoan.&nbsp;C&aacute;c đối tượng 3D được tạo ra lớp-by-lớp, v&agrave; sau khi vật liệu dư thừa được cắt bỏ, đối tượng c&oacute; thể được đ&aacute;nh giấy r&aacute;p hoặc được gắn v&agrave;o với sơn. </span></p>\r\n\r\n<p><span style="font-size:20px;">Mặc d&ugrave; k&iacute;ch thước ch&iacute;nh x&aacute;c của c&aacute;c loại m&aacute;y in 3D n&agrave;y l&agrave; hơi &iacute;t hơn SLA hay SLS,&nbsp;LOM l&agrave; một trong những phương ph&aacute;p in ấn gi&aacute; cả phải chăng nhất v&agrave; 3D nhanh nhất c&oacute; sẵn để tạo c&aacute;c bộ phận tương đối lớn.&nbsp;N&oacute; cũng cho ph&eacute;p đầy m&agrave;u sắc 3D in c&aacute;c đối tượng. </span></p>\r\n\r\n<p style="text-align: center;"><iframe frameborder="0" height="450" scrolling="no" src="https://www.youtube.com/embed/CW3-1Qapp_s?feature=player_embedded" width="800"></iframe></p>\r\n\r\n<p><span style="font-size:28px;"><strong><span style="color:#f39c12;">8. C&ocirc;ng nghệ BJ (Binder Jetting): </span></strong></span><span style="font-size:20px;"></span></p>\r\n\r\n<p><span style="font-size:20px;">Đ&acirc;y l&agrave; c&ocirc;ng nghệ 3D được ph&aacute;t minh tại MIT.&nbsp;C&aacute;c c&ocirc;ng nghệ in 3D xuất hiện dưới nhiều t&ecirc;n.&nbsp;N&oacute; được gọi l&agrave; &ldquo; &ldquo;in 3D in phun&rdquo;,&rdquo;in thả-on-bột&rdquo; hay &ndash; c&oacute; lẽ phổ biến nhất &ndash; l&agrave; &lsquo;chất kết d&iacute;nh phun&rsquo;. </span></p>\r\n\r\n<p><span style="font-size:20px;">Binder phun l&agrave; một qu&aacute; tr&igrave;nh sản xuất chất phụ gia.&nbsp;Đ&acirc;y l&agrave; loại m&aacute;y in 3D sử dụng hai vật liệu: một loại bột c&oacute; trụ sở (thường thạch cao) nguy&ecirc;n liệu v&agrave; một t&aacute;c nh&acirc;n li&ecirc;n kết.&nbsp;C&aacute;c đại l&yacute; đ&oacute;ng vai tr&ograve; như một chất kết d&iacute;nh giữa c&aacute;c lớp bột.&nbsp;Th&ocirc;ng thường, c&aacute;c chất kết d&iacute;nh được &eacute;p đ&ugrave;n ở dạng lỏng từ một đầu in &ndash; chỉ cần nghĩ đến một m&aacute;y in phun 2D th&ocirc;ng thường.&nbsp;Sau một lớp xong,&nbsp;tấm x&acirc;y dựng được hạ xuống v&agrave; qu&aacute; tr&igrave;nh n&agrave;y lặp đi lặp lại. Bạn c&oacute; thể sử dụng c&ocirc;ng nghệ in 3D n&agrave;y với gốm, kim loại, c&aacute;t hoặc vật liệu nhựa. Những loại m&aacute;y in 3D c&oacute; một lợi thế rất lớn.&nbsp;</span></p>\r\n\r\n<p><span style="font-size:20px;">Bạn c&oacute; thể in đầy đủ m&agrave;u sắc bằng c&aacute;ch th&ecirc;m c&aacute;c sắc tố để c&aacute;c chất kết d&iacute;nh (thường l&agrave; m&agrave;u lục lam, đỏ tươi, v&agrave;ng, đen v&agrave; trắng).&nbsp;Điều n&agrave;y khiến n&oacute; trở th&agrave;nh phương ph&aacute;p ưa th&iacute;ch cho ảnh tự chụp đ&atilde; 3D phổ biến.&nbsp;Hạn chế của phương ph&aacute;p in 3D n&agrave;y l&agrave; sự to&agrave;n vẹn cấu tr&uacute;c của c&aacute;c đối tượng.&nbsp;Bạn sẽ kh&ocirc;ng c&oacute; được độ ph&acirc;n giải cao v&agrave; in gồ ghề với loại c&ocirc;ng nghệ in 3D &ndash; nhưng c&oacute; một số trường hợp ngoại lệ. </span></p>\r\n\r\n<p><span style="font-size:20px;">Ngo&agrave;i ra c&ograve;n c&oacute; tiến bộ trong loại c&ocirc;ng nghệ in 3D.&nbsp;Trong năm 2016, Hewlett-Packard giới thiệu &ldquo;Multijet Fusion&rdquo; (MJF), m&agrave; muốn mang Binder phun v&agrave;o level- tiếp theo.&nbsp;</span></p>\r\n\r\n<p><span style="font-size:20px;">Thứ nhất,&nbsp;một lớp vật liệu in 3D được triển khai bởi một chiếc xe ngựa.&nbsp;Một cỗ xe thứ hai với một mảng in phun nhiệt đi từ phải sang tr&aacute;i, lắng đọng một cặp t&aacute;c nh&acirc;n h&oacute;a học tr&ecirc;n khắp khu vực l&agrave;m việc đầy đủ.&nbsp;Một l&agrave; một t&aacute;c nh&acirc;n sấy, để tạo ra một lớp rắn từ vật liệu, v&agrave; người kia l&agrave; một đại l&yacute; chi tiết, để x&aacute;c định ph&aacute;c thảo vật l&yacute; của lớp được tạo ra.&nbsp;Cuối c&ugrave;ng, năng lượng được &aacute;p dụng để x&uacute;c t&aacute;c c&aacute;c t&aacute;c nh&acirc;n sấy v&agrave; bột thấm nhuần với c&aacute;c đại l&yacute; chi tiết vẫn c&ograve;n trơ. </span></p>\r\n\r\n<p><span style="font-size:20px;">Ứng dụng tiềm năng cho loại m&aacute;y in 3D d&agrave;nh cho tạo mẫu nhanh v&agrave; sản xuất ngắn hạn trong &ocirc; t&ocirc;, ng&agrave;nh y tế v&agrave; h&agrave;ng kh&ocirc;ng vũ trụ.&nbsp;Tuy nhi&ecirc;n, mức độ đầy đủ về khả năng MJF vẫn chưa được th&agrave;nh lập, với c&aacute;c t&aacute;c nh&acirc;n pha trộn mới hứa hẹn cung cấp thuộc t&iacute;nh kh&aacute;c nhau như đầy đủ m&agrave;u sắc, độ dẫn, sức mạnh v&agrave; khả năng phản ứng nhiệt. </span></p>\r\n\r\n<p style="text-align: center;"><iframe frameborder="0" height="450" scrolling="no" src="https://www.youtube.com/embed/XeTdo-w6Qx8?feature=player_embedded" width="800"></iframe></p>\r\n\r\n<p><span style="font-size:28px;"><strong><span style="color:#f39c12;">9. C&ocirc;ng nghệ MJ (Material Jetting / Wax Casting): </span></strong></span><span style="font-size:20px;"></span></p>\r\n\r\n<p><span style="font-size:20px;">C&ocirc;ng nghệ phun Chất liệu được tốt hơn được gọi l&agrave;&rdquo;đ&uacute;c s&aacute;p&rdquo;.&nbsp; Đ&oacute; l&agrave; một kỹ thuật được sử dụng bởi kim ho&agrave;n từ nhiều thế kỷ.&nbsp;Mất đ&uacute;c s&aacute;p (hoặc đ&uacute;c đầu tư) l&agrave; một qu&aacute; tr&igrave;nh sản xuất m&agrave; chủ yếu l&agrave; cho ph&eacute;p bạn tạo ra đồ trang sức t&ugrave;y biến c&oacute; chất lượng rất cao trong kim loại kh&aacute;c nhau.&nbsp;Nhưng với in ấn 3D, c&oacute; cuối c&ugrave;ng l&agrave; một qu&aacute; tr&igrave;nh để tự động đ&uacute;c s&aacute;p &ndash; v&agrave; đối với hầu hết kim ho&agrave;n, đ&oacute; l&agrave; kh&aacute; một c&aacute;i g&igrave; đ&oacute;. </span></p>\r\n\r\n<p><span style="font-size:20px;">V&igrave; vậy, h&atilde;y sử dụng c&ocirc;ng nghệ in 3D nếu bạn l&agrave; một thợ kim ho&agrave;n hoặc muốn thử nghiệm với ph&ocirc;i. </span></p>\r\n\r\n<p><span style="font-size:20px;">C&oacute; một số &iacute;t c&aacute;c m&aacute;y in s&aacute;p 3D chuy&ecirc;n nghiệp tr&ecirc;n thị trường, như &ldquo;Wax Jet&rdquo; từ Statasys.&nbsp;Nếu bạn muốn thử nghiệm với c&ocirc;ng nghệ in 3D n&agrave;y,&nbsp;bạn kh&ocirc;ng cần phải mua một m&aacute;y in.&nbsp;C&oacute; những dịch vụ in ấn 3D như Shapeways hoặc Sculpteo sử dụng m&aacute;y Vật liệu phun hoặc Multijet Modeling (MJM) cho c&ocirc;ng nghệ n&agrave;y.</span></p>\r\n\r\n<p style="text-align: center;"><iframe frameborder="0" height="450" scrolling="no" src="https://www.youtube.com/embed/Cq2u7g4HT5k?feature=player_embedded" width="800"></iframe></p>\r\n\r\n<p style="text-align: right;">&nbsp;</p>\r\n\r\n<p style="text-align: right;"><a href="https://alochip.com/san-pham.html"><span style="color:#f39c12;"><span style="font-size:20px;">Edit by AloChip.</span></span></a><br />\r\n<span style="font-size:16px;">Nguồn b&agrave;i viết:&nbsp;<a href="http://in3dcongnghiep.com/tim-hieu-cong-nghe-in-3d.html">http://in3dcongnghiep.com/tim-hieu-cong-nghe-in-3d.html</a></span></p>', 'in 3d,dịch vụ in 3d,3d print,filament,tạo mẫu nhanh', '1. Công nghệ FDM  (Fused Deposition Modeling):\r\nMáy in 3D dùng công nghệ FDM xây dựng mẫu bằng cách đùn nhựa nóng chảy rồi hoá rắn từng lớp tạo nên cấu trúc chi tiết dạng khối. công nghệ này được sản xuất để thương mại hóa từ năm 1991.', 'cms_content/adee6e7ec19eb3d5e8ee7bdea05efd97.png', 0, 1, '2018-08-09 15:59:29', '2018-09-06 06:24:34');
/*!40000 ALTER TABLE `cms_news` ENABLE KEYS */;

-- Dumping structure for table gp247.cms_page
DROP TABLE IF EXISTS `cms_page`;
CREATE TABLE IF NOT EXISTS `cms_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `uniquekey` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`uniquekey`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table gp247.cms_page: ~4 rows (approximately)
DELETE FROM `cms_page`;
/*!40000 ALTER TABLE `cms_page` DISABLE KEYS */;
INSERT INTO `cms_page` (`id`, `title`, `image`, `keyword`, `description`, `content`, `uniquekey`, `status`) VALUES
	(1, 'Trang chủ (sử dụng  nếu muốn đặt làm trang chủ)', '', NULL, NULL, NULL, 'trang-chu', 1),
	(2, 'Giới thiệu', '', 'Giới thiệu website,hướng dẫn đặt hàng', 'Giới thiệu website', '<p><font color="#f39c12"><span style="font-size: 26px;"><b>Nội dung đang cập nhật</b></span></font></p>', 'gioi-thieu', 1),
	(3, 'Nội dung thông báo cho người dùng', NULL, 'thông báo', NULL, '<h2>cập nhật</h2>', 'notice', 1),
	(4, 'Liên hệ', NULL, 'liên hệ', NULL, '<p><strong>Vui l&ograve;ng li&ecirc;n hệ với ch&uacute;ng t&ocirc;i</strong></p>', 'lien-he', 1);
/*!40000 ALTER TABLE `cms_page` ENABLE KEYS */;

-- Dumping structure for table gp247.config
DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` tinyint(4) NOT NULL DEFAULT '0',
  `detail` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table gp247.config: ~24 rows (approximately)
DELETE FROM `config`;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` (`id`, `code`, `key`, `value`, `sort`, `detail`) VALUES
	(1, 'info', 'site_title', 'Shop bán hàng demo 247', 1, 'Tiêu đề website'),
	(2, 'info', 'site_keyword', 'keyword', 2, 'Từ khóa'),
	(3, 'info', 'site_description', 'description', 3, 'Mô tả website'),
	(6, 'info', 'site_phone', '0123.456.7890', 6, 'Số điện thoại của website'),
	(7, 'info', 'site_address', '55 Lãnh Binh Thăng', 7, 'Địa chỉ'),
	(8, 'info', 'site_email', 'admin@webmaster.com', 8, 'Email liên hệ'),
	(9, 'config', 'site_status', '1', 9, 'Bật/Tắt website'),
	(10, 'config', 'shop_allow_guest', '1', 11, 'Cho phép mua hàng không cần đăng nhập'),
	(11, 'info', 'smtp_host', '', 12, 'Server SMTP'),
	(12, 'info', 'smtp_user', '', 13, 'Tài khoản SMTP'),
	(13, 'info', 'smtp_password', '', 14, 'Mật khẩu SMTP'),
	(14, 'info', 'smtp_security', '', 15, 'Giao thức bảo mật (tls,ssl)'),
	(15, 'info', 'smtp_port', '', 16, 'Cổng SMTP'),
	(16, 'config', 'smtp_mode', '0', 10, 'Tự cấu hình SMTP gửi mail'),
	(17, 'config', 'product_display_special', '1', 17, 'Hiển thị cả giá gốc và giá khuyến mãi'),
	(18, 'config', 'product_preorder', '1', 18, 'Cho phép đặt hàng trước (mua trước thời gian bán chính thức)'),
	(19, 'config', 'product_display_out_of_stock', '1', 19, 'Hiển thị sản phẩm hết hàng'),
	(20, 'config', 'product_buy_out_of_stock', '1', 20, 'Cho phép mua vượt stock, kể cả đã hết hàng'),
	(21, 'info', 'site_fb_appID', '934208239994473', 22, 'ID app facebook'),
	(22, 'config', 'show_date_avalid', '1', 21, 'Hiển thị ngày cho phép mua'),
	(23, 'shipping', 'shipping_status', '1', 22, 'Sử dụng shipping'),
	(24, 'config', 'promotion_mode', '1', 1, 'Sử dụng mã giảm giá'),
	(25, 'config', 'PAYPAL_STATUS', '0', 0, 'Sử dụng paypal cho thanh toán'),
	(26, 'info', 'site_phone_long', 'Sale: 0168.123.1209 - Kỹ thuật: 0123.448.559', 6, 'Sô điện thoại dài');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;

-- Dumping structure for table gp247.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table gp247.failed_jobs: ~0 rows (approximately)
DELETE FROM `failed_jobs`;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table gp247.jobs
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table gp247.jobs: ~0 rows (approximately)
DELETE FROM `jobs`;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
	(1, 'default', '{"displayName":"App\\\\Mail\\\\WelcomeEmail","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"Illuminate\\\\Mail\\\\SendQueuedMailable","command":"O:34:\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\":3:{s:8:\\"mailable\\";O:21:\\"App\\\\Mail\\\\WelcomeEmail\\":19:{s:4:\\"from\\";a:0:{}s:2:\\"to\\";a:1:{i:0;a:2:{s:4:\\"name\\";N;s:7:\\"address\\";s:17:\\"lanhktc@gmail.com\\";}}s:2:\\"cc\\";a:0:{}s:3:\\"bcc\\";a:0:{}s:7:\\"replyTo\\";a:0:{}s:7:\\"subject\\";N;s:11:\\"\\u0000*\\u0000markdown\\";N;s:4:\\"view\\";N;s:8:\\"textView\\";N;s:8:\\"viewData\\";a:0:{}s:11:\\"attachments\\";a:0:{}s:14:\\"rawAttachments\\";a:0:{}s:9:\\"callbacks\\";a:0:{}s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;}"}}', 0, NULL, 1522166893, 1522166893);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Dumping structure for table gp247.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table gp247.migrations: ~6 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2016_01_04_173148_create_admin_tables', 1),
	(4, '2018_03_27_145238_create_jobs_table', 2),
	(5, '2018_03_27_145322_create_failed_jobs_table', 2),
	(6, '2016_05_17_221000_create_promocodes_table', 3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table gp247.password_resets
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table gp247.password_resets: ~2 rows (approximately)
DELETE FROM `password_resets`;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
	('test@gmail.com', '$2y$10$Hig4bWDSh3NzYchxkAK5sOqNYs3dx2oYJMLZ5z6k.1bP91/kTYFyu', '2018-01-14 14:23:29'),
	('lanhktc@gmail.com', '$2y$10$G/hr0KbnfvPzK4xRQ/9SiOzwVTxUACo3tPvd8vsgNsd2QKSkRJrCW', '2018-08-14 22:50:13');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table gp247.promocodes
DROP TABLE IF EXISTS `promocodes`;
CREATE TABLE IF NOT EXISTS `promocodes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reward` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `number_uses` int(10) unsigned NOT NULL DEFAULT '1',
  `used` int(11) NOT NULL DEFAULT '0',
  `status` int(10) unsigned NOT NULL DEFAULT '1',
  `expires_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `promocodes_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table gp247.promocodes: ~11 rows (approximately)
DELETE FROM `promocodes`;
/*!40000 ALTER TABLE `promocodes` DISABLE KEYS */;
INSERT INTO `promocodes` (`id`, `code`, `reward`, `type`, `data`, `number_uses`, `used`, `status`, `expires_at`) VALUES
	(1, 'ABC-XAA01', 100000, 0, 'Khuyến mãi đầu năm', 100, 2, 1, '2018-08-11 00:00:00'),
	(2, 'KKB3-KLLA', 30, 2, NULL, 33, 1, 1, '2018-08-11 00:00:00'),
	(3, 'PAA-LLK01', 100000, 1, 'Tặng điểm khách hàng thân thiết', 22, 1, 1, NULL),
	(4, 'VONN_KKH1', 150000, 0, NULL, 1, 1, 1, '2019-03-08 00:00:00'),
	(5, 'PAA-LLK02', 150000, 1, NULL, 111, 0, 1, NULL),
	(6, 'VONN_KKH2', 900000, 0, 'Refurn', 4, 1, 1, '2018-07-07 00:00:00'),
	(8, 'PAA-LLK03', 150000, 0, NULL, 111, 1, 1, NULL),
	(9, 'PAA-LLK04', 150000, 0, NULL, 111, 1, 1, NULL),
	(10, 'PAA-LLK05', 150000, 0, NULL, 111, 1, 1, NULL),
	(11, 'PAA-LLK06', 150000, 0, NULL, 111, 1, 1, NULL),
	(13, 'PAA-LLK07', 219999, 0, NULL, 111, 1, 1, NULL);
/*!40000 ALTER TABLE `promocodes` ENABLE KEYS */;

-- Dumping structure for table gp247.promocode_user
DROP TABLE IF EXISTS `promocode_user`;
CREATE TABLE IF NOT EXISTS `promocode_user` (
  `user_id` int(10) unsigned NOT NULL,
  `promocode_id` int(10) unsigned NOT NULL,
  `log` text COLLATE utf8mb4_unicode_ci,
  `used_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`promocode_id`),
  KEY `promocode_user_promocode_id_foreign` (`promocode_id`),
  CONSTRAINT `promocode_user_promocode_id_foreign` FOREIGN KEY (`promocode_id`) REFERENCES `promocodes` (`id`),
  CONSTRAINT `promocode_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table gp247.promocode_user: ~10 rows (approximately)
DELETE FROM `promocode_user`;
/*!40000 ALTER TABLE `promocode_user` DISABLE KEYS */;
INSERT INTO `promocode_user` (`user_id`, `promocode_id`, `log`, `used_at`) VALUES
	(2, 1, 'Đơn hàng 3', '2018-05-20 22:04:28'),
	(3, 1, 'Đơn hàng 11', '2018-05-22 06:22:35'),
	(3, 2, 'Order #48', '2018-06-03 14:20:25'),
	(3, 3, 'Order #43', '2018-05-22 14:06:21'),
	(3, 4, NULL, '2018-05-22 14:03:02'),
	(3, 6, 'Order #45', '2018-05-27 10:53:16'),
	(3, 8, 'Order #50', '2018-06-03 14:56:26'),
	(3, 9, 'Order #51', '2018-06-03 15:15:19'),
	(3, 10, 'Order #52', '2018-06-03 15:41:31'),
	(3, 11, 'Order #62', '2018-06-05 23:01:53');
/*!40000 ALTER TABLE `promocode_user` ENABLE KEYS */;

-- Dumping structure for table gp247.shop_attribute
DROP TABLE IF EXISTS `shop_attribute`;
CREATE TABLE IF NOT EXISTS `shop_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table gp247.shop_attribute: ~2 rows (approximately)
DELETE FROM `shop_attribute`;
/*!40000 ALTER TABLE `shop_attribute` DISABLE KEYS */;
INSERT INTO `shop_attribute` (`id`, `name`, `value`) VALUES
	(1, 'Màu sắc', 'Xanh,Đỏ,Vàng,Trắng'),
	(2, 'Size', 'X,S,L');
/*!40000 ALTER TABLE `shop_attribute` ENABLE KEYS */;

-- Dumping structure for table gp247.shop_brand
DROP TABLE IF EXISTS `shop_brand`;
CREATE TABLE IF NOT EXISTS `shop_brand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `sort` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table gp247.shop_brand: ~6 rows (approximately)
DELETE FROM `shop_brand`;
/*!40000 ALTER TABLE `shop_brand` DISABLE KEYS */;
INSERT INTO `shop_brand` (`id`, `name`, `image`, `url`, `status`, `sort`) VALUES
	(1, 'Husq', 'brand/88360597aa1df738b183d2a2a5e41d92.png', NULL, 1, 0),
	(2, 'Ideal', 'brand/d0782fc5b01353d0b47c5d6b434e282e.png', NULL, 1, 0),
	(3, 'Apex', 'brand/4cbebcdaa679d1dcafccb620d3aea0c9.png', NULL, 1, 0),
	(4, 'CST', 'brand/69763cbe8e62f0de5d54e7a175167b21.png', NULL, 1, 0),
	(5, 'Klein', 'brand/3ef3fc68fb5257294c4a796b0ae08e08.png', NULL, 1, 0),
	(6, 'Metabo', 'brand/66afc30e21e9ada47493dccfad00bd34.png', NULL, 1, 0);
/*!40000 ALTER TABLE `shop_brand` ENABLE KEYS */;

-- Dumping structure for table gp247.shop_category
DROP TABLE IF EXISTS `shop_category`;
CREATE TABLE IF NOT EXISTS `shop_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uniquekey` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent` int(11) NOT NULL DEFAULT '0',
  `sort` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table gp247.shop_category: ~19 rows (approximately)
DELETE FROM `shop_category`;
/*!40000 ALTER TABLE `shop_category` DISABLE KEYS */;
INSERT INTO `shop_category` (`id`, `name`, `image`, `keyword`, `uniquekey`, `description`, `parent`, `sort`, `status`) VALUES
	(1, 'Sản Phẩm Khác', 'category/4931e5a7d7d9d7d05f04d7a02e5f5220.jpg', 'sản phẩm', 'san-pham-khac', NULL, 0, 0, 1),
	(2, 'IoT - Nhà Thông Minh', 'category/c6590e1c7eb85bb04e8139841c6be2a2.jpg', 'iot', 'iot', NULL, 0, 0, 1),
	(3, 'Arduino & Module', 'category/54e2ef1ef79c001fc01e807660ae8bd2.jpg', 'arduino', 'arduino', NULL, 0, 0, 1),
	(4, 'Linh Kiện Điện Tử', 'category/d940bc2bea094a9c5827ab0374305d14.png', 'linh kiện điện tử', 'linh-kien-dien-tu', NULL, 0, 0, 1),
	(5, 'In 3D & Phụ Kiện', 'category/cad79714a9ae688f20a5e3a4d4c5cd50.jpg', 'in 3d', 'in-3d', NULL, 0, 0, 1),
	(6, 'Quạt Đèn LED - LED FAN', 'category/aa540f347868c296cfd76f8ab79f8bcd.jpg', 'quạt đèn led, led fan', 'led fan', NULL, 9, 0, 1),
	(7, 'ICs', 'category/6b456e8c650aee6c7aa4b8ccc40f63b2.png', 'ic', 'ic', NULL, 4, 0, 1),
	(8, 'Màn Hình LCD', 'category/a7b975571ee43d76aa5fa35566489c7c.jpg', 'lcd', 'lcd', NULL, 4, 0, 1),
	(9, 'Quà Tặng Công Nghệ', 'category/1cd464f619ad5ea7d8d03a8b3109718a.jpg', 'quảng cáo, holo 3d, led fan', 'san-pham-cong-nghe', 'Những sản phẩm công nghệ', 0, 0, 1),
	(10, 'Máy In 3D', 'category/2203e3214ab89829309d5ea92fd8f3b7.jpg', 'máy in 3d', 'may-in-3d', NULL, 5, 0, 1),
	(11, 'Linh Kiện & Phụ Kiện Máy In 3D', 'category/1adac36e4eaf99495236d79a8cd3c042.png', 'diy, ráp máy in 3d', 'linh-kien-may-in-3d', NULL, 5, 0, 1),
	(12, '3D Hologram LED Fan Display', 'category/8498d6dcd0edfb104fb40a993eb0f0d4.jpg', 'quatang,ledfan,quạt,hologram, quảng cáo', '3d-hologram-led-fan', NULL, 9, 3, 1),
	(13, 'Quạt Đồng Hồ LED - CLOCK FAN', 'category/59d50efb0f679283ce6e5c2a73b45496.jpg', 'quatang,ledfan', 'clock-fan', NULL, 9, 2, 1),
	(14, 'Cảm Biến', 'category/1820e20708133bc8ca10c9d965f1c598.jpg', 'cảm biến, sensor', 'sensor', NULL, 4, 0, 1),
	(15, 'Nhựa In 3D', 'category/2e474e37a988d6eada7bc719fbf6d0cd.jpg', 'in 3d, dịch vụ in 3d, 3d print, filament, tạo mẫu nhanh', 'filament', NULL, 5, 0, 1),
	(16, 'Module Truyền Nhận RF', NULL, '', 'Module-truyen-nhan-rf', NULL, 2, 0, 1),
	(17, 'Mạch Arduino', NULL, '', 'mach-arduino', NULL, 3, 0, 1),
	(18, 'Arduino Shield', NULL, 'Arduino Shield', 'arduino-shield', NULL, 3, 0, 1),
	(19, 'Đèn LED - Ánh Sáng', 'category/e6902fd337f04ed8bc8fa9ded815261a.jpg', 'led,led dây,led strip', 'led-strip', NULL, 4, 0, 1);
/*!40000 ALTER TABLE `shop_category` ENABLE KEYS */;

-- Dumping structure for table gp247.shop_image
DROP TABLE IF EXISTS `shop_image`;
CREATE TABLE IF NOT EXISTS `shop_image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` int(2) unsigned NOT NULL DEFAULT '0',
  `status` int(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table gp247.shop_image: ~71 rows (approximately)
DELETE FROM `shop_image`;
/*!40000 ALTER TABLE `shop_image` DISABLE KEYS */;
INSERT INTO `shop_image` (`id`, `image`, `product_id`, `sort`, `status`) VALUES
	(82, 'product_slide/978d5992ff828e7a0391dbbc7cf02383.png', 38, 0, 0),
	(83, 'product_slide/f4786d81509a8d8ffa461535b07c77bc.png', 38, 0, 0),
	(84, 'product_slide/8d94e8b45b33e3f13dd5be5376ffd9f8.png', 39, 0, 0),
	(87, 'product_slide/a2f94aa1837cdcad9e101618b3a8b131.png', 40, 0, 0),
	(88, 'product_slide/81f37c10d867710075e3ab6153a31d03.png', 40, 0, 0),
	(89, 'product_slide/1e758549544c3d02e618c44770944a1c.png', 42, 0, 0),
	(90, 'product_slide/8718dfdb75f951010cdce669768c3e3a.png', 42, 0, 0),
	(92, 'product_slide/555968c4c92f4ebed6b3cfbffa4d7b46.jpg', 43, 0, 0),
	(93, 'product_slide/dbe75df3ad00c5e282e27e949542caf8.jpg', 43, 0, 0),
	(94, 'product_slide/d8033da37b4864808ddc66f509d33591.jpg', 43, 0, 0),
	(95, 'product_slide/bf698711a126af552a9b7ec26e5717d2.png', 44, 0, 0),
	(96, 'product_slide/9621378ea3e33142ee2158fcd86c76a4.png', 45, 0, 0),
	(102, 'product_slide/9d28a11ae7e4e6b16beffa765469d540.png', 48, 0, 0),
	(103, 'product_slide/e1d55480c5aca361f54a4fc392073c52.png', 48, 0, 0),
	(109, 'product_slide/bf4f360ac5c458c32f4597f0ff00493d.png', 49, 0, 0),
	(110, 'product_slide/bcf85f60d3fe35de2c1be6272f9605ef.png', 52, 0, 0),
	(111, 'product_slide/40999526f41b1d4090e30c6b0ce21dca.jpg', 53, 0, 0),
	(112, 'product_slide/cdc0fcaeef1a846c9993a272c1518922.jpg', 54, 0, 0);
/*!40000 ALTER TABLE `shop_image` ENABLE KEYS */;

-- Dumping structure for table gp247.shop_option
DROP TABLE IF EXISTS `shop_option`;
CREATE TABLE IF NOT EXISTS `shop_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '1- radio, 2 -select, 3-text',
  `status` int(11) NOT NULL DEFAULT '1',
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table gp247.shop_option: ~3 rows (approximately)
DELETE FROM `shop_option`;
/*!40000 ALTER TABLE `shop_option` DISABLE KEYS */;
INSERT INTO `shop_option` (`id`, `name`, `type`, `status`, `sort`) VALUES
	(1, 'Màu sắc', 1, 1, 0),
	(2, 'Kích thước', 2, 1, 0),
	(3, 'Chất liệu', 3, 1, 3);
/*!40000 ALTER TABLE `shop_option` ENABLE KEYS */;

-- Dumping structure for table gp247.shop_option_detail
DROP TABLE IF EXISTS `shop_option_detail`;
CREATE TABLE IF NOT EXISTS `shop_option_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `add_price` int(11) NOT NULL DEFAULT '0',
  `option_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=626 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table gp247.shop_option_detail: ~37 rows (approximately)
DELETE FROM `shop_option_detail`;
/*!40000 ALTER TABLE `shop_option_detail` DISABLE KEYS */;
INSERT INTO `shop_option_detail` (`id`, `name`, `add_price`, `option_id`, `product_id`) VALUES
	(1, 'X', 0, 2, 0),
	(2, 'XL', 10000, 2, 0),
	(3, 'Đỏ', 0, 1, 0),
	(4, 'Xanh', 10000, 1, 0),
	(5, 'Vàng', 5000, 1, 0),
	(24, 'Tím', 20000, 1, 15),
	(47, 'Tìm', 0, 2, 16),
	(48, 'Ok', 0, 2, 16),
	(49, 'Xanh', 0, 1, 17),
	(50, 'Do', 0, 1, 17),
	(569, 'White/Đen', 0, 1, 9),
	(570, 'Black/Đen', 0, 1, 9),
	(571, 'Transparent/Trong suốt', 0, 1, 9),
	(572, 'Red/Đỏ', 0, 1, 9),
	(573, 'Yellow/Vàng', 0, 1, 9),
	(574, 'Blue/Xanh Dương', 0, 1, 9),
	(575, 'Green/Xanh Lá', 0, 1, 9),
	(576, 'Orange/Cam', 0, 1, 9),
	(577, 'Cyan/Lam', 0, 1, 9),
	(578, 'Pink/Hồng', 0, 1, 9),
	(579, 'Đường kính 1.75mm', 0, 2, 9),
	(580, 'Đường kính 3mm', 0, 2, 9),
	(581, 'S', 0, 2, 6),
	(582, 'XL', 0, 2, 6),
	(583, 'S', 0, 2, 5),
	(584, 'XL', 0, 2, 5),
	(585, 'XXX', 0, 2, 5),
	(606, 'Màu xanh', 0, 1, 12),
	(607, 'Màu đỏ', 0, 1, 12),
	(608, 'Màu tím', 0, 1, 12),
	(609, 'XL', 0, 2, 12),
	(610, 'XXL', 0, 2, 12),
	(621, 'Màu Trắng Đục', 0, 1, 34),
	(622, 'Trong Suốt', 0, 1, 34),
	(623, 'ID=2 mm, OD=4 mm', 0, 2, 34),
	(624, 'ID=2 mm, OD=3 mm', 0, 2, 34),
	(625, 'ID=3 mm, OD=4 mm', 0, 2, 34);
/*!40000 ALTER TABLE `shop_option_detail` ENABLE KEYS */;

-- Dumping structure for table gp247.shop_order
DROP TABLE IF EXISTS `shop_order`;
CREATE TABLE IF NOT EXISTS `shop_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `subtotal` int(11) DEFAULT '0',
  `shipping` int(11) DEFAULT '0',
  `discount` int(11) DEFAULT '0',
  `payment_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-not send 1-pp send 2-sent',
  `shipping_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-notship 1-sending 2-pp send 3-shipped',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-new 1-processing 2-hold 3-cancel 4-Completed',
  `tax` tinyint(4) DEFAULT '0' COMMENT '%',
  `total` int(11) DEFAULT '0',
  `received` int(11) DEFAULT '0',
  `balance` int(11) DEFAULT '0',
  `toname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `address1` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `address2` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `country` int(3) DEFAULT NULL,
  `phone` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `comment` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_method` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table gp247.shop_order: ~5 rows (approximately)
DELETE FROM `shop_order`;
/*!40000 ALTER TABLE `shop_order` DISABLE KEYS */;
INSERT INTO `shop_order` (`id`, `user_id`, `subtotal`, `shipping`, `discount`, `payment_status`, `shipping_status`, `status`, `tax`, `total`, `received`, `balance`, `toname`, `address1`, `address2`, `country`, `phone`, `comment`, `payment_method`, `transaction`, `created_at`, `updated_at`) VALUES
	(4, 0, 320000, 0, 0, 0, 0, 0, 0, 320000, 0, 320000, 'Le Nam', '15 nguyen bach', 'Tan Phu', NULL, '0999988898', 'ok', NULL, NULL, '2017-08-25 15:34:21', NULL),
	(38, 3, 485000, 15, -15, 0, 2, 4, 0, 485000, -485000, 0, 'Lê Văn Lanh', 'Quan 12', 'Ho chi minh', NULL, '0667151172', NULL, NULL, NULL, '2018-05-15 13:59:39', '2018-05-20 06:13:07'),
	(39, 3, 1360000, 100000, -100000, 3, 1, 1, 0, 1360000, -1060000, 300000, 'Lê Văn Lanh', 'Quan 122', 'Ho chi minh', NULL, '0667151172', 'ok', NULL, NULL, '2018-05-18 13:59:31', '2018-09-03 17:17:09'),
	(74, 0, 20000, 10000, 0, 0, 0, 0, 0, 30000, 0, 30000, 'Nguyễn Tuấn', '南陽市長岡', 'fghfghfghfghfg', NULL, '09012345678', 'ok', NULL, NULL, '2018-09-03 17:00:37', '2018-09-03 17:14:55'),
	(75, 5, 45000, 20000, 0, 0, 0, 0, 0, 65000, 0, 65000, 'Bao Khanh', '12', 'TTh07', NULL, '09012345678', NULL, NULL, NULL, '2018-09-05 20:59:07', NULL);
/*!40000 ALTER TABLE `shop_order` ENABLE KEYS */;

-- Dumping structure for table gp247.shop_order_detail
DROP TABLE IF EXISTS `shop_order_detail`;
CREATE TABLE IF NOT EXISTS `shop_order_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(11) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT '0' COMMENT 'Price: price of product or type',
  `qty` int(11) DEFAULT '0',
  `total_price` int(11) DEFAULT '0',
  `sku` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Attributes',
  `option` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table gp247.shop_order_detail: ~4 rows (approximately)
DELETE FROM `shop_order_detail`;
/*!40000 ALTER TABLE `shop_order_detail` DISABLE KEYS */;
INSERT INTO `shop_order_detail` (`id`, `order_id`, `product_id`, `name`, `price`, `qty`, `total_price`, `sku`, `type`, `option`, `created_at`, `updated_at`) VALUES
	(131, 74, 32, 'Dây Gia Nhiệt 12V 40W Máy In 3D', 20000, 1, 20000, '3D-HOTWIRE1240', '[]', NULL, '2018-09-03 17:00:37', NULL),
	(132, 75, 44, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', 15000, 1, 15000, 'P10-IRG', '[]', NULL, '2018-09-05 20:59:07', NULL),
	(133, 75, 20, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', 15000, 1, 15000, 'SS495A', '[]', NULL, '2018-09-05 20:59:07', NULL),
	(134, 75, 35, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', 15000, 1, 15000, '3D-SENSOR-NTC 100K', '[]', NULL, '2018-09-05 20:59:07', NULL);
/*!40000 ALTER TABLE `shop_order_detail` ENABLE KEYS */;

-- Dumping structure for table gp247.shop_order_history
DROP TABLE IF EXISTS `shop_order_history`;
CREATE TABLE IF NOT EXISTS `shop_order_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `add_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table gp247.shop_order_history: ~6 rows (approximately)
DELETE FROM `shop_order_history`;
/*!40000 ALTER TABLE `shop_order_history` DISABLE KEYS */;
INSERT INTO `shop_order_history` (`id`, `order_id`, `content`, `admin_id`, `user_id`, `add_date`) VALUES
	(40, 74, 'New order', 0, 0, '2018-09-03 17:00:37'),
	(41, 74, 'Thay đổi <b>comment</b> từ <span style="color:blue">\'\'</span> thành <span style="color:red">\'ok\'</span>', 1, 0, '2018-09-03 17:14:49'),
	(42, 74, 'Thay đổi <b>shipping</b> từ <span style="color:blue">\'\'</span> thành <span style="color:red">\'10000\'</span>', 1, 0, '2018-09-03 17:14:55'),
	(43, 39, 'Thay đổi <b>status</b> từ <span style="color:blue">\'4\'</span> thành <span style="color:red">\'1\'</span>', 1, 0, '2018-09-03 17:17:00'),
	(44, 39, 'Thay đổi <b>received</b> từ <span style="color:blue">\'\'</span> thành <span style="color:red">\'-1060000\'</span>', 1, 0, '2018-09-03 17:17:09'),
	(45, 75, 'New order', 0, 5, '2018-09-05 20:59:07');
/*!40000 ALTER TABLE `shop_order_history` ENABLE KEYS */;

-- Dumping structure for table gp247.shop_order_status
DROP TABLE IF EXISTS `shop_order_status`;
CREATE TABLE IF NOT EXISTS `shop_order_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table gp247.shop_order_status: ~5 rows (approximately)
DELETE FROM `shop_order_status`;
/*!40000 ALTER TABLE `shop_order_status` DISABLE KEYS */;
INSERT INTO `shop_order_status` (`id`, `name`) VALUES
	(0, 'Mới'),
	(1, 'Đang xử lý'),
	(2, 'Tạm giữ'),
	(3, 'Hủy bỏ'),
	(4, 'Hoàn thành');
/*!40000 ALTER TABLE `shop_order_status` ENABLE KEYS */;

-- Dumping structure for table gp247.shop_order_total
DROP TABLE IF EXISTS `shop_order_total`;
CREATE TABLE IF NOT EXISTS `shop_order_total` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table gp247.shop_order_total: ~20 rows (approximately)
DELETE FROM `shop_order_total`;
/*!40000 ALTER TABLE `shop_order_total` DISABLE KEYS */;
INSERT INTO `shop_order_total` (`id`, `order_id`, `title`, `code`, `value`, `sort`, `created_at`, `updated_at`) VALUES
	(34, 38, 'Tổng tiền hàng', 'subtotal', 485000, 1, '2018-05-15 13:59:39', '2018-05-20 06:12:46'),
	(35, 38, 'Phí giao hàng', 'shipping', 15, 10, '2018-05-15 13:59:39', '2018-05-15 14:03:52'),
	(36, 38, 'Giảm giá', 'discount', -15, 20, '2018-05-15 13:59:39', '2018-05-15 14:03:34'),
	(37, 38, 'Đã thanh toán', 'received', -485000, 200, '2018-05-15 13:59:39', '2018-05-20 06:12:58'),
	(38, 38, 'Tổng tiền cần thanh toán', 'total', 485000, 100, '2018-05-15 13:59:39', '2018-05-20 06:12:46'),
	(39, 39, 'Tổng tiền hàng', 'subtotal', 1360000, 1, '2018-05-18 13:59:31', '2018-05-20 05:59:45'),
	(40, 39, 'Phí giao hàng', 'shipping', 100000, 10, '2018-05-18 13:59:31', '2018-05-20 06:07:14'),
	(41, 39, 'Giảm giá', 'discount', -100000, 20, '2018-05-18 13:59:31', '2018-05-20 04:29:42'),
	(42, 39, 'Tổng tiền cần thanh toán', 'total', 1360000, 100, '2018-05-18 13:59:31', '2018-05-20 06:07:14'),
	(43, 39, 'Đã thanh toán', 'received', -1060000, 200, '2018-05-18 13:59:31', '2018-09-03 17:17:09'),
	(214, 74, 'Tổng tiền hàng', 'subtotal', 20000, 1, '2018-09-03 17:00:37', NULL),
	(215, 74, 'Phí giao hàng', 'shipping', 10000, 10, '2018-09-03 17:00:37', '2018-09-03 17:14:55'),
	(216, 74, 'Giảm giá', 'discount', 0, 20, '2018-09-03 17:00:37', NULL),
	(217, 74, 'Tổng tiền cần thanh toán', 'total', 30000, 100, '2018-09-03 17:00:37', '2018-09-03 17:14:55'),
	(218, 74, 'Đã thanh toán', 'received', 0, 200, '2018-09-03 17:00:37', NULL),
	(219, 75, 'Tổng tiền hàng', 'subtotal', 45000, 1, '2018-09-05 20:59:07', NULL),
	(220, 75, 'Phí giao hàng', 'shipping', 20000, 10, '2018-09-05 20:59:07', NULL),
	(221, 75, 'Giảm giá', 'discount', 0, 20, '2018-09-05 20:59:07', NULL),
	(222, 75, 'Tổng tiền cần thanh toán', 'total', 65000, 100, '2018-09-05 20:59:07', NULL),
	(223, 75, 'Đã thanh toán', 'received', 0, 200, '2018-09-05 20:59:07', NULL);
/*!40000 ALTER TABLE `shop_order_total` ENABLE KEYS */;

-- Dumping structure for table gp247.shop_payment_status
DROP TABLE IF EXISTS `shop_payment_status`;
CREATE TABLE IF NOT EXISTS `shop_payment_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table gp247.shop_payment_status: ~4 rows (approximately)
DELETE FROM `shop_payment_status`;
/*!40000 ALTER TABLE `shop_payment_status` DISABLE KEYS */;
INSERT INTO `shop_payment_status` (`id`, `name`) VALUES
	(0, 'Chưa thanh toán'),
	(1, 'Thanh toán một phần'),
	(2, 'Thanh toán xong'),
	(3, 'Khách hàng dư tiền');
/*!40000 ALTER TABLE `shop_payment_status` ENABLE KEYS */;

-- Dumping structure for table gp247.shop_product
DROP TABLE IF EXISTS `shop_product`;
CREATE TABLE IF NOT EXISTS `shop_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sku` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `keyword` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `brand_id` int(10) unsigned NOT NULL DEFAULT '0',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `category_other` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) NOT NULL,
  `cost` int(11) DEFAULT '0',
  `stock` int(11) NOT NULL DEFAULT '0',
  `sold` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-Nomal 1-New 2-Hot',
  `option` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0- inactive 1-active ',
  `view` int(11) DEFAULT '0',
  `date_lastview` timestamp NULL DEFAULT NULL,
  `date_available` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sku` (`sku`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table gp247.shop_product: ~40 rows (approximately)
DELETE FROM `shop_product`;
/*!40000 ALTER TABLE `shop_product` DISABLE KEYS */;
INSERT INTO `shop_product` (`id`, `name`, `sku`, `keyword`, `description`, `image`, `content`, `brand_id`, `category_id`, `category_other`, `price`, `cost`, `stock`, `sold`, `type`, `option`, `sort`, `status`, `view`, `date_lastview`, `date_available`, `created_at`, `updated_at`) VALUES
	(3, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', 'MEGA2560', 'quatang,ledfan', '', 'product/579e387d103eff60a2c2d203dd58456b.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 1, 17, NULL, 220000, 150000, 0, -5, 0, NULL, 0, 1, 0, NULL, NULL, '2018-01-15 14:57:31', '2018-08-24 06:24:08'),
	(4, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', 'LEDFAN1', 'quatang,ledfan', '', 'product/2ba0e7a82ca5ad2acc2514c90e3e7854.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 3, 6, NULL, 190000, 100000, 17, -1, 1, NULL, 0, 1, 1, '2018-08-27 11:37:16', NULL, '2018-01-16 13:03:54', '2018-08-27 11:37:16'),
	(5, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', 'CLOCKFAN1', 'quatang,ledfan', '', 'product/4df7dbf5ab7a25605ed072d7a34199af.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 2, 13, NULL, 420000, 320000, 11, 1, 1, NULL, 0, 1, 2, '2018-09-03 17:09:50', NULL, '2018-01-16 13:04:41', '2018-09-03 17:09:50'),
	(6, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', 'CLOCKFAN2', 'quatang,ledfan', '', 'product/579e387d103eff60a2c2d203dd58456b.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 1, 13, NULL, 380000, 250000, 99, 78, 2, NULL, 0, 1, 0, NULL, NULL, '2018-02-02 14:52:50', '2018-08-23 09:20:43'),
	(7, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', 'CLOCKFAN3', 'quatang,ledfan', '', 'product/743a375879e90599f75b4e98bacf0b95.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 1, 13, NULL, 320000, 250000, 51, 0, 1, NULL, 1, 1, 0, NULL, NULL, '2018-02-02 14:53:30', '2018-08-23 09:20:25'),
	(8, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', 'TMC2208', 'quatang,ledfan', '', 'product/4df7dbf5ab7a25605ed072d7a34199af.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 8, 11, NULL, 220000, 130000, 101, 1, 0, NULL, 1, 1, 0, NULL, NULL, '2018-02-02 14:53:30', '2018-08-23 09:20:03'),
	(9, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', 'FILAMENT', 'quatang,ledfan', '', 'product/d4f0b048fb171a8bf4f9701fcbac949d.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 8, 15, NULL, 299000, 200000, 127, 6, 2, NULL, 1, 1, 0, NULL, NULL, '2018-02-02 14:53:30', '2018-08-23 09:19:35'),
	(10, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', 'A4988', 'quatang,ledfan', '', 'product/d486cdb9fad4205d4b7367f2c9df1f9e.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 1, 11, NULL, 39000, 20000, 107, 33, 0, NULL, 1, 1, 0, NULL, NULL, '2018-02-02 14:53:30', '2018-06-27 16:21:10'),
	(11, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', 'ANYCUBIC-P', 'quatang,ledfan', '', 'product/92ddb03b751db23fbac398d887f3164f.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 7, 10, NULL, 4990000, 3500000, 1, 1048, 0, NULL, 0, 1, 0, NULL, NULL, '2018-01-15 14:57:31', '2018-08-23 09:19:15'),
	(12, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', '3DHLFD', 'quatang,ledfan', '', 'product/92ddb03b751db23fbac398d887f3164f.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 8, 12, NULL, 7990000, 5200000, 10, 20, 2, NULL, 0, 1, 0, NULL, NULL, '2018-01-15 14:57:31', '2018-09-03 17:15:38'),
	(20, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', 'SS495A', 'quatang,ledfan', '', 'product/2ba0e7a82ca5ad2acc2514c90e3e7854.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 8, 14, NULL, 15000, 7000, 1005, 1059, 1, NULL, 0, 1, 2, '2018-09-06 06:45:53', NULL, '2018-01-15 14:57:31', '2018-09-06 06:45:53'),
	(21, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', '3D-CARBON1.75', 'quatang,ledfan', '', 'product/2ba0e7a82ca5ad2acc2514c90e3e7854.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 8, 15, NULL, 390000, 15000, 10, 19, 1, NULL, 1, 1, 0, NULL, NULL, '2018-02-02 14:53:30', '2018-08-15 14:52:43'),
	(22, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', '3D-GOLD1.75', 'quatang,ledfan', '', 'product/92ddb03b751db23fbac398d887f3164f.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 8, 15, NULL, 500000, 15000, 10, 1, 1, NULL, 1, 1, 1, '2018-09-06 06:46:15', NULL, '2018-04-12 15:05:37', '2018-09-06 06:46:15'),
	(23, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', 'LCD12864-3D', 'quatang,ledfan', '', 'product/2ba0e7a82ca5ad2acc2514c90e3e7854.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 8, 11, NULL, 220000, 15000, 0, 0, 0, NULL, 0, 1, 0, NULL, NULL, '2018-08-11 13:33:37', '2018-08-11 13:34:13'),
	(24, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', 'LCD2004-3D', 'quatang,ledfan', '', 'product/d486cdb9fad4205d4b7367f2c9df1f9e.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 8, 11, NULL, 190000, 15000, 0, 0, 0, NULL, 0, 1, 0, NULL, NULL, '2018-08-11 13:39:31', '2018-08-11 13:39:31'),
	(25, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', 'RAMPS1.5-3D', 'quatang,ledfan', '', 'product/743a375879e90599f75b4e98bacf0b95.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 8, 11, NULL, 120000, 15000, 0, 0, 0, NULL, 0, 1, 0, NULL, NULL, '2018-08-11 13:41:25', '2018-08-11 13:41:25'),
	(26, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', 'EFULL-3D', 'quatang,ledfan', '', 'product/2ba0e7a82ca5ad2acc2514c90e3e7854.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 8, 11, NULL, 890000, 15000, 0, 0, 0, NULL, 0, 1, 1, '2018-08-28 06:39:46', NULL, '2018-08-11 13:50:25', '2018-09-03 17:15:38'),
	(27, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', 'ANYCUBIC-I3M', 'quatang,ledfan', '', 'product/92ddb03b751db23fbac398d887f3164f.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 1, 10, '', 7990000, 15000, 5, 0, 0, NULL, 0, 1, 0, NULL, NULL, '2018-08-22 16:26:00', '2018-09-03 17:15:38'),
	(28, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', '3DNOZZLE', 'quatang,ledfan', '', 'product/d486cdb9fad4205d4b7367f2c9df1f9e.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 8, 11, NULL, 10000, 15000, 500, 0, 0, NULL, 0, 1, 0, NULL, NULL, '2018-08-24 04:21:48', '2018-08-24 04:29:04'),
	(29, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', '3D-TEFLONLOCK', 'quatang,ledfan', '', 'product/743a375879e90599f75b4e98bacf0b95.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 1, 11, '', 10000, 15000, 500, 0, 0, NULL, 0, 1, 0, NULL, NULL, '2018-08-24 04:32:48', '2018-09-02 23:46:23'),
	(30, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', '3D-BELT-GT2', 'quatang,ledfan', '', 'product/743a375879e90599f75b4e98bacf0b95.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 0, 11, '', 20000, 15000, 0, 0, 0, NULL, 0, 1, 1, '2018-08-31 21:00:47', NULL, '2018-08-24 04:35:39', '2018-09-02 23:49:17'),
	(31, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', '3D-TEFLONLOCK-M10', 'quatang,ledfan', '', 'product/2ba0e7a82ca5ad2acc2514c90e3e7854.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 0, 11, NULL, 10000, 15000, 100, 0, 0, NULL, 0, 1, 3, '2018-09-06 06:33:23', NULL, '2018-08-24 04:39:03', '2018-09-06 06:33:23'),
	(32, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', '3D-HOTWIRE1240', 'quatang,ledfan', '', 'product/3504e19458e349a6316c568f158de4f0.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 0, 11, NULL, 20000, 15000, -1, 1, 1, NULL, 0, 1, 2, '2018-09-06 06:35:24', NULL, '2018-08-24 04:40:54', '2018-09-06 06:35:24'),
	(33, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', '3D-TEFTLON-24', 'quatang,ledfan', '', 'product/2ba0e7a82ca5ad2acc2514c90e3e7854.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 0, 11, NULL, 15000, 15000, 100, 0, 0, NULL, 0, 1, 0, NULL, NULL, '2018-08-24 04:44:04', '2018-08-24 04:45:51'),
	(34, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', '3D-TEFTLON-W24', 'quatang,ledfan', NULL, 'product/1ed5aca62cbd385f3f90b85a366a55f8.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 0, 11, '', 20000, 15000, 100, 0, 1, NULL, 0, 1, 0, NULL, NULL, '2018-08-24 05:09:34', '2018-09-06 06:19:21'),
	(35, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', '3D-SENSOR-NTC 100K', 'quatang,ledfan', NULL, 'product/d4f0b048fb171a8bf4f9701fcbac949d.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 0, 11, '', 15000, 15000, 99, 1, 1, NULL, 0, 1, 3, '2018-08-31 22:14:35', NULL, '2018-08-24 05:13:58', '2018-09-06 06:18:58'),
	(36, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', 'nRLF24L01+2.4HZ', 'quatang,ledfan', NULL, 'product/4c076364baac8604c4a32ac3eaaaf6b0.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 0, 16, '', 25000, 15000, 0, 0, 0, NULL, 0, 1, 0, NULL, NULL, '2018-08-24 06:07:15', '2018-09-06 06:18:41'),
	(37, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', 'ARDUINO-NANO', 'quatang,ledfan', NULL, 'product/d2bc18712eaea24237bfdfaac070c74a.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 0, 17, '', 100000, 15000, 0, 0, 0, NULL, 0, 1, 1, '2018-08-31 21:59:45', NULL, '2018-08-24 06:25:48', '2018-09-06 06:18:27'),
	(38, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', 'LEDSTRIP-5050RGB', 'quatang,ledfan', NULL, 'product/3d9543ddacfe442ee27111ebc94cee73.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 0, 19, '', 15000, 15000, 0, 0, 0, NULL, 0, 1, 12, '2018-08-27 16:44:08', NULL, '2018-08-24 06:33:31', '2018-09-06 06:17:59'),
	(39, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', 'LEDSTRIP-S', 'quatang,ledfan', NULL, 'product/92ddb03b751db23fbac398d887f3164f.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 0, 19, '', 15000, 15000, 0, 0, 0, NULL, 0, 1, 1, '2018-08-27 15:28:14', NULL, '2018-08-24 08:46:21', '2018-09-06 06:17:33'),
	(40, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', 'P10-IR', 'quatang,ledfan', NULL, 'product/2ba0e7a82ca5ad2acc2514c90e3e7854.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 0, 19, '', 15000, 15000, 0, 0, 0, NULL, 0, 1, 6, '2018-08-30 23:20:31', NULL, '2018-08-24 08:49:49', '2018-09-06 06:17:01'),
	(41, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', 'P10-IG', 'quatang,ledfan', NULL, 'product/f3dd749e2d58243e2d336b149c4a1235.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 0, 19, '', 15000, 15000, 0, 0, 0, NULL, 0, 1, 9, '2018-09-03 17:02:01', NULL, '2018-08-24 08:51:11', '2018-09-06 06:16:34'),
	(42, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', 'P10-IB', 'quatang,ledfan', NULL, 'product/579e387d103eff60a2c2d203dd58456b.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 0, 19, '', 15000, 15000, 0, 0, 0, NULL, 0, 1, 9, '2018-08-31 21:45:43', NULL, '2018-08-24 08:52:58', '2018-09-06 06:16:20'),
	(43, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', 'P10-IRGB', 'quatang,ledfan', NULL, 'product/4df7dbf5ab7a25605ed072d7a34199af.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 0, 19, '', 15000, 15000, 0, 0, 0, NULL, 0, 1, 2, '2018-08-27 17:23:48', NULL, '2018-08-24 08:54:45', '2018-09-06 06:15:45'),
	(44, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', 'P10-IRG', 'quatang,ledfan', NULL, 'product/979417f469dd1ec60a09d2d4fd7729c3.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 0, 19, '', 15000, 15000, -1, 1, 0, NULL, 0, 1, 18, '2018-08-27 17:19:52', NULL, '2018-08-24 08:56:02', '2018-09-06 06:15:30'),
	(45, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', 'LFF', 'quatang,ledfan', NULL, 'product/d486cdb9fad4205d4b7367f2c9df1f9e.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 0, 6, '', 15000, 15000, 0, 0, 0, NULL, 0, 1, 0, NULL, NULL, '2018-08-24 08:58:42', '2018-09-06 06:15:19'),
	(46, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', 'P2.5-I', 'quatang,ledfan', NULL, 'product/2ba0e7a82ca5ad2acc2514c90e3e7854.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 0, 19, '', 15000, 15000, 0, 0, 0, NULL, 0, 1, 10, '2018-09-01 01:05:52', NULL, '2018-08-24 09:23:07', '2018-09-06 06:15:07'),
	(47, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', 'BX-5U0', 'quatang,ledfan', NULL, 'product/3504e19458e349a6316c568f158de4f0.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 0, 19, '', 15000, 15000, 0, 0, 0, NULL, 0, 1, 63, '2018-09-01 08:00:51', NULL, '2018-08-24 09:48:31', '2018-09-06 06:14:54'),
	(48, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', 'BX-5UT', 'quatang,ledfan', NULL, 'product/743a375879e90599f75b4e98bacf0b95.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 0, 19, '2,17', 15000, 15000, 0, 0, 0, NULL, 0, 1, 139, '2018-09-06 06:14:16', NULL, '2018-08-24 09:52:15', '2018-09-06 06:14:16'),
	(49, 'Clock FAN Hiển Thị Ảnh Nhiều Màu Sắc', 'BX-5UTbnv', 'quatang,ledfan', NULL, 'product/fcb202f533939bca1f4132d89e734b28.png', '<p><strong><span style="font-size:20px;">Quạt đồng hồ đèn led nhiều m&agrave;u sắc hiển thị h&igrave;nh ảnh.</span></strong></p>\r\n\r\n<p><strong><span style="font-size:20px;">Tính năng v&agrave; th&ocirc;ng số:</span></strong></p>\r\n\r\n<p><span style="font-size:16px;">*** Hi&ecirc;̉n thị thời gian, nhiệt độ.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Hiển thịhiệu ứng chữ, h&igrave;nh ảnh nhiều m&agrave;u sắc được upload từđiện thoại di động th&ocirc;ng qua app được c&agrave;i đặt (hỗ trợ cho cả IOS v&agrave; ANDROID). tải app bằng QRCODE.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Thích hợp đ&ecirc;̉ bàn làm vi&ecirc;̣c, bàn học hoặc nơi trưng bày. Quạt r&acirc;́t mát, kh&ocirc;ng ồn.</span></p>\r\n\r\n<p><span style="font-size:16px;">*** Ngu&ocirc;̀n c&acirc;́p 5v từ c&ocirc;̉ng usb (laptop, pc, sạc di đ&ocirc;̣ng).</span></p>', 2, 2, '2', 15000, 15000, 0, 0, 0, NULL, 0, 1, 9, '2018-09-06 06:50:56', '2018-09-19 00:00:00', '2018-09-03 08:05:59', '2018-09-06 06:50:56');
/*!40000 ALTER TABLE `shop_product` ENABLE KEYS */;

-- Dumping structure for table gp247.shop_product_like
DROP TABLE IF EXISTS `shop_product_like`;
CREATE TABLE IF NOT EXISTS `shop_product_like` (
  `product_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`product_id`,`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table gp247.shop_product_like: ~0 rows (approximately)
DELETE FROM `shop_product_like`;
/*!40000 ALTER TABLE `shop_product_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_product_like` ENABLE KEYS */;

-- Dumping structure for table gp247.shop_product_recent_view
DROP TABLE IF EXISTS `shop_product_recent_view`;
CREATE TABLE IF NOT EXISTS `shop_product_recent_view` (
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `customer_id_product_id` (`user_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table gp247.shop_product_recent_view: ~8 rows (approximately)
DELETE FROM `shop_product_recent_view`;
/*!40000 ALTER TABLE `shop_product_recent_view` DISABLE KEYS */;
INSERT INTO `shop_product_recent_view` (`user_id`, `product_id`, `created_at`) VALUES
	(3, 35, '2018-08-27 15:58:21'),
	(3, 38, '2018-08-27 16:44:08'),
	(3, 41, '2018-08-27 17:19:33'),
	(3, 42, '2018-08-27 17:02:03'),
	(3, 44, '2018-08-27 17:19:52'),
	(3, 46, '2018-08-27 17:14:29'),
	(3, 47, '2018-08-27 17:01:57'),
	(3, 48, '2018-08-27 17:01:49');
/*!40000 ALTER TABLE `shop_product_recent_view` ENABLE KEYS */;

-- Dumping structure for table gp247.shop_product_type
DROP TABLE IF EXISTS `shop_product_type`;
CREATE TABLE IF NOT EXISTS `shop_product_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opt_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `opt_sku` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `opt_price` int(11) DEFAULT NULL,
  `opt_image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `opt_sku` (`opt_sku`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table gp247.shop_product_type: ~8 rows (approximately)
DELETE FROM `shop_product_type`;
/*!40000 ALTER TABLE `shop_product_type` DISABLE KEYS */;
INSERT INTO `shop_product_type` (`id`, `opt_name`, `opt_sku`, `opt_price`, `opt_image`, `product_id`) VALUES
	(3, 'Sản phẩm xanh', 'BX-5UT-s', 454, 'product/4c28c6a2fc6a3fa79197798707d55b5c.png', 48),
	(4, '34324234', 'BX-5UT-T', 1111, 'product/293da323794f89ee2d7962f44f930393.png', 48),
	(12, 'fdgdfg', 'fgdfgd', NULL, 'product/68f8a4d063e4ddef447616116dd03e0f.png', 42),
	(13, 'bnmbnmbn', 'BX-5U0-1fgfgjghjhgj', NULL, 'product/2702691387f97f5985843cbb243d267c.png', 42),
	(16, 'Sản phẩm xanh', 'BX-5U0-1fgfgkjh', NULL, 'product/777274d55ff7adeef36ca930022a8db9.jpg', 29),
	(17, 'Sản phẩm xanh', 'BX-5U0-1fgfgl', NULL, 'product/0ba3c6a927bb0e2cd2d54ce0c13df919.jpg', 30),
	(18, 'Sản phẩm xanh', 'BX-5U0-1fgfgg', NULL, 'product/7eb3eefcb94b7548cc4942a42f36e186.jpg', 27),
	(19, 'Sản phẩm xanh', 'BX-5U0-1fgfgbnvbn', NULL, 'product/7e9ee7a382be733ad68172e6abd11a95.png', 49);
/*!40000 ALTER TABLE `shop_product_type` ENABLE KEYS */;

-- Dumping structure for table gp247.shop_shipping
DROP TABLE IF EXISTS `shop_shipping`;
CREATE TABLE IF NOT EXISTS `shop_shipping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  `free` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table gp247.shop_shipping: ~0 rows (approximately)
DELETE FROM `shop_shipping`;
/*!40000 ALTER TABLE `shop_shipping` DISABLE KEYS */;
INSERT INTO `shop_shipping` (`id`, `type`, `value`, `free`, `status`) VALUES
	(1, 0, 20000, 1000000, 1);
/*!40000 ALTER TABLE `shop_shipping` ENABLE KEYS */;

-- Dumping structure for table gp247.shop_shipping_address
DROP TABLE IF EXISTS `shop_shipping_address`;
CREATE TABLE IF NOT EXISTS `shop_shipping_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `address1` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `address2` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `country` int(3) DEFAULT NULL,
  `phone` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table gp247.shop_shipping_address: ~0 rows (approximately)
DELETE FROM `shop_shipping_address`;
/*!40000 ALTER TABLE `shop_shipping_address` DISABLE KEYS */;
INSERT INTO `shop_shipping_address` (`id`, `user_id`, `address1`, `address2`, `country`, `phone`, `sort`, `status`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Quan 1', 'Ho chi Minh', NULL, '09978998768678', 0, 0, '2018-01-14 03:12:50', '2018-01-14 03:12:50');
/*!40000 ALTER TABLE `shop_shipping_address` ENABLE KEYS */;

-- Dumping structure for table gp247.shop_shipping_status
DROP TABLE IF EXISTS `shop_shipping_status`;
CREATE TABLE IF NOT EXISTS `shop_shipping_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table gp247.shop_shipping_status: ~3 rows (approximately)
DELETE FROM `shop_shipping_status`;
/*!40000 ALTER TABLE `shop_shipping_status` DISABLE KEYS */;
INSERT INTO `shop_shipping_status` (`id`, `name`) VALUES
	(0, 'Chưa gửi'),
	(1, 'Đang gửi'),
	(2, 'Gửi xong');
/*!40000 ALTER TABLE `shop_shipping_status` ENABLE KEYS */;

-- Dumping structure for table gp247.shop_shoppingcart
DROP TABLE IF EXISTS `shop_shoppingcart`;
CREATE TABLE IF NOT EXISTS `shop_shoppingcart` (
  `identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `instance` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `shop_shoppingcart_identifier_instance_index` (`identifier`,`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table gp247.shop_shoppingcart: ~0 rows (approximately)
DELETE FROM `shop_shoppingcart`;
/*!40000 ALTER TABLE `shop_shoppingcart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_shoppingcart` ENABLE KEYS */;

-- Dumping structure for table gp247.shop_special_price
DROP TABLE IF EXISTS `shop_special_price`;
CREATE TABLE IF NOT EXISTS `shop_special_price` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `off` int(11) unsigned NOT NULL,
  `date_start` timestamp NULL DEFAULT NULL,
  `date_end` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `comment` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table gp247.shop_special_price: ~8 rows (approximately)
DELETE FROM `shop_special_price`;
/*!40000 ALTER TABLE `shop_special_price` DISABLE KEYS */;
INSERT INTO `shop_special_price` (`id`, `product_id`, `price`, `off`, `date_start`, `date_end`, `status`, `comment`, `created_at`, `updated_at`) VALUES
	(1, 21, 150000, 0, '2018-01-28 00:00:00', '2019-04-30 00:00:00', 1, NULL, '2018-02-06 12:05:20', '2018-04-12 14:45:17'),
	(4, 6, 40000, 0, NULL, '2019-06-28 00:00:00', 1, NULL, '2018-02-06 12:44:40', '2018-04-12 14:45:32'),
	(6, 8, 30000, 0, '2018-02-07 00:00:00', '2018-03-10 00:00:00', 1, NULL, '2018-02-07 14:45:19', '2018-02-07 15:17:42'),
	(7, 10, 15000, 0, '2018-02-06 00:00:00', '2018-03-29 00:00:00', 1, NULL, '2018-02-07 14:49:48', '2018-03-11 05:36:43'),
	(9, 11, 100000, 0, '2018-03-19 00:00:00', '2018-03-31 00:00:00', 1, NULL, '2018-02-08 15:51:45', '2018-03-25 02:49:07'),
	(11, 12, 100000, 0, NULL, NULL, 1, NULL, '2018-03-27 14:13:47', '2018-03-27 14:18:44'),
	(12, 7, 320000, 0, '2011-10-26 00:00:00', '2019-05-08 00:00:00', 1, NULL, '2018-04-12 14:46:40', '2018-09-01 00:05:12'),
	(13, 23, 198000, 10, '2018-05-08 00:00:00', '2018-06-08 00:00:00', 0, 'test giam gia', '2018-05-09 15:15:37', '2018-08-28 22:13:45');
/*!40000 ALTER TABLE `shop_special_price` ENABLE KEYS */;

-- Dumping structure for table gp247.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table gp247.users: ~5 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `address1`, `address2`, `phone`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Hoang Ngoc Tu', 'dfne11pd2707@gmail.com', '$2y$10$yMT7ox6mh6kRQon.06MXZue.PBTwhT0xFLM9s7RDVgLYrMM/sBJHu', '122/23B, Tôn Thất Tùng', 'Quận 7', '009404945435', 'V5VfBF0g3ZjllZJyFo9Guh2E5dxIAA5HlpJScrAplZxmSMjJKiQO6W4m90kh', '2018-01-14 03:12:50', '2018-09-03 17:13:27'),
	(2, 'Hung', 'hung@fdgfdg.com', '$2y$10$eGf2jiO3I7wj879B0RRBBuZgvVvDJLQKP0HF88ZCgr4ti50AgznuO', 'Quan 1', 'Ho chi Minh', '099789987686', NULL, '2018-01-15 15:43:35', '2018-01-15 16:40:14'),
	(3, 'Lê Văn Lanh', 'asakc@gmail.com', '$2y$10$4HMDRFpiNXRPYitWP7tDhuYsCYKGK3QFiRvyeQxYbsyzgmsabRrhS', 'Quan 12', 'Ho chi minh', '0667151172', 'g9VXHoi7COeHAzffYZvms8I8hVZc0pjbMgp92mbGy8LPpOIlacvOnV6u2LvG', '2018-02-04 09:56:12', '2018-09-03 17:13:17'),
	(4, 'Châu Tuấn Anh', 'lengocchau_11233@gmail.com', '$2y$10$udnwsVhfef3QcS8oP8OEsuHg9eKTTI7lb0q6Zffd9jHiEGnIIxUBe', 'Tân Kỳ', 'Hồ Chí Minh', '0664456189', 'iYg2W7K79pAleTv2Q0rHsRCsMkx8lLN4l2fTE8o8GlLKBHyrj3TeHvIjWYgt', '2018-03-12 16:20:04', '2018-05-09 15:00:55'),
	(5, 'Bao Khanh', 'baokhanh123@gmail.com', '$2y$10$/DzsZSjPNLRY8NlrMk5lselrbMYQdmr90tXBPlYQe8CNsi1JQFyse', '12', 'TTh07', '09012345678', NULL, '2018-09-05 20:57:19', '2018-09-05 20:57:19');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
