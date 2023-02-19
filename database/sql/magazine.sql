-- -------------------------------------------------------------
-- TablePlus 5.1.0(468)
--
-- https://tableplus.com/
--
-- Database: magazine
-- Generation Time: 2022-12-25 10:45:49.6000
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `admins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=active, 0=inactive',
  `visible_in_team` tinyint(1) NOT NULL DEFAULT '0',
  `designation` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_links` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_username_unique` (`username`),
  UNIQUE KEY `admins_email_unique` (`email`),
  KEY `admins_created_by_foreign` (`created_by`),
  KEY `admins_updated_by_foreign` (`updated_by`),
  KEY `admins_deleted_by_foreign` (`deleted_by`),
  KEY `admins_first_name_index` (`first_name`),
  KEY `admins_phone_no_index` (`phone_no`),
  CONSTRAINT `admins_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admins_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admins_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `article_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `billing_information` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_request_id` bigint unsigned NOT NULL,
  `first_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` int unsigned DEFAULT NULL,
  `billing_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `booking_hour` double(8,2) unsigned NOT NULL DEFAULT '1.00',
  `booking_subtotal` double(8,2) unsigned NOT NULL DEFAULT '0.00',
  `booking_gst` double(8,2) unsigned NOT NULL DEFAULT '0.00',
  `grand_total` double(8,2) unsigned NOT NULL DEFAULT '0.00',
  `payment_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `billing_information_booking_request_id_index` (`booking_request_id`),
  KEY `billing_information_payment_status_index` (`payment_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `blogs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=>active, 0=>inactive',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blogs_slug_unique` (`slug`),
  KEY `blogs_created_by_foreign` (`created_by`),
  KEY `blogs_updated_by_foreign` (`updated_by`),
  KEY `blogs_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `blogs_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `blogs_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `blogs_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `booking_rates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(8,2) unsigned NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `booking_requests` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_id` bigint unsigned NOT NULL,
  `service_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_category_id` bigint unsigned NOT NULL,
  `service_category_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_rate_id` bigint unsigned NOT NULL,
  `booking_rate_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_rate_value` double(8,2) unsigned NOT NULL DEFAULT '0.00',
  `start_date` date NOT NULL,
  `start_time` time NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `expired_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_requests_service_id_index` (`service_id`),
  KEY `booking_requests_service_category_id_index` (`service_category_id`),
  KEY `booking_requests_booking_rate_id_index` (`booking_rate_id`),
  KEY `booking_requests_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `cache` (
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  UNIQUE KEY `cache_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `parent_category_id` bigint unsigned DEFAULT NULL COMMENT 'Null if category is parent, else parent id',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=>active, 0=>inactive',
  `enable_bg` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=>active, 0=>inactive',
  `bg_color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'FFFFFF',
  `text_color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '000000',
  `priority` bigint unsigned NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_created_by_foreign` (`created_by`),
  KEY `categories_updated_by_foreign` (`updated_by`),
  KEY `categories_deleted_by_foreign` (`deleted_by`),
  KEY `categories_parent_category_id_foreign` (`parent_category_id`),
  CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categories_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categories_parent_category_id_foreign` FOREIGN KEY (`parent_category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categories_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = not seen by admin, 1 = seen by admin',
  `admin_id` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contacts_updated_by_foreign` (`updated_by`),
  KEY `contacts_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `contacts_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `contacts_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `flag` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `countries_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `languages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `flag` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_caption` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `languages_code_unique` (`code`),
  KEY `languages_country_id_foreign` (`country_id`),
  CONSTRAINT `languages_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `oauth_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint unsigned DEFAULT NULL COMMENT 'Null if page has no category',
  `article_type_id` bigint unsigned DEFAULT NULL COMMENT 'If Article Belongs to a Type',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=>active, 0=>inactive',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`),
  KEY `pages_created_by_foreign` (`created_by`),
  KEY `pages_updated_by_foreign` (`updated_by`),
  KEY `pages_deleted_by_foreign` (`deleted_by`),
  KEY `pages_category_id_foreign` (`category_id`),
  CONSTRAINT `pages_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pages_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pages_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pages_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint unsigned DEFAULT NULL COMMENT 'Null if page has no category',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=>active, 0=>inactive',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `services_slug_unique` (`slug`),
  KEY `services_created_by_foreign` (`created_by`),
  KEY `services_updated_by_foreign` (`updated_by`),
  KEY `services_deleted_by_foreign` (`deleted_by`),
  KEY `services_category_id_foreign` (`category_id`),
  CONSTRAINT `services_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `services_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `services_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `services_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locked` tinyint(1) NOT NULL,
  `payload` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `settings_group_index` (`group`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tracks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'If there is possible to keep any reference link',
  `admin_id` bigint unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tracks_deleted_by_foreign` (`deleted_by`),
  KEY `tracks_admin_id_foreign` (`admin_id`),
  CONSTRAINT `tracks_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tracks_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=active, 0=inactive',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `language_id` bigint unsigned DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_first_name_index` (`first_name`),
  KEY `users_phone_no_index` (`phone_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `admins` (`id`, `first_name`, `last_name`, `username`, `phone_no`, `email`, `email_verified_at`, `password`, `avatar`, `status`, `visible_in_team`, `designation`, `social_links`, `remember_token`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', '', 'superadmin', '019XXXXXXXX', 'superadmin@example.com', NULL, '$2y$10$5rvKSMEBq49/myK4dQR1X.bbujCzUOQMd8TKbW4YEhdxZuTNM/GoS', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-01 17:54:38', '2022-12-01 17:54:38'),
(2, 'Admin', '', 'admin', '018XXXXXXXX', 'admin@example.com', NULL, '$2y$10$KSM0zY1PHAAERzWah4WXa.jCkgzk66col4osx.N3DQUse1g3.Fp3a', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-01 17:54:38', '2022-12-01 17:54:38'),
(3, 'Editor', '', 'editor', '017XXXXXXXX', 'editor@example.com', NULL, '$2y$10$fuy4vCRnQNKGJQDrSFtHjOXTQQfs4f/a1HUCL6CsRO5CqUT2s9A8O', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-01 17:54:38', '2022-12-01 17:54:38');

INSERT INTO `article_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'page', '2022-12-11 08:17:55', '2022-12-11 08:17:55'),
(2, 'magazine', '2022-12-11 08:19:37', '2022-12-11 08:19:37'),
(3, 'ebook', '2022-12-11 08:19:37', '2022-12-11 08:19:37'),
(4, 'rent', '2022-12-11 08:19:37', '2022-12-11 08:19:37'),
(5, 'sale', '2022-12-11 08:19:37', '2022-12-11 08:19:37'),
(6, 'product', '2022-12-11 08:19:37', '2022-12-11 08:19:37'),
(7, 'gallery', '2022-12-11 08:20:01', '2022-12-11 08:20:01');

INSERT INTO `blogs` (`id`, `title`, `slug`, `image`, `description`, `meta_description`, `status`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`) VALUES
(3, 'Discover what we’re up to and where we’re at. Find us.', 'discoverwhatwe’reuptoandwherewe’reat.findus.', 'Discover what we’re up to and where we’re at. Find us.-1669949348-logo.jpeg', '<p>Optipart is the top auto-part manufacturing company in the UK. Here you\'ll find some latest articles about us and our culture. Discover what we&rsquo;re up to and where we&rsquo;re at. Find us.</p>', 'Optipart is the top auto-part manufacturing company in the UK.', 1, NULL, 1, NULL, NULL, '2022-12-02 02:49:08', '2022-12-02 02:49:08');

INSERT INTO `categories` (`id`, `name`, `slug`, `banner_image`, `logo_image`, `description`, `meta_description`, `parent_category_id`, `status`, `enable_bg`, `bg_color`, `text_color`, `priority`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`) VALUES
(3, 'AutoParts', 'autoparts', NULL, NULL, NULL, NULL, NULL, 1, 0, 'FFFFFF', '000000', 1, NULL, NULL, 1, NULL, '2022-12-01 17:54:38', '2022-12-02 04:05:09'),
(4, 'Slider', 'slider', NULL, NULL, NULL, NULL, NULL, 1, 0, 'FFFFFF', '000000', 4, NULL, 1, NULL, NULL, '2022-12-03 04:48:14', '2022-12-03 04:48:14'),
(5, 'Rent', 'rent', NULL, NULL, '<p>Rent</p>', NULL, NULL, 1, 0, 'FFFFFF', '000000', 1, NULL, 1, NULL, NULL, '2022-12-04 11:25:50', '2022-12-04 11:25:50'),
(6, 'Home Rent', 'home-rent', NULL, NULL, '<p>Home Rent</p>', NULL, 5, 1, 0, 'FFFFFF', '000000', 2, NULL, 1, NULL, NULL, '2022-12-04 11:26:01', '2022-12-04 11:26:01'),
(7, 'Car Rent', 'car-rent', NULL, NULL, '<p>Car Rent</p>', NULL, 5, 1, 0, 'FFFFFF', '000000', 3, NULL, 1, NULL, NULL, '2022-12-04 11:26:12', '2022-12-04 11:26:12'),
(8, 'Sale', 'sale', NULL, NULL, '<p>Sale</p>', NULL, NULL, 1, 0, 'FFFFFF', '000000', 2, NULL, 1, NULL, NULL, '2022-12-04 11:26:37', '2022-12-04 11:26:37'),
(9, 'Home Sale', 'home-sale', NULL, NULL, '<p>Home Sale</p>', NULL, 8, 1, 0, 'FFFFFF', '000000', 1, NULL, 1, NULL, NULL, '2022-12-04 11:26:51', '2022-12-04 11:26:51'),
(10, 'Car Sale', 'car-sale', NULL, NULL, '<p>Car Sale</p>', NULL, 8, 1, 0, 'FFFFFF', '000000', 2, NULL, 1, NULL, NULL, '2022-12-04 11:27:05', '2022-12-04 11:27:05'),
(11, 'eBooks', 'ebooks', NULL, NULL, '<p>eBooks</p>', 'eBooks', NULL, 1, 0, 'FFFFFF', '000000', 11, NULL, 1, NULL, NULL, '2022-12-07 05:30:53', '2022-12-07 05:30:53'),
(12, 'Novel', 'novel', NULL, NULL, '<p>Novel</p>', 'Novel', 11, 1, 0, 'FFFFFF', '000000', 2, NULL, 1, NULL, NULL, '2022-12-07 05:31:11', '2022-12-07 05:31:11'),
(13, 'Poetry', 'poetry', NULL, NULL, '<p>Poetry</p>', 'Poetry', 11, 1, 0, 'FFFFFF', '000000', 3, NULL, 1, NULL, NULL, '2022-12-07 05:31:25', '2022-12-07 05:31:25'),
(14, 'Gallary', 'gallary', NULL, NULL, '<p>Gallary</p>', 'Gallary', NULL, 1, 0, 'FFFFFF', '000000', 14, NULL, 1, NULL, NULL, '2022-12-07 05:32:16', '2022-12-07 05:32:16'),
(15, 'Video Gallary', 'video-gallary', NULL, NULL, '<p>Video Gallary</p>', 'Video Gallary', 14, 1, 0, 'FFFFFF', '000000', 2, NULL, 1, NULL, NULL, '2022-12-07 05:32:34', '2022-12-07 05:32:34'),
(16, 'Photo Gallary', 'photo-gallary', NULL, NULL, '<p>Photo Gallary</p>', 'Photo Gallary', 14, 1, 0, 'FFFFFF', '000000', 3, NULL, 1, NULL, NULL, '2022-12-07 05:32:47', '2022-12-07 05:32:47'),
(17, 'Jewelry', 'jewelry', NULL, NULL, '<p>Jewelry</p>', 'Jewelry', NULL, 1, 0, 'FFFFFF', '000000', 17, NULL, 1, NULL, NULL, '2022-12-07 05:33:26', '2022-12-07 05:33:26'),
(18, 'Beauty', 'beauty', NULL, NULL, '<p>Beauty</p>', 'Beauty', NULL, 1, 0, 'FFFFFF', '000000', 18, NULL, 1, NULL, NULL, '2022-12-07 05:33:36', '2022-12-07 05:33:36');

INSERT INTO `contacts` (`id`, `name`, `message`, `subject`, `country`, `company`, `email`, `phone`, `status`, `admin_id`, `deleted_at`, `updated_by`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, 'Maniruzzaman Akash', 'sdsd', 'cPanel reset and needs to give some time to restore all data', NULL, NULL, 'manirujjamanakash@gmail.com', '01951233084', 0, NULL, NULL, NULL, NULL, '2022-12-02 08:07:21', '2022-12-02 08:07:21'),
(2, 'Maniruzzaman Akash', 'errtrt', 'CV Joint', NULL, NULL, 'manirujjamanakash@gmail.com', '01951233084', 0, NULL, NULL, NULL, NULL, '2022-12-04 10:30:45', '2022-12-04 10:30:45');

INSERT INTO `countries` (`id`, `name`, `code`, `flag`) VALUES
(1, 'United States of America', 'en', 'en.png'),
(2, 'Finland', 'fi', 'fi.png'),
(3, 'Germany', 'de', 'de.png'),
(4, 'Sweden', 'se', 'se.png'),
(5, 'Norwegian', 'no', 'no.png'),
(6, 'Greenland', 'dk', 'dk.png'),
(7, 'France', 'fr', 'fr.png'),
(8, 'Italy', 'it', 'it.png'),
(9, 'Spain', 'es', 'es.png'),
(10, 'Albanian', 'al', 'al.png'),
(11, 'Bangladesh', 'bn', 'bn.png');

INSERT INTO `languages` (`id`, `name`, `short_name`, `code`, `flag`, `banner`, `banner_caption`, `country`, `country_id`) VALUES
(1, 'English', 'Eng', 'en', 'en.png', NULL, NULL, 'United States of America', 1),
(2, 'Finnish', 'Finnish', 'fi', 'fi.png', NULL, NULL, 'Finland', 2),
(3, 'German', 'Deutsch', 'de', 'de.png', NULL, NULL, 'Germany', 3),
(4, 'Svenska', 'Svenska', 'se', 'se.png', NULL, NULL, 'Sweden', 4),
(5, 'Norsk', 'Norsk', 'no', 'no.png', NULL, NULL, 'Norwegian', 5),
(6, 'Dansk', 'Dansk', 'dk', 'dk.png', NULL, NULL, 'Greenland', 6),
(7, 'Francais', 'Francais', 'fr', 'fr.png', NULL, NULL, 'France', 7),
(8, 'English', 'Eng', 'it', 'it.png', NULL, NULL, 'Italy', 8),
(9, 'Italiano', 'Italiano', 'es', 'es.png', NULL, NULL, 'Spain', 9),
(10, 'Spannish', 'Espanol', 'al', 'al.png', NULL, NULL, 'Albanian', 10),
(11, 'Bangla', 'Bangla', 'bn', 'bn.png', NULL, NULL, 'Bangladesh', 11);

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(2, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(3, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(4, '2016_06_01_000004_create_oauth_clients_table', 1),
(5, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(6, '2020_05_01_000000_create_admins_table', 1),
(7, '2020_05_01_000010_create_users_table', 1),
(8, '2020_05_01_000020_create_failed_jobs_table', 1),
(9, '2020_05_01_000030_create_password_resets_table', 1),
(10, '2020_05_01_000050_create_categories_table', 1),
(11, '2020_05_01_000060_create_pages_table', 1),
(12, '2020_05_01_000070_create_blogs_table', 1),
(13, '2020_05_01_000080_create_contacts_table', 1),
(14, '2020_05_01_000090_create_tracks_table', 1),
(15, '2021_02_03_061323_create_article_types_table', 1),
(16, '2021_02_27_184353_create_permission_tables', 1),
(17, '2021_02_27_185000_create_countries_table', 1),
(18, '2021_02_27_185728_create_languages_table', 1),
(19, '2021_08_07_071049_create_cache_table', 1),
(20, '2021_08_07_101047_create_services_table', 1),
(21, '2021_09_16_014842_create_booking_requests_table', 1),
(22, '2021_09_20_171606_create_booking_rates_table', 1),
(23, '2021_09_20_193849_create_billing_information_table', 1),
(24, '2022_11_24_143537_delete_old_settings_table', 1),
(25, '2022_11_25_143537_create_settings_table', 1),
(26, '2022_11_25_151900_create_general_settings', 1),
(27, '2022_11_25_152111_create_contact_settings', 1),
(28, '2022_11_25_152117_create_social_settings', 1),
(29, '2022_12_11_122203_create_settings_table', 2);

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(2, 'App\\Models\\Admin', 1),
(2, 'App\\Models\\Admin', 2),
(3, 'App\\Models\\Admin', 3),
(4, 'App\\Models\\Admin', 1);

INSERT INTO `pages` (`id`, `title`, `slug`, `description`, `meta_description`, `image`, `banner_image`, `category_id`, `article_type_id`, `status`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, 'About Us', 'about-us', '<p>Optipart is a world-class auto-part manufacturer across the United Kingdom.</p>\r\n<p></p>\r\n<div class=\"card card-body p-5 mt-5\">\r\n<h3 class=\"mb-4\">Our Address</h3>\r\n<div class=\"row\">\r\n<div class=\"col-1\"><i class=\"fa fa-map-marker-alt\"></i></div>\r\n<div class=\"col-11\">Unit 6G Longden Rd, Levenshulme, Manchester M12 5SJ, United Kingdom</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-1\"><i class=\"fa fa-envelope\"></i></div>\r\n<div class=\"col-11\"><a href=\"mailto:info@optipart.co.uk\" class=\"text-danger\"> info@optipart.co.uk </a></div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-1\"><i class=\"fa fa-phone\"></i></div>\r\n<div class=\"col-11\">\r\n<p><a href=\"tel:+441612244444\" class=\"text-danger\"> +441612244444 </a></p>\r\n</div>\r\n</div>\r\n</div>', 'About Us', NULL, NULL, 3, NULL, 1, NULL, NULL, 1, NULL, '2022-12-01 17:54:38', '2022-12-03 04:29:33'),
(2, 'Contact Us', 'contact-us', '<div>Welcome to our contact us page <br /></div>', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2022-12-01 17:54:38', '2022-12-01 17:54:38'),
(3, 'Auto Parts Car Accessories Water Pump Coolant Pump', 'auto-parts-car-accessories-water-pump-coolant-pump', '', '/catalog/water-pump', 'Auto Parts Car Accessories Water Pump Coolant Pump-1670043509-logo.png', NULL, 4, NULL, 1, NULL, 1, 1, NULL, '2022-12-03 04:58:29', '2022-12-03 05:05:01'),
(4, 'Best Auto part Wheel Bearing', 'best-auto-part-wheel-bearing', '<p>New</p>', '/catalog/wheel-bearing', 'Best Wheel Bearing-1670044084-logo.png', NULL, 4, NULL, 1, NULL, 1, NULL, NULL, '2022-12-03 05:09:27', '2022-12-03 05:09:27'),
(5, 'All of your necessary auto parts in one place', 'all-of-your-necessary-auto-parts-in-one-place', '<p>All of your necessary auto parts in one place</p>', '/catalog', 'All of your necessary auto parts in one place-1670044263-logo.png', NULL, 4, NULL, 1, NULL, 1, NULL, NULL, '2022-12-03 05:11:03', '2022-12-03 05:11:03'),
(6, 'Why optipart is the right choice', 'why-optipart', '<div class=\"cmp-text__paragraph\">\r\n<ul>\r\n<li><strong>Protection</strong></li>\r\n</ul>\r\n<ul></ul>\r\n<p>All our parts are designed to&nbsp;<b>protect passengers, drivers, machines and engines</b>. Whether that\'s a tractor engine operating in dusty conditions, a pneumatic braking system in a commercial bus or an allergy-suffering driver needing clean air</p>\r\n<ul>\r\n<li><strong>Peace of mind</strong></li>\r\n</ul>\r\n<p>You can rest assured your filter meets strict safety standards, is&nbsp;<b>always OE quality&nbsp;</b>and has undergone rigorous checks. We bring&nbsp;<b>many years of Engineering experience&nbsp;</b>to every product decision and design</p>\r\n<ul></ul>\r\n<ul>\r\n<li><strong>Dependability</strong></li>\r\n</ul>\r\n<p>We are an&nbsp;<b>established and trustedbrand&nbsp;</b>supplying&amp;&nbsp;<b>premium OE quality&nbsp;</b>parts to 97% of Europe\'s vehicles</p>\r\n<div class=\"cmp-text__paragraph\">\r\n<ul>\r\n<li><strong>Support</strong></li>\r\n</ul>\r\n<p>We have established&nbsp;<b>valued partnerships&nbsp;</b>with&nbsp;<b>dealers and workshops&nbsp;</b>around the world, offering support at all levels, from&nbsp;<b>installation instructions</b>to<b>sales promotion materials</b>. We are with you every step of the way</p>\r\n<ul>\r\n<li><strong>Innovation</strong></li>\r\n</ul>\r\n<p>Our&nbsp;<b>talented global team&nbsp;</b>constantly striving to find&nbsp;<b>new and better&nbsp;</b>ways to remove residue, particulates and harmful gases. We are truly world leaders in filtration</p>\r\n<ul>\r\n<li><strong>Choice</strong></li>\r\n</ul>\r\n<p>We have an extensive range of premium filters for<b>all current engine types and machines</b></p>\r\n</div>\r\n</div>', 'Why optipart is the right choice', NULL, NULL, 3, NULL, 1, NULL, 1, 1, NULL, '2022-12-03 06:16:29', '2022-12-03 06:21:47');

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `group_name`, `created_at`, `updated_at`) VALUES
(1, 'dashboard.view', 'admin', 'dashboard', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(2, 'settings.view', 'admin', 'settings', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(3, 'settings.edit', 'admin', 'settings', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(4, 'permission.view', 'admin', 'permission', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(5, 'permission.create', 'admin', 'permission', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(6, 'permission.edit', 'admin', 'permission', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(7, 'permission.delete', 'admin', 'permission', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(8, 'admin.view', 'admin', 'admin', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(9, 'admin.create', 'admin', 'admin', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(10, 'admin.edit', 'admin', 'admin', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(11, 'admin.delete', 'admin', 'admin', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(12, 'admin_profile.view', 'admin', 'admin_profile', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(13, 'admin_profile.edit', 'admin', 'admin_profile', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(14, 'role.view', 'admin', 'role_manage', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(15, 'role.create', 'admin', 'role_manage', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(16, 'role.edit', 'admin', 'role_manage', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(17, 'role.delete', 'admin', 'role_manage', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(18, 'user.view', 'admin', 'user', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(19, 'user.create', 'admin', 'user', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(20, 'user.edit', 'admin', 'user', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(21, 'user.delete', 'admin', 'user', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(22, 'category.view', 'admin', 'category', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(23, 'category.create', 'admin', 'category', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(24, 'category.edit', 'admin', 'category', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(25, 'category.delete', 'admin', 'category', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(26, 'page.view', 'admin', 'page', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(27, 'page.create', 'admin', 'page', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(28, 'page.edit', 'admin', 'page', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(29, 'page.delete', 'admin', 'page', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(30, 'service.view', 'admin', 'service', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(31, 'service.create', 'admin', 'service', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(32, 'service.edit', 'admin', 'service', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(33, 'service.delete', 'admin', 'service', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(34, 'booking_request.view', 'admin', 'booking_request', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(35, 'booking_request.edit', 'admin', 'booking_request', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(36, 'booking_request.delete', 'admin', 'booking_request', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(37, 'blog.view', 'admin', 'blog', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(38, 'blog.create', 'admin', 'blog', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(39, 'blog.edit', 'admin', 'blog', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(40, 'blog.delete', 'admin', 'blog', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(41, 'slider.view', 'admin', 'slider', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(42, 'slider.create', 'admin', 'slider', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(43, 'slider.edit', 'admin', 'slider', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(44, 'slider.delete', 'admin', 'slider', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(45, 'tracking.view', 'admin', 'tracking', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(46, 'tracking.delete', 'admin', 'tracking', '2022-12-01 17:54:38', '2022-12-01 17:54:38'),
(47, 'email_notification.view', 'admin', 'notifications', '2022-12-01 17:54:38', '2022-12-01 17:54:38'),
(48, 'email_notification.edit', 'admin', 'notifications', '2022-12-01 17:54:38', '2022-12-01 17:54:38'),
(49, 'email_message.view', 'admin', 'notifications', '2022-12-01 17:54:38', '2022-12-01 17:54:38'),
(50, 'email_message.edit', 'admin', 'notifications', '2022-12-01 17:54:38', '2022-12-01 17:54:38'),
(51, 'contact.view', 'admin', 'contacts', '2022-12-01 17:54:38', '2022-12-01 17:54:38'),
(52, 'contact.create', 'admin', 'contacts', '2022-12-01 17:54:38', '2022-12-01 17:54:38'),
(53, 'module.view', 'admin', 'module', '2022-12-01 17:54:38', '2022-12-01 17:54:38'),
(54, 'module.create', 'admin', 'module', '2022-12-01 17:54:38', '2022-12-01 17:54:38'),
(55, 'module.edit', 'admin', 'module', '2022-12-01 17:54:38', '2022-12-01 17:54:38'),
(56, 'module.delete', 'admin', 'module', '2022-12-01 17:54:38', '2022-12-01 17:54:38'),
(57, 'module.toggle', 'admin', 'module', '2022-12-01 17:54:38', '2022-12-01 17:54:38');

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 4),
(2, 4),
(3, 4),
(4, 4),
(5, 4),
(6, 4),
(7, 4),
(8, 4),
(9, 4),
(10, 4),
(11, 4),
(12, 4),
(13, 4),
(14, 4),
(15, 4),
(16, 4),
(17, 4),
(18, 4),
(19, 4),
(20, 4),
(21, 4),
(22, 4),
(23, 4),
(24, 4),
(25, 4),
(26, 4),
(27, 4),
(28, 4),
(29, 4),
(30, 4),
(31, 4),
(32, 4),
(33, 4),
(34, 4),
(35, 4),
(36, 4),
(37, 4),
(38, 4),
(39, 4),
(40, 4),
(41, 4),
(42, 4),
(43, 4),
(44, 4),
(45, 4),
(46, 4),
(47, 4),
(48, 4),
(49, 4),
(50, 4),
(51, 4),
(52, 4),
(53, 4),
(54, 4),
(55, 4),
(56, 4),
(57, 4);

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Subscriber', 'admin', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(2, 'Admin', 'admin', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(3, 'Editor', 'admin', '2022-12-01 17:54:37', '2022-12-01 17:54:37'),
(4, 'Super Admin', 'admin', '2022-12-01 17:54:37', '2022-12-01 17:54:37');

INSERT INTO `services` (`id`, `title`, `slug`, `description`, `meta_description`, `image`, `banner_image`, `category_id`, `status`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`) VALUES
(5, 'Filters', 'filters', '<p><span>Every car has four main filters: the cabin filter, oil filter, fuel filter and air filter. The function of all these filters is to enable flows and catch impurities: the dust and contaminants in the air, the impurities in the fuel or the dirt in the motor oil. If your car filters are not replaced in time, they won\'t work properly and in the end, it could cause an impact on the mechanics. By replacing your filters, your car will be more efficient.</span></p>', NULL, 'Filters-1670045081-logo.png', 'Filters-1670045334-banner.jpeg', 3, 1, NULL, 1, 1, NULL, '2022-12-02 04:13:20', '2022-12-03 05:28:54'),
(6, 'Brakes', 'brakes', '<p>Computerized machining with tight quality standards. Made with quality materials for consistent performance and fade resistance. Premium G3000 Metallurgy to provide durability and resistance. Quality design and construction to meet OE specifications. Non-directional finish &ndash; A proven technology that contributes to reducing noise and squealing.</p>', NULL, 'Brakes-1670044986-logo.png', 'Brakes-1670044986-banner.jpeg', 3, 1, NULL, 1, 1, NULL, '2022-12-02 04:13:59', '2022-12-03 05:23:06'),
(7, 'CV Joint', 'cv-joint', '<p>Verify compatibility with your vehicle and answer all your doubts before making your purchase.</p>', 'CV Joint', 'CV Joint-1670045599-logo.jpeg', 'CV Joint-1670045599-banner.jpeg', 3, 1, NULL, 1, 1, NULL, '2022-12-02 04:14:28', '2022-12-03 05:33:19'),
(8, 'Water Pump', 'water-pump', '<p>A water pump serves an incredibly important task in ensuring that your car&rsquo;s engine runs as smoothly as possible.<br />The water pump is a part of a vehicle&rsquo;s cooling system, supplying a steady coolant stream to the motor. <br />The constant flow of fluids prevents the engine from overheating. In other words, if the water pump malfunctions,<br />the engine fail, which you do not want.</p>', 'Water Pump', 'Water Pump-1670045717-logo.webp', 'Water Pump-1669970194-banner.jpg', 3, 1, NULL, 1, 1, NULL, '2022-12-02 04:14:45', '2022-12-03 05:35:17'),
(9, 'Wheel Bearing', 'wheel-bearing', '<p>Every vehicle uses wheel bearings at each wheel to reduce friction. Most modern vehicles will use a hub assembly that contains the hub and wheel bearing. Some older vehicles will use wheel bearings that are separate components and are installed in the hub, rotor or spindle. Shop Advance Auto Parts for OEM-quality parts from Driveworks, Carquest, MOOG, National, ACDelco and more.<br />Some wheel bearings are integrated with the brake rotor, but many aren\'t. The wheel bearing cuts friction between the wheel and spindle, and a worn or failed wheel bearing can be downright dangerous. Wheel bearings are essential to reducing friction between your wheel\'s hubs and the spindle. Signs of wear can be difficult to pin down, but a foolproof way to check is to grab a suspended wheel by the top and bottom, and tip it in and out to look for excessive wear.<br />Replacing hub assemblies and wheel bearings can be a DIY job, but the level of difficulty varies depending on the vehicle. Always remember to check your vehicle\'s repair manual first to ensure you are using the right tools and parts to complete the job.<br />If you need to use high-temp grease for your repair, remember to follow the manufacturer\'s recommendations when choosing the right grease. Shop Advance Auto Parts for OEM-quality wheel bearing kits.</p>', 'Every vehicle uses wheel bearings at each wheel to reduce friction', 'Wheel Bearing-1670045821-logo.jpeg', 'Wheel Bearing-1669970868-banner.jpg', 3, 1, NULL, 1, 1, NULL, '2022-12-02 04:15:13', '2022-12-03 05:37:01'),
(10, 'Wipers', 'wipers', '<p><span>Driving in the rain can be stressful, especially at night. Optipars windshield wiper provides optimal night clarity and enhances safer driving.</span></p>', 'Wipers', 'Wipers-1670045881-logo.webp', 'Wipers-1669971277-banner.jpg', 3, 1, NULL, 1, 1, NULL, '2022-12-02 04:15:24', '2022-12-03 05:38:01'),
(11, 'Battery', 'battery', '<p>Car batteries typically last three to five years. However, your driving habits and climate affect how long the battery lasts. Motorists who use their vehicles for short distances (meaning they crank their car often for short trips) tend to wear their batteries faster than drivers who crank their cars less often and drive for longer distances. If you&rsquo;re concerned about your car battery, reputable auto repair shops often provide battery inspections to determine how much longer the battery will be useful.</p>', NULL, 'Battery-1670045994-logo.webp', 'Battery-1670045994-banner.jpeg', 3, 1, NULL, 1, 1, NULL, '2022-12-02 04:15:35', '2022-12-03 05:39:54'),
(12, 'Engine Oil', 'engine-oil', '<p>There are two main types of engines, namely gasoline engines and diesel engines. The API also regulates engine oil into two categories. The gasoline engine oil API quality level starts with S, while the diesel engine starts with C. The quality level is in alphabetical order, and the higher the letter, the higher the level.</p>', 'Engine Oil', 'Engine Oil-1670046138-logo.png', 'Engine Oil-1670046138-banner.png', 3, 1, NULL, 1, 1, NULL, '2022-12-02 04:15:47', '2022-12-03 05:42:18');

INSERT INTO `settings` (`id`, `group`, `name`, `locked`, `payload`, `created_at`, `updated_at`) VALUES
(1, 'general', 'name', 0, '\"AR Magazine\"', '2022-12-04 10:45:38', '2022-12-04 10:46:17'),
(2, 'general', 'logo', 0, '\"logo.png\"', '2022-12-04 10:45:38', '2022-12-04 10:46:17'),
(3, 'general', 'favicon', 0, '\"favicon.ico\"', '2022-12-04 10:45:38', '2022-12-04 10:46:17'),
(4, 'general', 'description', 0, NULL, '2022-12-04 10:45:38', '2022-12-04 10:46:17'),
(5, 'general', 'copyright_text', 0, '\"&copy;2022 all rights reserved.\"', '2022-12-04 10:45:38', '2022-12-04 10:46:17'),
(6, 'general', 'meta_keywords', 0, NULL, '2022-12-04 10:45:38', '2022-12-04 10:46:17'),
(7, 'general', 'meta_description', 0, NULL, '2022-12-04 10:45:38', '2022-12-04 10:46:17'),
(8, 'general', 'meta_author', 0, '\"Monjurul Islam\"', '2022-12-04 10:45:38', '2022-12-04 10:46:17'),
(9, 'contact', 'contact_no', 0, '\"+00xxxxxx\"', '2022-12-04 10:45:38', '2022-12-04 10:46:17'),
(10, 'contact', 'phone', 0, '\"+xxxx\"', '2022-12-04 10:45:38', '2022-12-04 10:46:17'),
(11, 'contact', 'email_primary', 0, '\"email@example.com\"', '2022-12-04 10:45:38', '2022-12-04 10:46:17'),
(12, 'contact', 'email_secondary', 0, NULL, '2022-12-04 10:45:38', '2022-12-04 10:46:17'),
(13, 'contact', 'address', 0, '\"xxxx\"', '2022-12-04 10:45:38', '2022-12-04 10:46:17'),
(14, 'contact', 'working_day_hours', 0, '\"xxxx\"', '2022-12-04 10:45:38', '2022-12-04 10:46:17'),
(15, 'contact', 'map_lat', 0, NULL, '2022-12-04 10:45:38', '2022-12-04 10:46:17'),
(16, 'contact', 'map_long', 0, NULL, '2022-12-04 10:45:38', '2022-12-04 10:46:17'),
(17, 'contact', 'map_zoom', 0, '\"11\"', '2022-12-04 10:45:38', '2022-12-04 10:46:17'),
(18, 'social', 'facebook', 0, '\"https://facebook.com/example\"', '2022-12-04 10:45:38', '2022-12-04 10:46:17'),
(19, 'social', 'twitter', 0, '\"https://twitter.com/\"', '2022-12-04 10:45:38', '2022-12-04 10:46:17'),
(20, 'social', 'youtube', 0, '\"https://youtube.com/\"', '2022-12-04 10:45:38', '2022-12-04 10:46:17'),
(21, 'social', 'linkedin', 0, '\"https://linkedin.com/\"', '2022-12-04 10:45:38', '2022-12-04 10:46:17'),
(22, 'social', 'pinterest', 0, '\"https://pinterest.com/\"', '2022-12-04 10:45:38', '2022-12-04 10:46:17'),
(23, 'social', 'instagram', 0, '\"https://instagram.com/\"', '2022-12-04 10:45:38', '2022-12-04 10:46:17');

INSERT INTO `tracks` (`id`, `title`, `description`, `reference_link`, `admin_id`, `deleted_at`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2022-12-02 02:14:51', '2022-12-02 02:14:51'),
(2, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2022-12-02 02:17:10', '2022-12-02 02:17:10'),
(3, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2022-12-02 02:36:16', '2022-12-02 02:36:16'),
(4, 'Discover what we’re up to and where we’re at. Find us.', 'New Blog has been created', NULL, 1, NULL, NULL, '2022-12-02 02:49:08', '2022-12-02 02:49:08'),
(5, 'autoparts', 'Category has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-02 04:05:09', '2022-12-02 04:05:09'),
(6, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2022-12-02 04:06:16', '2022-12-02 04:06:16'),
(7, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2022-12-02 04:06:28', '2022-12-02 04:06:28'),
(8, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2022-12-02 04:07:26', '2022-12-02 04:07:26'),
(9, 'Filters', 'New Service has been created', NULL, 1, NULL, NULL, '2022-12-02 04:13:20', '2022-12-02 04:13:20'),
(10, 'Brakes', 'New Service has been created', NULL, 1, NULL, NULL, '2022-12-02 04:13:59', '2022-12-02 04:13:59'),
(11, 'CV Joint', 'New Service has been created', NULL, 1, NULL, NULL, '2022-12-02 04:14:28', '2022-12-02 04:14:28'),
(12, 'Water Pump', 'New Service has been created', NULL, 1, NULL, NULL, '2022-12-02 04:14:45', '2022-12-02 04:14:45'),
(13, 'Wheel Bearing', 'New Service has been created', NULL, 1, NULL, NULL, '2022-12-02 04:15:13', '2022-12-02 04:15:13'),
(14, 'Wipers', 'New Service has been created', NULL, 1, NULL, NULL, '2022-12-02 04:15:24', '2022-12-02 04:15:24'),
(15, 'Battery', 'New Service has been created', NULL, 1, NULL, NULL, '2022-12-02 04:15:35', '2022-12-02 04:15:35'),
(16, 'Engine Oil', 'New Service has been created', NULL, 1, NULL, NULL, '2022-12-02 04:15:47', '2022-12-02 04:15:47'),
(17, 'Water Pump', 'Service has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-02 08:35:43', '2022-12-02 08:35:43'),
(18, 'Water Pump', 'Service has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-02 08:36:34', '2022-12-02 08:36:34'),
(19, 'Wheel Bearing', 'Service has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-02 08:47:48', '2022-12-02 08:47:48'),
(20, 'Wipers', 'Service has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-02 08:54:37', '2022-12-02 08:54:37'),
(21, 'Filters', 'Service has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-03 03:51:57', '2022-12-03 03:51:57'),
(22, 'About Us', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-03 04:29:33', '2022-12-03 04:29:33'),
(23, 'Slider', 'New Category has been created', NULL, 1, NULL, NULL, '2022-12-03 04:48:14', '2022-12-03 04:48:14'),
(24, 'Auto Parts Car Accessories Water Pump Coolant Pump', 'New Page has been created', NULL, 1, NULL, NULL, '2022-12-03 04:58:29', '2022-12-03 04:58:29'),
(25, 'Auto Parts Car Accessories Water Pump Coolant Pump', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-03 05:04:51', '2022-12-03 05:04:51'),
(26, 'Auto Parts Car Accessories Water Pump Coolant Pump', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-03 05:05:01', '2022-12-03 05:05:01'),
(27, 'Best Auto part Wheel Bearing', 'New Page has been created', NULL, 1, NULL, NULL, '2022-12-03 05:09:27', '2022-12-03 05:09:27'),
(28, 'All of your necessary auto parts in one place', 'New Page has been created', NULL, 1, NULL, NULL, '2022-12-03 05:11:03', '2022-12-03 05:11:03'),
(29, 'Filters', 'Service has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-03 05:20:04', '2022-12-03 05:20:04'),
(30, 'Brakes', 'Service has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-03 05:23:06', '2022-12-03 05:23:06'),
(31, 'Filters', 'Service has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-03 05:24:41', '2022-12-03 05:24:41'),
(32, 'Filters', 'Service has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-03 05:27:02', '2022-12-03 05:27:02'),
(33, 'Filters', 'Service has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-03 05:28:01', '2022-12-03 05:28:01'),
(34, 'Filters', 'Service has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-03 05:28:54', '2022-12-03 05:28:54'),
(35, 'CV Joint', 'Service has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-03 05:33:19', '2022-12-03 05:33:19'),
(36, 'Water Pump', 'Service has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-03 05:35:17', '2022-12-03 05:35:17'),
(37, 'Wheel Bearing', 'Service has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-03 05:37:01', '2022-12-03 05:37:01'),
(38, 'Wipers', 'Service has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-03 05:38:01', '2022-12-03 05:38:01'),
(39, 'Battery', 'Service has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-03 05:39:54', '2022-12-03 05:39:54'),
(40, 'Engine Oil', 'Service has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-03 05:42:18', '2022-12-03 05:42:18'),
(41, 'Why optipart is the right choice', 'New Page has been created', NULL, 1, NULL, NULL, '2022-12-03 06:16:29', '2022-12-03 06:16:29'),
(42, 'Why optipart is the right choice', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-03 06:19:43', '2022-12-03 06:19:43'),
(43, 'Why optipart is the right choice', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-03 06:21:47', '2022-12-03 06:21:47'),
(44, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2022-12-04 10:58:31', '2022-12-04 10:58:31'),
(45, 'Rent', 'New Category has been created', NULL, 1, NULL, NULL, '2022-12-04 11:25:50', '2022-12-04 11:25:50'),
(46, 'Home Rent', 'New Category has been created', NULL, 1, NULL, NULL, '2022-12-04 11:26:01', '2022-12-04 11:26:01'),
(47, 'Car Rent', 'New Category has been created', NULL, 1, NULL, NULL, '2022-12-04 11:26:12', '2022-12-04 11:26:12'),
(48, 'Sale', 'New Category has been created', NULL, 1, NULL, NULL, '2022-12-04 11:26:37', '2022-12-04 11:26:37'),
(49, 'Home Sale', 'New Category has been created', NULL, 1, NULL, NULL, '2022-12-04 11:26:51', '2022-12-04 11:26:51'),
(50, 'Car Sale', 'New Category has been created', NULL, 1, NULL, NULL, '2022-12-04 11:27:05', '2022-12-04 11:27:05'),
(51, 'eBooks', 'New Category has been created', NULL, 1, NULL, NULL, '2022-12-07 05:30:53', '2022-12-07 05:30:53'),
(52, 'Novel', 'New Category has been created', NULL, 1, NULL, NULL, '2022-12-07 05:31:11', '2022-12-07 05:31:11'),
(53, 'Poetry', 'New Category has been created', NULL, 1, NULL, NULL, '2022-12-07 05:31:25', '2022-12-07 05:31:25'),
(54, 'Gallary', 'New Category has been created', NULL, 1, NULL, NULL, '2022-12-07 05:32:16', '2022-12-07 05:32:16'),
(55, 'Video Gallary', 'New Category has been created', NULL, 1, NULL, NULL, '2022-12-07 05:32:34', '2022-12-07 05:32:34'),
(56, 'Photo Gallary', 'New Category has been created', NULL, 1, NULL, NULL, '2022-12-07 05:32:47', '2022-12-07 05:32:47'),
(57, 'Jewelry', 'New Category has been created', NULL, 1, NULL, NULL, '2022-12-07 05:33:26', '2022-12-07 05:33:26'),
(58, 'Beauty', 'New Category has been created', NULL, 1, NULL, NULL, '2022-12-07 05:33:36', '2022-12-07 05:33:36');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;