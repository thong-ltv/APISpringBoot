-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: shopping
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Quần áo',0,'quan-ao',NULL,NULL,NULL),(2,'Giày dép',0,'giay-dep','2022-09-28 05:45:31','2022-11-15 09:32:05','2022-11-15 09:32:05'),(3,'Quần áo nam',1,'quan-ao-nam','2022-09-28 05:45:57','2022-09-28 05:45:57',NULL),(4,'Quần áo nữ',1,'quan-ao-nu','2022-09-28 05:46:11','2022-09-28 05:46:11',NULL),(5,'Giày nam',2,'giay-nam','2022-09-28 05:46:28','2022-11-15 09:32:01','2022-11-15 09:32:01'),(6,'Giày nữ',2,'giay-nu','2022-09-28 05:46:40','2022-09-28 18:35:45','2022-09-28 18:35:45'),(7,'áo ba lỗ',1,'ao-ba-lo',NULL,NULL,NULL),(8,'áo ba lỗ',1,'ao-ba-lo',NULL,NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `colors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `english_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors`
--

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
INSERT INTO `colors` VALUES (1,'xanh',NULL,NULL,'black'),(2,'trắng',NULL,NULL,'while'),(3,'vàng',NULL,NULL,'yellow'),(4,'đỏ',NULL,NULL,'red'),(5,'cam',NULL,NULL,'orange'),(6,'xanh lá',NULL,NULL,'green'),(7,'tím',NULL,NULL,'brown'),(9,'camcam',NULL,NULL,'green');
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `menus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Menu 1',0,NULL,NULL,'',NULL),(2,'Menu 2',0,NULL,NULL,'',NULL),(3,'Menu 3',0,NULL,NULL,'',NULL),(4,'Menu 1.1',1,NULL,NULL,'',NULL),(5,'Menu 2.1',2,NULL,NULL,'',NULL),(6,'Menu 3.1',3,NULL,NULL,'',NULL),(7,'Menu 4',0,'2022-09-29 06:31:00','2022-09-29 06:31:00','',NULL),(8,'Menu 4.1',7,'2022-09-29 06:32:33','2022-09-29 06:32:33','',NULL),(9,'Menu 5',0,'2022-09-29 19:31:04','2022-09-29 19:31:04','',NULL),(10,'Menu 4.2',7,'2022-09-29 20:03:37','2022-09-29 20:03:37','menu-42',NULL),(11,'Menu 5.1',9,'2022-09-29 21:24:49','2022-09-30 00:24:01','menu-51','2022-09-30 00:24:01');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2022_09_20_092701_create_categories_table',1),(6,'2022_09_29_012829_add_column_deleted_at_table_categpries',2),(7,'2022_09_29_113033_create_menus_table',3),(8,'2022_09_30_025725_add_column_slug_to_menus_table',4),(9,'2022_09_30_071712_add_column_soft_delete_to_menus_table',5),(10,'2022_09_30_084040_create_products_table',6),(11,'2022_09_30_084642_create_product_images_table',6),(12,'2022_09_30_084932_create_tags_table',6),(13,'2022_09_30_085105_create_product_tags_table',6),(14,'2022_10_04_070831_add_column_feature_image_name',7),(15,'2022_10_05_161716_add_column_image_name_to_table_product_image',8),(16,'2022_10_13_144732_add_column_delected_at_to_product_table',9),(17,'2022_10_14_151911_create_sliders_table',10),(18,'2022_10_21_154931_add_column_delected_at_table_sliders',11),(19,'2022_10_21_165357_create_settings_table',12),(20,'2022_10_23_100603_add_column_type_settings_table',13),(21,'2022_10_23_152751_add_column_delected_at_to_settings',14),(22,'2022_10_24_024304_create_roles_table',15),(23,'2022_10_24_024350_create_permissions_table',15),(24,'2022_10_24_025940_create_table_role_user',16),(25,'2022_10_24_030040_create_table_permission_role',16),(26,'2022_10_24_154848_add_column_delected_add_table_users',17),(27,'2022_11_03_032036_add_column_parent_id_permission',18),(28,'2022_11_11_164130_add_column_key_table_permissions',19),(29,'2022_11_15_035359_add_column_color_and_size_to_product',20),(30,'2022_11_16_162611_create_colors_table',21),(31,'2022_11_17_005940_create_table_product_colors',22),(32,'2022_11_17_012551_add_column_english_colors_product',23),(33,'2022_11_17_013355_add_column_english_color_to_colors',24),(34,'2022_11_17_015602_create_sizes_table',25),(35,'2022_11_18_013636_delete_columns_size_color_of_product',26),(36,'2022_11_18_014329_delete_columns_table_products',27),(37,'2022_11_18_020506_create_product_sizes',28),(38,'2022_11_18_020733_add_columns_product_sizes',29),(39,'2022_11_18_022105_rename_column_product_sizes',30),(40,'2022_11_18_023346_create_column_product_sizes',31),(41,'2022_11_18_151349_add_column_users',32),(42,'2022_11_21_180053_create_table_cart',33),(43,'2022_11_21_182816_add_table_cart',33),(44,'2022_11_21_182946_create_table_cart_item',33),(45,'2022_11_21_185128_update_table_orders',34),(46,'2022_11_21_185240_update_table_carts',35),(47,'2022_11_22_015829_delete_table_orders',36),(48,'2022_11_22_020119_create_table_order_item',37),(49,'2022_11_22_020503_update_table_users',38),(50,'2022_11_23_142436_add_columns_to_table_order_items',39);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,18,3,NULL,NULL,'vàng','M'),(2,1,26,5,NULL,NULL,'Đỏ','L');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `total` float NOT NULL,
  `payment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,999000,'tiền mặt','Thành công',NULL,'2022-11-23 10:29:49'),(2,2,1000000,'Thẻ Vietcombank','Thành công',NULL,'2022-11-23 10:31:15');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `key_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'Danh mục sản phẩm','Danh mục sản phẩm',NULL,NULL,0,''),(2,'Danh mục sản phẩm','Danh mục sản phẩm',NULL,NULL,1,'list_category'),(3,'Thêm danh mục sản phẩm','Thêm danh mục sản phẩm',NULL,NULL,1,'add_category'),(4,'Sửa danh mục sản phẩm','Sửa danh mục sản phẩm',NULL,NULL,1,'edit_category'),(5,'Xóa danh mục sản phẩm','Xóa danh mục sản phẩm',NULL,NULL,1,'delete_category'),(6,'Menu','Menu',NULL,NULL,0,''),(7,'Danh sách menu','Danh sách menu',NULL,NULL,6,'list_menu'),(8,'Thêm menu','Thêm menu',NULL,NULL,6,'add_menu'),(9,'Sửa menu','Sửa menu',NULL,NULL,6,'edit_menu'),(10,'Xóa menu','Xóa menu',NULL,NULL,6,'delete_menu'),(11,'Sản phẩm','Sản phẩm',NULL,NULL,0,''),(12,'Danh sách sản phẩm','Danh sách sản phẩm',NULL,NULL,11,'list_product'),(13,'Thêm sản phẩm','Thêm sản phẩm',NULL,NULL,11,'add_product'),(14,'Sửa sản phẩm','Sửa sản phẩm',NULL,NULL,11,'edit_product'),(15,'Xóa sản phẩm','Xóa sản phẩm',NULL,NULL,11,'delete_product'),(16,'Setting','Setting',NULL,NULL,0,''),(17,'Danh sách setting','Danh sách setting',NULL,NULL,16,'list_setting'),(18,'Thêm setting','Thêm setting',NULL,NULL,16,'add_setting'),(19,'Sửa setting','Sửa setting',NULL,NULL,16,'edit_setting'),(20,'Xóa setting','Xóa setting',NULL,NULL,16,'delete_setting'),(21,'Nhân viên','Nhân viên',NULL,NULL,0,''),(22,'Danh sách nhân viên','Danh sách nhân viên',NULL,NULL,21,'list_user'),(23,'Thêm nhân viên','Thêm nhân viên',NULL,NULL,21,'add_user\r\n'),(24,'Sửa nhân viên','Sửa nhân viên',NULL,NULL,21,'edit_user'),(25,'Xóa nhân viên','Xóa nhân viên',NULL,NULL,21,'delete_user'),(26,'Vai trò','Vai trò',NULL,NULL,0,''),(27,'Danh sách vai trò','Danh sách vai trò',NULL,NULL,26,'list_role'),(28,'Thêm vai trò','Thêm vai trò',NULL,NULL,26,'add_role'),(29,'Sửa vai trò','Sửa vai trò',NULL,NULL,26,'edit_role'),(30,'Xóa vai trò','Xóa vai trò',NULL,NULL,26,'delete_role'),(31,'Slider','Slider',NULL,NULL,0,''),(32,'Danh sách slider','Danh sách slider',NULL,NULL,31,'list_slider'),(33,'Thêm slider','Thêm slider',NULL,NULL,31,'add_slider'),(34,'Sửa slider','Sửa slider',NULL,NULL,31,'edit_slider'),(35,'Xóa slider','Xóa slider',NULL,NULL,31,'delete_slider');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',7,'fashionwebToken','eda1b6d8790f5aff938974b81878d45268b131743d798da44a5796a85beab0b8','[\"*\"]',NULL,NULL,'2022-11-18 08:40:48','2022-11-18 08:40:48'),(4,'App\\Models\\User',10,'fashionwebToken','f6b612909225868c1f165859d47e1fa0148158dd4c6d9640a1e6d7425a7499f6','[\"*\"]',NULL,NULL,'2022-11-18 09:38:37','2022-11-18 09:38:37'),(5,'App\\Models\\User',10,'fashionwebToken','8e77d528aa5bb2c4d0de61bce35c3e09bd65a9a505fa2423b36891c8bb78b4c5','[\"*\"]',NULL,NULL,'2022-11-18 09:47:08','2022-11-18 09:47:08'),(6,'App\\Models\\User',16,'fashionwebToken','024b5400d4183b35df0ee71f9bb7bd4998f4bf11a16362056c878015c05191cb','[\"*\"]',NULL,NULL,'2022-11-25 10:06:43','2022-11-25 10:06:43'),(7,'App\\Models\\User',16,'fashionwebToken','038ea43d87eab065e73ef729dd855e1a565a35d993eff61efb84f45ad11a69b9','[\"*\"]',NULL,NULL,'2022-11-25 10:25:36','2022-11-25 10:25:36'),(8,'App\\Models\\User',16,'fashionwebToken','8c66ae2affb8d320c5386981c8803d40eb55db687fe8d92929391e88788cecfb','[\"*\"]',NULL,NULL,'2022-11-25 10:27:23','2022-11-25 10:27:23'),(9,'App\\Models\\User',16,'fashionwebToken','b28ce1aff0ed4a1c6131496b0879496ae69726826e89cee4583d21157fc59295','[\"*\"]',NULL,NULL,'2022-11-25 10:31:14','2022-11-25 10:31:14'),(10,'App\\Models\\User',16,'fashionwebToken','854441e38edc2db7c90c9f37bd09f81591c64bf15fcf7c215fee486e1801a169','[\"*\"]',NULL,NULL,'2022-11-25 10:33:09','2022-11-25 10:33:09'),(11,'App\\Models\\User',16,'fashionwebToken','729ef284db833d4f02bc8577d76aa766ea754f861f8028f291ab947518b23ec0','[\"*\"]',NULL,NULL,'2022-11-25 10:37:12','2022-11-25 10:37:12'),(12,'App\\Models\\User',16,'fashionwebToken','f0b1fe205054df9a3be459701e623cd9b2360c469667a5173a81af22b544253a','[\"*\"]',NULL,NULL,'2022-11-25 10:37:33','2022-11-25 10:37:33'),(13,'App\\Models\\User',16,'fashionwebToken','16cfa28855066c384ba6f22297fef07eb410c5f27ba4d8d6c34ddfe555221f75','[\"*\"]',NULL,NULL,'2022-11-25 10:38:52','2022-11-25 10:38:52'),(14,'App\\Models\\User',16,'fashionwebToken','2d2de4c20e0376119fa7177e7cd0f8102e9d869a05a11ba47263dc1ce06190e0','[\"*\"]',NULL,NULL,'2022-11-25 10:39:00','2022-11-25 10:39:00'),(15,'App\\Models\\User',16,'fashionwebToken','40d8e9c3dc64fc68bce5f794b14ec82652ddcea8a2b873f63ef2b6b5d8183094','[\"*\"]',NULL,NULL,'2022-11-25 10:39:01','2022-11-25 10:39:01'),(16,'App\\Models\\User',16,'fashionwebToken','d87150a0a9930ecf918f124f1a67e560fdabd404d2206683d660e5c43ba89c4e','[\"*\"]',NULL,NULL,'2022-11-25 10:39:02','2022-11-25 10:39:02'),(17,'App\\Models\\User',16,'fashionwebToken','3052ef92239e5f866aeb618a5bb851d3ffe8991e45a4e1df0d3e5e08352498bf','[\"*\"]',NULL,NULL,'2022-11-25 10:39:04','2022-11-25 10:39:04'),(18,'App\\Models\\User',16,'fashionwebToken','357024c83d7b968a550ea1da57d32be6c99effcfa31c2c15e18f09e4860a9a16','[\"*\"]',NULL,NULL,'2022-11-25 10:39:04','2022-11-25 10:39:04'),(19,'App\\Models\\User',16,'fashionwebToken','ff1bfa729148a1933517c5a9948624264d99d49d95f8933e73b16495944ad182','[\"*\"]',NULL,NULL,'2022-11-25 10:39:05','2022-11-25 10:39:05'),(20,'App\\Models\\User',16,'fashionwebToken','915f10e72889a9c2127a2e1e2d928640d439f7d9eabc82ef9565b2a8eec63179','[\"*\"]',NULL,NULL,'2022-11-25 10:39:05','2022-11-25 10:39:05'),(21,'App\\Models\\User',16,'fashionwebToken','d5f8618ae30d5a55a58be28c78ff4aeb999f4df8b9357e8f0a2dbdc747c374b6','[\"*\"]',NULL,NULL,'2022-11-25 10:39:06','2022-11-25 10:39:06'),(22,'App\\Models\\User',16,'fashionwebToken','0924e7549546b55b5443d23c6234a254fc01ba7ae6313b5159d700bbfa601f1b','[\"*\"]',NULL,NULL,'2022-11-25 10:39:06','2022-11-25 10:39:06'),(23,'App\\Models\\User',16,'fashionwebToken','befc4fd3752a647a7f631f33aeaa256ed9d8270a6c7beb521c579f1e6305744d','[\"*\"]',NULL,NULL,'2022-11-25 10:39:07','2022-11-25 10:39:07'),(24,'App\\Models\\User',16,'fashionwebToken','b84014ad2f40a3c821eeb833a2b16291c3d150cc4bfd02cb88e68defc99d4cfa','[\"*\"]',NULL,NULL,'2022-11-25 10:39:07','2022-11-25 10:39:07'),(25,'App\\Models\\User',16,'fashionwebToken','9717fd9bd33be27c4d40970b3bf05b21e4c24dce4dc28d7b817255e8b153394b','[\"*\"]',NULL,NULL,'2022-11-25 10:39:20','2022-11-25 10:39:20'),(26,'App\\Models\\User',16,'fashionwebToken','d153419e3827eb26ec40b9a91654785b71c078ef538acdd5723448a8b1ebce48','[\"*\"]',NULL,NULL,'2022-11-25 10:40:06','2022-11-25 10:40:06'),(28,'App\\Models\\User',16,'fashionwebToken','4c2b0c699a77c0ef743d1d5bca3196c726aa54deef753610ea31cdfc0de7efaf','[\"*\"]',NULL,NULL,'2022-11-26 02:31:01','2022-11-26 02:31:01'),(29,'App\\Models\\User',16,'fashionwebToken','32540938327906f4a676dba612b2025401093dd146e3209fe24f2c447a5bb7ed','[\"*\"]',NULL,NULL,'2022-11-26 02:32:02','2022-11-26 02:32:02'),(30,'App\\Models\\User',16,'fashionwebToken','eff9c989a8a7a2de723a3540ea89738cbd12a8cbd689f72b8a0365fb4f028aa8','[\"*\"]',NULL,NULL,'2022-11-26 02:36:03','2022-11-26 02:36:03'),(31,'App\\Models\\User',16,'fashionwebToken','c5b872478d87bce528dd0ef7d17d4aa1b62e7a3c508afbdc086dfefb6a141fa3','[\"*\"]',NULL,NULL,'2022-11-26 02:37:37','2022-11-26 02:37:37'),(32,'App\\Models\\User',16,'fashionwebToken','b17b1c15f5853500ef597cd4cb1c28981d3c36435a9bd64db3a4e24ef7673f12','[\"*\"]',NULL,NULL,'2022-11-26 02:40:47','2022-11-26 02:40:47'),(33,'App\\Models\\User',16,'fashionwebToken','ddc68642ea489254eceface7fa3e22fd85213e95e6631e34b7c838cc68a1c877','[\"*\"]',NULL,NULL,'2022-11-26 02:41:46','2022-11-26 02:41:46'),(34,'App\\Models\\User',16,'fashionwebToken','af8c426d4021ddb5f8c860f755d01044691ec7a51c825072c21a7460c573d883','[\"*\"]',NULL,NULL,'2022-11-26 08:45:41','2022-11-26 08:45:41'),(35,'App\\Models\\User',16,'fashionwebToken','e382c4afcad2f9fefa39c8045dc4f4fe817726712923d6b406beaaca2762b7ff','[\"*\"]',NULL,NULL,'2022-11-26 19:15:43','2022-11-26 19:15:43'),(36,'App\\Models\\User',16,'fashionwebToken','9072e763e8ebc296a3f4fc6d4aa950ff76d3e01c0bdc4474888bf3f5b9002af7','[\"*\"]',NULL,NULL,'2022-11-26 19:35:53','2022-11-26 19:35:53'),(37,'App\\Models\\User',16,'fashionwebToken','5b64e5bc2636f3919a7bbe5a2035e74f9b864618efd314c0be9dc28c287ba9e0','[\"*\"]',NULL,NULL,'2022-11-26 19:37:36','2022-11-26 19:37:36'),(47,'App\\Models\\User',16,'fashionwebToken','c83a9a4ee1dadf89ae27dd5516e82b62cfca3bf535eeeafd965d6dfea430df69','[\"*\"]',NULL,NULL,'2022-11-26 21:10:57','2022-11-26 21:10:57'),(48,'App\\Models\\User',16,'fashionwebToken','a16ab9da80ad0406f221d22dc924a4c0dab5788bbd2477b06a6920de56033a3f','[\"*\"]','2022-11-28 14:45:55',NULL,'2022-11-28 14:38:15','2022-11-28 14:45:55'),(49,'App\\Models\\User',16,'fashionwebToken','7eb59d53cac634ecad996eca074f6d3d88250ee6a4600fd4b3213fceab72bd24','[\"*\"]','2022-11-28 14:49:10',NULL,'2022-11-28 14:48:33','2022-11-28 14:49:10'),(50,'App\\Models\\User',16,'fashionwebToken','3e27e9d20a60f32317e797da20f8b44924ee4c6c95211e57b895b5cae8d1e7ec','[\"*\"]','2022-11-28 23:03:30',NULL,'2022-11-28 22:11:03','2022-11-28 23:03:30'),(51,'App\\Models\\User',16,'fashionwebToken','1e5f6e3f28969f280144e5339b5a9482c83aab46874ba6207d216d419fd938dc','[\"*\"]',NULL,NULL,'2022-11-29 07:33:56','2022-11-29 07:33:56');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_colors`
