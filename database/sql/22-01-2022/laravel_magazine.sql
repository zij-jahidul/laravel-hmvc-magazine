-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2023 at 10:26 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_magazine`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `username` varchar(191) NOT NULL,
  `phone_no` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `avatar` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=active, 0=inactive',
  `is_trusted` tinyint(1) DEFAULT 0,
  `visible_in_team` tinyint(1) NOT NULL DEFAULT 0,
  `designation` varchar(100) DEFAULT NULL,
  `social_links` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `first_name`, `last_name`, `username`, `phone_no`, `email`, `email_verified_at`, `password`, `avatar`, `status`, `is_trusted`, `visible_in_team`, `designation`, `social_links`, `remember_token`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'Hello', 'superadmin', '019XXXXXXXX', 'superadmin@example.com', NULL, '$2y$10$5rvKSMEBq49/myK4dQR1X.bbujCzUOQMd8TKbW4YEhdxZuTNM/GoS', NULL, 1, 0, 0, NULL, NULL, 'IkZrUQmCCD04Y41RjRzBW7vWcB39AOLnEQfLwi0ykjgq0t4bAGGLKSWhxnX4', NULL, NULL, NULL, NULL, '2022-12-01 11:54:38', '2022-12-01 11:54:38'),
(2, 'Admin', '', 'admin', '018XXXXXXXX', 'admin@example.com', NULL, '$2y$10$KSM0zY1PHAAERzWah4WXa.jCkgzk66col4osx.N3DQUse1g3.Fp3a', NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-01 11:54:38', '2022-12-01 11:54:38'),
(3, 'Editor', '', 'editor', '017XXXXXXXX', 'editor@example.com', NULL, '$2y$10$fuy4vCRnQNKGJQDrSFtHjOXTQQfs4f/a1HUCL6CsRO5CqUT2s9A8O', NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-01 11:54:38', '2022-12-01 11:54:38'),
(13, 'Advertisement', 'advertisement', 'advertisement', NULL, 'advertisement@gmail.com', NULL, '$2y$10$vZrb5d.k7Sp0na3lMwkT5.fPChuW/Erp3hGrC9txBzf5opKf3FP0.', NULL, 1, 0, 1, 'Designation', '{\"facebook\":null,\"twitter\":null,\"linkedin\":null,\"instagram\":null,\"youtube\":null}', NULL, NULL, 1, NULL, NULL, '2023-01-10 07:29:46', '2023-01-10 07:29:46'),
(15, 'Jahidul', 'islam', 'jahidulislam', '01714895074', 'jahidul@gmail.com', NULL, '$2y$10$L6rM9x9JE4V/3ep0nVrcOOxY7eMlD8RrhKvR3sdB25ZkjBVAcKsti', NULL, 0, 0, 0, NULL, NULL, '37kd80ohdeCIbblXvo255tSMc5zzWFq4GXIRezUicCUdbgEOrsomntvbMPCL', NULL, NULL, NULL, NULL, '2023-01-19 22:58:42', '2023-01-19 22:58:42');

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `ads_link` varchar(191) NOT NULL DEFAULT '0',
  `image` varchar(191) NOT NULL DEFAULT '0',
  `video_link` varchar(191) DEFAULT NULL,
  `position` enum('0','1','2','3','4') NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`id`, `title`, `description`, `ads_link`, `image`, `video_link`, `position`, `status`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, 'Ads Title', '<p>Big Description</p>', 'www.ads.com', 'Ads Title-1672881013-image.png', 'www.youtubue.com', '2', '0', NULL, 1, NULL, NULL, '2023-01-04 19:10:13', '2023-01-04 19:10:39');

-- --------------------------------------------------------

--
-- Table structure for table `advertisements`
--

CREATE TABLE `advertisements` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `page_id` bigint(11) UNSIGNED NOT NULL,
  `address` text DEFAULT NULL,
  `price` double(8,2) NOT NULL DEFAULT 0.00,
  `offer_price` double(8,2) NOT NULL DEFAULT 0.00,
  `condition` enum('new','old') NOT NULL DEFAULT 'new',
  `additional_info_title` text DEFAULT NULL,
  `additional_info_description` longtext DEFAULT NULL,
  `is_phone_visible` enum('true','false') NOT NULL DEFAULT 'false',
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `advertisements`
--

INSERT INTO `advertisements` (`id`, `page_id`, `address`, `price`, `offer_price`, `condition`, `additional_info_title`, `additional_info_description`, `is_phone_visible`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, 15, 'Recusandae Placeat', 1500.00, 600.00, 'new', 'Safety tips', '<ol>\n<li>Don&rsquo;t go to unfamiliar places alone</li>\n<li>Don&rsquo;t make full payments to 3rd parties</li>\n</ol>', 'true', NULL, NULL, '2022-12-27 19:50:29', '2022-12-27 19:50:29'),
(2, 18, 'Recusandae Placeat', 12345.00, 1234.00, 'new', 'Safety tips', '<p>Don&rsquo;t go to unfamiliar places alone Don&rsquo;t make full payment to 3rd parties</p><ol>\n<li>Don&rsquo;t go to unfamiliar places alone</li>\n<li>Don&rsquo;t make full payments to 3rd parties</li>\n</ol>', 'true', NULL, NULL, '2022-12-27 19:56:01', '2023-01-01 05:33:20'),
(3, 16, 'Recusandae Placeat', 1000.00, 800.00, 'new', 'Safety tips', '<ol>\n<li>Don&rsquo;t go to unfamiliar places alone</li>\n<li>Don&rsquo;t make full payments to 3rd parties</li>\n</ol>', 'true', NULL, NULL, '2022-12-27 19:50:29', '2022-12-27 19:50:29'),
(4, 17, 'Rampura, Dhaka', 2000.00, 1000.00, 'new', 'Safety tips', '<ol>\n<li>Don&rsquo;t go to unfamiliar places alone</li>\n<li>Don&rsquo;t make full payments to 3rd parties</li>\n</ol>', 'true', NULL, NULL, '2022-12-27 19:56:01', '2023-01-01 06:14:12'),
(5, 6, 'Perferendis dolor ab', 500.00, 200.00, 'old', 'Safety tips', '<ol>\n<li>Don&rsquo;t go to unfamiliar places alone</li>\n<li>Don&rsquo;t make full payments to 3rd parties</li>\n</ol>', 'false', NULL, NULL, '2022-12-27 19:56:01', '2022-12-27 19:56:01'),
(6, 7, 'Perferendis dolor ab', 900.00, 400.00, 'old', 'Safety tips', '<ol>\n<li>Don&rsquo;t go to unfamiliar places alone</li>\n<li>Don&rsquo;t make full payments to 3rd parties</li>\n</ol>', 'false', NULL, NULL, '2022-12-27 19:56:01', '2022-12-27 19:56:01'),
(7, 1, 'Perferendis dolor ab', 950.00, 800.00, 'old', 'Safety tips', '<ol>\n<li>Don&rsquo;t go to unfamiliar places alone</li>\n<li>Don&rsquo;t make full payments to 3rd parties</li>\n</ol>', 'false', NULL, NULL, '2022-12-27 19:56:01', '2022-12-27 19:56:01'),
(9, 19, 'মোহাম্মদপুর', 20000.00, 17000.00, 'new', 'Safety tips', '<ul class=\"safety-tips--1jZLK\">\r\n<li>Don&rsquo;t go to unfamiliar places alone</li>\r\n<li>Don&rsquo;t make full payments to 3rd parties</li>\r\n</ul>', 'true', NULL, NULL, '2023-01-01 07:18:41', '2023-01-07 09:48:40'),
(10, 20, 'Aliquid sequi volupt', 351.00, 851.00, 'new', 'Nihil suscipit aperi', '<p>asfdasdffads</p>', 'true', NULL, NULL, '2023-01-10 10:52:03', '2023-01-10 10:52:03'),
(11, 21, 'Et voluptate tempor', 11.00, 551.00, 'new', 'Iure ipsum sunt natu', '<p>asdfffdasafsdfdas</p>', 'false', NULL, NULL, '2023-01-10 10:52:32', '2023-01-10 10:52:32'),
(12, 22, 'Sunt officiis commod', 868.00, 575.00, 'old', 'Incididunt accusanti', '<p>fasdfdasdfasdfsa</p>', 'false', NULL, NULL, '2023-01-11 10:03:01', '2023-01-11 10:03:01'),
(13, 23, 'Rampura, Dhaka', 2000.00, 1000.00, 'old', 'Additional Info Title', '<p>Additional Info Description<span class=\"optional\"></span></p>', 'true', NULL, NULL, '2023-01-11 19:18:52', '2023-01-11 19:18:52'),
(14, 24, 'Sunt esse laborum V', 917.00, 46.00, 'new', 'Illo qui amet incid', '<p>Sit velit cumque vol.</p>', 'true', NULL, NULL, '2023-01-14 09:24:41', '2023-01-14 09:24:41'),
(15, 25, 'Non harum vel a opti', 606.00, 722.00, 'old', 'Reprehenderit incid', '<p>Incididunt at obcaec.</p>', 'true', NULL, NULL, '2023-01-16 07:57:14', '2023-01-16 07:57:14'),
(16, 26, 'Iure reprehenderit n', 2.00, 467.00, 'new', 'Blanditiis debitis a', '<p>Cumque in sed id dol.</p>', 'false', NULL, NULL, '2023-01-16 08:06:07', '2023-01-16 08:06:07'),
(17, 27, 'Porro impedit quia', 524.00, 593.00, 'old', 'Et quisquam ut quia', '<p>Dolore nostrud sed e.</p>', 'true', NULL, NULL, '2023-01-16 08:29:59', '2023-01-16 08:29:59'),
(18, 28, 'Rampura, Ctg', 1234.00, 123.00, 'new', 'faasdasdfdafs', '<p>asfdfdasafdsfdas</p>', 'true', NULL, NULL, '2023-01-18 21:09:44', '2023-01-19 08:03:39'),
(19, 29, 'Dolores porro beatae', 756.00, 590.00, 'old', 'Quam esse a voluptas', '<p>Non dolore quidem ab.</p>', 'true', NULL, NULL, '2023-01-20 08:34:48', '2023-01-20 08:34:48'),
(20, 30, 'Est sequi commodo qu', 300.00, 200.00, 'new', 'Deleniti sint dolore', '<p>Repudiandae velit de.</p>', 'true', NULL, NULL, '2023-01-20 08:45:41', '2023-01-20 08:50:22'),
(21, 31, 'Laboris quia possimu', 397.00, 221.00, 'old', 'Consequatur Qui ut', '<p>Dicta esse vel molli.</p>', 'false', NULL, NULL, '2023-01-20 08:52:20', '2023-01-20 08:52:20');

-- --------------------------------------------------------

--
-- Table structure for table `article_types`
--

CREATE TABLE `article_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `article_types`
--

INSERT INTO `article_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'page', '2022-12-11 02:17:55', '2022-12-11 02:17:55'),
(2, 'magazine', '2022-12-11 02:19:37', '2022-12-11 02:19:37'),
(3, 'ebook', '2022-12-11 02:19:37', '2022-12-11 02:19:37'),
(4, 'rent', '2022-12-11 02:19:37', '2022-12-11 02:19:37'),
(5, 'sale', '2022-12-11 02:19:37', '2022-12-11 02:19:37'),
(6, 'product', '2022-12-11 02:19:37', '2022-12-11 02:19:37'),
(7, 'gallery', '2022-12-11 02:20:01', '2022-12-11 02:20:01');

-- --------------------------------------------------------

--
-- Table structure for table `billing_information`
--

CREATE TABLE `billing_information` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_request_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `phone_no` varchar(15) NOT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `state` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `post_code` int(10) UNSIGNED DEFAULT NULL,
  `billing_message` text DEFAULT NULL,
  `booking_hour` double(8,2) UNSIGNED NOT NULL DEFAULT 1.00,
  `booking_subtotal` double(8,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `booking_gst` double(8,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `grand_total` double(8,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `payment_status` varchar(191) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `description` text NOT NULL,
  `meta_description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>active, 0=>inactive',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `slug`, `image`, `description`, `meta_description`, `status`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`) VALUES
