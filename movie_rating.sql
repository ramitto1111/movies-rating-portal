-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 15, 2022 at 04:36 PM
-- Server version: 5.7.31
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movie_rating`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(2, NULL, 1, 'Category 2', 'category-2', '2022-01-13 22:07:14', '2022-01-13 22:07:14');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'voyager::seeders.data_rows.roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 7, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 2),
(58, 7, 'description', 'rich_text_box', 'Description', 0, 1, 1, 1, 1, 1, '{}', 3),
(59, 7, 'type', 'select_dropdown', 'Type', 1, 1, 1, 1, 1, 1, '{\"options\":{\"Movies\":\"Movie\",\"TV Show\":\"TV Show\"}}', 5),
(60, 7, 'rate', 'number', 'Rate', 0, 1, 1, 1, 1, 1, '{}', 6),
(61, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 9),
(62, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(63, 7, 'image', 'image', 'Image', 1, 1, 1, 1, 1, 1, '{}', 4),
(64, 7, 'rateing_counts', 'text', 'Rateing Counts', 1, 1, 1, 1, 1, 1, '{}', 7),
(65, 7, 'year', 'text', 'Year', 1, 1, 1, 1, 1, 1, '{}', 8);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2022-01-13 22:07:13', '2022-01-13 22:07:13'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2022-01-13 22:07:13', '2022-01-13 22:07:13'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2022-01-13 22:07:13', '2022-01-13 22:07:13'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(7, 'items', 'items', 'Item', 'Items', 'voyager-video', 'App\\Models\\Item', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-01-14 09:01:42', '2022-01-15 12:43:28');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `rate` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rateing_counts` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `title`, `description`, `type`, `rate`, `created_at`, `updated_at`, `image`, `rateing_counts`, `year`) VALUES
(1, 'Don\'t Look Up', NULL, 'Movies', 4.7, '2022-01-14 09:07:00', '2022-01-15 12:47:15', 'items\\January2022\\0RiG5OjlVJ8MkVo3n3Dp.jpg', 2, 2017),
(2, 'Spider-Man: No Way Home', NULL, 'Movies', 3.6, '2022-01-14 09:11:00', '2022-01-15 12:47:00', 'items\\January2022\\Lbf45asyh6aiRIY0leU2.jfif', 4, 2019),
(3, 'Encanto', NULL, 'Movies', 2.5, '2022-01-14 09:12:00', '2022-01-15 12:46:41', 'items\\January2022\\mjDuPAtm40l1D2cFMX4H.jpeg', 12, 2022),
(4, 'Dexter: New Blood', NULL, 'TV Show', 4.5, '2022-01-14 09:13:00', '2022-01-15 12:46:23', 'items\\January2022\\e8C7ttZEZf9rlC9jKlSs.jfif', 1, 2019),
(5, 'Hawkeye', NULL, 'Movies', 3.2, '2022-01-14 09:14:00', '2022-01-15 12:46:05', 'items\\January2022\\7X4nFPen2fIqZxD11KvW.jpg', 4, 2021),
(6, 'Ghostbusters: Afterlife', NULL, 'Movies', 3.5, '2022-01-14 09:16:00', '2022-01-15 12:45:47', 'items\\January2022\\CZntmGRhdcmRd6qhspyF.jpg', 4, 2018),
(7, 'Dune', NULL, 'Movies', 2.9, '2022-01-14 09:18:00', '2022-01-15 12:45:15', 'items\\January2022\\9UoEZRBfm2nlXgW8653v.jpg', 4, 2019),
(8, 'The Witcher', NULL, 'TV Show', 3.7, '2022-01-14 09:18:00', '2022-01-15 12:45:31', 'items\\January2022\\iEXpB3GkHOJRzxPYPdyx.jpg', 2, 2019),
(9, 'No Time to Die', NULL, 'Movies', 2.8, '2022-01-14 09:19:00', '2022-01-15 12:44:58', 'items\\January2022\\w0WHAzhe0afAojLL05Nu.jpg', 2, 2022),
(10, 'The Power of the Dog', NULL, 'Movies', 2.9, '2022-01-14 09:20:00', '2022-01-15 12:44:41', 'items\\January2022\\O73BnDNTAMgXT0CFM5tn.jpg', 2, 2021),
(11, 'Shang-Chi and the Legend of the Ten Rings', NULL, 'Movies', 3.4, '2022-01-14 09:21:00', '2022-01-15 12:44:27', 'items\\January2022\\MDBmJRAcA6RBZ7DmNwuI.jfif', 2, 2015),
(12, 'Squid Game', NULL, 'TV Show', 4.8, '2022-01-14 09:23:00', '2022-01-15 12:43:57', 'items\\January2022\\NzNuATQ5igK4wpHiD5TR.jpeg', 1, 2021);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2022-01-13 22:07:13', '2022-01-13 22:07:13');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2022-01-13 22:07:13', '2022-01-13 22:07:13', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2022-01-13 22:07:13', '2022-01-13 22:07:13', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 4, '2022-01-13 22:07:13', '2022-01-14 09:01:57', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 3, '2022-01-13 22:07:13', '2022-01-14 09:01:57', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2022-01-13 22:07:13', '2022-01-13 22:07:13', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2022-01-13 22:07:13', '2022-01-14 09:01:57', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2022-01-13 22:07:13', '2022-01-14 09:01:57', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2022-01-13 22:07:13', '2022-01-14 09:01:57', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2022-01-13 22:07:13', '2022-01-14 09:01:57', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 10, '2022-01-13 22:07:13', '2022-01-14 09:01:57', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, '2022-01-13 22:07:14', '2022-01-13 22:07:14', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, '2022-01-13 22:07:14', '2022-01-13 22:07:14', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2022-01-13 22:07:14', '2022-01-13 22:07:14', 'voyager.pages.index', NULL),
(14, 1, 'Items', '', '_self', 'voyager-video', NULL, NULL, 2, '2022-01-14 09:01:42', '2022-01-14 09:01:57', 'voyager.items.index', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2016_01_01_000000_add_voyager_user_fields', 2),
(11, '2016_01_01_000000_create_data_types_table', 2),
(12, '2016_05_19_173453_create_menu_table', 2),
(13, '2016_10_21_190000_create_roles_table', 2),
(14, '2016_10_21_190000_create_settings_table', 2),
(15, '2016_11_30_135954_create_permission_table', 2),
(16, '2016_11_30_141208_create_permission_role_table', 2),
(17, '2016_12_26_201236_data_types__add__server_side', 2),
(18, '2017_01_13_000000_add_route_to_menu_items_table', 2),
(19, '2017_01_14_005015_create_translations_table', 2),
(20, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 2),
(21, '2017_03_06_000000_add_controller_to_data_types_table', 2),
(22, '2017_04_21_000000_add_order_to_data_rows_table', 2),
(23, '2017_07_05_210000_add_policyname_to_data_types_table', 2),
(24, '2017_08_05_000000_add_group_to_settings_table', 2),
(25, '2017_11_26_013050_add_user_role_relationship', 2),
(26, '2017_11_26_015000_create_user_roles_table', 2),
(27, '2018_03_11_000000_add_user_settings', 2),
(28, '2018_03_14_000000_add_details_to_data_types_table', 2),
(29, '2018_03_16_000000_make_settings_value_nullable', 2),
(30, '2016_01_01_000000_create_pages_table', 3),
(31, '2016_01_01_000000_create_posts_table', 3),
(32, '2016_02_15_204651_create_categories_table', 3),
(33, '2017_04_11_000000_alter_post_nullable_fields_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('764cd483a6b7404e688fc00a094cba906b51330ad213888d0e5d20ffd02f6323d75ba0906babfa33', 1, 1, 'Movies_Rating', '[]', 0, '2022-01-13 22:05:54', '2022-01-13 22:05:54', '2023-01-14 00:05:54'),
('cde15f16e7258cb2494f0e6336c3c4690736859e9dbc68dea76370a1485070082f9f1c618fd93a11', 8, 1, 'Movies_Rating', '[]', 0, '2022-01-13 22:21:41', '2022-01-13 22:21:41', '2023-01-14 00:21:41'),
('fc5b3974820cbfe866397f0ec67c48fa4595a880b89951ae0d5f65fe985dbbf9e513fa0a59927d20', 1, 1, 'Movies_Rating', '[]', 0, '2022-01-13 22:20:51', '2022-01-13 22:20:51', '2023-01-14 00:20:51');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'iKn4cSi8iAiqi9IVUJbBj3EaIy4EuK7iH2jrw2Ee', NULL, 'http://localhost', 1, 0, 0, '2022-01-13 21:19:55', '2022-01-13 21:19:55'),
(2, NULL, 'Laravel Password Grant Client', 'AauU50nXRzQrkcINH8gSEsVAfHNR71fW9a0FUJUZ', 'users', 'http://localhost', 0, 1, 0, '2022-01-13 21:19:55', '2022-01-13 21:19:55');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-01-13 21:19:55', '2022-01-13 21:19:55');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8_unicode_ci,
  `body` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `meta_keywords` text COLLATE utf8_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2022-01-13 22:07:14', '2022-01-13 22:07:14');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2022-01-13 22:07:13', '2022-01-13 22:07:13'),