--

DROP TABLE IF EXISTS `product_colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_colors` (
  `product_id` bigint(20) NOT NULL,
  `color_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`color_id`),
  KEY `FKb9e4okm5xhksf4up2ltc8gxv0` (`color_id`),
  CONSTRAINT `FKb9e4okm5xhksf4up2ltc8gxv0` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`),
  CONSTRAINT `FKqhu7cqni31911lmvx4fqmiw65` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_colors`
--

LOCK TABLES `product_colors` WRITE;
/*!40000 ALTER TABLE `product_colors` DISABLE KEYS */;
INSERT INTO `product_colors` VALUES (1,1),(152,1),(202,1),(252,1),(302,1),(303,1),(305,1),(306,1),(305,2),(306,2),(304,3),(305,3);
/*!40000 ALTER TABLE `product_colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqnq71xsohugpqwf3c9gxmsuy` (`product_id`),
  CONSTRAINT `FKqnq71xsohugpqwf3c9gxmsuy` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (7,'http://path','2022-10-05 17:27:40','2022-10-05 17:27:40','imageNameBeautiful1',1),(8,'/storage/product/1/agWRPnEo3vgvPj01DNCg.png','2022-10-05 17:27:40','2022-10-05 17:27:40','33.png',NULL),(9,'/storage/product/1/vLk8oNJNCclsJ9NBbNQX.png','2022-10-05 17:27:40','2022-10-05 17:27:40','44.png',NULL),(17,'/storage/product/1/jx1hcH8uzTILenkj4pCZ.png','2022-10-06 02:36:12','2022-10-06 02:36:12','44.png',NULL),(18,'/storage/product/1/7idcBTu8rvn7KN83hoSR.png','2022-10-06 02:36:12','2022-10-06 02:36:12','55.png',NULL),(26,'/storage/product/1/M6cWBHtVUbWbOp3uJEIK.jpg','2022-11-15 10:21:22','2022-11-15 10:21:22','product1.1.jpg',NULL),(27,'/storage/product/1/easQH2zXKpR2fUd1Bs6d.jpg','2022-11-15 10:21:22','2022-11-15 10:21:22','product1.2.jpg',NULL),(28,'/storage/product/1/0mqhaDyRMOaWt7GqAO9q.webp','2022-11-15 10:21:22','2022-11-15 10:21:22','product1.webp',NULL),(29,'/storage/product/1/7Y6dWfR6Mh9hQcqehURh.jpg','2022-11-15 10:26:30','2022-11-15 10:26:30','product2.1.jpg',NULL),(30,'/storage/product/1/APE2nsFOS2CjJRkF27iE.jpg','2022-11-15 10:26:30','2022-11-15 10:26:30','product2.jpg',NULL),(31,'/storage/product/1/dJvo49pVMqk3Ez48Vgbg.webp','2022-11-15 10:34:21','2022-11-15 10:34:21','product3.webp',NULL),(32,'/storage/product/1/IG3GW1vXysZ7PsqBz3Cv.jpg','2022-11-15 10:38:19','2022-11-15 10:38:19','product4.1.jpg',NULL),(33,'/storage/product/1/RyEvu37EZh2U6wzgRVu7.jpg','2022-11-15 10:38:19','2022-11-15 10:38:19','product4.jpg',NULL),(34,'/storage/product/1/VSUf3dbSTcMh5V099HP2.avif','2022-11-15 23:40:10','2022-11-15 23:40:10','anh1.avif',NULL),(35,'/storage/product/1/hWilkMQotGtkeD29KQOr.avif','2022-11-15 23:40:10','2022-11-15 23:40:10','anh2.avif',NULL),(41,'/storage/product/1/UQd1IgSAQnC0F7l2gVwx.png','2022-11-17 18:52:10','2022-11-17 18:52:10','55.png',NULL),(45,'/storage/product/1/j55p2nKMfzCzSOlsxTMe.webp','2022-11-17 19:34:33','2022-11-17 19:34:33','product5.1.webp',NULL),(46,'/storage/product/1/U7ZUgD87znRnIMRwuhUH.webp','2022-11-17 19:34:33','2022-11-17 19:34:33','product5.2.webp',NULL),(47,'/storage/product/1/9642eUW3P0lD4lT3c94r.webp','2022-11-17 19:34:33','2022-11-17 19:34:33','product5.webp',NULL),(48,'http://path',NULL,NULL,'imageNameBeauti',NULL),(49,'http://path',NULL,NULL,'imageNameBeautiful',1);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_sizes`