(3, 'Discover what we’re up to and where we’re at. Find us.', 'discoverwhatwe’reuptoandwherewe’reat.findus.', 'Discover what we’re up to and where we’re at. Find us.-1669949348-logo.jpeg', '<p>Optipart is the top auto-part manufacturing company in the UK. Here you\'ll find some latest articles about us and our culture. Discover what we&rsquo;re up to and where we&rsquo;re at. Find us.</p>', 'Optipart is the top auto-part manufacturing company in the UK.', 1, NULL, 1, NULL, NULL, '2022-12-01 20:49:08', '2022-12-01 20:49:08');

-- --------------------------------------------------------

--
-- Table structure for table `booking_rates`
--

CREATE TABLE `booking_rates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `rate` double(8,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booking_requests`
--

CREATE TABLE `booking_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone_no` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `service_name` varchar(100) NOT NULL,
  `service_category_id` bigint(20) UNSIGNED NOT NULL,
  `service_category_name` varchar(100) NOT NULL,
  `booking_rate_id` bigint(20) UNSIGNED NOT NULL,
  `booking_rate_name` varchar(100) NOT NULL,
  `booking_rate_value` double(8,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `start_date` date NOT NULL,
  `start_time` time NOT NULL,
  `message` text DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'pending',
  `expired_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(191) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `banner_image` varchar(191) DEFAULT NULL,
  `logo_image` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `parent_category_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Null if category is parent, else parent id',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>active, 0=>inactive',
  `enable_bg` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>active, 0=>inactive',
  `bg_color` varchar(20) NOT NULL DEFAULT 'FFFFFF',
  `text_color` varchar(20) NOT NULL DEFAULT '000000',
  `priority` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `banner_image`, `logo_image`, `description`, `meta_description`, `parent_category_id`, `status`, `enable_bg`, `bg_color`, `text_color`, `priority`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`) VALUES
(3, 'AutoParts', 'autoparts', NULL, NULL, NULL, NULL, NULL, 1, 0, 'FFFFFF', '000000', 1, NULL, NULL, 1, NULL, '2022-12-01 11:54:38', '2022-12-01 22:05:09'),
(4, 'Slider', 'slider', NULL, NULL, NULL, NULL, NULL, 1, 0, 'FFFFFF', '000000', 4, NULL, 1, NULL, NULL, '2022-12-02 22:48:14', '2022-12-02 22:48:14'),
(5, 'Rent', 'rent', NULL, NULL, '<p>Rent</p>', NULL, NULL, 1, 0, 'FFFFFF', '000000', 1, NULL, 1, NULL, NULL, '2022-12-04 05:25:50', '2022-12-04 05:25:50'),
(6, 'Home Rent', 'home-rent', NULL, NULL, '<p>Home Rent</p>', NULL, 5, 1, 0, 'FFFFFF', '000000', 2, NULL, 1, NULL, NULL, '2022-12-04 05:26:01', '2022-12-04 05:26:01'),
(7, 'Car Rent', 'car-rent', NULL, NULL, '<p>Car Rent</p>', NULL, 5, 1, 0, 'FFFFFF', '000000', 3, NULL, 1, NULL, NULL, '2022-12-04 05:26:12', '2022-12-04 05:26:12'),
(8, 'Sale', 'sale', NULL, NULL, '<p>Sale</p>', NULL, NULL, 1, 0, 'FFFFFF', '000000', 2, NULL, 1, NULL, NULL, '2022-12-04 05:26:37', '2022-12-04 05:26:37'),
(9, 'Home Sale', 'home-sale', NULL, NULL, '<p>Home Sale</p>', NULL, 8, 1, 0, 'FFFFFF', '000000', 1, NULL, 1, NULL, NULL, '2022-12-04 05:26:51', '2022-12-04 05:26:51'),
(10, 'Car Sale', 'car-sale', NULL, NULL, '<p>Car Sale</p>', NULL, 8, 1, 0, 'FFFFFF', '000000', 2, NULL, 1, NULL, NULL, '2022-12-04 05:27:05', '2022-12-04 05:27:05'),
(11, 'eBooks', 'ebooks', NULL, NULL, '<p>eBooks</p>', 'eBooks', NULL, 1, 0, 'FFFFFF', '000000', 11, NULL, 1, NULL, NULL, '2022-12-06 23:30:53', '2022-12-06 23:30:53'),
(12, 'Novel', 'novel', NULL, NULL, '<p>Novel</p>', 'Novel', 11, 1, 0, 'FFFFFF', '000000', 2, NULL, 1, NULL, NULL, '2022-12-06 23:31:11', '2022-12-06 23:31:11'),
(13, 'Poetry', 'poetry', NULL, NULL, '<p>Poetry</p>', 'Poetry', 11, 1, 0, 'FFFFFF', '000000', 3, NULL, 1, NULL, NULL, '2022-12-06 23:31:25', '2022-12-06 23:31:25'),
(14, 'Gallary', 'gallary', NULL, NULL, '<p>Gallary</p>', 'Gallary', NULL, 1, 0, 'FFFFFF', '000000', 14, NULL, 1, NULL, NULL, '2022-12-06 23:32:16', '2022-12-06 23:32:16'),
(15, 'Video Gallary', 'video-gallary', NULL, NULL, '<p>Video Gallary</p>', 'Video Gallary', 14, 1, 0, 'FFFFFF', '000000', 2, NULL, 1, NULL, NULL, '2022-12-06 23:32:34', '2022-12-06 23:32:34'),
(16, 'Photo Gallary', 'photo-gallary', NULL, NULL, '<p>Photo Gallary</p>', 'Photo Gallary', 14, 1, 0, 'FFFFFF', '000000', 3, NULL, 1, NULL, NULL, '2022-12-06 23:32:47', '2022-12-06 23:32:47'),
(17, 'Jewelry', 'jewelry', NULL, NULL, '<p>Jewelry</p>', 'Jewelry', NULL, 1, 0, 'FFFFFF', '000000', 17, NULL, 1, NULL, NULL, '2022-12-06 23:33:26', '2022-12-06 23:33:26'),
(18, 'Beauty', 'beauty', NULL, NULL, '<p>Beauty</p>', 'Beauty', NULL, 1, 0, 'FFFFFF', '000000', 18, NULL, 1, NULL, NULL, '2022-12-06 23:33:36', '2022-12-06 23:33:36');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `message` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `country` varchar(191) DEFAULT NULL,
  `company` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = not seen by admin, 1 = seen by admin',
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `message`, `subject`, `country`, `company`, `email`, `phone`, `status`, `admin_id`, `deleted_at`, `updated_by`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, 'Maniruzzaman Akash', 'sdsd', 'cPanel reset and needs to give some time to restore all data', NULL, NULL, 'manirujjamanakash@gmail.com', '01951233084', 0, NULL, NULL, NULL, NULL, '2022-12-02 02:07:21', '2022-12-02 02:07:21'),
(2, 'Maniruzzaman Akash', 'errtrt', 'CV Joint', NULL, NULL, 'manirujjamanakash@gmail.com', '01951233084', 0, NULL, NULL, NULL, NULL, '2022-12-04 04:30:45', '2022-12-04 04:30:45');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `flag` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `short_name` varchar(191) DEFAULT NULL,
  `code` varchar(191) NOT NULL,
  `flag` varchar(191) DEFAULT NULL,
  `banner` varchar(191) DEFAULT NULL,
  `banner_caption` varchar(191) DEFAULT NULL,
  `country` varchar(191) NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

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
(29, '2022_12_11_122203_create_settings_table', 2),
(30, '2022_12_25_131549_create_advertisements_table', 3),
(35, '2023_01_01_134811_create_packages_table', 4),
(37, '2023_01_05_000719_create_ads_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(2, 'App\\Models\\Admin', 1),
(2, 'App\\Models\\Admin', 2),
(3, 'App\\Models\\Admin', 3),
(4, 'App\\Models\\Admin', 1),
(6, 'App\\Models\\Admin', 13),
(6, 'App\\Models\\Admin', 15);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `title` varchar(191) DEFAULT NULL,
  `duration` int(11) NOT NULL DEFAULT 0,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `logo` varchar(191) DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `title`, `duration`, `amount`, `logo`, `status`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, 'Package 1', '1 Day', 1, 10.00, 'Package title 1-1672854291-logo.png', '0', NULL, 1, NULL, NULL, '2023-01-04 11:40:24', '2023-01-10 07:46:28'),
(2, 'Package 2', '7 Days', 7, 20.00, '15 days-1673358356-logo.png', '0', NULL, 1, NULL, NULL, '2023-01-10 07:45:56', '2023-01-11 19:37:14'),
(3, 'Package 3', '15 Days', 15, 50.00, '30-1673358421-logo.png', '0', NULL, 1, NULL, NULL, '2023-01-10 07:47:01', '2023-01-11 19:37:35'),
(4, 'Package 4', '30 Days', 30, 70.00, '30 Days-1673487475-logo.png', '0', NULL, 1, NULL, NULL, '2023-01-11 19:37:55', '2023-01-11 19:37:55');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `meta_description` text DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `banner_image` varchar(191) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Null if page has no category',
  `article_type_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'If Article Belongs to a Type',
  `user_id` bigint(11) DEFAULT NULL,
  `group_name` enum('magazine','advertisement') DEFAULT 'advertisement',
  `phone_visible` tinyint(1) DEFAULT 0,
  `is_approved` tinyint(1) DEFAULT 0,
  `is_pinned` tinyint(1) DEFAULT 0,
  `poster_image` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1 COMMENT '1=>active, 0=>inactive',
  `position` varchar(255) DEFAULT NULL,
  `is_position` int(11) DEFAULT 0,
  `priority` int(11) DEFAULT 0,
  `package_id` int(11) DEFAULT NULL,
  `is_paid` tinyint(1) DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `description`, `meta_description`, `image`, `banner_image`, `category_id`, `article_type_id`, `user_id`, `group_name`, `phone_visible`, `is_approved`, `is_pinned`, `poster_image`, `status`, `position`, `is_position`, `priority`, `package_id`, `is_paid`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, 'About Us', 'about-us', '<div class=\"ad-meta--17Bqm justify-content-flex-start--1Xozy align-items-normal--vaTgD flex-wrap-wrap--2PCx8 flex-direction-row--27fh1 flex--3fKk1\">\n<div class=\"two-columns--19Hyo full-width--XovDn justify-content-flex-start--1Xozy align-items-normal--vaTgD flex-wrap-nowrap--3IpfJ flex-direction-row--27fh1 flex--3fKk1\">\n<div class=\"word-break--2nyVq label--3oVZK\">Address: ময়নারটেক, উত্তরা, ঢাকা-১২৩০।&nbsp; Bedrooms: 3&nbsp; Bathrooms: 3&nbsp;&nbsp; Size: 1,500 sqft</div>\n</div>\n<div class=\"two-columns--19Hyo full-width--XovDn justify-content-flex-start--1Xozy align-items-normal--vaTgD flex-wrap-nowrap--3IpfJ flex-direction-row--27fh1 flex--3fKk1\">\n<div class=\"heading--2u5sJ\">Facing: South Facing Completion Status: Ongoing</div>\n</div>\n<div class=\"two-columns--19Hyo full-width--XovDn justify-content-flex-start--1Xozy align-items-normal--vaTgD flex-wrap-nowrap--3IpfJ flex-direction-row--27fh1 flex--3fKk1\">\n<div class=\"heading--2u5sJ\"></div>\n<div class=\"heading--2u5sJ\"><strong>Description</strong></div>\n</div>\n</div>\n<div class=\"description-section--oR57b\">\n<div>\n<div class=\"description--1nRbz\">\n<div class=\"expandable-container--1kbq7\">\n<div class=\"list--Jk0mL\">\n<div style=\"overflow: hidden; height: 142px; transition: height 50ms ease-in 0s;\" id=\"collapsible-content-0\" aria-hidden=\"true\" data-testid=\"collapse\">\n<div class=\"description--1nRbz\">\n<p>\"BuildTech Innovation &amp; Construction\" একটি নতুন প্রকল্প \"BuildTech Paragon Condo\" এর কাজ শুরু করতে পেরে আনন্দিত। যা উত্তরার উত্তরখান এলাকায় অবস্থিত একটি প্রিমিয়াম আবাসিক প্রকল্প। এটি একটি নিখুঁত আবাস যা আধুনিক সুযোগ-সুবিধা সম্বেলিত নান্দনিকভাবে ডিজাইন করা একটি বাসস্থান।</p>\n<p>বিল্ডটেক প্যারাগন কনডো- সকল নাগরিক সুবিধাসহ একটি সত্যিকারের কনডোমিনিয়াম।</p>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>', 'About Us', NULL, NULL, 3, NULL, NULL, 'magazine', 2, 1, 0, 'property_1.jpeg', 1, 'views_left', 0, 0, NULL, 0, NULL, NULL, 1, NULL, '2022-12-01 11:54:38', '2022-12-02 22:29:33'),