(2, 'browse_bread', NULL, '2022-01-13 22:07:13', '2022-01-13 22:07:13'),
(3, 'browse_database', NULL, '2022-01-13 22:07:13', '2022-01-13 22:07:13'),
(4, 'browse_media', NULL, '2022-01-13 22:07:13', '2022-01-13 22:07:13'),
(5, 'browse_compass', NULL, '2022-01-13 22:07:13', '2022-01-13 22:07:13'),
(6, 'browse_menus', 'menus', '2022-01-13 22:07:13', '2022-01-13 22:07:13'),
(7, 'read_menus', 'menus', '2022-01-13 22:07:13', '2022-01-13 22:07:13'),
(8, 'edit_menus', 'menus', '2022-01-13 22:07:13', '2022-01-13 22:07:13'),
(9, 'add_menus', 'menus', '2022-01-13 22:07:13', '2022-01-13 22:07:13'),
(10, 'delete_menus', 'menus', '2022-01-13 22:07:13', '2022-01-13 22:07:13'),
(11, 'browse_roles', 'roles', '2022-01-13 22:07:13', '2022-01-13 22:07:13'),
(12, 'read_roles', 'roles', '2022-01-13 22:07:13', '2022-01-13 22:07:13'),
(13, 'edit_roles', 'roles', '2022-01-13 22:07:13', '2022-01-13 22:07:13'),
(14, 'add_roles', 'roles', '2022-01-13 22:07:13', '2022-01-13 22:07:13'),
(15, 'delete_roles', 'roles', '2022-01-13 22:07:13', '2022-01-13 22:07:13'),
(16, 'browse_users', 'users', '2022-01-13 22:07:13', '2022-01-13 22:07:13'),
(17, 'read_users', 'users', '2022-01-13 22:07:13', '2022-01-13 22:07:13'),
(18, 'edit_users', 'users', '2022-01-13 22:07:13', '2022-01-13 22:07:13'),
(19, 'add_users', 'users', '2022-01-13 22:07:13', '2022-01-13 22:07:13'),
(20, 'delete_users', 'users', '2022-01-13 22:07:13', '2022-01-13 22:07:13'),
(21, 'browse_settings', 'settings', '2022-01-13 22:07:13', '2022-01-13 22:07:13'),
(22, 'read_settings', 'settings', '2022-01-13 22:07:13', '2022-01-13 22:07:13'),
(23, 'edit_settings', 'settings', '2022-01-13 22:07:13', '2022-01-13 22:07:13'),
(24, 'add_settings', 'settings', '2022-01-13 22:07:13', '2022-01-13 22:07:13'),
(25, 'delete_settings', 'settings', '2022-01-13 22:07:13', '2022-01-13 22:07:13'),
(26, 'browse_categories', 'categories', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(27, 'read_categories', 'categories', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(28, 'edit_categories', 'categories', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(29, 'add_categories', 'categories', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(30, 'delete_categories', 'categories', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(31, 'browse_posts', 'posts', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(32, 'read_posts', 'posts', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(33, 'edit_posts', 'posts', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(34, 'add_posts', 'posts', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(35, 'delete_posts', 'posts', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(36, 'browse_pages', 'pages', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(37, 'read_pages', 'pages', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(38, 'edit_pages', 'pages', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(39, 'add_pages', 'pages', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(40, 'delete_pages', 'pages', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(41, 'browse_items', 'items', '2022-01-14 09:01:42', '2022-01-14 09:01:42'),
(42, 'read_items', 'items', '2022-01-14 09:01:42', '2022-01-14 09:01:42'),
(43, 'edit_items', 'items', '2022-01-14 09:01:42', '2022-01-14 09:01:42'),
(44, 'add_items', 'items', '2022-01-14 09:01:42', '2022-01-14 09:01:42'),
(45, 'delete_items', 'items', '2022-01-14 09:01:42', '2022-01-14 09:01:42');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'MyApp', '6d7a2e32ed7e47888ecaf0d76d233451ec94b1e45fc090a629c42cdf7e36309d', '[\"*\"]', NULL, '2022-01-13 22:00:56', '2022-01-13 22:00:56'),
(2, 'App\\Models\\User', 3, 'Movies Rating', '6843eb71c31342394dc080cec38e31d2f9b81ae0d7758c04cabb67c0a984e385', '[\"*\"]', NULL, '2022-01-13 22:02:31', '2022-01-13 22:02:31'),
(3, 'App\\Models\\User', 4, 'Movies_Rating', 'b089b8e42ef14ccf751cec6789ce8fa87afb751a6af44c3b49d56fed40fd132c', '[\"*\"]', NULL, '2022-01-13 22:02:52', '2022-01-13 22:02:52'),
(4, 'App\\Models\\User', 1, 'Movies_Rating', '53cfce1fd81790e7df7c01a57126ad6112db26b3d85ea211ac09db6d849dc952', '[\"*\"]', NULL, '2022-01-13 22:03:35', '2022-01-13 22:03:35');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8_unicode_ci,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `meta_keywords` text COLLATE utf8_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-01-13 22:07:14', '2022-01-13 22:07:14');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2022-01-13 22:07:13', '2022-01-13 22:07:13'),
(2, 'user', 'Normal User', '2022-01-13 22:07:13', '2022-01-13 22:07:13');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `details` text COLLATE utf8_unicode_ci,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Movies Rating', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Movies Rating Engine', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2022-01-13 22:07:14', '2022-01-13 22:07:14'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2022-01-13 22:07:14', '2022-01-13 22:07:14');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, NULL, 'rami miari', 'ramimiari1985@gmail.com', 'users/default.png', NULL, '$2y$10$xCq4iOFpccoIIlC5iIghHu5WbcbSY9qk/oafoZJdGRjncm2YqhJ7a', NULL, NULL, '2022-01-13 22:00:56', '2022-01-13 22:00:56'),
(7, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$ps6H9KLL77MDeJKeOzsb/u5PxLKmDWLUqizBiAsF6UH3RWzc1/uLe', 'XHGWQD3DdGZe1RkjNylM4q4MaTsDuWLKZSDpnbFzyFAFdqdcqloYotz5wNFo', NULL, NULL, NULL),
(8, 2, 'rami miari', 'rami@dchained.com', 'users/default.png', NULL, '$2y$10$yuyHbH0rJuoAKdlE/k9gL.5oFmB6nXk2GHq0ypmADgdyMksXzUTqG', NULL, NULL, '2022-01-13 22:21:41', '2022-01-13 22:21:41');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