--

DROP TABLE IF EXISTS `product_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_sizes` (
  `product_id` bigint(20) NOT NULL,
  `size_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`size_id`),
  KEY `FK3bqabm2nc8yyl9to7fo8trak4` (`size_id`),
  CONSTRAINT `FK3bqabm2nc8yyl9to7fo8trak4` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`),
  CONSTRAINT `FK4isa0j51hpdn7cx04m831jic4` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_sizes`
--

LOCK TABLES `product_sizes` WRITE;
/*!40000 ALTER TABLE `product_sizes` DISABLE KEYS */;
INSERT INTO `product_sizes` VALUES (302,1),(303,1),(305,1),(306,1),(305,2),(306,2),(304,3),(305,4),(306,4),(305,5),(306,5);
/*!40000 ALTER TABLE `product_sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_tags`
--

DROP TABLE IF EXISTS `product_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_tags` (
  `product_id` bigint(20) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`tag_id`),
  KEY `FKpur2885qb9ae6fiquu77tcv1o` (`tag_id`),
  CONSTRAINT `FK5rk6s19k3risy7q7wqdr41uss` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKpur2885qb9ae6fiquu77tcv1o` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_tags`
--

LOCK TABLES `product_tags` WRITE;
/*!40000 ALTER TABLE `product_tags` DISABLE KEYS */;
INSERT INTO `product_tags` VALUES (252,1),(302,1),(303,1),(305,1),(306,1),(304,3),(305,3),(306,3),(305,4);
/*!40000 ALTER TABLE `product_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `feature_image_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `feature_image_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`),
  CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Ao chong dan',199,'image','ao chong dan dang duoc ua thich hien nay',4,NULL,NULL,'image',NULL),(152,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL),(202,'iphone 14promax',1234.5,'','',3,NULL,NULL,'',NULL),(252,'iphone 15promax',1234.5,'','',3,NULL,NULL,'',NULL),(302,'iphone 16promax',1234.5,'','',3,NULL,NULL,'',NULL),(303,'iphone 17promax',1234.5,'','',3,NULL,NULL,'',NULL),(304,'iphone 22promax',1234.5,'','',3,NULL,NULL,'',NULL),(305,'iphone 201promax',1234.5,'','',3,NULL,NULL,'',NULL),(306,'iphone 202promax',1234.5,'','',3,NULL,NULL,'',NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permissions`
