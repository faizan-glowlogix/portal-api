-- -------------------------------------------------------------
-- TablePlus 4.2.0(388)
--
-- https://tableplus.com/
--
-- Database: portal_api
-- Generation Time: 2021-10-16 00:01:44.3340
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `users` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', '645869c3-d562-4034-8f8c-fe1e1fc2fb10', 'auth_token', '60740422b75a721f19eb9cdbcdb7c9ab6534a35fb97fb9588f05a19db145c5f2', '[\"*\"]', NULL, '2021-10-12 09:07:05', '2021-10-12 09:07:05'),
(3, 'App\\Models\\User', '4dce2a63-40b6-4963-a84d-633851001680', 'auth_token', 'd50aebd6baec3937c45596c051d35d4a8c39a5601767277d22754ca3926982f1', '[\"*\"]', NULL, '2021-10-12 10:08:21', '2021-10-12 10:08:21'),
(4, 'App\\Models\\User', '4dce2a63-40b6-4963-a84d-633851001680', 'auth_token', '7afd99cbd08d7dca7181a57f4dd9a20167ae8b007128a5e7f4d1bbba06b96b30', '[\"*\"]', '2021-10-12 13:25:58', '2021-10-12 10:08:32', '2021-10-12 13:25:58'),
(5, 'App\\Models\\User', 'c3d8a638-f038-4104-8b0f-9075da669497', 'auth_token', 'c989fa339a3acf846c28dfe6e23e5d32cf8601b6cabe7ced4ce06dc2ccd03427', '[\"*\"]', NULL, '2021-10-12 12:30:30', '2021-10-12 12:30:30'),
(6, 'App\\Models\\User', '1732278c-d179-44bc-a938-38916ce4c37a', 'auth_token', '261c1e1f58c36e2a698909d8dd44312c503073c33ef91db79ffe6a7b5b13d829', '[\"*\"]', NULL, '2021-10-12 12:33:14', '2021-10-12 12:33:14'),
(7, 'App\\Models\\User', '91d07ddd-e1df-45e6-87b3-72299d3fc8a4', 'auth_token', '7949087e10a5fcc4abf79c7868760ca549aff38aeef4fc2b5774ae5d87c6d87e', '[\"*\"]', NULL, '2021-10-12 12:33:51', '2021-10-12 12:33:51'),
(8, 'App\\Models\\User', '538d9cb3-9b61-4fb6-9fe0-259ffc0db5e2', 'auth_token', '638cfd736cf3c9e112b7cda8d307618119277cf5d756e9034d67d0fe58ee5eae', '[\"*\"]', NULL, '2021-10-12 12:36:22', '2021-10-12 12:36:22'),
(9, 'App\\Models\\User', 'c94d053a-062d-4be9-9c71-d50e02a0ecff', 'auth_token', 'f288317ebb9ab4f539f1e3e6e4e1d0991e83af7d13660babc93c4d5413af000a', '[\"*\"]', NULL, '2021-10-12 12:43:26', '2021-10-12 12:43:26'),
(10, 'App\\Models\\User', '262d3857-c12e-4efb-8041-548f84fec146', 'auth_token', '46b3675236e907a5fdd34dce8051bbc1dcbc8774488a1afd6453d963ea86bf06', '[\"*\"]', NULL, '2021-10-14 10:19:53', '2021-10-14 10:19:53'),
(11, 'App\\Models\\User', '0', 'api', 'f36edb5528afbfeb19cd5401c71f7c461ede318e67559190e8f4db29a7e3eb77', '[\"*\"]', NULL, '2021-10-15 14:35:53', '2021-10-15 14:35:53'),
(12, 'App\\Models\\User', '0', 'api', 'ff4513fcda1f87ca24d506dedabe4e86660241a10352c265d556da7ba8c6f9ee', '[\"*\"]', NULL, '2021-10-15 14:38:34', '2021-10-15 14:38:34'),
(13, 'App\\Models\\User', '0', 'api', 'fdcbeda7e5c8ef22732bd6719ae2c28caacdfa1ea8b80fc5fbe2ac3e40f789f7', '[\"*\"]', NULL, '2021-10-15 14:40:17', '2021-10-15 14:40:17'),
(14, 'App\\Models\\User', '0', 'api', 'a724199814692cf38fdf51e87f136c4bdb4de223ed7c84835ca0462b2ebcacfb', '[\"*\"]', NULL, '2021-10-15 14:44:56', '2021-10-15 14:44:56'),
(15, 'App\\Models\\User', '0', 'api', '555ac641cf2f4ea705334e49adfe127ea271e278655186d4654063ccb77669bd', '[\"*\"]', NULL, '2021-10-15 14:48:24', '2021-10-15 14:48:24'),
(16, 'App\\Models\\User', 'c94d053a-062d-4be9-9c71-d50e02a0ecff', 'api', '7d88cb87663beee55d144454bed0ff22b1dba4333066d599a41f79712c3177ce', '[\"*\"]', NULL, '2021-10-15 14:53:14', '2021-10-15 14:53:14'),
(17, 'App\\Models\\User', 'c94d053a-062d-4be9-9c71-d50e02a0ecff', 'api', '8239fbca599e0185990e02d3b96f4283edbc1379cee50cacc2698ef8dadc24b9', '[\"*\"]', NULL, '2021-10-15 15:58:39', '2021-10-15 15:58:39'),
(18, 'App\\Models\\User', 'c94d053a-062d-4be9-9c71-d50e02a0ecff', 'api', 'fd695415efbda65b8f16e68684d334cc48cb9e8c6439bed624be7a1fc0421bcb', '[\"*\"]', NULL, '2021-10-15 16:16:18', '2021-10-15 16:16:18'),
(19, 'App\\Models\\User', 'c94d053a-062d-4be9-9c71-d50e02a0ecff', 'api', '435449aebc91b95c0dbb1e6a0e3c976eb613f05a4808083221748d22dde29f9b', '[\"*\"]', NULL, '2021-10-15 16:17:30', '2021-10-15 16:17:30'),
(20, 'App\\Models\\User', 'c94d053a-062d-4be9-9c71-d50e02a0ecff', 'api', 'c2be9ab5861eed2ff8ea298bea0870a49cffa8276893d16b865629d8092d334f', '[\"*\"]', NULL, '2021-10-15 16:27:13', '2021-10-15 16:27:13'),
(21, 'App\\Models\\User', 'c94d053a-062d-4be9-9c71-d50e02a0ecff', 'api', 'eeb7687fcb0822235ef2f07bd51dabec6d7d16e010b158e9964b6ef921c8a849', '[\"*\"]', NULL, '2021-10-15 16:34:42', '2021-10-15 16:34:42'),
(22, 'App\\Models\\User', 'c94d053a-062d-4be9-9c71-d50e02a0ecff', 'api', 'bf079dfa2cbadb543bcf383abe658929e3f15c64d19324fd2c0e82b33d5bc6b7', '[\"*\"]', NULL, '2021-10-15 16:36:41', '2021-10-15 16:36:41'),
(23, 'App\\Models\\User', 'c94d053a-062d-4be9-9c71-d50e02a0ecff', 'api', '81e94850a98a928a961f01bebe667f1101df96b4b68b39774c12de9c3ecdb259', '[\"*\"]', NULL, '2021-10-15 16:38:07', '2021-10-15 16:38:07'),
(24, 'App\\Models\\User', 'c94d053a-062d-4be9-9c71-d50e02a0ecff', 'api', 'e6baa273112645531576e0552de80149e63dd19089fbd9017b26c8fe51454efa', '[\"*\"]', NULL, '2021-10-15 16:42:02', '2021-10-15 16:42:02'),
(25, 'App\\Models\\User', 'c94d053a-062d-4be9-9c71-d50e02a0ecff', 'api', '097aa51e5a3ae0e8eb0692c15983f2ffa27b2de202dcf80dd3979bbc86549a98', '[\"*\"]', NULL, '2021-10-15 16:44:54', '2021-10-15 16:44:54'),
(26, 'App\\Models\\User', 'c94d053a-062d-4be9-9c71-d50e02a0ecff', 'api', '1234404d739bbb2c9c1c1f6d4174c41db8a27041721d368a3cb07dbc1efe0ec0', '[\"*\"]', NULL, '2021-10-15 17:20:56', '2021-10-15 17:20:56'),
(27, 'App\\Models\\User', 'c94d053a-062d-4be9-9c71-d50e02a0ecff', 'api', 'd09d932f0f7e0c188ccd4fca1de1c0e9cce8264c0abe0128eb7f6c9522ea41d1', '[\"*\"]', NULL, '2021-10-15 17:42:58', '2021-10-15 17:42:58'),
(28, 'App\\Models\\User', 'd3011ac1-d94a-437e-9526-fa2ba2c71078', 'api', '40f68170e3a7514aa6dd919450774022f4822690a3e842fb556260551a9c1a85', '[\"*\"]', '2021-10-15 18:47:33', '2021-10-15 17:53:47', '2021-10-15 18:47:33'),
(29, 'App\\Models\\User', 'c94d053a-062d-4be9-9c71-d50e02a0ecff', 'api', 'bc6c0b804a1cda53667e1a3183d86c905c9be0171e6a690c46f5a4ef4e198ad4', '[\"*\"]', '2021-10-15 18:48:03', '2021-10-15 18:48:02', '2021-10-15 18:48:03'),
(30, 'App\\Models\\User', 'c94d053a-062d-4be9-9c71-d50e02a0ecff', 'api', '721b93985586f63c28cf04567be9688a5e61ed3d2a88e0ae6fe0780d6648b889', '[\"*\"]', '2021-10-15 18:50:35', '2021-10-15 18:50:35', '2021-10-15 18:50:35');

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
('0ace822a-f76e-4e7f-aee6-39b61f5da13a', 'test', 'faizan.ahmad@flowlogix.com', NULL, '123456', NULL, '2021-10-12 10:02:27', '2021-10-12 10:02:27'),
('1732278c-d179-44bc-a938-38916ce4c37a', 'faizan', 'faizan.ahmed151995@gmail.com', NULL, NULL, NULL, '2021-10-12 12:33:14', '2021-10-12 12:33:14'),
('262d3857-c12e-4efb-8041-548f84fec146', 'faizan', 'faizan.ahmed151995@gmail.coma', NULL, NULL, NULL, '2021-10-14 10:19:53', '2021-10-14 10:19:53'),
('4dce2a63-40b6-4963-a84d-633851001680', 'test', 'faizan.ahmad@glowlogix.com', NULL, '$2y$10$ZpueIuMYACMCfIA7zDASNuUSONKa7WCDeniSWTe/HOYUJrpW5aaZy', NULL, '2021-10-12 10:08:21', '2021-10-12 10:08:21'),
('538d9cb3-9b61-4fb6-9fe0-259ffc0db5e2', 'afsfafasf', 'sfasfa@asfasf.com', NULL, NULL, NULL, '2021-10-12 12:36:22', '2021-10-12 12:36:22'),
('91d07ddd-e1df-45e6-87b3-72299d3fc8a4', 'faizan', 'afasfa@fafaf.com', NULL, NULL, NULL, '2021-10-12 12:33:51', '2021-10-12 12:33:51'),
('c94d053a-062d-4be9-9c71-d50e02a0ecff', 'test', 'Test@example.com', NULL, NULL, NULL, '2021-10-12 12:43:26', '2021-10-12 12:43:26'),
('d3011ac1-d94a-437e-9526-fa2ba2c71078', 'Hr Manager', 'admin@hr.com', NULL, NULL, NULL, '2021-10-15 17:51:16', '2021-10-15 17:51:16');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;