(2, 'Contact Us', 'contact-us', '<div class=\"ad-meta--17Bqm justify-content-flex-start--1Xozy align-items-normal--vaTgD flex-wrap-wrap--2PCx8 flex-direction-row--27fh1 flex--3fKk1\">\n<div class=\"two-columns--19Hyo full-width--XovDn justify-content-flex-start--1Xozy align-items-normal--vaTgD flex-wrap-nowrap--3IpfJ flex-direction-row--27fh1 flex--3fKk1\">\n<div class=\"word-break--2nyVq label--3oVZK\">Address: ময়নারটেক, উত্তরা, ঢাকা-১২৩০।&nbsp; Bedrooms: 3&nbsp; Bathrooms: 3&nbsp;&nbsp; Size: 1,500 sqft</div>\n</div>\n<div class=\"two-columns--19Hyo full-width--XovDn justify-content-flex-start--1Xozy align-items-normal--vaTgD flex-wrap-nowrap--3IpfJ flex-direction-row--27fh1 flex--3fKk1\">\n<div class=\"heading--2u5sJ\">Facing: South Facing Completion Status: Ongoing</div>\n</div>\n<div class=\"two-columns--19Hyo full-width--XovDn justify-content-flex-start--1Xozy align-items-normal--vaTgD flex-wrap-nowrap--3IpfJ flex-direction-row--27fh1 flex--3fKk1\">\n<div class=\"heading--2u5sJ\"></div>\n<div class=\"heading--2u5sJ\"><strong>Description</strong></div>\n</div>\n</div>\n<div class=\"description-section--oR57b\">\n<div>\n<div class=\"description--1nRbz\">\n<div class=\"expandable-container--1kbq7\">\n<div class=\"list--Jk0mL\">\n<div style=\"overflow: hidden; height: 142px; transition: height 50ms ease-in 0s;\" id=\"collapsible-content-0\" aria-hidden=\"true\" data-testid=\"collapse\">\n<div class=\"description--1nRbz\">\n<p>\"BuildTech Innovation &amp; Construction\" একটি নতুন প্রকল্প \"BuildTech Paragon Condo\" এর কাজ শুরু করতে পেরে আনন্দিত। যা উত্তরার উত্তরখান এলাকায় অবস্থিত একটি প্রিমিয়াম আবাসিক প্রকল্প। এটি একটি নিখুঁত আবাস যা আধুনিক সুযোগ-সুবিধা সম্বেলিত নান্দনিকভাবে ডিজাইন করা একটি বাসস্থান।</p>\n<p>বিল্ডটেক প্যারাগন কনডো- সকল নাগরিক সুবিধাসহ একটি সত্যিকারের কনডোমিনিয়াম।</p>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 'magazine', 2, 1, 0, 'property_1.jpeg', 1, 'views_left', 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2022-12-01 11:54:38', '2022-12-01 11:54:38'),
(3, 'Save money on your next rental car', 'auto-parts-car-accessories-water-pump-coolant-pump', '', '/catalog/water-pump', 'Save money on your next rental car-1672578337-logo.jpg', NULL, 4, 1, NULL, 'magazine', 2, 1, 0, 'property_1.jpeg', 1, 'views_left', 0, 0, NULL, 0, NULL, 1, 1, NULL, '2022-12-02 22:58:29', '2023-01-01 07:05:37'),
(4, 'Home Rent', 'best-auto-part-wheel-bearing', '<div class=\"ad-meta--17Bqm justify-content-flex-start--1Xozy align-items-normal--vaTgD flex-wrap-wrap--2PCx8 flex-direction-row--27fh1 flex--3fKk1\">\r\n<div class=\"two-columns--19Hyo full-width--XovDn justify-content-flex-start--1Xozy align-items-normal--vaTgD flex-wrap-nowrap--3IpfJ flex-direction-row--27fh1 flex--3fKk1\">\r\n<div class=\"word-break--2nyVq label--3oVZK\">Address: ময়নারটেক, উত্তরা, ঢাকা-১২৩০।&nbsp; Bedrooms: 3&nbsp; Bathrooms: 3&nbsp;&nbsp; Size: 1,500 sqft</div>\r\n</div>\r\n<div class=\"two-columns--19Hyo full-width--XovDn justify-content-flex-start--1Xozy align-items-normal--vaTgD flex-wrap-nowrap--3IpfJ flex-direction-row--27fh1 flex--3fKk1\">\r\n<div class=\"heading--2u5sJ\">Facing: South Facing Completion Status: Ongoing</div>\r\n</div>\r\n<div class=\"two-columns--19Hyo full-width--XovDn justify-content-flex-start--1Xozy align-items-normal--vaTgD flex-wrap-nowrap--3IpfJ flex-direction-row--27fh1 flex--3fKk1\">\r\n<div class=\"heading--2u5sJ\"></div>\r\n<div class=\"heading--2u5sJ\"><strong>Description</strong></div>\r\n</div>\r\n</div>\r\n<div class=\"description-section--oR57b\">\r\n<div>\r\n<div class=\"description--1nRbz\">\r\n<div class=\"expandable-container--1kbq7\">\r\n<div class=\"list--Jk0mL\">\r\n<div style=\"overflow: hidden; height: 142px; transition: height 50ms ease-in 0s;\" id=\"collapsible-content-0\" aria-hidden=\"true\" data-testid=\"collapse\">\r\n<div class=\"description--1nRbz\">\r\n<p>\"BuildTech Innovation &amp; Construction\" একটি নতুন প্রকল্প \"BuildTech Paragon Condo\" এর কাজ শুরু করতে পেরে আনন্দিত। যা উত্তরার উত্তরখান এলাকায় অবস্থিত একটি প্রিমিয়াম আবাসিক প্রকল্প। এটি একটি নিখুঁত আবাস যা আধুনিক সুযোগ-সুবিধা সম্বেলিত নান্দনিকভাবে ডিজাইন করা একটি বাসস্থান।</p>\r\n<p>বিল্ডটেক প্যারাগন কনডো- সকল নাগরিক সুবিধাসহ একটি সত্যিকারের কনডোমিনিয়াম।</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', '/catalog/wheel-bearing', 'Home Rent-1672578392-logo.jpg', NULL, 4, 1, NULL, 'magazine', 2, 1, 0, NULL, 1, 'views_left', 0, 0, NULL, 0, NULL, 1, 1, NULL, '2022-12-02 23:09:27', '2023-01-01 07:06:32'),
(5, 'All of your necessary auto parts in one place', 'all-of-your-necessary-auto-parts-in-one-place', '<p>All of your necessary auto parts in one place</p>', '/catalog', 'All of your necessary auto parts in one place-1670044263-logo.png', NULL, 4, NULL, NULL, 'magazine', 2, 1, 0, 'property_1.jpeg', 1, 'views_left', 0, 0, NULL, 0, NULL, 1, NULL, NULL, '2022-12-02 23:11:03', '2022-12-02 23:11:03'),
(6, 'Why optipart is the right choice', 'why-optipart', '<div class=\"cmp-text__paragraph\">\r\n<ul>\r\n<li><strong>Protection</strong></li>\r\n</ul>\r\n<ul></ul>\r\n<p>All our parts are designed to&nbsp;<b>protect passengers, drivers, machines and engines</b>. Whether that\'s a tractor engine operating in dusty conditions, a pneumatic braking system in a commercial bus or an allergy-suffering driver needing clean air</p>\r\n<ul>\r\n<li><strong>Peace of mind</strong></li>\r\n</ul>\r\n<p>You can rest assured your filter meets strict safety standards, is&nbsp;<b>always OE quality&nbsp;</b>and has undergone rigorous checks. We bring&nbsp;<b>many years of Engineering experience&nbsp;</b>to every product decision and design</p>\r\n<ul></ul>\r\n<ul>\r\n<li><strong>Dependability</strong></li>\r\n</ul>\r\n<p>We are an&nbsp;<b>established and trustedbrand&nbsp;</b>supplying&amp;&nbsp;<b>premium OE quality&nbsp;</b>parts to 97% of Europe\'s vehicles</p>\r\n<div class=\"cmp-text__paragraph\">\r\n<ul>\r\n<li><strong>Support</strong></li>\r\n</ul>\r\n<p>We have established&nbsp;<b>valued partnerships&nbsp;</b>with&nbsp;<b>dealers and workshops&nbsp;</b>around the world, offering support at all levels, from&nbsp;<b>installation instructions</b>to<b>sales promotion materials</b>. We are with you every step of the way</p>\r\n<ul>\r\n<li><strong>Innovation</strong></li>\r\n</ul>\r\n<p>Our&nbsp;<b>talented global team&nbsp;</b>constantly striving to find&nbsp;<b>new and better&nbsp;</b>ways to remove residue, particulates and harmful gases. We are truly world leaders in filtration</p>\r\n<ul>\r\n<li><strong>Choice</strong></li>\r\n</ul>\r\n<p>We have an extensive range of premium filters for<b>all current engine types and machines</b></p>\r\n</div>\r\n</div>', 'Why optipart is the right choice', NULL, NULL, 3, NULL, NULL, 'advertisement', 2, 1, 0, 'property_1.jpeg', 1, 'views_left', 0, 0, NULL, 0, NULL, 1, 1, NULL, '2022-12-03 00:16:29', '2022-12-03 00:21:47'),
(7, 'Facilis beatae repre', 'impedit-et-nobi', '<p><strong>asdffdsaafsdsdf</strong></p>', 'Vero eum fugit nesc', 'Facilis beatae repre-1672149776-logo.png', 'Facilis beatae repre-1672149776-banner.png', 11, 2, 1, 'advertisement', 1, 1, 0, 'property_1.jpeg', 1, 'views_left', 0, 0, NULL, 0, NULL, 1, NULL, NULL, '2022-12-27 08:02:56', '2022-12-27 08:02:56'),
(15, 'Quo tenetur ipsum d', 'et-rerum-harum-nostr', '<div class=\"ad-meta--17Bqm justify-content-flex-start--1Xozy align-items-normal--vaTgD flex-wrap-wrap--2PCx8 flex-direction-row--27fh1 flex--3fKk1\">\n<div class=\"two-columns--19Hyo full-width--XovDn justify-content-flex-start--1Xozy align-items-normal--vaTgD flex-wrap-nowrap--3IpfJ flex-direction-row--27fh1 flex--3fKk1\">\n<div class=\"word-break--2nyVq label--3oVZK\">Address: ময়নারটেক, উত্তরা, ঢাকা-১২৩০।&nbsp; Bedrooms: 3&nbsp; Bathrooms: 3&nbsp;&nbsp; Size: 1,500 sqft</div>\n</div>\n<div class=\"two-columns--19Hyo full-width--XovDn justify-content-flex-start--1Xozy align-items-normal--vaTgD flex-wrap-nowrap--3IpfJ flex-direction-row--27fh1 flex--3fKk1\">\n<div class=\"heading--2u5sJ\">Facing: South Facing Completion Status: Ongoing</div>\n</div>\n<div class=\"two-columns--19Hyo full-width--XovDn justify-content-flex-start--1Xozy align-items-normal--vaTgD flex-wrap-nowrap--3IpfJ flex-direction-row--27fh1 flex--3fKk1\">\n<div class=\"heading--2u5sJ\"></div>\n<div class=\"heading--2u5sJ\"><strong>Description</strong></div>\n</div>\n</div>\n<div class=\"description-section--oR57b\">\n<div>\n<div class=\"description--1nRbz\">\n<div class=\"expandable-container--1kbq7\">\n<div class=\"list--Jk0mL\">\n<div style=\"overflow: hidden; height: 142px; transition: height 50ms ease-in 0s;\" id=\"collapsible-content-0\" aria-hidden=\"true\" data-testid=\"collapse\">\n<div class=\"description--1nRbz\">\n<p>\"BuildTech Innovation &amp; Construction\" একটি নতুন প্রকল্প \"BuildTech Paragon Condo\" এর কাজ শুরু করতে পেরে আনন্দিত। যা উত্তরার উত্তরখান এলাকায় অবস্থিত একটি প্রিমিয়াম আবাসিক প্রকল্প। এটি একটি নিখুঁত আবাস যা আধুনিক সুযোগ-সুবিধা সম্বেলিত নান্দনিকভাবে ডিজাইন করা একটি বাসস্থান।</p>\n<p>বিল্ডটেক প্যারাগন কনডো- সকল নাগরিক সুবিধাসহ একটি সত্যিকারের কনডোমিনিয়াম।</p>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>', 'Est eum ipsum vita', NULL, NULL, 12, 5, 1, 'advertisement', 1, 1, 1, 'property_1.jpeg', 1, 'views_left', 0, 0, NULL, 0, NULL, 1, NULL, NULL, '2022-12-27 19:50:29', '2022-12-27 19:50:29'),
(16, 'Home for Sale or Rent', 'itaque-pariatur-aut', '<div class=\"ad-meta--17Bqm justify-content-flex-start--1Xozy align-items-normal--vaTgD flex-wrap-wrap--2PCx8 flex-direction-row--27fh1 flex--3fKk1\">\r\n<div class=\"two-columns--19Hyo full-width--XovDn justify-content-flex-start--1Xozy align-items-normal--vaTgD flex-wrap-nowrap--3IpfJ flex-direction-row--27fh1 flex--3fKk1\">\r\n<div class=\"word-break--2nyVq label--3oVZK\">Address: ময়নারটেক, উত্তরা, ঢাকা-১২৩০।&nbsp; Bedrooms: 3&nbsp; Bathrooms: 3&nbsp;&nbsp; Size: 1,500 sqft</div>\r\n</div>\r\n<div class=\"two-columns--19Hyo full-width--XovDn justify-content-flex-start--1Xozy align-items-normal--vaTgD flex-wrap-nowrap--3IpfJ flex-direction-row--27fh1 flex--3fKk1\">\r\n<div class=\"heading--2u5sJ\">Facing: South Facing Completion Status: Ongoing</div>\r\n</div>\r\n<div class=\"two-columns--19Hyo full-width--XovDn justify-content-flex-start--1Xozy align-items-normal--vaTgD flex-wrap-nowrap--3IpfJ flex-direction-row--27fh1 flex--3fKk1\">\r\n<div class=\"heading--2u5sJ\"></div>\r\n<div class=\"heading--2u5sJ\"><strong>Description</strong></div>\r\n</div>\r\n</div>\r\n<div class=\"description-section--oR57b\">\r\n<div>\r\n<div class=\"description--1nRbz\">\r\n<div class=\"expandable-container--1kbq7\">\r\n<div class=\"list--Jk0mL\">\r\n<div style=\"overflow: hidden; height: 142px; transition: height 50ms ease-in 0s;\" id=\"collapsible-content-0\" aria-hidden=\"true\" data-testid=\"collapse\">\r\n<div class=\"description--1nRbz\">\r\n<p>\"BuildTech Innovation &amp; Construction\" একটি নতুন প্রকল্প \"BuildTech Paragon Condo\" এর কাজ শুরু করতে পেরে আনন্দিত। যা উত্তরার উত্তরখান এলাকায় অবস্থিত একটি প্রিমিয়াম আবাসিক প্রকল্প। এটি একটি নিখুঁত আবাস যা আধুনিক সুযোগ-সুবিধা সম্বেলিত নান্দনিকভাবে ডিজাইন করা একটি বাসস্থান।</p>\r\n<p>বিল্ডটেক প্যারাগন কনডো- সকল নাগরিক সুবিধাসহ একটি সত্যিকারের কনডোমিনিয়াম।</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', 'Quis natus rem aliqu', 'Home for Sale or Rent-1672578452-logo.jpg', NULL, 4, 7, 1, 'advertisement', 1, 1, 1, 'property_2.jpeg', 1, 'views_left', 0, 0, NULL, 0, NULL, 1, 1, NULL, '2022-12-27 19:51:08', '2023-01-01 07:07:32'),
(17, 'Apartment sell-আপনার স্বপ্নের বাড়ি', 'nemo-non-ex-incidunt', '<div class=\"ad-meta--17Bqm justify-content-flex-start--1Xozy align-items-normal--vaTgD flex-wrap-wrap--2PCx8 flex-direction-row--27fh1 flex--3fKk1\">\n<div class=\"two-columns--19Hyo full-width--XovDn justify-content-flex-start--1Xozy align-items-normal--vaTgD flex-wrap-nowrap--3IpfJ flex-direction-row--27fh1 flex--3fKk1\">\n<div class=\"word-break--2nyVq label--3oVZK\">Address: ময়নারটেক, উত্তরা, ঢাকা-১২৩০।&nbsp; Bedrooms: 3&nbsp; Bathrooms: 3&nbsp;&nbsp; Size: 1,500 sqft</div>\n</div>\n<div class=\"two-columns--19Hyo full-width--XovDn justify-content-flex-start--1Xozy align-items-normal--vaTgD flex-wrap-nowrap--3IpfJ flex-direction-row--27fh1 flex--3fKk1\">\n<div class=\"heading--2u5sJ\">Facing: South Facing Completion Status: Ongoing</div>\n</div>\n<div class=\"two-columns--19Hyo full-width--XovDn justify-content-flex-start--1Xozy align-items-normal--vaTgD flex-wrap-nowrap--3IpfJ flex-direction-row--27fh1 flex--3fKk1\">\n<div class=\"heading--2u5sJ\"></div>\n<div class=\"heading--2u5sJ\"><strong>Description</strong></div>\n</div>\n</div>\n<div class=\"description-section--oR57b\">\n<div>\n<div class=\"description--1nRbz\">\n<div class=\"expandable-container--1kbq7\">\n<div class=\"list--Jk0mL\">\n<div style=\"overflow: hidden; height: 142px; transition: height 50ms ease-in 0s;\" id=\"collapsible-content-0\" aria-hidden=\"true\" data-testid=\"collapse\">\n<div class=\"description--1nRbz\">\n<p>\"BuildTech Innovation &amp; Construction\" একটি নতুন প্রকল্প \"BuildTech Paragon Condo\" এর কাজ শুরু করতে পেরে আনন্দিত। যা উত্তরার উত্তরখান এলাকায় অবস্থিত একটি প্রিমিয়াম আবাসিক প্রকল্প। এটি একটি নিখুঁত আবাস যা আধুনিক সুযোগ-সুবিধা সম্বেলিত নান্দনিকভাবে ডিজাইন করা একটি বাসস্থান।</p>\n<p>বিল্ডটেক প্যারাগন কনডো- সকল নাগরিক সুবিধাসহ একটি সত্যিকারের কনডোমিনিয়াম।</p>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>', 'Vitae rerum reprehen', NULL, NULL, 15, 3, 1, 'advertisement', 1, 1, 1, 'property_4.jpg', 1, 'views_left', 0, 0, NULL, 0, NULL, 1, 1, NULL, '2022-12-27 19:53:38', '2023-01-01 06:14:12'),
(18, 'Ut aute quasi porro', 'voluptates-cupidatat', '<div class=\"ad-meta--17Bqm justify-content-flex-start--1Xozy align-items-normal--vaTgD flex-wrap-wrap--2PCx8 flex-direction-row--27fh1 flex--3fKk1\">\n<div class=\"two-columns--19Hyo full-width--XovDn justify-content-flex-start--1Xozy align-items-normal--vaTgD flex-wrap-nowrap--3IpfJ flex-direction-row--27fh1 flex--3fKk1\">\n<div class=\"word-break--2nyVq label--3oVZK\">Address: ময়নারটেক, উত্তরা, ঢাকা-১২৩০।&nbsp; Bedrooms: 3&nbsp; Bathrooms: 3&nbsp;&nbsp; Size: 1,500 sqft</div>\n</div>\n<div class=\"two-columns--19Hyo full-width--XovDn justify-content-flex-start--1Xozy align-items-normal--vaTgD flex-wrap-nowrap--3IpfJ flex-direction-row--27fh1 flex--3fKk1\">\n<div class=\"heading--2u5sJ\">Facing: South Facing Completion Status: Ongoing</div>\n</div>\n<div class=\"two-columns--19Hyo full-width--XovDn justify-content-flex-start--1Xozy align-items-normal--vaTgD flex-wrap-nowrap--3IpfJ flex-direction-row--27fh1 flex--3fKk1\">\n<div class=\"heading--2u5sJ\"></div>\n<div class=\"heading--2u5sJ\"><strong>Description</strong></div>\n</div>\n</div>\n<div class=\"description-section--oR57b\">\n<div>\n<div class=\"description--1nRbz\">\n<div class=\"expandable-container--1kbq7\">\n<div class=\"list--Jk0mL\">\n<div style=\"overflow: hidden; height: 142px; transition: height 50ms ease-in 0s;\" id=\"collapsible-content-0\" aria-hidden=\"true\" data-testid=\"collapse\">\n<div class=\"description--1nRbz\">\n<p>\"BuildTech Innovation &amp; Construction\" একটি নতুন প্রকল্প \"BuildTech Paragon Condo\" এর কাজ শুরু করতে পেরে আনন্দিত। যা উত্তরার উত্তরখান এলাকায় অবস্থিত একটি প্রিমিয়াম আবাসিক প্রকল্প। এটি একটি নিখুঁত আবাস যা আধুনিক সুযোগ-সুবিধা সম্বেলিত নান্দনিকভাবে ডিজাইন করা একটি বাসস্থান।</p>\n<p>বিল্ডটেক প্যারাগন কনডো- সকল নাগরিক সুবিধাসহ একটি সত্যিকারের কনডোমিনিয়াম।</p>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>', 'Assumenda anim offic', NULL, NULL, 8, 1, 1, 'advertisement', 1, 1, 0, 'property_3.jpg', 1, 'views_left', 0, 0, NULL, 0, NULL, 1, 1, NULL, '2022-12-27 19:56:01', '2023-01-01 05:33:20'),
(19, 'মোহাম্মদপুর আদাবরে লাইনের গ্যাস ও বিদ্যুৎ পানির সংযোগসহ ফ্লাট ভাড়া হবে', 'home-rent-new-bd', '<div class=\"ad-meta--17Bqm justify-content-flex-start--1Xozy align-items-normal--vaTgD flex-wrap-wrap--2PCx8 flex-direction-row--27fh1 flex--3fKk1\">\r\n<div class=\"two-columns--19Hyo full-width--XovDn justify-content-flex-start--1Xozy align-items-normal--vaTgD flex-wrap-nowrap--3IpfJ flex-direction-row--27fh1 flex--3fKk1\">\r\n<div class=\"word-break--2nyVq label--3oVZK\">Address: রাজমনি টাওয়ার, ৯ বি , বাসাঃ১,রোডঃ৭, ব্লকঃবি,নবোদয় হাউজিং সোসাইটি , আদাবর , মোহাম্মদপুর ঢাকা ১২০৭</div>\r\n</div>\r\n<div class=\"two-columns--19Hyo full-width--XovDn justify-content-flex-start--1Xozy align-items-normal--vaTgD flex-wrap-nowrap--3IpfJ flex-direction-row--27fh1 flex--3fKk1\">\r\n<div class=\"word-break--2nyVq value--1lKHt\">Beds: 3 , Baths: 3 , Size: 1,050 sqft</div>\r\n</div>\r\n<div class=\"two-columns--19Hyo full-width--XovDn justify-content-flex-start--1Xozy align-items-normal--vaTgD flex-wrap-nowrap--3IpfJ flex-direction-row--27fh1 flex--3fKk1\">\r\n<div class=\"word-break--2nyVq value--1lKHt\">Facing: North Facing Completion Status:<em>Ready</em></div>\r\n<div class=\"word-break--2nyVq value--1lKHt\"><em></em></div>\r\n</div>\r\n</div>\r\n<div class=\"description-section--oR57b\">\r\n<div>\r\n<div class=\"heading--2u5sJ\"><em><strong>Description</strong></em></div>\r\n<div class=\"description--1nRbz\">\r\n<div class=\"expandable-container--1kbq7\">\r\n<div class=\"list--Jk0mL\">\r\n<div style=\"overflow: hidden; height: auto; transition: height 50ms ease-in 0s;\" id=\"collapsible-content-0\" data-testid=\"collapse\">\r\n<div class=\"description--1nRbz\">\r\n<p>মোহাম্মদপুর, আদাবরে লাইনের গ্যাস ও বিদ্যুৎ পানির সংযোগসহ ফ্লাট ভাড়া হবে</p>\r\n<p>NO Massages, please.</p>\r\n<p>যোগাযোগের ঠিকানাঃ</p>\r\n<p>রাজমনি টাওয়ার</p>\r\n<p>৯ বি (১০ তলা)</p>\r\n<p>বাসাঃ১, রোডঃ৭, ব্লকঃবি,</p>\r\n<p>নবোদয় হাউজিং সোসাইটি , আদাবর , মোহাম্মদপুর</p>\r\n<p>ঢাকা ১২০৭</p>\r\n<p>১১ তলা বরুতল ভবনে 1st December , 2022 থেকে ভাড়া হবে</p>\r\n<p>৩ বেড রুম, ৩ টয়লেট, ২ বারান্দা, ১টি কিচেন এবং ১টি ১৯ &times; ১০ ফিট ড্রইং কাম ডাইনিং বিশিষ্ট দক্ষিন মুখি খোলামেলা এবং আধুনিক সুযোগ সুবিধা সহ ফ্লাট৷</p>\r\n<p>পানি, লিফট, জেনারেটর এবং সার্ভিস চার্জ সংযোগসহ প্রতি মাসে ভাড়া</p>\r\n<p></p>\r\n<p>১৭০০০ টাকা মাসিক ভাড়া</p>\r\n<p>২৪/৭ লাইনের গ্যাস , বিদ্যুৎ বিল আলাদা</p>\r\n<p>যোগাযোগঃ</p>\r\n<p>এ.বি.এম. আব্দুল মতিন (মালিক)</p>\r\n<p>রাজমনি টাওয়ার</p>\r\n<p>৯ বি (১০ তলা)</p>\r\n<p>বাসাঃ১, রোডঃ৭, ব্লকঃবি,</p>\r\n<p>নবোদয় হাউজিং সোসাইটি , আদাবর , মোহাম্মদপুর</p>\r\n<p>ঢাকা ১২০৭</p>\r\n<p></p>\r\n<p>Google Map Location:</p>\r\n<p>https://goo.gl/maps/b8G7VZhZN98D9hmd6</p>\r\n<p>For more information and photos</p>\r\n<p>Just type &lsquo; Rajmoni Tower &lsquo; in Google you will find plenty of photos of the building</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', NULL, 'মোহাম্মদপুর আদাবরে লাইনের গ্যাস ও বিদ্যুৎ পানির সংযোগসহ ফ্লাট ভাড়া হবে-1672579121-logo.jpg', 'মোহাম্মদপুর আদাবরে লাইনের গ্যাস ও বিদ্যুৎ পানির সংযোগসহ ফ্লাট ভাড়া হবে-1672579121-banner.jpg', 3, 6, 1, 'advertisement', 1, 1, 1, 'মোহাম্মদপুর আদাবরে লাইনের গ্যাস ও বিদ্যুৎ পানির সংযোগসহ ফ্লাট ভাড়া হবে-1672579184-poster_image.jpg', 1, 'views_left', 0, 1, NULL, 0, NULL, 1, 1, NULL, '2023-01-01 07:18:41', '2023-01-07 09:48:40'),
(20, 'Vel qui rerum aliqua', 'Consequuntur ut quas', '<p>adsfdfsa</p>', 'Recusandae Minima a', NULL, NULL, 16, 2, 13, 'advertisement', 0, 0, 0, NULL, 0, 'views_left', 0, 67, NULL, 0, NULL, 13, NULL, NULL, '2023-01-10 10:52:03', '2023-01-10 10:52:03'),
(21, 'Asperiores in facere', 'Provident est itaq', '<p>dfssfafdasdafs</p>', 'Voluptatem vitae ali', NULL, NULL, 4, 5, 13, 'advertisement', 1, 1, 0, NULL, 0, 'left', 0, 12, NULL, 0, NULL, 13, NULL, NULL, '2023-01-10 10:52:32', '2023-01-10 10:52:32'),
(22, 'Sit cupidatat harum', 'Nesciunt maxime per', '<p>asdffdsaafsd</p>', 'In vel soluta consec', NULL, NULL, 8, 4, 13, 'advertisement', 1, 0, 1, NULL, 1, '0', 0, 54, 3, 0, NULL, 13, NULL, NULL, '2023-01-11 10:03:01', '2023-01-11 10:03:01'),
(23, 'Advertisement Check', 'advertisement-check', '<p>Advertisement Description check</p>', 'Advertisement Meta Description check', 'Advertisement Check-1673486332-logo.png', 'Advertisement Check-1673486332-banner.png', 8, 2, 13, 'advertisement', 1, 1, 1, 'Advertisement Check-1673486332-poster_image.png', 1, '1', 0, 2, 2, 0, NULL, 13, NULL, NULL, '2023-01-11 19:18:52', '2023-01-11 19:20:27'),
(24, 'Quia aut id laborum', 'Et placeat voluptat', '<p>Culpa, modi eos dese.</p>', 'Sunt laborum Error', NULL, NULL, 15, 4, 1, 'advertisement', 1, 1, 0, NULL, 1, '1', 0, 4, NULL, 0, NULL, 1, NULL, NULL, '2023-01-14 09:24:41', '2023-01-14 09:24:41'),
(25, 'Ipsum velit culpa', 'Nostrum consequuntur', '<p>Officiis magnam sapi.</p>', 'Qui molestiae irure', NULL, NULL, 11, 2, 13, 'advertisement', NULL, NULL, 0, NULL, 1, NULL, 0, NULL, 4, 0, NULL, 13, NULL, NULL, '2023-01-16 07:57:14', '2023-01-16 07:57:14'),
(26, 'Consequatur Molliti', 'Consequuntur eveniet', '<p>Enim ratione illum, .</p>', 'Voluptatem minima un', NULL, NULL, 12, 4, 13, 'advertisement', NULL, 1, 1, NULL, 0, NULL, 0, NULL, 4, 0, NULL, 13, NULL, NULL, '2023-01-16 08:06:07', '2023-01-16 08:07:43'),
(27, 'Officia aut reiciend', 'Mollit sapiente obca', '<p>Distinctio. Numquam .</p>', 'Officia perferendis', NULL, NULL, 3, 6, 13, 'advertisement', NULL, NULL, 1, NULL, 1, NULL, 0, NULL, 3, 0, NULL, 13, NULL, NULL, '2023-01-16 08:29:59', '2023-01-16 08:29:59'),
(28, 'Hello', 'hello', '<p>asdfdasasdf</p>', 'sadfadfsafds', NULL, NULL, 6, 1, 1, 'advertisement', 1, 1, 1, 'Hello-1674097784-poster_image.png', 1, NULL, NULL, 12, NULL, 0, NULL, 1, 15, NULL, '2023-01-18 21:09:44', '2023-01-20 08:36:50'),
(29, 'Quia rerum nulla quo', 'Commodo est eveniet', '<p>Eius velit reprehend.</p>', 'Dolor aut do fugiat', NULL, NULL, 11, NULL, 15, 'advertisement', NULL, 1, NULL, 'Quia rerum nulla quo-1674225288-poster_image.jpg', NULL, NULL, NULL, NULL, 4, 1, NULL, 15, NULL, NULL, '2023-01-20 08:34:48', '2023-01-20 08:35:12'),
(30, 'Reprehenderit labor', 'reprehenderit-labor', '<p>Qui odit sunt aliqua.</p>', 'Esse esse adipisci', NULL, NULL, 9, 1, 15, 'advertisement', 1, 1, 1, 'Reprehenderit labor-1674225941-poster_image.jpg', 1, 'advertisement_view_page_left', 0, 10, 3, 1, NULL, 15, 15, NULL, '2023-01-20 08:45:41', '2023-01-20 08:50:22'),
(31, 'Aut doloribus aut al', 'Maiores aut nulla at', '<p>In aliquam ut id, la.</p>', 'Facilis impedit aut', NULL, NULL, 6, NULL, 15, 'advertisement', 0, 1, 0, 'Aut doloribus aut al-1674226340-poster_image.jpg', 1, NULL, NULL, NULL, 4, 1, NULL, 15, NULL, NULL, '2023-01-20 08:52:20', '2023-01-20 08:53:02');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `group_name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `group_name`, `created_at`, `updated_at`) VALUES
(1, 'dashboard.view', 'admin', 'dashboard', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(2, 'settings.view', 'admin', 'settings', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(3, 'settings.edit', 'admin', 'settings', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(4, 'permission.view', 'admin', 'permission', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(5, 'permission.create', 'admin', 'permission', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(6, 'permission.edit', 'admin', 'permission', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(7, 'permission.delete', 'admin', 'permission', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(8, 'admin.view', 'admin', 'admin', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(9, 'admin.create', 'admin', 'admin', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(10, 'admin.edit', 'admin', 'admin', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(11, 'admin.delete', 'admin', 'admin', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(12, 'admin_profile.view', 'admin', 'admin_profile', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(13, 'admin_profile.edit', 'admin', 'admin_profile', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(14, 'role.view', 'admin', 'role_manage', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(15, 'role.create', 'admin', 'role_manage', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(16, 'role.edit', 'admin', 'role_manage', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(17, 'role.delete', 'admin', 'role_manage', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(18, 'user.view', 'admin', 'user', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(19, 'user.create', 'admin', 'user', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(20, 'user.edit', 'admin', 'user', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(21, 'user.delete', 'admin', 'user', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(22, 'category.view', 'admin', 'category', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(23, 'category.create', 'admin', 'category', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(24, 'category.edit', 'admin', 'category', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(25, 'category.delete', 'admin', 'category', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(26, 'page.view', 'admin', 'page', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(27, 'page.create', 'admin', 'page', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(28, 'page.edit', 'admin', 'page', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(29, 'page.delete', 'admin', 'page', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(30, 'service.view', 'admin', 'service', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(31, 'service.create', 'admin', 'service', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(32, 'service.edit', 'admin', 'service', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(33, 'service.delete', 'admin', 'service', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(34, 'booking_request.view', 'admin', 'booking_request', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(35, 'booking_request.edit', 'admin', 'booking_request', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(36, 'booking_request.delete', 'admin', 'booking_request', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(37, 'blog.view', 'admin', 'blog', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(38, 'blog.create', 'admin', 'blog', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(39, 'blog.edit', 'admin', 'blog', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(40, 'blog.delete', 'admin', 'blog', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(41, 'slider.view', 'admin', 'slider', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(42, 'slider.create', 'admin', 'slider', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(43, 'slider.edit', 'admin', 'slider', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(44, 'slider.delete', 'admin', 'slider', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(45, 'tracking.view', 'admin', 'tracking', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(46, 'tracking.delete', 'admin', 'tracking', '2022-12-01 11:54:38', '2022-12-01 11:54:38'),
(47, 'email_notification.view', 'admin', 'notifications', '2022-12-01 11:54:38', '2022-12-01 11:54:38'),
(48, 'email_notification.edit', 'admin', 'notifications', '2022-12-01 11:54:38', '2022-12-01 11:54:38'),
(49, 'email_message.view', 'admin', 'notifications', '2022-12-01 11:54:38', '2022-12-01 11:54:38'),
(50, 'email_message.edit', 'admin', 'notifications', '2022-12-01 11:54:38', '2022-12-01 11:54:38'),
(51, 'contact.view', 'admin', 'contacts', '2022-12-01 11:54:38', '2022-12-01 11:54:38'),
(52, 'contact.create', 'admin', 'contacts', '2022-12-01 11:54:38', '2022-12-01 11:54:38'),
(53, 'module.view', 'admin', 'module', '2022-12-01 11:54:38', '2022-12-01 11:54:38'),
(54, 'module.create', 'admin', 'module', '2022-12-01 11:54:38', '2022-12-01 11:54:38'),
(55, 'module.edit', 'admin', 'module', '2022-12-01 11:54:38', '2022-12-01 11:54:38'),
(56, 'module.delete', 'admin', 'module', '2022-12-01 11:54:38', '2022-12-01 11:54:38'),
(57, 'module.toggle', 'admin', 'module', '2022-12-01 11:54:38', '2022-12-01 11:54:38'),
(58, 'advertisement.create', 'admin', 'advertisement', '2022-12-01 11:54:38', '2022-12-01 11:54:38'),
(59, 'advertisement.edit', 'admin', 'advertisement', '2022-12-01 11:54:38', '2022-12-01 11:54:38'),
(60, 'advertisement.delete', 'admin', 'advertisement', '2022-12-01 11:54:38', '2022-12-01 11:54:38'),
(61, 'advertisement.view', 'admin', 'advertisement', '2022-12-01 11:54:38', '2022-12-01 11:54:38'),
(62, 'advertisement.approve', 'admin', 'advertisement', '2022-12-01 11:54:38', '2022-12-01 11:54:38'),
(63, 'magazine.create', 'admin', 'magazine', '2022-12-01 11:54:38', '2022-12-01 11:54:38'),
(64, 'magazine.edit', 'admin', 'magazine', '2022-12-01 11:54:38', '2022-12-01 11:54:38'),
(65, 'magazine.delete', 'admin', 'magazine', '2022-12-01 11:54:38', '2022-12-01 11:54:38'),
(66, 'magazine.view', 'admin', 'magazine', '2022-12-01 11:54:38', '2022-12-01 11:54:38'),
(67, 'magazine.approve', 'admin', 'magazine', '2022-12-01 11:54:38', '2022-12-01 11:54:38'),
(68, 'magazine.all', 'admin', 'magazine', '2022-12-01 11:54:38', '2022-12-01 11:54:38'),
(69, 'advertisement.all', 'admin', 'advertisement', '2022-12-01 11:54:38', '2022-12-01 11:54:38'),
(71, 'package.view', 'admin', 'package', '2022-12-01 11:54:38', '2022-12-01 11:54:38'),
(72, 'package.all', 'admin', 'package', '2022-12-01 11:54:38', '2022-12-01 11:54:38'),
(73, 'package.create', 'admin', 'package', '2022-12-01 11:54:38', '2022-12-01 11:54:38'),
(74, 'package.edit', 'admin', 'package', '2022-12-01 11:54:38', '2022-12-01 11:54:38'),
(75, 'package.delete', 'admin', 'package', '2022-12-01 11:54:38', '2022-12-01 11:54:38'),
(76, 'stripe.create', 'admin', 'stripe', '2022-12-01 11:54:38', '2022-12-01 11:54:38'),
(77, 'stripe.view', 'admin', 'stripe', '2022-12-01 11:54:38', '2022-12-01 11:54:38'),
(78, 'advertisement_all', 'admin', 'advertisement', '2022-12-01 11:54:38', '2022-12-01 11:54:38'),
(80, 'magazines_all', 'admin', 'magazine', '2022-12-01 11:54:38', '2022-12-01 11:54:38');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Subscriber', 'admin', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(2, 'Admin', 'admin', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(3, 'Editor', 'admin', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(4, 'Super Admin', 'admin', '2022-12-01 11:54:37', '2022-12-01 11:54:37'),
(6, 'Advertisement', 'admin', '2023-01-08 09:16:32', '2023-01-08 09:16:32');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 4),
(1, 6),
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
(12, 6),
(13, 4),
(13, 6),
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
(26, 6),
(27, 4),
(27, 6),
(28, 4),
(28, 6),
(29, 4),
(29, 6),
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
(57, 4),
(58, 4),
(58, 6),
(59, 4),
(59, 6),
(60, 4),
(60, 6),
(61, 4),
(61, 6),
(62, 4),
(62, 6),
(63, 4),
(63, 6),
(64, 4),
(64, 6),
(65, 4),
(65, 6),
(66, 4),
(66, 6),
(67, 4),
(67, 6),
(68, 4),
(68, 6),
(69, 4),
(69, 6),
(71, 4),
(71, 6),
(72, 4),
(72, 6),
(73, 4),
(74, 4),
(75, 4),
(76, 4),
(76, 6),
(77, 4),
(77, 6),
(78, 4),
(78, 6),
(80, 4),
(80, 6);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `meta_description` text DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `banner_image` varchar(191) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Null if page has no category',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>active, 0=>inactive',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `title`, `slug`, `description`, `meta_description`, `image`, `banner_image`, `category_id`, `status`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`) VALUES
(5, 'Filters', 'filters', '<p><span>Every car has four main filters: the cabin filter, oil filter, fuel filter and air filter. The function of all these filters is to enable flows and catch impurities: the dust and contaminants in the air, the impurities in the fuel or the dirt in the motor oil. If your car filters are not replaced in time, they won\'t work properly and in the end, it could cause an impact on the mechanics. By replacing your filters, your car will be more efficient.</span></p>', NULL, 'Filters-1670045081-logo.png', 'Filters-1670045334-banner.jpeg', 3, 1, NULL, 1, 1, NULL, '2022-12-01 22:13:20', '2022-12-02 23:28:54'),
(6, 'Brakes', 'brakes', '<p>Computerized machining with tight quality standards. Made with quality materials for consistent performance and fade resistance. Premium G3000 Metallurgy to provide durability and resistance. Quality design and construction to meet OE specifications. Non-directional finish &ndash; A proven technology that contributes to reducing noise and squealing.</p>', NULL, 'Brakes-1670044986-logo.png', 'Brakes-1670044986-banner.jpeg', 3, 1, NULL, 1, 1, NULL, '2022-12-01 22:13:59', '2022-12-02 23:23:06'),
(7, 'CV Joint', 'cv-joint', '<p>Verify compatibility with your vehicle and answer all your doubts before making your purchase.</p>', 'CV Joint', 'CV Joint-1670045599-logo.jpeg', 'CV Joint-1670045599-banner.jpeg', 3, 1, NULL, 1, 1, NULL, '2022-12-01 22:14:28', '2022-12-02 23:33:19'),
(8, 'Water Pump', 'water-pump', '<p>A water pump serves an incredibly important task in ensuring that your car&rsquo;s engine runs as smoothly as possible.<br />The water pump is a part of a vehicle&rsquo;s cooling system, supplying a steady coolant stream to the motor. <br />The constant flow of fluids prevents the engine from overheating. In other words, if the water pump malfunctions,<br />the engine fail, which you do not want.</p>', 'Water Pump', 'Water Pump-1670045717-logo.webp', 'Water Pump-1669970194-banner.jpg', 3, 1, NULL, 1, 1, NULL, '2022-12-01 22:14:45', '2022-12-02 23:35:17'),
(9, 'Wheel Bearing', 'wheel-bearing', '<p>Every vehicle uses wheel bearings at each wheel to reduce friction. Most modern vehicles will use a hub assembly that contains the hub and wheel bearing. Some older vehicles will use wheel bearings that are separate components and are installed in the hub, rotor or spindle. Shop Advance Auto Parts for OEM-quality parts from Driveworks, Carquest, MOOG, National, ACDelco and more.<br />Some wheel bearings are integrated with the brake rotor, but many aren\'t. The wheel bearing cuts friction between the wheel and spindle, and a worn or failed wheel bearing can be downright dangerous. Wheel bearings are essential to reducing friction between your wheel\'s hubs and the spindle. Signs of wear can be difficult to pin down, but a foolproof way to check is to grab a suspended wheel by the top and bottom, and tip it in and out to look for excessive wear.<br />Replacing hub assemblies and wheel bearings can be a DIY job, but the level of difficulty varies depending on the vehicle. Always remember to check your vehicle\'s repair manual first to ensure you are using the right tools and parts to complete the job.<br />If you need to use high-temp grease for your repair, remember to follow the manufacturer\'s recommendations when choosing the right grease. Shop Advance Auto Parts for OEM-quality wheel bearing kits.</p>', 'Every vehicle uses wheel bearings at each wheel to reduce friction', 'Wheel Bearing-1670045821-logo.jpeg', 'Wheel Bearing-1669970868-banner.jpg', 3, 1, NULL, 1, 1, NULL, '2022-12-01 22:15:13', '2022-12-02 23:37:01'),
(10, 'Wipers', 'wipers', '<p><span>Driving in the rain can be stressful, especially at night. Optipars windshield wiper provides optimal night clarity and enhances safer driving.</span></p>', 'Wipers', 'Wipers-1670045881-logo.webp', 'Wipers-1669971277-banner.jpg', 3, 1, NULL, 1, 1, NULL, '2022-12-01 22:15:24', '2022-12-02 23:38:01'),
(11, 'Battery', 'battery', '<p>Car batteries typically last three to five years. However, your driving habits and climate affect how long the battery lasts. Motorists who use their vehicles for short distances (meaning they crank their car often for short trips) tend to wear their batteries faster than drivers who crank their cars less often and drive for longer distances. If you&rsquo;re concerned about your car battery, reputable auto repair shops often provide battery inspections to determine how much longer the battery will be useful.</p>', NULL, 'Battery-1670045994-logo.webp', 'Battery-1670045994-banner.jpeg', 3, 1, NULL, 1, 1, NULL, '2022-12-01 22:15:35', '2022-12-02 23:39:54'),
(12, 'Engine Oil', 'engine-oil', '<p>There are two main types of engines, namely gasoline engines and diesel engines. The API also regulates engine oil into two categories. The gasoline engine oil API quality level starts with S, while the diesel engine starts with C. The quality level is in alphabetical order, and the higher the letter, the higher the level.</p>', 'Engine Oil', 'Engine Oil-1670046138-logo.png', 'Engine Oil-1670046138-banner.png', 3, 1, NULL, 1, 1, NULL, '2022-12-01 22:15:47', '2022-12-02 23:42:18');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `locked` tinyint(1) NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`payload`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `group`, `name`, `locked`, `payload`, `created_at`, `updated_at`) VALUES
(1, 'general', 'name', 0, '\"Magazine\"', '2022-12-04 04:45:38', '2023-01-18 10:46:55'),
(2, 'general', 'logo', 0, '\"logo.png\"', '2022-12-04 04:45:38', '2023-01-18 10:46:55'),
(3, 'general', 'favicon', 0, '\"favicon.ico\"', '2022-12-04 04:45:38', '2023-01-18 10:46:55'),
(4, 'general', 'description', 0, 'null', '2022-12-04 04:45:38', '2023-01-18 10:46:55'),
(5, 'general', 'copyright_text', 0, '\"&copy;2022 all rights reserved.\"', '2022-12-04 04:45:38', '2023-01-18 10:46:55'),
(6, 'general', 'meta_keywords', 0, 'null', '2022-12-04 04:45:38', '2023-01-18 10:46:55'),
(7, 'general', 'meta_description', 0, 'null', '2022-12-04 04:45:38', '2023-01-18 10:46:55'),
(8, 'general', 'meta_author', 0, 'null', '2022-12-04 04:45:38', '2023-01-18 10:46:55'),
(9, 'contact', 'contact_no', 0, '\"+00xxxxxx\"', '2022-12-04 04:45:38', '2023-01-18 10:46:55'),
(10, 'contact', 'phone', 0, '\"+xxxx\"', '2022-12-04 04:45:38', '2023-01-18 10:46:55'),
(11, 'contact', 'email_primary', 0, '\"email@example.com\"', '2022-12-04 04:45:38', '2023-01-18 10:46:55'),
(12, 'contact', 'email_secondary', 0, 'null', '2022-12-04 04:45:38', '2023-01-18 10:46:55'),
(13, 'contact', 'address', 0, '\"xxxx\"', '2022-12-04 04:45:38', '2023-01-18 10:46:55'),
(14, 'contact', 'working_day_hours', 0, '\"xxxx\"', '2022-12-04 04:45:38', '2023-01-18 10:46:55'),
(15, 'contact', 'map_lat', 0, 'null', '2022-12-04 04:45:38', '2023-01-18 10:46:55'),
(16, 'contact', 'map_long', 0, 'null', '2022-12-04 04:45:38', '2023-01-18 10:46:55'),
(17, 'contact', 'map_zoom', 0, '\"11\"', '2022-12-04 04:45:38', '2023-01-18 10:46:55'),
(18, 'social', 'facebook', 0, '\"https:\\/\\/facebook.com\\/example\"', '2022-12-04 04:45:38', '2023-01-05 12:34:13'),
(19, 'social', 'twitter', 0, '\"https:\\/\\/twitter.com\\/\"', '2022-12-04 04:45:38', '2023-01-05 12:34:13'),
(20, 'social', 'youtube', 0, '\"https:\\/\\/youtube.com\\/\"', '2022-12-04 04:45:38', '2023-01-05 12:34:13'),
(21, 'social', 'linkedin', 0, '\"https:\\/\\/linkedin.com\\/\"', '2022-12-04 04:45:38', '2023-01-05 12:34:13'),
(22, 'social', 'pinterest', 0, '\"https:\\/\\/pinterest.com\\/\"', '2022-12-04 04:45:38', '2023-01-05 12:34:13'),
(23, 'social', 'instagram', 0, '\"https:\\/\\/instagram.com\\/\"', '2022-12-04 04:45:38', '2023-01-05 12:34:13'),
(24, 'currency', 'currency', 0, '\"United States (US) dollar ($)\"', '2022-12-04 04:45:38', '2023-01-18 10:46:55'),
(25, 'currency', 'currency_position', 0, '\"Left\"', '2022-12-04 04:45:38', '2023-01-18 10:46:55'),
(26, 'currency', 'thousand_separator', 0, '\",\"', '2022-12-04 04:45:38', '2023-01-18 10:46:55'),
(27, 'currency', 'decimal_separator', 0, '\".\"', '2022-12-04 04:45:38', '2023-01-18 10:46:55'),
(28, 'currency', 'number_of_decimals', 0, '\"2\"', '2022-12-04 04:45:38', '2023-01-18 10:46:55');