--

DROP TABLE IF EXISTS `role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `role_permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permissions`
--

LOCK TABLES `role_permissions` WRITE;
/*!40000 ALTER TABLE `role_permissions` DISABLE KEYS */;
INSERT INTO `role_permissions` VALUES (1,9,2,NULL,NULL),(2,9,3,NULL,NULL),(3,9,4,NULL,NULL),(4,9,5,NULL,NULL),(7,9,22,NULL,NULL),(8,9,23,NULL,NULL),(9,9,24,NULL,NULL),(10,10,7,NULL,NULL),(11,10,8,NULL,NULL),(12,10,9,NULL,NULL),(13,10,10,NULL,NULL),(14,10,22,NULL,NULL),(15,10,23,NULL,NULL),(16,10,24,NULL,NULL),(17,10,25,NULL,NULL),(31,2,2,NULL,NULL),(32,2,3,NULL,NULL),(33,2,4,NULL,NULL),(34,2,5,NULL,NULL),(35,2,7,NULL,NULL),(36,2,8,NULL,NULL),(37,2,9,NULL,NULL),(38,2,10,NULL,NULL),(39,2,12,NULL,NULL),(40,2,13,NULL,NULL),(41,2,14,NULL,NULL),(42,2,15,NULL,NULL),(43,2,17,NULL,NULL),(44,2,18,NULL,NULL),(45,2,19,NULL,NULL),(46,2,20,NULL,NULL),(47,2,22,NULL,NULL),(48,2,23,NULL,NULL),(49,2,24,NULL,NULL),(50,2,25,NULL,NULL),(51,2,27,NULL,NULL),(52,2,28,NULL,NULL),(53,2,29,NULL,NULL),(54,2,30,NULL,NULL),(55,2,32,NULL,NULL),(56,2,33,NULL,NULL),(57,2,34,NULL,NULL),(58,2,35,NULL,NULL);
/*!40000 ALTER TABLE `role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `role_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
INSERT INTO `role_users` VALUES (4,1,5,NULL,NULL),(5,4,5,NULL,NULL),(7,2,3,NULL,NULL),(8,3,3,NULL,NULL),(12,2,1,NULL,NULL),(13,9,1,NULL,NULL);
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Quản trị hệ thống',NULL,NULL),(3,'developer','Phát triển hệ thống',NULL,NULL),(4,'content','Chỉnh sửa nội dung',NULL,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `config_key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `config_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'phone','0383785124','2022-10-23 02:27:42','2022-10-23 02:27:42','Textarea',NULL),(2,'phone_number','0383785124','2022-10-23 02:29:00','2022-10-23 02:29:00','Text',NULL),(3,'zalo','thongnguyen','2022-10-23 03:12:24','2022-10-23 08:36:03','Text','2022-10-23 08:36:03');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sizes`
--

