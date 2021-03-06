-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.15 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table caycanhapi.chat
CREATE TABLE IF NOT EXISTS `chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chat_id` varchar(50) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_to_chat_with_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.chat: ~7 rows (approximately)
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` (`id`, `chat_id`, `user_id`, `user_to_chat_with_id`) VALUES
	(4, '1-2', 4, 1),
	(5, '1-2', 1, 4),
	(8, '1-7', 1, 7),
	(9, '1-7', 7, 1),
	(10, '1-1', 1, 1),
	(11, '1-4', 1, 4),
	(12, '1-4', 4, 1);
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.comment
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `post_id` int(11) NOT NULL DEFAULT '0',
  `content` varchar(225) NOT NULL DEFAULT '0',
  `like` int(11) NOT NULL DEFAULT '0',
  `image_url` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.comment: ~0 rows (approximately)
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.comment_for_user_plant
CREATE TABLE IF NOT EXISTS `comment_for_user_plant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_plant_id` int(11) NOT NULL DEFAULT '0',
  `content` varchar(225) NOT NULL DEFAULT '0',
  `like` int(11) NOT NULL DEFAULT '0',
  `image_url` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.comment_for_user_plant: ~0 rows (approximately)
/*!40000 ALTER TABLE `comment_for_user_plant` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_for_user_plant` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.email_activate
CREATE TABLE IF NOT EXISTS `email_activate` (
  `email` varchar(50) DEFAULT NULL,
  `username` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `password` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_ai_ci DEFAULT NULL,
  `activation_token` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.email_activate: ~2 rows (approximately)
/*!40000 ALTER TABLE `email_activate` DISABLE KEYS */;
INSERT INTO `email_activate` (`email`, `username`, `password`, `name`, `activation_token`) VALUES
	('cnviety2@gmail.com', 'asd', '$2y$10$xl1PPBFtHupqhSHsD5n2z.3fC8yYO7ObSMbloMDJtknsa/tmugWkC', 'dfft', 9343),
	('a@gmail.com', 'a', '$2y$10$sZWgUJP9N/nZ18w2tMl08uvDDTv1IikWb2rig8Qml8VsXDpXmF90K', 'a', 1944);
/*!40000 ALTER TABLE `email_activate` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table caycanhapi.failed_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.image
CREATE TABLE IF NOT EXISTS `image` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table caycanhapi.image: ~0 rows (approximately)
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.image_for_pending_expert
CREATE TABLE IF NOT EXISTS `image_for_pending_expert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pending_expert_id` int(11) NOT NULL DEFAULT '0',
  `url` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `created_date` date NOT NULL DEFAULT '0000-00-00',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.image_for_pending_expert: ~0 rows (approximately)
/*!40000 ALTER TABLE `image_for_pending_expert` DISABLE KEYS */;
/*!40000 ALTER TABLE `image_for_pending_expert` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.image_for_plant
CREATE TABLE IF NOT EXISTS `image_for_plant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plant_id` int(11) NOT NULL DEFAULT '0',
  `url` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `created_date` date NOT NULL DEFAULT '0000-00-00',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.image_for_plant: ~0 rows (approximately)
/*!40000 ALTER TABLE `image_for_plant` DISABLE KEYS */;
/*!40000 ALTER TABLE `image_for_plant` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.image_for_post
CREATE TABLE IF NOT EXISTS `image_for_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL DEFAULT '0',
  `url` varchar(225) NOT NULL DEFAULT '0',
  `created_date` date NOT NULL DEFAULT '0000-00-00',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.image_for_post: ~6 rows (approximately)
/*!40000 ALTER TABLE `image_for_post` DISABLE KEYS */;
INSERT INTO `image_for_post` (`id`, `post_id`, `url`, `created_date`, `is_deleted`) VALUES
	(72, 51, '/storage/image_for_post/613e64f4-1637-436b-b235-743f1d7ae5e5images (2) (1).jpeg', '0000-00-00', 0),
	(73, 51, '/storage/image_for_post/77fea405-a412-434b-a8b6-271ad23f831fcay-truong-sinh-thumb.jpg', '0000-00-00', 0),
	(74, 53, '/storage/image_for_post/3864ee67-d65f-4df8-9846-ad4a65d51334images (2) (1).jpeg', '0000-00-00', 0),
	(75, 53, '/storage/image_for_post/a8b11202-3332-4cd4-9c6f-a239b7e42930cay-truong-sinh-thumb.jpg', '0000-00-00', 0),
	(76, 53, '/storage/image_for_post/f99745e7-aaa2-4467-86fe-2bc1d61e91ee20-C??Y-XANH.jpg', '0000-00-00', 0),
	(77, 54, '/storage/image_for_post/6e0e9678-5859-404d-9aa8-513f30199d75avatarfb-161341-2.jpg', '0000-00-00', 0),
	(78, 55, '/storage/image_for_post/4964df73-41c3-4372-a4a4-b4fac2f2da3820-C??Y-XANH.jpg', '0000-00-00', 0),
	(79, 57, '/storage/image_for_post/707e706d-f2f9-4ec0-99fa-7c9029b4c4a6avatarfb-161341-2.jpg', '0000-00-00', 0);
/*!40000 ALTER TABLE `image_for_post` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.image_for_user
CREATE TABLE IF NOT EXISTS `image_for_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `url` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.image_for_user: ~2 rows (approximately)
/*!40000 ALTER TABLE `image_for_user` DISABLE KEYS */;
INSERT INTO `image_for_user` (`id`, `user_id`, `url`, `created_at`, `is_deleted`) VALUES
	(15, 4, '/storage/image_for_user/1440c998-4809-4843-8cd3-82960716c3a2171227599_219177479848755_9089002422357136983_n.jpg', '0000-00-00 00:00:00', 0),
	(27, 1, '/storage/image_for_user/e9e8daaa-62ba-4fd3-8d32-95f3d1d07896images (1).jpeg', '0000-00-00 00:00:00', 0);
/*!40000 ALTER TABLE `image_for_user` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.image_for_user_plant
CREATE TABLE IF NOT EXISTS `image_for_user_plant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_plant_id` int(11) NOT NULL DEFAULT '0',
  `url` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `created_date` date NOT NULL DEFAULT '0000-00-00',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.image_for_user_plant: ~9 rows (approximately)
/*!40000 ALTER TABLE `image_for_user_plant` DISABLE KEYS */;
INSERT INTO `image_for_user_plant` (`id`, `user_plant_id`, `url`, `created_date`, `is_deleted`) VALUES
	(1, 3, '/storage/image_for_user_plant/51e255d9-eb50-4112-9a58-4a8b4821f242188465091_492964015189389_6273254574965887753_n.jpg', '0000-00-00', 0),
	(4, 6, '/storage/image_for_user_plant/d390b63c-47f3-4db7-8971-aef3287695e141iagp14xtt61.jpg', '0000-00-00', 0),
	(5, 7, '/storage/image_for_user_plant/e96753a1-cd2d-4478-beda-b63ea766add4p02zn2md.jpg', '0000-00-00', 0),
	(6, 8, '/storage/image_for_user_plant/f34639a4-0376-46ba-ad95-53167e8fd1c5zamioculcas-zamiifolia-zz-plant-pistils-nursery-733x949.jpg', '0000-00-00', 0),
	(7, 9, '/storage/image_for_user_plant/36442c15-3e87-481d-b244-4f9f1e1a57abimages (1).jpg', '0000-00-00', 0),
	(8, 11, '/storage/image_for_user_plant/3b0b633d-0cf3-46bc-bf88-5d8bd2728974a76LKn0E_700w_0.jpg', '0000-00-00', 0),
	(9, 12, '/storage/image_for_user_plant/98a3a374-4340-4ebb-91d0-7d93078064eda76LKn0E_700w_0.jpg', '0000-00-00', 0),
	(10, 13, '/storage/image_for_user_plant/3200ee16-b9e9-44d8-b142-9287538d95e8145310139_435083847726250_6323447123393892101_n.jpg', '0000-00-00', 0),
	(11, 14, '/storage/image_for_user_plant/b4a1ee13-33b8-4ec9-a19a-4bb03e0305f3150534618_421495215625812_4778847134011146192_n.jpg', '0000-00-00', 0),
	(12, 15, '/storage/image_for_user_plant/441f26a7-ba9c-498e-b15a-b4431713da13The-Mommy-is-sad-because-all-her-kids-turned-out-to-be-criminals.jpg', '0000-00-00', 0),
	(13, 16, '/storage/image_for_user_plant/97782a5a-815c-473e-a61f-4334d95738b4RDT_20210523_2227534405498798666487069.jpg', '0000-00-00', 0),
	(14, 17, '/storage/image_for_user_plant/c248bc50-fbf1-4af9-b15b-7f825c7bec51young-coffee-tree.jpg', '0000-00-00', 0);
/*!40000 ALTER TABLE `image_for_user_plant` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.liked_comment
CREATE TABLE IF NOT EXISTS `liked_comment` (
  `comment_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.liked_comment: ~11 rows (approximately)
/*!40000 ALTER TABLE `liked_comment` DISABLE KEYS */;
INSERT INTO `liked_comment` (`comment_id`, `user_id`) VALUES
	(1, 2),
	(62, 1),
	(53, 1),
	(52, 1),
	(51, 1),
	(64, 1),
	(37, 1),
	(67, 1),
	(63, 1),
	(60, 1),
	(59, 1),
	(68, 1);
/*!40000 ALTER TABLE `liked_comment` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.liked_post
CREATE TABLE IF NOT EXISTS `liked_post` (
  `post_id` int(4) DEFAULT NULL,
  `user_id` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.liked_post: ~1 rows (approximately)
/*!40000 ALTER TABLE `liked_post` DISABLE KEYS */;
INSERT INTO `liked_post` (`post_id`, `user_id`) VALUES
	(56, 1);
/*!40000 ALTER TABLE `liked_post` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table caycanhapi.migrations: ~9 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(9, '2014_10_12_000000_create_users_table', 1),
	(10, '2014_10_12_100000_create_password_resets_table', 1),
	(11, '2019_08_19_000000_create_failed_jobs_table', 1),
	(12, '2021_03_14_014525_create_images_table', 1),
	(13, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
	(14, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
	(15, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
	(16, '2016_06_01_000004_create_oauth_clients_table', 2),
	(17, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.oauth_access_tokens
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table caycanhapi.oauth_access_tokens: ~9 rows (approximately)
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
	('107b1ff4d987eb48c989b77cbc9329a08d4639954a899d318c96fc267994f211fe5a1e0609915798', 1, 3, 'appToken', '[]', 1, '2021-06-05 15:54:08', '2021-06-05 15:54:08', '2022-06-05 15:54:08'),
	('2652ac437aedb6d83702276032858c645a900644940403c5a56b13e03d8876907876790569573445', 4, 3, 'appToken', '[]', 1, '2021-06-13 10:22:49', '2021-06-13 10:22:49', '2022-06-13 10:22:49'),
	('2f94ca8afeff5b93cd49496c0f5619905c7835419523a5b2a69262a8e02259c9a38b20ca1c305907', 1, 3, 'appToken', '[]', 1, '2021-06-13 10:22:21', '2021-06-13 10:22:21', '2022-06-13 10:22:21'),
	('50ba31abb9c219d1c0a22e3e81d80323ccade474c0b91cadff64afe718e24cd58365bb29c57ad13c', 4, 3, 'appToken', '[]', 1, '2021-06-13 10:33:09', '2021-06-13 10:33:09', '2022-06-13 10:33:09'),
	('56c8a9913b3eaca1685d4674b340c6a96cf2b9e7ad060ef7f603199a427d0c3a54e134c62fc42419', 1, 3, 'appToken', '[]', 0, '2021-06-13 10:35:06', '2021-06-13 10:35:06', '2022-06-13 10:35:06'),
	('66d8f61656f614e8da85d03151aecd2589fb7bfa67634d59be1b9c4d7b569d6a331d8619154d64c5', 1, 3, 'appToken', '[]', 1, '2021-06-13 10:25:17', '2021-06-13 10:25:17', '2022-06-13 10:25:17'),
	('6a513ed36f1aa8b4bcd57e76c958a57ca596648ffd5bedf3bed9b329925f2f9e0c5644e9f1b5733e', 1, 3, 'appToken', '[]', 1, '2021-06-13 10:23:20', '2021-06-13 10:23:20', '2022-06-13 10:23:20'),
	('86c87677491deb9c5b6f480047035f93f7ad1a57a9f0b5c86e4ad303904267902bbd558e4112d5ca', 4, 3, 'appToken', '[]', 1, '2021-06-13 10:24:13', '2021-06-13 10:24:13', '2022-06-13 10:24:13'),
	('966125638381f1a331504d14219cc9ba4570449658797697b279109f7f33fa6816914c175e419ee7', 1, 3, 'appToken', '[]', 0, '2021-06-13 12:37:24', '2021-06-13 12:37:24', '2022-06-13 12:37:24'),
	('b3a2b8123eb70f6f4b8221fbdbf7f051a5616e24f16a28c6959f411c74b171d7366a21daa3310227', 4, 3, 'appToken', '[]', 1, '2021-06-13 09:59:25', '2021-06-13 09:59:25', '2022-06-13 09:59:25');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.oauth_auth_codes
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table caycanhapi.oauth_auth_codes: ~0 rows (approximately)
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.oauth_clients
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table caycanhapi.oauth_clients: ~4 rows (approximately)
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Laravel Personal Access Client', 'HJiIqTxzyIFnX04rUJ2dQ5mlEtMxlb3ZgjsXd4Rc', 'http://localhost', 1, 0, 0, '2021-03-22 12:34:41', '2021-03-22 12:34:41'),
	(2, NULL, 'Laravel Password Grant Client', 'UO09uvCNRC9UT0jxgSkyyE2lSU4uWX8GPUnP5QL6', 'http://localhost', 0, 1, 0, '2021-03-22 12:34:41', '2021-03-22 12:34:41'),
	(3, NULL, 'Laravel Personal Access Client', 'daIn4SzUx1f1NgMFJVaEP4OtMzQNdyyAVb3nfSIQ', 'http://localhost', 1, 0, 0, '2021-04-03 13:31:08', '2021-04-03 13:31:08'),
	(4, NULL, 'Laravel Password Grant Client', 'MpDtuwQBjn5aBKHjBx3KXlWJtYKMEeuP33ih7tX9', 'http://localhost', 0, 1, 0, '2021-04-03 13:31:08', '2021-04-03 13:31:08');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.oauth_personal_access_clients
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table caycanhapi.oauth_personal_access_clients: ~2 rows (approximately)
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
	(1, 1, '2021-03-22 12:34:41', '2021-03-22 12:34:41'),
	(2, 3, '2021-04-03 13:31:08', '2021-04-03 13:31:08');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.oauth_refresh_tokens
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table caycanhapi.oauth_refresh_tokens: ~0 rows (approximately)
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table caycanhapi.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.pending_expert
CREATE TABLE IF NOT EXISTS `pending_expert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `bio` varchar(3000) DEFAULT NULL,
  `experience_in` varchar(3000) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.pending_expert: ~1 rows (approximately)
/*!40000 ALTER TABLE `pending_expert` DISABLE KEYS */;
/*!40000 ALTER TABLE `pending_expert` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.plant_pending_exchange
CREATE TABLE IF NOT EXISTS `plant_pending_exchange` (
  `post_id` int(11) DEFAULT NULL,
  `user_plant_pending_id` int(11) DEFAULT NULL,
  `accepted` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.plant_pending_exchange: ~3 rows (approximately)
/*!40000 ALTER TABLE `plant_pending_exchange` DISABLE KEYS */;
INSERT INTO `plant_pending_exchange` (`post_id`, `user_plant_pending_id`, `accepted`) VALUES
	(56, 8, 1),
	(55, 8, NULL),
	(56, 17, NULL);
/*!40000 ALTER TABLE `plant_pending_exchange` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.post
CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `content` varchar(2250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `like` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `audience` int(11) NOT NULL DEFAULT '1',
  `deleted_at` datetime DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.post: ~8 rows (approximately)
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` (`id`, `title`, `content`, `created_at`, `like`, `user_id`, `audience`, `deleted_at`, `updated_at`) VALUES
	(49, 'dc', NULL, '2021-06-05 15:51:32', 0, 1, 1, NULL, '2021-06-05'),
	(50, 'd', NULL, '2021-06-05 16:09:41', 0, 1, 1, NULL, '2021-06-05'),
	(51, 'b??i vi???t', 'aaa', '2021-06-05 16:10:14', 0, 1, 1, NULL, '2021-06-05'),
	(52, 'v', NULL, '2021-06-05 16:18:57', 0, 1, 1, NULL, '2021-06-05'),
	(53, 'xc', NULL, '2021-06-05 16:20:05', 0, 1, 1, NULL, '2021-06-05'),
	(54, 'c??y c???nh', 'x????ng r???ng trao ?????i', '2021-06-05 16:22:42', 0, 1, -1, NULL, '2021-06-05'),
	(55, 'ccc', 'cv b', '2021-06-05 16:24:14', 0, 1, 1, NULL, '2021-06-05'),
	(56, 'ffc', NULL, '2021-06-05 16:38:29', 1, 1, 1, NULL, '2021-06-13'),
	(57, 'c??y c???nh', 'x????ng r???ng trao ?????i', '2021-06-11 09:57:03', 0, 1, -1, NULL, '2021-06-11');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.post_tag
CREATE TABLE IF NOT EXISTS `post_tag` (
  `post_id` int(4) DEFAULT NULL,
  `tag_id` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.post_tag: ~17 rows (approximately)
/*!40000 ALTER TABLE `post_tag` DISABLE KEYS */;
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES
	(49, -1),
	(49, 8),
	(50, -1),
	(51, -1),
	(51, 2),
	(51, 7),
	(51, 12),
	(52, -1),
	(53, -1),
	(53, 12),
	(54, -1),
	(55, -1),
	(55, 12),
	(56, -1),
	(56, 9),
	(56, 10),
	(57, -1),
	(56, 12);
/*!40000 ALTER TABLE `post_tag` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.role
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(225) NOT NULL DEFAULT '0',
  `created_date` date NOT NULL DEFAULT '0000-00-00',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.role: ~2 rows (approximately)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id`, `name`, `created_date`, `is_deleted`) VALUES
	(1, 'user', '0000-00-00', 0),
	(2, 'expert', '0000-00-00', 0),
	(3, 'admin', '0000-00-00', 0);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.saved_post
CREATE TABLE IF NOT EXISTS `saved_post` (
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.saved_post: ~0 rows (approximately)
/*!40000 ALTER TABLE `saved_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `saved_post` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.server_plant
CREATE TABLE IF NOT EXISTS `server_plant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accepted` tinyint(4) DEFAULT '0',
  `common_name` varchar(50) NOT NULL DEFAULT '',
  `scientific_name` varchar(50) DEFAULT NULL,
  `image_url` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pet_friendly` tinyint(4) DEFAULT '0',
  `difficulty` int(11) DEFAULT '1',
  `water_level` int(11) DEFAULT '1',
  `information` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sunlight` int(11) DEFAULT NULL,
  `feed_information` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `common_issue` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `min_temperature` double(22,0) DEFAULT '1',
  `max_temperature` double(22,0) DEFAULT '1',
  `min_ph` double DEFAULT NULL,
  `max_ph` double DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.server_plant: ~19 rows (approximately)
/*!40000 ALTER TABLE `server_plant` DISABLE KEYS */;
INSERT INTO `server_plant` (`id`, `accepted`, `common_name`, `scientific_name`, `image_url`, `pet_friendly`, `difficulty`, `water_level`, `information`, `sunlight`, `feed_information`, `common_issue`, `min_temperature`, `max_temperature`, `min_ph`, `max_ph`, `deleted_at`, `updated_at`, `created_at`) VALUES
	(44, 1, 'c??y x????ng r???ng', 'various Cactaceae', '/storage/image_for_server_plant/1.png', 1, 2, 4, 'H??? X????ng r???ng (danh ph??p khoa h???c: Cactaceae) th?????ng l?? c??c lo??i c??y m???ng n?????c hai l?? m???m v?? c?? hoa. H??? Cactaceae c?? t??? 25 ?????n 220 chi, t??y theo ngu???n (90 chi ph??? bi???n nh???t), trong ???? c?? t??? 1.500 ?????n 1.800 lo??i. Nh???ng c??y x????ng r???ng ???????c bi???t ?????n nh?? l?? c?? ngu???n g???c t??? ch??u M???, nh???t l?? ??? nh???ng v??ng sa m???c. C??ng c?? m???t s??? lo???i bi???u sinh trong r???ng nhi???t ?????i, nh???ng lo???i ???? m???c tr??n nh???ng c??nh c??y, v?? ??? ???? m??a r??i xu???ng ?????t nhanh, cho n??n ??? ???? th?????ng xuy??n b??? kh??. C??y x????ng r???ng c?? gai v?? th??n ????? ch???a n?????c d??? tr???.', 1, 'lil3CblFDW26pVTU7MakVddxcE2RbDWIscaBwzywvHNeTgKrv8OAn748QoDDsPE73bN1frelMtdHmOZNOZtDALnGctRlDYT7d4DN', '2yeAfelsiNe83GBOfEijj4SCBts23AaJ0c4SXBMj9a0UuflS4cWSXzWnxIPAWiJEZMQ6qqUOh4liMUN0IfDeqBVxp4NwyhDdjzCX', 22, 31, 5.3, 6.5, NULL, '2021-04-27 09:55:28', '2021-04-27 09:55:28'),
	(45, 1, 'c??y nha ??am', 'aloe barbadensis miller', '/storage/image_for_server_plant/2.png', 0, 1, 1, 'C?? ngu???n g???c t??? B???c Phi. Theo truy???n thuy???t Ai C???p th?? n??? ho??ng Cl??op??tre ???? s??? d???ng nha ??am ????? t???o ra m???t l??n da m???n m??ng, t????i t???n. C??n ?????i ????? Hy L???p Alexandros ???? d??ng nha ??am ????? ch???a v???t th????ng cho binh l??nh c???a m??nh trong nh???ng cu???c vi???n chinh. Nh???ng d??ng ch??? t?????ng h??nh v?? nh???ng h??nh v??? c??n l??u l???i tr??n nh???ng b???c t?????ng ??? nh???ng ?????n ????i Ai C???p cho th???y c??y nha ??am ???? ???????c bi???t ?????n v?? s??? d???ng c??ch ????y h??n 3000 n??m. Cho ?????n t???n ng??y h??m nay con ng?????i ???? ch???ng minh v?? kh???ng ?????nh ???????c vai tr?? c???a c??y nha ??am trong cu???c s???ng con ng?????i. C??? th??? h??n l?? trong l??nh v???c d?????c ph???m, th???c ph???m v?? m??? ph???m.', 2, 'rP1GoMmPBLSzj0d32YUFqXKFhnE8WT6U6e5VJnXu8ijBAJMpVo7uyH1ok5EzKyMZRQg5jSWOfg67CRMnQQ1n7iGj2TLPIlFn6OrU', 'RbrAR7hboe5iFpFgXrT8outmUxE39nEYc6CS3TAytsJNPtwxclUQaOw4LuAQ5HtJyl8P5nGEOo9HxRbGdEVH9RJ2t99AnaLcHMyG', 21, 33, 5.1, 6.8, NULL, '2021-04-27 09:55:28', '2021-04-27 09:55:28'),
	(46, 1, 'HupVYkPcSc', 'ybSdXlYr3b', '/storage/image_for_server_plant/3.png', 1, 2, 4, '2Osd3mSN8Tbvz1dAasCDEAQCvOkNiFwNkRnsmDITKOcCfcuhbHI8DrD4vtVba9E9geqdkEaGtLnHrssGbqvp1vtBqqftzLQkrCoy', 2, 'OMJXT50HMTbxuiBweYeXAJUpnykDD6aWPvdI499vstA5VjqvpE0p3TQm60DTUtUIqJkVVUQ3nQhYOHsHoeVhAQFRU5ACiKxTri0Q', 'NSzCJ7y9hnsSg7mWTSvtPyxpzIJ2BLipntCcI4HwLXiXBpZTTihEYVLLInQAIzYAbQnRuMbMOVsl4f4ZO4i8OYhR2i0RWi2O4bRq', 20, 33, 5.7, 6.3, NULL, '2021-04-27 09:55:28', '2021-04-27 09:55:28'),
	(47, 1, 'MYl9m44ciP', '6sLy2fKidM', '/storage/image_for_server_plant/4.png', 0, 2, 3, 'STuAiZxJ4KUVNhqJVBAU9s1q6PlfuPUYCCH1oaM1NQeE8zPHa9d0TBjjX9cOLqGO20KnSzYlJsFpRIgVlIcjIYjOtzhoO21Ejyid', 3, 'AWEOOmox9ISb3dzgMo7L1Xd2RyiqnmtGh2DIwe8wlmEoqPOq01t4rxZzHSCHXulwLxrY2lqCEMPz8QvkB9vUbPbRbzdi1qI4vsXN', 'KNeGNmKvVWX6VdIz4MRGJyI7ThZfhcxB90KQE2Op9k2xb9OPFaOlA1CLM06oZo5l9yGS8AesjLdL0jOnQHgQXZ8bJf9Rv3ffdeQt', 21, 30, 5.2, 6.1, NULL, '2021-04-27 09:55:28', '2021-04-27 09:55:28'),
	(48, 1, 'c??y ??a b??p ?????', 'ficus elastica', '/storage/image_for_server_plant/5.png', 1, 5, 3, '??a b??p ????? hay c??n g???i l?? ??a cao su, ??a dai (danh ph??p hai ph???n: Ficus elastica) l?? m???t lo??i th???c v???t c?? hoa trong chi ??a ????? (Ficus), c?? ngu???n g???c ??? v??ng ????ng b???c ???n ????? (Assam), k??o d??i v??? ph??a nam t???i Indonesia (Sumatra v?? Java).\r\n\r\nN?? l?? lo??i c??y th??n g??? l???n trong nh??m ??a ?????, c?? th??? cao t???i 30???40 m (??t khi th???y cao t???i 60 m), v???i ???????ng k??nh th??n c??y t???i 2 m, v???i th??n c??y ph??t tri???n ra t??? c??c r??? kh?? v?? r??? tr??? ????? gi??? ch???t n?? v??o trong ?????t v?? gi??? c??c c??nh to v?? n???ng. C??c l?? c???a n?? h??nh ??van, b??ng m???t, d??i kho???ng 10???35 cm v?? r???ng 5???15 cm; k??ch th?????c l?? l???n nh???t c?? ??? c??c c??y non (????i khi d??i t???i 45 cm), nh??ng nh??? h??n nhi???u ??? c??c c??y gi?? (th??ng th?????ng kho???ng 10 cm d??i). C??c l?? ph??t tri???n ??? b??n trong m???t v??? b???c t???i m?? ph??n sinh ??? ng???n, g???i l?? b??p ??a, v?? n?? s??? ph??t tri???n l???n h??n khi l?? m???i ???????c ph??t tri???n. Khi l?? ph??t tri???n, n?? m??? ra v?? v??? b???c r???ng xu???ng. B??n trong c???a l?? m???i th?? m???t l?? non kh??c ??ang ch??? ????? ???????c ph??t tri???n.\r\n\r\nGi???ng nh?? c??c th??nh vi??n kh??c c???a chi Ficus, hoa c???a ??a b??p ????? c???n ph???i c?? c??c lo??i ong ??a ????? (h??? Agaonidae) chuy??n bi???t ????? th??? ph???n trong quan h??? ?????ng ti???n h??a. Do m???i quan h??? n??y, ??a b??p ????? kh??ng s???n sinh ra c??c hoa nhi???u m??u s???c hay c?? h????ng th??m ????? d???n d??? c??c lo??i c??n tr??ng th??? ph???n cho n??. Qu??? h??nh ??van, nh???, m??u l???c-v??ng, d??i kho???ng 1 cm, ??n ???????c nh??ng ??t khi ??n; n?? ch???a c??c h???t v?? trong ???? th?? c??c ???u tr??ng c???a lo??i ong b???p c??y th??? ph???n cho ??a ????? c?? m???t.', 4, 'NratyOGBBIIykYHubvtwdE0WAGHRewy19IWfZZcW7SQMH6dvI85eVCEgRqAnRfNHKxQ61q3HRleM4A0Uemo3giboSei1CPPSQUqk', 'S77pQj40nioDt0Hl1425zCmZJNOk4IPwxBjRW2NUrZcDfuYLtuOVSSWUScrpMHmnAPEzPdHsgVRfC1mNSxO4dc8yUKvLFEAUtRrJ', 22, 30, 5.5, 6.9, NULL, '2021-04-27 09:55:28', '2021-04-27 09:55:28'),
	(49, 1, 'CGoV382UK3', 'VILSriNCnN', '/storage/image_for_server_plant/6.png', 1, 3, 4, 'R2DkXxzs32tPYuFIrrVmsYPStrM7xxyhzJ1OgpqD0EAq3dR9tfC50xWwNFpmmjMiSMzy0LZSvT5goWiBZdiIVkMWO1WX7QKq0ET0', 5, 'wVALETb1W7Ry6ahZnatYY0UXlOfyBNM64CdaF9XaJw8zxlb2fpZJSLcYF8Mp1k3juycAFgxZga2onY1PyTFG30EpbqIhOT53AJ2K', 'cU4psIRoBCvWXxC15zdDpRBYq5r1MuwZVTDIN1m5TLT8RXQ1d0XQ16nvH14v1UMzanIJPin2OJG9OW6OG86gWX8mpVDNvHPWNwyn', 21, 32, 5.5, 7, NULL, '2021-04-27 09:55:28', '2021-04-27 09:55:28'),
	(50, 1, 'pJYeiOeEaW', 'Dsj7JF8HEp', '/storage/image_for_server_plant/7.png', 1, 1, 1, 'JCCIO71TtvYW1reOylWEKcHhwh5I1EUBVjGRP23Rw4n2Iu5uymbKlF7I8YbGOHqSCkBejI0wAiqVFIlGbJnR28R21130KwR55dI2', 3, 'grfgRmzNAoCoJVw11iNAWgL0J50h2PDG4odm5Npm6xFJOZN7tkugDicXe7Is2U9RbeQ82v8kIMk7S2i1vhKUBFvBJxlkr4bLAL1V', 'JPJyzIjoTZJ5SeC1bHHtyq29gbBVJpuAfEnHpOJFa7wsyqsEBkqTfGpx0dbpI9OZoCBz04TJkdeL5iJm4NKRwhuR0EQ5RnhtdKwa', 21, 30, 5.4, 6.1, NULL, '2021-04-27 09:55:28', '2021-04-27 09:55:28'),
	(51, 1, 'c??y chu???i ng???c trai', 'curio rowleyanus', '/storage/image_for_server_plant/8.png', 0, 0, 2, 'Chu???i ng???c hay ???????c bi???t ?????n l?? c??y thanh quan, c??y r??a xanh, c??y chu???i v??ng, c?? t??n khoa h???c l?? Duranta repens thu???c h??? c??? roi ng???a (Verbenaceae). Chu???i ng???c l?? c??y c?? kh??? n??ng sinh tr?????ng v?? ph??t tri???n nhanh (c?? th??? cao t??? 0.2 ??? 3m) th?????ng ???????c s??? d???ng tr???ng l??m c??y c??ng tr??nh nh??: ??? c??ng vi??n, v???a h??, khu ???? th???,???\r\nChu???i ng???c l?? lo??i c??y c???nh th?????ng s???ng theo b???i, c?? ngu???n g???c t??? T??y ???n v?? Nam M???. C??y c?? k??ch th?????c nh???, l?? h??nh b???u d???c d??i t??? 2 ??? 5cm, l?? m???c ?????i x???ng nhau ho???c v??ng 3 l??, l?? c??y th?????ng c?? m??u v??ng ??ng khi non v?? xanh nh???n khi v??? gi??. V?? l?? c??y ph??t tri???n nhanh n??n ????? k??m h??m c??y m???c th?? ng?????i ta c?? th??? c???t t???a b???t c??nh l?? c???a c??y ho???c t???o h??n non b??? v???i d??ng kh??c nhau.', 4, '5zk5zHIyorOlbZv8lZyL1ZagBZblbt3EwbifJdD2Qxe2kqyPLQeLrD3tsXEyNNS3R6gf5wyejZcPiA2NAkDbRMLxPYN5fESaMBg8', 'DJFHQw8xQT46HYKj99LiWAwVpmAPH6JadCEo1JeNCv1WJujyDAMgSYKi8gnuRCaRarG9QhMPjLpI8CilPTjrgFvqsLeScsGQruah', 21, 31, 5.1, 6.9, NULL, '2021-04-27 09:55:28', '2021-04-27 09:55:28'),
	(52, 1, 'QAKGDuMN7y', 'HXH8H5zU6S', '/storage/image_for_server_plant/9.png', 0, 5, 2, 'R9iykHyS5H52fmPD7hlofPxYHJr2BiWd52uu2i14K4UYJD8jRwnFvDqdDf8pPGHXJ23h6LaMslf1eQbxejeixtFWk5efv3M8MTwK', 1, 'g8yOPYGZ0bfu7RK07wOhCjueHLHlFIMgz0ceIHDVQR6MxKfGSNWJQUFOVECIytC4IECZC7Uhx9PQVXVH23x8uXJFjJWahFgN31NB', 'Vu0lO6Th3UQiJGaYYLWzzpTmC2tjTyvKd20k0Ufh5Z5ZIFdKJDCwEoQiypERCOOmSrjgPldkYd3E1O7xIlOIR5v39Nubv4y7n5Rg', 20, 33, 5.4, 6, NULL, '2021-04-27 09:55:28', '2021-04-27 09:55:28'),
	(53, 1, 'tr???u b?? Nam M???', 'monstera', '/storage/image_for_server_plant/10.png', 0, 5, 2, 'TtTMuwwCzLeW34GDjmCGnwfONAUAsI3vhas52vREJ2KJZJpF5juLh1a9hlxW6F8mD1MlDQUuoZ7fMQOk8eUywnOgagPcR8tcnwed', 4, 'gVpzTAf4XNMJE3HUuQ2R3NmUfuJ07PiLWd49xBnBEkpUOR4Y9LrENm5M1RY84Hfrir6BSijgjvGsQtNZEUMGfBJs0uPCjCcPdeiM', '9Qzvb7kbN3n0nW5uYiJN6jS8UvNRGRwEARghCwoC5fEUcxET7hJVYLV9H7LFfgmYoXuN90Zngr0FxTQWfChiGzhlnK9kG9rqs1Fw', 20, 32, 5.5, 6.5, NULL, '2021-04-27 09:55:28', '2021-04-27 09:55:28'),
	(54, 1, 'MfER8R350F', 'IVGjM98dOh', '/storage/image_for_server_plant/11.png', 0, 5, 1, 'my3Tc28Ckk6xgBcQeJVDDCFhFq4xbXcTXLkbBHomqoiqmHaSTBqRpSrxLNtvd6289VWreWuVirIdt7EzJfaBrNLKaxVH6Lyk3tcR', 3, 'wc4aqlUxjo2FXJOeVZmNQZpw7y3VlMT8NE5w6C03L5haokoc95RF57DGXeYstF8KGdCDYMcPNfBrJyhQICwzAty0HYlIkJ7cB8if', '0LcSBltfhq3OGHm0Zgerfk4gJuH7GzxYf8W3tOroTnvABRBQVQrosN9xCJDJMvvqpuNuPPlDrGfpiiA1omBYuUNB1NS4anRPjBo5', 22, 32, 5.4, 6.3, NULL, '2021-04-27 09:55:28', '2021-04-27 09:55:28'),
	(55, 0, 'y1y2IQqeBy', 'zWRkMDW6nh', '/storage/image_for_server_plant/12.png', 0, 5, 5, 'j5AV01Ag3EClKy0pTwFmhlHzYhe5YI8IlCM3d9MGXSNO3SROKmxNujbYWJTWzTD5B4DtsvDa3sNVJM5WNsQ8NJQrib0z8Gpdubl6', 2, 'LoUBQcGIAzfruZ1kXcXuGK2bLhFXoLNCt0da3GDtBROA29RGllmBugNISHHkQqWNhGSPBRnNyZJUNN4GRkNo6cW1JgNx8xSHmm6s', 'gOqMPmAPepyze00Zse0fxJvOoi9UCpQ12cm8MWUgjVYy2xNJJ1YSyV3MTYPFNI2yckt8ySjlGEVJfkVGpRjJDsu3XGreFkGYSd5G', 21, 29, 5.2, 7, NULL, '2021-06-02 22:12:21', '2021-04-27 09:55:28'),
	(68, 0, 's', 'a', '/storage/image_for_server_plant/c66bb1ff-43e6-4217-a27f-854890fb323bimages (2) (1).jpeg', 0, 1, 1, 's', 1, NULL, NULL, 30, 20, NULL, NULL, NULL, '2021-06-05 15:57:48', '2021-06-05 15:57:48'),
	(69, 0, 'ffc', 'dd', '/storage/image_for_server_plant/7a33c32d-fcac-4c70-944a-f455bb0c767720-C??Y-XANH.jpg', 0, 1, 1, 'fbjj', 1, NULL, NULL, 30, 20, NULL, NULL, NULL, '2021-06-05 15:58:37', '2021-06-05 15:58:37'),
	(70, 0, '3', '3', '/storage/image_for_server_plant/bc9225a9-008d-4145-a401-72dffe8c0ef7images (2) (1).jpeg', 0, 1, 1, '3', 1, NULL, NULL, 30, 20, NULL, NULL, NULL, '2021-06-05 15:59:56', '2021-06-05 15:59:56'),
	(72, 1, 'sdf', 'wsef', '/storage/image_for_server_plant/cffb672f-41bc-4996-8600-cf74528b09aecactus_noun_002_05162.jpg', 0, 1, 1, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '2021-06-12 09:08:59', '2021-06-12 09:08:59'),
	(73, 1, 'werwetwe', 'sdfsdf', '/storage/image_for_server_plant/ea0942e3-a67a-4f0d-9e91-f1a54bbc23feunnamed (1).png', 0, 1, 1, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '2021-06-12 09:10:47', '2021-06-12 09:10:47'),
	(74, 0, 'sdfsdf', 'sdf', '/storage/image_for_server_plant/92eda9b2-dd7b-4d1c-94cc-7ae82be32756mother-in-laws-tongue.jpg', 0, 1, 1, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '2021-06-12 09:24:11', '2021-06-12 09:24:11'),
	(75, 0, 'sdfsdf', 'sdfdf', '/storage/image_for_server_plant/bc505f41-e71a-4cea-b5c6-b383b676a2fadownload (1).jfif', 0, 1, 1, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '2021-06-12 11:26:11', '2021-06-12 11:26:11');
/*!40000 ALTER TABLE `server_plant` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.server_plant_user_edit
CREATE TABLE IF NOT EXISTS `server_plant_user_edit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `has_viewed` tinyint(4) DEFAULT '0',
  `server_plant_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(225) DEFAULT NULL,
  `common_name` varchar(50) NOT NULL DEFAULT '',
  `scientific_name` varchar(50) DEFAULT NULL,
  `pet_friendly` tinyint(4) DEFAULT '0',
  `difficulty` int(11) DEFAULT '1',
  `water_level` int(11) DEFAULT '1',
  `information` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sunlight` int(11) DEFAULT NULL,
  `feed_information` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `common_issue` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `min_temperature` double(22,0) DEFAULT '1',
  `max_temperature` double(22,0) DEFAULT '1',
  `min_ph` double DEFAULT NULL,
  `max_ph` double DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.server_plant_user_edit: ~1 rows (approximately)
/*!40000 ALTER TABLE `server_plant_user_edit` DISABLE KEYS */;
INSERT INTO `server_plant_user_edit` (`id`, `has_viewed`, `server_plant_id`, `user_id`, `user_name`, `common_name`, `scientific_name`, `pet_friendly`, `difficulty`, `water_level`, `information`, `sunlight`, `feed_information`, `common_issue`, `min_temperature`, `max_temperature`, `min_ph`, `max_ph`, `deleted_at`, `updated_at`, `created_at`) VALUES
	(76, 0, 51, 1, NULL, 'abc', 'curio rowleyanus', 0, 1, 2, 'Chu???i ng???c hay ???????c bi???t ?????n l?? c??y thanh quan, c??y r??a xanh, c??y chu???i v??ng, c?? t??n khoa h???c l?? Duranta repens thu???c h??? c??? roi ng???a (Verbenaceae). Chu???i ng???c l?? c??y c?? kh??? n??ng sinh tr?????ng v?? ph??t tri???n nhanh (c?? th??? cao t??? 0.2 ??? 3m) th?????ng ???????c s??? d???ng tr???ng l??m c??y c??ng tr??nh nh??: ??? c??ng vi??n, v???a h??, khu ???? th???,???\r\nChu???i ng???c l?? lo??i c??y c???nh th?????ng s???ng theo b???i, c?? ngu???n g???c t??? T??y ???n v?? Nam M???. C??y c?? k??ch th?????c nh???, l?? h??nh b???u d???c d??i t??? 2 ??? 5cm, l?? m???c ?????i x???ng nhau ho???c v??ng 3 l??, l?? c??y th?????ng c?? m??u v??ng ??ng khi non v?? xanh nh???n khi v??? gi??. V?? l?? c??y ph??t tri???n nhanh n??n ????? k??m h??m c??y m???c th?? ng?????i ta c?? th??? c???t t???a b???t c??nh l?? c???a c??y ho???c t???o h??n non b??? v???i d??ng kh??c nhau.', 4, '5zk5zHIyorOlbZv8lZyL1ZagBZblbt3EwbifJdD2Qxe2kqyPLQeLrD3tsXEyNNS3R6gf5wyejZcPiA2NAkDbRMLxPYN5fESaMBg8', 'DJFHQw8xQT46HYKj99LiWAwVpmAPH6JadCEo1JeNCv1WJujyDAMgSYKi8gnuRCaRarG9QhMPjLpI8CilPTjrgFvqsLeScsGQruah', 21, 31, NULL, NULL, NULL, '2021-06-13 15:36:32', '2021-06-13 12:49:17'),
	(77, 0, 48, 1, NULL, 'c??y ??a b??p abc', 'ficus elastica', 1, 1, 3, '??a b??p ????? hay c??n g???i l?? ??a cao su, ??a dai (danh ph??p hai ph???n: Ficus elastica) l?? m???t lo??i th???c v???t c?? hoa trong chi ??a ????? (Ficus), c?? ngu???n g???c ??? v??ng ????ng b???c ???n ????? (Assam), k??o d??i v??? ph??a nam t???i Indonesia (Sumatra v?? Java).\r\n\r\nN?? l?? lo??i c??y th??n g??? l???n trong nh??m ??a ?????, c?? th??? cao t???i 30???40 m (??t khi th???y cao t???i 60 m), v???i ???????ng k??nh th??n c??y t???i 2 m, v???i th??n c??y ph??t tri???n ra t??? c??c r??? kh?? v?? r??? tr??? ????? gi??? ch???t n?? v??o trong ?????t v?? gi??? c??c c??nh to v?? n???ng. C??c l?? c???a n?? h??nh ??van, b??ng m???t, d??i kho???ng 10???35 cm v?? r???ng 5???15 cm; k??ch th?????c l?? l???n nh???t c?? ??? c??c c??y non (????i khi d??i t???i 45 cm), nh??ng nh??? h??n nhi???u ??? c??c c??y gi?? (th??ng th?????ng kho???ng 10 cm d??i). C??c l?? ph??t tri???n ??? b??n trong m???t v??? b???c t???i m?? ph??n sinh ??? ng???n, g???i l?? b??p ??a, v?? n?? s??? ph??t tri???n l???n h??n khi l?? m???i ???????c ph??t tri???n. Khi l?? ph??t tri???n, n?? m??? ra v?? v??? b???c r???ng xu???ng. B??n trong c???a l?? m???i th?? m???t l?? non kh??c ??ang ch??? ????? ???????c ph??t tri???n.\r\n\r\nGi???ng nh?? c??c th??nh vi??n kh??c c???a chi Ficus, hoa c???a ??a b??p ????? c???n ph???i c?? c??c lo??i ong ??a ????? (h??? Agaonidae) chuy??n bi???t ????? th??? ph???n trong quan h??? ?????ng ti???n h??a. Do m???i quan h??? n??y, ??a b??p ????? kh??ng s???n sinh ra c??c hoa nhi???u m??u s???c hay c?? h????ng th??m ????? d???n d??? c??c lo??i c??n tr??ng th??? ph???n cho n??. Qu??? h??nh ??van, nh???, m??u l???c-v??ng, d??i kho???ng 1 cm, ??n ???????c nh??ng ??t khi ??n; n?? ch???a c??c h???t v?? trong ???? th?? c??c ???u tr??ng c???a lo??i ong b???p c??y th??? ph???n cho ??a ????? c?? m???t.', 4, 'NratyOGBBIIykYHubvtwdE0WAGHRewy19IWfZZcW7SQMH6dvI85eVCEgRqAnRfNHKxQ61q3HRleM4A0Uemo3giboSei1CPPSQUqk', 'S77pQj40nioDt0Hl1425zCmZJNOk4IPwxBjRW2NUrZcDfuYLtuOVSSWUScrpMHmnAPEzPdHsgVRfC1mNSxO4dc8yUKvLFEAUtRrJ', 22, 30, NULL, NULL, NULL, '2021-06-13 12:54:58', '2021-06-13 12:50:03');
/*!40000 ALTER TABLE `server_plant_user_edit` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.tag
CREATE TABLE IF NOT EXISTS `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_type_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(225) NOT NULL DEFAULT '0',
  `created_date` date NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.tag: ~11 rows (approximately)
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` (`id`, `tag_type_id`, `name`, `created_date`, `deleted_at`) VALUES
	(-1, 3, 'default', '2021-05-16', NULL),
	(1, 1, 'c??y Lan', '2021-03-26', NULL),
	(2, 1, 'c??y v??n ph??ng', '2021-03-26', NULL),
	(3, 1, 'tr???u b??', '2021-03-26', NULL),
	(4, 1, 'x????ng r???ng', '2021-03-26', NULL),
	(5, 1, 'sen ????', '2021-03-26', NULL),
	(6, 1, 'd??y leo', '2021-03-26', NULL),
	(7, 2, 'm???o v???t', '2021-03-26', NULL),
	(8, 2, 't??m s???', '2021-03-26', NULL),
	(9, 2, 'n??ng cao', '2021-03-26', NULL),
	(10, 2, 'ki???n th???c', '2021-03-26', NULL),
	(11, 2, 'c?? b???n', '2021-03-26', NULL),
	(12, 4, 'trao ?????i', '2021-05-20', NULL);
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.tag_type
CREATE TABLE IF NOT EXISTS `tag_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(225) NOT NULL DEFAULT '0',
  `created_date` date NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.tag_type: ~4 rows (approximately)
/*!40000 ALTER TABLE `tag_type` DISABLE KEYS */;
INSERT INTO `tag_type` (`id`, `name`, `created_date`, `is_deleted`) VALUES
	(1, 'Lo???i C??y', '2021-03-26', 0),
	(2, 'N???i dung', '2021-03-26', 0),
	(3, 'Default', '2021-05-17', 0),
	(4, 'Trao ?????i', '2021-05-20', 0);
/*!40000 ALTER TABLE `tag_type` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.task
CREATE TABLE IF NOT EXISTS `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plant_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `description` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `from_date` date NOT NULL DEFAULT '0000-00-00',
  `to_date` date NOT NULL DEFAULT '0000-00-00',
  `created_date` date NOT NULL DEFAULT '0000-00-00',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.task: ~0 rows (approximately)
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
/*!40000 ALTER TABLE `task` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `email` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  `bio` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `role_id` int(11) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(4) DEFAULT '0',
  `name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_ai_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.user: ~5 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `email`, `password`, `bio`, `role_id`, `is_deleted`, `name`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'chronicle', 'chronicle1951@gmail.com', '$2y$10$hbysJrQYpZhOTzNT6JffcuAoyZDnzz2NdnDpYvwq7AePlY8U.BtCu', 'Welcome to my feed, where people come for enjoyment.', 2, 0, 'Mai ????ng Khoa', NULL, NULL, '2021-03-31 14:55:40', '2021-06-10 15:27:33', NULL),
	(4, 'lampart', 'dangkhoa.lampart@gmail.com', '$2y$10$fYzWwFpa8Uqlrqk4G5cDiecxpwyfAwn7zVwwhvJnUkTebkxHa9gK2', 'I am a rare species, not a stereotype.', 1, 0, 'Nguy???n V??n A', NULL, NULL, '2021-04-08 08:28:07', '2021-05-10 11:27:19', NULL),
	(5, 'z', 'dangkhoa@gmail.com', '$2y$10$1vyNg.NWLf0AP3S8LtcyVOZ8eDs3MCiKHUUjY4G/ww0e2RvQHdqEK', ' I???m not ashamed to be me. What???s wrong with being amazingly unique?', 1, 0, 'Mai ????ng Khoa', NULL, NULL, '2021-04-11 16:46:45', '2021-04-11 16:46:46', NULL),
	(6, 'plantcare', 'plantcare@gmail.com', '$2y$10$1vyNg.NWLf0AP3S8LtcyVOZ8eDs3MCiKHUUjY4G/ww0e2RvQHdqEK', 'I???m writing my autobiography on my Facebook account.', 2, 0, 'Plant Care', NULL, NULL, '2021-04-11 16:47:30', '2021-05-10 15:46:18', NULL),
	(7, 'khoa', 'khoa@gmail.com', '$2y$10$apLDytxUt8rOU/jxWRsSHOBm.f2EyQ5KKOUETXD6Rd6tYGUkKS9dC', '', 1, 0, 'khoa', NULL, NULL, '2021-04-12 17:03:22', '2021-04-12 17:03:22', NULL),
	(8, 'admin', 'admin@gmail.com', '$2y$10$LsLLHLjQwhV.lWNyo7YmXOz7rJY/qKKdYWrz6lyNf.1YICRBeSWwK', '', 3, 0, 'Khoa', NULL, NULL, '2021-05-10 09:23:06', '2021-05-10 09:23:06', NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.user_follow_user
CREATE TABLE IF NOT EXISTS `user_follow_user` (
  `user_id` int(11) DEFAULT NULL,
  `follower_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.user_follow_user: ~5 rows (approximately)
/*!40000 ALTER TABLE `user_follow_user` DISABLE KEYS */;
INSERT INTO `user_follow_user` (`user_id`, `follower_user_id`) VALUES
	(1, 4),
	(1, 5),
	(1, 6),
	(1, 7),
	(7, 1),
	(4, 1);
/*!40000 ALTER TABLE `user_follow_user` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.user_plant
CREATE TABLE IF NOT EXISTS `user_plant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `common_name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `scientific_name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `description` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT ' ',
  `available` tinyint(4) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.user_plant: ~10 rows (approximately)
/*!40000 ALTER TABLE `user_plant` DISABLE KEYS */;
INSERT INTO `user_plant` (`id`, `user_id`, `common_name`, `scientific_name`, `description`, `available`, `created_at`, `deleted_at`, `updated_at`) VALUES
	(3, 4, 'x????ng r???ng', 'cactus', 'x????ng r???ng trao ?????i', 1, '2021-05-19 10:42:06', NULL, '2021-05-19 10:42:06'),
	(6, 1, 'x????ng r???ng', ' ', 'x????ng r???ng trao ?????i', 1, '2021-05-19 16:51:07', NULL, '2021-05-19 16:51:07'),
	(7, 1, 'c??y c???nh', ' ', 'x????ng r???ng trao ?????i', 1, '2021-05-19 19:27:52', NULL, '2021-05-19 19:27:52'),
	(8, 4, 'c??y c???nh', ' ', 'x????ng r???ng trao ?????i', 1, '2021-05-19 19:28:03', NULL, '2021-05-19 19:28:03'),
	(9, 1, 'c??y c???nh', ' ', 'x????ng r???ng trao ?????i', 1, '2021-05-19 19:28:12', NULL, '2021-05-19 19:28:12'),
	(11, 1, 'c??y c???nh', '', 'x????ng r???ng trao ?????i', 1, '2021-05-19 19:30:48', NULL, '2021-05-19 19:30:48'),
	(12, 1, 'c??y c???nh', '', 'x????ng r???ng trao ?????i', 1, '2021-05-19 19:35:40', NULL, '2021-05-19 19:35:40'),
	(13, 1, 'c??y c???nh', '', 'x????ng r???ng trao ?????i', 1, '2021-05-19 19:35:57', NULL, '2021-05-19 19:35:57'),
	(14, 1, 'c??y c???nh', '', 'x????ng r???ng trao ?????i', 1, '2021-05-19 19:37:31', NULL, '2021-05-19 19:37:31'),
	(15, 1, 'c??y sen', 'vhhhhh', ' ', 1, '2021-05-20 15:19:28', NULL, '2021-05-20 15:19:28'),
	(16, 1, 'test', 'gdgdgd', ' You can use Padding, which is a very simple Widget that just takes another Widget as a child and an EdgeInsets object like the one you are already using as padding.', 1, '2021-05-30 20:43:36', NULL, '2021-05-30 20:43:36'),
	(17, 4, 'hoa', 'c', NULL, 1, '2021-06-13 10:34:21', NULL, '2021-06-13 10:34:21');
/*!40000 ALTER TABLE `user_plant` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