-- --------------------------------------------------------

--
-- Table structure for table `tracks`
--

CREATE TABLE `tracks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `reference_link` varchar(191) DEFAULT NULL COMMENT 'If there is possible to keep any reference link',
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tracks`
--

INSERT INTO `tracks` (`id`, `title`, `description`, `reference_link`, `admin_id`, `deleted_at`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2022-12-01 20:14:51', '2022-12-01 20:14:51'),
(2, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2022-12-01 20:17:10', '2022-12-01 20:17:10'),
(3, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2022-12-01 20:36:16', '2022-12-01 20:36:16'),
(4, 'Discover what we’re up to and where we’re at. Find us.', 'New Blog has been created', NULL, 1, NULL, NULL, '2022-12-01 20:49:08', '2022-12-01 20:49:08'),
(5, 'autoparts', 'Category has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-01 22:05:09', '2022-12-01 22:05:09'),
(6, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2022-12-01 22:06:16', '2022-12-01 22:06:16'),
(7, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2022-12-01 22:06:28', '2022-12-01 22:06:28'),
(8, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2022-12-01 22:07:26', '2022-12-01 22:07:26'),
(9, 'Filters', 'New Service has been created', NULL, 1, NULL, NULL, '2022-12-01 22:13:20', '2022-12-01 22:13:20'),
(10, 'Brakes', 'New Service has been created', NULL, 1, NULL, NULL, '2022-12-01 22:13:59', '2022-12-01 22:13:59'),
(11, 'CV Joint', 'New Service has been created', NULL, 1, NULL, NULL, '2022-12-01 22:14:28', '2022-12-01 22:14:28'),
(12, 'Water Pump', 'New Service has been created', NULL, 1, NULL, NULL, '2022-12-01 22:14:45', '2022-12-01 22:14:45'),
(13, 'Wheel Bearing', 'New Service has been created', NULL, 1, NULL, NULL, '2022-12-01 22:15:13', '2022-12-01 22:15:13'),
(14, 'Wipers', 'New Service has been created', NULL, 1, NULL, NULL, '2022-12-01 22:15:24', '2022-12-01 22:15:24'),
(15, 'Battery', 'New Service has been created', NULL, 1, NULL, NULL, '2022-12-01 22:15:35', '2022-12-01 22:15:35'),
(16, 'Engine Oil', 'New Service has been created', NULL, 1, NULL, NULL, '2022-12-01 22:15:47', '2022-12-01 22:15:47'),
(17, 'Water Pump', 'Service has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-02 02:35:43', '2022-12-02 02:35:43'),
(18, 'Water Pump', 'Service has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-02 02:36:34', '2022-12-02 02:36:34'),
(19, 'Wheel Bearing', 'Service has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-02 02:47:48', '2022-12-02 02:47:48'),
(20, 'Wipers', 'Service has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-02 02:54:37', '2022-12-02 02:54:37'),
(21, 'Filters', 'Service has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-02 21:51:57', '2022-12-02 21:51:57'),
(22, 'About Us', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-02 22:29:33', '2022-12-02 22:29:33'),
(23, 'Slider', 'New Category has been created', NULL, 1, NULL, NULL, '2022-12-02 22:48:14', '2022-12-02 22:48:14'),
(24, 'Auto Parts Car Accessories Water Pump Coolant Pump', 'New Page has been created', NULL, 1, NULL, NULL, '2022-12-02 22:58:29', '2022-12-02 22:58:29'),
(25, 'Auto Parts Car Accessories Water Pump Coolant Pump', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-02 23:04:51', '2022-12-02 23:04:51'),
(26, 'Auto Parts Car Accessories Water Pump Coolant Pump', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-02 23:05:01', '2022-12-02 23:05:01'),
(27, 'Best Auto part Wheel Bearing', 'New Page has been created', NULL, 1, NULL, NULL, '2022-12-02 23:09:27', '2022-12-02 23:09:27'),
(28, 'All of your necessary auto parts in one place', 'New Page has been created', NULL, 1, NULL, NULL, '2022-12-02 23:11:03', '2022-12-02 23:11:03'),
(29, 'Filters', 'Service has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-02 23:20:04', '2022-12-02 23:20:04'),
(30, 'Brakes', 'Service has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-02 23:23:06', '2022-12-02 23:23:06'),
(31, 'Filters', 'Service has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-02 23:24:41', '2022-12-02 23:24:41'),
(32, 'Filters', 'Service has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-02 23:27:02', '2022-12-02 23:27:02'),
(33, 'Filters', 'Service has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-02 23:28:01', '2022-12-02 23:28:01'),
(34, 'Filters', 'Service has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-02 23:28:54', '2022-12-02 23:28:54'),
(35, 'CV Joint', 'Service has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-02 23:33:19', '2022-12-02 23:33:19'),
(36, 'Water Pump', 'Service has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-02 23:35:17', '2022-12-02 23:35:17'),
(37, 'Wheel Bearing', 'Service has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-02 23:37:01', '2022-12-02 23:37:01'),
(38, 'Wipers', 'Service has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-02 23:38:01', '2022-12-02 23:38:01'),
(39, 'Battery', 'Service has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-02 23:39:54', '2022-12-02 23:39:54'),
(40, 'Engine Oil', 'Service has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-02 23:42:18', '2022-12-02 23:42:18'),
(41, 'Why optipart is the right choice', 'New Page has been created', NULL, 1, NULL, NULL, '2022-12-03 00:16:29', '2022-12-03 00:16:29'),
(42, 'Why optipart is the right choice', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-03 00:19:43', '2022-12-03 00:19:43'),
(43, 'Why optipart is the right choice', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2022-12-03 00:21:47', '2022-12-03 00:21:47'),
(44, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2022-12-04 04:58:31', '2022-12-04 04:58:31'),
(45, 'Rent', 'New Category has been created', NULL, 1, NULL, NULL, '2022-12-04 05:25:50', '2022-12-04 05:25:50'),
(46, 'Home Rent', 'New Category has been created', NULL, 1, NULL, NULL, '2022-12-04 05:26:01', '2022-12-04 05:26:01'),
(47, 'Car Rent', 'New Category has been created', NULL, 1, NULL, NULL, '2022-12-04 05:26:12', '2022-12-04 05:26:12'),
(48, 'Sale', 'New Category has been created', NULL, 1, NULL, NULL, '2022-12-04 05:26:37', '2022-12-04 05:26:37'),
(49, 'Home Sale', 'New Category has been created', NULL, 1, NULL, NULL, '2022-12-04 05:26:51', '2022-12-04 05:26:51'),
(50, 'Car Sale', 'New Category has been created', NULL, 1, NULL, NULL, '2022-12-04 05:27:05', '2022-12-04 05:27:05'),
(51, 'eBooks', 'New Category has been created', NULL, 1, NULL, NULL, '2022-12-06 23:30:53', '2022-12-06 23:30:53'),
(52, 'Novel', 'New Category has been created', NULL, 1, NULL, NULL, '2022-12-06 23:31:11', '2022-12-06 23:31:11'),
(53, 'Poetry', 'New Category has been created', NULL, 1, NULL, NULL, '2022-12-06 23:31:25', '2022-12-06 23:31:25'),
(54, 'Gallary', 'New Category has been created', NULL, 1, NULL, NULL, '2022-12-06 23:32:16', '2022-12-06 23:32:16'),
(55, 'Video Gallary', 'New Category has been created', NULL, 1, NULL, NULL, '2022-12-06 23:32:34', '2022-12-06 23:32:34'),
(56, 'Photo Gallary', 'New Category has been created', NULL, 1, NULL, NULL, '2022-12-06 23:32:47', '2022-12-06 23:32:47'),
(57, 'Jewelry', 'New Category has been created', NULL, 1, NULL, NULL, '2022-12-06 23:33:26', '2022-12-06 23:33:26'),
(58, 'Beauty', 'New Category has been created', NULL, 1, NULL, NULL, '2022-12-06 23:33:36', '2022-12-06 23:33:36'),
(59, 'Facilis beatae repre', 'New Page has been created', NULL, 1, NULL, NULL, '2022-12-27 08:02:56', '2022-12-27 08:02:56'),
(60, 'Qui culpa repellend', 'Advertisement has been created', NULL, 1, NULL, NULL, '2022-12-27 19:45:39', '2022-12-27 19:45:39'),
(61, 'Quo tenetur ipsum d', 'Advertisement has been created', NULL, 1, NULL, NULL, '2022-12-27 19:50:29', '2022-12-27 19:50:29'),
(62, 'Aliquam occaecat dol', 'Advertisement has been created', NULL, 1, NULL, NULL, '2022-12-27 19:51:08', '2022-12-27 19:51:08'),
(63, 'Optio voluptate ea', 'Advertisement has been created', NULL, 1, NULL, NULL, '2022-12-27 19:53:38', '2022-12-27 19:53:38'),
(64, 'Ut aute quasi porro', 'Advertisement has been created', NULL, 1, NULL, NULL, '2022-12-27 19:56:01', '2022-12-27 19:56:01'),
(65, 'Optio voluptate ea', 'Advertisement updated successfully !!', NULL, 1, NULL, NULL, '2023-01-01 04:58:22', '2023-01-01 04:58:22'),
(66, 'Optio voluptate ea', 'Advertisement updated successfully !!', NULL, 1, NULL, NULL, '2023-01-01 04:58:50', '2023-01-01 04:58:50'),
(67, 'Apartment sell-আপনার স্বপ্নের বাড়ি', 'Advertisement updated successfully !!', NULL, 1, NULL, NULL, '2023-01-01 05:00:01', '2023-01-01 05:00:01'),
(68, 'Ut aute quasi porro', 'Advertisement updated successfully !!', NULL, 1, NULL, NULL, '2023-01-01 05:28:05', '2023-01-01 05:28:05'),
(69, 'Ut aute quasi porro', 'Advertisement updated successfully !!', NULL, 1, NULL, NULL, '2023-01-01 05:30:31', '2023-01-01 05:30:31'),
(70, 'Ut aute quasi porro', 'Advertisement updated successfully !!', NULL, 1, NULL, NULL, '2023-01-01 05:31:21', '2023-01-01 05:31:21'),
(71, 'Ut aute quasi porro', 'Advertisement updated successfully !!', NULL, 1, NULL, NULL, '2023-01-01 05:32:01', '2023-01-01 05:32:01'),
(72, 'Ut aute quasi porro', 'Advertisement updated successfully !!', NULL, 1, NULL, NULL, '2023-01-01 05:33:20', '2023-01-01 05:33:20'),
(73, 'Apartment sell-আপনার স্বপ্নের বাড়ি', 'Advertisement updated successfully !!', NULL, 1, NULL, NULL, '2023-01-01 05:35:02', '2023-01-01 05:35:02'),
(74, 'Apartment sell-আপনার স্বপ্নের বাড়ি', 'Advertisement updated successfully !!', NULL, 1, NULL, NULL, '2023-01-01 05:35:30', '2023-01-01 05:35:30'),
(75, 'Apartment sell-আপনার স্বপ্নের বাড়ি', 'Advertisement updated successfully !!', NULL, 1, NULL, NULL, '2023-01-01 06:14:12', '2023-01-01 06:14:12'),
(76, 'Save money on your next rental car', 'Advertisement updated successfully !!', NULL, 1, NULL, NULL, '2023-01-01 07:05:37', '2023-01-01 07:05:37'),
(77, 'Home Rent', 'Advertisement updated successfully !!', NULL, 1, NULL, NULL, '2023-01-01 07:06:32', '2023-01-01 07:06:32'),
(78, 'Home for Sale or Rent', 'Advertisement updated successfully !!', NULL, 1, NULL, NULL, '2023-01-01 07:07:32', '2023-01-01 07:07:32'),
(79, 'মোহাম্মদপুর আদাবরে লাইনের গ্যাস ও বিদ্যুৎ পানির সংযোগসহ ফ্লাট ভাড়া হবে', 'Advertisement has been created', NULL, 1, NULL, NULL, '2023-01-01 07:18:41', '2023-01-01 07:18:41'),
(80, 'মোহাম্মদপুর আদাবরে লাইনের গ্যাস ও বিদ্যুৎ পানির সংযোগসহ ফ্লাট ভাড়া হবে', 'Advertisement updated successfully !!', NULL, 1, NULL, NULL, '2023-01-01 07:19:44', '2023-01-01 07:19:44'),
(81, 'মোহাম্মদপুর আদাবরে লাইনের গ্যাস ও বিদ্যুৎ পানির সংযোগসহ ফ্লাট ভাড়া হবে', 'Advertisement updated successfully !!', NULL, 1, NULL, NULL, '2023-01-01 07:43:07', '2023-01-01 07:43:07'),
(82, 'মোহাম্মদপুর আদাবরে লাইনের গ্যাস ও বিদ্যুৎ পানির সংযোগসহ ফ্লাট ভাড়া হবে', 'Advertisement updated successfully !!', NULL, 1, NULL, NULL, '2023-01-01 08:10:10', '2023-01-01 08:10:10'),
(83, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2023-01-05 12:34:13', '2023-01-05 12:34:13'),
(84, 'মোহাম্মদপুর আদাবরে লাইনের গ্যাস ও বিদ্যুৎ পানির সংযোগসহ ফ্লাট ভাড়া হবে', 'Advertisement updated successfully !!', NULL, 1, NULL, NULL, '2023-01-07 09:48:40', '2023-01-07 09:48:40'),
(85, 'advertisement', 'New Admin has been created', NULL, 1, NULL, NULL, '2023-01-10 07:29:46', '2023-01-10 07:29:46'),
(86, 'Vel qui rerum aliqua', 'Advertisement has been created', NULL, 13, NULL, NULL, '2023-01-10 10:52:03', '2023-01-10 10:52:03'),
(87, 'Asperiores in facere', 'Advertisement has been created', NULL, 13, NULL, NULL, '2023-01-10 10:52:32', '2023-01-10 10:52:32'),
(88, 'Sit cupidatat harum', 'Advertisement has been created', NULL, 13, NULL, NULL, '2023-01-11 10:03:01', '2023-01-11 10:03:01'),
(89, 'Advertisement Check', 'Advertisement has been created', NULL, 13, NULL, NULL, '2023-01-11 19:18:52', '2023-01-11 19:18:52'),
(90, 'Advertisement', 'Role has been updated successfully !!', NULL, 1, NULL, NULL, '2023-01-11 19:39:21', '2023-01-11 19:39:21'),
(91, 'Advertisement', 'Role has been updated successfully !!', NULL, 1, NULL, NULL, '2023-01-11 19:42:12', '2023-01-11 19:42:12'),
(92, 'Quia aut id laborum', 'Advertisement has been created', NULL, 1, NULL, NULL, '2023-01-14 09:24:41', '2023-01-14 09:24:41'),
(93, 'Super Admin', 'Role has been updated successfully !!', NULL, 1, NULL, NULL, '2023-01-14 09:25:55', '2023-01-14 09:25:55'),
(94, 'Ipsum velit culpa', 'Advertisement has been created', NULL, 13, NULL, NULL, '2023-01-16 07:57:14', '2023-01-16 07:57:14'),
(95, 'Consequatur Molliti', 'Advertisement has been created', NULL, 13, NULL, NULL, '2023-01-16 08:06:07', '2023-01-16 08:06:07'),
(96, 'Officia aut reiciend', 'Advertisement has been created', NULL, 13, NULL, NULL, '2023-01-16 08:29:59', '2023-01-16 08:29:59'),
(97, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2023-01-18 10:46:41', '2023-01-18 10:46:41'),
(98, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2023-01-18 10:46:55', '2023-01-18 10:46:55'),
(99, 'Hello', 'Advertisement has been created', NULL, 1, NULL, NULL, '2023-01-18 21:09:44', '2023-01-18 21:09:44'),
(100, 'Hello', 'Advertisement updated successfully !!', NULL, 1, NULL, NULL, '2023-01-19 08:03:04', '2023-01-19 08:03:04'),
(101, 'Hello', 'Advertisement updated successfully !!', NULL, 1, NULL, NULL, '2023-01-19 08:03:39', '2023-01-19 08:03:39'),
(102, 'Advertisement', 'Role has been updated successfully !!', NULL, 1, NULL, NULL, '2023-01-19 23:03:50', '2023-01-19 23:03:50'),
(103, 'Super Admin', 'Role has been updated successfully !!', NULL, 1, NULL, NULL, '2023-01-19 23:10:53', '2023-01-19 23:10:53'),
(104, 'Quia rerum nulla quo', 'Advertisement has been created', NULL, 15, NULL, NULL, '2023-01-20 08:34:48', '2023-01-20 08:34:48'),
(105, 'Hello', 'Advertisement updated successfully !!', NULL, 15, NULL, NULL, '2023-01-20 08:36:50', '2023-01-20 08:36:50'),
(106, 'Reprehenderit labor', 'Advertisement has been created', NULL, 15, NULL, NULL, '2023-01-20 08:45:41', '2023-01-20 08:45:41'),
(107, 'Reprehenderit labor', 'Advertisement updated successfully !!', NULL, 15, NULL, NULL, '2023-01-20 08:50:22', '2023-01-20 08:50:22'),
(108, 'Aut doloribus aut al', 'Advertisement has been created', NULL, 15, NULL, NULL, '2023-01-20 08:52:20', '2023-01-20 08:52:20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `username` varchar(191) NOT NULL,
  `phone_no` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `avatar` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=active, 0=inactive',
  `trusted` enum('true','false') NOT NULL DEFAULT 'false',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `language_id` bigint(20) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_username_unique` (`username`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD KEY `admins_created_by_foreign` (`created_by`),
  ADD KEY `admins_updated_by_foreign` (`updated_by`),
  ADD KEY `admins_deleted_by_foreign` (`deleted_by`),
  ADD KEY `admins_first_name_index` (`first_name`),
  ADD KEY `admins_phone_no_index` (`phone_no`);

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ads_created_by_foreign` (`created_by`),
  ADD KEY `ads_updated_by_foreign` (`updated_by`),
  ADD KEY `ads_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `advertisements_page_id_foreign` (`page_id`);

--
-- Indexes for table `article_types`
--
ALTER TABLE `article_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billing_information`
--
ALTER TABLE `billing_information`
  ADD PRIMARY KEY (`id`),
  ADD KEY `billing_information_booking_request_id_index` (`booking_request_id`),
  ADD KEY `billing_information_payment_status_index` (`payment_status`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blogs_slug_unique` (`slug`),
  ADD KEY `blogs_created_by_foreign` (`created_by`),
  ADD KEY `blogs_updated_by_foreign` (`updated_by`),
  ADD KEY `blogs_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `booking_rates`
--
ALTER TABLE `booking_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_requests`
--
ALTER TABLE `booking_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_requests_service_id_index` (`service_id`),
  ADD KEY `booking_requests_service_category_id_index` (`service_category_id`),
  ADD KEY `booking_requests_booking_rate_id_index` (`booking_rate_id`),
  ADD KEY `booking_requests_status_index` (`status`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD UNIQUE KEY `cache_key_unique` (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_created_by_foreign` (`created_by`),
  ADD KEY `categories_updated_by_foreign` (`updated_by`),
  ADD KEY `categories_deleted_by_foreign` (`deleted_by`),
  ADD KEY `categories_parent_category_id_foreign` (`parent_category_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_updated_by_foreign` (`updated_by`),
  ADD KEY `contacts_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `countries_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `languages_code_unique` (`code`),
  ADD KEY `languages_country_id_foreign` (`country_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `packages_created_by_foreign` (`created_by`),
  ADD KEY `packages_updated_by_foreign` (`updated_by`),
  ADD KEY `packages_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`),
  ADD KEY `pages_created_by_foreign` (`created_by`),
  ADD KEY `pages_updated_by_foreign` (`updated_by`),
  ADD KEY `pages_deleted_by_foreign` (`deleted_by`),
  ADD KEY `pages_category_id_foreign` (`category_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `services_slug_unique` (`slug`),
  ADD KEY `services_created_by_foreign` (`created_by`),
  ADD KEY `services_updated_by_foreign` (`updated_by`),
  ADD KEY `services_deleted_by_foreign` (`deleted_by`),
  ADD KEY `services_category_id_foreign` (`category_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `settings_group_index` (`group`);

--
-- Indexes for table `tracks`
--
ALTER TABLE `tracks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tracks_deleted_by_foreign` (`deleted_by`),
  ADD KEY `tracks_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_first_name_index` (`first_name`),
  ADD KEY `users_phone_no_index` (`phone_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `article_types`
--
ALTER TABLE `article_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `billing_information`
--
ALTER TABLE `billing_information`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `booking_rates`
--
ALTER TABLE `booking_rates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_requests`
--
ALTER TABLE `booking_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tracks`
--
ALTER TABLE `tracks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `admins_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `admins_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ads`
--
ALTER TABLE `ads`
  ADD CONSTRAINT `ads_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ads_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ads_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD CONSTRAINT `advertisements_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blogs_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blogs_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_parent_category_id_foreign` FOREIGN KEY (`parent_category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contacts_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `languages`
--
ALTER TABLE `languages`
  ADD CONSTRAINT `languages_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `packages`
--
ALTER TABLE `packages`
  ADD CONSTRAINT `packages_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `packages_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `packages_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `pages_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pages_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pages_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pages_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `services_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `services_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `services_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tracks`
--
ALTER TABLE `tracks`
  ADD CONSTRAINT `tracks_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tracks_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