DROP TABLE IF EXISTS `sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sizes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sizes`
--

LOCK TABLES `sizes` WRITE;
/*!40000 ALTER TABLE `sizes` DISABLE KEYS */;
INSERT INTO `sizes` VALUES (1,'S',NULL,NULL),(2,'M',NULL,NULL),(3,'L',NULL,NULL),(4,'XL',NULL,NULL),(5,'XXXL',NULL,NULL),(8,'XXXXLL',NULL,NULL);
/*!40000 ALTER TABLE `sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sliders`
--

DROP TABLE IF EXISTS `sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sliders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sliders`
--

LOCK TABLES `sliders` WRITE;
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
INSERT INTO `sliders` VALUES (1,'slider 3 pro max','ggggggg','/storage/slider//Uyv8fP5hbkdAXSwkVrqp.png','55.png','2022-10-21 06:22:24','2022-11-23 07:35:00','2022-11-23 07:35:00'),(2,'slider 3 pro gau bi doi','ggggggghhhhhh','/storage/slider//zjocDnRVmbYOCtSfKZ4m.jpg','background.jpg','2022-10-21 06:23:14','2022-10-21 08:50:49','2022-10-21 08:50:49'),(5,'Slider_ao_nu','Áo nữ thời trang','/storage/slider/2/85ivZHmHtjbMAWdhh4MW.jfif','ao_nu.jfif','2022-11-23 07:36:00','2022-11-23 07:36:00',NULL),(6,'Slider_ao_nam_nu','Áo bộ nam nữ đẹp, thu hút, thoáng mát','/storage/slider/2/bGksapNAzjL74SakUm8b.jfif','ao_nam_nu.jfif','2022-11-23 07:36:35','2022-11-23 07:36:35',NULL),(7,'Slider_shop','Không gian bán quần áo đẹp, sạch sẽ, thoáng mát','/storage/slider/2/cG7SlgCCt0gMda4NWV1M.jfif','shop.jfif','2022-11-23 07:37:17','2022-11-23 07:37:17',NULL);
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'balo xấu','2022-10-06 02:12:51','2022-10-06 02:12:51'),(3,'balo xin','2022-10-06 02:12:51','2022-10-06 02:12:51'),(4,'dien thoai','2022-10-06 02:36:12','2022-10-06 02:36:12'),(5,'may tinh','2022-10-06 02:36:12','2022-10-06 02:36:12'),(6,'hhh','2022-10-06 02:56:39','2022-10-06 02:56:39'),(7,'ggggggggggggggggggg','2022-10-06 02:56:39','2022-10-06 02:56:39'),(8,'ggggggggggggggggggggg','2022-10-06 02:56:39','2022-10-06 02:56:39'),(9,'fffffffffffffffffffffff','2022-10-06 02:56:39','2022-10-06 02:56:39'),(10,'jjjjjjjjjjjjj','2022-10-06 02:56:39','2022-10-06 02:56:39'),(11,'thong','2022-10-11 05:38:40','2022-10-11 05:38:40'),(12,'fffff','2022-11-12 07:22:16','2022-11-12 07:22:16'),(13,'anh dep','2022-11-15 09:15:23','2022-11-15 09:15:23'),(14,'áo mùa he','2022-11-15 10:21:22','2022-11-15 10:21:22'),(15,'thoáng mát','2022-11-15 10:21:22','2022-11-15 10:21:22'),(16,'Vải tổng hợp trơn mềm mại','2022-11-15 10:26:30','2022-11-15 10:26:30'),(17,'Chất Cotton','2022-11-15 10:34:21','2022-11-15 10:34:21'),(18,'mềm mại và thoáng mát.','2022-11-15 10:34:21','2022-11-15 10:34:21'),(19,'Sét bộ thể thao nam','2022-11-15 10:38:19','2022-11-15 10:38:19'),(20,'áo đẹp','2022-11-15 23:40:10','2022-11-15 23:40:10'),(21,'hoa','2022-11-16 00:04:41','2022-11-16 00:04:41'),(22,'hhhh','2022-11-16 07:29:49','2022-11-16 07:29:49'),(23,'kkkkkkkk','2022-11-17 18:52:10','2022-11-17 18:52:10'),(24,'thời trang','2022-11-17 19:34:33','2022-11-17 19:34:33'),(25,'mềm mịn','2022-11-17 19:34:33','2022-11-17 19:34:33'),(26,'beatiful',NULL,NULL),(27,'beatifull',NULL,NULL);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fisrtname` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Thong 1 dep trai 1','thonglaptrinhvien1234@gmail.com',NULL,'$2y$10$2urW30iggOsc55p.jAWCqu/M7hjYgVhRCqdJq/RQYAelP/rny2.dy','0ygeybGHKuHb54ppAAotGbxTI4EmNVzs20ee6fCNR0RDyJ4EBwIpRgPvdt4r',NULL,'2022-11-17 20:45:00',NULL,'','','','',NULL),(2,'thuong123','thuong@gmail.com',NULL,'$2y$10$1fP/1PvMTbQL5l.qOjdxnO93dFr8.//rylzekdw0Xkjbc0EenSzJm','nukyRoKu5rrT6HEua2BGGANIiURmHrcl0nCkQuEfrOPOjME6DyX17G6FPbQu','2022-10-24 05:51:20','2022-11-23 08:09:32',NULL,'','','q9-Thành Phố HCM','(+84) 383785124',NULL),(3,'ngoc y','y@gmail.com',NULL,'$2y$10$.pe.2wYnlg2sqtejkUQo5.ty6t50CWwrKdh0KiQlybBpus5GjPB2y',NULL,'2022-10-24 05:52:24','2022-10-24 21:25:55',NULL,'','','','',NULL),(5,'ngoc thuc  nguyen','thuc123@gmail.com',NULL,'$2y$10$/OlxHk/72TXC5HH49khKhu5GauabWMTMeK2vcWWIpaHwUyAPsM6GO',NULL,'2022-10-24 06:30:08','2022-10-24 21:10:54','2022-10-24 21:10:54','','','','',NULL),(6,'thonghoaixuan123456','thonglaptrinhvien123345@gmail.com',NULL,'$2y$10$vfCO8Eqnx9GrAHIB9eg.8OSRLrfOlvwX.uL02QHlLGHrzvLYLd8dy',NULL,'2022-11-02 01:38:34','2022-11-02 02:22:39','2022-11-02 02:22:39','','','','',NULL),(7,'tronglagist','trong@gmail.com',NULL,'$2y$10$UOU1bANIqICMCHWBhLItLuYkLgKVo1IImXDWlzKL23sizE.R.C0.y',NULL,'2022-11-18 08:40:48','2022-11-18 08:40:48',NULL,'pham','trong','','',NULL),(10,'thuonglagist','thuong123456@gmail.com',NULL,'$2y$10$8juAdWuz1zcx/L/SBMUhy.iVDWeDapgOKx3l85PBhCxd/AzBNHXWm',NULL,'2022-11-18 09:38:37','2022-11-18 09:38:37',NULL,'nguyen','thuong','','',NULL),(11,'thongdeptrai123','thong123laptrinhvien@gmail.com',NULL,'$2y$10$k4ZhiOmc1H715ewnA2uWquc3yhi7hUn9jTIeD.CWhO5wiYHdd2th2',NULL,'2022-11-23 10:41:07','2022-11-23 10:41:07',NULL,NULL,NULL,NULL,NULL,NULL),(13,'thong112222','thong111111@gmail.com',NULL,'$2y$10$S6k4cwO94chnRtz9eMTWwu/DzS5YN2jt/W/F4LuQH4jtS6HdPHYT6',NULL,'2022-11-25 08:16:04','2022-11-25 08:16:04',NULL,'nguyen','thong1111',NULL,NULL,NULL),(14,'thong222222','thong2@gmail.com',NULL,'$2y$10$zNb/Pzd8ECTswCwnlOreLeR8/kl.arn0wPikjaAcSWMObWNlEfSaG',NULL,'2022-11-25 09:50:31','2022-11-25 09:50:31',NULL,'nguyen','thong22',NULL,NULL,NULL),(15,'thong3','thong3@gmail.com',NULL,'$2y$10$qQJsZ0GqY.QXspQuStOfWeDx.5qZha1JAQznFqrk9jd2xcQZVyZae',NULL,'2022-11-25 09:51:53','2022-11-25 09:51:53',NULL,'nguyen','thong33',NULL,NULL,NULL),(16,'thong4','thong4@gmail.com',NULL,'$2y$10$5YsZ8MTTWJ8uNA8ujkFjjOj4ibfsWh1C89fOd9ze5nRH2t4YtxSkC',NULL,'2022-11-25 10:05:20','2022-11-25 10:05:20',NULL,'nguyen','thong4',NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-21 14:14:22
